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

DELETE FROM `l10n` WHERE `l10n`.`locale` = 'nb';

INSERT INTO `l10n` (`locale`, `path`, `name`) VALUES
('nb_NO','europe', 'Europa'),
('nb_NO','europe/albania', 'Albania'),
('nb_NO','europe/andorra', 'Andorra'),
('nb_NO','europe/austria', 'Østerrike'),
('nb_NO','europe/azores', 'Azorene'),
('nb_NO','europe/belarus', 'Hviterussland'),
('nb_NO','europe/belgium', 'Belgia'),
('nb_NO','europe/bosnia-herzegovina', 'Bosnia-Herzegovina'),
('nb_NO','europe/bulgaria', 'Bulgaria'),
('nb_NO','europe/croatia', 'Kroatia'),
('nb_NO','europe/cyprus', 'Kypros'),
('nb_NO','europe/czech-republic', 'Tjekkia'),
('nb_NO','europe/denmark', 'Danmark'),
('nb_NO','europe/estonia', 'Estland'),
('nb_NO','europe/faroe-islands', 'Færøyene'),
('nb_NO','europe/finland', 'Finland'),
('nb_NO','europe/france', 'Frankrike'),
('nb_NO','europe/georgia', 'Georgia'),
('nb_NO','europe/germany', 'Tyskland'),
('nb_NO','europe/great-britain', 'Storbritania'),
('nb_NO','europe/greece', 'Hellas'),
('nb_NO','europe/hungary', 'Ungarn'),
('nb_NO','europe/iceland', 'Island'),
('nb_NO','europe/ireland-and-northern-ireland', 'Irland og Nord-Irland'),
('nb_NO','europe/isle-of-man', 'Isle of Man'),
('nb_NO','europe/italy', 'Italia'),
('nb_NO','europe/kosovo', 'Kosovo'),
('nb_NO','europe/latvia', 'Latvia'),
('nb_NO','europe/liechtenstein', 'Liechtenstein'),
('nb_NO','europe/lithuania', 'Litauen'),
('nb_NO','europe/luxembourg', 'Luxembourg'),
('nb_NO','europe/macedonia', 'Makedonia'),
('nb_NO','europe/malta', 'Malta'),
('nb_NO','europe/moldova', 'Moldova'),
('nb_NO','europe/monaco', 'Monaco'),
('nb_NO','europe/montenegro', 'Montenegro'),
('nb_NO','europe/netherlands', 'Nederland'),
('nb_NO','europe/norway', 'Norge'),
('nb_NO','europe/poland', 'Polen'),
('nb_NO','europe/portugal', 'Portugal'),
('nb_NO','europe/romania', 'Romania'),
('nb_NO','europe/serbia', 'Serbia'),
('nb_NO','europe/slovakia', 'Slovakia'),
('nb_NO','europe/slovenia', 'Slovenia'),
('nb_NO','europe/spain', 'Spania'),
('nb_NO','europe/sweden', 'Sverige'),
('nb_NO','europe/switzerland', 'Sveits'),
('nb_NO','europe/turkey', 'Tyrkia'),
('nb_NO','europe/ukraine', 'Ukraina'),
('nb_NO','europe/alps', 'Alpene'),
('nb_NO','europe/british-isles', 'Britiske øyer'),
('nb_NO','europe/dach', 'Tyskland, Østerrike, Sveits');

UPDATE `osmscout`.`l10n` SET `description` = 'Spesialregion for alpene (Tyskland, Sveits, Østerrike, Frankrike og Italia)' 
WHERE `l10n`.`locale` = 'nb_NO' AND `l10n`.`path` = 'europe/alps';

INSERT INTO `l10n` (`locale`, `path`, `name`) VALUES
('nb_NO','russia', 'Russland');


INSERT INTO `l10n` (`locale`, `path`, `name`) VALUES
('nb_NO', 'asia','Asia'),
('nb_NO', 'asia/afghanistan','Afghanistan'),
('nb_NO', 'asia/azerbaijan','Azerbaijan'),
('nb_NO', 'asia/bangladesh','Bangladesh'),
('nb_NO', 'asia/cambodia','Kambodsja'),
('nb_NO', 'asia/gcc-states','Arabiske stater (GCC)'),
('nb_NO', 'asia/china','Kina'),
('nb_NO', 'asia/india','India'),
('nb_NO', 'asia/indonesia','Indonesia'),
('nb_NO', 'asia/japan','Japan'),
('nb_NO', 'asia/iran','Iran'),
('nb_NO', 'asia/iraq','Irak'),
('nb_NO', 'asia/israel-and-palestine','Israel og Palestina'),
('nb_NO', 'asia/jordan','Jordan'),
('nb_NO', 'asia/kazakhstan','Kasakhstan'),
('nb_NO', 'asia/kyrgyzstan','Kirgisistan'),
('nb_NO', 'asia/lebanon','Libanon'),
('nb_NO', 'asia/malaysia-singapore-brunei','Malaysia, Singapore, Brunei'),
('nb_NO', 'asia/maldives','Maldivene'),
('nb_NO', 'asia/mongolia','Mongolia'),
('nb_NO', 'asia/nepal','Nepal'),
('nb_NO', 'asia/north-korea','Nord-Korea'),
('nb_NO', 'asia/pakistan','Pakistan'),
('nb_NO', 'asia/philippines','Filipinene'),
('nb_NO', 'asia/south-korea','Sør-Korea'),
('nb_NO', 'asia/sri-lanka','Sri-lanka'),
('nb_NO', 'asia/syria','Syria'),
('nb_NO', 'asia/taiwan','Taiwan'),
('nb_NO', 'asia/tajikistan','Tajikistan'),
('nb_NO', 'asia/thailand','Thailand'),
('nb_NO', 'asia/turkmenistan','Turkmenistan'),
('nb_NO', 'asia/uzbekistan','Uzbekistan'),
('nb_NO', 'asia/vietnam','Vietnam'),
('nb_NO', 'asia/yemen','Jemen');

UPDATE `osmscout`.`l10n` SET `description` = 'Samarbeidene råd for de Aribiske statene i gulfen (Bahrain, Kuwait, Oman, Qatar, Saudi-Arabia og De forente arabiske emirater' 
WHERE `l10n`.`locale` = 'nb_NO' AND `l10n`.`path` = 'asia/gcc-states';

INSERT INTO `l10n` (`locale`, `path`, `name`) VALUES
('nb_NO', 'africa','Afrika'),
('nb_NO', 'africa/algeria','Algeri'),
('nb_NO', 'africa/angola','Angola'),
('nb_NO', 'africa/benin','Benin'),
('nb_NO', 'africa/botswana','Botswana'),
('nb_NO', 'africa/burkina-faso','Burkina Faso'),
('nb_NO', 'africa/cameroon','Kamerun'),
('nb_NO', 'africa/canary-islands','Kanariøyene'),
('nb_NO', 'africa/cape-verde','Kapp Verde'),
('nb_NO', 'africa/central-african-republic','Den sentralafrikanske republikk'),
('nb_NO', 'africa/chad','Tsjad'),
('nb_NO', 'africa/comores','Komorone'),
('nb_NO', 'africa/congo-brazzaville','Kongo (Republikk/Brazzaville)'),
('nb_NO', 'africa/congo-democratic-republic','Kongo (Demokratisk Republikk/Kinshasa)'),
('nb_NO', 'africa/djibouti','Djibouti'),
('nb_NO', 'africa/egypt','Egypt'),
('nb_NO', 'africa/equatorial-guinea','Ekvatorial-Guinea'),
('nb_NO', 'africa/eritrea','Eritrea'),
('nb_NO', 'africa/ethiopia','Etiopia'),
('nb_NO', 'africa/gabon','Gabon'),
('nb_NO', 'africa/ghana','Ghana'),
('nb_NO', 'africa/guinea','Guinea'),
('nb_NO', 'africa/guinea-bissau','Guinea-Bissau'),
('nb_NO', 'africa/ivory-coast','Elfenbenkysten'),
('nb_NO', 'africa/kenya','Kenya'),
('nb_NO', 'africa/lesotho','Lesotho'),
('nb_NO', 'africa/liberia','Liberia'),
('nb_NO', 'africa/libya','Libya'),
('nb_NO', 'africa/madagascar','Madagaskar'),
('nb_NO', 'africa/malawi','Malawi'),
('nb_NO', 'africa/mali','Mali'),
('nb_NO', 'africa/mauritania','Mauritania'),
('nb_NO', 'africa/mauritius','Mauritius'),
('nb_NO', 'africa/morocco','Marokko'),
('nb_NO', 'africa/mozambique','Mosambik'),
('nb_NO', 'africa/namibia','Namibia'),
('nb_NO', 'africa/niger','Niger'),
('nb_NO', 'africa/nigeria','Nigeria'),
('nb_NO', 'africa/rwanda','Rwanda'),
('nb_NO', 'africa/saint-helena-ascension-and-tristan-da-cunha','Saint Helena, Ascension, og Tristan da Cunha'),
('nb_NO', 'africa/sao-tome-and-principe','Sao Tome og Principe'),
('nb_NO', 'africa/senegal-and-gambia','Senegal og Gambia'),
('nb_NO', 'africa/seychelles','Seychellene'),
('nb_NO', 'africa/sierra-leone','Sierra Leone'),
('nb_NO', 'africa/somalia','Somalia'),
('nb_NO', 'africa/south-africa','Sør-Afrika'),
('nb_NO', 'africa/south-africa-and-lesotho','Sør-Afrika (inkluderer Lesotho)'),
('nb_NO', 'africa/south-sudan','Sør-Sudan'),
('nb_NO', 'africa/sudan','Sudan'),
('nb_NO', 'africa/swaziland','Swaziland'),
('nb_NO', 'africa/tanzania','Tanzania'),
('nb_NO', 'africa/togo','Togo'),
('nb_NO', 'africa/tunisia','Tunisia'),
('nb_NO', 'africa/uganda','Uganda'),
('nb_NO', 'africa/zambia','Zambia'),
('nb_NO', 'africa/zimbabwe','Zimbabwe');

INSERT INTO `l10n` (`locale`, `path`, `name`) VALUES
('nb_NO', 'north-america','Nord-Amerika'),
('nb_NO', 'north-america/us','USA'),

('nb_NO', 'north-america/canada','Canada'),
('nb_NO', 'north-america/greenland','Grønland'),
('nb_NO', 'north-america/mexico','Mexico'),

('nb_NO', 'north-america/us-midwest','USA midtvesten'),
('nb_NO', 'north-america/us-northeast','USA nordøst'),
('nb_NO', 'north-america/us-pacific','USA stillehavskysten'),
('nb_NO', 'north-america/us-south','USA sør'),
('nb_NO', 'north-america/us-west','USA vest'),


('nb_NO', 'north-america/us/alaska','Alaska'),
('nb_NO', 'north-america/us/alabama','Alabama'),
('nb_NO', 'north-america/us/arizona','Arizona'),
('nb_NO', 'north-america/us/arkansas','Arkansas'),
('nb_NO', 'north-america/us/california','California'),
('nb_NO', 'north-america/us/colorado','Colorado'),
('nb_NO', 'north-america/us/connecticut','Connecticut'),
('nb_NO', 'north-america/us/delaware','Delaware'),
('nb_NO', 'north-america/us/district-of-columbia','District of Columbia'),
('nb_NO', 'north-america/us/florida','Florida'),
('nb_NO', 'north-america/us/georgia','Georgia'),
('nb_NO', 'north-america/us/hawaii','Hawaii'),
('nb_NO', 'north-america/us/idaho','Idaho'),
('nb_NO', 'north-america/us/illinois','Illinois'),
('nb_NO', 'north-america/us/indiana','Indiana'),
('nb_NO', 'north-america/us/iowa','Iowa'),
('nb_NO', 'north-america/us/kansas','Kansas'),
('nb_NO', 'north-america/us/kentucky','Kentucky'),
('nb_NO', 'north-america/us/louisiana','Louisiana'),
('nb_NO', 'north-america/us/maine','Maine'),
('nb_NO', 'north-america/us/maryland','Maryland'),
('nb_NO', 'north-america/us/massachusetts','Massachusetts'),
('nb_NO', 'north-america/us/michigan','Michigan'),
('nb_NO', 'north-america/us/minnesota','Minnesota'),
('nb_NO', 'north-america/us/mississippi','Mississippi'),
('nb_NO', 'north-america/us/missouri','Missouri'),
('nb_NO', 'north-america/us/montana','Montana'),
('nb_NO', 'north-america/us/nebraska','Nebraska'),
('nb_NO', 'north-america/us/nevada','Nevada'),
('nb_NO', 'north-america/us/new-hampshire','New-hampshire'),
('nb_NO', 'north-america/us/new-jersey','New Jersey'),
('nb_NO', 'north-america/us/new-mexico','New Mexico'),
('nb_NO', 'north-america/us/new-york','New York'),
('nb_NO', 'north-america/us/north-carolina','North Carolina'),
('nb_NO', 'north-america/us/north-dakota','North Dakota'),
('nb_NO', 'north-america/us/ohio','Ohio'),
('nb_NO', 'north-america/us/oklahoma','Oklahoma'),
('nb_NO', 'north-america/us/oregon','Oregon'),
('nb_NO', 'north-america/us/pennsylvania','Pennsylvania'),
('nb_NO', 'north-america/us/rhode-island','Rhode Island'),
('nb_NO', 'north-america/us/south-carolina','South Carolina'),
('nb_NO', 'north-america/us/south-dakota','South Dakota'),
('nb_NO', 'north-america/us/tennessee','Tennessee'),
('nb_NO', 'north-america/us/texas','Texas'),
('nb_NO', 'north-america/us/utah','Utah'),
('nb_NO', 'north-america/us/vermont','Vermont'),
('nb_NO', 'north-america/us/virginia','Virginia'),
('nb_NO', 'north-america/us/washington','Washington'),
('nb_NO', 'north-america/us/west-virginia','West Virginia'),
('nb_NO', 'north-america/us/wisconsin','Wisconsin'),
('nb_NO', 'north-america/us/wyoming','Wyoming');


INSERT INTO `l10n` (`locale`, `path`, `name`) VALUES
('nb_NO', 'central-america','Sentral-Amerika'),
('nb_NO', 'central-america/belize','Belize'),
('nb_NO', 'central-america/cuba','Cuba'),
('nb_NO', 'central-america/guatemala','Guatemala'),
('nb_NO', 'central-america/haiti-and-domrep','Haiti og Dominikanske Republikk'),
('nb_NO', 'central-america/nicaragua','Nicaragua');

INSERT INTO `l10n` (`locale`, `path`, `name`) VALUES
('nb_NO', 'south-america','Sør-Amerika'),
('nb_NO', 'south-america/argentina','Argentina'),
('nb_NO', 'south-america/bolivia','Bolivia'),
('nb_NO', 'south-america/brazil','Brazil'),
('nb_NO', 'south-america/chile','Chile'),
('nb_NO', 'south-america/colombia','Colombia'),
('nb_NO', 'south-america/ecuador','Ecuador'),
('nb_NO', 'south-america/paraguay','Paraguay'),
('nb_NO', 'south-america/peru','Peru'),
('nb_NO', 'south-america/suriname','Suriname'),
('nb_NO', 'south-america/uruguay','Uruguay');

INSERT INTO `l10n` (`locale`, `path`, `name`) VALUES
('nb_NO', 'australia-oceania','Australia og Oceania'),
('nb_NO', 'australia-oceania/australia','Australia'),
('nb_NO', 'australia-oceania/fiji','Fiji'),
('nb_NO', 'australia-oceania/new-caledonia','New Caledonia'),
('nb_NO', 'australia-oceania/new-zealand','New Zealand');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
