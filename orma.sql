-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2025 at 10:00 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `orma`
--

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `sno` int(11) NOT NULL,
  `order_id` varchar(100) NOT NULL,
  `product` int(11) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `customer_address` varchar(500) NOT NULL,
  `customer_mobile` varchar(10) NOT NULL,
  `tid` varchar(50) NOT NULL,
  `amt` int(11) NOT NULL,
  `session_id` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`sno`, `order_id`, `product`, `customer_name`, `customer_address`, `customer_mobile`, `tid`, `amt`, `session_id`, `date`) VALUES
(1, '866322455403', 2, 'NITIN BHANA', 'RAMPURA GATE NADI MARG', '8965004007', '0', 70, 'nitinbhana12@gmail.com', ''),
(2, '262229986846', 2, 'NITIN BHANA', 'RAMPURA GATE NADI MARG', '8965004007', '0', 70, 'nitinbhana12@gmail.com', ''),
(3, '395068811497', 2, 'NITIN BHANA', 'RAMPURA GATE NADI MARG', '8965004007', '0', 70, 'nitinbhana12@gmail.com', ''),
(4, '889075110370', 2, 'NITIN BHANA', 'RAMPURA GATE NADI MARG', '8965004007', '0', 70, 'nitinbhana12@gmail.com', ''),
(5, '587032688469', 3, 'NITIN BHANA', 'RAMPURA GATE NADI MARG', '8965004007', '0', 120, 'nitinbhana12@gmail.com', ''),
(6, '622411869061', 3, 'NITIN BHANA', 'RAMPURA GATE NADI MARG', '8965004007', '1212121222211', 120, 'nitinbhana12@gmail.com', ''),
(7, '634327465558', 1, 'NITIN BHANA', 'RAMPURA GATE NADI MARG', '8965004007', '0', 150, 'nitinbhana12@gmail.com', '2025-11-27 22:28:09.822139'),
(8, '946760832219', 9, 'NITIN BHANA', 'RAMPURA GATE NADI MARG', '8965004007', '0', 0, 'nitinbhana12@gmail.com', '2025-11-27 22:35:26.190560'),
(9, '672331062591', 1, 'NITIN BHANA', 'RAMPURA GATE NADI MARG', '8965004007', '0', 150, 'nitinbhana12@gmail.com', '2025-11-28 12:04:33.831785');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `sno` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `price` int(11) NOT NULL,
  `detail` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`sno`, `name`, `price`, `detail`) VALUES
(1, 'lavender', 150, 'for dry skin '),
(2, 'beetroot lipbalm', 70, 'to cure chaped and dry lips made with natural oils .. also available in alovera ,sandalwood,coffe , limegrass flavors'),
(3, 'alovera aqua bass crème', 120, 'for oily skin '),
(4, 'milkkesar soap', 150, 'for luxury bath , made with original saffron'),
(5, 'Korean rice soap', 100, 'for smooth and shiny Korean glass skin'),
(6, 'haldikesar soap', 150, 'made with organic haldi and real saffron'),
(7, 'organic shampoo', 100, 'made with 13 auyrvedic materials '),
(8, 'rose soap', 60, ''),
(9, 'front page of soap category', 0, ''),
(10, 'organic hair oil', 120, 'made with 5 ayurvedic materials for shiny and strong hair'),
(11, 'body scrub soap', 70, 'for exfoliation'),
(12, 'charcoal soap', 70, 'for tan free skin'),
(13, 'ubtan soap', 80, 'gives you a spa like skin'),
(14, 'resin pen', 60, 'perfect for gift and stylish way to write');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
