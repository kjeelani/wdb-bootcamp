/* eslint-disable @typescript-eslint/no-unsafe-assignment */
import { Card, Text } from "@chakra-ui/react";

interface NoteCardProps {
  id: number;
  text: string;
  deleteCard: any;
}

export default function NoteCard(props: NoteCardProps) {
  return (
    <Card
      id={props.id.toString()}
      height="8rem"
      maxW="8rem"
      maxH="8rem"
      justifyContent="center"
      backgroundColor="rgb(248,248,248)"
      borderColor="rgb(200, 200, 200)"
      borderWidth="2px"
    >
      <Text
        align="right"
        mr="3px"
        mt="10px"
        fontSize="sm"
        textColor="rgb(84,84,84)"
      >
        <button onClick={props.deleteCard}>X</button>
      </Text>
      <Text m="10px" fontSize="md" textColor="rgb(84,84,84)">
        <strong>{props.text}</strong>
      </Text>
    </Card>
  );
}
