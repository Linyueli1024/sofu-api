import express from "express";
import { toggleLike, getLikesByUser } from "../controllers/like.js";
import { authMiddleware } from "../middlewares/auth.js";

const router = express.Router();

router.post("/like", authMiddleware, toggleLike);
router.get("/like/:userId", getLikesByUser);

export default router;
