import sequelize from "../config/db.js";
import { DataTypes } from "sequelize";

const Like = sequelize.define(
  "Like",
  {
    target_type: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    target_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    user_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    created_at: {
      type: DataTypes.DATE,
      defaultValue: DataTypes.NOW,
    },
    updated_at: {
      type: DataTypes.DATE,
      defaultValue: DataTypes.NOW,
    },
  },
  {
    tableName: "likes",
    timestamps: false,
  }
);

async function insertLikeRecords() {
  try {
    await sequelize.authenticate();
    console.log("✅ 数据库连接成功");

    const likes = [
      { target_type: "post", target_id: 1, user_id: 1 },
      { target_type: "post", target_id: 2, user_id: 2 },
      { target_type: "post", target_id: 3, user_id: 3 },
    ];

    await Like.bulkCreate(likes);
    console.log("✅ 点赞数据插入成功");
  } catch (err) {
    console.error("❌ 插入失败：", err);
  } finally {
    await sequelize.close();
  }
}

insertLikeRecords();
