import { Post, User, sequelize } from "../models/index.js";
import Comment from "../models/comment.js";

export const getPostList = async (req, res) => {
  try {
    //
    const posts = await Post.findAll({
      // 和 users
      include: [
        {
          model: User,
          as: "user",
          attributes: ["account", "avatar"], // 只要作者账号和头像
        },
      ],
      order: [["created_at", "DESC"]], // 按发布时间倒序
    });

    const formatted = posts.map((post) => {
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
        imageUrl: imageBlock?.url || "", // 注意：你的图片是 `url`，不是 `data.file.url`
        likes: post.getDataValue("likes"),
        title: post.title,
      };
    });

    res.json({
      code: 10000,
      message: "ok",
      data: formatted,
    });
  } catch (error) {
    console.error(error);
    res
      .status(500)
      .json({ code: 50000, message: "服务器错误", error: error.message });
  }
};
export const getPostDetail = async (req, res) => {
  try {
    const id = Number(req.params.id);
    if (!id) {
      return res.status(400).json({ code: 40000, message: "无效 id" });
    }

    // 1. 获取帖子 + 作者
    const post = await Post.findOne({
      where: { id },
      include: [
        { model: User, as: "user", attributes: ["id", "account", "avatar"] },
      ],
    });
    if (!post) {
      return res.status(404).json({ code: 40400, message: "帖子不存在" });
    }

    // 2. 解析内容
    const rawContent =
      typeof post.content === "string"
        ? JSON.parse(post.content)
        : post.content;
    const blocks = rawContent?.blocks ?? [];
    const textBlock = blocks.find((b) => b.type === "text");
    const imgs = blocks.filter((b) => b.type === "image").map((b) => b.url);
    const formattedContent = { text: textBlock?.data || "", imgs };
    const postData = {
      id: post.id,
      title: post.title,
      author: {
        id: post.user.id,
        account: post.user.account,
        avatar: post.user.avatar,
      },
      likes: post.likes,
      createdAt: post.created_at,
      updatedAt: post.updated_at,
      content: formattedContent,
    };
    // 3. 查询评论
    // 查帖子下的评论（一级）
    const comments = await Comment.findAll({
      where: { target_id: post.id, target_type: "post" },
      include: [{ model: User, as: "user", attributes: ["account", "avatar"] }],
      order: [["created_at", "ASC"]],
    });

    // 对每条评论，查它的回复（子评论）
    const commentIds = comments.map((c) => c.id);

    const subComments = await Comment.findAll({
      where: {
        target_id: commentIds, // 子评论的 target_id 是父评论的 id
        target_type: "comment",
      },
      include: [{ model: User, as: "user", attributes: ["account", "avatar"] }],
      order: [["created_at", "ASC"]],
    });

    // 把子评论挂载到父评论上
    const subMap = {};
    for (const sub of subComments) {
      const parentId = sub.target_id;
      if (!subMap[parentId]) subMap[parentId] = [];
      subMap[parentId].push({
        id: sub.id,
        text: sub.text,
        author: sub.user?.account || "匿名",
        avatar: sub.user?.avatar || "",
        createdAt: sub.created_at,
        likes: sub.likes,
        userId: sub.user_id,
      });
    }

    const formattedComments = comments.map((c) => ({
      id: c.id,
      text: c.text,
      author: c.user?.account || "匿名",
      avatar: c.user?.avatar || "",
      createdAt: c.created_at,
      replies: subMap[c.id] || [], // ← 加上子评论
      likes: c.likes,
      userId: c.user_id,
    }));

    // 4. 响应数据
    res.json({
      code: 10000,
      message: "ok",
      data: {
        ...postData,
        comments: formattedComments,
      },
    });
  } catch (err) {
    console.error(err);
    res
      .status(500)
      .json({ code: 50000, message: "服务器错误", error: err.message });
  }
};
