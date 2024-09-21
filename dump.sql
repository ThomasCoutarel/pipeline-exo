-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ecole
-- ------------------------------------------------------
-- Server version	8.4.0

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
-- Table structure for table `enseignants`
--

DROP TABLE IF EXISTS `enseignants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enseignants` (
  `teacher_id` int NOT NULL AUTO_INCREMENT,
  `prenom` varchar(50) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `numero_salle` varchar(10) DEFAULT NULL,
  `departement` varchar(50) DEFAULT NULL,
  `date_obtention` date DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  `numero_classe` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`teacher_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enseignants`
--

LOCK TABLES `enseignants` WRITE;
/*!40000 ALTER TABLE `enseignants` DISABLE KEYS */;
INSERT INTO `enseignants` VALUES (1,'Jonas','Salk',NULL,'Biologie',NULL,'jsalk@school.org','777-555-4321','5'),(3,'Élise','Laurent','B202','Physique','2023-05-15','elise.laurent@example.com','0723456789','CL2'),(4,'Victor','Carpentier','B203','Chimie','2023-05-15','victor.carpentier@example.com','0734567890','CL1');
/*!40000 ALTER TABLE `enseignants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etudiants`
--

DROP TABLE IF EXISTS `etudiants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etudiants` (
  `student_id` int NOT NULL AUTO_INCREMENT,
  `prenom` varchar(50) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `numero_salle` varchar(10) DEFAULT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `date_obtention` date DEFAULT NULL,
  `numero_classe` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etudiants`
--

LOCK TABLES `etudiants` WRITE;
/*!40000 ALTER TABLE `etudiants` DISABLE KEYS */;
INSERT INTO `etudiants` VALUES (1,'Mark','Watney',NULL,'777-555-1234',NULL,'2035-01-01','5'),(2,'Alice','Dupont','A101','0612345678','alice.dupont@example.com','2023-06-15','CL1'),(3,'Benoit','Martin','A102','0623456789','benoit.martin@example.com','2023-06-15','CL2'),(4,'Claire','Durand','A103','0634567890','claire.durand@example.com','2023-06-15','CL1'),(5,'David','Leroy','A104','0645678901','david.leroy@example.com','2023-06-15','CL2'),(6,'Emma','Bernard','A105','0656789012','emma.bernard@example.com','2023-06-15','CL1'),(7,'François','Moreau','A106','0667890123','francois.moreau@example.com','2023-06-15','CL2'),(8,'Gabrielle','Simon','A107','0678901234','gabrielle.simon@example.com','2023-06-15','CL1'),(9,'Hugo','Lemoine','A108','0689012345','hugo.lemoine@example.com','2023-06-15','CL2'),(10,'Isabelle','Boucher','A109','0690123456','isabelle.boucher@example.com','2023-06-15','CL1'),(11,'Jules','Giraud','A110','0601234567','jules.giraud@example.com','2023-06-15','CL2'),(12,'Karine','Fournier','A111','0612345678','karine.fournier@example.com','2023-06-15','CL1'),(13,'Louis','Vasseur','A112','0623456789','louis.vasseur@example.com','2023-06-15','CL2'),(14,'Marie','Lecoq','A113','0634567890','marie.lecoq@example.com','2023-06-15','CL1'),(15,'Nicolas','Delaunay','A114','0645678901','nicolas.delaunay@example.com','2023-06-15','CL2'),(16,'Océane','Garnier','A115','0656789012','oceane.garnier@example.com','2023-06-15','CL1'),(17,'Pierre','Noir','A116','0667890123','pierre.noir@example.com','2023-06-15','CL2'),(18,'Quentin','Pichon','A117','0678901234','quentin.pichon@example.com','2023-06-15','CL1'),(19,'Romain','Collet','A118','0689012345','romain.collet@example.com','2023-06-15','CL2'),(20,'Sophie','Fischer','A119','0690123456','sophie.fischer@example.com','2023-06-15','CL1');
/*!40000 ALTER TABLE `etudiants` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-21 20:55:38
