import { Like } from "../models/index.js";

export const toggleLike = async (req, res) => {
  const { target_type, target_id, user_id } = req.body;

  if (!["post", "answer", "question"].includes(target_type)) {
    return res.status(400).json({ code: 40000, message: "非法 target_type" });
  }

  try {
    const [like, created] = await Like.findOrCreate({
      where: { target_type, target_id, user_id },
    });

    if (!created) {
      await like.destroy();
      return res.json({ code: 10000, message: "取消点赞成功" });
    }

    return res.json({ code: 10000, message: "点赞成功" });
  } catch (err) {
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
