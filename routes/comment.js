import express from "express";
import { postComment } from "../controllers/comment.js";
import { authRequired } from "../middlewares/auth.js";

const router = express.Router();

router.post("/comment", authRequired, postComment);

export default router;
