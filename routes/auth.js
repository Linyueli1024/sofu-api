import express from "express";
import { refreshToken } from "../controllers/authController.js";

const router = express.Router();

router.post("/token/refresh", refreshToken);

export default router;
