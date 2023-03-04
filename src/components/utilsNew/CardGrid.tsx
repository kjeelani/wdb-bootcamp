/* eslint-disable jsx-a11y/alt-text */
/* eslint-disable @typescript-eslint/no-unused-vars */
import { Box, SimpleGrid } from "@chakra-ui/layout";
import { Image, useDisclosure } from "@chakra-ui/react";
import { useState } from "react";

import NoteAdderModal from "./NoteAdderModal";
import NoteCard from "./NoteCard";

export default function CardGrid() {
  const [noteArray, setNoteArray] = useState<string[]>([]);
  const { isOpen, onOpen, onClose } = useDisclosure();

  function Looper(nArray: string[]) {
    const rows = [];
    for (let i = 0; i < nArray.length; i++) {
      rows.push(
        <NoteCard
          id={i}
          text={nArray[i]}
          deleteCard={() => {
            noteArray.splice(i, 1);
            document.getElementById(i.toString())!.style.display = "none"; // Is this bad practice?
            console.log(noteArray); // TODO: Figure out why array is not updating
          }}
        />
      );
    }
    return rows;
  }

  return (
    <Box>
      <SimpleGrid columns={6} spacing={12}>
        <Image onClick={onOpen} boxSize="125px" src="./images/notepad.svg" />
        <NoteAdderModal
          isOpen={isOpen}
          onClose={onClose}
          addNote={(note: string) => {
            noteArray.push(note);
          }}
        />
        {Looper(noteArray)}
      </SimpleGrid>
    </Box>
  );
}
