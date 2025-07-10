import sequelize from "../config/db.js";
import Post from "./post.js";
import User from "./user.js";
import Like from "./like.js";
import Comment from "./comment.js";

// Post ↔ User
Post.belongsTo(User, { foreignKey: "user_id", as: "user" });
User.hasMany(Post, { foreignKey: "user_id", as: "posts" });

// Like associations
// Like.belongsTo(User, { foreignKey: "user_id", as: "user" });
// User.hasMany(Like, { foreignKey: "user_id", as: "likes" });

Like.belongsTo(Post, {
  foreignKey: "target_id",
  constraints: false,
  as: "post",
});
Post.hasMany(Like, {
  foreignKey: "target_id",
  constraints: false,
  scope: { target_type: "post" },
  as: "like",
});

Post.hasMany(Comment, { foreignKey: "target_id", constraints: false });
Comment.belongsTo(Post, { foreignKey: "target_id", constraints: false });
Comment.belongsTo(User, { foreignKey: "user_id", as: "user" });

export { sequelize, Post, User, Like, Comment };
