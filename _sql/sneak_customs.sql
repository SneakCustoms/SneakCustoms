SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

DROP TABLE IF EXISTS `sneak_customs`;
CREATE TABLE IF NOT EXISTS `sneak_customs` (
	`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`skin_name` varchar(64) NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
