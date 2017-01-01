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

DELETE FROM `l10n` WHERE `l10n`.`locale` = 'sv';

INSERT INTO `l10n` (`locale`, `path`, `name`) VALUES
('sv','europe', 'Europa'),
('sv','europe/albania', 'Albanien'),
('sv','europe/andorra', 'Andorra'),
('sv','europe/austria', 'Österrike'),
('sv','europe/azores', 'Azorerna'),
('sv','europe/belarus', 'Vitryssland'),
('sv','europe/belgium', 'Belgien'),
('sv','europe/bosnia-herzegovina', 'Bosnien-Herzegovina'),
('sv','europe/bulgaria', 'Bulgarien'),
('sv','europe/croatia', 'Kroatien'),
('sv','europe/cyprus', 'Cypern'),
('sv','europe/czech-republic', 'Tjeckiska Republiken'),
('sv','europe/denmark', 'Danmark'),
('sv','europe/estonia', 'Estland'),
('sv','europe/faroe-islands', 'Färöarna'),
('sv','europe/finland', 'Finland'),
('sv','europe/france', 'Frankrike'),
('sv','europe/georgia', 'Georgien (Östra Europa)'),
('sv','europe/germany', 'Tyskland'),
('sv','europe/great-britain', 'Storbrittanien'),
('sv','europe/greece', 'Grekland'),
('sv','europe/hungary', 'Ungern'),
('sv','europe/iceland', 'Island'),
('sv','europe/ireland-and-northern-ireland', 'Irland och Nordirland'),
('sv','europe/isle-of-man', 'Isle of Man'),
('sv','europe/italy', 'Italien'),
('sv','europe/kosovo', 'Kosovo'),
('sv','europe/latvia', 'Lettland'),
('sv','europe/liechtenstein', 'Liechtenstein'),
('sv','europe/lithuania', 'Litauen'),
('sv','europe/luxembourg', 'Luxemburg'),
('sv','europe/macedonia', 'Makedonien'),
('sv','europe/malta', 'Malta'),
('sv','europe/moldova', 'Moldavien'),
('sv','europe/monaco', 'Monaco'),
('sv','europe/montenegro', 'Montenegro'),
('sv','europe/netherlands', 'Nederländerna'),
('sv','europe/norway', 'Norge'),
('sv','europe/poland', 'Polen'),
('sv','europe/portugal', 'Portugal'),
('sv','europe/romania', 'Rumänien'),
('sv','europe/serbia', 'Serbien'),
('sv','europe/slovakia', 'Slovakien'),
('sv','europe/slovenia', 'Slovenien'),
('sv','europe/spain', 'Spanien'),
('sv','europe/sweden', 'Sverige'),
('sv','europe/switzerland', 'Schweiz'),
('sv','europe/turkey', 'Turkiet'),
('sv','europe/ukraine', 'Ukraina'),
('sv','europe/alps', 'Alperna'),
('sv','europe/british-isles', 'Brittiska öarna'),
('sv','europe/dach', 'Tyskland, Österrike, Schweiz');

UPDATE `osmscout`.`l10n` SET `description` = 'Specialregion för Alperna (Tyskland, Schweiz, Österrike, Frankrike och Italien).' 
WHERE `l10n`.`locale` = 'sv' AND `l10n`.`path` = 'europe/alps';

INSERT INTO `l10n` (`locale`, `path`, `name`) VALUES
('sv','russia', 'Ryssland');


INSERT INTO `l10n` (`locale`, `path`, `name`) VALUES
('sv', 'asia','Asien'),
('sv', 'asia/afghanistan','Afghanistan'),
('sv', 'asia/azerbaijan','Azerbajdzjan'),
('sv', 'asia/bangladesh','Bangladesh'),
('sv', 'asia/cambodia','Kambodja'),
('sv', 'asia/gcc-states','Arabstaterna (GCC)'),
('sv', 'asia/china','Kina'),
('sv', 'asia/india','Indien'),
('sv', 'asia/indonesia','Indonesien'),
('sv', 'asia/japan','Japan'),
('sv', 'asia/iran','Iran'),
('sv', 'asia/iraq','Irak'),
('sv', 'asia/israel-and-palestine','Israel och Palestina'),
('sv', 'asia/jordan','Jordanien'),
('sv', 'asia/kazakhstan','Kazakstan'),
('sv', 'asia/kyrgyzstan','Kirgizistan'),
('sv', 'asia/lebanon','Libanon'),
('sv', 'asia/malaysia-singapore-brunei','Malaysia, Singapore, Brunei'),
('sv', 'asia/maldives','Maldiverna'),
('sv', 'asia/mongolia','Mongoliet'),
('sv', 'asia/nepal','Nepal'),
('sv', 'asia/north-korea','Nordkorea'),
('sv', 'asia/pakistan','Pakistan'),
('sv', 'asia/philippines','Filippinerna'),
('sv', 'asia/south-korea','Sydkorea'),
('sv', 'asia/sri-lanka','Sri-lanka'),
('sv', 'asia/syria','Syrien'),
('sv', 'asia/taiwan','Taiwan'),
('sv', 'asia/tajikistan','Tadzjikistan'),
('sv', 'asia/thailand','Thailand'),
('sv', 'asia/turkmenistan','Turkmenistan'),
('sv', 'asia/uzbekistan','Uzbekistan'),
('sv', 'asia/vietnam','Vietnam'),
('sv', 'asia/yemen','Jemen');

UPDATE `osmscout`.`l10n` SET `description` = 'Samarbetsrådet för de arabiska gulfstaterna (Bahrain, Kuwait, Oman, Qatar, Saudiarabien och Förenade Arabemiraten).' 
WHERE `l10n`.`locale` = 'sv' AND `l10n`.`path` = 'asia/gcc-states';

INSERT INTO `l10n` (`locale`, `path`, `name`) VALUES
('sv', 'africa','Afrika'),
('sv', 'africa/algeria','Algeriet'),
('sv', 'africa/angola','Angola'),
('sv', 'africa/benin','Benin'),
('sv', 'africa/botswana','Botswana'),
('sv', 'africa/burkina-faso','Burkina Faso'),
('sv', 'africa/cameroon','Kamerun'),
('sv', 'africa/canary-islands','Kanarieöarna'),
('sv', 'africa/cape-verde','Cap Verde'),
('sv', 'africa/central-african-republic','Centralafrikanska republiken'),
('sv', 'africa/chad','Tchad'),
('sv', 'africa/comores','Komorerna'),
('sv', 'africa/congo-brazzaville','Kongo-Brazzaville'),
('sv', 'africa/congo-democratic-republic','Kongo-Kinshasa'),
('sv', 'africa/djibouti','Djibouti'),
('sv', 'africa/egypt','Egypten'),
('sv', 'africa/equatorial-guinea','Ekvatorialguinea'),
('sv', 'africa/eritrea','Eritrea'),
('sv', 'africa/ethiopia','Etiopien'),
('sv', 'africa/gabon','Gabon'),
('sv', 'africa/ghana','Ghana'),
('sv', 'africa/guinea','Guinea'),
('sv', 'africa/guinea-bissau','Guinea-Bissau'),
('sv', 'africa/ivory-coast','Elfenbenskusten'),
('sv', 'africa/kenya','Kenya'),
('sv', 'africa/lesotho','Lesotho'),
('sv', 'africa/liberia','Liberia'),
('sv', 'africa/libya','Libyen'),
('sv', 'africa/madagascar','Madagaskar'),
('sv', 'africa/malawi','Malawi'),
('sv', 'africa/mali','Mali'),
('sv', 'africa/mauritania','Mauritanien'),
('sv', 'africa/mauritius','Mauritius'),
('sv', 'africa/morocco','Marocko'),
('sv', 'africa/mozambique','Mozambique'),
('sv', 'africa/namibia','Namibia'),
('sv', 'africa/niger','Niger'),
('sv', 'africa/nigeria','Nigeria'),
('sv', 'africa/rwanda','Rwanda'),
('sv', 'africa/saint-helena-ascension-and-tristan-da-cunha','Sankt Helena, Ascension och Tristan da Cunha'),
('sv', 'africa/sao-tome-and-principe','Sao Tome och Principe'),
('sv', 'africa/senegal-and-gambia','Senegal och Gambia'),
('sv', 'africa/seychelles','Seychellerna'),
('sv', 'africa/sierra-leone','Sierra Leone'),
('sv', 'africa/somalia','Somalia'),
('sv', 'africa/south-africa','Sydafrika'),
('sv', 'africa/south-africa-and-lesotho','Sydafrika (inkl. Lesotho)'),
('sv', 'africa/south-sudan','Sydsudan'),
('sv', 'africa/sudan','Sudan'),
('sv', 'africa/swaziland','Swaziland'),
('sv', 'africa/tanzania','Tanzania'),
('sv', 'africa/togo','Togo'),
('sv', 'africa/tunisia','Tunisien'),
('sv', 'africa/uganda','Uganda'),
('sv', 'africa/zambia','Zambia'),
('sv', 'africa/zimbabwe','Zimbabwe');

INSERT INTO `l10n` (`locale`, `path`, `name`) VALUES
('sv', 'north-america','Nordamerika'),
('sv', 'north-america/us','USA'),

('sv', 'north-america/canada','Kanada'),
('sv', 'north-america/greenland','Grönland'),
('sv', 'north-america/mexico','Mexiko'),

('sv', 'north-america/us-midwest','USA mellanvästern'),
('sv', 'north-america/us-northeast','USA nordöstra'),
('sv', 'north-america/us-pacific','USA pacific'),
('sv', 'north-america/us-south','USA södra'),
('sv', 'north-america/us-west','USA västra'),


('sv', 'north-america/us/alaska','Alaska'),
('sv', 'north-america/us/alabama','Alabama'),
('sv', 'north-america/us/arizona','Arizona'),
('sv', 'north-america/us/arkansas','Arkansas'),
('sv', 'north-america/us/california','California'),
('sv', 'north-america/us/colorado','Colorado'),
('sv', 'north-america/us/connecticut','Connecticut'),
('sv', 'north-america/us/delaware','Delaware'),
('sv', 'north-america/us/district-of-columbia','District of Columbia'),
('sv', 'north-america/us/florida','Florida'),
('sv', 'north-america/us/georgia','Georgia'),
('sv', 'north-america/us/hawaii','Hawaii'),
('sv', 'north-america/us/idaho','Idaho'),
('sv', 'north-america/us/illinois','Illinois'),
('sv', 'north-america/us/indiana','Indiana'),
('sv', 'north-america/us/iowa','Iowa'),
('sv', 'north-america/us/kansas','Kansas'),
('sv', 'north-america/us/kentucky','Kentucky'),
('sv', 'north-america/us/louisiana','Louisiana'),
('sv', 'north-america/us/maine','Maine'),
('sv', 'north-america/us/maryland','Maryland'),
('sv', 'north-america/us/massachusetts','Massachusetts'),
('sv', 'north-america/us/michigan','Michigan'),
('sv', 'north-america/us/minnesota','Minnesota'),
('sv', 'north-america/us/mississippi','Mississippi'),
('sv', 'north-america/us/missouri','Missouri'),
('sv', 'north-america/us/montana','Montana'),
('sv', 'north-america/us/nebraska','Nebraska'),
('sv', 'north-america/us/nevada','Nevada'),
('sv', 'north-america/us/new-hampshire','New-hampshire'),
('sv', 'north-america/us/new-jersey','New Jersey'),
('sv', 'north-america/us/new-mexico','New Mexico'),
('sv', 'north-america/us/new-york','New York'),
('sv', 'north-america/us/north-carolina','North Carolina'),
('sv', 'north-america/us/north-dakota','North Dakota'),
('sv', 'north-america/us/ohio','Ohio'),
('sv', 'north-america/us/oklahoma','Oklahoma'),
('sv', 'north-america/us/oregon','Oregon'),
('sv', 'north-america/us/pennsylvania','Pennsylvania'),
('sv', 'north-america/us/rhode-island','Rhode Island'),
('sv', 'north-america/us/south-carolina','South Carolina'),
('sv', 'north-america/us/south-dakota','South Dakota'),
('sv', 'north-america/us/tennessee','Tennessee'),
('sv', 'north-america/us/texas','Texas'),
('sv', 'north-america/us/utah','Utah'),
('sv', 'north-america/us/vermont','Vermont'),
('sv', 'north-america/us/virginia','Virginia'),
('sv', 'north-america/us/washington','Washington'),
('sv', 'north-america/us/west-virginia','West Virginia'),
('sv', 'north-america/us/wisconsin','Wisconsin'),
('sv', 'north-america/us/wyoming','Wyoming');


INSERT INTO `l10n` (`locale`, `path`, `name`) VALUES
('sv', 'central-america','Centralamerika'),
('sv', 'central-america/belize','Belize'),
('sv', 'central-america/cuba','Kuba'),
('sv', 'central-america/guatemala','Guatemala'),
('sv', 'central-america/haiti-and-domrep','Haiti och Dominikanska republiken'),
('sv', 'central-america/nicaragua','Nicaragua');

INSERT INTO `l10n` (`locale`, `path`, `name`) VALUES
('sv', 'south-america','Sydamerika'),
('sv', 'south-america/argentina','Argentina'),
('sv', 'south-america/bolivia','Bolivia'),
('sv', 'south-america/brazil','Brasilien'),
('sv', 'south-america/chile','Chile'),
('sv', 'south-america/colombia','Colombia'),
('sv', 'south-america/ecuador','Ecuador'),
('sv', 'south-america/paraguay','Paraguay'),
('sv', 'south-america/peru','Peru'),
('sv', 'south-america/suriname','Surinam'),
('sv', 'south-america/uruguay','Uruguay');

INSERT INTO `l10n` (`locale`, `path`, `name`) VALUES
('sv', 'australia-oceania','Australien och Oceanien'),
('sv', 'australia-oceania/australia','Australien'),
('sv', 'australia-oceania/fiji','Fiji'),
('sv', 'australia-oceania/new-caledonia','Nya Kaledonien'),
('sv', 'australia-oceania/new-zealand','Nya Zeeland');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
