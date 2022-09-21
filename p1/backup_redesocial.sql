-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 14, 2022 at 11:30 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `facebook`
--
CREATE DATABASE IF NOT EXISTS `facebook` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `facebook`;

-- --------------------------------------------------------

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
CREATE TABLE `pais` (
  `CodigoPais` char(2) NOT NULL,
  `NomePais` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pais`
--

INSERT INTO `pais` (`CodigoPais`, `NomePais`) VALUES
('AD', 'Andorra'),
('AR', 'Argentina'),
('BE', 'Belgium'),
('FR', 'France'),
('PT', 'Portugal'),
('RO', 'Romania'),
('SC', 'Seychelles'),
('ES', 'Spain'),
('AE', 'United Arab Emirates (the)'),
('GB', 'United Kingdom');

-- --------------------------------------------------------

--
-- Table structure for table `utilizador`
--

DROP TABLE IF EXISTS `utilizador`;
CREATE TABLE `utilizador` (
  `EmailUtilizador` varchar(100) NOT NULL,
  `NomeUtilizador` varchar(100) NOT NULL,
  `PaisResidencia` char(2) DEFAULT NULL,
  `UtilizadorID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `utilizador`
--

INSERT INTO `utilizador` (`EmailUtilizador`, `NomeUtilizador`, `PaisResidencia`, `UtilizadorID`) VALUES
('luis@iscte.pt', 'Luis António Castro', 'PT', 1),
('ana@iscte.pt', 'Ana Martins', 'PT', 2),
('marie@gmail.com', 'Marie da Silva', 'FR', 3),
('jeanPierre@gmail.com', 'Jean Pierre', 'FR', 4),
('francisco@sapo.pt', 'Francisco Melo', 'PT', 5),
('antonio_ferraz@mm.pt', 'Antonio Ferraz', 'PT', 6),
('luispedro@iscte.pt', 'Luis Pedro', 'PT', 7),
('marcThomas@iscte.pt', 'Marc Thomas', 'GB', 8),
('zeMaria@rk.co.uk', 'José Maria', 'GB', 9),
('pedrito@mail.pt', 'Pedrito', 'PT', 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`CodigoPais`),
  ADD UNIQUE KEY `pais` (`NomePais`);

--
-- Indexes for table `utilizador`
--
ALTER TABLE `utilizador`
  ADD PRIMARY KEY (`UtilizadorID`),
  ADD UNIQUE KEY `email` (`EmailUtilizador`) USING BTREE,
  ADD KEY `PaisResidencia` (`PaisResidencia`) USING BTREE;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `utilizador`
--
ALTER TABLE `utilizador`
  ADD CONSTRAINT `AutoPais` FOREIGN KEY (`PaisResidencia`) REFERENCES `pais` (`CodigoPais`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
