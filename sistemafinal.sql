-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 07-08-2019 a las 19:12:20
-- Versión del servidor: 5.7.27-0ubuntu0.18.04.1
-- Versión de PHP: 7.2.19-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistemafinal`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gastos`
--

CREATE TABLE `gastos` (
  `id` int(11) NOT NULL,
  `id_manager` int(11) NOT NULL,
  `id_tarea` int(11) NOT NULL,
  `titulo` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cantidad` decimal(8,2) NOT NULL,
  `condicion` int(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `gastos`
--

INSERT INTO `gastos` (`id`, `id_manager`, `id_tarea`, `titulo`, `descripcion`, `fecha_hora`, `cantidad`, `condicion`, `created_at`, `updated_at`) VALUES
(1, 1, 0, '000-9 By 1 3333', 'DEFAULT DESCRIPCIÓN 23', '2019-07-14 22:47:00', '5.00', 1, '2019-07-15 03:48:00', '2019-07-17 20:50:17'),
(2, 8, 4, 'Dominio', 'Comprar un dominio', '2019-07-30 02:39:45', '100.00', 1, '2019-07-29 15:45:43', '2019-07-30 02:39:45'),
(3, 8, 3, NULL, 'dfg', '2019-08-06 20:38:49', '44.00', 1, '2019-08-06 20:38:49', '2019-08-06 20:38:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_07_08_220314_create_personas_table', 1),
(4, '2019_07_08_220459_create_proyectos_table', 1),
(5, '2019_07_08_220545_create_tareas_table', 1),
(6, '2019_07_08_220616_create_gastos_table', 1),
(7, '2019_07_08_220647_create_pagos_table', 1),
(8, '2019_07_08_220750_create_tickets_table', 1),
(9, '2019_07_08_220902_create_ticket_respuestas_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `id_proyecto` int(11) NOT NULL,
  `cantidad` decimal(8,2) NOT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `condicion` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`id`, `id_persona`, `id_proyecto`, `cantidad`, `fecha_hora`, `created_at`, `updated_at`, `estado`, `descripcion`, `condicion`) VALUES
(1, 1, 0, '800.00', '2019-07-17 20:50:24', NULL, '2019-07-17 20:50:24', 0, 'pago al desarrollador por tarea 1', 1),
(2, 10, 0, '15000.00', '2019-07-29 17:37:36', '2019-07-29 15:44:12', '2019-07-29 15:44:12', 0, 'Proyecto x', 1),
(3, 10, 0, '5000.00', '2019-07-29 17:37:56', '2019-07-29 15:52:00', '2019-07-29 15:52:00', 0, 'Pago por Proyecto 1', 1),
(4, 8, 2, '4444.00', '2019-07-30 02:40:27', '2019-07-30 02:40:11', '2019-07-30 02:40:27', 0, 'pago proyecto', 1),
(5, 8, 6, '10000.00', '2019-08-06 20:37:34', '2019-08-06 20:37:34', '2019-08-06 20:37:34', 0, 'wfe', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyectos`
--

CREATE TABLE `proyectos` (
  `id` int(11) NOT NULL,
  `id_manager` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `titulo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_incio` date NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `pago_total` decimal(8,2) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  `condicion` int(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `proyectos`
--

INSERT INTO `proyectos` (`id`, `id_manager`, `id_cliente`, `titulo`, `fecha_incio`, `fecha_vencimiento`, `pago_total`, `estado`, `condicion`, `created_at`, `updated_at`) VALUES
(1, 8, 10, 'Proyecto 1', '2019-07-08', '2019-07-31', '500000.00', 0, 1, NULL, '2019-07-29 20:23:42'),
(2, 8, 3, 'Proyecto x', '2019-07-29', '2019-07-31', '10.00', 1, 1, '2019-07-29 15:48:37', '2019-08-05 05:03:40'),
(3, 8, 15, 'Mr.', '2019-07-04', '2019-07-31', '123.00', 1, 1, '2019-07-29 20:20:33', '2019-07-29 20:20:33'),
(4, 8, 10, '1-8', '2019-08-10', '2019-08-02', '900.00', 1, 1, '2019-08-05 19:37:41', '2019-08-05 19:37:41'),
(5, 8, 10, '1-8', '2019-08-05', '2019-08-30', '900.00', 1, 0, '2019-08-05 19:38:04', '2019-08-05 19:38:24'),
(6, 8, 17, 'Webpage Transpais', '2019-08-10', '2019-08-25', '233345.00', 1, 1, '2019-08-06 20:37:13', '2019-08-06 20:37:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyectos_colaboradores`
--

CREATE TABLE `proyectos_colaboradores` (
  `id` int(11) NOT NULL,
  `id_proyecto` int(10) NOT NULL,
  `id_desarrollador` int(10) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proyectos_colaboradores`
--

INSERT INTO `proyectos_colaboradores` (`id`, `id_proyecto`, `id_desarrollador`, `updated_at`, `created_at`) VALUES
(1, 1, 14, '2019-07-29 10:00:00', '2019-07-18 19:40:49'),
(2, 2, 13, NULL, NULL),
(3, 6, 14, '2019-08-06 20:39:23', '2019-08-06 20:39:23'),
(4, 1, 7, '2019-08-07 03:40:08', '2019-08-07 03:40:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tareas`
--

CREATE TABLE `tareas` (
  `id` int(11) NOT NULL,
  `id_proyecto` int(11) NOT NULL,
  `id_desarrollador` int(11) NOT NULL,
  `titulo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pago_total` decimal(10,0) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  `condicion` int(1) NOT NULL DEFAULT '1',
  `fecha_inicio` date DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tareas`
--

INSERT INTO `tareas` (`id`, `id_proyecto`, `id_desarrollador`, `titulo`, `descripcion`, `pago_total`, `estado`, `condicion`, `fecha_inicio`, `fecha_vencimiento`, `created_at`, `updated_at`) VALUES
(3, 1, 14, 'Tarea 1 :Compra PC', 'Comprar una MAC', '18000', 1, 1, '2019-07-29', '2019-07-31', NULL, '2019-08-05 19:41:00'),
(4, 1, 14, 'Tarea 2: Patrocinio', 'Conseguir inversionistas para lanzar el sistema', '23300', 0, 1, '2019-07-12', '2019-07-31', '2019-07-15 02:46:43', '2019-08-05 19:41:07'),
(5, 2, 13, 'Tarea 3: Servidores', 'Pagar el uso de los servidores por 12 meces.', '240000', 1, 1, '2019-07-30', '2019-08-07', NULL, '2019-07-31 19:33:53'),
(6, 6, 14, 'analisis', 'klk', '34', 1, 1, '2019-08-21', '2019-08-22', '2019-08-06 20:39:23', '2019-08-06 20:39:23'),
(7, 1, 7, '000-D', 'DEFAULT DESC', '5', 1, 1, '2019-08-06', '2019-08-21', '2019-08-07 03:40:08', '2019-08-07 03:40:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_tarea` int(11) NOT NULL,
  `titulo` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `anexo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `condicion` int(1) NOT NULL DEFAULT '1',
  `estado` int(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tickets`
--

INSERT INTO `tickets` (`id`, `id_cliente`, `id_tarea`, `titulo`, `descripcion`, `anexo`, `fecha_hora`, `condicion`, `estado`, `created_at`, `updated_at`) VALUES
(1, 10, 4, 'tickets1', 'Tarea 1 si completar', NULL, '2019-07-29 17:58:22', 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ticket_respuestas`
--

CREATE TABLE `ticket_respuestas` (
  `id` int(11) NOT NULL,
  `id_ticket` int(11) NOT NULL,
  `id_desarrollador` int(11) NOT NULL,
  `titulo` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ticket_respuestas`
--

INSERT INTO `ticket_respuestas` (`id`, `id_ticket`, `id_desarrollador`, `titulo`, `descripcion`, `fecha_hora`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'respuesta ticket 1', 'verificando ', '2019-07-09 10:35:35', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `condicion` int(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `apellido`, `tipo`, `email`, `email_verified_at`, `password`, `remember_token`, `telefono`, `condicion`, `created_at`, `updated_at`) VALUES
(1, 'valeria', 'esquivel', 1, 'admin@admin.com', NULL, 'admin', NULL, '8341301808', 1, NULL, NULL),
(2, 'Daniel', 'cervantes', 2, 'daniel@des.com', NULL, 'daniel', NULL, '8325177', 1, NULL, '2019-07-17 20:50:43'),
(3, 'cliente 1', 'cliente', 3, 'cliente@cliente.com', NULL, 'cliente1', NULL, '8765432', 1, NULL, '2019-07-17 20:50:36'),
(7, 'El desarrollador', NULL, 2, 'des2@gmail.com', NULL, '$2y$10$ZAxQ3hdzUTs7.0p56NHbT.LLq5Lgj6mzaAxz6LaCX.qdLVd5tNzOm', NULL, '89765788', 1, '2019-07-18 19:40:49', '2019-07-21 01:36:15'),
(8, 'Mario Humberto Rodríguez Chávez', NULL, 1, 'mrodriguezc@upv.edu.mx', NULL, '$2y$10$rZAK/0KXsvUFyThoTQUr1.yE5tWBlCGjv0ZQEyB07ie6BzDU5S70a', '5xeJAF2neHxKLhr7Fyz5mJWYnMh2KHBNvVZXUgnvox6aO2RCqpDpGjeSdOt6', '8300000000', 1, '2019-07-19 01:31:50', '2019-07-19 01:31:50'),
(9, 'Mario Humberto', NULL, 1, 'mrodriguezc@upv.edu.mx', NULL, '$2y$10$.DTgI5N2d1kBa8ssEBvhqu7EzUMpZUnlejhNuutRpODSD1m1EkNWG', NULL, '8300000000', 1, '2019-07-19 01:33:05', '2019-07-19 01:33:05'),
(10, 'Valeria Alexandra Esquivel Dominguez', NULL, 3, 'cliente@gmail.com', NULL, '$2y$10$wqi4X0TL1gMJprUIMDfpBux2QPmqL9LrXttTAP21skCGhjR7Ttaau', NULL, '8341301808', 1, '2019-07-24 18:50:05', '2019-07-31 19:25:54'),
(11, 'desarrollador 1', NULL, 2, 'des1@gmail.com', NULL, '$2y$10$4RHFcG5Zm09RKMU/gRC4aePU9Ho8y2Q1.kIaBSKXNs9x5dNLgZLB6', NULL, '8341301808', 0, '2019-07-24 18:51:06', '2019-07-24 18:51:25'),
(12, 'desarrollador 1', NULL, 2, 'des1@gmail.com', NULL, '$2y$10$blW0.XeEss6YtsXAdvOdduTDgrjQxNFHCkKUQuFGGA2kCJ5zKDivy', NULL, '8341301808', 1, '2019-07-24 18:51:07', '2019-07-24 18:51:07'),
(13, 'Daniel', NULL, 2, '1530057@upv.edu.mx', NULL, '$2y$10$UniRgCk1mQ4itEb251v7aeM4Ake3nq1w7vtFIN94IfuyIZ7OPZTcC', NULL, '8341301808', 1, '2019-07-29 15:56:54', '2019-07-29 15:56:54'),
(14, 'Eduardo', NULL, 2, 'eduardo@gmail.com', NULL, '$2y$10$qhNOcmiVoqt2bw9JCsRfz.cGmDZl12UTIRNHaDJQZpRJRwB6OHH9i', NULL, '834111111', 1, '2019-07-29 15:59:51', '2019-07-29 15:59:51'),
(15, 'Juan', NULL, 3, 'systemas@gmail.com', NULL, '$2y$10$ay06LuYRvUT/mF9FTOIQsuIam.qVOE2dFXmHePHnXYKpVGPdyzxp2', NULL, '123', 1, '2019-07-29 20:18:51', '2019-07-29 20:18:51'),
(16, '9o', NULL, 3, '9080@upv.com', NULL, '$2y$10$sNt2xVOEsV.RkXPbdXQrvu6Fsv57OTqrruFn.QUQ.wfJR8ls9HzJK', NULL, 'oioop', 1, '2019-08-05 19:39:20', '2019-08-05 19:39:20'),
(17, 'Jose', NULL, 3, 'demo@eee.n', NULL, '$2y$10$ycWNEFcYioDnKlhhiswPvu5bIwG1aALjyirT6.3YnGZfvQV8IhTSa', NULL, '234', 1, '2019-08-06 20:36:49', '2019-08-06 20:36:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users2`
--

CREATE TABLE `users2` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `gastos`
--
ALTER TABLE `gastos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_manager` (`id_manager`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_persona` (`id_persona`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_manager` (`id_manager`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `proyectos_colaboradores`
--
ALTER TABLE `proyectos_colaboradores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_proyecto` (`id_proyecto`),
  ADD KEY `id_desarrollador` (`id_desarrollador`);

--
-- Indices de la tabla `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `ticket_respuestas`
--
ALTER TABLE `ticket_respuestas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_ticket` (`id_ticket`),
  ADD KEY `id_desarrollador` (`id_desarrollador`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users2`
--
ALTER TABLE `users2`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `gastos`
--
ALTER TABLE `gastos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `proyectos_colaboradores`
--
ALTER TABLE `proyectos_colaboradores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tareas`
--
ALTER TABLE `tareas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ticket_respuestas`
--
ALTER TABLE `ticket_respuestas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `users2`
--
ALTER TABLE `users2`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `gastos`
--
ALTER TABLE `gastos`
  ADD CONSTRAINT `gastos_ibfk_1` FOREIGN KEY (`id_manager`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD CONSTRAINT `proyectos_ibfk_1` FOREIGN KEY (`id_manager`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `proyectos_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD CONSTRAINT `tareas_ibfk_1` FOREIGN KEY (`id_desarrollador`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `tareas_ibfk_2` FOREIGN KEY (`id_proyecto`) REFERENCES `proyectos` (`id`);

--
-- Filtros para la tabla `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `ticket_respuestas`
--
ALTER TABLE `ticket_respuestas`
  ADD CONSTRAINT `ticket_respuestas_ibfk_1` FOREIGN KEY (`id_ticket`) REFERENCES `tickets` (`id`),
  ADD CONSTRAINT `ticket_respuestas_ibfk_2` FOREIGN KEY (`id_desarrollador`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
