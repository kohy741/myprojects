-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: phase1_loginpage
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `item_id` int DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  KEY `item_id` (`item_id`),
  CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'electronics'),(1,'cellphone'),(1,'apple'),(2,'clothing'),(2,'hoodie'),(2,'adidas'),(3,'electronics'),(3,'laptop'),(3,'apple'),(4,'furniture'),(4,'dining table'),(4,'home'),(5,'electronics'),(5,'camera'),(5,'canon'),(6,'men\'s shoes'),(6,'shoes'),(6,'nike'),(7,'electronics'),(7,'cellphone'),(7,'google'),(8,'electronics'),(8,'television'),(8,'lg'),(9,'electronics'),(9,'drones'),(9,'dji'),(10,'electronics'),(10,'gaming'),(10,'nintendo'),(11,'clothing'),(11,'jeans'),(11,'levi\'s'),(12,'electronics'),(12,'gaming'),(12,'sony'),(13,'furniture'),(13,'bed'),(13,'ikea'),(14,'electronics'),(14,'headphones'),(14,'bose'),(15,'electronics'),(15,'camera'),(15,'gopro'),(16,'clothing'),(16,'sports bra'),(16,'lululemon'),(17,'furniture'),(17,'sofa'),(17,'home'),(18,'music'),(18,'vinyl records'),(18,'vintage'),(19,'electronics'),(19,'smart home'),(19,'home'),(20,'sports'),(20,'fitness'),(20,'home'),(21,'furniture'),(21,'sofa'),(21,'ikea'),(21,'loveseat'),(22,'electronics'),(22,'cellphone'),(22,'samsung'),(23,'shoes'),(23,'nike'),(24,'adidas'),(24,'shoes'),(24,'gazelle'),(25,'sporting'),(25,'sports'),(25,'gym'),(25,'home'),(26,'bicycle'),(26,'sports'),(26,'sporting'),(26,'outdoor'),(27,'cgn'),(27,'vitaminc'),(27,'vitamin'),(27,'supplement'),(28,'supplement'),(28,'vitamin'),(28,'vitamind3'),(28,'nowfoods'),(29,'Texas Instruments'),(29,'Scientific Calculators'),(29,'Calculators'),(29,'office'),(29,'school'),(29,'math'),(30,'Shoes'),(30,'nike'),(30,'kidsshoes'),(30,'kids'),(31,'printer'),(31,'hp'),(31,'office'),(31,'school'),(31,'wireless'),(32,'soccer'),(32,' outdoor'),(32,' sports'),(32,' sporting'),(33,'water'),(33,' bottle'),(34,'electronics'),(34,' apple'),(34,' tablet pc');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-08 22:36:14
