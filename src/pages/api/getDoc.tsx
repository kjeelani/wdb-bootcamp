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
  if (req.method === "GET") {
    const allDocs = await db.collection("docs").find({}).toArray();
    for (const doc of allDocs) {
      if (doc.id === req.body) {
        res.json({ status: 200, data: doc });
        res.end();
        return;
      }
    }
    res.json({ status: 404, data: {} });
  } else {
    res.status(400);
  }
  res.end();
}
