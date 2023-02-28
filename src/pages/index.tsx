import { Box, Stack, Heading } from "@chakra-ui/layout";
import { Button } from "@chakra-ui/react";
import Head from "next/head";
import { ReactNode, useState } from "react";

import ButtonLink from "../components/utils/ButtonLink";
import NextLink from "../components/utils/NextLink";
import Header from "../components/utilsNew/Header";
import CardGrid from "../components/utilsNew/CardGrid";


export default function Home() {
  const [child, setChild] = useState<object | null>(null);
  return (
    // <>
    //   <Head>
    //     <title>Spring 2023 Product Bootcamp!</title>
    //   </Head>
    //   <Stack p={4}>
    //     <Heading>WDB Next.js Template</Heading>
    //     <Box>
    //       <Button variant="blue" onClick={() => setChild({})}>
    //         {(child as ReactNode) ?? "Test error handling"}
    //       </Button>
    //     </Box>
    //     <Box>
    //       <ButtonLink href="/test" variant="blue">
    //         Test Navigation
    //       </ButtonLink>
    //     </Box>
    //     <Box>
    //       <NextLink href="/random-route" color="TODO.blue">
    //         Test 404 Page
    //       </NextLink>
    //     </Box>
    //   </Stack>
    // </>
    
    <Stack p="3vh" m="auto" maxW="95vw">
      <Head>
          <title>Spring 2023 Product Bootcamp!</title>
      </Head>
      <Header></Header>
      <CardGrid></CardGrid>
    </Stack>
  );
}
