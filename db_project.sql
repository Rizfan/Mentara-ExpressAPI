-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 21, 2023 at 01:35 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `chatbot`
--

CREATE TABLE `chatbot` (
  `ID` int(50) NOT NULL,
  `Tags` varchar(30) NOT NULL,
  `Question` varchar(255) NOT NULL,
  `Answer` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `questionId` int(5) NOT NULL,
  `question` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`questionId`, `question`) VALUES
(1, 'Apakah Anda merasa cemas atau gelisah tanpa alasan yang jelas?'),
(2, 'Apakah Anda merasa sulit untuk berkonsentrasi atau tetap fokus pada tugas atau aktivitas sehari-hari?'),
(3, 'Apakah Anda merasa lelah atau kekurangan energi sepanjang waktu?'),
(4, 'Apakah Anda mengalami perubahan tidur, seperti insomnia atau tidur berlebihan?'),
(5, 'Apakah Anda mengalami perubahan nafsu makan, seperti makan berlebihan atau kehilangan selera makan?'),
(6, 'Apakah Anda merasa tidak berharga atau merasa bersalah tanpa alasan yang jelas?'),
(7, 'Apakah Anda sering mengalami sakit kepala, sakit perut, atau nyeri lainnya?'),
(8, 'Apakah Anda memiliki kekhawatiran tentang masa depan atau perasaan kehilangan arah dalam hidup?\r\n'),
(9, 'Bagaimana hubungan Anda dengan diri sendiri? Apakah Anda memiliki citra diri yang positif atau mengalami perasaan rendah diri?'),
(10, 'Apakah Anda merasa memiliki dukungan sosial yang cukup, atau apakah ada tantangan dalam membangun dan menjaga hubungan dengan orang lain?');

-- --------------------------------------------------------

--
-- Table structure for table `questionnaireresult`
--

CREATE TABLE `questionnaireresult` (
  `resultId` int(255) NOT NULL,
  `resultDate` date NOT NULL,
  `resultQuestionnaire` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questionnaireresult`
--

INSERT INTO `questionnaireresult` (`resultId`, `resultDate`, `resultQuestionnaire`) VALUES
(1, '2023-12-13', 'Low'),
(2, '2023-12-01', 'High'),
(3, '2023-12-14', 'Medium');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `noTelp` text DEFAULT NULL,
  `balance` int(11) NOT NULL DEFAULT 5,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `token` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `noTelp`, `balance`, `email`, `password`, `token`, `createdAt`, `updatedAt`) VALUES
(1, 'Taehyung kim', '', 5, 'email@gmail.com', '$2b$10$.xXVcvsu/VrCnt0eyrFOwu4fFaE4RsHhfA2G7M8Y5afN3e22LKPZW', NULL, '2023-12-15 06:05:12', '2023-12-15 06:05:12'),
(6, NULL, '', 5, NULL, '$2b$10$.4EEvlH4lstqNBMrO3WZcexEuR3M8BZB9K5D8.RvUhcHiaT.c83bS', NULL, '2023-12-18 05:26:37', '2023-12-18 05:26:37'),
(7, 'pan', '', 5, 'pann12e21312312@gmail.com', '#654321001', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'pan', '', 5, 'pann12e21312312@gmail.com', '#654321001', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'apmds;', '12312839211', 5, 'erbunkals@gmail.com', 'qweqwe123', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'tess@gmail.com', '12312312', 5, 'tesss', 'qweqwe123', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'tesss', '32423423', 5, 'teweww@gmail.com', 'qweqweqwe123', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 'tesss', '31212312', 5, 'werew@gmail.com', 'qweqweqweqw', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 'tess', '2131231', 4, 'tesddfw@mail.com', 'wqeqweqwe', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 'dsfsdfs', '32423423', 5, 'werew@gmail.com', 'wqeqweqwe', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 'ewfdsf', '32432', 5, 'fds@mail.com', 'qweqw', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 'weqwqe', '23112312', 5, 'qweqwee@mail.com', 'weqwqeqwe', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 'tbr', '23432432', 5, 'werew@gmail.com', 'qweqweqwe', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 'ushjdfsdk', '12312312', 5, 'rewopmwer@mail.com', 'qweqwe123', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 'rizfan', '082256349900', 5, 'rispanherlaya@gmail.com', 'qweqwe123', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 'tess', '13212321', 5, 'coasdas@gmail.com', 'qweqweqwe', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 'tess', '23112312', 5, 'werewrwerew@fsa.com', 'qewqweqwe', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 'tess', '3243243', 5, 'wefwef@dsf.csa', 'qweqweqwe', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 'test', '081260686516', 5, 'tesr@gmail.com', '20p2ARza', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 'test', '081260686516', 5, 'aryaarza05@gmail.com', 'test123', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, '123', '123', 5, '123@gmail.com', 'test', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chatbot`
--
ALTER TABLE `chatbot`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`questionId`);

--
-- Indexes for table `questionnaireresult`
--
ALTER TABLE `questionnaireresult`
  ADD PRIMARY KEY (`resultId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chatbot`
--
ALTER TABLE `chatbot`
  MODIFY `ID` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `questionId` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `questionnaireresult`
--
ALTER TABLE `questionnaireresult`
  MODIFY `resultId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
