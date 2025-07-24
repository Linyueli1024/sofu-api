import express from "express";
import { getCategoryList } from "../controllers/category.js";

const router = express.Router();

router.get("/category/list", getCategoryList);

export default router;
