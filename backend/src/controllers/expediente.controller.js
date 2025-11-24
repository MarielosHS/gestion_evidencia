const expedienteService = require("../services/expediente.service");

exports.crearExpediente = async (req, res) => {
  try {
    const expediente = await expedienteService.crear(req.body);
    res.status(201).json(expediente);
  } catch (err) {
        console.error("ERROR SQL:", err.original ? err.original.message : err.message);
    res.status(500).json({ error: err.original?.message || err.message });

  }
};
