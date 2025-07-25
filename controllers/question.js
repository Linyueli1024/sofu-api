import {
  Question,
  Answer,
  User,
  CategoryRel,
  SameQuestion,
} from "../models/index.js";
import { Op } from "sequelize";
// 提取纯文本和图片
function parseRichText(content) {
  try {
    const parsed = typeof content === "string" ? JSON.parse(content) : content;
    const blocks = parsed.blocks || [];

    const text = blocks
      .filter((b) => b.type === "text")
      .map((b) => b.data)
      .join(" ")
      .trim();

    const imgs = blocks.filter((b) => b.type === "image").map((b) => b.url);

    return { text, imgs };
  } catch (err) {
    return { text: "", imgs: [] };
  }
}

export const getQuestionList = async (req, res) => {
  try {
    const {
      keyword = "",
      cid = null,
      page = 1,
      pageSize = 10,
    } = req.method === "GET" ? req.query : req.body;

    const pageNum = parseInt(page, 10);
    const size = parseInt(pageSize, 10);
    const offset = (pageNum - 1) * size;

    const trimmedKeyword = keyword.trim();

    // ========== 构建查询条件 ==========
    const whereClause = {};

    if (trimmedKeyword) {
      whereClause[Op.or] = [
        { title: { [Op.like]: `%${trimmedKeyword}%` } },
        { content: { [Op.like]: `%${trimmedKeyword}%` } },
      ];
    }

    if (cid) {
      const related = await CategoryRel.findAll({
        where: {
          category_id: cid,
          target_type: "question",
        },
        attributes: ["target_id"],
      });

      const questionIds = related.map((r) => r.target_id);
      if (questionIds.length === 0) {
        return res.json({ code: 10000, message: "ok", data: [], total: 0 });
      }

      whereClause.id = { [Op.in]: questionIds };
    }

    // ========== 查询分页数据 ==========
    const { rows: questions, count: total } = await Question.findAndCountAll({
      where: whereClause,
      include: [
        {
          model: User,
          as: "user",
          attributes: ["id", "account", "avatar"],
        },
      ],
      order: [["created_at", "DESC"]],
      limit: size,
      offset,
    });

    // ========== 获取回答信息 ==========
    const data = await Promise.all(
      questions.map(async (q) => {
        const answers = await Answer.findAll({
          where: { target_type: "question", target_id: q.id },
          include: [
            {
              model: User,
              as: "user",
              attributes: ["id", "account", "avatar"],
            },
          ],
          order: [["likes", "DESC"]],
          limit: 1,
        });

        const bestAnswer = answers[0] || null;

        const directAnswers = await Answer.findAll({
          where: { target_type: "question", target_id: q.id },
          attributes: ["id"],
        });

        const directAnswerIds = directAnswers.map((a) => a.id);

        const answerCount = await Answer.count({
          where: {
            [Op.or]: [
              { target_type: "question", target_id: q.id },
              {
                target_type: "answer",
                target_id: { [Op.in]: directAnswerIds },
              },
            ],
          },
        });

        const parsedContent = parseRichText(q.content);
        const parsedAnswer = bestAnswer ? parseRichText(bestAnswer.text) : null;

        return {
          id: q.id,
          author: {
            id: q.user.id,
            avatar: q.user.avatar,
            account: q.user.account,
          },
          question: {
            bonus: q.bonus,
            sameAsk: q.same_ques,
            answers: answerCount,
            createdAt: q.created_at,
            updatedAt: q.updated_at,
            content: parsedContent,
            title: q.title,
          },
          bestAnswer: bestAnswer
            ? {
                id: bestAnswer.id,
                text: parsedAnswer.text,
                imgs: parsedAnswer.imgs,
                likes: bestAnswer.likes,
                createdAt: bestAnswer.createdAt,
                user: {
                  account: bestAnswer.user.account,
                  avatar: bestAnswer.user.avatar,
                  id: bestAnswer.user.id,
                },
              }
            : null,
        };
      })
    );

    return res.json({
      code: 10000,
      message: "ok",
      data,
      total,
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({
      code: 50000,
      message: "服务器错误",
      error: error.message,
    });
  }
};

export const getQuestionDetail = async (req, res) => {
  try {
    const id = Number(req.params.id);
    if (!id) {
      return res.status(400).json({ code: 40000, message: "无效问题 ID" });
    }

    // 1. 查询问题本身 + 作者信息
    const question = await Question.findOne({
      where: { id },
      include: [
        {
          model: User,
          as: "user",
          attributes: ["id", "account", "avatar"],
        },
      ],
    });

    if (!question) {
      return res.status(404).json({ code: 40400, message: "问题不存在" });
    }

    // 2. 解析富文本内容
    const parsedContent = parseRichText(question.content); // { text, imgs }

    // 3. 查询所有相关回答（一级和子级）
    const allAnswers = await Answer.findAll({
      where: {
        target_type: { [Op.in]: ["question", "answer"] },
        target_id: id,
      },
      include: [
        {
          model: User,
          as: "user",
          attributes: ["id", "account", "avatar"],
        },
      ],
      order: [["created_at", "ASC"]],
    });

    // 4. 查询所有 target_type === 'answer' 的回答（子评论）
    const childAnswers = await Answer.findAll({
      where: { target_type: "answer" },
      include: [
        {
          model: User,
          as: "user",
          attributes: ["id", "account", "avatar"],
        },
      ],
      order: [["created_at", "ASC"]],
    });

    // 5. 构建评论树
    const answerMap = new Map();
    const comments = [];

    const parseItem = (a) => {
      const parsed = parseRichText(a.text);
      return {
        id: a.id,
        text: parsed.text,
        imgs: parsed.imgs,
        createdAt: a.created_at,
        likes: a.likes,
        target_id: a.target_id,
        target_type: a.target_type,
        user: {
          id: a.user.id,
          account: a.user.account,
          avatar: a.user.avatar,
        },
        replies: [],
      };
    };

    // 先构建顶级评论（target_type = question）
    for (const a of allAnswers) {
      if (a.target_type === "question" && a.target_id === id) {
        const item = parseItem(a);
        comments.push(item);
        answerMap.set(a.id, item);
      }
    }

    // 再挂载子评论（target_type = answer）
    for (const a of childAnswers) {
      const parent = answerMap.get(a.target_id);
      if (parent) {
        const child = parseItem(a);
        parent.replies.push(child);
        answerMap.set(a.id, child); // 支持多层嵌套
      }
    }

    // 6. 查询同问人数
    const sameQuesCount = await SameQuestion.count({
      where: { question_id: id },
    });

    // 7. 返回结构
    const result = {
      id: question.id,
      title: question.title,
      author: {
        id: question.user.id,
        account: question.user.account,
        avatar: question.user.avatar,
      },
      likes: question.bonus || 0,
      content: parsedContent,
      comments,
      createdAt: question.created_at,
      updatedAt: question.updated_at,
      sameQues: sameQuesCount,
    };

    res.json({
      code: 10000,
      message: "ok",
      data: result,
    });
  } catch (err) {
    console.error(err);
    res.status(500).json({
      code: 50000,
      message: "服务器错误",
      error: err.message,
    });
  }
};
