-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- Destruction/Création/Sélection de la BD
DROP DATABASE IF EXISTS  nestor;
CREATE DATABASE nestor CHARSET utf8 COLLATE utf8_general_ci;
USE nestor;

-- ---
-- Table 'utilisateur'
-- 
-- ---

DROP TABLE IF EXISTS `utilisateur`;
		
CREATE TABLE `utilisateur` (
  `id` MEDIUMINT NOT NULL AUTO_INCREMENT,
  `nom_complet` VARCHAR(100) NOT NULL,
  `courriel` VARCHAR(50) NOT NULL,
  `mdp` CHAR(128) NOT NULL,
  `date_creation_compte` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY (`courriel`)
);

-- ---
-- Table 'contact'
-- 
-- ---

DROP TABLE IF EXISTS `contact`;
		
CREATE TABLE `contact` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `prenom` VARCHAR(50) NULL DEFAULT NULL,
  `nom` VARCHAR(50) NULL DEFAULT NULL,
  `utilisateur_id` MEDIUMINT NOT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'telephone'
-- 
-- ---

DROP TABLE IF EXISTS `telephone`;
		
CREATE TABLE `telephone` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `numero` VARCHAR(25) NULL DEFAULT NULL,
  `poste` VARCHAR(10) NULL DEFAULT NULL,
  `type` ENUM('Domicile', 'Cellulaire', 'Bureau', 'Autre') NOT NULL DEFAULT 'Cellulaire',
  `contact_id` INT NOT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `contact` ADD FOREIGN KEY (utilisateur_id) REFERENCES `utilisateur` (`id`);
ALTER TABLE `telephone` ADD FOREIGN KEY (contact_id) REFERENCES `contact` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `utilisateur` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `contact` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `telephone` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `utilisateur` (`id`,`nom_complet`,`courriel`,`mdp`,`date_creation_compte`) VALUES
-- ('','','','','');
-- INSERT INTO `contact` (`id`,`prenom`,`nom`,`utilisateur_id`) VALUES
-- ('','','','');
-- INSERT INTO `telephone` (`id`,`numero`,`poste`,`type`,`contact_id`) VALUES
-- ('','','','','');