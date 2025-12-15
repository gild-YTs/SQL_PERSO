/* =========================
   CREATION DE LA BASE
   ========================= */

CREATE DATABASE work8;
USE work8;

/* =========================
   TABLE DEPARTEMENT
   ========================= */

CREATE TABLE Dept (
    numD INT PRIMARY KEY,
    nomD VARCHAR(50),
    lieu VARCHAR(50)
);

/* =========================
   TABLE EMPLOYE
   ========================= */

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
