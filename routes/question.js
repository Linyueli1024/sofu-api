import express from "express";
import { getQuestionDetail, getQuestionList } from "../controllers/question.js";

const router = express.Router();

router.get("/question", getQuestionList);
router.get("/question-detail/:id", getQuestionDetail);

export default router;
