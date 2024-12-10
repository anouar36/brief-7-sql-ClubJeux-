CREATE TABLE MEMBER (
    id INT PRIMARY KEY AUTO_INCREMENT,
    pseudo VARCHAR(30) NOT NULL,
    email  VARCHAR(30) NOT NULL,
    date_inscription DATE,
    id_abonnement  INT, 
    FOREIGN KEY (id_abonnement) REFERENCES ABONNEMENT(id)
);
CREATE TABLE JEU (
    id INT PRIMARY KEY AUTO_INCREMENT ,
    titre VARCHAR(30),
    studio_developpement  VARCHAR(30),
    annee_sortie DATE,
    genre VARCHAR,
    multijoueur BOOLEAN
);
CREATE TABLE TOURNOI (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom_tournoi VARCHAR(30),
    id_jeux INT,
    FOREIGN KEY(id_jeux) REFERENCES JEU(id),
    date_tournoi  VARCHAR(30),
    annee_sortie DATE,
    recompenses VARCHAR(50)
);
CREATE TABLE ABONNEMENT (
    id INT PRIMARY KEY AUTO_INCREMENT,
    type_abonnement  VARCHAR(30),
    date_debut DATE,
    date_fin DATE
);
CREATE TABLE Enprunter (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_member INT,
    id_jeux INT,
    FOREIGN KEY (id_member) REFERENCES MEMBER(id),
    FOREIGN KEY (id_jeux) REFERENCES JEU(id),
    date_emprunt  DATE,
    date_retour_prevue DATE ,
    Date_retour_reelle DATE
);
CREATE TABLE PARTICIPER (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_member INT,
    id_tournoi INT,
    FOREIGN KEY (id_member) REFERENCES MEMBER(id),
    FOREIGN KEY (id_tournoi) REFERENCES JEU(id),
    score INT NOT NULL,
    range_final VARCHAR(20)
);

