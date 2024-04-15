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
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `item_id` int DEFAULT NULL,
  `score` varchar(10) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  KEY `item_id` (`item_id`),
  KEY `username` (`username`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (21,'excellent','hello_world','this sofa is so comfortable','2023-08-08'),(22,'poor','hello_world','i miss my old iphone...','2023-08-08'),(1,'excellent','hello_world','this is so handy and small. I love it.','2023-08-08'),(30,'good','Ko','this Air jordan feels so comfy','2023-08-08'),(29,'poor','Ko','it didn\'t last long. I will never buy this calculator again.','2023-08-08'),(22,'excellent','Ko','what an excellent phone. my parents love it.','2023-08-08'),(18,'excellent','ilovecoding','this was what i wanted.','2023-08-08'),(6,'good','ilovecoding','Sneakers looked and fit perfectly. Also delivered in one day. Three days ahead of schedule. Great job!','2023-08-08'),(28,'poor','ilovecoding','I didn’t notice any difference by using this product .. Its like im not taking anything I don’t recommend softgels I think thats the problem','2023-08-08'),(31,'excellent','Ben','this printer is perfect!!!','2023-08-08'),(30,'poor','Ben','i will never buy these shoes again!!!','2023-08-08'),(22,'good','Ben','I like samsung','2023-08-08'),(38,'poor','Ko','it\'s too expensive unnecessarily. the price has to be cheaper','2023-08-14'),(37,'good','new_user','This is a nice Mic for my church. I will buy it again.','2023-08-14'),(32,'good','new_user','my lil brother loved it.','2023-08-14'),(8,'poor','new_user','it died after 2 months','2023-08-14'),(3,'excellent','qwerty123','this is super nice','2023-08-14'),(11,'fair','qwerty123','it is a lil too tight for me','2023-08-14'),(10,'good','qwerty123','my son liked it','2023-08-14'),(34,'excellent','Ko','lolol','2023-08-15'),(33,'fair','Ko','yttyur','2023-08-15'),(30,'good','Ko','hgdhjgd','2023-08-15');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-20  7:59:30
