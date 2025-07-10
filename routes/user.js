import express from "express";
import { loginByPassword, getUserInfo } from "../controllers/user.js";

const router = express.Router();

router.post("/login/password", loginByPassword);
router.get("/user/:id", getUserInfo);

export default router;
