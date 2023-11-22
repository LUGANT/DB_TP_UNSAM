// Importing modules
import React, { useState, useEffect } from "react";
import "./App.css";
import { Radio, VStack, Text, RadioGroup, Select, HStack, Button, TableContainer, Table, Thead, Tr, Th, Tbody, Td, useToast, Stack, StackDivider } from "@chakra-ui/react";

async function getSectores() {
    try {
        const responseSectores = await fetch('/sectores')
        const sectores = await responseSectores.json()
        // console.log(sectores.data)
        console.log(sectores)
        return sectores
    }catch(error) {
        console.log(error)
    }
}

async function getRepositores() {
    try{
        const responseRepositores = await fetch('/repositores')
        const repositores = await responseRepositores.json()
        console.log(repositores)
        return repositores
    }catch(error){
        console.log(error)
    }
}

async function getProductos(boolValue, nameValue) {

    const typePath = (boolValue) ? 'sector' : 'repositor'

    try{
        const productos = await fetch(`/productos/${typePath}/${nameValue}`)
        const productosJSON = await productos.json()
        console.log(productosJSON)
        return productosJSON
    }catch(error){
        console.log(error)
    }
}


function App() {
    // usestate for setting a javascript
    // object for storing and using data
    const [productos, setProductos] = useState([])
    const [sectores, setSectores] = useState([])
    const [repositores, setRepositores] = useState([])
    const [selectedOption, setSelectedOption] = useState(true)
    const [selectedRepositor, setSelectedRepositor] = useState("")
    const [selectedSector, setSelectedSector] = useState("")
    const toast = useToast()
    // true - sectores
    // false - repositores

    const fetchData = async () => {
        const repos = await getRepositores();
        const sects = await getSectores();
        
        setRepositores(repos);
        setSectores(sects);
        setSelectedRepositor(repos[0].nombre);
        setSelectedSector(sects[0].desc_sector);
    }

    const buscarProductos = async (boolValue) => {

        
        const nameValue = (boolValue) ? selectedSector : selectedRepositor
        
        const productosBusqueda = await getProductos(boolValue, nameValue)
        
        if (productosBusqueda.length){
            setProductos(productosBusqueda)
        }else{
            toast({
                title: 'No se encontraron productos',
                description: `No se encontraron productos para ${nameValue}`,
                status: 'info',
                duration: 5000,
                isClosable: true,
                position: 'top-left'
            })
            
        }

    }
    
    const handleRadioChange = () => {
        setSelectedOption(!selectedOption)
        console.log(selectedOption)
    }

    useEffect(() => {
        fetchData()
    },[])

    return (

        <Stack bg='#23272f' w={'100vw'} h={'100vh'} divider={ <StackDivider borderColor='white'/> }>
                
        <HStack w={'100%'} justify='center' mt={'0.5rem'}>
            <Text color={'#f6f7f9'} fontSize='4xl'>
                Consulta de Productos
            </Text>
        </HStack>

        <HStack w={'100%'} h={'100%'} align='flex-start'>
            

            <VStack w={'23%'} spacing={'1rem'} mt={'2rem'}>


                <RadioGroup defaultValue="1" onChange={handleRadioChange} >

                    <Stack spacing={'1rem'}>
                        <HStack >
                            <Radio value="1" />
                            <Text color={'#f6f7f9'}>Sector</Text>
                            <Select bg={'#f6f7f9'} onChange={(event) => setSelectedSector(event.target.value)}>
                                {sectores.map((sector, index) => 
                                    <option key={index}>{sector.desc_sector}</option>)
                                }
                            </Select >
                        </HStack>

                        <HStack>
                            <Radio value="2"/>
                            <Text color={'#f6f7f9'}>Repositor</Text>
                            <Select bg={'#f6f7f9'} onChange={(event) => setSelectedRepositor(event.target.value)}>
                                {
                                    repositores.map((repositor, index) => 
                                    <option key={index}>{repositor.nombre}</option>)
                                }
                            </Select>
                        </HStack>
                    </Stack>
                </RadioGroup>

                <Button onClick={() => buscarProductos(selectedOption)}>Buscar producto</Button>

            </VStack>
            
            <Stack w={'75%'} mt={'1rem'}>

            <TableContainer>
                <Table color={"white"}>
                    <Thead>
                        <Tr>
                            <Th>ID Producto</Th>
                            <Th>Nombre Producto</Th>
                            <Th>Nombre Gondola</Th>
                            <Th>Descripcion Presentacion</Th>
                        </Tr>
                    </Thead>
                    <Tbody>
                        {productos.map(producto => 
                        <Tr key={producto.id}>
                            <Td>{producto.id}</Td>
                            <Td>{producto.nombre_producto}</Td>
                            <Td>{producto.nombre_gondola}</Td>
                            <Td>{producto.descripcion_presentacion}</Td>
                        </Tr>
                        )}
                    </Tbody>
                </Table>
            </TableContainer>

            </Stack>

        </HStack>
    </Stack>
    );
}
 
export default App;