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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'cseibert113@gmail.com','$2a$10$S8viQ38.Ukwqn7C.hEgZdedDozA0Y2vXefChMJvC1CieVrUt8xhUC',1,'xzTeZ8ZKbwTdfnLfvgeY',2),(2,'routesetting@aiguille.com','$2a$10$yB2BtsqvdGcdTZYA3Odx2.cCmRYz2HM.6tBaQETvVCEeYbzOnhoDW',2,'KB3DVfRgzzZpNPxJ5nNx',22),(3,'mark@gmail.com','$2a$10$MPwKc0VMSTMTkcFAAacqhuwg1q.0xnK7Bb1ZT1JxDnIna0Ki80j32',1,'8J9tLdqM8NMFB3xmI82p',NULL),(4,'hi.guillermocasanova@gmail.com','$2a$10$xncJ8dPYPUnbFAkL4fvVd.lbyGamXycNp4aNFks4a62l91LD68OmS',1,'SlEZIeLNB2KcgIhcBKYS',23),(6,'e_jimenez1012@hotmail.com','$2a$10$lNK78hDmS6OwutpMtonLLuC6FaiZ9lukakIX8S62f4AKunZIURM4q',1,'FugCeUFes2RUweT4MWmy',NULL),(7,'davisjstew@yahoo.com','$2a$10$owG3JqbYaEAOy3ASEZ1eIuqS4sxoGzMcNKqeqppjwABKEOjvdH18S',1,'KAm0LcWykSpNHwr8EFt9',NULL),(8,'jmwm88@yahoo.com','$2a$10$JKiLIlhtJaHJLAdoz0Ire.BoI32Cc9xk8ddHHLoUX4teukN1/7qSy',1,'uIXC6aXefMno9iwm8Cq4',NULL),(9,'blake.the.climber@gmail.com','$2a$10$mYnRn6Q8HeimC.WjnqkJweQ0DRrKRRm8eaHAxWASvEkz0E25uvwku',1,'Z1oU2Ulvc2NNPbRgUVA2',14),(10,'Moo5152@GMail.com','$2a$10$fbQ/GLdLyjzId4cKNW2pouz/1im8aqIvU4MYZJ0fOD8CXHjzO0tkm',1,'qOi4hk1rklkAnDYPOprZ',NULL),(13,'Newman.TravisA@gmail.com','$2a$10$GSriVfEX6aQKUJ4RkwHMPu558N5U8zMaeP8lRxI1my8vxjeKAxoi6',1,'TkAVnleV3bKrfAkN2BBY',NULL),(14,'kjenk13fl@gmail.com','$2a$10$zyM.eRANmNwxf1/YwOfGluNNkoP3/R9XkpjT2k66fUbSA0e3g8ja.',1,'FSfoumE8yHSGknJygS3B',NULL),(15,'mail@patrickdanielmurphy.com','$2a$10$3X6A/57A1RXqTq/jV1rzmOmciBYJtVmGotALZLASODNm/bBqaQrl2',1,'UCGHNFxrEWqAvrYTgpwp',8),(16,'SFeatherston92@Gmail.Com','$2a$10$Nd8uFxFkNy0.huiZQQOffOnBjsTKs67ys8FlKEVaNKAWsTZtL3qXu',1,'SH9KfqJlmYqgkRH8kBqw',10),(17,'HHayes95@gmail.com','$2a$10$o6cpYwdDUrh4VkN8Ffud4uyj19.e15wHVKlCd5PI8OMPfFm44gv7G',1,'M5r8rCXat2BGE0D8diYy',21),(18,'seanmichaelsmyth@gmail.com','$2a$10$sRKjTfUk67M3Svm2./y2f.xgRJgiQ4NBP/pZFzorZgj46MqFBxQpK',1,'8sUqRYNdbttaO1lZn9p8',NULL),(20,'wfdez82@yahoo.com','$2a$10$MNfLt6fEHQKVMj79J1Qlr.2yXOm4SaqW5lMkjkmfVasNChP9XGfIC',1,'6PTYWM7YBeGdGnMSre6n',13),(21,'jeffmcc27@gmail.com','$2a$10$NI1NyBxZP8f12bGJI8XA/e5hV4/6RqKJ35CAhCkrjY8cTGf4v1WfS',1,'YaNxPsRkVuOOHIyci2K5',NULL),(22,'midnightwisher@gmail.com','$2a$10$ZngpnBTkdKMVtLIVX9H9IONMxkmZqgKFq8u5M3SretO30bMBLidkW',1,'cUkaKBgtg6YHW5fBA4tE',16),(23,'jrjones@rollins.edu','$2a$10$FO4kWQ7xkFcF10vUC4zueevvrOPA9b4/T.i5k8raEA.76G.LGhuHi',1,'OEI30o0tOYGFOTotTd3O',NULL),(24,'testing@gmail.com','$2a$10$ZxDwZv4HH1pQBMTrQjwOEeYwgM9ewiwV5zEQb7yF0qQWjfp5JqD9m',1,'yCE7YDc0tsQ2QO9kg8GG',NULL),(25,'evan.e.jones@gmail.com','$2a$10$wS5LjTllmNbnQugn0RHrteL21RDKeEYdMZNPCc3KUi9G6qFPn4v6C',1,'ubx2x0w4s8IVlVLtxHFN',NULL),(26,'info@highpointclimbing.com','$2a$10$I.N.rmQH.OgRFKxH3YXyNOx2BTxeRdDDaNFNUJgo3jltNhS9RMGsK',2,'xKzBYQdhDJ0K3822RiZO',17),(27,'nkaraze@gmail.com','$2a$10$jVqIr9u2vFDo8wuX5hwdDOKh6RD4lIOvbmmg9FkG8UyB6Vd0SvJEC',1,'Z0SnzDE7gMr3kf2CgPkX',NULL),(29,'mbird7260@gmail.com','$2a$10$dSbduBzS2z2CA.T18wc3VexhqNAjQwQhf4HlmUkfPfmhkGPfq64wK',1,'PP7W1KVOt1nJBWBVsKBK',NULL),(30,'info@onthedgerockclimbing.com','$2a$10$Ye2MhsIX.4bKvOvS8pBDfe9La69392zLbHthXIxAKl4NNnBZ7p.Bq',2,'HlofkGfmw4dBdZwQbcJG',NULL),(31,'austin.lawicki@gmail.com','$2a$10$63rA6dnrG4oeKn7miTK3e.0CSi.i2g6lUzOrLd3JLNQK0CJxw6Gm6',1,'rBUJkTTMbJvsfq3ELUS7',NULL),(32,'some_guest_account_yIU36mn8Jxk1sXgk0LTy@nothing.com','$2a$10$mDRcldQ0nPRKVhaAk3WQ8.i43kbFPvomQGFub7kNpw62Fo3AphH2q',1,'Jz4zWhts83Eh1hQsPBYN',NULL),(33,'alexnajoh@gmail.com','$2a$10$Sbniy8zoWfePhjBN70fLo.sGX6c4zwAzQw1ooNy5oQEl9reoWUpmq',1,'zSxwwANkgIWSmsBhp4eG',NULL),(34,'info@x-tremerock.com','$2a$10$WnHqaLYZ5v7wc8FQprHSwOLZHZ6XY8apoZifWXTBlPas9U0fyFy7C',2,'Ny38AzzxORMlIheOEPu9',NULL),(35,'some_guest_account_HeN88GA64hGAEkUzdchh@nothing.com','$2a$10$6QLEic4sIs2TfEKoqItSWulQFH2gjTr6Twou23jA7R47O7N6Otn7u',1,'sD3bgiZlMFlanFpQnLXd',NULL),(36,'hanleyhankins.nick@knights.ucf.edu','$2a$10$Ik2XQDC/oO8ivQiIn.1VGuispV2KAJGe7WWeqGpfaOpyaM8vvF86e',1,'SOWPKQRa79UdgGbFodbm',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alerts`
--

LOCK TABLES `alerts` WRITE;
/*!40000 ALTER TABLE `alerts` DISABLE KEYS */;
INSERT INTO `alerts` VALUES (4,2,'The wave has FILLER!!!!!!!!!!!!!!!!!','2015-01-21 12:48:02');
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,13,192,'Fun problem. May be a bit soft for a V4 with the correct beta.','2015-01-03 16:40:04'),(2,20,171,'Probably one of the best routes in the gym right now. Very different from anything ever set and not super hard just moves most ppl are not use to','2015-01-03 20:13:00'),(3,20,172,'Very fun route!','2015-01-03 20:13:59'),(4,20,174,'Should have been harder after the start moves... It starts off as a great route hen just turns into a V1','2015-01-03 20:15:32'),(5,20,72,'Great route very fun swing through','2015-01-03 20:17:52'),(6,20,117,'Great route heady finish','2015-01-03 20:19:39'),(7,21,197,'Super dope.','2015-01-04 19:38:29'),(8,20,15,'Great route I like the slight run out','2015-01-16 19:07:27'),(9,20,118,'Great route flows amazing and has perfect hold placement for climbing','2015-01-16 19:08:09'),(10,20,118,'Clipping','2015-01-16 19:08:17'),(11,20,207,'I normally love dihedral routes but this one just didn\'t make much of a fun route.','2015-01-16 19:09:39'),(12,20,229,'This route is clearly missing a foot hold in the middle going to the volume or the foot hold placement is off','2015-01-16 19:12:59'),(13,20,226,'Greg route for insight training. Next to impossible to read from the ground and makes you work and think it through slowly','2015-01-16 19:15:16'),(14,20,212,'Burly up top','2015-01-16 19:16:21'),(15,20,85,'Fun problem','2015-01-16 19:43:31'),(16,20,25,'Long pumpy route great for running laps.','2015-01-16 19:45:36');
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
INSERT INTO `gym_account_requests` VALUES ('pablo-farias@live.com',0,'13972 sw 139th ct');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gym_suggestions`
--

LOCK TABLES `gym_suggestions` WRITE;
/*!40000 ALTER TABLE `gym_suggestions` DISABLE KEYS */;
INSERT INTO `gym_suggestions` VALUES (1,2,1,'Could you set a route with extra pinches on it?',1,'2015-01-04 12:41:46');
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
INSERT INTO `gyms` VALUES (2,'Aiguille Rock Climbing Center','999 Charles Street, Longwood, FL 32750'),(26,'High Point Climbing and Fitness','219 Broad Street Chattanooga, TN 37402'),(30,'On The Edge','200 West Drive, Melbourne, FL, 32904'),(34,'X-Treme','13972 SW 139 Court, Miami, FL 33186');
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,'images/uploads/4c82dbd85010524176400386ad30f777.jpg'),(2,'images/uploads/f4fa9694f0ae922f92cce03c3165d951.jpg'),(3,'images/uploads/2bde9f9979a420529f380f84e3067634.jpg'),(4,'images/uploads/cc91390a9c2ddc1ee42e84e24aa7b707.jpg'),(5,'images/uploads/fae4b2913034700a0942eeffd4fedcc6.jpg'),(6,'images/uploads/577ab3191ea77cfc40af39b810452ae2.jpg'),(7,'images/uploads/9803ddad25ec96ed1b764cb14883f407.jpg'),(8,'images/uploads/43a60e7ee90456ebf8fdaa56c2cade0e.jpg'),(9,'images/uploads/2e9a08ed0888dad6762ffadc4de47af0.JPG'),(10,'images/uploads/fe2dc046d37f6dc506a59c35791bbc02.JPG'),(11,'images/uploads/1ae9f928545b5a9d07bc33c6ca974b6e.jpg'),(12,'images/uploads/129918b36e174f610bb672eec8e59b42.jpg'),(13,'images/uploads/c8c2388c29afbce28121b0af358ab41e.jpg'),(14,'images/uploads/0b08a23b94da694397ee68cb0da49de2.jpg'),(15,'images/uploads/93a6b79f321f930d496249fbb67b6595.jpg'),(16,'images/uploads/9a453f14624b45227ea505dc983ce7ce.jpg'),(17,'images/uploads/8337c5afcb7c1cd5bc2de6aeb4d9f7bf.png'),(18,'images/uploads/293aeeaa9cbe9d906bf5019722a59464.png'),(19,'images/uploads/e58b1cdd873b50d5dd3121ac413685c1.png'),(20,'images/uploads/865e11f4a5e09a9c87898ac079ddd0f0.png'),(21,'images/uploads/d96502cd16f38973e482a1ce6c1ed6d4.png'),(22,'images/uploads/7d81b945df002b0dda1324cc03a19ea0.jpg'),(23,'images/uploads/99c486f5af343f76d659522806b72185.jpg');
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
INSERT INTO `ratings` VALUES (13,8,4),(13,9,4),(13,20,3),(14,8,2),(14,20,4),(15,8,3),(15,20,5),(16,8,4),(16,20,1),(18,1,4),(18,8,3),(18,17,5),(18,31,4),(19,1,3),(19,8,3),(19,20,5),(20,8,3),(20,20,2),(21,8,3),(21,20,4),(22,1,5),(22,8,5),(22,17,5),(23,1,3),(23,8,5),(23,17,4),(23,20,1),(24,20,3),(25,8,4),(25,17,4),(25,20,3),(67,8,3),(67,16,4),(67,21,3),(68,1,5),(68,21,5),(69,1,4),(69,8,4),(69,16,4),(69,21,5),(70,4,4),(70,8,2),(70,21,3),(71,8,3),(71,21,4),(72,1,4),(72,8,4),(72,16,5),(72,21,4),(73,4,2),(73,8,1),(73,21,3),(74,8,3),(74,20,4),(74,21,3),(75,1,5),(75,21,3),(76,20,3),(84,20,4),(85,20,4),(86,20,3),(88,20,3),(117,8,4),(117,20,5),(117,31,4),(118,8,4),(118,20,5),(129,8,3),(137,20,4),(138,17,4),(147,8,4),(149,8,4),(149,20,4),(150,8,3),(151,8,4),(151,20,4),(152,8,3),(152,20,2),(155,8,4),(155,20,4),(158,20,4),(164,8,4),(168,8,4),(170,8,3),(170,16,4),(170,20,4),(170,21,5),(171,8,2),(171,16,4),(171,20,5),(171,21,3),(172,8,5),(172,21,4),(173,8,3),(173,21,4),(174,20,3),(174,21,3),(175,4,4),(175,20,3),(175,21,3),(176,20,4),(176,21,3),(176,27,4),(177,4,1),(177,20,4),(177,21,3),(178,4,4),(178,20,4),(178,21,3),(179,8,4),(180,8,3),(181,8,4),(182,16,4),(185,4,4),(185,27,1),(187,8,4),(188,8,3),(188,13,4),(188,16,3),(189,20,3),(191,4,4),(191,27,3),(192,4,5),(192,8,4),(193,4,2),(194,4,3),(194,20,3),(194,21,3),(195,4,5),(195,20,3),(195,21,3),(196,1,2),(196,4,2),(196,20,2),(196,21,3),(197,8,5),(197,20,3),(197,21,5),(198,4,4),(198,8,5),(198,20,4),(199,1,4),(199,8,5),(199,21,3),(200,1,5),(200,8,5),(200,9,5),(201,8,3),(201,20,3),(202,8,3),(202,20,4),(202,21,4),(203,4,3),(203,21,4),(204,4,5),(204,17,5),(204,20,4),(204,21,5),(205,8,4),(206,8,2),(207,1,4),(207,8,3),(207,20,2),(207,31,4),(209,17,4),(212,20,4),(213,20,4),(214,20,4),(215,20,4),(216,20,4),(217,8,5),(217,20,4),(217,31,4),(218,8,4),(218,20,3),(219,8,5),(219,20,4),(220,20,4),(221,8,4),(221,9,4),(221,20,5),(223,4,4),(223,20,4),(224,20,3),(225,20,3),(226,8,4),(226,20,5),(227,20,4),(228,20,4),(229,20,2),(235,31,4),(238,31,4),(239,31,4),(240,31,4),(247,8,2),(248,8,3),(249,8,4),(249,31,5),(250,8,4),(250,9,4),(251,8,4),(251,31,4),(252,8,3),(252,9,4),(253,8,3),(253,31,5),(254,8,3),(255,31,4),(256,8,2),(256,31,4),(259,1,3),(259,31,3),(264,31,5),(265,31,3),(266,31,5),(268,31,4),(271,31,3),(274,31,4),(275,31,4),(276,31,5),(277,31,3),(279,31,5),(280,31,4),(281,31,3),(282,31,5),(284,31,5),(287,31,4);
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
) ENGINE=InnoDB AUTO_INCREMENT=1595 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route_new_to_user`
--

LOCK TABLES `route_new_to_user` WRITE;
/*!40000 ALTER TABLE `route_new_to_user` DISABLE KEYS */;
INSERT INTO `route_new_to_user` VALUES (2,2,11,3,207),(3,2,11,4,207),(4,2,11,6,207),(5,2,11,7,207),(8,2,11,10,207),(9,2,11,13,207),(10,2,11,14,207),(11,2,11,15,207),(12,2,11,16,207),(13,2,11,17,207),(15,2,11,21,207),(16,2,11,24,207),(17,2,11,25,207),(18,2,21,1,208),(19,2,21,3,208),(20,2,21,4,208),(21,2,21,6,208),(22,2,21,7,208),(23,2,21,8,208),(25,2,21,10,208),(26,2,21,13,208),(27,2,21,14,208),(28,2,21,15,208),(29,2,21,16,208),(30,2,21,17,208),(32,2,21,21,208),(33,2,21,24,208),(34,2,21,25,208),(35,2,21,1,209),(36,2,21,3,209),(37,2,21,4,209),(38,2,21,6,209),(39,2,21,7,209),(42,2,21,10,209),(43,2,21,13,209),(44,2,21,14,209),(45,2,21,15,209),(46,2,21,16,209),(49,2,21,21,209),(50,2,21,24,209),(51,2,21,25,209),(52,2,22,1,210),(53,2,22,3,210),(54,2,22,4,210),(55,2,22,6,210),(56,2,22,7,210),(57,2,22,8,210),(58,2,22,9,210),(59,2,22,10,210),(60,2,22,13,210),(61,2,22,14,210),(62,2,22,15,210),(63,2,22,16,210),(64,2,22,17,210),(65,2,22,20,210),(66,2,22,21,210),(67,2,22,24,210),(68,2,22,25,210),(69,2,25,1,211),(70,2,25,3,211),(71,2,25,4,211),(72,2,25,6,211),(73,2,25,7,211),(74,2,25,8,211),(75,2,25,9,211),(76,2,25,10,211),(77,2,25,13,211),(78,2,25,14,211),(79,2,25,15,211),(80,2,25,16,211),(81,2,25,17,211),(82,2,25,20,211),(83,2,25,21,211),(84,2,25,24,211),(85,2,25,25,211),(86,2,22,1,212),(87,2,22,3,212),(88,2,22,4,212),(89,2,22,6,212),(90,2,22,7,212),(91,2,22,8,212),(92,2,22,9,212),(93,2,22,10,212),(94,2,22,13,212),(95,2,22,14,212),(96,2,22,15,212),(97,2,22,16,212),(98,2,22,17,212),(100,2,22,21,212),(101,2,22,24,212),(102,2,22,25,212),(103,2,22,1,213),(104,2,22,3,213),(105,2,22,4,213),(106,2,22,6,213),(107,2,22,7,213),(108,2,22,8,213),(109,2,22,9,213),(110,2,22,10,213),(111,2,22,13,213),(112,2,22,14,213),(113,2,22,15,213),(114,2,22,16,213),(115,2,22,17,213),(117,2,22,21,213),(118,2,22,24,213),(119,2,22,25,213),(120,2,22,1,214),(121,2,22,3,214),(123,2,22,6,214),(124,2,22,7,214),(125,2,22,8,214),(126,2,22,9,214),(127,2,22,10,214),(128,2,22,13,214),(129,2,22,14,214),(130,2,22,15,214),(131,2,22,16,214),(132,2,22,17,214),(134,2,22,21,214),(135,2,22,24,214),(136,2,22,25,214),(137,2,5,1,215),(138,2,5,3,215),(139,2,5,4,215),(140,2,5,6,215),(141,2,5,7,215),(142,2,5,8,215),(144,2,5,10,215),(145,2,5,13,215),(146,2,5,14,215),(147,2,5,15,215),(148,2,5,16,215),(149,2,5,17,215),(151,2,5,21,215),(152,2,5,24,215),(153,2,5,25,215),(154,2,5,27,215),(155,2,5,1,216),(156,2,5,3,216),(158,2,5,6,216),(159,2,5,7,216),(160,2,5,8,216),(162,2,5,10,216),(163,2,5,13,216),(164,2,5,14,216),(165,2,5,15,216),(166,2,5,16,216),(167,2,5,17,216),(169,2,5,21,216),(170,2,5,24,216),(171,2,5,25,216),(172,2,5,27,216),(173,2,5,1,217),(174,2,5,3,217),(175,2,5,4,217),(176,2,5,6,217),(177,2,5,7,217),(180,2,5,10,217),(181,2,5,13,217),(182,2,5,14,217),(183,2,5,15,217),(184,2,5,16,217),(185,2,5,17,217),(187,2,5,21,217),(188,2,5,24,217),(189,2,5,25,217),(190,2,5,27,217),(191,2,5,1,218),(192,2,5,3,218),(193,2,5,4,218),(194,2,5,6,218),(195,2,5,7,218),(198,2,5,10,218),(199,2,5,13,218),(200,2,5,14,218),(201,2,5,15,218),(202,2,5,16,218),(203,2,5,17,218),(205,2,5,21,218),(206,2,5,24,218),(207,2,5,25,218),(208,2,5,27,218),(209,2,5,1,219),(210,2,5,3,219),(212,2,5,6,219),(213,2,5,7,219),(216,2,5,10,219),(217,2,5,13,219),(218,2,5,14,219),(219,2,5,15,219),(220,2,5,16,219),(221,2,5,17,219),(223,2,5,21,219),(224,2,5,24,219),(225,2,5,25,219),(226,2,5,27,219),(227,2,5,1,220),(228,2,5,3,220),(229,2,5,4,220),(230,2,5,6,220),(231,2,5,7,220),(234,2,5,10,220),(235,2,5,13,220),(236,2,5,14,220),(237,2,5,15,220),(238,2,5,16,220),(239,2,5,17,220),(241,2,5,21,220),(242,2,5,24,220),(243,2,5,25,220),(244,2,5,27,220),(245,2,5,1,221),(246,2,5,3,221),(248,2,5,6,221),(249,2,5,7,221),(252,2,5,10,221),(253,2,5,13,221),(254,2,5,14,221),(255,2,5,15,221),(256,2,5,16,221),(257,2,5,17,221),(259,2,5,21,221),(260,2,5,24,221),(261,2,5,25,221),(262,2,5,27,221),(263,2,5,1,222),(264,2,5,3,222),(265,2,5,4,222),(266,2,5,6,222),(267,2,5,7,222),(268,2,5,8,222),(270,2,5,10,222),(271,2,5,13,222),(272,2,5,14,222),(273,2,5,15,222),(274,2,5,16,222),(275,2,5,17,222),(277,2,5,21,222),(278,2,5,24,222),(279,2,5,25,222),(280,2,5,27,222),(281,2,5,1,223),(282,2,5,3,223),(284,2,5,6,223),(285,2,5,7,223),(286,2,5,8,223),(288,2,5,10,223),(289,2,5,13,223),(290,2,5,14,223),(291,2,5,15,223),(292,2,5,16,223),(293,2,5,17,223),(295,2,5,21,223),(296,2,5,24,223),(297,2,5,25,223),(298,2,5,27,223),(299,2,5,1,224),(300,2,5,3,224),(302,2,5,6,224),(303,2,5,7,224),(304,2,5,8,224),(306,2,5,10,224),(307,2,5,13,224),(308,2,5,14,224),(309,2,5,15,224),(310,2,5,16,224),(311,2,5,17,224),(313,2,5,21,224),(314,2,5,24,224),(315,2,5,25,224),(316,2,5,27,224),(317,2,5,1,225),(318,2,5,3,225),(319,2,5,4,225),(320,2,5,6,225),(321,2,5,7,225),(322,2,5,8,225),(324,2,5,10,225),(325,2,5,13,225),(326,2,5,14,225),(327,2,5,15,225),(328,2,5,16,225),(329,2,5,17,225),(331,2,5,21,225),(332,2,5,24,225),(333,2,5,25,225),(334,2,5,27,225),(335,2,25,1,226),(336,2,25,3,226),(337,2,25,4,226),(338,2,25,6,226),(339,2,25,7,226),(342,2,25,10,226),(343,2,25,13,226),(344,2,25,14,226),(345,2,25,15,226),(346,2,25,16,226),(347,2,25,17,226),(349,2,25,21,226),(350,2,25,24,226),(351,2,25,25,226),(352,2,25,27,226),(353,2,25,1,227),(354,2,25,3,227),(355,2,25,4,227),(356,2,25,6,227),(357,2,25,7,227),(358,2,25,8,227),(360,2,25,10,227),(361,2,25,13,227),(362,2,25,14,227),(363,2,25,15,227),(364,2,25,16,227),(365,2,25,17,227),(367,2,25,21,227),(368,2,25,24,227),(369,2,25,25,227),(370,2,25,27,227),(371,2,25,1,228),(372,2,25,3,228),(373,2,25,4,228),(374,2,25,6,228),(375,2,25,7,228),(376,2,25,8,228),(378,2,25,10,228),(379,2,25,13,228),(380,2,25,14,228),(381,2,25,15,228),(382,2,25,16,228),(383,2,25,17,228),(385,2,25,21,228),(386,2,25,24,228),(387,2,25,25,228),(388,2,25,27,228),(389,2,26,1,229),(390,2,26,3,229),(391,2,26,4,229),(392,2,26,6,229),(393,2,26,7,229),(394,2,26,8,229),(396,2,26,10,229),(397,2,26,13,229),(398,2,26,14,229),(399,2,26,15,229),(400,2,26,16,229),(401,2,26,17,229),(403,2,26,21,229),(404,2,26,24,229),(405,2,26,25,229),(406,2,26,27,229),(407,2,4,1,230),(408,2,4,3,230),(409,2,4,4,230),(410,2,4,6,230),(411,2,4,7,230),(412,2,4,8,230),(413,2,4,9,230),(414,2,4,10,230),(415,2,4,13,230),(416,2,4,14,230),(417,2,4,15,230),(418,2,4,16,230),(419,2,4,17,230),(420,2,4,20,230),(421,2,4,21,230),(422,2,4,24,230),(423,2,4,25,230),(424,2,4,27,230),(425,2,4,29,230),(426,2,4,1,231),(427,2,4,3,231),(428,2,4,4,231),(429,2,4,6,231),(430,2,4,7,231),(431,2,4,8,231),(433,2,4,10,231),(434,2,4,13,231),(435,2,4,14,231),(436,2,4,15,231),(437,2,4,16,231),(438,2,4,17,231),(439,2,4,20,231),(440,2,4,21,231),(441,2,4,24,231),(442,2,4,25,231),(443,2,4,27,231),(444,2,4,29,231),(445,2,4,1,232),(446,2,4,3,232),(448,2,4,6,232),(449,2,4,7,232),(450,2,4,8,232),(452,2,4,10,232),(453,2,4,13,232),(454,2,4,14,232),(455,2,4,15,232),(456,2,4,16,232),(457,2,4,17,232),(458,2,4,20,232),(459,2,4,21,232),(460,2,4,24,232),(461,2,4,25,232),(462,2,4,27,232),(463,2,4,29,232),(464,2,4,1,233),(465,2,4,3,233),(466,2,4,4,233),(467,2,4,6,233),(468,2,4,7,233),(469,2,4,8,233),(471,2,4,10,233),(472,2,4,13,233),(473,2,4,14,233),(474,2,4,15,233),(475,2,4,16,233),(476,2,4,17,233),(477,2,4,20,233),(478,2,4,21,233),(479,2,4,24,233),(480,2,4,25,233),(481,2,4,27,233),(482,2,4,29,233),(483,2,4,1,234),(484,2,4,3,234),(485,2,4,4,234),(486,2,4,6,234),(487,2,4,7,234),(488,2,4,8,234),(490,2,4,10,234),(491,2,4,13,234),(492,2,4,14,234),(493,2,4,15,234),(494,2,4,16,234),(495,2,4,17,234),(496,2,4,20,234),(497,2,4,21,234),(498,2,4,24,234),(499,2,4,25,234),(500,2,4,27,234),(501,2,4,29,234),(502,2,4,1,235),(503,2,4,3,235),(504,2,4,4,235),(505,2,4,6,235),(506,2,4,7,235),(507,2,4,8,235),(509,2,4,10,235),(510,2,4,13,235),(511,2,4,14,235),(512,2,4,15,235),(513,2,4,16,235),(514,2,4,17,235),(515,2,4,20,235),(516,2,4,21,235),(517,2,4,24,235),(518,2,4,25,235),(519,2,4,27,235),(520,2,4,29,235),(521,2,4,1,236),(522,2,4,3,236),(523,2,4,4,236),(524,2,4,6,236),(525,2,4,7,236),(526,2,4,8,236),(528,2,4,10,236),(529,2,4,13,236),(530,2,4,14,236),(531,2,4,15,236),(532,2,4,16,236),(533,2,4,17,236),(534,2,4,20,236),(535,2,4,21,236),(536,2,4,24,236),(537,2,4,25,236),(538,2,4,27,236),(539,2,4,29,236),(540,2,4,1,237),(541,2,4,3,237),(542,2,4,4,237),(543,2,4,6,237),(544,2,4,7,237),(545,2,4,8,237),(547,2,4,10,237),(548,2,4,13,237),(549,2,4,14,237),(550,2,4,15,237),(551,2,4,16,237),(552,2,4,17,237),(553,2,4,20,237),(554,2,4,21,237),(555,2,4,24,237),(556,2,4,25,237),(557,2,4,27,237),(558,2,4,29,237),(559,2,4,1,238),(560,2,4,3,238),(562,2,4,6,238),(563,2,4,7,238),(564,2,4,8,238),(566,2,4,10,238),(567,2,4,13,238),(568,2,4,14,238),(569,2,4,15,238),(570,2,4,16,238),(571,2,4,17,238),(572,2,4,20,238),(573,2,4,21,238),(574,2,4,24,238),(575,2,4,25,238),(576,2,4,27,238),(577,2,4,29,238),(578,2,4,1,239),(579,2,4,3,239),(580,2,4,4,239),(581,2,4,6,239),(582,2,4,7,239),(583,2,4,8,239),(585,2,4,10,239),(586,2,4,13,239),(587,2,4,14,239),(588,2,4,15,239),(589,2,4,16,239),(590,2,4,17,239),(591,2,4,20,239),(592,2,4,21,239),(593,2,4,24,239),(594,2,4,25,239),(595,2,4,27,239),(596,2,4,29,239),(597,2,4,1,240),(598,2,4,3,240),(599,2,4,4,240),(600,2,4,6,240),(601,2,4,7,240),(602,2,4,8,240),(604,2,4,10,240),(605,2,4,13,240),(606,2,4,14,240),(607,2,4,15,240),(608,2,4,16,240),(609,2,4,17,240),(610,2,4,20,240),(611,2,4,21,240),(612,2,4,24,240),(613,2,4,25,240),(614,2,4,27,240),(615,2,4,29,240),(616,2,4,1,241),(617,2,4,3,241),(618,2,4,4,241),(619,2,4,6,241),(620,2,4,7,241),(621,2,4,8,241),(623,2,4,10,241),(624,2,4,13,241),(625,2,4,14,241),(626,2,4,15,241),(627,2,4,16,241),(628,2,4,17,241),(629,2,4,20,241),(630,2,4,21,241),(631,2,4,24,241),(632,2,4,25,241),(633,2,4,27,241),(634,2,4,29,241),(635,2,4,1,242),(636,2,4,3,242),(637,2,4,4,242),(638,2,4,6,242),(639,2,4,7,242),(640,2,4,8,242),(642,2,4,10,242),(643,2,4,13,242),(644,2,4,14,242),(645,2,4,15,242),(646,2,4,16,242),(647,2,4,17,242),(648,2,4,20,242),(649,2,4,21,242),(650,2,4,24,242),(651,2,4,25,242),(652,2,4,27,242),(653,2,4,29,242),(654,2,4,1,243),(655,2,4,3,243),(656,2,4,4,243),(657,2,4,6,243),(658,2,4,7,243),(659,2,4,8,243),(661,2,4,10,243),(662,2,4,13,243),(663,2,4,14,243),(664,2,4,15,243),(665,2,4,16,243),(666,2,4,17,243),(667,2,4,20,243),(668,2,4,21,243),(669,2,4,24,243),(670,2,4,25,243),(671,2,4,27,243),(672,2,4,29,243),(673,2,40,1,244),(674,2,40,3,244),(675,2,40,4,244),(676,2,40,6,244),(677,2,40,7,244),(678,2,40,8,244),(680,2,40,10,244),(681,2,40,13,244),(682,2,40,14,244),(683,2,40,15,244),(684,2,40,16,244),(685,2,40,17,244),(686,2,40,20,244),(687,2,40,21,244),(688,2,40,24,244),(689,2,40,25,244),(690,2,40,27,244),(691,2,40,29,244),(692,2,40,1,245),(693,2,40,3,245),(694,2,40,4,245),(695,2,40,6,245),(696,2,40,7,245),(697,2,40,8,245),(698,2,40,9,245),(699,2,40,10,245),(700,2,40,13,245),(701,2,40,14,245),(702,2,40,15,245),(703,2,40,16,245),(704,2,40,17,245),(705,2,40,20,245),(706,2,40,21,245),(707,2,40,24,245),(708,2,40,25,245),(709,2,40,27,245),(710,2,40,29,245),(711,2,11,1,246),(712,2,11,3,246),(713,2,11,4,246),(714,2,11,6,246),(715,2,11,7,246),(718,2,11,10,246),(719,2,11,13,246),(720,2,11,14,246),(721,2,11,15,246),(722,2,11,16,246),(723,2,11,17,246),(724,2,11,20,246),(725,2,11,21,246),(726,2,11,24,246),(727,2,11,25,246),(728,2,11,27,246),(729,2,11,29,246),(731,2,11,3,247),(732,2,11,4,247),(733,2,11,6,247),(734,2,11,7,247),(737,2,11,10,247),(738,2,11,13,247),(739,2,11,14,247),(740,2,11,15,247),(741,2,11,16,247),(742,2,11,17,247),(743,2,11,20,247),(744,2,11,21,247),(745,2,11,24,247),(746,2,11,25,247),(747,2,11,27,247),(748,2,11,29,247),(749,2,11,1,248),(750,2,11,3,248),(751,2,11,4,248),(752,2,11,6,248),(753,2,11,7,248),(756,2,11,10,248),(757,2,11,13,248),(758,2,11,14,248),(759,2,11,15,248),(760,2,11,16,248),(761,2,11,17,248),(762,2,11,20,248),(763,2,11,21,248),(764,2,11,24,248),(765,2,11,25,248),(766,2,11,27,248),(767,2,11,29,248),(768,2,3,1,249),(769,2,3,3,249),(771,2,3,6,249),(772,2,3,7,249),(775,2,3,10,249),(776,2,3,13,249),(777,2,3,14,249),(778,2,3,15,249),(779,2,3,16,249),(780,2,3,17,249),(781,2,3,20,249),(782,2,3,21,249),(783,2,3,24,249),(784,2,3,25,249),(785,2,3,27,249),(786,2,3,29,249),(787,2,3,1,250),(788,2,3,3,250),(789,2,3,4,250),(790,2,3,6,250),(791,2,3,7,250),(794,2,3,10,250),(795,2,3,13,250),(796,2,3,14,250),(797,2,3,15,250),(798,2,3,16,250),(799,2,3,17,250),(800,2,3,20,250),(801,2,3,21,250),(802,2,3,24,250),(803,2,3,25,250),(804,2,3,27,250),(805,2,3,29,250),(806,2,3,1,251),(807,2,3,3,251),(808,2,3,4,251),(809,2,3,6,251),(810,2,3,7,251),(813,2,3,10,251),(814,2,3,13,251),(815,2,3,14,251),(816,2,3,15,251),(817,2,3,16,251),(818,2,3,17,251),(819,2,3,20,251),(820,2,3,21,251),(821,2,3,24,251),(822,2,3,25,251),(823,2,3,27,251),(824,2,3,29,251),(825,2,3,1,252),(826,2,3,3,252),(827,2,3,4,252),(828,2,3,6,252),(829,2,3,7,252),(832,2,3,10,252),(833,2,3,13,252),(834,2,3,14,252),(835,2,3,15,252),(836,2,3,16,252),(837,2,3,17,252),(838,2,3,20,252),(839,2,3,21,252),(840,2,3,24,252),(841,2,3,25,252),(842,2,3,27,252),(843,2,3,29,252),(844,2,3,1,253),(845,2,3,3,253),(846,2,3,4,253),(847,2,3,6,253),(848,2,3,7,253),(851,2,3,10,253),(852,2,3,13,253),(853,2,3,14,253),(854,2,3,15,253),(855,2,3,16,253),(856,2,3,17,253),(857,2,3,20,253),(858,2,3,21,253),(859,2,3,24,253),(860,2,3,25,253),(861,2,3,27,253),(862,2,3,29,253),(863,2,3,1,254),(864,2,3,3,254),(865,2,3,4,254),(866,2,3,6,254),(867,2,3,7,254),(870,2,3,10,254),(871,2,3,13,254),(872,2,3,14,254),(873,2,3,15,254),(874,2,3,16,254),(875,2,3,17,254),(876,2,3,20,254),(877,2,3,21,254),(878,2,3,24,254),(879,2,3,25,254),(880,2,3,27,254),(881,2,3,29,254),(882,2,3,1,255),(883,2,3,3,255),(884,2,3,4,255),(885,2,3,6,255),(886,2,3,7,255),(887,2,3,8,255),(889,2,3,10,255),(890,2,3,13,255),(891,2,3,14,255),(892,2,3,15,255),(893,2,3,16,255),(894,2,3,17,255),(895,2,3,20,255),(896,2,3,21,255),(897,2,3,24,255),(898,2,3,25,255),(899,2,3,27,255),(900,2,3,29,255),(901,2,3,1,256),(902,2,3,3,256),(903,2,3,4,256),(904,2,3,6,256),(905,2,3,7,256),(908,2,3,10,256),(909,2,3,13,256),(910,2,3,14,256),(911,2,3,15,256),(912,2,3,16,256),(913,2,3,17,256),(914,2,3,20,256),(915,2,3,21,256),(916,2,3,24,256),(917,2,3,25,256),(918,2,3,27,256),(919,2,3,29,256),(920,2,3,1,257),(921,2,3,3,257),(922,2,3,4,257),(923,2,3,6,257),(924,2,3,7,257),(925,2,3,8,257),(927,2,3,10,257),(928,2,3,13,257),(929,2,3,14,257),(930,2,3,15,257),(931,2,3,16,257),(932,2,3,17,257),(933,2,3,20,257),(934,2,3,21,257),(935,2,3,24,257),(936,2,3,25,257),(937,2,3,27,257),(938,2,3,29,257),(939,2,3,1,258),(940,2,3,3,258),(941,2,3,4,258),(942,2,3,6,258),(943,2,3,7,258),(944,2,3,8,258),(946,2,3,10,258),(947,2,3,13,258),(948,2,3,14,258),(949,2,3,15,258),(950,2,3,16,258),(951,2,3,17,258),(952,2,3,20,258),(953,2,3,21,258),(954,2,3,24,258),(955,2,3,25,258),(956,2,3,27,258),(957,2,3,29,258),(959,2,3,3,259),(961,2,3,6,259),(962,2,3,7,259),(963,2,3,8,259),(965,2,3,10,259),(966,2,3,13,259),(967,2,3,14,259),(968,2,3,15,259),(969,2,3,16,259),(970,2,3,17,259),(971,2,3,20,259),(972,2,3,21,259),(973,2,3,24,259),(974,2,3,25,259),(975,2,3,27,259),(976,2,3,29,259),(977,2,11,1,260),(978,2,11,3,260),(979,2,11,4,260),(980,2,11,6,260),(981,2,11,7,260),(984,2,11,10,260),(985,2,11,13,260),(986,2,11,14,260),(987,2,11,15,260),(988,2,11,16,260),(989,2,11,17,260),(990,2,11,20,260),(991,2,11,21,260),(992,2,11,24,260),(993,2,11,25,260),(994,2,11,27,260),(995,2,11,29,260),(996,2,27,1,261),(997,2,27,3,261),(998,2,27,4,261),(999,2,27,6,261),(1000,2,27,7,261),(1001,2,27,8,261),(1002,2,27,9,261),(1003,2,27,10,261),(1004,2,27,13,261),(1005,2,27,14,261),(1006,2,27,15,261),(1007,2,27,16,261),(1008,2,27,17,261),(1009,2,27,20,261),(1010,2,27,21,261),(1011,2,27,24,261),(1012,2,27,25,261),(1013,2,27,27,261),(1014,2,27,29,261),(1015,2,26,1,262),(1016,2,26,3,262),(1017,2,26,4,262),(1018,2,26,6,262),(1019,2,26,7,262),(1020,2,26,8,262),(1021,2,26,9,262),(1022,2,26,10,262),(1023,2,26,13,262),(1024,2,26,14,262),(1025,2,26,15,262),(1026,2,26,16,262),(1027,2,26,17,262),(1028,2,26,20,262),(1029,2,26,21,262),(1030,2,26,24,262),(1031,2,26,25,262),(1032,2,26,27,262),(1033,2,26,29,262),(1034,2,27,1,263),(1035,2,27,3,263),(1036,2,27,4,263),(1037,2,27,6,263),(1038,2,27,7,263),(1039,2,27,8,263),(1040,2,27,9,263),(1041,2,27,10,263),(1042,2,27,13,263),(1043,2,27,14,263),(1044,2,27,15,263),(1045,2,27,16,263),(1046,2,27,17,263),(1047,2,27,20,263),(1048,2,27,21,263),(1049,2,27,24,263),(1050,2,27,25,263),(1051,2,27,27,263),(1052,2,27,29,263),(1053,2,27,31,263),(1054,2,27,32,263),(1055,2,1,1,264),(1056,2,1,3,264),(1057,2,1,4,264),(1058,2,1,6,264),(1059,2,1,7,264),(1060,2,1,8,264),(1062,2,1,10,264),(1063,2,1,13,264),(1064,2,1,14,264),(1065,2,1,15,264),(1066,2,1,16,264),(1067,2,1,17,264),(1068,2,1,20,264),(1069,2,1,21,264),(1070,2,1,24,264),(1071,2,1,25,264),(1072,2,1,27,264),(1073,2,1,29,264),(1075,2,1,32,264),(1076,2,1,1,265),(1077,2,1,3,265),(1078,2,1,4,265),(1079,2,1,6,265),(1080,2,1,7,265),(1081,2,1,8,265),(1083,2,1,10,265),(1084,2,1,13,265),(1085,2,1,14,265),(1086,2,1,15,265),(1087,2,1,16,265),(1088,2,1,17,265),(1089,2,1,20,265),(1090,2,1,21,265),(1091,2,1,24,265),(1092,2,1,25,265),(1093,2,1,27,265),(1094,2,1,29,265),(1096,2,1,32,265),(1097,2,1,1,266),(1098,2,1,3,266),(1099,2,1,4,266),(1100,2,1,6,266),(1101,2,1,7,266),(1102,2,1,8,266),(1104,2,1,10,266),(1105,2,1,13,266),(1106,2,1,14,266),(1107,2,1,15,266),(1108,2,1,16,266),(1109,2,1,17,266),(1110,2,1,20,266),(1111,2,1,21,266),(1112,2,1,24,266),(1113,2,1,25,266),(1114,2,1,27,266),(1115,2,1,29,266),(1117,2,1,32,266),(1118,2,1,1,267),(1119,2,1,3,267),(1120,2,1,4,267),(1121,2,1,6,267),(1122,2,1,7,267),(1123,2,1,8,267),(1125,2,1,10,267),(1126,2,1,13,267),(1127,2,1,14,267),(1128,2,1,15,267),(1129,2,1,16,267),(1130,2,1,17,267),(1131,2,1,20,267),(1132,2,1,21,267),(1133,2,1,24,267),(1134,2,1,25,267),(1135,2,1,27,267),(1136,2,1,29,267),(1137,2,1,31,267),(1138,2,1,32,267),(1139,2,1,1,268),(1140,2,1,3,268),(1141,2,1,4,268),(1142,2,1,6,268),(1143,2,1,7,268),(1144,2,1,8,268),(1146,2,1,10,268),(1147,2,1,13,268),(1148,2,1,14,268),(1149,2,1,15,268),(1150,2,1,16,268),(1151,2,1,17,268),(1152,2,1,20,268),(1153,2,1,21,268),(1154,2,1,24,268),(1155,2,1,25,268),(1156,2,1,27,268),(1157,2,1,29,268),(1159,2,1,32,268),(1160,2,1,1,269),(1161,2,1,3,269),(1162,2,1,4,269),(1163,2,1,6,269),(1164,2,1,7,269),(1165,2,1,8,269),(1167,2,1,10,269),(1168,2,1,13,269),(1169,2,1,14,269),(1170,2,1,15,269),(1171,2,1,16,269),(1172,2,1,17,269),(1173,2,1,20,269),(1174,2,1,21,269),(1175,2,1,24,269),(1176,2,1,25,269),(1177,2,1,27,269),(1178,2,1,29,269),(1179,2,1,31,269),(1180,2,1,32,269),(1181,2,1,1,270),(1182,2,1,3,270),(1183,2,1,4,270),(1184,2,1,6,270),(1185,2,1,7,270),(1186,2,1,8,270),(1188,2,1,10,270),(1189,2,1,13,270),(1190,2,1,14,270),(1191,2,1,15,270),(1192,2,1,16,270),(1193,2,1,17,270),(1194,2,1,20,270),(1195,2,1,21,270),(1196,2,1,24,270),(1197,2,1,25,270),(1198,2,1,27,270),(1199,2,1,29,270),(1200,2,1,31,270),(1201,2,1,32,270),(1202,2,1,1,271),(1203,2,1,3,271),(1204,2,1,4,271),(1205,2,1,6,271),(1206,2,1,7,271),(1207,2,1,8,271),(1209,2,1,10,271),(1210,2,1,13,271),(1211,2,1,14,271),(1212,2,1,15,271),(1213,2,1,16,271),(1214,2,1,17,271),(1215,2,1,20,271),(1216,2,1,21,271),(1217,2,1,24,271),(1218,2,1,25,271),(1219,2,1,27,271),(1220,2,1,29,271),(1222,2,1,32,271),(1223,2,1,1,272),(1224,2,1,3,272),(1225,2,1,4,272),(1226,2,1,6,272),(1227,2,1,7,272),(1228,2,1,8,272),(1230,2,1,10,272),(1231,2,1,13,272),(1232,2,1,14,272),(1233,2,1,15,272),(1234,2,1,16,272),(1235,2,1,17,272),(1236,2,1,20,272),(1237,2,1,21,272),(1238,2,1,24,272),(1239,2,1,25,272),(1240,2,1,27,272),(1241,2,1,29,272),(1242,2,1,31,272),(1243,2,1,32,272),(1244,2,1,1,273),(1245,2,1,3,273),(1246,2,1,4,273),(1247,2,1,6,273),(1248,2,1,7,273),(1249,2,1,8,273),(1251,2,1,10,273),(1252,2,1,13,273),(1253,2,1,14,273),(1254,2,1,15,273),(1255,2,1,16,273),(1256,2,1,17,273),(1257,2,1,20,273),(1258,2,1,21,273),(1259,2,1,24,273),(1260,2,1,25,273),(1261,2,1,27,273),(1262,2,1,29,273),(1263,2,1,31,273),(1264,2,1,32,273),(1266,2,1,3,274),(1267,2,1,4,274),(1268,2,1,6,274),(1269,2,1,7,274),(1270,2,1,8,274),(1272,2,1,10,274),(1273,2,1,13,274),(1274,2,1,14,274),(1275,2,1,15,274),(1276,2,1,16,274),(1277,2,1,17,274),(1278,2,1,20,274),(1279,2,1,21,274),(1280,2,1,24,274),(1281,2,1,25,274),(1282,2,1,27,274),(1283,2,1,29,274),(1285,2,1,32,274),(1286,2,2,1,275),(1287,2,2,3,275),(1288,2,2,4,275),(1289,2,2,6,275),(1290,2,2,7,275),(1291,2,2,8,275),(1293,2,2,10,275),(1294,2,2,13,275),(1295,2,2,14,275),(1296,2,2,15,275),(1297,2,2,16,275),(1298,2,2,17,275),(1299,2,2,20,275),(1300,2,2,21,275),(1301,2,2,24,275),(1302,2,2,25,275),(1303,2,2,27,275),(1304,2,2,29,275),(1306,2,2,32,275),(1307,2,2,33,275),(1308,2,2,1,276),(1309,2,2,3,276),(1310,2,2,4,276),(1311,2,2,6,276),(1312,2,2,7,276),(1313,2,2,8,276),(1315,2,2,10,276),(1316,2,2,13,276),(1317,2,2,14,276),(1318,2,2,15,276),(1319,2,2,16,276),(1320,2,2,17,276),(1321,2,2,20,276),(1322,2,2,21,276),(1323,2,2,24,276),(1324,2,2,25,276),(1325,2,2,27,276),(1326,2,2,29,276),(1328,2,2,32,276),(1329,2,2,33,276),(1330,2,2,1,277),(1331,2,2,3,277),(1332,2,2,4,277),(1333,2,2,6,277),(1334,2,2,7,277),(1335,2,2,8,277),(1337,2,2,10,277),(1338,2,2,13,277),(1339,2,2,14,277),(1340,2,2,15,277),(1341,2,2,16,277),(1342,2,2,17,277),(1343,2,2,20,277),(1344,2,2,21,277),(1345,2,2,24,277),(1346,2,2,25,277),(1347,2,2,27,277),(1348,2,2,29,277),(1350,2,2,32,277),(1351,2,2,33,277),(1352,2,2,1,278),(1353,2,2,3,278),(1354,2,2,4,278),(1355,2,2,6,278),(1356,2,2,7,278),(1357,2,2,8,278),(1359,2,2,10,278),(1360,2,2,13,278),(1361,2,2,14,278),(1362,2,2,15,278),(1363,2,2,16,278),(1364,2,2,17,278),(1365,2,2,20,278),(1366,2,2,21,278),(1367,2,2,24,278),(1368,2,2,25,278),(1369,2,2,27,278),(1370,2,2,29,278),(1371,2,2,31,278),(1372,2,2,32,278),(1373,2,2,33,278),(1374,2,2,1,279),(1375,2,2,3,279),(1376,2,2,4,279),(1377,2,2,6,279),(1378,2,2,7,279),(1379,2,2,8,279),(1381,2,2,10,279),(1382,2,2,13,279),(1383,2,2,14,279),(1384,2,2,15,279),(1385,2,2,16,279),(1386,2,2,17,279),(1387,2,2,20,279),(1388,2,2,21,279),(1389,2,2,24,279),(1390,2,2,25,279),(1391,2,2,27,279),(1392,2,2,29,279),(1394,2,2,32,279),(1395,2,2,33,279),(1396,2,2,1,280),(1397,2,2,3,280),(1398,2,2,4,280),(1399,2,2,6,280),(1400,2,2,7,280),(1401,2,2,8,280),(1403,2,2,10,280),(1404,2,2,13,280),(1405,2,2,14,280),(1406,2,2,15,280),(1407,2,2,16,280),(1408,2,2,17,280),(1409,2,2,20,280),(1410,2,2,21,280),(1411,2,2,24,280),(1412,2,2,25,280),(1413,2,2,27,280),(1414,2,2,29,280),(1416,2,2,32,280),(1417,2,2,33,280),(1418,2,2,1,281),(1419,2,2,3,281),(1420,2,2,4,281),(1421,2,2,6,281),(1422,2,2,7,281),(1423,2,2,8,281),(1425,2,2,10,281),(1426,2,2,13,281),(1427,2,2,14,281),(1428,2,2,15,281),(1429,2,2,16,281),(1430,2,2,17,281),(1431,2,2,20,281),(1432,2,2,21,281),(1433,2,2,24,281),(1434,2,2,25,281),(1435,2,2,27,281),(1436,2,2,29,281),(1438,2,2,32,281),(1439,2,2,33,281),(1441,2,2,3,282),(1442,2,2,4,282),(1443,2,2,6,282),(1444,2,2,7,282),(1445,2,2,8,282),(1447,2,2,10,282),(1448,2,2,13,282),(1449,2,2,14,282),(1450,2,2,15,282),(1451,2,2,16,282),(1452,2,2,17,282),(1453,2,2,20,282),(1454,2,2,21,282),(1455,2,2,24,282),(1456,2,2,25,282),(1457,2,2,27,282),(1458,2,2,29,282),(1460,2,2,32,282),(1461,2,2,33,282),(1462,2,2,1,283),(1463,2,2,3,283),(1464,2,2,4,283),(1465,2,2,6,283),(1466,2,2,7,283),(1467,2,2,8,283),(1469,2,2,10,283),(1470,2,2,13,283),(1471,2,2,14,283),(1472,2,2,15,283),(1473,2,2,16,283),(1474,2,2,17,283),(1475,2,2,20,283),(1476,2,2,21,283),(1477,2,2,24,283),(1478,2,2,25,283),(1479,2,2,27,283),(1480,2,2,29,283),(1481,2,2,31,283),(1482,2,2,32,283),(1483,2,2,33,283),(1484,2,2,1,284),(1485,2,2,3,284),(1486,2,2,4,284),(1487,2,2,6,284),(1488,2,2,7,284),(1489,2,2,8,284),(1491,2,2,10,284),(1492,2,2,13,284),(1493,2,2,14,284),(1494,2,2,15,284),(1495,2,2,16,284),(1496,2,2,17,284),(1497,2,2,20,284),(1498,2,2,21,284),(1499,2,2,24,284),(1500,2,2,25,284),(1501,2,2,27,284),(1502,2,2,29,284),(1504,2,2,32,284),(1505,2,2,33,284),(1506,2,2,1,285),(1507,2,2,3,285),(1508,2,2,4,285),(1509,2,2,6,285),(1510,2,2,7,285),(1511,2,2,8,285),(1513,2,2,10,285),(1514,2,2,13,285),(1515,2,2,14,285),(1516,2,2,15,285),(1517,2,2,16,285),(1518,2,2,17,285),(1519,2,2,20,285),(1520,2,2,21,285),(1521,2,2,24,285),(1522,2,2,25,285),(1523,2,2,27,285),(1524,2,2,29,285),(1526,2,2,32,285),(1527,2,2,33,285),(1528,2,29,1,286),(1529,2,29,3,286),(1530,2,29,4,286),(1531,2,29,6,286),(1532,2,29,7,286),(1533,2,29,8,286),(1534,2,29,9,286),(1535,2,29,10,286),(1536,2,29,13,286),(1537,2,29,14,286),(1538,2,29,15,286),(1539,2,29,16,286),(1540,2,29,17,286),(1541,2,29,20,286),(1542,2,29,21,286),(1543,2,29,24,286),(1544,2,29,25,286),(1545,2,29,27,286),(1546,2,29,29,286),(1547,2,29,31,286),(1548,2,29,32,286),(1549,2,29,33,286),(1550,2,11,1,287),(1551,2,11,3,287),(1552,2,11,4,287),(1553,2,11,6,287),(1554,2,11,7,287),(1555,2,11,8,287),(1557,2,11,10,287),(1558,2,11,13,287),(1559,2,11,14,287),(1560,2,11,15,287),(1561,2,11,16,287),(1562,2,11,17,287),(1563,2,11,20,287),(1564,2,11,21,287),(1565,2,11,24,287),(1566,2,11,25,287),(1567,2,11,27,287),(1568,2,11,29,287),(1570,2,11,32,287),(1571,2,11,33,287),(1572,2,2,1,288),(1573,2,2,3,288),(1574,2,2,4,288),(1575,2,2,6,288),(1576,2,2,7,288),(1577,2,2,8,288),(1579,2,2,10,288),(1580,2,2,13,288),(1581,2,2,14,288),(1582,2,2,15,288),(1583,2,2,16,288),(1584,2,2,17,288),(1585,2,2,20,288),(1586,2,2,21,288),(1587,2,2,24,288),(1588,2,2,25,288),(1589,2,2,27,288),(1590,2,2,29,288),(1591,2,2,31,288),(1592,2,2,32,288),(1593,2,2,33,288),(1594,2,2,36,288);
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
  `type` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `boulder_grade_id` (`boulder_grade_id`),
  KEY `setter_id` (`setter_id`),
  KEY `color_id` (`color_id`),
  KEY `wall_id` (`wall_id`),
  KEY `lead_grade_id` (`lead_grade_id`),
  KEY `toprope_grade_id` (`toprope_grade_id`),
  CONSTRAINT `routes_ibfk_2` FOREIGN KEY (`boulder_grade_id`) REFERENCES `boulder_grades` (`id`) ON DELETE CASCADE,
  CONSTRAINT `routes_ibfk_4` FOREIGN KEY (`setter_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `routes_ibfk_5` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`) ON DELETE CASCADE,
  CONSTRAINT `routes_ibfk_6` FOREIGN KEY (`wall_id`) REFERENCES `walls` (`id`) ON DELETE CASCADE,
  CONSTRAINT `routes_ibfk_7` FOREIGN KEY (`lead_grade_id`) REFERENCES `rope_grades` (`id`) ON DELETE SET NULL,
  CONSTRAINT `routes_ibfk_8` FOREIGN KEY (`lead_grade_id`) REFERENCES `rope_grades` (`id`) ON DELETE SET NULL,
  CONSTRAINT `routes_ibfk_9` FOREIGN KEY (`toprope_grade_id`) REFERENCES `rope_grades` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=289 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routes`
--

LOCK TABLES `routes` WRITE;
/*!40000 ALTER TABLE `routes` DISABLE KEYS */;
INSERT INTO `routes` VALUES (13,'',NULL,NULL,13,3,'','2014-12-16 21:59:12',1,11,5,2),(14,'',NULL,NULL,9,3,'','2014-12-16 21:59:32',1,11,5,2),(15,'',NULL,NULL,10,8,'','2014-12-16 21:59:40',1,11,7,2),(16,'',NULL,NULL,3,6,'','2014-12-16 21:59:48',1,11,5,2),(17,'',NULL,NULL,11,6,'','2014-12-16 21:59:56',1,11,7,2),(18,'',NULL,NULL,15,3,'','2014-12-16 22:00:02',1,11,3,2),(19,'',NULL,NULL,3,3,'','2014-12-16 22:00:10',1,11,3,2),(20,'',NULL,NULL,8,6,'','2014-12-16 22:00:16',1,11,6,2),(21,'',NULL,NULL,10,3,'','2014-12-16 22:00:22',1,11,6,2),(22,'',NULL,NULL,11,8,'','2014-12-16 22:00:29',1,11,4,2),(23,'',NULL,NULL,13,3,'','2014-12-16 22:00:41',1,11,3,2),(24,'',NULL,NULL,9,3,'','2014-12-16 22:00:48',1,11,7,2),(25,'',NULL,NULL,1,3,'','2014-12-16 22:01:02',1,11,4,2),(67,'',6,NULL,3,3,'','2014-12-16 22:09:27',0,5,NULL,0),(68,'',9,NULL,7,8,'','2014-12-16 22:09:36',0,5,NULL,0),(69,'',8,NULL,1,3,'','2014-12-16 22:09:40',0,5,NULL,0),(70,'',3,NULL,8,3,'','2014-12-16 22:09:45',0,5,NULL,0),(71,'',4,NULL,15,3,'','2014-12-16 22:09:52',0,5,NULL,0),(72,'',6,NULL,16,3,'','2014-12-16 22:10:02',0,5,NULL,0),(73,'',2,NULL,12,3,'','2014-12-16 22:10:09',0,5,NULL,0),(74,'',5,NULL,9,3,'','2014-12-16 22:10:14',0,5,NULL,0),(75,'',7,NULL,13,3,'','2014-12-16 22:10:19',0,5,NULL,0),(76,'',NULL,NULL,9,3,'','2014-12-16 22:10:47',0,4,NULL,0),(77,'',NULL,NULL,1,3,'','2014-12-16 22:10:54',0,4,NULL,0),(78,'',NULL,NULL,15,3,'','2014-12-16 22:10:59',0,4,NULL,0),(79,'',NULL,NULL,16,3,'','2014-12-16 22:11:02',0,4,NULL,0),(80,'',NULL,NULL,7,3,'','2014-12-16 22:11:05',0,4,NULL,0),(81,'',NULL,NULL,10,3,'','2014-12-16 22:11:09',0,4,NULL,0),(82,'',NULL,NULL,11,3,'','2014-12-16 22:11:12',0,4,NULL,0),(83,'',NULL,NULL,7,3,'','2014-12-16 22:11:16',0,4,NULL,0),(84,'',NULL,NULL,11,3,'','2014-12-16 22:11:18',0,4,NULL,0),(85,'',NULL,NULL,3,3,'','2014-12-16 22:11:21',0,4,NULL,0),(86,'',NULL,NULL,13,3,'','2014-12-16 22:11:24',0,4,NULL,0),(87,'',NULL,NULL,9,3,'','2014-12-16 22:11:27',0,4,NULL,0),(88,'',NULL,NULL,12,3,'','2014-12-16 22:11:30',0,4,NULL,0),(89,'',NULL,NULL,16,3,'','2014-12-16 22:11:34',0,4,NULL,0),(116,'',NULL,NULL,15,8,'','2014-12-29 15:20:06',1,11,8,2),(117,'',NULL,NULL,7,3,'','2014-12-29 15:27:49',1,11,4,2),(118,'',NULL,NULL,1,10,'','2014-12-29 15:33:11',1,11,7,2),(121,'',NULL,1,16,3,'','2014-12-29 15:37:08',1,12,NULL,1),(122,'',NULL,1,16,3,'','2014-12-29 15:37:24',1,13,NULL,1),(123,'',NULL,1,16,3,'','2014-12-29 15:37:42',1,14,NULL,1),(124,'',NULL,4,16,3,'','2014-12-29 15:37:58',1,15,NULL,1),(125,'',NULL,1,16,3,'','2014-12-29 15:38:04',1,15,NULL,1),(126,'',NULL,1,16,3,'','2014-12-29 15:40:25',1,16,NULL,1),(127,'',NULL,1,16,3,'','2014-12-29 15:40:47',1,17,NULL,1),(128,'',NULL,4,9,8,'','2014-12-29 15:41:24',1,18,NULL,1),(129,'',NULL,5,3,10,'','2014-12-29 15:41:37',1,18,NULL,1),(134,'',NULL,3,1,6,'','2014-12-29 16:00:49',0,21,NULL,1),(135,'',NULL,5,7,8,'','2014-12-29 16:00:57',0,21,NULL,1),(136,'',NULL,2,13,3,'','2014-12-29 16:04:06',0,22,NULL,1),(137,'',NULL,5,6,8,'','2014-12-29 16:04:23',0,22,NULL,1),(138,'',NULL,6,1,3,'','2014-12-29 16:04:33',0,22,NULL,1),(139,'',NULL,2,9,3,'','2014-12-29 16:05:04',1,24,NULL,1),(140,'',NULL,3,10,3,'','2014-12-29 16:05:12',1,24,NULL,1),(141,'',NULL,3,1,3,'','2014-12-29 16:05:46',0,25,NULL,1),(142,'',NULL,4,6,6,'','2014-12-29 16:06:08',0,25,NULL,1),(143,'',NULL,2,12,3,'','2014-12-29 16:06:29',0,26,NULL,1),(144,'',NULL,2,1,3,'','2014-12-29 16:07:23',0,27,NULL,1),(145,'',NULL,5,3,6,'','2014-12-29 16:07:30',0,27,NULL,1),(146,'',NULL,4,10,8,'','2014-12-29 16:08:28',0,29,NULL,1),(147,'',NULL,6,7,3,'','2014-12-29 16:08:42',0,29,NULL,1),(148,'',NULL,4,6,8,'','2014-12-29 16:09:10',1,30,NULL,1),(149,'',NULL,7,9,6,'','2014-12-29 16:09:19',1,30,NULL,1),(150,'',NULL,4,11,3,'','2014-12-29 16:11:11',1,31,NULL,1),(151,'',NULL,5,12,10,'','2014-12-29 16:11:19',1,31,NULL,1),(152,'',NULL,6,10,6,'','2014-12-29 16:11:28',1,31,NULL,1),(153,'',NULL,1,16,32,'','2014-12-29 16:11:51',1,32,NULL,1),(154,'',NULL,4,6,9,'','2014-12-29 16:12:20',1,33,NULL,1),(155,'',NULL,6,9,10,'','2014-12-29 16:12:33',1,33,NULL,1),(156,'',NULL,4,9,6,'','2014-12-29 16:14:21',1,34,NULL,1),(157,'',NULL,4,1,32,'','2014-12-29 16:14:27',1,34,NULL,1),(158,'',NULL,5,13,10,'','2014-12-29 16:14:35',1,34,NULL,1),(159,'',NULL,3,7,3,'','2014-12-29 16:14:55',1,35,NULL,1),(160,'',NULL,4,11,8,'','2014-12-29 16:15:33',1,36,NULL,1),(161,'',NULL,5,10,3,'','2014-12-29 16:15:48',1,36,NULL,1),(162,'',NULL,1,6,32,'','2014-12-29 16:16:24',1,37,NULL,1),(163,'',NULL,4,15,6,'','2014-12-29 16:16:33',1,37,NULL,1),(164,'',NULL,5,1,3,'','2014-12-29 16:16:40',1,37,NULL,1),(165,'',NULL,4,11,3,'','2014-12-29 16:17:18',1,38,NULL,1),(166,'',NULL,5,7,10,'','2014-12-29 16:17:30',1,38,NULL,1),(167,'',NULL,4,9,6,'','2014-12-29 16:17:54',1,39,NULL,1),(168,'',NULL,6,3,3,'','2014-12-29 16:18:00',1,39,NULL,1),(169,'',NULL,2,16,3,'','2014-12-29 16:18:18',1,40,NULL,1),(170,'',6,NULL,9,3,'','2014-12-29 19:56:00',0,2,NULL,0),(171,'',6,NULL,8,8,'','2014-12-29 19:56:20',0,2,NULL,0),(172,'',5,NULL,7,3,'','2014-12-29 19:57:34',0,2,NULL,0),(173,'',5,NULL,15,3,'','2014-12-29 19:57:54',0,2,NULL,0),(174,'',4,NULL,10,8,'','2014-12-29 19:59:38',0,2,NULL,0),(175,'',4,NULL,13,8,'','2014-12-29 19:59:53',0,2,NULL,0),(176,'',3,NULL,3,8,'','2014-12-29 20:00:51',0,2,NULL,0),(177,'',2,NULL,1,3,'','2014-12-29 20:01:08',0,2,NULL,0),(178,'',1,NULL,11,8,'','2014-12-29 20:01:29',0,2,NULL,0),(179,'',NULL,3,12,3,'','2014-12-30 12:57:49',1,19,NULL,1),(180,'',NULL,5,1,3,'','2014-12-30 12:58:50',1,19,NULL,1),(181,'',NULL,4,6,6,'','2014-12-31 14:42:39',1,20,NULL,1),(182,'',7,NULL,11,6,'','2015-01-02 11:39:31',0,3,NULL,0),(183,'',4,NULL,3,3,'','2015-01-02 11:40:02',0,3,NULL,0),(184,'',9,NULL,15,7,'','2015-01-02 11:40:26',0,3,NULL,0),(185,'',3,NULL,9,6,'','2015-01-02 11:40:42',0,3,NULL,0),(186,'',1,NULL,10,6,'','2015-01-02 11:41:02',0,3,NULL,0),(187,'',5,NULL,14,9,'','2015-01-02 11:41:31',0,3,NULL,0),(188,'',5,NULL,13,9,'','2015-01-02 11:41:51',0,3,NULL,0),(189,'',3,NULL,1,6,'','2015-01-02 11:42:22',0,3,NULL,0),(190,'',4,NULL,8,6,'','2015-01-02 11:42:39',0,3,NULL,0),(191,'',2,NULL,6,9,'','2015-01-02 11:43:02',0,3,NULL,0),(192,'',5,NULL,7,6,'','2015-01-02 11:43:24',0,3,NULL,0),(193,'',3,NULL,8,6,'','2015-01-02 11:44:23',0,3,NULL,0),(194,'',3,NULL,12,6,'','2015-01-02 14:47:22',0,1,NULL,0),(195,'',4,NULL,6,3,'','2015-01-02 14:47:37',0,1,NULL,0),(196,'',5,NULL,8,6,'','2015-01-02 14:47:50',0,1,NULL,0),(197,'',NULL,NULL,3,6,'','2015-01-02 14:48:19',0,1,NULL,0),(198,'',5,NULL,13,3,'','2015-01-02 14:48:30',0,1,NULL,0),(199,'',6,NULL,9,3,'','2015-01-02 14:49:15',0,1,NULL,0),(200,'',8,NULL,11,3,'','2015-01-02 14:49:28',0,1,NULL,0),(201,'',7,NULL,16,6,'','2015-01-02 14:49:43',0,1,NULL,0),(202,'',6,NULL,1,3,'','2015-01-02 14:49:55',0,1,NULL,0),(203,'',3,NULL,10,6,'','2015-01-02 14:50:06',0,1,NULL,0),(204,'',3,NULL,7,3,'','2015-01-02 14:50:52',0,1,NULL,0),(205,'',NULL,5,9,10,'','2015-01-04 14:39:21',1,20,NULL,1),(206,'',NULL,6,1,32,'','2015-01-04 14:40:47',1,33,NULL,1),(207,'',NULL,NULL,12,6,'','2015-01-12 14:14:23',1,11,4,2),(208,'',NULL,3,8,8,'','2015-01-12 14:16:47',1,21,NULL,1),(209,'',NULL,5,7,32,'','2015-01-12 14:17:33',1,21,NULL,1),(210,'',NULL,3,3,3,'','2015-01-12 14:19:09',0,22,NULL,1),(211,'',NULL,3,3,3,'','2015-01-12 14:21:49',0,25,NULL,1),(212,'',NULL,6,1,3,'','2015-01-12 14:24:07',1,22,NULL,1),(213,'',NULL,5,6,8,'','2015-01-12 14:24:34',1,22,NULL,1),(214,'',NULL,2,13,3,'','2015-01-12 14:25:15',1,22,NULL,1),(215,'',1,NULL,8,8,'','2015-01-13 12:50:46',1,5,NULL,0),(216,'',1,NULL,1,9,'','2015-01-13 12:50:54',1,5,NULL,0),(217,'',5,NULL,15,32,'','2015-01-13 12:51:12',1,5,NULL,0),(218,'',6,NULL,11,9,'','2015-01-13 12:51:26',1,5,NULL,0),(219,'',4,NULL,3,32,'','2015-01-13 12:51:50',1,5,NULL,0),(220,'',6,NULL,14,9,'','2015-01-13 12:52:06',1,5,NULL,0),(221,'',7,NULL,10,8,'','2015-01-13 12:52:21',1,5,NULL,0),(222,'',8,NULL,9,32,'','2015-01-13 12:52:34',1,5,NULL,0),(223,'',4,NULL,12,8,'','2015-01-13 12:52:48',1,5,NULL,0),(224,'',4,NULL,13,6,'','2015-01-13 12:53:02',1,5,NULL,0),(225,'',2,NULL,9,8,'','2015-01-13 12:53:11',1,5,NULL,0),(226,'',NULL,6,11,8,'','2015-01-14 11:27:49',1,25,NULL,1),(227,'',NULL,2,9,9,'','2015-01-14 11:28:37',1,25,NULL,1),(228,'',NULL,3,3,32,'','2015-01-14 11:29:06',1,25,NULL,1),(229,'',NULL,6,7,6,'','2015-01-14 13:19:28',1,26,NULL,1),(230,'',NULL,NULL,10,3,'','2015-01-19 13:14:23',0,4,NULL,0),(231,'',NULL,NULL,10,31,'','2015-01-19 13:16:59',1,4,NULL,0),(232,'',NULL,NULL,9,3,'','2015-01-19 13:17:16',1,4,NULL,0),(233,'',3,NULL,12,31,'','2015-01-19 13:17:26',1,4,NULL,0),(234,'',6,NULL,1,3,'','2015-01-19 13:17:31',1,4,NULL,0),(235,'',NULL,NULL,3,8,'','2015-01-19 13:17:40',1,4,NULL,0),(236,'',NULL,NULL,11,3,'','2015-01-19 13:17:50',1,4,NULL,0),(237,'',NULL,NULL,1,8,'','2015-01-19 13:17:56',1,4,NULL,0),(238,'',NULL,NULL,8,8,'','2015-01-19 13:18:03',1,4,NULL,0),(239,'',6,NULL,7,31,'','2015-01-19 13:18:11',1,4,NULL,0),(240,'',5,NULL,3,3,'','2015-01-19 13:18:19',1,4,NULL,0),(241,'',4,NULL,13,3,'','2015-01-19 13:18:29',1,4,NULL,0),(242,'',NULL,NULL,9,8,'','2015-01-19 13:18:38',1,4,NULL,0),(243,'',NULL,NULL,9,8,'','2015-01-19 13:18:39',1,4,NULL,0),(244,'',NULL,NULL,13,3,'','2015-01-20 14:26:28',1,40,2,1),(245,'',NULL,NULL,13,3,'','2015-01-20 17:37:20',0,40,2,1),(246,'',NULL,NULL,8,8,'','2015-01-20 17:38:18',1,11,6,2),(247,'',NULL,NULL,12,32,'','2015-01-26 11:12:51',1,11,6,2),(248,'',NULL,NULL,16,10,'Freiberg','2015-01-26 11:13:17',1,11,6,2),(249,'',5,NULL,15,6,'','2015-01-26 13:54:01',1,3,NULL,0),(250,'',6,NULL,13,33,'','2015-01-26 13:54:59',1,3,NULL,0),(251,'',5,NULL,10,6,'','2015-01-26 13:55:15',1,3,NULL,0),(252,'',5,NULL,16,3,'','2015-01-26 13:55:24',1,3,NULL,0),(253,'',6,NULL,11,3,'','2015-01-26 13:55:32',1,3,NULL,0),(254,'',7,NULL,1,6,'','2015-01-26 13:55:40',1,3,NULL,0),(255,'',3,NULL,7,3,'','2015-01-26 13:56:14',1,3,NULL,0),(256,'',5,NULL,3,33,'','2015-01-26 13:56:28',1,3,NULL,0),(257,'',2,NULL,8,33,'','2015-01-26 13:56:38',1,3,NULL,0),(258,'',2,NULL,12,3,'','2015-01-26 13:56:49',1,3,NULL,0),(259,'',3,NULL,9,33,'','2015-01-26 13:57:00',1,3,NULL,0),(260,'',NULL,NULL,7,8,'','2015-01-29 11:50:08',1,11,5,2),(261,'',NULL,5,14,6,'','2015-01-29 11:52:35',1,27,NULL,1),(262,'',NULL,NULL,1,9,'','2015-01-29 11:52:51',1,26,2,1),(263,'',NULL,2,9,9,'','2015-02-09 10:53:12',1,27,NULL,1),(264,'',6,NULL,7,8,'','2015-02-09 14:30:45',1,1,NULL,0),(265,'',4,NULL,13,8,'','2015-02-09 14:31:16',1,1,NULL,0),(266,'',4,NULL,6,32,'','2015-02-09 14:31:31',1,1,NULL,0),(267,'',5,NULL,9,6,'','2015-02-09 14:31:43',1,1,NULL,0),(268,'',4,NULL,8,32,'','2015-02-09 14:31:50',1,1,NULL,0),(269,'',9,NULL,14,8,'','2015-02-09 14:32:15',1,1,NULL,0),(270,'',6,NULL,3,6,'','2015-02-09 14:32:26',1,1,NULL,0),(271,'',3,NULL,10,32,'','2015-02-09 14:32:36',1,1,NULL,0),(272,'',6,NULL,1,8,'','2015-02-09 14:32:44',1,1,NULL,0),(273,'',7,NULL,15,6,'','2015-02-09 14:33:23',1,1,NULL,0),(274,'',2,NULL,11,32,'','2015-02-09 14:33:36',1,1,NULL,0),(275,'',2,NULL,8,31,'','2015-02-09 14:35:20',1,2,NULL,0),(276,'',3,NULL,16,31,'','2015-02-09 14:35:29',1,2,NULL,0),(277,'',1,NULL,9,9,'','2015-02-09 14:35:42',1,2,NULL,0),(278,'',3,NULL,13,3,'','2015-02-09 14:35:49',1,2,NULL,0),(279,'',4,NULL,11,9,'','2015-02-09 14:36:01',1,2,NULL,0),(280,'',4,NULL,3,9,'','2015-02-09 14:36:09',1,2,NULL,0),(281,'',6,NULL,7,9,'','2015-02-09 14:36:15',1,2,NULL,0),(282,'',1,NULL,6,3,'','2015-02-09 14:36:27',1,2,NULL,0),(283,'',6,NULL,1,3,'','2015-02-09 14:36:32',1,2,NULL,0),(284,'',5,NULL,15,3,'','2015-02-09 14:36:38',1,2,NULL,0),(285,'',7,NULL,12,3,'','2015-02-09 14:36:57',1,2,NULL,0),(286,'',NULL,6,3,6,'','2015-02-09 14:53:26',1,29,NULL,1),(287,'',NULL,NULL,10,8,'','2015-02-09 15:01:15',1,11,3,2),(288,'',7,NULL,14,9,'','2015-02-17 13:02:16',1,2,NULL,0);
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
INSERT INTO `sends` VALUES (1,18,'2015-01-03 17:08:31'),(1,19,'2015-01-03 17:08:05'),(1,22,'2015-01-03 17:28:33'),(1,23,'2015-01-03 17:07:47'),(1,67,'2015-01-03 11:42:39'),(1,68,'2015-01-03 11:42:47'),(1,69,'2015-01-03 11:42:45'),(1,70,'2015-01-03 11:42:34'),(1,71,'2015-01-03 11:42:35'),(1,72,'2015-01-03 11:42:40'),(1,73,'2015-01-03 11:42:31'),(1,74,'2015-01-03 11:42:37'),(1,75,'2015-01-03 11:42:42'),(1,128,'2015-01-03 12:12:12'),(1,185,'2015-01-06 23:17:25'),(1,186,'2015-01-06 23:17:10'),(1,189,'2015-01-06 23:17:32'),(1,191,'2015-01-06 23:17:14'),(1,193,'2015-01-06 23:17:20'),(1,194,'2015-01-03 12:24:38'),(1,195,'2015-01-08 19:59:33'),(1,196,'2015-01-03 12:23:56'),(1,198,'2015-01-03 12:24:02'),(1,199,'2015-01-03 12:24:05'),(1,200,'2015-01-03 12:24:07'),(1,201,'2015-01-03 12:24:20'),(1,202,'2015-01-03 12:24:31'),(1,203,'2015-01-03 12:24:33'),(1,204,'2015-01-03 12:24:36'),(1,259,'2015-01-26 20:17:46'),(1,274,'2015-02-18 19:45:29'),(4,70,'2015-01-03 23:54:50'),(4,73,'2015-01-03 23:54:30'),(4,78,'2015-01-03 23:52:44'),(4,175,'2015-01-03 23:52:09'),(4,177,'2015-01-03 23:51:18'),(4,178,'2015-01-03 23:51:39'),(4,185,'2015-01-03 12:33:14'),(4,190,'2015-01-03 12:34:31'),(4,191,'2015-01-03 23:53:01'),(4,192,'2015-01-03 12:23:20'),(4,193,'2015-01-03 12:34:41'),(4,194,'2015-01-07 15:42:56'),(4,195,'2015-01-07 15:42:42'),(4,196,'2015-01-07 15:42:30'),(4,198,'2015-01-07 15:42:16'),(4,203,'2015-01-03 14:39:32'),(4,204,'2015-01-07 15:43:04'),(4,223,'2015-01-18 08:27:13'),(8,13,'2015-01-03 17:48:34'),(8,14,'2015-01-03 17:48:45'),(8,15,'2015-01-03 17:49:56'),(8,16,'2015-01-03 17:49:01'),(8,18,'2015-01-03 17:44:06'),(8,19,'2015-01-03 17:45:44'),(8,20,'2015-01-03 17:49:11'),(8,21,'2015-01-03 17:49:27'),(8,22,'2015-01-03 17:45:52'),(8,23,'2015-01-03 17:43:31'),(8,25,'2015-01-03 17:46:06'),(8,67,'2015-01-03 17:50:50'),(8,69,'2015-01-03 17:50:12'),(8,70,'2015-01-03 17:52:45'),(8,71,'2015-01-03 17:52:35'),(8,72,'2015-01-03 17:51:50'),(8,73,'2015-01-03 17:52:51'),(8,74,'2015-01-03 17:51:05'),(8,75,'2015-01-03 17:50:17'),(8,117,'2015-01-03 17:48:22'),(8,118,'2015-01-03 17:49:47'),(8,128,'2015-01-04 18:39:45'),(8,129,'2015-01-04 18:39:40'),(8,146,'2015-01-04 18:41:54'),(8,147,'2015-01-04 18:42:00'),(8,149,'2015-01-04 18:42:12'),(8,150,'2015-01-04 18:42:49'),(8,151,'2015-01-04 18:42:38'),(8,152,'2015-01-04 18:42:57'),(8,155,'2015-01-04 18:43:27'),(8,164,'2015-01-04 18:44:44'),(8,168,'2015-01-04 18:44:59'),(8,170,'2015-01-03 17:54:26'),(8,171,'2015-01-03 17:54:19'),(8,172,'2015-01-03 17:54:45'),(8,173,'2015-01-03 17:54:39'),(8,174,'2015-01-04 18:28:25'),(8,179,'2015-01-04 18:39:27'),(8,180,'2015-01-04 18:39:20'),(8,181,'2015-01-04 18:40:03'),(8,187,'2015-01-04 18:30:01'),(8,188,'2015-01-04 18:29:52'),(8,192,'2015-01-04 18:29:41'),(8,196,'2015-02-04 16:29:22'),(8,198,'2015-01-18 09:45:02'),(8,199,'2015-01-18 09:44:42'),(8,201,'2015-01-18 09:44:30'),(8,202,'2015-02-04 16:28:46'),(8,205,'2015-01-04 18:40:11'),(8,206,'2015-01-06 11:51:32'),(8,207,'2015-01-29 12:15:12'),(8,209,'2015-02-04 16:28:00'),(8,217,'2015-01-18 09:43:15'),(8,218,'2015-01-18 09:42:43'),(8,219,'2015-01-18 09:43:33'),(8,220,'2015-01-18 09:42:33'),(8,221,'2015-01-18 09:41:57'),(8,226,'2015-02-04 16:27:18'),(8,247,'2015-01-29 12:16:02'),(8,248,'2015-01-29 12:15:30'),(8,249,'2015-01-29 12:14:12'),(8,250,'2015-01-29 12:13:41'),(8,251,'2015-01-29 12:14:03'),(8,252,'2015-01-29 12:13:26'),(8,253,'2015-01-29 12:13:13'),(8,254,'2015-01-29 12:12:52'),(8,256,'2015-01-29 12:13:52'),(8,260,'2015-01-29 12:16:20'),(9,13,'2015-01-14 10:00:33'),(9,18,'2015-01-04 01:50:44'),(9,19,'2015-01-04 01:50:47'),(9,22,'2015-01-04 01:50:40'),(9,23,'2015-01-04 01:50:50'),(9,67,'2015-01-04 01:49:02'),(9,68,'2015-01-04 01:49:10'),(9,69,'2015-01-04 01:49:06'),(9,70,'2015-01-04 01:48:43'),(9,71,'2015-01-04 01:48:45'),(9,72,'2015-01-04 01:48:51'),(9,73,'2015-01-04 01:48:37'),(9,74,'2015-01-04 01:48:48'),(9,75,'2015-01-04 01:48:59'),(9,76,'2015-01-04 01:46:58'),(9,77,'2015-01-04 01:47:06'),(9,78,'2015-01-04 01:47:13'),(9,80,'2015-01-04 01:46:22'),(9,81,'2015-01-04 01:46:27'),(9,82,'2015-01-04 01:46:32'),(9,83,'2015-01-04 01:46:36'),(9,84,'2015-01-04 01:46:43'),(9,85,'2015-01-04 01:46:51'),(9,86,'2015-01-04 01:46:54'),(9,87,'2015-01-04 01:47:00'),(9,88,'2015-01-04 01:47:10'),(9,89,'2015-01-04 01:47:29'),(9,170,'2015-01-04 01:45:13'),(9,171,'2015-01-04 01:45:22'),(9,172,'2015-01-04 01:45:01'),(9,173,'2015-01-04 01:45:05'),(9,174,'2015-01-04 01:44:44'),(9,175,'2015-01-04 01:44:55'),(9,176,'2015-01-04 01:44:40'),(9,177,'2015-01-04 01:44:36'),(9,178,'2015-01-04 01:44:31'),(9,182,'2015-01-04 01:46:09'),(9,183,'2015-01-04 01:45:53'),(9,185,'2015-01-04 01:45:45'),(9,186,'2015-01-04 01:45:30'),(9,187,'2015-01-04 01:45:56'),(9,188,'2015-01-04 01:46:00'),(9,189,'2015-01-04 01:45:38'),(9,190,'2015-01-04 01:45:49'),(9,191,'2015-01-04 01:45:34'),(9,192,'2015-01-04 01:46:05'),(9,193,'2015-01-04 01:45:41'),(9,194,'2015-01-04 01:50:02'),(9,195,'2015-01-04 01:50:06'),(9,196,'2015-01-04 01:50:09'),(9,198,'2015-01-04 01:49:23'),(9,199,'2015-01-04 01:49:27'),(9,200,'2015-01-04 01:49:31'),(9,201,'2015-01-23 00:14:03'),(9,202,'2015-01-04 01:49:49'),(9,203,'2015-01-04 01:49:53'),(9,204,'2015-01-04 01:49:57'),(9,215,'2015-01-14 09:59:00'),(9,216,'2015-01-14 09:58:53'),(9,217,'2015-01-14 09:59:28'),(9,218,'2015-01-26 23:49:24'),(9,219,'2015-01-14 09:59:19'),(9,220,'2015-01-14 09:59:39'),(9,221,'2015-01-14 09:59:46'),(9,223,'2015-01-14 09:59:24'),(9,224,'2015-01-14 09:59:14'),(9,225,'2015-01-14 09:59:08'),(9,233,'2015-02-17 23:25:48'),(9,239,'2015-02-17 23:26:24'),(9,240,'2015-02-17 23:26:19'),(9,241,'2015-02-17 23:26:02'),(9,243,'2015-02-17 23:26:30'),(9,249,'2015-01-26 23:49:06'),(9,250,'2015-01-26 23:48:29'),(9,251,'2015-01-26 23:47:55'),(9,252,'2015-01-26 23:48:09'),(9,253,'2015-01-26 23:48:41'),(9,255,'2015-01-26 23:47:47'),(9,256,'2015-01-26 23:48:02'),(9,257,'2015-01-26 23:47:26'),(9,258,'2015-01-26 23:47:32'),(9,259,'2015-01-26 23:47:38'),(9,264,'2015-02-17 23:25:11'),(9,265,'2015-02-17 23:23:44'),(9,266,'2015-02-17 23:24:12'),(9,267,'2015-02-17 23:24:55'),(9,268,'2015-02-17 23:24:08'),(9,269,'2015-02-17 23:23:53'),(9,270,'2015-02-17 23:25:05'),(9,271,'2015-02-17 23:23:39'),(9,272,'2015-02-17 23:25:00'),(9,273,'2015-02-17 23:25:15'),(9,274,'2015-02-17 23:23:34'),(9,275,'2015-02-09 19:57:50'),(9,276,'2015-02-09 19:58:11'),(9,277,'2015-02-09 19:58:26'),(9,278,'2015-02-09 19:57:08'),(9,279,'2015-02-09 19:57:19'),(9,280,'2015-02-09 19:57:57'),(9,281,'2015-02-09 19:58:17'),(9,282,'2015-02-09 19:58:32'),(9,283,'2015-02-09 19:57:15'),(9,284,'2015-02-09 19:57:23'),(9,285,'2015-02-09 19:58:07'),(9,287,'2015-02-09 19:56:56'),(9,288,'2015-02-17 23:25:27'),(13,188,'2015-01-03 16:36:01'),(13,192,'2015-01-03 16:36:49'),(16,67,'2015-01-03 13:41:56'),(16,69,'2015-01-03 13:41:25'),(16,72,'2015-01-03 13:41:49'),(16,170,'2015-01-04 02:09:02'),(16,171,'2015-01-04 02:08:40'),(16,172,'2015-01-04 02:09:20'),(16,173,'2015-01-04 02:09:11'),(16,182,'2015-01-03 13:39:15'),(16,188,'2015-01-03 13:39:45'),(17,18,'2015-01-03 17:49:53'),(17,19,'2015-01-03 17:49:47'),(17,22,'2015-01-03 17:47:36'),(17,23,'2015-01-03 17:49:35'),(17,25,'2015-01-03 17:49:59'),(17,70,'2015-01-03 17:53:29'),(17,71,'2015-01-03 17:53:25'),(17,78,'2015-01-07 11:19:04'),(17,135,'2015-01-03 19:14:47'),(17,138,'2015-01-03 18:54:02'),(17,160,'2015-01-03 19:13:37'),(17,161,'2015-01-03 19:13:40'),(17,164,'2015-01-04 23:32:02'),(17,175,'2015-01-03 17:53:00'),(17,176,'2015-01-03 17:52:44'),(17,177,'2015-01-03 17:52:25'),(17,178,'2015-01-03 17:51:54'),(17,180,'2015-01-04 23:31:21'),(17,183,'2015-01-08 10:23:42'),(17,192,'2015-01-08 10:23:29'),(17,203,'2015-01-03 17:51:06'),(17,204,'2015-01-03 17:51:42'),(17,205,'2015-01-04 23:31:42'),(17,209,'2015-01-13 09:58:24'),(20,13,'2015-01-16 19:54:01'),(20,14,'2015-01-03 20:20:27'),(20,15,'2015-01-16 19:06:34'),(20,16,'2015-01-16 19:05:30'),(20,18,'2015-01-03 20:18:41'),(20,19,'2015-01-03 20:18:51'),(20,21,'2015-01-16 19:05:49'),(20,22,'2015-01-03 20:19:08'),(20,23,'2015-01-16 19:01:38'),(20,24,'2015-01-16 19:02:51'),(20,25,'2015-01-03 20:19:19'),(20,67,'2015-01-03 20:18:10'),(20,71,'2015-01-03 20:18:20'),(20,72,'2015-01-03 20:17:59'),(20,74,'2015-01-03 20:17:13'),(20,76,'2015-01-16 18:58:08'),(20,84,'2015-01-16 18:59:21'),(20,85,'2015-01-16 18:58:36'),(20,86,'2015-01-16 18:58:19'),(20,88,'2015-01-16 18:59:12'),(20,117,'2015-01-03 20:19:43'),(20,118,'2015-01-16 19:06:07'),(20,137,'2015-01-03 20:23:06'),(20,149,'2015-01-03 20:26:25'),(20,151,'2015-01-03 20:23:55'),(20,152,'2015-01-03 20:24:04'),(20,155,'2015-01-03 20:24:45'),(20,158,'2015-01-03 20:25:08'),(20,170,'2015-01-16 19:40:02'),(20,171,'2015-01-03 20:11:56'),(20,172,'2015-01-03 20:14:01'),(20,173,'2015-01-03 20:13:46'),(20,174,'2015-01-03 20:15:41'),(20,175,'2015-01-03 20:14:46'),(20,176,'2015-01-03 20:16:06'),(20,177,'2015-01-03 20:16:16'),(20,178,'2015-01-03 20:11:47'),(20,194,'2015-01-03 20:10:13'),(20,195,'2015-01-03 20:10:26'),(20,196,'2015-01-03 20:11:28'),(20,198,'2015-01-03 20:08:35'),(20,199,'2015-01-03 20:08:49'),(20,201,'2015-01-03 20:09:04'),(20,202,'2015-01-03 20:09:14'),(20,203,'2015-01-03 20:09:31'),(20,204,'2015-01-16 19:34:16'),(20,207,'2015-01-16 19:00:57'),(20,212,'2015-01-16 19:16:07'),(20,213,'2015-01-16 19:16:53'),(20,214,'2015-01-16 19:17:24'),(20,215,'2015-01-16 18:57:40'),(20,216,'2015-01-16 18:57:28'),(20,217,'2015-01-16 18:57:03'),(20,218,'2015-01-16 18:55:40'),(20,219,'2015-01-16 18:57:15'),(20,220,'2015-01-16 18:55:57'),(20,221,'2015-01-16 18:55:26'),(20,223,'2015-01-16 18:54:33'),(20,224,'2015-01-16 18:56:11'),(20,225,'2015-01-16 18:54:12'),(20,226,'2015-01-16 19:13:26'),(20,227,'2015-01-16 19:15:43'),(20,228,'2015-01-16 19:15:31'),(20,229,'2015-01-16 19:10:57'),(21,67,'2015-01-11 08:43:07'),(21,68,'2015-01-11 08:42:51'),(21,69,'2015-01-11 08:42:56'),(21,70,'2015-01-11 08:43:38'),(21,71,'2015-01-11 08:43:27'),(21,72,'2015-01-11 08:43:15'),(21,73,'2015-01-11 08:43:47'),(21,74,'2015-01-11 08:43:22'),(21,75,'2015-01-11 08:43:01'),(21,170,'2015-01-11 08:34:50'),(21,171,'2015-01-11 08:41:39'),(21,172,'2015-01-11 08:42:05'),(21,173,'2015-01-11 08:41:53'),(21,174,'2015-01-11 08:36:33'),(21,175,'2015-01-11 08:36:45'),(21,176,'2015-01-11 08:36:22'),(21,177,'2015-01-11 08:35:21'),(21,178,'2015-01-11 08:35:13'),(21,194,'2015-01-04 19:45:39'),(21,195,'2015-01-04 19:45:51'),(21,196,'2015-01-04 19:37:33'),(21,199,'2015-01-04 19:39:34'),(21,203,'2015-01-04 19:41:16'),(21,204,'2015-01-04 19:45:30'),(24,125,'2015-01-07 08:50:02'),(24,177,'2015-01-07 08:49:57'),(27,176,'2015-01-12 22:18:38'),(27,185,'2015-01-12 22:23:59'),(27,191,'2015-01-12 22:27:47'),(31,18,'2015-01-29 15:51:45'),(31,19,'2015-01-29 15:51:56'),(31,21,'2015-01-29 15:53:03'),(31,22,'2015-01-29 15:52:37'),(31,23,'2015-01-29 15:51:50'),(31,25,'2015-01-29 15:52:18'),(31,117,'2015-01-29 15:52:04'),(31,172,'2015-01-29 15:49:58'),(31,175,'2015-01-29 15:49:48'),(31,176,'2015-01-29 15:49:43'),(31,177,'2015-01-29 15:49:37'),(31,178,'2015-01-29 15:49:33'),(31,207,'2015-01-29 15:52:11'),(31,215,'2015-01-29 15:50:11'),(31,216,'2015-01-29 15:50:15'),(31,217,'2015-01-29 15:50:49'),(31,219,'2015-01-29 15:50:41'),(31,223,'2015-01-29 15:50:36'),(31,224,'2015-01-29 15:50:45'),(31,225,'2015-01-29 15:50:27'),(31,231,'2015-02-17 12:57:30'),(31,232,'2015-02-17 12:58:02'),(31,233,'2015-02-17 12:58:15'),(31,235,'2015-02-17 12:57:16'),(31,236,'2015-02-17 12:57:36'),(31,238,'2015-02-17 12:58:24'),(31,239,'2015-02-17 12:57:06'),(31,240,'2015-02-17 12:57:24'),(31,241,'2015-02-17 12:57:55'),(31,243,'2015-02-17 12:56:34'),(31,249,'2015-01-29 15:49:13'),(31,251,'2015-01-29 15:48:49'),(31,253,'2015-01-29 15:49:00'),(31,255,'2015-01-29 15:48:34'),(31,256,'2015-01-29 15:47:18'),(31,257,'2015-01-29 15:47:10'),(31,258,'2015-01-29 15:46:40'),(31,259,'2015-01-29 15:47:01'),(31,264,'2015-02-11 16:44:16'),(31,265,'2015-02-11 16:45:17'),(31,266,'2015-02-11 16:45:27'),(31,268,'2015-02-11 16:44:08'),(31,271,'2015-02-11 16:45:33'),(31,274,'2015-02-11 16:45:06'),(31,275,'2015-02-11 16:42:54'),(31,276,'2015-02-11 16:43:19'),(31,277,'2015-02-11 16:43:46'),(31,279,'2015-02-11 16:42:36'),(31,280,'2015-02-11 16:43:06'),(31,281,'2015-02-11 16:43:36'),(31,282,'2015-02-11 16:43:52'),(31,284,'2015-02-11 16:42:46'),(31,287,'2015-02-11 16:45:51');
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
INSERT INTO `setters_gyms_access` VALUES (3,2),(4,2),(6,2),(7,2),(8,2),(9,2),(10,2),(31,2),(32,2),(33,2),(35,34);
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
INSERT INTO `suggestions` VALUES (2,8,'Have the stars be a different color when rated vs not rated'),(3,27,'I am still seeing Chinese characters and pop-ups should be cleaned up :) Loving this site though, great work!!');
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
INSERT INTO `suggestions_upvotes` VALUES (2,8),(2,10);
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
INSERT INTO `users` VALUES (1,2,'Cody','Seibert'),(3,2,'Mark','Mercer'),(4,2,'Guillermo','Martinez'),(6,2,'Joshua','Jimenez'),(7,2,'Davis','Stewart'),(8,2,'Jonmikel','Macnichols'),(9,2,'Blake','Compton'),(10,2,'Chris','Freiberg'),(13,2,'Travis','Newman'),(14,2,'Jessica','Jenkins'),(15,2,'Patrick','Murphy'),(16,2,'Steven','Featherston'),(17,2,'Hannah','Hayes'),(18,NULL,'Sean Michael','Smyth'),(20,2,'William','Fernandez'),(21,2,'Jeff','Mccallister'),(22,NULL,'Ashley','Pacailler'),(23,NULL,'Ryan','Jones'),(24,2,'Cody','Seibert'),(25,2,'Evan','Jones'),(27,2,'Nadine','Karaze'),(29,2,'Michael','Bird'),(31,2,'Austin','Lawicki'),(32,2,'Guest','Setter'),(33,2,'Lex','Johnson'),(35,34,'Guest','Setter'),(36,2,'Nicholas','Hanley Hankins');
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
INSERT INTO `walls` VALUES (1,'Wave',2,'2015-02-09 14:33:36',NULL),(2,'Diamond',2,'2015-02-17 13:02:16',NULL),(3,'Right Gray',2,'2015-01-26 13:57:00',NULL),(4,'Boulder Cave',2,'2015-01-19 13:18:39',NULL),(5,'Lead Cave',2,'2015-01-13 12:53:11',NULL),(11,'Lead',2,'2015-02-09 15:01:15',NULL),(12,'1',2,'0000-00-00 00:00:00',NULL),(13,'2',2,'0000-00-00 00:00:00',NULL),(14,'3',2,'0000-00-00 00:00:00',NULL),(15,'4',2,'0000-00-00 00:00:00',NULL),(16,'5',2,'0000-00-00 00:00:00',NULL),(17,'6',2,'0000-00-00 00:00:00',NULL),(18,'7',2,'0000-00-00 00:00:00',NULL),(19,'8',2,'0000-00-00 00:00:00',NULL),(20,'9',2,'0000-00-00 00:00:00',NULL),(21,'10',2,'2015-01-12 14:17:33',NULL),(22,'11',2,'2015-01-12 14:25:15',NULL),(24,'12',2,'0000-00-00 00:00:00',NULL),(25,'13',2,'2015-01-14 11:29:06',NULL),(26,'14',2,'2015-01-29 11:52:51',NULL),(27,'15',2,'2015-02-09 10:53:12',NULL),(29,'16',2,'2015-02-09 14:53:26',NULL),(30,'17',2,'0000-00-00 00:00:00',NULL),(31,'18',2,'0000-00-00 00:00:00',NULL),(32,'19',2,'0000-00-00 00:00:00',NULL),(33,'20',2,'0000-00-00 00:00:00',NULL),(34,'21',2,'0000-00-00 00:00:00',NULL),(35,'22',2,'0000-00-00 00:00:00',NULL),(36,'23',2,'0000-00-00 00:00:00',NULL),(37,'24',2,'0000-00-00 00:00:00',NULL),(38,'25',2,'0000-00-00 00:00:00',NULL),(39,'26',2,'0000-00-00 00:00:00',NULL),(40,'27',2,'2015-01-20 17:37:20',NULL),(41,'Kid Zone Room',26,'0000-00-00 00:00:00',NULL),(42,'Bouldering Room',26,'0000-00-00 00:00:00',NULL),(43,'The Arch',26,'0000-00-00 00:00:00',NULL),(44,'Top Rope Room',26,'0000-00-00 00:00:00',NULL),(45,'Ying-Yang Wall',26,'0000-00-00 00:00:00',NULL),(46,'Lead Walls',26,'0000-00-00 00:00:00',NULL),(47,'Speed Walls',26,'0000-00-00 00:00:00',NULL),(48,'Auto Belay',26,'0000-00-00 00:00:00',NULL),(49,'Wave Wall',26,'0000-00-00 00:00:00',NULL),(50,'Mushroom Boulder',26,'0000-00-00 00:00:00',NULL),(51,'The Pit',26,'0000-00-00 00:00:00',NULL),(52,'Chestnut Walls',26,'0000-00-00 00:00:00',NULL);
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

-- Dump completed on 2015-02-19 13:00:58
