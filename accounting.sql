-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Ноя 06 2024 г., 10:40
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `accounting`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Appeals`
--

CREATE TABLE `Appeals` (
  `ID_Appeals` int(11) NOT NULL,
  `Date_receipts` date NOT NULL,
  `Preliminary_diagnosis` varchar(255) NOT NULL,
  `ID_How` int(11) NOT NULL,
  `ID Ward_history` int(11) NOT NULL,
  `Date_discharge` date NOT NULL,
  `Reason_discharge` varchar(255) NOT NULL,
  `Different_outcome` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `Appeals`
--

INSERT INTO `Appeals` (`ID_Appeals`, `Date_receipts`, `Preliminary_diagnosis`, `ID_How`, `ID Ward_history`, `Date_discharge`, `Reason_discharge`, `Different_outcome`) VALUES
(1, '2024-09-03', 'Аппендицит', 1, 1, '2024-09-10', 'Улучшение самочувствия', NULL),
(2, '2024-09-05', 'Ангина', 2, 2, '2024-09-11', 'Улучшение самочувствия', NULL),
(3, '2024-09-04', 'Перелом правой руки', 3, 3, '2024-09-09', 'Полное выздоровление', NULL),
(4, '2024-09-07', 'Перелом носа', 4, 4, '2024-09-10', 'Полное выздоровление', NULL),
(5, '2024-09-07', 'Перелом правой руки', 5, 5, '2024-09-12', 'Полное выздоровление', NULL),
(6, '2024-09-05', 'Трещина в коленной чашечке', 6, 6, '2024-09-13', 'Улучшение самочувствия', NULL),
(7, '2024-09-06', 'Внутренняя рана органов', 7, 7, '2024-09-10', 'Летальный исход', 'Смерть'),
(8, '2024-09-11', 'Вросший ноготь', 8, 8, '2024-09-17', 'Полное выздоровление', NULL),
(9, '2024-09-08', 'Перелом всех пальцев на правой руке', 9, 9, '2024-09-17', 'Улучшение самочувствия', NULL),
(10, '2024-09-09', 'Перелом обеих рук', 10, 10, '2024-09-19', 'Частичное выздоровление', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `Doctors`
--

CREATE TABLE `Doctors` (
  `idoc_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `birthday` date NOT NULL,
  `role` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `Doctors`
--

INSERT INTO `Doctors` (`idoc_id`, `role_id`, `first_name`, `last_name`, `middle_name`, `phone`, `birthday`, `role`, `password`, `email`, `username`) VALUES
(1, 1, 'Даниил', 'Павлов', 'Николаевич', '+7(977)-555-33-53', '2006-06-01', 'Хирург', '123123', 'qwe@gmail.com', 'qweqwe');

-- --------------------------------------------------------

--
-- Структура таблицы `History`
--

CREATE TABLE `History` (
  `ID_Ward_history` int(11) NOT NULL,
  `Num_ward` varchar(255) NOT NULL,
  `Date_receipts` date NOT NULL,
  `Telephone_ward` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `History`
--

INSERT INTO `History` (`ID_Ward_history`, `Num_ward`, `Date_receipts`, `Telephone_ward`) VALUES
(1, '123', '2024-09-03', '+7 (902) 123-12-21'),
(2, '21', '2024-09-04', '+7 (902) 131-12-34'),
(3, '441', '2024-09-05', '+7 (904) 756-32-67'),
(4, '123', '2024-09-05', '+7 (902) 141-41-12'),
(5, '213', '2024-09-05', '+7 (902) 123-23-21'),
(6, '423', '2024-09-03', '+7 (902) 123-76-21'),
(7, '234', '2024-09-09', '+7 (902) 131-12-55'),
(8, '41', '2024-09-08', '+7 (904) 777-32-67'),
(9, '22', '2024-09-09', '+7 (902) 141-71-2'),
(10, '213', '2024-09-09', '+7 (902) 223-23-21');

-- --------------------------------------------------------

--
-- Структура таблицы `Medical_statistics`
--

CREATE TABLE `Medical_statistics` (
  `ID_Card` int(11) NOT NULL,
  `FIO` varchar(255) NOT NULL,
  `Gender` varchar(255) NOT NULL,
  `Age` varchar(255) NOT NULL,
  `Height` varchar(255) NOT NULL,
  `Hair_color` varchar(255) NOT NULL,
  `Special_signs` varchar(255) DEFAULT NULL,
  `ID_Appeals` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `Medical_statistics`
--

INSERT INTO `Medical_statistics` (`ID_Card`, `FIO`, `Gender`, `Age`, `Height`, `Hair_color`, `Special_signs`, `ID_Appeals`) VALUES
(1, 'Павлов Даниил Николаевич', 'Мужской', '18', '150', 'Карий', NULL, 1),
(2, 'Лавронов Анатолий Федорович', 'Мужской', '22', '184', 'Карий', 'С веснушками на лице', 2),
(3, 'Инин Вячеслав Эдуардович', 'Мужской', '21', '178', 'Русые', NULL, 3),
(4, 'Лаврушин Артем Михаилович', 'Мужской', '21', '181', 'Пепельный', NULL, 4),
(5, 'Журинов Владислав Тимурович', 'Мужской', '19', '177', 'Шоколадный', 'Нос с горбинкой', 5),
(6, 'Плахотнюк Ефим Глебович', 'Мужской', '18', '180', 'Карий', NULL, 6),
(7, 'Кураев Леонид Владимирович', 'Мужской', '19', '182', 'Лысый', 'Лысый', 7),
(8, 'Дремов Анатолий Яковлев', 'Мужской', '21', '179', 'Карие', NULL, 8),
(9, 'Муравлев Радик Сергеевич', 'Мужской', '18', '181', 'Золотистые', 'Гетерохромия', 9),
(10, 'Балыбюк Егор Станиславович', 'Мужской', '17', '181', 'Синий', 'Высокий голос', 10);

-- --------------------------------------------------------

--
-- Структура таблицы `Patient_do`
--

CREATE TABLE `Patient_do` (
  `ID_How` int(11) NOT NULL,
  `How_delivered` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `Patient_do`
--

INSERT INTO `Patient_do` (`ID_How`, `How_delivered`) VALUES
(1, 'Из дома на скорой помощи'),
(2, 'Из дома своим ходом'),
(3, 'Вертолётом с аварии на скорой помощи'),
(4, 'Из дома своим ходом'),
(5, 'Из дома своим ходом'),
(6, 'Из дома на скорой помощи'),
(7, 'На машине с аварии на скорой помощи'),
(8, 'Из дома своим ходом'),
(9, 'Из дома своим ходом'),
(10, 'Из дома своим ходом');

-- --------------------------------------------------------

--
-- Структура таблицы `role_id`
--

CREATE TABLE `role_id` (
  `role_ID` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `role_id`
--

INSERT INTO `role_id` (`role_ID`, `code`, `name`) VALUES
(1, 'Admin', 'Администратор'),
(2, 'Doctor', 'Доктор');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Appeals`
--
ALTER TABLE `Appeals`
  ADD PRIMARY KEY (`ID_Appeals`),
  ADD KEY `ID Как` (`ID_How`,`ID Ward_history`),
  ADD KEY `ID Ward_history` (`ID Ward_history`);

--
-- Индексы таблицы `Doctors`
--
ALTER TABLE `Doctors`
  ADD PRIMARY KEY (`idoc_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `role_id` (`role_id`);

--
-- Индексы таблицы `History`
--
ALTER TABLE `History`
  ADD PRIMARY KEY (`ID_Ward_history`);

--
-- Индексы таблицы `Medical_statistics`
--
ALTER TABLE `Medical_statistics`
  ADD PRIMARY KEY (`ID_Card`),
  ADD KEY `ID Обращения` (`ID_Appeals`),
  ADD KEY `ID Обращения_2` (`ID_Appeals`);

--
-- Индексы таблицы `Patient_do`
--
ALTER TABLE `Patient_do`
  ADD PRIMARY KEY (`ID_How`);

--
-- Индексы таблицы `role_id`
--
ALTER TABLE `role_id`
  ADD PRIMARY KEY (`role_ID`),
  ADD UNIQUE KEY `code` (`code`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Appeals`
--
ALTER TABLE `Appeals`
  MODIFY `ID_Appeals` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `Doctors`
--
ALTER TABLE `Doctors`
  MODIFY `idoc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `History`
--
ALTER TABLE `History`
  MODIFY `ID_Ward_history` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `Medical_statistics`
--
ALTER TABLE `Medical_statistics`
  MODIFY `ID_Card` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `Patient_do`
--
ALTER TABLE `Patient_do`
  MODIFY `ID_How` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `role_id`
--
ALTER TABLE `role_id`
  MODIFY `role_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Appeals`
--
ALTER TABLE `Appeals`
  ADD CONSTRAINT `Appeals_ibfk_1` FOREIGN KEY (`ID_How`) REFERENCES `Patient_do` (`ID_How`),
  ADD CONSTRAINT `Appeals_ibfk_2` FOREIGN KEY (`ID Ward_history`) REFERENCES `History` (`ID_Ward_history`);

--
-- Ограничения внешнего ключа таблицы `Doctors`
--
ALTER TABLE `Doctors`
  ADD CONSTRAINT `Doctors_ibfk_1` FOREIGN KEY (`role_ID`) REFERENCES `role_id` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Doctors_ibfk_2` FOREIGN KEY (`role_ID`) REFERENCES `role_id` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Medical_statistics`
--
ALTER TABLE `Medical_statistics`
  ADD CONSTRAINT `Medical_statistics_ibfk_1` FOREIGN KEY (`ID_Appeals`) REFERENCES `Appeals` (`ID_Appeals`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
