import express from "express";
import { toggleLike, getLikesByUser } from "../controllers/like.js";
import { authOptional, authRequired } from "../middlewares/auth.js";

const router = express.Router();

router.post("/like", authRequired, toggleLike);
router.get("/like/:userId", authOptional, getLikesByUser);

export default router;
