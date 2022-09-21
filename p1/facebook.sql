-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 21, 2022 at 09:05 PM
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
-- Table structure for table `comentario`
--

DROP TABLE IF EXISTS `comentario`;
CREATE TABLE `comentario` (
  `DataHora` datetime NOT NULL,
  `TextoComentario` text DEFAULT NULL,
  `ComentarioID` int(11) NOT NULL,
  `UtilizadorComentario` int(11) NOT NULL,
  `PostComentario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `grupo`
--

DROP TABLE IF EXISTS `grupo`;
CREATE TABLE `grupo` (
  `Data` date NOT NULL,
  `DesignacaoGrupo` varchar(100) NOT NULL,
  `DescricaoGrupo` text NOT NULL,
  `GrupoID` int(11) NOT NULL,
  `Dono` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `grupo`
--

INSERT INTO `grupo` (`Data`, `DesignacaoGrupo`, `DescricaoGrupo`, `GrupoID`, `Dono`) VALUES
('2022-09-21', 'Alunos 2º Ano ISTA', 'Grupo de alunos que frequentam as ...........', 1, 1),
('2022-09-21', 'Fustsal ISCTE', 'Grupo de jogadores da equipe ...........', 2, 10);

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
CREATE TABLE `likes` (
  `UtikizadorLike` int(11) NOT NULL,
  `PostLike` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `membrosgrupo`
--

DROP TABLE IF EXISTS `membrosgrupo`;
CREATE TABLE `membrosgrupo` (
  `UtilizadorMembro` int(11) NOT NULL,
  `GrupoMembro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
('PR', 'Portugal'),
('RO', 'Romania'),
('SC', 'Seychelles'),
('SP', 'Spain'),
('AE', 'United Arab Emirates (the)'),
('GB', 'United Kingdom');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `TextoPost` text DEFAULT NULL,
  `DataHora` datetime NOT NULL,
  `PostID` int(11) NOT NULL,
  `PostAutor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`TextoPost`, `DataHora`, `PostID`, `PostAutor`) VALUES
('Não podemos faltar à semana IULCOME! Quem vem?', '2022-09-19 17:40:02', 1, 1),
('As praxes estão aí!', '2022-09-19 17:41:05', 2, 2),
('Viram as notícias na comunicação social sobre asemana IULCOME?', '2022-09-19 17:41:18', 3, 7);

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
('sdsads', 'sdsads', 'FR', 1),
('ana@iscte.pt', 'Ana Martins', 'PR', 2),
('francisco@sapo.pt', 'Francisco Melo', 'PR', 5),
('antonio_ferraz@mm.pt', 'Antonio Ferraz', 'PR', 6),
('luispedro@iscte.pt', 'Luis Pedro', 'PR', 7),
('marcThomas@iscte.pt', 'Marc Thomas', 'GB', 8),
('pedrito@mail.pt', 'Pedrito', 'PR', 10),
('diana@gmail.com', 'Diana', 'PR', 11),
('marie@gmail.com', 'Marie da Silva', 'FR', 33);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`ComentarioID`),
  ADD KEY `PostComment` (`PostComentario`),
  ADD KEY `UtilizadorComentario` (`UtilizadorComentario`);

--
-- Indexes for table `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`GrupoID`),
  ADD KEY `DonoID` (`Dono`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`UtikizadorLike`,`PostLike`),
  ADD KEY `PostLike` (`PostLike`);

--
-- Indexes for table `membrosgrupo`
--
ALTER TABLE `membrosgrupo`
  ADD PRIMARY KEY (`UtilizadorMembro`,`GrupoMembro`),
  ADD KEY `GrupoID` (`GrupoMembro`);

--
-- Indexes for table `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`CodigoPais`),
  ADD UNIQUE KEY `pais` (`NomePais`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`PostID`),
  ADD KEY `AutorDoPost` (`PostAutor`);

--
-- Indexes for table `utilizador`
--
ALTER TABLE `utilizador`
  ADD PRIMARY KEY (`UtilizadorID`),
  ADD UNIQUE KEY `email` (`EmailUtilizador`) USING BTREE,
  ADD KEY `PaisResidencia` (`PaisResidencia`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `PostID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `PostComment` FOREIGN KEY (`PostComentario`) REFERENCES `post` (`PostID`),
  ADD CONSTRAINT `UtilizadorComentario` FOREIGN KEY (`UtilizadorComentario`) REFERENCES `utilizador` (`UtilizadorID`);

--
-- Constraints for table `grupo`
--
ALTER TABLE `grupo`
  ADD CONSTRAINT `DonoID` FOREIGN KEY (`Dono`) REFERENCES `utilizador` (`UtilizadorID`);

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `PostLike` FOREIGN KEY (`PostLike`) REFERENCES `post` (`PostID`),
  ADD CONSTRAINT `UtilizadorLike` FOREIGN KEY (`UtikizadorLike`) REFERENCES `utilizador` (`UtilizadorID`);

--
-- Constraints for table `membrosgrupo`
--
ALTER TABLE `membrosgrupo`
  ADD CONSTRAINT `GrupoID` FOREIGN KEY (`GrupoMembro`) REFERENCES `grupo` (`GrupoID`),
  ADD CONSTRAINT `UtilizadorID` FOREIGN KEY (`UtilizadorMembro`) REFERENCES `utilizador` (`UtilizadorID`);

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `AutorDoPost` FOREIGN KEY (`PostAutor`) REFERENCES `utilizador` (`UtilizadorID`) ON DELETE SET NULL;

--
-- Constraints for table `utilizador`
--
ALTER TABLE `utilizador`
  ADD CONSTRAINT `AutoPais` FOREIGN KEY (`PaisResidencia`) REFERENCES `pais` (`CodigoPais`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
