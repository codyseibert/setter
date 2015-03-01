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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'cseibert113@gmail.com','$2a$10$S8viQ38.Ukwqn7C.hEgZdedDozA0Y2vXefChMJvC1CieVrUt8xhUC',1,'xzTeZ8ZKbwTdfnLfvgeY',2),(2,'routesetting@aiguille.com','$2a$10$yB2BtsqvdGcdTZYA3Odx2.cCmRYz2HM.6tBaQETvVCEeYbzOnhoDW',2,'KB3DVfRgzzZpNPxJ5nNx',22),(3,'marklotor@gmail.com','$2a$10$7iT2ZUta9feji2uZ1YrLmOGaIDGx6XqBhmtSJ7KW/pAljqr0evLxK',1,'8J9tLdqM8NMFB3xmI82p',24),(4,'hi.guillermocasanova@gmail.com','$2a$10$xncJ8dPYPUnbFAkL4fvVd.lbyGamXycNp4aNFks4a62l91LD68OmS',1,'SlEZIeLNB2KcgIhcBKYS',23),(6,'e_jimenez1012@hotmail.com','$2a$10$lNK78hDmS6OwutpMtonLLuC6FaiZ9lukakIX8S62f4AKunZIURM4q',1,'FugCeUFes2RUweT4MWmy',25),(7,'davisjstew@yahoo.com','$2a$10$owG3JqbYaEAOy3ASEZ1eIuqS4sxoGzMcNKqeqppjwABKEOjvdH18S',1,'KAm0LcWykSpNHwr8EFt9',NULL),(8,'jmwm88@yahoo.com','$2a$10$JKiLIlhtJaHJLAdoz0Ire.BoI32Cc9xk8ddHHLoUX4teukN1/7qSy',1,'uIXC6aXefMno9iwm8Cq4',NULL),(9,'blake.the.climber@gmail.com','$2a$10$mYnRn6Q8HeimC.WjnqkJweQ0DRrKRRm8eaHAxWASvEkz0E25uvwku',1,'Z1oU2Ulvc2NNPbRgUVA2',14),(10,'Moo5152@GMail.com','$2a$10$fbQ/GLdLyjzId4cKNW2pouz/1im8aqIvU4MYZJ0fOD8CXHjzO0tkm',1,'qOi4hk1rklkAnDYPOprZ',NULL),(13,'Newman.TravisA@gmail.com','$2a$10$GSriVfEX6aQKUJ4RkwHMPu558N5U8zMaeP8lRxI1my8vxjeKAxoi6',1,'TkAVnleV3bKrfAkN2BBY',NULL),(14,'kjenk13fl@gmail.com','$2a$10$zyM.eRANmNwxf1/YwOfGluNNkoP3/R9XkpjT2k66fUbSA0e3g8ja.',1,'FSfoumE8yHSGknJygS3B',NULL),(15,'mail@patrickdanielmurphy.com','$2a$10$3X6A/57A1RXqTq/jV1rzmOmciBYJtVmGotALZLASODNm/bBqaQrl2',1,'UCGHNFxrEWqAvrYTgpwp',8),(16,'SFeatherston92@Gmail.Com','$2a$10$Nd8uFxFkNy0.huiZQQOffOnBjsTKs67ys8FlKEVaNKAWsTZtL3qXu',1,'SH9KfqJlmYqgkRH8kBqw',10),(17,'HHayes95@gmail.com','$2a$10$o6cpYwdDUrh4VkN8Ffud4uyj19.e15wHVKlCd5PI8OMPfFm44gv7G',1,'M5r8rCXat2BGE0D8diYy',21),(18,'seanmichaelsmyth@gmail.com','$2a$10$sRKjTfUk67M3Svm2./y2f.xgRJgiQ4NBP/pZFzorZgj46MqFBxQpK',1,'8sUqRYNdbttaO1lZn9p8',NULL),(20,'wfdez82@yahoo.com','$2a$10$MNfLt6fEHQKVMj79J1Qlr.2yXOm4SaqW5lMkjkmfVasNChP9XGfIC',1,'6PTYWM7YBeGdGnMSre6n',13),(21,'jeffmcc27@gmail.com','$2a$10$NI1NyBxZP8f12bGJI8XA/e5hV4/6RqKJ35CAhCkrjY8cTGf4v1WfS',1,'YaNxPsRkVuOOHIyci2K5',NULL),(22,'midnightwisher@gmail.com','$2a$10$ZngpnBTkdKMVtLIVX9H9IONMxkmZqgKFq8u5M3SretO30bMBLidkW',1,'cUkaKBgtg6YHW5fBA4tE',16),(23,'jrjones@rollins.edu','$2a$10$FO4kWQ7xkFcF10vUC4zueevvrOPA9b4/T.i5k8raEA.76G.LGhuHi',1,'OEI30o0tOYGFOTotTd3O',NULL),(24,'testing@gmail.com','$2a$10$ZxDwZv4HH1pQBMTrQjwOEeYwgM9ewiwV5zEQb7yF0qQWjfp5JqD9m',1,'yCE7YDc0tsQ2QO9kg8GG',NULL),(25,'evan.e.jones@gmail.com','$2a$10$wS5LjTllmNbnQugn0RHrteL21RDKeEYdMZNPCc3KUi9G6qFPn4v6C',1,'ubx2x0w4s8IVlVLtxHFN',NULL),(26,'info@highpointclimbing.com','$2a$10$I.N.rmQH.OgRFKxH3YXyNOx2BTxeRdDDaNFNUJgo3jltNhS9RMGsK',2,'xKzBYQdhDJ0K3822RiZO',17),(27,'nkaraze@gmail.com','$2a$10$jVqIr9u2vFDo8wuX5hwdDOKh6RD4lIOvbmmg9FkG8UyB6Vd0SvJEC',1,'Z0SnzDE7gMr3kf2CgPkX',NULL),(29,'mbird7260@gmail.com','$2a$10$dSbduBzS2z2CA.T18wc3VexhqNAjQwQhf4HlmUkfPfmhkGPfq64wK',1,'PP7W1KVOt1nJBWBVsKBK',NULL),(30,'info@onthedgerockclimbing.com','$2a$10$Ye2MhsIX.4bKvOvS8pBDfe9La69392zLbHthXIxAKl4NNnBZ7p.Bq',2,'HlofkGfmw4dBdZwQbcJG',NULL),(31,'austin.lawicki@gmail.com','$2a$10$63rA6dnrG4oeKn7miTK3e.0CSi.i2g6lUzOrLd3JLNQK0CJxw6Gm6',1,'rBUJkTTMbJvsfq3ELUS7',NULL),(32,'some_guest_account_yIU36mn8Jxk1sXgk0LTy@nothing.com','$2a$10$mDRcldQ0nPRKVhaAk3WQ8.i43kbFPvomQGFub7kNpw62Fo3AphH2q',1,'Jz4zWhts83Eh1hQsPBYN',NULL),(33,'alexnajoh@gmail.com','$2a$10$Sbniy8zoWfePhjBN70fLo.sGX6c4zwAzQw1ooNy5oQEl9reoWUpmq',1,'zSxwwANkgIWSmsBhp4eG',NULL),(34,'info@x-tremerock.com','$2a$10$WnHqaLYZ5v7wc8FQprHSwOLZHZ6XY8apoZifWXTBlPas9U0fyFy7C',2,'Ny38AzzxORMlIheOEPu9',NULL),(35,'some_guest_account_HeN88GA64hGAEkUzdchh@nothing.com','$2a$10$6QLEic4sIs2TfEKoqItSWulQFH2gjTr6Twou23jA7R47O7N6Otn7u',1,'sD3bgiZlMFlanFpQnLXd',NULL),(36,'hanleyhankins.nick@knights.ucf.edu','$2a$10$Ik2XQDC/oO8ivQiIn.1VGuispV2KAJGe7WWeqGpfaOpyaM8vvF86e',1,'SOWPKQRa79UdgGbFodbm',NULL),(37,'peter.steffey@earthlink.net','$2a$10$Dk3lBL92GSoE0MiR.YJLOOUGARrF62XegHubrNGSmX3Em1HujRqC6',1,'W67v6MK1xAkGTEKnvLiO',NULL),(38,'logemister02@aim.com','$2a$10$f2ys2KdYYrCNr.ZuDFg5Je1ZQQEQG3ciHO1opPgVFZc4G4bC4xy5W',1,'adiAOEsdhkFr7l1NNDN0',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,'images/uploads/4c82dbd85010524176400386ad30f777.jpg'),(2,'images/uploads/f4fa9694f0ae922f92cce03c3165d951.jpg'),(3,'images/uploads/2bde9f9979a420529f380f84e3067634.jpg'),(4,'images/uploads/cc91390a9c2ddc1ee42e84e24aa7b707.jpg'),(5,'images/uploads/fae4b2913034700a0942eeffd4fedcc6.jpg'),(6,'images/uploads/577ab3191ea77cfc40af39b810452ae2.jpg'),(7,'images/uploads/9803ddad25ec96ed1b764cb14883f407.jpg'),(8,'images/uploads/43a60e7ee90456ebf8fdaa56c2cade0e.jpg'),(9,'images/uploads/2e9a08ed0888dad6762ffadc4de47af0.JPG'),(10,'images/uploads/fe2dc046d37f6dc506a59c35791bbc02.JPG'),(11,'images/uploads/1ae9f928545b5a9d07bc33c6ca974b6e.jpg'),(12,'images/uploads/129918b36e174f610bb672eec8e59b42.jpg'),(13,'images/uploads/c8c2388c29afbce28121b0af358ab41e.jpg'),(14,'images/uploads/0b08a23b94da694397ee68cb0da49de2.jpg'),(15,'images/uploads/93a6b79f321f930d496249fbb67b6595.jpg'),(16,'images/uploads/9a453f14624b45227ea505dc983ce7ce.jpg'),(17,'images/uploads/8337c5afcb7c1cd5bc2de6aeb4d9f7bf.png'),(18,'images/uploads/293aeeaa9cbe9d906bf5019722a59464.png'),(19,'images/uploads/e58b1cdd873b50d5dd3121ac413685c1.png'),(20,'images/uploads/865e11f4a5e09a9c87898ac079ddd0f0.png'),(21,'images/uploads/d96502cd16f38973e482a1ce6c1ed6d4.png'),(22,'images/uploads/7d81b945df002b0dda1324cc03a19ea0.jpg'),(23,'images/uploads/99c486f5af343f76d659522806b72185.jpg'),(24,'images/uploads/c864e9ab78cfa944d61ed055dfa7b71e.jpg'),(25,'images/uploads/4daed986600d9efc26a062b6eb184dbb.jpg');
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
INSERT INTO `ratings` VALUES (13,3,5),(13,8,4),(13,9,4),(13,20,3),(14,3,4),(14,8,2),(14,20,4),(15,3,3),(15,8,3),(15,20,5),(16,3,3),(16,8,4),(16,20,1),(17,3,2),(18,1,4),(18,3,4),(18,8,3),(18,17,5),(18,31,4),(19,1,3),(19,3,5),(19,8,3),(19,20,5),(20,3,3),(20,8,3),(20,20,2),(21,3,4),(21,8,3),(21,20,4),(22,1,5),(22,3,5),(22,8,5),(22,17,5),(23,1,3),(23,3,4),(23,8,5),(23,17,4),(23,20,1),(24,3,5),(24,8,5),(24,20,3),(25,3,5),(25,8,4),(25,17,4),(25,20,3),(67,8,3),(67,16,4),(67,21,3),(68,1,5),(68,21,5),(69,1,4),(69,8,4),(69,16,4),(69,21,5),(70,4,4),(70,8,2),(70,21,3),(71,8,3),(71,21,4),(72,1,4),(72,8,4),(72,16,5),(72,21,4),(73,4,2),(73,8,1),(73,21,3),(74,8,3),(74,20,4),(74,21,3),(75,1,5),(75,21,3),(76,20,3),(84,20,4),(85,20,4),(86,20,3),(88,20,3),(116,3,3),(117,3,4),(117,8,4),(117,20,5),(117,31,4),(118,3,4),(118,8,4),(118,20,5),(129,8,3),(137,20,4),(138,17,4),(147,8,4),(148,3,2),(149,3,2),(149,8,4),(149,20,4),(150,3,4),(150,8,3),(151,3,3),(151,8,4),(151,20,4),(152,3,3),(152,8,3),(152,20,2),(153,3,3),(154,3,3),(155,3,5),(155,8,4),(155,20,4),(156,3,4),(157,3,4),(158,3,4),(158,20,4),(159,3,4),(160,3,3),(161,3,4),(162,3,4),(163,3,3),(164,3,4),(164,8,4),(165,3,3),(166,3,3),(167,3,3),(168,3,4),(168,8,4),(169,3,4),(170,8,3),(170,16,4),(170,20,4),(170,21,5),(171,8,2),(171,16,4),(171,20,5),(171,21,3),(172,8,5),(172,21,4),(173,8,3),(173,21,4),(174,20,3),(174,21,3),(175,4,4),(175,20,3),(175,21,3),(176,20,4),(176,21,3),(176,27,4),(177,4,1),(177,20,4),(177,21,3),(178,4,4),(178,20,4),(178,21,3),(179,8,4),(180,8,3),(181,8,4),(182,16,4),(185,4,4),(185,27,1),(187,8,4),(188,8,3),(188,13,4),(188,16,3),(189,20,3),(191,4,4),(191,27,3),(192,4,5),(192,8,4),(193,4,2),(194,4,3),(194,20,3),(194,21,3),(195,4,5),(195,20,3),(195,21,3),(196,1,2),(196,4,2),(196,20,2),(196,21,3),(197,8,5),(197,20,3),(197,21,5),(198,4,4),(198,8,5),(198,20,4),(199,1,4),(199,8,5),(199,21,3),(200,1,5),(200,8,5),(200,9,5),(201,8,3),(201,20,3),(202,8,3),(202,20,4),(202,21,4),(203,4,3),(203,21,4),(204,4,5),(204,17,5),(204,20,4),(204,21,5),(205,8,4),(206,3,2),(206,8,2),(207,1,4),(207,3,2),(207,8,3),(207,20,2),(207,31,4),(209,17,4),(212,20,4),(213,20,4),(214,20,4),(215,4,4),(215,20,4),(216,4,4),(216,20,4),(217,8,5),(217,20,4),(217,31,4),(218,8,4),(218,20,3),(219,8,5),(219,20,4),(220,20,4),(221,8,4),(221,9,4),(221,20,5),(223,4,4),(223,20,4),(224,20,3),(225,20,3),(226,8,4),(226,20,5),(227,20,4),(228,20,4),(229,20,2),(231,4,3),(233,4,3),(235,31,4),(236,4,4),(237,37,3),(238,4,4),(238,31,4),(239,31,4),(240,31,4),(242,4,4),(244,3,4),(246,3,3),(247,3,3),(247,8,2),(248,3,2),(248,8,3),(249,3,4),(249,8,4),(249,31,5),(250,3,3),(250,8,4),(250,9,4),(251,3,3),(251,8,4),(251,31,4),(252,3,4),(252,8,3),(252,9,4),(253,3,4),(253,8,3),(253,31,5),(254,3,2),(254,8,3),(254,37,4),(255,3,3),(255,4,4),(255,31,4),(256,3,3),(256,8,2),(256,31,4),(257,3,2),(257,4,1),(258,3,4),(258,4,4),(259,1,3),(259,3,3),(259,4,3),(259,31,3),(260,3,4),(260,9,5),(264,3,5),(264,31,5),(264,37,5),(265,4,4),(265,31,3),(266,3,2),(266,4,3),(266,31,5),(267,3,3),(268,3,4),(268,4,3),(268,31,4),(269,37,4),(270,37,3),(271,3,3),(271,4,4),(271,31,3),(274,3,3),(274,4,3),(274,31,4),(275,3,2),(275,4,4),(275,31,4),(276,3,3),(276,31,5),(277,3,3),(277,4,3),(277,31,3),(278,3,3),(279,3,4),(279,4,5),(279,31,5),(280,4,4),(280,31,4),(281,31,3),(282,3,4),(282,4,4),(282,31,5),(283,3,5),(284,3,5),(284,31,5),(285,3,4),(285,37,3),(286,3,3),(287,3,3),(287,31,4),(288,3,4),(289,3,5),(289,37,5),(291,3,3),(292,3,3),(293,3,5),(294,3,5),(295,37,4),(296,3,4),(297,3,3),(298,3,4),(299,3,4),(337,1,3),(339,1,5),(340,1,4),(354,1,4),(358,1,4),(359,1,5),(360,1,5),(364,1,4),(365,1,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=3534 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route_new_to_user`
--

LOCK TABLES `route_new_to_user` WRITE;
/*!40000 ALTER TABLE `route_new_to_user` DISABLE KEYS */;
INSERT INTO `route_new_to_user` VALUES (18,2,21,1,208),(19,2,21,3,208),(20,2,21,4,208),(21,2,21,6,208),(22,2,21,7,208),(23,2,21,8,208),(25,2,21,10,208),(26,2,21,13,208),(27,2,21,14,208),(28,2,21,15,208),(29,2,21,16,208),(30,2,21,17,208),(32,2,21,21,208),(33,2,21,24,208),(34,2,21,25,208),(35,2,21,1,209),(36,2,21,3,209),(37,2,21,4,209),(38,2,21,6,209),(39,2,21,7,209),(42,2,21,10,209),(43,2,21,13,209),(44,2,21,14,209),(45,2,21,15,209),(46,2,21,16,209),(49,2,21,21,209),(50,2,21,24,209),(51,2,21,25,209),(1859,2,22,1,300),(1860,2,22,3,300),(1861,2,22,4,300),(1862,2,22,6,300),(1863,2,22,7,300),(1864,2,22,8,300),(1865,2,22,9,300),(1866,2,22,10,300),(1867,2,22,13,300),(1868,2,22,14,300),(1869,2,22,15,300),(1870,2,22,16,300),(1871,2,22,17,300),(1872,2,22,20,300),(1873,2,22,21,300),(1874,2,22,24,300),(1875,2,22,25,300),(1876,2,22,27,300),(1877,2,22,29,300),(1878,2,22,31,300),(1879,2,22,32,300),(1880,2,22,33,300),(1881,2,22,36,300),(1882,2,22,37,300),(1883,2,22,38,300),(1884,2,22,1,301),(1885,2,22,3,301),(1886,2,22,4,301),(1887,2,22,6,301),(1888,2,22,7,301),(1889,2,22,8,301),(1890,2,22,9,301),(1891,2,22,10,301),(1892,2,22,13,301),(1893,2,22,14,301),(1894,2,22,15,301),(1895,2,22,16,301),(1896,2,22,17,301),(1897,2,22,20,301),(1898,2,22,21,301),(1899,2,22,24,301),(1900,2,22,25,301),(1901,2,22,27,301),(1902,2,22,29,301),(1903,2,22,31,301),(1904,2,22,32,301),(1905,2,22,33,301),(1906,2,22,36,301),(1907,2,22,37,301),(1908,2,22,38,301),(1909,2,24,1,302),(1910,2,24,3,302),(1911,2,24,4,302),(1912,2,24,6,302),(1913,2,24,7,302),(1914,2,24,8,302),(1915,2,24,9,302),(1916,2,24,10,302),(1917,2,24,13,302),(1918,2,24,14,302),(1919,2,24,15,302),(1920,2,24,16,302),(1921,2,24,17,302),(1922,2,24,20,302),(1923,2,24,21,302),(1924,2,24,24,302),(1925,2,24,25,302),(1926,2,24,27,302),(1927,2,24,29,302),(1928,2,24,31,302),(1929,2,24,32,302),(1930,2,24,33,302),(1931,2,24,36,302),(1932,2,24,37,302),(1933,2,24,38,302),(1934,2,24,1,303),(1935,2,24,3,303),(1936,2,24,4,303),(1937,2,24,6,303),(1938,2,24,7,303),(1939,2,24,8,303),(1940,2,24,9,303),(1941,2,24,10,303),(1942,2,24,13,303),(1943,2,24,14,303),(1944,2,24,15,303),(1945,2,24,16,303),(1946,2,24,17,303),(1947,2,24,20,303),(1948,2,24,21,303),(1949,2,24,24,303),(1950,2,24,25,303),(1951,2,24,27,303),(1952,2,24,29,303),(1953,2,24,31,303),(1954,2,24,32,303),(1955,2,24,33,303),(1956,2,24,36,303),(1957,2,24,37,303),(1958,2,24,38,303),(1959,2,25,1,304),(1960,2,25,3,304),(1961,2,25,4,304),(1962,2,25,6,304),(1963,2,25,7,304),(1964,2,25,8,304),(1965,2,25,9,304),(1966,2,25,10,304),(1967,2,25,13,304),(1968,2,25,14,304),(1969,2,25,15,304),(1970,2,25,16,304),(1971,2,25,17,304),(1972,2,25,20,304),(1973,2,25,21,304),(1974,2,25,24,304),(1975,2,25,25,304),(1976,2,25,27,304),(1977,2,25,29,304),(1978,2,25,31,304),(1979,2,25,32,304),(1980,2,25,33,304),(1981,2,25,36,304),(1982,2,25,37,304),(1983,2,25,38,304),(1984,2,26,1,305),(1985,2,26,3,305),(1986,2,26,4,305),(1987,2,26,6,305),(1988,2,26,7,305),(1989,2,26,8,305),(1990,2,26,9,305),(1991,2,26,10,305),(1992,2,26,13,305),(1993,2,26,14,305),(1994,2,26,15,305),(1995,2,26,16,305),(1996,2,26,17,305),(1997,2,26,20,305),(1998,2,26,21,305),(1999,2,26,24,305),(2000,2,26,25,305),(2001,2,26,27,305),(2002,2,26,29,305),(2003,2,26,31,305),(2004,2,26,32,305),(2005,2,26,33,305),(2006,2,26,36,305),(2007,2,26,37,305),(2008,2,26,38,305),(2009,2,27,1,306),(2010,2,27,3,306),(2011,2,27,4,306),(2012,2,27,6,306),(2013,2,27,7,306),(2014,2,27,8,306),(2015,2,27,9,306),(2016,2,27,10,306),(2017,2,27,13,306),(2018,2,27,14,306),(2019,2,27,15,306),(2020,2,27,16,306),(2021,2,27,17,306),(2022,2,27,20,306),(2023,2,27,21,306),(2024,2,27,24,306),(2025,2,27,25,306),(2026,2,27,27,306),(2027,2,27,29,306),(2028,2,27,31,306),(2029,2,27,32,306),(2030,2,27,33,306),(2031,2,27,36,306),(2032,2,27,37,306),(2033,2,27,38,306),(2034,2,27,1,307),(2035,2,27,3,307),(2036,2,27,4,307),(2037,2,27,6,307),(2038,2,27,7,307),(2039,2,27,8,307),(2040,2,27,9,307),(2041,2,27,10,307),(2042,2,27,13,307),(2043,2,27,14,307),(2044,2,27,15,307),(2045,2,27,16,307),(2046,2,27,17,307),(2047,2,27,20,307),(2048,2,27,21,307),(2049,2,27,24,307),(2050,2,27,25,307),(2051,2,27,27,307),(2052,2,27,29,307),(2053,2,27,31,307),(2054,2,27,32,307),(2055,2,27,33,307),(2056,2,27,36,307),(2057,2,27,37,307),(2058,2,27,38,307),(2059,2,29,1,308),(2060,2,29,3,308),(2061,2,29,4,308),(2062,2,29,6,308),(2063,2,29,7,308),(2064,2,29,8,308),(2065,2,29,9,308),(2066,2,29,10,308),(2067,2,29,13,308),(2068,2,29,14,308),(2069,2,29,15,308),(2070,2,29,16,308),(2071,2,29,17,308),(2072,2,29,20,308),(2073,2,29,21,308),(2074,2,29,24,308),(2075,2,29,25,308),(2076,2,29,27,308),(2077,2,29,29,308),(2078,2,29,31,308),(2079,2,29,32,308),(2080,2,29,33,308),(2081,2,29,36,308),(2082,2,29,37,308),(2083,2,29,38,308),(2084,2,30,1,309),(2085,2,30,3,309),(2086,2,30,4,309),(2087,2,30,6,309),(2088,2,30,7,309),(2089,2,30,8,309),(2090,2,30,9,309),(2091,2,30,10,309),(2092,2,30,13,309),(2093,2,30,14,309),(2094,2,30,15,309),(2095,2,30,16,309),(2096,2,30,17,309),(2097,2,30,20,309),(2098,2,30,21,309),(2099,2,30,24,309),(2100,2,30,25,309),(2101,2,30,27,309),(2102,2,30,29,309),(2103,2,30,31,309),(2104,2,30,32,309),(2105,2,30,33,309),(2106,2,30,36,309),(2107,2,30,37,309),(2108,2,30,38,309),(2109,2,30,1,310),(2110,2,30,3,310),(2111,2,30,4,310),(2112,2,30,6,310),(2113,2,30,7,310),(2114,2,30,8,310),(2115,2,30,9,310),(2116,2,30,10,310),(2117,2,30,13,310),(2118,2,30,14,310),(2119,2,30,15,310),(2120,2,30,16,310),(2121,2,30,17,310),(2122,2,30,20,310),(2123,2,30,21,310),(2124,2,30,24,310),(2125,2,30,25,310),(2126,2,30,27,310),(2127,2,30,29,310),(2128,2,30,31,310),(2129,2,30,32,310),(2130,2,30,33,310),(2131,2,30,36,310),(2132,2,30,37,310),(2133,2,30,38,310),(2134,2,31,1,311),(2135,2,31,3,311),(2136,2,31,4,311),(2137,2,31,6,311),(2138,2,31,7,311),(2139,2,31,8,311),(2140,2,31,9,311),(2141,2,31,10,311),(2142,2,31,13,311),(2143,2,31,14,311),(2144,2,31,15,311),(2145,2,31,16,311),(2146,2,31,17,311),(2147,2,31,20,311),(2148,2,31,21,311),(2149,2,31,24,311),(2150,2,31,25,311),(2151,2,31,27,311),(2152,2,31,29,311),(2153,2,31,31,311),(2154,2,31,32,311),(2155,2,31,33,311),(2156,2,31,36,311),(2157,2,31,37,311),(2158,2,31,38,311),(2159,2,32,1,312),(2160,2,32,3,312),(2161,2,32,4,312),(2162,2,32,6,312),(2163,2,32,7,312),(2164,2,32,8,312),(2165,2,32,9,312),(2166,2,32,10,312),(2167,2,32,13,312),(2168,2,32,14,312),(2169,2,32,15,312),(2170,2,32,16,312),(2171,2,32,17,312),(2172,2,32,20,312),(2173,2,32,21,312),(2174,2,32,24,312),(2175,2,32,25,312),(2176,2,32,27,312),(2177,2,32,29,312),(2178,2,32,31,312),(2179,2,32,32,312),(2180,2,32,33,312),(2181,2,32,36,312),(2182,2,32,37,312),(2183,2,32,38,312),(2184,2,33,1,313),(2185,2,33,3,313),(2186,2,33,4,313),(2187,2,33,6,313),(2188,2,33,7,313),(2189,2,33,8,313),(2190,2,33,9,313),(2191,2,33,10,313),(2192,2,33,13,313),(2193,2,33,14,313),(2194,2,33,15,313),(2195,2,33,16,313),(2196,2,33,17,313),(2197,2,33,20,313),(2198,2,33,21,313),(2199,2,33,24,313),(2200,2,33,25,313),(2201,2,33,27,313),(2202,2,33,29,313),(2203,2,33,31,313),(2204,2,33,32,313),(2205,2,33,33,313),(2206,2,33,36,313),(2207,2,33,37,313),(2208,2,33,38,313),(2209,2,33,1,314),(2210,2,33,3,314),(2211,2,33,4,314),(2212,2,33,6,314),(2213,2,33,7,314),(2214,2,33,8,314),(2215,2,33,9,314),(2216,2,33,10,314),(2217,2,33,13,314),(2218,2,33,14,314),(2219,2,33,15,314),(2220,2,33,16,314),(2221,2,33,17,314),(2222,2,33,20,314),(2223,2,33,21,314),(2224,2,33,24,314),(2225,2,33,25,314),(2226,2,33,27,314),(2227,2,33,29,314),(2228,2,33,31,314),(2229,2,33,32,314),(2230,2,33,33,314),(2231,2,33,36,314),(2232,2,33,37,314),(2233,2,33,38,314),(2234,2,34,1,315),(2235,2,34,3,315),(2236,2,34,4,315),(2237,2,34,6,315),(2238,2,34,7,315),(2239,2,34,8,315),(2240,2,34,9,315),(2241,2,34,10,315),(2242,2,34,13,315),(2243,2,34,14,315),(2244,2,34,15,315),(2245,2,34,16,315),(2246,2,34,17,315),(2247,2,34,20,315),(2248,2,34,21,315),(2249,2,34,24,315),(2250,2,34,25,315),(2251,2,34,27,315),(2252,2,34,29,315),(2253,2,34,31,315),(2254,2,34,32,315),(2255,2,34,33,315),(2256,2,34,36,315),(2257,2,34,37,315),(2258,2,34,38,315),(2259,2,34,1,316),(2260,2,34,3,316),(2261,2,34,4,316),(2262,2,34,6,316),(2263,2,34,7,316),(2264,2,34,8,316),(2265,2,34,9,316),(2266,2,34,10,316),(2267,2,34,13,316),(2268,2,34,14,316),(2269,2,34,15,316),(2270,2,34,16,316),(2271,2,34,17,316),(2272,2,34,20,316),(2273,2,34,21,316),(2274,2,34,24,316),(2275,2,34,25,316),(2276,2,34,27,316),(2277,2,34,29,316),(2278,2,34,31,316),(2279,2,34,32,316),(2280,2,34,33,316),(2281,2,34,36,316),(2282,2,34,37,316),(2283,2,34,38,316),(2284,2,35,1,317),(2285,2,35,3,317),(2286,2,35,4,317),(2287,2,35,6,317),(2288,2,35,7,317),(2289,2,35,8,317),(2290,2,35,9,317),(2291,2,35,10,317),(2292,2,35,13,317),(2293,2,35,14,317),(2294,2,35,15,317),(2295,2,35,16,317),(2296,2,35,17,317),(2297,2,35,20,317),(2298,2,35,21,317),(2299,2,35,24,317),(2300,2,35,25,317),(2301,2,35,27,317),(2302,2,35,29,317),(2303,2,35,31,317),(2304,2,35,32,317),(2305,2,35,33,317),(2306,2,35,36,317),(2307,2,35,37,317),(2308,2,35,38,317),(2309,2,36,1,318),(2310,2,36,3,318),(2311,2,36,4,318),(2312,2,36,6,318),(2313,2,36,7,318),(2314,2,36,8,318),(2315,2,36,9,318),(2316,2,36,10,318),(2317,2,36,13,318),(2318,2,36,14,318),(2319,2,36,15,318),(2320,2,36,16,318),(2321,2,36,17,318),(2322,2,36,20,318),(2323,2,36,21,318),(2324,2,36,24,318),(2325,2,36,25,318),(2326,2,36,27,318),(2327,2,36,29,318),(2328,2,36,31,318),(2329,2,36,32,318),(2330,2,36,33,318),(2331,2,36,36,318),(2332,2,36,37,318),(2333,2,36,38,318),(2334,2,37,1,319),(2335,2,37,3,319),(2336,2,37,4,319),(2337,2,37,6,319),(2338,2,37,7,319),(2339,2,37,8,319),(2340,2,37,9,319),(2341,2,37,10,319),(2342,2,37,13,319),(2343,2,37,14,319),(2344,2,37,15,319),(2345,2,37,16,319),(2346,2,37,17,319),(2347,2,37,20,319),(2348,2,37,21,319),(2349,2,37,24,319),(2350,2,37,25,319),(2351,2,37,27,319),(2352,2,37,29,319),(2353,2,37,31,319),(2354,2,37,32,319),(2355,2,37,33,319),(2356,2,37,36,319),(2357,2,37,37,319),(2358,2,37,38,319),(2359,2,37,1,320),(2360,2,37,3,320),(2361,2,37,4,320),(2362,2,37,6,320),(2363,2,37,7,320),(2364,2,37,8,320),(2365,2,37,9,320),(2366,2,37,10,320),(2367,2,37,13,320),(2368,2,37,14,320),(2369,2,37,15,320),(2370,2,37,16,320),(2371,2,37,17,320),(2372,2,37,20,320),(2373,2,37,21,320),(2374,2,37,24,320),(2375,2,37,25,320),(2376,2,37,27,320),(2377,2,37,29,320),(2378,2,37,31,320),(2379,2,37,32,320),(2380,2,37,33,320),(2381,2,37,36,320),(2382,2,37,37,320),(2383,2,37,38,320),(2384,2,38,1,321),(2385,2,38,3,321),(2386,2,38,4,321),(2387,2,38,6,321),(2388,2,38,7,321),(2389,2,38,8,321),(2390,2,38,9,321),(2391,2,38,10,321),(2392,2,38,13,321),(2393,2,38,14,321),(2394,2,38,15,321),(2395,2,38,16,321),(2396,2,38,17,321),(2397,2,38,20,321),(2398,2,38,21,321),(2399,2,38,24,321),(2400,2,38,25,321),(2401,2,38,27,321),(2402,2,38,29,321),(2403,2,38,31,321),(2404,2,38,32,321),(2405,2,38,33,321),(2406,2,38,36,321),(2407,2,38,37,321),(2408,2,38,38,321),(2409,2,39,1,322),(2410,2,39,3,322),(2411,2,39,4,322),(2412,2,39,6,322),(2413,2,39,7,322),(2414,2,39,8,322),(2415,2,39,9,322),(2416,2,39,10,322),(2417,2,39,13,322),(2418,2,39,14,322),(2419,2,39,15,322),(2420,2,39,16,322),(2421,2,39,17,322),(2422,2,39,20,322),(2423,2,39,21,322),(2424,2,39,24,322),(2425,2,39,25,322),(2426,2,39,27,322),(2427,2,39,29,322),(2428,2,39,31,322),(2429,2,39,32,322),(2430,2,39,33,322),(2431,2,39,36,322),(2432,2,39,37,322),(2433,2,39,38,322),(2434,2,40,1,323),(2435,2,40,3,323),(2436,2,40,4,323),(2437,2,40,6,323),(2438,2,40,7,323),(2439,2,40,8,323),(2440,2,40,9,323),(2441,2,40,10,323),(2442,2,40,13,323),(2443,2,40,14,323),(2444,2,40,15,323),(2445,2,40,16,323),(2446,2,40,17,323),(2447,2,40,20,323),(2448,2,40,21,323),(2449,2,40,24,323),(2450,2,40,25,323),(2451,2,40,27,323),(2452,2,40,29,323),(2453,2,40,31,323),(2454,2,40,32,323),(2455,2,40,33,323),(2456,2,40,36,323),(2457,2,40,37,323),(2458,2,40,38,323),(2459,2,11,1,324),(2460,2,11,3,324),(2461,2,11,4,324),(2462,2,11,6,324),(2463,2,11,7,324),(2464,2,11,8,324),(2465,2,11,9,324),(2466,2,11,10,324),(2467,2,11,13,324),(2468,2,11,14,324),(2469,2,11,15,324),(2470,2,11,16,324),(2471,2,11,17,324),(2472,2,11,20,324),(2473,2,11,21,324),(2474,2,11,24,324),(2475,2,11,25,324),(2476,2,11,27,324),(2477,2,11,29,324),(2478,2,11,31,324),(2479,2,11,32,324),(2480,2,11,33,324),(2481,2,11,36,324),(2482,2,11,37,324),(2483,2,11,38,324),(2484,2,11,1,325),(2485,2,11,3,325),(2486,2,11,4,325),(2487,2,11,6,325),(2488,2,11,7,325),(2489,2,11,8,325),(2490,2,11,9,325),(2491,2,11,10,325),(2492,2,11,13,325),(2493,2,11,14,325),(2494,2,11,15,325),(2495,2,11,16,325),(2496,2,11,17,325),(2497,2,11,20,325),(2498,2,11,21,325),(2499,2,11,24,325),(2500,2,11,25,325),(2501,2,11,27,325),(2502,2,11,29,325),(2503,2,11,31,325),(2504,2,11,32,325),(2505,2,11,33,325),(2506,2,11,36,325),(2507,2,11,37,325),(2508,2,11,38,325),(2509,2,11,1,326),(2510,2,11,3,326),(2511,2,11,4,326),(2512,2,11,6,326),(2513,2,11,7,326),(2514,2,11,8,326),(2515,2,11,9,326),(2516,2,11,10,326),(2517,2,11,13,326),(2518,2,11,14,326),(2519,2,11,15,326),(2520,2,11,16,326),(2521,2,11,17,326),(2522,2,11,20,326),(2523,2,11,21,326),(2524,2,11,24,326),(2525,2,11,25,326),(2526,2,11,27,326),(2527,2,11,29,326),(2528,2,11,31,326),(2529,2,11,32,326),(2530,2,11,33,326),(2531,2,11,36,326),(2532,2,11,37,326),(2533,2,11,38,326),(2534,2,11,1,327),(2535,2,11,3,327),(2536,2,11,4,327),(2537,2,11,6,327),(2538,2,11,7,327),(2539,2,11,8,327),(2540,2,11,9,327),(2541,2,11,10,327),(2542,2,11,13,327),(2543,2,11,14,327),(2544,2,11,15,327),(2545,2,11,16,327),(2546,2,11,17,327),(2547,2,11,20,327),(2548,2,11,21,327),(2549,2,11,24,327),(2550,2,11,25,327),(2551,2,11,27,327),(2552,2,11,29,327),(2553,2,11,31,327),(2554,2,11,32,327),(2555,2,11,33,327),(2556,2,11,36,327),(2557,2,11,37,327),(2558,2,11,38,327),(2559,2,11,1,328),(2560,2,11,3,328),(2561,2,11,4,328),(2562,2,11,6,328),(2563,2,11,7,328),(2564,2,11,8,328),(2565,2,11,9,328),(2566,2,11,10,328),(2567,2,11,13,328),(2568,2,11,14,328),(2569,2,11,15,328),(2570,2,11,16,328),(2571,2,11,17,328),(2572,2,11,20,328),(2573,2,11,21,328),(2574,2,11,24,328),(2575,2,11,25,328),(2576,2,11,27,328),(2577,2,11,29,328),(2578,2,11,31,328),(2579,2,11,32,328),(2580,2,11,33,328),(2581,2,11,36,328),(2582,2,11,37,328),(2583,2,11,38,328),(2584,2,11,1,329),(2585,2,11,3,329),(2586,2,11,4,329),(2587,2,11,6,329),(2588,2,11,7,329),(2589,2,11,8,329),(2590,2,11,9,329),(2591,2,11,10,329),(2592,2,11,13,329),(2593,2,11,14,329),(2594,2,11,15,329),(2595,2,11,16,329),(2596,2,11,17,329),(2597,2,11,20,329),(2598,2,11,21,329),(2599,2,11,24,329),(2600,2,11,25,329),(2601,2,11,27,329),(2602,2,11,29,329),(2603,2,11,31,329),(2604,2,11,32,329),(2605,2,11,33,329),(2606,2,11,36,329),(2607,2,11,37,329),(2608,2,11,38,329),(2609,2,11,1,330),(2610,2,11,3,330),(2611,2,11,4,330),(2612,2,11,6,330),(2613,2,11,7,330),(2614,2,11,8,330),(2615,2,11,9,330),(2616,2,11,10,330),(2617,2,11,13,330),(2618,2,11,14,330),(2619,2,11,15,330),(2620,2,11,16,330),(2621,2,11,17,330),(2622,2,11,20,330),(2623,2,11,21,330),(2624,2,11,24,330),(2625,2,11,25,330),(2626,2,11,27,330),(2627,2,11,29,330),(2628,2,11,31,330),(2629,2,11,32,330),(2630,2,11,33,330),(2631,2,11,36,330),(2632,2,11,37,330),(2633,2,11,38,330),(2634,2,11,1,331),(2635,2,11,3,331),(2636,2,11,4,331),(2637,2,11,6,331),(2638,2,11,7,331),(2639,2,11,8,331),(2640,2,11,9,331),(2641,2,11,10,331),(2642,2,11,13,331),(2643,2,11,14,331),(2644,2,11,15,331),(2645,2,11,16,331),(2646,2,11,17,331),(2647,2,11,20,331),(2648,2,11,21,331),(2649,2,11,24,331),(2650,2,11,25,331),(2651,2,11,27,331),(2652,2,11,29,331),(2653,2,11,31,331),(2654,2,11,32,331),(2655,2,11,33,331),(2656,2,11,36,331),(2657,2,11,37,331),(2658,2,11,38,331),(2659,2,11,1,332),(2660,2,11,3,332),(2661,2,11,4,332),(2662,2,11,6,332),(2663,2,11,7,332),(2664,2,11,8,332),(2665,2,11,9,332),(2666,2,11,10,332),(2667,2,11,13,332),(2668,2,11,14,332),(2669,2,11,15,332),(2670,2,11,16,332),(2671,2,11,17,332),(2672,2,11,20,332),(2673,2,11,21,332),(2674,2,11,24,332),(2675,2,11,25,332),(2676,2,11,27,332),(2677,2,11,29,332),(2678,2,11,31,332),(2679,2,11,32,332),(2680,2,11,33,332),(2681,2,11,36,332),(2682,2,11,37,332),(2683,2,11,38,332),(2684,2,11,1,333),(2685,2,11,3,333),(2686,2,11,4,333),(2687,2,11,6,333),(2688,2,11,7,333),(2689,2,11,8,333),(2690,2,11,9,333),(2691,2,11,10,333),(2692,2,11,13,333),(2693,2,11,14,333),(2694,2,11,15,333),(2695,2,11,16,333),(2696,2,11,17,333),(2697,2,11,20,333),(2698,2,11,21,333),(2699,2,11,24,333),(2700,2,11,25,333),(2701,2,11,27,333),(2702,2,11,29,333),(2703,2,11,31,333),(2704,2,11,32,333),(2705,2,11,33,333),(2706,2,11,36,333),(2707,2,11,37,333),(2708,2,11,38,333),(2709,2,11,1,334),(2710,2,11,3,334),(2711,2,11,4,334),(2712,2,11,6,334),(2713,2,11,7,334),(2714,2,11,8,334),(2715,2,11,9,334),(2716,2,11,10,334),(2717,2,11,13,334),(2718,2,11,14,334),(2719,2,11,15,334),(2720,2,11,16,334),(2721,2,11,17,334),(2722,2,11,20,334),(2723,2,11,21,334),(2724,2,11,24,334),(2725,2,11,25,334),(2726,2,11,27,334),(2727,2,11,29,334),(2728,2,11,31,334),(2729,2,11,32,334),(2730,2,11,33,334),(2731,2,11,36,334),(2732,2,11,37,334),(2733,2,11,38,334),(2734,2,11,1,335),(2735,2,11,3,335),(2736,2,11,4,335),(2737,2,11,6,335),(2738,2,11,7,335),(2739,2,11,8,335),(2740,2,11,9,335),(2741,2,11,10,335),(2742,2,11,13,335),(2743,2,11,14,335),(2744,2,11,15,335),(2745,2,11,16,335),(2746,2,11,17,335),(2747,2,11,20,335),(2748,2,11,21,335),(2749,2,11,24,335),(2750,2,11,25,335),(2751,2,11,27,335),(2752,2,11,29,335),(2753,2,11,31,335),(2754,2,11,32,335),(2755,2,11,33,335),(2756,2,11,36,335),(2757,2,11,37,335),(2758,2,11,38,335),(2759,2,4,1,336),(2760,2,4,3,336),(2761,2,4,4,336),(2762,2,4,6,336),(2763,2,4,7,336),(2764,2,4,8,336),(2765,2,4,9,336),(2766,2,4,10,336),(2767,2,4,13,336),(2768,2,4,14,336),(2769,2,4,15,336),(2770,2,4,16,336),(2771,2,4,17,336),(2772,2,4,20,336),(2773,2,4,21,336),(2774,2,4,24,336),(2775,2,4,25,336),(2776,2,4,27,336),(2777,2,4,29,336),(2778,2,4,31,336),(2779,2,4,32,336),(2780,2,4,33,336),(2781,2,4,36,336),(2782,2,4,37,336),(2783,2,4,38,336),(2785,2,4,3,337),(2786,2,4,4,337),(2787,2,4,6,337),(2788,2,4,7,337),(2789,2,4,8,337),(2790,2,4,9,337),(2791,2,4,10,337),(2792,2,4,13,337),(2793,2,4,14,337),(2794,2,4,15,337),(2795,2,4,16,337),(2796,2,4,17,337),(2797,2,4,20,337),(2798,2,4,21,337),(2799,2,4,24,337),(2800,2,4,25,337),(2801,2,4,27,337),(2802,2,4,29,337),(2803,2,4,31,337),(2804,2,4,32,337),(2805,2,4,33,337),(2806,2,4,36,337),(2807,2,4,37,337),(2808,2,4,38,337),(2809,2,4,1,338),(2810,2,4,3,338),(2811,2,4,4,338),(2812,2,4,6,338),(2813,2,4,7,338),(2814,2,4,8,338),(2815,2,4,9,338),(2816,2,4,10,338),(2817,2,4,13,338),(2818,2,4,14,338),(2819,2,4,15,338),(2820,2,4,16,338),(2821,2,4,17,338),(2822,2,4,20,338),(2823,2,4,21,338),(2824,2,4,24,338),(2825,2,4,25,338),(2826,2,4,27,338),(2827,2,4,29,338),(2828,2,4,31,338),(2829,2,4,32,338),(2830,2,4,33,338),(2831,2,4,36,338),(2832,2,4,37,338),(2833,2,4,38,338),(2835,2,4,3,339),(2836,2,4,4,339),(2837,2,4,6,339),(2838,2,4,7,339),(2839,2,4,8,339),(2840,2,4,9,339),(2841,2,4,10,339),(2842,2,4,13,339),(2843,2,4,14,339),(2844,2,4,15,339),(2845,2,4,16,339),(2846,2,4,17,339),(2847,2,4,20,339),(2848,2,4,21,339),(2849,2,4,24,339),(2850,2,4,25,339),(2851,2,4,27,339),(2852,2,4,29,339),(2853,2,4,31,339),(2854,2,4,32,339),(2855,2,4,33,339),(2856,2,4,36,339),(2857,2,4,37,339),(2858,2,4,38,339),(2860,2,4,3,340),(2861,2,4,4,340),(2862,2,4,6,340),(2863,2,4,7,340),(2864,2,4,8,340),(2865,2,4,9,340),(2866,2,4,10,340),(2867,2,4,13,340),(2868,2,4,14,340),(2869,2,4,15,340),(2870,2,4,16,340),(2871,2,4,17,340),(2872,2,4,20,340),(2873,2,4,21,340),(2874,2,4,24,340),(2875,2,4,25,340),(2876,2,4,27,340),(2877,2,4,29,340),(2878,2,4,31,340),(2879,2,4,32,340),(2880,2,4,33,340),(2881,2,4,36,340),(2882,2,4,37,340),(2883,2,4,38,340),(2884,2,4,1,341),(2885,2,4,3,341),(2886,2,4,4,341),(2887,2,4,6,341),(2888,2,4,7,341),(2889,2,4,8,341),(2890,2,4,9,341),(2891,2,4,10,341),(2892,2,4,13,341),(2893,2,4,14,341),(2894,2,4,15,341),(2895,2,4,16,341),(2896,2,4,17,341),(2897,2,4,20,341),(2898,2,4,21,341),(2899,2,4,24,341),(2900,2,4,25,341),(2901,2,4,27,341),(2902,2,4,29,341),(2903,2,4,31,341),(2904,2,4,32,341),(2905,2,4,33,341),(2906,2,4,36,341),(2907,2,4,37,341),(2908,2,4,38,341),(2909,2,4,1,342),(2910,2,4,3,342),(2911,2,4,4,342),(2912,2,4,6,342),(2913,2,4,7,342),(2914,2,4,8,342),(2915,2,4,9,342),(2916,2,4,10,342),(2917,2,4,13,342),(2918,2,4,14,342),(2919,2,4,15,342),(2920,2,4,16,342),(2921,2,4,17,342),(2922,2,4,20,342),(2923,2,4,21,342),(2924,2,4,24,342),(2925,2,4,25,342),(2926,2,4,27,342),(2927,2,4,29,342),(2928,2,4,31,342),(2929,2,4,32,342),(2930,2,4,33,342),(2931,2,4,36,342),(2932,2,4,37,342),(2933,2,4,38,342),(2934,2,4,1,343),(2935,2,4,3,343),(2936,2,4,4,343),(2937,2,4,6,343),(2938,2,4,7,343),(2939,2,4,8,343),(2940,2,4,9,343),(2941,2,4,10,343),(2942,2,4,13,343),(2943,2,4,14,343),(2944,2,4,15,343),(2945,2,4,16,343),(2946,2,4,17,343),(2947,2,4,20,343),(2948,2,4,21,343),(2949,2,4,24,343),(2950,2,4,25,343),(2951,2,4,27,343),(2952,2,4,29,343),(2953,2,4,31,343),(2954,2,4,32,343),(2955,2,4,33,343),(2956,2,4,36,343),(2957,2,4,37,343),(2958,2,4,38,343),(2959,2,4,1,344),(2960,2,4,3,344),(2961,2,4,4,344),(2962,2,4,6,344),(2963,2,4,7,344),(2964,2,4,8,344),(2965,2,4,9,344),(2966,2,4,10,344),(2967,2,4,13,344),(2968,2,4,14,344),(2969,2,4,15,344),(2970,2,4,16,344),(2971,2,4,17,344),(2972,2,4,20,344),(2973,2,4,21,344),(2974,2,4,24,344),(2975,2,4,25,344),(2976,2,4,27,344),(2977,2,4,29,344),(2978,2,4,31,344),(2979,2,4,32,344),(2980,2,4,33,344),(2981,2,4,36,344),(2982,2,4,37,344),(2983,2,4,38,344),(2984,2,4,1,345),(2985,2,4,3,345),(2986,2,4,4,345),(2987,2,4,6,345),(2988,2,4,7,345),(2989,2,4,8,345),(2990,2,4,9,345),(2991,2,4,10,345),(2992,2,4,13,345),(2993,2,4,14,345),(2994,2,4,15,345),(2995,2,4,16,345),(2996,2,4,17,345),(2997,2,4,20,345),(2998,2,4,21,345),(2999,2,4,24,345),(3000,2,4,25,345),(3001,2,4,27,345),(3002,2,4,29,345),(3003,2,4,31,345),(3004,2,4,32,345),(3005,2,4,33,345),(3006,2,4,36,345),(3007,2,4,37,345),(3008,2,4,38,345),(3009,2,4,1,346),(3010,2,4,3,346),(3011,2,4,4,346),(3012,2,4,6,346),(3013,2,4,7,346),(3014,2,4,8,346),(3015,2,4,9,346),(3016,2,4,10,346),(3017,2,4,13,346),(3018,2,4,14,346),(3019,2,4,15,346),(3020,2,4,16,346),(3021,2,4,17,346),(3022,2,4,20,346),(3023,2,4,21,346),(3024,2,4,24,346),(3025,2,4,25,346),(3026,2,4,27,346),(3027,2,4,29,346),(3028,2,4,31,346),(3029,2,4,32,346),(3030,2,4,33,346),(3031,2,4,36,346),(3032,2,4,37,346),(3033,2,4,38,346),(3034,2,4,1,347),(3035,2,4,3,347),(3036,2,4,4,347),(3037,2,4,6,347),(3038,2,4,7,347),(3039,2,4,8,347),(3040,2,4,9,347),(3041,2,4,10,347),(3042,2,4,13,347),(3043,2,4,14,347),(3044,2,4,15,347),(3045,2,4,16,347),(3046,2,4,17,347),(3047,2,4,20,347),(3048,2,4,21,347),(3049,2,4,24,347),(3050,2,4,25,347),(3051,2,4,27,347),(3052,2,4,29,347),(3053,2,4,31,347),(3054,2,4,32,347),(3055,2,4,33,347),(3056,2,4,36,347),(3057,2,4,37,347),(3058,2,4,38,347),(3059,2,4,1,348),(3060,2,4,3,348),(3061,2,4,4,348),(3062,2,4,6,348),(3063,2,4,7,348),(3064,2,4,8,348),(3065,2,4,9,348),(3066,2,4,10,348),(3067,2,4,13,348),(3068,2,4,14,348),(3069,2,4,15,348),(3070,2,4,16,348),(3071,2,4,17,348),(3072,2,4,20,348),(3073,2,4,21,348),(3074,2,4,24,348),(3075,2,4,25,348),(3076,2,4,27,348),(3077,2,4,29,348),(3078,2,4,31,348),(3079,2,4,32,348),(3080,2,4,33,348),(3081,2,4,36,348),(3082,2,4,37,348),(3083,2,4,38,348),(3085,2,1,3,349),(3086,2,1,4,349),(3087,2,1,6,349),(3088,2,1,7,349),(3089,2,1,8,349),(3090,2,1,9,349),(3091,2,1,10,349),(3092,2,1,13,349),(3093,2,1,14,349),(3094,2,1,15,349),(3095,2,1,16,349),(3096,2,1,17,349),(3097,2,1,20,349),(3098,2,1,21,349),(3099,2,1,24,349),(3100,2,1,25,349),(3101,2,1,27,349),(3102,2,1,29,349),(3103,2,1,31,349),(3104,2,1,32,349),(3105,2,1,33,349),(3106,2,1,36,349),(3107,2,1,37,349),(3108,2,1,38,349),(3109,2,1,1,350),(3110,2,1,3,350),(3111,2,1,4,350),(3112,2,1,6,350),(3113,2,1,7,350),(3114,2,1,8,350),(3115,2,1,9,350),(3116,2,1,10,350),(3117,2,1,13,350),(3118,2,1,14,350),(3119,2,1,15,350),(3120,2,1,16,350),(3121,2,1,17,350),(3122,2,1,20,350),(3123,2,1,21,350),(3124,2,1,24,350),(3125,2,1,25,350),(3126,2,1,27,350),(3127,2,1,29,350),(3128,2,1,31,350),(3129,2,1,32,350),(3130,2,1,33,350),(3131,2,1,36,350),(3132,2,1,37,350),(3133,2,1,38,350),(3135,2,1,3,351),(3136,2,1,4,351),(3137,2,1,6,351),(3138,2,1,7,351),(3139,2,1,8,351),(3140,2,1,9,351),(3141,2,1,10,351),(3142,2,1,13,351),(3143,2,1,14,351),(3144,2,1,15,351),(3145,2,1,16,351),(3146,2,1,17,351),(3147,2,1,20,351),(3148,2,1,21,351),(3149,2,1,24,351),(3150,2,1,25,351),(3151,2,1,27,351),(3152,2,1,29,351),(3153,2,1,31,351),(3154,2,1,32,351),(3155,2,1,33,351),(3156,2,1,36,351),(3157,2,1,37,351),(3158,2,1,38,351),(3160,2,1,3,352),(3161,2,1,4,352),(3162,2,1,6,352),(3163,2,1,7,352),(3164,2,1,8,352),(3165,2,1,9,352),(3166,2,1,10,352),(3167,2,1,13,352),(3168,2,1,14,352),(3169,2,1,15,352),(3170,2,1,16,352),(3171,2,1,17,352),(3172,2,1,20,352),(3173,2,1,21,352),(3174,2,1,24,352),(3175,2,1,25,352),(3176,2,1,27,352),(3177,2,1,29,352),(3178,2,1,31,352),(3179,2,1,32,352),(3180,2,1,33,352),(3181,2,1,36,352),(3182,2,1,37,352),(3183,2,1,38,352),(3184,2,1,1,353),(3185,2,1,3,353),(3186,2,1,4,353),(3187,2,1,6,353),(3188,2,1,7,353),(3189,2,1,8,353),(3190,2,1,9,353),(3191,2,1,10,353),(3192,2,1,13,353),(3193,2,1,14,353),(3194,2,1,15,353),(3195,2,1,16,353),(3196,2,1,17,353),(3197,2,1,20,353),(3198,2,1,21,353),(3199,2,1,24,353),(3200,2,1,25,353),(3201,2,1,27,353),(3202,2,1,29,353),(3203,2,1,31,353),(3204,2,1,32,353),(3205,2,1,33,353),(3206,2,1,36,353),(3207,2,1,37,353),(3208,2,1,38,353),(3210,2,1,3,354),(3211,2,1,4,354),(3212,2,1,6,354),(3213,2,1,7,354),(3214,2,1,8,354),(3215,2,1,9,354),(3216,2,1,10,354),(3217,2,1,13,354),(3218,2,1,14,354),(3219,2,1,15,354),(3220,2,1,16,354),(3221,2,1,17,354),(3222,2,1,20,354),(3223,2,1,21,354),(3224,2,1,24,354),(3225,2,1,25,354),(3226,2,1,27,354),(3227,2,1,29,354),(3228,2,1,31,354),(3229,2,1,32,354),(3230,2,1,33,354),(3231,2,1,36,354),(3232,2,1,37,354),(3233,2,1,38,354),(3235,2,1,3,355),(3236,2,1,4,355),(3237,2,1,6,355),(3238,2,1,7,355),(3239,2,1,8,355),(3240,2,1,9,355),(3241,2,1,10,355),(3242,2,1,13,355),(3243,2,1,14,355),(3244,2,1,15,355),(3245,2,1,16,355),(3246,2,1,17,355),(3247,2,1,20,355),(3248,2,1,21,355),(3249,2,1,24,355),(3250,2,1,25,355),(3251,2,1,27,355),(3252,2,1,29,355),(3253,2,1,31,355),(3254,2,1,32,355),(3255,2,1,33,355),(3256,2,1,36,355),(3257,2,1,37,355),(3258,2,1,38,355),(3260,2,1,3,356),(3261,2,1,4,356),(3262,2,1,6,356),(3263,2,1,7,356),(3264,2,1,8,356),(3265,2,1,9,356),(3266,2,1,10,356),(3267,2,1,13,356),(3268,2,1,14,356),(3269,2,1,15,356),(3270,2,1,16,356),(3271,2,1,17,356),(3272,2,1,20,356),(3273,2,1,21,356),(3274,2,1,24,356),(3275,2,1,25,356),(3276,2,1,27,356),(3277,2,1,29,356),(3278,2,1,31,356),(3279,2,1,32,356),(3280,2,1,33,356),(3281,2,1,36,356),(3282,2,1,37,356),(3283,2,1,38,356),(3285,2,2,3,357),(3286,2,2,4,357),(3287,2,2,6,357),(3288,2,2,7,357),(3289,2,2,8,357),(3290,2,2,9,357),(3291,2,2,10,357),(3292,2,2,13,357),(3293,2,2,14,357),(3294,2,2,15,357),(3295,2,2,16,357),(3296,2,2,17,357),(3297,2,2,20,357),(3298,2,2,21,357),(3299,2,2,24,357),(3300,2,2,25,357),(3301,2,2,27,357),(3302,2,2,29,357),(3303,2,2,31,357),(3304,2,2,32,357),(3305,2,2,33,357),(3306,2,2,36,357),(3307,2,2,37,357),(3308,2,2,38,357),(3310,2,2,3,358),(3311,2,2,4,358),(3312,2,2,6,358),(3313,2,2,7,358),(3314,2,2,8,358),(3315,2,2,9,358),(3316,2,2,10,358),(3317,2,2,13,358),(3318,2,2,14,358),(3319,2,2,15,358),(3320,2,2,16,358),(3321,2,2,17,358),(3322,2,2,20,358),(3323,2,2,21,358),(3324,2,2,24,358),(3325,2,2,25,358),(3326,2,2,27,358),(3327,2,2,29,358),(3328,2,2,31,358),(3329,2,2,32,358),(3330,2,2,33,358),(3331,2,2,36,358),(3332,2,2,37,358),(3333,2,2,38,358),(3335,2,2,3,359),(3336,2,2,4,359),(3337,2,2,6,359),(3338,2,2,7,359),(3339,2,2,8,359),(3340,2,2,9,359),(3341,2,2,10,359),(3342,2,2,13,359),(3343,2,2,14,359),(3344,2,2,15,359),(3345,2,2,16,359),(3346,2,2,17,359),(3347,2,2,20,359),(3348,2,2,21,359),(3349,2,2,24,359),(3350,2,2,25,359),(3351,2,2,27,359),(3352,2,2,29,359),(3353,2,2,31,359),(3354,2,2,32,359),(3355,2,2,33,359),(3356,2,2,36,359),(3357,2,2,37,359),(3358,2,2,38,359),(3360,2,2,3,360),(3361,2,2,4,360),(3362,2,2,6,360),(3363,2,2,7,360),(3364,2,2,8,360),(3365,2,2,9,360),(3366,2,2,10,360),(3367,2,2,13,360),(3368,2,2,14,360),(3369,2,2,15,360),(3370,2,2,16,360),(3371,2,2,17,360),(3372,2,2,20,360),(3373,2,2,21,360),(3374,2,2,24,360),(3375,2,2,25,360),(3376,2,2,27,360),(3377,2,2,29,360),(3378,2,2,31,360),(3379,2,2,32,360),(3380,2,2,33,360),(3381,2,2,36,360),(3382,2,2,37,360),(3383,2,2,38,360),(3384,2,3,1,361),(3385,2,3,3,361),(3386,2,3,4,361),(3387,2,3,6,361),(3388,2,3,7,361),(3389,2,3,8,361),(3390,2,3,9,361),(3391,2,3,10,361),(3392,2,3,13,361),(3393,2,3,14,361),(3394,2,3,15,361),(3395,2,3,16,361),(3396,2,3,17,361),(3397,2,3,20,361),(3398,2,3,21,361),(3399,2,3,24,361),(3400,2,3,25,361),(3401,2,3,27,361),(3402,2,3,29,361),(3403,2,3,31,361),(3404,2,3,32,361),(3405,2,3,33,361),(3406,2,3,36,361),(3407,2,3,37,361),(3408,2,3,38,361),(3409,2,3,1,362),(3410,2,3,3,362),(3411,2,3,4,362),(3412,2,3,6,362),(3413,2,3,7,362),(3414,2,3,8,362),(3415,2,3,9,362),(3416,2,3,10,362),(3417,2,3,13,362),(3418,2,3,14,362),(3419,2,3,15,362),(3420,2,3,16,362),(3421,2,3,17,362),(3422,2,3,20,362),(3423,2,3,21,362),(3424,2,3,24,362),(3425,2,3,25,362),(3426,2,3,27,362),(3427,2,3,29,362),(3428,2,3,31,362),(3429,2,3,32,362),(3430,2,3,33,362),(3431,2,3,36,362),(3432,2,3,37,362),(3433,2,3,38,362),(3434,2,3,1,363),(3435,2,3,3,363),(3436,2,3,4,363),(3437,2,3,6,363),(3438,2,3,7,363),(3439,2,3,8,363),(3440,2,3,9,363),(3441,2,3,10,363),(3442,2,3,13,363),(3443,2,3,14,363),(3444,2,3,15,363),(3445,2,3,16,363),(3446,2,3,17,363),(3447,2,3,20,363),(3448,2,3,21,363),(3449,2,3,24,363),(3450,2,3,25,363),(3451,2,3,27,363),(3452,2,3,29,363),(3453,2,3,31,363),(3454,2,3,32,363),(3455,2,3,33,363),(3456,2,3,36,363),(3457,2,3,37,363),(3458,2,3,38,363),(3460,2,3,3,364),(3461,2,3,4,364),(3462,2,3,6,364),(3463,2,3,7,364),(3464,2,3,8,364),(3465,2,3,9,364),(3466,2,3,10,364),(3467,2,3,13,364),(3468,2,3,14,364),(3469,2,3,15,364),(3470,2,3,16,364),(3471,2,3,17,364),(3472,2,3,20,364),(3473,2,3,21,364),(3474,2,3,24,364),(3475,2,3,25,364),(3476,2,3,27,364),(3477,2,3,29,364),(3478,2,3,31,364),(3479,2,3,32,364),(3480,2,3,33,364),(3481,2,3,36,364),(3482,2,3,37,364),(3483,2,3,38,364),(3485,2,3,3,365),(3486,2,3,4,365),(3487,2,3,6,365),(3488,2,3,7,365),(3489,2,3,8,365),(3490,2,3,9,365),(3491,2,3,10,365),(3492,2,3,13,365),(3493,2,3,14,365),(3494,2,3,15,365),(3495,2,3,16,365),(3496,2,3,17,365),(3497,2,3,20,365),(3498,2,3,21,365),(3499,2,3,24,365),(3500,2,3,25,365),(3501,2,3,27,365),(3502,2,3,29,365),(3503,2,3,31,365),(3504,2,3,32,365),(3505,2,3,33,365),(3506,2,3,36,365),(3507,2,3,37,365),(3508,2,3,38,365),(3510,2,3,3,366),(3511,2,3,4,366),(3512,2,3,6,366),(3513,2,3,7,366),(3514,2,3,8,366),(3515,2,3,9,366),(3516,2,3,10,366),(3517,2,3,13,366),(3518,2,3,14,366),(3519,2,3,15,366),(3520,2,3,16,366),(3521,2,3,17,366),(3522,2,3,20,366),(3523,2,3,21,366),(3524,2,3,24,366),(3525,2,3,25,366),(3526,2,3,27,366),(3527,2,3,29,366),(3528,2,3,31,366),(3529,2,3,32,366),(3530,2,3,33,366),(3531,2,3,36,366),(3532,2,3,37,366),(3533,2,3,38,366);
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
) ENGINE=InnoDB AUTO_INCREMENT=367 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routes`
--

LOCK TABLES `routes` WRITE;
/*!40000 ALTER TABLE `routes` DISABLE KEYS */;
INSERT INTO `routes` VALUES (13,'',NULL,NULL,13,3,'','2014-12-16 21:59:12',0,11,5,2),(14,'',NULL,NULL,9,3,'','2014-12-16 21:59:32',0,11,5,2),(15,'',NULL,NULL,10,8,'','2014-12-16 21:59:40',0,11,7,2),(16,'',NULL,NULL,3,6,'','2014-12-16 21:59:48',0,11,5,2),(17,'',NULL,NULL,11,6,'','2014-12-16 21:59:56',0,11,7,2),(18,'',NULL,NULL,15,3,'','2014-12-16 22:00:02',0,11,3,2),(19,'',NULL,NULL,3,3,'','2014-12-16 22:00:10',0,11,3,2),(20,'',NULL,NULL,8,6,'','2014-12-16 22:00:16',0,11,6,2),(21,'',NULL,NULL,10,3,'','2014-12-16 22:00:22',0,11,6,2),(22,'',NULL,NULL,11,8,'','2014-12-16 22:00:29',0,11,4,2),(23,'',NULL,NULL,13,3,'','2014-12-16 22:00:41',0,11,3,2),(24,'',NULL,NULL,9,3,'','2014-12-16 22:00:48',0,11,7,2),(25,'',NULL,NULL,1,3,'','2014-12-16 22:01:02',0,11,4,2),(67,'',6,NULL,3,3,'','2014-12-16 22:09:27',0,5,NULL,0),(68,'',9,NULL,7,8,'','2014-12-16 22:09:36',0,5,NULL,0),(69,'',8,NULL,1,3,'','2014-12-16 22:09:40',0,5,NULL,0),(70,'',3,NULL,8,3,'','2014-12-16 22:09:45',0,5,NULL,0),(71,'',4,NULL,15,3,'','2014-12-16 22:09:52',0,5,NULL,0),(72,'',6,NULL,16,3,'','2014-12-16 22:10:02',0,5,NULL,0),(73,'',2,NULL,12,3,'','2014-12-16 22:10:09',0,5,NULL,0),(74,'',5,NULL,9,3,'','2014-12-16 22:10:14',0,5,NULL,0),(75,'',7,NULL,13,3,'','2014-12-16 22:10:19',0,5,NULL,0),(76,'',NULL,NULL,9,3,'','2014-12-16 22:10:47',0,4,NULL,0),(77,'',NULL,NULL,1,3,'','2014-12-16 22:10:54',0,4,NULL,0),(78,'',NULL,NULL,15,3,'','2014-12-16 22:10:59',0,4,NULL,0),(79,'',NULL,NULL,16,3,'','2014-12-16 22:11:02',0,4,NULL,0),(80,'',NULL,NULL,7,3,'','2014-12-16 22:11:05',0,4,NULL,0),(81,'',NULL,NULL,10,3,'','2014-12-16 22:11:09',0,4,NULL,0),(82,'',NULL,NULL,11,3,'','2014-12-16 22:11:12',0,4,NULL,0),(83,'',NULL,NULL,7,3,'','2014-12-16 22:11:16',0,4,NULL,0),(84,'',NULL,NULL,11,3,'','2014-12-16 22:11:18',0,4,NULL,0),(85,'',NULL,NULL,3,3,'','2014-12-16 22:11:21',0,4,NULL,0),(86,'',NULL,NULL,13,3,'','2014-12-16 22:11:24',0,4,NULL,0),(87,'',NULL,NULL,9,3,'','2014-12-16 22:11:27',0,4,NULL,0),(88,'',NULL,NULL,12,3,'','2014-12-16 22:11:30',0,4,NULL,0),(89,'',NULL,NULL,16,3,'','2014-12-16 22:11:34',0,4,NULL,0),(116,'',NULL,NULL,15,8,'','2014-12-29 15:20:06',0,11,8,2),(117,'',NULL,NULL,7,3,'','2014-12-29 15:27:49',0,11,4,2),(118,'',NULL,NULL,1,10,'','2014-12-29 15:33:11',0,11,7,2),(121,'',NULL,1,16,3,'','2014-12-29 15:37:08',1,12,NULL,1),(122,'',NULL,1,16,3,'','2014-12-29 15:37:24',1,13,NULL,1),(123,'',NULL,1,16,3,'','2014-12-29 15:37:42',1,14,NULL,1),(124,'',NULL,4,16,3,'','2014-12-29 15:37:58',1,15,NULL,1),(125,'',NULL,1,16,3,'','2014-12-29 15:38:04',1,15,NULL,1),(126,'',NULL,1,16,3,'','2014-12-29 15:40:25',1,16,NULL,1),(127,'',NULL,1,16,3,'','2014-12-29 15:40:47',1,17,NULL,1),(128,'',NULL,4,9,8,'','2014-12-29 15:41:24',1,18,NULL,1),(129,'',NULL,5,3,10,'','2014-12-29 15:41:37',1,18,NULL,1),(134,'',NULL,3,1,6,'','2014-12-29 16:00:49',0,21,NULL,1),(135,'',NULL,5,7,8,'','2014-12-29 16:00:57',0,21,NULL,1),(136,'',NULL,2,13,3,'','2014-12-29 16:04:06',0,22,NULL,1),(137,'',NULL,5,6,8,'','2014-12-29 16:04:23',0,22,NULL,1),(138,'',NULL,6,1,3,'','2014-12-29 16:04:33',0,22,NULL,1),(139,'',NULL,2,9,3,'','2014-12-29 16:05:04',0,24,NULL,1),(140,'',NULL,3,10,3,'','2014-12-29 16:05:12',0,24,NULL,1),(141,'',NULL,3,1,3,'','2014-12-29 16:05:46',0,25,NULL,1),(142,'',NULL,4,6,6,'','2014-12-29 16:06:08',0,25,NULL,1),(143,'',NULL,2,12,3,'','2014-12-29 16:06:29',0,26,NULL,1),(144,'',NULL,2,1,3,'','2014-12-29 16:07:23',0,27,NULL,1),(145,'',NULL,5,3,6,'','2014-12-29 16:07:30',0,27,NULL,1),(146,'',NULL,4,10,8,'','2014-12-29 16:08:28',0,29,NULL,1),(147,'',NULL,6,7,3,'','2014-12-29 16:08:42',0,29,NULL,1),(148,'',NULL,4,6,8,'','2014-12-29 16:09:10',0,30,NULL,1),(149,'',NULL,7,9,6,'','2014-12-29 16:09:19',0,30,NULL,1),(150,'',NULL,4,11,3,'','2014-12-29 16:11:11',0,31,NULL,1),(151,'',NULL,5,12,10,'','2014-12-29 16:11:19',0,31,NULL,1),(152,'',NULL,6,10,6,'','2014-12-29 16:11:28',0,31,NULL,1),(153,'',NULL,1,16,32,'','2014-12-29 16:11:51',0,32,NULL,1),(154,'',NULL,4,6,9,'','2014-12-29 16:12:20',0,33,NULL,1),(155,'',NULL,6,9,10,'','2014-12-29 16:12:33',0,33,NULL,1),(156,'',NULL,4,9,6,'','2014-12-29 16:14:21',0,34,NULL,1),(157,'',NULL,4,1,32,'','2014-12-29 16:14:27',0,34,NULL,1),(158,'',NULL,5,13,10,'','2014-12-29 16:14:35',0,34,NULL,1),(159,'',NULL,3,7,3,'','2014-12-29 16:14:55',0,35,NULL,1),(160,'',NULL,4,11,8,'','2014-12-29 16:15:33',0,36,NULL,1),(161,'',NULL,5,10,3,'','2014-12-29 16:15:48',0,36,NULL,1),(162,'',NULL,1,6,32,'','2014-12-29 16:16:24',0,37,NULL,1),(163,'',NULL,4,15,6,'','2014-12-29 16:16:33',0,37,NULL,1),(164,'',NULL,5,1,3,'','2014-12-29 16:16:40',0,37,NULL,1),(165,'',NULL,4,11,3,'','2014-12-29 16:17:18',0,38,NULL,1),(166,'',NULL,5,7,10,'','2014-12-29 16:17:30',0,38,NULL,1),(167,'',NULL,4,9,6,'','2014-12-29 16:17:54',0,39,NULL,1),(168,'',NULL,6,3,3,'','2014-12-29 16:18:00',0,39,NULL,1),(169,'',NULL,2,16,3,'','2014-12-29 16:18:18',0,40,NULL,1),(170,'',6,NULL,9,3,'','2014-12-29 19:56:00',0,2,NULL,0),(171,'',6,NULL,8,8,'','2014-12-29 19:56:20',0,2,NULL,0),(172,'',5,NULL,7,3,'','2014-12-29 19:57:34',0,2,NULL,0),(173,'',5,NULL,15,3,'','2014-12-29 19:57:54',0,2,NULL,0),(174,'',4,NULL,10,8,'','2014-12-29 19:59:38',0,2,NULL,0),(175,'',4,NULL,13,8,'','2014-12-29 19:59:53',0,2,NULL,0),(176,'',3,NULL,3,8,'','2014-12-29 20:00:51',0,2,NULL,0),(177,'',2,NULL,1,3,'','2014-12-29 20:01:08',0,2,NULL,0),(178,'',1,NULL,11,8,'','2014-12-29 20:01:29',0,2,NULL,0),(179,'',NULL,3,12,3,'','2014-12-30 12:57:49',1,19,NULL,1),(180,'',NULL,5,1,3,'','2014-12-30 12:58:50',1,19,NULL,1),(181,'',NULL,4,6,6,'','2014-12-31 14:42:39',1,20,NULL,1),(182,'',7,NULL,11,6,'','2015-01-02 11:39:31',0,3,NULL,0),(183,'',4,NULL,3,3,'','2015-01-02 11:40:02',0,3,NULL,0),(184,'',9,NULL,15,7,'','2015-01-02 11:40:26',0,3,NULL,0),(185,'',3,NULL,9,6,'','2015-01-02 11:40:42',0,3,NULL,0),(186,'',1,NULL,10,6,'','2015-01-02 11:41:02',0,3,NULL,0),(187,'',5,NULL,14,9,'','2015-01-02 11:41:31',0,3,NULL,0),(188,'',5,NULL,13,9,'','2015-01-02 11:41:51',0,3,NULL,0),(189,'',3,NULL,1,6,'','2015-01-02 11:42:22',0,3,NULL,0),(190,'',4,NULL,8,6,'','2015-01-02 11:42:39',0,3,NULL,0),(191,'',2,NULL,6,9,'','2015-01-02 11:43:02',0,3,NULL,0),(192,'',5,NULL,7,6,'','2015-01-02 11:43:24',0,3,NULL,0),(193,'',3,NULL,8,6,'','2015-01-02 11:44:23',0,3,NULL,0),(194,'',3,NULL,12,6,'','2015-01-02 14:47:22',0,1,NULL,0),(195,'',4,NULL,6,3,'','2015-01-02 14:47:37',0,1,NULL,0),(196,'',5,NULL,8,6,'','2015-01-02 14:47:50',0,1,NULL,0),(197,'',NULL,NULL,3,6,'','2015-01-02 14:48:19',0,1,NULL,0),(198,'',5,NULL,13,3,'','2015-01-02 14:48:30',0,1,NULL,0),(199,'',6,NULL,9,3,'','2015-01-02 14:49:15',0,1,NULL,0),(200,'',8,NULL,11,3,'','2015-01-02 14:49:28',0,1,NULL,0),(201,'',7,NULL,16,6,'','2015-01-02 14:49:43',0,1,NULL,0),(202,'',6,NULL,1,3,'','2015-01-02 14:49:55',0,1,NULL,0),(203,'',3,NULL,10,6,'','2015-01-02 14:50:06',0,1,NULL,0),(204,'',3,NULL,7,3,'','2015-01-02 14:50:52',0,1,NULL,0),(205,'',NULL,5,9,10,'','2015-01-04 14:39:21',1,20,NULL,1),(206,'',NULL,6,1,32,'','2015-01-04 14:40:47',0,33,NULL,1),(207,'',NULL,NULL,12,6,'','2015-01-12 14:14:23',0,11,4,2),(208,'',NULL,3,8,8,'','2015-01-12 14:16:47',1,21,NULL,1),(209,'',NULL,5,7,32,'','2015-01-12 14:17:33',1,21,NULL,1),(210,'',NULL,3,3,3,'','2015-01-12 14:19:09',0,22,NULL,1),(211,'',NULL,3,3,3,'','2015-01-12 14:21:49',0,25,NULL,1),(212,'',NULL,6,1,3,'','2015-01-12 14:24:07',0,22,NULL,1),(213,'',NULL,5,6,8,'','2015-01-12 14:24:34',0,22,NULL,1),(214,'',NULL,2,13,3,'','2015-01-12 14:25:15',0,22,NULL,1),(215,'',1,NULL,8,8,'','2015-01-13 12:50:46',0,5,NULL,0),(216,'',1,NULL,1,9,'','2015-01-13 12:50:54',0,5,NULL,0),(217,'',5,NULL,15,32,'','2015-01-13 12:51:12',0,5,NULL,0),(218,'',6,NULL,11,9,'','2015-01-13 12:51:26',0,5,NULL,0),(219,'',4,NULL,3,32,'','2015-01-13 12:51:50',0,5,NULL,0),(220,'',6,NULL,14,9,'','2015-01-13 12:52:06',0,5,NULL,0),(221,'',7,NULL,10,8,'','2015-01-13 12:52:21',0,5,NULL,0),(222,'',8,NULL,9,32,'','2015-01-13 12:52:34',0,5,NULL,0),(223,'',4,NULL,12,8,'','2015-01-13 12:52:48',0,5,NULL,0),(224,'',4,NULL,13,6,'','2015-01-13 12:53:02',0,5,NULL,0),(225,'',2,NULL,9,8,'','2015-01-13 12:53:11',0,5,NULL,0),(226,'',NULL,6,11,8,'','2015-01-14 11:27:49',0,25,NULL,1),(227,'',NULL,2,9,9,'','2015-01-14 11:28:37',0,25,NULL,1),(228,'',NULL,3,3,32,'','2015-01-14 11:29:06',0,25,NULL,1),(229,'',NULL,6,7,6,'','2015-01-14 13:19:28',0,26,NULL,1),(230,'',NULL,NULL,10,3,'','2015-01-19 13:14:23',0,4,NULL,0),(231,'',2,NULL,10,31,'','2015-01-19 13:16:59',0,4,NULL,0),(232,'',NULL,NULL,9,3,'','2015-01-19 13:17:16',0,4,NULL,0),(233,'',3,NULL,12,31,'','2015-01-19 13:17:26',0,4,NULL,0),(234,'',6,NULL,1,3,'','2015-01-19 13:17:31',0,4,NULL,0),(235,'',5,NULL,3,8,'','2015-01-19 13:17:40',0,4,NULL,0),(236,'',2,NULL,11,3,'','2015-01-19 13:17:50',0,4,NULL,0),(237,'',8,NULL,1,8,'','2015-01-19 13:17:56',0,4,NULL,0),(238,'',3,NULL,8,8,'','2015-01-19 13:18:03',0,4,NULL,0),(239,'',6,NULL,7,31,'','2015-01-19 13:18:11',0,4,NULL,0),(240,'',5,NULL,3,3,'','2015-01-19 13:18:19',0,4,NULL,0),(241,'',4,NULL,13,3,'','2015-01-19 13:18:29',0,4,NULL,0),(242,'',2,NULL,9,8,'','2015-01-19 13:18:38',0,4,NULL,0),(243,'',4,NULL,9,8,'','2015-01-19 13:18:39',0,4,NULL,0),(244,'',NULL,NULL,13,3,'','2015-01-20 14:26:28',0,40,2,1),(245,'',NULL,NULL,13,3,'','2015-01-20 17:37:20',0,40,2,1),(246,'',NULL,NULL,8,8,'','2015-01-20 17:38:18',0,11,6,2),(247,'',NULL,NULL,12,32,'','2015-01-26 11:12:51',0,11,6,2),(248,'',NULL,NULL,16,10,'Freiberg','2015-01-26 11:13:17',0,11,6,2),(249,'',5,NULL,15,6,'','2015-01-26 13:54:01',0,3,NULL,0),(250,'',6,NULL,13,33,'','2015-01-26 13:54:59',0,3,NULL,0),(251,'',5,NULL,10,6,'','2015-01-26 13:55:15',0,3,NULL,0),(252,'',5,NULL,16,3,'','2015-01-26 13:55:24',0,3,NULL,0),(253,'',6,NULL,11,3,'','2015-01-26 13:55:32',0,3,NULL,0),(254,'',7,NULL,1,6,'','2015-01-26 13:55:40',0,3,NULL,0),(255,'',3,NULL,7,6,'','2015-01-26 13:56:14',0,3,NULL,0),(256,'',5,NULL,3,33,'','2015-01-26 13:56:28',0,3,NULL,0),(257,'',2,NULL,8,33,'','2015-01-26 13:56:38',0,3,NULL,0),(258,'',2,NULL,12,3,'','2015-01-26 13:56:49',0,3,NULL,0),(259,'',3,NULL,9,33,'','2015-01-26 13:57:00',0,3,NULL,0),(260,'',NULL,NULL,7,8,'','2015-01-29 11:50:08',0,11,5,2),(261,'',NULL,5,14,6,'','2015-01-29 11:52:35',0,27,NULL,1),(262,'',NULL,NULL,1,9,'','2015-01-29 11:52:51',0,26,2,1),(263,'',NULL,2,9,9,'','2015-02-09 10:53:12',0,27,NULL,1),(264,'',6,NULL,7,8,'','2015-02-09 14:30:45',0,1,NULL,0),(265,'',4,NULL,13,8,'','2015-02-09 14:31:16',0,1,NULL,0),(266,'',4,NULL,6,33,'','2015-02-09 14:31:31',0,1,NULL,0),(267,'',5,NULL,9,6,'','2015-02-09 14:31:43',0,1,NULL,0),(268,'',4,NULL,8,33,'','2015-02-09 14:31:50',0,1,NULL,0),(269,'',9,NULL,14,8,'','2015-02-09 14:32:15',0,1,NULL,0),(270,'',6,NULL,3,6,'','2015-02-09 14:32:26',0,1,NULL,0),(271,'',3,NULL,10,32,'','2015-02-09 14:32:36',0,1,NULL,0),(272,'',6,NULL,1,8,'','2015-02-09 14:32:44',0,1,NULL,0),(273,'',7,NULL,15,6,'','2015-02-09 14:33:23',0,1,NULL,0),(274,'',2,NULL,11,33,'','2015-02-09 14:33:36',0,1,NULL,0),(275,'',2,NULL,8,31,'','2015-02-09 14:35:20',0,2,NULL,0),(276,'',3,NULL,16,31,'','2015-02-09 14:35:29',0,2,NULL,0),(277,'',1,NULL,9,9,'','2015-02-09 14:35:42',0,2,NULL,0),(278,'',3,NULL,13,3,'','2015-02-09 14:35:49',0,2,NULL,0),(279,'',4,NULL,11,9,'','2015-02-09 14:36:01',0,2,NULL,0),(280,'',4,NULL,3,9,'','2015-02-09 14:36:09',0,2,NULL,0),(281,'',6,NULL,7,9,'','2015-02-09 14:36:15',0,2,NULL,0),(282,'',1,NULL,6,3,'','2015-02-09 14:36:27',0,2,NULL,0),(283,'',6,NULL,1,3,'','2015-02-09 14:36:32',0,2,NULL,0),(284,'',5,NULL,15,3,'','2015-02-09 14:36:38',0,2,NULL,0),(285,'',7,NULL,12,3,'','2015-02-09 14:36:57',0,2,NULL,0),(286,'',NULL,6,3,6,'','2015-02-09 14:53:26',0,29,NULL,1),(287,'',NULL,NULL,10,8,'','2015-02-09 15:01:15',0,11,3,2),(288,'',7,NULL,14,9,'','2015-02-17 13:02:16',0,2,NULL,0),(289,'',8,NULL,3,3,'','2015-02-23 12:56:58',0,5,NULL,0),(290,'',6,NULL,9,6,'','2015-02-23 12:57:09',0,5,NULL,0),(291,'',4,NULL,8,6,'','2015-02-23 12:57:25',0,5,NULL,0),(292,'',NULL,NULL,10,3,'','2015-02-23 12:57:43',0,5,NULL,0),(293,'',6,NULL,11,6,'','2015-02-23 12:57:55',0,5,NULL,0),(294,'',3,NULL,1,3,'','2015-02-23 12:58:07',0,5,NULL,0),(295,'',9,NULL,13,6,'','2015-02-23 12:58:26',0,5,NULL,0),(296,'',1,NULL,7,6,'','2015-02-23 12:58:35',0,5,NULL,0),(297,'',4,NULL,16,6,'','2015-02-23 12:58:51',0,5,NULL,0),(298,'',2,NULL,6,3,'','2015-02-23 12:59:04',0,5,NULL,0),(299,'',NULL,NULL,12,6,'','2015-02-23 13:34:53',0,29,4,1),(300,'',NULL,5,7,3,'','2015-02-28 13:26:20',1,22,NULL,1),(301,'',NULL,3,11,32,'','2015-02-28 13:26:31',1,22,NULL,1),(302,'',NULL,7,10,6,'','2015-02-28 13:27:21',1,24,NULL,1),(303,'',NULL,4,16,9,'','2015-02-28 13:28:36',1,24,NULL,1),(304,'',NULL,6,13,33,'','2015-02-28 13:30:07',1,25,NULL,1),(305,'',NULL,2,1,6,'','2015-02-28 13:30:51',1,26,NULL,1),(306,'',NULL,5,9,36,'','2015-02-28 13:34:23',1,27,NULL,1),(307,'',NULL,4,3,6,'','2015-02-28 13:34:33',1,27,NULL,1),(308,'',NULL,6,7,33,'','2015-02-28 13:34:50',1,29,NULL,1),(309,'',NULL,4,15,3,'','2015-02-28 13:35:02',1,30,NULL,1),(310,'',NULL,7,8,8,'','2015-02-28 13:35:14',1,30,NULL,1),(311,'',NULL,5,10,32,'','2015-02-28 13:37:06',1,31,NULL,1),(312,'',NULL,1,6,3,'','2015-02-28 13:37:16',1,32,NULL,1),(313,'',NULL,5,12,3,'','2015-02-28 13:37:32',1,33,NULL,1),(314,'',NULL,6,8,3,'','2015-02-28 13:37:43',1,33,NULL,1),(315,'',NULL,4,8,32,'','2015-02-28 13:37:59',1,34,NULL,1),(316,'',NULL,5,7,9,'','2015-02-28 13:38:11',1,34,NULL,1),(317,'',NULL,5,15,8,'','2015-02-28 13:38:24',1,35,NULL,1),(318,'',NULL,4,13,36,'','2015-02-28 13:38:42',1,36,NULL,1),(319,'',NULL,7,1,3,'','2015-02-28 13:38:51',1,37,NULL,1),(320,'',NULL,4,9,8,'','2015-02-28 13:39:03',1,37,NULL,1),(321,'',NULL,3,6,31,'','2015-02-28 13:39:22',1,38,NULL,1),(322,'',NULL,6,13,6,'','2015-02-28 13:39:35',1,39,NULL,1),(323,'',NULL,1,10,10,'','2015-02-28 13:40:28',1,40,NULL,1),(324,'',NULL,NULL,10,6,'','2015-02-28 13:44:12',1,11,5,2),(325,'',NULL,NULL,12,9,'','2015-02-28 13:45:15',1,11,2,2),(326,'',NULL,NULL,11,10,'','2015-02-28 13:45:28',1,11,6,2),(327,'',NULL,NULL,15,8,'','2015-02-28 13:45:49',1,11,7,2),(328,'',NULL,NULL,1,32,'','2015-02-28 13:46:14',1,11,4,2),(329,'',NULL,NULL,9,6,'','2015-02-28 13:46:43',1,11,6,2),(330,'',NULL,NULL,3,3,'','2015-02-28 13:47:50',1,11,4,2),(331,'',NULL,NULL,7,3,'','2015-02-28 13:48:14',1,11,6,2),(332,'',NULL,NULL,8,3,'','2015-02-28 13:48:37',1,11,5,2),(333,'',NULL,NULL,11,3,'','2015-02-28 13:49:04',1,11,8,2),(334,'',NULL,NULL,3,6,'','2015-02-28 13:49:14',1,11,7,2),(335,'',NULL,NULL,9,8,'','2015-02-28 13:49:53',1,11,4,2),(336,'',1,NULL,10,8,'','2015-02-28 14:06:32',1,4,NULL,0),(337,'',6,NULL,7,32,'','2015-02-28 14:07:16',1,4,NULL,0),(338,'',4,NULL,3,3,'','2015-02-28 14:07:26',1,4,NULL,0),(339,'',6,NULL,14,9,'','2015-02-28 14:07:50',1,4,NULL,0),(340,'',6,NULL,1,9,'','2015-02-28 14:08:01',1,4,NULL,0),(341,'',4,NULL,11,32,'','2015-02-28 14:08:13',1,4,NULL,0),(342,'',7,NULL,9,32,'','2015-02-28 14:08:30',1,4,NULL,0),(343,'',6,NULL,10,6,'','2015-02-28 14:08:41',1,4,NULL,0),(344,'',3,NULL,1,8,'','2015-02-28 14:08:55',1,4,NULL,0),(345,'',3,NULL,13,8,'','2015-02-28 14:09:04',1,4,NULL,0),(346,'',1,NULL,1,32,'','2015-02-28 14:09:18',1,4,NULL,0),(347,'',1,NULL,1,32,'','2015-02-28 14:09:27',1,4,NULL,0),(348,'',2,NULL,11,32,'','2015-02-28 14:09:42',1,4,NULL,0),(349,'',3,NULL,7,32,'','2015-02-28 14:10:21',1,1,NULL,0),(350,'',7,NULL,13,32,'','2015-02-28 14:10:39',1,1,NULL,0),(351,'',4,NULL,9,8,'','2015-02-28 14:11:02',1,1,NULL,0),(352,'',2,NULL,11,3,'','2015-02-28 14:11:36',1,1,NULL,0),(353,'',NULL,NULL,1,6,'','2015-02-28 14:11:49',1,1,NULL,0),(354,'',6,NULL,10,3,'','2015-02-28 14:12:10',1,1,NULL,0),(355,'',4,NULL,3,32,'','2015-02-28 14:12:29',1,1,NULL,0),(356,'',4,NULL,3,32,'','2015-02-28 14:13:02',1,1,NULL,0),(357,'',1,NULL,7,36,'','2015-02-28 14:13:36',1,2,NULL,0),(358,'',3,NULL,14,32,'','2015-02-28 14:13:53',1,2,NULL,0),(359,'',5,NULL,15,6,'','2015-02-28 14:14:04',1,2,NULL,0),(360,'',5,NULL,1,31,'','2015-02-28 14:14:23',1,2,NULL,0),(361,'',9,NULL,11,8,'','2015-02-28 14:14:38',1,3,NULL,0),(362,'',7,NULL,3,32,'','2015-02-28 14:14:48',1,3,NULL,0),(363,'',6,NULL,1,32,'','2015-02-28 14:14:58',1,3,NULL,0),(364,'',5,NULL,10,6,'','2015-02-28 14:15:09',1,3,NULL,0),(365,'',4,NULL,9,32,'','2015-02-28 14:15:21',1,3,NULL,0),(366,'',2,NULL,7,32,'','2015-02-28 14:15:36',1,3,NULL,0);
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
INSERT INTO `sends` VALUES (1,18,'2015-01-03 17:08:31'),(1,19,'2015-01-03 17:08:05'),(1,22,'2015-01-03 17:28:33'),(1,23,'2015-01-03 17:07:47'),(1,67,'2015-01-03 11:42:39'),(1,68,'2015-01-03 11:42:47'),(1,69,'2015-01-03 11:42:45'),(1,70,'2015-01-03 11:42:34'),(1,71,'2015-01-03 11:42:35'),(1,72,'2015-01-03 11:42:40'),(1,73,'2015-01-03 11:42:31'),(1,74,'2015-01-03 11:42:37'),(1,75,'2015-01-03 11:42:42'),(1,128,'2015-01-03 12:12:12'),(1,185,'2015-01-06 23:17:25'),(1,186,'2015-01-06 23:17:10'),(1,189,'2015-01-06 23:17:32'),(1,191,'2015-01-06 23:17:14'),(1,193,'2015-01-06 23:17:20'),(1,194,'2015-01-03 12:24:38'),(1,195,'2015-01-08 19:59:33'),(1,196,'2015-01-03 12:23:56'),(1,198,'2015-01-03 12:24:02'),(1,199,'2015-01-03 12:24:05'),(1,200,'2015-01-03 12:24:07'),(1,201,'2015-01-03 12:24:20'),(1,202,'2015-01-03 12:24:31'),(1,203,'2015-01-03 12:24:33'),(1,204,'2015-01-03 12:24:36'),(1,259,'2015-01-26 20:17:46'),(1,274,'2015-02-18 19:45:29'),(1,337,'2015-03-01 11:01:44'),(1,339,'2015-03-01 10:57:45'),(1,340,'2015-03-01 10:55:29'),(1,349,'2015-03-01 10:51:30'),(1,351,'2015-03-01 10:51:15'),(1,352,'2015-03-01 10:51:38'),(1,354,'2015-03-01 10:50:41'),(1,355,'2015-03-01 10:51:23'),(1,356,'2015-03-01 10:51:07'),(1,357,'2015-03-01 10:52:29'),(1,358,'2015-03-01 10:52:19'),(1,359,'2015-03-01 10:52:07'),(1,360,'2015-03-01 10:51:56'),(1,364,'2015-03-01 10:53:15'),(1,365,'2015-03-01 10:52:59'),(1,366,'2015-03-01 10:52:47'),(3,13,'2015-02-23 13:18:40'),(3,14,'2015-02-23 13:21:00'),(3,15,'2015-02-23 13:23:40'),(3,16,'2015-02-23 13:15:39'),(3,17,'2015-02-23 13:17:21'),(3,18,'2015-02-23 13:19:30'),(3,19,'2015-02-23 13:21:56'),(3,20,'2015-02-23 13:24:14'),(3,21,'2015-02-23 13:16:32'),(3,22,'2015-02-23 13:18:05'),(3,23,'2015-02-23 13:20:38'),(3,24,'2015-02-23 13:23:04'),(3,25,'2015-02-23 13:15:20'),(3,116,'2015-02-23 13:16:53'),(3,117,'2015-02-23 13:19:00'),(3,118,'2015-02-23 13:21:30'),(3,148,'2015-02-23 13:31:29'),(3,149,'2015-02-23 13:31:54'),(3,150,'2015-02-23 13:29:53'),(3,151,'2015-02-23 13:30:21'),(3,152,'2015-02-23 13:30:44'),(3,153,'2015-02-23 13:29:11'),(3,154,'2015-02-23 13:27:00'),(3,155,'2015-02-23 13:27:45'),(3,156,'2015-02-23 13:14:01'),(3,157,'2015-02-23 13:14:26'),(3,158,'2015-02-23 13:14:40'),(3,159,'2015-02-23 13:13:44'),(3,160,'2015-02-23 13:13:13'),(3,161,'2015-02-23 13:13:21'),(3,162,'2015-02-23 13:11:09'),(3,163,'2015-02-23 13:11:20'),(3,164,'2015-02-23 13:11:33'),(3,166,'2015-02-23 13:09:55'),(3,167,'2015-02-23 13:09:09'),(3,168,'2015-02-23 13:08:52'),(3,169,'2015-02-23 13:08:31'),(3,206,'2015-02-23 13:28:35'),(3,207,'2015-02-23 13:25:31'),(3,244,'2015-02-23 13:08:09'),(3,246,'2015-02-23 13:16:18'),(3,247,'2015-02-23 13:17:43'),(3,248,'2015-02-23 13:20:07'),(3,249,'2015-02-23 12:53:29'),(3,250,'2015-02-23 12:54:19'),(3,251,'2015-02-23 12:53:42'),(3,252,'2015-02-23 12:53:20'),(3,253,'2015-02-23 12:54:01'),(3,254,'2015-02-23 12:54:32'),(3,255,'2015-02-23 12:53:10'),(3,256,'2015-02-23 12:53:52'),(3,257,'2015-02-23 12:52:31'),(3,258,'2015-02-23 12:52:48'),(3,259,'2015-02-23 12:52:56'),(3,260,'2015-02-23 13:22:29'),(3,264,'2015-02-23 12:49:06'),(3,266,'2015-02-23 12:48:32'),(3,267,'2015-02-23 12:48:54'),(3,268,'2015-02-23 12:48:20'),(3,271,'2015-02-23 12:48:07'),(3,274,'2015-02-22 17:16:25'),(3,275,'2015-02-23 12:51:56'),(3,276,'2015-02-23 12:51:47'),(3,277,'2015-02-23 12:49:57'),(3,278,'2015-02-23 12:51:32'),(3,279,'2015-02-23 12:51:07'),(3,282,'2015-02-23 12:50:11'),(3,283,'2015-02-23 12:50:52'),(3,284,'2015-02-23 12:49:46'),(3,285,'2015-02-23 12:50:23'),(3,286,'2015-02-23 13:35:01'),(3,287,'2015-02-23 13:26:05'),(3,288,'2015-02-23 12:50:34'),(3,289,'2015-02-23 13:07:24'),(3,291,'2015-02-23 13:06:53'),(3,292,'2015-02-23 12:59:28'),(3,293,'2015-02-23 13:07:08'),(3,294,'2015-02-23 13:05:41'),(3,296,'2015-02-23 12:59:39'),(3,297,'2015-02-23 13:05:57'),(3,298,'2015-02-23 13:05:30'),(3,299,'2015-02-23 13:35:27'),(4,70,'2015-01-03 23:54:50'),(4,73,'2015-01-03 23:54:30'),(4,78,'2015-01-03 23:52:44'),(4,175,'2015-01-03 23:52:09'),(4,177,'2015-01-03 23:51:18'),(4,178,'2015-01-03 23:51:39'),(4,185,'2015-01-03 12:33:14'),(4,190,'2015-01-03 12:34:31'),(4,191,'2015-01-03 23:53:01'),(4,192,'2015-01-03 12:23:20'),(4,193,'2015-01-03 12:34:41'),(4,194,'2015-01-07 15:42:56'),(4,195,'2015-01-07 15:42:42'),(4,196,'2015-01-07 15:42:30'),(4,198,'2015-01-07 15:42:16'),(4,203,'2015-01-03 14:39:32'),(4,204,'2015-01-07 15:43:04'),(4,215,'2015-02-21 14:20:50'),(4,216,'2015-02-21 14:17:58'),(4,223,'2015-01-18 08:27:13'),(4,225,'2015-02-21 14:27:38'),(4,231,'2015-02-21 14:06:52'),(4,233,'2015-02-21 14:15:17'),(4,236,'2015-02-21 14:06:35'),(4,238,'2015-02-21 14:11:40'),(4,242,'2015-02-21 14:08:17'),(4,255,'2015-02-21 14:05:24'),(4,257,'2015-02-21 13:59:29'),(4,258,'2015-02-21 14:00:38'),(4,259,'2015-02-21 14:03:22'),(4,265,'2015-02-21 14:35:27'),(4,266,'2015-02-24 19:12:44'),(4,268,'2015-02-24 18:51:17'),(4,271,'2015-02-21 14:31:32'),(4,274,'2015-02-21 14:29:39'),(4,275,'2015-02-21 15:16:08'),(4,277,'2015-02-21 14:42:20'),(4,279,'2015-02-21 15:18:09'),(4,280,'2015-02-21 15:21:21'),(4,282,'2015-02-24 18:28:28'),(8,13,'2015-01-03 17:48:34'),(8,14,'2015-01-03 17:48:45'),(8,15,'2015-01-03 17:49:56'),(8,16,'2015-01-03 17:49:01'),(8,18,'2015-01-03 17:44:06'),(8,19,'2015-01-03 17:45:44'),(8,20,'2015-01-03 17:49:11'),(8,21,'2015-01-03 17:49:27'),(8,22,'2015-01-03 17:45:52'),(8,23,'2015-01-03 17:43:31'),(8,24,'2015-02-26 07:57:37'),(8,25,'2015-01-03 17:46:06'),(8,67,'2015-01-03 17:50:50'),(8,69,'2015-01-03 17:50:12'),(8,70,'2015-01-03 17:52:45'),(8,71,'2015-01-03 17:52:35'),(8,72,'2015-01-03 17:51:50'),(8,73,'2015-01-03 17:52:51'),(8,74,'2015-01-03 17:51:05'),(8,75,'2015-01-03 17:50:17'),(8,117,'2015-01-03 17:48:22'),(8,118,'2015-01-03 17:49:47'),(8,128,'2015-01-04 18:39:45'),(8,129,'2015-01-04 18:39:40'),(8,146,'2015-01-04 18:41:54'),(8,147,'2015-01-04 18:42:00'),(8,149,'2015-01-04 18:42:12'),(8,150,'2015-01-04 18:42:49'),(8,151,'2015-01-04 18:42:38'),(8,152,'2015-01-04 18:42:57'),(8,155,'2015-01-04 18:43:27'),(8,164,'2015-01-04 18:44:44'),(8,168,'2015-01-04 18:44:59'),(8,170,'2015-01-03 17:54:26'),(8,171,'2015-01-03 17:54:19'),(8,172,'2015-01-03 17:54:45'),(8,173,'2015-01-03 17:54:39'),(8,174,'2015-01-04 18:28:25'),(8,179,'2015-01-04 18:39:27'),(8,180,'2015-01-04 18:39:20'),(8,181,'2015-01-04 18:40:03'),(8,187,'2015-01-04 18:30:01'),(8,188,'2015-01-04 18:29:52'),(8,192,'2015-01-04 18:29:41'),(8,196,'2015-02-04 16:29:22'),(8,198,'2015-01-18 09:45:02'),(8,199,'2015-01-18 09:44:42'),(8,201,'2015-01-18 09:44:30'),(8,202,'2015-02-04 16:28:46'),(8,205,'2015-01-04 18:40:11'),(8,206,'2015-01-06 11:51:32'),(8,207,'2015-01-29 12:15:12'),(8,209,'2015-02-04 16:28:00'),(8,217,'2015-01-18 09:43:15'),(8,218,'2015-01-18 09:42:43'),(8,219,'2015-01-18 09:43:33'),(8,220,'2015-01-18 09:42:33'),(8,221,'2015-01-18 09:41:57'),(8,226,'2015-02-04 16:27:18'),(8,237,'2015-02-20 16:22:41'),(8,246,'2015-02-26 07:58:34'),(8,247,'2015-01-29 12:16:02'),(8,248,'2015-01-29 12:15:30'),(8,249,'2015-01-29 12:14:12'),(8,250,'2015-01-29 12:13:41'),(8,251,'2015-01-29 12:14:03'),(8,252,'2015-01-29 12:13:26'),(8,253,'2015-01-29 12:13:13'),(8,254,'2015-01-29 12:12:52'),(8,256,'2015-01-29 12:13:52'),(8,260,'2015-01-29 12:16:20'),(9,13,'2015-01-14 10:00:33'),(9,18,'2015-01-04 01:50:44'),(9,19,'2015-01-04 01:50:47'),(9,22,'2015-01-04 01:50:40'),(9,23,'2015-01-04 01:50:50'),(9,67,'2015-01-04 01:49:02'),(9,68,'2015-01-04 01:49:10'),(9,69,'2015-01-04 01:49:06'),(9,70,'2015-01-04 01:48:43'),(9,71,'2015-01-04 01:48:45'),(9,72,'2015-01-04 01:48:51'),(9,73,'2015-01-04 01:48:37'),(9,74,'2015-01-04 01:48:48'),(9,75,'2015-01-04 01:48:59'),(9,76,'2015-01-04 01:46:58'),(9,77,'2015-01-04 01:47:06'),(9,78,'2015-01-04 01:47:13'),(9,80,'2015-01-04 01:46:22'),(9,81,'2015-01-04 01:46:27'),(9,82,'2015-01-04 01:46:32'),(9,83,'2015-01-04 01:46:36'),(9,84,'2015-01-04 01:46:43'),(9,85,'2015-01-04 01:46:51'),(9,86,'2015-01-04 01:46:54'),(9,87,'2015-01-04 01:47:00'),(9,88,'2015-01-04 01:47:10'),(9,89,'2015-01-04 01:47:29'),(9,170,'2015-01-04 01:45:13'),(9,171,'2015-01-04 01:45:22'),(9,172,'2015-01-04 01:45:01'),(9,173,'2015-01-04 01:45:05'),(9,174,'2015-01-04 01:44:44'),(9,175,'2015-01-04 01:44:55'),(9,176,'2015-01-04 01:44:40'),(9,177,'2015-01-04 01:44:36'),(9,178,'2015-01-04 01:44:31'),(9,182,'2015-01-04 01:46:09'),(9,183,'2015-01-04 01:45:53'),(9,185,'2015-01-04 01:45:45'),(9,186,'2015-01-04 01:45:30'),(9,187,'2015-01-04 01:45:56'),(9,188,'2015-01-04 01:46:00'),(9,189,'2015-01-04 01:45:38'),(9,190,'2015-01-04 01:45:49'),(9,191,'2015-01-04 01:45:34'),(9,192,'2015-01-04 01:46:05'),(9,193,'2015-01-04 01:45:41'),(9,194,'2015-01-04 01:50:02'),(9,195,'2015-01-04 01:50:06'),(9,196,'2015-01-04 01:50:09'),(9,198,'2015-01-04 01:49:23'),(9,199,'2015-01-04 01:49:27'),(9,200,'2015-01-04 01:49:31'),(9,201,'2015-01-23 00:14:03'),(9,202,'2015-01-04 01:49:49'),(9,203,'2015-01-04 01:49:53'),(9,204,'2015-01-04 01:49:57'),(9,215,'2015-01-14 09:59:00'),(9,216,'2015-01-14 09:58:53'),(9,217,'2015-01-14 09:59:28'),(9,218,'2015-01-26 23:49:24'),(9,219,'2015-01-14 09:59:19'),(9,220,'2015-01-14 09:59:39'),(9,221,'2015-01-14 09:59:46'),(9,223,'2015-01-14 09:59:24'),(9,224,'2015-01-14 09:59:14'),(9,225,'2015-01-14 09:59:08'),(9,231,'2015-02-19 22:51:49'),(9,233,'2015-02-17 23:25:48'),(9,234,'2015-02-19 22:51:28'),(9,235,'2015-02-19 22:51:33'),(9,236,'2015-02-19 22:51:53'),(9,238,'2015-02-19 22:51:37'),(9,239,'2015-02-17 23:26:24'),(9,240,'2015-02-17 23:26:19'),(9,241,'2015-02-17 23:26:02'),(9,242,'2015-02-19 22:51:43'),(9,243,'2015-02-17 23:26:30'),(9,249,'2015-01-26 23:49:06'),(9,250,'2015-01-26 23:48:29'),(9,251,'2015-01-26 23:47:55'),(9,252,'2015-01-26 23:48:09'),(9,253,'2015-01-26 23:48:41'),(9,255,'2015-01-26 23:47:47'),(9,256,'2015-01-26 23:48:02'),(9,257,'2015-01-26 23:47:26'),(9,258,'2015-01-26 23:47:32'),(9,259,'2015-01-26 23:47:38'),(9,260,'2015-02-25 21:02:20'),(9,264,'2015-02-17 23:25:11'),(9,265,'2015-02-17 23:23:44'),(9,266,'2015-02-17 23:24:12'),(9,267,'2015-02-17 23:24:55'),(9,268,'2015-02-17 23:24:08'),(9,269,'2015-02-17 23:23:53'),(9,270,'2015-02-17 23:25:05'),(9,271,'2015-02-17 23:23:39'),(9,272,'2015-02-17 23:25:00'),(9,273,'2015-02-17 23:25:15'),(9,274,'2015-02-17 23:23:34'),(9,275,'2015-02-09 19:57:50'),(9,276,'2015-02-09 19:58:11'),(9,277,'2015-02-09 19:58:26'),(9,278,'2015-02-09 19:57:08'),(9,279,'2015-02-09 19:57:19'),(9,280,'2015-02-09 19:57:57'),(9,281,'2015-02-09 19:58:17'),(9,282,'2015-02-09 19:58:32'),(9,283,'2015-02-09 19:57:15'),(9,284,'2015-02-09 19:57:23'),(9,285,'2015-02-09 19:58:07'),(9,287,'2015-02-09 19:56:56'),(9,288,'2015-02-17 23:25:27'),(9,290,'2015-02-25 21:01:37'),(9,291,'2015-02-25 21:01:27'),(9,293,'2015-02-25 21:01:31'),(9,294,'2015-02-25 21:01:18'),(9,296,'2015-02-25 21:01:02'),(9,297,'2015-02-25 21:01:23'),(9,298,'2015-02-25 21:01:15'),(13,188,'2015-01-03 16:36:01'),(13,192,'2015-01-03 16:36:49'),(16,67,'2015-01-03 13:41:56'),(16,69,'2015-01-03 13:41:25'),(16,72,'2015-01-03 13:41:49'),(16,170,'2015-01-04 02:09:02'),(16,171,'2015-01-04 02:08:40'),(16,172,'2015-01-04 02:09:20'),(16,173,'2015-01-04 02:09:11'),(16,182,'2015-01-03 13:39:15'),(16,188,'2015-01-03 13:39:45'),(17,18,'2015-01-03 17:49:53'),(17,19,'2015-01-03 17:49:47'),(17,22,'2015-01-03 17:47:36'),(17,23,'2015-01-03 17:49:35'),(17,25,'2015-01-03 17:49:59'),(17,70,'2015-01-03 17:53:29'),(17,71,'2015-01-03 17:53:25'),(17,78,'2015-01-07 11:19:04'),(17,135,'2015-01-03 19:14:47'),(17,138,'2015-01-03 18:54:02'),(17,160,'2015-01-03 19:13:37'),(17,161,'2015-01-03 19:13:40'),(17,164,'2015-01-04 23:32:02'),(17,175,'2015-01-03 17:53:00'),(17,176,'2015-01-03 17:52:44'),(17,177,'2015-01-03 17:52:25'),(17,178,'2015-01-03 17:51:54'),(17,180,'2015-01-04 23:31:21'),(17,183,'2015-01-08 10:23:42'),(17,192,'2015-01-08 10:23:29'),(17,203,'2015-01-03 17:51:06'),(17,204,'2015-01-03 17:51:42'),(17,205,'2015-01-04 23:31:42'),(17,209,'2015-01-13 09:58:24'),(20,13,'2015-01-16 19:54:01'),(20,14,'2015-01-03 20:20:27'),(20,15,'2015-01-16 19:06:34'),(20,16,'2015-01-16 19:05:30'),(20,18,'2015-01-03 20:18:41'),(20,19,'2015-01-03 20:18:51'),(20,21,'2015-01-16 19:05:49'),(20,22,'2015-01-03 20:19:08'),(20,23,'2015-01-16 19:01:38'),(20,24,'2015-01-16 19:02:51'),(20,25,'2015-01-03 20:19:19'),(20,67,'2015-01-03 20:18:10'),(20,71,'2015-01-03 20:18:20'),(20,72,'2015-01-03 20:17:59'),(20,74,'2015-01-03 20:17:13'),(20,76,'2015-01-16 18:58:08'),(20,84,'2015-01-16 18:59:21'),(20,85,'2015-01-16 18:58:36'),(20,86,'2015-01-16 18:58:19'),(20,88,'2015-01-16 18:59:12'),(20,117,'2015-01-03 20:19:43'),(20,118,'2015-01-16 19:06:07'),(20,137,'2015-01-03 20:23:06'),(20,149,'2015-01-03 20:26:25'),(20,151,'2015-01-03 20:23:55'),(20,152,'2015-01-03 20:24:04'),(20,155,'2015-01-03 20:24:45'),(20,158,'2015-01-03 20:25:08'),(20,170,'2015-01-16 19:40:02'),(20,171,'2015-01-03 20:11:56'),(20,172,'2015-01-03 20:14:01'),(20,173,'2015-01-03 20:13:46'),(20,174,'2015-01-03 20:15:41'),(20,175,'2015-01-03 20:14:46'),(20,176,'2015-01-03 20:16:06'),(20,177,'2015-01-03 20:16:16'),(20,178,'2015-01-03 20:11:47'),(20,194,'2015-01-03 20:10:13'),(20,195,'2015-01-03 20:10:26'),(20,196,'2015-01-03 20:11:28'),(20,198,'2015-01-03 20:08:35'),(20,199,'2015-01-03 20:08:49'),(20,201,'2015-01-03 20:09:04'),(20,202,'2015-01-03 20:09:14'),(20,203,'2015-01-03 20:09:31'),(20,204,'2015-01-16 19:34:16'),(20,207,'2015-01-16 19:00:57'),(20,212,'2015-01-16 19:16:07'),(20,213,'2015-01-16 19:16:53'),(20,214,'2015-01-16 19:17:24'),(20,215,'2015-01-16 18:57:40'),(20,216,'2015-01-16 18:57:28'),(20,217,'2015-01-16 18:57:03'),(20,218,'2015-01-16 18:55:40'),(20,219,'2015-01-16 18:57:15'),(20,220,'2015-01-16 18:55:57'),(20,221,'2015-01-16 18:55:26'),(20,223,'2015-01-16 18:54:33'),(20,224,'2015-01-16 18:56:11'),(20,225,'2015-01-16 18:54:12'),(20,226,'2015-01-16 19:13:26'),(20,227,'2015-01-16 19:15:43'),(20,228,'2015-01-16 19:15:31'),(20,229,'2015-01-16 19:10:57'),(21,67,'2015-01-11 08:43:07'),(21,68,'2015-01-11 08:42:51'),(21,69,'2015-01-11 08:42:56'),(21,70,'2015-01-11 08:43:38'),(21,71,'2015-01-11 08:43:27'),(21,72,'2015-01-11 08:43:15'),(21,73,'2015-01-11 08:43:47'),(21,74,'2015-01-11 08:43:22'),(21,75,'2015-01-11 08:43:01'),(21,170,'2015-01-11 08:34:50'),(21,171,'2015-01-11 08:41:39'),(21,172,'2015-01-11 08:42:05'),(21,173,'2015-01-11 08:41:53'),(21,174,'2015-01-11 08:36:33'),(21,175,'2015-01-11 08:36:45'),(21,176,'2015-01-11 08:36:22'),(21,177,'2015-01-11 08:35:21'),(21,178,'2015-01-11 08:35:13'),(21,194,'2015-01-04 19:45:39'),(21,195,'2015-01-04 19:45:51'),(21,196,'2015-01-04 19:37:33'),(21,199,'2015-01-04 19:39:34'),(21,203,'2015-01-04 19:41:16'),(21,204,'2015-01-04 19:45:30'),(24,125,'2015-01-07 08:50:02'),(24,177,'2015-01-07 08:49:57'),(27,176,'2015-01-12 22:18:38'),(27,185,'2015-01-12 22:23:59'),(27,191,'2015-01-12 22:27:47'),(31,18,'2015-01-29 15:51:45'),(31,19,'2015-01-29 15:51:56'),(31,21,'2015-01-29 15:53:03'),(31,22,'2015-01-29 15:52:37'),(31,23,'2015-01-29 15:51:50'),(31,25,'2015-01-29 15:52:18'),(31,117,'2015-01-29 15:52:04'),(31,172,'2015-01-29 15:49:58'),(31,175,'2015-01-29 15:49:48'),(31,176,'2015-01-29 15:49:43'),(31,177,'2015-01-29 15:49:37'),(31,178,'2015-01-29 15:49:33'),(31,207,'2015-01-29 15:52:11'),(31,215,'2015-01-29 15:50:11'),(31,216,'2015-01-29 15:50:15'),(31,217,'2015-01-29 15:50:49'),(31,219,'2015-01-29 15:50:41'),(31,223,'2015-01-29 15:50:36'),(31,224,'2015-01-29 15:50:45'),(31,225,'2015-01-29 15:50:27'),(31,231,'2015-02-17 12:57:30'),(31,232,'2015-02-17 12:58:02'),(31,233,'2015-02-17 12:58:15'),(31,235,'2015-02-17 12:57:16'),(31,236,'2015-02-17 12:57:36'),(31,238,'2015-02-17 12:58:24'),(31,239,'2015-02-17 12:57:06'),(31,240,'2015-02-17 12:57:24'),(31,241,'2015-02-17 12:57:55'),(31,243,'2015-02-17 12:56:34'),(31,249,'2015-01-29 15:49:13'),(31,251,'2015-01-29 15:48:49'),(31,253,'2015-01-29 15:49:00'),(31,255,'2015-01-29 15:48:34'),(31,256,'2015-01-29 15:47:18'),(31,257,'2015-01-29 15:47:10'),(31,258,'2015-01-29 15:46:40'),(31,259,'2015-01-29 15:47:01'),(31,264,'2015-02-11 16:44:16'),(31,265,'2015-02-11 16:45:17'),(31,266,'2015-02-11 16:45:27'),(31,268,'2015-02-11 16:44:08'),(31,271,'2015-02-11 16:45:33'),(31,274,'2015-02-11 16:45:06'),(31,275,'2015-02-11 16:42:54'),(31,276,'2015-02-11 16:43:19'),(31,277,'2015-02-11 16:43:46'),(31,279,'2015-02-11 16:42:36'),(31,280,'2015-02-11 16:43:06'),(31,281,'2015-02-11 16:43:36'),(31,282,'2015-02-11 16:43:52'),(31,284,'2015-02-11 16:42:46'),(31,287,'2015-02-11 16:45:51'),(37,237,'2015-02-23 16:00:30'),(37,254,'2015-02-23 16:00:53'),(37,264,'2015-02-19 19:10:07'),(37,269,'2015-02-23 16:01:48'),(37,270,'2015-02-23 16:02:05'),(37,285,'2015-02-23 16:01:15'),(37,288,'2015-02-19 19:05:49'),(37,289,'2015-02-23 16:00:02'),(37,295,'2015-02-23 15:58:25');
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
INSERT INTO `setters_gyms_access` VALUES (3,2),(4,2),(6,2),(7,2),(8,2),(9,2),(10,2),(31,2),(32,2),(33,2),(36,2),(35,34);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suggestions`
--

LOCK TABLES `suggestions` WRITE;
/*!40000 ALTER TABLE `suggestions` DISABLE KEYS */;
INSERT INTO `suggestions` VALUES (2,8,'Have the stars be a different color when rated vs not rated'),(3,27,'I am still seeing Chinese characters and pop-ups should be cleaned up :) Loving this site though, great work!!'),(4,2,'Include unrated routes in total # of routes per setter'),(5,37,'When hovering over the bouldering/top rope/lead selector (.has-tip ?), my mouse turns to a question mark.  I am not sure if this is the intended behavior but a cursor:pointer may be a better option to indicate a clickable button.'),(6,37,'The individual route view looks great on mobile but a bit strange on a desktop because the font is so large and the attribute names (color, setter, etc.) are so far from their values.  I feel like a popup view with setter, color, date, and send button would make it much easier to get quick info on a route and send it on a desktop (with access to full route page by clicking popup header), but at least a different layout without a send button that isn\'t 100% width would make it seem less stretched overall.'),(7,37,'A different default gym picture would be beneficial, right now the giant x over the camera may scare some users away.  I would suggest maybe a light grey silhouette of a climbing wall with a climber on it, like you see in a lot of gym logos.'),(8,37,'An indication that you have sent a route in the overall list of routes (top routes, per wall routes, etc) would make it easier to see what else you need to send and give accomplishment when you can see you\'ve cleared a wall, or show what you need to come in and work at a quick glance.');
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
INSERT INTO `suggestions_upvotes` VALUES (8,2),(2,8),(2,10);
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
INSERT INTO `users` VALUES (1,2,'Cody','Seibert'),(3,2,'Mark','Mercer'),(4,2,'Guillermo','Martinez'),(6,2,'Joshua','Jimenez'),(7,2,'Davis','Stewart'),(8,2,'Jonmikel','Macnichols'),(9,2,'Blake','Compton'),(10,2,'Chris','Freiberg'),(13,2,'Travis','Newman'),(14,2,'Jessica','Jenkins'),(15,2,'Patrick','Murphy'),(16,2,'Steven','Featherston'),(17,2,'Hannah','Hayes'),(18,NULL,'Sean Michael','Smyth'),(20,2,'William','Fernandez'),(21,2,'Jeff','Mccallister'),(22,NULL,'Ashley','Pacailler'),(23,NULL,'Ryan','Jones'),(24,2,'Cody','Seibert'),(25,2,'Evan','Jones'),(27,2,'Nadine','Karaze'),(29,2,'Michael','Bird'),(31,2,'Austin','Lawicki'),(32,2,'Guest','Setter'),(33,2,'Lex','Johnson'),(35,34,'Guest','Setter'),(36,2,'Nicholas','Hanley Hankins'),(37,2,'Peter','Steffey'),(38,2,'Rogan','Gram');
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
INSERT INTO `walls` VALUES (1,'Wave',2,'2015-02-28 14:13:02',NULL),(2,'Diamond',2,'2015-02-28 14:14:23',NULL),(3,'Right Gray',2,'2015-02-28 14:15:36',NULL),(4,'Boulder Cave',2,'2015-02-28 14:09:42',NULL),(5,'Lead Cave',2,'2015-02-23 12:59:04',NULL),(11,'Lead',2,'2015-02-28 13:49:53',NULL),(12,'1',2,'0000-00-00 00:00:00',NULL),(13,'2',2,'0000-00-00 00:00:00',NULL),(14,'3',2,'0000-00-00 00:00:00',NULL),(15,'4',2,'0000-00-00 00:00:00',NULL),(16,'5',2,'0000-00-00 00:00:00',NULL),(17,'6',2,'0000-00-00 00:00:00',NULL),(18,'7',2,'0000-00-00 00:00:00',NULL),(19,'8',2,'0000-00-00 00:00:00',NULL),(20,'9',2,'0000-00-00 00:00:00',NULL),(21,'10',2,'2015-01-12 14:17:33',NULL),(22,'11',2,'2015-02-28 13:26:31',NULL),(24,'12',2,'2015-02-28 13:28:36',NULL),(25,'13',2,'2015-02-28 13:30:07',NULL),(26,'14',2,'2015-02-28 13:30:51',NULL),(27,'15',2,'2015-02-28 13:34:34',NULL),(29,'16',2,'2015-02-28 13:34:50',NULL),(30,'17',2,'2015-02-28 13:35:14',NULL),(31,'18',2,'2015-02-28 13:37:06',NULL),(32,'19',2,'2015-02-28 13:37:16',NULL),(33,'20',2,'2015-02-28 13:37:43',NULL),(34,'21',2,'2015-02-28 13:38:11',NULL),(35,'22',2,'2015-02-28 13:38:24',NULL),(36,'23',2,'2015-02-28 13:38:42',NULL),(37,'24',2,'2015-02-28 13:39:03',NULL),(38,'25',2,'2015-02-28 13:39:22',NULL),(39,'26',2,'2015-02-28 13:39:35',NULL),(40,'27',2,'2015-02-28 13:40:28',NULL),(41,'Kid Zone Room',26,'0000-00-00 00:00:00',NULL),(42,'Bouldering Room',26,'0000-00-00 00:00:00',NULL),(43,'The Arch',26,'0000-00-00 00:00:00',NULL),(44,'Top Rope Room',26,'0000-00-00 00:00:00',NULL),(45,'Ying-Yang Wall',26,'0000-00-00 00:00:00',NULL),(46,'Lead Walls',26,'0000-00-00 00:00:00',NULL),(47,'Speed Walls',26,'0000-00-00 00:00:00',NULL),(48,'Auto Belay',26,'0000-00-00 00:00:00',NULL),(49,'Wave Wall',26,'0000-00-00 00:00:00',NULL),(50,'Mushroom Boulder',26,'0000-00-00 00:00:00',NULL),(51,'The Pit',26,'0000-00-00 00:00:00',NULL),(52,'Chestnut Walls',26,'0000-00-00 00:00:00',NULL);
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

-- Dump completed on 2015-03-01 13:52:38
