import {Card, Text} from "@chakra-ui/react";

export default function NoteCard() {
    return(
        <Card height="8rem" maxW='8rem' maxH='8rem' justifyContent='center' backgroundColor='rgb(248,248,248)' borderColor="rgb(200, 200, 200)" borderWidth='2px'>
            <Text m="12px" fontSize='md' textColor='rgb(84,84,84)'>
                <strong>Lorem ipsum dolor sit amet, consectetur</strong>
            </Text>
        </Card>
    );
    
}