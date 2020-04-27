--
-- Base de donnes Voiture
--
-- -----------------------------------------------------------------
--
-- Structure de la table `Marque`
--
CREATE TABLE IF NOT EXISTS Marque(
  id_marque INT NOT NULL AUTO_INCREMENT,
  nom_marque VARCHAR(50),
  origine VARCHAR(50),
  PRIMARY KEY(id_marque)
);
--
-- Contenu de la table Marque
--
INSERT INTO Marque(id_marque, nom_marque, origine)
VALUES
  (0, 'citroen', 'france'),
  (1, 'wolkswagen', 'allemagne'),
  (2, 'fiat', 'Itali'),
  (3, 'peugeot', 'france');
-- ------------------------------------------------------------------
--
-- Structure de la table `Modele`
--
CREATE TABLE IF NOT EXISTS Modele(
  id_modele INT NOT NULL AUTO_INCREMENT,
  id_marque INT NOT NULL,
  nom_modele VARCHAR(50),
  PRIMARY KEY(id_modele),
  FOREIGN KEY(id_marque) REFERENCES Marque(id_marque)
);
--
  -- Contenu de la table `Modele`
  --
INSERT INTO Modele(id_modele, id_marque, nom_modele)
VALUES
  (0, 0, 'c15'),
  (1, 1, 'transporter'),
  (2, 0, 'berlingo'),
  (3, 3, 'partner'),
  (4, 2, 'doblo');
-- ------------------------------------------------------------------
  --
  -- Structure de la table ` Couleur `
  --
  CREATE TABLE IF NOT EXISTS Couleur(
    id_couleur INT NOT NULL AUTO_INCREMENT,
    code_couleur VARCHAR(50),
    PRIMARY KEY(id_couleur)
  );
--
  -- Contenu de la table ` Couleur `
  --
INSERT INTO Couleur(id_couleur, code_couleur)
VALUES
  (0, 'rouge'),
  (1, 'vert'),
  (2, 'noir'),
  (3, 'bleu'),
  (4, 'gris');
-- -----------------------------------------------------------------------
  --
  -- Structure de la table ` Voiture `
  --
  CREATE TABLE IF NOT EXISTS Voiture(
    id_voiture INT NOT NULL AUTO_INCREMENT,
    id_modele INT NOT NULL,
    plaque_immatriculation VARCHAR(50),
    motorisation VARCHAR(50),
    nb_portes INT NOT NULL,
    PRIMARY KEY(id_voiture),
    FOREIGN KEY(id_modele) REFERENCES Modele(id_modele)
  );
--
  -- Contenu de la table ` Voiture `
  --
INSERT INTO `Voiture` (
    id_voiture,
    id_modele,
    plaque_immatriculation,
    motorisation,
    nb_portes
  )
VALUES
  (0, 2, 'SD-000-PA', 'diesel', 5),
  (1, 3, 'AA-123-AA', 'essence', 5),
  (2, 0, 'AB-344-CA', 'diesel', 4),
  (3, 1, 'CD-562-BD', 'hybride', 3),
  (4, 4, 'tr-784-cc', 'essence', 5);
-- -----------------------------------------------------------------------
  --
  -- Structure de la table ` Colorier `
  --
  CREATE TABLE IF NOT EXISTS colorier(
    id_voiture INT,
    id_couleur INT,
    PRIMARY KEY(id_voiture, id_couleur),
    FOREIGN KEY(id_voiture) REFERENCES Voiture(id_voiture),
    FOREIGN KEY(id_couleur) REFERENCES Couleur(id_couleur)
  );
--
  -- Contenu de la table ` Voiture `
  --
INSERT INTO colorier(
    id_voiture,
    id_couleur
)
VALUES
  (0, 2),
  (1, 3),
  (2, 0),
  (3, 1),
  (0, 1),
  (3, 4),
  (2, 4),
  (1, 1),
  (4, 3);