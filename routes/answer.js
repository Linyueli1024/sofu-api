import express from "express";
import { postAnswer } from "../controllers/answer.js";

const router = express.Router();

router.post("/answer", postAnswer);

export default router;
