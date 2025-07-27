import express from "express";
import { sequelize } from "./models/index.js";
import {
  postRouter,
  likeRouter,
  commentRouter,
  userRouter,
  categoryRouter,
  searchQuesRouter,
  questionRouter,
  answerRouter,
  authRouter,
} from "./routes/index.js";

const app = express();

app.use(express.json());
app.use("/api", postRouter);
app.use("/api", likeRouter);
app.use("/api", commentRouter);
app.use("/api", userRouter);
app.use("/api", categoryRouter);
app.use("/api", searchQuesRouter);
app.use("/api", questionRouter);
app.use("/api", answerRouter);
app.use("/api", authRouter);

app.get("/health", (_, res) => res.send("OK"));

sequelize
  .sync()
  .then(() => {
    app.listen(3000, () => console.log("Server started on port 3000"));
  })
  .catch((err) => {
    console.error("Database connection error:", err);
  });
