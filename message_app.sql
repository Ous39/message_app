-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 29, 2024 at 03:17 PM
-- Server version: 8.0.31
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `message_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int NOT NULL,
  `sender_id` int NOT NULL,
  `receiver_id` int NOT NULL,
  `message` text COLLATE utf8mb4_general_ci NOT NULL,
  `timestamp` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `sender_id`, `receiver_id`, `message`, `timestamp`) VALUES
(1, 2, 1, 'hello', '2024-11-24 22:27:35'),
(2, 3, 2, 'Testing', '2024-11-24 22:34:23'),
(3, 3, 2, 'confirm', '2024-11-24 22:38:56'),
(4, 3, 2, 'confirm', '2024-11-24 22:47:21'),
(5, 3, 2, 'confirm', '2024-11-24 22:48:13'),
(6, 3, 2, 'confirm', '2024-11-24 22:50:27'),
(7, 3, 2, '', '2024-11-25 09:33:12'),
(8, 3, 2, 'The test as being Confirm', '2024-11-25 09:34:28'),
(9, 3, 1, '', '2024-11-25 09:35:31'),
(10, 3, 4, '', '2024-11-25 09:35:43'),
(11, 3, 4, 'Hello World', '2024-11-25 09:36:05'),
(12, 4, 1, '', '2024-11-25 09:36:27'),
(13, 4, 3, '', '2024-11-25 09:36:32'),
(14, 4, 3, 'Real time App', '2024-11-25 09:37:11'),
(15, 3, 4, 'Hello World', '2024-11-25 09:37:30'),
(16, 3, 4, 'Hello World', '2024-11-25 09:41:07'),
(17, 3, 2, '', '2024-11-25 09:41:12'),
(18, 3, 2, 'Comium We are better together ', '2024-11-25 09:42:11'),
(19, 2, 1, '', '2024-11-25 11:12:54'),
(20, 2, 1, '', '2024-11-26 15:25:14'),
(21, 2, 6, 'hello', '2024-11-26 16:02:40'),
(22, 2, 7, 'hello', '2024-11-26 16:02:40'),
(23, 2, 8, 'hello', '2024-11-26 16:02:40'),
(24, 2, 6, 'hello', '2024-11-26 16:08:15'),
(25, 2, 7, 'hello', '2024-11-26 16:08:15'),
(26, 2, 8, 'hello', '2024-11-26 16:08:15'),
(27, 2, 6, 'hello', '2024-11-26 16:15:30'),
(28, 2, 7, 'hello', '2024-11-26 16:15:30'),
(29, 2, 8, 'hello', '2024-11-26 16:15:30'),
(30, 2, 6, 'Test group ', '2024-11-26 16:16:41'),
(31, 2, 7, 'Test group ', '2024-11-26 16:16:41'),
(32, 2, 6, 'Test group ', '2024-11-26 16:20:28'),
(33, 2, 7, 'Test group ', '2024-11-26 16:20:28'),
(34, 2, 6, 'Test group ', '2024-11-26 16:28:17'),
(35, 2, 7, 'Test group ', '2024-11-26 16:28:17'),
(36, 2, 6, 'Test group ', '2024-11-26 16:35:43'),
(37, 2, 7, 'Test group ', '2024-11-26 16:35:43'),
(38, 2, 6, 'Test group ', '2024-11-26 16:48:48'),
(39, 2, 7, 'Test group ', '2024-11-26 16:48:48'),
(40, 2, 6, 'Test group ', '2024-11-26 16:49:46'),
(41, 2, 7, 'Test group ', '2024-11-26 16:49:46');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `phone`) VALUES
(1, 'ousjallow39@gmail.com', '$2y$10$Nnbj.9G/lYysDLtaOBJDEe7gXPihGasJQ6Gq55sTsuDhkLWiigfOG', NULL, NULL),
(2, 'fatou.bah@gmail.com', '$2y$10$EFv4owJ9XQM3rV7ITueHdOIuEkgvjSG8/Odjchj1iiSgNfaNWQeD6', NULL, NULL),
(3, 'ousman.jalow', '$2y$10$RJC8v0XnIMmj6HIA4jZs2.maGARDqmoLXjRielo/9AtsXkIUdVIy6', NULL, NULL),
(4, 'root', '$2y$10$esJ8dFdHuTDw9RoJSP.rmepof64fJyjlDWtXB0sV7bwCAbiLifqgG', NULL, NULL),
(5, 'johndoe', '$2y$10$examplehashedpassword1', 'johndoe@example.gm', '+2201234567'),
(6, 'janedoe', '$2y$10$examplehashedpassword2', 'janedoe@example.gm', '+2202345678'),
(7, 'mohammed', '$2y$10$examplehashedpassword3', 'mohammed@example.gm', '+2203456789'),
(8, 'fatou', '$2y$10$examplehashedpassword4', 'fatou@example.gm', '+2204567890'),
(9, 'binta', '$2y$10$examplehashedpassword5', 'binta@example.gm', '+2205678901');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `receiver_id` (`receiver_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
