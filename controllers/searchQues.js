import axios from "axios";
import { Question, User, Answer, Post } from "../models/index.js";
import { Op } from "sequelize";
export const searchByAI = async (req, res) => {
  const { question } = req.body;

  try {
    // Step 1: 获取相似问答
    const pyRes = await axios.post("http://8.208.33.213:8000/match", {
      question,
      top_k: 3,
    });

    const matches = pyRes.data.matches;

    // 解析 matched_question 为json对象
    const parsedMatches = matches.map((item) => {
      const qaText = item.matched_question;
      const match = qaText.match(/问题：(.*?)\n回答：(.*)/s);
      if (match) {
        const question = match[1].trim();
        let answerRaw = match[2].trim();
        let answerParsed;
        try {
          answerParsed = JSON.parse(answerRaw);
        } catch (e) {
          answerParsed = {
            type: "text",
            blocks: [{ type: "text", data: answerRaw }],
          };
        }

        return {
          ...item,
          matched_question: {
            question,
            answer: answerParsed,
          },
        };
      } else {
        return item;
      }
    });

    // Step 2: 构造 Prompt
    let prompt = `以下是与用户问题相关的问题和回答，请参考它们并回答用户的问题：\n\n`;

    matches.forEach((item, index) => {
      const qaText = item.matched_question.replace(/\n/g, "\n");
      const match = qaText.match(/问题：(.*?)\n回答：(.*)/s); // 匹配第一个“问题-回答”对
      if (match) {
        const q = match[1].trim();
        const a = match[2].trim();
        prompt += `Q${index + 1}：${q}\nA${index + 1}：${a}\n\n`;
      }
    });

    prompt += `用户提问：${question}\n请根据这些问答内容，尽量列出多个可行的建议或方法供用户参考，语言清晰准确，逻辑合理。`;

    // Step 3: 调用 DeepSeek 本地 API
    const aiRes = await axios.post(
      "https://api.deepseek.com/chat/completions",
      {
        model: "deepseek-chat", // 云端模型名
        messages: [{ role: "user", content: prompt }],
        temperature: 0.7,
      },
      {
        headers: {
          Authorization: `Bearer sk-25ba0ab6a59742db85571fde8a1783ad`,
          "Content-Type": "application/json",
        },
      }
    );

    const aiAnswer = aiRes.data.choices[0].message.content;

    // Step 4: 返回结果给前端
    return res.json({
      code: 10000,
      data: {
        reference: parsedMatches,
        ai_answer: JSON.parse(aiAnswer),
      },
    });
  } catch (err) {
    console.error("处理失败:", err.message);
    return res.status(500).json({ code: 1, msg: "生成失败" });
  }
};

// 新增关键词搜索接口
export const searchPostsByKeyword = async (req, res) => {
  try {
    const keyword = req.query.keyword?.trim();
    if (!keyword) {
      return res.status(400).json({
        code: "40000",
        message: "关键词不能为空",
        data: [],
      });
    }

    const include = [
      {
        model: User,
        as: "user",
        attributes: ["account", "avatar"],
      },
    ];

    // ❗ 不加任何 where 条件，查全部帖子
    const posts = await Post.findAll({
      include,
      order: [["created_at", "DESC"]],
    });

    // ✅ 从 content.blocks.text 中匹配关键词
    const filtered = posts.filter((post) => {
      const content =
        typeof post.content === "string"
          ? JSON.parse(post.content)
          : post.content;
      const text = content?.blocks?.find((b) => b.type === "text")?.data || "";
      return text.includes(keyword);
    });

    const formatted = filtered.map((post) => {
      const content =
        typeof post.content === "string"
          ? JSON.parse(post.content)
          : post.content;

      const textBlock = content?.blocks?.find((b) => b.type === "text");
      const imageBlock = content?.blocks?.find((b) => b.type === "image");

      return {
        id: post.id,
        author: post.user.account,
        avatar: post.user.avatar,
        text: textBlock?.data || "",
        imageUrl: imageBlock?.url || "",
        likes: post.getDataValue("likes"),
      };
    });

    res.json({
      code: 10000,
      message: "ok",
      data: formatted,
    });
  } catch (err) {
    console.error(err);
    res.status(500).json({
      code: "50000",
      message: "服务器错误",
      data: [],
    });
  }
};

// 搜索问题列表并返回最佳回答
export const searchQuestionsByKeyword = async (req, res) => {
  try {
    const keyword = req.query.keyword?.trim() || "";
    const cid = req.query.cid ? Number(req.query.cid) : null;
    const pageSize = Number(req.query.pageSize) || 10;
    const page = Number(req.query.page) || 1;

    if (!keyword) {
      return res.status(400).json({
        code: 40000,
        message: "关键词不能为空",
        data: [],
      });
    }

    // Step 1：数据库中只按 title 进行模糊匹配
    const whereClause = {
      title: { [Op.like]: `%${keyword}%` },
    };
    if (cid) {
      whereClause["category_id"] = cid;
    }

    const rawQuestions = await Question.findAll({
      where: cid ? { category_id: cid } : {}, // 可选分类筛选
      include: [
        {
          model: User,
          as: "user",
          attributes: ["id", "account", "avatar"],
        },
      ],
      order: [["created_at", "DESC"]],
      limit: pageSize,
      offset: (page - 1) * pageSize,
    });

    // Step 2：后端手动检查 content.blocks 中的 text 是否包含 keyword
    const questions = rawQuestions.filter((q) => {
      const content =
        typeof q.content === "string" ? JSON.parse(q.content) : q.content;
      const textBlock = content?.blocks?.find((b) => b.type === "text");
      return textBlock?.data?.includes(keyword);
    });

    const questionIds = questions.map((q) => q.id);
    if (questionIds.length === 0) {
      return res.json({ code: 10000, message: "ok", data: [] });
    }

    // Step 3：查找回答
    const answers = await Answer.findAll({
      where: {
        target_type: "question",
        target_id: { [Op.in]: questionIds },
      },
      include: [
        {
          model: User,
          as: "user",
          attributes: ["id", "account", "avatar"],
        },
      ],
    });

    // Step 4：按 target_id 分组
    const answerMap = new Map();
    for (const a of answers) {
      const list = answerMap.get(a.target_id) || [];
      list.push(a);
      answerMap.set(a.target_id, list);
    }

    // Step 5：组装返回结果
    const result = questions.map((q) => {
      const content =
        typeof q.content === "string" ? JSON.parse(q.content) : q.content;

      const allAnswers = answerMap.get(q.id) || [];
      const bestAnswer = allAnswers.sort((a, b) => b.likes - a.likes)[0];

      const bestAnswerFormatted = bestAnswer
        ? (() => {
            const parsed =
              typeof bestAnswer.text === "string"
                ? JSON.parse(bestAnswer.text)
                : bestAnswer.text;
            const textBlock = parsed.blocks?.find((b) => b.type === "text");
            const imgBlocks = parsed.blocks?.filter((b) => b.type === "image");
            return {
              id: bestAnswer.id,
              text: textBlock?.data || "",
              imgs: imgBlocks?.map((b) => b.url) || [],
              createdAt: bestAnswer.created_at,
              likes: bestAnswer.likes,
              user: {
                id: bestAnswer.user.id,
                account: bestAnswer.user.account,
                avatar: bestAnswer.user.avatar,
              },
              replies: [],
            };
          })()
        : null;

      return {
        id: q.id,
        author: {
          id: q.user.id,
          account: q.user.account,
          avatar: q.user.avatar,
        },
        question: {
          title: q.title,
          content,
          bonus: q.bonus,
          sameAsk: q.same_ques,
          answers: allAnswers.length,
        },
        bestAnswer: bestAnswerFormatted,
      };
    });

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
      data: [],
    });
  }
};
