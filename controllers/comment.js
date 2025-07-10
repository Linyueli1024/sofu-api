import { Comment, User } from "../models/index.js";

export const postComment = async (req, res) => {
  try {
    const { text, target_id, target_type, user_id } = req.body;

    // 校验参数
    if (!text || !target_id || !target_type || !user_id) {
      return res.status(400).json({ code: 40000, message: "缺少必要参数" });
    }

    // 创建评论
    const newComment = await Comment.create({
      text,
      target_id,
      target_type,
      user_id,
      created_at: new Date(),
      updated_at: new Date(),
    });

    // 获取用户信息（可选）
    const user = await User.findByPk(user_id, {
      attributes: ["account", "avatar"],
    });

    // 返回结果
    res.json({
      code: 10000,
      message: "评论成功",
      data: {
        id: newComment.id,
        text: newComment.text,
        target_id: newComment.target_id,
        target_type: newComment.target_type,
        createdAt: newComment.created_at,
        likes: newComment.likes,
        author: user?.account || "匿名",
        avatar: user?.avatar || "",
        userId: user_id,
      },
    });
  } catch (err) {
    console.error(err);
    res
      .status(500)
      .json({ code: 50000, message: "服务器错误", error: err.message });
  }
};
