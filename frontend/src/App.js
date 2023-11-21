// Importing modules
import React, { useState, useEffect } from "react";
import "./App.css";
import { Box, Radio, VStack, Text, RadioGroup, Select, HStack, Button, TableContainer, Table } from "@chakra-ui/react";
import { fetchProductosRepositor,fetchProductosSector,fetchRepositorioNames,fetchSectorNames } from "./services/queryService";

function App() {
    // usestate for setting a javascript
    // object for storing and using data
    const [sectores, setSectores] = useState([])
    const [repositores, setRepositores] = useState([])
    const [productos, setProductos] = useState([])
 
    function getSectores() {
        try {
            fetch('/sectores')
                .then( response => response.json() )
                .then( data => {
                    console.log(data)
                setSectores(data)
        })
        } catch(error) {
            console.log(error)
        }
    }

    async function getRepositores() {
        try{
            fetch('/repositores')
                .then( response => response.json() )
                .then( data => {
                setSectores(data)
        })
        }catch(error){
            console.log(error)
        }
    }

    // Using useEffect for single rendering
    useEffect(() => {
        getSectores()
        getRepositores()
    }, []);

    return (
        <Box bg='#23272f' w={'100vw'} h={'100vh'}>

            <RadioGroup defaultValue="1">
                <VStack>
                <Radio value="1">
                    <HStack>
                        <Text color={'#f6f7f9'}>Sector</Text>
                        <Select placeholder="Sector">
                            {
                                sectores.map((sector) => 
                                <option>{sector.desc_sector}</option>)
                            }
                        </Select>
                    </HStack>
                </Radio>
                <Radio value="2">
                    <HStack>
                        <Text color={'#f6f7f9'}>Repositor</Text>
                        <Select placeholder="Repositor">

                        </Select>
                    </HStack>
                </Radio>
                    <Button>Buscar producto</Button>
                </VStack>
            </RadioGroup>

            <TableContainer>
                <Table>
                </Table>
            </TableContainer>

        </Box>

    );
}
 
export default App;