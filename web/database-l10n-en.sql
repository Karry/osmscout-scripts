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

--
-- Dumping data for table `l10n`
--

DELETE FROM `l10n` WHERE `l10n`.`locale` = 'en';

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

UPDATE `osmscout`.`l10n` SET `description` = 'Special region for Alps (Germany, Switzerland, Austria, France and Italy).' 
WHERE `l10n`.`locale` = 'en' AND `l10n`.`path` = 'europe/alps';

INSERT INTO `l10n` (`locale`, `path`, `name`) VALUES
('en','russia', 'Russian Federation');


INSERT INTO `l10n` (`locale`, `path`, `name`) VALUES
('en', 'asia','Asia'),
('en', 'asia/afghanistan','Afghanistan'),
('en', 'asia/azerbaijan','Azerbaijan'),
('en', 'asia/bangladesh','Bangladesh'),
('en', 'asia/cambodia','Cambodia'),
('en', 'asia/gcc-states','Arab states (GCC)'),
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
('en', 'asia/malaysia-singapore-brunei','Malaysia, Singapore, Brunei'),
('en', 'asia/maldives','Maldives'),
('en', 'asia/mongolia','Mongolia'),
('en', 'asia/myanmar','Myanmar (a.k.a. Burma)'),
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

UPDATE `osmscout`.`l10n` SET `description` = 'Cooperation Council for the Arab States of the Gulf (Bahrain, Kuwait, Oman, Qatar, Saudi Arabia, and the United Arab Emirates).' 
WHERE `l10n`.`locale` = 'en' AND `l10n`.`path` = 'asia/gcc-states';

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
('en', 'north-america/us/district-of-columbia','District of Columbia'),
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
('en', 'north-america/us/new-jersey','New Jersey'),
('en', 'north-america/us/new-mexico','New Mexico'),
('en', 'north-america/us/new-york','New York'),
('en', 'north-america/us/north-carolina','North Carolina'),
('en', 'north-america/us/north-dakota','North Dakota'),
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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
