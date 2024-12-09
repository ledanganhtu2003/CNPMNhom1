-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: phoneweb
-- ------------------------------------------------------
-- Server version	8.2.0
create schema phoneweb;
use phoneweb;
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'iPhone'),(2,'iPad'),(3,'MacBook'),(4,'HUWEI');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `image_id` int NOT NULL AUTO_INCREMENT,
  `image_big` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image_small` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`image_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,'https://product.hstatic.net/200000348419/product/iphone_14_chinh_hang_vna_blue_420d19422a3845b0ba2ad8e5c583173d_large.png','https://product.hstatic.net/200000348419/product/iphone_14_chinh_hang_vna_blue_420d19422a3845b0ba2ad8e5c583173d_large.png'),(2,'https://cdn1.viettelstore.vn/images/Product/ProductImage/medium/1739838412.jpeg','https://cdn1.viettelstore.vn/images/Product/ProductImage/medium/1739838412.jpeg'),(3,'https://bizweb.sapocdn.net/thumb/large/100/453/419/products/600x600-14pro-max-xam-600x600-3-81252449-25ff-4c72-8a20-1f8051459e82.png?v=1663409593000','https://bizweb.sapocdn.net/thumb/large/100/453/419/products/600x600-14pro-max-xam-600x600-3-81252449-25ff-4c72-8a20-1f8051459e82.png?v=1663409593000'),(6,'https://didongviet.vn/pub/media/catalog/product//s/a/samsung-galaxy-s23-mau-tim-1-didongviet_1.jpg','https://didongviet.vn/pub/media/catalog/product//s/a/samsung-galaxy-s23-mau-tim-1-didongviet_1.jpg'),(4,'https://cdn1.viettelstore.vn/images/Product/ProductImage/medium/1051159192.jpeg','https://cdn1.viettelstore.vn/images/Product/ProductImage/medium/1051159192.jpeg'),(5,'https://cdn1.viettelstore.vn/images/Product/ProductImage/medium/1710720798.jpeg','https://cdn1.viettelstore.vn/images/Product/ProductImage/medium/1710720798.jpeg'),(11,'https://didongviet.vn/pub/media/catalog/product//x/i/xiaomi-13-256gb-didongviet.png','https://didongviet.vn/pub/media/catalog/product//x/i/xiaomi-13-256gb-didongviet.png'),(12,'https://didongviet.vn/pub/media/catalog/product//x/i/xiaomi-redmi-12c-128gb-didongviet.jpg','https://didongviet.vn/pub/media/catalog/product//x/i/xiaomi-redmi-12c-128gb-didongviet.jpg'),(13,'https://didongviet.vn/pub/media/catalog/product//x/i/xiaomi-redmi-note-11-pro-5g-128gb-didongviet_2.jpg','https://didongviet.vn/pub/media/catalog/product//x/i/xiaomi-redmi-note-11-pro-5g-128gb-didongviet_2.jpg'),(14,'https://didongviet.vn/pub/media/catalog/product//x/i/xiaomi-redmi-10-5g-didongviet.jpg','https://didongviet.vn/pub/media/catalog/product//x/i/xiaomi-redmi-10-5g-didongviet.jpg'),(15,'https://didongviet.vn/pub/media/catalog/product//x/i/xiaomi-13-lite-256gb-didongviet.jpg','https://didongviet.vn/pub/media/catalog/product//x/i/xiaomi-13-lite-256gb-didongviet.jpg'),(7,'https://didongviet.vn/pub/media/catalog/product//s/a/samsung-galaxy-s22-ultra-128gb-didongviet_1.jpg','https://didongviet.vn/pub/media/catalog/product//s/a/samsung-galaxy-s22-ultra-128gb-didongviet_1.jpg'),(8,'https://didongviet.vn/pub/media/catalog/product//s/a/samsung-galaxy-a73-didongviet_1.jpg','https://didongviet.vn/pub/media/catalog/product//s/a/samsung-galaxy-a73-didongviet_1.jpg'),(9,'https://didongviet.vn/pub/media/catalog/product//s/a/samsung-galaxy-s22-128gb-bhdt-didongviet.jpg','https://didongviet.vn/pub/media/catalog/product//s/a/samsung-galaxy-s22-128gb-bhdt-didongviet.jpg'),(10,'https://didongviet.vn/pub/media/catalog/product//s/a/samsung-galaxy-s23-ultra-5g-bhdt-mau-xanh-didongviet_2.png','https://didongviet.vn/pub/media/catalog/product//s/a/samsung-galaxy-s23-ultra-5g-bhdt-mau-xanh-didongviet_2.png');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `information`
--

DROP TABLE IF EXISTS `information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `information` (
  `info_id` int NOT NULL AUTO_INCREMENT,
  `camera` text,
  `camera_selfie` text,
  `cell` varchar(255) DEFAULT NULL,
  `cpu` varchar(255) DEFAULT NULL,
  `gpu` varchar(255) DEFAULT NULL,
  `memory` varchar(255) DEFAULT NULL,
  `os` varchar(50) DEFAULT NULL,
  `ram` varchar(50) DEFAULT NULL,
  `screen` varchar(255) DEFAULT NULL,
  `sim` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `information`
--

LOCK TABLES `information` WRITE;
/*!40000 ALTER TABLE `information` DISABLE KEYS */;
INSERT INTO `information` VALUES (1,'Chính: khẩu độ ƒ / 1,78, Chụp xa: khẩu độ ƒ / 2.8, Hệ thống camera chuyên nghiệp (48MP chính, 12MP siêu rộng và 12MP tele), Siêu rộng: khẩu độ ƒ / 2.2','12MP, khẩu độ ƒ / 1.9','Phát video lên tới 29 giờ (theo Apple)','Chip A16 Bionic,CPU 6 nhân, GPU 5 lõi, 16-core Neural Engine','A16 Bionic','16GB','IOS','6GB','6.7″Super Retina XDR display','yes'),(2,'Chính: khẩu độ ƒ / 1,78, Chụp xa: khẩu độ ƒ / 2.8, Hệ thống camera chuyên nghiệp (48MP chính, 12MP siêu rộng và 12MP tele), Siêu rộng: khẩu độ ƒ / 2.2','12MP, khẩu độ ƒ / 1.9','Phát video lên tới 29 giờ (theo Apple)','Chip A16 Bionic,CPU 6 nhân, GPU 5 lõi, 16-core Neural Engine','A16 Bionic','128GB','IOS','6GB','6.7″Super Retina XDR display','yes'),(3,'Chính: khẩu độ ƒ / 1,78, Chụp xa: khẩu độ ƒ / 2.8, Hệ thống camera chuyên nghiệp (48MP chính, 12MP siêu rộng và 12MP tele), Siêu rộng: khẩu độ ƒ / 2.2','12MP, khẩu độ ƒ / 1.9','Phát video lên tới 29 giờ (theo Apple)','Chip A16 Bionic,CPU 6 nhân, GPU 5 lõi, 16-core Neural Engine','A16 Bionic','128GB','IOS','6GB','6.7″Super Retina XDR display','yes'),(4,'Chính: khẩu độ ƒ / 1,78, Chụp xa: khẩu độ ƒ / 2.8, Hệ thống camera chuyên nghiệp (48MP chính, 12MP siêu rộng và 12MP tele), Siêu rộng: khẩu độ ƒ / 2.2','12MP, khẩu độ ƒ / 1.9','Phát video lên tới 29 giờ (theo Apple)','Chip A16 Bionic,CPU 6 nhân, GPU 5 lõi, 16-core Neural Engine','A16 Bionic','128GB','IOS','6GB','6.7″Super Retina XDR display','yes'),(5,'Chính: khẩu độ ƒ / 1,78, Chụp xa: khẩu độ ƒ / 2.8, Hệ thống camera chuyên nghiệp (48MP chính, 12MP siêu rộng và 12MP tele), Siêu rộng: khẩu độ ƒ / 2.2','12MP, khẩu độ ƒ / 1.9','Phát video lên tới 29 giờ (theo Apple)','Chip A16 Bionic,CPU 6 nhân, GPU 5 lõi, 16-core Neural Engine','A16 Bionic','128GB','IOS','6GB','6.7″Super Retina XDR display','yes'),(6,'8MP','12MP','Khoảng 8.200 mAh','	\r\nA13 Bionic','A16 Bionic','64GB, 256GB','IOS','6GB','	\r\n10.2”, IPS LCD, Retina','no'),(7,'8MP','12MP','Khoảng 8.200 mAh','	\r\nA13 Bionic','A16 Bionic','64GB, 256GB','IOS','6GB','	\r\n10.2”, IPS LCD, Retina','no'),(8,'8MP','12MP','Khoảng 8.200 mAh','	\r\nA13 Bionic','A16 Bionic','64GB, 256GB','IOS','6GB','	\r\n10.2”, IPS LCD, Retina','no'),(9,'8MP','12MP','Khoảng 8.200 mAh','	\r\nA13 Bionic','A16 Bionic','64GB, 256GB','IOS','6GB','	\r\n10.2”, IPS LCD, Retina','no'),(19,'100MP','','','','','','','','',''),(20,'1','1','1','1','1','1','1','5','1','2');
/*!40000 ALTER TABLE `information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `order_detail_id` int NOT NULL AUTO_INCREMENT,
  `price` bigint NOT NULL,
  `quantity` int NOT NULL,
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`order_detail_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (11,790000,1,10,19),(12,790000,1,3,19);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `order_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `phone` varchar(15) DEFAULT NULL,
  `status` tinyint DEFAULT '0',
  `total` bigint NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `FK32ql8ubntj5uh44ph9659tiih` (`user_id`),
  CONSTRAINT `FK32ql8ubntj5uh44ph9659tiih` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (3,'Ninh Thuận','2024-12-02 16:42:33','123123',0,790000,4);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `description` text,
  `price` bigint NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `category_id` int DEFAULT NULL,
  `info_id` int DEFAULT NULL,
  `image_big` varchar(255) DEFAULT NULL,
  `image_small` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `category_id` (`category_id`),
  KEY `info_id` (`info_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`info_id`) REFERENCES `information` (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'⍟Ưu đãi thanh toán:\r\n1. Giảm 1.000.000đ qua Moca (mã online: SHOPDUNKIP14)\r\n2. Giảm 1.000.000đ qua VNPAY (mã offline: HMQR1TR)\r\n3. Giảm 5% tối đa 1.000.000đ khi thanh toán trả góp qua Kredivo (chi tiết)\r\n4. Trả góp 0% qua thẻ tín dụng (chi tiết)',34000000,'iPhone 14 Pro Max 128GB',1,1,'phat-trien-y-tuong-san-pham-moi.jpg','download.jpeg'),(2,'⍟Ưu đãi thanh toán:\r\n1. Giảm 1.000.000đ qua Moca (mã online: SHOPDUNKIP14)\r\n2. Giảm 1.000.000đ qua VNPAY (mã offline: HMQR1TR)\r\n3. Giảm 5% tối đa 1.000.000đ khi thanh toán trả góp qua Kredivo (chi tiết)\r\n4. Trả góp 0% qua thẻ tín dụng (chi tiết)',34000000,'iPhone 14 Pro Max 128GB',1,2,'211-220825081130-220825081130-thumb-230222052731-230222172731_thumb.webp','211-220825081130-220825081130-thumb-230222052731-230222172731_thumb.webp'),(3,'⍟Ưu đãi thanh toán:\r\n1. Giảm 1.000.000đ qua Moca (mã online: SHOPDUNKIP14)\r\n2. Giảm 1.000.000đ qua VNPAY (mã offline: HMQR1TR)\r\n3. Giảm 5% tối đa 1.000.000đ khi thanh toán trả góp qua Kredivo (chi tiết)\r\n4. Trả góp 0% qua thẻ tín dụng (chi tiết)',34000000,'iPhone 14 Pro Max 128GB',1,3,NULL,NULL),(4,'⍟Ưu đãi thanh toán:\r\n1. Giảm 1.000.000đ qua Moca (mã online: SHOPDUNKIP14)\r\n2. Giảm 1.000.000đ qua VNPAY (mã offline: HMQR1TR)\r\n3. Giảm 5% tối đa 1.000.000đ khi thanh toán trả góp qua Kredivo (chi tiết)\r\n4. Trả góp 0% qua thẻ tín dụng (chi tiết)',34000000,'iPhone 13 Pro Max 128GB',1,4,NULL,NULL),(5,'⍟Ưu đãi thanh toán:\r\n1. Giảm 1.000.000đ qua Moca (mã online: SHOPDUNKIP14)\r\n2. Giảm 1.000.000đ qua VNPAY (mã offline: HMQR1TR)\r\n3. Giảm 5% tối đa 1.000.000đ khi thanh toán trả góp qua Kredivo (chi tiết)\r\n4. Trả góp 0% qua thẻ tín dụng (chi tiết)',34000000,'iPhone 13 Pro Max 128GB',1,5,NULL,NULL),(6,'Mạnh mẽ. Dễ sử dụng. Đa năng. ',10000000,'\r\niPad gen 9 10.2 inch Wi-Fi 64GB',2,6,NULL,NULL),(7,'Mạnh mẽ. Dễ sử dụng. Đa năng. ',10000000,'iPad gen 10 10.9 inch Wi-Fi 64GB',2,7,NULL,NULL),(8,'Mạnh mẽ. Dễ sử dụng. Đa năng. ',10000000,'iPad Pro M2 11 inch Wi-Fi 128GB',2,8,NULL,NULL),(9,'Mạnh mẽ. Dễ sử dụng. Đa năng. ',10000000,'ipad-pro-m2-11-inch-wi-fi-cellular-128gb',2,9,NULL,NULL),(19,'',790000,'Máy tính bảng iPad 9 WiFi 64GB',2,19,'ipad-9-wifi-note.jpg','ipad-9-wifi-trang-1.jpg'),(20,'12GB+512GB 5g 4900mAh 66W IP68 unlocked',400000,'Huawei Pura 70',4,20,'1681803471082_xiaomi_redmi_12c_64gb_didongviet.webp','1681803471082_xiaomi_redmi_12c_64gb_didongviet.webp');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ADMIN'),(2,'GUEST');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  KEY `FK_role` (`role_id`),
  CONSTRAINT `FKp56c1712k691lhsyewcssf40f` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Quận 9','admin@gmail.com','ADMIN123','827ccb0eea8a706c4c34a16891f84e7b','123',1),(2,'Quận 9','guest@gmail.com','Guest','827ccb0eea8a706c4c34a16891f84e7b','123',2),(4,'Ninh Thuận','ADMIN1@GMAIL.COM','Lê Đăng Anh Tú','202cb962ac59075b964b07152d234b70','123123',1),(5,'','','','d41d8cd98f00b204e9800998ecf8427e','',2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-03 11:28:03
