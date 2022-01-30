-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 30, 2022 at 03:14 AM
-- Server version: 8.0.27
-- PHP Version: 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bptest_jay`
--

-- --------------------------------------------------------

--
-- Table structure for table `bp_price`
--

CREATE TABLE `bp_price` (
  `id` int NOT NULL,
  `product` int NOT NULL,
  `price_index` int NOT NULL,
  `currency` varchar(10) NOT NULL,
  `baseunitprice` decimal(10,2) NOT NULL,
  `unitprice` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `bp_price`
--

INSERT INTO `bp_price` (`id`, `product`, `price_index`, `currency`, `baseunitprice`, `unitprice`) VALUES
(1, 3, 0, 'NZD', '34.99', '15.00'),
(2, 5, 0, 'NZD', '34.99', '15.00'),
(3, 8, 0, 'NZD', '34.99', '15.00'),
(4, 9, 0, 'NZD', '34.99', '15.00'),
(5, 10, 0, 'NZD', '34.99', '15.00'),
(6, 12, 0, 'NZD', '34.99', '15.00'),
(7, 13, 0, 'NZD', '34.99', '15.00'),
(8, 14, 0, 'NZD', '39.99', '39.99'),
(9, 15, 0, 'NZD', '39.99', '39.99'),
(10, 16, 0, 'NZD', '39.99', '39.99'),
(11, 17, 0, 'NZD', '39.99', '39.99'),
(12, 18, 0, 'NZD', '34.99', '15.00');

-- --------------------------------------------------------

--
-- Table structure for table `bp_product`
--

CREATE TABLE `bp_product` (
  `productid` int NOT NULL,
  `style` varchar(20) NOT NULL,
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `extdescription` varchar(550) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lastupdated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `bp_product`
--

INSERT INTO `bp_product` (`productid`, `style`, `description`, `extdescription`, `lastupdated`) VALUES
(3, 'BV45561CHK', 'Cropped Boucle Tweed Top', 'The sweetest bouclé tweed cami with a round neckline, check print, cropped length and antique button detail.', '2022-01-30 15:33:15'),
(5, 'DS45942POL', 'Square Neck Ruched Mini Dress', 'Featuring a slim-fit with ruched material, square neckline and thin spaghetti straps.', '2022-01-30 15:33:15'),
(8, 'JD45788DNM', 'Diagonal Stitch Tapered Jean', 'Featuring a cropped length, high-rise fit, tapered leg and diagonal stitch detail.\r\nInside leg length = 70cm.', '2022-01-30 15:33:15'),
(9, 'TS45477WAS', 'Super Oversized Tee', 'Featuring an oversized fit, crew neckline and 100% cotton fabric.', '2022-01-30 15:33:15'),
(10, 'KL45962KNT', 'Boxy Knit Top', 'Featuring a boxy style longsleeve top in a cotton blend knit material.', '2022-01-30 15:33:15'),
(12, 'TC46959SEA', 'Seamless Zip Through Top', 'This longsleeve top features a cropped length, zip through detail, a scoop neckline and seamless ribbed material.', '2022-01-30 15:33:15'),
(13, 'BL45309COR', 'Longline Cord Shirt', 'A vintage classic! Featuring a loose-fit, textured corduroy fabric, front pockets and tortoise shell buttons.', '2022-01-30 15:33:15'),
(14, 'JD43761DNM', 'Super High Rise Straight Jean', 'Straight leg jean featuring a raw hem and high waisted fit.  Inside leg length = 71.5cm.\r\n\r\nREPREVE denim is designed for our denim lover! My recycled polyester fibres offer an eco friendly superior stretch denim with durability that maintains the authentic look and feel of traditional denim.', '2022-01-30 15:33:15'),
(15, 'PW44707PLN', 'Pintuck Wide Leg Pant', 'Featuring a floaty wide leg, elasticated waistband and pintuck detail.', '2022-01-30 15:33:15'),
(16, 'TL44688SEA', 'Seamless V-Scoop Top', 'Featuring a longsleeve style with ribbed seamless material, a low neckline and back.', '2022-01-30 15:33:15'),
(17, 'JD41279DNM', 'Wide Leg Jean', 'Featuring a high waist, snug through the hip with a straight leg style and ripped detailing on the hem.\r\nInside leg length is 70cm.', '2022-01-30 15:33:15'),
(18, 'TC46959SEA', 'Seamless Zip Through Top', 'This longsleeve top features a cropped length, zip through detail, a scoop neckline and seamless ribbed material.', '2022-01-30 15:33:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bp_price`
--
ALTER TABLE `bp_price`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bp_product`
--
ALTER TABLE `bp_product`
  ADD PRIMARY KEY (`productid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bp_price`
--
ALTER TABLE `bp_price`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
