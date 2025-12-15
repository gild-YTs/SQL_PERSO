/* =========================
   CREATION DE LA BASE
   ========================= */

CREATE DATABASE chars65;
USE chars65;

/* =========================
   TABLE VOITURE
   ========================= */

CREATE TABLE voiture (
    numVoit INT PRIMARY KEY,
    marque VARCHAR(50)
);

/* =========================
   TABLE PERSONNE
   ========================= */

CREATE TABLE personne (
    numPers INT PRIMARY KEY,
    nom VARCHAR(50),
    ville VARCHAR(50)
);

/* =========================
   TABLE VENTE
   ========================= */

CREATE TABLE vente (
    numVoit INT,
    numPers INT,
    PRIMARY KEY (numVoit, numPers),
    FOREIGN KEY (numVoit) REFERENCES voiture(numVoit),
    FOREIGN KEY (numPers) REFERENCES personne(numPers)
);
