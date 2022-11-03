-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 03, 2022 at 07:19 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecom`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`) VALUES
(1, 'bishal.thap3@gmail.com', 'Admin123');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `categories` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `categories`, `status`) VALUES
(1, 'Apple', 1),
(2, 'Samsung', 1),
(3, 'Realme', 1),
(4, 'Xiaomi', 1),
(5, 'MI', 1);

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(75) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `comment` text NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `name`, `email`, `mobile`, `comment`, `added_on`) VALUES
(1, 'Bishal Thapa', 'bishal.thap3@gmail.com', '9860461499', 'Noyal bsdk ho;\r\nPramesh chor ho;\r\nDari boko ho', '2022-10-30 08:54:04'),
(4, 'Bishal Thapa', 'bishal.thap3@gmail.com', '9860461499', 'This is a test Message.', '2022-10-30 05:39:00');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(50) NOT NULL,
  `pincode` int(11) NOT NULL,
  `payment_type` varchar(255) NOT NULL,
  `total_price` float NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `order_status` int(11) NOT NULL,
  `txnid` varchar(20) NOT NULL,
  `mihpayid` varchar(20) NOT NULL,
  `payu_status` varchar(10) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `user_id`, `address`, `city`, `pincode`, `payment_type`, `total_price`, `payment_status`, `order_status`, `txnid`, `mihpayid`, `payu_status`, `added_on`) VALUES
(2, 1, 'Kathmandu', 'Kathmandu', 121, 'COD', 109000, 'Success', 5, '', '', '', '2022-11-01 07:16:15'),
(3, 1, 'Kathmandu', 'kirtipur', 123, 'COD', 172500, 'pending', 4, '', '', '', '2022-11-01 07:25:45'),
(4, 1, 'Bepattapur', 'alamalla sahaar', 123456789, 'COD', 868000, 'pending', 3, '', '', '', '2022-11-01 07:43:11'),
(5, 1, 'Kiritpur', 'dudhpokhari', 12345, 'COD', 2154000, 'pending', 5, '', '', '', '2022-11-01 08:29:15'),
(11, 1, 'asd', 'asd', 0, 'payu', 195000, 'pending', 1, '19191045018d566eb80f', '', '', '2022-11-02 05:56:57'),
(12, 1, 'asd', 'asd', 0, 'payu', 130000, 'pending', 1, '7b84d0398d8ba2abb491', '', '', '2022-11-02 06:17:03'),
(15, 1, 'asd', 'asd', 0, 'payu', 31500, 'pending', 1, '599afa7e653193f368b1', '', '', '2022-11-02 06:35:33'),
(16, 1, 'asdasd', 'asdasd', 0, 'payu', 130000, 'pending', 1, '2f9185ebd790feff4f5b', '', '', '2022-11-02 07:00:15'),
(17, 1, 'aaaa', 'aaaa', 0, 'payu', 109000, 'pending', 1, '9fd030eaff637e5651a7', '', '', '2022-11-02 01:06:26'),
(18, 1, 'assdfsdf', 'asdasda', 2315, 'payu', 42500, 'pending', 1, '8f315ac1a1ce264db931', '', '', '2022-11-03 02:54:33'),
(19, 1, 'asdasasd', 'asdasd', 123456, 'payu', 41500, 'pending', 1, '00b41bd00e1b973cebef', '', '', '2022-11-03 03:05:15'),
(20, 1, 'asdasd', 'asdasda', 12346, 'payu', 51500, 'pending', 1, '9ea562f4d41544e84a07', '', '', '2022-11-03 03:10:06'),
(21, 1, 'asd', 'asd', 1111, 'payu', 20000, 'pending', 1, 'eee3fa81795eb919d9b9', '', '', '2022-11-03 03:49:00');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` float NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `order_id`, `product_id`, `qty`, `price`, `added_on`) VALUES
(8, 2, 2, 1, 109000, '0000-00-00 00:00:00'),
(9, 3, 17, 1, 130000, '0000-00-00 00:00:00'),
(10, 3, 14, 1, 42500, '0000-00-00 00:00:00'),
(11, 4, 17, 5, 130000, '0000-00-00 00:00:00'),
(12, 4, 2, 2, 109000, '0000-00-00 00:00:00'),
(13, 5, 18, 8, 33000, '0000-00-00 00:00:00'),
(14, 5, 1, 10, 189000, '0000-00-00 00:00:00'),
(22, 0, 17, 1, 130000, '0000-00-00 00:00:00'),
(23, 0, 25, 1, 20000, '0000-00-00 00:00:00'),
(24, 10, 14, 1, 42500, '0000-00-00 00:00:00'),
(25, 11, 4, 1, 195000, '0000-00-00 00:00:00'),
(26, 12, 17, 1, 130000, '0000-00-00 00:00:00'),
(27, 13, 17, 1, 130000, '0000-00-00 00:00:00'),
(28, 14, 17, 1, 130000, '0000-00-00 00:00:00'),
(29, 15, 30, 1, 31500, '0000-00-00 00:00:00'),
(30, 16, 17, 1, 130000, '0000-00-00 00:00:00'),
(31, 17, 2, 1, 109000, '0000-00-00 00:00:00'),
(32, 18, 14, 1, 42500, '0000-00-00 00:00:00'),
(33, 19, 23, 1, 41500, '0000-00-00 00:00:00'),
(34, 20, 22, 1, 51500, '0000-00-00 00:00:00'),
(35, 21, 25, 1, 20000, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`id`, `name`) VALUES
(1, 'Pending'),
(2, 'Processing'),
(3, 'Shipping'),
(4, 'Canceled'),
(5, 'Complete');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mrp` float NOT NULL,
  `price` float NOT NULL,
  `qty` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `short_desc` varchar(2000) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(2000) NOT NULL,
  `meta_desc` varchar(2000) NOT NULL,
  `meta_keyword` varchar(2000) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `categories_id`, `name`, `mrp`, `price`, `qty`, `image`, `short_desc`, `description`, `meta_title`, `meta_desc`, `meta_keyword`, `status`) VALUES
(1, 1, 'iphone 14 pro max', 195000, 189000, 150, '273230055_14 phantom black.jpg', 'iphone 14 pro max', 'iphone 14 pro max', 'iphone 14 pro max', '', 'apple', 1),
(2, 1, 'Iphone X', 120000, 109000, 500, '594991298_iphone X.jpg', 'Iphone X', 'Iphone X', 'Iphone X', 'Iphone X', 'apple', 1),
(3, 1, 'Iphone 7 Rose Gold', 60000, 55000, 500, '243166456_7 White.png', 'Iphone7', 'Iphone7', 'Iphone7', '', 'apple', 1),
(4, 2, 'Samsung S22 Ultra', 20000, 195000, 500, '557569687_samsung S22 ultra.jpg', 'Samsung S22 Ultra', 'Samsung S22 Ultra', 'Samsung S22 Ultra', 'Samsung S22 Ultra', 'samsung', 1),
(14, 3, 'Realme Narzo 50', 45000, 42500, 127, '184546171_realme narzo 50 green.jpg', 'Realme Narzo 50', 'Realme Narzo 50', 'Realme Narzo 50', '', 'realme', 1),
(15, 4, 'Xiaomi 12X', 50000, 45500, 130, '892409676_xiaomi.jpg', 'Xiaomi 12X', 'Xiaomi 12X', 'Xiaomi 12X', 'Xiaomi 12X', 'xiaomi', 1),
(16, 1, 'Iphone 5S', 20000, 19500, 12, '669808473_5S vblack.png', 'Iphone 5S', 'Iphone 5S', 'Iphone 5S', 'Iphone 5S', 'apple', 1),
(17, 1, 'Iphone 13 Pro Max', 145000, 130000, 120, '726158902_13 Matt black.png', 'Iphone 13 pro Max', 'Iphone 13 pro Max', 'Iphone 13 pro Max', 'Iphone 13 pro Max', 'apple', 1),
(18, 1, 'Iphone 8', 35000, 33000, 50, '238847789_Red 8.jpg', 'Iphone 8', 'Iphone 8', 'Iphone 8', 'Iphone 8', 'apple', 1),
(19, 4, 'Xiaomi 11 Lite', 35000, 30000, 500, '730699379_xiaomi 11 lite grey blue.png', 'Xiaomi 11 Lite', 'Xiaomi 11 Lite', 'Xiaomi 11 Lite', 'Xiaomi 11 Lite', 'xiaomi', 1),
(20, 4, 'Xiaomi 12X Black', 45500, 41000, 50, '850490598_Xiaomi 12X black.jpg', 'Xiaomi 12X Black', 'Xiaomi 12X Black', 'Xiaomi 12X Black', 'Xiaomi 12X Black', 'xiaomi', 0),
(21, 4, 'Xiaomi 12S Ultra', 55000, 51000, 90, '217737629_Xiaomi-12S-Ultra-800 black.png', 'Xiaomi 12S Ultra', 'Xiaomi 12S Ultra', 'Xiaomi 12S Ultra', 'Xiaomi 12S Ultra', 'xiaomi', 1),
(22, 3, 'Realme C30S', 54000, 51500, 200, '185128074_realme C30s blue.png', 'Realme C30S', 'Realme C30S', 'Realme C30S', 'Realme C30S', 'realme', 1),
(23, 3, 'Realme C33', 45000, 41500, 200, '216446242_realme C33 Black.png', 'Realme C33', 'Realme C33', 'Realme C33', 'Realme C33', 'realme', 1),
(24, 3, 'Realme narzo 50I Prime', 85000, 81500, 300, '171144355_realme narzo 50i prime grey.png', 'Realme narzo 50I Prime', 'Realme narzo 50I Prime', 'Realme narzo 50I Prime', 'Realme narzo 50I Prime', 'realme', 0),
(25, 2, 'Samsung Galaxy S6', 23000, 20000, 5, '440044052_galaxy S6.png', 'Samsung Galaxy S6', 'Samsung Galaxy S6', 'Samsung Galaxy S6', 'Samsung Galaxy S6', 'samsung', 1),
(26, 2, 'Samsung Galaxy S21 Ultra', 125000, 109000, 50, '297403425_S21 ultra.jpg', 'Samsung Galaxy S21 Ultra', 'Samsung Galaxy S21 Ultra', 'Samsung Galaxy S21 Ultra', 'Samsung Galaxy S21 Ultra', 'samsung', 0),
(27, 2, 'Samsung Z flip', 110000, 109000, 90, '243420757_z flip.jpg', 'Samsung Z flip', 'Samsung Z flip', 'Samsung Z flip', 'Samsung Z flip', 'samsung', 0),
(28, 5, 'Mi 10T', 45000, 41500, 80, '393530973_Mi 10T black.png', 'Mi 10T', 'Mi 10T', 'Mi 10T', 'Mi 10T', 'mi', 0),
(29, 5, 'Mi 10T Blue', 50000, 48500, 80, '559939195_Mi 10TBlue-800-png-pro.png', 'Mi 10T Blue', 'Mi 10T Blue', 'Mi 10T Blue', 'Mi 10T Blue', 'mi', 0),
(30, 5, 'Mi 11 Lite 5G', 33000, 31500, 300, '913946895_Mi-11-lite-5G-green-png.png', 'Mi 11 Lite 5G', 'Mi 11 Lite 5G', 'Mi 11 Lite 5G', 'Mi 11 Lite 5G', 'mi', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `email`, `mobile`, `added_on`) VALUES
(1, 'Bishal Thapa', '123456', 'bishal.thap3@gmail.com', '9860461499', '2022-10-30 10:46:54'),
(2, 'Noyal Nakarmi', 'bhosdiwala', 'Noyal_bhosdiwala69@gmail.com', '9860696969', '2022-10-31 05:55:46'),
(3, 'Pramesh Maharjan', 'Goru123', 'Pramesh_goru@gmail.com', '9808080808', '2022-10-31 05:59:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
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
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
