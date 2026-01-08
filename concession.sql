CREATE DATABASE gestion
    DEFAULT CHARACTER SET = 'utf8mb4';
USE gestion;

CREATE TABLE voiture (
    numvoit INT PRIMARY KEY,
    marque VARCHAR(100)
);

CREATE TABLE personne (
    numpers INT PRIMARY KEY,
    nom VARCHAR(100),
    ville VARCHAR(100)
);

CREATE TABLE vente (
    numvoit INT,
    numpers INT,
    PRIMARY KEY (numvoit, numpers),
    FOREIGN KEY (numvoit) REFERENCES voiture(numvoit),
    FOREIGN KEY (numpers) REFERENCES personne(numpers)
);
[12:19, 08/01/2026] +22892106762: INSERT INTO voiture (numvoit, marque) VALUES
(1, 'Toyota'),
(2, 'Peugeot'), 
(3, 'Renault'),
(4, 'Ford'),
(5, 'BMW');
INSERT INTO personne (numpers, nom, ville) VALUES
(1, 'Dupont', 'Lomé'),
(2, 'Martin', 'Paris'),
(3, 'Durand', 'Abidjan'),
(4, 'Leroy', 'Cotonou'),
(5, 'Moreau', 'Dakar');
INSERT INTO vente (numvoit, numpers) VALUES
(1, 1),  -- Dupont achète Toyota
(2, 2),  -- Martin achète Peugeot
(4, 3);  -- Durand achète Ford