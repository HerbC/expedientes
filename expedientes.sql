-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 10-11-2015 a las 03:42:58
-- Versión del servidor: 5.5.8
-- Versión de PHP: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `expedientes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consulta`
--

CREATE TABLE IF NOT EXISTS `consulta` (
  `id_consulta` int(3) NOT NULL,
  `id_paciente` int(3) NOT NULL,
  `motivo_consulta` varchar(500) NOT NULL,
  `descripcion_consulta` varchar(500) NOT NULL,
  `antece_personales_consulta` varchar(500) NOT NULL,
  `antece_familiares_consulta` varchar(500) NOT NULL,
  PRIMARY KEY (`id_consulta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `consulta`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `examen_rutinario`
--

CREATE TABLE IF NOT EXISTS `examen_rutinario` (
  `id_examen_rut` int(3) NOT NULL,
  `id_consulta` int(3) NOT NULL,
  `presion_examen_rut` int(10) NOT NULL,
  `pulso_examen_rut` int(10) NOT NULL,
  `frec_respiratoria_examen_rut` varchar(10) NOT NULL,
  `talla_examen_rut` varchar(5) NOT NULL,
  `peso_examen_rut` varchar(5) NOT NULL,
  `imc_examen_rut` varchar(10) NOT NULL,
  `otros` varchar(100) NOT NULL,
  PRIMARY KEY (`id_examen_rut`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `examen_rutinario`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_medico`
--

CREATE TABLE IF NOT EXISTS `historial_medico` (
  `id_hist_med` int(3) NOT NULL,
  `id_paciente` int(3) NOT NULL,
  `id_consulta` int(3) NOT NULL,
  `hist_med` varchar(250) NOT NULL,
  `examenes_hist_med` varchar(250) NOT NULL,
  `resultados_hist_med` varchar(250) NOT NULL,
  `referencias_hist_med` varchar(250) NOT NULL,
  PRIMARY KEY (`id_hist_med`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `historial_medico`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `id_usuario` int(3) NOT NULL,
  `nombre_usuario` varchar(20) NOT NULL,
  `clave_usuario` varchar(20) NOT NULL,
  `privilegios_usuario` varchar(10) NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `login`
--

INSERT INTO `login` (`id_usuario`, `nombre_usuario`, `clave_usuario`, `privilegios_usuario`) VALUES
(1, 'admin', '1', 'admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

CREATE TABLE IF NOT EXISTS `paciente` (
  `id_paciente` int(3) NOT NULL,
  `nombre_paciente` varchar(50) NOT NULL,
  `apellido_paciente` varchar(50) NOT NULL,
  `genero_paciente` varchar(1) NOT NULL,
  `edad_paciente` int(3) NOT NULL,
  `civil_paciente` varchar(20) NOT NULL,
  `ocupacion_paciente` varchar(30) NOT NULL,
  `nacionalidad_paciente` varchar(25) NOT NULL,
  `educacion_paciente` varchar(20) NOT NULL,
  `telefono_paciente` int(9) NOT NULL,
  PRIMARY KEY (`id_paciente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `paciente`
--

