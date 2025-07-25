import express from "express";
import {
  searchByAI,
  searchPostsByKeyword,
  searchQuestionsByKeyword,
} from "../controllers/searchQues.js";

const router = express.Router();
// POST /api/sameques
router.post("/search/similar", searchByAI);
router.get("/search/posts", searchPostsByKeyword);
router.get("/questions/search", searchQuestionsByKeyword);

export default router;
