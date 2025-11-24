const app = require("./app");
const { sequelize } = require("./models");

(async () => {
  try {
    await sequelize.authenticate();
    console.log("DB connected.");

    app.listen(3000, () => console.log("Server running on 3000"));
  } catch (error) {
    console.error("Unable to connect:", error);
  }
})();
