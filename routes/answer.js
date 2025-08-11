import express from "express";
import { postAnswer } from "../controllers/answer.js";
import { authRequired } from "../middlewares/auth.js";

const router = express.Router();

router.post("/answer", authRequired, postAnswer);

export default router;
