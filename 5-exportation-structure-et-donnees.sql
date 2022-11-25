-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2022 at 11:45 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `nestor`
--
CREATE DATABASE IF NOT EXISTS `nestor` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `nestor`;

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `utilisateur_id` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `prenom`, `nom`, `utilisateur_id`) VALUES
(1, 'Chapdelaine', 'Marc', 1),
(2, 'Pernoud', 'Julie', 1),
(3, 'Chapuis', 'Hélène', 1),
(4, 'Abdelnasser', 'Issa', 1),
(5, 'McAlistair', 'Walter', 1);

-- --------------------------------------------------------

--
-- Table structure for table `telephone`
--

CREATE TABLE `telephone` (
  `id` int(11) NOT NULL,
  `numero` varchar(25) DEFAULT NULL,
  `poste` varchar(10) DEFAULT NULL,
  `type` enum('Domicile','Cellulaire','Bureau','Autre') NOT NULL DEFAULT 'Cellulaire',
  `contact_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `telephone`
--

INSERT INTO `telephone` (`id`, `numero`, `poste`, `type`, `contact_id`) VALUES
(1, '5148754854', '252', 'Bureau', 3),
(2, '4508545870', '', 'Autre', 3),
(3, '4382521454', '', 'Cellulaire', 1),
(4, '5148745854', '10855', 'Bureau', 2),
(5, '4508521254', '', 'Domicile', 4),
(6, '5145212454', '', 'Autre', 5),
(7, '3369854545541', '1000', 'Bureau', 5);

-- --------------------------------------------------------

--
-- Table structure for table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` mediumint(9) NOT NULL,
  `nom_complet` varchar(100) NOT NULL,
  `courriel` varchar(50) NOT NULL,
  `mdp` char(128) NOT NULL,
  `date_creation_compte` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `nom_complet`, `courriel`, `mdp`, `date_creation_compte`) VALUES
(1, 'Monsieur Admin', 'admin@testtest.com', '6be5acef2c8c8d4cd877442112dd6c70793d3e570e403b209724f365cc061b0056507fde8b89e5645a3fd55aac34e63814067e7fe1cd5e69ff4b10d8fc24f329', '2020-05-12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`),
  ADD KEY `utilisateur_id` (`utilisateur_id`);

--
-- Indexes for table `telephone`
--
ALTER TABLE `telephone`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_id` (`contact_id`);

--
-- Indexes for table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `courriel` (`courriel`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `telephone`
--
ALTER TABLE `telephone`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`);

--
-- Constraints for table `telephone`
--
ALTER TABLE `telephone`
  ADD CONSTRAINT `telephone_ibfk_1` FOREIGN KEY (`contact_id`) REFERENCES `contact` (`id`);
COMMIT;
