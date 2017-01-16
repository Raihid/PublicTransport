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
-- Table structure for table `departures`
--

DROP TABLE IF EXISTS `departures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departures` (
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
  CONSTRAINT `departures_ibfk_1` FOREIGN KEY (`day`) REFERENCES `day` (`id`),
  CONSTRAINT `departures_ibfk_2` FOREIGN KEY (`line`) REFERENCES `lines` (`id`),
  CONSTRAINT `departures_ibfk_3` FOREIGN KEY (`vehicle`) REFERENCES `vehicles` (`id`),
  CONSTRAINT `departures_ibfk_4` FOREIGN KEY (`driver`) REFERENCES `drivers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin2 COLLATE=latin2_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departures`
--

LOCK TABLES `departures` WRITE;
/*!40000 ALTER TABLE `departures` DISABLE KEYS */;
INSERT INTO `departures` VALUES (1,'06:30:00','07:15:00',1,1,3,1),(2,'07:00:00','07:45:00',1,1,1,2),(3,'07:30:00','08:15:00',1,1,3,1),(4,'08:00:00','08:45:00',1,1,1,2),(5,'08:30:00','09:15:00',1,1,3,1),(6,'09:00:00','09:45:00',1,1,1,2),(7,'09:30:00','10:15:00',1,1,3,1),(8,'15:31:00','16:00:00',1,3,2,3),(9,'16:01:00','16:30:00',1,4,2,3),(10,'16:31:00','17:00:00',1,3,2,3),(11,'17:01:00','17:30:00',1,4,2,3),(27,'14:00:00','14:30:00',1,1,1,1),(28,'12:00:00','12:30:00',1,7,3,2),(29,'13:00:00','13:30:00',1,7,3,2);
/*!40000 ALTER TABLE `departures` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`rahid`@`localhost`*/ /*!50003 TRIGGER ins_departure BEFORE INSERT ON departures FOR EACH ROW BEGIN DECLARE driver_num INT(11); DECLARE vehicle_num INT(11); SELECT COUNT(*) INTO driver_num FROM departures WHERE departures.driver = NEW.driver AND departures.day = NEW.day AND departures.departure_hour <= NEW.arrival_hour AND departures.arrival_hour >= NEW.departure_hour; IF (driver_num > 0) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Driver already on road"; END IF; SELECT COUNT(*) INTO vehicle_num FROM departures WHERE departures.vehicle = NEW.vehicle AND departures.day = NEW.day AND departures.departure_hour <= NEW.arrival_hour AND departures.arrival_hour >= NEW.departure_hour; IF(vehicle_num > 0) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Vehicle already on road"; END IF; END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
  `title` varchar(100) COLLATE latin2_bin DEFAULT NULL,
  `description` varchar(1000) COLLATE latin2_bin DEFAULT NULL,
  `line` int(11) DEFAULT NULL,
  `diff_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `diff_type` (`diff_type`),
  FULLTEXT KEY `title` (`title`,`description`),
  CONSTRAINT `difficulties_ibfk_1` FOREIGN KEY (`diff_type`) REFERENCES `difficulty_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin2 COLLATE=latin2_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `difficulties`
--

LOCK TABLES `difficulties` WRITE;
/*!40000 ALTER TABLE `difficulties` DISABLE KEYS */;
INSERT INTO `difficulties` VALUES (10,NULL,NULL,'Ostrzeżenie','Bardzo smutna wiadomość',1,NULL),(11,NULL,NULL,'Ostrzeżenie','Człowiek w czerni się awanturuje.',1,NULL),(12,NULL,NULL,'Ostrzeżenie','Sowy nie są tym, czym się wydają.',1,3),(13,NULL,NULL,'Ostrzeżenie','She\'s dead, wrapped in plastic.',1,7),(14,NULL,NULL,'Ostrzeżenie','Gołąb spłonął na kablu.',5,1),(15,NULL,NULL,'Ostrzeżenie','Za gorąco, ej.',1,2),(16,NULL,NULL,NULL,'Na trakcję linii updało drzewo, przerwało linię trakcyjną. To chyba świerk.',5,1),(17,NULL,NULL,'Jest bardzo gorąco, pękła szyna','Proszę uważać na dzikie zwierzęta, które kręcą się w okolicy.',6,2);
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
  `name` varchar(100) COLLATE latin2_bin DEFAULT NULL,
  `phone` varchar(255) COLLATE latin2_bin DEFAULT NULL,
  `working_hours` varchar(255) COLLATE latin2_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin2 COLLATE=latin2_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `difficulty_repairman`
--

LOCK TABLES `difficulty_repairman` WRITE;
/*!40000 ALTER TABLE `difficulty_repairman` DISABLE KEYS */;
INSERT INTO `difficulty_repairman` VALUES (1,'TramWorld','555555555','08:00 - 16:00'),(2,'Straż miejska','997','00:00 - 23:59'),(3,'Ghostbusters','555-2368','06:00 - 18:00'),(4,'FBI','Powiedz na głos trzy razy \"Moje najgorsze koszmary nie przewidziały tego co się stało\"','12:00 - 13:00');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin2 COLLATE=latin2_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `difficulty_type`
--

LOCK TABLES `difficulty_type` WRITE;
/*!40000 ALTER TABLE `difficulty_type` DISABLE KEYS */;
INSERT INTO `difficulty_type` VALUES (1,'Przerwana linia trakcyjna',1),(2,'Pęknięcie szyny',1),(3,'Niebezpieczny pasażer',2),(4,'Gapowicz bez biletu',2),(5,'Sowy nie są tym, czym się wydają',4),(6,'Poltergeist na wolności',3),(7,'Morderstwo Laury Palmer',4);
/*!40000 ALTER TABLE `difficulty_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driver_permissions`
--

DROP TABLE IF EXISTS `driver_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `driver_permissions` (
  `driver` int(11) DEFAULT NULL,
  `permission` int(11) DEFAULT NULL,
  KEY `driver` (`driver`),
  KEY `permission` (`permission`),
  CONSTRAINT `driver_permissions_ibfk_1` FOREIGN KEY (`driver`) REFERENCES `drivers` (`id`),
  CONSTRAINT `driver_permissions_ibfk_2` FOREIGN KEY (`permission`) REFERENCES `permissions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver_permissions`
--

LOCK TABLES `driver_permissions` WRITE;
/*!40000 ALTER TABLE `driver_permissions` DISABLE KEYS */;
INSERT INTO `driver_permissions` VALUES (1,1),(1,2),(2,1),(3,1);
/*!40000 ALTER TABLE `driver_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drivers`
--

DROP TABLE IF EXISTS `drivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drivers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE latin2_bin DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `pesel` varchar(255) COLLATE latin2_bin DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pesel` (`pesel`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `drivers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin2 COLLATE=latin2_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drivers`
--

LOCK TABLES `drivers` WRITE;
/*!40000 ALTER TABLE `drivers` DISABLE KEYS */;
INSERT INTO `drivers` VALUES (1,'Jan Kowalski',40,'555555',NULL),(2,'Marta Nowak',25,'333',NULL),(3,'Kamil Pędziwilk',32,'444',NULL),(4,'Robert Sańko',19,'5555',NULL),(5,'Test testowy',123,'255255255',NULL),(12,'Michał Turnau',29,'01234567',NULL);
/*!40000 ALTER TABLE `drivers` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`rahid`@`localhost`*/ /*!50003 TRIGGER ins_driver BEFORE INSERT ON drivers FOR EACH ROW BEGIN
IF NEW.age < 18 OR NEW.age > 80 THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Person this age shouldn't be driving!";
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `drivers_possible_vehicles`
--

DROP TABLE IF EXISTS `drivers_possible_vehicles`;
/*!50001 DROP VIEW IF EXISTS `drivers_possible_vehicles`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `drivers_possible_vehicles` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `vehicle_id`,
 1 AS `registration_number`,
 1 AS `description`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `line_stops`
--

DROP TABLE IF EXISTS `line_stops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `line_stops` (
  `line_id` int(11) DEFAULT NULL,
  `stop_id` int(11) DEFAULT NULL,
  `order_no` int(11) DEFAULT NULL,
  KEY `line_id` (`line_id`),
  KEY `stop_id` (`stop_id`),
  CONSTRAINT `line_stops_ibfk_1` FOREIGN KEY (`line_id`) REFERENCES `lines` (`id`),
  CONSTRAINT `line_stops_ibfk_2` FOREIGN KEY (`stop_id`) REFERENCES `stops` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `line_stops`
--

LOCK TABLES `line_stops` WRITE;
/*!40000 ALTER TABLE `line_stops` DISABLE KEYS */;
/*!40000 ALTER TABLE `line_stops` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin2 COLLATE=latin2_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lines`
--

LOCK TABLES `lines` WRITE;
/*!40000 ALTER TABLE `lines` DISABLE KEYS */;
INSERT INTO `lines` VALUES (1,'23',2,3),(2,'23',3,2),(3,'18',2,4),(4,'18',4,2),(5,'8',5,6),(6,'8',6,5),(7,'13',3,5),(8,'13',5,3);
/*!40000 ALTER TABLE `lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `lines_routes`
--

DROP TABLE IF EXISTS `lines_routes`;
/*!50001 DROP VIEW IF EXISTS `lines_routes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `lines_routes` AS SELECT 
 1 AS `id`,
 1 AS `number`,
 1 AS `first_stop`,
 1 AS `last_stop`,
 1 AS `GROUP_CONCAT(stops.name SEPARATOR ', ')`*/;
SET character_set_client = @saved_cs_client;

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
INSERT INTO `lines_stops` VALUES (1,2,1),(1,21,2),(1,20,3),(1,22,4),(1,23,5),(1,1,6),(1,3,7),(7,1,1),(7,23,2),(7,8,3),(7,9,4),(7,5,5);
/*!40000 ALTER TABLE `lines_stops` ENABLE KEYS */;
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
-- Table structure for table `route_parts`
--

DROP TABLE IF EXISTS `route_parts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `route_parts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `departure` int(11) DEFAULT NULL,
  `hour` time DEFAULT NULL,
  `stop_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `departure` (`departure`),
  CONSTRAINT `route_parts_ibfk_1` FOREIGN KEY (`departure`) REFERENCES `departures` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin2 COLLATE=latin2_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route_parts`
--

LOCK TABLES `route_parts` WRITE;
/*!40000 ALTER TABLE `route_parts` DISABLE KEYS */;
INSERT INTO `route_parts` VALUES (1,1,'06:30:00',1),(2,1,'06:35:00',2),(3,1,'06:40:00',3),(13,27,'14:00:00',1),(14,27,'14:05:00',2),(15,27,'14:10:00',3),(16,27,'14:15:00',4),(17,27,'14:20:00',5),(18,27,'14:25:00',6),(19,27,'14:30:00',7),(20,28,'12:30:00',5),(21,28,'12:10:00',2),(22,28,'12:15:00',3),(23,28,'12:20:00',4),(24,29,'13:00:00',1),(25,29,'13:05:00',2),(26,29,'13:10:00',3),(27,29,'13:15:00',4),(28,29,'13:30:00',5),(29,28,'12:05:00',1);
/*!40000 ALTER TABLE `route_parts` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`rahid`@`localhost`*/ /*!50003 TRIGGER ins_route_parts BEFORE INSERT ON route_parts FOR EACH ROW
BEGIN
DECLARE wrongs INT(11);
SELECT COUNT(*) INTO wrongs FROM route_parts INNER JOIN departures ON route_parts.departure = departures.id WHERE NEW.departure = route_parts.departure AND ((NEW.stop_order < route_parts.stop_order AND NEW.hour > route_parts.hour) OR (NEW.stop_order > route_parts.stop_order AND NEW.hour < route_parts.hour) OR (route_parts.hour < departures.departure_hour OR route_parts.hour > departures.arrival_hour));
IF(wrongs > 0) THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Vehicles cannot go back in time"; END IF; END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
INSERT INTO `stops` VALUES (1,'Bieżanowska',NULL,NULL,1),(2,'Czerwone Maki',NULL,NULL,1),(3,'Nowy Bieżanów',NULL,NULL,1),(4,'Krowodrza Górka',NULL,NULL,1),(5,'Bronowice',NULL,NULL,1),(6,'Borek Fałęcki',NULL,NULL,1),(7,'Kurdwanów',NULL,NULL,1),(8,'Teatr Bagatela',NULL,NULL,1),(9,'Filharmonia',NULL,NULL,1),(10,'Nowy Kleparz',NULL,NULL,1),(11,'Norymberska',NULL,NULL,1),(12,'Azory',NULL,NULL,1),(13,'Uniwersytet Rolniczy',NULL,NULL,1),(14,'Salwator',NULL,NULL,1),(17,'Filharmonia',NULL,NULL,1),(18,'Cichy Kącik',NULL,NULL,1),(19,'Dworzec Towarowy',NULL,NULL,1),(20,'Rondo Matecznego',NULL,NULL,1),(21,'Lipińskiego',NULL,NULL,1),(22,'Korona',NULL,NULL,1),(23,'Dworcowa',NULL,NULL,1),(24,'Dworzec Główny',NULL,NULL,1),(25,'Miasteczko Studenckie AGH',NULL,NULL,1);
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
  UNIQUE KEY `login` (`login`),
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
  CONSTRAINT `vehicle_breakdown_ibfk_2` FOREIGN KEY (`vehicle`) REFERENCES `vehicles` (`id`)
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
  `score` int(11) DEFAULT NULL,
  `description` varchar(255) COLLATE latin2_bin DEFAULT NULL,
  `road_suitable` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin2 COLLATE=latin2_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_condition`
--

LOCK TABLES `vehicle_condition` WRITE;
/*!40000 ALTER TABLE `vehicle_condition` DISABLE KEYS */;
INSERT INTO `vehicle_condition` VALUES (1,6,'Stan idealny',1),(2,5,'Stan bardzo dobry',1),(3,4,'Stan dobry',1),(4,3,'Stan dostateczny',1),(5,2,'Stan niedopuszczalny',0),(6,1,'Złom',0);
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

--
-- Table structure for table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `variant` int(11) DEFAULT NULL,
  `registration_number` varchar(255) COLLATE latin2_bin DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `cond` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `registration_number` (`registration_number`),
  KEY `cond` (`cond`),
  KEY `variant` (`variant`),
  CONSTRAINT `vehicles_ibfk_1` FOREIGN KEY (`cond`) REFERENCES `vehicle_condition` (`id`),
  CONSTRAINT `vehicles_ibfk_2` FOREIGN KEY (`variant`) REFERENCES `vehicle_variant` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin2 COLLATE=latin2_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicles`
--

LOCK TABLES `vehicles` WRITE;
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` VALUES (1,1,'ABC-001',50000,1),(2,1,'ABC-002',20000,3),(3,2,'ABC-003',80000,1),(4,2,'ABC-004',500,5);
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'transport'
--
/*!50003 DROP FUNCTION IF EXISTS `averageTimeDistance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`rahid`@`localhost` FUNCTION `averageTimeDistance`(line_id int) RETURNS decimal(10,0)
    DETERMINISTIC
BEGIN DECLARE avg decimal; SELECT AVG(UNIX_TIMESTAMP(departures.arrival_hour)- UNIX_TIMESTAMP(departures.departure_hour))/60.0 FROM `lines` INNER JOIN departures ON departures.line = `lines`.id WHERE `lines`.id = line_id INTO avg; RETURN avg; END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `CalcGeoDist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`rahid`@`localhost` FUNCTION `CalcGeoDist`(lat_1 decimal, lng_1 decimal, lat_2 decimal, lng_2 decimal) RETURNS decimal(10,0)
    DETERMINISTIC
BEGIN DECLARE dist decimal; RETURN ((ACOS(SIN(lat_1 * PI() / 180) * SIN(lat_2 * PI()/180) + COS(lat_1 * PI()/180) * COS(lat_2 * PI() / 180) * COS((lng_1 - lng_2) * PI() / 180)) * 180 / PI()) * 60 * 1.1515); END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getNeglectedDriversAndVehicles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`rahid`@`localhost` PROCEDURE `getNeglectedDriversAndVehicles`(OUT driver int, OUT vehicle int)
BEGIN
SELECT drivers.id FROM drivers LEFT JOIN departures ON departures.driver = drivers.id GROUP BY drivers.id ORDER BY COUNT(departures.driver) ASC LIMIT 0, 1 INTO driver ;
SELECT vehicles.id FROM vehicles LEFT JOIN departures ON departures.vehicle = vehicles.id GROUP BY vehicles.id ORDER BY COUNT(departures.vehicle) ASC LIMIT 0,1 INTO vehicle;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `HowToGetThere` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`rahid`@`localhost` PROCEDURE `HowToGetThere`(OUT departure_id int, OUT arrival_time time, IN first_stop_id int, IN target_stop_id int)
BEGIN SELECT final_route.departure, final_route.hour FROM lines_stops as first_stop INNER JOIN lines_stops as target_stop ON (first_stop.line_id = target_stop.line_id AND first_stop.order_no < target_stop.order_no) 
    LEFT JOIN departures ON departures.line = first_stop.line_id
    INNER JOIN route_parts ON (route_parts.id = departures.id AND first_stop.order_no = route_parts.stop_order)
    INNER JOIN route_parts AS final_route ON (route_parts.departure = final_route.departure AND target_stop.order_no = final_route.stop_order)
    WHERE first_stop.stop_id = first_stop_id AND target_stop.stop_id = target_stop_id
    ORDER BY route_parts.hour ASC
    LIMIT 0, 1 INTO departure_id, arrival_time; END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `drivers_possible_vehicles`
--

/*!50001 DROP VIEW IF EXISTS `drivers_possible_vehicles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`rahid`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `drivers_possible_vehicles` AS select `drivers`.`id` AS `id`,`drivers`.`name` AS `name`,`vehicles`.`id` AS `vehicle_id`,`vehicles`.`registration_number` AS `registration_number`,`vehicle_condition`.`description` AS `description` from ((((`drivers` left join `driver_permissions` on((`drivers`.`id` = `driver_permissions`.`driver`))) join `permissions` on((`driver_permissions`.`permission` = `permissions`.`id`))) join `vehicles` on((`vehicles`.`variant` = `permissions`.`vehicle_variant`))) left join `vehicle_condition` on((`vehicles`.`cond` = `vehicle_condition`.`id`))) where (`vehicle_condition`.`road_suitable` = 1) order by `drivers`.`id`,`vehicles`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `lines_routes`
--

/*!50001 DROP VIEW IF EXISTS `lines_routes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`rahid`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `lines_routes` AS select `transport`.`lines`.`id` AS `id`,`transport`.`lines`.`number` AS `number`,`transport`.`lines`.`first_stop` AS `first_stop`,`transport`.`lines`.`last_stop` AS `last_stop`,group_concat(`transport`.`stops`.`name` separator ', ') AS `GROUP_CONCAT(stops.name SEPARATOR ', ')` from ((`transport`.`lines` left join (select `transport`.`lines_stops`.`line_id` AS `line_id`,`transport`.`lines_stops`.`stop_id` AS `stop_id`,`transport`.`lines_stops`.`order_no` AS `order_no` from `transport`.`lines_stops` order by `transport`.`lines_stops`.`order_no`) `ls` on((`ls`.`line_id` = `transport`.`lines`.`id`))) left join `transport`.`stops` on((`ls`.`stop_id` = `transport`.`stops`.`id`))) group by `transport`.`lines`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-16  1:53:30
