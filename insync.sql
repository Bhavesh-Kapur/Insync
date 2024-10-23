-- MySQL dump 10.13  Distrib 5.7.24, for osx11.1 (x86_64)
--
-- Host: localhost    Database: insync
-- ------------------------------------------------------
-- Server version	9.0.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faculty` (
  `profid` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `CC` tinyint(1) DEFAULT NULL,
  `AC` tinyint(1) DEFAULT NULL,
  `PIC` tinyint(1) DEFAULT NULL,
  `PL` tinyint(1) DEFAULT NULL,
  `CH` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`profid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES (101,'Dr. John Doe',1,0,1,0,1),(102,'Prof. Jane Smith',0,1,0,1,0),(103,'Dr. Emily Carter',1,1,0,0,0),(104,'Prof. Michael Brown',0,0,1,1,1),(105,'Dr. Susan Green',1,0,0,0,1);
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invites`
--

DROP TABLE IF EXISTS `invites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invites` (
  `inviteId` int NOT NULL AUTO_INCREMENT,
  `sapid` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `semester` int DEFAULT NULL,
  `program` varchar(100) DEFAULT NULL,
  `inviteStatus` varchar(20) DEFAULT 'pending',
  `invitedBy` varchar(100) DEFAULT NULL,
  `inviteDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`inviteId`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invites`
--

LOCK TABLES `invites` WRITE;
/*!40000 ALTER TABLE `invites` DISABLE KEYS */;
INSERT INTO `invites` VALUES (27,123456,'John Doe',5,'Computer Science','Accepted','Bhavesh','2024-10-22 18:36:38'),(28,123456,'John Doe',5,'Computer Science','Accepted','Bhavesh','2024-10-22 18:43:21'),(29,123456,'John Doe',5,'Computer Science','Accepted','Bhavesh','2024-10-22 18:47:24'),(30,123456,'John Doe',5,'Computer Science','Accepted','Bhavesh','2024-10-22 19:04:22'),(31,12345,'Bhavesh',5,'Computer Science DevOps','Accepted','John Doe','2024-10-22 19:08:25'),(32,123456,'John Doe',5,'Computer Science','Accepted','Bhavesh','2024-10-23 02:22:43'),(33,123456,'John Doe',5,'Computer Science','Accepted','Bhavesh','2024-10-23 02:32:24'),(34,500061772,'AMAN GUPTA',5,'Devops','Accepted','ANUKRUTI MATHUR','2024-10-23 03:18:19'),(35,500061736,'ANKUR SAINI',5,'Devops','Accepted','AMAN GUPTA','2024-10-23 03:22:34');
/*!40000 ALTER TABLE `invites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `project_id` int NOT NULL AUTO_INCREMENT,
  `team_id` int DEFAULT NULL,
  `project_details` varchar(255) DEFAULT NULL,
  `semester` int DEFAULT NULL,
  `profid` int DEFAULT NULL,
  PRIMARY KEY (`project_id`),
  KEY `profid` (`profid`),
  KEY `project_ibfk_1` (`team_id`),
  CONSTRAINT `project_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`),
  CONSTRAINT `project_ibfk_2` FOREIGN KEY (`profid`) REFERENCES `faculty` (`profid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (2,6,'Project Title',5,101),(3,7,'Project Title',5,101),(4,7,'Project Title',5,101);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `sapid` int NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `semester` int DEFAULT NULL,
  `program` varchar(50) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`sapid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (12345,'Bhavesh',5,'Computer Science DevOps','pass123'),(123456,'John Doe',5,'Computer Science','pass123'),(500060059,'AAISHIKA RANA',5,'Devops','R110217001'),(500060070,'ABHINAV RAWAT',5,'Devops','R110217006'),(500060202,'ABHINAV RANA',5,'Devops','R110217005'),(500060209,'ANIRUDH LATHER',5,'Devops','R110217021'),(500060249,'ARUNESH AGARWAL',5,'Devops','R110217033'),(500060832,'ANMOLDEEP SINGH',5,'Devops','R110217024'),(500060848,'ARPIT AGARWAL',5,'Devops','R110217032'),(500060997,'ANSHIKA GOYAL',5,'Devops','R110217026'),(500061018,'AKSHAT SINGHAL',5,'Devops','R110217012'),(500061031,'ANUSHKA MUKHERJEE',5,'Devops','R110217030'),(500061047,'AARYASH SINHA',5,'Devops','R110217002'),(500061071,'ABHISHEK SHARMA',5,'Devops','R110217008'),(500061112,'AMEY POWNIKAR',5,'Devops','R110217015'),(500061120,'ANSH AGRAWAL',5,'Devops','R110217025'),(500061127,'ANUSHKA MATHUR',5,'Devops','R110217029'),(500061151,'ANSHUMAN ACHARYA',5,'Devops','R110217027'),(500061157,'ANAND RAJ',5,'Devops','R110217017'),(500061281,'AAYUSH GUPTA',5,'Devops','R110217003'),(500061329,'ANIKET MAINI',5,'Devops','R110217020'),(500061342,'AKANSH NIRMAL',5,'Devops','R110217011'),(500061391,'ANKIT SAINI',5,'Devops','R110217022'),(500061460,'ABHAY RAJ SINGH RATHORE',5,'Devops','R110217004'),(500061623,'APOORV GUPTA',5,'Devops','R110217031'),(500061667,'AKUL JINDAL',5,'Devops','R110217013'),(500061736,'ANKUR SAINI',5,'Devops','R110217023'),(500061772,'AMAN GUPTA',5,'Devops','R110217014'),(500063008,'ANUKRUTI MATHUR',5,'Devops','R110217028');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `team_id` int NOT NULL AUTO_INCREMENT,
  `team_name` varchar(50) DEFAULT NULL,
  `sapid1` int DEFAULT NULL,
  `sapid2` int DEFAULT NULL,
  `sapid3` int DEFAULT NULL,
  `sapid4` int DEFAULT NULL,
  PRIMARY KEY (`team_id`),
  KEY `sapid1` (`sapid1`),
  KEY `sapid2` (`sapid2`),
  KEY `sapid3` (`sapid3`),
  KEY `sapid4` (`sapid4`),
  CONSTRAINT `team_ibfk_1` FOREIGN KEY (`sapid1`) REFERENCES `student` (`sapid`),
  CONSTRAINT `team_ibfk_2` FOREIGN KEY (`sapid2`) REFERENCES `student` (`sapid`),
  CONSTRAINT `team_ibfk_3` FOREIGN KEY (`sapid3`) REFERENCES `student` (`sapid`),
  CONSTRAINT `team_ibfk_4` FOREIGN KEY (`sapid4`) REFERENCES `student` (`sapid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (6,NULL,12345,123456,NULL,NULL),(7,'Team 0',500063008,500061772,500061736,NULL);
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_team` BEFORE INSERT ON `team` FOR EACH ROW BEGIN
    
    SET NEW.team_name = CONCAT('Team ', NEW.team_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-23  8:53:48
