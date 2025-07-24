import { Post, User, CategoryRel, Comment } from "../models/index.js";
import { Op } from "sequelize";
export const getPostList = async (req, res) => {
  try {
    // 从 query 中读取 categoryId
    const categoryId = req.query.categoryId
      ? Number(req.query.categoryId)
      : null;

    // 构造 include 数组
    const include = [
      {
        model: User,
        as: "user",
        attributes: ["account", "avatar"],
      },
    ];

    // 如果指定了 categoryId，就额外 join category_relas 表
    if (categoryId) {
      include.push({
        model: CategoryRel,
        as: "categoryRels", // 确保和你在 models 里定义的 alias 对上
        attributes: [], // 不返回中间表字段
        where: {
          // 属于这个分类、并且 target_type=post
          category_id: categoryId,
          target_type: "post",
        },
      });
    }

    const posts = await Post.findAll({
      include,
      order: [["created_at", "DESC"]],
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
        imageUrl: imageBlock?.url || "",
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

    const post = await Post.findOne({
      where: { id },
      include: [
        { model: User, as: "user", attributes: ["id", "account", "avatar"] },
      ],
    });

    if (!post) {
      return res.status(404).json({ code: 40400, message: "帖子不存在" });
    }

    const rawContent =
      typeof post.content === "string"
        ? JSON.parse(post.content)
        : post.content;
    const blocks = rawContent?.blocks ?? [];
    const textBlock = blocks.find((b) => b.type === "text");
    const imgs = blocks.filter((b) => b.type === "image").map((b) => b.url);

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
      content: {
        text: textBlock?.data || "",
        imgs,
      },
    };

    // 查询所有评论（主 + 子）
    const commentsRaw = await Comment.findAll({
      where: {
        [Op.or]: [
          { target_id: id, target_type: "post" },
          { target_type: "comment" },
        ],
      },
      include: [
        { model: User, as: "user", attributes: ["id", "account", "avatar"] },
      ],
      order: [["created_at", "ASC"]],
    });

    // 构建主评论列表和主评论 Map
    const topComments = [];
    const topCommentMap = new Map();

    for (const c of commentsRaw) {
      if (c.target_type === "post" && c.target_id === id) {
        const top = {
          id: c.id,
          text: c.text,
          imgs: [],
          createdAt: c.created_at,
          likes: c.likes,
          target_id: c.target_id,
          target_type: c.target_type,
          user: {
            id: c.user_id,
            account: c.user?.account || "匿名",
            avatar: c.user?.avatar || "",
          },
          replies: [],
        };
        topComments.push(top);
        topCommentMap.set(c.id, top);
      }
    }

    // 将子评论添加到对应主评论的 replies 中（只挂一层）
    for (const c of commentsRaw) {
      if (c.target_type === "comment") {
        let parentId = c.target_id;
        let parent = commentsRaw.find((p) => p.id === parentId);

        // 向上找到顶层主评论
        while (parent && parent.target_type === "comment") {
          parentId = parent.target_id;
          parent = commentsRaw.find((p) => p.id === parentId);
        }

        const top = topCommentMap.get(parentId);
        if (top) {
          top.replies.push({
            id: c.id,
            text: c.text,
            imgs: [],
            createdAt: c.created_at,
            likes: c.likes,
            target_id: c.target_id,
            target_type: c.target_type,
            user: {
              id: c.user_id,
              account: c.user?.account || "匿名",
              avatar: c.user?.avatar || "",
            },
          });
        }
      }
    }

    res.json({
      code: 10000,
      message: "ok",
      data: {
        ...postData,
        comments: topComments,
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
