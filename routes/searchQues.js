import express from "express";
import { searchByAI } from "../controllers/searchQues.js";
import { authOptional } from "../middlewares/auth.js";

const router = express.Router();
// POST /api/sameques
router.post("/search/similar", authOptional, searchByAI);

export default router;
