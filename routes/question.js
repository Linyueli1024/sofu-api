import express from "express";
import { getQuestionDetail, getQuestionList } from "../controllers/question.js";
import { authOptional } from "../middlewares/auth.js";

const router = express.Router();

router.get("/question", authOptional, getQuestionList);
router.get("/question-detail/:id", authOptional, getQuestionDetail);

export default router;
