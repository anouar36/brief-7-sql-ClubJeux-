CREATE TABLE MEMBER (
    id INT PRIMARY KEY ,
    pseudo VARCHAR(30),
    email  VARCHAR(30),
    date_inscription DATE
);
CREATE TABLE JEU (
    id INT PRIMARY KEY ,
    titre VARCHAR(30),
    studio_developpement  VARCHAR(30),
    annee_sortie DATE,
    genre VARCHAR,
    multijoueur BOOLEAN
);
CREATE TABLE TOURNOI (
    id INT PRIMARY KEY ,
    nom_tournoi VARCHAR(30),
    date_tournoi  VARCHAR(30),
    annee_sortie DATE,
    recompenses VARCHAR(50)
);
CREATE TABLE ABONNEMENT (
    id INT PRIMARY KEY ,
    type_abonnement  VARCHAR(30),
    date_debut DATE,
    date_fin DATE
);

