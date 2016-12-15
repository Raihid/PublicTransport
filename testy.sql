-- MySQL dump 10.13  Distrib 5.7.16, for Linux (x86_64)
--
-- Host: localhost    Database: transport
-- ------------------------------------------------------
-- Server version	5.7.16-0ubuntu0.16.04.1

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
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2016-12-12 20:06:28','2016-12-12 20:06:28');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

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
  CONSTRAINT `area_tickets_ibfk_1` FOREIGN KEY (`area`) REFERENCES `area` (`id`),
  CONSTRAINT `area_tickets_ibfk_2` FOREIGN KEY (`ticket`) REFERENCES `ticket_types` (`id`)
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
  `name` varchar(50) COLLATE latin2_bin DEFAULT NULL,
  `calendar` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin2 COLLATE=latin2_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `day`
--

LOCK TABLES `day` WRITE;
/*!40000 ALTER TABLE `day` DISABLE KEYS */;
INSERT INTO `day` VALUES (1,0,'Dzień pracujący',NULL),(2,0,'Sobota',NULL),(3,1,'Niedziela',NULL),(4,1,'Nowy rok','2017-01-01');
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
  `departure_hour` time DEFAULT NULL,
  `arrival_hour` time DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `line` int(11) DEFAULT NULL,
  `vehicle` int(11) DEFAULT NULL,
  `driver` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `day` (`day`),
  KEY `line` (`line`),
  KEY `vehicle` (`vehicle`),
  KEY `driver` (`driver`),
  CONSTRAINT `departure_ibfk_1` FOREIGN KEY (`day`) REFERENCES `day` (`id`),
  CONSTRAINT `departure_ibfk_2` FOREIGN KEY (`line`) REFERENCES `lines` (`id`),
  CONSTRAINT `departure_ibfk_3` FOREIGN KEY (`vehicle`) REFERENCES `vehicle` (`id`),
  CONSTRAINT `departure_ibfk_4` FOREIGN KEY (`driver`) REFERENCES `driver` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin2 COLLATE=latin2_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departure`
--

LOCK TABLES `departure` WRITE;
/*!40000 ALTER TABLE `departure` DISABLE KEYS */;
INSERT INTO `departure` VALUES (1,'06:30:00','07:15:00',1,1,3,1),(2,'07:00:00','07:45:00',1,1,1,2),(3,'07:30:00','08:15:00',1,1,3,1),(4,'08:00:00','08:45:00',1,1,1,2),(5,'08:30:00','09:15:00',1,1,3,1),(6,'09:00:00','09:45:00',1,1,1,2),(7,'09:30:00','10:15:00',1,1,3,1),(8,'15:31:00','16:00:00',1,3,2,3),(9,'16:01:00','16:30:00',1,4,2,3),(10,'16:31:00','17:00:00',1,3,2,3),(11,'17:01:00','17:30:00',1,4,2,3);
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
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `driver_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin2 COLLATE=latin2_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver`
--

LOCK TABLES `driver` WRITE;
/*!40000 ALTER TABLE `driver` DISABLE KEYS */;
INSERT INTO `driver` VALUES (1,'Jan Kowalski','555555',NULL),(2,'Marta Nowak','5555',NULL),(3,'Kamil Pędziwilk','5555',NULL),(4,'Robert Sańko','5555',NULL);
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
-- Table structure for table `lines_stops`
--

DROP TABLE IF EXISTS `lines_stops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lines_stops` (
  `line_id` int(11) DEFAULT NULL,
  `stop_id` int(11) DEFAULT NULL,
  `order_no` int(11) DEFAULT NULL,
  KEY `line_id` (`line_id`),
  KEY `stop_id` (`stop_id`),
  CONSTRAINT `lines_stops_ibfk_1` FOREIGN KEY (`line_id`) REFERENCES `lines` (`id`),
  CONSTRAINT `lines_stops_ibfk_2` FOREIGN KEY (`stop_id`) REFERENCES `stops` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lines_stops`
--

LOCK TABLES `lines_stops` WRITE;
/*!40000 ALTER TABLE `lines_stops` DISABLE KEYS */;
INSERT INTO `lines_stops`(line_id, stop_id, order_no) VALUES (1, 2, 1), (1, 21, 2), (1, 20, 3), (1, 22, 4), (1,23, 5), (1, 1, 6), (1, 3, 7);

/*!40000 ALTER TABLE `lines_stops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lines`
--

DROP TABLE IF EXISTS `lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(255) COLLATE latin2_bin DEFAULT NULL,
  `first_stop` int(11) DEFAULT NULL,
  `last_stop` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `first_stop` (`first_stop`),
  KEY `last_stop` (`last_stop`),
  CONSTRAINT `lines_ibfk_1` FOREIGN KEY (`first_stop`) REFERENCES `stops` (`id`),
  CONSTRAINT `lines_ibfk_2` FOREIGN KEY (`last_stop`) REFERENCES `stops` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin2 COLLATE=latin2_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lines`
--

LOCK TABLES `lines` WRITE;
/*!40000 ALTER TABLE `lines` DISABLE KEYS */;
INSERT INTO `lines` VALUES (1,'23',2,3),(2,'23',3,2),(3,'18',2,4),(4,'18',4,2),(5,'8',5,6),(6,'8',6,5);
/*!40000 ALTER TABLE `lines` ENABLE KEYS */;
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
-- Table structure for table `route_part`
--

DROP TABLE IF EXISTS `route_part`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `route_part` (
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
  CONSTRAINT `route_part_ibfk_1` FOREIGN KEY (`departure`) REFERENCES `departure` (`id`),
  CONSTRAINT `route_part_ibfk_2` FOREIGN KEY (`day`) REFERENCES `day` (`id`),
  CONSTRAINT `route_part_ibfk_3` FOREIGN KEY (`stop`) REFERENCES `stops` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route_part`
--

LOCK TABLES `route_part` WRITE;
/*!40000 ALTER TABLE `route_part` DISABLE KEYS */;
/*!40000 ALTER TABLE `route_part` ENABLE KEYS */;
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
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stops`
--

DROP TABLE IF EXISTS `stops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE latin2_bin DEFAULT NULL,
  `geo_lat` int(11) DEFAULT NULL,
  `geo_lng` int(11) DEFAULT NULL,
  `area` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `area` (`area`),
  CONSTRAINT `stops_ibfk_1` FOREIGN KEY (`area`) REFERENCES `area` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin2 COLLATE=latin2_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stops`
--

LOCK TABLES `stops` WRITE;
/*!40000 ALTER TABLE `stops` DISABLE KEYS */;
INSERT INTO `stops` VALUES (1,'Bieżanowska',NULL,NULL,1),(2,'Czerwone Maki',NULL,NULL,1),(3,'Nowy Bieżanów',NULL,NULL,1),(4,'Krowodrza Górka',NULL,NULL,1),(5,'Bronowice',NULL,NULL,1),(6,'Borek Fałęcki',NULL,NULL,1),(7,'Kurdwanów',NULL,NULL,1),(8,'Teatr Bagatela',NULL,NULL,1),(9,'Filharmonia',NULL,NULL,1),(10,'Nowy Kleparz',NULL,NULL,1),(11,'Norymberska',NULL,NULL,1),(12,'Azory',NULL,NULL,1),(13,'Uniwersytet Rolniczy',NULL,NULL,1),(14,'Salwator',NULL,NULL,1),(15,'Salwator',NULL,NULL,1),(16,'Borek Fałęcki',NULL,NULL,1),(17,'Filharmonia',NULL,NULL,1),(18,'Cichy Kącik',NULL,NULL,1),(19,'Dworzec Towarowy',NULL,NULL,1),(20,'Rondo Matecznego',NULL, NULL,1),
(21,'Lipińskiego',NULL, NULL,1),(22,'Korona',NULL, NULL,1),(23,'Dworcowa',NULL, NULL,1),(24,'Dworzec Główny',NULL, NULL,1),(25,'Miasteczko Studenckie AGH',NULL, NULL,1);
/*!40000 ALTER TABLE `stops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_types`
--

DROP TABLE IF EXISTS `ticket_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE latin2_bin DEFAULT NULL,
  `privilege` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `privilege` (`privilege`),
  CONSTRAINT `ticket_types_ibfk_1` FOREIGN KEY (`privilege`) REFERENCES `privilege` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin2 COLLATE=latin2_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_types`
--

LOCK TABLES `ticket_types` WRITE;
/*!40000 ALTER TABLE `ticket_types` DISABLE KEYS */;
INSERT INTO `ticket_types` VALUES (1,'Bilet miejski normalny',NULL,NULL),(2,'Bilet miejski studencki',1,NULL),(3,'Bilet miejski uczniowski',2,NULL),(4,'Karnet miejski normalny',NULL,NULL),(5,'Karnet miejski studencki',1,NULL),(6,'Karnet miejski uczniowski',2,NULL),(7,'Przepustka dla emerytów',3,NULL),(8,'Przepustka dla kombatantów',4,NULL);
/*!40000 ALTER TABLE `ticket_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `ticket_type` int(11) DEFAULT NULL,
  `valid_from` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `valid_to` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin2 COLLATE=latin2_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,'Gość',0),(2,'Zarejestrowany',0),(3,'Administrator',1),(4,'Kierowca',0);
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
  `transport_points` int(11) DEFAULT NULL,
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
INSERT INTO `users` VALUES (1,'admin','admin','admin@transport.com',3,NULL),(2,'Janek','hunter1','jan@janowski.pl',2,NULL);
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
  CONSTRAINT `vehicle_ibfk_1` FOREIGN KEY (`cond`) REFERENCES `vehicle_condition` (`id`),
  CONSTRAINT `vehicle_ibfk_2` FOREIGN KEY (`variant`) REFERENCES `vehicle_variant` (`id`)
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
  CONSTRAINT `vehicle_breakdown_ibfk_1` FOREIGN KEY (`scale`) REFERENCES `vehicle_breakdown_scale` (`id`),
  CONSTRAINT `vehicle_breakdown_ibfk_2` FOREIGN KEY (`vehicle`) REFERENCES `vehicle` (`id`)
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

-- Dump completed on 2016-12-14 20:00:10
