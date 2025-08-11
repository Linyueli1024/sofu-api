// middlewares/auth.js
import jwt from "jsonwebtoken";

const SECRET_KEY = process.env.JWT_SECRET || "your_jwt_secret";

function getTokenFromReq(req) {
  const h = req.headers?.authorization || "";
  if (h.toLowerCase().startsWith("bearer ")) return h.slice(7).trim();
  // 可选：从 cookie 取（如果你把 token 放 cookie 里）
  return req.cookies?.token || null;
}

// 可选鉴权：读接口用（有 token 就解析，没 token 也放行）
export function authOptional(req, _res, next) {
  try {
    const token = getTokenFromReq(req);
    if (!token) {
      return next();
    }
    const decoded = jwt.verify(token, SECRET_KEY);
    // 只挂需要的字段，避免前端可控数据污染
    req.user = { id: decoded.id, account: decoded.account };
    return next();
  } catch {
    // token 无效/过期，当未登录处理即可
    return next();
  }
}

// 强制鉴权：写接口用（必须登录）
export function authRequired(req, res, next) {
  try {
    const token = getTokenFromReq(req);
    if (!token) {
      return res.status(401).json({ code: 40100, message: "请先登录" });
    }
    const decoded = jwt.verify(token, SECRET_KEY);
    req.user = { id: decoded.id, account: decoded.account };
    return next();
  } catch {
    return res.status(401).json({ code: 40101, message: "无效或过期的 token" });
  }
}
