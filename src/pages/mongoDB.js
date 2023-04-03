import { MongoClient } from "mongodb";

const uri =
  "mongodb+srv://notiomUser:2f2sXApBsgUAa0u7@notiom.xpsnca0.mongodb.net/?retryWrites=true&w=majority";

const client = new MongoClient(uri);
const clientPromise = client.connect();

export default clientPromise;
