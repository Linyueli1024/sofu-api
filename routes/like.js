import express from "express";
import { toggleLike, getLikesByUser } from "../controllers/like.js";

const router = express.Router();

router.post("/like", toggleLike);
router.get("/like/:userId", getLikesByUser);

export default router;
