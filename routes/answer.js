import express from "express";
import { postAnswer } from "../controllers/answer.js";
import { authMiddleware } from "../middlewares/auth.js";

const router = express.Router();

router.post("/answer", authMiddleware, postAnswer);

export default router;
