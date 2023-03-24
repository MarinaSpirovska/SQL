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


-- Dumping database structure for prezentacija
CREATE DATABASE IF NOT EXISTS `prezentacija` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `prezentacija`;

-- Dumping structure for table prezentacija.avtori
CREATE TABLE IF NOT EXISTS `avtori` (
  `Avtor_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) DEFAULT NULL,
  `Country` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Avtor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table prezentacija.avtori: ~4 rows (approximately)
INSERT INTO `avtori` (`Avtor_id`, `Name`, `Country`) VALUES
	(1, 'Thich Nhat Hanh', 'Vietnam'),
	(2, 'Carlos Ruiz Zafón', 'Spain'),
	(3, 'Haruki Murakami', 'Japan'),
	(4, 'Eckhart Tolle', 'Germany');

-- Dumping structure for table prezentacija.knigi
CREATE TABLE IF NOT EXISTS `knigi` (
  `Knigi_id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(25) DEFAULT NULL,
  `Date` smallint(6) unsigned NOT NULL,
  `Avtor_id` smallint(6) unsigned DEFAULT NULL,
  PRIMARY KEY (`Knigi_id`),
  KEY `Avtor_id` (`Avtor_id`),
  CONSTRAINT `Avtor_id` FOREIGN KEY (`Avtor_id`) REFERENCES `avtori` (`Avtor_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table prezentacija.knigi: ~14 rows (approximately)
INSERT INTO `knigi` (`Knigi_id`, `Title`, `Date`, `Avtor_id`) VALUES
	(1, 'Peace Is Every Step', 1990, 1),
	(2, 'Call Me by My True Names', 1993, 1),
	(3, 'Breathe, You Are Alive', 1987, 1),
	(4, 'The Blooming of A Lotus', 1993, 1),
	(5, 'The Art of Mindful Living', 1991, 1),
	(6, 'The Shadow of the Wind', 2001, 2),
	(7, 'Marina', 1999, 2),
	(8, 'The Prince of Mist', 1993, 2),
	(9, 'The Midnight Palace', 1994, 2),
	(10, 'Kafka on the Shore', 2002, 3),
	(11, 'The Wind-Up Bird Chronicl', 1994, 3),
	(12, 'Sputnik Sweetheart', 1999, 3),
	(13, 'The Power of Now', 1997, 4),
	(14, 'Stillness Speaks', 2003, 4);

-- Dumping structure for procedure prezentacija._between_91_95
DELIMITER //
CREATE PROCEDURE `_between_91_95`()
BEGIN
SELECT * FROM knigi
WHERE Date BETWEEN 1991 AND 1995;
END//
DELIMITER ;

-- Dumping structure for procedure prezentacija._order_by_date
DELIMITER //
CREATE PROCEDURE `_order_by_date`()
BEGIN
SELECT * FROM knigi
ORDER BY Date ASC;
END//
DELIMITER ;

-- Dumping structure for procedure prezentacija._order_by_title
DELIMITER //
CREATE PROCEDURE `_order_by_title`()
BEGIN
SELECT * FROM knigi
ORDER BY Title ASC;
END//
DELIMITER ;

-- Dumping structure for procedure prezentacija._select_93
DELIMITER //
CREATE PROCEDURE `_select_93`()
BEGIN
SELECT * FROM knigi
WHERE DATE='1993';
END//
DELIMITER ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
