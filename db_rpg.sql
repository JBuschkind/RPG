-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 17. Mai 2018 um 18:52
-- Server-Version: 10.1.31-MariaDB
-- PHP-Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `db_rpg`
--
CREATE DATABASE IF NOT EXISTS `db_rpg` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `db_rpg`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `beruf`
--

CREATE TABLE `beruf` (
  `ID` int(11) NOT NULL,
  `Beruf` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `beruf`
--

INSERT INTO `beruf` (`ID`, `Beruf`) VALUES
(1, 'Schmied'),
(2, 'Gerber'),
(3, 'Schneider');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `citys`
--

CREATE TABLE `citys` (
  `ID` int(11) NOT NULL,
  `City` text NOT NULL,
  `x-coordinate` int(11) NOT NULL,
  `y-coordinate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `citys`
--

INSERT INTO `citys` (`ID`, `City`, `x-coordinate`, `y-coordinate`) VALUES
(1, 'An_unnamed_Village', 4, 4),
(2, 'Gwendoll', 44, 36),
(3, 'Bijou_Hills', 39, 19),
(4, 'Riverside', 44, 53),
(5, 'Mauldin', 94, 13),
(6, 'Arcanum', 78, 64),
(7, 'Rumford', 39, 21),
(8, 'Lakeview', 53, 50),
(9, 'Heart_of_Darkness', 113, 64),
(10, 'Eastwood', 78, 34),
(11, 'coaltown', 20, 51),
(12, 'diamond_heights', 6, 58),
(13, 'Allean', 63, 12),
(14, 'Ornemel', 79, 23),
(15, 'Arkal', 86, 48),
(16, 'Zurumuz', 101, 54);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `commands`
--

CREATE TABLE `commands` (
  `ID` int(11) NOT NULL,
  `command` text NOT NULL,
  `fall` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `commands`
--

INSERT INTO `commands` (`ID`, `command`, `fall`) VALUES
(1, 'TravelTo', 'city');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `enemys`
--

CREATE TABLE `enemys` (
  `ID` int(11) NOT NULL,
  `Gegner` text NOT NULL,
  `ab_lvl` int(11) NOT NULL,
  `health` int(11) NOT NULL DEFAULT '20',
  `F_enemy_type` int(11) NOT NULL,
  `F_group` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `enemys`
--

INSERT INTO `enemys` (`ID`, `Gegner`, `ab_lvl`, `health`, `F_enemy_type`, `F_group`) VALUES
(1, 'Slime', 1, 20, 8, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `enemy_attack`
--

CREATE TABLE `enemy_attack` (
  `ID` int(11) NOT NULL,
  `Angriff` text NOT NULL,
  `Schaden` int(11) NOT NULL DEFAULT '10',
  `F_enemys` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `enemy_attack`
--

INSERT INTO `enemy_attack` (`ID`, `Angriff`, `Schaden`, `F_enemys`) VALUES
(1, 'Tackel', 10, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `enemy_textlines`
--

CREATE TABLE `enemy_textlines` (
  `ID` int(11) NOT NULL,
  `F_entitys` int(11) NOT NULL,
  `Line` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `enemy_textlines`
--

INSERT INTO `enemy_textlines` (`ID`, `F_entitys`, `Line`) VALUES
(1, 1, 'Gib mir');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `enemy_type`
--

CREATE TABLE `enemy_type` (
  `ID` int(11) NOT NULL,
  `Typ` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `enemy_type`
--

INSERT INTO `enemy_type` (`ID`, `Typ`) VALUES
(1, 'Wasser'),
(2, 'Feuer'),
(3, 'Gestein'),
(4, 'Luft'),
(5, 'Pflanze'),
(6, 'Geist'),
(7, 'Dunkelheit'),
(8, 'Natur'),
(9, 'Untot'),
(10, 'BOSS');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `faehigkeiten`
--

CREATE TABLE `faehigkeiten` (
  `ID` int(11) NOT NULL,
  `F_Klasse` int(11) NOT NULL,
  `Fähigkeit` text NOT NULL,
  `ab_LVL` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `faehigkeiten`
--

INSERT INTO `faehigkeiten` (`ID`, `F_Klasse`, `Fähigkeit`, `ab_LVL`) VALUES
(1, 5, 'Falkenhieb', 1),
(2, 5, 'Mehrfachschlag', 1),
(3, 5, 'Verteidigungsstellung', 1),
(4, 5, 'Rasende Wut', 1),
(5, 5, 'Verkrüppelnder Hieb', 1),
(6, 6, 'Doppelschuss', 1),
(7, 6, 'Giftpfeil', 1),
(8, 6, 'Tarnung', 1),
(9, 6, 'Durchdringender Pfeil', 1),
(10, 6, 'Geschärftes Auge', 1),
(11, 8, 'helfende Hand', 1),
(12, 8, 'heiliger Hieb', 1),
(13, 8, 'heiliges Licht', 1),
(14, 8, 'Genesung', 1),
(15, 8, 'Segen', 1),
(16, 7, 'Donnerschlag', 1),
(17, 7, 'Feuerball', 1),
(18, 7, 'Kettenblitz', 1),
(19, 7, 'Eiserne Fessel', 1),
(20, 7, 'Mana Barriere', 1),
(21, 9, 'Schattenhieb', 1),
(22, 9, 'Vergiftete Klinge', 1),
(23, 9, 'Rauchbombe', 1),
(24, 9, 'Hinterhalt', 1),
(25, 9, 'Giftwolke', 1),
(26, 9, 'Blitzangriff', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `groups`
--

CREATE TABLE `groups` (
  `ID` int(11) NOT NULL,
  `Gruppe` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `groups`
--

INSERT INTO `groups` (`ID`, `Gruppe`) VALUES
(1, 'Natur');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `klassen`
--

CREATE TABLE `klassen` (
  `ID` int(11) NOT NULL,
  `Klasse` text NOT NULL,
  `F_rüst_klasse` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `klassen`
--

INSERT INTO `klassen` (`ID`, `Klasse`, `F_rüst_klasse`) VALUES
(5, 'Krieger', 1),
(6, 'Waldläufer', 2),
(7, 'Magier', 3),
(8, 'Paladin', 1),
(9, 'Assassine', 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `l_city_enemy_type`
--

CREATE TABLE `l_city_enemy_type` (
  `ID` int(11) NOT NULL,
  `F_city` int(11) NOT NULL,
  `F_enemy_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `l_city_enemy_type`
--

INSERT INTO `l_city_enemy_type` (`ID`, `F_city`, `F_enemy_type`) VALUES
(1, 1, 8),
(2, 1, 5),
(3, 2, 8),
(4, 2, 5),
(5, 2, 4),
(6, 2, 6),
(7, 8, 1),
(8, 8, 8),
(9, 8, 5),
(10, 3, 3),
(11, 3, 4),
(12, 4, 1),
(13, 4, 5),
(14, 4, 8),
(15, 5, 5),
(16, 5, 8),
(17, 5, 1),
(18, 5, 4),
(19, 6, 7),
(20, 6, 9),
(21, 6, 6),
(22, 6, 2),
(23, 7, 8),
(24, 7, 5),
(25, 7, 4),
(26, 9, 7),
(27, 9, 9),
(28, 9, 6),
(29, 10, 8),
(30, 10, 5),
(31, 11, 2),
(32, 11, 3),
(33, 11, 4),
(34, 12, 3),
(35, 12, 2),
(36, 13, 5),
(37, 13, 4),
(38, 13, 8),
(39, 13, 1),
(40, 14, 5),
(41, 14, 8),
(42, 15, 7),
(43, 15, 9),
(44, 15, 6),
(45, 16, 7),
(46, 16, 6),
(47, 16, 9);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `l_waffe_klasse`
--

CREATE TABLE `l_waffe_klasse` (
  `ID` int(11) NOT NULL,
  `F_Waffe` int(11) NOT NULL,
  `F_Klasse` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `l_waffe_klasse`
--

INSERT INTO `l_waffe_klasse` (`ID`, `F_Waffe`, `F_Klasse`) VALUES
(1, 3, 6),
(2, 1, 5),
(3, 2, 5),
(4, 4, 6),
(5, 5, 7),
(6, 6, 7),
(7, 7, 8),
(8, 8, 8),
(9, 3, 9),
(10, 9, 8);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `m_spieler`
--

CREATE TABLE `m_spieler` (
  `ID` int(11) NOT NULL,
  `Name` text NOT NULL,
  `F_Stamm` int(11) NOT NULL,
  `F_Klasse` int(11) NOT NULL,
  `F_Beruf` int(11) NOT NULL,
  `Level` int(11) NOT NULL DEFAULT '1',
  `Erfahrung` int(11) NOT NULL DEFAULT '1',
  `city` tinyint(1) NOT NULL DEFAULT '0',
  `fight` tinyint(1) NOT NULL DEFAULT '0',
  `talking` tinyint(1) NOT NULL DEFAULT '0',
  `health` int(11) NOT NULL DEFAULT '100',
  `max_health` int(11) NOT NULL DEFAULT '100',
  `gold` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `m_spieler`
--

INSERT INTO `m_spieler` (`ID`, `Name`, `F_Stamm`, `F_Klasse`, `F_Beruf`, `Level`, `Erfahrung`, `city`, `fight`, `talking`, `health`, `max_health`, `gold`) VALUES
(1, 'Hans Hammer', 1, 5, 1, 1, 1, 0, 1, 0, 100, 100, 0),
(2, 'Fina Sonnenblume', 2, 6, 2, 1, 1, 0, 0, 0, 100, 100, 0),
(3, 'Sauron Sauerteig', 3, 7, 3, 1, 1, 1, 0, 0, 100, 100, 0),
(4, 'Peter Putin', 4, 8, 1, 1, 1, 1, 0, 0, 100, 100, 0),
(5, 'Talon Talisman', 2, 9, 1, 1, 1, 0, 0, 0, 100, 100, 0),
(8, 'Tina Toastbrot', 2, 7, 3, 1, 1, 0, 0, 0, 100, 100, 0),
(9, 'Testi test', 4, 7, 3, 1, 1, 0, 1, 0, 100, 100, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `npcs`
--

CREATE TABLE `npcs` (
  `ID` int(11) NOT NULL,
  `NPC` text NOT NULL,
  `F_role` int(11) NOT NULL,
  `F_group` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `npc_textlines`
--

CREATE TABLE `npc_textlines` (
  `ID` int(11) NOT NULL,
  `F_npc` int(11) NOT NULL,
  `Line` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `player_location`
--

CREATE TABLE `player_location` (
  `ID` int(11) NOT NULL,
  `F_m_spieler` int(11) NOT NULL,
  `F_citys` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `player_location`
--

INSERT INTO `player_location` (`ID`, `F_m_spieler`, `F_citys`) VALUES
(1, 9, 2),
(2, 1, 13),
(3, 4, 2),
(4, 3, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `roles`
--

CREATE TABLE `roles` (
  `ID` int(11) NOT NULL,
  `Rolle` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ruest_klasse`
--

CREATE TABLE `ruest_klasse` (
  `ID` int(11) NOT NULL,
  `Ruest` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `ruest_klasse`
--

INSERT INTO `ruest_klasse` (`ID`, `Ruest`) VALUES
(1, 'schwere Rüstung'),
(2, 'mittlere Rüstung'),
(3, 'leichte Rüstung');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `stamm`
--

CREATE TABLE `stamm` (
  `ID` int(11) NOT NULL,
  `Stamm` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `stamm`
--

INSERT INTO `stamm` (`ID`, `Stamm`) VALUES
(1, 'Zwerg'),
(2, 'Elfe'),
(3, 'Dunkelelf'),
(4, 'Mensch');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `waffen`
--

CREATE TABLE `waffen` (
  `ID` int(11) NOT NULL,
  `Waffe` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `waffen`
--

INSERT INTO `waffen` (`ID`, `Waffe`) VALUES
(1, 'Hammer'),
(2, 'Streitaxt'),
(3, 'Dolch'),
(4, 'Langbogen'),
(5, 'Zauberstab'),
(6, 'Kurzschwert'),
(7, 'Schild'),
(8, 'Langschwert'),
(9, 'Lanze');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `beruf`
--
ALTER TABLE `beruf`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `citys`
--
ALTER TABLE `citys`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `commands`
--
ALTER TABLE `commands`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `enemys`
--
ALTER TABLE `enemys`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `F_enemy_type` (`F_enemy_type`),
  ADD KEY `F_group` (`F_group`);

--
-- Indizes für die Tabelle `enemy_attack`
--
ALTER TABLE `enemy_attack`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `F_enemys` (`F_enemys`);

--
-- Indizes für die Tabelle `enemy_textlines`
--
ALTER TABLE `enemy_textlines`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `F_enemy_entitys` (`F_entitys`);

--
-- Indizes für die Tabelle `enemy_type`
--
ALTER TABLE `enemy_type`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `faehigkeiten`
--
ALTER TABLE `faehigkeiten`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `F_Klasse` (`F_Klasse`);

--
-- Indizes für die Tabelle `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `klassen`
--
ALTER TABLE `klassen`
  ADD PRIMARY KEY (`ID`) USING BTREE,
  ADD KEY `klassen_ibfk_1` (`F_rüst_klasse`);

--
-- Indizes für die Tabelle `l_city_enemy_type`
--
ALTER TABLE `l_city_enemy_type`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `F_city` (`F_city`),
  ADD KEY `F_enemy_type` (`F_enemy_type`);

--
-- Indizes für die Tabelle `l_waffe_klasse`
--
ALTER TABLE `l_waffe_klasse`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `F_Waffe` (`F_Waffe`),
  ADD KEY `F_Klasse` (`F_Klasse`);

--
-- Indizes für die Tabelle `m_spieler`
--
ALTER TABLE `m_spieler`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `F_Stamm` (`F_Stamm`),
  ADD KEY `F_Klasse` (`F_Klasse`),
  ADD KEY `F_Beruf` (`F_Beruf`);

--
-- Indizes für die Tabelle `npcs`
--
ALTER TABLE `npcs`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `F_role` (`F_role`),
  ADD KEY `F_group` (`F_group`);

--
-- Indizes für die Tabelle `npc_textlines`
--
ALTER TABLE `npc_textlines`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `F_npc` (`F_npc`);

--
-- Indizes für die Tabelle `player_location`
--
ALTER TABLE `player_location`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `F_citys` (`F_citys`),
  ADD KEY `F_m_spieler` (`F_m_spieler`);

--
-- Indizes für die Tabelle `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `ruest_klasse`
--
ALTER TABLE `ruest_klasse`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `stamm`
--
ALTER TABLE `stamm`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `waffen`
--
ALTER TABLE `waffen`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `beruf`
--
ALTER TABLE `beruf`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `citys`
--
ALTER TABLE `citys`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT für Tabelle `commands`
--
ALTER TABLE `commands`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `enemys`
--
ALTER TABLE `enemys`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `enemy_attack`
--
ALTER TABLE `enemy_attack`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `enemy_textlines`
--
ALTER TABLE `enemy_textlines`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `enemy_type`
--
ALTER TABLE `enemy_type`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `faehigkeiten`
--
ALTER TABLE `faehigkeiten`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT für Tabelle `groups`
--
ALTER TABLE `groups`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `klassen`
--
ALTER TABLE `klassen`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT für Tabelle `l_city_enemy_type`
--
ALTER TABLE `l_city_enemy_type`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT für Tabelle `l_waffe_klasse`
--
ALTER TABLE `l_waffe_klasse`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `m_spieler`
--
ALTER TABLE `m_spieler`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT für Tabelle `npcs`
--
ALTER TABLE `npcs`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `npc_textlines`
--
ALTER TABLE `npc_textlines`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `player_location`
--
ALTER TABLE `player_location`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `roles`
--
ALTER TABLE `roles`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `ruest_klasse`
--
ALTER TABLE `ruest_klasse`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `stamm`
--
ALTER TABLE `stamm`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `waffen`
--
ALTER TABLE `waffen`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `enemys`
--
ALTER TABLE `enemys`
  ADD CONSTRAINT `enemys_ibfk_1` FOREIGN KEY (`F_enemy_type`) REFERENCES `enemy_type` (`ID`),
  ADD CONSTRAINT `enemys_ibfk_2` FOREIGN KEY (`F_group`) REFERENCES `groups` (`ID`);

--
-- Constraints der Tabelle `enemy_attack`
--
ALTER TABLE `enemy_attack`
  ADD CONSTRAINT `enemy_attack_ibfk_1` FOREIGN KEY (`F_enemys`) REFERENCES `enemys` (`ID`);

--
-- Constraints der Tabelle `enemy_textlines`
--
ALTER TABLE `enemy_textlines`
  ADD CONSTRAINT `enemy_textlines_ibfk_1` FOREIGN KEY (`F_entitys`) REFERENCES `enemys` (`ID`);

--
-- Constraints der Tabelle `faehigkeiten`
--
ALTER TABLE `faehigkeiten`
  ADD CONSTRAINT `faehigkeiten_ibfk_1` FOREIGN KEY (`F_Klasse`) REFERENCES `klassen` (`ID`);

--
-- Constraints der Tabelle `klassen`
--
ALTER TABLE `klassen`
  ADD CONSTRAINT `klassen_ibfk_3` FOREIGN KEY (`F_rüst_klasse`) REFERENCES `ruest_klasse` (`ID`);

--
-- Constraints der Tabelle `l_city_enemy_type`
--
ALTER TABLE `l_city_enemy_type`
  ADD CONSTRAINT `l_city_enemy_type_ibfk_1` FOREIGN KEY (`F_city`) REFERENCES `citys` (`ID`),
  ADD CONSTRAINT `l_city_enemy_type_ibfk_2` FOREIGN KEY (`F_enemy_type`) REFERENCES `enemy_type` (`ID`);

--
-- Constraints der Tabelle `l_waffe_klasse`
--
ALTER TABLE `l_waffe_klasse`
  ADD CONSTRAINT `l_waffe_klasse_ibfk_1` FOREIGN KEY (`F_Klasse`) REFERENCES `klassen` (`ID`),
  ADD CONSTRAINT `l_waffe_klasse_ibfk_2` FOREIGN KEY (`F_Waffe`) REFERENCES `waffen` (`ID`);

--
-- Constraints der Tabelle `m_spieler`
--
ALTER TABLE `m_spieler`
  ADD CONSTRAINT `m_spieler_ibfk_1` FOREIGN KEY (`F_Stamm`) REFERENCES `stamm` (`ID`),
  ADD CONSTRAINT `m_spieler_ibfk_2` FOREIGN KEY (`F_Klasse`) REFERENCES `klassen` (`ID`),
  ADD CONSTRAINT `m_spieler_ibfk_3` FOREIGN KEY (`F_Beruf`) REFERENCES `beruf` (`ID`);

--
-- Constraints der Tabelle `npcs`
--
ALTER TABLE `npcs`
  ADD CONSTRAINT `npcs_ibfk_1` FOREIGN KEY (`F_role`) REFERENCES `roles` (`ID`),
  ADD CONSTRAINT `npcs_ibfk_2` FOREIGN KEY (`F_group`) REFERENCES `groups` (`ID`);

--
-- Constraints der Tabelle `npc_textlines`
--
ALTER TABLE `npc_textlines`
  ADD CONSTRAINT `npc_textlines_ibfk_1` FOREIGN KEY (`F_npc`) REFERENCES `npcs` (`ID`);

--
-- Constraints der Tabelle `player_location`
--
ALTER TABLE `player_location`
  ADD CONSTRAINT `player_location_ibfk_1` FOREIGN KEY (`F_citys`) REFERENCES `citys` (`ID`),
  ADD CONSTRAINT `player_location_ibfk_2` FOREIGN KEY (`F_m_spieler`) REFERENCES `m_spieler` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
