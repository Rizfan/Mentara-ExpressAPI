-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 22, 2023 at 09:56 AM
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
  `userId` int(11) DEFAULT NULL,
  `resultDate` date NOT NULL,
  `resultQuestionnaire` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questionnaireresult`
--

INSERT INTO `questionnaireresult` (`resultId`, `userId`, `resultDate`, `resultQuestionnaire`) VALUES
(1, 4, '2023-12-13', 'Low'),
(2, 2, '2023-12-01', 'High'),
(3, 3, '2023-12-14', 'Medium'),
(4, 1, '2023-12-22', 'Medium'),
(5, 2, '2023-12-22', 'Medium'),
(6, 1, '2023-12-22', 'Medium'),
(7, 2, '2023-12-22', 'Medium'),
(8, 3, '2023-12-22', 'High');

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
(1, 'Rizfan', '082256349900', 4, 'rispanherlaya@gmail.com', 'qweqwe123', 't621o9mB1MojM1kEWzY7cRtD2uOdVpd27vG0nn3V', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'halo', '56465', 5, 'halo@gmail.com', 'halo', 'NcIj6b32ZnVAe9Z4w4tzmTeJq3k2gxvKtJmLUQkg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Anisa', '081275616345', 5, 'anisa_08@gmail.com', 'passwordqu', 'wjM3IDLVxQGkLjZxO2tguqZMCa6dQueW6FBdJjCv', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'lisa', '081276515044', 5, 'lisa@gmail.com', 'passwordku', 'DsgaWpki4aaBVGVdJHNGF8AuOF2JwlgfGsrOlX6d', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'panssasdsadsa', '654321001', 5, 'psdaann12e21312312@gmail.com', '#654321001', 'GnkMUUz9HsdJVFpARzu3vzig50rczB031LSEvRiB', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'rispan', '213232', 5, 'pamno@gmail.com', 'qweqwe123', 'VsxZjNXhaaCWnY0zSv2bKspLBsz39kEfeaw0xevw', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

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
  MODIFY `resultId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
