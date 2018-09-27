-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 27, 2018 at 03:04 PM
-- Server version: 5.6.34-log
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `miniboys`
--

-- --------------------------------------------------------

--
-- Table structure for table `campagne`
--

CREATE TABLE `campagne` (
  `id_campagne` int(11) NOT NULL,
  `xp_gagne` int(11) NOT NULL,
  `niveau` int(11) NOT NULL,
  `id_ennemi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `campagne`
--

INSERT INTO `campagne` (`id_campagne`, `xp_gagne`, `niveau`, `id_ennemi`) VALUES
(1, 100, 1, 1),
(2, 200, 2, 5),
(3, 400, 3, 2),
(4, 800, 4, 4),
(5, 1600, 5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `campagne_joueur`
--

CREATE TABLE `campagne_joueur` (
  `id_campagne_joueur` int(11) NOT NULL,
  `is_resolut` tinyint(1) NOT NULL,
  `id_campagne` int(11) NOT NULL,
  `id_personnage` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `campagne_joueur`
--

INSERT INTO `campagne_joueur` (`id_campagne_joueur`, `is_resolut`, `id_campagne`, `id_personnage`) VALUES
(1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ennemi`
--

CREATE TABLE `ennemi` (
  `id_ennemi` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `attaque` int(11) NOT NULL,
  `defense` int(11) NOT NULL,
  `vie` int(11) NOT NULL,
  `critique` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ennemi`
--

INSERT INTO `ennemi` (`id_ennemi`, `nom`, `attaque`, `defense`, `vie`, `critique`) VALUES
(1, 'coccinelle', 5, 1, 100, 1),
(2, 'araignée', 15, 5, 150, 5),
(3, 'asticot sous acide', 45, 15, 300, 15),
(4, 'papillon', 20, 5, 200, 20),
(5, 'chenille', 10, 10, 150, 1);

-- --------------------------------------------------------

--
-- Table structure for table `equipement`
--

CREATE TABLE `equipement` (
  `id_equipement` int(11) NOT NULL,
  `type_equipement` int(11) NOT NULL DEFAULT '0',
  `nom_equipement` varchar(200) NOT NULL,
  `attaque` int(11) NOT NULL,
  `defense` int(11) NOT NULL,
  `vie` int(11) NOT NULL,
  `critique` int(11) NOT NULL,
  `level_min` int(11) NOT NULL,
  `pour_loot` int(11) NOT NULL,
  `img` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `equipement`
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
-- Table structure for table `inventaire`
--

CREATE TABLE `inventaire` (
  `id_inventaire` int(11) NOT NULL,
  `id_personnage` int(11) NOT NULL,
  `id_equipement` int(11) NOT NULL,
  `is_equip` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventaire`
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
-- Table structure for table `personnage`
--

CREATE TABLE `personnage` (
  `id_personnage` int(11) NOT NULL,
  `type_personnage` int(11) NOT NULL DEFAULT '0' COMMENT '0=guerrier 1=archer 2=mage',
  `nb_xp` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `attaque` int(11) NOT NULL,
  `defense` int(11) NOT NULL,
  `vie` int(11) NOT NULL,
  `critique` int(11) NOT NULL,
  `id_utilisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `personnage`
--

INSERT INTO `personnage` (`id_personnage`, `type_personnage`, `nb_xp`, `level`, `attaque`, `defense`, `vie`, `critique`, `id_utilisateur`) VALUES
(1, 0, 0, 1, 10, 0, 100, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `relation_equipement_campagne`
--

CREATE TABLE `relation_equipement_campagne` (
  `id_campagne` int(11) NOT NULL,
  `id_equipement` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `relation_equipement_campagne`
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
(5, 8);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_utilisateur` int(11) NOT NULL,
  `password` varchar(250) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_utilisateur`, `password`, `username`, `email`) VALUES
(1, '$2y$10$Ti2ugPnj2/VW6CHvMBhOmeTk2iynTMqCeLKK2kK1FXV6E.SogOL82', 'test', 't@t.t');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `campagne`
--
ALTER TABLE `campagne`
  ADD PRIMARY KEY (`id_campagne`),
  ADD UNIQUE KEY `campagne_AK` (`niveau`),
  ADD KEY `campagne_ennemi0_FK` (`id_ennemi`);

--
-- Indexes for table `campagne_joueur`
--
ALTER TABLE `campagne_joueur`
  ADD PRIMARY KEY (`id_campagne_joueur`),
  ADD KEY `campagne_joueur_campagne0_FK` (`id_campagne`),
  ADD KEY `campagne_joueur_personnage1_FK` (`id_personnage`);

--
-- Indexes for table `ennemi`
--
ALTER TABLE `ennemi`
  ADD PRIMARY KEY (`id_ennemi`);

--
-- Indexes for table `equipement`
--
ALTER TABLE `equipement`
  ADD PRIMARY KEY (`id_equipement`),
  ADD UNIQUE KEY `nom_equipement` (`nom_equipement`);

--
-- Indexes for table `inventaire`
--
ALTER TABLE `inventaire`
  ADD PRIMARY KEY (`id_inventaire`),
  ADD KEY `inventaire_personnage0_FK` (`id_personnage`),
  ADD KEY `inventaire_equipement1_FK` (`id_equipement`);

--
-- Indexes for table `personnage`
--
ALTER TABLE `personnage`
  ADD PRIMARY KEY (`id_personnage`),
  ADD UNIQUE KEY `personnage_utilisateur0_AK` (`id_utilisateur`);

--
-- Indexes for table `relation_equipement_campagne`
--
ALTER TABLE `relation_equipement_campagne`
  ADD PRIMARY KEY (`id_campagne`,`id_equipement`),
  ADD KEY `relation_equipement_campagne_equipement1_FK` (`id_equipement`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_utilisateur`),
  ADD UNIQUE KEY `utilisateur_AK0` (`username`,`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `campagne`
--
ALTER TABLE `campagne`
  MODIFY `id_campagne` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `campagne_joueur`
--
ALTER TABLE `campagne_joueur`
  MODIFY `id_campagne_joueur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ennemi`
--
ALTER TABLE `ennemi`
  MODIFY `id_ennemi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `equipement`
--
ALTER TABLE `equipement`
  MODIFY `id_equipement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `inventaire`
--
ALTER TABLE `inventaire`
  MODIFY `id_inventaire` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `personnage`
--
ALTER TABLE `personnage`
  MODIFY `id_personnage` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `campagne`
--
ALTER TABLE `campagne`
  ADD CONSTRAINT `campagne_ennemi0_FK` FOREIGN KEY (`id_ennemi`) REFERENCES `ennemi` (`id_ennemi`);

--
-- Constraints for table `campagne_joueur`
--
ALTER TABLE `campagne_joueur`
  ADD CONSTRAINT `campagne_joueur_campagne0_FK` FOREIGN KEY (`id_campagne`) REFERENCES `campagne` (`id_campagne`),
  ADD CONSTRAINT `campagne_joueur_personnage1_FK` FOREIGN KEY (`id_personnage`) REFERENCES `personnage` (`id_personnage`);

--
-- Constraints for table `inventaire`
--
ALTER TABLE `inventaire`
  ADD CONSTRAINT `inventaire_equipement1_FK` FOREIGN KEY (`id_equipement`) REFERENCES `equipement` (`id_equipement`),
  ADD CONSTRAINT `inventaire_personnage0_FK` FOREIGN KEY (`id_personnage`) REFERENCES `personnage` (`id_personnage`);

--
-- Constraints for table `personnage`
--
ALTER TABLE `personnage`
  ADD CONSTRAINT `personnage_utilisateur0_FK` FOREIGN KEY (`id_utilisateur`) REFERENCES `users` (`id_utilisateur`);

--
-- Constraints for table `relation_equipement_campagne`
--
ALTER TABLE `relation_equipement_campagne`
  ADD CONSTRAINT `relation_equipement_campagne_campagne0_FK` FOREIGN KEY (`id_campagne`) REFERENCES `campagne` (`id_campagne`),
  ADD CONSTRAINT `relation_equipement_campagne_equipement1_FK` FOREIGN KEY (`id_equipement`) REFERENCES `equipement` (`id_equipement`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
