import express from "express";
import searchSimilarQues from "../controllers/searchQues.js";

const router = express.Router();
// POST /api/sameques
router.post("/search/similar", searchSimilarQues);

export default router;
