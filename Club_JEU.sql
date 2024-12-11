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
(1, 'Ahmed', 'Ahmed@email.com', '2023-01-01', 1),
(2, 'Khalid', 'Khalid@email.com', '2023-06-15', 2),
(3, 'Fatima', 'Fatima@email.com', '2024-02-10', 3),
(4, 'Rachid' , 'Rachid@email.com', '2024-03-01', 4),
(5, 'Sanae', 'Sanae@email.com', '2024-07-20', 5),
(6, 'Yassine' , 'Yassine@email.com', '2024-09-15', 6);

INSERT INTO JEU (id, titre, studio_developpement, annee_sortie, genre, multijoueur)VALUES
(1, 'Minecraft', 'Studio X', '2024-01-01', 'Action', 'true'),
(2, 'Call of Duty', 'Studio Y', '2023-05-20', 'RPG', 'false'),
(3, 'Resident Evil 4', 'Studio Z', '2024-03-15', 'Shooter', 'true'),
(4, 'Grand Theft Auto', 'Studio W', '2022-11-10', 'Puzzle', 'true'),
(5, 'Fortnite', 'Studio V', '2024-06-01', 'Racing', 'false'),
(6, 'Crash Bandicoot', 'Studio U', '2023-08-22', 'Adventure', 'true');

INSERT INTO TOURNOI(id, nom_tournoi, id_jeux, date_tournoi, annee_sortie, recompenses) VALUES
(1, 'Minecraft', 3, '2024-07-10', '2024-09-01', '1000 USD'),
(2, 'Call of Duty', 5, '2024-08-15', '2024-11-01', '500 USD'),
(3, 'Resident Evil 4', 4, '2024-09-01', '2024-12-01', '2000 USD'),
(4, 'Grand Theft Auto', 2, '2024-10-05', '2024-11-01', '3000 USD'),
(5, 'Crash Bandicoot', 6, '2024-11-10', '2024-12-01', '1500 USD'),
(6, 'Fortnite', 1, '2024-12-05', '2025-01-01', '2500 USD');

INSERT INTO ENPRUNTER (id, id_member, id_jeux, date_emprunt, date_retour_prevue, date_retour_reelle) VALUES
(1, 1, 3, '2024-07-01', '2024-07-15','2024-07-12'),
(2, 2, 5, '2024-08-01', '2024-08-15' , '2024-08-18') ,
(3, 3, 4, '2024-09-05' , '2024-09-20', '2024-09-19'),
(4, 4, 2, '2024-10-01', '2024-10-15', '2024-10-10') ,
(5, 5, 6, '2024-11-01', '2024-11-15', '2024-11-13'),
(6, 6, 1, '2024-12-01', '2024-12-15', '2024-12-10' ) ;

INSERT INTO PARTICIPER (id, id_member, id_tournoi, score, range_final) VALUES
(1, 1, 2, 1200, '1st'),
(2, 2, 3, 900, '3rd'),
(3, 3, 1, 1500, '1st'),
(4, 4, 4, 800, '4th'),
(5, 5, 5, 1000, '2nd'),
(6, 6, 6, 1100, '2nd');



-------------------------------------Travail à Réaliser-------------------------
-- Requêtes de Base

   -- *Afficher la liste des jeux
      SELECT * FROM  JEU


   -- Afficher les détails d'un tournoi spécifique à partir de son nom.
      SELECT * FROM  TOURNOI WHERE nom_tournoi='Minecraft'


   -- Lister les emprunts en cours, incluant le pseudo du membre et le titre du jeu.
      SELECT * FROM Enprunter 


-- Requêtes avec Jointures

   --Lister les membres ayant participé à un tournoi, avec leur pseudo, le nom du tournoi, et leur rang final.
     SELECT MEMBER.pseudo,PARTICIPER.score,TOURNOI.nom_tournoi
     FROM MEMBER
     INNER JOIN PARTICIPER 
     on MEMBER.id = PARTICIPER.id_member 
     INNER JOIN TOURNOI
     ON TOURNOI.id=PARTICIPER.id_tournoi ;

   -- Trouver les membres qui ont souscrit à un abonnement annuel.
     SELECT MEMBER.pseudo,ABONNEMENT.date_debut  
     FROM MEMBER INNER JOIN ABONNEMENT 
     on MEMBER.id_abonnement = ABONNEMENT.id  ;

   -- Trouver les jeux empruntés par un membre spécifique (via son pseudo).Trouver les jeux empruntés par un membre spécifique (via son pseudo).
      SELECT MEMBER.pseudo,JEU.titre  
      FROM MEMBER INNER JOIN Enprunter 
      on MEMBER.id = Enprunter.id_member 
      INNER JOIN JEU 
      on Enprunter.id_jeux = JEU.id  ;

   -- Lister tous les emprunts, en incluant le pseudo du membre et les informations sur le jeu (titre et studio de développement).
      SELECT MEMBER.pseudo,JEU.titre,JEU.studio_developpement,JEU.annee_sortie,JEU.genre,JEU.multijoueur 
      FROM MEMBER INNER JOIN Enprunter 
      on MEMBER.id = Enprunter.id_member 
      INNER JOIN JEU 
      on Enprunter.id_jeux = JEU.id  ;

   -- Afficher la liste des membres et le type d'abonnement auquel ils sont associés.
      SELECT MEMBER.pseudo,ABONNEMENT.type_abonnement  
      FROM MEMBER INNER JOIN ABONNEMENT 
      on MEMBER.id_abonnement = ABONNEMENT.id  ;












