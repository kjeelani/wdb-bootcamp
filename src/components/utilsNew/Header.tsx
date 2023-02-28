import { Box, Flex, HStack, Heading, Spacer, Center, VStack } from "@chakra-ui/layout";
import {
    Image,
    Button,
    Text
  } from "@chakra-ui/react";

export default function Header() {
    return <Box backgroundColor="#fbfbfa" mb='2rem'>
        <Box textColor='rgb(84, 84, 84)'>
            <Flex mb='4rem'>
                <HStack spacing='24px'>
                    <Image src='/images/N.svg'/>
                    <Heading>Notiom</Heading>
                </HStack>
                <Spacer/>
                <Box mr="6rem">
                    <Button pl="1.5rem" pr="1.5rem" variant="blue">Create</Button>
                </Box>
            </Flex>
            <Box mb="8rem" alignContent='center'>
                <Center>
                    <VStack>
                        <Heading size='2xl' mb='6'>Create. Explore.</Heading>
                        <Text fontWeight='500' fontSize='3xl'>
                            The document editing software you've been waiting for
                        </Text> 
                    </VStack>
                </Center>
            </Box>
        </Box>
    </Box>;
  }
  