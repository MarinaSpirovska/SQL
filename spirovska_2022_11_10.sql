-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               10.4.25-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for spirovska
CREATE DATABASE IF NOT EXISTS `spirovska` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `spirovska`;

-- Dumping structure for table spirovska.marki
CREATE TABLE IF NOT EXISTS `marki` (
  `marki_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `marki_name` varchar(25) NOT NULL DEFAULT '0',
  `country` varchar(15) NOT NULL DEFAULT '0',
  `eu` tinyint(1) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`marki_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table spirovska.marki: ~14 rows (approximately)
INSERT INTO `marki` (`marki_id`, `marki_name`, `country`, `eu`) VALUES
	(1, 'AUDI', 'H', 1),
	(2, 'CHRYSLER', 'USA', 0),
	(3, 'SKODA', 'CZ', 1),
	(4, 'BMW', 'D', 1),
	(5, 'ROLLS ROYCE', 'UK', 1),
	(6, 'VOLVO', 'SE', 1),
	(7, 'LAMBORGHINI', 'IT', 1),
	(8, 'FORD', 'USA', 0),
	(47, 'TOYOTA', 'JAP', 0),
	(52, 'CHEVROLET', 'USA', 0),
	(56, 'TOYOTA', 'JAP', 0),
	(57, 'AUDI', 'H', 1);

-- Dumping structure for table spirovska.modeli
CREATE TABLE IF NOT EXISTS `modeli` (
  `modeli_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `modeli_name` varchar(20) NOT NULL,
  `price` mediumint(8) unsigned NOT NULL,
  `color` varchar(15) NOT NULL,
  `marki_id` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`modeli_id`),
  KEY `FK_modeli_marki` (`marki_id`),
  CONSTRAINT `FK_modeli_marki` FOREIGN KEY (`marki_id`) REFERENCES `marki` (`marki_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table spirovska.modeli: ~7 rows (approximately)
INSERT INTO `modeli` (`modeli_id`, `modeli_name`, `price`, `color`, `marki_id`) VALUES
	(1, 'A2', 3200, 'black', 1),
	(2, 'A4', 2800, 'red', 1),
	(5, 'A6', 6000, 'silver', 1),
	(6, 'A8', 7800, 'black', 1),
	(13, 'A20', 0, 'black', 1),
	(14, 'A30', 0, 'red', 1),
	(15, 'A30', 0, 'silver', 1);

-- Dumping structure for table spirovska.obuki
CREATE TABLE IF NOT EXISTS `obuki` (
  `ST` int(11) DEFAULT NULL,
  `Front-end` int(11) DEFAULT NULL,
  `Back-end` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table spirovska.obuki: ~0 rows (approximately)

-- Dumping structure for table spirovska.studenti
CREATE TABLE IF NOT EXISTS `studenti` (
  `Studenti_id` int(10) unsigned NOT NULL,
  `First_name` varchar(50) NOT NULL,
  `Last_name` varchar(50) NOT NULL,
  `obuki_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table spirovska.studenti: ~0 rows (approximately)

-- Dumping structure for table spirovska.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table spirovska.users: ~1 rows (approximately)
INSERT INTO `users` (`id`, `username`, `password`) VALUES
	(1, 'marinabitola.ms@gmai', 'admin');

-- Dumping structure for table spirovska.vraboteni
CREATE TABLE IF NOT EXISTS `vraboteni` (
  `vr_id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT,
  `ime` varchar(25) NOT NULL,
  `prezime` varchar(35) NOT NULL,
  `godini` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`vr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table spirovska.vraboteni: ~0 rows (approximately)

-- Dumping structure for procedure spirovska._create_country0
DELIMITER //
CREATE PROCEDURE `_create_country0`()
BEGIN
SELECT * FROM marki
WHERE eu=0;
END//
DELIMITER ;

-- Dumping structure for procedure spirovska._highest_price
DELIMITER //
CREATE PROCEDURE `_highest_price`()
BEGIN
SELECT * FROM modeli
ORDER BY price DESC
LIMIT 1;
END//
DELIMITER ;

-- Dumping structure for procedure spirovska._insert_marki
DELIMITER //
CREATE PROCEDURE `_insert_marki`(
	IN `marki_name_param` VARCHAR(25),
	IN `country_param` VARCHAR(15),
	IN `eu_param` TINYINT(1)
)
BEGIN
INSERT INTO marki (marki_name,country,eu)
VALUES (marki_name_param,country_param,eu_param);
END//
DELIMITER ;

-- Dumping structure for procedure spirovska._insert_modeli
DELIMITER //
CREATE PROCEDURE `_insert_modeli`()
BEGIN
INSERT INTO modeli (modeli_name,price,color)
VALUES ('A30','JAP',0);
END//
DELIMITER ;

-- Dumping structure for procedure spirovska._last
DELIMITER //
CREATE PROCEDURE `_last`()
BEGIN
SELECT * FROM modeli
WHERE color='black' AND price<=6000;
END//
DELIMITER ;

-- Dumping structure for procedure spirovska._price_between
DELIMITER //
CREATE PROCEDURE `_price_between`()
BEGIN
SELECT * FROM modeli
WHERE price BETWEEN 3000 AND 5000;
END//
DELIMITER ;

-- Dumping structure for procedure spirovska._select_black
DELIMITER //
CREATE PROCEDURE `_select_black`()
BEGIN
SELECT * FROM modeli
WHERE color='black';
END//
DELIMITER ;

-- Dumping structure for procedure spirovska._select_countryByD
DELIMITER //
CREATE PROCEDURE `_select_countryByD`()
BEGIN
SELECT * FROM marki
WHERE country LIKE 'D';
END//
DELIMITER ;

-- Dumping structure for procedure spirovska._select_marki
DELIMITER //
CREATE PROCEDURE `_select_marki`()
BEGIN
SELECT * FROM marki
ORDER BY marki_name desc;
END//
DELIMITER ;

-- Dumping structure for procedure spirovska._select_marki_byCountry
DELIMITER //
CREATE PROCEDURE `_select_marki_byCountry`(
	IN `country_param` VARCHAR(15)
)
BEGIN
SELECT * FROM marki
WHERE country LIKE country_param;
END//
DELIMITER ;

-- Dumping structure for procedure spirovska._select_marki_by_country
DELIMITER //
CREATE PROCEDURE `_select_marki_by_country`(
	IN `country_param1` VARCHAR(15),
	IN `country_param2` VARCHAR(15)
)
BEGIN
SELECT * FROM marki
WHERE country LIKE country_param1 OR country LIKE country_param2;
END//
DELIMITER ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
