import express from "express";
import { postComment } from "../controllers/comment.js";
import { authMiddleware } from "../middlewares/auth.js";

const router = express.Router();

router.post("/comment", authMiddleware, postComment);

export default router;
