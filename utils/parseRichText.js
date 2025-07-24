export function parseRichText(content) {
  try {
    // content 是纯文本字符串，如 "333"
    if (typeof content === "string" && !content.startsWith("{")) {
      return { text: content, imgs: [] };
    }

    const parsed = typeof content === "string" ? JSON.parse(content) : content;
    const blocks = parsed.blocks || [];

    const text = blocks
      .filter((b) => b.type === "text")
      .map((b) => b.data)
      .join(" ")
      .trim();

    const imgs = blocks.filter((b) => b.type === "image").map((b) => b.url);

    return { text, imgs };
  } catch {
    return { text: "", imgs: [] };
  }
}
