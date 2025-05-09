const express = require("express");
const cors = require("cors");
const mysql = require("mysql2/promise");

const bcrypt = require("bcrypt");
const hashedPassword = await bcrypt.hash(password, 10);

async function getConnection() {
    const connection = await mysql.createConnection({
        host: "localhost",
        database: "netflix",
        user: "root",
        password: "@dalab", // he cambiado a mi contraseña para que me funcionara bien "@dalab"
    });
    await connection.connect();

    console.log(
        `Conexión establecida con la base de datos (identificador=${connection.threadId})`
    );

    return connection;
}

// create and config server
const server = express();
server.use(cors());
server.use(express.json());

const fakeMovies = [
    {
        id: 1,
        title: "Wonder Woman",
        genre: "Action",
        image: "https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/media/image/2022/12/gal-gadot-como-wonder-woman-universo-extendido-dc-2895594.jpg?tf=3840x",
        category: "Superhero",
        year: 2017,
        director: "Patty Jenkins",
    },
    {
        id: 2,
        title: "Inception",
        genre: "Science Fiction",
        image: "https://m.media-amazon.com/images/S/pv-target-images/e826ebbcc692b4d19059d24125cf23699067ab621c979612fd0ca11ab42a65cb._SX1080_FMjpg_.jpg",
        category: "Thriller",
        year: 2010,
        director: "Christopher Nolan",
    },
];

server.get("/movies", async (req, res) => {
    const connection = await getConnection();

    const genreFilterParam = req.query.genre;
    const sortParam = req.query.sort;

    let query = "SELECT * FROM movies"; // para que sea dinámica
    const queryParams = [];

    if (genreFilterParam) {
        //filtrar por género
        query += " WHERE genre = ?";
        queryParams.push(genreFilterParam);
    }

    if (sortParam === "asc") {
        //filtrar por titulo
        query += " ORDER BY title ASC";
    } else if (sortParam === "desc") {
        query += " ORDER BY title DESC";
    }

    const [results] = await connection.query(query, queryParams); // destructuring, devuelve solo los resultados
    console.log(results);

    res.json({
        success: true,
        movies: results,
    });

    connection.end(); // he añadido la finalización
});

//signup:
server.post("/signup", async (req, res) => {
    const connection = await getConnection();
    const { email, password } = req.body;
    console.log(email, password);

    const query = "INSERT INTO users (email, password) VALUES (?, ?)";
    const [results] = await connection.query(query, [email, hashedPassword]); // destructuring, devuelve solo los resultados

    res.json({
        success: true,
        userId: results.insertId,
    });
});

server.set("view engine", "ejs");

server.get("/movie/:movieId", async (req, res) => {
    const connection = await getConnection();

    const movieId = req.params.movieId;
    console.log(movieId);

    const query = "SELECT * FROM movies WHERE idMovie = ?";
    const [results] = await connection.query(query, [movieId]);
    console.log(results);

    const foundMovie = results[0];

    connection.end();

    res.render("movie", foundMovie);
});

// init express aplication
const serverPort = 4000;
server.listen(serverPort, () => {
    console.log(`Server listening at http://localhost:${serverPort}`);
});
