// models/index.js
import sequelize from "../config/db.js";
import { DataTypes } from "sequelize";
import PostFactory from "./post.js";
import UserFactory from "./user.js";
import LikeFactory from "./like.js";
import CommentFactory from "./comment.js";
import CategoryFactory from "./category.js";
import CategoryRelFactory from "./category_rels.js";
import QuestionFactory from "./question.js";
import AnswerFactory from "./answer.js";
import SameQuesFactory from "./sameQues.js";
// 2. 执行 factory，获得真正的 Model 类
const Post = PostFactory(sequelize, DataTypes);
const User = UserFactory(sequelize, DataTypes);
const Like = LikeFactory(sequelize, DataTypes);
const Comment = CommentFactory(sequelize, DataTypes);
const Category = CategoryFactory(sequelize, DataTypes);
const CategoryRel = CategoryRelFactory(sequelize, DataTypes);
const Question = QuestionFactory(sequelize, DataTypes);
const Answer = AnswerFactory(sequelize, DataTypes);
const SameQuestion = SameQuesFactory(sequelize, DataTypes);

// 3. 定义关联

// --- 帖子 与 用户（作者） ---
User.hasMany(Post, { foreignKey: "user_id", as: "posts" });
Post.belongsTo(User, { foreignKey: "user_id", as: "user" });

// --- 点赞（Like） 与 帖子 ---
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

// --- 评论（Comment） 与 帖子 & 用户 ---
Post.hasMany(Comment, {
  foreignKey: "target_id",
  constraints: false,
  as: "comments",
});
Comment.belongsTo(Post, { foreignKey: "target_id", constraints: false });
Comment.belongsTo(User, { foreignKey: "user_id", as: "user" });

// --- 多对多：帖子 ↔ 分类 ---
Post.belongsToMany(Category, {
  through: CategoryRel,
  foreignKey: "target_id", // CategoryRel.target_id -> Post.id
  otherKey: "category_id", // CategoryRel.category_id -> Category.id
  as: "categories",
  scope: { target_type: "post" },
});

Category.belongsToMany(Post, {
  through: CategoryRel,
  foreignKey: "category_id",
  otherKey: "target_id",
  as: "posts",
  scope: { target_type: "post" },
});
Post.hasMany(CategoryRel, {
  foreignKey: "target_id",
  constraints: false,
  scope: { target_type: "post" },
  as: "categoryRels", // 这个 alias 要和你 include 里写的一致
});

Answer.belongsTo(User, { foreignKey: "user_id", as: "user" });
Question.belongsTo(User, { foreignKey: "user_id", as: "user" }); // 如果要显示提问者

// 4. 导出
export {
  sequelize,
  Post,
  User,
  Like,
  Comment,
  Category,
  CategoryRel,
  Question,
  Answer,
  SameQuestion,
};
