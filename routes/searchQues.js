import express from "express";
import { searchByAI } from "../controllers/searchQues.js";

const router = express.Router();
// POST /api/sameques
router.post("/search/similar", searchByAI);

export default router;
