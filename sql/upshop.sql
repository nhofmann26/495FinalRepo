-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 20, 2026 at 01:28 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `upshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `name`) VALUES
(1, 'Apparel'),
(2, 'Outdoor Gear'),
(3, 'Home Goods'),
(4, 'Electronics'),
(5, 'Food & Drink');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `reorder_level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`product_id`, `quantity`, `reorder_level`) VALUES
(1, 13, 5),
(2, 20, 6),
(3, 7, 4),
(4, 24, 8),
(5, 6, 5),
(6, 9, 4),
(7, 7, 3),
(8, 10, 4),
(9, 17, 6),
(10, 5, 5),
(11, 4, 3),
(12, 14, 5),
(13, 30, 10),
(14, 27, 10),
(15, 36, 10),
(16, 41, 10),
(17, 36, 10),
(18, 49, 10),
(19, 28, 10),
(20, 34, 10),
(21, 27, 10),
(22, 24, 10),
(23, 26, 10),
(24, 52, 10),
(25, 22, 10),
(26, 42, 10),
(27, 36, 10),
(28, 43, 10),
(29, 50, 10),
(30, 12, 10),
(31, 49, 10),
(32, 51, 10),
(33, 49, 10),
(34, 31, 10),
(35, 51, 10),
(36, 50, 10),
(37, 36, 10),
(38, 23, 10),
(39, 47, 10),
(40, 55, 10);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_name`, `total`, `created_at`) VALUES
(1, 'Noah', 44.99, '2026-04-14 20:34:29'),
(2, 'Stewie', 44.99, '2026-04-14 20:41:00'),
(3, 'Graycen', 47.97, '2026-04-14 23:51:49'),
(4, 'John Doe', 89.98, '2026-03-01 15:15:00'),
(5, 'Sarah Smith', 44.98, '2026-03-02 19:22:00'),
(6, 'Mike Johnson', 129.97, '2026-03-03 23:05:00'),
(7, 'Emily Davis', 44.97, '2026-03-04 17:30:00'),
(8, 'Chris Brown', 34.99, '2026-03-05 14:10:00'),
(9, 'Jessica Wilson', 69.98, '2026-03-06 21:45:00'),
(10, 'David Miller', 25.98, '2026-03-07 16:20:00'),
(11, 'Ashley Moore', 76.96, '2026-03-08 23:00:00'),
(12, 'Daniel Taylor', 35.98, '2026-03-09 17:15:00'),
(13, 'Laura Anderson', 69.98, '2026-03-10 21:40:00'),
(14, 'Kevin Thomas', 37.98, '2026-03-11 14:05:00'),
(15, 'Olivia Jackson', 119.98, '2026-03-12 19:30:00'),
(16, 'Ryan White', 79.99, '2026-03-13 16:10:00'),
(17, 'Sophia Harris', 79.98, '2026-03-14 22:55:00'),
(18, 'Ethan Martin', 59.99, '2026-03-15 13:25:00'),
(19, 'Mia Thompson', 49.98, '2026-03-16 18:45:00'),
(20, 'Noah Garcia', 14.99, '2026-03-17 20:30:00'),
(21, 'Ava Martinez', 19.98, '2026-03-18 15:50:00'),
(22, 'Liam Robinson', 26.97, '2026-03-19 17:35:00'),
(23, 'Emma Clark', 13.98, '2026-03-20 21:15:00');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
(1, 1, 1, 1, 44.99),
(2, 2, 1, 1, 44.99),
(3, 3, 9, 1, 12.99),
(4, 3, 3, 1, 19.99),
(5, 3, 4, 1, 14.99),
(6, 4, 1, 2, 44.99),
(7, 5, 2, 1, 24.99),
(8, 5, 3, 1, 19.99),
(9, 6, 5, 1, 59.99),
(10, 6, 6, 2, 34.99),
(11, 7, 4, 3, 14.99),
(12, 8, 6, 1, 34.99),
(13, 9, 7, 1, 29.99),
(14, 9, 8, 1, 39.99),
(15, 10, 9, 2, 12.99),
(16, 11, 10, 3, 8.99),
(17, 11, 11, 1, 49.99),
(18, 12, 12, 2, 17.99),
(19, 13, 13, 1, 49.99),
(20, 13, 14, 1, 19.99),
(21, 14, 15, 2, 18.99),
(22, 15, 16, 1, 99.99),
(23, 15, 17, 1, 19.99),
(24, 16, 18, 1, 79.99),
(25, 17, 19, 2, 39.99),
(26, 18, 20, 1, 59.99),
(27, 19, 21, 2, 24.99),
(28, 20, 22, 1, 14.99),
(29, 21, 23, 2, 9.99),
(30, 22, 24, 3, 8.99),
(31, 23, 25, 2, 6.99);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `name`, `description`, `price`, `category_id`, `image_url`) VALUES
(1, 'UP Hoodie', 'Warm gray hoodie with UP branding.', 44.99, 1, 'https://upsco-shop.imgix.net/images/stencil/original/products/198/523/upper-peninsula-youth-hoodie__65200.1574279914.png?bg=FFFFFF&dpr=1.2&fm=jpg&ixjsv=2.2.3&q=90&usm=20&w=360'),
(2, 'Lake Superior Tee', 'Soft t-shirt inspired by Lake Superior.', 24.99, 1, 'https://www.michiganawesome.com/cdn/shop/files/hth_grass_green_aadc580d-8307-4dd6-8272-af717356b28e.png?v=1760122312'),
(3, 'Winter Beanie', 'Knit beanie for cold Upper Peninsula days.', 19.99, 1, 'https://m.media-amazon.com/images/I/610EnMBw9zL._AC_UY1000_.jpg'),
(4, 'Camping Mug', 'Metal mug for camp coffee and cocoa.', 14.99, 2, 'https://m.media-amazon.com/images/S/aplus-media-library-service-media/b814a1b9-16a5-4c21-bcf4-71779781898b.__CR0,0,1200,900_PT0_SX600_V1___.jpg'),
(5, 'Trail Backpack', 'Compact backpack for day hikes.', 59.99, 2, 'https://www.trekking-mont-blanc.com/wp-content/uploads/2020/09/couverture-1080x675-1.jpg'),
(6, 'Lantern Light', 'Portable lantern for cabin and campsite use.', 34.99, 2, 'https://source.widen.net/content/nbwi810hsn/jpeg/CDL-2031004_Brown-Classic-Fairy-Light-Lantern-20in_SSC.jpeg?w=1600&h=2000&keep=c&crop=yes&color=cccccc&quality=100&u=7mzq6p'),
(7, 'Wood Sign', 'Decorative UP-themed wood sign.', 29.99, 3, 'https://carvedn.com/cdn/shop/products/IMG_8765.jpg?v=1723494493&width=1946'),
(8, 'Cozy Blanket', 'Soft fleece blanket for home or cabin.', 39.99, 3, 'https://naturallinens.com/cdn/shop/files/2_Walnut_cuddleblanket_1_1080x.jpg?v=1726279799'),
(9, 'Coffee Blend', 'Locally inspired dark roast coffee.', 12.99, 5, 'https://www.reggiesroast.com/cdn/shop/files/BlueMountainJamaicancoffee-34.jpg?v=1723562258'),
(10, 'Cherry Jam', 'Michigan-style cherry jam.', 8.99, 5, 'https://krema.com/cdn/shop/files/Tart_Cherry_Jam._800x.jpg?v=1774635215'),
(11, 'Bluetooth Speaker', 'Portable speaker for travel and outdoors.', 49.99, 4, 'https://m.media-amazon.com/images/I/71R6fEX2LFL.jpg'),
(12, 'Phone Charger', 'Fast USB charger for everyday use.', 17.99, 4, 'https://m.media-amazon.com/images/I/61nYNJ7O1BL.jpg'),
(13, 'UP Flannel Shirt', 'Classic plaid flannel for cold weather.', 49.99, 1, 'https://ih1.redbubble.net/image.1399693875.1581/ssrco,essential_tee,mens_01,heather_mid_grey,front,close_portrait,x1000.jpg'),
(14, 'Winter Gloves', 'Insulated gloves for harsh winters.', 19.99, 1, 'https://cdn11.bigcommerce.com/s-558hrkjw/images/stencil/1280x1280/products/434/4801/S820T_dbl__86730.1598025314.jpg?c=2'),
(15, 'UP Baseball Cap', 'Casual cap with UP logo.', 18.99, 1, 'https://129529823.cdn6.editmysite.com/uploads/1/2/9/5/129529823/MXV7H4A6WSB4YIAEX2JHA2HA.jpeg'),
(16, 'Thermal Long Sleeve', 'Warm thermal layer for outdoor wear.', 29.99, 1, 'https://m.media-amazon.com/images/I/81q4rHVWaFL._AC_UY1000_.jpg'),
(17, 'Hiking Socks', 'Durable socks for long hikes.', 12.99, 1, 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSVPZ-dtAtHavpO-ByZo_3tVwbhnL5s5_6cJg5xDhZDnNxtDLtfaRKdSJPYdGfZdW6q57rKs-DmLPZfIb6y44seCrpDikMB7WnkT0GzOkPZaBpJwFG4cRUDCptz8xpnOf8T-bly68GBfJ0&usqp=CAc'),
(18, 'Tent 2-Person', 'Lightweight tent for camping trips.', 99.99, 2, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcRxh9MviuHJStMhq9p71PoRXhm9O8J3YS3pVCwljg88edWBTWw1SwCj8m_CJdeBAwsuuCQfPgHslImibVH0hittfevyoaFun7k5K4hykumET9kWDeuhIL9z'),
(19, 'Sleeping Bag', 'Warm sleeping bag rated for cold nights.', 79.99, 2, 'https://featheredfriends.com/cdn/shop/products/feathered-friends-condor-yf-rectangular-modular-down-sleeping-bag-fir-green-with-hood_1800x1800.jpg?v=1618972124'),
(20, 'Portable Stove', 'Compact stove for outdoor cooking.', 39.99, 2, 'https://images.thdstatic.com/productImages/0bf691fb-e6ce-44cc-b588-dd3af6e724ba/svn/gasone-camping-stoves-gs-3400p-64_1000.jpg'),
(21, 'Hiking Poles', 'Adjustable poles for trail support.', 34.99, 2, 'https://www.halfmoonoutfitters.com/cdn/shop/files/1c83576cd24fc7998caa66466ce2423f2fb51737__99421.1704955919.386.513_1080x.jpg?v=1707762190'),
(22, 'Cooler Box', 'Insulated cooler for food and drinks.', 59.99, 2, 'https://m.media-amazon.com/images/I/61uvMyEd+JL._AC_UF1000,1000_QL80_.jpg'),
(23, 'Wall Clock', 'Rustic wood-style wall clock.', 24.99, 3, 'https://m.media-amazon.com/images/I/91iTKuPlDHL._AC_UF894,1000_QL80_.jpg'),
(24, 'Table Lamp', 'Minimalist lamp for home lighting.', 34.99, 3, 'https://m.media-amazon.com/images/I/813q7VYwTDL._AC_UF894,1000_QL80_.jpg'),
(25, 'Throw Pillow', 'Decorative pillow for couches.', 19.99, 3, 'https://m.media-amazon.com/images/I/71YAboIsyAL.jpg'),
(26, 'Candle Set', 'Scented candles for cozy evenings.', 22.99, 3, 'https://flamingoestate.com/cdn/shop/products/PH_33862.jpg?v=1761857892&width=2500'),
(27, 'Bookshelf Decor', 'Small decorative items for shelves.', 17.99, 3, 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTis5P3rJx07W6Uzic-N8pw0_Y_jRMrhHlNg4dzW9Tuq1bHofSWgC_7MT1YQWs7xaPidZDcUGq1pFA0p4hTWUzKVFITsJR1'),
(28, 'Wireless Earbuds', 'Compact earbuds with charging case.', 39.99, 4, 'https://iliveelectronics.com/media/catalog/product/cache/f06582b552fadabcfc537d3db732c68e/i/a/iaebtw53b-v3048-main_copy.jpg'),
(29, 'Smart Watch', 'Fitness tracking smartwatch.', 89.99, 4, 'https://m.media-amazon.com/images/I/61I22cL7v+L.jpg'),
(30, 'Laptop Stand', 'Adjustable stand for better posture.', 29.99, 4, 'https://www.nativeunion.com/cdn/shop/files/DeskStand_Sandstone.png?v=1755767340'),
(31, 'USB Hub', 'Multi-port USB hub for devices.', 19.99, 4, 'https://www.hypershop.com/cdn/shop/files/hyperdrive-next-7-port-usb-c-hub-2532792.webp?v=1762811868'),
(32, 'Power Bank', 'Portable battery for charging on the go.', 24.99, 4, 'https://www.computercablestore.com/content/images/thumbs/002/0027090_4-port-usb-30-hub-black.jpeg'),
(33, 'Maple Syrup', 'Pure Michigan maple syrup.', 14.99, 5, 'https://theroadsidemarket.com/cdn/shop/files/1Qtjug.jpg?v=1714068181&width=2000'),
(34, 'Granola Mix', 'Healthy snack mix for energy.', 9.99, 5, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcRh2dBV1XcGPvi_LR2wZkq-Q7nZX4cv7hr86wiZ2r3P7S5fy3V3nqFMEHmzLQZkOMgJNnwaJQ5puEvAiOFCklcf338zmenBF_wL4W1oLMqUUkzZzMmo-8FKsSZJBYyQsAfio39ZxLGC6g&usqp=CAc'),
(35, 'Trail Mix', 'Classic mix of nuts and dried fruit.', 8.99, 5, 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTu8HotZUg9bjdLi2fKFXNslndvrc0VR5FKWQ2SlZDGWMQhh8L3FvWJRAkfTJxYO_tIJU758DRp-_nSB6bkhrgHJCyX0rVBRE1-iRjFNtJjkEBOIvGbu45qCTEya7-xjntU7v6pON2l8A&usqp=CAc'),
(36, 'Hot Chocolate', 'Rich cocoa mix for winter.', 6.99, 5, 'https://www.tashasartisanfoods.com/blog/wp-content/uploads/2020/12/Classic-Hot-chocolate-6-new.jpg'),
(37, 'Energy Bars', 'Protein-packed snack bars.', 11.99, 5, 'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcR0lUu6-MVzqOMuh1RRFEuAy0DasuHMSwgw3Jl-k39g1XFH_F54_92EMVABsT4ywe7sN073I4OozCnXMxlu3-47xBQPj9yeNjkVlDYTgxGmnlNjF4A2-HKeWB-4LW6wO09mmZFMjqFOxA&usqp=CAc'),
(38, 'Coffee Mug Set', 'Set of ceramic mugs.', 21.99, 5, 'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQCbwSD82vu0xGYPZnoUHj8wqjuZM0gEZur4fLLD9chV0Xeb6Rv-XNUNvKmj3PGF7MKTOtLTsnVZcx7fqIyaQ1Qzw_b05diQ8fXGfjTih4N74KlUYuyjhBm6js9AcrtHqIZHhKEOq_5&usqp=CAc'),
(39, 'Tea Sampler', 'Assorted tea flavors.', 13.99, 5, 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRypqSUmn8UyQJPT84QIrDlmtpSeFbkSgiJQa-RqBaR2vSdXdFUpYQ8jK-ewHkxIJDmbk7OykLoBXCe__4ZV0gFizEfv-zngKmBTExJNFVPdft0-xcBsJUvlcpW3MyiJA&usqp=CAc'),
(40, 'Snack Box', 'Variety box of snacks.', 19.99, 5, 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSM5lOnsSGrDzIb7qDVz2MGvi42Bif1V3NbsmXXNiLs4zoSHEGChrHjOvHT4CO_JpKRN2PvYhvScHojHfEG-zSEYXCq0DXojIs6xPYn-vnrv39hK1KX6srR7F8ld9xDqyzrQr_6XHPQ6Xs&usqp=CAc');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
