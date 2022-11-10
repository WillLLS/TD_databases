CREATE DATABASE IF NOT EXISTS course;
use course;

CREATE TABLE IF NOT EXISTS club(
    idClub int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nom varchar(255)
);

CREATE TABLE IF NOT EXISTS categorie(
    idCat int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nom varchar(255)
);

CREATE TABLE IF NOT EXISTS coureur(
    idCoureur int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nom varchar(255),
    prenom varchar(255),
    idClub int,
    idCat int,
    FOREIGN KEY (idClub) REFERENCES club(idClub),
    FOREIGN KEY (idCat) REFERENCES categorie(idCat)
);

CREATE TABLE IF NOT EXISTS course(
    idCourse int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nom varchar(255),
    date_ date,
    heure time,
    lieu varchar(255),
    idCat int,
    FOREIGN KEY (idCat) REFERENCES categorie(idCat)
);

CREATE TABLE IF NOT EXISTS participe(
    idCoureur int,
    idCourse int,
    temps time,
    FOREIGN KEY (idCoureur) REFERENCES coureur(idCoureur),
    FOREIGN KEY (idCourse) REFERENCES course(idCourse)
);

source ./fill_db.sql

