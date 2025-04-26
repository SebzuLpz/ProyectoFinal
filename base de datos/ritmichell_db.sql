-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 26-04-2025 a las 03:55:58
-- Versión del servidor: 5.7.24
-- Versión de PHP: 8.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ritmichell_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colegios`
--

CREATE TABLE `colegios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `colegios`
--

INSERT INTO `colegios` (`id`, `nombre`) VALUES
(9, 'Carlos Federichi'),
(10, 'Rodrigo Arenas'),
(11, 'San Pedro'),
(12, 'Villemar'),
(13, 'Van Uden'),
(14, 'Santa Teresa'),
(15, 'Anunciacion'),
(16, 'Injuv'),
(17, 'San José'),
(18, 'Felicidad'),
(19, 'Pablo Neruda'),
(20, 'Costa Rica'),
(21, 'Luis Angel Arango'),
(22, 'Integrado'),
(23, 'Internacional'),
(24, 'Los Andes'),
(25, 'Liceo Americano'),
(26, 'Liceo Salamanca'),
(27, 'Nuestra Señora del Carmen'),
(28, 'Santa Ana'),
(29, 'Marie Curie');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `costs`
--

CREATE TABLE `costs` (
  `id` int(11) NOT NULL,
  `colegio` varchar(100) NOT NULL,
  `tipo_uniforme` varchar(50) NOT NULL,
  `month` varchar(7) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `description` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `costs`
--

INSERT INTO `costs` (`id`, `colegio`, `tipo_uniforme`, `month`, `amount`, `description`, `created_at`) VALUES
(1, 'Neruda', 'Uniforme Deportivo', '2025-03', '5550000.00', 'AAaaaa', '2025-04-03 22:11:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventory`
--

CREATE TABLE `inventory` (
  `id` varchar(32) NOT NULL,
  `colegio` varchar(100) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `prenda` varchar(50) NOT NULL,
  `talla` varchar(10) NOT NULL,
  `cantidad` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `inventory`
--

INSERT INTO `inventory` (`id`, `colegio`, `categoria`, `prenda`, `talla`, `cantidad`, `created_at`, `updated_at`) VALUES
('07badf495b17de025bf21a0545e66a72', 'Neruda', 'Mujer', 'Buso', '4', 70, '2025-03-31 02:16:08', '2025-04-26 02:41:42'),
('155fd3cb29755360c626bbb9f5ec9302', 'Felicidad', 'Mujer', 'Sudadera', 'S', 30, '2025-04-02 10:28:33', '2025-04-26 00:46:42'),
('27206176f3ce4a5497366ad484f3ffe3', 'Neruda', 'Hombre', 'Camiseta', '4', 23, '2025-04-01 09:06:54', '2025-04-01 09:06:54'),
('6be6867800592c4b2531ee1b631ddc52', 'Felicidad', 'Hombre', 'Sudadera', '4', 12, '2025-03-31 01:51:14', '2025-03-31 01:51:14'),
('a62fa77d9cc9ecaa445806ee91198da8', 'Carlos Federichi', 'Mujer', 'Camisa', '4', 56, '2025-04-23 23:19:30', '2025-04-23 23:19:30'),
('ab760dabd8662dc012a7e03feb42b6ec', 'Villemar', 'Hombre', 'Camiseta', 'S', 18, '2025-04-01 08:44:30', '2025-04-03 22:27:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `report_date` date NOT NULL,
  `total_items` int(11) NOT NULL,
  `items_added` int(11) NOT NULL,
  `items_removed` int(11) NOT NULL,
  `data` json NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `reports`
--

INSERT INTO `reports` (`id`, `report_date`, `total_items`, `items_added`, `items_removed`, `data`) VALUES
(11, '2025-04-25', 6, 1, 0, '{\"fecha\": \"2025-04-26T00:20:52.173Z\", \"resumen\": {\"salidas\": 0, \"entradas\": 1}, \"inventario\": [{\"id\": \"07badf495b17de025bf21a0545e66a72\", \"talla\": \"4\", \"prenda\": \"Buso\", \"colegio\": \"Neruda\", \"cantidad\": 90, \"categoria\": \"Mujer\", \"created_at\": \"2025-03-31T02:16:08.000Z\", \"updated_at\": \"2025-04-26T00:12:48.000Z\"}, {\"id\": \"155fd3cb29755360c626bbb9f5ec9302\", \"talla\": \"S\", \"prenda\": \"Sudadera\", \"colegio\": \"Felicidad\", \"cantidad\": 62, \"categoria\": \"Mujer\", \"created_at\": \"2025-04-02T10:28:33.000Z\", \"updated_at\": \"2025-04-17T06:05:17.000Z\"}, {\"id\": \"27206176f3ce4a5497366ad484f3ffe3\", \"talla\": \"4\", \"prenda\": \"Camiseta\", \"colegio\": \"Neruda\", \"cantidad\": 23, \"categoria\": \"Hombre\", \"created_at\": \"2025-04-01T09:06:54.000Z\", \"updated_at\": \"2025-04-01T09:06:54.000Z\"}, {\"id\": \"6be6867800592c4b2531ee1b631ddc52\", \"talla\": \"4\", \"prenda\": \"Sudadera\", \"colegio\": \"Felicidad\", \"cantidad\": 12, \"categoria\": \"Hombre\", \"created_at\": \"2025-03-31T01:51:14.000Z\", \"updated_at\": \"2025-03-31T01:51:14.000Z\"}, {\"id\": \"a62fa77d9cc9ecaa445806ee91198da8\", \"talla\": \"4\", \"prenda\": \"Camisa\", \"colegio\": \"Carlos Federichi\", \"cantidad\": 56, \"categoria\": \"Mujer\", \"created_at\": \"2025-04-23T23:19:30.000Z\", \"updated_at\": \"2025-04-23T23:19:30.000Z\"}, {\"id\": \"ab760dabd8662dc012a7e03feb42b6ec\", \"talla\": \"S\", \"prenda\": \"Camiseta\", \"colegio\": \"Villemar\", \"cantidad\": 18, \"categoria\": \"Hombre\", \"created_at\": \"2025-04-01T08:44:30.000Z\", \"updated_at\": \"2025-04-03T22:27:19.000Z\"}], \"movimientos\": [{\"id\": 1, \"tipo\": \"ENTRADA\", \"talla\": \"4\", \"prenda\": \"Buso\", \"colegio\": \"Neruda\", \"isAdmin\": 1, \"cantidad\": 10, \"created_at\": \"2025-04-26T00:12:48.000Z\"}]}'),
(12, '2025-04-25', 6, 1, 1, '{\"fecha\": \"2025-04-26T00:46:45.761Z\", \"resumen\": {\"salidas\": 1, \"entradas\": 1}, \"inventario\": [{\"id\": \"07badf495b17de025bf21a0545e66a72\", \"talla\": \"4\", \"prenda\": \"Buso\", \"colegio\": \"Neruda\", \"cantidad\": 90, \"categoria\": \"Mujer\", \"created_at\": \"2025-03-31T02:16:08.000Z\", \"updated_at\": \"2025-04-26T00:12:48.000Z\"}, {\"id\": \"155fd3cb29755360c626bbb9f5ec9302\", \"talla\": \"S\", \"prenda\": \"Sudadera\", \"colegio\": \"Felicidad\", \"cantidad\": 30, \"categoria\": \"Mujer\", \"created_at\": \"2025-04-02T10:28:33.000Z\", \"updated_at\": \"2025-04-26T00:46:42.000Z\"}, {\"id\": \"27206176f3ce4a5497366ad484f3ffe3\", \"talla\": \"4\", \"prenda\": \"Camiseta\", \"colegio\": \"Neruda\", \"cantidad\": 23, \"categoria\": \"Hombre\", \"created_at\": \"2025-04-01T09:06:54.000Z\", \"updated_at\": \"2025-04-01T09:06:54.000Z\"}, {\"id\": \"6be6867800592c4b2531ee1b631ddc52\", \"talla\": \"4\", \"prenda\": \"Sudadera\", \"colegio\": \"Felicidad\", \"cantidad\": 12, \"categoria\": \"Hombre\", \"created_at\": \"2025-03-31T01:51:14.000Z\", \"updated_at\": \"2025-03-31T01:51:14.000Z\"}, {\"id\": \"a62fa77d9cc9ecaa445806ee91198da8\", \"talla\": \"4\", \"prenda\": \"Camisa\", \"colegio\": \"Carlos Federichi\", \"cantidad\": 56, \"categoria\": \"Mujer\", \"created_at\": \"2025-04-23T23:19:30.000Z\", \"updated_at\": \"2025-04-23T23:19:30.000Z\"}, {\"id\": \"ab760dabd8662dc012a7e03feb42b6ec\", \"talla\": \"S\", \"prenda\": \"Camiseta\", \"colegio\": \"Villemar\", \"cantidad\": 18, \"categoria\": \"Hombre\", \"created_at\": \"2025-04-01T08:44:30.000Z\", \"updated_at\": \"2025-04-03T22:27:19.000Z\"}], \"movimientos\": [{\"id\": 1, \"tipo\": \"ENTRADA\", \"talla\": \"4\", \"prenda\": \"Buso\", \"colegio\": \"Neruda\", \"isAdmin\": 1, \"cantidad\": 10, \"created_at\": \"2025-04-26T00:12:48.000Z\"}, {\"id\": 2, \"tipo\": \"SALIDA\", \"talla\": \"S\", \"prenda\": \"Sudadera\", \"colegio\": \"Felicidad\", \"isAdmin\": 1, \"cantidad\": 32, \"created_at\": \"2025-04-26T00:46:42.000Z\"}]}'),
(13, '2025-04-25', 6, 1, 2, '{\"fecha\": \"2025-04-26T02:41:54.572Z\", \"resumen\": {\"salidas\": 2, \"entradas\": 1}, \"inventario\": [{\"id\": \"07badf495b17de025bf21a0545e66a72\", \"talla\": \"4\", \"prenda\": \"Buso\", \"colegio\": \"Neruda\", \"cantidad\": 70, \"categoria\": \"Mujer\", \"created_at\": \"2025-03-31T02:16:08.000Z\", \"updated_at\": \"2025-04-26T02:41:42.000Z\"}, {\"id\": \"155fd3cb29755360c626bbb9f5ec9302\", \"talla\": \"S\", \"prenda\": \"Sudadera\", \"colegio\": \"Felicidad\", \"cantidad\": 30, \"categoria\": \"Mujer\", \"created_at\": \"2025-04-02T10:28:33.000Z\", \"updated_at\": \"2025-04-26T00:46:42.000Z\"}, {\"id\": \"27206176f3ce4a5497366ad484f3ffe3\", \"talla\": \"4\", \"prenda\": \"Camiseta\", \"colegio\": \"Neruda\", \"cantidad\": 23, \"categoria\": \"Hombre\", \"created_at\": \"2025-04-01T09:06:54.000Z\", \"updated_at\": \"2025-04-01T09:06:54.000Z\"}, {\"id\": \"6be6867800592c4b2531ee1b631ddc52\", \"talla\": \"4\", \"prenda\": \"Sudadera\", \"colegio\": \"Felicidad\", \"cantidad\": 12, \"categoria\": \"Hombre\", \"created_at\": \"2025-03-31T01:51:14.000Z\", \"updated_at\": \"2025-03-31T01:51:14.000Z\"}, {\"id\": \"a62fa77d9cc9ecaa445806ee91198da8\", \"talla\": \"4\", \"prenda\": \"Camisa\", \"colegio\": \"Carlos Federichi\", \"cantidad\": 56, \"categoria\": \"Mujer\", \"created_at\": \"2025-04-23T23:19:30.000Z\", \"updated_at\": \"2025-04-23T23:19:30.000Z\"}, {\"id\": \"ab760dabd8662dc012a7e03feb42b6ec\", \"talla\": \"S\", \"prenda\": \"Camiseta\", \"colegio\": \"Villemar\", \"cantidad\": 18, \"categoria\": \"Hombre\", \"created_at\": \"2025-04-01T08:44:30.000Z\", \"updated_at\": \"2025-04-03T22:27:19.000Z\"}], \"movimientos\": [{\"id\": 1, \"tipo\": \"ENTRADA\", \"talla\": \"4\", \"prenda\": \"Buso\", \"colegio\": \"Neruda\", \"isAdmin\": 1, \"cantidad\": 10, \"created_at\": \"2025-04-26T00:12:48.000Z\"}, {\"id\": 2, \"tipo\": \"SALIDA\", \"talla\": \"S\", \"prenda\": \"Sudadera\", \"colegio\": \"Felicidad\", \"isAdmin\": 1, \"cantidad\": 32, \"created_at\": \"2025-04-26T00:46:42.000Z\"}, {\"id\": 3, \"tipo\": \"SALIDA\", \"talla\": \"4\", \"prenda\": \"Buso\", \"colegio\": \"Neruda\", \"isAdmin\": 1, \"cantidad\": 20, \"created_at\": \"2025-04-26T02:41:42.000Z\"}]}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `settings`
--

CREATE TABLE `settings` (
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `settings`
--

INSERT INTO `settings` (`name`, `value`) VALUES
('report_day', '6');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock_movements`
--

CREATE TABLE `stock_movements` (
  `id` int(11) NOT NULL,
  `colegio` varchar(255) DEFAULT NULL,
  `prenda` varchar(255) DEFAULT NULL,
  `talla` varchar(255) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isAdmin` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `stock_movements`
--

INSERT INTO `stock_movements` (`id`, `colegio`, `prenda`, `talla`, `cantidad`, `tipo`, `created_at`, `isAdmin`) VALUES
(1, 'Neruda', 'Buso', '4', 10, 'ENTRADA', '2025-04-26 00:12:48', 1),
(2, 'Felicidad', 'Sudadera', 'S', 32, 'SALIDA', '2025-04-26 00:46:42', 1),
(3, 'Neruda', 'Buso', '4', 20, 'SALIDA', '2025-04-26 02:41:42', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `password_hash`, `is_admin`, `created_at`) VALUES
(1, 'admin', '240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9', 1, '2025-02-26 09:08:28'),
(2, 'user', 'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 0, '2025-02-26 09:08:28'),
(5, 'asd', '688787d8ff144c502c7f5cffaafe2cc588d86079f9de88304c26b0cb99ce91c6', 1, '2025-04-26 01:16:37');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `colegios`
--
ALTER TABLE `colegios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `costs`
--
ALTER TABLE `costs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_product` (`colegio`,`categoria`,`prenda`,`talla`);

--
-- Indices de la tabla `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`name`);

--
-- Indices de la tabla `stock_movements`
--
ALTER TABLE `stock_movements`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `colegios`
--
ALTER TABLE `colegios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `costs`
--
ALTER TABLE `costs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `stock_movements`
--
ALTER TABLE `stock_movements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
