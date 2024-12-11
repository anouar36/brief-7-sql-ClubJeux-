CREATE TABLE ABONNEMENT (
    id INT PRIMARY KEY AUTO_INCREMENT,
    type_abonnement  VARCHAR(30),
    date_debut DATE,
    date_fin DATE
);
CREATE TABLE MEMBER (
    id INT PRIMARY KEY AUTO_INCREMENT,
    pseudo VARCHAR(30) NOT NULL,
    email  VARCHAR(30) NOT NULL,
    date_inscription DATE,
    id_abonnement  INT, 
    FOREIGN KEY (id_abonnement) REFERENCES ABONNEMENT(id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE JEU (
    id INT PRIMARY KEY AUTO_INCREMENT ,
    titre VARCHAR(30),
    studio_developpement  VARCHAR(30),
    annee_sortie DATE,
    genre VARCHAR(50),
    multijoueur VARCHAR(5) CHECK(multijoueur IN ('true','false'))
);
CREATE TABLE TOURNOI (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom_tournoi VARCHAR(30),
    id_jeux INT,
    FOREIGN KEY(id_jeux) REFERENCES JEU(id) ON DELETE CASCADE ON UPDATE CASCADE,
    date_tournoi  VARCHAR(30),
    annee_sortie DATE,
    recompenses VARCHAR(50)
);

CREATE TABLE Enprunter (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_member INT,
    id_jeux INT,
    FOREIGN KEY (id_member) REFERENCES MEMBER(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_jeux) REFERENCES JEU(id) ON DELETE CASCADE ON UPDATE CASCADE,
    date_emprunt  DATE,
    date_retour_prevue DATE ,
    Date_retour_reelle DATE
);
CREATE TABLE PARTICIPER (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_member INT,
    id_tournoi INT,
    FOREIGN KEY (id_member) REFERENCES MEMBER(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_tournoi) REFERENCES TOURNOI(id) ON DELETE CASCADE ON UPDATE CASCADE,
    score INT NOT NULL,
    range_final VARCHAR(20)
);

-- this for insert 

INSERT INTO ABONNEMENT (id, type_abonnement, date_debut, date_fin) VALUES
(1, 'Premium', '2024-01-01', '2025-01-01'),
(2, 'Standard', '2023-05-15', '2024-05-15'),
(3, 'Basic', '2024-02-10', '2025-02-10'),
(4, 'Premium', '2023-07-01', '2024-07-01'),
(5, 'Standard', '2024-03-01', '2025-03-01'),
(6, 'Basic', '2024-06-01', '2025-06-01');


INSERT INTO MEMBER (id, pseudo, email, date_inscription, id_abonnement) VALUES
(1, 'Ahmed', 'player1@email.com', '2023-01-01', 1),
(2, 'Khalid', 'player2@email.com', '2023-06-15', 2),
(3, 'Fatima', 'player3@email.com', '2024-02-10', 3),
(4, 'Rachid' , 'player4@email.com', '2024-03-01', 4),
(5, 'Sanae', 'player5@email.com', '2024-07-20', 5),
(6, 'Yassine' , 'player6@email.com', '2024-09-15', 6);

INSERT INTO JEU (id, titre, studio_developpement, annee_sortie, genre, multijoueur)VALUES
(1, 'Minecraft', 'Studio X', '2024-01-01', 'Action', 'true'),
(2, 'Call of Duty', 'Studio Y', '2023-05-20', 'RPG', 'false'),
(3, 'Resident Evil 4', 'Studio Z', '2024-03-15', 'Shooter', 'true'),
(4, 'Grand Theft Auto', 'Studio W', '2022-11-10', 'Puzzle', 'true'),
(5, 'Fortnite', 'Studio V', '2024-06-01', 'Racing', 'false'),
(6, 'Crash Bandicoot', 'Studio U', '2023-08-22', 'Adventure', 'true');

