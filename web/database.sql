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
  `locale` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
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
  `deleted` BOOLEAN NOT NULL DEFAULT FALSE,
  PRIMARY KEY (`id`),
  KEY `map` (`map`),
  KEY `version` (`version`),
  KEY `creation` (`creation`)
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


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


CREATE VIEW `map_latest` 
AS SELECT 
  `map`, 
  MAX(`creation`) AS `latest` 
  FROM `map` 
  WHERE NOT `deleted` 
  GROUP BY `map`;

CREATE VIEW `map_outdated` AS 
  SELECT `id`, `map`, `version`, `directory`, `creation`, `size` 
  FROM  `map` AS `out` 
  WHERE `creation` = (SELECT `latest` FROM `map_latest` AS `in` WHERE `out`.`map` = `in`.`map`) 
  ORDER BY `creation`;
