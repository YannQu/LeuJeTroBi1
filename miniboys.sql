-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 28 sep. 2018 à 08:13
-- Version du serveur :  5.7.21
-- Version de PHP :  5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `miniboys`
--

-- --------------------------------------------------------

--
-- Structure de la table `campagne`
--

DROP TABLE IF EXISTS `campagne`;
CREATE TABLE IF NOT EXISTS `campagne` (
  `id_campagne` int(11) NOT NULL AUTO_INCREMENT,
  `xp_gagne` int(11) NOT NULL,
  `niveau` int(11) NOT NULL,
  `id_ennemi` int(11) NOT NULL,
  PRIMARY KEY (`id_campagne`),
  UNIQUE KEY `campagne_AK` (`niveau`),
  KEY `campagne_ennemi0_FK` (`id_ennemi`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `campagne`
--

INSERT INTO `campagne` (`id_campagne`, `xp_gagne`, `niveau`, `id_ennemi`) VALUES
(1, 100, 1, 1),
(2, 200, 2, 5),
(3, 400, 3, 2),
(4, 800, 4, 4),
(5, 1600, 5, 3),
(6, 3200, 6, 6);

-- --------------------------------------------------------

--
-- Structure de la table `campagne_joueur`
--

DROP TABLE IF EXISTS `campagne_joueur`;
CREATE TABLE IF NOT EXISTS `campagne_joueur` (
  `id_campagne_joueur` int(11) NOT NULL AUTO_INCREMENT,
  `is_resolut` tinyint(1) NOT NULL,
  `id_campagne` int(11) NOT NULL,
  `id_personnage` int(11) NOT NULL,
  PRIMARY KEY (`id_campagne_joueur`),
  KEY `campagne_joueur_campagne0_FK` (`id_campagne`),
  KEY `campagne_joueur_personnage1_FK` (`id_personnage`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `campagne_joueur`
--

INSERT INTO `campagne_joueur` (`id_campagne_joueur`, `is_resolut`, `id_campagne`, `id_personnage`) VALUES
(1, 1, 1, 1),
(2, 0, 2, 1),
(3, 0, 3, 1),
(4, 0, 4, 1),
(5, 0, 5, 1),
(6, 0, 6, 1);

-- --------------------------------------------------------

--
-- Structure de la table `ennemi`
--

DROP TABLE IF EXISTS `ennemi`;
CREATE TABLE IF NOT EXISTS `ennemi` (
  `id_ennemi` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `attaque` int(11) NOT NULL,
  `defense` int(11) NOT NULL,
  `vie` int(11) NOT NULL,
  `critique` int(11) NOT NULL,
  PRIMARY KEY (`id_ennemi`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ennemi`
--

INSERT INTO `ennemi` (`id_ennemi`, `nom`, `attaque`, `defense`, `vie`, `critique`) VALUES
(1, 'coccinelle', 5, 1, 100, 1),
(2, 'araignée', 15, 5, 150, 5),
(3, 'asticot sous acide', 45, 15, 300, 15),
(4, 'papillon', 20, 5, 200, 20),
(5, 'chenille', 10, 10, 150, 1),
(6, 'Menthe religieuse', 100, 50, 250, 30);

-- --------------------------------------------------------

--
-- Structure de la table `equipement`
--

DROP TABLE IF EXISTS `equipement`;
CREATE TABLE IF NOT EXISTS `equipement` (
  `id_equipement` int(11) NOT NULL AUTO_INCREMENT,
  `type_equipement` int(11) NOT NULL DEFAULT '0',
  `nom_equipement` varchar(200) NOT NULL,
  `attaque` int(11) NOT NULL,
  `defense` int(11) NOT NULL,
  `vie` int(11) NOT NULL,
  `critique` int(11) NOT NULL,
  `level_min` int(11) NOT NULL,
  `pour_loot` int(11) NOT NULL,
  `img` varchar(200) NOT NULL,
  PRIMARY KEY (`id_equipement`),
  UNIQUE KEY `nom_equipement` (`nom_equipement`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `equipement`
--

INSERT INTO `equipement` (`id_equipement`, `type_equipement`, `nom_equipement`, `attaque`, `defense`, `vie`, `critique`, `level_min`, `pour_loot`, `img`) VALUES
(1, 0, 'épée coccinelle', 2, 0, 0, 0, 1, 50, '3_sword_.png'),
(2, 1, 'casque coccinelle', 1, 3, 5, 2, 1, 60, '3_head_.png'),
(3, 2, 'armure de coccinelle', 1, 5, 10, 5, 2, 40, '1_body_.png'),
(4, 3, 'bottes de coccinnelle', 2, 3, 20, 15, 3, 45, '1_left lag_.png'),
(5, 4, 'bouclier de coccinelle', 0, 10, 20, 30, 4, 25, '3_shield_.png'),
(6, 0, 'baton de marche de vieux', 20, 0, 0, 90, 1, 50, '1_spear_.png'),
(7, 0, 'pourfendeur de champignons', 50, 0, 0, 10, 1, 50, '2_ax.png'),
(8, 0, 'cure dent 3000', 1000, 0, 0, 90, 1, 50, '1_stick.png');

-- --------------------------------------------------------

--
-- Structure de la table `inventaire`
--

DROP TABLE IF EXISTS `inventaire`;
CREATE TABLE IF NOT EXISTS `inventaire` (
  `id_inventaire` int(11) NOT NULL AUTO_INCREMENT,
  `id_personnage` int(11) NOT NULL,
  `id_equipement` int(11) NOT NULL,
  `is_equip` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_inventaire`),
  KEY `inventaire_personnage0_FK` (`id_personnage`),
  KEY `inventaire_equipement1_FK` (`id_equipement`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `inventaire`
--

INSERT INTO `inventaire` (`id_inventaire`, `id_personnage`, `id_equipement`, `is_equip`) VALUES
(1, 1, 1, 0),
(2, 1, 2, 0),
(3, 1, 3, 0),
(4, 1, 4, 0),
(5, 1, 5, 0),
(6, 1, 6, 0),
(7, 1, 7, 0),
(8, 1, 8, 0);

-- --------------------------------------------------------

--
-- Structure de la table `personnage`
--

DROP TABLE IF EXISTS `personnage`;
CREATE TABLE IF NOT EXISTS `personnage` (
  `id_personnage` int(11) NOT NULL AUTO_INCREMENT,
  `type_personnage` int(11) NOT NULL DEFAULT '0' COMMENT '0=guerrier 1=archer 2=mage',
  `nb_xp` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `attaque` int(11) NOT NULL,
  `defense` int(11) NOT NULL,
  `vie` int(11) NOT NULL,
  `critique` int(11) NOT NULL,
  `id_utilisateur` int(11) NOT NULL,
  PRIMARY KEY (`id_personnage`),
  UNIQUE KEY `personnage_utilisateur0_AK` (`id_utilisateur`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `personnage`
--

INSERT INTO `personnage` (`id_personnage`, `type_personnage`, `nb_xp`, `level`, `attaque`, `defense`, `vie`, `critique`, `id_utilisateur`) VALUES
(1, 0, 0, 1, 10, 0, 100, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `relation_equipement_campagne`
--

DROP TABLE IF EXISTS `relation_equipement_campagne`;
CREATE TABLE IF NOT EXISTS `relation_equipement_campagne` (
  `id_campagne` int(11) NOT NULL,
  `id_equipement` int(11) NOT NULL,
  PRIMARY KEY (`id_campagne`,`id_equipement`),
  KEY `relation_equipement_campagne_equipement1_FK` (`id_equipement`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `relation_equipement_campagne`
--

INSERT INTO `relation_equipement_campagne` (`id_campagne`, `id_equipement`) VALUES
(1, 1),
(2, 2),
(2, 3),
(3, 3),
(4, 4),
(1, 5),
(5, 5),
(3, 6),
(4, 7),
(6, 7),
(5, 8),
(6, 8);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(250) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id_utilisateur`),
  UNIQUE KEY `utilisateur_AK0` (`username`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id_utilisateur`, `password`, `username`, `email`) VALUES
(1, '$2y$10$Ti2ugPnj2/VW6CHvMBhOmeTk2iynTMqCeLKK2kK1FXV6E.SogOL82', 'test', 't@t.t');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `campagne`
--
ALTER TABLE `campagne`
  ADD CONSTRAINT `campagne_ennemi0_FK` FOREIGN KEY (`id_ennemi`) REFERENCES `ennemi` (`id_ennemi`);

--
-- Contraintes pour la table `campagne_joueur`
--
ALTER TABLE `campagne_joueur`
  ADD CONSTRAINT `campagne_joueur_campagne0_FK` FOREIGN KEY (`id_campagne`) REFERENCES `campagne` (`id_campagne`),
  ADD CONSTRAINT `campagne_joueur_personnage1_FK` FOREIGN KEY (`id_personnage`) REFERENCES `personnage` (`id_personnage`);

--
-- Contraintes pour la table `inventaire`
--
ALTER TABLE `inventaire`
  ADD CONSTRAINT `inventaire_equipement1_FK` FOREIGN KEY (`id_equipement`) REFERENCES `equipement` (`id_equipement`),
  ADD CONSTRAINT `inventaire_personnage0_FK` FOREIGN KEY (`id_personnage`) REFERENCES `personnage` (`id_personnage`);

--
-- Contraintes pour la table `personnage`
--
ALTER TABLE `personnage`
  ADD CONSTRAINT `personnage_utilisateur0_FK` FOREIGN KEY (`id_utilisateur`) REFERENCES `users` (`id_utilisateur`);

--
-- Contraintes pour la table `relation_equipement_campagne`
--
ALTER TABLE `relation_equipement_campagne`
  ADD CONSTRAINT `relation_equipement_campagne_campagne0_FK` FOREIGN KEY (`id_campagne`) REFERENCES `campagne` (`id_campagne`),
  ADD CONSTRAINT `relation_equipement_campagne_equipement1_FK` FOREIGN KEY (`id_equipement`) REFERENCES `equipement` (`id_equipement`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
