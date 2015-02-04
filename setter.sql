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
  CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `accounts_types` (`id`) ON DELETE CASCADE,
  CONSTRAINT `accounts_ibfk_2` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'cseibert113@gmail.com','$2a$10$xvhWKmn9tPB6BYUxJHD16OBlPRAQpvOdVXLl/XAZdCxXm2lWIraSS',1,'xzTeZ8ZKbwTdfnLfvgeY',2),(2,'routesetting@aiguille.com','$2a$10$yB2BtsqvdGcdTZYA3Odx2.cCmRYz2HM.6tBaQETvVCEeYbzOnhoDW',2,'KB3DVfRgzzZpNPxJ5nNx',15),(3,'mark@gmail.com','$2a$10$MPwKc0VMSTMTkcFAAacqhuwg1q.0xnK7Bb1ZT1JxDnIna0Ki80j32',1,'8J9tLdqM8NMFB3xmI82p',NULL),(4,'hi.guillermocasanova@gmail.com','$2a$10$wKCFVrzX9Xfrt46M7vtXeumrPbJv3ij28KBdHzbTHwIt9NUttqn/y',1,'SlEZIeLNB2KcgIhcBKYS',4),(6,'e_jimenez1012@hotmail.com','$2a$10$lNK78hDmS6OwutpMtonLLuC6FaiZ9lukakIX8S62f4AKunZIURM4q',1,'FugCeUFes2RUweT4MWmy',NULL),(7,'davisjstew@yahoo.com','$2a$10$owG3JqbYaEAOy3ASEZ1eIuqS4sxoGzMcNKqeqppjwABKEOjvdH18S',1,'KAm0LcWykSpNHwr8EFt9',NULL),(8,'jmwm88@yahoo.com','$2a$10$JKiLIlhtJaHJLAdoz0Ire.BoI32Cc9xk8ddHHLoUX4teukN1/7qSy',1,'uIXC6aXefMno9iwm8Cq4',NULL),(9,'blake.the.climber@gmail.com','$2a$10$mYnRn6Q8HeimC.WjnqkJweQ0DRrKRRm8eaHAxWASvEkz0E25uvwku',1,'Z1oU2Ulvc2NNPbRgUVA2',14),(10,'Moo5152@GMail.com','$2a$10$fbQ/GLdLyjzId4cKNW2pouz/1im8aqIvU4MYZJ0fOD8CXHjzO0tkm',1,'qOi4hk1rklkAnDYPOprZ',NULL),(13,'Newman.TravisA@gmail.com','$2a$10$GSriVfEX6aQKUJ4RkwHMPu558N5U8zMaeP8lRxI1my8vxjeKAxoi6',1,'TkAVnleV3bKrfAkN2BBY',NULL),(14,'kjenk13fl@gmail.com','$2a$10$zyM.eRANmNwxf1/YwOfGluNNkoP3/R9XkpjT2k66fUbSA0e3g8ja.',1,'FSfoumE8yHSGknJygS3B',NULL),(15,'mail@patrickdanielmurphy.com','$2a$10$3X6A/57A1RXqTq/jV1rzmOmciBYJtVmGotALZLASODNm/bBqaQrl2',1,'UCGHNFxrEWqAvrYTgpwp',8),(16,'SFeatherston92@Gmail.Com','$2a$10$Nd8uFxFkNy0.huiZQQOffOnBjsTKs67ys8FlKEVaNKAWsTZtL3qXu',1,'SH9KfqJlmYqgkRH8kBqw',10),(17,'HHayes95@gmail.com','$2a$10$o6cpYwdDUrh4VkN8Ffud4uyj19.e15wHVKlCd5PI8OMPfFm44gv7G',1,'M5r8rCXat2BGE0D8diYy',11),(18,'seanmichaelsmyth@gmail.com','$2a$10$sRKjTfUk67M3Svm2./y2f.xgRJgiQ4NBP/pZFzorZgj46MqFBxQpK',1,'8sUqRYNdbttaO1lZn9p8',NULL),(20,'wfdez82@yahoo.com','$2a$10$MNfLt6fEHQKVMj79J1Qlr.2yXOm4SaqW5lMkjkmfVasNChP9XGfIC',1,'6PTYWM7YBeGdGnMSre6n',13),(21,'jeffmcc27@gmail.com','$2a$10$NI1NyBxZP8f12bGJI8XA/e5hV4/6RqKJ35CAhCkrjY8cTGf4v1WfS',1,'YaNxPsRkVuOOHIyci2K5',NULL),(22,'midnightwisher@gmail.com','$2a$10$ZngpnBTkdKMVtLIVX9H9IONMxkmZqgKFq8u5M3SretO30bMBLidkW',1,'cUkaKBgtg6YHW5fBA4tE',16),(23,'jrjones@rollins.edu','$2a$10$FO4kWQ7xkFcF10vUC4zueevvrOPA9b4/T.i5k8raEA.76G.LGhuHi',1,'OEI30o0tOYGFOTotTd3O',NULL),(24,'testing@gmail.com','$2a$10$ZxDwZv4HH1pQBMTrQjwOEeYwgM9ewiwV5zEQb7yF0qQWjfp5JqD9m',1,'yCE7YDc0tsQ2QO9kg8GG',NULL),(25,'evan.e.jones@gmail.com','$2a$10$wS5LjTllmNbnQugn0RHrteL21RDKeEYdMZNPCc3KUi9G6qFPn4v6C',1,'ubx2x0w4s8IVlVLtxHFN',NULL),(26,'contact@highpoint.com','$2a$10$I.N.rmQH.OgRFKxH3YXyNOx2BTxeRdDDaNFNUJgo3jltNhS9RMGsK',2,'xKzBYQdhDJ0K3822RiZO',18),(27,'vicky@gmail.com','$2a$10$UOlZL.qviwB9kIlhKSHZJuJ3EcaRiGe45BF0QvKKP9Dk0MshOhRx.',1,'MvMGBAE5su7tfn0wg0fV',NULL);
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
-- Table structure for table `alerts`
--

DROP TABLE IF EXISTS `alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alerts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gym_id` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gym_id` (`gym_id`),
  CONSTRAINT `alerts_ibfk_1` FOREIGN KEY (`gym_id`) REFERENCES `gyms` (`account_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alerts`
--

LOCK TABLES `alerts` WRITE;
/*!40000 ALTER TABLE `alerts` DISABLE KEYS */;
INSERT INTO `alerts` VALUES (1,2,'New routes on the wave!','2015-01-03 13:49:47'),(2,2,'This is awesome!! My favorite part is filtering through the bouldering and rope section to see what is available.','2015-01-12 18:33:19');
/*!40000 ALTER TABLE `alerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogs`
--

DROP TABLE IF EXISTS `blogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `html` text NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs`
--

LOCK TABLES `blogs` WRITE;
/*!40000 ALTER TABLE `blogs` DISABLE KEYS */;
INSERT INTO `blogs` VALUES (1,'<h1>New Year\'s Eve! - Sprint 1</h1>\n<p>\n<i>Sprint 1</i>, our first official sprint of our project, started Monday ends Friday.   Guillermo and I settled on doing 1 week sprints for our development process.  Our justifications behind that is that it forces us to get feedback from users and setters faster than if we choose a 2 or 3 week sprint.\n</p>\n<p>\nAt the end of each sprint, we will be doing a demo for Mark, our head route setter at Aiguille, a couple other setters, and maybe a member or two.  We want to make this perfect for the users, so obtaining as much user feedback is critical to the success of SETTER.\n</p>\n<p>\nAs far as progress, we have add a LOT in a short amount of time.  Here is a non exhaustive list of what we have added this sprint, followed by a list of features planned.\n</p>\n\n<h3>General Changes</h3>\n- Improved the style and color of the entire site <br>\n- Added a developers blog which we can easily type new posts into <br>\n- Style fixes here and there to improve UX <br>\n<br>\n\n<h3>Gym Related Changes</h3>\n- Gyms can upload a default gym logo <br>\n- Gym charts showing analytics about all the routes, boulder and rope, in a gym <br>\n- Route manager which gym accounts can use to browse ALL routes in their gym <br>\n- Searching through the list of gyms <br>\n- Setters can \'strip\' a route, which archives it <br>\n- Display all home gym users on the gym page <br>\n- Manage setters was fixed up a little bit to make it easier to add setters <br>\n<br>\n\n<h3>User Related Changes</h3>\n- The ability for users to upload a user profile image <br>\n- Charts displaying the total routes a user has sent <br>\n- Charts displaying grade progress (algorithm under development still) <br>\n- V and YDS grade on user profiles<br>\n- Users can comment on routes <br>\n- Users can send routes <br>\n- Users can rate routes <br>\n- Users who send a route are displayed on the route send list  <br>\n<br><br>\n\n<div class=\"right\">Cody Seibert, Dec 31st 2014</div>','2015-01-03 11:48:39'),(2,'<h1>SETTER V0.1.0</h1>\n\n<p>\nToday we deployed V0.1.0 of SETTER.  This deploy will be our first version which we plan to start showing to people to get user feedback.  Between the last post and this one, a majority of the work was done on styling, fixing bugs, and infrastructure management.\n</p>\n\n<p>\nDigitalOcean is our choice for hosting.  Their service provides virtual machine hosting with hassle free payments for the servers, and they provide a lot of other features that help our development process.  In regards to this deployment, we took a snapshot of the current state of the production server on DigitalOcean and used that snapshot to spin up a new VM denoted as \"pre-production\".  Deploying to a pre-production server (a server which replicates the production server) allows developers to ensure the latest changes of their newest version (source code, database migrations, etc) work without disrupting the production environment.  We actually ran into a lot of bugs while deploying to pre-production, so good thing we followed this process!\n</p>\n\n<p>\nWe plan to get together with Mark and some climbers to get some feedback and then aggregate a list of changes that will be needed for Sprint 2 (which will start Monday).  There are probably bugs in this current version of SETTER, so please contact us if you find any.  Adding an ability to report bugs and our contact email will be added soon!\n</p>\n\n<p>\nEnjoy!\n</p>\n\n<div class=\"right\">Cody Seibert, Jan 3rd 2014</div>','2015-01-03 11:58:10');
/*!40000 ALTER TABLE `blogs` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,13,192,'Fun problem. May be a bit soft for a V4 with the correct beta.','2015-01-03 16:40:04'),(2,20,171,'Probably one of the best routes in the gym right now. Very different from anything ever set and not super hard just moves most ppl are not use to','2015-01-03 20:13:00'),(3,20,172,'Very fun route!','2015-01-03 20:13:59'),(4,20,174,'Should have been harder after the start moves... It starts off as a great route hen just turns into a V1','2015-01-03 20:15:32'),(5,20,72,'Great route very fun swing through','2015-01-03 20:17:52'),(6,20,117,'Great route heady finish','2015-01-03 20:19:39'),(7,21,197,'Super dope.','2015-01-04 19:38:29'),(8,1,195,'Test','2015-01-12 14:26:14'),(9,1,177,'this is a comment','2015-01-12 17:54:54'),(10,1,177,'test','2015-01-12 17:55:26'),(11,1,177,'test','2015-01-12 17:55:27'),(12,1,177,'test','2015-01-12 17:55:28'),(13,1,177,'test','2015-01-12 17:55:29');
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
-- Table structure for table `gym_account_requests`
--

DROP TABLE IF EXISTS `gym_account_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gym_account_requests` (
  `email` varchar(255) NOT NULL,
  `name` int(11) NOT NULL,
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gym_account_requests`
--

LOCK TABLES `gym_account_requests` WRITE;
/*!40000 ALTER TABLE `gym_account_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `gym_account_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gym_suggestions`
--

DROP TABLE IF EXISTS `gym_suggestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gym_suggestions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gym_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gym_id` (`gym_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `gym_suggestions_ibfk_1` FOREIGN KEY (`gym_id`) REFERENCES `gyms` (`account_id`) ON DELETE CASCADE,
  CONSTRAINT `gym_suggestions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`account_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gym_suggestions`
--

LOCK TABLES `gym_suggestions` WRITE;
/*!40000 ALTER TABLE `gym_suggestions` DISABLE KEYS */;
INSERT INTO `gym_suggestions` VALUES (1,2,1,'Could you set a route with extra pinches on it?',1,'2015-01-04 12:41:46'),(2,2,1,'Hey how is it going, set more crimps please',1,'2015-01-12 17:54:03');
/*!40000 ALTER TABLE `gym_suggestions` ENABLE KEYS */;
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
INSERT INTO `gyms` VALUES (2,'Aiguille Rock Climbing Center','999 Charles Street, Longwood, FL 32750'),(26,'High Point Climbing and Fitness','219 Broad Street Chattanooga, TN 37402');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,'images/uploads/4c82dbd85010524176400386ad30f777.jpg'),(2,'images/uploads/f4fa9694f0ae922f92cce03c3165d951.jpg'),(3,'images/uploads/2bde9f9979a420529f380f84e3067634.jpg'),(4,'images/uploads/cc91390a9c2ddc1ee42e84e24aa7b707.jpg'),(5,'images/uploads/fae4b2913034700a0942eeffd4fedcc6.jpg'),(6,'images/uploads/577ab3191ea77cfc40af39b810452ae2.jpg'),(7,'images/uploads/9803ddad25ec96ed1b764cb14883f407.jpg'),(8,'images/uploads/43a60e7ee90456ebf8fdaa56c2cade0e.jpg'),(9,'images/uploads/2e9a08ed0888dad6762ffadc4de47af0.JPG'),(10,'images/uploads/fe2dc046d37f6dc506a59c35791bbc02.JPG'),(11,'images/uploads/1ae9f928545b5a9d07bc33c6ca974b6e.jpg'),(12,'images/uploads/129918b36e174f610bb672eec8e59b42.jpg'),(13,'images/uploads/c8c2388c29afbce28121b0af358ab41e.jpg'),(14,'images/uploads/0b08a23b94da694397ee68cb0da49de2.jpg'),(15,'images/uploads/93a6b79f321f930d496249fbb67b6595.jpg'),(16,'images/uploads/9a453f14624b45227ea505dc983ce7ce.jpg'),(17,'images/uploads/8337c5afcb7c1cd5bc2de6aeb4d9f7bf.png'),(18,'images/uploads/280bb6a2c4faa120e735c4def29bcd9e.png'),(19,'images/uploads/f6f71187576d0740fd7d4f3e76544718.jpg'),(20,'images/uploads/09e90b0f740b0e675959eb1e10cd39e6.jpg');
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
INSERT INTO `ratings` VALUES (13,8,4),(13,20,3),(14,8,2),(14,20,4),(15,8,3),(16,8,4),(18,1,4),(18,8,3),(18,17,5),(19,1,3),(19,8,3),(20,8,3),(21,8,3),(22,1,5),(22,8,5),(22,17,5),(23,1,3),(23,8,5),(23,17,4),(25,8,4),(25,17,4),(25,20,3),(67,8,3),(67,16,4),(68,1,5),(69,1,4),(69,8,4),(69,16,4),(70,4,4),(70,8,2),(71,8,3),(72,1,4),(72,8,4),(72,16,5),(73,4,2),(73,8,1),(74,8,3),(74,20,4),(75,1,5),(117,8,4),(117,20,5),(118,8,4),(129,8,3),(137,20,4),(138,17,4),(147,8,4),(149,8,4),(149,20,4),(150,8,3),(151,8,4),(151,20,4),(152,8,3),(152,20,2),(155,8,4),(155,20,4),(158,20,4),(164,8,4),(168,8,4),(170,8,3),(170,16,4),(171,8,2),(171,16,4),(171,20,5),(172,8,5),(173,8,3),(174,1,4),(174,20,3),(175,4,4),(175,20,3),(176,1,3),(176,20,4),(177,1,5),(177,4,1),(177,20,4),(178,4,4),(178,20,4),(179,8,4),(180,8,3),(181,8,4),(182,16,4),(185,4,4),(186,1,5),(187,8,4),(188,8,3),(188,13,4),(188,16,3),(189,20,3),(191,4,4),(192,4,5),(192,8,4),(193,4,2),(194,4,3),(194,20,3),(194,21,3),(195,1,2),(195,4,5),(195,20,3),(195,21,3),(196,1,2),(196,4,2),(196,21,3),(197,8,5),(197,20,3),(197,21,5),(198,4,4),(198,20,4),(199,1,4),(199,21,3),(200,1,5),(200,8,5),(201,20,3),(202,20,4),(202,21,4),(203,4,3),(203,21,4),(204,4,5),(204,17,5),(204,21,5),(205,8,4),(206,8,2),(215,1,3),(223,1,3);
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
-- Table structure for table `route_new_to_user`
--

DROP TABLE IF EXISTS `route_new_to_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `route_new_to_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gym_id` int(11) NOT NULL,
  `wall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `route_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gym_id` (`gym_id`),
  KEY `wall_id` (`wall_id`),
  KEY `user_id` (`user_id`),
  KEY `route_id` (`route_id`),
  CONSTRAINT `route_new_to_user_ibfk_1` FOREIGN KEY (`gym_id`) REFERENCES `gyms` (`account_id`) ON DELETE CASCADE,
  CONSTRAINT `route_new_to_user_ibfk_2` FOREIGN KEY (`wall_id`) REFERENCES `walls` (`id`) ON DELETE CASCADE,
  CONSTRAINT `route_new_to_user_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`account_id`) ON DELETE CASCADE,
  CONSTRAINT `route_new_to_user_ibfk_4` FOREIGN KEY (`route_id`) REFERENCES `routes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route_new_to_user`
--

LOCK TABLES `route_new_to_user` WRITE;
/*!40000 ALTER TABLE `route_new_to_user` DISABLE KEYS */;
INSERT INTO `route_new_to_user` VALUES (1,26,41,27,207),(2,26,41,27,208),(3,26,50,27,209),(4,2,2,1,216),(5,2,2,3,216),(6,2,2,4,216),(7,2,2,6,216),(8,2,2,7,216),(9,2,2,8,216),(10,2,2,9,216),(11,2,2,10,216),(12,2,2,13,216),(13,2,2,14,216),(14,2,2,15,216),(15,2,2,16,216),(16,2,2,17,216),(17,2,2,20,216),(18,2,2,21,216),(19,2,2,24,216),(20,2,2,25,216),(21,2,2,1,217),(22,2,2,3,217),(23,2,2,4,217),(24,2,2,6,217),(25,2,2,7,217),(26,2,2,8,217),(27,2,2,9,217),(28,2,2,10,217),(29,2,2,13,217),(30,2,2,14,217),(31,2,2,15,217),(32,2,2,16,217),(33,2,2,17,217),(34,2,2,20,217),(35,2,2,21,217),(36,2,2,24,217),(37,2,2,25,217),(38,2,2,1,218),(39,2,2,3,218),(40,2,2,4,218),(41,2,2,6,218),(42,2,2,7,218),(43,2,2,8,218),(44,2,2,9,218),(45,2,2,10,218),(46,2,2,13,218),(47,2,2,14,218),(48,2,2,15,218),(49,2,2,16,218),(50,2,2,17,218),(51,2,2,20,218),(52,2,2,21,218),(53,2,2,24,218),(54,2,2,25,218),(55,2,2,1,219),(56,2,2,3,219),(57,2,2,4,219),(58,2,2,6,219),(59,2,2,7,219),(60,2,2,8,219),(61,2,2,9,219),(62,2,2,10,219),(63,2,2,13,219),(64,2,2,14,219),(65,2,2,15,219),(66,2,2,16,219),(67,2,2,17,219),(68,2,2,20,219),(69,2,2,21,219),(70,2,2,24,219),(71,2,2,25,219),(72,2,2,1,220),(73,2,2,3,220),(74,2,2,4,220),(75,2,2,6,220),(76,2,2,7,220),(77,2,2,8,220),(78,2,2,9,220),(79,2,2,10,220),(80,2,2,13,220),(81,2,2,14,220),(82,2,2,15,220),(83,2,2,16,220),(84,2,2,17,220),(85,2,2,20,220),(86,2,2,21,220),(87,2,2,24,220),(88,2,2,25,220),(89,2,12,1,221),(90,2,12,3,221),(91,2,12,4,221),(92,2,12,6,221),(93,2,12,7,221),(94,2,12,8,221),(95,2,12,9,221),(96,2,12,10,221),(97,2,12,13,221),(98,2,12,14,221),(99,2,12,15,221),(100,2,12,16,221),(101,2,12,17,221),(102,2,12,20,221),(103,2,12,21,221),(104,2,12,24,221),(105,2,12,25,221),(106,2,1,1,222),(107,2,1,3,222),(108,2,1,4,222),(109,2,1,6,222),(110,2,1,7,222),(111,2,1,8,222),(112,2,1,9,222),(113,2,1,10,222),(114,2,1,13,222),(115,2,1,14,222),(116,2,1,15,222),(117,2,1,16,222),(118,2,1,17,222),(119,2,1,20,222),(120,2,1,21,222),(121,2,1,24,222),(122,2,1,25,222),(124,2,1,3,223),(125,2,1,4,223),(126,2,1,6,223),(127,2,1,7,223),(128,2,1,8,223),(129,2,1,9,223),(130,2,1,10,223),(131,2,1,13,223),(132,2,1,14,223),(133,2,1,15,223),(134,2,1,16,223),(135,2,1,17,223),(136,2,1,20,223),(137,2,1,21,223),(138,2,1,24,223),(139,2,1,25,223);
/*!40000 ALTER TABLE `route_new_to_user` ENABLE KEYS */;
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
  `toprope_grade_id` int(11) DEFAULT NULL,
  `color_id` int(11) NOT NULL,
  `setter_id` int(11) NOT NULL,
  `note` varchar(255) NOT NULL DEFAULT '',
  `date` datetime NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `wall_id` int(11) NOT NULL,
  `lead_grade_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `boulder_grade_id` (`boulder_grade_id`),
  KEY `rope_grade_id` (`toprope_grade_id`),
  KEY `setter_id` (`setter_id`),
  KEY `color_id` (`color_id`),
  KEY `wall_id` (`wall_id`),
  KEY `lead_grade_id` (`lead_grade_id`),
  CONSTRAINT `routes_ibfk_9` FOREIGN KEY (`toprope_grade_id`) REFERENCES `rope_grades` (`id`) ON DELETE SET NULL,
  CONSTRAINT `routes_ibfk_2` FOREIGN KEY (`boulder_grade_id`) REFERENCES `boulder_grades` (`id`) ON DELETE CASCADE,
  CONSTRAINT `routes_ibfk_4` FOREIGN KEY (`setter_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `routes_ibfk_5` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`) ON DELETE CASCADE,
  CONSTRAINT `routes_ibfk_6` FOREIGN KEY (`wall_id`) REFERENCES `walls` (`id`) ON DELETE CASCADE,
  CONSTRAINT `routes_ibfk_7` FOREIGN KEY (`lead_grade_id`) REFERENCES `rope_grades` (`id`) ON DELETE SET NULL,
  CONSTRAINT `routes_ibfk_8` FOREIGN KEY (`lead_grade_id`) REFERENCES `rope_grades` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routes`
--

LOCK TABLES `routes` WRITE;
/*!40000 ALTER TABLE `routes` DISABLE KEYS */;
INSERT INTO `routes` VALUES (13,'',NULL,5,13,3,'','2014-12-16 21:59:12',1,11,NULL),(14,'',NULL,5,9,3,'','2014-12-16 21:59:32',1,11,NULL),(15,'',NULL,7,10,8,'','2014-12-16 21:59:40',1,11,NULL),(16,'',NULL,5,3,6,'','2014-12-16 21:59:48',1,11,NULL),(17,'',NULL,7,11,6,'','2014-12-16 21:59:56',1,11,NULL),(18,'',NULL,3,15,3,'','2014-12-16 22:00:02',1,11,NULL),(19,'',NULL,3,3,3,'','2014-12-16 22:00:10',1,11,NULL),(20,'',NULL,6,8,6,'','2014-12-16 22:00:16',1,11,NULL),(21,'',NULL,6,10,3,'','2014-12-16 22:00:22',1,11,NULL),(22,'',NULL,4,11,8,'','2014-12-16 22:00:29',1,11,NULL),(23,'',NULL,3,13,3,'','2014-12-16 22:00:41',1,11,NULL),(24,'',NULL,7,9,3,'','2014-12-16 22:00:48',1,11,NULL),(25,'',NULL,4,1,3,'','2014-12-16 22:01:02',1,11,NULL),(67,'',6,NULL,3,3,'','2014-12-16 22:09:27',1,5,NULL),(68,'',9,NULL,7,3,'','2014-12-16 22:09:36',1,5,NULL),(69,'',8,NULL,1,3,'','2014-12-16 22:09:40',1,5,NULL),(70,'',3,NULL,8,3,'','2014-12-16 22:09:45',1,5,NULL),(71,'',4,NULL,15,3,'','2014-12-16 22:09:52',1,5,NULL),(72,'',6,NULL,16,3,'','2014-12-16 22:10:02',1,5,NULL),(73,'',2,NULL,12,3,'','2014-12-16 22:10:09',1,5,NULL),(74,'',5,NULL,9,3,'','2014-12-16 22:10:14',1,5,NULL),(75,'',7,NULL,13,3,'','2014-12-16 22:10:19',1,5,NULL),(76,'',NULL,NULL,9,3,'','2014-12-16 22:10:47',1,4,NULL),(77,'',NULL,NULL,1,3,'','2014-12-16 22:10:54',1,4,NULL),(78,'',NULL,NULL,15,3,'','2014-12-16 22:10:59',1,4,NULL),(79,'',NULL,NULL,16,3,'','2014-12-16 22:11:02',1,4,NULL),(80,'',NULL,NULL,7,3,'','2014-12-16 22:11:05',1,4,NULL),(81,'',NULL,NULL,10,3,'','2014-12-16 22:11:09',1,4,NULL),(82,'',NULL,NULL,11,3,'','2014-12-16 22:11:12',1,4,NULL),(83,'',NULL,NULL,7,3,'','2014-12-16 22:11:16',1,4,NULL),(84,'',NULL,NULL,11,3,'','2014-12-16 22:11:18',1,4,NULL),(85,'',NULL,NULL,3,3,'','2014-12-16 22:11:21',1,4,NULL),(86,'',NULL,NULL,13,3,'','2014-12-16 22:11:24',1,4,NULL),(87,'',NULL,NULL,9,3,'','2014-12-16 22:11:27',1,4,NULL),(88,'',NULL,NULL,12,3,'','2014-12-16 22:11:30',1,4,NULL),(89,'',NULL,NULL,16,3,'','2014-12-16 22:11:34',1,4,NULL),(116,'',NULL,8,15,8,'','2014-12-29 15:20:06',1,11,NULL),(117,'',NULL,4,7,3,'','2014-12-29 15:27:49',1,11,NULL),(118,'',NULL,7,1,10,'','2014-12-29 15:33:11',1,11,NULL),(121,'',NULL,1,16,3,'','2014-12-29 15:37:08',1,12,NULL),(122,'',NULL,1,16,3,'','2014-12-29 15:37:24',1,13,NULL),(123,'',NULL,1,16,3,'','2014-12-29 15:37:42',1,14,NULL),(124,'',NULL,4,16,3,'','2014-12-29 15:37:58',1,15,NULL),(125,'',NULL,1,16,3,'','2014-12-29 15:38:04',1,15,NULL),(126,'',NULL,1,16,3,'','2014-12-29 15:40:25',1,16,NULL),(127,'',NULL,1,16,3,'','2014-12-29 15:40:47',1,17,NULL),(128,'',NULL,4,9,8,'','2014-12-29 15:41:24',1,18,NULL),(129,'',NULL,5,3,3,'','2014-12-29 15:41:37',1,18,NULL),(134,'',NULL,3,1,6,'','2014-12-29 16:00:49',1,21,NULL),(135,'',NULL,5,7,8,'','2014-12-29 16:00:57',1,21,NULL),(136,'',NULL,2,13,3,'','2014-12-29 16:04:06',1,22,NULL),(137,'',NULL,5,6,8,'','2014-12-29 16:04:23',1,22,NULL),(138,'',NULL,6,1,3,'','2014-12-29 16:04:33',1,22,NULL),(139,'',NULL,2,9,3,'','2014-12-29 16:05:04',1,24,NULL),(140,'',NULL,3,10,3,'','2014-12-29 16:05:12',1,24,NULL),(141,'',NULL,3,1,3,'','2014-12-29 16:05:46',1,25,NULL),(142,'',NULL,4,6,6,'','2014-12-29 16:06:08',1,25,NULL),(143,'',NULL,2,12,3,'','2014-12-29 16:06:29',1,26,NULL),(144,'',NULL,2,1,3,'','2014-12-29 16:07:23',1,27,NULL),(145,'',NULL,5,3,6,'','2014-12-29 16:07:30',1,27,NULL),(146,'',NULL,4,10,8,'','2014-12-29 16:08:28',1,29,NULL),(147,'',NULL,6,7,3,'','2014-12-29 16:08:42',1,29,NULL),(148,'',NULL,4,6,8,'','2014-12-29 16:09:10',1,30,NULL),(149,'',NULL,7,9,6,'','2014-12-29 16:09:19',1,30,NULL),(150,'',NULL,4,11,3,'','2014-12-29 16:11:11',1,31,NULL),(151,'',NULL,5,12,3,'','2014-12-29 16:11:19',1,31,NULL),(152,'',NULL,6,10,6,'','2014-12-29 16:11:28',1,31,NULL),(153,'',NULL,1,16,3,'','2014-12-29 16:11:51',1,32,NULL),(154,'',NULL,4,6,9,'','2014-12-29 16:12:20',1,33,NULL),(155,'',NULL,6,9,10,'','2014-12-29 16:12:33',1,33,NULL),(156,'',NULL,4,9,6,'','2014-12-29 16:14:21',1,34,NULL),(157,'',NULL,4,1,3,'','2014-12-29 16:14:27',1,34,NULL),(158,'',NULL,5,13,10,'','2014-12-29 16:14:35',1,34,NULL),(159,'',NULL,3,7,3,'','2014-12-29 16:14:55',1,35,NULL),(160,'',NULL,4,11,8,'','2014-12-29 16:15:33',1,36,NULL),(161,'',NULL,5,10,3,'','2014-12-29 16:15:48',1,36,NULL),(162,'',NULL,1,6,3,'','2014-12-29 16:16:24',1,37,NULL),(163,'',NULL,4,15,6,'','2014-12-29 16:16:33',1,37,NULL),(164,'',NULL,5,1,3,'','2014-12-29 16:16:40',1,37,NULL),(165,'',NULL,4,11,3,'','2014-12-29 16:17:18',1,38,NULL),(166,'',NULL,5,7,10,'','2014-12-29 16:17:30',1,38,NULL),(167,'',NULL,4,9,6,'','2014-12-29 16:17:54',1,39,NULL),(168,'',NULL,6,3,3,'','2014-12-29 16:18:00',1,39,NULL),(169,'',NULL,2,16,3,'','2014-12-29 16:18:18',1,40,NULL),(170,'',6,NULL,9,3,'','2014-12-29 19:56:00',1,2,NULL),(171,'',6,NULL,8,8,'','2014-12-29 19:56:20',1,2,NULL),(172,'',5,NULL,7,3,'','2014-12-29 19:57:34',1,2,NULL),(173,'',5,NULL,15,3,'','2014-12-29 19:57:54',1,2,NULL),(174,'',4,NULL,10,8,'','2014-12-29 19:59:38',1,2,NULL),(175,'',4,NULL,13,8,'','2014-12-29 19:59:53',1,2,NULL),(176,'',3,NULL,3,8,'','2014-12-29 20:00:51',1,2,NULL),(177,'',2,NULL,1,3,'','2014-12-29 20:01:08',1,2,NULL),(178,'',1,NULL,11,8,'','2014-12-29 20:01:29',1,2,NULL),(179,'',NULL,3,12,3,'','2014-12-30 12:57:49',1,19,NULL),(180,'',NULL,5,1,3,'','2014-12-30 12:58:50',1,19,NULL),(181,'',NULL,4,6,6,'','2014-12-31 14:42:39',1,20,NULL),(182,'',7,NULL,11,6,'','2015-01-02 11:39:31',1,3,NULL),(183,'',4,NULL,3,3,'','2015-01-02 11:40:02',1,3,NULL),(184,'',9,NULL,15,7,'','2015-01-02 11:40:26',1,3,NULL),(185,'',3,NULL,9,6,'','2015-01-02 11:40:42',1,3,NULL),(186,'',1,NULL,10,6,'','2015-01-02 11:41:02',1,3,NULL),(187,'',5,NULL,14,9,'','2015-01-02 11:41:31',1,3,NULL),(188,'',5,NULL,13,9,'','2015-01-02 11:41:51',1,3,NULL),(189,'',3,NULL,1,6,'','2015-01-02 11:42:22',1,3,NULL),(190,'',4,NULL,8,6,'','2015-01-02 11:42:39',1,3,NULL),(191,'',2,NULL,6,9,'','2015-01-02 11:43:02',1,3,NULL),(192,'',5,NULL,7,6,'','2015-01-02 11:43:24',1,3,NULL),(193,'',3,NULL,8,6,'','2015-01-02 11:44:23',1,3,NULL),(194,'',3,NULL,12,6,'','2015-01-02 14:47:22',0,1,NULL),(195,'',4,NULL,6,3,'','2015-01-02 14:47:37',0,1,NULL),(196,'',5,NULL,8,6,'','2015-01-02 14:47:50',0,1,NULL),(197,'',NULL,NULL,3,6,'','2015-01-02 14:48:19',0,1,NULL),(198,'',5,NULL,13,3,'','2015-01-02 14:48:30',0,1,NULL),(199,'',6,NULL,9,3,'','2015-01-02 14:49:15',0,1,NULL),(200,'',8,NULL,11,3,'','2015-01-02 14:49:28',0,1,NULL),(201,'',7,NULL,16,6,'','2015-01-02 14:49:43',0,1,NULL),(202,'',6,NULL,1,3,'','2015-01-02 14:49:55',0,1,NULL),(203,'',3,NULL,10,6,'','2015-01-02 14:50:06',0,1,NULL),(204,'',3,NULL,7,3,'','2015-01-02 14:50:52',0,1,NULL),(205,'',NULL,5,9,10,'','2015-01-04 14:39:21',1,20,NULL),(206,'',NULL,6,1,3,'','2015-01-04 14:40:47',1,33,NULL),(207,'',1,NULL,9,27,'','2015-01-10 20:23:23',1,41,NULL),(208,'',NULL,5,1,27,'','2015-01-10 20:24:25',1,41,NULL),(209,'',6,NULL,1,27,'','2015-01-10 20:26:42',1,50,NULL),(210,'',6,NULL,1,3,'','2015-01-12 15:56:48',0,1,NULL),(211,'',5,NULL,1,3,'','2015-01-12 15:56:54',0,1,NULL),(212,'',NULL,NULL,1,3,'','2015-01-12 15:58:21',0,1,NULL),(213,'',NULL,NULL,1,3,'','2015-01-12 15:58:23',0,1,NULL),(214,'',NULL,NULL,1,3,'','2015-01-12 15:58:25',0,1,NULL),(215,'',NULL,NULL,1,3,'','2015-01-12 15:58:36',1,1,NULL),(216,'',NULL,NULL,1,3,'','2015-01-14 03:10:55',1,2,NULL),(217,'',2,NULL,12,3,'','2015-01-14 03:11:32',1,2,NULL),(218,'',1,NULL,3,3,'','2015-01-14 03:11:47',1,2,NULL),(219,'',NULL,NULL,1,3,'','2015-01-14 03:12:25',1,2,1),(220,'',NULL,10,1,3,'','2015-01-14 03:12:32',1,2,NULL),(221,'',NULL,7,8,3,'','2015-01-14 03:18:36',1,12,NULL),(222,'',NULL,9,1,3,'','2015-01-14 03:19:12',1,1,NULL),(223,'',NULL,NULL,1,3,'','2015-01-14 03:19:37',1,1,2);
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
INSERT INTO `sends` VALUES (1,18,'2015-01-03 17:08:31'),(1,19,'2015-01-03 17:08:05'),(1,22,'2015-01-03 17:28:33'),(1,23,'2015-01-03 17:07:47'),(1,67,'2015-01-03 11:42:39'),(1,68,'2015-01-03 11:42:47'),(1,69,'2015-01-03 11:42:45'),(1,70,'2015-01-03 11:42:34'),(1,71,'2015-01-03 11:42:35'),(1,72,'2015-01-03 11:42:40'),(1,73,'2015-01-03 11:42:31'),(1,74,'2015-01-03 11:42:37'),(1,75,'2015-01-03 11:42:42'),(1,128,'2015-01-03 12:12:12'),(1,174,'2015-01-12 17:55:35'),(1,176,'2015-01-12 17:21:30'),(1,177,'2015-01-12 17:54:43'),(1,185,'2015-01-06 23:17:25'),(1,186,'2015-01-14 01:45:28'),(1,189,'2015-01-06 23:17:32'),(1,191,'2015-01-06 23:17:14'),(1,193,'2015-01-06 23:17:20'),(1,194,'2015-01-03 12:24:38'),(1,195,'2015-01-08 19:59:33'),(1,196,'2015-01-03 12:23:56'),(1,198,'2015-01-03 12:24:02'),(1,199,'2015-01-03 12:24:05'),(1,200,'2015-01-03 12:24:07'),(1,201,'2015-01-03 12:24:20'),(1,202,'2015-01-03 12:24:31'),(1,203,'2015-01-03 12:24:33'),(1,204,'2015-01-03 12:24:36'),(1,215,'2015-01-12 18:51:47'),(1,223,'2015-01-14 14:41:54'),(4,70,'2015-01-03 23:54:50'),(4,73,'2015-01-03 23:54:30'),(4,78,'2015-01-03 23:52:44'),(4,175,'2015-01-03 23:52:09'),(4,177,'2015-01-03 23:51:18'),(4,178,'2015-01-03 23:51:39'),(4,185,'2015-01-03 12:33:14'),(4,190,'2015-01-03 12:34:31'),(4,191,'2015-01-03 23:53:01'),(4,192,'2015-01-03 12:23:20'),(4,193,'2015-01-03 12:34:41'),(4,194,'2015-01-07 15:42:56'),(4,195,'2015-01-07 15:42:42'),(4,196,'2015-01-07 15:42:30'),(4,198,'2015-01-07 15:42:16'),(4,203,'2015-01-03 14:39:32'),(4,204,'2015-01-07 15:43:04'),(8,13,'2015-01-03 17:48:34'),(8,14,'2015-01-03 17:48:45'),(8,15,'2015-01-03 17:49:56'),(8,16,'2015-01-03 17:49:01'),(8,18,'2015-01-03 17:44:06'),(8,19,'2015-01-03 17:45:44'),(8,20,'2015-01-03 17:49:11'),(8,21,'2015-01-03 17:49:27'),(8,22,'2015-01-03 17:45:52'),(8,23,'2015-01-03 17:43:31'),(8,25,'2015-01-03 17:46:06'),(8,67,'2015-01-03 17:50:50'),(8,69,'2015-01-03 17:50:12'),(8,70,'2015-01-03 17:52:45'),(8,71,'2015-01-03 17:52:35'),(8,72,'2015-01-03 17:51:50'),(8,73,'2015-01-03 17:52:51'),(8,74,'2015-01-03 17:51:05'),(8,75,'2015-01-03 17:50:17'),(8,117,'2015-01-03 17:48:22'),(8,118,'2015-01-03 17:49:47'),(8,128,'2015-01-04 18:39:45'),(8,129,'2015-01-04 18:39:40'),(8,146,'2015-01-04 18:41:54'),(8,147,'2015-01-04 18:42:00'),(8,149,'2015-01-04 18:42:12'),(8,150,'2015-01-04 18:42:49'),(8,151,'2015-01-04 18:42:38'),(8,152,'2015-01-04 18:42:57'),(8,155,'2015-01-04 18:43:27'),(8,164,'2015-01-04 18:44:44'),(8,168,'2015-01-04 18:44:59'),(8,170,'2015-01-03 17:54:26'),(8,171,'2015-01-03 17:54:19'),(8,172,'2015-01-03 17:54:45'),(8,173,'2015-01-03 17:54:39'),(8,174,'2015-01-04 18:28:25'),(8,179,'2015-01-04 18:39:27'),(8,180,'2015-01-04 18:39:20'),(8,181,'2015-01-04 18:40:03'),(8,187,'2015-01-04 18:30:01'),(8,188,'2015-01-04 18:29:52'),(8,192,'2015-01-04 18:29:41'),(8,205,'2015-01-04 18:40:11'),(8,206,'2015-01-06 11:51:32'),(9,18,'2015-01-04 01:50:44'),(9,19,'2015-01-04 01:50:47'),(9,22,'2015-01-04 01:50:40'),(9,23,'2015-01-04 01:50:50'),(9,67,'2015-01-04 01:49:02'),(9,68,'2015-01-04 01:49:10'),(9,69,'2015-01-04 01:49:06'),(9,70,'2015-01-04 01:48:43'),(9,71,'2015-01-04 01:48:45'),(9,72,'2015-01-04 01:48:51'),(9,73,'2015-01-04 01:48:37'),(9,74,'2015-01-04 01:48:48'),(9,75,'2015-01-04 01:48:59'),(9,76,'2015-01-04 01:46:58'),(9,77,'2015-01-04 01:47:06'),(9,78,'2015-01-04 01:47:13'),(9,80,'2015-01-04 01:46:22'),(9,81,'2015-01-04 01:46:27'),(9,82,'2015-01-04 01:46:32'),(9,83,'2015-01-04 01:46:36'),(9,84,'2015-01-04 01:46:43'),(9,85,'2015-01-04 01:46:51'),(9,86,'2015-01-04 01:46:54'),(9,87,'2015-01-04 01:47:00'),(9,88,'2015-01-04 01:47:10'),(9,89,'2015-01-04 01:47:29'),(9,170,'2015-01-04 01:45:13'),(9,171,'2015-01-04 01:45:22'),(9,172,'2015-01-04 01:45:01'),(9,173,'2015-01-04 01:45:05'),(9,174,'2015-01-04 01:44:44'),(9,175,'2015-01-04 01:44:55'),(9,176,'2015-01-04 01:44:40'),(9,177,'2015-01-04 01:44:36'),(9,178,'2015-01-04 01:44:31'),(9,182,'2015-01-04 01:46:09'),(9,183,'2015-01-04 01:45:53'),(9,185,'2015-01-04 01:45:45'),(9,186,'2015-01-04 01:45:30'),(9,187,'2015-01-04 01:45:56'),(9,188,'2015-01-04 01:46:00'),(9,189,'2015-01-04 01:45:38'),(9,190,'2015-01-04 01:45:49'),(9,191,'2015-01-04 01:45:34'),(9,192,'2015-01-04 01:46:05'),(9,193,'2015-01-04 01:45:41'),(9,194,'2015-01-04 01:50:02'),(9,195,'2015-01-04 01:50:06'),(9,196,'2015-01-04 01:50:09'),(9,198,'2015-01-04 01:49:23'),(9,199,'2015-01-04 01:49:27'),(9,200,'2015-01-04 01:49:31'),(9,202,'2015-01-04 01:49:49'),(9,203,'2015-01-04 01:49:53'),(9,204,'2015-01-04 01:49:57'),(13,188,'2015-01-03 16:36:01'),(13,192,'2015-01-03 16:36:49'),(16,67,'2015-01-03 13:41:56'),(16,69,'2015-01-03 13:41:25'),(16,72,'2015-01-03 13:41:49'),(16,170,'2015-01-04 02:09:02'),(16,171,'2015-01-04 02:08:40'),(16,172,'2015-01-04 02:09:20'),(16,173,'2015-01-04 02:09:11'),(16,182,'2015-01-03 13:39:15'),(16,188,'2015-01-03 13:39:45'),(17,18,'2015-01-03 17:49:53'),(17,19,'2015-01-03 17:49:47'),(17,22,'2015-01-03 17:47:36'),(17,23,'2015-01-03 17:49:35'),(17,25,'2015-01-03 17:49:59'),(17,70,'2015-01-03 17:53:29'),(17,71,'2015-01-03 17:53:25'),(17,78,'2015-01-07 11:19:04'),(17,135,'2015-01-03 19:14:47'),(17,138,'2015-01-03 18:54:02'),(17,160,'2015-01-03 19:13:37'),(17,161,'2015-01-03 19:13:40'),(17,164,'2015-01-04 23:32:02'),(17,175,'2015-01-03 17:53:00'),(17,176,'2015-01-03 17:52:44'),(17,177,'2015-01-03 17:52:25'),(17,178,'2015-01-03 17:51:54'),(17,180,'2015-01-04 23:31:21'),(17,183,'2015-01-08 10:23:42'),(17,192,'2015-01-08 10:23:29'),(17,203,'2015-01-03 17:51:06'),(17,204,'2015-01-03 17:51:42'),(17,205,'2015-01-04 23:31:42'),(20,13,'2015-01-03 20:20:10'),(20,14,'2015-01-03 20:20:27'),(20,18,'2015-01-03 20:18:41'),(20,19,'2015-01-03 20:18:51'),(20,22,'2015-01-03 20:19:08'),(20,23,'2015-01-03 20:18:57'),(20,25,'2015-01-03 20:19:19'),(20,67,'2015-01-03 20:18:10'),(20,71,'2015-01-03 20:18:20'),(20,72,'2015-01-03 20:17:59'),(20,74,'2015-01-03 20:17:13'),(20,117,'2015-01-03 20:19:43'),(20,137,'2015-01-03 20:23:06'),(20,149,'2015-01-03 20:26:25'),(20,151,'2015-01-03 20:23:55'),(20,152,'2015-01-03 20:24:04'),(20,155,'2015-01-03 20:24:45'),(20,158,'2015-01-03 20:25:08'),(20,171,'2015-01-03 20:11:56'),(20,172,'2015-01-03 20:14:01'),(20,173,'2015-01-03 20:13:46'),(20,174,'2015-01-03 20:15:41'),(20,175,'2015-01-03 20:14:46'),(20,176,'2015-01-03 20:16:06'),(20,177,'2015-01-03 20:16:16'),(20,178,'2015-01-03 20:11:47'),(20,194,'2015-01-03 20:10:13'),(20,195,'2015-01-03 20:10:26'),(20,196,'2015-01-03 20:11:28'),(20,198,'2015-01-03 20:08:35'),(20,199,'2015-01-03 20:08:49'),(20,201,'2015-01-03 20:09:04'),(20,202,'2015-01-03 20:09:14'),(20,203,'2015-01-03 20:09:31'),(20,204,'2015-01-03 20:09:52'),(21,194,'2015-01-04 19:45:39'),(21,195,'2015-01-04 19:45:51'),(21,196,'2015-01-04 19:37:33'),(21,199,'2015-01-04 19:39:34'),(21,203,'2015-01-04 19:41:16'),(21,204,'2015-01-04 19:45:30'),(24,125,'2015-01-07 08:50:02'),(24,177,'2015-01-07 08:49:57');
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
INSERT INTO `setters_gyms_access` VALUES (3,2),(6,2),(7,2),(8,2),(9,2),(10,2),(27,26);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suggestions`
--

LOCK TABLES `suggestions` WRITE;
/*!40000 ALTER TABLE `suggestions` DISABLE KEYS */;
INSERT INTO `suggestions` VALUES (2,8,'Have the stars be a different color when rated vs not rated');
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
INSERT INTO `suggestions_upvotes` VALUES (2,8);
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
INSERT INTO `users` VALUES (1,2,'Cody','Seibert'),(3,2,'Mark','Mercer'),(4,2,'Guillermo','Martinez'),(6,2,'Joshua','Jimenez'),(7,2,'Davis','Stewart'),(8,2,'Jonmikel','Macnichols'),(9,2,'Blake','Compton'),(10,2,'Chris','Freiberg'),(13,2,'Travis','Newman'),(14,2,'Jessica','Jenkins'),(15,2,'Patrick','Murphy'),(16,2,'Steven','Featherston'),(17,2,'Hannah','Hayes'),(18,NULL,'Sean Michael','Smyth'),(20,2,'William','Fernandez'),(21,2,'Jeff','Mccallister'),(22,NULL,'Ashley','Pacailler'),(23,NULL,'Ryan','Jones'),(24,2,'Cody','Seibert'),(25,2,'Evan','Jones'),(27,26,'Vicky','Sinnott');
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
  `last_update` datetime NOT NULL,
  `image_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gym_id` (`gym_id`),
  KEY `image_id` (`image_id`),
  CONSTRAINT `walls_ibfk_1` FOREIGN KEY (`gym_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `walls_ibfk_2` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `walls`
--

LOCK TABLES `walls` WRITE;
/*!40000 ALTER TABLE `walls` DISABLE KEYS */;
INSERT INTO `walls` VALUES (1,'Wave',2,'2015-01-14 03:19:37',20),(2,'Diamond',2,'2015-01-14 03:12:32',NULL),(3,'Right Gray',2,'0000-00-00 00:00:00',NULL),(4,'Boulder Cave',2,'0000-00-00 00:00:00',NULL),(5,'Lead Cave',2,'0000-00-00 00:00:00',NULL),(11,'Lead',2,'0000-00-00 00:00:00',NULL),(12,'1',2,'2015-01-14 03:18:37',NULL),(13,'2',2,'0000-00-00 00:00:00',NULL),(14,'3',2,'0000-00-00 00:00:00',NULL),(15,'4',2,'0000-00-00 00:00:00',NULL),(16,'5',2,'0000-00-00 00:00:00',NULL),(17,'6',2,'0000-00-00 00:00:00',NULL),(18,'7',2,'0000-00-00 00:00:00',NULL),(19,'8',2,'0000-00-00 00:00:00',NULL),(20,'9',2,'0000-00-00 00:00:00',NULL),(21,'10',2,'0000-00-00 00:00:00',NULL),(22,'11',2,'0000-00-00 00:00:00',NULL),(24,'12',2,'0000-00-00 00:00:00',NULL),(25,'13',2,'0000-00-00 00:00:00',NULL),(26,'14',2,'0000-00-00 00:00:00',NULL),(27,'15',2,'0000-00-00 00:00:00',NULL),(29,'16',2,'0000-00-00 00:00:00',NULL),(30,'17',2,'0000-00-00 00:00:00',NULL),(31,'18',2,'0000-00-00 00:00:00',NULL),(32,'19',2,'0000-00-00 00:00:00',NULL),(33,'20',2,'0000-00-00 00:00:00',NULL),(34,'21',2,'0000-00-00 00:00:00',NULL),(35,'22',2,'0000-00-00 00:00:00',NULL),(36,'23',2,'0000-00-00 00:00:00',NULL),(37,'24',2,'0000-00-00 00:00:00',NULL),(38,'25',2,'0000-00-00 00:00:00',NULL),(39,'26',2,'0000-00-00 00:00:00',NULL),(40,'27',2,'0000-00-00 00:00:00',NULL),(41,'Kid Zone Room',26,'2015-01-10 20:24:25',NULL),(42,'Bouldering Room',26,'0000-00-00 00:00:00',NULL),(43,'The Arch',26,'0000-00-00 00:00:00',NULL),(44,'Top Rope Room',26,'0000-00-00 00:00:00',NULL),(45,'Ying-Yang Wall',26,'0000-00-00 00:00:00',NULL),(46,'Lead Walls',26,'0000-00-00 00:00:00',NULL),(47,'Speed Walls',26,'0000-00-00 00:00:00',NULL),(48,'Auto Belay',26,'0000-00-00 00:00:00',NULL),(49,'Wave Wall',26,'0000-00-00 00:00:00',NULL),(50,'Mushroom Boulder',26,'2015-01-10 20:26:42',NULL),(51,'The Pit',26,'0000-00-00 00:00:00',NULL),(52,'Chestnut Walls',26,'0000-00-00 00:00:00',NULL);
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

-- Dump completed on 2015-01-15  0:39:23
