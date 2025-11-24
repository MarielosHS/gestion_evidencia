const service = require("../services/expediente.service");
const repo = require("../repositories/expediente.repository");

jest.mock("../repositories/expediente.repository");

describe("Expedientes Module", () => {

  test("should call repository when creating a new expediente", async () => {
    repo.create.mockResolvedValue({ id: 1 });

    const result = await service.crear({ tecnico_id: 2 });

    expect(result.id).toBe(1);
    expect(repo.create).toHaveBeenCalledTimes(1);
    expect(repo.create).toHaveBeenCalledWith({ tecnico_id: 2 });
  });

});
