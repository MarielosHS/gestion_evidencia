const express = require("express");
const expedienteRoutes = require("./routes/expediente.routes");

const app = express();
app.use(express.json());

app.use("/expedientes", expedienteRoutes);

module.exports = app;