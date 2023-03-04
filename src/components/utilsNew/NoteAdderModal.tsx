/* eslint-disable @typescript-eslint/no-unsafe-call */
/* eslint-disable @typescript-eslint/no-unsafe-assignment */
import {} from "@chakra-ui/layout";
import {
  Modal,
  ModalOverlay,
  ModalContent,
  ModalHeader,
  ModalCloseButton,
  ModalBody,
  ModalFooter,
  Button,
  Input,
  FormControl,
} from "@chakra-ui/react";

interface NoteAdderModalProps {
  isOpen: boolean;
  addNote: any;
  onClose: any;
}

export default function NoteAdderModal(props: NoteAdderModalProps) {
  function closeAndSaveInput(note: string) {
    props.addNote(note);
    props.onClose();
  }

  return (
    <Modal isOpen={props.isOpen} onClose={props.onClose}>
      <ModalOverlay />
      <ModalContent>
        <ModalHeader>Add Note</ModalHeader>
        <ModalCloseButton />
        <ModalBody>
          <form
            id="noteAdderForm"
            onSubmit={(event) => {
              event.preventDefault();
              closeAndSaveInput(
                (document.getElementById("noteAdder") as HTMLInputElement)!
                  .value
              );
            }}
          >
            <FormControl>
              <Input id="noteAdder" placeholder="Enter a note..." />
            </FormControl>
          </form>
        </ModalBody>

        <ModalFooter>
          <Button form="noteAdderForm" type="submit" colorScheme="blue" mr={3}>
            Close
          </Button>
        </ModalFooter>
      </ModalContent>
    </Modal>
  );
}
