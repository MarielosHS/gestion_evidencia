const { Router } = require("express");
const router = Router();
const controller = require("../controllers/expediente.controller");

router.post("/", controller.crearExpediente);

module.exports = router;
