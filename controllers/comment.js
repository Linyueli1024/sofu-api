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

    // 构造 ResponseItem 结构数据
    const responseItem = {
      id: newComment.id,
      text: newComment.text,
      imgs: [], // 后续可支持图片，先置空数组
      createdAt: newComment.created_at.toISOString(), // ISO 格式
      likes: newComment.likes || 0,
      user: {
        account: user?.account || "匿名",
        avatar: user?.avatar || "",
      },
      replies: [], // 新评论暂无子回复
    };

    // 返回
    res.json({
      code: 10000,
      message: "评论成功",
      data: responseItem,
    });
  } catch (err) {
    console.error(err);
    res
      .status(500)
      .json({ code: 50000, message: "服务器错误", error: err.message });
  }
};
