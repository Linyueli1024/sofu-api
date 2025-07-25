import axios from "axios";
export const searchByAI = async (req, res) => {
  const { question } = req.body;

  try {
    // Step 1: 获取相似问答
    const pyRes = await axios.post("http://8.208.33.213:8000/match", {
      question,
      top_k: 3,
    });

    const matches = pyRes.data.matches;

    // 解析 matched_question 为json对象
    const parsedMatches = matches.map((item) => {
      const qaText = item.matched_question;
      const match = qaText.match(/问题：(.*?)\n回答：(.*)/s);
      if (match) {
        const question = match[1].trim();
        let answerRaw = match[2].trim();
        let answerParsed;
        try {
          answerParsed = JSON.parse(answerRaw);
        } catch (e) {
          answerParsed = {
            type: "text",
            blocks: [{ type: "text", data: answerRaw }],
          };
        }

        return {
          ...item,
          matched_question: {
            question,
            answer: answerParsed,
          },
        };
      } else {
        return item;
      }
    });

    // Step 2: 构造 Prompt
    let prompt = `以下是与用户问题相关的问题和回答，请参考它们并回答用户的问题：\n\n`;

    matches.forEach((item, index) => {
      const qaText = item.matched_question.replace(/\n/g, "\n");
      const match = qaText.match(/问题：(.*?)\n回答：(.*)/s); // 匹配第一个“问题-回答”对
      if (match) {
        const q = match[1].trim();
        const a = match[2].trim();
        prompt += `Q${index + 1}：${q}\nA${index + 1}：${a}\n\n`;
      }
    });

    prompt += `用户提问：${question}\n请根据这些问答内容，尽量列出多个可行的建议或方法供用户参考，语言清晰准确，逻辑合理。`;

    // Step 3: 调用 DeepSeek 本地 API
    const aiRes = await axios.post(
      "https://api.deepseek.com/chat/completions",
      {
        model: "deepseek-chat", // 云端模型名
        messages: [{ role: "user", content: prompt }],
        temperature: 0.7,
      },
      {
        headers: {
          Authorization: `Bearer sk-25ba0ab6a59742db85571fde8a1783ad`,
          "Content-Type": "application/json",
        },
      }
    );

    const aiAnswer = aiRes.data.choices[0].message.content;

    // Step 4: 返回结果给前端
    return res.json({
      code: 10000,
      data: {
        reference: parsedMatches,
        ai_answer: JSON.parse(aiAnswer),
      },
    });
  } catch (err) {
    console.error("处理失败:", err.message);
    return res.status(500).json({ code: 1, msg: "生成失败" });
  }
};
