/* eslint-disable @typescript-eslint/no-unsafe-member-access */
/* eslint-disable @typescript-eslint/no-unsafe-call */
/* eslint-disable @typescript-eslint/no-unsafe-assignment */
/* eslint-disable @typescript-eslint/no-unused-vars */
import type { NextApiRequest, NextApiResponse } from "next";

import clientPromise from "../mongoDB.js";

interface Doc {
  id: string;
  content: string;
}

export default async function handler(
  req: NextApiRequest,
  res: NextApiResponse
) {
  const client = await clientPromise;
  const db = client.db("Notiom");
  if (req.method === "POST") {
    const myPost = await db.collection("docs").insertOne(req.body);
    res.status(200).send("Doc Created");
  } else {
    res.status(400);
  }
  res.end();
}
