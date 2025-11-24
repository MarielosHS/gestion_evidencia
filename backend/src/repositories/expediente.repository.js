const { Expediente } = require("../models");

exports.create = async (data) => {
  return Expediente.create(data);
};

exports.findAll = async () => {
  return Expediente.findAll();
};
