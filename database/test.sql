-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-12-2019 a las 04:24:57
-- Versión del servidor: 10.3.15-MariaDB
-- Versión de PHP: 7.1.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `test`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad`
--

CREATE TABLE `actividad` (
  `ID` int(11) NOT NULL,
  `Fecha_Inicio` date NOT NULL,
  `Fecha_Entrega` date NOT NULL,
  `Detalle` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Estado` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Patente_Cli` varchar(6) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Encargado` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ucs2 COLLATE=ucs2_general_mysql500_ci;

--
-- Volcado de datos para la tabla `actividad`
--

INSERT INTO `actividad` (`ID`, `Fecha_Inicio`, `Fecha_Entrega`, `Detalle`, `Estado`, `Patente_Cli`, `Encargado`) VALUES
(11, '2019-11-12', '2019-11-16', 'Cambiar pintura de vehiculo 4x4', 'no_vigente', 'CKL242', 'Domingo Letelier'),
(12, '2019-12-12', '2019-12-12', 'Cambio de aceite ', 'vigente', 'JKS345', 'ALEJANDRO'),
(13, '2019-03-12', '2019-12-02', 'Cambio de parabrisas y pintura', 'no_vigente', '123ERD', 'BRION');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `repuestos`
--

CREATE TABLE `repuestos` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Tipo` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Categoria` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Marca` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Stock` int(11) NOT NULL,
  `Precio_costo` int(11) NOT NULL,
  `Precio_venta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `repuestos`
--

INSERT INTO `repuestos` (`ID`, `Nombre`, `Tipo`, `Categoria`, `Marca`, `Stock`, `Precio_costo`, `Precio_venta`) VALUES
(3, 'Maza dentada', 'Embrague', 'Moto', 'Honda', 5, 15000, 45000),
(4, ' Juego Balancín ', 'GL150  ', 'Moto', 'Honda ', 34, 25000, 50000),
(5, 'Manija de freno', 'Freno', 'Moto', 'Honda', 23, 12000, 34000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('LZCs6R-H9EBcXXYRMfPCYvGJvxjijjJw', 1576622477, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{\"error\":[\"Missing credentials\",\"Missing credentials\",\"Missing credentials\",\"Missing credentials\"]},\"passport\":{}}'),
('TjP6vjvn_Q-3_eXiDhubGS296JBYtpXG', 1576555631, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajador`
--

CREATE TABLE `trabajador` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Rut` varchar(13) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Edad` int(10) NOT NULL,
  `Fecha_Ingr` date NOT NULL,
  `Fecha_Egr` date NOT NULL,
  `Salario` int(50) NOT NULL,
  `Area_Trabajo` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Password` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `trabajador`
--

INSERT INTO `trabajador` (`ID`, `Nombre`, `Rut`, `Edad`, `Fecha_Ingr`, `Fecha_Egr`, `Salario`, `Area_Trabajo`, `Password`) VALUES
(8, 'Francisca Soza', '12.234.543-k', 38, '2015-11-12', '2020-11-12', 600000, 'Contadora', ''),
(9, 'Braulio Gonazales', '14.234.543-2', 34, '2015-04-12', '2012-02-04', 400000, 'Mecanico', ''),
(11, 'ben', '234', 213, '3242-03-12', '3234-12-23', 234324, 'asdf', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `rut` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`ID`, `nombre`, `rut`, `password`) VALUES
(1, 'Lucy Johanson', '12345', '$2a$10$JXWasTPQxmKocVW2FR9Bj.ufagryDM/gUlvJ9w/L1hQ'),
(2, 'ben', '123456789', '$2a$10$vEFaMHL0L6BZ2NZA5d5UGe3ww3rlu2jkvCH3p5iBuLB'),
(3, 'max', '1122', '$2a$10$x3QZvvGsjWy3mH68tSwQLOd3N2t9p7kSBukF.o3i0Zl'),
(5, 'ignacia', '19606301-2', '$2a$10$QZWJB44WN1CG/z0pqCVxpO0LJsqXZLVg5VF2/qdDsjs'),
(6, 'raul gomez', '12234', '$2a$10$y/KN4Zn.kUcih8HsIa8GeeoZE9krhpMwBDz85fLecDP'),
(7, 'benjamin', '11223344', '$2a$10$iFDTTSJOth31dbQghNYi/.Fmta6DQQk42zYdDZO6KZS'),
(8, 'cesar', '12345671', '$2a$10$LQfhvf18Qoydrj23hOTeHu6q3G6PMVbZrpdOT6bP5Pr'),
(9, 'cesa', '1234', '$2a$10$InSf82qoNlawHmCpljSOSOreQpbkKTiothsJV6foe17'),
(46, 'cesar', '123456789', '$2a$10$seiHpC/dptEQ6G3uWPzf/.9pHWisPgaajJj.tTwYMbw'),
(47, 'cesar', '123456789', '$2a$10$EHLBivzuFxVO7h0ZAxKQXek.TvR0lqx7w.lnUneTAgU'),
(48, 'cesar', '123456789', '$2a$10$zzVuE/FfIqsRvH0FVduiDuqHM2XRE8qyf/R8Ngi9Pbo'),
(49, 'cesar', '123456789', '$2a$10$OcBwvGarpwszUbi1Zi82YObYWdNoFXdcIBJAaUHRQRQ'),
(50, 'cesar', '123', '$2a$10$ZbA3biFXRhOYvjpoNePReOStz1lcxTK7IG2enUv6YkD'),
(51, '23', '123456789', '$2a$10$8LH6cKxpJV/ZjCupBePGCeWu4buDmQd.ktoaF8F0h2F'),
(52, 'bodoque', '123456', '$2a$10$YLZFx3yBihXVkQqyoce4/OMo0pBWjof.hcjl41Zs8vp'),
(53, 'juan', '789', '$2a$10$m0Q7ejtNiPBl.NhwPjBrEuKSbvNg5u3D43rUfoXfAcM'),
(54, 'cesar', '123', '$2a$10$yZMTMBeNCGvZBu/GpV.TQ.p60FRvvAW3Cea8TnZo0k6'),
(55, 'fran', '123545', '$2a$10$xShGhnGCKO21dqorYxSy2OLxfKHLni6qeRm7CciMF4M'),
(56, 'maria', '123', '$2a$10$4yk/AF8dFZLg3ntlw8rGmO/LEj2Bsqpj36J9NS2Fblb'),
(57, 'marco', '89324', '$2a$10$7qrG5bNqghwive96UzMv7eItdYDkxI.EMmFE47UEOHP'),
(58, 'Mirko', '1234563', '$2a$10$e6hWHXNwwVQFeN1447fGDeP/iw6q.rwIu2.iD1uzviE'),
(59, 'Roxanne', '123456', '$2a$10$GuA/C7knsPhs3taYiVWf8uXPWkucBV9o784spDKojVj'),
(60, 'Pamela', '1234656', '$2a$10$2WS6xFKcD9w6OmYceP1JvuyxL.IKw.IEPYmP9dU0fp1'),
(61, 'Rodrigo', '123456', '$2a$10$cDzrcZALhNCjfyFvpnuuT.J.QuWR5bIj.zNFGHHrwj5'),
(62, 'Felipe', '12345678', '$2a$10$I0UY5YX2ggN651YlP3cr9uwP4UYuVs0sYo/MG5X8cP/'),
(63, 'Roberto', '123465678', '$2a$10$pUpxhfG89eV3KoWcz1Y3N.CJS8nxGHjetkcdgNn99BU'),
(64, 'Marta', '12345678', '$2a$10$0/LTpSdkahjlE1GKSusOrusvx4enpJbgFpjsv.0gG5J'),
(65, 'Maria', '199400983', '$2a$10$uOujoOZKpebvE3iBFkXO6usGoSEf.BEFA/5As3s.Cts'),
(66, 'Alejandro', '103012302', '$2a$10$qbR9kSGIrH7su4FLQsZlkOdTmjeX3FYvBCX0JXtFAHW'),
(67, 'Maria', '199400983', '$2a$10$QjCX10dKLsAwUO3m6n6UkOb4d8J.sqk9YxPNMPPdsa5'),
(68, 'Alejandro', '123453534', '$2a$10$59BuxvLMEUm56.e4zsiGTurMCZNowReSvDrZBsBJE7D'),
(69, 'maria', '12345', '$2a$10$eufAmW9.FCRCXL8DvcdtauXJb3FNeor7byOcIgutzqE'),
(70, 'maria', '199400983', '$2a$10$4S5E.FB7Pr90DYYGCQbj6ekn7jCP7CHuG7UW52VB4zr'),
(71, 'graciela', '12323545', '$2a$10$sGSNx.L5LANDkIEfEi/7IOI56xuNxVTW6kb1lRSloYY');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividad`
--
ALTER TABLE `actividad`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `repuestos`
--
ALTER TABLE `repuestos`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indices de la tabla `trabajador`
--
ALTER TABLE `trabajador`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividad`
--
ALTER TABLE `actividad`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `repuestos`
--
ALTER TABLE `repuestos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `trabajador`
--
ALTER TABLE `trabajador`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
