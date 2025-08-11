import { sequelize, Like, Post } from "../models/index.js";

export const toggleLike = async (req, res) => {
  const { target_type, target_id, user_id } = req.body;

  if (!["post", "answer", "question"].includes(target_type)) {
    return res.status(400).json({ code: 40000, message: "非法 target_type" });
  }

  const t = await sequelize.transaction();
  try {
    const [like, created] = await Like.findOrCreate({
      where: { target_type, target_id, user_id },
      transaction: t,
    });

    if (!created) {
      // 取消点赞
      await like.destroy({ transaction: t });
      await Post.increment(
        { likes: -1 },
        { where: { id: target_id }, transaction: t }
      );
    } else {
      // 点赞
      await Post.increment(
        { likes: 1 },
        { where: { id: target_id }, transaction: t }
      );
    }

    // 获取最新点赞数（从 posts 表取更快）
    const post = await Post.findByPk(target_id, {
      attributes: ["likes"],
      transaction: t,
    });
    await t.commit();

    return res.json({
      code: 10000,
      message: created ? "点赞成功" : "取消点赞成功",
      data: { totalLikes: post.likes ?? 0 },
    });
  } catch (err) {
    await t.rollback();
    console.error(err);
    return res
      .status(500)
      .json({ code: 50000, message: "点赞操作失败", error: err.message });
  }
};

export const getLikesByUser = async (req, res) => {
  const { userId } = req.params;

  try {
    const likes = await Like.findAll({ where: { user_id: userId } });
    return res.json({ code: 10000, message: "获取成功", data: likes });
  } catch (err) {
    console.error(err);
    return res
      .status(500)
      .json({ code: 50000, message: "查询失败", error: err.message });
  }
};
