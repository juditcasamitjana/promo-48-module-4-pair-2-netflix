CREATE DATABASE netflix;

USE netflix;

CREATE TABLE movies(
	idMovie INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    title VARCHAR(45) NOT NULL,
    genre VARCHAR(45) NOT NULL,
    image VARCHAR(1000) NOT NULL,
    category VARCHAR(45) NOT NULL,
    year INT 
);

CREATE TABLE users (
	idUser INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    user VARCHAR(45) NOT NULL,
    password VARCHAR(45) NOT NULL,
    name VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL,
    plan_details VARCHAR(45) NOT NULL
);

CREATE TABLE actors (
	idActor INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    lastname VARCHAR(45) NOT NULL,
    country VARCHAR(45) NOT NULL,
    birthday date
);



