import { Category } from "../models/index.js";

export const getCategoryList = async (req, res) => {
  try {
    const categories = await Category.findAll({
      order: [["created_at", "DESC"]],
      attributes: ["id", "content"], // 可选字段
    });

    res.json({ code: 10000, data: categories });
  } catch (error) {
    console.error(error);
    res.status(500).json({
      code: 50000,
      message: "服务器错误",
      error: error.message,
    });
  }
};
