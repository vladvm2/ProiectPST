-- MariaDB dump 10.19  Distrib 10.11.6-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: magazinelectronice
-- ------------------------------------------------------
-- Server version	10.11.6-MariaDB-1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cat_name` (`cat_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES
(3,'Accessories'),
(1,'Adventure'),
(2,'Novel');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flyway_schema_history`
--

DROP TABLE IF EXISTS `flyway_schema_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flyway_schema_history` (
  `installed_rank` int(11) NOT NULL,
  `version` varchar(50) DEFAULT NULL,
  `description` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `script` varchar(1000) NOT NULL,
  `checksum` int(11) DEFAULT NULL,
  `installed_by` varchar(100) NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `execution_time` int(11) NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`installed_rank`),
  KEY `flyway_schema_history_s_idx` (`success`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flyway_schema_history`
--

LOCK TABLES `flyway_schema_history` WRITE;
/*!40000 ALTER TABLE `flyway_schema_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `flyway_schema_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES
(48);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `description` varchar(500) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` decimal(19,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES
(8,'Example Name',1,'Example Description','https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX7389458.jpg',22.00),
(9,'Example Name',1,'Example Description','https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX7389458.jpg',22.00),
(10,'Example Name',2,'Example Description','https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX7389458.jpg',22.00),
(11,'Example Name',2,'Example Description','https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX7389458.jpg',22.00),
(15,'Example Name',1,'Example Description','https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX7389458.jpg',22.00),
(16,'Example Name',1,'Example Description','https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX7389458.jpg',22.00),
(17,'Example Name',2,'Example Description','https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX7389458.jpg',22.00),
(18,'Example Name',2,'Example Description','https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX7389458.jpg',22.00),
(20,'adasdasdas',3,'asdasdasda','https://cdn.freshful.ro/media/cache/sylius_shop_product_original/cc/71/d88788618a7282babdc8bb64222b.jpg',22.00),
(24,'Example Name',1,'Example Description','https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX7389458.jpg',22.00),
(25,'Example Name',1,'Example Description','https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX7389458.jpg',22.00),
(26,'Example Name',2,'Example Description','https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX7389458.jpg',22.00),
(27,'Example Name',1,'Example ','https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX7389458.jpg',22.00),
(38,'Example Name',1,'Example Description','https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX7389458.jpg',22.00),
(39,'Example Name',1,'Example Description','https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX7389458.jpg',22.00),
(40,'Example Name',2,'Example Description','https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX7389458.jpg',22.00),
(41,'Example Name',2,'Example Description','https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX7389458.jpg',22.00),
(44,'Example Name',1,'Example Description','https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX7389458.jpg',22.00),
(45,'Example Name',1,'Example Description','https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX7389458.jpg',22.00),
(46,'Example Name',2,'Example Description','https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX7389458.jpg',22.00),
(47,'Example Name',2,'Example Description','https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX7389458.jpg',22.00);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `gender` varchar(255) NOT NULL,
  `balance` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES
(42,'admin','admin@example.com','$2a$10$UEgv3Lzk/yFmb9VAwYH93.Up22dWdttrVC25Ed/Kfsj4WuXbZzlJC',NULL,NULL,0,NULL,'Male',NULL),
(43,'user','user@example.com','$2a$10$78XF9zaT7rd6vvhYspVcUuL/d9BAKL.Md69xFPJjncmwC4FgwgiJ2',NULL,NULL,0,NULL,'Female',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-19  5:50:04
