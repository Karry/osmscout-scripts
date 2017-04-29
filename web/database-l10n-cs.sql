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

DELETE FROM `l10n` WHERE `l10n`.`locale` = 'cs_CZ';


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

UPDATE `osmscout`.`l10n` SET `description` = 'Speciální region pro Alpy (Německo, Švýcarsko, Rakousko, Francie and Itálie).' 
WHERE `l10n`.`locale` = 'cs_CZ' AND `l10n`.`path` = 'europe/alps';

INSERT INTO `l10n` (`locale`, `path`, `name`) VALUES
('cs_CZ','russia', 'Rusko');


INSERT INTO `l10n` (`locale`, `path`, `name`) VALUES
('cs_CZ', 'asia','Asie'),
('cs_CZ', 'asia/afghanistan','Afghánistán'),
('cs_CZ', 'asia/armenia','Arménie'),
('cs_CZ', 'asia/azerbaijan','Ázerbájdžán'),
('cs_CZ', 'asia/bangladesh','Bangladéš'),
('cs_CZ', 'asia/bhutan','Bhútán'),
('cs_CZ', 'asia/cambodia','Kambodža'),
('cs_CZ', 'asia/gcc-states','Arabské státy'),
('cs_CZ', 'asia/china','Čína'),
('cs_CZ', 'asia/india','Indie'),
('cs_CZ', 'asia/indonesia','Indonésie'),
('cs_CZ', 'asia/japan','Japonsko'),
('cs_CZ', 'asia/iran','Irán'),
('cs_CZ', 'asia/iraq','Irák'),
('cs_CZ', 'asia/israel-and-palestine','Izrael a Palestina'),
('cs_CZ', 'asia/jordan','Jordán'),
('cs_CZ', 'asia/kazakhstan','Kazachstán'),
('cs_CZ', 'asia/kyrgyzstan','Kyrgyzstán'),
('cs_CZ', 'asia/laos','Laos'),
('cs_CZ', 'asia/lebanon','Libanon'),
('cs_CZ', 'asia/malaysia-singapore-brunei','Malajsie, Singapur, Brunej'),
('cs_CZ', 'asia/maldives','Maledivy'),
('cs_CZ', 'asia/mongolia','Mongolsko'),
('cs_CZ', 'asia/myanmar','Myanmar (Barma)'),
('cs_CZ', 'asia/nepal','Nepál'),
('cs_CZ', 'asia/north-korea','Severní Korea'),
('cs_CZ', 'asia/pakistan','Pákistán'),
('cs_CZ', 'asia/philippines','Filipíny'),
('cs_CZ', 'asia/south-korea','Jižní Korea'),
('cs_CZ', 'asia/sri-lanka','Srí Lanka'),
('cs_CZ', 'asia/syria','Sýrie'),
('cs_CZ', 'asia/taiwan','Taiwan'),
('cs_CZ', 'asia/tajikistan','Tádžikistán'),
('cs_CZ', 'asia/thailand','Thajsko'),
('cs_CZ', 'asia/turkmenistan','Turkmenistán'),
('cs_CZ', 'asia/uzbekistan','Uzbekistán'),
('cs_CZ', 'asia/vietnam','Vietnam'),
('cs_CZ', 'asia/yemen','Yemen');

UPDATE `osmscout`.`l10n` SET `description` = 'Unie Arabských států (Kuvajt, Saúdská Arábie, Katar, Spojené arabské emiráty, Bahrajn a Omán).' 
WHERE `l10n`.`locale` = 'cs_CZ' AND `l10n`.`path` = 'asia/gcc-states';


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
('cs_CZ', 'north-america/us/district-of-columbia','District of Columbia'),
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
('cs_CZ', 'north-america/us/new-jersey','New Jersey'),
('cs_CZ', 'north-america/us/new-mexico','New Mexico'),
('cs_CZ', 'north-america/us/new-york','New York'),
('cs_CZ', 'north-america/us/north-carolina','North Carolina'),
('cs_CZ', 'north-america/us/north-dakota','North Dakota'),
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
