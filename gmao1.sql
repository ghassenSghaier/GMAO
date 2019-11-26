-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  mar. 11 déc. 2018 à 15:03
-- Version du serveur :  10.1.36-MariaDB
-- Version de PHP :  7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `gmao1`
--

-- --------------------------------------------------------

--
-- Structure de la table `affectation_article_stock`
--

CREATE TABLE `affectation_article_stock` (
  `id_affecation` int(11) NOT NULL,
  `quantite_article_affectation` float NOT NULL,
  `quantite_min_article_affectation` float NOT NULL,
  `date_affectation_article` timestamp NULL DEFAULT NULL,
  `id_stock` int(11) NOT NULL,
  `id_article` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `affectation_article_stock`
--

INSERT INTO `affectation_article_stock` (`id_affecation`, `quantite_article_affectation`, `quantite_min_article_affectation`, `date_affectation_article`, `id_stock`, `id_article`) VALUES
(1, 12, 2, '2018-12-05 21:57:06', 1, 3),
(2, 12, 5, '2018-12-05 22:11:11', 1, 6),
(3, 13, 3, '2018-12-09 16:23:58', 1, 7),
(4, 15, 3, '2018-12-11 00:21:01', 1, 8);

-- --------------------------------------------------------

--
-- Structure de la table `affectation_employe`
--

CREATE TABLE `affectation_employe` (
  `id_affectation` int(11) NOT NULL,
  `date_affectation` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `id_employe` int(11) NOT NULL,
  `id_service` int(11) NOT NULL,
  `id_job` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `affectation_employe`
--

INSERT INTO `affectation_employe` (`id_affectation`, `date_affectation`, `id_employe`, `id_service`, `id_job`) VALUES
(1, '2018-11-19 23:00:00', 1, 1, 1),
(2, '0000-00-00 00:00:00', 2, 2, 2),
(3, '0000-00-00 00:00:00', 2, 2, 2),
(4, '2018-11-28 21:42:57', 2, 2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `affectation_machine_service`
--

CREATE TABLE `affectation_machine_service` (
  `id_affectation` int(11) NOT NULL,
  `date_affectation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_service` int(11) NOT NULL,
  `id_machines` int(11) NOT NULL,
  `etat` set('fonctionnel','en panne','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `affectation_machine_service`
--

INSERT INTO `affectation_machine_service` (`id_affectation`, `date_affectation`, `id_service`, `id_machines`, `etat`) VALUES
(20, '2018-12-10 23:29:26', 1, 9, 'fonctionnel'),
(21, '2018-12-10 23:29:45', 1, 10, 'fonctionnel'),
(22, '2018-12-10 23:36:54', 2, 11, 'fonctionnel'),
(23, '2018-12-11 10:47:09', 2, 12, 'fonctionnel');

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `id_article` int(11) NOT NULL,
  `code_article` varchar(30) NOT NULL,
  `designation_article` varchar(30) NOT NULL,
  `famille_article` set('piece de rechange','consommables','lubrifiant','divers') NOT NULL,
  `unite_mesure` set('piece','litre','kilogramme','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`id_article`, `code_article`, `designation_article`, `famille_article`, `unite_mesure`) VALUES
(6, 'RUBZZ52', 'imprimante laser jet 3 en 1', 'consommables', 'kilogramme'),
(7, 'ZZZU', 'cartouche de recharge', 'consommables', 'piece'),
(8, 'ZUB322', 'cartouche de recharge d\'imprim', 'consommables', 'piece');

-- --------------------------------------------------------

--
-- Structure de la table `atelier`
--

CREATE TABLE `atelier` (
  `id_atelier` int(11) NOT NULL,
  `adresse_atelier` varchar(30) NOT NULL,
  `code_atelier` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `details_article`
--

CREATE TABLE `details_article` (
  `id_details` int(11) NOT NULL,
  `prix_article` float NOT NULL,
  `tva_article` float NOT NULL,
  `prix_ttc_article` float NOT NULL,
  `id_article` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `details_article`
--

INSERT INTO `details_article` (`id_details`, `prix_article`, `tva_article`, `prix_ttc_article`, `id_article`) VALUES
(6, 12, 5, 12.6, 6),
(8, 12, 2, 12.24, 7),
(9, 12, 2, 12.24, 8);

-- --------------------------------------------------------

--
-- Structure de la table `employe`
--

CREATE TABLE `employe` (
  `id_employe` int(11) NOT NULL,
  `nom_employe` varchar(30) NOT NULL,
  `prenom_employe` varchar(30) NOT NULL,
  `util` varchar(30) NOT NULL,
  `mdp` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `employe`
--

INSERT INTO `employe` (`id_employe`, `nom_employe`, `prenom_employe`, `util`, `mdp`) VALUES
(1, 'alex', 'dubois', 'tech', 'tech'),
(2, 'emanuel', 'duchamps', 'commercial', 'commercial');

-- --------------------------------------------------------

--
-- Structure de la table `intervention`
--

CREATE TABLE `intervention` (
  `id_intervention` int(11) NOT NULL,
  `date_intervention` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_machine` int(11) NOT NULL,
  `desc` text NOT NULL,
  `code_intervention` varchar(30) NOT NULL,
  `Etape` set('en attente','en cours','achevée','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `intervention`
--

INSERT INTO `intervention` (`id_intervention`, `date_intervention`, `id_machine`, `desc`, `code_intervention`, `Etape`) VALUES
(3, '2018-12-11 10:19:47', 10, 'ceci est une intervention', '122U', 'achevée'),
(4, '2018-12-11 10:51:05', 12, 'necessite une cartouche', 'INTER1', 'en attente');

-- --------------------------------------------------------

--
-- Structure de la table `job`
--

CREATE TABLE `job` (
  `id_job` int(11) NOT NULL,
  `nom_job` set('Technicien','Developpeur','Administrateur','') NOT NULL,
  `code_job` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `job`
--

INSERT INTO `job` (`id_job`, `nom_job`, `code_job`) VALUES
(1, 'Technicien', '1technicien'),
(2, 'Administrateur', '1Administrateur');

-- --------------------------------------------------------

--
-- Structure de la table `machine`
--

CREATE TABLE `machine` (
  `id_machine` int(11) NOT NULL,
  `code_machine` varchar(30) NOT NULL,
  `designation_machine` text NOT NULL,
  `numero_serie` varchar(30) NOT NULL,
  `marque` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `machine`
--

INSERT INTO `machine` (`id_machine`, `code_machine`, `designation_machine`, `numero_serie`, `marque`) VALUES
(9, 'Z4B04A', 'imprimante 3 en 1 maintenant', 'imprim11', 'HP'),
(10, 'C11CD76411', 'Imprimante À Réservoir Intégré Couleur Epson L120 + 4 Bouteilles / Garantie 3 Ans', 'imprim3', 'EPSON'),
(11, 'G2411', 'Imprimante À Réservoir Intégré Couleur HP PIXMA G2411', 'imprim2', 'HP'),
(12, 'ZU322', 'imprimante', 'imprim225', 'HP');

-- --------------------------------------------------------

--
-- Structure de la table `service`
--

CREATE TABLE `service` (
  `id_service` int(11) NOT NULL,
  `nom_service` set('Technique','Commerciale','Ressources Humaines','') NOT NULL,
  `code_service` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `service`
--

INSERT INTO `service` (`id_service`, `nom_service`, `code_service`) VALUES
(1, 'Technique', '122tech'),
(2, 'Commerciale', '122Commer');

-- --------------------------------------------------------

--
-- Structure de la table `stock`
--

CREATE TABLE `stock` (
  `id_stock` int(11) NOT NULL,
  `code_stock` varchar(30) NOT NULL,
  `adr_stock` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `stock`
--

INSERT INTO `stock` (`id_stock`, `code_stock`, `adr_stock`) VALUES
(1, 'Stock1', '03 rue usine charguia 1');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `affectation_article_stock`
--
ALTER TABLE `affectation_article_stock`
  ADD PRIMARY KEY (`id_affecation`),
  ADD KEY `fk7` (`id_stock`),
  ADD KEY `fk8` (`id_article`);

--
-- Index pour la table `affectation_employe`
--
ALTER TABLE `affectation_employe`
  ADD PRIMARY KEY (`id_affectation`),
  ADD KEY `fk1` (`id_employe`),
  ADD KEY `fk2` (`id_job`),
  ADD KEY `fk3` (`id_service`);

--
-- Index pour la table `affectation_machine_service`
--
ALTER TABLE `affectation_machine_service`
  ADD PRIMARY KEY (`id_affectation`),
  ADD KEY `fk4` (`id_machines`),
  ADD KEY `fk5` (`id_service`);

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id_article`);

--
-- Index pour la table `atelier`
--
ALTER TABLE `atelier`
  ADD PRIMARY KEY (`id_atelier`);

--
-- Index pour la table `details_article`
--
ALTER TABLE `details_article`
  ADD PRIMARY KEY (`id_details`),
  ADD KEY `fk13` (`id_article`);

--
-- Index pour la table `employe`
--
ALTER TABLE `employe`
  ADD PRIMARY KEY (`id_employe`);

--
-- Index pour la table `intervention`
--
ALTER TABLE `intervention`
  ADD PRIMARY KEY (`id_intervention`),
  ADD KEY `fk12` (`id_machine`);

--
-- Index pour la table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`id_job`);

--
-- Index pour la table `machine`
--
ALTER TABLE `machine`
  ADD PRIMARY KEY (`id_machine`);

--
-- Index pour la table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id_service`);

--
-- Index pour la table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id_stock`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `affectation_article_stock`
--
ALTER TABLE `affectation_article_stock`
  MODIFY `id_affecation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `affectation_employe`
--
ALTER TABLE `affectation_employe`
  MODIFY `id_affectation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `affectation_machine_service`
--
ALTER TABLE `affectation_machine_service`
  MODIFY `id_affectation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `id_article` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `atelier`
--
ALTER TABLE `atelier`
  MODIFY `id_atelier` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `details_article`
--
ALTER TABLE `details_article`
  MODIFY `id_details` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `employe`
--
ALTER TABLE `employe`
  MODIFY `id_employe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `intervention`
--
ALTER TABLE `intervention`
  MODIFY `id_intervention` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `job`
--
ALTER TABLE `job`
  MODIFY `id_job` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `machine`
--
ALTER TABLE `machine`
  MODIFY `id_machine` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `service`
--
ALTER TABLE `service`
  MODIFY `id_service` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `stock`
--
ALTER TABLE `stock`
  MODIFY `id_stock` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `affectation_article_stock`
--
ALTER TABLE `affectation_article_stock`
  ADD CONSTRAINT `fk7` FOREIGN KEY (`id_stock`) REFERENCES `stock` (`id_stock`),
  ADD CONSTRAINT `fk8` FOREIGN KEY (`id_article`) REFERENCES `article` (`id_article`);

--
-- Contraintes pour la table `affectation_employe`
--
ALTER TABLE `affectation_employe`
  ADD CONSTRAINT `fk1` FOREIGN KEY (`id_employe`) REFERENCES `employe` (`id_employe`),
  ADD CONSTRAINT `fk2` FOREIGN KEY (`id_job`) REFERENCES `job` (`id_job`),
  ADD CONSTRAINT `fk3` FOREIGN KEY (`id_service`) REFERENCES `service` (`id_service`);

--
-- Contraintes pour la table `affectation_machine_service`
--
ALTER TABLE `affectation_machine_service`
  ADD CONSTRAINT `fk4` FOREIGN KEY (`id_machines`) REFERENCES `machine` (`id_machine`),
  ADD CONSTRAINT `fk5` FOREIGN KEY (`id_service`) REFERENCES `service` (`id_service`);

--
-- Contraintes pour la table `details_article`
--
ALTER TABLE `details_article`
  ADD CONSTRAINT `fk13` FOREIGN KEY (`id_article`) REFERENCES `article` (`id_article`);

--
-- Contraintes pour la table `intervention`
--
ALTER TABLE `intervention`
  ADD CONSTRAINT `fk12` FOREIGN KEY (`id_machine`) REFERENCES `machine` (`id_machine`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
