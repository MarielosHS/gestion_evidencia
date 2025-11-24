const expedienteRepo = require("../repositories/expediente.repository");

exports.crear = async (data) => {
  // validaciones de negocio aquí
  return expedienteRepo.create(data);
};
