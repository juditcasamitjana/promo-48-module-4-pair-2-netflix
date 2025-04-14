SELECT * FROM netflix.user_movies;

SELECT users.name, COUNT(user_movies.idMovie)
FROM users
JOIN user_movies ON users.idUser = user_movies.idUser
GROUP BY users.name;

