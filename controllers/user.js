import User from "../models/user.js";
import Post from "../models/post.js";
import Comment from "../models/comment.js";
import SameQuestion from "../models/sameQues.js";
import Answer from "../models/answer.js";
import Question from "../models/question.js";

export const loginByPassword = async (req, res) => {
  try {
    const { mobile, password } = req.body;

    // 参数校验
    if (!mobile || !password) {
      return res
        .status(400)
        .json({ code: 40001, message: "手机号或密码不能为空" });
    }

    // 查询用户
    const user = await User.findOne({ where: { mobile } });

    if (!mobile) {
      return res.status(404).json({ code: 40401, message: "用户不存在" });
    }

    // 校验密码
    if (user.password !== password) {
      return res.status(401).json({ code: 40101, message: "密码错误" });
    }

    // 登录成功，返回用户信息（可选生成 token）
    res.json({
      code: 10000,
      message: "登录成功",
      data: {
        id: user.id,
        account: user.account,
        avatar: user.avatar,
        mobile: user.mobile,
      },
    });
  } catch (err) {
    console.error(err);
    res
      .status(500)
      .json({ code: 50000, message: "服务器错误", error: err.message });
  }
};
export const getUserInfo = async (req, res) => {
  try {
    const id = Number(req.params.id);
    if (!id) {
      return res.status(400).json({ code: 40000, message: "无效的用户 ID" });
    }

    const user = await User.findByPk(id, {
      attributes: ["id", "account", "mobile", "avatar"],
    });

    if (!user) {
      return res.status(404).json({ code: 40400, message: "用户不存在" });
    }

    // 统计相关数量
    const [likeCount, questionCount, answerCount, sameQuestionCount] =
      await Promise.all([
        Post.sum("likes", { where: { user_id: id } }),
        SameQuestion.count({ where: { user_id: id } }),
        Answer.count({ where: { user_id: id } }),
        Question.count({ where: { user_id: id } }),
      ]);

    res.json({
      code: 10000,
      message: "ok",
      data: {
        id: user.id,
        account: user.account,
        mobile: user.mobile,
        avatar: user.avatar,
        like: likeCount || 0,
        question: questionCount,
        answer: answerCount,
        sameQuestion: sameQuestionCount,
        refreshToken: "", // 如果需要加 token 信息
      },
    });
  } catch (err) {
    console.error(err);
    res
      .status(500)
      .json({ code: 50000, message: "服务器错误", error: err.message });
  }
};
