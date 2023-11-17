// Importing modules
import React, { useState, useEffect } from "react";
import "./App.css";
import { Box, Radio, VStack, Text, RadioGroup, Select, HStack, Button, TableContainer, Table } from "@chakra-ui/react";

function App() {
    // usestate for setting a javascript
    // object for storing and using data
    const [data, setdata] = useState({
        name: "",
        age: 0,
        date: "",
        programming: "",
    });
 
    const [productos, setProductos] = useState([])

    // Using useEffect for single rendering
    useEffect(() => {
        // Using fetch to fetch the api from 
        // flask server it will be redirected to proxy
        fetch("/data").then((res) =>
            res.json().then((data) => {
                // Setting a data from api
                setdata({
                    name: data.Name,
                    age: data.Age,
                    date: data.Date,
                    programming: data.programming,
                });
            })
        );
    }, []);
 
    const getProductos = () => {
        console.log("hola")
        fetch('/productos')
        .then( (response) => response.json()
            .then((productos) => { 
                console.log(productos)
                setProductos(productos)
            })
            ).catch(
                console.log("Che flaco esto no anda")
            )
        
    }

    return (
        <Box bg='#23272f' w={'100vw'} h={'100vh'}>

            <RadioGroup defaultValue="1">
                <VStack>
                <Radio value="1">
                    <HStack>
                        <Text color={'#f6f7f9'}>Sucursal</Text>
                        <Select></Select>
                    </HStack>
                </Radio>
                <Radio value="2">
                    <HStack>
                        <Text color={'#f6f7f9'}>Repositor</Text>
                        <Select></Select>
                    </HStack>
                </Radio>
                    <Button onClick={getProductos}>Buscar producto</Button>
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