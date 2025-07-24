// models/category_relas.js
export default (sequelize, DataTypes) => {
  const CategoryRel = sequelize.define(
    "CategoryRel",
    {
      id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
      category_id: DataTypes.INTEGER,
      target_type: DataTypes.STRING,
      target_id: DataTypes.INTEGER,
      // ... created_at, updated_at
    },
    {
      tableName: "category_relas",
      timestamps: true,
      createdAt: "created_at",
      updatedAt: "updated_at",
    }
  );
  return CategoryRel;
};
