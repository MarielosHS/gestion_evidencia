module.exports = {
  // Directorio raíz de tu código fuente
  roots: ["./"],

  // Patrón para encontrar archivos de prueba
  testMatch: [
    "**/tests/**/*.test.js"
  ],

  // Entorno de ejecución (Node.js en tu caso)
  testEnvironment: "node",

  // Opcional: limpiar mocks entre pruebas
  clearMocks: true,

  // Opcional: si usas imports con paths relativos
  moduleDirectories: ["node_modules", "src"],
};
