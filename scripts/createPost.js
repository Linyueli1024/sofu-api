import { faker } from "@faker-js/faker"; // 安装：npm i @faker-js/faker
import sequelize from "../config/db.js";
import Post from "../models/post.js";

const mockImageUrls = [
  "https://i.postimg.cc/fbkhjC1z/1.jpg",
  "https://i.postimg.cc/L8CcXf5r/10.jpg",
  "https://i.postimg.cc/mkWf4skk/2.jpg",
  "https://i.postimg.cc/L5kd6bgT/8.jpg",
  "https://i.postimg.cc/jSSVtvxH/3.jpg",
  "https://i.postimg.cc/k5ZPj8dx/4.jpg",
  "https://i.postimg.cc/xjLVRcpz/5.jpg",
  "https://i.postimg.cc/pTFb3T23/6.jpg",
  "https://i.postimg.cc/VL1QHm2H/7.jpg",
  "https://i.postimg.cc/X78MRtbN/9.jpg",
];

const mockPosts = mockImageUrls.map((url) => ({
  title: faker.lorem.sentence(5),
  content: {
    type: "richtext",
    blocks: [
      { type: "text", data: faker.lorem.sentences(2) },
      { type: "image", url },
    ],
  },
  user_id: 1, // ⚠️ 确保 user_id=1 存在
  category_id: 1, // ⚠️ 如果你设置了分类，确认存在该 category
}));

async function insertMockPosts() {
  try {
    await sequelize.authenticate();
    console.log("✅ 数据库连接成功");

    await Post.bulkCreate(mockPosts);
    console.log("✅ 插入成功");
  } catch (err) {
    console.error("❌ 插入失败：", err);
  } finally {
    await sequelize.close();
  }
}

insertMockPosts();
