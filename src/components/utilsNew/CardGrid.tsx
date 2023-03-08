/* eslint-disable jsx-a11y/alt-text */

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
            setNoteArray(noteArray.filter((n) => n !== nArray[i])); // TODO: This doesn't work for identical notes
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
            setNoteArray([...noteArray, note]);
          }}
        />
        {Looper(noteArray)}
      </SimpleGrid>
    </Box>
  );
}
