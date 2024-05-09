-- MySQL dump 10.13  Distrib 8.0.31, for macos12 (x86_64)
--
-- Host: 127.0.0.1    Database: testdb1
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `wheelId` int NOT NULL,
  `vehicleTypeId` int NOT NULL,
  `vehicleModelId` int NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wheelId` (`wheelId`),
  KEY `vehicleTypeId` (`vehicleTypeId`),
  KEY `vehicleModelId` (`vehicleModelId`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`wheelId`) REFERENCES `wheels` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`vehicleTypeId`) REFERENCES `vehicletypes` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `users_ibfk_3` FOREIGN KEY (`vehicleModelId`) REFERENCES `vehiclemodels` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'ad','asd','2024-05-09','2024-05-24',2,2,2,'2024-05-08 07:55:52','2024-05-08 07:55:52'),(2,'ad','asd','2024-05-27','2024-05-30',2,2,2,'2024-05-08 08:07:25','2024-05-08 08:07:25'),(3,'ad','asd','2024-05-31','2024-06-01',2,2,2,'2024-05-09 04:25:10','2024-05-09 04:25:10'),(4,'test','1','2024-05-10','2024-05-11',1,3,3,'2024-05-09 04:32:32','2024-05-09 04:32:32'),(5,'asdas','sdasd','2024-05-13','2024-05-15',1,3,3,'2024-05-09 04:33:26','2024-05-09 04:33:26'),(6,'himanshu','bhanderi','2024-06-03','2024-06-04',2,2,2,'2024-05-09 04:50:39','2024-05-09 04:50:39');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiclemodels`
--

DROP TABLE IF EXISTS `vehiclemodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehiclemodels` (
  `id` int NOT NULL AUTO_INCREMENT,
  `model` varchar(255) NOT NULL,
  `vehicleTypeId` int NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vehicleTypeId` (`vehicleTypeId`),
  CONSTRAINT `vehiclemodels_ibfk_1` FOREIGN KEY (`vehicleTypeId`) REFERENCES `vehicletypes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiclemodels`
--

LOCK TABLES `vehiclemodels` WRITE;
/*!40000 ALTER TABLE `vehiclemodels` DISABLE KEYS */;
INSERT INTO `vehiclemodels` VALUES (1,'alto',1,'2024-05-08 10:07:42','2024-05-08 10:07:42'),(2,'creta',2,'2024-05-08 10:07:42','2024-05-08 10:07:42'),(3,'R15',3,'2024-05-08 10:07:42','2024-05-08 10:07:42'),(4,'honda',4,'2024-05-08 10:07:42','2024-05-08 10:07:42');
/*!40000 ALTER TABLE `vehiclemodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicletypes`
--

DROP TABLE IF EXISTS `vehicletypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicletypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `wheelId` int NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wheelId` (`wheelId`),
  CONSTRAINT `vehicletypes_ibfk_1` FOREIGN KEY (`wheelId`) REFERENCES `wheels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicletypes`
--

LOCK TABLES `vehicletypes` WRITE;
/*!40000 ALTER TABLE `vehicletypes` DISABLE KEYS */;
INSERT INTO `vehicletypes` VALUES (1,'hatchback',2,'2024-05-08 10:07:42','2024-05-08 10:07:42'),(2,'suv',2,'2024-05-08 10:07:42','2024-05-08 10:07:42'),(3,'sport',1,'2024-05-08 10:07:42','2024-05-08 10:07:42'),(4,'simple',1,'2024-05-08 10:07:42','2024-05-08 10:07:42');
/*!40000 ALTER TABLE `vehicletypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wheels`
--

DROP TABLE IF EXISTS `wheels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wheels` (
  `id` int NOT NULL AUTO_INCREMENT,
  `wheelNumber` int NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wheels`
--

LOCK TABLES `wheels` WRITE;
/*!40000 ALTER TABLE `wheels` DISABLE KEYS */;
INSERT INTO `wheels` VALUES (1,2,'2024-05-08 10:07:42','2024-05-08 10:07:42'),(2,4,'2024-05-08 10:07:42','2024-05-08 10:07:42');
/*!40000 ALTER TABLE `wheels` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-09 11:36:01
