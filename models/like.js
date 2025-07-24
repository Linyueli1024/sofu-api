export default (sequelize, DataTypes) => {
  return sequelize.define(
    "Like",
    {
      id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true,
      },
      target_type: {
        type: DataTypes.STRING, // 'post', 'answer', 'question'
        allowNull: false,
      },
      target_id: {
        type: DataTypes.INTEGER,
        allowNull: false,
      },
      user_id: {
        type: DataTypes.INTEGER,
        allowNull: false,
      },
    },
    {
      tableName: "likes",
      timestamps: true,
      createdAt: "created_at",
      updatedAt: "updated_at",
      underscored: true,
      indexes: [
        {
          unique: true,
          fields: ["target_type", "target_id", "user_id"],
        },
      ],
    }
  );
};
