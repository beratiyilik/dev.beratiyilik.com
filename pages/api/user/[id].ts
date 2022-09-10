import { NextApiHandler, NextApiRequest, NextApiResponse } from "next";
import data from "../../../lib/data.json";

const user: NextApiHandler = (
  req: NextApiRequest,
  res: NextApiResponse<any>
) => {
  const { id } = req.query;
  const userData = data.find((x) => String(x.id) === String(id));

  if (userData) {
    res.status(200).json(userData);
  } else {
    res.status(404).end();
  }
};

export default user;
