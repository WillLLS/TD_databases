CREATE DATABASE bibliotheque;
use bibliotheque;


CREATE TABLE IF NOT EXISTS editeurs(
    idEditeur int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nom varchar(255),
    adresse varchar(255)
);

CREATE TABLE IF NOT EXISTS livres(
    ISBN int NOT NULL PRIMARY KEY,
    titre varchar(255),
    parution date,
    nombre int,
    idEditeur int,
    FOREIGN KEY (idEditeur) REFERENCES editeurs(idEditeur)
);

CREATE TABLE IF NOT EXISTS auteurs(
    idAuteur int NOT NULL AUTO_INCREMENT,
    nom varchar(255),
    prenom varchar(255),
    adresse varchar(255),
    PRIMARY KEY (idAuteur)
);

CREATE TABLE IF NOT EXISTS ecrit(
    ISBN int,
    idAuteur int,
    FOREIGN KEY (ISBN) REFERENCES livres(ISBN),
    FOREIGN KEY (idAuteur) REFERENCES auteurs(idAuteur)
);

CREATE TABLE IF NOT EXISTS utilisateur(
    idUser int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nom varchar(255),
    prenom varchar(255),
    adresse varchar(255),
    email varchar(255)
);

CREATE TABLE IF NOT EXISTS emprunt(
    ISBN int,
    idUser int,
    d_emprunt date,
    d_limit date,
    d_retour date,
    FOREIGN KEY (ISBN) REFERENCES livres(ISBN),
    FOREIGN KEY (idUser) REFERENCES utilisateur(idUser)
);

source ./fill_db.sql