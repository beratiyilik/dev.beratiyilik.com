import fetch from 'node-fetch';

jest.setTimeout(10000);

const endpoint = process.env.API_BASE_URL || "https://localhost:3000";

describe("Given a deployment has happened", () => {
  describe("When I make a request to endpoint", () => {
    test("It should return a 200 response code", async () => {
      const response = await fetch(`${endpoint}`, {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
        },
      });
      console.log({ response });
      expect(response.status).toEqual(200);
    });
  });
});
