import express from "express";
import { getPostList, getPostDetail, createPost } from "../controllers/post.js";
import { authRequired, authOptional } from "../middlewares/auth.js";

const router = express.Router();

router.get("/posts", authOptional, getPostList);
router.get("/posts/:id", authOptional, getPostDetail);
router.post("/posts/create", authRequired, createPost);

export default router;
