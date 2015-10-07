-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 06, 2015 at 11:45 PM
-- Server version: 5.5.45-cll
-- PHP Version: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `spanishi_classicalmusic`
--

-- --------------------------------------------------------

--
-- Table structure for table `composer`
--

CREATE TABLE IF NOT EXISTS `composer` (
  `id` int(8) NOT NULL,
  `last_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `date_birth` year(4) NOT NULL,
  `date_dead` year(4) NOT NULL,
  `birth_country` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `last_name` (`last_name`(255),`first_name`(255),`birth_country`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `composer`
--

INSERT INTO `composer` (`id`, `last_name`, `first_name`, `date_birth`, `date_dead`, `birth_country`) VALUES
(0, 'Mozart', 'Wolfgang Amadeus', 0000, 0000, 'Austria');

-- --------------------------------------------------------

--
-- Table structure for table `composition`
--

CREATE TABLE IF NOT EXISTS `composition` (
  `id` int(8) NOT NULL,
  `composition_title` varchar(256) COLLATE utf16_unicode_ci NOT NULL,
  `composition_date` year(4) NOT NULL,
  `composition_movement` varchar(100) COLLATE utf16_unicode_ci NOT NULL,
  `composition_setting` varchar(256) COLLATE utf16_unicode_ci NOT NULL,
  `composition_genre` varchar(100) COLLATE utf16_unicode_ci NOT NULL,
  `composition_period` varchar(100) COLLATE utf16_unicode_ci NOT NULL,
  `composer_id` int(11) NOT NULL,
  `ext_data` varchar(256) COLLATE utf16_unicode_ci NOT NULL,
  KEY `composition_title` (`composition_title`(191),`composition_movement`,`composition_setting`(191),`composition_genre`,`composition_period`),
  KEY `id` (`id`,`composer_id`),
  KEY `composer_id` (`composer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contributor`
--

CREATE TABLE IF NOT EXISTS `contributor` (
  `id` int(8) NOT NULL,
  `last_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `date_birth` year(4) NOT NULL,
  `date_dead` year(4) NOT NULL,
  `birth_country` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `last_name` (`last_name`(255),`first_name`(255),`birth_country`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `director`
--

CREATE TABLE IF NOT EXISTS `director` (
  `id` int(8) NOT NULL,
  `last_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `date_birth` year(4) NOT NULL,
  `date_dead` year(4) NOT NULL,
  `birth_country` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `orquestra_id` int(8) NOT NULL,
  KEY `last_name` (`last_name`(255),`first_name`(255),`birth_country`(255)),
  KEY `id` (`id`,`orquestra_id`),
  KEY `orquestra_id` (`orquestra_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `disc`
--

CREATE TABLE IF NOT EXISTS `disc` (
  `id` int(8) NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `released_year` int(4) NOT NULL,
  `total_discs` int(20) NOT NULL,
  `total_tracks` int(200) NOT NULL,
  `disc_duration` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `country` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `ext_data` text COLLATE utf8_unicode_ci NOT NULL,
  `label_id` int(8) NOT NULL,
  KEY `id` (`id`,`label_id`),
  KEY `label_id` (`label_id`),
  KEY `label_id_2` (`label_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `disc`
--

INSERT INTO `disc` (`id`, `title`, `released_year`, `total_discs`, `total_tracks`, `disc_duration`, `country`, `ext_data`, `label_id`) VALUES
(0, '', 0, 0, 0, '0000-00-00 00:00:00', '', '', 0),
(0, 'Great Mozart Symphonies', 1993, 1, 9, '2015-10-07 03:28:12', 'United States', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `instrument_played`
--

CREATE TABLE IF NOT EXISTS `instrument_played` (
  `id` int(8) NOT NULL,
  `instrument_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `instrument_name` (`instrument_name`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `label`
--

CREATE TABLE IF NOT EXISTS `label` (
  `id` int(8) NOT NULL,
  `label_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `label_name` (`label_name`(255),`country`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orquestra`
--

CREATE TABLE IF NOT EXISTS `orquestra` (
  `id` int(8) NOT NULL,
  `orquestra_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orquestra_name` (`orquestra_name`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orquestra`
--

INSERT INTO `orquestra` (`id`, `orquestra_name`) VALUES
(0, 'New Philharmony, St. Petersburg');

-- --------------------------------------------------------

--
-- Table structure for table `performer`
--

CREATE TABLE IF NOT EXISTS `performer` (
  `id` int(8) NOT NULL,
  `last_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `date_birth` year(4) NOT NULL,
  `date_dead` year(4) NOT NULL,
  `birth_country` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `instrument_id` int(8) NOT NULL,
  KEY `last_name` (`last_name`(255),`first_name`(255),`birth_country`(255)),
  KEY `id` (`id`,`instrument_id`),
  KEY `instrument_id` (`instrument_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `track`
--

CREATE TABLE IF NOT EXISTS `track` (
  `id` int(8) NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `track_recording` text COLLATE utf8_unicode_ci NOT NULL,
  `trackdisck_number` int(3) NOT NULL,
  `track_number` int(3) NOT NULL,
  `track_duration` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `title` (`title`(255),`trackdisck_number`,`track_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `composition`
--
ALTER TABLE `composition`
  ADD CONSTRAINT `composition_ibfk_1` FOREIGN KEY (`composer_id`) REFERENCES `composer` (`id`);

--
-- Constraints for table `director`
--
ALTER TABLE `director`
  ADD CONSTRAINT `director_ibfk_1` FOREIGN KEY (`orquestra_id`) REFERENCES `orquestra` (`id`);

--
-- Constraints for table `performer`
--
ALTER TABLE `performer`
  ADD CONSTRAINT `performer_ibfk_1` FOREIGN KEY (`instrument_id`) REFERENCES `instrument_played` (`id`);

--
-- Constraints for table `track`
--
ALTER TABLE `track`
  ADD CONSTRAINT `track_ibfk_1` FOREIGN KEY (`id`) REFERENCES `performer` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
