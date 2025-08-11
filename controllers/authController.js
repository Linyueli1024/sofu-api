import jwt from "jsonwebtoken";
import { User } from "../models/index.js"; // 你已有的用户模型

const JWT_SECRET = process.env.JWT_SECRET || "JWT_SECRET";
const JWT_REFRESH_SECRET =
  process.env.JWT_REFRESH_SECRET || "JWT_REFRESH_SECRET";

// 生成新 token 函数
const generateToken = (user) => {
  const token = jwt.sign(
    { id: user.id, mobile: user.mobile },
    JWT_SECRET,
    { expiresIn: "15m" } // 访问 token 有效期短
  );
  return token;
};

export const refreshToken = async (req, res) => {
  console.log(req.body);

  const { refreshToken } = req.body;

  if (!refreshToken) {
    return res.status(400).json({ code: 40000, message: "缺少 refreshToken" });
  }

  try {
    console.log(JWT_REFRESH_SECRET);
    const decoded = jwt.verify(refreshToken, JWT_REFRESH_SECRET);
    console.log(decoded);

    const user = await User.findByPk(decoded.id);
    console.log(user);

    if (!user) {
      return res.status(404).json({ code: 40400, message: "用户不存在" });
    }

    const newToken = generateToken(user);

    res.json({
      code: 10000,
      message: "刷新成功",
      data: { token: newToken },
    });
  } catch (e) {
    console.error("verify failed:", e.name, e.message, e.expiredAt);
    return res
      .status(401)
      .json({ code: 40101, message: "refreshToken 无效或已过期" });
  }
};
