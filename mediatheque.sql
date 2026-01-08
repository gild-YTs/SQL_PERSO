-- Création de la base
CREATE DATABASE mediatheque;

-- Utilisation de la base
USE mediatheque;

-- Table disque
CREATE TABLE disque (
    codeOuv INT PRIMARY KEY,
    titre VARCHAR(100),
    style VARCHAR(50),
    pays VARCHAR(50),
    annee INT,
    producteur VARCHAR(100)
);

-- Table exemplaire disque
CREATE TABLE exempl_disk (
    codeOuv INT,
    numEx INT,
    dateachat DATE,
    etat VARCHAR(30),
    PRIMARY KEY (codeOuv, numEx),
    FOREIGN KEY (codeOuv) REFERENCES disque(codeOuv)
);

-- Table livre
CREATE TABLE livre (
    codeOuv INT PRIMARY KEY,
    titre VARCHAR(100),
    editeur VARCHAR(100),
    collection VARCHAR(100)
);

-- Table exemplaire livre
CREATE TABLE exempl_liv (
    codeOuv INT,
    numEx INT,
    dateachat DATE,
    etat VARCHAR(30),
    PRIMARY KEY (codeOuv, numEx),
    FOREIGN KEY (codeOuv) REFERENCES livre(codeOuv)
);

-- Table auteur
CREATE TABLE auteur (
    codeOuv INT,
    identite VARCHAR(100),
    PRIMARY KEY (codeOuv, identite)
);

-- Table abonné
CREATE TABLE abonne (
    numabo INT PRIMARY KEY,
    nom VARCHAR(100),
    rue VARCHAR(100),
    ville VARCHAR(50),
    codep VARCHAR(10),
    tel VARCHAR(20)
);

-- Table prêt
CREATE TABLE pret (
    codeOuv INT,
    numEx INT,
    diskoulivr VARCHAR(10), -- 'DISK' ou 'LIVRE'
    numabo INT,
    datepret DATE,
    FOREIGN KEY (numabo) REFERENCES abonne(numabo)
);

-- Insertion disques
INSERT INTO disque VALUES
(1, 'Thriller', 'Pop', 'USA', 1982, 'Quincy Jones'),
(2, 'Back in Black', 'Rock', 'Australie', 1980, 'Robert Lange');

-- Insertion exemplaires disques
INSERT INTO exempl_disk VALUES
(1, 1, '2019-05-10', 'Bon'),
(1, 2, '2020-03-12', 'Très bon'),
(2, 1, '2018-11-01', 'Bon');

-- Insertion livres
INSERT INTO livre VALUES
(10, 'Le Petit Prince', 'Gallimard', 'Jeunesse'),
(11, '1984', 'Secker & Warburg', 'Roman');

-- Insertion exemplaires livres
INSERT INTO exempl_liv VALUES
(10, 1, '2021-01-15', 'Bon'),
(10, 2, '2022-02-20', 'Neuf'),
(11, 1, '2020-09-10', 'Bon');

-- Insertion auteurs
INSERT INTO auteur VALUES
(10, 'Antoine de Saint-Exupéry'),
(11, 'George Orwell');

-- Insertion abonnés
INSERT INTO abonne VALUES
(1, 'Ahmed', '12 rue des Lilas', 'Paris', '75010', '0612345678'),
(2, 'Sara', '8 avenue Victor Hugo', 'Lyon', '69006', '0623456789');

-- Insertion prêts
INSERT INTO pret VALUES
(1, 1, 'DISK', 1, '2023-03-10'),
(10, 2, 'LIVRE', 2, '2023-04-05');



-- Ajout de nouveaux livres
INSERT INTO livre VALUES
(12, 'Les Misérables', 'A. Lacroix', 'Classique'),
(13, 'L’Étranger', 'Gallimard', 'Roman'),
(14, 'Candide', 'Garnier', 'Philosophie'),
(15, 'La Peste', 'Gallimard', 'Roman');

-- Ajout des auteurs correspondants
INSERT INTO auteur VALUES
(12, 'Victor Hugo'),
(13, 'Albert Camus'),
(14, 'Voltaire'),
(15, 'Albert Camus');

-- Ajout des exemplaires de livres
INSERT INTO exempl_liv VALUES
(12, 1, '2019-03-12', 'Bon'),
(12, 2, '2020-06-18', 'Moyen'),
(13, 1, '2021-09-05', 'Très bon'),
(13, 2, '2022-11-10', 'Neuf'),
(14, 1, '2018-02-22', 'Bon'),
(15, 1, '2020-10-14', 'Bon'),
(15, 2, '2023-01-07', 'Neuf');






-- Ajout de 2 romans édités par Gava-editor
INSERT INTO livre VALUES
(16, 'Le Silence des Ombres', 'Gava-editor', 'Roman'),
(17, 'Les Voix du Passé', 'Gava-editor', 'Roman');

-- Ajout des auteurs
INSERT INTO auteur VALUES
(16, 'Jean Morel'),
(17, 'Claire Dubois');

-- Ajout des exemplaires des livres
INSERT INTO exempl_liv VALUES
(16, 1, '2022-04-10', 'Neuf'),
(17, 1, '2023-01-15', 'Très bon');

-- Requête : Titres des romans édités par Gava-editor
SELECT titre
FROM livre
WHERE collection = 'Roman'
  AND editeur = 'Gava-editor';
