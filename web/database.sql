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
('en','europe/greece', 'Greece'),
('en','europe/hungary', 'Hungary'),
('en','europe/iceland', 'Iceland'),
('en','europe/ireland-and-northern-ireland', 'Ireland and Northern Ireland'),
('en','europe/isle-of-man', 'Isle of Man'),
('en','europe/italy', 'Italy'),
('en','europe/kosovo', 'Kosovo'),
('en','europe/latvia', 'Latvia'),
('en','europe/liechtenstein', 'Liechtenstein'),
('en','europe/lithuania', 'Lithuania'),
('en','europe/luxembourg', 'Luxembourg'),
('en','europe/macedonia', 'Macedonia'),
('en','europe/malta', 'Malta'),
('en','europe/moldova', 'Moldova'),
('en','europe/monaco', 'Monaco'),
('en','europe/montenegro', 'Montenegro'),
('en','europe/netherlands', 'Netherlands'),
('en','europe/norway', 'Norway'),
('en','europe/poland', 'Poland'),
('en','europe/portugal', 'Portugal'),
('en','europe/romania', 'Romania'),
('en','europe/serbia', 'Serbia'),
('en','europe/slovakia', 'Slovakia'),
('en','europe/slovenia', 'Slovenia'),
('en','europe/spain', 'Spain'),
('en','europe/sweden', 'Sweden'),
('en','europe/switzerland', 'Switzerland'),
('en','europe/turkey', 'Turkey'),
('en','europe/ukraine', 'Ukraine'),
('en','europe/alps', 'Alps'),
('en','europe/british-isles', 'British Isles'),
('en','europe/dach', 'Germany, Austria, Switzerland');

INSERT INTO `l10n` (`locale`, `path`, `name`) VALUES
('en','russia', 'Russian Federation');


INSERT INTO `l10n` (`locale`, `path`, `name`) VALUES
('en', 'asia','Asia'),
('en', 'asia/afghanistan','Afghanistan'),
('en', 'asia/azerbaijan','Azerbaijan'),
('en', 'asia/bangladesh','Bangladesh'),
('en', 'asia/cambodia','Cambodia'),
('en', 'asia/gcc-states','GCC states'),
('en', 'asia/china','China'),
('en', 'asia/india','India'),
('en', 'asia/indonesia','Indonesia'),
('en', 'asia/japan','Japan'),
('en', 'asia/iran','Iran'),
('en', 'asia/iraq','Iraq'),
('en', 'asia/israel-and-palestine','Israel and Palestine'),
('en', 'asia/jordan','Jordan'),
('en', 'asia/kazakhstan','Kazakhstan'),
('en', 'asia/kyrgyzstan','Kyrgyzstan'),
('en', 'asia/lebanon','Lebanon'),
('en', 'asia/malaysia-singapore-brunei','Malaysia Singapore Brunei'),
('en', 'asia/maldives','Maldives'),
('en', 'asia/mongolia','Mongolia'),
('en', 'asia/nepal','Nepal'),
('en', 'asia/north-korea','North Korea'),
('en', 'asia/pakistan','Pakistan'),
('en', 'asia/philippines','Philippines'),
('en', 'asia/south-korea','South Korea'),
('en', 'asia/sri-lanka','Sri-lanka'),
('en', 'asia/syria','Syria'),
('en', 'asia/taiwan','Taiwan'),
('en', 'asia/tajikistan','Tajikistan'),
('en', 'asia/thailand','Thailand'),
('en', 'asia/turkmenistan','Turkmenistan'),
('en', 'asia/uzbekistan','Uzbekistan'),
('en', 'asia/vietnam','Vietnam'),
('en', 'asia/yemen','Yemen');

INSERT INTO `l10n` (`locale`, `path`, `name`) VALUES
('en', 'africa','Africa'),
('en', 'africa/algeria','Algeria'),
('en', 'africa/angola','Angola'),
('en', 'africa/benin','Benin'),
('en', 'africa/botswana','Botswana'),
('en', 'africa/burkina-faso','Burkina Faso'),
('en', 'africa/cameroon','Cameroon'),
('en', 'africa/canary-islands','Canary Islands'),
('en', 'africa/cape-verde','Cape Verde'),
('en', 'africa/central-african-republic','Central African Republic'),
('en', 'africa/chad','Chad'),
('en', 'africa/comores','Comores'),
('en', 'africa/congo-brazzaville','Congo (Republic/Brazzaville)'),
('en', 'africa/congo-democratic-republic','Congo (Democratic Republic/Kinshasa)'),
('en', 'africa/djibouti','Djibouti'),
('en', 'africa/egypt','Egypt'),
('en', 'africa/equatorial-guinea','Equatorial Guinea'),
('en', 'africa/eritrea','Eritrea'),
('en', 'africa/ethiopia','Ethiopia'),
('en', 'africa/gabon','Gabon'),
('en', 'africa/ghana','Ghana'),
('en', 'africa/guinea','Guinea'),
('en', 'africa/guinea-bissau','Guinea-Bissau'),
('en', 'africa/ivory-coast','Ivory Coast'),
('en', 'africa/kenya','Kenya'),
('en', 'africa/lesotho','Lesotho'),
('en', 'africa/liberia','Liberia'),
('en', 'africa/libya','Libya'),
('en', 'africa/madagascar','Madagascar'),
('en', 'africa/malawi','Malawi'),
('en', 'africa/mali','Mali'),
('en', 'africa/mauritania','Mauritania'),
('en', 'africa/mauritius','Mauritius'),
('en', 'africa/morocco','Morocco'),
('en', 'africa/mozambique','Mozambique'),
('en', 'africa/namibia','Namibia'),
('en', 'africa/niger','Niger'),
('en', 'africa/nigeria','Nigeria'),
('en', 'africa/rwanda','Rwanda'),
('en', 'africa/saint-helena-ascension-and-tristan-da-cunha','Saint Helena, Ascension, and Tristan da Cunha'),
('en', 'africa/sao-tome-and-principe','Sao Tome and Principe'),
('en', 'africa/senegal-and-gambia','Senegal and Gambia'),
('en', 'africa/seychelles','Seychelles'),
('en', 'africa/sierra-leone','Sierra Leone'),
('en', 'africa/somalia','Somalia'),
('en', 'africa/south-africa','South Africa'),
('en', 'africa/south-africa-and-lesotho','South Africa (includes Lesotho)'),
('en', 'africa/south-sudan','South Sudan'),
('en', 'africa/sudan','Sudan'),
('en', 'africa/swaziland','Swaziland'),
('en', 'africa/tanzania','Tanzania'),
('en', 'africa/togo','Togo'),
('en', 'africa/tunisia','Tunisia'),
('en', 'africa/uganda','Uganda'),
('en', 'africa/zambia','Zambia'),
('en', 'africa/zimbabwe','Zimbabwe');

INSERT INTO `l10n` (`locale`, `path`, `name`) VALUES
('en', 'north-america','North America'),
('en', 'north-america/us','USA'),

('en', 'north-america/canada','Canada'),
('en', 'north-america/greenland','Greenland'),
('en', 'north-america/mexico','Mexico'),

('en', 'north-america/us-midwest','US midwest'),
('en', 'north-america/us-northeast','US northeast'),
('en', 'north-america/us-pacific','US pacific'),
('en', 'north-america/us-south','US south'),
('en', 'north-america/us-west','US west'),


('en', 'north-america/us/alaska','Alaska'),
('en', 'north-america/us/alabama','Alabama'),
('en', 'north-america/us/arizona','Arizona'),
('en', 'north-america/us/arkansas','Arkansas'),
('en', 'north-america/us/california','California'),
('en', 'north-america/us/colorado','Colorado'),
('en', 'north-america/us/connecticut','Connecticut'),
('en', 'north-america/us/delaware','Delaware'),
('en', 'north-america/us/district-of-columbia','District-of-columbia'),
('en', 'north-america/us/florida','Florida'),
('en', 'north-america/us/georgia','Georgia'),
('en', 'north-america/us/hawaii','Hawaii'),
('en', 'north-america/us/idaho','Idaho'),
('en', 'north-america/us/illinois','Illinois'),
('en', 'north-america/us/indiana','Indiana'),
('en', 'north-america/us/iowa','Iowa'),
('en', 'north-america/us/kansas','Kansas'),
('en', 'north-america/us/kentucky','Kentucky'),
('en', 'north-america/us/louisiana','Louisiana'),
('en', 'north-america/us/maine','Maine'),
('en', 'north-america/us/maryland','Maryland'),
('en', 'north-america/us/massachusetts','Massachusetts'),
('en', 'north-america/us/michigan','Michigan'),
('en', 'north-america/us/minnesota','Minnesota'),
('en', 'north-america/us/mississippi','Mississippi'),
('en', 'north-america/us/missouri','Missouri'),
('en', 'north-america/us/montana','Montana'),
('en', 'north-america/us/nebraska','Nebraska'),
('en', 'north-america/us/nevada','Nevada'),
('en', 'north-america/us/new-hampshire','New-hampshire'),
('en', 'north-america/us/new-jersey','New-jersey'),
('en', 'north-america/us/new-mexico','New-mexico'),
('en', 'north-america/us/new-york','New-york'),
('en', 'north-america/us/north-carolina','North-carolina'),
('en', 'north-america/us/north-dakota','North-dakota'),
('en', 'north-america/us/ohio','Ohio'),
('en', 'north-america/us/oklahoma','Oklahoma'),
('en', 'north-america/us/oregon','Oregon'),
('en', 'north-america/us/pennsylvania','Pennsylvania'),
('en', 'north-america/us/rhode-island','Rhode Island'),
('en', 'north-america/us/south-carolina','South Carolina'),
('en', 'north-america/us/south-dakota','South Dakota'),
('en', 'north-america/us/tennessee','Tennessee'),
('en', 'north-america/us/texas','Texas'),
('en', 'north-america/us/utah','Utah'),
('en', 'north-america/us/vermont','Vermont'),
('en', 'north-america/us/virginia','Virginia'),
('en', 'north-america/us/washington','Washington'),
('en', 'north-america/us/west-virginia','West Virginia'),
('en', 'north-america/us/wisconsin','Wisconsin'),
('en', 'north-america/us/wyoming','Wyoming');


INSERT INTO `l10n` (`locale`, `path`, `name`) VALUES
('en', 'central-america','Central America'),
('en', 'central-america/belize','Belize'),
('en', 'central-america/cuba','Cuba'),
('en', 'central-america/guatemala','Guatemala'),
('en', 'central-america/haiti-and-domrep','Haiti and Dominican Republic'),
('en', 'central-america/nicaragua','Nicaragua');

INSERT INTO `l10n` (`locale`, `path`, `name`) VALUES
('en', 'south-america','South America'),
('en', 'south-america/argentina','Argentina'),
('en', 'south-america/bolivia','Bolivia'),
('en', 'south-america/brazil','Brazil'),
('en', 'south-america/chile','Chile'),
('en', 'south-america/colombia','Colombia'),
('en', 'south-america/ecuador','Ecuador'),
('en', 'south-america/paraguay','Paraguay'),
('en', 'south-america/peru','Peru'),
('en', 'south-america/suriname','Suriname'),
('en', 'south-america/uruguay','Uruguay');

INSERT INTO `l10n` (`locale`, `path`, `name`) VALUES
('en', 'australia-oceania','Australia and Oceania'),
('en', 'australia-oceania/australia','Australia'),
('en', 'australia-oceania/fiji','Fiji'),
('en', 'australia-oceania/new-caledonia','New Caledonia'),
('en', 'australia-oceania/new-zealand','New Zealand');

INSERT INTO `l10n` (`locale`, `path`, `name`) VALUES
('cs_CZ','europe', 'Evropa'),
('cs_CZ','europe/albania', 'Albánie'),
('cs_CZ','europe/andorra', 'Andorra'),
('cs_CZ','europe/austria', 'Rakousko'),
('cs_CZ','europe/azores', 'Azory'),
('cs_CZ','europe/belarus', 'Bělorusko'),
('cs_CZ','europe/belgium', 'Belgie'),
('cs_CZ','europe/bosnia-herzegovina', 'Bosna a Hercegovina'),
('cs_CZ','europe/bulgaria', 'Bulharsko'),
('cs_CZ','europe/croatia', 'Chorvatsko'),
('cs_CZ','europe/cyprus', 'Kypr'),
('cs_CZ','europe/czech-republic', 'Česká Republika'),
('cs_CZ','europe/denmark', 'Dánsko'),
('cs_CZ','europe/estonia', 'Estonsko'),
('cs_CZ','europe/faroe-islands', 'Faerské ostrovy'),
('cs_CZ','europe/finland', 'Finsko'),
('cs_CZ','europe/france', 'Francie'),
('cs_CZ','europe/georgia', 'Gruzie'),
('cs_CZ','europe/germany', 'Německo'),
('cs_CZ','europe/great-britain', 'Velká Británie'),
('cs_CZ','europe/greece', 'Řecko'),
('cs_CZ','europe/hungary', 'Maďarsko'),
('cs_CZ','europe/iceland', 'Island'),
('cs_CZ','europe/ireland-and-northern-ireland', 'Irsko a Severní Irsko'),
('cs_CZ','europe/isle-of-man', 'Man (ostrov)'),
('cs_CZ','europe/italy', 'Itálie'),
('cs_CZ','europe/kosovo', 'Kosovo'),
('cs_CZ','europe/latvia', 'Lotyšsko'),
('cs_CZ','europe/liechtenstein', 'Lichtenštejnsko'),
('cs_CZ','europe/lithuania', 'Litva'),
('cs_CZ','europe/luxembourg', 'Lucembursko'),
('cs_CZ','europe/macedonia', 'Makedonie'),
('cs_CZ','europe/malta', 'Malta'),
('cs_CZ','europe/moldova', 'Moldavsko'),
('cs_CZ','europe/monaco', 'Monako'),
('cs_CZ','europe/montenegro', 'Černá Hora'),
('cs_CZ','europe/netherlands', 'Nizozemsko'),
('cs_CZ','europe/norway', 'Norsko'),
('cs_CZ','europe/poland', 'Polsko'),
('cs_CZ','europe/portugal', 'Portugalsko'),
('cs_CZ','europe/romania', 'Romunsko'),
('cs_CZ','europe/serbia', 'Srbsko'),
('cs_CZ','europe/slovakia', 'Slovensko'),
('cs_CZ','europe/slovenia', 'Slovinsko'),
('cs_CZ','europe/spain', 'Španělsko'),
('cs_CZ','europe/sweden', 'Švédsko'),
('cs_CZ','europe/switzerland', 'Švýcarsko'),
('cs_CZ','europe/turkey', 'Turecko'),
('cs_CZ','europe/ukraine', 'Ukrajina'),
('cs_CZ','europe/alps', 'Alpy'),
('cs_CZ','europe/british-isles', 'Britské ostrovy'),
('cs_CZ','europe/dach', 'Německo, Rakousko, Švýcarsko');

INSERT INTO `l10n` (`locale`, `path`, `name`) VALUES
('cs_CZ','russia', 'Rusko');


INSERT INTO `l10n` (`locale`, `path`, `name`) VALUES
('cs_CZ', 'asia','Asie'),
('cs_CZ', 'asia/afghanistan','Afghanistan'),
('cs_CZ', 'asia/azerbaijan','Azerbaijan'),
('cs_CZ', 'asia/bangladesh','Bangladesh'),
('cs_CZ', 'asia/cambodia','Cambodia'),
('cs_CZ', 'asia/gcc-states','GCC states'),
('cs_CZ', 'asia/china','China'),
('cs_CZ', 'asia/india','India'),
('cs_CZ', 'asia/indonesia','Indonesia'),
('cs_CZ', 'asia/japan','Japan'),
('cs_CZ', 'asia/iran','Iran'),
('cs_CZ', 'asia/iraq','Iraq'),
('cs_CZ', 'asia/israel-and-palestine','Israel and Palestine'),
('cs_CZ', 'asia/jordan','Jordan'),
('cs_CZ', 'asia/kazakhstan','Kazakhstan'),
('cs_CZ', 'asia/kyrgyzstan','Kyrgyzstan'),
('cs_CZ', 'asia/lebanon','Lebanon'),
('cs_CZ', 'asia/malaysia-singapore-brunei','Malaysia Singapore Brunei'),
('cs_CZ', 'asia/maldives','Maldives'),
('cs_CZ', 'asia/mongolia','Mongolia'),
('cs_CZ', 'asia/nepal','Nepal'),
('cs_CZ', 'asia/north-korea','North Korea'),
('cs_CZ', 'asia/pakistan','Pakistan'),
('cs_CZ', 'asia/philippines','Philippines'),
('cs_CZ', 'asia/south-korea','South Korea'),
('cs_CZ', 'asia/sri-lanka','Sri-lanka'),
('cs_CZ', 'asia/syria','Syria'),
('cs_CZ', 'asia/taiwan','Taiwan'),
('cs_CZ', 'asia/tajikistan','Tajikistan'),
('cs_CZ', 'asia/thailand','Thailand'),
('cs_CZ', 'asia/turkmenistan','Turkmenistan'),
('cs_CZ', 'asia/uzbekistan','Uzbekistan'),
('cs_CZ', 'asia/vietnam','Vietnam'),
('cs_CZ', 'asia/yemen','Yemen');

INSERT INTO `l10n` (`locale`, `path`, `name`) VALUES
('cs_CZ', 'africa','Afrika'),
('cs_CZ', 'africa/algeria','Algeria'),
('cs_CZ', 'africa/angola','Angola'),
('cs_CZ', 'africa/benin','Benin'),
('cs_CZ', 'africa/botswana','Botswana'),
('cs_CZ', 'africa/burkina-faso','Burkina Faso'),
('cs_CZ', 'africa/cameroon','Cameroon'),
('cs_CZ', 'africa/canary-islands','Canary Islands'),
('cs_CZ', 'africa/cape-verde','Cape Verde'),
('cs_CZ', 'africa/central-african-republic','Central African Republic'),
('cs_CZ', 'africa/chad','Chad'),
('cs_CZ', 'africa/comores','Comores'),
('cs_CZ', 'africa/congo-brazzaville','Congo (Republic/Brazzaville)'),
('cs_CZ', 'africa/congo-democratic-republic','Congo (Democratic Republic/Kinshasa)'),
('cs_CZ', 'africa/djibouti','Djibouti'),
('cs_CZ', 'africa/egypt','Egypt'),
('cs_CZ', 'africa/equatorial-guinea','Equatorial Guinea'),
('cs_CZ', 'africa/eritrea','Eritrea'),
('cs_CZ', 'africa/ethiopia','Ethiopia'),
('cs_CZ', 'africa/gabon','Gabon'),
('cs_CZ', 'africa/ghana','Ghana'),
('cs_CZ', 'africa/guinea','Guinea'),
('cs_CZ', 'africa/guinea-bissau','Guinea-Bissau'),
('cs_CZ', 'africa/ivory-coast','Ivory Coast'),
('cs_CZ', 'africa/kenya','Kenya'),
('cs_CZ', 'africa/lesotho','Lesotho'),
('cs_CZ', 'africa/liberia','Liberia'),
('cs_CZ', 'africa/libya','Libya'),
('cs_CZ', 'africa/madagascar','Madagascar'),
('cs_CZ', 'africa/malawi','Malawi'),
('cs_CZ', 'africa/mali','Mali'),
('cs_CZ', 'africa/mauritania','Mauritania'),
('cs_CZ', 'africa/mauritius','Mauritius'),
('cs_CZ', 'africa/morocco','Morocco'),
('cs_CZ', 'africa/mozambique','Mozambique'),
('cs_CZ', 'africa/namibia','Namibia'),
('cs_CZ', 'africa/niger','Niger'),
('cs_CZ', 'africa/nigeria','Nigeria'),
('cs_CZ', 'africa/rwanda','Rwanda'),
('cs_CZ', 'africa/saint-helena-ascension-and-tristan-da-cunha','Saint Helena, Ascension, and Tristan da Cunha'),
('cs_CZ', 'africa/sao-tome-and-principe','Sao Tome and Principe'),
('cs_CZ', 'africa/senegal-and-gambia','Senegal and Gambia'),
('cs_CZ', 'africa/seychelles','Seychelles'),
('cs_CZ', 'africa/sierra-leone','Sierra Leone'),
('cs_CZ', 'africa/somalia','Somalia'),
('cs_CZ', 'africa/south-africa','South Africa'),
('cs_CZ', 'africa/south-africa-and-lesotho','South Africa (includes Lesotho)'),
('cs_CZ', 'africa/south-sudan','South Sudan'),
('cs_CZ', 'africa/sudan','Sudan'),
('cs_CZ', 'africa/swaziland','Swaziland'),
('cs_CZ', 'africa/tanzania','Tanzania'),
('cs_CZ', 'africa/togo','Togo'),
('cs_CZ', 'africa/tunisia','Tunisia'),
('cs_CZ', 'africa/uganda','Uganda'),
('cs_CZ', 'africa/zambia','Zambia'),
('cs_CZ', 'africa/zimbabwe','Zimbabwe');

INSERT INTO `l10n` (`locale`, `path`, `name`) VALUES
('cs_CZ', 'north-america','Severní Amerika'),
('cs_CZ', 'north-america/us','USA'),

('cs_CZ', 'north-america/canada','Kanada'),
('cs_CZ', 'north-america/greenland','Grónsko'),
('cs_CZ', 'north-america/mexico','Mexiko'),

('cs_CZ', 'north-america/us-midwest','Středozápad USA'),
('cs_CZ', 'north-america/us-northeast','Severovýchod USA'),
('cs_CZ', 'north-america/us-pacific','Pacifik, USA'),
('cs_CZ', 'north-america/us-south','Jih USA'),
('cs_CZ', 'north-america/us-west','Západ USA'),


('cs_CZ', 'north-america/us/alaska','Alaska'),
('cs_CZ', 'north-america/us/alabama','Alabama'),
('cs_CZ', 'north-america/us/arizona','Arizona'),
('cs_CZ', 'north-america/us/arkansas','Arkansas'),
('cs_CZ', 'north-america/us/california','California'),
('cs_CZ', 'north-america/us/colorado','Colorado'),
('cs_CZ', 'north-america/us/connecticut','Connecticut'),
('cs_CZ', 'north-america/us/delaware','Delaware'),
('cs_CZ', 'north-america/us/district-of-columbia','District-of-columbia'),
('cs_CZ', 'north-america/us/florida','Florida'),
('cs_CZ', 'north-america/us/georgia','Georgia'),
('cs_CZ', 'north-america/us/hawaii','Hawaii'),
('cs_CZ', 'north-america/us/idaho','Idaho'),
('cs_CZ', 'north-america/us/illinois','Illinois'),
('cs_CZ', 'north-america/us/indiana','Indiana'),
('cs_CZ', 'north-america/us/iowa','Iowa'),
('cs_CZ', 'north-america/us/kansas','Kansas'),
('cs_CZ', 'north-america/us/kentucky','Kentucky'),
('cs_CZ', 'north-america/us/louisiana','Louisiana'),
('cs_CZ', 'north-america/us/maine','Maine'),
('cs_CZ', 'north-america/us/maryland','Maryland'),
('cs_CZ', 'north-america/us/massachusetts','Massachusetts'),
('cs_CZ', 'north-america/us/michigan','Michigan'),
('cs_CZ', 'north-america/us/minnesota','Minnesota'),
('cs_CZ', 'north-america/us/mississippi','Mississippi'),
('cs_CZ', 'north-america/us/missouri','Missouri'),
('cs_CZ', 'north-america/us/montana','Montana'),
('cs_CZ', 'north-america/us/nebraska','Nebraska'),
('cs_CZ', 'north-america/us/nevada','Nevada'),
('cs_CZ', 'north-america/us/new-hampshire','New-hampshire'),
('cs_CZ', 'north-america/us/new-jersey','New-jersey'),
('cs_CZ', 'north-america/us/new-mexico','New-mexico'),
('cs_CZ', 'north-america/us/new-york','New-york'),
('cs_CZ', 'north-america/us/north-carolina','North-carolina'),
('cs_CZ', 'north-america/us/north-dakota','North-dakota'),
('cs_CZ', 'north-america/us/ohio','Ohio'),
('cs_CZ', 'north-america/us/oklahoma','Oklahoma'),
('cs_CZ', 'north-america/us/oregon','Oregon'),
('cs_CZ', 'north-america/us/pennsylvania','Pennsylvania'),
('cs_CZ', 'north-america/us/rhode-island','Rhode Island'),
('cs_CZ', 'north-america/us/south-carolina','South Carolina'),
('cs_CZ', 'north-america/us/south-dakota','South Dakota'),
('cs_CZ', 'north-america/us/tennessee','Tennessee'),
('cs_CZ', 'north-america/us/texas','Texas'),
('cs_CZ', 'north-america/us/utah','Utah'),
('cs_CZ', 'north-america/us/vermont','Vermont'),
('cs_CZ', 'north-america/us/virginia','Virginia'),
('cs_CZ', 'north-america/us/washington','Washington'),
('cs_CZ', 'north-america/us/west-virginia','West Virginia'),
('cs_CZ', 'north-america/us/wisconsin','Wisconsin'),
('cs_CZ', 'north-america/us/wyoming','Wyoming');


INSERT INTO `l10n` (`locale`, `path`, `name`) VALUES
('cs_CZ', 'central-america','Centrální Amerika'),
('cs_CZ', 'central-america/belize','Belize'),
('cs_CZ', 'central-america/cuba','Kuba'),
('cs_CZ', 'central-america/guatemala','Guatemala'),
('cs_CZ', 'central-america/haiti-and-domrep','Haiti a Dominikánská republika'),
('cs_CZ', 'central-america/nicaragua','Nicaragua');

INSERT INTO `l10n` (`locale`, `path`, `name`) VALUES
('cs_CZ', 'south-america','Jižní Amerika'),
('cs_CZ', 'south-america/argentina','Argentina'),
('cs_CZ', 'south-america/bolivia','Bolivia'),
('cs_CZ', 'south-america/brazil','Brazil'),
('cs_CZ', 'south-america/chile','Chile'),
('cs_CZ', 'south-america/colombia','Colombia'),
('cs_CZ', 'south-america/ecuador','Ecuador'),
('cs_CZ', 'south-america/paraguay','Paraguay'),
('cs_CZ', 'south-america/peru','Peru'),
('cs_CZ', 'south-america/suriname','Suriname'),
('cs_CZ', 'south-america/uruguay','Uruguay');

INSERT INTO `l10n` (`locale`, `path`, `name`) VALUES
('cs_CZ', 'australia-oceania','Austrálie a Oceánie'),
('cs_CZ', 'australia-oceania/australia','Austrálie'),
('cs_CZ', 'australia-oceania/fiji','Fidži'),
('cs_CZ', 'australia-oceania/new-caledonia','Nová Kaledonie'),
('cs_CZ', 'australia-oceania/new-zealand','Nový Zéland');


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
