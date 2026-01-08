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



-- -----------------------------
-- Disques
-- -----------------------------
INSERT INTO disque VALUES
(100, 'Best Of', 'Pop', 'USA', 1998, 'Sony'),
(101, 'Classique', 'Classical', 'France', 2000, 'Gava-editor'),
(102, 'Thriller', 'Pop', 'USA', 1982, 'Quincy Jones'),
(103, '1984', 'Rock', 'UK', 1980, 'Robert Lange'); -- titre commun avec livre

-- Exemplaires disques
INSERT INTO exempl_disk VALUES
(100, 1, '1998-05-10', 'disponible'),
(100, 2, '1998-07-15', 'emprunté'),
(101, 1, '2001-03-12', 'disponible'),
(102, 1, '1983-01-01', 'emprunté'),
(103, 1, '1980-06-01', 'disponible');

-- -----------------------------
-- Livres
-- -----------------------------
INSERT INTO livre VALUES
(200, '1984', 'Secker & Warburg', 'Roman'),  -- titre commun avec disque
(201, 'Best Of', 'Gava-editor', 'Roman'),    -- titre commun avec disque
(202, 'Le Petit Prince', 'Gallimard', 'Jeunesse'),
(203, 'Candide', 'Garnier', 'Philosophie');

-- Exemplaires livres
INSERT INTO exempl_liv VALUES
(200, 1, '2000-01-01', 'emprunté'),
(200, 2, '2001-05-05', 'disponible'),
(201, 1, '2002-03-10', 'emprunté'),
(201, 2, '2003-06-20', 'disponible'),
(202, 1, '2021-01-15', 'disponible'),
(203, 1, '2018-02-22', 'disponible');

-- -----------------------------
-- Auteurs
-- -----------------------------
INSERT INTO auteur VALUES
(100, 'Jean Morel'), -- a fait un disque
(200, 'Jean Morel'), -- a écrit un livre
(101, 'Claire Dubois'),
(201, 'Claire Dubois');

-- -----------------------------
-- Personnel
-- -----------------------------
CREATE TABLE personnel (
    nom VARCHAR(50),
    salaire DECIMAL(10,2)
);

INSERT INTO personnel VALUES
('Alice', 25000),
('Bob', 30000),
('Charlie', 15000);

-- -----------------------------
-- Abonnés
-- -----------------------------
INSERT INTO abonne VALUES
(1, 'Franck', '12 rue A', 'Paris', '75000', '0612345678'),
(2, 'Toto Dupont', '15 rue B', 'Isère', '38000', '0698765432'),
(3, 'Sara', '8 avenue Victor Hugo', 'Lyon', '69006', '0623456789');

-- -----------------------------
-- Prêts
-- -----------------------------
INSERT INTO pret VALUES
(100, 2, 'DISK', 1, '2006-01-12'), -- Franck a emprunté un disque
(200, 1, 'LIVRE', 1, '2006-01-12'), -- Franck a emprunté un livre
(101, 1, 'DISK', 2, '2005-03-10'),
(201, 1, 'LIVRE', 2, '2005-03-10');

-- -----------------------------
-- Notes pour requêtes
-- -----------------------------
-- - Titres communs disque/livre : 'Best Of', '1984'
-- - Auteurs ayant fait disque et livre : Jean Morel, Claire Dubois
-- - Styles disques différents : Pop, Classical, Rock
-- - Salaires > 20000 : Alice, Bob
-- - Abonnés avec 'toto' et ville Isère : Toto Dupont
-- - Disques achetés en 1998 : codeOuv 100
-- - Franck a emprunté titres
-- - Livres avec un exemplaire emprunté et un disponible : 200, 201
