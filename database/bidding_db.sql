-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 23, 2023 at 02:09 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bidding_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `bids`
--

CREATE TABLE `bids` (
  `id` int(30) NOT NULL,
  `user_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `bid_amount` float NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=bid,2=confirmed,3=cancelled',
  `date_created` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bids`
--

INSERT INTO `bids` (`id`, `user_id`, `product_id`, `bid_amount`, `status`, `date_created`) VALUES
(2, 5, 1, 7500, 1, '2020-10-27 14:18:50'),
(4, 5, 3, 155000, 1, '2020-10-27 16:37:29');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(8, 'Supermarket'),
(9, 'Health & Beauty'),
(10, 'Home & Office'),
(11, 'Appliances'),
(12, 'Phone & Tablets'),
(13, 'Computing'),
(14, 'TVs & Audio'),
(15, 'Gaming'),
(16, 'Baby Products'),
(17, 'Sporting Goods'),
(18, 'Garden & Outdoors');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `start_bid` float NOT NULL,
  `regular_price` float NOT NULL,
  `bid_end_datetime` datetime NOT NULL,
  `img_fname` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `description`, `start_bid`, `regular_price`, `bid_end_datetime`, `img_fname`, `date_created`) VALUES
(6, 12, 'Samsung Galaxy S9', 'Samsung Galaxy S9', 16000, 25000, '2028-03-15 11:39:00', '6.jpg', '2023-02-23 09:12:57'),
(7, 8, 'Elianto cooking oil', '3ltrs', 1800, 2000, '2029-10-27 17:00:00', '7.webp', '2023-02-23 09:15:49'),
(8, 14, 'Hisense 55A6H 55 inch 4K UHD Smart TV', 'Hisense 55A6H 55 inch 4K UHD Smart TV', 60000, 65000, '2024-02-22 14:00:00', '8.jpeg', '2023-02-23 09:18:06'),
(9, 15, 'PS5', 'Playstation 5', 29000, 30000, '2024-02-22 14:01:00', '9.webp', '2023-02-23 09:21:31'),
(10, 10, 'office Chair', 'Comfy and aesthetic', 13000, 14000, '2023-12-22 14:00:00', '10.jpg', '2023-02-23 09:35:42'),
(11, 17, 'Treadmill', 'Upto to speeds of 40km/hr', 118000, 120000, '2024-01-01 09:39:00', '11.jpg', '2023-02-23 09:40:33');

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `cover_img` text NOT NULL,
  `about_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `cover_img`, `about_content`) VALUES
(1, 'MyBid.com', 'info@mybid.com', '+254711668929', '1677126300_icon bg.png', '&lt;p style=&quot;text-align: justify; background: transparent; position: relative;&quot;&gt;&lt;font color=&quot;#000000&quot; face=&quot;Open Sans, Arial, sans-serif&quot;&gt;Welcome to our bidding system, a platform designed to connect buyers with potential suppliers or contractors in a transparent and efficient way. Our system allows buyers to issue requests for proposals or invitations to bid, while suppliers or contractors can respond with their proposed price and value for the project. Our platform aims to streamline the bidding process, providing a level playing field for all parties involved and facilitating fair competition. Whether you are a buyer or a supplier, our bidding system is designed to help you make informed decisions based on the best value proposition.&lt;/font&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1=Admin,2=Subscriber',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `email`, `contact`, `address`, `type`, `date_created`) VALUES
(1, 'Administrator', 'admin', '0192023a7bbd73250516f069df18b500', 'admin@admin.com', '+123456789', '', 1, '2020-10-27 09:19:59'),
(5, 'John Smith', 'jsmith', '1254737c076cf867dc53d60a0364f38e', 'jsmith@sample.com', '+18456-5455-55', 'Sample', 2, '2020-10-27 14:18:32'),
(7, 'Jose', 'jose', '827ccb0eea8a706c4c34a16891f84e7b', '', '', '', 2, '2023-02-22 11:22:42'),
(8, 'mainajm254@gmail.com', 'jm', '827ccb0eea8a706c4c34a16891f84e7b', 'mainajm254@gmail.com', '0702156146', 'lanet', 2, '2023-02-22 11:30:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bids`
--
ALTER TABLE `bids`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bids`
--
ALTER TABLE `bids`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
