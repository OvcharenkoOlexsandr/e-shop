-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Дек 24 2021 г., 12:20
-- Версия сервера: 10.4.22-MariaDB
-- Версия PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `e-shop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `customer`
--

CREATE TABLE `customer` (
  `id_customer` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(11) NOT NULL,
  `id_goods` bigint(100) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `customer`
--

INSERT INTO `customer` (`id_customer`, `name`, `id_goods`) VALUES
(1, 'Антон', 1),
(2, 'Лена', 2),
(3, 'Роман', 3),
(4, 'Женя ', 5);

-- --------------------------------------------------------

--
-- Структура таблицы `goods`
--

CREATE TABLE `goods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) NOT NULL,
  `Price` int(100) DEFAULT NULL,
  `id_customer` bigint(100) UNSIGNED NOT NULL,
  `id_goods` bigint(100) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `goods`
--

INSERT INTO `goods` (`id`, `name`, `Price`, `id_customer`, `id_goods`) VALUES
(1, 'Стиральная машинка ', 5600, 1, 1),
(2, 'Ноутбук', 1000, 2, 2),
(3, 'Робот-пылесос', 2300, 3, 3),
(4, 'Телевизор ', 3000, 3, 3),
(5, 'Холодильник ', 2100, 4, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `shop`
--

CREATE TABLE `shop` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) NOT NULL,
  `Street` varchar(100) NOT NULL,
  `Workers_id` bigint(100) UNSIGNED NOT NULL,
  `Warehouse` bigint(100) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `shop`
--

INSERT INTO `shop` (`id`, `name`, `Street`, `Workers_id`, `Warehouse`) VALUES
(13, 'Фокстрот', 'Петрушенка11', 2, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `workers`
--

CREATE TABLE `workers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `Speciality` varchar(200) NOT NULL,
  `Number` varchar(15) DEFAULT NULL,
  `Visitor assistance` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `workers`
--

INSERT INTO `workers` (`id`, `name`, `date_of_birth`, `Speciality`, `Number`, `Visitor assistance`) VALUES
(1, 'Дордієнко', '1996-11-12', 'Консультант', NULL, ''),
(2, 'Мотчана', '2000-09-01', 'Касир', NULL, NULL),
(3, 'Андрей ', '2002-09-12', 'Консультант', '0674433322', NULL),
(4, 'Жанна', '2004-11-12', 'Касир ', NULL, NULL),
(5, 'Коля ', '1992-02-10', 'Курьер ', NULL, NULL),
(6, 'Олег', '2001-04-03', 'Курьер', NULL, NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_customer`),
  ADD KEY `Number_id` (`id_goods`);

--
-- Индексы таблицы `goods`
--
ALTER TABLE `goods`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY ` Customer` (`id_customer`),
  ADD KEY `Number` (`id_goods`);

--
-- Индексы таблицы `shop`
--
ALTER TABLE `shop`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `Workers_id` (`Workers_id`),
  ADD KEY `Warehouse` (`Warehouse`);

--
-- Индексы таблицы `workers`
--
ALTER TABLE `workers`
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `customer`
--
ALTER TABLE `customer`
  MODIFY `id_customer` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `goods`
--
ALTER TABLE `goods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `shop`
--
ALTER TABLE `shop`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `workers`
--
ALTER TABLE `workers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `goods`
--
ALTER TABLE `goods`
  ADD CONSTRAINT `goods_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id_customer`) ON DELETE CASCADE,
  ADD CONSTRAINT `goods_ibfk_2` FOREIGN KEY (`id_goods`) REFERENCES `customer` (`id_goods`);

--
-- Ограничения внешнего ключа таблицы `shop`
--
ALTER TABLE `shop`
  ADD CONSTRAINT `shop_ibfk_1` FOREIGN KEY (`Workers_id`) REFERENCES `workers` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `shop_ibfk_2` FOREIGN KEY (`Warehouse`) REFERENCES `goods` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
