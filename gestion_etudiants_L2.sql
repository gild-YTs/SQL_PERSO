-- ============================================
-- Fichier SQL : gestion_etudiants_L2.sql
-- Base de données : Gestion des étudiants (L2 SGBD)
-- SGBD : MySQL / PostgreSQL (compatible)
-- ============================================

-- 1. Création de la base de données
CREATE DATABASE IF NOT EXISTS gestion_etudiants;
-- Pour PostgreSQL, utiliser :
-- CREATE DATABASE gestion_etudiants;

-- Sélection de la base (MySQL)
USE gestion_etudiants;

-- ============================================
-- 2. Création des tables
-- ============================================

CREATE TABLE etudiant (
    id_etudiant INT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    date_naissance DATE,
    filiere VARCHAR(50)
);

CREATE TABLE enseignant (
    id_enseignant INT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    grade VARCHAR(30)
);

CREATE TABLE cours (
    id_cours INT PRIMARY KEY,
    libelle VARCHAR(100) NOT NULL,
    credit INT,
    id_enseignant INT,
    FOREIGN KEY (id_enseignant) REFERENCES enseignant(id_enseignant)
);

CREATE TABLE inscription (
    id_etudiant INT,
    id_cours INT,
    annee_academique VARCHAR(9),
    PRIMARY KEY (id_etudiant, id_cours),
    FOREIGN KEY (id_etudiant) REFERENCES etudiant(id_etudiant),
    FOREIGN KEY (id_cours) REFERENCES cours(id_cours)
);

CREATE TABLE note (
    id_etudiant INT,
    id_cours INT,
    valeur DECIMAL(4,2),
    PRIMARY KEY (id_etudiant, id_cours),
    FOREIGN KEY (id_etudiant, id_cours)
        REFERENCES inscription(id_etudiant, id_cours)
);

-- ============================================
-- 3. Insertion des données
-- ============================================

INSERT INTO etudiant VALUES
(1, 'ADJOVI', 'Paul', '2002-05-14', 'Informatique'),
(2, 'KOFFI', 'Alice', '2001-09-20', 'Informatique'),
(3, 'MENSAH', 'Jean', '2000-11-02', 'Mathématiques');

INSERT INTO enseignant VALUES
(1, 'HOUNTON', 'Maître-Assistant'),
(2, 'ASSOGBA', 'Chargé de cours');

INSERT INTO cours VALUES
(1, 'Bases de données', 4, 1),
(2, 'Programmation Java', 3, 2),
(3, 'Systèmes d’exploitation', 4, 1);

INSERT INTO inscription VALUES
(1, 1, '2025-2026'),
(1, 2, '2025-2026'),
(2, 1, '2025-2026'),
(3, 3, '2025-2026');

INSERT INTO note VALUES
(1, 1, 14.50),
(1, 2, 12.00),
(2, 1, 9.75),
(3, 3, 15.25);

-- ============================================
-- Fin du fichier SQL
-- ============================================
