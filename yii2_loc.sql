-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 17 2019 г., 23:36
-- Версия сервера: 5.6.37-log
-- Версия PHP: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `yii2_loc`
--

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `parent_id`, `title`, `description`, `keywords`) VALUES
(1, 0, 'Branded Foods', 'Branded Foods description', 'Branded Foods keywords'),
(2, 0, 'Households', 'Households description', 'Households keywords'),
(3, 0, 'Veggies & Fruits', 'Veggies & Fruits description', 'Veggies & Fruits keywords'),
(4, 3, 'Vegetables', 'Vegetables description', 'Vegetables keywords'),
(5, 3, 'Fruits', 'Fruits description', 'Fruits keywords'),
(6, 0, 'Kitchen', NULL, NULL),
(7, 0, 'Short Codes', NULL, NULL),
(8, 0, 'Beverages', NULL, NULL),
(9, 8, 'Soft Drinks', NULL, NULL),
(10, 8, 'Juices', NULL, NULL),
(11, 0, 'Pet Food', NULL, NULL),
(12, 0, 'Frozen Foods', NULL, NULL),
(13, 12, 'Frozen Snacks', NULL, NULL),
(14, 12, 'Frozen Nonveg', NULL, NULL),
(15, 0, 'Bread & Bakery', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `qty` tinyint(3) UNSIGNED NOT NULL,
  `total` decimal(6,2) NOT NULL DEFAULT '0.00',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `note` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `created_at`, `updated_at`, `qty`, `total`, `status`, `name`, `email`, `phone`, `address`, `note`) VALUES
(1, '2019-11-12 14:55:24', '2019-11-12 14:55:24', 3, '10.00', 1, 'Андрей', 'matroskin978@gmail.com', '111', 'г. Днепр', '111'),
(4, '2019-11-12 14:58:42', '2019-11-17 22:24:06', 2, '8.00', 1, 'Андрей', 'matroskin978@gmail.com', '111', 'г. Днепр', 'Примечание клиента...\r\nПримечание менеджера!!!'),
(5, '2019-11-14 11:12:38', '2019-11-14 11:12:38', 4, '17.00', 0, 'Андрей', 'matroskin978@gmail.com', '111', 'г. Днепр', 'Самовывоз'),
(6, '2019-11-14 11:16:19', '2019-11-14 11:16:19', 4, '16.00', 0, 'Андрей', 'matroskin978@gmail.com', '111', 'г. Днепр', 'Тест отправки заказа...'),
(7, '2019-11-14 11:18:21', '2019-11-14 11:18:21', 4, '16.00', 0, 'Андрей', 'matroskin978@gmail.com', '111', 'г. Днепр', '111'),
(8, '2019-11-14 11:19:17', '2019-11-14 11:19:17', 4, '16.00', 0, 'Андрей', 'matroskin978@gmail.com', '111', 'г. Днепр', '222'),
(9, '2019-11-14 11:20:29', '2019-11-14 11:20:29', 4, '16.00', 0, 'Андрей', 'matroskin978@gmail.com', '111', 'г. Днепр', '1'),
(10, '2019-11-14 11:21:30', '2019-11-14 11:21:30', 4, '16.00', 0, 'Андрей', 'matroskin978@gmail.com', '111', 'г. Днепр', '2'),
(11, '2019-11-14 11:23:57', '2019-11-14 11:23:57', 4, '16.00', 0, 'Андрей', 'matroskin978@gmail.com', '111', 'г. Днепр', '123'),
(12, '2019-11-14 11:25:10', '2019-11-14 11:25:10', 4, '16.00', 0, 'Андрей', 'matroskin978@gmail.com', '111', 'г. Днепр', '12'),
(13, '2019-11-14 11:30:03', '2019-11-14 11:30:03', 4, '17.00', 0, 'Андрей', 'matroskin978@gmail.com', '111', 'г. Днепр', '111'),
(14, '2019-11-14 11:31:40', '2019-11-14 11:31:40', 4, '17.00', 0, 'Андрей', 'matroskin978@gmail.com', '111', 'г. Днепр', 'Тестирование отправки почты...');

-- --------------------------------------------------------

--
-- Структура таблицы `order_product`
--

CREATE TABLE `order_product` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `price` decimal(6,2) NOT NULL DEFAULT '0.00',
  `qty` tinyint(4) NOT NULL,
  `total` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `order_product`
--

INSERT INTO `order_product` (`id`, `order_id`, `product_id`, `title`, `price`, `qty`, `total`) VALUES
(1, 1, 5, 'fresh spinach (palak)', '2.00', 2, '4.00'),
(2, 1, 7, 'fresh apple red (1 kg)', '6.00', 1, '6.00'),
(3, 4, 2, 'chings noodles (75 gm)', '5.00', 1, '5.00'),
(4, 4, 3, 'lahsun sev (150 gm)', '3.00', 1, '3.00'),
(5, 5, 5, 'fresh spinach (palak)', '2.00', 1, '2.00'),
(6, 5, 7, 'fresh apple red (1 kg)', '6.00', 2, '12.00'),
(7, 5, 9, 'mixed fruit juice (1 ltr)', '3.00', 1, '3.00'),
(8, 6, 2, 'chings noodles (75 gm)', '5.00', 1, '5.00'),
(9, 6, 3, 'lahsun sev (150 gm)', '3.00', 2, '6.00'),
(10, 6, 4, 'premium bake rusk (300 gm)', '5.00', 1, '5.00'),
(11, 7, 2, 'chings noodles (75 gm)', '5.00', 1, '5.00'),
(12, 7, 3, 'lahsun sev (150 gm)', '3.00', 2, '6.00'),
(13, 7, 4, 'premium bake rusk (300 gm)', '5.00', 1, '5.00'),
(14, 8, 2, 'chings noodles (75 gm)', '5.00', 1, '5.00'),
(15, 8, 3, 'lahsun sev (150 gm)', '3.00', 2, '6.00'),
(16, 8, 4, 'premium bake rusk (300 gm)', '5.00', 1, '5.00'),
(17, 9, 2, 'chings noodles (75 gm)', '5.00', 1, '5.00'),
(18, 9, 3, 'lahsun sev (150 gm)', '3.00', 2, '6.00'),
(19, 9, 4, 'premium bake rusk (300 gm)', '5.00', 1, '5.00'),
(20, 10, 2, 'chings noodles (75 gm)', '5.00', 1, '5.00'),
(21, 10, 3, 'lahsun sev (150 gm)', '3.00', 2, '6.00'),
(22, 10, 4, 'premium bake rusk (300 gm)', '5.00', 1, '5.00'),
(23, 11, 2, 'chings noodles (75 gm)', '5.00', 1, '5.00'),
(24, 11, 3, 'lahsun sev (150 gm)', '3.00', 2, '6.00'),
(25, 11, 4, 'premium bake rusk (300 gm)', '5.00', 1, '5.00'),
(26, 12, 2, 'chings noodles (75 gm)', '5.00', 1, '5.00'),
(27, 12, 3, 'lahsun sev (150 gm)', '3.00', 2, '6.00'),
(28, 12, 4, 'premium bake rusk (300 gm)', '5.00', 1, '5.00'),
(29, 13, 5, 'fresh spinach (palak)', '2.00', 1, '2.00'),
(30, 13, 7, 'fresh apple red (1 kg)', '6.00', 2, '12.00'),
(31, 13, 9, 'mixed fruit juice (1 ltr)', '3.00', 1, '3.00'),
(32, 14, 5, 'fresh spinach (palak)', '2.00', 1, '2.00'),
(33, 14, 7, 'fresh apple red (1 kg)', '6.00', 2, '12.00'),
(34, 14, 9, 'mixed fruit juice (1 ltr)', '3.00', 1, '3.00');

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `price` decimal(6,2) NOT NULL DEFAULT '0.00',
  `old_price` decimal(6,2) NOT NULL DEFAULT '0.00',
  `description` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `img` varchar(255) NOT NULL DEFAULT 'no-image.png',
  `is_offer` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id`, `category_id`, `title`, `content`, `price`, `old_price`, `description`, `keywords`, `img`, `is_offer`) VALUES
(1, 1, 'knorr instant soup (100 gm)', 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '3.00', '0.00', NULL, NULL, '76.png', 1),
(2, 1, 'chings noodles (75 gm)', 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '5.00', '8.00', NULL, NULL, '6.png', 0),
(3, 1, 'lahsun sev (150 gm)', 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '3.00', '5.00', NULL, NULL, '7.png', 0),
(4, 1, 'premium bake rusk (300 gm)', 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '5.00', '7.00', NULL, NULL, '8.png', 0),
(5, 1, 'fresh spinach (palak)', 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '2.00', '3.00', NULL, NULL, '9.png', 1),
(6, 5, 'fresh mango dasheri (1 kg)', 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '5.00', '8.00', NULL, NULL, '10.png', 0),
(7, 5, 'fresh apple red (1 kg)', 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '6.00', '8.00', NULL, NULL, '11.png', 1),
(8, 4, 'fresh broccoli (500 gm)', 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '4.00', '6.00', NULL, NULL, '12.png', 0),
(9, 10, 'mixed fruit juice (1 ltr)', 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '3.00', '0.00', NULL, NULL, '13.png', 1),
(10, 10, 'prune juice - sunsweet (1 ltr)', 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '4.00', '0.00', NULL, NULL, '14.png', 1),
(11, 9, 'coco cola zero can (330 ml)', 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '3.00', '0.00', NULL, NULL, '15.png', 0),
(12, 9, 'sprite bottle (2 ltr)', 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '3.00', '0.00', NULL, NULL, '16.png', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `auth_key` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `auth_key`) VALUES
(1, 'admin', '$2y$13$h67YHolpXgp4upL.IlgqCuKZkzxCrl4QWK1zkdyvZ88qKB1EAdFoS', NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT для таблицы `order_product`
--
ALTER TABLE `order_product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
