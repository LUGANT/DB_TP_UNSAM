
export function fetchRepositorioNames() {
       fetch('/repositores')
        .then( response => response.json() )
        .then( data => {
            return data
        })
    
}


export function fetchSectorNames() {
    fetch('/sectores')
     .then( response => response.json() )
     .then( data => {
         return data
     })
}

export function fetchProductosSector(sector) {
    fetch(`/productos/sector/${sector}`)
     .then( response => response.json() )
     .then( data => {
         console.log(data)
     })
}

export function fetchProductosRepositor(repositor) {
    fetch(`/productos/repositor/${repositor}`)
     .then( response => response.json() )
     .then( data => {
         console.log(data)
     })
}