/* =========================
   CREATION DE LA BASE
   ========================= */

CREATE DATABASE MUSIQUE9;
USE MUSIQUE9;

/* =========================
   TABLES PRINCIPALES
   ========================= */

CREATE TABLE disque (
    codeOuv INT PRIMARY KEY,
    titre VARCHAR(100),
    style VARCHAR(50),
    pays VARCHAR(50),
    annee INT,
    producteur VARCHAR(100)
);

CREATE TABLE livre (
    codeOuv INT PRIMARY KEY,
    titre VARCHAR(100),
    editeur VARCHAR(100),
    collection VARCHAR(100)
);

CREATE TABLE abonne (
    numAbo INT PRIMARY KEY,
    nom VARCHAR(100),
    rue VARCHAR(100),
    ville VARCHAR(50),
    codep VARCHAR(10),
    tel VARCHAR(20)
);

CREATE TABLE personnel (
    numEmp INT PRIMARY KEY,
    nom VARCHAR(100),
    adresse VARCHAR(150),
    fonction VARCHAR(50),
    salaire DECIMAL(10,2)
);

/* =========================
   TABLES DEPENDANTES
   ========================= */

CREATE TABLE exempl_disk (
    codeOuv INT,
    numEx INT,
    dateAchat DATE,
    etat VARCHAR(30),
    PRIMARY KEY (codeOuv, numEx),
    FOREIGN KEY (codeOuv) REFERENCES disque(codeOuv)
);

CREATE TABLE exempl_liv (
    codeOuv INT,
    numEx INT,
    dateAchat DATE,
    etat VARCHAR(30),
    PRIMARY KEY (codeOuv, numEx),
    FOREIGN KEY (codeOuv) REFERENCES livre(codeOuv)
);

CREATE TABLE auteur (
    codeOuv INT,
    identite VARCHAR(100),
    PRIMARY KEY (codeOuv, identite)
);

/* =========================
   TABLE DES PRETS
   ========================= */

CREATE TABLE pret (
    codeOuv INT,
    numEx INT,
    discoOuLivr VARCHAR(10),
    numAbo INT,
    datePret DATE,
    PRIMARY KEY (codeOuv, numEx, datePret),
    FOREIGN KEY (numAbo) REFERENCES abonne(numAbo)
);
