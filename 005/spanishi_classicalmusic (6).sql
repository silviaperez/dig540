-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 16, 2015 at 11:37 PM
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
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `last_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `date_birth` int(4) NOT NULL,
  `date_dead` int(4) NOT NULL,
  `birth_country` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `last_name` (`last_name`(255),`name`(255),`birth_country`(255))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `composer`
--

INSERT INTO `composer` (`id`, `last_name`, `name`, `date_birth`, `date_dead`, `birth_country`) VALUES
(1, 'Mozart', 'Wolfgang Amadeus', 1756, 1791, 'Austria'),
(2, 'Brahms', 'Johannes', 1833, 1897, 'Germany'),
(3, 'Tchaikovsky', 'Pyotr Il''yich ', 1840, 1893, 'Russia');

-- --------------------------------------------------------

--
-- Table structure for table `composer_track`
--

CREATE TABLE IF NOT EXISTS `composer_track` (
  `composer_id` int(8) NOT NULL,
  `track_id` int(8) NOT NULL,
  KEY `composer_id` (`composer_id`,`track_id`),
  KEY `track_id` (`track_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `composer_track`
--

INSERT INTO `composer_track` (`composer_id`, `track_id`) VALUES
(1, 1),
(1, 2),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(2, 13),
(2, 14),
(2, 15),
(2, 16),
(2, 17),
(2, 18),
(2, 19),
(3, 20),
(3, 21),
(3, 22),
(3, 23),
(3, 24),
(3, 25),
(3, 26),
(3, 27),
(3, 28);

-- --------------------------------------------------------

--
-- Table structure for table `composition`
--

CREATE TABLE IF NOT EXISTS `composition` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `composition_title` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `composition_year` int(4) NOT NULL,
  `composition_genre` enum('Aria','Barcarolle','Cadenza','Canon','Concerto','Dances','Etudes','Fantasy','Impromptu','Intermezzo','March','Mazurka','Minuet','Nocturne','Orchestral','Overture','Passacaglia','Piece','Polka','Rhapsody','Romance','Rondo','Scherzo','Serenade','Sonata','Suite','Symphony','Toccata','Variations','Waltz') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `composition_period` enum('Romantic','20th Century','21st Centruy','Classical','Baroque','Late-romantic','Renaissance','Medieval','Pre-classical') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ext_data` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `composer_id` int(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `composition_title` (`composition_title`(191),`composition_genre`,`composition_period`),
  KEY `id` (`id`,`composer_id`),
  KEY `composer_id` (`composer_id`),
  KEY `id_2` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `composition`
--

INSERT INTO `composition` (`id`, `composition_title`, `composition_year`, `composition_genre`, `composition_period`, `ext_data`, `composer_id`) VALUES
(1, 'Symphony No. 40 in G minor, K. 550.', 1788, 'Symphony', 'Classical', 'Symphony No. 40 in g minor is probably the most personal and original of the great final Mozart trilogy.', 1),
(2, 'Symphony No. 41 in c Major, K 551 "Jupiter"', 1788, 'Symphony', 'Classical', 'Probably, "Jupiter" became traditional because of the Olympian greatness of the music.', 1),
(3, 'Sonata for Piano and Violoncello in E minor, op. 38', 1865, 'Sonata', 'Classical', 'Sonate fur Klavier und Violoncello e-moll op.38.', 2),
(5, 'Sonata for Piano and Violoncello in F major, op. 99', 1886, 'Sonata', 'Classical', 'Sonate fur Klavier und Violoncello F-dur op. 99.', 2),
(6, 'Piano Concertos 1 - 3. Concert Fantasy.', 1888, 'Concerto', 'Classical', 'Tchaikovsky revised the concerto three times, the last being in 1888, which is the version usually now played. ', 3);

-- --------------------------------------------------------

--
-- Table structure for table `director`
--

CREATE TABLE IF NOT EXISTS `director` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `last_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `date_birth` int(4) NOT NULL,
  `date_dead` int(4) NOT NULL,
  `birth_country` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `orquestra_id` int(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `last_name` (`last_name`(255),`name`(255),`birth_country`(255)),
  KEY `id` (`id`,`orquestra_id`),
  KEY `orquestra_id` (`orquestra_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `director`
--

INSERT INTO `director` (`id`, `last_name`, `name`, `date_birth`, `date_dead`, `birth_country`, `orquestra_id`) VALUES
(1, 'Titov', 'Alexander', 1954, 0, 'Russia', 1),
(3, 'Barshai', 'Rudolf', 1924, 2010, 'Russia', 2),
(4, 'Titov', 'Alexander', 1954, 0, 'Russia', 3);

-- --------------------------------------------------------

--
-- Table structure for table `director_track`
--

CREATE TABLE IF NOT EXISTS `director_track` (
  `director_id` int(8) NOT NULL,
  `track_id` int(8) NOT NULL,
  KEY `director_id` (`director_id`),
  KEY `track_id` (`track_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `director_track`
--

INSERT INTO `director_track` (`director_id`, `track_id`) VALUES
(1, 1),
(1, 2),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(3, 20),
(3, 21),
(3, 22),
(3, 23),
(3, 24),
(3, 25),
(3, 26),
(3, 27),
(3, 28);

-- --------------------------------------------------------

--
-- Table structure for table `disc`
--

CREATE TABLE IF NOT EXISTS `disc` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `released_year` year(4) NOT NULL,
  `total_discs` int(20) NOT NULL,
  `total_tracks` int(200) NOT NULL,
  `disc_duration` time NOT NULL,
  `country` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `ext_data` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `label_id` int(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`label_id`),
  KEY `label_id` (`label_id`),
  KEY `id_2` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `disc`
--

INSERT INTO `disc` (`id`, `title`, `released_year`, `total_discs`, `total_tracks`, `disc_duration`, `country`, `ext_data`, `label_id`) VALUES
(1, 'Great Mozart Symphonies', 1993, 1, 9, '01:03:00', 'United States', 'Symphony N. 40 in G minor, K. 550. Symphony No. 41 in C Major, K.551 "jupiter" ', 1),
(2, 'The cello sonatas, Brahms.', 1983, 1, 7, '01:05:00', 'Germany', 'Johannes Brahms - Les Sonates pour violoncelle.', 2),
(3, 'Tchaikovsky Piano Concertos 1 - 3. Concert Fantasy.', 2003, 2, 9, '02:07:28', 'United States', '', 3);

-- --------------------------------------------------------

--
-- Table structure for table `instrument`
--

CREATE TABLE IF NOT EXISTS `instrument` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `instrument_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `instrument_name` (`instrument_name`(255))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `instrument`
--

INSERT INTO `instrument` (`id`, `instrument_name`) VALUES
(1, 'Piano'),
(2, 'Violoncello');

-- --------------------------------------------------------

--
-- Table structure for table `label`
--

CREATE TABLE IF NOT EXISTS `label` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `label_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `label_name` (`label_name`(255))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `label`
--

INSERT INTO `label` (`id`, `label_name`) VALUES
(1, 'Sony Music Entertainment Inc.'),
(2, 'Polydor International GmbH'),
(3, 'Stereo DDD');

-- --------------------------------------------------------

--
-- Table structure for table `orquestra`
--

CREATE TABLE IF NOT EXISTS `orquestra` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `orquestra_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orquestra_name` (`orquestra_name`(255))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `orquestra`
--

INSERT INTO `orquestra` (`id`, `orquestra_name`) VALUES
(1, 'Orquestra "New Philharmony," St. PetersBurg.'),
(2, 'Bournemouth Symphony Orchestra.'),
(3, 'Orchestra "Festival," St. Petersburg.');

-- --------------------------------------------------------

--
-- Table structure for table `performer`
--

CREATE TABLE IF NOT EXISTS `performer` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `last_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `date_birth` int(4) NOT NULL,
  `date_dead` int(4) NOT NULL,
  `birth_country` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `instrument_id` int(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `last_name` (`last_name`(255),`name`(255),`birth_country`(255)),
  KEY `id` (`id`,`instrument_id`),
  KEY `instrument_id` (`instrument_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `performer`
--

INSERT INTO `performer` (`id`, `last_name`, `name`, `date_birth`, `date_dead`, `birth_country`, `instrument_id`) VALUES
(3, 'Rostropovich', 'Mstislav', 1927, 2007, 'Azerbaijan', 2),
(4, 'Serkin', 'Rudolf ', 1903, 1991, 'Hungary', 1),
(5, 'Donohoe', 'Peter', 1953, 0, 'United Kingdom', 1);

-- --------------------------------------------------------

--
-- Table structure for table `performer_track`
--

CREATE TABLE IF NOT EXISTS `performer_track` (
  `performer_id` int(8) NOT NULL,
  `track_id` int(8) NOT NULL,
  KEY `track_id` (`track_id`),
  KEY `performer` (`performer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `performer_track`
--

INSERT INTO `performer_track` (`performer_id`, `track_id`) VALUES
(3, 13),
(3, 14),
(3, 15),
(3, 16),
(3, 17),
(3, 18),
(3, 19),
(4, 13),
(4, 19),
(4, 14),
(4, 15),
(4, 16),
(4, 17),
(4, 18),
(5, 20),
(5, 21),
(5, 22),
(5, 23),
(5, 25),
(5, 26),
(5, 27),
(5, 28);

-- --------------------------------------------------------

--
-- Table structure for table `track`
--

CREATE TABLE IF NOT EXISTS `track` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `trackdisck_number` int(3) NOT NULL,
  `track_number` int(3) NOT NULL,
  `track_duration` time NOT NULL,
  `disc_id` int(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `title` (`title`(255),`trackdisck_number`,`track_number`),
  KEY `disc_id` (`disc_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=29 ;

--
-- Dumping data for table `track`
--

INSERT INTO `track` (`id`, `title`, `trackdisck_number`, `track_number`, `track_duration`, `disc_id`) VALUES
(1, 'Symphony No 40 in G minor, K550. I. Molto allegro.', 1, 1, '00:08:16', 1),
(2, 'Symphony No 40 in G minor, K550. II. Andante.', 1, 2, '00:11:37', 1),
(6, 'Symphony No 40 in G minor, K550.  III. Menuetto.  Allegretto - Trio.', 1, 3, '00:04:27', 1),
(7, 'Symphony No 40 in G minor, K550. IV. Allegro assai.', 1, 4, '00:06:07', 1),
(8, 'Symphony No.41 in C Major, K. 551 "Jupiter."  I.  Allegro vivace', 1, 5, '00:07:33', 1),
(9, 'Symphony No.41 in C Major, K. 551 "Jupiter." II. Andante cantabile.', 1, 6, '00:08:57', 1),
(10, 'Symphony No.41 in C Major, K. 551 "Jupiter."  III. Menuetto. Allegretto - Trio.', 1, 7, '00:04:49', 1),
(11, 'Symphony No.41 in C Major, K. 551 "Jupiter."  IV. Molto allegro.', 1, 8, '00:06:49', 1),
(12, 'Overture to The Marriage of Figaro, K. 492.', 1, 9, '00:04:12', 1),
(13, 'Sonata for Piano and Violoncello in E minor, op.38. 1. Allegro non troppo.', 1, 1, '00:15:01', 2),
(14, 'Sonata for Piano and Violoncello in E minor, op.38. 2. Allegretto quasi Menuetto.', 1, 2, '00:05:34', 2),
(15, 'Sonata for Piano and Violoncello in E minor, op.38. 3. Allegro.', 1, 3, '00:06:33', 2),
(16, 'Sonata for Piano and Viloncello in F major, op. 99. 1. Allegro vivace.', 1, 4, '00:09:27', 2),
(17, 'Sonata for Piano and Viloncello in F major, op. 99. 2. Adagio affettuoso.', 1, 5, '00:08:22', 2),
(18, 'Sonata for Piano and Viloncello in F major, op. 99. 3. Allegro passionato.', 1, 6, '00:07:57', 2),
(19, 'Sonata for Piano and Viloncello in F major, op. 99. 4. Allegro molto.', 1, 7, '00:04:24', 2),
(20, 'Concert Fantasy, op 56. I. Andante mosso.', 1, 1, '00:15:04', 3),
(21, 'Concert Fantasy, op 56. II. Contrastes: Andante catabible - Molto vivace - Vivacissimo - Allegro moderato - Vivace.', 1, 2, '00:12:48', 3),
(22, 'Piano Concerto N.1., Op 23. I. Allegro non troppo e molto maestoso.', 1, 3, '00:27:21', 3),
(23, 'Piano Concerto N.1., Op 23. II. Andantino semplice - Prestissimo - Tempo I.', 1, 4, '00:07:39', 3),
(24, 'Piano Concerto N.1., Op 23. III. Allegro con Fuoco.', 1, 5, '00:07:04', 3),
(25, 'Piano Concerto No.2, Op.44.  I. Allegro brillante.', 2, 1, '00:22:01', 3),
(26, 'Piano Concerto No.2, Op.44. II. Andante non troppo.', 2, 2, '00:17:06', 3),
(27, 'Piano Concerto No.2, Op.44. III. Allegro con fuoco.', 2, 3, '00:07:40', 3),
(28, 'Piano Concerto No.3, Op.75.  Allegro Brillante - Cadenza - Vivacissimo.', 2, 4, '00:16:07', 3);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `composer_track`
--
ALTER TABLE `composer_track`
  ADD CONSTRAINT `composer_track_ibfk_2` FOREIGN KEY (`track_id`) REFERENCES `track` (`id`),
  ADD CONSTRAINT `composer_track_ibfk_1` FOREIGN KEY (`composer_id`) REFERENCES `composer` (`id`);

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
-- Constraints for table `director_track`
--
ALTER TABLE `director_track`
  ADD CONSTRAINT `director_track_ibfk_2` FOREIGN KEY (`track_id`) REFERENCES `track` (`id`),
  ADD CONSTRAINT `director_track_ibfk_1` FOREIGN KEY (`director_id`) REFERENCES `director` (`id`);

--
-- Constraints for table `performer`
--
ALTER TABLE `performer`
  ADD CONSTRAINT `performer_ibfk_1` FOREIGN KEY (`instrument_id`) REFERENCES `instrument` (`id`);

--
-- Constraints for table `performer_track`
--
ALTER TABLE `performer_track`
  ADD CONSTRAINT `performer_track_ibfk_2` FOREIGN KEY (`performer_id`) REFERENCES `performer` (`id`),
  ADD CONSTRAINT `performer_track_ibfk_1` FOREIGN KEY (`track_id`) REFERENCES `track` (`id`);

--
-- Constraints for table `track`
--
ALTER TABLE `track`
  ADD CONSTRAINT `track_ibfk_1` FOREIGN KEY (`disc_id`) REFERENCES `disc` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
