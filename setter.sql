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
  `image_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_index` (`email`,`type_id`),
  KEY `type_id` (`type_id`),
  KEY `image_id` (`image_id`),
  CONSTRAINT `accounts_ibfk_2` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`) ON DELETE CASCADE,
  CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `accounts_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'cseibert113@gmail.com','$2a$10$S8viQ38.Ukwqn7C.hEgZdedDozA0Y2vXefChMJvC1CieVrUt8xhUC',1,'xzTeZ8ZKbwTdfnLfvgeY',2),(2,'routesetting@aiguille.com','$2a$10$yB2BtsqvdGcdTZYA3Odx2.cCmRYz2HM.6tBaQETvVCEeYbzOnhoDW',2,'zlzQvSBsyElkXA0k2lzz',NULL),(3,'mark@gmail.com','$2a$10$MPwKc0VMSTMTkcFAAacqhuwg1q.0xnK7Bb1ZT1JxDnIna0Ki80j32',1,'8J9tLdqM8NMFB3xmI82p',NULL),(4,'hi.guillermocasanova@gmail.com','$2a$10$wKCFVrzX9Xfrt46M7vtXeumrPbJv3ij28KBdHzbTHwIt9NUttqn/y',1,'SlEZIeLNB2KcgIhcBKYS',NULL),(5,'hi.guillermlcasanova@gmail.com','$2a$10$XoilvE2OWBcb9jWCpY36PuJ5iW9bI5rGtMd1OwfSj3juEy8VqmytK',1,'UeZe9fy0po7LL5ihsxDk',NULL),(6,'e_jimenez1012@hotmail.com','$2a$10$lNK78hDmS6OwutpMtonLLuC6FaiZ9lukakIX8S62f4AKunZIURM4q',1,'FugCeUFes2RUweT4MWmy',NULL),(7,'davisjstew@yahoo.com','$2a$10$owG3JqbYaEAOy3ASEZ1eIuqS4sxoGzMcNKqeqppjwABKEOjvdH18S',1,'KAm0LcWykSpNHwr8EFt9',NULL),(8,'jmwm88@yahoo.com','$2a$10$JKiLIlhtJaHJLAdoz0Ire.BoI32Cc9xk8ddHHLoUX4teukN1/7qSy',1,'uIXC6aXefMno9iwm8Cq4',NULL),(9,'blake.the.climber@gmail.com','$2a$10$mYnRn6Q8HeimC.WjnqkJweQ0DRrKRRm8eaHAxWASvEkz0E25uvwku',1,'Z1oU2Ulvc2NNPbRgUVA2',NULL),(10,'Moo5152@GMail.com','$2a$10$fbQ/GLdLyjzId4cKNW2pouz/1im8aqIvU4MYZJ0fOD8CXHjzO0tkm',1,'qOi4hk1rklkAnDYPOprZ',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,1,93,'This route was so cool!','2014-12-30 16:11:15'),(2,1,93,'Oheiii!!','2014-12-30 17:00:08'),(3,1,107,'I think this route would be better if the cross to the orange wasn\'t so akward.','2014-12-30 17:27:41'),(4,1,107,'This is just another test to see how the layout ends up looking like','2014-12-30 17:32:43'),(5,1,107,'Another test to see how responsive it is','2014-12-30 17:32:51'),(6,1,107,'yay ya yas yay ya yas yay ya yas yay ya yas yay ya yas yay ya yas yay ya yas yay ya yas yay ya yas','2014-12-30 17:33:11');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,'images/uploads/bc755aceaf18747af5da381c5919de20.jpg'),(2,'images/uploads/c3dbd4f30e339ffd1b6b0c517b6bc58b.jpg');
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
  `name` varchar(255) NOT NULL,
  `boulder_grade_id` int(11) DEFAULT NULL,
  `rope_grade_id` int(11) DEFAULT NULL,
  `color_id` int(11) NOT NULL,
  `setter_id` int(11) NOT NULL,
  `note` varchar(255) NOT NULL DEFAULT '',
  `date` datetime NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `wall_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `boulder_grade_id` (`boulder_grade_id`),
  KEY `rope_grade_id` (`rope_grade_id`),
  KEY `setter_id` (`setter_id`),
  KEY `color_id` (`color_id`),
  KEY `wall_id` (`wall_id`),
  CONSTRAINT `routes_ibfk_2` FOREIGN KEY (`boulder_grade_id`) REFERENCES `boulder_grades` (`id`) ON DELETE CASCADE,
  CONSTRAINT `routes_ibfk_3` FOREIGN KEY (`rope_grade_id`) REFERENCES `rope_grades` (`id`) ON DELETE CASCADE,
  CONSTRAINT `routes_ibfk_4` FOREIGN KEY (`setter_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `routes_ibfk_5` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`) ON DELETE CASCADE,
  CONSTRAINT `routes_ibfk_6` FOREIGN KEY (`wall_id`) REFERENCES `walls` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routes`
--

LOCK TABLES `routes` WRITE;
/*!40000 ALTER TABLE `routes` DISABLE KEYS */;
INSERT INTO `routes` VALUES (13,'',NULL,5,13,3,'','2014-12-16 21:59:12',1,11),(14,'',NULL,5,9,3,'','2014-12-16 21:59:32',1,11),(15,'',NULL,7,10,8,'','2014-12-16 21:59:40',1,11),(16,'',NULL,5,3,6,'','2014-12-16 21:59:48',1,11),(17,'',NULL,7,11,6,'','2014-12-16 21:59:56',1,11),(18,'',NULL,3,15,3,'','2014-12-16 22:00:02',1,11),(19,'',NULL,3,3,3,'','2014-12-16 22:00:10',1,11),(20,'',NULL,6,8,6,'','2014-12-16 22:00:16',1,11),(21,'',NULL,6,10,3,'','2014-12-16 22:00:22',1,11),(22,'',NULL,4,11,8,'','2014-12-16 22:00:29',1,11),(23,'',NULL,3,13,3,'','2014-12-16 22:00:41',1,11),(24,'',NULL,7,9,3,'','2014-12-16 22:00:48',1,11),(25,'',NULL,4,1,3,'','2014-12-16 22:01:02',1,11),(67,'',6,NULL,3,3,'','2014-12-16 22:09:27',1,5),(68,'',9,NULL,7,3,'','2014-12-16 22:09:36',1,5),(69,'',8,NULL,1,3,'','2014-12-16 22:09:40',1,5),(70,'',3,NULL,8,3,'','2014-12-16 22:09:45',1,5),(71,'',4,NULL,15,3,'','2014-12-16 22:09:52',1,5),(72,'',6,NULL,16,3,'','2014-12-16 22:10:02',1,5),(73,'',2,NULL,12,3,'','2014-12-16 22:10:09',1,5),(74,'',5,NULL,9,3,'','2014-12-16 22:10:14',1,5),(75,'',7,NULL,13,3,'','2014-12-16 22:10:19',1,5),(76,'',NULL,NULL,9,3,'','2014-12-16 22:10:47',1,4),(77,'',NULL,NULL,1,3,'','2014-12-16 22:10:54',1,4),(78,'',NULL,NULL,15,3,'','2014-12-16 22:10:59',1,4),(79,'',NULL,NULL,16,3,'','2014-12-16 22:11:02',1,4),(80,'',NULL,NULL,7,3,'','2014-12-16 22:11:05',1,4),(81,'',NULL,NULL,10,3,'','2014-12-16 22:11:09',1,4),(82,'',NULL,NULL,11,3,'','2014-12-16 22:11:12',1,4),(83,'',NULL,NULL,7,3,'','2014-12-16 22:11:16',1,4),(84,'',NULL,NULL,11,3,'','2014-12-16 22:11:18',1,4),(85,'',NULL,NULL,3,3,'','2014-12-16 22:11:21',1,4),(86,'',NULL,NULL,13,3,'','2014-12-16 22:11:24',1,4),(87,'',NULL,NULL,9,3,'','2014-12-16 22:11:27',1,4),(88,'',NULL,NULL,12,3,'','2014-12-16 22:11:30',1,4),(89,'',NULL,NULL,16,3,'','2014-12-16 22:11:34',1,4),(90,'',7,NULL,1,3,'','2014-12-16 22:11:47',1,3),(91,'',7,NULL,3,3,'','2014-12-16 22:11:53',1,3),(92,'',5,NULL,15,3,'','2014-12-16 22:11:57',1,3),(93,'',9,NULL,1,3,'','2014-12-16 22:12:02',1,3),(94,'',2,NULL,9,3,'','2014-12-16 22:12:06',1,3),(95,'',4,NULL,7,3,'','2014-12-16 22:12:13',1,3),(96,'',6,NULL,8,3,'','2014-12-16 22:12:17',1,3),(97,'',2,NULL,13,3,'','2014-12-16 22:12:22',1,3),(98,'',4,NULL,10,3,'','2014-12-16 22:12:29',1,3),(107,'',3,NULL,11,3,'','2014-12-16 22:13:39',1,1),(108,'',2,NULL,9,3,'','2014-12-16 22:13:44',1,1),(109,'',1,NULL,8,3,'','2014-12-16 22:13:50',1,1),(110,'',8,NULL,10,3,'','2014-12-16 22:13:54',1,1),(111,'',5,NULL,3,3,'','2014-12-16 22:14:00',1,1),(112,'',7,NULL,1,3,'','2014-12-16 22:14:06',1,1),(113,'',6,NULL,12,3,'','2014-12-16 22:14:11',1,1),(114,'',5,NULL,15,3,'','2014-12-16 22:14:17',1,1),(115,'',4,NULL,16,3,'','2014-12-16 22:14:22',1,1),(116,'',NULL,8,15,8,'','2014-12-29 15:20:06',1,11),(117,'',NULL,4,7,3,'','2014-12-29 15:27:49',1,11),(118,'',NULL,7,1,10,'','2014-12-29 15:33:11',1,11),(121,'',NULL,1,16,3,'','2014-12-29 15:37:08',1,12),(122,'',NULL,1,16,3,'','2014-12-29 15:37:24',1,13),(123,'',NULL,1,16,3,'','2014-12-29 15:37:42',1,14),(124,'',NULL,4,16,3,'','2014-12-29 15:37:58',1,15),(125,'',NULL,1,16,3,'','2014-12-29 15:38:04',1,15),(126,'',NULL,1,16,3,'','2014-12-29 15:40:25',1,16),(127,'',NULL,1,16,3,'','2014-12-29 15:40:47',1,17),(128,'',NULL,4,9,8,'','2014-12-29 15:41:24',1,18),(129,'',NULL,5,3,3,'','2014-12-29 15:41:37',1,18),(131,'',NULL,3,10,8,'','2014-12-29 15:59:22',1,20),(132,'',NULL,5,13,10,'','2014-12-29 15:59:34',1,20),(133,'',NULL,6,9,6,'','2014-12-29 16:00:21',1,20),(134,'',NULL,3,1,6,'','2014-12-29 16:00:49',1,21),(135,'',NULL,5,7,8,'','2014-12-29 16:00:57',1,21),(136,'',NULL,2,13,3,'','2014-12-29 16:04:06',1,22),(137,'',NULL,5,6,8,'','2014-12-29 16:04:23',1,22),(138,'',NULL,6,1,3,'','2014-12-29 16:04:33',1,22),(139,'',NULL,2,9,3,'','2014-12-29 16:05:04',1,24),(140,'',NULL,3,10,3,'','2014-12-29 16:05:12',1,24),(141,'',NULL,3,1,3,'','2014-12-29 16:05:46',1,25),(142,'',NULL,4,6,6,'','2014-12-29 16:06:08',1,25),(143,'',NULL,2,12,3,'','2014-12-29 16:06:29',1,26),(144,'',NULL,2,1,3,'','2014-12-29 16:07:23',1,27),(145,'',NULL,5,3,6,'','2014-12-29 16:07:30',1,27),(146,'',NULL,4,10,8,'','2014-12-29 16:08:28',1,29),(147,'',NULL,6,7,3,'','2014-12-29 16:08:42',1,29),(148,'',NULL,4,6,8,'','2014-12-29 16:09:10',1,30),(149,'',NULL,7,9,6,'','2014-12-29 16:09:19',1,30),(150,'',NULL,4,11,3,'','2014-12-29 16:11:11',1,31),(151,'',NULL,5,12,3,'','2014-12-29 16:11:19',1,31),(152,'',NULL,6,10,6,'','2014-12-29 16:11:28',1,31),(153,'',NULL,1,16,3,'','2014-12-29 16:11:51',1,32),(154,'',NULL,4,6,9,'','2014-12-29 16:12:20',1,33),(155,'',NULL,6,9,10,'','2014-12-29 16:12:33',1,33),(156,'',NULL,4,9,6,'','2014-12-29 16:14:21',1,34),(157,'',NULL,4,1,3,'','2014-12-29 16:14:27',1,34),(158,'',NULL,5,13,10,'','2014-12-29 16:14:35',1,34),(159,'',NULL,3,7,3,'','2014-12-29 16:14:55',1,35),(160,'',NULL,4,11,8,'','2014-12-29 16:15:33',1,36),(161,'',NULL,5,10,3,'','2014-12-29 16:15:48',1,36),(162,'',NULL,1,6,3,'','2014-12-29 16:16:24',1,37),(163,'',NULL,4,15,6,'','2014-12-29 16:16:33',1,37),(164,'',NULL,5,1,3,'','2014-12-29 16:16:40',1,37),(165,'',NULL,4,11,3,'','2014-12-29 16:17:18',1,38),(166,'',NULL,5,7,10,'','2014-12-29 16:17:30',1,38),(167,'',NULL,4,9,6,'','2014-12-29 16:17:54',1,39),(168,'',NULL,6,3,3,'','2014-12-29 16:18:00',1,39),(169,'',NULL,2,16,3,'','2014-12-29 16:18:18',1,40),(170,'',6,NULL,9,3,'','2014-12-29 19:56:00',1,2),(171,'',6,NULL,8,8,'','2014-12-29 19:56:20',1,2),(172,'',5,NULL,7,3,'','2014-12-29 19:57:34',1,2),(173,'',5,NULL,15,3,'','2014-12-29 19:57:54',1,2),(174,'',4,NULL,10,8,'','2014-12-29 19:59:38',1,2),(175,'',NULL,NULL,13,8,'','2014-12-29 19:59:53',1,2),(176,'',3,NULL,3,8,'','2014-12-29 20:00:51',1,2),(177,'',1,NULL,1,3,'','2014-12-29 20:01:08',1,2),(178,'',NULL,NULL,11,8,'','2014-12-29 20:01:29',1,2),(179,'',NULL,3,12,3,'','2014-12-30 12:57:49',1,19),(180,'',NULL,5,1,3,'','2014-12-30 12:58:50',1,19);
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
INSERT INTO `sends` VALUES (1,67,'2014-10-30 15:37:04'),(1,68,'2014-08-30 15:37:07'),(1,69,'2014-09-30 15:37:10'),(1,70,'2014-08-30 15:37:13'),(1,71,'2014-09-30 15:37:16'),(1,72,'2014-10-30 15:37:18'),(1,73,'2014-09-30 15:37:19'),(1,74,'2014-08-30 15:37:21'),(1,75,'2014-10-30 15:37:25'),(1,90,'2014-11-30 15:36:44'),(1,91,'2014-08-30 15:36:46'),(1,92,'2014-08-30 15:36:48'),(1,93,'2014-12-30 17:02:36'),(1,94,'2014-08-30 15:36:51'),(1,95,'2014-09-30 15:36:53'),(1,96,'2014-10-30 15:36:54'),(1,97,'2014-08-30 15:36:58'),(1,98,'2014-07-30 15:36:56'),(1,107,'2014-11-30 15:36:24'),(1,108,'2014-10-30 15:36:26'),(1,109,'2014-08-30 15:36:27'),(1,110,'2014-11-30 15:36:31'),(1,111,'2014-11-30 15:36:29'),(1,112,'2014-10-30 15:36:33'),(1,113,'2014-11-30 15:36:34'),(1,114,'2014-08-30 15:36:38'),(1,115,'2014-07-30 15:36:40'),(1,126,'2014-09-30 15:39:49'),(1,132,'2014-07-30 15:39:55'),(1,135,'2014-08-30 15:39:59'),(1,147,'2014-08-30 15:40:03'),(1,154,'2014-11-30 15:40:09'),(1,155,'2014-08-30 15:40:07'),(1,156,'2014-09-30 15:40:17'),(1,157,'2014-10-30 15:40:15'),(1,158,'2014-11-30 15:40:12'),(1,165,'2014-10-28 15:40:25'),(1,166,'2014-07-30 15:40:27'),(1,168,'2014-12-30 15:57:59'),(1,170,'2014-11-30 15:35:19'),(1,171,'2014-09-30 15:35:21'),(1,172,'2014-10-30 15:35:25'),(1,173,'2014-11-30 15:35:23'),(1,174,'2014-10-30 15:36:11'),(1,176,'2014-11-30 15:36:17'),(1,177,'2014-10-30 15:36:19'),(5,107,'2014-12-19 02:19:24'),(5,108,'2014-12-19 02:19:37'),(5,111,'2014-12-19 02:19:42'),(5,113,'2014-12-19 02:19:52'),(5,114,'2014-12-19 02:20:04');
/*!40000 ALTER TABLE `sends` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suggestions`
--

LOCK TABLES `suggestions` WRITE;
/*!40000 ALTER TABLE `suggestions` DISABLE KEYS */;
INSERT INTO `suggestions` VALUES (1,1,'nothing'),(2,1,'Testing'),(3,2,'Could you fix the color of the suggestion like buttons?');
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
INSERT INTO `suggestions_upvotes` VALUES (1,1),(2,1),(1,6);
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

-- Dump completed on 2014-12-30 20:25:06
