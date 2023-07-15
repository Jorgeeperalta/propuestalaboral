-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 15, 2023 at 12:56 AM
-- Server version: 5.7.24
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `postulacionbd`
--

-- --------------------------------------------------------

--
-- Table structure for table `carreras`
--

CREATE TABLE `carreras` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_apertura` date DEFAULT NULL,
  `id_facultad` int(11) DEFAULT NULL,
  `anios_cursada` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `carreras`
--

INSERT INTO `carreras` (`id`, `nombre`, `descripcion`, `fecha_apertura`, `id_facultad`, `anios_cursada`) VALUES
(1, 'Ingeniería en informática', 'Carrera de grado', '2023-07-14', 1, 5),
(2, 'Licenciatura en Informática', 'Carrera de grado', '2023-07-14', 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `estudiantes`
--

CREATE TABLE `estudiantes` (
  `id` int(11) NOT NULL,
  `dni` varchar(255) DEFAULT NULL,
  `apellido_nombre` varchar(255) DEFAULT NULL,
  `celular` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `codigo_postal` varchar(255) DEFAULT NULL,
  `domicilio` varchar(255) DEFAULT NULL,
  `carrera_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `estudiantes`
--

INSERT INTO `estudiantes` (`id`, `dni`, `apellido_nombre`, `celular`, `mail`, `edad`, `codigo_postal`, `domicilio`, `carrera_id`) VALUES
(1, '25563413', 'peralta jorge', '1121655482', 'edudela36@gmail.com', 46, '7106', 'calle 36 869', 1);

-- --------------------------------------------------------

--
-- Table structure for table `facultades`
--

CREATE TABLE `facultades` (
  `id_facultad` int(11) NOT NULL,
  `nombre_facultad` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `facultades`
--

INSERT INTO `facultades` (`id_facultad`, `nombre_facultad`) VALUES
(1, 'Ingenieria'),
(2, 'Ciencias sociales');

-- --------------------------------------------------------

--
-- Table structure for table `inscripciones`
--

CREATE TABLE `inscripciones` (
  `id` int(11) NOT NULL,
  `estudiante_id` int(11) DEFAULT NULL,
  `materia_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inscripciones`
--

INSERT INTO `inscripciones` (`id`, `estudiante_id`, `materia_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `materias`
--

CREATE TABLE `materias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `horas_cursada` int(11) DEFAULT NULL,
  `forma_aprobacion` varchar(255) DEFAULT NULL,
  `carrera_id` int(11) DEFAULT NULL,
  `anio_carrera` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `materias`
--

INSERT INTO `materias` (`id`, `nombre`, `horas_cursada`, `forma_aprobacion`, `carrera_id`, `anio_carrera`) VALUES
(1, 'Algoritmo de datos', 160, 'Examen final', 1, 1),
(2, 'Matemática 1', 164, 'Examen final', 1, 1),
(3, 'Matemática 1 ', 160, 'Promoción', 2, 1),
(4, 'Pensamiento computacional ', 1, 'Promoción ', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `notas`
--

CREATE TABLE `notas` (
  `id` int(11) NOT NULL,
  `inscripcion_id` int(11) DEFAULT NULL,
  `parcial_1` decimal(4,2) DEFAULT NULL,
  `parcial_2` decimal(4,2) DEFAULT NULL,
  `parcial_3` decimal(4,2) DEFAULT NULL,
  `parcial_4` decimal(4,2) DEFAULT NULL,
  `final` decimal(4,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carreras`
--
ALTER TABLE `carreras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_facultad` (`id_facultad`);

--
-- Indexes for table `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carrera_id` (`carrera_id`);

--
-- Indexes for table `facultades`
--
ALTER TABLE `facultades`
  ADD PRIMARY KEY (`id_facultad`);

--
-- Indexes for table `inscripciones`
--
ALTER TABLE `inscripciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `estudiante_id` (`estudiante_id`),
  ADD KEY `materia_id` (`materia_id`);

--
-- Indexes for table `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carrera_id` (`carrera_id`);

--
-- Indexes for table `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inscripcion_id` (`inscripcion_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carreras`
--
ALTER TABLE `carreras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `estudiantes`
--
ALTER TABLE `estudiantes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `facultades`
--
ALTER TABLE `facultades`
  MODIFY `id_facultad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `inscripciones`
--
ALTER TABLE `inscripciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `materias`
--
ALTER TABLE `materias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `notas`
--
ALTER TABLE `notas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carreras`
--
ALTER TABLE `carreras`
  ADD CONSTRAINT `carreras_ibfk_1` FOREIGN KEY (`id_facultad`) REFERENCES `facultades` (`id_facultad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD CONSTRAINT `estudiantes_ibfk_1` FOREIGN KEY (`carrera_id`) REFERENCES `carreras` (`id`);

--
-- Constraints for table `inscripciones`
--
ALTER TABLE `inscripciones`
  ADD CONSTRAINT `inscripciones_ibfk_1` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiantes` (`id`),
  ADD CONSTRAINT `inscripciones_ibfk_2` FOREIGN KEY (`materia_id`) REFERENCES `materias` (`id`);

--
-- Constraints for table `materias`
--
ALTER TABLE `materias`
  ADD CONSTRAINT `materias_ibfk_1` FOREIGN KEY (`carrera_id`) REFERENCES `carreras` (`id`);

--
-- Constraints for table `notas`
--
ALTER TABLE `notas`
  ADD CONSTRAINT `notas_ibfk_1` FOREIGN KEY (`inscripcion_id`) REFERENCES `inscripciones` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
