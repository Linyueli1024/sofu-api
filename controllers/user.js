import { User, Post, Answer, Question, SameQuestion } from "../models/index.js";
import jwt from "jsonwebtoken";

// 从 .env 加载密钥和配置
const JWT_SECRET = process.env.JWT_SECRET || "JWT_SECRET";
const JWT_REFRESH_SECRET =
  process.env.JWT_REFRESH_SECRET || "JWT_REFRESH_SECRET";
const JWT_EXPIRES_IN = process.env.JWT_EXPIRES_IN || "1h";
const REFRESH_TOKEN_EXPIRES_IN = process.env.REFRESH_TOKEN_EXPIRES_IN || "7d";

export const loginByPassword = async (req, res) => {
  try {
    const { mobile, password } = req.body;

    if (!mobile || !password) {
      return res
        .status(400)
        .json({ code: 40001, message: "手机号或密码不能为空" });
    }

    const user = await User.findOne({ where: { mobile } });

    if (!user) {
      return res.status(404).json({ code: 40401, message: "用户不存在" });
    }

    if (user.password !== password) {
      return res.status(401).json({ code: 40101, message: "密码错误" });
    }

    // ✅ 使用不同 secret 签发两个 token
    const payload = { id: user.id, mobile: user.mobile };
    const accessToken = jwt.sign(payload, JWT_SECRET, {
      expiresIn: JWT_EXPIRES_IN,
    });

    const refreshToken = jwt.sign(payload, JWT_REFRESH_SECRET, {
      expiresIn: REFRESH_TOKEN_EXPIRES_IN,
    });

    res.json({
      code: 10000,
      message: "登录成功",
      data: {
        id: user.id,
        account: user.account,
        avatar: user.avatar,
        mobile: user.mobile,
        token: accessToken,
        refreshToken,
      },
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
      },
    });
  } catch (err) {
    console.error(err);
    res
      .status(500)
      .json({ code: 50000, message: "服务器错误", error: err.message });
  }
};
