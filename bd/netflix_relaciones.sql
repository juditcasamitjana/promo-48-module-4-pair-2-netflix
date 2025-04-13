
-- Crear tabla de relación entre usuarios y películas (user_movies)
CREATE TABLE user_movies (
  idUser INT NOT NULL,
  idMovie INT NOT NULL,
  score INT, -- Puntuación de la peli (opcional)
  PRIMARY KEY (idUser, idMovie),
  FOREIGN KEY (idUser) REFERENCES users(idUser),
  FOREIGN KEY (idMovie) REFERENCES movies(idMovie)
);

-- Insertar datos en user_movies
INSERT INTO user_movies (idUser, idMovie, score) VALUES (1, 1, 9);
INSERT INTO user_movies (idUser, idMovie, score) VALUES (1, 2, 8);
INSERT INTO user_movies (idUser, idMovie, score) VALUES (2, 2, 10);

-- Crear tabla de relación entre películas y actores (movie_actors)
CREATE TABLE movie_actors (
  idMovie INT NOT NULL,
  idActor INT NOT NULL,
  PRIMARY KEY (idMovie, idActor),
  FOREIGN KEY (idMovie) REFERENCES movies(idMovie),
  FOREIGN KEY (idActor) REFERENCES actors(idActor)
);

-- Insertar datos en movie_actors
INSERT INTO movie_actors (idMovie, idActor) VALUES (1, 3); -- Pulp Fiction - John Travolta
INSERT INTO movie_actors (idMovie, idActor) VALUES (2, 2); -- La vita è bella - Roberto Benigni
INSERT INTO movie_actors (idMovie, idActor) VALUES (3, 1); -- Forrest Gump - Tom Hanks
