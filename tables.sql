-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le :  mer. 10 oct. 2018 à 16:59
-- Version du serveur :  10.1.34-MariaDB
-- Version de PHP :  7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `fwba_server`
--

-- --------------------------------------------------------

--
-- Structure de la table `livrables`
--

CREATE TABLE `livrables` (
  `livrable_id` int(11) NOT NULL,
  `titre` varchar(200) NOT NULL,
  `chemin` varchar(500) NOT NULL,
  `projet_r` int(10) NOT NULL,
  `livrable_type_r` int(10) NOT NULL COMMENT 'template ou document'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `livrables`
--

INSERT INTO `livrables` (`livrable_id`, `titre`, `chemin`, `projet_r`, `livrable_type_r`) VALUES
(1, 'Template Cartouche de Document', 'https://mntprod.sharepoint.com/sites/Intranet/BA/Documents%20partages/KIT%20BA/Livrables%20type/Template%20Cartouche%20de%20Document.docx?d=w0d8b578c8eb24d458f0c9659004e166f', 1, 1),
(3, 'Scoring projet', 'https://mntprod.sharepoint.com/:x:/s/Intranet/BA/EY7C2PKU5MBHvADs0ugDvCsBP8PlSxFCHDmh1U0VrO8-Qg', 1, 1),
(4, 'Note d\'opportunité', 'https://mntprod.sharepoint.com/:w:/s/Intranet/BA/Ee8qeroykupKo2K2XHC733MBkKc_xg9YRjKvmIzzlkXKKA', 1, 1),
(5, 'Note d\'oportunité - Projet 1', 'https://mntprod.sharepoint.com/:w:/s/Intranet/BA/Ee8qeroykupKo2K2XHC733MBkKc_xg9YRjKvmIzzlkXKKA', 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `livrable_type`
--

CREATE TABLE `livrable_type` (
  `livrable_type_id` int(11) NOT NULL,
  `titre` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `personnes`
--

CREATE TABLE `personnes` (
  `personne_id` int(50) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `telephone1` varchar(20) DEFAULT NULL,
  `telephone2` varchar(20) DEFAULT NULL,
  `type_r` int(20) NOT NULL,
  `projet_r` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `personnes`
--

INSERT INTO `personnes` (`personne_id`, `nom`, `prenom`, `telephone1`, `telephone2`, `type_r`, `projet_r`) VALUES
(1, 'Boissy', 'Josselin', NULL, NULL, 1, 0),
(2, 'Jensou', 'Nelly', NULL, NULL, 6, 0);

-- --------------------------------------------------------

--
-- Structure de la table `projets`
--

CREATE TABLE `projets` (
  `projets_id` int(11) NOT NULL,
  `titre` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `projets`
--

INSERT INTO `projets` (`projets_id`, `titre`, `description`, `type`) VALUES
(1, 'Projet 1', 'Premier projet de test', 'scrum'),
(2, 'Projet 2', 'Deuxieme projet de test', 'cyclev'),
(3, 'Projet 3', 'Troisième projet', 'cyclev'),
(4, 'Projet 4', 'Quatrième projet', 'cyclev'),
(5, 'Projet 5', 'Cinquième projet', 'scrum'),
(6, 'Nom projet', 'Projet ajouté', 'cylev'),
(7, 'Nom projet', 'Projet ajouté', 'cylev'),
(8, 'Nom projet', 'Projet ajouté', 'cylev');

-- --------------------------------------------------------

--
-- Structure de la table `types_intervenants`
--

CREATE TABLE `types_intervenants` (
  `type_intervnant_id` int(11) NOT NULL,
  `titre` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `types_intervenants`
--

INSERT INTO `types_intervenants` (`type_intervnant_id`, `titre`) VALUES
(1, 'Business Analyst'),
(2, 'Analyste fonctionnel'),
(3, 'Référent Business Analyst'),
(4, 'Directions Métiers'),
(5, 'Experts métiers'),
(6, 'Sponsor'),
(7, 'Responsable de programme');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `livrables`
--
ALTER TABLE `livrables`
  ADD PRIMARY KEY (`livrable_id`);

--
-- Index pour la table `livrable_type`
--
ALTER TABLE `livrable_type`
  ADD UNIQUE KEY `livrable_type_index` (`livrable_type_id`),
  ADD KEY `livrable_type_id` (`livrable_type_id`);

--
-- Index pour la table `personnes`
--
ALTER TABLE `personnes`
  ADD PRIMARY KEY (`personne_id`);

--
-- Index pour la table `projets`
--
ALTER TABLE `projets`
  ADD PRIMARY KEY (`projets_id`);

--
-- Index pour la table `types_intervenants`
--
ALTER TABLE `types_intervenants`
  ADD PRIMARY KEY (`type_intervnant_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `livrables`
--
ALTER TABLE `livrables`
  MODIFY `livrable_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `personnes`
--
ALTER TABLE `personnes`
  MODIFY `personne_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `projets`
--
ALTER TABLE `projets`
  MODIFY `projets_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `types_intervenants`
--
ALTER TABLE `types_intervenants`
  MODIFY `type_intervnant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
