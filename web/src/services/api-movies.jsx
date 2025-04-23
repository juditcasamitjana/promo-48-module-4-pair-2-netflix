// login

const getMoviesFromApi = ({ genre, sort }) => {
    console.log(genre);

    const queryParams = new URLSearchParams();
    if (genre) queryParams.append("genre", genre);
    if (sort) queryParams.append("sort", sort);

    // CAMBIA ESTE FETCH PARA QUE APUNTE A UN ENDPOINT DE TU SERVIDOR, PIENSA SI DEBE SER GET O POST, PIENSA QUÉ DATOS DEBES ENVIAR, ETC
    return fetch(`http://localhost:4000/movies?${queryParams.toString()}`)
        .then((response) => response.json())
        .then((data) => {
            console.log(data);
            // CAMBIA EL CONTENIDO DE ESTE THEN PARA GESTIONAR LA RESPUESTA DEL SERVIDOR Y RETORNAR AL COMPONENTE APP LO QUE NECESITA
            return data;
        });
};

const objToExport = {
    getMoviesFromApi: getMoviesFromApi,
};

export default objToExport;
