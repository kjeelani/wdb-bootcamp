import { Box, SimpleGrid } from "@chakra-ui/layout";
import { Image } from "@chakra-ui/react";

import NoteCard from "./NoteCard";

function Looper(timesToRepeat: number) {
  const rows = [];
  for (let i = 0; i < timesToRepeat; i++) {
    // note: we are adding a key prop here to allow react to uniquely identify each
    // element in this array. see: https://reactjs.org/docs/lists-and-keys.html
    rows.push(<NoteCard />);
  }
  return rows;
}

export default function CardGrid() {
  return (
    <Box>
      <SimpleGrid columns={6} spacing={12}>
        <Image boxSize="125px" src="./images/notepad.svg" />
        {Looper(11)}
      </SimpleGrid>
    </Box>
  );
}
