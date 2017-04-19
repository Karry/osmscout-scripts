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

DELETE FROM `l10n` WHERE `l10n`.`locale` = 'sv_SE';

INSERT INTO `l10n` (`locale`, `path`, `name`) VALUES
('sv_SE','europe', 'Europa'),
('sv_SE','europe/albania', 'Albanien'),
('sv_SE','europe/andorra', 'Andorra'),
('sv_SE','europe/austria', 'Österrike'),
('sv_SE','europe/azores', 'Azorerna'),
('sv_SE','europe/belarus', 'Vitryssland'),
('sv_SE','europe/belgium', 'Belgien'),
('sv_SE','europe/bosnia-herzegovina', 'Bosnien-Herzegovina'),
('sv_SE','europe/bulgaria', 'Bulgarien'),
('sv_SE','europe/croatia', 'Kroatien'),
('sv_SE','europe/cyprus', 'Cypern'),
('sv_SE','europe/czech-republic', 'Tjeckiska Republiken'),
('sv_SE','europe/denmark', 'Danmark'),
('sv_SE','europe/estonia', 'Estland'),
('sv_SE','europe/faroe-islands', 'Färöarna'),
('sv_SE','europe/finland', 'Finland'),
('sv_SE','europe/france', 'Frankrike'),
('sv_SE','europe/georgia', 'Georgien (Östra Europa)'),
('sv_SE','europe/germany', 'Tyskland'),
('sv_SE','europe/great-britain', 'Storbrittanien'),
('sv_SE','europe/greece', 'Grekland'),
('sv_SE','europe/hungary', 'Ungern'),
('sv_SE','europe/iceland', 'Island'),
('sv_SE','europe/ireland-and-northern-ireland', 'Irland och Nordirland'),
('sv_SE','europe/isle-of-man', 'Isle of Man'),
('sv_SE','europe/italy', 'Italien'),
('sv_SE','europe/kosovo', 'Kosovo'),
('sv_SE','europe/latvia', 'Lettland'),
('sv_SE','europe/liechtenstein', 'Liechtenstein'),
('sv_SE','europe/lithuania', 'Litauen'),
('sv_SE','europe/luxembourg', 'Luxemburg'),
('sv_SE','europe/macedonia', 'Makedonien'),
('sv_SE','europe/malta', 'Malta'),
('sv_SE','europe/moldova', 'Moldavien'),
('sv_SE','europe/monaco', 'Monaco'),
('sv_SE','europe/montenegro', 'Montenegro'),
('sv_SE','europe/netherlands', 'Nederländerna'),
('sv_SE','europe/norway', 'Norge'),
('sv_SE','europe/poland', 'Polen'),
('sv_SE','europe/portugal', 'Portugal'),
('sv_SE','europe/romania', 'Rumänien'),
('sv_SE','europe/serbia', 'Serbien'),
('sv_SE','europe/slovakia', 'Slovakien'),
('sv_SE','europe/slovenia', 'Slovenien'),
('sv_SE','europe/spain', 'Spanien'),
('sv_SE','europe/sweden', 'Sverige'),
('sv_SE','europe/switzerland', 'Schweiz'),
('sv_SE','europe/turkey', 'Turkiet'),
('sv_SE','europe/ukraine', 'Ukraina'),
('sv_SE','europe/alps', 'Alperna'),
('sv_SE','europe/british-isles', 'Brittiska öarna'),
('sv_SE','europe/dach', 'Tyskland, Österrike, Schweiz');

UPDATE `osmscout`.`l10n` SET `description` = 'Specialregion för Alperna (Tyskland, Schweiz, Österrike, Frankrike och Italien).' 
WHERE `l10n`.`locale` = 'sv' AND `l10n`.`path` = 'europe/alps';

INSERT INTO `l10n` (`locale`, `path`, `name`) VALUES
('sv_SE','russia', 'Ryssland');


INSERT INTO `l10n` (`locale`, `path`, `name`) VALUES
('sv_SE', 'asia','Asien'),
('sv_SE', 'asia/afghanistan','Afghanistan'),
('sv_SE', 'asia/azerbaijan','Azerbajdzjan'),
('sv_SE', 'asia/bangladesh','Bangladesh'),
('sv_SE', 'asia/cambodia','Kambodja'),
('sv_SE', 'asia/gcc-states','Arabstaterna (GCC)'),
('sv_SE', 'asia/china','Kina'),
('sv_SE', 'asia/india','Indien'),
('sv_SE', 'asia/indonesia','Indonesien'),
('sv_SE', 'asia/japan','Japan'),
('sv_SE', 'asia/iran','Iran'),
('sv_SE', 'asia/iraq','Irak'),
('sv_SE', 'asia/israel-and-palestine','Israel och Palestina'),
('sv_SE', 'asia/jordan','Jordanien'),
('sv_SE', 'asia/kazakhstan','Kazakstan'),
('sv_SE', 'asia/kyrgyzstan','Kirgizistan'),
('sv_SE', 'asia/lebanon','Libanon'),
('sv_SE', 'asia/malaysia-singapore-brunei','Malaysia, Singapore, Brunei'),
('sv_SE', 'asia/maldives','Maldiverna'),
('sv_SE', 'asia/mongolia','Mongoliet'),
('sv_SE', 'asia/myanmar','Myanmar (a.k.a. Burma)'),
('sv_SE', 'asia/nepal','Nepal'),
('sv_SE', 'asia/north-korea','Nordkorea'),
('sv_SE', 'asia/pakistan','Pakistan'),
('sv_SE', 'asia/philippines','Filippinerna'),
('sv_SE', 'asia/south-korea','Sydkorea'),
('sv_SE', 'asia/sri-lanka','Sri-lanka'),
('sv_SE', 'asia/syria','Syrien'),
('sv_SE', 'asia/taiwan','Taiwan'),
('sv_SE', 'asia/tajikistan','Tadzjikistan'),
('sv_SE', 'asia/thailand','Thailand'),
('sv_SE', 'asia/turkmenistan','Turkmenistan'),
('sv_SE', 'asia/uzbekistan','Uzbekistan'),
('sv_SE', 'asia/vietnam','Vietnam'),
('sv_SE', 'asia/yemen','Jemen');

UPDATE `osmscout`.`l10n` SET `description` = 'Samarbetsrådet för de arabiska gulfstaterna (Bahrain, Kuwait, Oman, Qatar, Saudiarabien och Förenade Arabemiraten).' 
WHERE `l10n`.`locale` = 'sv' AND `l10n`.`path` = 'asia/gcc-states';

INSERT INTO `l10n` (`locale`, `path`, `name`) VALUES
('sv_SE', 'africa','Afrika'),
('sv_SE', 'africa/algeria','Algeriet'),
('sv_SE', 'africa/angola','Angola'),
('sv_SE', 'africa/benin','Benin'),
('sv_SE', 'africa/botswana','Botswana'),
('sv_SE', 'africa/burkina-faso','Burkina Faso'),
('sv_SE', 'africa/cameroon','Kamerun'),
('sv_SE', 'africa/canary-islands','Kanarieöarna'),
('sv_SE', 'africa/cape-verde','Cap Verde'),
('sv_SE', 'africa/central-african-republic','Centralafrikanska republiken'),
('sv_SE', 'africa/chad','Tchad'),
('sv_SE', 'africa/comores','Komorerna'),
('sv_SE', 'africa/congo-brazzaville','Kongo-Brazzaville'),
('sv_SE', 'africa/congo-democratic-republic','Kongo-Kinshasa'),
('sv_SE', 'africa/djibouti','Djibouti'),
('sv_SE', 'africa/egypt','Egypten'),
('sv_SE', 'africa/equatorial-guinea','Ekvatorialguinea'),
('sv_SE', 'africa/eritrea','Eritrea'),
('sv_SE', 'africa/ethiopia','Etiopien'),
('sv_SE', 'africa/gabon','Gabon'),
('sv_SE', 'africa/ghana','Ghana'),
('sv_SE', 'africa/guinea','Guinea'),
('sv_SE', 'africa/guinea-bissau','Guinea-Bissau'),
('sv_SE', 'africa/ivory-coast','Elfenbenskusten'),
('sv_SE', 'africa/kenya','Kenya'),
('sv_SE', 'africa/lesotho','Lesotho'),
('sv_SE', 'africa/liberia','Liberia'),
('sv_SE', 'africa/libya','Libyen'),
('sv_SE', 'africa/madagascar','Madagaskar'),
('sv_SE', 'africa/malawi','Malawi'),
('sv_SE', 'africa/mali','Mali'),
('sv_SE', 'africa/mauritania','Mauritanien'),
('sv_SE', 'africa/mauritius','Mauritius'),
('sv_SE', 'africa/morocco','Marocko'),
('sv_SE', 'africa/mozambique','Mozambique'),
('sv_SE', 'africa/namibia','Namibia'),
('sv_SE', 'africa/niger','Niger'),
('sv_SE', 'africa/nigeria','Nigeria'),
('sv_SE', 'africa/rwanda','Rwanda'),
('sv_SE', 'africa/saint-helena-ascension-and-tristan-da-cunha','Sankt Helena, Ascension och Tristan da Cunha'),
('sv_SE', 'africa/sao-tome-and-principe','Sao Tome och Principe'),
('sv_SE', 'africa/senegal-and-gambia','Senegal och Gambia'),
('sv_SE', 'africa/seychelles','Seychellerna'),
('sv_SE', 'africa/sierra-leone','Sierra Leone'),
('sv_SE', 'africa/somalia','Somalia'),
('sv_SE', 'africa/south-africa','Sydafrika'),
('sv_SE', 'africa/south-africa-and-lesotho','Sydafrika (inkl. Lesotho)'),
('sv_SE', 'africa/south-sudan','Sydsudan'),
('sv_SE', 'africa/sudan','Sudan'),
('sv_SE', 'africa/swaziland','Swaziland'),
('sv_SE', 'africa/tanzania','Tanzania'),
('sv_SE', 'africa/togo','Togo'),
('sv_SE', 'africa/tunisia','Tunisien'),
('sv_SE', 'africa/uganda','Uganda'),
('sv_SE', 'africa/zambia','Zambia'),
('sv_SE', 'africa/zimbabwe','Zimbabwe');

INSERT INTO `l10n` (`locale`, `path`, `name`) VALUES
('sv_SE', 'north-america','Nordamerika'),
('sv_SE', 'north-america/us','USA'),

('sv_SE', 'north-america/canada','Kanada'),
('sv_SE', 'north-america/greenland','Grönland'),
('sv_SE', 'north-america/mexico','Mexiko'),

('sv_SE', 'north-america/us-midwest','USA mellanvästern'),
('sv_SE', 'north-america/us-northeast','USA nordöstra'),
('sv_SE', 'north-america/us-pacific','USA pacific'),
('sv_SE', 'north-america/us-south','USA södra'),
('sv_SE', 'north-america/us-west','USA västra'),


('sv_SE', 'north-america/us/alaska','Alaska'),
('sv_SE', 'north-america/us/alabama','Alabama'),
('sv_SE', 'north-america/us/arizona','Arizona'),
('sv_SE', 'north-america/us/arkansas','Arkansas'),
('sv_SE', 'north-america/us/california','California'),
('sv_SE', 'north-america/us/colorado','Colorado'),
('sv_SE', 'north-america/us/connecticut','Connecticut'),
('sv_SE', 'north-america/us/delaware','Delaware'),
('sv_SE', 'north-america/us/district-of-columbia','District of Columbia'),
('sv_SE', 'north-america/us/florida','Florida'),
('sv_SE', 'north-america/us/georgia','Georgia'),
('sv_SE', 'north-america/us/hawaii','Hawaii'),
('sv_SE', 'north-america/us/idaho','Idaho'),
('sv_SE', 'north-america/us/illinois','Illinois'),
('sv_SE', 'north-america/us/indiana','Indiana'),
('sv_SE', 'north-america/us/iowa','Iowa'),
('sv_SE', 'north-america/us/kansas','Kansas'),
('sv_SE', 'north-america/us/kentucky','Kentucky'),
('sv_SE', 'north-america/us/louisiana','Louisiana'),
('sv_SE', 'north-america/us/maine','Maine'),
('sv_SE', 'north-america/us/maryland','Maryland'),
('sv_SE', 'north-america/us/massachusetts','Massachusetts'),
('sv_SE', 'north-america/us/michigan','Michigan'),
('sv_SE', 'north-america/us/minnesota','Minnesota'),
('sv_SE', 'north-america/us/mississippi','Mississippi'),
('sv_SE', 'north-america/us/missouri','Missouri'),
('sv_SE', 'north-america/us/montana','Montana'),
('sv_SE', 'north-america/us/nebraska','Nebraska'),
('sv_SE', 'north-america/us/nevada','Nevada'),
('sv_SE', 'north-america/us/new-hampshire','New-hampshire'),
('sv_SE', 'north-america/us/new-jersey','New Jersey'),
('sv_SE', 'north-america/us/new-mexico','New Mexico'),
('sv_SE', 'north-america/us/new-york','New York'),
('sv_SE', 'north-america/us/north-carolina','North Carolina'),
('sv_SE', 'north-america/us/north-dakota','North Dakota'),
('sv_SE', 'north-america/us/ohio','Ohio'),
('sv_SE', 'north-america/us/oklahoma','Oklahoma'),
('sv_SE', 'north-america/us/oregon','Oregon'),
('sv_SE', 'north-america/us/pennsylvania','Pennsylvania'),
('sv_SE', 'north-america/us/rhode-island','Rhode Island'),
('sv_SE', 'north-america/us/south-carolina','South Carolina'),
('sv_SE', 'north-america/us/south-dakota','South Dakota'),
('sv_SE', 'north-america/us/tennessee','Tennessee'),
('sv_SE', 'north-america/us/texas','Texas'),
('sv_SE', 'north-america/us/utah','Utah'),
('sv_SE', 'north-america/us/vermont','Vermont'),
('sv_SE', 'north-america/us/virginia','Virginia'),
('sv_SE', 'north-america/us/washington','Washington'),
('sv_SE', 'north-america/us/west-virginia','West Virginia'),
('sv_SE', 'north-america/us/wisconsin','Wisconsin'),
('sv_SE', 'north-america/us/wyoming','Wyoming');


INSERT INTO `l10n` (`locale`, `path`, `name`) VALUES
('sv_SE', 'central-america','Centralamerika'),
('sv_SE', 'central-america/belize','Belize'),
('sv_SE', 'central-america/cuba','Kuba'),
('sv_SE', 'central-america/guatemala','Guatemala'),
('sv_SE', 'central-america/haiti-and-domrep','Haiti och Dominikanska republiken'),
('sv_SE', 'central-america/nicaragua','Nicaragua');

INSERT INTO `l10n` (`locale`, `path`, `name`) VALUES
('sv_SE', 'south-america','Sydamerika'),
('sv_SE', 'south-america/argentina','Argentina'),
('sv_SE', 'south-america/bolivia','Bolivia'),
('sv_SE', 'south-america/brazil','Brasilien'),
('sv_SE', 'south-america/chile','Chile'),
('sv_SE', 'south-america/colombia','Colombia'),
('sv_SE', 'south-america/ecuador','Ecuador'),
('sv_SE', 'south-america/paraguay','Paraguay'),
('sv_SE', 'south-america/peru','Peru'),
('sv_SE', 'south-america/suriname','Surinam'),
('sv_SE', 'south-america/uruguay','Uruguay');

INSERT INTO `l10n` (`locale`, `path`, `name`) VALUES
('sv_SE', 'australia-oceania','Australien och Oceanien'),
('sv_SE', 'australia-oceania/australia','Australien'),
('sv_SE', 'australia-oceania/fiji','Fiji'),
('sv_SE', 'australia-oceania/new-caledonia','Nya Kaledonien'),
('sv_SE', 'australia-oceania/new-zealand','Nya Zeeland');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
