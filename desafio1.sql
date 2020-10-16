-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 16-10-2020 a las 18:24:28
-- Versión del servidor: 8.0.21-0ubuntu0.20.04.4
-- Versión de PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `desafio1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amigos`
--

CREATE TABLE `amigos` (
  `id_us` int NOT NULL,
  `id_amigo` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `casas`
--

CREATE TABLE `casas` (
  `id_int` int NOT NULL,
  `nombre` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `casas`
--

INSERT INTO `casas` (`id_int`, `nombre`, `descripcion`) VALUES
(1, 'Gryffindor', 'La Casa Gryffindor fue fundada por el célebre mago Godric Gryffindor. Godric sólo aceptaba en su casa a aquellos magos y brujas que tenían valentía, disposición, coraje y caballerosidad, ya que éstas son las cualidades de un auténtico Gryffindor. Los colores de esta casa son el dorado y el escarlata y su símbolo es un león. La reliquia más preciada de la casa es la espada de Godric Gryffindor, perteneciente, como su nombre indica, al fundador de la casa. Los estudiantes de esta casa pasan la mayor parte del tiempo en la Torre de Gryffindor, ubicada en el séptimo piso del Castillo de Hogwarts. '),
(2, 'Hufflepuff', 'La Sala Común de Hufflepuff se encuentra en una bodega en el mismo pasillo subterráneo que la cocina. Inicialmente, Hufflepuff buscaba alumnos que simplemente quisieran pertenecer a esa casa, aunque actualmente busca alumnos leales, honestos y que no teman el trabajo pesado. La fundadora es nada menos que la bruja Helga Hufflepuff, amiga desde la infancia de Rowena Ravenclaw. Helga fue una bruja muy noble, amigable y la principal impulsora de que Hogwarts aceptase a alumnos nacidos de muggles. La principal reliquia de la casa es la copa de Helga Hufflepuff. El símbolo de la casa es un tejón negro y sus colores representativos son el amarillo y el negro carbón. '),
(3, 'Ravenclaw', 'La Casa Ravenclaw se encuentra en una torre en el ala oeste del castillo. En la entrada se encuentra una estatua con forma de águila hace dice acertijos y sólo te deja entrar si lo resuelves. Sus colores son el azul y el bronce. Ravenclaw busca alumnos académicos, estudiosos y que siempre sepan lo que hay que hacer. Fue fundada por la bruja, nacida en las cañadas de Escocia, Rowena Ravenclaw. Supuestamente es la principal inventora del nombre, lugar y formato de Hogwarts. También es la causante de que las escaleras se muevan. Su principal reliquia es la diadema de Rowena Ravenclaw. El símbolo de la casa es el águila, aunque en alguna versión del escudo es un cuervo. '),
(4, 'Slytherin', 'La Casa Slytherin está caracterizada principalmente por la ambición y la astucia. Fue fundada por el mago Salazar Slytherin. La Sala Común está situada en las mazmorras, pasando por un serie de numerosos pasillos subterráneos. Posiblemente se llega a ellos a través del Vestíbulo de Hogwarts . Específicamente se encuentra debajo del Lago Negro, haciendo que la sala común sea fría y con una tonalidad verdosa, ya que hay ventanas que dan a las aguas. Se accede a ella por una puerta altamente disimulada en un muro de piedra, diciendo una contraseña requerida. La única conocida es \"Sangre Pura\". Su principal reliquia es el guardapelo de Salazar Slytherin. El animal representativo es la serpiente, sus colores son verde y plateado y el elemento es el agua, asociada con la astucia y la frialdad. ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `casa_estudiante`
--

CREATE TABLE `casa_estudiante` (
  `id_int` int NOT NULL,
  `id_us` int NOT NULL,
  `valoracion` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `casa_estudiante`
--

INSERT INTO `casa_estudiante` (`id_int`, `id_us`, `valoracion`) VALUES
(1, 1, 350),
(1, 6, 340);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajes`
--

CREATE TABLE `mensajes` (
  `id_men` int NOT NULL,
  `id_env` int NOT NULL,
  `id_rez` int NOT NULL,
  `asunto` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contenido` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` date NOT NULL,
  `leido` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int NOT NULL,
  `nombre` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `nombre`) VALUES
(2, 'admin'),
(1, 'user');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id_us` int NOT NULL,
  `email` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nick` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pass` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidos` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `edad` int DEFAULT NULL,
  `sexo` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img` longblob,
  `rol` int NOT NULL DEFAULT '0',
  `validado` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id_us`, `email`, `nick`, `pass`, `nombre`, `apellidos`, `edad`, `sexo`, `img`, `rol`, `validado`) VALUES
(1, 'Obiguan@gmail.com', 'Obiguan_jedi', 'jedi', 'obiguan', 'none', 40, 'male', NULL, 2, 1),
(2, 'jane@gmail.com', 'jane_doe', 'jane', 'jane', 'doe', 0, 'female', NULL, 1, 0),
(4, 'sergiosusin.ssc@gmail.com', 'corrafloja', 'melocoton', 'sergio', 'Carmelo@gmail.com', 0, 'mujer', NULL, 1, 0),
(5, 'Carmelocoton@gmail.com', 'carmelo', 'melocoton', 'sergio', 'Carmelo@gmail.com', 17, 'hombre', NULL, 1, 0),
(6, 'natalia@gmail.com', 'natalia', 'jedi', 'natalia', 'susin cejudo', 25, 'mujer', NULL, 1, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `amigos`
--
ALTER TABLE `amigos`
  ADD PRIMARY KEY (`id_us`,`id_amigo`),
  ADD KEY `amigo_us` (`id_amigo`);

--
-- Indices de la tabla `casas`
--
ALTER TABLE `casas`
  ADD PRIMARY KEY (`id_int`);

--
-- Indices de la tabla `casa_estudiante`
--
ALTER TABLE `casa_estudiante`
  ADD PRIMARY KEY (`id_int`,`id_us`),
  ADD KEY `int_us` (`id_us`);

--
-- Indices de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD PRIMARY KEY (`id_men`),
  ADD KEY `us_env` (`id_env`),
  ADD KEY `us_rez` (`id_rez`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_us`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `rol_us` (`rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `casas`
--
ALTER TABLE `casas`
  MODIFY `id_int` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  MODIFY `id_men` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id_us` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `amigos`
--
ALTER TABLE `amigos`
  ADD CONSTRAINT `amigo_us` FOREIGN KEY (`id_amigo`) REFERENCES `user` (`id_us`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `us_user` FOREIGN KEY (`id_us`) REFERENCES `user` (`id_us`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `casa_estudiante`
--
ALTER TABLE `casa_estudiante`
  ADD CONSTRAINT `int_int` FOREIGN KEY (`id_int`) REFERENCES `casas` (`id_int`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `int_us` FOREIGN KEY (`id_us`) REFERENCES `user` (`id_us`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD CONSTRAINT `us_env` FOREIGN KEY (`id_env`) REFERENCES `user` (`id_us`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `us_rez` FOREIGN KEY (`id_rez`) REFERENCES `user` (`id_us`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `rol_us` FOREIGN KEY (`rol`) REFERENCES `roles` (`id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
