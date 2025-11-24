const Sequelize = require("sequelize");
const sequelize = require("../config/database");

const Expediente = require("./expediente.model")(sequelize, Sequelize.DataTypes);

const db = {
  sequelize,
  Sequelize,
  Expediente,
};

module.exports = db;
