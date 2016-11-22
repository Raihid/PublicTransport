-- MySQL dump 10.13  Distrib 5.5.52, for debian-linux-gnu (x86_64)
--
-- Host: spk-www    Database: WOLCZYK
-- ------------------------------------------------------
-- Server version	5.5.52-0+deb7u1

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
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE latin2_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin2 COLLATE=latin2_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` VALUES (1,'Strefa miejska'),(2,'Strefa podmiejska I'),(3,'Strefa podmiejska II'),(4,'Strefa nuklearna');
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area_tickets`
--

DROP TABLE IF EXISTS `area_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area_tickets` (
  `area` int(11) DEFAULT NULL,
  `ticket` int(11) DEFAULT NULL,
  KEY `area` (`area`),
  KEY `ticket` (`ticket`),
  CONSTRAINT `area_tickets_ibfk_2` FOREIGN KEY (`ticket`) REFERENCES `tickets` (`id`),
  CONSTRAINT `area_tickets_ibfk_1` FOREIGN KEY (`area`) REFERENCES `area` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area_tickets`
--

LOCK TABLES `area_tickets` WRITE;
/*!40000 ALTER TABLE `area_tickets` DISABLE KEYS */;
INSERT INTO `area_tickets` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(2,7),(2,8),(3,7),(3,8);
/*!40000 ALTER TABLE `area_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `day`
--

DROP TABLE IF EXISTS `day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `day` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `holiday` tinyint(4) DEFAULT NULL,
  `calendar` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `day`
--

LOCK TABLES `day` WRITE;
/*!40000 ALTER TABLE `day` DISABLE KEYS */;
/*!40000 ALTER TABLE `day` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departure`
--

DROP TABLE IF EXISTS `departure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departure` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hour` time DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `line` int(11) DEFAULT NULL,
  `vehicle` int(11) DEFAULT NULL,
  `driver` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `day` (`day`),
  KEY `line` (`line`),
  KEY `vehicle` (`vehicle`),
  KEY `driver` (`driver`),
  CONSTRAINT `departure_ibfk_4` FOREIGN KEY (`driver`) REFERENCES `driver` (`id`),
  CONSTRAINT `departure_ibfk_1` FOREIGN KEY (`day`) REFERENCES `day` (`id`),
  CONSTRAINT `departure_ibfk_2` FOREIGN KEY (`line`) REFERENCES `line` (`id`),
  CONSTRAINT `departure_ibfk_3` FOREIGN KEY (`vehicle`) REFERENCES `vehicle` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departure`
--

LOCK TABLES `departure` WRITE;
/*!40000 ALTER TABLE `departure` DISABLE KEYS */;
/*!40000 ALTER TABLE `departure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `difficulties`
--

DROP TABLE IF EXISTS `difficulties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `difficulties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `caller` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  `line_number` varchar(255) COLLATE latin2_bin DEFAULT NULL,
  `diff_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `diff_type` (`diff_type`),
  CONSTRAINT `difficulties_ibfk_1` FOREIGN KEY (`diff_type`) REFERENCES `difficulty_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `difficulties`
--

LOCK TABLES `difficulties` WRITE;
/*!40000 ALTER TABLE `difficulties` DISABLE KEYS */;
/*!40000 ALTER TABLE `difficulties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `difficulty_repairman`
--

DROP TABLE IF EXISTS `difficulty_repairman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `difficulty_repairman` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(255) COLLATE latin2_bin DEFAULT NULL,
  `working_hours` varchar(255) COLLATE latin2_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `difficulty_repairman`
--

LOCK TABLES `difficulty_repairman` WRITE;
/*!40000 ALTER TABLE `difficulty_repairman` DISABLE KEYS */;
/*!40000 ALTER TABLE `difficulty_repairman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `difficulty_type`
--

DROP TABLE IF EXISTS `difficulty_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `difficulty_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE latin2_bin DEFAULT NULL,
  `repairman` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `difficulty_type`
--

LOCK TABLES `difficulty_type` WRITE;
/*!40000 ALTER TABLE `difficulty_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `difficulty_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driver`
--

DROP TABLE IF EXISTS `driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `driver` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE latin2_bin DEFAULT NULL,
  `pesel` varchar(255) COLLATE latin2_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin2 COLLATE=latin2_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver`
--

LOCK TABLES `driver` WRITE;
/*!40000 ALTER TABLE `driver` DISABLE KEYS */;
INSERT INTO `driver` VALUES (1,'Jan Kowalski','555555'),(2,'Marta Nowak','5555');
/*!40000 ALTER TABLE `driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driver_permission`
--

DROP TABLE IF EXISTS `driver_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `driver_permission` (
  `driver` int(11) DEFAULT NULL,
  `permission` int(11) DEFAULT NULL,
  KEY `driver` (`driver`),
  KEY `permission` (`permission`),
  CONSTRAINT `driver_permission_ibfk_1` FOREIGN KEY (`driver`) REFERENCES `driver` (`id`),
  CONSTRAINT `driver_permission_ibfk_2` FOREIGN KEY (`permission`) REFERENCES `permissions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver_permission`
--

LOCK TABLES `driver_permission` WRITE;
/*!40000 ALTER TABLE `driver_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `driver_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `line`
--

DROP TABLE IF EXISTS `line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `line` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(255) COLLATE latin2_bin DEFAULT NULL,
  `first_stop` int(11) DEFAULT NULL,
  `last_stop` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `first_stop` (`first_stop`),
  KEY `last_stop` (`last_stop`),
  CONSTRAINT `line_ibfk_1` FOREIGN KEY (`first_stop`) REFERENCES `stop` (`id`),
  CONSTRAINT `line_ibfk_2` FOREIGN KEY (`last_stop`) REFERENCES `stop` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin2 COLLATE=latin2_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `line`
--

LOCK TABLES `line` WRITE;
/*!40000 ALTER TABLE `line` DISABLE KEYS */;
INSERT INTO `line` VALUES (1,'23',7,8);
/*!40000 ALTER TABLE `line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_title` varchar(255) COLLATE latin2_bin DEFAULT NULL,
  `required_document` varchar(255) COLLATE latin2_bin DEFAULT NULL,
  `vehicle_variant` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vehicle_variant` (`vehicle_variant`),
  CONSTRAINT `permissions_ibfk_1` FOREIGN KEY (`vehicle_variant`) REFERENCES `vehicle_variant` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin2 COLLATE=latin2_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'Prowadzenie autobusu','Prawo jazdy kat. D',1),(2,'Prowadzenie tramwaju','Pozwolenie na prowadzenie tramwaju',2);
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privilege`
--

DROP TABLE IF EXISTS `privilege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `privilege` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE latin2_bin DEFAULT NULL,
  `discount_percent` int(11) DEFAULT NULL,
  `document` varchar(255) COLLATE latin2_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin2 COLLATE=latin2_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privilege`
--

LOCK TABLES `privilege` WRITE;
/*!40000 ALTER TABLE `privilege` DISABLE KEYS */;
INSERT INTO `privilege` VALUES (1,'Student',50,'Legitymacja studencka'),(2,'Uczeń',33,'Legitymacja uczniowska'),(3,'Emetryt',100,'Karta emeryta'),(4,'Kombatant',100,'Karta kombatanta');
/*!40000 ALTER TABLE `privilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applies_from` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `applies_to` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment` varchar(255) COLLATE latin2_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `station`
--

DROP TABLE IF EXISTS `station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `station` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE latin2_bin DEFAULT NULL,
  `geo_lat` int(11) DEFAULT NULL,
  `geo_lng` int(11) DEFAULT NULL,
  `area` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `area` (`area`),
  CONSTRAINT `station_ibfk_1` FOREIGN KEY (`area`) REFERENCES `area` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin2 COLLATE=latin2_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `station`
--

LOCK TABLES `station` WRITE;
/*!40000 ALTER TABLE `station` DISABLE KEYS */;
INSERT INTO `station` VALUES (11,'Bieżanowska',NULL,NULL,1),(12,'Czerwone Maki',NULL,NULL,1),(13,'Kurdwanów',NULL,NULL,1),(14,'Teatr Bagatela',NULL,NULL,1),(15,'Filharmonia',NULL,NULL,1),(16,'Nowy Kleparz',NULL,NULL,1),(17,'Norymberska',NULL,NULL,1),(18,'Azory',NULL,NULL,1),(19,'Nowy Bieżanów',NULL,NULL,1),(20,'Uniwersytet Rolniczy',NULL,NULL,1);
/*!40000 ALTER TABLE `station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stop`
--

DROP TABLE IF EXISTS `stop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `station` int(11) DEFAULT NULL,
  `direction` varchar(255) COLLATE latin2_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `station` (`station`),
  CONSTRAINT `stop_ibfk_1` FOREIGN KEY (`station`) REFERENCES `station` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin2 COLLATE=latin2_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stop`
--

LOCK TABLES `stop` WRITE;
/*!40000 ALTER TABLE `stop` DISABLE KEYS */;
INSERT INTO `stop` VALUES (3,11,'Kabel'),(4,11,'Wlotowa'),(5,12,'UJ'),(6,19,'Ćwiklińskiej'),(7,19,'Pętla'),(8,12,'Pętla');
/*!40000 ALTER TABLE `stop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stop_arrival`
--

DROP TABLE IF EXISTS `stop_arrival`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stop_arrival` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `departure` int(11) DEFAULT NULL,
  `hour` time DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `stop` int(11) DEFAULT NULL,
  `stop_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `departure` (`departure`),
  KEY `day` (`day`),
  KEY `stop` (`stop`),
  CONSTRAINT `stop_arrival_ibfk_3` FOREIGN KEY (`stop`) REFERENCES `stop` (`id`),
  CONSTRAINT `stop_arrival_ibfk_1` FOREIGN KEY (`departure`) REFERENCES `departure` (`id`),
  CONSTRAINT `stop_arrival_ibfk_2` FOREIGN KEY (`day`) REFERENCES `day` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stop_arrival`
--

LOCK TABLES `stop_arrival` WRITE;
/*!40000 ALTER TABLE `stop_arrival` DISABLE KEYS */;
/*!40000 ALTER TABLE `stop_arrival` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE latin2_bin DEFAULT NULL,
  `privilege` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `privilege` (`privilege`),
  CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`privilege`) REFERENCES `privilege` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin2 COLLATE=latin2_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES (1,'Bilet miejski normalny',NULL),(2,'Bilet miejski studencki',1),(3,'Bilet miejski uczniowski',2),(4,'Karnet miejski normalny',NULL),(5,'Karnet miejski studencki',1),(6,'Karnet miejski uczniowski',2),(7,'Przepustka dla emerytów',3),(8,'Przepustka dla kombatantów',4);
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE latin2_bin DEFAULT NULL,
  `edit_permission` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin2 COLLATE=latin2_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,'Gość',0),(2,'Zarejestrowany',0),(3,'Administrator',1);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) COLLATE latin2_bin DEFAULT NULL,
  `password` varchar(255) COLLATE latin2_bin DEFAULT NULL,
  `email` varchar(255) COLLATE latin2_bin DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role` (`role`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role`) REFERENCES `user_roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin2 COLLATE=latin2_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin','admin@transport.com',3),(2,'Janek','hunter1','jan@janowski.pl',2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `variant` int(11) DEFAULT NULL,
  `registration_number` varchar(255) COLLATE latin2_bin DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `cond` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cond` (`cond`),
  KEY `variant` (`variant`),
  CONSTRAINT `vehicle_ibfk_2` FOREIGN KEY (`variant`) REFERENCES `vehicle_variant` (`id`),
  CONSTRAINT `vehicle_ibfk_1` FOREIGN KEY (`cond`) REFERENCES `vehicle_condition` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin2 COLLATE=latin2_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
INSERT INTO `vehicle` VALUES (1,1,'ABC-001',50000,1),(2,1,'ABC-002',20000,3),(3,2,'ABC-003',80000,1),(4,2,'ABC-004',500,5);
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_breakdown`
--

DROP TABLE IF EXISTS `vehicle_breakdown`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_breakdown` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` int(11) DEFAULT NULL,
  `scale` int(11) DEFAULT NULL,
  `description` varchar(255) COLLATE latin2_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `scale` (`scale`),
  KEY `vehicle` (`vehicle`),
  CONSTRAINT `vehicle_breakdown_ibfk_2` FOREIGN KEY (`vehicle`) REFERENCES `vehicle` (`id`),
  CONSTRAINT `vehicle_breakdown_ibfk_1` FOREIGN KEY (`scale`) REFERENCES `vehicle_breakdown_scale` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_breakdown`
--

LOCK TABLES `vehicle_breakdown` WRITE;
/*!40000 ALTER TABLE `vehicle_breakdown` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle_breakdown` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_breakdown_scale`
--

DROP TABLE IF EXISTS `vehicle_breakdown_scale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_breakdown_scale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seriousness` int(11) DEFAULT NULL,
  `comments` varchar(255) COLLATE latin2_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin2 COLLATE=latin2_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_breakdown_scale`
--

LOCK TABLES `vehicle_breakdown_scale` WRITE;
/*!40000 ALTER TABLE `vehicle_breakdown_scale` DISABLE KEYS */;
INSERT INTO `vehicle_breakdown_scale` VALUES (1,1,'Trywialne do naprawy'),(2,2,'Łatwe do naprawy'),(3,3,'Standardowa naprawa'),(4,4,'Trudne do naprawy'),(5,5,'Bardzo trudne do naprawy'),(6,6,'Naprawa niemożliwa');
/*!40000 ALTER TABLE `vehicle_breakdown_scale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_condition`
--

DROP TABLE IF EXISTS `vehicle_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_condition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE latin2_bin DEFAULT NULL,
  `road_suitable` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin2 COLLATE=latin2_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_condition`
--

LOCK TABLES `vehicle_condition` WRITE;
/*!40000 ALTER TABLE `vehicle_condition` DISABLE KEYS */;
INSERT INTO `vehicle_condition` VALUES (1,'Stan idealny',1),(2,'Stan bardzo dobry',1),(3,'Stan dobry',1),(4,'Stan dostateczny',1),(5,'Stan niedopuszczalny',0),(6,'Stan krytyczny',0),(7,'Złom',0);
/*!40000 ALTER TABLE `vehicle_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_variant`
--

DROP TABLE IF EXISTS `vehicle_variant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_variant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE latin2_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin2 COLLATE=latin2_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_variant`
--

LOCK TABLES `vehicle_variant` WRITE;
/*!40000 ALTER TABLE `vehicle_variant` DISABLE KEYS */;
INSERT INTO `vehicle_variant` VALUES (1,'Autobus'),(2,'Tramwaj'),(3,'Helikopter'),(4,'Amfibia');
/*!40000 ALTER TABLE `vehicle_variant` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-22  9:26:34
