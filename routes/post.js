import express from "express";
import { getPostList, getPostDetail, createPost } from "../controllers/post.js";
import { authMiddleware } from "../middlewares/auth.js";

const router = express.Router();

router.get("/posts", getPostList);
router.get("/posts/:id", getPostDetail);
router.post("/posts/create", authMiddleware, createPost);

export default router;
