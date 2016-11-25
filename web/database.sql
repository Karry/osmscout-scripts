-- phpMyAdmin SQL Dump
-- version 4.0.10
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 25, 2016 at 12:20 AM
-- Server version: 5.5.52-0+deb8u1-log
-- PHP Version: 5.6.27-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `osmscout`
--

-- --------------------------------------------------------

--
-- Table structure for table `l10n`
--

CREATE TABLE IF NOT EXISTS `l10n` (
  `locale` varchar(10) CHARACTER SET utf16 COLLATE utf16_unicode_ci NOT NULL,
  `path` varchar(128) CHARACTER SET utf16 COLLATE utf16_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`locale`,`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `map`
--

CREATE TABLE IF NOT EXISTS `map` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `map` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` int(11) NOT NULL,
  `directory` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `creation` datetime NOT NULL,
  `size` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `version` (`version`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=16 ;


-- --------------------------------------------------------

--
-- Table structure for table `ping`
--

CREATE TABLE IF NOT EXISTS `ping` (
  `ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_agent` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `guid_cookie` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `from_version` int(11) NOT NULL,
  `to_version` int(11) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


--
-- Dumping data for table `l10n`
--

INSERT INTO `l10n` (`locale`, `path`, `name`) VALUES
('en','europe', 'Europe'),
('en','europe/albania', 'Albania'),
('en','europe/andorra', 'Andorra'),
('en','europe/austria', 'Austria'),
('en','europe/azores', 'Azores'),
('en','europe/belarus', 'Belarus'),
('en','europe/belgium', 'Belgium'),
('en','europe/bosnia-herzegovina', 'Bosnia-Herzegovina'),
('en','europe/bulgaria', 'Bulgaria'),
('en','europe/croatia', 'Croatia'),
('en','europe/cyprus', 'Cyprus'),
('en','europe/czech-republic', 'Czech Republic'),
('en','europe/denmark', 'Denmark'),
('en','europe/estonia', 'Estonia'),
('en','europe/faroe-islands', 'Faroe Islands'),
('en','europe/finland', 'Finland'),
('en','europe/france', 'France'),
('en','europe/georgia', 'Georgia (Eastern Europe)'),
('en','europe/germany', 'Germany'),
('en','europe/great-britain', 'Great Britain'),
('en','europe/Greece', 'Greece'),
('en','europe/Hungary', 'Hungary'),
('en','europe/Iceland', 'Iceland'),
('en','europe/ireland-and-northern-ireland', 'Ireland and Northern Ireland'),
('en','europe/isle-of-man', 'Isle of Man'),
('en','europe/Italy', 'Italy'),
('en','europe/Kosovo', 'Kosovo'),
('en','europe/Latvia', 'Latvia'),
('en','europe/Liechtenstein', 'Liechtenstein'),
('en','europe/Lithuania', 'Lithuania'),
('en','europe/Luxembourg', 'Luxembourg'),
('en','europe/Macedonia', 'Macedonia'),
('en','europe/Malta', 'Malta'),
('en','europe/Moldova', 'Moldova'),
('en','europe/Monaco', 'Monaco'),
('en','europe/Montenegro', 'Montenegro'),
('en','europe/Netherlands', 'Netherlands'),
('en','europe/Norway', 'Norway'),
('en','europe/Poland', 'Poland'),
('en','europe/Portugal', 'Portugal'),
('en','europe/Romania', 'Romania'),
('en','europe/serbia', 'Serbia'),
('en','europe/slovakia', 'Slovakia'),
('en','europe/Slovenia', 'Slovenia'),
('en','europe/Spain', 'Spain'),
('en','europe/Sweden', 'Sweden'),
('en','europe/Switzerland', 'Switzerland'),
('en','europe/Turkey', 'Turkey'),
('en','europe/Ukraine', 'Ukraine'),
('en','europe/Alps', 'Alps'),
('en','europe/british-isles', 'British Isles'),
('en','europe/dach', 'Germany, Austria, Switzerland');

INSERT INTO `l10n` (`locale`, `path`, `name`) VALUES
('en','russia', 'Russian Federation');


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
