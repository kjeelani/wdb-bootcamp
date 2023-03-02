import { Stack } from "@chakra-ui/layout";
import Head from "next/head";

import Header from "../components/utilsNew/Header";
import CardGrid from "../components/utilsNew/CardGrid";

export default function Home() {
  return (
    <Stack p="3vh" m="auto" maxW="95vw">
      <Head>
        <title>Spring 2023 Product Bootcamp!</title>
      </Head>
      <Header />
      <CardGrid />
    </Stack>
  );
}
