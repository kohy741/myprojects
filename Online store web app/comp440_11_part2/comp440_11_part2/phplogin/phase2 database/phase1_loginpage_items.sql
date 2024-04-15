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
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `item_id` int NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `price` int DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `username` (`username`),
  CONSTRAINT `items_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'iPhone 13 Mini','2023-08-01',799,'I bought this 2 months ago. I barely used it. It\'s like new.','electronics,cellphone,apple','user123'),(2,'Adidas Originals Hoodie','2023-08-01',49,'Stylish Adidas hoodie for a sporty look.','clothing,hoodie,adidas','testuser'),(3,'MacBook Air M2','2023-08-01',1299,'Latest MacBook Air with the powerful M2 chip.','electronics,laptop,apple','hello_world'),(4,'Rustic Wooden Dining Table','2023-08-01',799,'Handcrafted wooden dining table for a cozy dining area.','furniture,dining table,home','ilovecoding'),(5,'Canon EOS R5','2023-08-01',2499,'Professional mirrorless camera with 45MP and 8K video recording.','electronics,camera,canon','user5678'),(6,'Nike Air VaporMax 2023 Flyknit','2023-08-02',210,'Have you ever walked on Air? Step into the Air VaporMax 2023 to see how it\'s done. The innovative tech is revealed through the perforated sockliner (pull it out to see more). The stretchy Flyknit upper is made with at least 20% recycled content by weight.','men\'s shoes, shoes, nike','Ko'),(7,'Google Pixel 7','2023-08-02',699,'The latest Google Pixel 7 with exceptional camera capabilities.','electronics,cellphone,google','coder123'),(8,'LG OLED C10','2023-08-02',1799,'Stunning OLED TV with true blacks and vibrant colors.','electronics,television,lg','happy_user'),(9,'DJI Mavic 3','2023-08-02',1399,'Professional-grade drone with 4K video and 40-minute flight time.','electronics,drones,dji','myusername'),(10,'Nintendo Switch Pro','2023-08-02',399,'Enhanced version of Nintendo Switch with better performance.','electronics,gaming,nintendo','rockstar'),(11,'Levi\'s 501 Jeans','2023-08-02',69,'Classic Levi\'s jeans for a casual outfit.','clothing,jeans,levi\'s','user123'),(12,'Sony PlayStation 6','2023-08-02',599,'Enjoy the immersive gaming experience with PlayStation 6.','electronics,gaming,sony','ilovecoding'),(13,'IKEA MALM Bed','2023-08-02',349,'Sturdy and stylish bed frame from IKEA.','furniture,bed,ikea','hello_world'),(14,'Bose QuietComfort 45','2023-08-03',349,'High-quality noise-canceling headphones for a superior audio experience.','electronics,headphones,bose','new_user'),(15,'GoPro Hero 10','2023-08-03',399,'Capture your adventures in high-quality 4K video with GoPro Hero 10.','electronics,camera,gopro','user5678'),(16,'Lululemon Sports Bra','2023-08-03',39,'High-quality sports bra for active women.','clothing,sports bra,lululemon','new_user'),(17,'Modern Sectional Sofa','2023-08-03',1299,'Contemporary sectional sofa for your living room.','furniture,sofa,home','coder123'),(18,'Vintage Vinyl Records','2023-08-03',49,'Collection of rare vintage vinyl records from various artists.','music,vinyl records,vintage','happy_user'),(19,'Smart Home Automation Kit','2023-08-04',299,'Complete smart home automation kit for seamless control.','electronics,smart home,home','myusername'),(20,'Home Gym Equipment Set','2023-08-04',799,'Transform your home with a complete gym equipment set.','sports,fitness,home','rockstar'),(21,'Ikea PÄRUP sofa. ','2023-08-04',600,'Sleek design, quick assembly and easy-care with a removable and washable cover make it easy to love PÄRUP sofa. ','furniture, sofa, ikea, loveseat','Ko'),(22,'Samsung Galaxy S22','2023-08-04',899,'Brand new Samsung Galaxy S22 in its original box. I barely used it.','electronics,cellphone,samsung','testuser'),(23,'Nike Air Force 1 \'07','2023-08-06',50,'Durable leather gives these sneakers a classic feel while perforated side panels in \"University Red\" add just the right amount of style to make you shine.\r\nI bought this 2 months ago.\r\nI loved it but I have to sell it because i need money.','shoes,nike','ilovecoding'),(24,'ADIDAS GAZELLE BOLD SHOES','2023-08-06',85,'Letting brand new Adidas GAZELLE BOLD Size 11 men.\r\nI have another pair.\r\nRegular Price from $140 to $85\r\nFixed price\r\nPick up only Hollywood Hills\r\nSerious people only.\r\nThank you.','adidas,shoes,gazelle','ilovecoding'),(25,'LIFE FITNESS SIGNATURE SERIES AB CRUNCH BENCH','2023-08-07',690,'The Life Fitness Signature Series Ab Crunch Bench uses dual pivot motion to effectively replicate abdominal crunch movement. \r\nThe bench design is optimized for easy entry/exit and greater stabilization.','sporting,sports,gym,home','papa'),(26,'Cannondale Road Bike Ultegra Dura-Ace','2023-08-07',385,'If you\'ve done your research you\'ll find the frame alone goes for more than my asking price.\r\n\r\nBought and custom built in 2017. Only ridden a few times so in newish condition please see for yourself','bicycle,sports,sporting,outdoor','Ko'),(27,'California Gold Nutrition Vitamin C, 1,000 mg, 60 Veggie Capsules','2023-08-08',7,'Vitamin C is a well-known essential vitamin that you must get from your daily diet, \r\nas your body is unable to produce it. California Gold Nutrition Gold C™ contains a powerful dose of this vitamin, \r\nhelping to ensure you get your recommended daily amount in one easy step.','cgn,vitaminc,vitamin,supplement','coder123'),(28,'NOW Foods, Vitamin D-3, 50 mcg (2,000 IU), 30 Softgels','2023-08-08',3,'NOW Vitamin D-3 softgels supply this key vitamin in a highly absorbable liquid softgel form.\r\n Vitamin D is normally obtained from the diet or produced by the skin from the ultraviolet energy of the sun.','supplement,vitamin,vitamind3,nowfoods','hello_world'),(29,'Texas Instruments TI-30XIIS Scientific Calculator','2023-08-08',10,'Black with Blue Accents.\r\nSolar and battery powered.','Texas Instruments,Scientific Calculators,Calculators,office,school,math','hello_world'),(30,'Air Jordan 1 Low OG','2023-08-08',120,'Make new moves in the Air Jordan 1 Low OG. \r\nRemade with the classic details, it combines a comfortable feel with the timeless style of one of culture\'s greatest sneaker creations.','Shoes,nike,kidsshoes,kids','hello_world'),(31,'HP DeskJet 2755e Wireless Color All-in-One Printer','2023-08-08',84,'with bonus 6 months Instant Ink (26K67A), white.\r\nthis is a really great deal','printer,hp,office,school,wireless','ilovecoding'),(32,'soccer ball','2023-08-08',20,'It\'s like new','soccer, outdoor, sports, sporting','Ben'),(33,'water bottle','2023-08-08',10,'it\'s a good water bottle','water, bottle','Ben'),(34,'ipad 6th generation','2023-08-08',200,'I never used it','electronics, apple, tablet pc','Ben');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
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
