import User from "../models/user.js";

export const loginByPassword = async (req, res) => {
  try {
    const { account, password } = req.body;

    // 参数校验
    if (!account || !password) {
      return res
        .status(400)
        .json({ code: 40001, message: "账号或密码不能为空" });
    }

    // 查询用户
    const user = await User.findOne({ where: { account } });

    if (!user) {
      return res.status(404).json({ code: 40401, message: "用户不存在" });
    }

    // 校验密码
    if (user.password !== password) {
      return res.status(401).json({ code: 40101, message: "密码错误" });
    }

    // 登录成功，返回用户信息（可选生成 token）
    res.json({
      code: 10000,
      message: "登录成功",
      data: {
        id: user.id,
        account: user.account,
        avatar: user.avatar,
      },
    });
  } catch (err) {
    console.error(err);
    res
      .status(500)
      .json({ code: 50000, message: "服务器错误", error: err.message });
  }
};
