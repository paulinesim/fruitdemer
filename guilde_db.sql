CREATE TABLE COMMENTER (
  PRIMARY KEY (id_admin, id_ticket),
  id_admin            INT AUTO_INCREMENT,
  id_ticket           INT NOT NULL,
  date_commentaire    DATETIME,
  contenu_commentaire VARCHAR(42)
);

CREATE TABLE Evenements (
  PRIMARY KEY (id_evenement),
  id_evenement   INT AUTO_INCREMENT,
  date_evenement DATETIME,
  nom_evenement  VARCHAR(255),
  type_evenement VARCHAR(42)
);

CREATE TABLE Grades (
  PRIMARY KEY (id_grade),
  id_grade  INT AUTO_INCREMENT,
  nom_grade VARCHAR(50)
);

CREATE TABLE Joueurs (
  PRIMARY KEY (id_joueur),
  id_joueur     INT AUTO_INCREMENT,
  nom_joueur    VARCHAR(50),
  prenom_joueur VARCHAR(50),
  pseudo_joueur VARCHAR(50),
  email_joueur  VARCHAR(300),
  mdp_joueur    VARCHAR(20),
  id_grade      INT NOT NULL
);

CREATE TABLE Messages (
  PRIMARY KEY (id_message),
  id_message      INT AUTO_INCREMENT,
  date_message    DATETIME,
  nom_message     VARCHAR(42),
  contenu_message VARCHAR(500),
  id_joueur       INT NOT NULL
);

CREATE TABLE ORGANISER (
  PRIMARY KEY (id_admin, id_evenement),
  id_admin     INT AUTO_INCREMENT,
  id_evenement VARCHAR(42) NOT NULL
);

CREATE TABLE Personnages (
  PRIMARY KEY (id_perso),
  id_perso     INT AUTO_INCREMENT,
  nom_perso    VARCHAR(50),
  classe_perso VARCHAR(50),
  race_perso   VARCHAR(20),
  id_joueur    INT NOT NULL
);

CREATE TABLE POSTULER (
  PRIMARY KEY (id_perso, id_evenement),
  id_perso     INT NOT NULL,
  id_evenement INT NOT NULL
);

CREATE TABLE RECEVOIR (
  PRIMARY KEY (id_joueur, id_message),
  id_joueur  INT NOT NULL,
  id_message INT NOT NULL
);

CREATE TABLE REPARTIR (
  PRIMARY KEY (id_admin, id_grade),
  id_admin INT NOT NULL,
  id_grade INT NOT NULL
);

CREATE TABLE STATUER (
  PRIMARY KEY (id_admin, id_joueur),
  id_admin  INT NOT NULL,
  id_joueur INT NOT NULL
);

CREATE TABLE Statuts (
  PRIMARY KEY (id_statut),
  id_statut  INT AUTO_INCREMENT,
  nom_statut VARCHAR(50),
  id_admin   INT NOT NULL
);

CREATE TABLE Tickets (
  PRIMARY KEY (id_ticket),
  id_ticket      INT AUTO_INCREMENT,
  date_ticket    DATETIME,
  nom_ticket     VARCHAR(50),
  contenu_ticket VARCHAR(500),
  id_joueur      INT NOT NULL,
  id_statut      INT NOT NULL
);

ALTER TABLE COMMENTER ADD FOREIGN KEY (id_ticket) REFERENCES Tickets (id_ticket);

ALTER TABLE Joueurs ADD FOREIGN KEY (id_grade) REFERENCES Grades (id_grade);

ALTER TABLE Messages ADD FOREIGN KEY (id_joueur) REFERENCES Joueurs (id_joueur);

ALTER TABLE ORGANISER ADD FOREIGN KEY (id_evenement) REFERENCES Evenements (id_evenement);

ALTER TABLE Personnages ADD FOREIGN KEY (id_joueur) REFERENCES Joueurs (id_joueur);

ALTER TABLE POSTULER ADD FOREIGN KEY (id_evenement) REFERENCES Evenements (id_evenement);
ALTER TABLE POSTULER ADD FOREIGN KEY (id_perso) REFERENCES Personnages (id_perso);

ALTER TABLE RECEVOIR ADD FOREIGN KEY (id_message) REFERENCES Messages (id_message);
ALTER TABLE RECEVOIR ADD FOREIGN KEY (id_joueur) REFERENCES Joueurs (id_joueur);

ALTER TABLE REPARTIR ADD FOREIGN KEY (id_grade) REFERENCES Grades (id_grade);

ALTER TABLE STATUER ADD FOREIGN KEY (id_joueur) REFERENCES Joueurs (id_joueur);

ALTER TABLE Tickets ADD FOREIGN KEY (id_statut) REFERENCES Statuts (id_statut);
ALTER TABLE Tickets ADD FOREIGN KEY (id_joueur) REFERENCES Joueurs (id_joueur);
