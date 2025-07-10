import express from "express";
import { loginByPassword } from "../controllers/user.js";

const router = express.Router();

router.post("/login/password", loginByPassword);

export default router;
