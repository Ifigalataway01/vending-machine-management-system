-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 06 mai 2026 à 20:55
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bdbb4`
--

-- --------------------------------------------------------

--
-- Structure de la table `boisson`
--

CREATE TABLE `boisson` (
  `RefB` int(11) NOT NULL,
  `NomB` varchar(128) NOT NULL,
  `TypeB` char(2) NOT NULL CHECK (`TypeB` in ('JU','CI','EA')),
  `RefEm` int(11) NOT NULL,
  `ImgB` varchar(128) DEFAULT NULL,
  `PrixB` decimal(7,3) NOT NULL DEFAULT 0.000 CHECK (`PrixB` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `boisson`
--

INSERT INTO `boisson` (`RefB`, `NomB`, `TypeB`, `RefEm`, `ImgB`, `PrixB`) VALUES
(1, 'Bnino Fraise et Banane', 'JU', 4, 'bnino-jus.jpg', 1.322),
(2, 'Boga Cidre boîte', 'CI', 1, 'boga-cidre.jpg', 1.170),
(3, 'Boga Light boîte', 'CI', 2, 'boga-light.jpg', 1.550),
(4, 'Boga Lime boîte', 'CI', 1, 'boga-lime.jpg', 1.170),
(5, 'Delio Fraise', 'EA', 7, 'delio-fraise.jpg', 0.930),
(6, 'Delio Poire', 'EA', 7, 'delio-poire.jpg', 0.930),
(7, 'Delio Pomme', 'EA', 7, 'delio-pomme.jpg', 0.930),
(8, 'Florida boîte', 'CI', 2, 'florida-boite.jpg', 1.730),
(9, 'Marwa Eau 0.5l', 'EA', 6, 'marwa-eau.jpg', 0.380),
(10, 'Oh! Jus', 'JU', 5, 'oh-jus.jpg', 1.190),
(11, 'Punch Cidre 25cl', 'CI', 7, 'punch-cidre.png', 1.420),
(12, 'Punch Orange 25cl', 'CI', 7, 'punch-orange.jpg', 1.420),
(13, 'Sabrine Pétillante Agrumes 33cl', 'EA', 2, 'sabrine-agrumes.jpg', 1.220),
(14, 'Sabrine Pétillante Pêche 33cl', 'EA', 2, 'sabrine-peche.webp', 1.220),
(15, 'Sabrine Pétillante Pomme 33cl', 'EA', 2, 'sabrine-pomme.jpg', 1.220),
(16, 'Jus Orange Stil', 'JU', 4, 'stil-jus-orange-p.jpg', 0.870),
(17, 'Jus Orange Stil Bouteille 25cl', 'JU', 7, 'stil-jus-orange.jpg', 1.320),
(18, 'Jus Cocktail Tropico 20cl', 'JU', 5, 'tropico-jus.jpg', 0.950),
(19, 'Viva pêche Bouteille 50cl', 'CI', 6, 'viva-peche.jpg', 1.320),
(20, 'Safia Bouteille 0.5l', 'EA', 6, 'safia-eau.jpg', 0.420),
(21, 'Cristalline Bouteille 0.5l', 'EA', 6, 'cristalline-eau.jpg', 0.385);

-- --------------------------------------------------------

--
-- Structure de la table `boissonmachine`
--

CREATE TABLE `boissonmachine` (
  `RefVM` int(11) NOT NULL,
  `NumR` int(11) NOT NULL,
  `RefB` int(11) NOT NULL,
  `QteDispo` int(11) NOT NULL DEFAULT 0 CHECK (`QteDispo` >= 0),
  `PrixVente` decimal(7,3) NOT NULL CHECK (`PrixVente` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `boissonmachine`
--

INSERT INTO `boissonmachine` (`RefVM`, `NumR`, `RefB`, `QteDispo`, `PrixVente`) VALUES
(1, 1, 14, 5, 2.000),
(1, 2, 13, 8, 2.000),
(1, 3, 18, 6, 1.500),
(1, 4, 20, 2, 1.000),
(1, 5, 11, 2, 2.500),
(1, 6, 4, 5, 2.000),
(1, 7, 21, 2, 1.000),
(1, 8, 3, 8, 2.500),
(1, 9, 9, 4, 1.000),
(1, 10, 5, 7, 1.500),
(1, 11, 17, 4, 2.000),
(1, 12, 15, 5, 2.000),
(1, 13, 10, 4, 2.000),
(1, 14, 7, 3, 1.500),
(1, 15, 19, 3, 2.000),
(1, 16, 8, 6, 3.000),
(1, 17, 16, 9, 1.500),
(1, 18, 1, 2, 2.000),
(1, 19, 6, 2, 1.500),
(3, 1, 4, 2, 2.000),
(3, 2, 14, 2, 2.000),
(3, 3, 13, 4, 2.000),
(3, 4, 15, 7, 2.000),
(3, 5, 12, 4, 2.500),
(3, 6, 6, 8, 1.500),
(3, 7, 16, 9, 1.500),
(3, 8, 11, 2, 2.500),
(3, 9, 8, 5, 3.000),
(3, 10, 1, 8, 2.000);

-- --------------------------------------------------------

--
-- Structure de la table `emballage`
--

CREATE TABLE `emballage` (
  `RefEm` int(11) NOT NULL,
  `TypeEm` varchar(64) NOT NULL,
  `VolEm` decimal(5,3) NOT NULL CHECK (`VolEm` > 0.0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `emballage`
--

INSERT INTO `emballage` (`RefEm`, `TypeEm`, `VolEm`) VALUES
(1, 'Canette 24cl', 0.240),
(2, 'Canette 33cl', 0.330),
(3, 'Canette 25cl', 0.250),
(4, 'Carton 20cl', 0.200),
(5, 'Carton 25cl', 0.250),
(6, 'Bouteille 0.5l', 0.500),
(7, 'Bouteille 25cl', 0.250),
(8, 'Bouteille 30cl', 0.300);

-- --------------------------------------------------------

--
-- Structure de la table `vendingmachine`
--

CREATE TABLE `vendingmachine` (
  `RefVM` int(11) NOT NULL,
  `AdrVM` varchar(128) NOT NULL,
  `NbrRangVM` int(11) NOT NULL CHECK (`NbrRangVM` > 1),
  `CapRangVM` int(11) NOT NULL CHECK (`CapRangVM` > 1),
  `DateMM` date NOT NULL DEFAULT current_timestamp(),
  `HS` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `vendingmachine`
--

INSERT INTO `vendingmachine` (`RefVM`, `AdrVM`, `NbrRangVM`, `CapRangVM`, `DateMM`, `HS`) VALUES
(1, 'Lycée Pilote', 20, 10, '2025-01-01', 0),
(2, 'Lycée Pilote', 20, 10, '2023-01-01', 1),
(3, 'Université Sousse', 12, 10, '2025-01-03', 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `boisson`
--
ALTER TABLE `boisson`
  ADD PRIMARY KEY (`RefB`),
  ADD KEY `RefEm` (`RefEm`);

--
-- Index pour la table `boissonmachine`
--
ALTER TABLE `boissonmachine`
  ADD PRIMARY KEY (`RefVM`,`NumR`),
  ADD KEY `RefB` (`RefB`);

--
-- Index pour la table `emballage`
--
ALTER TABLE `emballage`
  ADD PRIMARY KEY (`RefEm`);

--
-- Index pour la table `vendingmachine`
--
ALTER TABLE `vendingmachine`
  ADD PRIMARY KEY (`RefVM`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `boisson`
--
ALTER TABLE `boisson`
  MODIFY `RefB` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pour la table `emballage`
--
ALTER TABLE `emballage`
  MODIFY `RefEm` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `vendingmachine`
--
ALTER TABLE `vendingmachine`
  MODIFY `RefVM` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `boisson`
--
ALTER TABLE `boisson`
  ADD CONSTRAINT `boisson_ibfk_1` FOREIGN KEY (`RefEm`) REFERENCES `emballage` (`RefEm`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `boissonmachine`
--
ALTER TABLE `boissonmachine`
  ADD CONSTRAINT `boissonmachine_ibfk_1` FOREIGN KEY (`RefVM`) REFERENCES `vendingmachine` (`RefVM`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `boissonmachine_ibfk_2` FOREIGN KEY (`RefB`) REFERENCES `boisson` (`RefB`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
