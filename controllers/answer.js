// controllers/answerController.js
import { Answer, User } from "../models/index.js";
import { parseRichText } from "../utils/parseRichText.js";

export const postAnswer = async (req, res) => {
  try {
    const { text, target_type, target_id, user_id } = req.body;

    if (!text || !target_type || !target_id || !user_id) {
      return res.status(400).json({ code: 40000, message: "参数不完整" });
    }

    if (!["question", "answer"].includes(target_type)) {
      return res
        .status(400)
        .json({ code: 40001, message: "无效的 target_type" });
    }

    // ✅ 强制转字符串
    let rawText = "";

    try {
      rawText = JSON.stringify(
        typeof text === "string" ? JSON.parse(text) : text
      );
    } catch {
      rawText = JSON.stringify({ type: "richtext", blocks: [] }); // fallback 空结构
    }

    const newAnswer = await Answer.create({
      text: rawText,
      target_type,
      target_id,
      user_id,
    });

    const user = await User.findByPk(user_id, {
      attributes: ["id", "account", "avatar"],
    });

    const parsed = parseRichText(rawText);

    res.json({
      code: 10000,
      message: "回答发布成功",
      data: {
        id: newAnswer.id,
        text: parsed.text,
        imgs: parsed.imgs,
        createdAt: newAnswer.created_at,
        likes: newAnswer.likes,
        target_type,
        target_id,
        user,
        replies: [],
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
