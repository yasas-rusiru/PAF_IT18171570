-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2020 at 05:06 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital`
--

-- --------------------------------------------------------

--
-- Table structure for table `hospital_table`
--

CREATE TABLE `hospital_table` (
  `h_id` varchar(20) NOT NULL,
  `h_name` varchar(45) DEFAULT NULL,
  `h_address` varchar(45) DEFAULT NULL,
  `h_phone` varchar(10) DEFAULT NULL,
  `h_email` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hospital_table`
--

INSERT INTO `hospital_table` (`h_id`, `h_name`, `h_address`, `h_phone`, `h_email`) VALUES
('h1', 'Hemas', 'Kandy road Colombo', '0112349804', 'hemas@gmail.com'),
('h2', 'Appalo', 'Colombo road Kurunegala', '0374569808', 'appalo@gmail.com'),
('h3', 'rty', 'Kandy road Colombo', '0112254678', 'lanka@gmail.com'),
('h_4', 'Nawaloka', 'Kandy Road Colombo', '0112435670', 'nawaloka@gmail.com'),
('h_7', 'dgsdfhs', 'bingiriya', '657578668', 'r@gmail');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hospital_table`
--
ALTER TABLE `hospital_table`
  ADD PRIMARY KEY (`h_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
