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
-- Table structure for table `activity_cor`
--

DROP TABLE IF EXISTS `activity_cor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_cor` (
  `profid` int NOT NULL,
  `program` varchar(20) DEFAULT NULL,
  `act_cor_id` int DEFAULT NULL,
  PRIMARY KEY (`profid`),
  UNIQUE KEY `act_cor_id` (`act_cor_id`),
  CONSTRAINT `activity_cor_ibfk_1` FOREIGN KEY (`profid`) REFERENCES `faculty` (`profid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_cor`
--

LOCK TABLES `activity_cor` WRITE;
/*!40000 ALTER TABLE `activity_cor` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_cor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faculty` (
  `profid` int NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `mentor` tinyint(1) DEFAULT '0',
  `actCor` tinyint(1) DEFAULT '0',
  `panel` tinyint(1) DEFAULT '0',
  `program` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`profid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES (101,'Dr. Smith',1,0,0,'Devops','pass'),(102,'Dr. Jones',1,1,1,'BTech DevOps','pass'),(103,'Dr. Allen',0,0,0,'BTech AI','pass'),(104,'Dr. Clark',1,0,0,'BTech DS','pass'),(105,'Dr. Brown',0,1,0,'BTech IT','pass');
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
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invites`
--

LOCK TABLES `invites` WRITE;
/*!40000 ALTER TABLE `invites` DISABLE KEYS */;
INSERT INTO `invites` VALUES (27,123456,'John Doe',5,'Computer Science','Accepted','Bhavesh','2024-10-22 18:36:38'),(28,123456,'John Doe',5,'Computer Science','Accepted','Bhavesh','2024-10-22 18:43:21'),(29,123456,'John Doe',5,'Computer Science','Accepted','Bhavesh','2024-10-22 18:47:24'),(30,123456,'John Doe',5,'Computer Science','Accepted','Bhavesh','2024-10-22 19:04:22'),(31,12345,'Bhavesh',5,'Computer Science DevOps','Accepted','John Doe','2024-10-22 19:08:25'),(32,123456,'John Doe',5,'Computer Science','Accepted','Bhavesh','2024-10-23 02:22:43'),(33,123456,'John Doe',5,'Computer Science','Accepted','Bhavesh','2024-10-23 02:32:24'),(34,500061772,'AMAN GUPTA',5,'Devops','Accepted','ANUKRUTI MATHUR','2024-10-23 03:18:19'),(35,500061736,'ANKUR SAINI',5,'Devops','Accepted','AMAN GUPTA','2024-10-23 03:22:34'),(36,500061112,'AMEY POWNIKAR',5,'Devops','pending','Bhavesh','2024-10-23 04:09:10'),(37,500061151,'ANSHUMAN ACHARYA',5,'Devops','Accepted','ABHISHEK SHARMA','2024-10-23 05:41:28'),(38,500063008,'ANUKRUTI MATHUR',5,'Devops','Accepted','Bhavesh Kapur','2024-11-05 14:28:00'),(39,500061772,'AMAN GUPTA',5,'Devops','Accepted','Bhavesh Kapur','2024-11-11 10:19:24'),(40,500063008,'ANUKRUTI MATHUR',5,'Devops','Accepted','Bhavesh Kapur','2024-11-13 02:26:45'),(41,500061772,'AMAN GUPTA',5,'Devops','Accepted','Bhavesh Kapur','2024-11-13 02:26:52'),(42,500061736,'ANKUR SAINI',5,'Devops','Accepted','Bhavesh Kapur','2024-11-13 02:26:58'),(43,500063008,'ANUKRUTI MATHUR',5,'Devops','Accepted','Bhavesh Kapur','2024-11-17 13:39:41'),(44,500061772,'AMAN GUPTA',5,'Devops','Accepted','Bhavesh Kapur','2024-11-17 13:39:49'),(45,500061736,'ANKUR SAINI',5,'Devops','Accepted','Bhavesh Kapur','2024-11-17 13:39:54'),(46,500061667,'AKUL JINDAL',5,'Devops','Accepted','Bhavesh Kapur','2024-11-17 13:40:01'),(47,500105635,'Bhavesh Kapur',5,'Devops','Accepted','ANUSHKA MATHUR','2024-11-17 13:52:40');
/*!40000 ALTER TABLE `invites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mentor_invite`
--

DROP TABLE IF EXISTS `mentor_invite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mentor_invite` (
  `inviteid` int NOT NULL AUTO_INCREMENT,
  `team_id` int NOT NULL,
  `profid` int NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`inviteid`),
  KEY `team_id` (`team_id`),
  KEY `profid` (`profid`),
  CONSTRAINT `mentor_invite_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`),
  CONSTRAINT `mentor_invite_ibfk_2` FOREIGN KEY (`profid`) REFERENCES `faculty` (`profid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mentor_invite`
--

LOCK TABLES `mentor_invite` WRITE;
/*!40000 ALTER TABLE `mentor_invite` DISABLE KEYS */;
INSERT INTO `mentor_invite` VALUES (1,12,102,'accept');
/*!40000 ALTER TABLE `mentor_invite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mentor_marks`
--

DROP TABLE IF EXISTS `mentor_marks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mentor_marks` (
  `markid` int NOT NULL AUTO_INCREMENT,
  `profid` int DEFAULT NULL,
  `team_id` int DEFAULT NULL,
  `synopsis_marks` int DEFAULT NULL,
  `mid_marks` int DEFAULT NULL,
  `end_marks` int DEFAULT NULL,
  PRIMARY KEY (`markid`),
  KEY `profid` (`profid`),
  KEY `team_id` (`team_id`),
  CONSTRAINT `mentor_marks_ibfk_1` FOREIGN KEY (`profid`) REFERENCES `faculty` (`profid`),
  CONSTRAINT `mentor_marks_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mentor_marks`
--

LOCK TABLES `mentor_marks` WRITE;
/*!40000 ALTER TABLE `mentor_marks` DISABLE KEYS */;
INSERT INTO `mentor_marks` VALUES (6,101,11,20,20,20);
/*!40000 ALTER TABLE `mentor_marks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mentor_proj`
--

DROP TABLE IF EXISTS `mentor_proj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mentor_proj` (
  `srno` int NOT NULL AUTO_INCREMENT,
  `profid` int DEFAULT NULL,
  `projectid1` int DEFAULT NULL,
  `projectid2` int DEFAULT NULL,
  `projectid3` int DEFAULT NULL,
  `projectid4` int DEFAULT NULL,
  PRIMARY KEY (`srno`),
  KEY `profid` (`profid`),
  KEY `projectid1` (`projectid1`),
  KEY `projectid2` (`projectid2`),
  KEY `projectid3` (`projectid3`),
  KEY `projectid4` (`projectid4`),
  CONSTRAINT `mentor_proj_ibfk_1` FOREIGN KEY (`profid`) REFERENCES `faculty` (`profid`),
  CONSTRAINT `mentor_proj_ibfk_2` FOREIGN KEY (`projectid1`) REFERENCES `project` (`project_id`),
  CONSTRAINT `mentor_proj_ibfk_3` FOREIGN KEY (`projectid2`) REFERENCES `project` (`project_id`),
  CONSTRAINT `mentor_proj_ibfk_4` FOREIGN KEY (`projectid3`) REFERENCES `project` (`project_id`),
  CONSTRAINT `mentor_proj_ibfk_5` FOREIGN KEY (`projectid4`) REFERENCES `project` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mentor_proj`
--

LOCK TABLES `mentor_proj` WRITE;
/*!40000 ALTER TABLE `mentor_proj` DISABLE KEYS */;
INSERT INTO `mentor_proj` VALUES (1,102,11,NULL,NULL,NULL);
/*!40000 ALTER TABLE `mentor_proj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mentor_req`
--

DROP TABLE IF EXISTS `mentor_req`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mentor_req` (
  `reqid` int NOT NULL,
  `profid` int DEFAULT NULL,
  `team_id` int DEFAULT NULL,
  `status` enum('pending','accepted','rejected') DEFAULT NULL,
  PRIMARY KEY (`reqid`),
  KEY `profid` (`profid`),
  KEY `team_id` (`team_id`),
  CONSTRAINT `mentor_req_ibfk_1` FOREIGN KEY (`profid`) REFERENCES `faculty` (`profid`),
  CONSTRAINT `mentor_req_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mentor_req`
--

LOCK TABLES `mentor_req` WRITE;
/*!40000 ALTER TABLE `mentor_req` DISABLE KEYS */;
/*!40000 ALTER TABLE `mentor_req` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `panel_invites`
--

DROP TABLE IF EXISTS `panel_invites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `panel_invites` (
  `invite_id` int NOT NULL AUTO_INCREMENT,
  `profid` int NOT NULL,
  `sent_by` int NOT NULL,
  `status` varchar(20) DEFAULT 'pending',
  PRIMARY KEY (`invite_id`),
  KEY `profid` (`profid`),
  CONSTRAINT `panel_invites_ibfk_1` FOREIGN KEY (`profid`) REFERENCES `faculty` (`profid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `panel_invites`
--

LOCK TABLES `panel_invites` WRITE;
/*!40000 ALTER TABLE `panel_invites` DISABLE KEYS */;
INSERT INTO `panel_invites` VALUES (1,102,101,'accept'),(2,102,103,'pending'),(3,105,101,'pending'),(4,104,101,'pending');
/*!40000 ALTER TABLE `panel_invites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `panel_marks`
--

DROP TABLE IF EXISTS `panel_marks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `panel_marks` (
  `markid` int NOT NULL AUTO_INCREMENT,
  `profid` int DEFAULT NULL,
  `team_id` int DEFAULT NULL,
  `synopsis_marks` int DEFAULT NULL,
  `mid_marks` int DEFAULT NULL,
  `end_marks` int DEFAULT NULL,
  PRIMARY KEY (`markid`),
  KEY `profid` (`profid`),
  KEY `team_id` (`team_id`),
  CONSTRAINT `panel_marks_ibfk_1` FOREIGN KEY (`profid`) REFERENCES `faculty` (`profid`),
  CONSTRAINT `panel_marks_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `panel_marks`
--

LOCK TABLES `panel_marks` WRITE;
/*!40000 ALTER TABLE `panel_marks` DISABLE KEYS */;
/*!40000 ALTER TABLE `panel_marks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `panel_proj`
--

DROP TABLE IF EXISTS `panel_proj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `panel_proj` (
  `srno` int NOT NULL AUTO_INCREMENT,
  `profid` int DEFAULT NULL,
  `projectid1` int DEFAULT NULL,
  `projectid2` int DEFAULT NULL,
  `projectid3` int DEFAULT NULL,
  `projectid4` int DEFAULT NULL,
  `profid_2` int DEFAULT NULL,
  PRIMARY KEY (`srno`),
  KEY `profid` (`profid`),
  KEY `projectid1` (`projectid1`),
  KEY `projectid2` (`projectid2`),
  KEY `projectid3` (`projectid3`),
  KEY `projectid4` (`projectid4`),
  KEY `fk_profid_2` (`profid_2`),
  CONSTRAINT `fk_profid_2` FOREIGN KEY (`profid_2`) REFERENCES `faculty` (`profid`),
  CONSTRAINT `panel_proj_ibfk_1` FOREIGN KEY (`profid`) REFERENCES `faculty` (`profid`),
  CONSTRAINT `panel_proj_ibfk_2` FOREIGN KEY (`projectid1`) REFERENCES `project` (`project_id`),
  CONSTRAINT `panel_proj_ibfk_3` FOREIGN KEY (`projectid2`) REFERENCES `project` (`project_id`),
  CONSTRAINT `panel_proj_ibfk_4` FOREIGN KEY (`projectid3`) REFERENCES `project` (`project_id`),
  CONSTRAINT `panel_proj_ibfk_5` FOREIGN KEY (`projectid4`) REFERENCES `project` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `panel_proj`
--

LOCK TABLES `panel_proj` WRITE;
/*!40000 ALTER TABLE `panel_proj` DISABLE KEYS */;
/*!40000 ALTER TABLE `panel_proj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `panel_req`
--

DROP TABLE IF EXISTS `panel_req`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `panel_req` (
  `reqid` int NOT NULL AUTO_INCREMENT,
  `profid` int DEFAULT NULL,
  `act_cor_id` int DEFAULT NULL,
  `status` enum('pending','accepted','rejected') DEFAULT NULL,
  PRIMARY KEY (`reqid`),
  KEY `profid` (`profid`),
  KEY `act_cor_id` (`act_cor_id`),
  CONSTRAINT `panel_req_ibfk_1` FOREIGN KEY (`profid`) REFERENCES `faculty` (`profid`),
  CONSTRAINT `panel_req_ibfk_2` FOREIGN KEY (`act_cor_id`) REFERENCES `activity_cor` (`act_cor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `panel_req`
--

LOCK TABLES `panel_req` WRITE;
/*!40000 ALTER TABLE `panel_req` DISABLE KEYS */;
/*!40000 ALTER TABLE `panel_req` ENABLE KEYS */;
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
  KEY `project_ibfk_1` (`team_id`),
  KEY `profid` (`profid`),
  CONSTRAINT `project_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`),
  CONSTRAINT `project_ibfk_2` FOREIGN KEY (`profid`) REFERENCES `faculty` (`profid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (10,11,'Project Title',5,101),(11,12,'Project Title',5,101);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_messages`
--

DROP TABLE IF EXISTS `project_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_messages` (
  `message_id` int NOT NULL AUTO_INCREMENT,
  `prof_id` int DEFAULT NULL,
  `project_id` int DEFAULT NULL,
  `message` text,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_messages`
--

LOCK TABLES `project_messages` WRITE;
/*!40000 ALTER TABLE `project_messages` DISABLE KEYS */;
INSERT INTO `project_messages` VALUES (1,101,11,'come to my cabin','2024-11-28 19:48:48'),(2,101,11,'testing','2024-11-29 04:51:24'),(3,101,11,'done','2024-11-29 05:58:53');
/*!40000 ALTER TABLE `project_messages` ENABLE KEYS */;
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
INSERT INTO `student` VALUES (12345,'Bhavesh',5,'Computer Science DevOps','pass123'),(123456,'John Doe',5,'Computer Science','pass123'),(500060059,'AAISHIKA RANA',5,'Devops','R110217001'),(500060070,'ABHINAV RAWAT',5,'Devops','R110217006'),(500060202,'ABHINAV RANA',5,'Devops','R110217005'),(500060209,'ANIRUDH LATHER',5,'Devops','R110217021'),(500060249,'ARUNESH AGARWAL',5,'Devops','R110217033'),(500060832,'ANMOLDEEP SINGH',5,'Devops','R110217024'),(500060848,'ARPIT AGARWAL',5,'Devops','R110217032'),(500060997,'ANSHIKA GOYAL',5,'Devops','R110217026'),(500061018,'AKSHAT SINGHAL',5,'Devops','R110217012'),(500061031,'ANUSHKA MUKHERJEE',5,'Devops','R110217030'),(500061047,'AARYASH SINHA',5,'Devops','R110217002'),(500061071,'ABHISHEK SHARMA',5,'Devops','R110217008'),(500061112,'AMEY POWNIKAR',5,'Devops','R110217015'),(500061120,'ANSH AGRAWAL',5,'Devops','R110217025'),(500061127,'ANUSHKA MATHUR',5,'Devops','R110217029'),(500061151,'ANSHUMAN ACHARYA',5,'Devops','R110217027'),(500061157,'ANAND RAJ',5,'Devops','R110217017'),(500061281,'AAYUSH GUPTA',5,'Devops','R110217003'),(500061329,'ANIKET MAINI',5,'Devops','R110217020'),(500061342,'AKANSH NIRMAL',5,'Devops','R110217011'),(500061391,'ANKIT SAINI',5,'Devops','R110217022'),(500061460,'ABHAY RAJ SINGH RATHORE',5,'Devops','R110217004'),(500061623,'APOORV GUPTA',5,'Devops','R110217031'),(500061667,'AKUL JINDAL',5,'Devops','R110217013'),(500061736,'ANKUR SAINI',5,'Devops','R110217023'),(500061772,'AMAN GUPTA',5,'Devops','R110217014'),(500063008,'ANUKRUTI MATHUR',5,'Devops','R110217028'),(500105635,'Bhavesh Kapur',5,'Devops','R214pass');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_documents`
--

DROP TABLE IF EXISTS `student_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_documents` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `file_type` varchar(20) NOT NULL,
  `file_content` longblob NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_documents`
--

LOCK TABLES `student_documents` WRITE;
/*!40000 ALTER TABLE `student_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_documents` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (11,'Team 0',500105635,500063008,500061772,500061736),(12,'Team 0',500061127,500105635,NULL,NULL);
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

-- Dump completed on 2024-11-29 11:38:28
