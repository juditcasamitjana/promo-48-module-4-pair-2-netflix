USE netflix;


INSERT INTO movies (title, genre, image, category, year)
VALUES 
("Pulp Fiction", "Crimen", "https://pics.filmaffinity.com/pulp_fiction-210382116-large.jpg", "Top 10", 1994),
("La vita è bella", "Comedia", "https://pics.filmaffinity.com/la_vita_e_bella-646167341-mmed.jpg", "Top 10", 1996),
("Forrest Gump", "Comedia", "https://pics.filmaffinity.com/forrest_gump-212765827-mmed.jpg", "Top 10", 1994);

INSERT INTO users (user, password, name, email, plan_details)
VALUES 
("laura_dev", "laura", "Laura", "laura@gmail.com", "Standard"),
("maria_dev", "maria", "Maria", "maria@gmail.com", "Standard"),
("ester_dev", "ester", "Ester", "ester@gmail.com", "Standard");

INSERT INTO actors (name, lastname, country, birthday)
VALUES 
("Tom", "Hanks", "Estados Unidos", "1956-07-09"),
("Roberto", "Benigni", "Italia", "1952-10-27"),
("John", "Travolta", "Estados Unidos", "1954-02-18");


SELECT * FROM movies;

SELECT title, genre FROM movies WHERE year > 1990;

SELECT * FROM movies WHERE category = "Top 10";

UPDATE movies SET year = 1997 WHERE idMovie = 2;	


SELECT * from actors;

SELECT * FROM actors WHERE birthday BETWEEN '1950-01-01' AND '1960-12-31';

SELECT name, lastname FROM actors WHERE country = "Estados Unidos";


SELECT * FROM users WHERE plan_details = "Standard";



SET SQL_SAFE_UPDATES = 0;
-- Tu query insegura
DELETE FROM users WHERE name = 'M%';
SET SQL_SAFE_UPDATES = 1;










