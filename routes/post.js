import express from "express";
import { getPostList, getPostDetail } from "../controllers/post.js";

const router = express.Router();

router.get("/posts", getPostList);
router.get("/posts/:id", getPostDetail);

export default router;
