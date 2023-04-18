[33mcommit b1f4bab9416d295adfb99f509770bbbc3cdfa684[m[33m ([m[1;36mHEAD -> [m[1;32mweek5[m[33m, [m[1;31morigin/week5[m[33m, [m[1;31morigin/week3[m[33m, [m[1;32mweek3[m[33m)[m
Author: kjeelani <kaif.ajeelani@gmail.com>
Date:   Mon Apr 3 06:18:35 2023 -0700

    Finished backend basic routes, need to test edge cases

[1mdiff --git a/package.json b/package.json[m
[1mindex d06ef84..f18b817 100644[m
[1m--- a/package.json[m
[1m+++ b/package.json[m
[36m@@ -17,6 +17,7 @@[m
     "@emotion/react": "^11.10.4",[m
     "@emotion/styled": "^11.10.4",[m
     "framer-motion": "^7.3.2",[m
[32m+[m[32m    "mongodb": "^5.1.0",[m
     "next": "^12.2.5",[m
     "nextjs-progressbar": "^0.0.14",[m
     "react": "18.2.0",[m
[1mdiff --git a/src/pages/api/createDoc.tsx b/src/pages/api/createDoc.tsx[m
[1mnew file mode 100644[m
[1mindex 0000000..1223102[m
[1m--- /dev/null[m
[1m+++ b/src/pages/api/createDoc.tsx[m
[36m@@ -0,0 +1,27 @@[m
[32m+[m[32m/* eslint-disable @typescript-eslint/no-unsafe-member-access */[m
[32m+[m[32m/* eslint-disable @typescript-eslint/no-unsafe-call */[m
[32m+[m[32m/* eslint-disable @typescript-eslint/no-unsafe-assignment */[m
[32m+[m[32m/* eslint-disable @typescript-eslint/no-unused-vars */[m
[32m+[m[32mimport type { NextApiRequest, NextApiResponse } from "next";[m
[32m+[m
[32m+[m[32mimport clientPromise from "../mongoDB.js";[m
[32m+[m
[32m+[m[32minterface Doc {[m
[32m+[m[32m  id: string;[m
[32m+[m[32m  content: string;[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32mexport default async function handler([m
[32m+[m[32m  req: NextApiRequest,[m
[32m+[m[32m  res: NextApiResponse[m
[32m+[m[32m) {[m
[32m+[m[32m  const client = await clientPromise;[m
[32m+[m[32m  const db = client.db("Notiom");[m
[32m+[m[32m  if (req.method === "POST") {[m
[32m+[m[32m    const myPost = await db.collection("docs").insertOne(req.body);[m
[32m+[m[32m    res.status(200).send("Doc Created");[m
[32m+[m[32m  } else {[m
[32m+[m[32m    res.status(400);[m
[32m+[m[32m  }[m
[32m+[m[32m  res.end();[m
[32m+[m[32m}[m
[1mdiff --git a/src/pages/api/deleteDoc.tsx b/src/pages/api/deleteDoc.tsx[m
[1mnew file mode 100644[m
[1mindex 0000000..d4a121b[m
[1m--- /dev/null[m
[1m+++ b/src/pages/api/deleteDoc.tsx[m
[36m@@ -0,0 +1,27 @@[m
[32m+[m[32m/* eslint-disable @typescript-eslint/no-unsafe-member-access */[m
[32m+[m[32m/* eslint-disable @typescript-eslint/no-unsafe-call */[m
[32m+[m[32m/* eslint-disable @typescript-eslint/no-unsafe-assignment */[m
[32m+[m[32m/* eslint-disable @typescript-eslint/no-unused-vars */[m
[32m+[m[32mimport type { NextApiRequest, NextApiResponse } from "next";[m
[32m+[m
[32m+[m[32mimport clientPromise from "../mongoDB.js";[m
[32m+[m
[32m+[m[32minterface Doc {[m
[32m+[m[32m  id: string;[m
[32m+[m[32m  content: string;[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32mexport default async function handler([m
[32m+[m[32m  req: NextApiRequest,[m
[32m+[m[32m  res: NextApiResponse[m
[32m+[m[32m) {[m
[32m+[m[32m  const client = await clientPromise;[m
[32m+[m[32m  const db = client.db("Notiom");[m
[32m+[m[32m  if (req.method === "DELETE") {[m
[32m+[m[32m    const myPost = await db.collection("docs").deleteOne(req.body);[m
[32m+[m[32m    res.status(200).send("Doc Deleted");[m
[32m+[m[32m  } else {[m
[32m+[m[32m    res.status(400);[m
[32m+[m[32m  }[m
[32m+[m[32m  res.end();[m
[32m+[m[32m}[m
[1mdiff --git a/src/pages/api/getDoc.tsx b/src/pages/api/getDoc.tsx[m
[1mnew file mode 100644[m
[1mindex 0000000..16da35e[m
[1m--- /dev/null[m
[1m+++ b/src/pages/api/getDoc.tsx[m
[36m@@ -0,0 +1,34 @@[m
[32m+[m[32m/* eslint-disable @typescript-eslint/no-unsafe-member-access */[m
[32m+[m[32m/* eslint-disable @typescript-eslint/no-unsafe-call */[m
[32m+[m[32m/* eslint-disable @typescript-eslint/no-unsafe-assignment */[m
[32m+[m[32m/* eslint-disable @typescript-eslint/no-unused-vars */[m
[32m+[m[32mimport type { NextApiRequest, NextApiResponse } from "next";[m
[32m+[m
[32m+[m[32mimport clientPromise from "../mongoDB.js";[m
[32m+[m
[32m+[m[32minterface Doc {[m
[32m+[m[32m  id: string;[m
[32m+[m[32m  content: string;[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32mexport default async function handler([m
[32m+[m[32m  req: NextApiRequest,[m
[32m+[m[32m  res: NextApiResponse[m
[32m+[m[32m) {[m
[32m+[m[32m  const client = await clientPromise;[m
[32m+[m[32m  const db = client.db("Notiom");[m
[32m+[m[32m  if (req.method === "GET") {[m
[32m+[m[32m    const allDocs = await db.collection("docs").find({}).toArray();[m
[32m+[m[32m    for (const doc of allDocs) {[m
[32m+[m[32m      if (doc.id === req.body) {[m
[32m+[m[32m        res.json({ status: 200, data: doc });[m
[32m+[m[32m        res.end();[m
[32m+[m[32m        return;[m
[32m+[m[32m      }[m
[32m+[m[32m    }[m
[32m+[m[32m    res.json({ status: 404, data: {} });[m
[32m+[m[32m  } else {[m
[32m+[m[32m    res.status(400);[m
[32m+[m[32m  }[m
[32m+[m[32m  res.end();[m
[32m+[m[32m}[m
[1mdiff --git a/src/pages/api/updateDoc.tsx b/src/pages/api/updateDoc.tsx[m
[1mnew file mode 100644[m
[1mindex 0000000..1223102[m
[1m--- /dev/null[m
[1m+++ b/src/pages/api/updateDoc.tsx[m
[36m@@ -0,0 +1,27 @@[m
[32m+[m[32m/* eslint-disable @typescript-eslint/no-unsafe-member-access */[m
[32m+[m[32m/* eslint-disable @typescript-eslint/no-unsafe-call */[m
[32m+[m[32m/* eslint-disable @typescript-eslint/no-unsafe-assignment */[m
[32m+[m[32m/* eslint-disable @typescript-eslint/no-unused-vars */[m
[32m+[m[32mimport type { NextApiRequest, NextApiResponse } from "next";[m
[32m+[m
[32m+[m[32mimport clientPromise from "../mongoDB.js";[m
[32m+[m
[32m+[m[32minterface Doc {[m
[32m+[m[32m  id: string;[m
[32m+[m[32m  content: string;[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32mexport default async function handler([m
[32m+[m[32m  req: NextApiRequest,[m
[32m+[m[32m  res: NextApiResponse[m
[32m+[m[32m) {[m
[32m+[m[32m  const client = await clientPromise;[m
[32m+[m[32m  const db = client.db("Notiom");[m
[32m+[m[32m  if (req.method === "POST") {[m
[32m+[m[32m    const myPost = await db.collection("docs").insertOne(req.body);[m
[32m+[m[32m    res.status(200).send("Doc Created");[m
[32m+[m[32m  } else {[m
[32m+[m[32m    res.status(400);[m
[32m+[m[32m  }[m
[32m+[m[32m  res.end();[m
[32m+[m[32m}[m
[1mdiff --git a/src/pages/mongoDB.js b/src/pages/mongoDB.js[m
[1mnew file mode 100644[m
[1mindex 0000000..c16754e[m
[1m--- /dev/null[m
[1m+++ b/src/pages/mongoDB.js[m
[36m@@ -0,0 +1,9 @@[m
[32m+[m[32mimport { MongoClient } from "mongodb";[m
[32m+[m
[32m+[m[32mconst uri =[m
[32m+[m[32m  "mongodb+srv://notiomUser:2f2sXApBsgUAa0u7@notiom.xpsnca0.mongodb.net/?retryWrites=true&w=majority";[m
[32m+[m
[32m+[m[32mconst client = new MongoClient(uri);[m
[32m+[m[32mconst clientPromise = client.connect();[m
[32m+[m
[32m+[m[32mexport default clientPromise;[m
[1mdiff --git a/tsconfig.json b/tsconfig.json[m
[1mindex 83be827..fe19cd0 100644[m
[1m--- a/tsconfig.json[m
[1m+++ b/tsconfig.json[m
[36m@@ -17,6 +17,6 @@[m
     "noUnusedParameters": false,[m
     "allowJs": true[m
   },[m
[31m-  "include": ["next-env.d.ts", "**/*.ts", "**/*.tsx"],[m
[32m+[m[32m  "include": ["next-env.d.ts", "**/*.ts", "**/*.tsx", "src/pages/mongoDB.js"],[m
   "exclude": ["node_modules"][m
 }[m
[1mdiff --git a/yarn.lock b/yarn.lock[m
[1mindex 84a1310..5338abb 100644[m
[1m--- a/yarn.lock[m
[1m+++ b/yarn.lock[m
[36m@@ -1982,6 +1982,13 @@[m [m__metadata:[m
   languageName: node[m
   linkType: hard[m
 [m
[32m+[m[32m"@types/node@npm:*":[m
[32m+[m[32m  version: 18.15.3[m
[32m+[m[32m  resolution: "@types/node@npm:18.15.3"[m
[32m+[m[32m  checksum: 31b1d92475a82c30de29aa6c0771b18a276552d191283b4423ba2d61b3f01159bf0d02576c0b7cc834b043997893800db6bb47f246083ed85aa45e79c80875d7[m
[32m+[m[32m  languageName: node[m
[32m+[m[32m  linkType: hard[m
[32m+[m
 "@types/node@npm:18.7.16":[m
   version: 18.7.16[m
   resolution: "@types/node@npm:18.7.16"[m
[36m@@ -2021,6 +2028,23 @@[m [m__metadata:[m
   languageName: node[m
   linkType: hard[m
 [m
[32m+[m[32m"@types/webidl-conversions@npm:*":[m
[32m+[m[32m  version: 7.0.0[m
[32m+[m[32m  resolution: "@types/webidl-conversions@npm:7.0.0"[m
[32m+[m[32m  checksum: 60142c7ddd9eb6f907d232d6b3a81ecf990f73b5a62a004eba8bd0f54809a42ece68ce512e7e3e1d98af8b6393d66cddb96f3622d2fb223c4e9c8937c61bfed7[m
[32m+[m[32m  languageName: node[m
[32m+[m[32m  linkType: hard[m
[32m+[m
[32m+[m[32m"@types/whatwg-url@npm:^8.2.1":[m
[32m+[m[32m  version: 8.2.2[m
[32m+[m[32m  resolution: "@types/whatwg-url@npm:8.2.2"[m
[32m+[m[32m  dependencies:[m
[32m+[m[32m    "@types/node": "*"[m
[32m+[m[32m    "@types/webidl-conversions": "*"[m
[32m+[m[32m  checksum: 5dc5afe078dfa1a8a266745586fa3db9baa8ce7cc904789211d1dca1d34d7f3dd17d0b7423c36bc9beab9d98aa99338f1fc60798c0af6cbb8356f20e20d9f243[m
[32m+[m[32m  languageName: node[m
[32m+[m[32m  linkType: hard[m
[32m+[m
 "@types/yargs-parser@npm:*":[m
   version: 21.0.0[m
   resolution: "@types/yargs-parser@npm:21.0.0"[m
[36m@@ -2542,6 +2566,13 @@[m [m__metadata:[m
   languageName: node[m
   linkType: hard[m
 [m
[32m+[m[32m"bson@npm:^5.0.1":[m
[32m+[m[32m  version: 5.1.0[m
[32m+[m[32m  resolution: "bson@npm:5.1.0"[m
[32m+[m[32m  checksum: 5e1c6235b7bc5c788116f077a076bb2fa227e8dc5ad472277c5931c0b82b747edb08c5eb4f511823c895d35c707917f6a16b8f3207104b8559dc83524706cc4a[m
[32m+[m[32m  languageName: node[m
[32m+[m[32m  linkType: hard[m
[32m+[m
 "cacache@npm:^16.1.0":[m
   version: 16.1.3[m
   resolution: "cacache@npm:16.1.3"[m
[36m@@ -4495,6 +4526,13 @@[m [m__metadata:[m
   languageName: node[m
   linkType: hard[m
 [m
[32m+[m[32m"memory-pager@npm:^1.0.2":[m
[32m+[m[32m  version: 1.5.0[m
[32m+[m[32m  resolution: "memory-pager@npm:1.5.0"[m
[32m+[m[32m  checksum: d1a2e684583ef55c61cd3a49101da645b11ad57014dfc565e0b43baa9004b743f7e4ab81493d8fff2ab24e9950987cc3209c94bcc4fc8d7e30a475489a1f15e9[m
[32m+[m[32m  languageName: node[m
[32m+[m[32m  linkType: hard[m
[32m+[m
 "merge2@npm:^1.3.0, merge2@npm:^1.4.1":[m
   version: 1.4.1[m
   resolution: "merge2@npm:1.4.1"[m
[36m@@ -4616,6 +4654,42 @@[m [m__metadata:[m
   languageName: node[m
   linkType: hard[m
 [m
[32m+[m[32m"mongodb-connection-string-url@npm:^2.6.0":[m
[32m+[m[32m  version: 2.6.0[m
[32m+[m[32m  resolution: "mongodb-connection-string-url@npm:2.6.0"[m
[32m+[m[32m  dependencies:[m
[32m+[m[32m    "@types/whatwg-url": ^8.2.1[m
[32m+[m[32m    whatwg-url: ^11.0.0[m
[32m+[m[32m  checksum: 1d662f0ecfe96f7a400f625c244b2e52914c98f3562ee7d19941127578b5f8237624433bdcea285a654041b945b518803512989690c74548aec5860c5541c605[m
[32m+[m[32m  languageName: node[m
[32m+[m[32m  linkType: hard[m
[32m+[m
[32m+[m[32m"mongodb@npm:^5.1.0":[m
[32m+[m[32m  version: 5.1.0[m
[32m+[m[32m  resolution: "mongodb@npm:5.1.0"[m
[32m+[m[32m  dependencies:[m
[32m+[m[32m    bson: ^5.0.1[m
[32m+[m[32m    mongodb-connection-string-url: ^2.6.0[m
[32m+[m[32m    saslprep: ^1.0.3[m
[32m+[m[32m    socks: ^2.7.1[m
[32m+[m[32m  peerDependencies:[m
[32m+[m[32m    "@aws-sdk/credential-providers": ^3.201.0[m
[32m+[m[32m    mongodb-client-encryption: ^2.3.0[m
[32m+[m[32m    snappy: ^7.2.2[m
[32m+[m[32m  dependenciesMeta:[m
[32m+[m[32m    saslprep:[m
[32m+[m[32m      optional: true[m
[32m+[m[32m  peerDependenciesMeta:[m
[32m+[m[32m    "@aws-sdk/credential-providers":[m
[32m+[m[32m      optional: true[m
[32m+[m[32m    mongodb-client-encryption:[m
[32m+[m[32m      optional: true[m
[32m+[m[32m    snappy:[m
[32m+[m[32m      optional: true[m
[32m+[m[32m  checksum: 993c14299ade84d4aadb06f16dccf31502b1018bf7a813d2477bf7a465854d3545a8950372e4410cd549c4426cf02b5d18cc4467eba35d031b46536e5cc79e3f[m
[32m+[m[32m  languageName: node[m
[32m+[m[32m  linkType: hard[m
[32m+[m
 "ms@npm:2.0.0":[m
   version: 2.0.0[m
   resolution: "ms@npm:2.0.0"[m
[36m@@ -5122,6 +5196,13 @@[m [m__metadata:[m
   languageName: node[m
   linkType: hard[m
 [m
[32m+[m[32m"punycode@npm:^2.1.1":[m
[32m+[m[32m  version: 2.3.0[m
[32m+[m[32m  resolution: "punycode@npm:2.3.0"[m
[32m+[m[32m  checksum: 39f760e09a2a3bbfe8f5287cf733ecdad69d6af2fe6f97ca95f24b8921858b91e9ea3c9eeec6e08cede96181b3bb33f95c6ffd8c77e63986508aa2e8159fa200[m
[32m+[m[32m  languageName: node[m
[32m+[m[32m  linkType: hard[m
[32m+[m
 "query-ast@npm:^1.0.3":[m
   version: 1.0.4[m
   resolution: "query-ast@npm:1.0.4"[m
[36m@@ -5447,6 +5528,15 @@[m [m__metadata:[m
   languageName: node[m
   linkType: hard[m
 [m
[32m+[m[32m"saslprep@npm:^1.0.3":[m
[32m+[m[32m  version: 1.0.3[m
[32m+[m[32m  resolution: "saslprep@npm:1.0.3"[m
[32m+[m[32m  dependencies:[m
[32m+[m[32m    sparse-bitfield: ^3.0.3[m
[32m+[m[32m  checksum: 4fdc0b70fb5e523f977de405e12cca111f1f10dd68a0cfae0ca52c1a7919a94d1556598ba2d35f447655c3b32879846c77f9274c90806f6673248ae3cea6ee43[m
[32m+[m[32m  languageName: node[m
[32m+[m[32m  linkType: hard[m
[32m+[m
 "sass@npm:^1.29.0":[m
   version: 1.54.9[m
   resolution: "sass@npm:1.54.9"[m
[36m@@ -5588,6 +5678,16 @@[m [m__metadata:[m
   languageName: node[m
   linkType: hard[m
 [m
[32m+[m[32m"socks@npm:^2.7.1":[m
[32m+[m[32m  version: 2.7.1[m
[32m+[m[32m  resolution: "socks@npm:2.7.1"[m
[32m+[m[32m  dependencies:[m
[32m+[m[32m    ip: ^2.0.0[m
[32m+[m[32m    smart-buffer: ^4.2.0[m
[32m+[m[32m  checksum: 259d9e3e8e1c9809a7f5c32238c3d4d2a36b39b83851d0f573bfde5f21c4b1288417ce1af06af1452569cd1eb0841169afd4998f0e04ba04656f6b7f0e46d748[m
[32m+[m[32m  languageName: node[m
[32m+[m[32m  linkType: hard[m
[32m+[m
 "source-map-js@npm:>=0.6.2 <2.0.0, source-map-js@npm:^1.0.2":[m
   version: 1.0.2[m
   resolution: "source-map-js@npm:1.0.2"[m
[36m@@ -5616,6 +5716,15 @@[m [m__metadata:[m
   languageName: node[m
   linkType: hard[m
 [m
[32m+[m[32m"sparse-bitfield@npm:^3.0.3":[m
[32m+[m[32m  version: 3.0.3[m
[32m+[m[32m  resolution: "sparse-bitfield@npm:3.0.3"[m
[32m+[m[32m  dependencies:[m
[32m+[m[32m    memory-pager: ^1.0.2[m
[32m+[m[32m  checksum: 174da88dbbcc783d5dbd26921931cc83830280b8055fb05333786ebe6fc015b9601b24972b3d55920dd2d9f5fb120576fbfa2469b08e5222c9cadf3f05210aab[m
[32m+[m[32m  languageName: node[m
[32m+[m[32m  linkType: hard[m
[32m+[m
 "sprintf-js@npm:~1.0.2":[m
   version: 1.0.3[m
   resolution: "sprintf-js@npm:1.0.3"[m
[36m@@ -5847,6 +5956,15 @@[m [m__metadata:[m
   languageName: node[m
   linkType: hard[m
 [m
[32m+[m[32m"tr46@npm:^3.0.0":[m
[32m+[m[32m  version: 3.0.0[m
[32m+[m[32m  resolution: "tr46@npm:3.0.0"[m
[32m+[m[32m  dependencies:[m
[32m+[m[32m    punycode: ^2.1.1[m
[32m+[m[32m  checksum: 44c3cc6767fb800490e6e9fd64fd49041aa4e49e1f6a012b34a75de739cc9ed3a6405296072c1df8b6389ae139c5e7c6496f659cfe13a04a4bff3a1422981270[m
[32m+[m[32m  languageName: node[m
[32m+[m[32m  linkType: hard[m
[32m+[m
 "tsconfig-paths@npm:^3.14.1":[m
   version: 3.14.1[m
   resolution: "tsconfig-paths@npm:3.14.1"[m
[36m@@ -6047,6 +6165,7 @@[m [m__metadata:[m
     eslint-plugin-promise: ^6.0.1[m
     framer-motion: ^7.3.2[m
     husky: ^8.0.1[m
[32m+[m[32m    mongodb: ^5.1.0[m
     next: ^12.2.5[m
     nextjs-progressbar: ^0.0.14[m
     prettier: ^2.7.1[m
[36m@@ -6057,6 +6176,23 @@[m [m__metadata:[m
   languageName: unknown[m
   linkType: soft[m
 [m
[32m+[m[32m"webidl-conversions@npm:^7.0.0":[m
[32m+[m[32m  version: 7.0.0[m
[32m+[m[32m  resolution: "webidl-conversions@npm:7.0.0"[m
[32m+[m[32m  checksum: f05588567a2a76428515333eff87200fae6c83c3948a7482ebb109562971e77ef6dc49749afa58abb993391227c5697b3ecca52018793e0cb4620a48f10bd21b[m
[32m+[m[32m  languageName: node[m
[32m+[m[32m  linkType: hard[m
[32m+[m
[32m+[m[32m"whatwg-url@npm:^11.0.0":[m
[32m+[m[32m  version: 11.0.0[m
[32m+[m[32m  resolution: "whatwg-url@npm:11.0.0"[m
[32m+[m[32m  dependencies:[m
[32m+[m[32m    tr46: ^3.0.0[m
[32m+[m[32m    webidl-conversions: ^7.0.0[m
[32m+[m[32m  checksum: ed4826aaa57e66bb3488a4b25c9cd476c46ba96052747388b5801f137dd740b73fde91ad207d96baf9f17fbcc80fc1a477ad65181b5eb5fa718d27c69501d7af[m
[32m+[m[32m  languageName: node[m
[32m+[m[32m  linkType: hard[m
[32m+[m
 "which-boxed-primitive@npm:^1.0.2":[m
   version: 1.0.2[m
   resolution: "which-boxed-primitive@npm:1.0.2"[m
