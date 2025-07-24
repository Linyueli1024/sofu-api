export default (sequelize, DataTypes) => {
  return sequelize.define(
    "User",
    {
      id: { type: DataTypes.INTEGER, autoIncrement: true, primaryKey: true },
      account: { type: DataTypes.STRING, allowNull: false },
      password: { type: DataTypes.STRING, allowNull: false },
      avatar: { type: DataTypes.STRING },
      mobile: { type: DataTypes.STRING },
      created_at: { type: DataTypes.DATE },
      updated_at: { type: DataTypes.DATE },
    },
    {
      tableName: "users",
      timestamps: true,
      underscored: true,
    }
  );
};
