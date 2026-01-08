-- Création de la base de données
CREATE DATABASE entreprise;

-- Utilisation de la base
USE entreprise;

-- Table Département
CREATE TABLE Dept (
    numD INT PRIMARY KEY,
    nomD VARCHAR(50),
    lieu VARCHAR(50)
);

-- Table Employé
CREATE TABLE Emp (
    numE INT PRIMARY KEY,
    nomE VARCHAR(50),
    fonction VARCHAR(50),
    numS INT,
    embauche DATE,
    salaire DECIMAL(10,2),
    comm DECIMAL(10,2),
    numD INT,
    FOREIGN KEY (numD) REFERENCES Dept(numD)
);

-- Insertion des départements
INSERT INTO Dept VALUES
(10, 'Comptabilité', 'Paris'),
(20, 'Informatique', 'Lyon'),
(30, 'Commercial', 'Marseille');

-- Insertion des employés
INSERT INTO Emp VALUES
(1, 'Dupont', 'Manager', NULL, '2015-01-10', 5000, NULL, 10),
(2, 'Martin', 'Analyste', 1, '2018-03-15', 3500, NULL, 20),
(3, 'Durand', 'Développeur', 2, '2019-06-01', 3200, NULL, 20),
(4, 'Bernard', 'Vendeur', 1, '2020-09-20', 2800, 500, 30),
(5, 'Petit', 'Vendeur', 4, '2021-02-11', 2600, 300, 30);
