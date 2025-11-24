module.exports = (sequelize, DataTypes) => {
  const Expediente = sequelize.define(
    "Expediente",
    {
      expediente_id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
      },
      fecha_registro: {
        type: DataTypes.DATE,
        // defaultValue: DataTypes.NOW,
      },
      tecnico_id: {
        type: DataTypes.INTEGER,
        allowNull: false,
      },
      estado: {
        type: DataTypes.STRING(20),
        defaultValue: "registrado",
      },
    },
    {
      tableName: "expediente",
      timestamps: false,
    }
  );

  return Expediente;
};
