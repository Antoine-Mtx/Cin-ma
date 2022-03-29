-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           5.7.33 - MySQL Community Server (GPL)
-- SE du serveur:                Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour cinema
CREATE DATABASE IF NOT EXISTS `cinema` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `cinema`;

-- Listage de la structure de la table cinema. acteur
CREATE TABLE IF NOT EXISTS `acteur` (
  `id_acteur` int(11) NOT NULL AUTO_INCREMENT,
  `nom_acteur` varchar(150) NOT NULL,
  `prenom_acteur` varchar(150) NOT NULL,
  `sexe` varchar(10) NOT NULL,
  `date_naissance` date NOT NULL,
  PRIMARY KEY (`id_acteur`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Listage des données de la table cinema.acteur : ~9 rows (environ)
/*!40000 ALTER TABLE `acteur` DISABLE KEYS */;
INSERT INTO `acteur` (`id_acteur`, `nom_acteur`, `prenom_acteur`, `sexe`, `date_naissance`) VALUES
	(1, 'Plankton', 'Sheldon', 'Homme', '1952-06-14'),
	(2, 'Madame', 'Puff', 'Femme', '1950-06-25'),
	(3, 'Karen', 'Karen', 'Femme', '1920-07-12'),
	(4, 'Eponge', 'Bob', 'Homme', '1988-02-17'),
	(5, 'Cheeks', 'Sandy', 'Femme', '1996-06-12'),
	(6, 'Bubulle', 'Marcel', 'Homme', '1930-01-30'),
	(7, 'Dogg', 'Snoop', 'Homme', '1970-06-17'),
	(8, 'Krabs', 'Eugene', 'Homme', '1960-12-25'),
	(9, 'Foo', 'Bar', 'Femme', '1996-03-23');
/*!40000 ALTER TABLE `acteur` ENABLE KEYS */;

-- Listage de la structure de la table cinema. casting
CREATE TABLE IF NOT EXISTS `casting` (
  `id_film` int(11) NOT NULL,
  `id_acteur` int(11) NOT NULL,
  `id_role` int(11) NOT NULL,
  KEY `id_film` (`id_film`),
  KEY `id_acteur` (`id_acteur`),
  KEY `id_role` (`id_role`),
  CONSTRAINT `FK__acteur` FOREIGN KEY (`id_acteur`) REFERENCES `acteur` (`id_acteur`),
  CONSTRAINT `FK__film_casting` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`),
  CONSTRAINT `FK__role` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table cinema.casting : ~14 rows (environ)
/*!40000 ALTER TABLE `casting` DISABLE KEYS */;
INSERT INTO `casting` (`id_film`, `id_acteur`, `id_role`) VALUES
	(1, 4, 1),
	(1, 6, 5),
	(6, 8, 4),
	(5, 5, 7),
	(5, 4, 1),
	(3, 4, 1),
	(3, 5, 7),
	(3, 6, 5),
	(4, 7, 6),
	(2, 1, 3),
	(2, 3, 2),
	(2, 5, 7),
	(1, 2, 8),
	(2, 2, 9);
/*!40000 ALTER TABLE `casting` ENABLE KEYS */;

-- Listage de la structure de la table cinema. categoriser
CREATE TABLE IF NOT EXISTS `categoriser` (
  `id_film` int(11) NOT NULL,
  `id_genre` int(11) NOT NULL,
  KEY `id_film` (`id_film`),
  KEY `id_genre` (`id_genre`),
  CONSTRAINT `FK__film` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`),
  CONSTRAINT `FK__genre` FOREIGN KEY (`id_genre`) REFERENCES `genre` (`id_genre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table cinema.categoriser : ~6 rows (environ)
/*!40000 ALTER TABLE `categoriser` DISABLE KEYS */;
INSERT INTO `categoriser` (`id_film`, `id_genre`) VALUES
	(1, 3),
	(4, 2),
	(5, 1),
	(2, 4),
	(3, 1),
	(6, 3);
/*!40000 ALTER TABLE `categoriser` ENABLE KEYS */;

-- Listage de la structure de la table cinema. film
CREATE TABLE IF NOT EXISTS `film` (
  `id_film` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) NOT NULL DEFAULT '0',
  `date_sortie` date NOT NULL,
  `duree` int(11) NOT NULL DEFAULT '0',
  `synopsis` text,
  `affiche` varchar(255) DEFAULT NULL,
  `note` float NOT NULL,
  `id_realisateur` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_film`),
  KEY `id_realisateur` (`id_realisateur`),
  CONSTRAINT `FK_film_realisateur` FOREIGN KEY (`id_realisateur`) REFERENCES `realisateur` (`id_realisateur`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Listage des données de la table cinema.film : ~6 rows (environ)
/*!40000 ALTER TABLE `film` DISABLE KEYS */;
INSERT INTO `film` (`id_film`, `titre`, `date_sortie`, `duree`, `synopsis`, `affiche`, `note`, `id_realisateur`) VALUES
	(1, 'Bob l\'Eponge : Le commencement', '2000-06-20', 200, NULL, NULL, 4.5, 1),
	(2, 'Plankton Contre Attaque', '2019-06-10', 150, NULL, NULL, 3.2, 4),
	(3, 'Seavengers : Rassemblement', '2020-03-27', 90, NULL, NULL, 5, 1),
	(4, 'Jazz Session', '2005-02-15', 190, NULL, NULL, 2, 2),
	(5, 'Karate Girl', '2018-07-20', 165, NULL, NULL, 4.6, 3),
	(6, 'J\'aime l\'argent', '2002-04-23', 300, NULL, NULL, 1, 4);
/*!40000 ALTER TABLE `film` ENABLE KEYS */;

-- Listage de la structure de la table cinema. genre
CREATE TABLE IF NOT EXISTS `genre` (
  `id_genre` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_genre`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Listage des données de la table cinema.genre : ~4 rows (environ)
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` (`id_genre`, `libelle`) VALUES
	(1, 'Action'),
	(2, 'Drame'),
	(3, 'Comedie'),
	(4, 'Thriller');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;

-- Listage de la structure de la table cinema. realisateur
CREATE TABLE IF NOT EXISTS `realisateur` (
  `id_realisateur` int(11) NOT NULL AUTO_INCREMENT,
  `nom_realisateur` varchar(150) NOT NULL DEFAULT '0',
  `prenom_realisateur` varchar(150) NOT NULL DEFAULT '0',
  `sexe_realisateur` varchar(10) NOT NULL DEFAULT '0',
  `date_naissance` date NOT NULL,
  PRIMARY KEY (`id_realisateur`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Listage des données de la table cinema.realisateur : ~4 rows (environ)
/*!40000 ALTER TABLE `realisateur` DISABLE KEYS */;
INSERT INTO `realisateur` (`id_realisateur`, `nom_realisateur`, `prenom_realisateur`, `sexe_realisateur`, `date_naissance`) VALUES
	(1, 'Eponge', 'Bob', 'Homme', '1988-02-17'),
	(2, 'Calamar', 'Carlo', 'Homme', '2000-05-14'),
	(3, 'Madame', 'Puff', 'Femme', '1950-06-25'),
	(4, 'Krabs', 'Eugene', 'Homme', '1960-12-25');
/*!40000 ALTER TABLE `realisateur` ENABLE KEYS */;

-- Listage de la structure de la table cinema. role
CREATE TABLE IF NOT EXISTS `role` (
  `id_role` int(11) NOT NULL AUTO_INCREMENT,
  `nom_personnage` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Listage des données de la table cinema.role : ~9 rows (environ)
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`id_role`, `nom_personnage`) VALUES
	(1, 'Bob l\'Eponge'),
	(2, 'Sandy l\'ecureuil'),
	(3, 'Plankton'),
	(4, 'Capitaine Krabs'),
	(5, 'Super Marcel'),
	(6, 'Snoop Doggy Dogg'),
	(7, 'Karate Girl'),
	(8, 'Miss Puff'),
	(9, 'Evil Puff');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
