-- Création de la base de données
CREATE DATABASE concession;

-- Utilisation de la base
USE concession;

-- Table voiture
CREATE TABLE voiture (
    numvoit INT PRIMARY KEY,
    marque VARCHAR(50)
);

-- Table personne
CREATE TABLE personne (
    numpers INT PRIMARY KEY,
    nom VARCHAR(50),
    ville VARCHAR(50)
);

-- Table vente
CREATE TABLE vente (
    numvoit INT,
    numpers INT,
    prix DECIMAL(10,2),
    PRIMARY KEY (numvoit, numpers),
    FOREIGN KEY (numvoit) REFERENCES voiture(numvoit),
    FOREIGN KEY (numpers) REFERENCES personne(numpers)
);

-- Enregistrements dans voiture
INSERT INTO voiture VALUES
(1, 'Peugeot'),
(2, 'Renault'),
(3, 'Toyota');

-- Enregistrements dans personne
INSERT INTO personne VALUES
(1, 'Ali', 'Rabat'),
(2, 'Sara', 'Casablanca'),
(3, 'Youssef', 'Fès');

-- Enregistrements dans vente
INSERT INTO vente VALUES
(1, 1, 120000.00),
(2, 2, 150000.00),
(3, 1, 180000.00);