-- MySQL dump 10.13  Distrib 5.5.40, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: setter
-- ------------------------------------------------------
-- Server version	5.5.40-0ubuntu0.14.04.1

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `type_id` int(11) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_index` (`email`,`type_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `accounts_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'cseibert113@gmail.com','$2a$10$S8viQ38.Ukwqn7C.hEgZdedDozA0Y2vXefChMJvC1CieVrUt8xhUC',1,'xzTeZ8ZKbwTdfnLfvgeY'),(2,'routesetting@aiguille.com','$2a$10$yB2BtsqvdGcdTZYA3Odx2.cCmRYz2HM.6tBaQETvVCEeYbzOnhoDW',2,'zlzQvSBsyElkXA0k2lzz'),(3,'mark@gmail.com','$2a$10$MPwKc0VMSTMTkcFAAacqhuwg1q.0xnK7Bb1ZT1JxDnIna0Ki80j32',1,'8J9tLdqM8NMFB3xmI82p'),(4,'hi.guillermocasanova@gmail.com','$2a$10$wKCFVrzX9Xfrt46M7vtXeumrPbJv3ij28KBdHzbTHwIt9NUttqn/y',1,'SlEZIeLNB2KcgIhcBKYS'),(5,'hi.guillermlcasanova@gmail.com','$2a$10$XoilvE2OWBcb9jWCpY36PuJ5iW9bI5rGtMd1OwfSj3juEy8VqmytK',1,'UeZe9fy0po7LL5ihsxDk'),(6,'e_jimenez1012@hotmail.com','$2a$10$lNK78hDmS6OwutpMtonLLuC6FaiZ9lukakIX8S62f4AKunZIURM4q',1,'FugCeUFes2RUweT4MWmy'),(7,'davisjstew@yahoo.com','$2a$10$owG3JqbYaEAOy3ASEZ1eIuqS4sxoGzMcNKqeqppjwABKEOjvdH18S',1,'KAm0LcWykSpNHwr8EFt9'),(8,'jmwm88@yahoo.com','$2a$10$JKiLIlhtJaHJLAdoz0Ire.BoI32Cc9xk8ddHHLoUX4teukN1/7qSy',1,'uIXC6aXefMno9iwm8Cq4'),(9,'blake.the.climber@gmail.com','$2a$10$mYnRn6Q8HeimC.WjnqkJweQ0DRrKRRm8eaHAxWASvEkz0E25uvwku',1,'Z1oU2Ulvc2NNPbRgUVA2'),(10,'Moo5152@GMail.com','$2a$10$fbQ/GLdLyjzId4cKNW2pouz/1im8aqIvU4MYZJ0fOD8CXHjzO0tkm',1,'qOi4hk1rklkAnDYPOprZ');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_types`
--

DROP TABLE IF EXISTS `accounts_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_types`
--

LOCK TABLES `accounts_types` WRITE;
/*!40000 ALTER TABLE `accounts_types` DISABLE KEYS */;
INSERT INTO `accounts_types` VALUES (1,'user'),(2,'gym');
/*!40000 ALTER TABLE `accounts_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boulder_grades`
--

DROP TABLE IF EXISTS `boulder_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boulder_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boulder_grades`
--

LOCK TABLES `boulder_grades` WRITE;
/*!40000 ALTER TABLE `boulder_grades` DISABLE KEYS */;
INSERT INTO `boulder_grades` VALUES (1,'V0',0),(2,'V1',1),(3,'V2',2),(4,'V3',3),(5,'V4',4),(6,'V5',5),(7,'V6',6),(8,'V7',7),(9,'V8',8),(10,'V9',9),(11,'V10',10),(12,'V11',11),(13,'V12',12),(14,'V13',13);
/*!40000 ALTER TABLE `boulder_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colors`
--

DROP TABLE IF EXISTS `colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colors`
--

LOCK TABLES `colors` WRITE;
/*!40000 ALTER TABLE `colors` DISABLE KEYS */;
INSERT INTO `colors` VALUES (1,'red','#FF0000'),(3,'blue','#0000FF'),(6,'cyan','#00FFFF'),(7,'green','#006400'),(8,'pink','#FF69B4'),(9,'yellow','#FFFF00'),(10,'purple','#800080'),(11,'orange','#FFA500'),(12,'lime green','#00FF00'),(13,'black','#000000'),(14,'brown','#5C3317'),(15,'white','#D8D8BF'),(16,'tan','#D19275');
/*!40000 ALTER TABLE `colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `route_id` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `route_id` (`route_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`route_id`) REFERENCES `routes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gyms`
--

DROP TABLE IF EXISTS `gyms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gyms` (
  `account_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  UNIQUE KEY `account_id` (`account_id`),
  CONSTRAINT `gyms_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gyms`
--

LOCK TABLES `gyms` WRITE;
/*!40000 ALTER TABLE `gyms` DISABLE KEYS */;
INSERT INTO `gyms` VALUES (2,'Aiguille Rock Climbing Center','999 Charles Street, Longwood, FL 32750');
/*!40000 ALTER TABLE `gyms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ratings` (
  `route_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  PRIMARY KEY (`route_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`route_id`) REFERENCES `routes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
INSERT INTO `ratings` VALUES (113,5,5);
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rope_grades`
--

DROP TABLE IF EXISTS `rope_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rope_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rope_grades`
--

LOCK TABLES `rope_grades` WRITE;
/*!40000 ALTER TABLE `rope_grades` DISABLE KEYS */;
INSERT INTO `rope_grades` VALUES (1,'5.6',6),(2,'5.7',7),(3,'5.8',8),(4,'5.9',9),(5,'5.10',10),(6,'5.11',11),(7,'5.12',12),(8,'5.13',13),(9,'5.14',14),(10,'5.15',15);
/*!40000 ALTER TABLE `rope_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routes`
--

DROP TABLE IF EXISTS `routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `routes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `set_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `boulder_grade_id` int(11) DEFAULT NULL,
  `rope_grade_id` int(11) DEFAULT NULL,
  `color_id` int(11) NOT NULL,
  `setter_id` int(11) NOT NULL,
  `note` varchar(255) NOT NULL DEFAULT '',
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `set_id` (`set_id`),
  KEY `boulder_grade_id` (`boulder_grade_id`),
  KEY `rope_grade_id` (`rope_grade_id`),
  KEY `setter_id` (`setter_id`),
  KEY `color_id` (`color_id`),
  CONSTRAINT `routes_ibfk_1` FOREIGN KEY (`set_id`) REFERENCES `sets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `routes_ibfk_2` FOREIGN KEY (`boulder_grade_id`) REFERENCES `boulder_grades` (`id`) ON DELETE CASCADE,
  CONSTRAINT `routes_ibfk_3` FOREIGN KEY (`rope_grade_id`) REFERENCES `rope_grades` (`id`) ON DELETE CASCADE,
  CONSTRAINT `routes_ibfk_4` FOREIGN KEY (`setter_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `routes_ibfk_5` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routes`
--

LOCK TABLES `routes` WRITE;
/*!40000 ALTER TABLE `routes` DISABLE KEYS */;
INSERT INTO `routes` VALUES (13,6,'',NULL,5,13,3,'','2014-12-16 21:59:12'),(14,6,'',NULL,5,9,3,'','2014-12-16 21:59:32'),(15,6,'',NULL,7,10,8,'','2014-12-16 21:59:40'),(16,6,'',NULL,5,3,6,'','2014-12-16 21:59:48'),(17,6,'',NULL,7,11,6,'','2014-12-16 21:59:56'),(18,6,'',NULL,3,15,3,'','2014-12-16 22:00:02'),(19,6,'',NULL,3,3,3,'','2014-12-16 22:00:10'),(20,6,'',NULL,6,8,6,'','2014-12-16 22:00:16'),(21,6,'',NULL,6,10,3,'','2014-12-16 22:00:22'),(22,6,'',NULL,4,11,8,'','2014-12-16 22:00:29'),(23,6,'',NULL,3,13,3,'','2014-12-16 22:00:41'),(24,6,'',NULL,7,9,3,'','2014-12-16 22:00:48'),(25,6,'',NULL,4,1,3,'','2014-12-16 22:01:02'),(67,5,'',6,NULL,3,3,'','2014-12-16 22:09:27'),(68,5,'',9,NULL,7,3,'','2014-12-16 22:09:36'),(69,5,'',8,NULL,1,3,'','2014-12-16 22:09:40'),(70,5,'',3,NULL,8,3,'','2014-12-16 22:09:45'),(71,5,'',4,NULL,15,3,'','2014-12-16 22:09:52'),(72,5,'',6,NULL,16,3,'','2014-12-16 22:10:02'),(73,5,'',2,NULL,12,3,'','2014-12-16 22:10:09'),(74,5,'',5,NULL,9,3,'','2014-12-16 22:10:14'),(75,5,'',7,NULL,13,3,'','2014-12-16 22:10:19'),(76,4,'',NULL,NULL,9,3,'','2014-12-16 22:10:47'),(77,4,'',NULL,NULL,1,3,'','2014-12-16 22:10:54'),(78,4,'',NULL,NULL,15,3,'','2014-12-16 22:10:59'),(79,4,'',NULL,NULL,16,3,'','2014-12-16 22:11:02'),(80,4,'',NULL,NULL,7,3,'','2014-12-16 22:11:05'),(81,4,'',NULL,NULL,10,3,'','2014-12-16 22:11:09'),(82,4,'',NULL,NULL,11,3,'','2014-12-16 22:11:12'),(83,4,'',NULL,NULL,7,3,'','2014-12-16 22:11:16'),(84,4,'',NULL,NULL,11,3,'','2014-12-16 22:11:18'),(85,4,'',NULL,NULL,3,3,'','2014-12-16 22:11:21'),(86,4,'',NULL,NULL,13,3,'','2014-12-16 22:11:24'),(87,4,'',NULL,NULL,9,3,'','2014-12-16 22:11:27'),(88,4,'',NULL,NULL,12,3,'','2014-12-16 22:11:30'),(89,4,'',NULL,NULL,16,3,'','2014-12-16 22:11:34'),(90,3,'',7,NULL,1,3,'','2014-12-16 22:11:47'),(91,3,'',7,NULL,3,3,'','2014-12-16 22:11:53'),(92,3,'',5,NULL,15,3,'','2014-12-16 22:11:57'),(93,3,'',9,NULL,1,3,'','2014-12-16 22:12:02'),(94,3,'',2,NULL,9,3,'','2014-12-16 22:12:06'),(95,3,'',4,NULL,7,3,'','2014-12-16 22:12:13'),(96,3,'',6,NULL,8,3,'','2014-12-16 22:12:17'),(97,3,'',2,NULL,13,3,'','2014-12-16 22:12:22'),(98,3,'',4,NULL,10,3,'','2014-12-16 22:12:29'),(107,1,'',3,NULL,11,3,'','2014-12-16 22:13:39'),(108,1,'',2,NULL,9,3,'','2014-12-16 22:13:44'),(109,1,'',1,NULL,8,3,'','2014-12-16 22:13:50'),(110,1,'',8,NULL,10,3,'','2014-12-16 22:13:54'),(111,1,'',5,NULL,3,3,'','2014-12-16 22:14:00'),(112,1,'',7,NULL,1,3,'','2014-12-16 22:14:06'),(113,1,'',6,NULL,12,3,'','2014-12-16 22:14:11'),(114,1,'',5,NULL,15,3,'','2014-12-16 22:14:17'),(115,1,'',4,NULL,16,3,'','2014-12-16 22:14:22'),(116,6,'',NULL,8,15,8,'','2014-12-29 15:20:06'),(117,6,'',NULL,4,7,3,'','2014-12-29 15:27:49'),(118,6,'',NULL,7,1,10,'','2014-12-29 15:33:11'),(121,13,'',NULL,1,16,3,'','2014-12-29 15:37:08'),(122,14,'',NULL,1,16,3,'','2014-12-29 15:37:24'),(123,15,'',NULL,1,16,3,'','2014-12-29 15:37:42'),(124,16,'',NULL,4,16,3,'','2014-12-29 15:37:58'),(125,16,'',NULL,1,16,3,'','2014-12-29 15:38:04'),(126,17,'',NULL,1,16,3,'','2014-12-29 15:40:25'),(127,18,'',NULL,1,16,3,'','2014-12-29 15:40:47'),(128,19,'',NULL,4,9,8,'','2014-12-29 15:41:24'),(129,19,'',NULL,5,3,3,'','2014-12-29 15:41:37'),(131,21,'',NULL,3,10,8,'','2014-12-29 15:59:22'),(132,21,'',NULL,5,13,10,'','2014-12-29 15:59:34'),(133,21,'',NULL,6,9,6,'','2014-12-29 16:00:21'),(134,22,'',NULL,3,1,6,'','2014-12-29 16:00:49'),(135,22,'',NULL,5,7,8,'','2014-12-29 16:00:57'),(136,23,'',NULL,2,13,3,'','2014-12-29 16:04:06'),(137,23,'',NULL,5,6,8,'','2014-12-29 16:04:23'),(138,23,'',NULL,6,1,3,'','2014-12-29 16:04:33'),(139,24,'',NULL,2,9,3,'','2014-12-29 16:05:04'),(140,24,'',NULL,3,10,3,'','2014-12-29 16:05:12'),(141,25,'',NULL,3,1,3,'','2014-12-29 16:05:46'),(142,25,'',NULL,4,6,6,'','2014-12-29 16:06:08'),(143,26,'',NULL,2,12,3,'','2014-12-29 16:06:29'),(144,27,'',NULL,2,1,3,'','2014-12-29 16:07:23'),(145,27,'',NULL,5,3,6,'','2014-12-29 16:07:30'),(146,30,'',NULL,4,10,8,'','2014-12-29 16:08:28'),(147,30,'',NULL,6,7,3,'','2014-12-29 16:08:42'),(148,31,'',NULL,4,6,8,'','2014-12-29 16:09:10'),(149,31,'',NULL,7,9,6,'','2014-12-29 16:09:19'),(150,32,'',NULL,4,11,3,'','2014-12-29 16:11:11'),(151,32,'',NULL,5,12,3,'','2014-12-29 16:11:19'),(152,32,'',NULL,6,10,6,'','2014-12-29 16:11:28'),(153,33,'',NULL,1,16,3,'','2014-12-29 16:11:51'),(154,34,'',NULL,4,6,9,'','2014-12-29 16:12:20'),(155,34,'',NULL,6,9,10,'','2014-12-29 16:12:33'),(156,35,'',NULL,4,9,6,'','2014-12-29 16:14:21'),(157,35,'',NULL,4,1,3,'','2014-12-29 16:14:27'),(158,35,'',NULL,5,13,10,'','2014-12-29 16:14:35'),(159,36,'',NULL,3,7,3,'','2014-12-29 16:14:55'),(160,37,'',NULL,4,11,8,'','2014-12-29 16:15:33'),(161,37,'',NULL,5,10,3,'','2014-12-29 16:15:48'),(162,38,'',NULL,1,6,3,'','2014-12-29 16:16:24'),(163,38,'',NULL,4,15,6,'','2014-12-29 16:16:33'),(164,38,'',NULL,5,1,3,'','2014-12-29 16:16:40'),(165,39,'',NULL,4,11,3,'','2014-12-29 16:17:18'),(166,39,'',NULL,5,7,10,'','2014-12-29 16:17:30'),(167,40,'',NULL,4,9,6,'','2014-12-29 16:17:54'),(168,40,'',NULL,6,3,3,'','2014-12-29 16:18:00'),(169,41,'',NULL,2,16,3,'','2014-12-29 16:18:18'),(170,42,'',6,NULL,9,3,'','2014-12-29 19:56:00'),(171,42,'',6,NULL,8,8,'','2014-12-29 19:56:20'),(172,42,'',5,NULL,7,3,'','2014-12-29 19:57:34'),(173,42,'',5,NULL,15,3,'','2014-12-29 19:57:54'),(174,42,'',4,NULL,10,8,'','2014-12-29 19:59:38'),(175,42,'',NULL,NULL,13,8,'','2014-12-29 19:59:53'),(176,42,'',3,NULL,3,8,'','2014-12-29 20:00:51'),(177,42,'',1,NULL,1,3,'','2014-12-29 20:01:08'),(178,42,'',NULL,NULL,11,8,'','2014-12-29 20:01:29'),(179,43,'',NULL,3,12,3,'','2014-12-30 12:57:49'),(180,43,'',NULL,5,1,3,'','2014-12-30 12:58:50');
/*!40000 ALTER TABLE `routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sends`
--

DROP TABLE IF EXISTS `sends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sends` (
  `user_id` int(11) NOT NULL,
  `route_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`user_id`,`route_id`),
  KEY `route_id` (`route_id`),
  CONSTRAINT `sends_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sends_ibfk_2` FOREIGN KEY (`route_id`) REFERENCES `routes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sends`
--

LOCK TABLES `sends` WRITE;
/*!40000 ALTER TABLE `sends` DISABLE KEYS */;
INSERT INTO `sends` VALUES (5,107,'2014-12-19 02:19:24'),(5,108,'2014-12-19 02:19:37'),(5,111,'2014-12-19 02:19:42'),(5,113,'2014-12-19 02:19:52'),(5,114,'2014-12-19 02:20:04');
/*!40000 ALTER TABLE `sends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sets`
--

DROP TABLE IF EXISTS `sets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wall_id` int(11) NOT NULL,
  `image_id` int(11) DEFAULT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wall_id` (`wall_id`),
  KEY `image_id` (`image_id`),
  CONSTRAINT `sets_ibfk_1` FOREIGN KEY (`wall_id`) REFERENCES `walls` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sets_ibfk_2` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sets`
--

LOCK TABLES `sets` WRITE;
/*!40000 ALTER TABLE `sets` DISABLE KEYS */;
INSERT INTO `sets` VALUES (1,1,NULL,'2014-12-15 17:58:45'),(3,3,NULL,'2014-12-15 21:14:45'),(4,4,NULL,'2014-12-15 21:14:57'),(5,5,NULL,'2014-12-15 21:15:04'),(6,11,NULL,'2014-12-16 21:47:54'),(13,12,NULL,'2014-12-29 15:36:55'),(14,13,NULL,'2014-12-29 15:37:17'),(15,14,NULL,'2014-12-29 15:37:34'),(16,15,NULL,'2014-12-29 15:37:52'),(17,16,NULL,'2014-12-29 15:38:13'),(18,17,NULL,'2014-12-29 15:40:36'),(19,18,NULL,'2014-12-29 15:40:56'),(21,20,NULL,'2014-12-29 15:57:41'),(22,21,NULL,'2014-12-29 16:00:28'),(23,22,NULL,'2014-12-29 16:03:52'),(24,24,NULL,'2014-12-29 16:04:51'),(25,25,NULL,'2014-12-29 16:05:37'),(26,26,NULL,'2014-12-29 16:06:18'),(27,27,NULL,'2014-12-29 16:07:02'),(30,29,NULL,'2014-12-29 16:08:01'),(31,30,NULL,'2014-12-29 16:08:55'),(32,31,NULL,'2014-12-29 16:10:44'),(33,32,NULL,'2014-12-29 16:11:44'),(34,33,NULL,'2014-12-29 16:12:07'),(35,34,NULL,'2014-12-29 16:13:30'),(36,35,NULL,'2014-12-29 16:14:50'),(37,36,NULL,'2014-12-29 16:15:08'),(38,37,NULL,'2014-12-29 16:16:06'),(39,38,NULL,'2014-12-29 16:17:00'),(40,39,NULL,'2014-12-29 16:17:40'),(41,40,NULL,'2014-12-29 16:18:08'),(42,2,NULL,'2014-12-29 19:55:30'),(43,19,NULL,'2014-12-30 12:57:25');
/*!40000 ALTER TABLE `sets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setters_gyms_access`
--

DROP TABLE IF EXISTS `setters_gyms_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setters_gyms_access` (
  `setter_id` int(11) NOT NULL,
  `gym_id` int(11) NOT NULL,
  PRIMARY KEY (`setter_id`,`gym_id`),
  KEY `gym_id` (`gym_id`),
  CONSTRAINT `setters_gyms_access_ibfk_1` FOREIGN KEY (`setter_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `setters_gyms_access_ibfk_2` FOREIGN KEY (`gym_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setters_gyms_access`
--

LOCK TABLES `setters_gyms_access` WRITE;
/*!40000 ALTER TABLE `setters_gyms_access` DISABLE KEYS */;
INSERT INTO `setters_gyms_access` VALUES (3,2),(6,2),(7,2),(8,2),(9,2),(10,2);
/*!40000 ALTER TABLE `setters_gyms_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suggestions`
--

DROP TABLE IF EXISTS `suggestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suggestions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `suggestion` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`),
  CONSTRAINT `suggestions_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suggestions`
--

LOCK TABLES `suggestions` WRITE;
/*!40000 ALTER TABLE `suggestions` DISABLE KEYS */;
INSERT INTO `suggestions` VALUES (1,1,'nothing');
/*!40000 ALTER TABLE `suggestions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suggestions_upvotes`
--

DROP TABLE IF EXISTS `suggestions_upvotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suggestions_upvotes` (
  `suggestion_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  PRIMARY KEY (`suggestion_id`,`account_id`),
  KEY `account_id` (`account_id`),
  CONSTRAINT `suggestions_upvotes_ibfk_1` FOREIGN KEY (`suggestion_id`) REFERENCES `suggestions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `suggestions_upvotes_ibfk_2` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suggestions_upvotes`
--

LOCK TABLES `suggestions_upvotes` WRITE;
/*!40000 ALTER TABLE `suggestions_upvotes` DISABLE KEYS */;
INSERT INTO `suggestions_upvotes` VALUES (1,1),(1,6);
/*!40000 ALTER TABLE `suggestions_upvotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `account_id` int(11) NOT NULL,
  `gym_id` int(11) DEFAULT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  UNIQUE KEY `account_id` (`account_id`),
  KEY `gym_id` (`gym_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`gym_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,2,'Cody','Seibert'),(3,NULL,'Mark','Mercer'),(4,NULL,'Guillermo','Martinez'),(5,2,'Guillerml','Martinez'),(6,2,'Joshua','Jimenez'),(7,NULL,'Davi S','Stewart'),(8,NULL,'Jonmikel','Macnichols'),(9,NULL,'Blake','Compton'),(10,2,'Chris','Freiberg');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `walls`
--

DROP TABLE IF EXISTS `walls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `walls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `gym_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gym_id` (`gym_id`),
  CONSTRAINT `walls_ibfk_1` FOREIGN KEY (`gym_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `walls`
--

LOCK TABLES `walls` WRITE;
/*!40000 ALTER TABLE `walls` DISABLE KEYS */;
INSERT INTO `walls` VALUES (1,'Wave',2),(2,'Diamond',2),(3,'Right Gray',2),(4,'Boulder Cave',2),(5,'Lead Cave',2),(11,'Lead',2),(12,'1',2),(13,'2',2),(14,'3',2),(15,'4',2),(16,'5',2),(17,'6',2),(18,'7',2),(19,'8',2),(20,'9',2),(21,'10',2),(22,'11',2),(24,'12',2),(25,'13',2),(26,'14',2),(27,'15',2),(29,'16',2),(30,'17',2),(31,'18',2),(32,'19',2),(33,'20',2),(34,'21',2),(35,'22',2),(36,'23',2),(37,'24',2),(38,'25',2),(39,'26',2),(40,'27',2);
/*!40000 ALTER TABLE `walls` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-12-30 15:22:52
