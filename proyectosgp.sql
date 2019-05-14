-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-05-2019 a las 21:24:40
-- Versión del servidor: 10.1.37-MariaDB
-- Versión de PHP: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyectosgp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areas`
--

CREATE TABLE `areas` (
  `idArea` int(11) NOT NULL,
  `nombreArea` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `areas`
--

INSERT INTO `areas` (`idArea`, `nombreArea`) VALUES
(1, 'admin'),
(2, 'Desarrollo'),
(3, 'Finanzas'),
(4, 'Ventas'),
(5, 'Facturacion Fija');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacoraselementos`
--

CREATE TABLE `bitacoraselementos` (
  `idBitacora` int(11) NOT NULL,
  `idElemento` int(11) DEFAULT NULL,
  `fechaCreacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos`
--

CREATE TABLE `cargos` (
  `idCargo` int(11) NOT NULL,
  `nombreCargo` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `cargos`
--

INSERT INTO `cargos` (`idCargo`, `nombreCargo`) VALUES
(1, 'admin'),
(2, 'Jefe de Desarrollo'),
(3, 'Programador'),
(8, 'Jefe de Area'),
(9, 'Empleado funcional');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `casos`
--

CREATE TABLE `casos` (
  `idCaso` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `idSolicitud` int(11) DEFAULT NULL,
  `idJefeDesarrollo` int(11) DEFAULT NULL,
  `idProgramador` int(11) DEFAULT NULL,
  `idRevisor` int(11) DEFAULT NULL,
  `fechaCreacion` date DEFAULT NULL,
  `fechaLimite` date DEFAULT NULL,
  `detalleCaso` varchar(500) COLLATE latin1_spanish_ci DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultas`
--

CREATE TABLE `consultas` (
  `correlativo` int(11) NOT NULL,
  `consulta` varchar(500) COLLATE latin1_spanish_ci DEFAULT NULL,
  `fecha` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elementoscaso`
--

CREATE TABLE `elementoscaso` (
  `idElemento` int(11) NOT NULL,
  `descripcionElemento` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `idCaso` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `idEmpleado` int(11) NOT NULL,
  `nombres` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `apellidos` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `cargo` int(11) DEFAULT NULL,
  `area` int(11) DEFAULT NULL,
  `documentoUnico` varchar(9) COLLATE latin1_spanish_ci DEFAULT NULL,
  `email` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `jefe` int(11) DEFAULT NULL,
  `activo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`idEmpleado`, `nombres`, `apellidos`, `cargo`, `area`, `documentoUnico`, `email`, `telefono`, `jefe`, `activo`) VALUES
(1, 'Augusto', 'Meza', 1, 1, '053502320', 'augusto@gmail.com', 74747474, 1, 1),
(2, 'Raul ', 'Sanchez', 1, 1, '047965789', 'raul@gmail.com', 78797471, 1, 1),
(3, 'Ricardo', 'Hernandez', 2, 1, '014569876', 'ricardo@gmail.com', 74757671, 1, 1),
(4, 'Rodolfo', 'Espadero', 8, 3, '012654789', 'rodolfo@gmail.com', 79797874, 1, 1),
(5, 'Fernando', 'Barriere', 9, 4, '040478987', 'fernando@yahoo.com', 71459632, 1, 1),
(6, 'Clara', 'Evangelista', 8, 4, '047815948', 'clara.aparicio3@gmail.com', 71737875, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadoscaso`
--

CREATE TABLE `estadoscaso` (
  `idEstado` int(11) NOT NULL,
  `estado` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `estadoscaso`
--

INSERT INTO `estadoscaso` (`idEstado`, `estado`) VALUES
(1, 'En espera'),
(2, 'En desarrollo'),
(3, 'Esperando aprobación de área solicitante'),
(4, 'Vencido'),
(5, 'Devuelto con observaciones'),
(6, 'Finalizado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadosdesolicitud`
--

CREATE TABLE `estadosdesolicitud` (
  `idEstado` int(11) NOT NULL,
  `estadoSolicitud` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `estadosdesolicitud`
--

INSERT INTO `estadosdesolicitud` (`idEstado`, `estadoSolicitud`) VALUES
(1, 'En espera de respuesta'),
(2, 'Rechazada'),
(3, 'Aprobada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuestasolicitudes`
--
-- Error leyendo la estructura de la tabla proyectosgp.respuestasolicitudes: #1932 - Table 'proyectosgp.respuestasolicitudes' doesn't exist in engine
-- Error leyendo datos de la tabla proyectosgp.respuestasolicitudes: #1064 - Algo está equivocado en su sintax cerca 'FROM `proyectosgp`.`respuestasolicitudes`' en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudes`
--

CREATE TABLE `solicitudes` (
  `idSolicitud` int(11) NOT NULL,
  `idEmpleadoSolicitante` int(11) DEFAULT NULL,
  `detalleSolicitud` varchar(600) COLLATE latin1_spanish_ci DEFAULT NULL,
  `archivoPdf` varchar(200) COLLATE latin1_spanish_ci NOT NULL,
  `fechaSolicitud` date DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `solicitudes`
--

INSERT INTO `solicitudes` (`idSolicitud`, `idEmpleadoSolicitante`, `detalleSolicitud`, `archivoPdf`, `fechaSolicitud`, `estado`) VALUES
(1, 2, 'Se quiere construir una aplicacion para que las personas puedan acceder a su informacion desde el telefono                    ', '', '2019-04-26', 1),
(3, 6, 'Se solicita ...             ', '', '2019-05-02', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipousuario`
--

CREATE TABLE `tipousuario` (
  `idTipoUsuario` int(11) NOT NULL,
  `nombreTipoUsuario` varchar(25) COLLATE latin1_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `tipousuario`
--

INSERT INTO `tipousuario` (`idTipoUsuario`, `nombreTipoUsuario`) VALUES
(1, 'admin'),
(2, 'jefeDesarrollo'),
(3, 'jefeAreaFuncional'),
(4, 'programador'),
(5, 'empleadoFuncional');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL,
  `nombreUsuario` varchar(30) COLLATE latin1_spanish_ci DEFAULT NULL,
  `passwordUsuario` varchar(40) COLLATE latin1_spanish_ci DEFAULT NULL,
  `tipoUsuario` int(11) DEFAULT NULL,
  `idEmpleado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `nombreUsuario`, `passwordUsuario`, `tipoUsuario`, `idEmpleado`) VALUES
(1, 'aug', '123', 1, 1),
(6, 'raul', '456', 3, 2),
(7, 'ricardo', '789', 2, 3),
(8, 'rodolfo', '123', 3, 4),
(11, 'fer', '456', 5, 5),
(12, 'clara', '456', 3, 6);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`idArea`);

--
-- Indices de la tabla `bitacoraselementos`
--
ALTER TABLE `bitacoraselementos`
  ADD PRIMARY KEY (`idBitacora`),
  ADD KEY `idElemento` (`idElemento`);

--
-- Indices de la tabla `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`idCargo`);

--
-- Indices de la tabla `casos`
--
ALTER TABLE `casos`
  ADD PRIMARY KEY (`idCaso`),
  ADD KEY `idSolicitud` (`idSolicitud`),
  ADD KEY `idJefeDesarrollo` (`idJefeDesarrollo`),
  ADD KEY `idProgramador` (`idProgramador`),
  ADD KEY `idRevisor` (`idRevisor`),
  ADD KEY `estado` (`estado`);

--
-- Indices de la tabla `consultas`
--
ALTER TABLE `consultas`
  ADD PRIMARY KEY (`correlativo`);

--
-- Indices de la tabla `elementoscaso`
--
ALTER TABLE `elementoscaso`
  ADD PRIMARY KEY (`idElemento`),
  ADD KEY `idCaso` (`idCaso`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`idEmpleado`),
  ADD KEY `cargo` (`cargo`),
  ADD KEY `area` (`area`),
  ADD KEY `jefe` (`jefe`);

--
-- Indices de la tabla `estadoscaso`
--
ALTER TABLE `estadoscaso`
  ADD PRIMARY KEY (`idEstado`);

--
-- Indices de la tabla `estadosdesolicitud`
--
ALTER TABLE `estadosdesolicitud`
  ADD PRIMARY KEY (`idEstado`);

--
-- Indices de la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  ADD PRIMARY KEY (`idSolicitud`),
  ADD KEY `idEmpleadoSolicitante` (`idEmpleadoSolicitante`),
  ADD KEY `fk` (`estado`);

--
-- Indices de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  ADD PRIMARY KEY (`idTipoUsuario`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `tipoUsuario` (`tipoUsuario`),
  ADD KEY `idEmpleado` (`idEmpleado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `areas`
--
ALTER TABLE `areas`
  MODIFY `idArea` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `bitacoraselementos`
--
ALTER TABLE `bitacoraselementos`
  MODIFY `idBitacora` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cargos`
--
ALTER TABLE `cargos`
  MODIFY `idCargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `consultas`
--
ALTER TABLE `consultas`
  MODIFY `correlativo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `elementoscaso`
--
ALTER TABLE `elementoscaso`
  MODIFY `idElemento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `idEmpleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `estadosdesolicitud`
--
ALTER TABLE `estadosdesolicitud`
  MODIFY `idEstado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  MODIFY `idSolicitud` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  MODIFY `idTipoUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bitacoraselementos`
--
ALTER TABLE `bitacoraselementos`
  ADD CONSTRAINT `bitacoraselementos_ibfk_1` FOREIGN KEY (`idElemento`) REFERENCES `elementoscaso` (`idElemento`);

--
-- Filtros para la tabla `casos`
--
ALTER TABLE `casos`
  ADD CONSTRAINT `casos_ibfk_1` FOREIGN KEY (`idSolicitud`) REFERENCES `solicitudes` (`idSolicitud`),
  ADD CONSTRAINT `casos_ibfk_2` FOREIGN KEY (`idJefeDesarrollo`) REFERENCES `empleados` (`idEmpleado`),
  ADD CONSTRAINT `casos_ibfk_3` FOREIGN KEY (`idProgramador`) REFERENCES `empleados` (`idEmpleado`),
  ADD CONSTRAINT `casos_ibfk_4` FOREIGN KEY (`idRevisor`) REFERENCES `empleados` (`idEmpleado`),
  ADD CONSTRAINT `casos_ibfk_5` FOREIGN KEY (`estado`) REFERENCES `estadoscaso` (`idEstado`);

--
-- Filtros para la tabla `elementoscaso`
--
ALTER TABLE `elementoscaso`
  ADD CONSTRAINT `elementoscaso_ibfk_1` FOREIGN KEY (`idCaso`) REFERENCES `casos` (`idCaso`);

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`cargo`) REFERENCES `cargos` (`idCargo`),
  ADD CONSTRAINT `empleados_ibfk_2` FOREIGN KEY (`area`) REFERENCES `areas` (`idArea`),
  ADD CONSTRAINT `empleados_ibfk_3` FOREIGN KEY (`jefe`) REFERENCES `empleados` (`idEmpleado`);

--
-- Filtros para la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  ADD CONSTRAINT `fk` FOREIGN KEY (`estado`) REFERENCES `estadosdesolicitud` (`idEstado`),
  ADD CONSTRAINT `solicitudes_ibfk_1` FOREIGN KEY (`idEmpleadoSolicitante`) REFERENCES `empleados` (`idEmpleado`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`tipoUsuario`) REFERENCES `tipousuario` (`idTipoUsuario`),
  ADD CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`idEmpleado`) REFERENCES `empleados` (`idEmpleado`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
