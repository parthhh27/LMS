-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 24, 2024 at 08:35 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lib_manager`
--

-- --------------------------------------------------------

--
-- Table structure for table `Books`
--

CREATE TABLE `Books` (
  `book_id` int(11) NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  `genre` varchar(50) DEFAULT NULL,
  `available` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Books`
--

INSERT INTO `Books` (`book_id`, `title`, `author`, `genre`, `available`) VALUES
(1, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', 1),
(2, 'The Secret', 'Rhonda Byrne', 'Fiction', 1),
(3, 'my life', 'me', 'thriller', 1),
(12, 'anda Wala burger', 'parth', 'horror', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Borrowed_Books`
--

CREATE TABLE `Borrowed_Books` (
  `transaction_id` int(11) NOT NULL,
  `book_id` int(11) DEFAULT NULL,
  `borrower_id` int(11) DEFAULT NULL,
  `date_of_borrow` date DEFAULT NULL,
  `date_of_return` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Borrowers`
--

CREATE TABLE `Borrowers` (
  `borrower_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `contact` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Borrowers`
--

INSERT INTO `Borrowers` (`borrower_id`, `name`, `contact`) VALUES
(1, 'Alice Johnson', '9876543210'),
(2, 'someone', '12345678902'),
(3, 'idk who', '2222222222'),
(4, 'that dude', '123123123123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Books`
--
ALTER TABLE `Books`
  ADD PRIMARY KEY (`book_id`);

--
-- Indexes for table `Borrowed_Books`
--
ALTER TABLE `Borrowed_Books`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `book_id` (`book_id`),
  ADD KEY `borrower_id` (`borrower_id`);

--
-- Indexes for table `Borrowers`
--
ALTER TABLE `Borrowers`
  ADD PRIMARY KEY (`borrower_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Books`
--
ALTER TABLE `Books`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `Borrowed_Books`
--
ALTER TABLE `Borrowed_Books`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Borrowers`
--
ALTER TABLE `Borrowers`
  MODIFY `borrower_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Borrowed_Books`
--
ALTER TABLE `Borrowed_Books`
  ADD CONSTRAINT `borrowed_books_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `Books` (`book_id`),
  ADD CONSTRAINT `borrowed_books_ibfk_2` FOREIGN KEY (`borrower_id`) REFERENCES `Borrowers` (`borrower_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
