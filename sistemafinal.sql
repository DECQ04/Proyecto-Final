-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 19-07-2019 a las 00:57:53
-- Versión del servidor: 5.7.26-0ubuntu0.18.04.1
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
  `titulo` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `cantidad` decimal(8,2) NOT NULL,
  `condicion` int(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `gastos`
--

INSERT INTO `gastos` (`id`, `id_manager`, `titulo`, `descripcion`, `fecha_hora`, `cantidad`, `condicion`, `created_at`, `updated_at`) VALUES
(1, 1, '000-9 By 1 3333', 'DEFAULT DESCRIPCIÓN 23', '2019-07-14 22:47:00', '5.00', 1, '2019-07-15 03:48:00', '2019-07-17 20:50:17');

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

INSERT INTO `pagos` (`id`, `id_persona`, `cantidad`, `fecha_hora`, `created_at`, `updated_at`, `estado`, `descripcion`, `condicion`) VALUES
(1, 1, '800.00', '2019-07-17 20:50:24', NULL, '2019-07-17 20:50:24', 0, 'pago al desarrollador por tarea 1', 1);

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
  `titulo` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_incio` date NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `pago_total` decimal(8,2) NOT NULL,
  `id_pago` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  `condicion` int(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `proyectos`
--

INSERT INTO `proyectos` (`id`, `id_manager`, `id_cliente`, `titulo`, `fecha_incio`, `fecha_vencimiento`, `pago_total`, `id_pago`, `estado`, `condicion`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 'Proyecto 1', '2019-07-08', '2019-07-31', '500000.00', 0, 1, 0, NULL, '2019-07-17 20:49:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tareas`
--

CREATE TABLE `tareas` (
  `id` int(11) NOT NULL,
  `id_proyecto` int(11) NOT NULL,
  `id_desarrollador` int(11) NOT NULL,
  `titulo` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_pago` int(11) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  `condicion` int(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tareas`
--

INSERT INTO `tareas` (`id`, `id_proyecto`, `id_desarrollador`, `titulo`, `descripcion`, `id_pago`, `estado`, `condicion`, `created_at`, `updated_at`) VALUES
(3, 1, 2, 'Tarea 1', 'Hacer Tare 1', NULL, 1, 0, NULL, '2019-07-17 20:50:11'),
(4, 1, 1, 'Tarea2', 'yfj,bm', 1, 1, 1, '2019-07-15 02:46:43', '2019-07-18 23:12:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `titulo` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `condicion` int(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tickets`
--

INSERT INTO `tickets` (`id`, `id_cliente`, `titulo`, `descripcion`, `fecha_hora`, `condicion`, `created_at`, `updated_at`) VALUES
(1, 3, 'tickets1', 'Tarea 1 si completar', '2019-07-08 09:26:31', 1, NULL, NULL);

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
(4, 'Daniel Eduardo 2', 'Cervantes Quintanilla', 3, '1530057@upv.edu.mx', NULL, 'Daniel', NULL, '9998775543', 1, '2019-07-15 18:46:23', '2019-07-15 18:46:23'),
(5, 'Daniel Eduardo--', 'Cervantes Quintanilla', 3, '1530057@upv.edu.mx', NULL, 'Daniel', NULL, '1234567890', 1, '2019-07-16 07:16:45', '2019-07-16 07:16:45'),
(6, 'e', 'e', 3, 'gdvcsxagb@gmail.com', NULL, '1233', NULL, '8341301808', 1, '2019-07-17 21:38:56', '2019-07-17 21:38:56'),
(7, 'desarrollador1', NULL, 2, 'des2@gmail.com', NULL, '$2y$10$ZAxQ3hdzUTs7.0p56NHbT.LLq5Lgj6mzaAxz6LaCX.qdLVd5tNzOm', NULL, '89765788', 1, '2019-07-18 19:40:49', '2019-07-18 19:40:49');

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
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_pago` (`id_pago`);

--
-- Indices de la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_proyecto` (`id_proyecto`),
  ADD KEY `id_desarrollador` (`id_desarrollador`),
  ADD KEY `id_pago` (`id_pago`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tareas`
--
ALTER TABLE `tareas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
  ADD CONSTRAINT `tareas_ibfk_2` FOREIGN KEY (`id_proyecto`) REFERENCES `proyectos` (`id`),
  ADD CONSTRAINT `tareas_ibfk_3` FOREIGN KEY (`id_pago`) REFERENCES `pagos` (`id`);

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
