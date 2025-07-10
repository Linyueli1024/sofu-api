import express from "express";
import postRouter from "./routes/post.js";
import likeRouter from "./routes/like.js";
import commentRouter from "./routes/comment.js";
import userRouter from "./routes/user.js";
import { sequelize } from "./models/index.js";

const app = express();

app.use(express.json());
app.use("/api", postRouter);
app.use("/api", likeRouter);
app.use("/api", commentRouter);
app.use("/api", userRouter);

app.get("/health", (_, res) => res.send("OK"));

sequelize
  .sync()
  .then(() => {
    app.listen(3000, () => console.log("Server started on port 3000"));
  })
  .catch((err) => {
    console.error("Database connection error:", err);
  });
