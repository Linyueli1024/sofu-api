import express from "express";
import { postComment } from "../controllers/comment.js";

const router = express.Router();

router.post("/comment", postComment);

export default router;
