-- MySQL dump 10.16  Distrib 10.1.48-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: PartKeepr
-- ------------------------------------------------------
-- Server version	10.1.48-MariaDB-0+deb9u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `BatchJob`
--

DROP TABLE IF EXISTS `BatchJob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BatchJob` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `baseEntity` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_AF3CBF045E237E06` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BatchJob`
--

LOCK TABLES `BatchJob` WRITE;
/*!40000 ALTER TABLE `BatchJob` DISABLE KEYS */;
/*!40000 ALTER TABLE `BatchJob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BatchJobQueryField`
--

DROP TABLE IF EXISTS `BatchJobQueryField`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BatchJobQueryField` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `property` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `operator` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `dynamic` tinyint(1) NOT NULL,
  `batchJob_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6118E78CABE62C64` (`batchJob_id`),
  CONSTRAINT `FK_6118E78CABE62C64` FOREIGN KEY (`batchJob_id`) REFERENCES `BatchJob` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BatchJobQueryField`
--

LOCK TABLES `BatchJobQueryField` WRITE;
/*!40000 ALTER TABLE `BatchJobQueryField` DISABLE KEYS */;
/*!40000 ALTER TABLE `BatchJobQueryField` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BatchJobUpdateField`
--

DROP TABLE IF EXISTS `BatchJobUpdateField`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BatchJobUpdateField` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `property` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `dynamic` tinyint(1) NOT NULL,
  `batchJob_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E1ADA7DFABE62C64` (`batchJob_id`),
  CONSTRAINT `FK_E1ADA7DFABE62C64` FOREIGN KEY (`batchJob_id`) REFERENCES `BatchJob` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BatchJobUpdateField`
--

LOCK TABLES `BatchJobUpdateField` WRITE;
/*!40000 ALTER TABLE `BatchJobUpdateField` DISABLE KEYS */;
/*!40000 ALTER TABLE `BatchJobUpdateField` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CachedImage`
--

DROP TABLE IF EXISTS `CachedImage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CachedImage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `originalId` int(11) NOT NULL,
  `originalType` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cacheFile` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CachedImage`
--

LOCK TABLES `CachedImage` WRITE;
/*!40000 ALTER TABLE `CachedImage` DISABLE KEYS */;
/*!40000 ALTER TABLE `CachedImage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CronLogger`
--

DROP TABLE IF EXISTS `CronLogger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CronLogger` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lastRunDate` datetime NOT NULL,
  `cronjob` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cronjob` (`cronjob`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CronLogger`
--

LOCK TABLES `CronLogger` WRITE;
/*!40000 ALTER TABLE `CronLogger` DISABLE KEYS */;
INSERT INTO `CronLogger` VALUES (3,'2021-02-16 06:00:04','partkeepr:cron:synctips'),(4,'2021-02-16 06:00:04','partkeepr:cron:create-statistic-snapshot');
/*!40000 ALTER TABLE `CronLogger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Distributor`
--

DROP TABLE IF EXISTS `Distributor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Distributor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext COLLATE utf8_unicode_ci,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` longtext COLLATE utf8_unicode_ci,
  `skuurl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabledForReports` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_2559D8A65E237E06` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Distributor`
--

LOCK TABLES `Distributor` WRITE;
/*!40000 ALTER TABLE `Distributor` DISABLE KEYS */;
INSERT INTO `Distributor` VALUES (1,'LCSC','','https://lcsc.com/','','','','','',1);
/*!40000 ALTER TABLE `Distributor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FOSUser`
--

DROP TABLE IF EXISTS `FOSUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FOSUser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `credentials_expired` tinyint(1) NOT NULL,
  `credentials_expire_at` datetime DEFAULT NULL,
  `email_canonical` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_37EF34F492FC23A8` (`username_canonical`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FOSUser`
--

LOCK TABLES `FOSUser` WRITE;
/*!40000 ALTER TABLE `FOSUser` DISABLE KEYS */;
INSERT INTO `FOSUser` VALUES (1,'admin','admin',1,'m59jxmri6vkc8scgk8004088k084gww','5Yney+2HCslHc+spwTdGnVG3+7b2F9X+Cj3zcCzk5csSxWbATKNKNPKwcRr5n6mtxZYt1JP5uHIe9baVflFI3A==',NULL,0,0,NULL,NULL,NULL,'a:1:{i:0;s:16:\"ROLE_SUPER_ADMIN\";}',0,NULL,'',''),(2,'alim','alim',1,'etgsgzvoqxw0c88ssc0s4gwcsk04oks','+kB0PrbZifuQ5VPTdHdsRX1jVx83xqeIPlK+Zl0tVZoNl6f7SpsHcyzwad5wevv9Jif13uLcYf1xy8EZFf5OHQ==',NULL,0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'muhamadalim424@gmail.com','muhamadalim424@gmail.com'),(3,'yusron','yusron',1,'1e2xf1zw9nok040084gg8scsc4soss0','Iwakj9/njl/5YWfvQVYd3Ukxr3VEnJMH42mFhMPV+jGYuST5x3vNzZcKLEJ23vjnue1i0tHJd8eMm6sl6eETkw==',NULL,0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'','');
/*!40000 ALTER TABLE `FOSUser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Footprint`
--

DROP TABLE IF EXISTS `Footprint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Footprint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_7CF324945E237E06` (`name`),
  KEY `IDX_7CF3249412469DE2` (`category_id`),
  CONSTRAINT `FK_7CF3249412469DE2` FOREIGN KEY (`category_id`) REFERENCES `FootprintCategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Footprint`
--

LOCK TABLES `Footprint` WRITE;
/*!40000 ALTER TABLE `Footprint` DISABLE KEYS */;
INSERT INTO `Footprint` VALUES (1,3,'CBGA-32','32-Lead Ceramic Ball Grid Array'),(2,5,'FCBGA-576','576-Ball Ball Grid Array, Thermally Enhanced'),(3,7,'PBGA-119','119-Ball Plastic Ball Grid Array'),(4,9,'PBGA-169','169-Ball Plastic Ball Grid Array'),(5,11,'PBGA-225','225-Ball Plastic a Ball Grid Array'),(6,13,'PBGA-260','260-Ball Plastic Ball Grid Array'),(7,15,'PBGA-297','297-Ball Plastic Ball Grid Array'),(8,17,'PBGA-304','304-Lead Plastic Ball Grid Array'),(9,19,'PBGA-316','316-Lead Plastic Ball Grid Array'),(10,21,'PBGA-324','324-Ball Plastic Ball Grid Array'),(11,23,'PBGA-385','385-Lead Ball Grid Array'),(12,25,'PBGA-400','400-Ball Plastic Ball Grid Array'),(13,27,'PBGA-484','484-Ball Plastic Ball Grid Array'),(14,29,'PBGA-625','625-Ball Plastic Ball Grid Array'),(15,31,'PBGA-676','676-Ball Plastic Ball Grid Array'),(16,33,'SBGA-256','256-Ball Ball Grid Array, Thermally Enhanced'),(17,35,'SBGA-304','304-Ball Ball Grid Array, Thermally Enhanced'),(18,37,'SBGA-432','432-Ball Ball Grid Array, Thermally Enhanced'),(19,39,'CerDIP-8','8-Lead Ceramic Dual In-Line Package'),(20,41,'CerDIP-14','14-Lead Ceramic Dual In-Line Package'),(21,43,'CerDIP-16','16-Lead Ceramic Dual In-Line Package'),(22,45,'CerDIP-18','18-Lead Ceramic Dual In-Line Package'),(23,47,'CerDIP-20','20-Lead Ceramic Dual In-Line Package'),(24,49,'CerDIP-24 Narrow','24-Lead Ceramic Dual In-Line Package - Narrow Body'),(25,51,'CerDIP-24 Wide','24-Lead Ceramic Dual In-Line Package - Wide Body'),(26,53,'CerDIP-28','28-Lead Ceramic Dual In-Line Package'),(27,55,'CerDIP-40','40-Lead Ceramic Dual In-Line Package'),(28,57,'PDIP-8','8-Lead Plastic Dual In-Line Package'),(29,59,'PDIP-14','14-Lead Plastic Dual In-Line Package'),(30,61,'PDIP-16','16-Lead Plastic Dual In-Line Package'),(31,63,'PDIP-18','18-Lead Plastic Dual In-Line Package'),(32,65,'PDIP-20','20-Lead Plastic Dual In-Line Package'),(33,67,'PDIP-24','24-Lead Plastic Dual In-Line Package'),(34,69,'PDIP-28 Narrow','28-Lead Plastic Dual In-Line Package, Narrow Body'),(35,71,'PDIP-28 Wide','28-Lead Plastic Dual In-Line Package, Wide Body'),(36,NULL,'SOIC-N-EP-8','8-Lead Standard Small Outline Package, with Expose Pad'),(37,72,'1206',''),(38,1,'0805',''),(40,72,'0603',''),(42,1,'0402',''),(43,1,'2010',''),(44,1,'1210',''),(45,1,'3528','');
/*!40000 ALTER TABLE `Footprint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FootprintAttachment`
--

DROP TABLE IF EXISTS `FootprintAttachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FootprintAttachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `footprint_id` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `originalname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mimetype` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `extension` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7B7388A151364C98` (`footprint_id`),
  CONSTRAINT `FK_7B7388A151364C98` FOREIGN KEY (`footprint_id`) REFERENCES `Footprint` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FootprintAttachment`
--

LOCK TABLES `FootprintAttachment` WRITE;
/*!40000 ALTER TABLE `FootprintAttachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `FootprintAttachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FootprintCategory`
--

DROP TABLE IF EXISTS `FootprintCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FootprintCategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `lft` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `lvl` int(11) NOT NULL,
  `root` int(11) DEFAULT NULL,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `categoryPath` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_C026BA6A727ACA70` (`parent_id`),
  KEY `IDX_C026BA6ADA439252` (`lft`),
  KEY `IDX_C026BA6AD5E02D69` (`rgt`),
  CONSTRAINT `FK_C026BA6A727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `FootprintCategory` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FootprintCategory`
--

LOCK TABLES `FootprintCategory` WRITE;
/*!40000 ALTER TABLE `FootprintCategory` DISABLE KEYS */;
INSERT INTO `FootprintCategory` VALUES (1,NULL,1,144,0,1,'Root Category',NULL,'Root Category'),(2,1,2,5,1,1,'BGA',NULL,'Root Category ➤ BGA'),(3,2,3,4,2,1,'CBGA',NULL,'Root Category ➤ BGA ➤ CBGA'),(4,1,6,9,1,1,'BGA',NULL,'Root Category ➤ BGA'),(5,4,7,8,2,1,'FCBGA',NULL,'Root Category ➤ BGA ➤ FCBGA'),(6,1,10,13,1,1,'BGA',NULL,'Root Category ➤ BGA'),(7,6,11,12,2,1,'PBGA',NULL,'Root Category ➤ BGA ➤ PBGA'),(8,1,14,17,1,1,'BGA',NULL,'Root Category ➤ BGA'),(9,8,15,16,2,1,'PBGA',NULL,'Root Category ➤ BGA ➤ PBGA'),(10,1,18,21,1,1,'BGA',NULL,'Root Category ➤ BGA'),(11,10,19,20,2,1,'PBGA',NULL,'Root Category ➤ BGA ➤ PBGA'),(12,1,22,25,1,1,'BGA',NULL,'Root Category ➤ BGA'),(13,12,23,24,2,1,'PBGA',NULL,'Root Category ➤ BGA ➤ PBGA'),(14,1,26,29,1,1,'BGA',NULL,'Root Category ➤ BGA'),(15,14,27,28,2,1,'PBGA',NULL,'Root Category ➤ BGA ➤ PBGA'),(16,1,30,33,1,1,'BGA',NULL,'Root Category ➤ BGA'),(17,16,31,32,2,1,'PBGA',NULL,'Root Category ➤ BGA ➤ PBGA'),(18,1,34,37,1,1,'BGA',NULL,'Root Category ➤ BGA'),(19,18,35,36,2,1,'PBGA',NULL,'Root Category ➤ BGA ➤ PBGA'),(20,1,38,41,1,1,'BGA',NULL,'Root Category ➤ BGA'),(21,20,39,40,2,1,'PBGA',NULL,'Root Category ➤ BGA ➤ PBGA'),(22,1,42,45,1,1,'BGA',NULL,'Root Category ➤ BGA'),(23,22,43,44,2,1,'PBGA',NULL,'Root Category ➤ BGA ➤ PBGA'),(24,1,46,49,1,1,'BGA',NULL,'Root Category ➤ BGA'),(25,24,47,48,2,1,'PBGA',NULL,'Root Category ➤ BGA ➤ PBGA'),(26,1,50,53,1,1,'BGA',NULL,'Root Category ➤ BGA'),(27,26,51,52,2,1,'PBGA',NULL,'Root Category ➤ BGA ➤ PBGA'),(28,1,54,57,1,1,'BGA',NULL,'Root Category ➤ BGA'),(29,28,55,56,2,1,'PBGA',NULL,'Root Category ➤ BGA ➤ PBGA'),(30,1,58,61,1,1,'BGA',NULL,'Root Category ➤ BGA'),(31,30,59,60,2,1,'PBGA',NULL,'Root Category ➤ BGA ➤ PBGA'),(32,1,62,65,1,1,'BGA',NULL,'Root Category ➤ BGA'),(33,32,63,64,2,1,'PBGA',NULL,'Root Category ➤ BGA ➤ PBGA'),(34,1,66,69,1,1,'BGA',NULL,'Root Category ➤ BGA'),(35,34,67,68,2,1,'PBGA',NULL,'Root Category ➤ BGA ➤ PBGA'),(36,1,70,73,1,1,'BGA',NULL,'Root Category ➤ BGA'),(37,36,71,72,2,1,'PBGA',NULL,'Root Category ➤ BGA ➤ PBGA'),(38,1,74,77,1,1,'DIP',NULL,'Root Category ➤ DIP'),(39,38,75,76,2,1,'CERDIP',NULL,'Root Category ➤ DIP ➤ CERDIP'),(40,1,78,81,1,1,'DIP',NULL,'Root Category ➤ DIP'),(41,40,79,80,2,1,'CERDIP',NULL,'Root Category ➤ DIP ➤ CERDIP'),(42,1,82,85,1,1,'DIP',NULL,'Root Category ➤ DIP'),(43,42,83,84,2,1,'CERDIP',NULL,'Root Category ➤ DIP ➤ CERDIP'),(44,1,86,89,1,1,'DIP',NULL,'Root Category ➤ DIP'),(45,44,87,88,2,1,'CERDIP',NULL,'Root Category ➤ DIP ➤ CERDIP'),(46,1,90,93,1,1,'DIP',NULL,'Root Category ➤ DIP'),(47,46,91,92,2,1,'CERDIP',NULL,'Root Category ➤ DIP ➤ CERDIP'),(48,1,94,97,1,1,'DIP',NULL,'Root Category ➤ DIP'),(49,48,95,96,2,1,'CERDIP',NULL,'Root Category ➤ DIP ➤ CERDIP'),(50,1,98,101,1,1,'DIP',NULL,'Root Category ➤ DIP'),(51,50,99,100,2,1,'CERDIP',NULL,'Root Category ➤ DIP ➤ CERDIP'),(52,1,102,105,1,1,'DIP',NULL,'Root Category ➤ DIP'),(53,52,103,104,2,1,'CERDIP',NULL,'Root Category ➤ DIP ➤ CERDIP'),(54,1,106,109,1,1,'DIP',NULL,'Root Category ➤ DIP'),(55,54,107,108,2,1,'CERDIP',NULL,'Root Category ➤ DIP ➤ CERDIP'),(56,1,110,113,1,1,'DIP',NULL,'Root Category ➤ DIP'),(57,56,111,112,2,1,'PDIP',NULL,'Root Category ➤ DIP ➤ PDIP'),(58,1,114,117,1,1,'DIP',NULL,'Root Category ➤ DIP'),(59,58,115,116,2,1,'PDIP',NULL,'Root Category ➤ DIP ➤ PDIP'),(60,1,118,121,1,1,'DIP',NULL,'Root Category ➤ DIP'),(61,60,119,120,2,1,'PDIP',NULL,'Root Category ➤ DIP ➤ PDIP'),(62,1,122,125,1,1,'DIP',NULL,'Root Category ➤ DIP'),(63,62,123,124,2,1,'PDIP',NULL,'Root Category ➤ DIP ➤ PDIP'),(64,1,126,129,1,1,'DIP',NULL,'Root Category ➤ DIP'),(65,64,127,128,2,1,'PDIP',NULL,'Root Category ➤ DIP ➤ PDIP'),(66,1,130,133,1,1,'DIP',NULL,'Root Category ➤ DIP'),(67,66,131,132,2,1,'PDIP',NULL,'Root Category ➤ DIP ➤ PDIP'),(68,1,134,137,1,1,'DIP',NULL,'Root Category ➤ DIP'),(69,68,135,136,2,1,'PDIP',NULL,'Root Category ➤ DIP ➤ PDIP'),(70,1,138,141,1,1,'DIP',NULL,'Root Category ➤ DIP'),(71,70,139,140,2,1,'PDIP',NULL,'Root Category ➤ DIP ➤ PDIP'),(72,1,142,143,1,1,'CAP','','Root Category ➤ CAP');
/*!40000 ALTER TABLE `FootprintCategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FootprintImage`
--

DROP TABLE IF EXISTS `FootprintImage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FootprintImage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `footprint_id` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `originalname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mimetype` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `extension` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_3B22699151364C98` (`footprint_id`),
  CONSTRAINT `FK_3B22699151364C98` FOREIGN KEY (`footprint_id`) REFERENCES `Footprint` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FootprintImage`
--

LOCK TABLES `FootprintImage` WRITE;
/*!40000 ALTER TABLE `FootprintImage` DISABLE KEYS */;
INSERT INTO `FootprintImage` VALUES (1,1,'footprint','41ee3ab6-66d6-11eb-9528-42010ab80009','CBGA-32.png','image/png',23365,'png',NULL,'2021-02-04 10:46:38'),(2,2,'footprint','41efc8ae-66d6-11eb-b8b0-42010ab80009','FCBGA-576.png','image/png',47861,'png',NULL,'2021-02-04 10:46:38'),(3,3,'footprint','41f03d98-66d6-11eb-9735-42010ab80009','PBGA-119.png','image/png',32537,'png',NULL,'2021-02-04 10:46:38'),(4,4,'footprint','41f07db2-66d6-11eb-b718-42010ab80009','PBGA-169.png','image/png',36699,'png',NULL,'2021-02-04 10:46:38'),(5,5,'footprint','41f0b5fc-66d6-11eb-b7ca-42010ab80009','PBGA-225.png','image/png',39366,'png',NULL,'2021-02-04 10:46:38'),(6,6,'footprint','41f0e630-66d6-11eb-ae3c-42010ab80009','PBGA-260.png','image/png',61202,'png',NULL,'2021-02-04 10:46:38'),(7,7,'footprint','41f13270-66d6-11eb-b4b4-42010ab80009','PBGA-297.png','image/png',68013,'png',NULL,'2021-02-04 10:46:38'),(8,8,'footprint','41f16ba0-66d6-11eb-a2d1-42010ab80009','PBGA-304.png','image/png',55833,'png',NULL,'2021-02-04 10:46:38'),(9,9,'footprint','41f19f94-66d6-11eb-a20a-42010ab80009','PBGA-316.png','image/png',55996,'png',NULL,'2021-02-04 10:46:38'),(10,10,'footprint','41f1d0ae-66d6-11eb-9f48-42010ab80009','PBGA-324.png','image/png',44882,'png',NULL,'2021-02-04 10:46:38'),(11,11,'footprint','41f1fd4a-66d6-11eb-a7ad-42010ab80009','PBGA-385.png','image/png',35146,'png',NULL,'2021-02-04 10:46:38'),(12,12,'footprint','41f229e6-66d6-11eb-b3d7-42010ab80009','PBGA-400.png','image/png',67933,'png',NULL,'2021-02-04 10:46:38'),(13,13,'footprint','41f25934-66d6-11eb-80b6-42010ab80009','PBGA-484.png','image/png',49851,'png',NULL,'2021-02-04 10:46:38'),(14,14,'footprint','41f286de-66d6-11eb-9f19-42010ab80009','PBGA-625.png','image/png',65307,'png',NULL,'2021-02-04 10:46:38'),(15,15,'footprint','41f2bb9a-66d6-11eb-bf1d-42010ab80009','PBGA-676.png','image/png',54708,'png',NULL,'2021-02-04 10:46:38'),(16,16,'footprint','41f2e87c-66d6-11eb-97bb-42010ab80009','SBGA-256.png','image/png',48636,'png',NULL,'2021-02-04 10:46:38'),(17,17,'footprint','41f312ac-66d6-11eb-9a68-42010ab80009','SBGA-304.png','image/png',51944,'png',NULL,'2021-02-04 10:46:38'),(18,18,'footprint','41f342cc-66d6-11eb-a529-42010ab80009','SBGA-432.png','image/png',63247,'png',NULL,'2021-02-04 10:46:38'),(19,19,'footprint','41f3733c-66d6-11eb-819a-42010ab80009','CERDIP-8.png','image/png',13544,'png',NULL,'2021-02-04 10:46:38'),(20,20,'footprint','41f3a244-66d6-11eb-926f-42010ab80009','CERDIP-14.png','image/png',14226,'png',NULL,'2021-02-04 10:46:38'),(21,21,'footprint','41f3d9a8-66d6-11eb-887f-42010ab80009','CERDIP-16.png','image/png',14576,'png',NULL,'2021-02-04 10:46:38'),(22,22,'footprint','41f4052c-66d6-11eb-a5a5-42010ab80009','CERDIP-18.png','image/png',9831,'png',NULL,'2021-02-04 10:46:38'),(23,23,'footprint','41f42eda-66d6-11eb-b423-42010ab80009','CERDIP-20.png','image/png',10209,'png',NULL,'2021-02-04 10:46:38'),(24,24,'footprint','41f455b8-66d6-11eb-bbf7-42010ab80009','CERDIP-24-N.png','image/png',11582,'png',NULL,'2021-02-04 10:46:38'),(25,25,'footprint','41f47dae-66d6-11eb-b346-42010ab80009','CERDIP-24-W.png','image/png',12407,'png',NULL,'2021-02-04 10:46:38'),(26,26,'footprint','41f4a568-66d6-11eb-ac93-42010ab80009','CERDIP-28.png','image/png',12233,'png',NULL,'2021-02-04 10:46:38'),(27,27,'footprint','41f4cb24-66d6-11eb-928c-42010ab80009','CERDIP-40.png','image/png',12421,'png',NULL,'2021-02-04 10:46:38'),(28,28,'footprint','41f4f342-66d6-11eb-a18a-42010ab80009','PDIP-8.png','image/png',13537,'png',NULL,'2021-02-04 10:46:38'),(29,29,'footprint','41f51aac-66d6-11eb-8f32-42010ab80009','PDIP-14.png','image/png',13779,'png',NULL,'2021-02-04 10:46:38'),(30,30,'footprint','41f54568-66d6-11eb-8e52-42010ab80009','PDIP-16.png','image/png',18305,'png',NULL,'2021-02-04 10:46:38'),(31,31,'footprint','41f57092-66d6-11eb-9d8d-42010ab80009','PDIP-18.png','image/png',14893,'png',NULL,'2021-02-04 10:46:38'),(32,32,'footprint','41f597b6-66d6-11eb-a4b1-42010ab80009','PDIP-20.png','image/png',14429,'png',NULL,'2021-02-04 10:46:38'),(33,33,'footprint','41f5beda-66d6-11eb-9a70-42010ab80009','PDIP-24.png','image/png',14647,'png',NULL,'2021-02-04 10:46:38'),(34,34,'footprint','41f5e63a-66d6-11eb-b54a-42010ab80009','PDIP-28-N.png','image/png',18703,'png',NULL,'2021-02-04 10:46:38'),(35,35,'footprint','41f60f66-66d6-11eb-9b80-42010ab80009','PDIP-28-W.png','image/png',15728,'png',NULL,'2021-02-04 10:46:38');
/*!40000 ALTER TABLE `FootprintImage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GridPreset`
--

DROP TABLE IF EXISTS `GridPreset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GridPreset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `configuration` longtext COLLATE utf8_unicode_ci NOT NULL,
  `gridDefault` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_grid_unique` (`grid`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GridPreset`
--

LOCK TABLES `GridPreset` WRITE;
/*!40000 ALTER TABLE `GridPreset` DISABLE KEYS */;
/*!40000 ALTER TABLE `GridPreset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ImportPreset`
--

DROP TABLE IF EXISTS `ImportPreset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ImportPreset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `baseEntity` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `configuration` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_entity_unique` (`baseEntity`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ImportPreset`
--

LOCK TABLES `ImportPreset` WRITE;
/*!40000 ALTER TABLE `ImportPreset` DISABLE KEYS */;
/*!40000 ALTER TABLE `ImportPreset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Manufacturer`
--

DROP TABLE IF EXISTS `Manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Manufacturer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext COLLATE utf8_unicode_ci,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` longtext COLLATE utf8_unicode_ci,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_253B3D245E237E06` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=286 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Manufacturer`
--

LOCK TABLES `Manufacturer` WRITE;
/*!40000 ALTER TABLE `Manufacturer` DISABLE KEYS */;
INSERT INTO `Manufacturer` VALUES (1,'Integrated Circuit Designs',NULL,NULL,NULL,NULL,NULL,NULL),(2,'ACTEL',NULL,NULL,NULL,NULL,NULL,NULL),(3,'ALTINC',NULL,NULL,NULL,NULL,NULL,NULL),(4,'Aeroflex',NULL,NULL,NULL,NULL,NULL,NULL),(5,'Agilent Technologies',NULL,NULL,NULL,NULL,NULL,NULL),(6,'AKM Semiconductor',NULL,NULL,NULL,NULL,NULL,NULL),(7,'Alesis Semiconductor',NULL,NULL,NULL,NULL,NULL,NULL),(8,'ALi (Acer Laboratories Inc.)',NULL,NULL,NULL,NULL,NULL,NULL),(9,'Allayer Communications',NULL,NULL,NULL,NULL,NULL,NULL),(10,'Allegro Microsystems',NULL,NULL,NULL,NULL,NULL,NULL),(11,'Alliance Semiconductor',NULL,NULL,NULL,NULL,NULL,NULL),(12,'Alpha Industries',NULL,NULL,NULL,NULL,NULL,NULL),(13,'Alpha Microelectronics',NULL,NULL,NULL,NULL,NULL,NULL),(14,'Altera',NULL,NULL,NULL,NULL,NULL,NULL),(15,'Advanced Micro Devices (AMD)',NULL,NULL,NULL,NULL,NULL,NULL),(16,'American Microsystems, Inc. (AMI)',NULL,NULL,NULL,NULL,NULL,NULL),(17,'Amic Technology',NULL,NULL,NULL,NULL,NULL,NULL),(18,'Amphus',NULL,NULL,NULL,NULL,NULL,NULL),(19,'Anachip Corp.',NULL,NULL,NULL,NULL,NULL,NULL),(20,'ANADIGICs',NULL,NULL,NULL,NULL,NULL,NULL),(21,'Analog Devices',NULL,NULL,NULL,NULL,NULL,NULL),(22,'Analog Systems',NULL,NULL,NULL,NULL,NULL,NULL),(23,'Anchor Chips',NULL,NULL,NULL,NULL,NULL,NULL),(24,'Apex Microtechnology',NULL,NULL,NULL,NULL,NULL,NULL),(25,'ARK Logic',NULL,NULL,NULL,NULL,NULL,NULL),(26,'ASD',NULL,NULL,NULL,NULL,NULL,NULL),(27,'Astec Semiconductor',NULL,NULL,NULL,NULL,NULL,NULL),(28,'ATC (Analog Technologie)',NULL,NULL,NULL,NULL,NULL,NULL),(29,'ATecoM',NULL,NULL,NULL,NULL,NULL,NULL),(30,'ATI Technologies',NULL,NULL,NULL,NULL,NULL,NULL),(31,'Atmel',NULL,NULL,NULL,NULL,NULL,NULL),(32,'AT&T',NULL,NULL,NULL,NULL,NULL,NULL),(33,'AudioCodes',NULL,NULL,NULL,NULL,NULL,NULL),(34,'Aura Vision',NULL,NULL,NULL,NULL,NULL,NULL),(35,'Aureal',NULL,NULL,NULL,NULL,NULL,NULL),(36,'Austin Semiconductor',NULL,NULL,NULL,NULL,NULL,NULL),(37,'Avance Logic',NULL,NULL,NULL,NULL,NULL,NULL),(38,'Bel Fuse',NULL,NULL,NULL,NULL,NULL,NULL),(39,'Benchmarq Microelectronics',NULL,NULL,NULL,NULL,NULL,NULL),(40,'BI Technologies',NULL,NULL,NULL,NULL,NULL,NULL),(41,'Bowmar/White',NULL,NULL,NULL,NULL,NULL,NULL),(42,'Brightflash',NULL,NULL,NULL,NULL,NULL,NULL),(43,'Broadcom',NULL,NULL,NULL,NULL,NULL,NULL),(44,'Brooktree(now Rockwell)',NULL,NULL,NULL,NULL,NULL,NULL),(45,'Burr Brown',NULL,NULL,NULL,NULL,NULL,NULL),(46,'California Micro Devices',NULL,NULL,NULL,NULL,NULL,NULL),(47,'Calogic',NULL,NULL,NULL,NULL,NULL,NULL),(48,'Catalyst Semiconductor',NULL,NULL,NULL,NULL,NULL,NULL),(49,'Centon Electronics',NULL,NULL,NULL,NULL,NULL,NULL),(50,'Ceramate Technical',NULL,NULL,NULL,NULL,NULL,NULL),(51,'Cherry Semiconductor',NULL,NULL,NULL,NULL,NULL,NULL),(52,'Chipcon AS',NULL,NULL,NULL,NULL,NULL,NULL),(53,'Chips',NULL,NULL,NULL,NULL,NULL,NULL),(54,'Chrontel',NULL,NULL,NULL,NULL,NULL,NULL),(55,'Cirrus Logic',NULL,NULL,NULL,NULL,NULL,NULL),(56,'ComCore Semiconductor',NULL,NULL,NULL,NULL,NULL,NULL),(57,'Conexant',NULL,NULL,NULL,NULL,NULL,NULL),(58,'Cosmo Electronics',NULL,NULL,NULL,NULL,NULL,NULL),(59,'Chrystal',NULL,NULL,NULL,NULL,NULL,NULL),(60,'Cygnal',NULL,NULL,NULL,NULL,NULL,NULL),(61,'Cypress Semiconductor',NULL,NULL,NULL,NULL,NULL,NULL),(62,'Cyrix Corporation',NULL,NULL,NULL,NULL,NULL,NULL),(63,'Daewoo Electronics Semiconductor',NULL,NULL,NULL,NULL,NULL,NULL),(64,'Dallas Semiconductor',NULL,NULL,NULL,NULL,NULL,NULL),(65,'Davicom Semiconductor',NULL,NULL,NULL,NULL,NULL,NULL),(66,'Data Delay Devices',NULL,NULL,NULL,NULL,NULL,NULL),(67,'Diamond Technologies',NULL,NULL,NULL,NULL,NULL,NULL),(68,'DIOTEC',NULL,NULL,NULL,NULL,NULL,NULL),(69,'DTC Data Technology',NULL,NULL,NULL,NULL,NULL,NULL),(70,'DVDO',NULL,NULL,NULL,NULL,NULL,NULL),(71,'EG&G',NULL,NULL,NULL,NULL,NULL,NULL),(72,'Elan Microelectronics',NULL,NULL,NULL,NULL,NULL,NULL),(73,'ELANTEC',NULL,NULL,NULL,NULL,NULL,NULL),(74,'Electronic Arrays',NULL,NULL,NULL,NULL,NULL,NULL),(75,'Elite Flash Storage Technology Inc. (EFST)',NULL,NULL,NULL,NULL,NULL,NULL),(76,'EM Microelectronik - Marin',NULL,NULL,NULL,NULL,NULL,NULL),(77,'Enhanced Memory Systems',NULL,NULL,NULL,NULL,NULL,NULL),(78,'Ensoniq Corp',NULL,NULL,NULL,NULL,NULL,NULL),(79,'EON Silicon Devices',NULL,NULL,NULL,NULL,NULL,NULL),(80,'Epson',NULL,NULL,NULL,NULL,NULL,NULL),(81,'Ericsson',NULL,NULL,NULL,NULL,NULL,NULL),(82,'ESS Technology',NULL,NULL,NULL,NULL,NULL,NULL),(83,'Electronic Technology',NULL,NULL,NULL,NULL,NULL,NULL),(84,'EXAR',NULL,NULL,NULL,NULL,NULL,NULL),(85,'Excel Semiconductor Inc.',NULL,NULL,NULL,NULL,NULL,NULL),(86,'Fairschild',NULL,NULL,NULL,NULL,NULL,NULL),(87,'Freescale Semiconductor',NULL,NULL,NULL,NULL,NULL,NULL),(88,'Fujitsu',NULL,NULL,NULL,NULL,NULL,NULL),(89,'Galileo Technology',NULL,NULL,NULL,NULL,NULL,NULL),(90,'Galvantech',NULL,NULL,NULL,NULL,NULL,NULL),(91,'GEC Plessey',NULL,NULL,NULL,NULL,NULL,NULL),(92,'Gennum',NULL,NULL,NULL,NULL,NULL,NULL),(93,'General Electric (Harris)',NULL,NULL,NULL,NULL,NULL,NULL),(94,'General Instruments',NULL,NULL,NULL,NULL,NULL,NULL),(95,'G-Link Technology',NULL,NULL,NULL,NULL,NULL,NULL),(96,'Goal Semiconductor',NULL,NULL,NULL,NULL,NULL,NULL),(97,'Goldstar',NULL,NULL,NULL,NULL,NULL,NULL),(98,'Gould',NULL,NULL,NULL,NULL,NULL,NULL),(99,'Greenwich Instruments',NULL,NULL,NULL,NULL,NULL,NULL),(100,'General Semiconductor',NULL,NULL,NULL,NULL,NULL,NULL),(101,'Harris Semiconductor',NULL,NULL,NULL,NULL,NULL,NULL),(102,'VEB',NULL,NULL,NULL,NULL,NULL,NULL),(103,'Hitachi Semiconductor',NULL,NULL,NULL,NULL,NULL,NULL),(104,'Holtek',NULL,NULL,NULL,NULL,NULL,NULL),(105,'Hewlett Packard',NULL,NULL,NULL,NULL,NULL,NULL),(106,'Hualon',NULL,NULL,NULL,NULL,NULL,NULL),(107,'Hynix Semiconductor',NULL,NULL,NULL,NULL,NULL,NULL),(108,'Hyundai',NULL,NULL,NULL,NULL,NULL,NULL),(109,'IC Design',NULL,NULL,NULL,NULL,NULL,NULL),(110,'Integrated Circuit Systems (ICS)',NULL,NULL,NULL,NULL,NULL,NULL),(111,'IC - Haus',NULL,NULL,NULL,NULL,NULL,NULL),(112,'ICSI (Integrated Circuit Solution Inc.)',NULL,NULL,NULL,NULL,NULL,NULL),(113,'I-Cube',NULL,NULL,NULL,NULL,NULL,NULL),(114,'IC Works',NULL,NULL,NULL,NULL,NULL,NULL),(115,'Integrated Device Technology (IDT)',NULL,NULL,NULL,NULL,NULL,NULL),(116,'IGS Technologies',NULL,NULL,NULL,NULL,NULL,NULL),(117,'IMPALA Linear',NULL,NULL,NULL,NULL,NULL,NULL),(118,'IMP',NULL,NULL,NULL,NULL,NULL,NULL),(119,'Infineon',NULL,NULL,NULL,NULL,NULL,NULL),(120,'INMOS',NULL,NULL,NULL,NULL,NULL,NULL),(121,'Intel',NULL,NULL,NULL,NULL,NULL,NULL),(122,'Intersil',NULL,NULL,NULL,NULL,NULL,NULL),(123,'International Rectifier',NULL,NULL,NULL,NULL,NULL,NULL),(124,'Information Storage Devices',NULL,NULL,NULL,NULL,NULL,NULL),(125,'ISSI (Integrated Silicon Solution, Inc.)',NULL,NULL,NULL,NULL,NULL,NULL),(126,'Integrated Technology Express',NULL,NULL,NULL,NULL,NULL,NULL),(127,'ITT Semiconductor (Micronas Intermetall)',NULL,NULL,NULL,NULL,NULL,NULL),(128,'IXYS',NULL,NULL,NULL,NULL,NULL,NULL),(129,'Korea Electronics (KEC)',NULL,NULL,NULL,NULL,NULL,NULL),(130,'Kota Microcircuits',NULL,NULL,NULL,NULL,NULL,NULL),(131,'Lattice Semiconductor Corp.',NULL,NULL,NULL,NULL,NULL,NULL),(132,'Lansdale Semiconductor',NULL,NULL,NULL,NULL,NULL,NULL),(133,'Level One Communications',NULL,NULL,NULL,NULL,NULL,NULL),(134,'LG Semicon (Lucky Goldstar Electronic Co.)',NULL,NULL,NULL,NULL,NULL,NULL),(135,'Linear Technology',NULL,NULL,NULL,NULL,NULL,NULL),(136,'Linfinity Microelectronics',NULL,NULL,NULL,NULL,NULL,NULL),(137,'Lite-On',NULL,NULL,NULL,NULL,NULL,NULL),(138,'Lucent Technologies (AT&T Microelectronics)',NULL,NULL,NULL,NULL,NULL,NULL),(139,'Macronix International',NULL,NULL,NULL,NULL,NULL,NULL),(140,'Marvell Semiconductor',NULL,NULL,NULL,NULL,NULL,NULL),(141,'Matsushita Panasonic',NULL,NULL,NULL,NULL,NULL,NULL),(142,'Maxim Dallas',NULL,NULL,NULL,NULL,NULL,NULL),(143,'Media Vision',NULL,NULL,NULL,NULL,NULL,NULL),(144,'Microchip (Arizona Michrochip Technology)',NULL,NULL,NULL,NULL,NULL,NULL),(145,'Matra MHS',NULL,NULL,NULL,NULL,NULL,NULL),(146,'Micrel Semiconductor',NULL,NULL,NULL,NULL,NULL,NULL),(147,'Micronas',NULL,NULL,NULL,NULL,NULL,NULL),(148,'Micronix Integrated Systems',NULL,NULL,NULL,NULL,NULL,NULL),(149,'Micron Technology, Inc.',NULL,NULL,NULL,NULL,NULL,NULL),(150,'Microsemi',NULL,NULL,NULL,NULL,NULL,NULL),(151,'Mini-Circuits',NULL,NULL,NULL,NULL,NULL,NULL),(152,'Mitel Semiconductor',NULL,NULL,NULL,NULL,NULL,NULL),(153,'Mitsubishi Semiconductor',NULL,NULL,NULL,NULL,NULL,NULL),(154,'Micro Linear',NULL,NULL,NULL,NULL,NULL,NULL),(155,'MMI (Monolithic Memories, Inc.)',NULL,NULL,NULL,NULL,NULL,NULL),(156,'Mosaic Semiconductor',NULL,NULL,NULL,NULL,NULL,NULL),(157,'Mosel Vitelic',NULL,NULL,NULL,NULL,NULL,NULL),(158,'MOS Technologies',NULL,NULL,NULL,NULL,NULL,NULL),(159,'Mostek',NULL,NULL,NULL,NULL,NULL,NULL),(160,'MoSys',NULL,NULL,NULL,NULL,NULL,NULL),(161,'Motorola',NULL,NULL,NULL,NULL,NULL,NULL),(162,'Microtune',NULL,NULL,NULL,NULL,NULL,NULL),(163,'M-Systems',NULL,NULL,NULL,NULL,NULL,NULL),(164,'Murata Manufacturing',NULL,NULL,NULL,NULL,NULL,NULL),(165,'MWave (IBM)',NULL,NULL,NULL,NULL,NULL,NULL),(166,'Myson Technology',NULL,NULL,NULL,NULL,NULL,NULL),(167,'NEC Electronics',NULL,NULL,NULL,NULL,NULL,NULL),(168,'NexFlash Technologies',NULL,NULL,NULL,NULL,NULL,NULL),(169,'New Japan Radio',NULL,NULL,NULL,NULL,NULL,NULL),(170,'National Semiconductor',NULL,NULL,NULL,NULL,NULL,NULL),(171,'NVidia Corporation',NULL,NULL,NULL,NULL,NULL,NULL),(172,'Oak Technology',NULL,NULL,NULL,NULL,NULL,NULL),(173,'Oki Semiconductor',NULL,NULL,NULL,NULL,NULL,NULL),(174,'Opti',NULL,NULL,NULL,NULL,NULL,NULL),(175,'Orbit Semiconductor',NULL,NULL,NULL,NULL,NULL,NULL),(176,'Oren Semiconductor',NULL,NULL,NULL,NULL,NULL,NULL),(177,'Performance Semiconductor',NULL,NULL,NULL,NULL,NULL,NULL),(178,'Pericom Semiconductor',NULL,NULL,NULL,NULL,NULL,NULL),(179,'PhaseLink Laboratories',NULL,NULL,NULL,NULL,NULL,NULL),(180,'Philips Semiconductor',NULL,NULL,NULL,NULL,NULL,NULL),(181,'PLX Technology',NULL,NULL,NULL,NULL,NULL,NULL),(182,'PMC- Sierra',NULL,NULL,NULL,NULL,NULL,NULL),(183,'Precision Monolithics',NULL,NULL,NULL,NULL,NULL,NULL),(184,'Princeton Technology',NULL,NULL,NULL,NULL,NULL,NULL),(185,'PowerSmart',NULL,NULL,NULL,NULL,NULL,NULL),(186,'QuickLogic',NULL,NULL,NULL,NULL,NULL,NULL),(187,'Qlogic',NULL,NULL,NULL,NULL,NULL,NULL),(188,'Quality Semiconductor',NULL,NULL,NULL,NULL,NULL,NULL),(189,'Rabbit Semiconductor',NULL,NULL,NULL,NULL,NULL,NULL),(190,'Ramtron International Co.',NULL,NULL,NULL,NULL,NULL,NULL),(191,'Raytheon Semiconductor',NULL,NULL,NULL,NULL,NULL,NULL),(192,'RCA Solid State',NULL,NULL,NULL,NULL,NULL,NULL),(193,'Realtek Semiconductor',NULL,NULL,NULL,NULL,NULL,NULL),(194,'Rectron',NULL,NULL,NULL,NULL,NULL,NULL),(195,'Rendition',NULL,NULL,NULL,NULL,NULL,NULL),(196,'Renesas Technology',NULL,NULL,NULL,NULL,NULL,NULL),(197,'Rockwell',NULL,NULL,NULL,NULL,NULL,NULL),(198,'Rohm Corp.',NULL,NULL,NULL,NULL,NULL,NULL),(199,'S3',NULL,NULL,NULL,NULL,NULL,NULL),(200,'Sage',NULL,NULL,NULL,NULL,NULL,NULL),(201,'Saifun Semiconductors Ltd.',NULL,NULL,NULL,NULL,NULL,NULL),(202,'Sames',NULL,NULL,NULL,NULL,NULL,NULL),(203,'Samsung',NULL,NULL,NULL,NULL,NULL,NULL),(204,'Sanken',NULL,NULL,NULL,NULL,NULL,NULL),(205,'Sanyo',NULL,NULL,NULL,NULL,NULL,NULL),(206,'Scenix',NULL,NULL,NULL,NULL,NULL,NULL),(207,'Samsung Electronics',NULL,NULL,NULL,NULL,NULL,NULL),(208,'SEEQ Technology',NULL,NULL,NULL,NULL,NULL,NULL),(209,'Seiko Instruments',NULL,NULL,NULL,NULL,NULL,NULL),(210,'Semtech',NULL,NULL,NULL,NULL,NULL,NULL),(211,'SGS-Ates',NULL,NULL,NULL,NULL,NULL,NULL),(212,'SGS-Thomson Microelectonics ST-M)',NULL,NULL,NULL,NULL,NULL,NULL),(213,'Sharp Microelectronics (USA)',NULL,NULL,NULL,NULL,NULL,NULL),(214,'Shindengen',NULL,NULL,NULL,NULL,NULL,NULL),(215,'Siemens Microelectronics, Inc.',NULL,NULL,NULL,NULL,NULL,NULL),(216,'Sierra',NULL,NULL,NULL,NULL,NULL,NULL),(217,'Sigma Tel',NULL,NULL,NULL,NULL,NULL,NULL),(218,'Signetics',NULL,NULL,NULL,NULL,NULL,NULL),(219,'Silicon Laboratories',NULL,NULL,NULL,NULL,NULL,NULL),(220,'Silicon Magic',NULL,NULL,NULL,NULL,NULL,NULL),(221,'Simtec Corp.',NULL,NULL,NULL,NULL,NULL,NULL),(222,'Siliconix',NULL,NULL,NULL,NULL,NULL,NULL),(223,'Siliconians',NULL,NULL,NULL,NULL,NULL,NULL),(224,'Sipex',NULL,NULL,NULL,NULL,NULL,NULL),(225,'Silicon Integrated Systems',NULL,NULL,NULL,NULL,NULL,NULL),(226,'SMC',NULL,NULL,NULL,NULL,NULL,NULL),(227,'Standard Microsystems',NULL,NULL,NULL,NULL,NULL,NULL),(228,'Sony Semiconductor',NULL,NULL,NULL,NULL,NULL,NULL),(229,'Space Electronics',NULL,NULL,NULL,NULL,NULL,NULL),(230,'Spectek',NULL,NULL,NULL,NULL,NULL,NULL),(231,'Signal Processing Technologies',NULL,NULL,NULL,NULL,NULL,NULL),(232,'Solid State Scientific',NULL,NULL,NULL,NULL,NULL,NULL),(233,'Silicon Storage Technology (SST)',NULL,NULL,NULL,NULL,NULL,NULL),(234,'STMicroelectronics',NULL,NULL,NULL,NULL,NULL,NULL),(235,'SUMMIT Microelectronics',NULL,NULL,NULL,NULL,NULL,NULL),(236,'Synergy Semiconductor',NULL,NULL,NULL,NULL,NULL,NULL),(237,'Synertek',NULL,NULL,NULL,NULL,NULL,NULL),(238,'Taiwan Semiconductor',NULL,NULL,NULL,NULL,NULL,NULL),(239,'TDK Semiconductor',NULL,NULL,NULL,NULL,NULL,NULL),(240,'Teccor Electronics',NULL,NULL,NULL,NULL,NULL,NULL),(241,'TelCom Semiconductor',NULL,NULL,NULL,NULL,NULL,NULL),(242,'Teledyne',NULL,NULL,NULL,NULL,NULL,NULL),(243,'Telefunken',NULL,NULL,NULL,NULL,NULL,NULL),(244,'Teltone',NULL,NULL,NULL,NULL,NULL,NULL),(245,'Thomson-CSF',NULL,NULL,NULL,NULL,NULL,NULL),(246,'Texas Instruments',NULL,NULL,NULL,NULL,NULL,NULL),(247,'Toko Amerika',NULL,NULL,NULL,NULL,NULL,NULL),(248,'Toshiba (US)',NULL,NULL,NULL,NULL,NULL,NULL),(249,'Trident',NULL,NULL,NULL,NULL,NULL,NULL),(250,'TriQuint Semiconductor',NULL,NULL,NULL,NULL,NULL,NULL),(251,'Triscend',NULL,NULL,NULL,NULL,NULL,NULL),(252,'Tseng Labs',NULL,NULL,NULL,NULL,NULL,NULL),(253,'Tundra',NULL,NULL,NULL,NULL,NULL,NULL),(254,'Turbo IC',NULL,NULL,NULL,NULL,NULL,NULL),(255,'Ubicom',NULL,NULL,NULL,NULL,NULL,NULL),(256,'United Microelectronics Corp (UMC)',NULL,NULL,NULL,NULL,NULL,NULL),(257,'Unitrode',NULL,NULL,NULL,NULL,NULL,NULL),(258,'USAR Systems',NULL,NULL,NULL,NULL,NULL,NULL),(259,'United Technologies Microelectronics Center (UTMC)',NULL,NULL,NULL,NULL,NULL,NULL),(260,'Utron',NULL,NULL,NULL,NULL,NULL,NULL),(261,'V3 Semiconductor',NULL,NULL,NULL,NULL,NULL,NULL),(262,'Vadem',NULL,NULL,NULL,NULL,NULL,NULL),(263,'Vanguard International Semiconductor',NULL,NULL,NULL,NULL,NULL,NULL),(264,'Vantis',NULL,NULL,NULL,NULL,NULL,NULL),(265,'Via Technologies',NULL,NULL,NULL,NULL,NULL,NULL),(266,'Virata',NULL,NULL,NULL,NULL,NULL,NULL),(267,'Vishay',NULL,NULL,NULL,NULL,NULL,NULL),(268,'Vision Tech',NULL,NULL,NULL,NULL,NULL,NULL),(269,'Vitelic',NULL,NULL,NULL,NULL,NULL,NULL),(270,'VLSI Technology',NULL,NULL,NULL,NULL,NULL,NULL),(271,'Volterra',NULL,NULL,NULL,NULL,NULL,NULL),(272,'VTC',NULL,NULL,NULL,NULL,NULL,NULL),(273,'Waferscale Integration (WSI)',NULL,NULL,NULL,NULL,NULL,NULL),(274,'Western Digital',NULL,NULL,NULL,NULL,NULL,NULL),(275,'Weitek',NULL,NULL,NULL,NULL,NULL,NULL),(276,'Winbond',NULL,NULL,NULL,NULL,NULL,NULL),(277,'Wofson Microelectronics',NULL,NULL,NULL,NULL,NULL,NULL),(278,'Xwmics',NULL,NULL,NULL,NULL,NULL,NULL),(279,'Xicor',NULL,NULL,NULL,NULL,NULL,NULL),(280,'Xilinx',NULL,NULL,NULL,NULL,NULL,NULL),(281,'Yamaha',NULL,NULL,NULL,NULL,NULL,NULL),(282,'Zetex Semiconductors',NULL,NULL,NULL,NULL,NULL,NULL),(283,'Zilog',NULL,NULL,NULL,NULL,NULL,NULL),(284,'ZMD (Zentrum Mikroelektronik Dresden)',NULL,NULL,NULL,NULL,NULL,NULL),(285,'Zoran',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `Manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ManufacturerICLogo`
--

DROP TABLE IF EXISTS `ManufacturerICLogo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ManufacturerICLogo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturer_id` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `originalname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mimetype` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `extension` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3F1EF213A23B42D` (`manufacturer_id`),
  CONSTRAINT `FK_3F1EF213A23B42D` FOREIGN KEY (`manufacturer_id`) REFERENCES `Manufacturer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=347 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ManufacturerICLogo`
--

LOCK TABLES `ManufacturerICLogo` WRITE;
/*!40000 ALTER TABLE `ManufacturerICLogo` DISABLE KEYS */;
INSERT INTO `ManufacturerICLogo` VALUES (1,1,'iclogo','42652400-66d6-11eb-be54-42010ab80009','acer.png','image/png',2195,'png',NULL,'2021-02-04 10:46:38'),(2,2,'iclogo','42658120-66d6-11eb-a868-42010ab80009','actel.png','image/png',5003,'png',NULL,'2021-02-04 10:46:38'),(3,3,'iclogo','4265b6e0-66d6-11eb-b0d1-42010ab80009','advldev.png','image/png',1835,'png',NULL,'2021-02-04 10:46:38'),(4,4,'iclogo','4265e606-66d6-11eb-baf8-42010ab80009','aeroflex1.png','image/png',9649,'png',NULL,'2021-02-04 10:46:38'),(5,4,'iclogo','426602a8-66d6-11eb-8755-42010ab80009','aeroflex2.png','image/png',4562,'png',NULL,'2021-02-04 10:46:38'),(6,5,'iclogo','42662b48-66d6-11eb-96d4-42010ab80009','agilent.png','image/png',5264,'png',NULL,'2021-02-04 10:46:38'),(7,6,'iclogo','42665884-66d6-11eb-86f1-42010ab80009','akm.png','image/png',2204,'png',NULL,'2021-02-04 10:46:38'),(8,7,'iclogo','4266762a-66d6-11eb-bbb0-42010ab80009','alesis.png','image/png',1475,'png',NULL,'2021-02-04 10:46:38'),(9,8,'iclogo','4266922c-66d6-11eb-a226-42010ab80009','ali1.png','image/png',2462,'png',NULL,'2021-02-04 10:46:38'),(10,8,'iclogo','42669dee-66d6-11eb-aace-42010ab80009','ali2.png','image/png',1784,'png',NULL,'2021-02-04 10:46:38'),(11,9,'iclogo','4266b89c-66d6-11eb-b5a3-42010ab80009','allayer.png','image/png',1869,'png',NULL,'2021-02-04 10:46:38'),(12,10,'iclogo','4266d200-66d6-11eb-80c5-42010ab80009','allegro.png','image/png',1475,'png',NULL,'2021-02-04 10:46:38'),(13,11,'iclogo','4266ecfe-66d6-11eb-8004-42010ab80009','alliance.png','image/png',1949,'png',NULL,'2021-02-04 10:46:38'),(14,12,'iclogo','42670626-66d6-11eb-9467-42010ab80009','alphaind.png','image/png',1403,'png',NULL,'2021-02-04 10:46:38'),(15,13,'iclogo','42671f6c-66d6-11eb-933e-42010ab80009','alphamic.png','image/png',2989,'png',NULL,'2021-02-04 10:46:38'),(16,13,'iclogo','426728a4-66d6-11eb-837f-42010ab80009','alpha.png','image/png',1534,'png',NULL,'2021-02-04 10:46:38'),(17,14,'iclogo','42674122-66d6-11eb-8d42-42010ab80009','altera.png','image/png',4064,'png',NULL,'2021-02-04 10:46:38'),(18,15,'iclogo','42675be4-66d6-11eb-8bbb-42010ab80009','amd.png','image/png',1709,'png',NULL,'2021-02-04 10:46:38'),(19,16,'iclogo','426775de-66d6-11eb-99fb-42010ab80009','ami1.png','image/png',2399,'png',NULL,'2021-02-04 10:46:38'),(20,16,'iclogo','42678024-66d6-11eb-af9a-42010ab80009','ami2.png','image/png',1706,'png',NULL,'2021-02-04 10:46:38'),(21,17,'iclogo','42679820-66d6-11eb-9241-42010ab80009','amic.png','image/png',2228,'png',NULL,'2021-02-04 10:46:38'),(22,18,'iclogo','4267b2ec-66d6-11eb-96b7-42010ab80009','ampus.png','image/png',6150,'png',NULL,'2021-02-04 10:46:38'),(23,19,'iclogo','4267cdf4-66d6-11eb-988a-42010ab80009','anachip.png','image/png',3549,'png',NULL,'2021-02-04 10:46:38'),(24,20,'iclogo','4267e726-66d6-11eb-9fb9-42010ab80009','anadigic.png','image/png',5147,'png',NULL,'2021-02-04 10:46:38'),(25,21,'iclogo','426801ca-66d6-11eb-8899-42010ab80009','analog1.png','image/png',1262,'png',NULL,'2021-02-04 10:46:38'),(26,21,'iclogo','42680bde-66d6-11eb-a427-42010ab80009','analog.png','image/png',1403,'png',NULL,'2021-02-04 10:46:38'),(27,22,'iclogo','4268240c-66d6-11eb-9092-42010ab80009','anasys.png','image/png',3309,'png',NULL,'2021-02-04 10:46:38'),(28,23,'iclogo','42683d20-66d6-11eb-a8f5-42010ab80009','anchorch.png','image/png',1475,'png',NULL,'2021-02-04 10:46:38'),(29,24,'iclogo','426856de-66d6-11eb-bf37-42010ab80009','apex1.png','image/png',2627,'png',NULL,'2021-02-04 10:46:38'),(30,24,'iclogo','426861e2-66d6-11eb-bdc6-42010ab80009','apex.png','image/png',3974,'png',NULL,'2021-02-04 10:46:38'),(31,25,'iclogo','42687b32-66d6-11eb-a2ba-42010ab80009','ark.png','image/png',2089,'png',NULL,'2021-02-04 10:46:38'),(32,26,'iclogo','4268952c-66d6-11eb-8036-42010ab80009','asd.png','image/png',5024,'png',NULL,'2021-02-04 10:46:38'),(33,27,'iclogo','4268af44-66d6-11eb-afdf-42010ab80009','astec.png','image/png',3369,'png',NULL,'2021-02-04 10:46:38'),(34,28,'iclogo','4268cb32-66d6-11eb-8566-42010ab80009','atc.png','image/png',8660,'png',NULL,'2021-02-04 10:46:38'),(35,29,'iclogo','4268ea9a-66d6-11eb-a087-42010ab80009','atecom.png','image/png',1709,'png',NULL,'2021-02-04 10:46:38'),(36,30,'iclogo','42690534-66d6-11eb-b8d5-42010ab80009','ati.png','image/png',2630,'png',NULL,'2021-02-04 10:46:38'),(37,31,'iclogo','42691f10-66d6-11eb-8027-42010ab80009','atmel.png','image/png',2843,'png',NULL,'2021-02-04 10:46:38'),(38,32,'iclogo','4269398c-66d6-11eb-822b-42010ab80009','att.png','image/png',2816,'png',NULL,'2021-02-04 10:46:38'),(39,33,'iclogo','4269520a-66d6-11eb-b788-42010ab80009','audiocod.png','image/png',2429,'png',NULL,'2021-02-04 10:46:38'),(40,34,'iclogo','42696bc8-66d6-11eb-a781-42010ab80009','auravis.png','image/png',2281,'png',NULL,'2021-02-04 10:46:38'),(41,35,'iclogo','4269843c-66d6-11eb-ac8d-42010ab80009','aureal.png','image/png',2109,'png',NULL,'2021-02-04 10:46:38'),(42,36,'iclogo','42699c1a-66d6-11eb-bd6e-42010ab80009','austin.png','image/png',2464,'png',NULL,'2021-02-04 10:46:38'),(43,37,'iclogo','4269b902-66d6-11eb-8133-42010ab80009','averlog.png','image/png',1552,'png',NULL,'2021-02-04 10:46:38'),(44,38,'iclogo','4269d34c-66d6-11eb-a38e-42010ab80009','belfuse.png','image/png',2204,'png',NULL,'2021-02-04 10:46:38'),(45,39,'iclogo','4269ec92-66d6-11eb-a1de-42010ab80009','benchmrq.png','image/png',1370,'png',NULL,'2021-02-04 10:46:38'),(46,40,'iclogo','426a03e4-66d6-11eb-9e0c-42010ab80009','bi.png','image/png',2008,'png',NULL,'2021-02-04 10:46:38'),(47,41,'iclogo','426a1c1c-66d6-11eb-ad2a-42010ab80009','bowmar_white.png','image/png',4652,'png',NULL,'2021-02-04 10:46:38'),(48,42,'iclogo','426a362a-66d6-11eb-9f73-42010ab80009','bright.png','image/png',6839,'png',NULL,'2021-02-04 10:46:38'),(49,43,'iclogo','426a502e-66d6-11eb-81ce-42010ab80009','broadcom.png','image/png',6056,'png',NULL,'2021-02-04 10:46:38'),(50,44,'iclogo','426a6aaa-66d6-11eb-870a-42010ab80009','brooktre.png','image/png',1364,'png',NULL,'2021-02-04 10:46:38'),(51,45,'iclogo','426a8328-66d6-11eb-bca5-42010ab80009','burrbrwn.png','image/png',3563,'png',NULL,'2021-02-04 10:46:38'),(52,46,'iclogo','426a9c28-66d6-11eb-9a10-42010ab80009','calmicro.png','image/png',2109,'png',NULL,'2021-02-04 10:46:38'),(53,47,'iclogo','426ab50a-66d6-11eb-937d-42010ab80009','calogic.png','image/png',3367,'png',NULL,'2021-02-04 10:46:38'),(54,48,'iclogo','426ace6e-66d6-11eb-b1dd-42010ab80009','catalys1.png','image/png',1922,'png',NULL,'2021-02-04 10:46:38'),(55,48,'iclogo','426ad788-66d6-11eb-9112-42010ab80009','catalyst.png','image/png',2228,'png',NULL,'2021-02-04 10:46:38'),(56,49,'iclogo','426af042-66d6-11eb-a5d5-42010ab80009','ccube.png','image/png',1309,'png',NULL,'2021-02-04 10:46:38'),(57,50,'iclogo','426b0924-66d6-11eb-ad5f-42010ab80009','ceramate1.png','image/png',2917,'png',NULL,'2021-02-04 10:46:38'),(58,50,'iclogo','426b1234-66d6-11eb-a2e2-42010ab80009','ceramate2.png','image/png',2917,'png',NULL,'2021-02-04 10:46:38'),(59,51,'iclogo','426b2a08-66d6-11eb-9393-42010ab80009','cherry.png','image/png',2507,'png',NULL,'2021-02-04 10:46:38'),(60,52,'iclogo','426b424a-66d6-11eb-ac97-42010ab80009','chipcon1.png','image/png',8655,'png',NULL,'2021-02-04 10:46:38'),(61,52,'iclogo','426b4f92-66d6-11eb-83ab-42010ab80009','chipcon2.png','image/png',2923,'png',NULL,'2021-02-04 10:46:38'),(62,53,'iclogo','426b6806-66d6-11eb-899b-42010ab80009','chips.png','image/png',2864,'png',NULL,'2021-02-04 10:46:38'),(63,54,'iclogo','426b8156-66d6-11eb-9a90-42010ab80009','chrontel.png','image/png',1476,'png',NULL,'2021-02-04 10:46:38'),(64,55,'iclogo','426b9948-66d6-11eb-885b-42010ab80009','cirrus.png','image/png',3218,'png',NULL,'2021-02-04 10:46:38'),(65,56,'iclogo','426bb20c-66d6-11eb-b13e-42010ab80009','comcore.png','image/png',1709,'png',NULL,'2021-02-04 10:46:38'),(66,57,'iclogo','426bca08-66d6-11eb-a2b0-42010ab80009','conexant.png','image/png',2051,'png',NULL,'2021-02-04 10:46:38'),(67,58,'iclogo','426be164-66d6-11eb-9e48-42010ab80009','cosmo.png','image/png',1709,'png',NULL,'2021-02-04 10:46:38'),(68,59,'iclogo','426bf8c0-66d6-11eb-b25d-42010ab80009','crystal.png','image/png',3605,'png',NULL,'2021-02-04 10:46:38'),(69,60,'iclogo','426c1152-66d6-11eb-8759-42010ab80009','cygnal.png','image/png',2135,'png',NULL,'2021-02-04 10:46:38'),(70,61,'iclogo','426c28e0-66d6-11eb-8c57-42010ab80009','cypres1.png','image/png',2504,'png',NULL,'2021-02-04 10:46:38'),(71,61,'iclogo','426c33b2-66d6-11eb-a7f3-42010ab80009','cypress.png','image/png',4275,'png',NULL,'2021-02-04 10:46:38'),(72,62,'iclogo','426c4d2a-66d6-11eb-9a75-42010ab80009','cyrix.png','image/png',2204,'png',NULL,'2021-02-04 10:46:38'),(73,63,'iclogo','426c658a-66d6-11eb-974d-42010ab80009','daewoo.png','image/png',1907,'png',NULL,'2021-02-04 10:46:38'),(74,64,'iclogo','426c7f34-66d6-11eb-b83a-42010ab80009','dallas1.png','image/png',1469,'png',NULL,'2021-02-04 10:46:38'),(75,64,'iclogo','426c88e4-66d6-11eb-80ee-42010ab80009','dallas2.png','image/png',1309,'png',NULL,'2021-02-04 10:46:38'),(76,64,'iclogo','426c9258-66d6-11eb-b264-42010ab80009','dallas3.png','image/png',1869,'png',NULL,'2021-02-04 10:46:38'),(77,65,'iclogo','426cab26-66d6-11eb-b8af-42010ab80009','davicom.png','image/png',4589,'png',NULL,'2021-02-04 10:46:38'),(78,66,'iclogo','426cc50c-66d6-11eb-9a39-42010ab80009','ddd.png','image/png',3235,'png',NULL,'2021-02-04 10:46:38'),(79,67,'iclogo','426cdf24-66d6-11eb-be0e-42010ab80009','diamond.png','image/png',2504,'png',NULL,'2021-02-04 10:46:38'),(80,68,'iclogo','426cf75c-66d6-11eb-9fd7-42010ab80009','diotec.png','image/png',1454,'png',NULL,'2021-02-04 10:46:38'),(81,69,'iclogo','426d0fd0-66d6-11eb-81fa-42010ab80009','dtc1.png','image/png',2513,'png',NULL,'2021-02-04 10:46:38'),(82,69,'iclogo','426d1a2a-66d6-11eb-889a-42010ab80009','dtc2.png','image/png',1670,'png',NULL,'2021-02-04 10:46:38'),(83,70,'iclogo','426d329e-66d6-11eb-adc6-42010ab80009','dvdo.png','image/png',2357,'png',NULL,'2021-02-04 10:46:38'),(84,71,'iclogo','426d4b44-66d6-11eb-b909-42010ab80009','egg.png','image/png',1628,'png',NULL,'2021-02-04 10:46:38'),(85,72,'iclogo','426d63cc-66d6-11eb-adaa-42010ab80009','elan.png','image/png',13826,'png',NULL,'2021-02-04 10:46:38'),(86,73,'iclogo','426d84e2-66d6-11eb-adc1-42010ab80009','elantec1.png','image/png',1400,'png',NULL,'2021-02-04 10:46:38'),(87,73,'iclogo','426d8dd4-66d6-11eb-818c-42010ab80009','elantec.png','image/png',3274,'png',NULL,'2021-02-04 10:46:38'),(88,74,'iclogo','426da5a8-66d6-11eb-8937-42010ab80009','elec_arrays.png','image/png',5602,'png',NULL,'2021-02-04 10:46:38'),(89,75,'iclogo','426dbf7a-66d6-11eb-81d0-42010ab80009','elite[1].png','image/png',8285,'png',NULL,'2021-02-04 10:46:38'),(90,76,'iclogo','426dd92e-66d6-11eb-8d83-42010ab80009','emmicro.png','image/png',3599,'png',NULL,'2021-02-04 10:46:38'),(91,77,'iclogo','426df27e-66d6-11eb-9819-42010ab80009','enhmemsy.png','image/png',1403,'png',NULL,'2021-02-04 10:46:38'),(92,78,'iclogo','426e0ade-66d6-11eb-ad2a-42010ab80009','ensoniq.png','image/png',3557,'png',NULL,'2021-02-04 10:46:38'),(93,79,'iclogo','426e2334-66d6-11eb-a803-42010ab80009','eon.png','image/png',5393,'png',NULL,'2021-02-04 10:46:38'),(94,80,'iclogo','426e3dce-66d6-11eb-9470-42010ab80009','epson1.png','image/png',2349,'png',NULL,'2021-02-04 10:46:38'),(95,80,'iclogo','426e4706-66d6-11eb-a481-42010ab80009','epson2.png','image/png',2405,'png',NULL,'2021-02-04 10:46:38'),(96,81,'iclogo','426e5f2a-66d6-11eb-85f4-42010ab80009','ericsson.png','image/png',4184,'png',NULL,'2021-02-04 10:46:38'),(97,82,'iclogo','426e7c1c-66d6-11eb-89eb-42010ab80009','ess.png','image/png',3030,'png',NULL,'2021-02-04 10:46:38'),(98,83,'iclogo','426e9576-66d6-11eb-a15d-42010ab80009','etc.png','image/png',2189,'png',NULL,'2021-02-04 10:46:38'),(99,84,'iclogo','426eae3a-66d6-11eb-97af-42010ab80009','exar.png','image/png',2771,'png',NULL,'2021-02-04 10:46:38'),(100,85,'iclogo','426ec604-66d6-11eb-bad2-42010ab80009','excelsemi1.png','image/png',7632,'png',NULL,'2021-02-04 10:46:38'),(101,85,'iclogo','426ed2ac-66d6-11eb-a4b5-42010ab80009','excelsemi2.png','image/png',2339,'png',NULL,'2021-02-04 10:46:38'),(102,85,'iclogo','426edaf4-66d6-11eb-a0fd-42010ab80009','exel.png','image/png',2771,'png',NULL,'2021-02-04 10:46:38'),(103,86,'iclogo','426ef28c-66d6-11eb-998c-42010ab80009','fairchil.png','image/png',1552,'png',NULL,'2021-02-04 10:46:38'),(104,87,'iclogo','426f0af6-66d6-11eb-b19e-42010ab80009','freescale.png','image/png',3840,'png',NULL,'2021-02-04 10:46:38'),(105,88,'iclogo','426f266c-66d6-11eb-9d37-42010ab80009','fujielec.png','image/png',5048,'png',NULL,'2021-02-04 10:46:38'),(106,88,'iclogo','426f30da-66d6-11eb-995a-42010ab80009','fujitsu2.png','image/png',1860,'png',NULL,'2021-02-04 10:46:38'),(107,89,'iclogo','426f4a7a-66d6-11eb-93e5-42010ab80009','galileo.png','image/png',3779,'png',NULL,'2021-02-04 10:46:38'),(108,90,'iclogo','426f6348-66d6-11eb-b4cc-42010ab80009','galvant.png','image/png',2669,'png',NULL,'2021-02-04 10:46:38'),(109,91,'iclogo','426f7ae0-66d6-11eb-b6f6-42010ab80009','gecples.png','image/png',2312,'png',NULL,'2021-02-04 10:46:38'),(110,92,'iclogo','426f9250-66d6-11eb-b476-42010ab80009','gennum.png','image/png',2614,'png',NULL,'2021-02-04 10:46:38'),(111,93,'iclogo','426fab3c-66d6-11eb-8425-42010ab80009','ge.png','image/png',2321,'png',NULL,'2021-02-04 10:46:38'),(112,94,'iclogo','426fc338-66d6-11eb-a2de-42010ab80009','gi1.png','image/png',1385,'png',NULL,'2021-02-04 10:46:38'),(113,94,'iclogo','426fcd42-66d6-11eb-8890-42010ab80009','gi.png','image/png',1691,'png',NULL,'2021-02-04 10:46:38'),(114,95,'iclogo','426fe4ee-66d6-11eb-b4a1-42010ab80009','glink.png','image/png',1706,'png',NULL,'2021-02-04 10:46:38'),(115,96,'iclogo','426ffc86-66d6-11eb-98a5-42010ab80009','goal1.png','image/png',9092,'png',NULL,'2021-02-04 10:46:38'),(116,96,'iclogo','42700848-66d6-11eb-a4dc-42010ab80009','goal2.png','image/png',9649,'png',NULL,'2021-02-04 10:46:38'),(117,97,'iclogo','427021a2-66d6-11eb-b810-42010ab80009','goldstar1.png','image/png',2923,'png',NULL,'2021-02-04 10:46:38'),(118,97,'iclogo','42702a8a-66d6-11eb-a12a-42010ab80009','goldstar2.png','image/png',11387,'png',NULL,'2021-02-04 10:46:38'),(119,98,'iclogo','42704416-66d6-11eb-8ece-42010ab80009','gould.png','image/png',1549,'png',NULL,'2021-02-04 10:46:38'),(120,99,'iclogo','42705cc6-66d6-11eb-a5df-42010ab80009','greenwich.png','image/png',9761,'png',NULL,'2021-02-04 10:46:38'),(121,100,'iclogo','427078aa-66d6-11eb-abec-42010ab80009','gsemi.png','image/png',1704,'png',NULL,'2021-02-04 10:46:38'),(122,101,'iclogo','4270922c-66d6-11eb-939c-42010ab80009','harris1.png','image/png',1549,'png',NULL,'2021-02-04 10:46:38'),(123,101,'iclogo','42709c22-66d6-11eb-b5fb-42010ab80009','harris2.png','image/png',1874,'png',NULL,'2021-02-04 10:46:38'),(124,102,'iclogo','4270b3ce-66d6-11eb-aa24-42010ab80009','hfo.png','image/png',1958,'png',NULL,'2021-02-04 10:46:38'),(125,103,'iclogo','4270ccba-66d6-11eb-9cd0-42010ab80009','hitachi.png','image/png',2611,'png',NULL,'2021-02-04 10:46:38'),(126,104,'iclogo','4270e420-66d6-11eb-9a37-42010ab80009','holtek.png','image/png',2160,'png',NULL,'2021-02-04 10:46:38'),(127,105,'iclogo','4270fd20-66d6-11eb-a4ed-42010ab80009','hp.png','image/png',2464,'png',NULL,'2021-02-04 10:46:38'),(128,106,'iclogo','427115c6-66d6-11eb-90ee-42010ab80009','hualon.png','image/png',2864,'png',NULL,'2021-02-04 10:46:38'),(129,107,'iclogo','42712db8-66d6-11eb-b363-42010ab80009','hynix.png','image/png',8444,'png',NULL,'2021-02-04 10:46:38'),(130,108,'iclogo','42714802-66d6-11eb-88f3-42010ab80009','hyundai2.png','image/png',2269,'png',NULL,'2021-02-04 10:46:38'),(131,109,'iclogo','42715f90-66d6-11eb-b5bc-42010ab80009','icdesign.png','image/png',3014,'png',NULL,'2021-02-04 10:46:38'),(132,110,'iclogo','42717ba6-66d6-11eb-b19e-42010ab80009','icd.png','image/png',1641,'png',NULL,'2021-02-04 10:46:38'),(133,110,'iclogo','4271860a-66d6-11eb-b745-42010ab80009','ics.png','image/png',2042,'png',NULL,'2021-02-04 10:46:38'),(134,111,'iclogo','42719d98-66d6-11eb-83d4-42010ab80009','ichaus1.png','image/png',3370,'png',NULL,'2021-02-04 10:46:38'),(135,111,'iclogo','4271a68a-66d6-11eb-83c7-42010ab80009','ichaus.png','image/png',1552,'png',NULL,'2021-02-04 10:46:38'),(136,112,'iclogo','4271bf30-66d6-11eb-9ec5-42010ab80009','icsi.png','image/png',4049,'png',NULL,'2021-02-04 10:46:38'),(137,113,'iclogo','4271d718-66d6-11eb-a85e-42010ab80009','icube.png','image/png',1629,'png',NULL,'2021-02-04 10:46:38'),(138,114,'iclogo','4271eeba-66d6-11eb-a4d9-42010ab80009','icworks.png','image/png',1874,'png',NULL,'2021-02-04 10:46:38'),(139,115,'iclogo','427206ac-66d6-11eb-8297-42010ab80009','idt1.png','image/png',3995,'png',NULL,'2021-02-04 10:46:38'),(140,115,'iclogo','42720fbc-66d6-11eb-846a-42010ab80009','idt.png','image/png',1553,'png',NULL,'2021-02-04 10:46:38'),(141,116,'iclogo','427227c2-66d6-11eb-ac09-42010ab80009','igstech.png','image/png',3832,'png',NULL,'2021-02-04 10:46:38'),(142,117,'iclogo','42724086-66d6-11eb-afa8-42010ab80009','impala.png','image/png',1628,'png',NULL,'2021-02-04 10:46:38'),(143,118,'iclogo','4272590e-66d6-11eb-bbbb-42010ab80009','imp.png','image/png',2175,'png',NULL,'2021-02-04 10:46:38'),(144,119,'iclogo','427270ec-66d6-11eb-ab8f-42010ab80009','infineon.png','image/png',4511,'png',NULL,'2021-02-04 10:46:38'),(145,120,'iclogo','4272897e-66d6-11eb-b5ab-42010ab80009','inmos.png','image/png',3365,'png',NULL,'2021-02-04 10:46:38'),(146,121,'iclogo','4272a24c-66d6-11eb-a7e8-42010ab80009','intel2.png','image/png',2010,'png',NULL,'2021-02-04 10:46:38'),(147,122,'iclogo','4272ba48-66d6-11eb-a62d-42010ab80009','intresil4.png','image/png',2614,'png',NULL,'2021-02-04 10:46:38'),(148,122,'iclogo','4272c39e-66d6-11eb-bf10-42010ab80009','intrsil1.png','image/png',1874,'png',NULL,'2021-02-04 10:46:38'),(149,122,'iclogo','4272caec-66d6-11eb-9bd0-42010ab80009','intrsil2.png','image/png',2520,'png',NULL,'2021-02-04 10:46:38'),(150,122,'iclogo','4272d32a-66d6-11eb-9f05-42010ab80009','intrsil3.png','image/png',3295,'png',NULL,'2021-02-04 10:46:38'),(151,123,'iclogo','4272ead6-66d6-11eb-a27c-42010ab80009','ir.png','image/png',2729,'png',NULL,'2021-02-04 10:46:38'),(152,124,'iclogo','427303ea-66d6-11eb-a509-42010ab80009','isd.png','image/png',2554,'png',NULL,'2021-02-04 10:46:38'),(153,125,'iclogo','42731cfe-66d6-11eb-ba04-42010ab80009','issi.png','image/png',3030,'png',NULL,'2021-02-04 10:46:38'),(154,126,'iclogo','4273346e-66d6-11eb-967c-42010ab80009','ite.png','image/png',3302,'png',NULL,'2021-02-04 10:46:38'),(155,127,'iclogo','42735052-66d6-11eb-b2bd-42010ab80009','itt.png','image/png',2483,'png',NULL,'2021-02-04 10:46:38'),(156,128,'iclogo','42736812-66d6-11eb-9e2e-42010ab80009','ixys.png','image/png',3575,'png',NULL,'2021-02-04 10:46:38'),(157,129,'iclogo','4273804a-66d6-11eb-a2d4-42010ab80009','kec.png','image/png',2567,'png',NULL,'2021-02-04 10:46:38'),(158,130,'iclogo','42739922-66d6-11eb-a26b-42010ab80009','kota.png','image/png',1552,'png',NULL,'2021-02-04 10:46:38'),(159,131,'iclogo','4273b0e2-66d6-11eb-8e5e-42010ab80009','lattice1.png','image/png',1768,'png',NULL,'2021-02-04 10:46:38'),(160,131,'iclogo','4273bb0a-66d6-11eb-93cf-42010ab80009','lattice2.png','image/png',1519,'png',NULL,'2021-02-04 10:46:38'),(161,131,'iclogo','4273c226-66d6-11eb-a3e3-42010ab80009','lattice3.png','image/png',1216,'png',NULL,'2021-02-04 10:46:38'),(162,132,'iclogo','4273d93c-66d6-11eb-bc7d-42010ab80009','lds1.png','image/png',2136,'png',NULL,'2021-02-04 10:46:38'),(163,132,'iclogo','4273e21a-66d6-11eb-9b9d-42010ab80009','lds.png','image/png',1959,'png',NULL,'2021-02-04 10:46:38'),(164,133,'iclogo','4273f8ea-66d6-11eb-a281-42010ab80009','levone.png','image/png',4189,'png',NULL,'2021-02-04 10:46:38'),(165,134,'iclogo','427416b8-66d6-11eb-ac5f-42010ab80009','lgs1.png','image/png',2417,'png',NULL,'2021-02-04 10:46:38'),(166,134,'iclogo','4274211c-66d6-11eb-9cdc-42010ab80009','lgs.png','image/png',737,'png',NULL,'2021-02-04 10:46:38'),(167,135,'iclogo','42743ee0-66d6-11eb-aa8d-42010ab80009','linear.png','image/png',2486,'png',NULL,'2021-02-04 10:46:38'),(168,136,'iclogo','42745c18-66d6-11eb-909d-42010ab80009','linfin.png','image/png',4844,'png',NULL,'2021-02-04 10:46:38'),(169,137,'iclogo','42747892-66d6-11eb-88ae-42010ab80009','liteon.png','image/png',2388,'png',NULL,'2021-02-04 10:46:38'),(170,138,'iclogo','42749692-66d6-11eb-bba8-42010ab80009','lucent.png','image/png',1709,'png',NULL,'2021-02-04 10:46:38'),(171,139,'iclogo','4274b0aa-66d6-11eb-9939-42010ab80009','macronix.png','image/png',2324,'png',NULL,'2021-02-04 10:46:38'),(172,140,'iclogo','4274cb4e-66d6-11eb-9186-42010ab80009','marvell.png','image/png',3131,'png',NULL,'2021-02-04 10:46:38'),(173,141,'iclogo','4274e3ae-66d6-11eb-8e5c-42010ab80009','matsush1.png','image/png',1709,'png',NULL,'2021-02-04 10:46:38'),(174,141,'iclogo','4274ecd2-66d6-11eb-bec4-42010ab80009','matsushi.png','image/png',2029,'png',NULL,'2021-02-04 10:46:38'),(175,142,'iclogo','42750406-66d6-11eb-8223-42010ab80009','maxim.png','image/png',2690,'png',NULL,'2021-02-04 10:46:38'),(176,143,'iclogo','42751c52-66d6-11eb-a126-42010ab80009','mediavi1.png','image/png',2189,'png',NULL,'2021-02-04 10:46:38'),(177,143,'iclogo','4275254e-66d6-11eb-b377-42010ab80009','mediavi2.png','image/png',2487,'png',NULL,'2021-02-04 10:46:38'),(178,144,'iclogo','42753eb2-66d6-11eb-8f2b-42010ab80009','me.png','image/png',2411,'png',NULL,'2021-02-04 10:46:38'),(179,144,'iclogo','427547c2-66d6-11eb-ae79-42010ab80009','microchp.png','image/png',2814,'png',NULL,'2021-02-04 10:46:38'),(180,145,'iclogo','427561bc-66d6-11eb-9f70-42010ab80009','mhs2.png','image/png',2036,'png',NULL,'2021-02-04 10:46:38'),(181,145,'iclogo','42756b1c-66d6-11eb-8def-42010ab80009','mhs.png','image/png',1870,'png',NULL,'2021-02-04 10:46:38'),(182,146,'iclogo','42758264-66d6-11eb-b90c-42010ab80009','micrel1.png','image/png',9695,'png',NULL,'2021-02-04 10:46:38'),(183,146,'iclogo','42758ffc-66d6-11eb-9831-42010ab80009','micrel2.png','image/png',9695,'png',NULL,'2021-02-04 10:46:38'),(184,147,'iclogo','4275a974-66d6-11eb-a3d9-42010ab80009','micronas.png','image/png',1871,'png',NULL,'2021-02-04 10:46:38'),(185,148,'iclogo','4275c12a-66d6-11eb-b68c-42010ab80009','micronix.png','image/png',1856,'png',NULL,'2021-02-04 10:46:38'),(186,149,'iclogo','4275d93a-66d6-11eb-aaac-42010ab80009','micron.png','image/png',1763,'png',NULL,'2021-02-04 10:46:38'),(187,150,'iclogo','4275f15e-66d6-11eb-93a6-42010ab80009','microsemi1.png','image/png',3714,'png',NULL,'2021-02-04 10:46:38'),(188,150,'iclogo','4275fbfe-66d6-11eb-9cb6-42010ab80009','microsemi2.png','image/png',11992,'png',NULL,'2021-02-04 10:46:38'),(189,151,'iclogo','42761878-66d6-11eb-b35a-42010ab80009','minicirc.png','image/png',1391,'png',NULL,'2021-02-04 10:46:38'),(190,152,'iclogo','42763196-66d6-11eb-85a6-42010ab80009','mitel.png','image/png',2819,'png',NULL,'2021-02-04 10:46:38'),(191,153,'iclogo','4276499c-66d6-11eb-ad85-42010ab80009','mitsubis.png','image/png',2311,'png',NULL,'2021-02-04 10:46:38'),(192,154,'iclogo','42766166-66d6-11eb-8769-42010ab80009','mlinear.png','image/png',3377,'png',NULL,'2021-02-04 10:46:38'),(193,155,'iclogo','4276794e-66d6-11eb-81a4-42010ab80009','mmi.png','image/png',2692,'png',NULL,'2021-02-04 10:46:38'),(194,156,'iclogo','427691b8-66d6-11eb-9c44-42010ab80009','mosaic.png','image/png',2959,'png',NULL,'2021-02-04 10:46:38'),(195,157,'iclogo','4276ad7e-66d6-11eb-861d-42010ab80009','moselvit.png','image/png',2504,'png',NULL,'2021-02-04 10:46:38'),(196,158,'iclogo','4276c57a-66d6-11eb-a87c-42010ab80009','mos.png','image/png',2857,'png',NULL,'2021-02-04 10:46:38'),(197,159,'iclogo','4276ddc6-66d6-11eb-82cd-42010ab80009','mostek1.png','image/png',7502,'png',NULL,'2021-02-04 10:46:38'),(198,159,'iclogo','4276e8b6-66d6-11eb-b569-42010ab80009','mostek2.png','image/png',7502,'png',NULL,'2021-02-04 10:46:38'),(199,159,'iclogo','4276f1bc-66d6-11eb-bc57-42010ab80009','mostek3.png','image/png',2514,'png',NULL,'2021-02-04 10:46:38'),(200,160,'iclogo','427708be-66d6-11eb-9990-42010ab80009','mosys.png','image/png',2321,'png',NULL,'2021-02-04 10:46:38'),(201,161,'iclogo','4277211e-66d6-11eb-aaa4-42010ab80009','motorol1.png','image/png',999,'png',NULL,'2021-02-04 10:46:38'),(202,161,'iclogo','42772c22-66d6-11eb-8a95-42010ab80009','motorol2.png','image/png',2417,'png',NULL,'2021-02-04 10:46:38'),(203,162,'iclogo','427743d8-66d6-11eb-98a9-42010ab80009','mpd.png','image/png',2663,'png',NULL,'2021-02-04 10:46:38'),(204,163,'iclogo','42775b52-66d6-11eb-9ee3-42010ab80009','msystem.png','image/png',1670,'png',NULL,'2021-02-04 10:46:38'),(205,164,'iclogo','42777330-66d6-11eb-b61c-42010ab80009','murata1.png','image/png',4874,'png',NULL,'2021-02-04 10:46:38'),(206,164,'iclogo','42777e20-66d6-11eb-b12d-42010ab80009','murata.png','image/png',4777,'png',NULL,'2021-02-04 10:46:38'),(207,165,'iclogo','427796b2-66d6-11eb-9ce3-42010ab80009','mwave.png','image/png',3370,'png',NULL,'2021-02-04 10:46:38'),(208,166,'iclogo','4277ae68-66d6-11eb-9c9b-42010ab80009','myson.png','image/png',1932,'png',NULL,'2021-02-04 10:46:38'),(209,167,'iclogo','4277c768-66d6-11eb-9ebd-42010ab80009','nec1.png','image/png',3166,'png',NULL,'2021-02-04 10:46:38'),(210,167,'iclogo','4277d0aa-66d6-11eb-b4c6-42010ab80009','nec2.png','image/png',3071,'png',NULL,'2021-02-04 10:46:38'),(211,168,'iclogo','4277e7c0-66d6-11eb-8328-42010ab80009','nexflash.png','image/png',7789,'png',NULL,'2021-02-04 10:46:38'),(212,169,'iclogo','4278019c-66d6-11eb-bc7e-42010ab80009','njr.png','image/png',3419,'png',NULL,'2021-02-04 10:46:38'),(213,170,'iclogo','42781a24-66d6-11eb-8676-42010ab80009','ns1.png','image/png',1959,'png',NULL,'2021-02-04 10:46:38'),(214,170,'iclogo','427822d0-66d6-11eb-95ae-42010ab80009','ns2.png','image/png',1952,'png',NULL,'2021-02-04 10:46:38'),(215,171,'iclogo','42783a18-66d6-11eb-80f1-42010ab80009','nvidia.png','image/png',1874,'png',NULL,'2021-02-04 10:46:38'),(216,172,'iclogo','42785174-66d6-11eb-bad7-42010ab80009','oak.png','image/png',2614,'png',NULL,'2021-02-04 10:46:38'),(217,173,'iclogo','427869f2-66d6-11eb-a885-42010ab80009','oki1.png','image/png',2267,'png',NULL,'2021-02-04 10:46:38'),(218,173,'iclogo','4278735c-66d6-11eb-b130-42010ab80009','oki.png','image/png',2546,'png',NULL,'2021-02-04 10:46:38'),(219,174,'iclogo','42788b44-66d6-11eb-956b-42010ab80009','opti.png','image/png',1684,'png',NULL,'2021-02-04 10:46:38'),(220,175,'iclogo','4278a2b4-66d6-11eb-9678-42010ab80009','orbit.png','image/png',3347,'png',NULL,'2021-02-04 10:46:38'),(221,176,'iclogo','4278ba6a-66d6-11eb-8abc-42010ab80009','oren.png','image/png',3497,'png',NULL,'2021-02-04 10:46:38'),(222,177,'iclogo','4278d37e-66d6-11eb-9dbf-42010ab80009','perform.png','image/png',3284,'png',NULL,'2021-02-04 10:46:38'),(223,178,'iclogo','4278eaee-66d6-11eb-8530-42010ab80009','pericom.png','image/png',2311,'png',NULL,'2021-02-04 10:46:38'),(224,179,'iclogo','427903a8-66d6-11eb-8e44-42010ab80009','phaslink.png','image/png',2669,'png',NULL,'2021-02-04 10:46:38'),(225,180,'iclogo','42791b4a-66d6-11eb-936d-42010ab80009','philips.png','image/png',8690,'png',NULL,'2021-02-04 10:46:38'),(226,181,'iclogo','42793670-66d6-11eb-9925-42010ab80009','plx.png','image/png',4749,'png',NULL,'2021-02-04 10:46:38'),(227,182,'iclogo','42794f5c-66d6-11eb-bfd2-42010ab80009','pmc.png','image/png',3497,'png',NULL,'2021-02-04 10:46:38'),(228,183,'iclogo','42796744-66d6-11eb-8591-42010ab80009','pmi.png','image/png',3807,'png',NULL,'2021-02-04 10:46:38'),(229,184,'iclogo','42797efa-66d6-11eb-a083-42010ab80009','ptc.png','image/png',2669,'png',NULL,'2021-02-04 10:46:38'),(230,185,'iclogo','4279b7ee-66d6-11eb-80a4-42010ab80009','pwrsmart.png','image/png',1389,'png',NULL,'2021-02-04 10:46:38'),(231,186,'iclogo','4279cfd6-66d6-11eb-ba44-42010ab80009','qlogic.png','image/png',1709,'png',NULL,'2021-02-04 10:46:38'),(232,187,'iclogo','4279e7b4-66d6-11eb-8282-42010ab80009','qualcomm.png','image/png',3326,'png',NULL,'2021-02-04 10:46:38'),(233,188,'iclogo','4279ff24-66d6-11eb-8ef3-42010ab80009','quality.png','image/png',1309,'png',NULL,'2021-02-04 10:46:38'),(234,189,'iclogo','427a1702-66d6-11eb-8640-42010ab80009','rabbit.png','image/png',2857,'png',NULL,'2021-02-04 10:46:38'),(235,190,'iclogo','427a2ff8-66d6-11eb-a61a-42010ab80009','ramtron.png','image/png',1573,'png',NULL,'2021-02-04 10:46:38'),(236,191,'iclogo','427a4b1e-66d6-11eb-814d-42010ab80009','raytheon.png','image/png',4303,'png',NULL,'2021-02-04 10:46:38'),(237,192,'iclogo','427a641e-66d6-11eb-a84b-42010ab80009','rca.png','image/png',1860,'png',NULL,'2021-02-04 10:46:38'),(238,193,'iclogo','427a7c56-66d6-11eb-95b8-42010ab80009','realtek.png','image/png',2993,'png',NULL,'2021-02-04 10:46:38'),(239,194,'iclogo','427a9452-66d6-11eb-a5a2-42010ab80009','rectron.png','image/png',1691,'png',NULL,'2021-02-04 10:46:38'),(240,195,'iclogo','427aaca8-66d6-11eb-9a0e-42010ab80009','rendit.png','image/png',1370,'png',NULL,'2021-02-04 10:46:38'),(241,196,'iclogo','427ac436-66d6-11eb-8edf-42010ab80009','renesas.png','image/png',8761,'png',NULL,'2021-02-04 10:46:38'),(242,197,'iclogo','427adfac-66d6-11eb-82ec-42010ab80009','rockwell.png','image/png',1704,'png',NULL,'2021-02-04 10:46:38'),(243,198,'iclogo','427af73a-66d6-11eb-bf7e-42010ab80009','rohm.png','image/png',2693,'png',NULL,'2021-02-04 10:46:38'),(244,199,'iclogo','427b0f7c-66d6-11eb-977f-42010ab80009','s3.png','image/png',2189,'png',NULL,'2021-02-04 10:46:38'),(245,200,'iclogo','427b26d8-66d6-11eb-9906-42010ab80009','sage.png','image/png',2735,'png',NULL,'2021-02-04 10:46:38'),(246,201,'iclogo','427b3ef2-66d6-11eb-a871-42010ab80009','saifun.png','image/png',19242,'png',NULL,'2021-02-04 10:46:38'),(247,202,'iclogo','427b6026-66d6-11eb-aca0-42010ab80009','sames.png','image/png',2614,'png',NULL,'2021-02-04 10:46:38'),(248,203,'iclogo','427b782c-66d6-11eb-9ba2-42010ab80009','samsung.png','image/png',1841,'png',NULL,'2021-02-04 10:46:38'),(249,204,'iclogo','427b9064-66d6-11eb-bcb3-42010ab80009','sanken1.png','image/png',2214,'png',NULL,'2021-02-04 10:46:38'),(250,204,'iclogo','427b9a00-66d6-11eb-bd52-42010ab80009','sanken.png','image/png',5309,'png',NULL,'2021-02-04 10:46:38'),(251,205,'iclogo','427bb2ce-66d6-11eb-83a3-42010ab80009','sanyo1.png','image/png',2228,'png',NULL,'2021-02-04 10:46:38'),(252,205,'iclogo','427bbbd4-66d6-11eb-8069-42010ab80009','sanyo.png','image/png',2455,'png',NULL,'2021-02-04 10:46:38'),(253,206,'iclogo','427bd268-66d6-11eb-b8d3-42010ab80009','scenix.png','image/png',1869,'png',NULL,'2021-02-04 10:46:38'),(254,207,'iclogo','427bea28-66d6-11eb-ae9f-42010ab80009','sec1.png','image/png',9392,'png',NULL,'2021-02-04 10:46:38'),(255,207,'iclogo','427bf644-66d6-11eb-80f4-42010ab80009','sec.png','image/png',2051,'png',NULL,'2021-02-04 10:46:38'),(256,208,'iclogo','427c108e-66d6-11eb-b084-42010ab80009','seeq.png','image/png',2903,'png',NULL,'2021-02-04 10:46:38'),(257,209,'iclogo','427c2d30-66d6-11eb-a6ee-42010ab80009','seikoi.png','image/png',1709,'png',NULL,'2021-02-04 10:46:38'),(258,209,'iclogo','427c36cc-66d6-11eb-92d6-42010ab80009','semelab.png','image/png',1709,'png',NULL,'2021-02-04 10:46:38'),(259,210,'iclogo','427c4dba-66d6-11eb-9183-42010ab80009','semtech.png','image/png',1431,'png',NULL,'2021-02-04 10:46:38'),(260,211,'iclogo','427c657a-66d6-11eb-8a7c-42010ab80009','sgs1.png','image/png',2339,'png',NULL,'2021-02-04 10:46:38'),(261,212,'iclogo','427c7dee-66d6-11eb-bb83-42010ab80009','sgs2.png','image/png',1874,'png',NULL,'2021-02-04 10:46:38'),(262,213,'iclogo','427c95c2-66d6-11eb-840f-42010ab80009','sharp.png','image/png',2258,'png',NULL,'2021-02-04 10:46:38'),(263,214,'iclogo','427cae18-66d6-11eb-ad56-42010ab80009','shindgen.png','image/png',1629,'png',NULL,'2021-02-04 10:46:38'),(264,215,'iclogo','427cc588-66d6-11eb-a226-42010ab80009','siemens1.png','image/png',1216,'png',NULL,'2021-02-04 10:46:38'),(265,215,'iclogo','427cce70-66d6-11eb-a910-42010ab80009','siemens2.png','image/png',2916,'png',NULL,'2021-02-04 10:46:38'),(266,216,'iclogo','427ce522-66d6-11eb-be3b-42010ab80009','sierra.png','image/png',2321,'png',NULL,'2021-02-04 10:46:38'),(267,217,'iclogo','427cfe40-66d6-11eb-b191-42010ab80009','sigmatel.png','image/png',1790,'png',NULL,'2021-02-04 10:46:38'),(268,218,'iclogo','427d15d8-66d6-11eb-a134-42010ab80009','signetic.png','image/png',1519,'png',NULL,'2021-02-04 10:46:38'),(269,219,'iclogo','427d2cee-66d6-11eb-b234-42010ab80009','siliconlabs.png','image/png',5540,'png',NULL,'2021-02-04 10:46:38'),(270,220,'iclogo','427d46fc-66d6-11eb-9814-42010ab80009','siliconm.png','image/png',3817,'png',NULL,'2021-02-04 10:46:38'),(271,221,'iclogo','427d5fa2-66d6-11eb-aa90-42010ab80009','silicons.png','image/png',2320,'png',NULL,'2021-02-04 10:46:38'),(272,221,'iclogo','427d68bc-66d6-11eb-9810-42010ab80009','simtek.png','image/png',1874,'png',NULL,'2021-02-04 10:46:38'),(273,222,'iclogo','427d7fdc-66d6-11eb-9d59-42010ab80009','siliconx.png','image/png',2464,'png',NULL,'2021-02-04 10:46:38'),(274,223,'iclogo','427d972e-66d6-11eb-82fc-42010ab80009','silnans.png','image/png',1549,'png',NULL,'2021-02-04 10:46:38'),(275,224,'iclogo','427daf3e-66d6-11eb-a16c-42010ab80009','sipex.png','image/png',4029,'png',NULL,'2021-02-04 10:46:38'),(276,225,'iclogo','427dc7b2-66d6-11eb-b12b-42010ab80009','sis.png','image/png',3608,'png',NULL,'2021-02-04 10:46:38'),(277,226,'iclogo','427ddfcc-66d6-11eb-bb15-42010ab80009','smc1.png','image/png',1763,'png',NULL,'2021-02-04 10:46:38'),(278,227,'iclogo','427e01aa-66d6-11eb-8796-42010ab80009','smsc1.png','image/png',1781,'png',NULL,'2021-02-04 10:46:38'),(279,227,'iclogo','427e0fba-66d6-11eb-b09c-42010ab80009','smsc.png','image/png',2117,'png',NULL,'2021-02-04 10:46:38'),(280,228,'iclogo','427e2734-66d6-11eb-9cbb-42010ab80009','sony.png','image/png',2476,'png',NULL,'2021-02-04 10:46:38'),(281,229,'iclogo','427e3f80-66d6-11eb-b88b-42010ab80009','space.png','image/png',3377,'png',NULL,'2021-02-04 10:46:38'),(282,230,'iclogo','427e5736-66d6-11eb-8110-42010ab80009','spectek.png','image/png',2228,'png',NULL,'2021-02-04 10:46:38'),(283,231,'iclogo','427e7356-66d6-11eb-8db1-42010ab80009','spt.png','image/png',3419,'png',NULL,'2021-02-04 10:46:38'),(284,232,'iclogo','427e8dfa-66d6-11eb-acb2-42010ab80009','sss.png','image/png',1871,'png',NULL,'2021-02-04 10:46:38'),(285,233,'iclogo','427ea628-66d6-11eb-8bc9-42010ab80009','sst.png','image/png',3072,'png',NULL,'2021-02-04 10:46:38'),(286,234,'iclogo','427ebd7a-66d6-11eb-8e45-42010ab80009','st.png','image/png',1604,'png',NULL,'2021-02-04 10:46:38'),(287,235,'iclogo','427ed4fe-66d6-11eb-b1b4-42010ab80009','summit.png','image/png',11440,'png',NULL,'2021-02-04 10:46:38'),(288,236,'iclogo','427eef52-66d6-11eb-b1bd-42010ab80009','synergy.png','image/png',1709,'png',NULL,'2021-02-04 10:46:38'),(289,237,'iclogo','427f07ee-66d6-11eb-b24f-42010ab80009','synertek.png','image/png',1789,'png',NULL,'2021-02-04 10:46:38'),(290,238,'iclogo','427f2026-66d6-11eb-9daa-42010ab80009','taiwsemi.png','image/png',1475,'png',NULL,'2021-02-04 10:46:38'),(291,239,'iclogo','427f370a-66d6-11eb-b2cb-42010ab80009','tdk.png','image/png',3687,'png',NULL,'2021-02-04 10:46:38'),(292,240,'iclogo','427f4ea2-66d6-11eb-9955-42010ab80009','teccor.png','image/png',1869,'png',NULL,'2021-02-04 10:46:38'),(293,241,'iclogo','427f65ae-66d6-11eb-994e-42010ab80009','telcom.png','image/png',2555,'png',NULL,'2021-02-04 10:46:38'),(294,242,'iclogo','427f7e7c-66d6-11eb-84a8-42010ab80009','teledyne.png','image/png',1904,'png',NULL,'2021-02-04 10:46:38'),(295,243,'iclogo','427f9556-66d6-11eb-a04d-42010ab80009','telefunk.png','image/png',2715,'png',NULL,'2021-02-04 10:46:38'),(296,244,'iclogo','427fac6c-66d6-11eb-bb6c-42010ab80009','teltone.png','image/png',4303,'png',NULL,'2021-02-04 10:46:38'),(297,245,'iclogo','427fc6d4-66d6-11eb-8a8e-42010ab80009','thomscsf.png','image/png',1874,'png',NULL,'2021-02-04 10:46:38'),(298,246,'iclogo','427fddc2-66d6-11eb-b9d2-42010ab80009','ti1.png','image/png',1869,'png',NULL,'2021-02-04 10:46:38'),(299,246,'iclogo','427fe6f0-66d6-11eb-9b84-42010ab80009','ti.png','image/png',1789,'png',NULL,'2021-02-04 10:46:38'),(300,247,'iclogo','427ffcd0-66d6-11eb-a537-42010ab80009','toko.png','image/png',1907,'png',NULL,'2021-02-04 10:46:38'),(301,248,'iclogo','428014ae-66d6-11eb-80dd-42010ab80009','toshiba1.png','image/png',1922,'png',NULL,'2021-02-04 10:46:38'),(302,248,'iclogo','42801d6e-66d6-11eb-b1ea-42010ab80009','toshiba2.png','image/png',1309,'png',NULL,'2021-02-04 10:46:38'),(303,248,'iclogo','428025e8-66d6-11eb-8c66-42010ab80009','toshiba3.png','image/png',2269,'png',NULL,'2021-02-04 10:46:38'),(304,249,'iclogo','42803c7c-66d6-11eb-8dd8-42010ab80009','trident.png','image/png',1414,'png',NULL,'2021-02-04 10:46:38'),(305,250,'iclogo','428054be-66d6-11eb-a68e-42010ab80009','triquint.png','image/png',2294,'png',NULL,'2021-02-04 10:46:38'),(306,251,'iclogo','42806bac-66d6-11eb-91f0-42010ab80009','triscend.png','image/png',4521,'png',NULL,'2021-02-04 10:46:38'),(307,252,'iclogo','42808484-66d6-11eb-892c-42010ab80009','tseng.png','image/png',1466,'png',NULL,'2021-02-04 10:46:38'),(308,253,'iclogo','42809cb2-66d6-11eb-a663-42010ab80009','tundra.png','image/png',1709,'png',NULL,'2021-02-04 10:46:38'),(309,254,'iclogo','4280b3aa-66d6-11eb-9ccc-42010ab80009','turbo_ic.png','image/png',7784,'png',NULL,'2021-02-04 10:46:38'),(310,255,'iclogo','4280ce3a-66d6-11eb-b990-42010ab80009','ubicom.png','image/png',2047,'png',NULL,'2021-02-04 10:46:38'),(311,256,'iclogo','4280e578-66d6-11eb-8710-42010ab80009','umc.png','image/png',3032,'png',NULL,'2021-02-04 10:46:38'),(312,257,'iclogo','4280fe78-66d6-11eb-8cbf-42010ab80009','unitrode.png','image/png',1309,'png',NULL,'2021-02-04 10:46:38'),(313,258,'iclogo','42811566-66d6-11eb-a800-42010ab80009','usar1.png','image/png',2771,'png',NULL,'2021-02-04 10:46:38'),(314,258,'iclogo','42811e3a-66d6-11eb-bb4a-42010ab80009','usar.png','image/png',2793,'png',NULL,'2021-02-04 10:46:38'),(315,259,'iclogo','428136f4-66d6-11eb-ac70-42010ab80009','utmc.png','image/png',2047,'png',NULL,'2021-02-04 10:46:38'),(316,260,'iclogo','42814e64-66d6-11eb-bca4-42010ab80009','utron.png','image/png',2047,'png',NULL,'2021-02-04 10:46:38'),(317,261,'iclogo','428165c0-66d6-11eb-9ec5-42010ab80009','v3.png','image/png',3248,'png',NULL,'2021-02-04 10:46:38'),(318,262,'iclogo','42818082-66d6-11eb-bb06-42010ab80009','vadem.png','image/png',1874,'png',NULL,'2021-02-04 10:46:38'),(319,263,'iclogo','42819978-66d6-11eb-a1ab-42010ab80009','vanguard.png','image/png',1454,'png',NULL,'2021-02-04 10:46:38'),(320,264,'iclogo','4281b066-66d6-11eb-983b-42010ab80009','vantis.png','image/png',1475,'png',NULL,'2021-02-04 10:46:38'),(321,265,'iclogo','4281c808-66d6-11eb-bc4f-42010ab80009','via.png','image/png',1922,'png',NULL,'2021-02-04 10:46:38'),(322,266,'iclogo','4281e018-66d6-11eb-9911-42010ab80009','virata.png','image/png',3764,'png',NULL,'2021-02-04 10:46:38'),(323,267,'iclogo','4281f864-66d6-11eb-aacb-42010ab80009','vishay.png','image/png',4410,'png',NULL,'2021-02-04 10:46:38'),(324,268,'iclogo','4282107e-66d6-11eb-a02a-42010ab80009','vistech.png','image/png',1942,'png',NULL,'2021-02-04 10:46:38'),(325,269,'iclogo','42822c94-66d6-11eb-85ea-42010ab80009','vitelic.png','image/png',1691,'png',NULL,'2021-02-04 10:46:38'),(326,270,'iclogo','42824576-66d6-11eb-b7d2-42010ab80009','vlsi.png','image/png',1874,'png',NULL,'2021-02-04 10:46:38'),(327,271,'iclogo','42825d7c-66d6-11eb-a9da-42010ab80009','volterra.png','image/png',2029,'png',NULL,'2021-02-04 10:46:38'),(328,272,'iclogo','428274a6-66d6-11eb-b96b-42010ab80009','vtc.png','image/png',2223,'png',NULL,'2021-02-04 10:46:38'),(329,273,'iclogo','42828c3e-66d6-11eb-b555-42010ab80009','wafscale.png','image/png',2985,'png',NULL,'2021-02-04 10:46:38'),(330,274,'iclogo','4282a386-66d6-11eb-a460-42010ab80009','wdc1.png','image/png',1784,'png',NULL,'2021-02-04 10:46:38'),(331,274,'iclogo','4282ade0-66d6-11eb-ba61-42010ab80009','wdc2.png','image/png',1403,'png',NULL,'2021-02-04 10:46:38'),(332,275,'iclogo','4282c4b0-66d6-11eb-ae19-42010ab80009','weitek.png','image/png',1468,'png',NULL,'2021-02-04 10:46:38'),(333,276,'iclogo','4282dba8-66d6-11eb-834d-42010ab80009','winbond.png','image/png',5402,'png',NULL,'2021-02-04 10:46:38'),(334,277,'iclogo','4282f44e-66d6-11eb-ac71-42010ab80009','wolf.png','image/png',2343,'png',NULL,'2021-02-04 10:46:38'),(335,278,'iclogo','42830ac4-66d6-11eb-9e86-42010ab80009','xemics.png','image/png',2029,'png',NULL,'2021-02-04 10:46:38'),(336,279,'iclogo','42832202-66d6-11eb-b3b5-42010ab80009','xicor1.png','image/png',1259,'png',NULL,'2021-02-04 10:46:38'),(337,279,'iclogo','42832c02-66d6-11eb-b477-42010ab80009','xicor.png','image/png',3389,'png',NULL,'2021-02-04 10:46:38'),(338,280,'iclogo','42834214-66d6-11eb-b7dd-42010ab80009','xilinx.png','image/png',4186,'png',NULL,'2021-02-04 10:46:38'),(339,281,'iclogo','42835a24-66d6-11eb-8193-42010ab80009','yamaha.png','image/png',1779,'png',NULL,'2021-02-04 10:46:38'),(340,282,'iclogo','42837432-66d6-11eb-b99c-42010ab80009','zetex.png','image/png',1255,'png',NULL,'2021-02-04 10:46:38'),(341,283,'iclogo','42838abc-66d6-11eb-982d-42010ab80009','zilog1.png','image/png',1958,'png',NULL,'2021-02-04 10:46:38'),(342,283,'iclogo','42839372-66d6-11eb-b8e2-42010ab80009','zilog2.png','image/png',2204,'png',NULL,'2021-02-04 10:46:38'),(343,283,'iclogo','42839be2-66d6-11eb-8ef1-42010ab80009','zilog3.png','image/png',2614,'png',NULL,'2021-02-04 10:46:38'),(344,283,'iclogo','4283a2a4-66d6-11eb-9cb0-42010ab80009','zilog4.png','image/png',2405,'png',NULL,'2021-02-04 10:46:38'),(345,284,'iclogo','4283b9ce-66d6-11eb-9376-42010ab80009','zmda.png','image/png',3709,'png',NULL,'2021-02-04 10:46:38'),(346,285,'iclogo','4283d148-66d6-11eb-beaf-42010ab80009','zoran.png','image/png',2784,'png',NULL,'2021-02-04 10:46:38');
/*!40000 ALTER TABLE `ManufacturerICLogo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MetaPartParameterCriteria`
--

DROP TABLE IF EXISTS `MetaPartParameterCriteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MetaPartParameterCriteria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `part_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `partParameterName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `operator` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` double DEFAULT NULL,
  `normalizedValue` double DEFAULT NULL,
  `stringValue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `valueType` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `siPrefix_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6EE1D3924CE34BEC` (`part_id`),
  KEY `IDX_6EE1D39219187357` (`siPrefix_id`),
  KEY `IDX_6EE1D392F8BD700D` (`unit_id`),
  CONSTRAINT `FK_6EE1D39219187357` FOREIGN KEY (`siPrefix_id`) REFERENCES `SiPrefix` (`id`),
  CONSTRAINT `FK_6EE1D3924CE34BEC` FOREIGN KEY (`part_id`) REFERENCES `Part` (`id`),
  CONSTRAINT `FK_6EE1D392F8BD700D` FOREIGN KEY (`unit_id`) REFERENCES `Unit` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MetaPartParameterCriteria`
--

LOCK TABLES `MetaPartParameterCriteria` WRITE;
/*!40000 ALTER TABLE `MetaPartParameterCriteria` DISABLE KEYS */;
/*!40000 ALTER TABLE `MetaPartParameterCriteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Part`
--

DROP TABLE IF EXISTS `Part`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Part` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `footprint_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` longtext COLLATE utf8_unicode_ci NOT NULL,
  `stockLevel` int(11) NOT NULL,
  `minStockLevel` int(11) NOT NULL,
  `averagePrice` decimal(13,4) NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `needsReview` tinyint(1) NOT NULL,
  `partCondition` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `productionRemarks` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `internalPartNumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `removals` tinyint(1) NOT NULL,
  `lowStock` tinyint(1) NOT NULL,
  `metaPart` tinyint(1) NOT NULL DEFAULT '0',
  `partUnit_id` int(11) DEFAULT NULL,
  `storageLocation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E93DDFF812469DE2` (`category_id`),
  KEY `IDX_E93DDFF851364C98` (`footprint_id`),
  KEY `IDX_E93DDFF8F7A36E87` (`partUnit_id`),
  KEY `IDX_E93DDFF873CD58AF` (`storageLocation_id`),
  CONSTRAINT `FK_E93DDFF812469DE2` FOREIGN KEY (`category_id`) REFERENCES `PartCategory` (`id`),
  CONSTRAINT `FK_E93DDFF851364C98` FOREIGN KEY (`footprint_id`) REFERENCES `Footprint` (`id`),
  CONSTRAINT `FK_E93DDFF873CD58AF` FOREIGN KEY (`storageLocation_id`) REFERENCES `StorageLocation` (`id`),
  CONSTRAINT `FK_E93DDFF8F7A36E87` FOREIGN KEY (`partUnit_id`) REFERENCES `PartUnit` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Part`
--

LOCK TABLES `Part` WRITE;
/*!40000 ALTER TABLE `Part` DISABLE KEYS */;
INSERT INTO `Part` VALUES (1,49,NULL,'Super Capacitor 4 F / 5.5 V','Diameter = 24.6 mm. Tebal = 6 mm. Temperatur kerja : - 40 °C ~ + 70 °C. Siklus Umur : 1.2 juta x charge dan discharge.','',4,0,0.0000,'',0,'','','2021-02-08 03:47:16','',0,0,0,1,74),(2,93,NULL,'CONN HEADER R/A 8POS 2.5MM','','',8,0,0.0000,'',0,'','','2021-02-08 04:11:06','',0,0,0,1,79),(3,22,NULL,'IC MCU 32BIT 25KB FLASH 64LQFP','','',4,0,0.0000,'',0,'','','2021-02-08 04:13:36','',0,0,0,1,79),(4,20,NULL,'FIXED IND 15NH 300MA 320 MOHM','','',10,0,0.0000,'',0,'','','2021-02-08 04:15:13','',0,0,0,1,79),(5,48,37,'CAP CER 1UF 16V X7R 0603','','',3,0,0.0000,'',0,'','','2021-02-08 04:16:45','',0,0,0,1,79),(6,24,38,'FERRITE BEAD 40 OHM 0805 1LN','','',20,0,0.0000,'',0,'','','2021-02-08 04:24:13','',0,0,0,1,79),(7,48,37,'CAP CER 10uF 50V X5R ','','',12,0,0.0000,'',0,'','','2021-02-08 04:26:24','',0,0,0,1,79),(8,93,NULL,'CONN HEADER R/A 20POS 2.54MM','','',4,0,0.0000,'',0,'','','2021-02-08 04:27:33','',0,0,0,1,79),(9,93,NULL,'CONN HEADER R/A 6POS 2.5MM','','',10,0,0.0000,'',0,'','','2021-02-08 04:28:33','',0,0,0,1,79),(10,25,NULL,'TVS DIODE 5V 12V DSN1608-2','','',24,0,0.0000,'',0,'','','2021-02-08 04:30:50','',0,0,0,1,79),(11,49,NULL,'CAP ALUM 680uF 20% 100V RADIAL','','',3,0,0.0000,'',0,'','','2021-02-08 04:32:07','',0,0,0,1,79),(12,64,NULL,'CONN RCPT USB2.0 MINI B SMD R/A','','',9,0,0.0000,'',0,'','','2021-02-08 04:33:42','',0,0,0,1,79),(13,17,NULL,'SWITCH TACTILE SPST-NO 0.05A 24V','','',8,0,0.0000,'',0,'','','2021-02-08 04:35:12','',0,0,0,1,79),(14,1,NULL,'AUTOMOTIVE QUALIFIED SIMPLE SWIT','','',25,0,0.0000,'',0,'','','2021-02-08 04:36:46','',0,0,0,1,79),(15,22,NULL,'IC AMP LTE 1.2GHZ-2.2GHZ 16SMT','','',2,0,0.0000,'',0,'','','2021-02-08 04:38:01','',0,0,0,1,79),(16,48,40,'CAP CER 220PF 50V C0G/NP0 0603','','',5,0,0.0000,'',0,'','','2021-02-08 04:41:07','',0,0,0,1,79),(17,48,NULL,'CAP CER 10uF 6.3V X5R 1206','','',30,0,0.0000,'',0,'','','2021-02-08 04:42:48','',0,0,0,1,79),(18,20,40,'FIXED IND 6.8NH 430MA 250 MOHM','','',8,0,0.0000,'',0,'','','2021-02-08 04:44:15','',0,0,0,1,79),(19,48,38,'CAP CER 8.2PF 250V C0G/NP0 ','','',6,0,0.0000,'',0,'','','2021-02-08 04:45:56','',0,0,0,1,79),(21,26,NULL,'RF DIR COUPLER 1.4GHZ-2GHZ SMD','','',1,0,0.0000,'',0,'','','2021-02-08 04:49:19','',0,0,0,1,79),(22,9,37,'RES SMD 4.7K OHM 1% 1/4W ','','',12,0,0.0000,'',0,'','','2021-02-08 04:50:34','',0,0,0,1,79),(23,48,38,'CAP CER 0.47UF 16V X7R','','',8,0,0.0000,'',0,'','','2021-02-08 04:54:08','',0,0,0,1,79),(24,48,38,'CAP CER 0.3PF 250V C0G/NP0 ','','',6,0,0.0000,'',0,'','','2021-02-08 04:56:15','',0,0,0,1,79),(25,9,40,'RES SMD 470 OHM 5% 1/10W ','','',53,0,0.0000,'',0,'','','2021-02-08 04:57:27','',0,0,0,1,79),(26,22,NULL,'A2120D040N','','',2,0,0.0000,'',0,'','','2021-02-08 05:00:53','',0,0,0,1,79),(27,22,NULL,'IC REG LIN POS ADJ 800MA SOT223','LM1117IMP-ADJ/NOPB','',4,0,0.0000,'',0,'','','2021-02-08 05:03:02','',0,0,0,1,79),(28,93,NULL,'CONN HEADER SMD 80POS 2MM','','',15,0,0.0000,'',0,'','','2021-02-08 05:04:33','',0,0,0,1,79),(29,9,NULL,'RES SMD 50 OHM 2% 10W ','','',1,0,0.0000,'',0,'','','2021-02-08 05:06:35','',0,0,0,1,79),(30,9,40,'RES 121 OHM 1% 1/10W ','','',100,0,0.0000,'',0,'','','2021-02-08 05:07:37','',0,0,0,1,79),(31,1,NULL,'CMC 15A 2LN 60 OHM SMD ','','',6,0,0.0000,'',0,'','','2021-02-08 05:08:46','',0,0,0,1,79),(32,9,40,'100K 1% 1/10W 100ppm ','','',75,0,0.0000,'',0,'','','2021-02-08 06:05:21','',0,0,0,1,80),(33,9,40,'2.2K 1% 1/10W 100ppm','','',70,0,0.0000,'',0,'','','2021-02-08 06:06:51','',0,0,0,1,80),(34,9,40,'15K 1% 1/10W ','','',70,0,0.0000,'',0,'','','2021-02-08 06:08:21','',0,0,0,1,80),(35,48,38,'4.7uF 10% 25V X5R MULTIL','','',70,0,0.0000,'',0,'','','2021-02-08 06:10:29','',0,0,0,1,80),(37,9,43,'0.002 Ω 1% 2W 275ppm','','',10,0,0.0000,'',0,'','','2021-02-08 06:16:39','',0,0,0,1,80),(38,48,40,'16uF 5% 50V C0G Multila','','',70,0,0.0000,'',0,'','','2021-02-08 06:19:17','',0,0,0,1,80),(39,27,NULL,'NPM-Pre-Biased 100mA 50V 200mW ','','',50,0,0.0000,'',0,'','','2021-02-08 06:23:29','',0,0,0,1,80),(40,20,44,'4.7uH ','20% 450mA 260mΩ Power Inductor','',10,0,0.0000,'',0,'','','2021-02-08 06:26:14','',0,0,0,1,80),(41,9,NULL,'86.6kΩ','1% ±0.1W ±100ppm','',180,0,0.0000,'',0,'','','2021-02-08 06:29:02','',0,0,0,1,80),(43,74,NULL,'Fuse Holders RoHS','','',10,0,0.0000,'',0,'','','2021-02-08 06:32:36','',0,0,0,1,80),(44,48,40,'10nF ','±10% 50V X7R Multilayer','',70,0,0.0000,'',0,'','','2021-02-08 06:34:20','',0,0,0,1,80),(45,48,45,'100uF','±20% 6.3V 5 Ω @ 100kHz ','',80,0,0.0000,'',0,'','','2021-02-08 06:37:31','',0,0,0,1,80),(46,48,40,'33pF','±5% 50V C0G','',80,0,0.0000,'',0,'','','2021-02-08 06:40:34','',0,0,0,1,80),(47,48,40,'100pF ','±5% 50V C0G ','',180,0,0.0000,'',0,'','','2021-02-08 06:41:55','',0,0,0,1,80),(48,94,NULL,'SIM Card ','6 connector SMD Card Sockets ','',10,0,0.0000,'',0,'','','2021-02-08 06:43:52','',0,0,0,1,80),(50,48,42,'3.9pF','±0.25pF 50V','',80,0,0.0000,'',0,'','','2021-02-08 06:47:22','',0,0,0,1,80),(51,48,42,'2.4pF ','±0.25pF 50V','',80,0,0.0000,'',0,'','','2021-02-08 06:50:01','',0,0,0,1,80),(52,48,40,'1uF ','±10% 50V X5R ','',70,0,0.0000,'',0,'','','2021-02-08 06:51:45','',0,0,0,1,80),(53,9,40,'10K','±5% 1/10W ±200ppm','',80,0,0.0000,'',0,'','','2021-02-08 06:53:10','',0,0,0,1,80),(54,9,40,'442 Ω','±1% 1/10W ±100ppm ','',80,0,0.0000,'',0,'','','2021-02-08 06:54:45','',0,0,0,1,80),(55,9,40,'11K','±1% 1/10W ±100ppm','',80,0,0.0000,'',0,'','','2021-02-08 06:56:04','',0,0,0,1,80),(56,9,42,'22Ω','±1% 1/16W ±200ppm ','',70,0,0.0000,'',0,'','','2021-02-08 06:57:59','',0,0,0,1,80),(57,48,NULL,'10uF','±10% 10V 1.8 Ω','',8,0,0.0000,'',0,'','','2021-02-08 06:59:49','',0,0,0,1,80),(58,20,40,'47nH ','±5% 300mA 700mΩ','',80,0,0.0000,'',0,'','','2021-02-08 07:02:09','',0,0,0,1,80),(59,95,NULL,'5201','Battery Accessories/Contacts/Springs RoHS','',10,0,0.0000,'',0,'','','2021-02-08 07:04:02','',0,0,0,1,80),(60,95,NULL,'5223','Battery Accessories/Contacts/Springs RoHS','',10,0,0.0000,'',0,'','','2021-02-08 07:05:40','',0,0,0,1,80),(61,48,42,'3.3nF','±10% 50V X7R ','',70,0,0.0000,'',0,'','','2021-02-08 07:07:24','',0,0,0,1,80),(62,22,NULL,'INA219AIDR','High Side 0V~26V 3V~5.5V SOIC','',10,0,0.0000,'',0,'','','2021-02-08 07:09:45','',0,0,0,1,80),(63,25,NULL,'40V 3A 550mV @ 3A SMA(DO-214AC)','','',160,0,0.0000,'',0,'','','2021-02-08 07:17:46','',0,0,0,1,81),(64,94,NULL,'KH-SIM1616-6PIN','Card Sockets Connectors RoHS','',5,0,0.0000,'',0,'','','2021-02-08 07:19:53','',0,0,0,1,81),(65,48,38,'22uF ','±20% 25V X5R','',9,0,0.0000,'',0,'','','2021-02-08 07:21:26','',0,0,0,1,80),(66,9,40,'6.34K','±1% 1/10W ','',300,0,0.0000,'',0,'','','2021-02-08 07:23:06','',0,0,0,1,81),(67,29,NULL,'ZMCT103C','','',3,0,0.0000,'',0,'','','2021-02-08 07:24:54','',0,0,0,1,81),(68,22,NULL,'TSSOP-14 Gates and Inverters RoHS','','',150,0,0.0000,'',0,'','','2021-02-08 07:26:17','',0,0,0,1,81),(69,9,40,'10.7K','±1% 1/10W ','',300,0,0.0000,'',0,'','','2021-02-08 07:27:24','',0,0,0,1,81),(70,43,40,'Yellow','585.5~591.5nm Light Emitting','',11,0,0.0000,'',0,'','','2021-02-08 07:29:22','',0,0,0,1,80),(71,44,NULL,'Top View Through  Hole Light Emitting Diodes','','',20,0,0.0000,'',0,'','','2021-02-08 07:31:41','',0,0,0,1,81),(72,9,40,'0.56Ω Ohm','±1% 1/10W ','',600,0,0.0000,'',0,'','','2021-02-08 07:33:25','',0,0,0,1,81),(73,9,NULL,'Variable Resistors RoHS','±25% ±250ppm SMD','',150,0,0.0000,'',0,'','','2021-02-08 07:35:20','',0,0,0,1,81),(74,9,42,'4.02K','±1% 1/16W ','',200,0,0.0000,'',0,'','','2021-02-08 07:36:49','',0,0,0,1,81),(75,66,NULL,'XH Header Male P=2.5mm','MALE PIN 0.098\"(2.50mm) ','',250,0,0.0000,'',0,'','','2021-02-08 09:23:37','',0,0,0,1,81),(76,83,NULL,'NSD10-48S12','DC-DC Converter Open frame; Input 22-72Vdc; Output 12Vdc at 0.83A','',3,0,0.0000,'',0,'','','2021-02-09 03:29:38','',0,0,0,1,84),(77,83,NULL,'Hi-Link  12v DC 0.25A','HLK-PM12 100V~240VAC Converter to 12V DC 0.25A','',1,0,0.0000,'',0,'','','2021-02-09 03:34:23','',0,0,0,1,84),(78,83,NULL,'TESLA 12VDC / 250mA','HLK-12 85~265VAC 50/60HZ  Converter to 12VDC / 250mA','',1,0,0.0000,'',0,'','','2021-02-09 03:39:00','',0,0,0,1,84),(79,83,NULL,'Hi-Link 3.3VDC 1A','HLK-PM03 100~240VAC 50/60HZ  Converter to 3.3VDC / 1A','',2,0,0.0000,'',0,'','','2021-02-09 03:44:41','',0,0,0,1,84),(80,83,NULL,'Hi-Link 5VDC 0.6A','HLK-PM01 100~240VAC 50/60HZ  Converter to 5VDC / 0.6A','',1,0,0.0000,'',0,'','','2021-02-09 03:46:20','',0,0,0,1,84),(81,85,NULL,'SRD-24VDC-SL-C','RELAY SONGLE 24V 10A SRD-05VDC-SL-C 5 PIN 5P','',2,0,0.0000,'',0,'','','2021-02-09 03:51:59','',0,0,0,1,84),(82,85,NULL,'SRD-05VDC-SL-C ','RELAY SONGLE 5V 10A SRD-05VDC-SL-C 5 PIN 5P','',1,0,0.0000,'',0,'','','2021-02-09 03:54:36','',0,0,0,1,84),(83,87,NULL,'Oscilloscope','','',1,0,0.0000,'OK',0,'','','2021-02-09 04:12:07','',0,0,0,1,86),(84,88,NULL,'ATPRO 858D','','',1,0,0.0000,'OK',0,'','','2021-02-09 04:18:17','',0,0,0,1,86),(85,87,NULL,'Generator Power Supplay','','',1,0,0.0000,'OK',0,'','','2021-02-09 04:23:19','',0,0,0,1,86),(86,87,NULL,'TANG AMPERE','DIGITAL CLAMP MATER','',1,0,0.0000,'OK',0,'','','2021-02-09 04:35:03','',0,0,0,1,86),(87,87,NULL,'3D PRINTERS ARILLERY ','','',1,0,0.0000,'OK',0,'','','2021-02-09 04:37:09','',0,0,0,1,86),(88,87,NULL,'Oven PCB','Reflow Soldering Machine','',1,0,0.0000,'OK',0,'','','2021-02-09 04:49:41','',0,0,0,1,86),(89,90,NULL,'GNSS ','GPS SMD Communication Modules/ GNSS Modules','',6,0,0.0000,'',0,'','','2021-02-09 05:00:52','',0,0,0,1,81),(90,93,NULL,'CONN HEADER 5 POS','','',50,0,0.0000,'',0,'','','2021-02-10 03:59:33','',0,0,0,1,91),(91,93,NULL,'CONN HEADER 4 POS','','',45,0,0.0000,'',0,'','','2021-02-10 04:04:17','',0,0,0,1,99),(92,93,NULL,'CONN FFC PFC','10POS 0.50MM R/A & 30POS 1MM R/A','',25,0,0.0000,'',0,'','','2021-02-10 04:08:45','',0,0,0,1,113),(93,93,NULL,'CONN HEADER 2-15 PIN','XHP 2PIN R/A, CONN HEADER MALE 4POS,  CONN HEADER MALE 6POS','',25,0,0.0000,'',0,'','','2021-02-10 04:15:25','',0,0,0,1,126),(94,93,NULL,'CONN HEADER VERT 16POS GOLD','','',10,0,0.0000,'',0,'','','2021-02-10 04:18:26','',0,0,0,1,136),(95,93,NULL,'RCPT HOUSING  (4 & 5 POS)','','',50,0,0.0000,'',0,'','','2021-02-10 04:22:59','',0,0,0,1,3),(96,93,NULL,'CONN RCPT ','CONN RCPT PCB 19POS & CONN Lo Pro 2mm 14 POS  R/A','',6,0,0.0000,'',0,'','','2021-02-10 06:43:09','',0,0,0,1,101),(97,93,NULL,'CONN PLUG RCPT 6POS 1.2mm HOUSING','','',14,0,0.0000,'',0,'','','2021-02-10 10:24:19','',0,0,0,1,116),(98,93,NULL,'CONN N MALE TO SMA FAMALE ','','',2,0,0.0000,'',0,'','','2021-02-10 10:26:45','',0,0,0,1,124);
/*!40000 ALTER TABLE `Part` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PartAttachment`
--

DROP TABLE IF EXISTS `PartAttachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PartAttachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `part_id` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `originalname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mimetype` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `extension` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `created` datetime NOT NULL,
  `isImage` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_76D73D864CE34BEC` (`part_id`),
  CONSTRAINT `FK_76D73D864CE34BEC` FOREIGN KEY (`part_id`) REFERENCES `Part` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PartAttachment`
--

LOCK TABLES `PartAttachment` WRITE;
/*!40000 ALTER TABLE `PartAttachment` DISABLE KEYS */;
INSERT INTO `PartAttachment` VALUES (1,86,'PartAttachment','2d980f66-6a90-11eb-9eb1-42010ab80009','photo_2021-02-09_11-30-17.jpg','image/jpeg',65256,'',NULL,'2021-02-09 04:35:03',NULL),(2,84,'PartAttachment','48dc945e-6a90-11eb-987f-42010ab80009','photo_2021-02-09_11-15-03.jpg','image/jpeg',124633,'',NULL,'2021-02-09 04:35:49',NULL);
/*!40000 ALTER TABLE `PartAttachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PartCategory`
--

DROP TABLE IF EXISTS `PartCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PartCategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `lft` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `lvl` int(11) NOT NULL,
  `root` int(11) DEFAULT NULL,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `categoryPath` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_131FB619727ACA70` (`parent_id`),
  KEY `IDX_131FB619DA439252` (`lft`),
  KEY `IDX_131FB619D5E02D69` (`rgt`),
  CONSTRAINT `FK_131FB619727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `PartCategory` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PartCategory`
--

LOCK TABLES `PartCategory` WRITE;
/*!40000 ALTER TABLE `PartCategory` DISABLE KEYS */;
INSERT INTO `PartCategory` VALUES (1,NULL,1,170,0,1,'Root Category',NULL,'Root Category'),(4,1,16,49,1,1,'1 Active Components','','Root Category ➤ 1 Active Components'),(5,31,18,21,3,1,'Integrated Circuits','','Root Category ➤ 1 Active Components ➤ Semiconductors ➤ Integrated Circuits'),(6,1,2,15,1,1,'Microcontrollers','','Root Category ➤ Microcontrollers'),(8,1,50,89,1,1,'2 Passive Components','','Root Category ➤ 2 Passive Components'),(9,8,51,58,2,1,'Resistors','','Root Category ➤ 2 Passive Components ➤ Resistors'),(10,8,59,70,2,1,'Capacitors','','Root Category ➤ 2 Passive Components ➤ Capacitors'),(11,1,90,99,1,1,'Tools ','','Root Category ➤ Tools '),(12,87,94,97,3,1,'Soldering','','Root Category ➤ Tools  ➤ Electronics ➤ Soldering'),(13,11,91,92,2,1,'Perkakas','','Root Category ➤ Tools  ➤ Perkakas'),(16,1,100,157,1,1,'Electromechanical Components','','Root Category ➤ Electromechanical Components'),(17,16,111,118,2,1,'Switches and Button','','Root Category ➤ Electromechanical Components ➤ Switches and Button'),(19,16,119,152,2,1,'Connectors','','Root Category ➤ Electromechanical Components ➤ Connectors'),(20,8,71,72,2,1,'Inductors','','Root Category ➤ 2 Passive Components ➤ Inductors'),(22,8,73,74,2,1,'IC','','Root Category ➤ 2 Passive Components ➤ IC'),(23,8,75,76,2,1,'CHIP','','Root Category ➤ 2 Passive Components ➤ CHIP'),(24,8,77,78,2,1,'Ferrite Bead','','Root Category ➤ 2 Passive Components ➤ Ferrite Bead'),(25,31,22,23,3,1,'Diodes','','Root Category ➤ 1 Active Components ➤ Semiconductors ➤ Diodes'),(26,8,79,80,2,1,'RF','','Root Category ➤ 2 Passive Components ➤ RF'),(27,31,24,31,3,1,'Transistor','','Root Category ➤ 1 Active Components ➤ Semiconductors ➤ Transistor'),(29,16,107,108,2,1,'Transformers','','Root Category ➤ Electromechanical Components ➤ Transformers'),(30,41,34,41,3,1,'LED','','Root Category ➤ 1 Active Components ➤ Optoelectronics ➤ LED'),(31,4,17,32,2,1,'Semiconductors','','Root Category ➤ 1 Active Components ➤ Semiconductors'),(32,5,19,20,4,1,'ADC,DAC','','Root Category ➤ 1 Active Components ➤ Semiconductors ➤ Integrated Circuits ➤ ADC,DAC'),(33,86,12,13,3,1,'Arduino','','Root Category ➤ Microcontrollers ➤ Development Boards ➤ Arduino'),(34,86,6,11,3,1,'ESP','','Root Category ➤ Microcontrollers ➤ Development Boards ➤ ESP'),(35,86,4,5,3,1,'STM32','','Root Category ➤ Microcontrollers ➤ Development Boards ➤ STM32'),(36,34,7,8,4,1,'ESP32/32PICO','','Root Category ➤ Microcontrollers ➤ Development Boards ➤ ESP ➤ ESP32/32PICO'),(37,34,9,10,4,1,'ESP8266/NODE MCU','','Root Category ➤ Microcontrollers ➤ Development Boards ➤ ESP ➤ ESP8266/NODE MCU'),(38,27,25,26,4,1,'NPN','','Root Category ➤ 1 Active Components ➤ Semiconductors ➤ Transistor ➤ NPN'),(39,27,27,28,4,1,'PNP','','Root Category ➤ 1 Active Components ➤ Semiconductors ➤ Transistor ➤ PNP'),(40,27,29,30,4,1,'MOSFET','','Root Category ➤ 1 Active Components ➤ Semiconductors ➤ Transistor ➤ MOSFET'),(41,4,33,48,2,1,'Optoelectronics','','Root Category ➤ 1 Active Components ➤ Optoelectronics'),(42,30,35,36,4,1,'Module','','Root Category ➤ 1 Active Components ➤ Optoelectronics ➤ LED ➤ Module'),(43,30,37,38,4,1,'SMD','','Root Category ➤ 1 Active Components ➤ Optoelectronics ➤ LED ➤ SMD'),(44,30,39,40,4,1,'Through hole','','Root Category ➤ 1 Active Components ➤ Optoelectronics ➤ LED ➤ Through hole'),(45,41,42,47,3,1,'LCD','','Root Category ➤ 1 Active Components ➤ Optoelectronics ➤ LCD'),(46,45,43,44,4,1,'Text','','Root Category ➤ 1 Active Components ➤ Optoelectronics ➤ LCD ➤ Text'),(47,45,45,46,4,1,'Graphich','','Root Category ➤ 1 Active Components ➤ Optoelectronics ➤ LCD ➤ Graphich'),(48,53,61,62,4,1,'SMD','','Root Category ➤ 2 Passive Components ➤ Capacitors ➤ Ceramic ➤ SMD'),(49,54,67,68,4,1,'Through hole','','Root Category ➤ 2 Passive Components ➤ Capacitors ➤ Tantal ➤ Through hole'),(50,9,52,53,3,1,'Power Resistors','','Root Category ➤ 2 Passive Components ➤ Resistors ➤ Power Resistors'),(51,9,54,55,3,1,'SMD','','Root Category ➤ 2 Passive Components ➤ Resistors ➤ SMD'),(52,9,56,57,3,1,'Through hole','','Root Category ➤ 2 Passive Components ➤ Resistors ➤ Through hole'),(53,10,60,63,3,1,'Ceramic','','Root Category ➤ 2 Passive Components ➤ Capacitors ➤ Ceramic'),(54,10,64,69,3,1,'Tantal','','Root Category ➤ 2 Passive Components ➤ Capacitors ➤ Tantal'),(55,54,65,66,4,1,'SMD','','Root Category ➤ 2 Passive Components ➤ Capacitors ➤ Tantal ➤ SMD'),(56,8,81,86,2,1,'Crystals and Oscillators','','Root Category ➤ 2 Passive Components ➤ Crystals and Oscillators'),(57,56,82,83,3,1,'Crystals','','Root Category ➤ 2 Passive Components ➤ Crystals and Oscillators ➤ Crystals'),(58,56,84,85,3,1,'Crystals Oscillators','','Root Category ➤ 2 Passive Components ➤ Crystals and Oscillators ➤ Crystals Oscillators'),(59,8,87,88,2,1,'Potentiometers ','','Root Category ➤ 2 Passive Components ➤ Potentiometers '),(60,8,89,90,2,1,' Photoresistors / LDRs','','Root Category ➤ 2 Passive Components ➤  Photoresistors / LDRs'),(61,19,120,151,3,1,'PCB Connectors','','Root Category ➤ Electromechanical Components ➤ Connectors ➤ PCB Connectors'),(62,61,123,124,4,1,'Audio','','Root Category ➤ Electromechanical Components ➤ Connectors ➤ PCB Connectors ➤ Audio'),(63,61,127,128,4,1,'Block Terminal','','Root Category ➤ Electromechanical Components ➤ Connectors ➤ PCB Connectors ➤ Block Terminal'),(64,61,129,130,4,1,'USB','','Root Category ➤ Electromechanical Components ➤ Connectors ➤ PCB Connectors ➤ USB'),(65,61,131,132,4,1,'Board to Board','','Root Category ➤ Electromechanical Components ➤ Connectors ➤ PCB Connectors ➤ Board to Board'),(66,61,133,134,4,1,'Pin Header','','Root Category ➤ Electromechanical Components ➤ Connectors ➤ PCB Connectors ➤ Pin Header'),(67,61,135,136,4,1,'D-Sub','','Root Category ➤ Electromechanical Components ➤ Connectors ➤ PCB Connectors ➤ D-Sub'),(68,61,137,138,4,1,'IDC Connectors + Box Headers','','Root Category ➤ Electromechanical Components ➤ Connectors ➤ PCB Connectors ➤ IDC Connectors + Box Headers'),(69,61,139,140,4,1,'PSU','','Root Category ➤ Electromechanical Components ➤ Connectors ➤ PCB Connectors ➤ PSU'),(70,61,125,126,4,1,'DC Power Jacks','','Root Category ➤ Electromechanical Components ➤ Connectors ➤ PCB Connectors ➤ DC Power Jacks'),(71,17,112,113,3,1,'Switches','','Root Category ➤ Electromechanical Components ➤ Switches and Button ➤ Switches'),(72,17,114,115,3,1,'Push Button','','Root Category ➤ Electromechanical Components ➤ Switches and Button ➤ Push Button'),(73,17,116,117,3,1,'DIP Switches','','Root Category ➤ Electromechanical Components ➤ Switches and Button ➤ DIP Switches'),(74,16,109,110,2,1,'Fuses','','Root Category ➤ Electromechanical Components ➤ Fuses'),(75,16,101,106,2,1,'Motors','','Root Category ➤ Electromechanical Components ➤ Motors'),(76,75,102,103,3,1,'Motor DC','','Root Category ➤ Electromechanical Components ➤ Motors ➤ Motor DC'),(77,75,104,105,3,1,'Servo','','Root Category ➤ Electromechanical Components ➤ Motors ➤ Servo'),(79,16,153,154,2,1,'Battray Holders','','Root Category ➤ Electromechanical Components ➤ Battray Holders'),(80,1,158,167,1,1,'Modules','','Root Category ➤ Modules'),(81,1,168,169,1,1,'PCB','','Root Category ➤ PCB'),(82,80,159,162,2,1,'Sensor','','Root Category ➤ Modules ➤ Sensor'),(83,80,163,164,2,1,'Power Supply','','Root Category ➤ Modules ➤ Power Supply'),(84,80,165,166,2,1,'Driver','','Root Category ➤ Modules ➤ Driver'),(85,16,155,156,2,1,'Relay','','Root Category ➤ Electromechanical Components ➤ Relay'),(86,6,3,14,2,1,'Development Boards','','Root Category ➤ Microcontrollers ➤ Development Boards'),(87,11,93,98,2,1,'Electronics','','Root Category ➤ Tools  ➤ Electronics'),(88,12,95,96,4,1,'Solder Uap','','Root Category ➤ Tools  ➤ Electronics ➤ Soldering ➤ Solder Uap'),(89,61,141,146,4,1,'Antena','','Root Category ➤ Electromechanical Components ➤ Connectors ➤ PCB Connectors ➤ Antena'),(90,82,160,161,3,1,'GPS','','Root Category ➤ Modules ➤ Sensor ➤ GPS'),(91,89,142,143,5,1,'Active','','Root Category ➤ Electromechanical Components ➤ Connectors ➤ PCB Connectors ➤ Antena ➤ Active'),(92,89,144,145,5,1,'Passive','','Root Category ➤ Electromechanical Components ➤ Connectors ➤ PCB Connectors ➤ Antena ➤ Passive'),(93,61,121,122,4,1,'CONN','','Root Category ➤ Electromechanical Components ➤ Connectors ➤ PCB Connectors ➤ CONN'),(94,61,147,148,4,1,'SIM CARD','','Root Category ➤ Electromechanical Components ➤ Connectors ➤ PCB Connectors ➤ SIM CARD'),(95,61,149,150,4,1,'Others','','Root Category ➤ Electromechanical Components ➤ Connectors ➤ PCB Connectors ➤ Others');
/*!40000 ALTER TABLE `PartCategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PartDistributor`
--

DROP TABLE IF EXISTS `PartDistributor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PartDistributor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `part_id` int(11) DEFAULT NULL,
  `distributor_id` int(11) DEFAULT NULL,
  `orderNumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `packagingUnit` int(11) NOT NULL,
  `price` decimal(13,4) DEFAULT NULL,
  `currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ignoreForReports` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FBA293844CE34BEC` (`part_id`),
  KEY `IDX_FBA293842D863A58` (`distributor_id`),
  CONSTRAINT `FK_FBA293842D863A58` FOREIGN KEY (`distributor_id`) REFERENCES `Distributor` (`id`),
  CONSTRAINT `FK_FBA293844CE34BEC` FOREIGN KEY (`part_id`) REFERENCES `Part` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PartDistributor`
--

LOCK TABLES `PartDistributor` WRITE;
/*!40000 ALTER TABLE `PartDistributor` DISABLE KEYS */;
/*!40000 ALTER TABLE `PartDistributor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PartKeeprUser`
--

DROP TABLE IF EXISTS `PartKeeprUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PartKeeprUser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider_id` int(11) DEFAULT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) NOT NULL,
  `legacy` tinyint(1) NOT NULL,
  `lastSeen` datetime DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `protected` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_provider` (`username`,`provider_id`),
  KEY `IDX_7572D706A53A8AA` (`provider_id`),
  CONSTRAINT `FK_7572D706A53A8AA` FOREIGN KEY (`provider_id`) REFERENCES `UserProvider` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PartKeeprUser`
--

LOCK TABLES `PartKeeprUser` WRITE;
/*!40000 ALTER TABLE `PartKeeprUser` DISABLE KEYS */;
INSERT INTO `PartKeeprUser` VALUES (1,1,'admin','','',0,0,NULL,1,0),(2,1,'alim','','muhamadalim424@gmail.com',0,0,NULL,1,0),(3,1,'yusron','','',0,0,NULL,1,0);
/*!40000 ALTER TABLE `PartKeeprUser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PartManufacturer`
--

DROP TABLE IF EXISTS `PartManufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PartManufacturer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `part_id` int(11) DEFAULT NULL,
  `manufacturer_id` int(11) DEFAULT NULL,
  `partNumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F085878B4CE34BEC` (`part_id`),
  KEY `IDX_F085878BA23B42D` (`manufacturer_id`),
  CONSTRAINT `FK_F085878B4CE34BEC` FOREIGN KEY (`part_id`) REFERENCES `Part` (`id`),
  CONSTRAINT `FK_F085878BA23B42D` FOREIGN KEY (`manufacturer_id`) REFERENCES `Manufacturer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PartManufacturer`
--

LOCK TABLES `PartManufacturer` WRITE;
/*!40000 ALTER TABLE `PartManufacturer` DISABLE KEYS */;
/*!40000 ALTER TABLE `PartManufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PartParameter`
--

DROP TABLE IF EXISTS `PartParameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PartParameter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `part_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` double DEFAULT NULL,
  `normalizedValue` double DEFAULT NULL,
  `maximumValue` double DEFAULT NULL,
  `normalizedMaxValue` double DEFAULT NULL,
  `minimumValue` double DEFAULT NULL,
  `normalizedMinValue` double DEFAULT NULL,
  `stringValue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `valueType` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `siPrefix_id` int(11) DEFAULT NULL,
  `minSiPrefix_id` int(11) DEFAULT NULL,
  `maxSiPrefix_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A28A98594CE34BEC` (`part_id`),
  KEY `IDX_A28A9859F8BD700D` (`unit_id`),
  KEY `IDX_A28A985919187357` (`siPrefix_id`),
  KEY `IDX_A28A9859569AA479` (`minSiPrefix_id`),
  KEY `IDX_A28A9859EFBC3F08` (`maxSiPrefix_id`),
  CONSTRAINT `FK_A28A985919187357` FOREIGN KEY (`siPrefix_id`) REFERENCES `SiPrefix` (`id`),
  CONSTRAINT `FK_A28A98594CE34BEC` FOREIGN KEY (`part_id`) REFERENCES `Part` (`id`),
  CONSTRAINT `FK_A28A9859569AA479` FOREIGN KEY (`minSiPrefix_id`) REFERENCES `SiPrefix` (`id`),
  CONSTRAINT `FK_A28A9859EFBC3F08` FOREIGN KEY (`maxSiPrefix_id`) REFERENCES `SiPrefix` (`id`),
  CONSTRAINT `FK_A28A9859F8BD700D` FOREIGN KEY (`unit_id`) REFERENCES `Unit` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PartParameter`
--

LOCK TABLES `PartParameter` WRITE;
/*!40000 ALTER TABLE `PartParameter` DISABLE KEYS */;
/*!40000 ALTER TABLE `PartParameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PartUnit`
--

DROP TABLE IF EXISTS `PartUnit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PartUnit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shortName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PartUnit`
--

LOCK TABLES `PartUnit` WRITE;
/*!40000 ALTER TABLE `PartUnit` DISABLE KEYS */;
INSERT INTO `PartUnit` VALUES (1,'Pieces','pcs',1);
/*!40000 ALTER TABLE `PartUnit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Project`
--

DROP TABLE IF EXISTS `Project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E00EE972A76ED395` (`user_id`),
  CONSTRAINT `FK_E00EE972A76ED395` FOREIGN KEY (`user_id`) REFERENCES `PartKeeprUser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Project`
--

LOCK TABLES `Project` WRITE;
/*!40000 ALTER TABLE `Project` DISABLE KEYS */;
INSERT INTO `Project` VALUES (1,NULL,'INTELLI NEMA ','');
/*!40000 ALTER TABLE `Project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProjectAttachment`
--

DROP TABLE IF EXISTS `ProjectAttachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProjectAttachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `originalname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mimetype` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `extension` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_44010C5B166D1F9C` (`project_id`),
  CONSTRAINT `FK_44010C5B166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `Project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProjectAttachment`
--

LOCK TABLES `ProjectAttachment` WRITE;
/*!40000 ALTER TABLE `ProjectAttachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProjectAttachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProjectPart`
--

DROP TABLE IF EXISTS `ProjectPart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProjectPart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `part_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `remarks` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `overageType` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `overage` int(11) NOT NULL DEFAULT '0',
  `lotNumber` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B0B193364CE34BEC` (`part_id`),
  KEY `IDX_B0B19336166D1F9C` (`project_id`),
  CONSTRAINT `FK_B0B19336166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `Project` (`id`),
  CONSTRAINT `FK_B0B193364CE34BEC` FOREIGN KEY (`part_id`) REFERENCES `Part` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProjectPart`
--

LOCK TABLES `ProjectPart` WRITE;
/*!40000 ALTER TABLE `ProjectPart` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProjectPart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProjectRun`
--

DROP TABLE IF EXISTS `ProjectRun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProjectRun` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `runDateTime` datetime NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_574A3B5C166D1F9C` (`project_id`),
  CONSTRAINT `FK_574A3B5C166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `Project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProjectRun`
--

LOCK TABLES `ProjectRun` WRITE;
/*!40000 ALTER TABLE `ProjectRun` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProjectRun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProjectRunPart`
--

DROP TABLE IF EXISTS `ProjectRunPart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProjectRunPart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `part_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `lotNumber` longtext COLLATE utf8_unicode_ci NOT NULL,
  `projectRun_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BF41064B1A221EF0` (`projectRun_id`),
  KEY `IDX_BF41064B4CE34BEC` (`part_id`),
  CONSTRAINT `FK_BF41064B1A221EF0` FOREIGN KEY (`projectRun_id`) REFERENCES `ProjectRun` (`id`),
  CONSTRAINT `FK_BF41064B4CE34BEC` FOREIGN KEY (`part_id`) REFERENCES `Part` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProjectRunPart`
--

LOCK TABLES `ProjectRunPart` WRITE;
/*!40000 ALTER TABLE `ProjectRunPart` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProjectRunPart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Report`
--

DROP TABLE IF EXISTS `Report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createDateTime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Report`
--

LOCK TABLES `Report` WRITE;
/*!40000 ALTER TABLE `Report` DISABLE KEYS */;
/*!40000 ALTER TABLE `Report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ReportPart`
--

DROP TABLE IF EXISTS `ReportPart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReportPart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` int(11) DEFAULT NULL,
  `part_id` int(11) DEFAULT NULL,
  `distributor_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1BF0BD554BD2A4C0` (`report_id`),
  KEY `IDX_1BF0BD554CE34BEC` (`part_id`),
  KEY `IDX_1BF0BD552D863A58` (`distributor_id`),
  CONSTRAINT `FK_1BF0BD552D863A58` FOREIGN KEY (`distributor_id`) REFERENCES `Distributor` (`id`),
  CONSTRAINT `FK_1BF0BD554BD2A4C0` FOREIGN KEY (`report_id`) REFERENCES `Report` (`id`),
  CONSTRAINT `FK_1BF0BD554CE34BEC` FOREIGN KEY (`part_id`) REFERENCES `Part` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReportPart`
--

LOCK TABLES `ReportPart` WRITE;
/*!40000 ALTER TABLE `ReportPart` DISABLE KEYS */;
/*!40000 ALTER TABLE `ReportPart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ReportProject`
--

DROP TABLE IF EXISTS `ReportProject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReportProject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_83B0909B4BD2A4C0` (`report_id`),
  KEY `IDX_83B0909B166D1F9C` (`project_id`),
  CONSTRAINT `FK_83B0909B166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `Project` (`id`),
  CONSTRAINT `FK_83B0909B4BD2A4C0` FOREIGN KEY (`report_id`) REFERENCES `Report` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReportProject`
--

LOCK TABLES `ReportProject` WRITE;
/*!40000 ALTER TABLE `ReportProject` DISABLE KEYS */;
/*!40000 ALTER TABLE `ReportProject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SchemaVersions`
--

DROP TABLE IF EXISTS `SchemaVersions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SchemaVersions` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SchemaVersions`
--

LOCK TABLES `SchemaVersions` WRITE;
/*!40000 ALTER TABLE `SchemaVersions` DISABLE KEYS */;
INSERT INTO `SchemaVersions` VALUES ('20150608120000'),('20150708120022'),('20150724174030'),('20151001180120'),('20151002183125'),('20151031163951'),('20151208162723'),('20160103145302'),('20170108122512'),('20170108143802'),('20170113203042'),('20170601175559');
/*!40000 ALTER TABLE `SchemaVersions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SiPrefix`
--

DROP TABLE IF EXISTS `SiPrefix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SiPrefix` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prefix` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `symbol` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `exponent` int(11) NOT NULL,
  `base` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SiPrefix`
--

LOCK TABLES `SiPrefix` WRITE;
/*!40000 ALTER TABLE `SiPrefix` DISABLE KEYS */;
INSERT INTO `SiPrefix` VALUES (1,'yotta','Y',24,10),(2,'zetta','Z',21,10),(3,'exa','E',18,10),(4,'peta','P',15,10),(5,'tera','T',12,10),(6,'giga','G',9,10),(7,'mega','M',6,10),(8,'kilo','k',3,10),(9,'hecto','h',2,10),(10,'deca','da',1,10),(11,'-','',0,10),(12,'deci','d',-1,10),(13,'centi','c',-2,10),(14,'milli','m',-3,10),(15,'micro','μ',-6,10),(16,'nano','n',-9,10),(17,'pico','p',-12,10),(18,'femto','f',-15,10),(19,'atto','a',-18,10),(20,'zepto','z',-21,10),(21,'yocto','y',-24,10),(22,'kibi','Ki',1,1024),(23,'mebi','Mi',2,1024),(24,'gibi','Gi',3,1024),(25,'tebi','Ti',4,1024),(26,'pebi','Pi',5,1024),(27,'exbi','Ei',6,1024),(28,'zebi','Zi',7,1024),(29,'yobi','Yi',8,1024);
/*!40000 ALTER TABLE `SiPrefix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StatisticSnapshot`
--

DROP TABLE IF EXISTS `StatisticSnapshot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StatisticSnapshot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dateTime` datetime NOT NULL,
  `parts` int(11) NOT NULL,
  `categories` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StatisticSnapshot`
--

LOCK TABLES `StatisticSnapshot` WRITE;
/*!40000 ALTER TABLE `StatisticSnapshot` DISABLE KEYS */;
INSERT INTO `StatisticSnapshot` VALUES (1,'2021-02-04 10:47:58',0,1),(2,'2021-02-05 06:00:05',2,7),(3,'2021-02-08 03:39:04',0,7),(4,'2021-02-08 12:00:05',71,72),(5,'2021-02-09 00:00:06',71,72),(6,'2021-02-09 12:00:05',85,83),(7,'2021-02-10 00:00:05',85,83),(8,'2021-02-10 12:00:05',94,86),(9,'2021-02-11 00:00:05',94,86),(10,'2021-02-11 12:00:06',94,86),(11,'2021-02-12 00:00:06',94,86),(12,'2021-02-14 18:00:05',94,86),(13,'2021-02-15 06:00:05',94,86),(14,'2021-02-15 18:00:04',94,86),(15,'2021-02-16 06:00:04',94,86);
/*!40000 ALTER TABLE `StatisticSnapshot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StatisticSnapshotUnit`
--

DROP TABLE IF EXISTS `StatisticSnapshotUnit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StatisticSnapshotUnit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stockLevel` int(11) NOT NULL,
  `statisticSnapshot_id` int(11) DEFAULT NULL,
  `partUnit_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_368BD669A16DD05F` (`statisticSnapshot_id`),
  KEY `IDX_368BD669F7A36E87` (`partUnit_id`),
  CONSTRAINT `FK_368BD669A16DD05F` FOREIGN KEY (`statisticSnapshot_id`) REFERENCES `StatisticSnapshot` (`id`),
  CONSTRAINT `FK_368BD669F7A36E87` FOREIGN KEY (`partUnit_id`) REFERENCES `PartUnit` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StatisticSnapshotUnit`
--

LOCK TABLES `StatisticSnapshotUnit` WRITE;
/*!40000 ALTER TABLE `StatisticSnapshotUnit` DISABLE KEYS */;
INSERT INTO `StatisticSnapshotUnit` VALUES (1,0,1,1),(2,1100,2,1),(3,0,3,1),(4,4324,4,1),(5,4324,5,1),(6,4347,6,1),(7,4347,7,1),(8,4574,8,1),(9,4574,9,1),(10,4574,10,1),(11,4574,11,1),(12,4574,12,1),(13,4574,13,1),(14,4574,14,1),(15,4574,15,1);
/*!40000 ALTER TABLE `StatisticSnapshotUnit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StockEntry`
--

DROP TABLE IF EXISTS `StockEntry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StockEntry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `part_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `stockLevel` int(11) NOT NULL,
  `price` decimal(13,4) DEFAULT NULL,
  `dateTime` datetime NOT NULL,
  `correction` tinyint(1) NOT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E182997B4CE34BEC` (`part_id`),
  KEY `IDX_E182997BA76ED395` (`user_id`),
  CONSTRAINT `FK_E182997B4CE34BEC` FOREIGN KEY (`part_id`) REFERENCES `Part` (`id`),
  CONSTRAINT `FK_E182997BA76ED395` FOREIGN KEY (`user_id`) REFERENCES `PartKeeprUser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StockEntry`
--

LOCK TABLES `StockEntry` WRITE;
/*!40000 ALTER TABLE `StockEntry` DISABLE KEYS */;
INSERT INTO `StockEntry` VALUES (1,1,NULL,4,0.0000,'2021-02-08 03:47:16',0,NULL),(2,2,NULL,8,0.0000,'2021-02-08 04:11:06',0,NULL),(3,3,NULL,4,0.0000,'2021-02-08 04:13:36',0,NULL),(4,4,NULL,10,0.0000,'2021-02-08 04:15:13',0,NULL),(5,5,NULL,3,0.0000,'2021-02-08 04:16:45',0,NULL),(6,6,NULL,20,0.0000,'2021-02-08 04:24:13',0,NULL),(7,7,NULL,12,0.0000,'2021-02-08 04:26:24',0,NULL),(8,8,NULL,4,0.0000,'2021-02-08 04:27:33',0,NULL),(9,9,NULL,10,0.0000,'2021-02-08 04:28:33',0,NULL),(10,10,NULL,24,0.0000,'2021-02-08 04:30:50',0,NULL),(11,11,NULL,3,0.0000,'2021-02-08 04:32:07',0,NULL),(12,12,NULL,9,0.0000,'2021-02-08 04:33:42',0,NULL),(13,13,NULL,8,0.0000,'2021-02-08 04:35:12',0,NULL),(14,14,NULL,25,0.0000,'2021-02-08 04:36:46',0,NULL),(15,15,NULL,2,0.0000,'2021-02-08 04:38:01',0,NULL),(16,16,NULL,5,0.0000,'2021-02-08 04:41:07',0,NULL),(17,17,NULL,30,0.0000,'2021-02-08 04:42:48',0,NULL),(18,18,NULL,8,0.0000,'2021-02-08 04:44:15',0,NULL),(19,19,NULL,6,0.0000,'2021-02-08 04:45:56',0,NULL),(21,21,NULL,1,0.0000,'2021-02-08 04:49:19',0,NULL),(22,22,NULL,12,0.0000,'2021-02-08 04:50:34',0,NULL),(23,23,NULL,8,0.0000,'2021-02-08 04:54:08',0,NULL),(24,24,NULL,6,0.0000,'2021-02-08 04:56:15',0,NULL),(25,25,NULL,53,0.0000,'2021-02-08 04:57:27',0,NULL),(26,26,NULL,2,0.0000,'2021-02-08 05:00:53',0,NULL),(27,27,1,4,NULL,'2021-02-08 05:03:41',0,NULL),(28,28,NULL,15,0.0000,'2021-02-08 05:04:33',0,NULL),(29,29,NULL,1,0.0000,'2021-02-08 05:06:35',0,NULL),(30,30,NULL,100,0.0000,'2021-02-08 05:07:37',0,NULL),(31,31,NULL,6,0.0000,'2021-02-08 05:08:46',0,NULL),(32,32,NULL,75,0.0000,'2021-02-08 06:05:21',0,NULL),(33,33,NULL,70,0.0000,'2021-02-08 06:06:51',0,NULL),(34,34,NULL,70,0.0000,'2021-02-08 06:08:21',0,NULL),(35,35,NULL,70,0.0000,'2021-02-08 06:10:29',0,NULL),(37,37,NULL,10,0.0000,'2021-02-08 06:16:39',0,NULL),(38,38,NULL,70,0.0000,'2021-02-08 06:19:17',0,NULL),(39,39,NULL,50,0.0000,'2021-02-08 06:23:29',0,NULL),(40,40,NULL,10,0.0000,'2021-02-08 06:26:14',0,NULL),(41,41,NULL,180,0.0000,'2021-02-08 06:29:02',0,NULL),(43,43,NULL,10,0.0000,'2021-02-08 06:32:36',0,NULL),(44,44,NULL,70,0.0000,'2021-02-08 06:34:20',0,NULL),(45,45,NULL,80,0.0000,'2021-02-08 06:37:31',0,NULL),(46,46,NULL,80,0.0000,'2021-02-08 06:40:34',0,NULL),(47,47,NULL,180,0.0000,'2021-02-08 06:41:55',0,NULL),(48,48,NULL,10,0.0000,'2021-02-08 06:43:52',0,NULL),(50,50,NULL,80,0.0000,'2021-02-08 06:47:22',0,NULL),(51,51,NULL,80,0.0000,'2021-02-08 06:50:01',0,NULL),(52,52,NULL,70,0.0000,'2021-02-08 06:51:45',0,NULL),(53,53,NULL,80,0.0000,'2021-02-08 06:53:10',0,NULL),(54,54,NULL,80,0.0000,'2021-02-08 06:54:45',0,NULL),(55,55,NULL,80,0.0000,'2021-02-08 06:56:04',0,NULL),(56,56,NULL,70,0.0000,'2021-02-08 06:57:59',0,NULL),(57,57,NULL,8,0.0000,'2021-02-08 06:59:49',0,NULL),(58,58,NULL,80,0.0000,'2021-02-08 07:02:09',0,NULL),(59,59,NULL,10,0.0000,'2021-02-08 07:04:02',0,NULL),(60,60,NULL,10,0.0000,'2021-02-08 07:05:40',0,NULL),(61,61,NULL,70,0.0000,'2021-02-08 07:07:24',0,NULL),(62,62,NULL,10,0.0000,'2021-02-08 07:09:45',0,NULL),(63,63,NULL,160,0.0000,'2021-02-08 07:17:46',0,NULL),(64,64,NULL,5,0.0000,'2021-02-08 07:19:53',0,NULL),(65,65,NULL,9,0.0000,'2021-02-08 07:21:26',0,NULL),(66,66,NULL,300,0.0000,'2021-02-08 07:23:06',0,NULL),(67,67,NULL,3,0.0000,'2021-02-08 07:24:54',0,NULL),(68,68,NULL,150,0.0000,'2021-02-08 07:26:17',0,NULL),(69,69,NULL,300,0.0000,'2021-02-08 07:27:24',0,NULL),(70,70,1,11,NULL,'2021-02-08 07:29:39',0,NULL),(71,71,NULL,20,0.0000,'2021-02-08 07:31:41',0,NULL),(72,72,NULL,600,0.0000,'2021-02-08 07:33:25',0,NULL),(73,73,NULL,150,0.0000,'2021-02-08 07:35:20',0,NULL),(74,74,NULL,200,0.0000,'2021-02-08 07:36:49',0,NULL),(75,75,NULL,250,0.0000,'2021-02-08 09:23:37',0,NULL),(76,76,NULL,3,0.0000,'2021-02-09 03:29:38',0,NULL),(77,77,1,1,NULL,'2021-02-09 03:34:46',0,NULL),(78,78,NULL,1,0.0000,'2021-02-09 03:39:00',0,NULL),(79,79,NULL,2,0.0000,'2021-02-09 03:44:41',0,NULL),(80,80,NULL,1,0.0000,'2021-02-09 03:46:20',0,NULL),(81,81,1,2,NULL,'2021-02-09 03:53:57',0,NULL),(82,82,NULL,1,0.0000,'2021-02-09 03:54:36',0,NULL),(83,83,NULL,1,0.0000,'2021-02-09 04:12:07',0,NULL),(84,84,2,1,0.0000,'2021-02-09 04:18:17',0,NULL),(85,85,NULL,1,0.0000,'2021-02-09 04:23:19',0,NULL),(86,86,NULL,1,0.0000,'2021-02-09 04:35:03',0,NULL),(87,87,NULL,1,0.0000,'2021-02-09 04:37:09',0,NULL),(88,88,NULL,1,0.0000,'2021-02-09 04:49:41',0,NULL),(89,89,2,6,0.0000,'2021-02-09 05:00:52',0,NULL),(90,90,2,50,0.0000,'2021-02-10 03:59:33',0,NULL),(91,92,NULL,25,0.0000,'2021-02-10 04:08:45',0,NULL),(92,91,1,45,NULL,'2021-02-10 04:10:40',0,NULL),(93,93,NULL,25,0.0000,'2021-02-10 04:15:25',0,NULL),(94,94,NULL,10,0.0000,'2021-02-10 04:18:26',0,NULL),(95,95,NULL,50,0.0000,'2021-02-10 04:22:59',0,NULL),(96,96,NULL,6,0.0000,'2021-02-10 06:43:10',0,NULL),(97,97,NULL,14,0.0000,'2021-02-10 10:24:19',0,NULL),(98,98,NULL,2,0.0000,'2021-02-10 10:26:45',0,NULL);
/*!40000 ALTER TABLE `StockEntry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StorageLocation`
--

DROP TABLE IF EXISTS `StorageLocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StorageLocation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_2C59071C5E237E06` (`name`),
  KEY `IDX_2C59071C12469DE2` (`category_id`),
  CONSTRAINT `FK_2C59071C12469DE2` FOREIGN KEY (`category_id`) REFERENCES `StorageLocationCategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StorageLocation`
--

LOCK TABLES `StorageLocation` WRITE;
/*!40000 ALTER TABLE `StorageLocation` DISABLE KEYS */;
INSERT INTO `StorageLocation` VALUES (2,1,'B1-A-1'),(3,1,'B1-A-2'),(4,1,'B1-A-3'),(5,1,'B1-A-4'),(6,1,'B1-A-5'),(7,1,'B1-A-6'),(8,1,'B1-A-7'),(9,1,'B1-A-8'),(20,3,'M1-A-04'),(21,3,'M1-A-02'),(22,3,'M1-A-03'),(23,3,'M1-A-01'),(24,3,'M1-A-05'),(25,3,'M1-B-01'),(26,3,'M1-B-02'),(27,3,'M1-B-03'),(28,3,'M1-B-04'),(29,3,'M1-B-05'),(30,3,'M1-C-04'),(31,3,'M1-C-05'),(32,3,'M1-C-01'),(33,3,'M1-C-03'),(34,3,'M1-C-02'),(35,3,'M1-D-02'),(36,3,'M1-D-03'),(37,3,'M1-D-04'),(38,3,'M1-D-05'),(39,3,'M1-D-01'),(40,3,'M1-E-05'),(41,3,'M1-E-03'),(42,3,'M1-E-01'),(43,3,'M1-E-04'),(44,3,'M1-E-02'),(51,3,'M1-D-06'),(56,3,'M1-D-07'),(57,3,'M1-D-08'),(68,3,'M1-G-02'),(69,3,'M1-G-03'),(70,3,'M1-G-04'),(71,3,'M1-G-01'),(72,3,'M1-G-05'),(73,4,'RK-U-3'),(74,4,'RK-U-5'),(75,4,'RK-U-4'),(76,4,'RK-U-2'),(77,4,'RK-U-1'),(78,1,'BOX-B'),(79,1,'K-DK-1'),(80,1,'K-DK-2'),(81,1,'K-LCSC'),(82,4,'RK-P-3'),(83,4,'RK-P-1'),(84,4,'RK-P-2'),(85,4,'RK-P-4'),(86,1,'FUSI-L-2'),(87,5,'B1-A-04'),(88,5,'B1-A-02'),(89,5,'B1-A-06'),(90,5,'B1-A-03'),(91,5,'B1-A-01'),(92,5,'B1-A-05'),(93,5,'B1-A-07'),(94,5,'B1-A-09'),(95,5,'B1-A-08'),(96,5,'B1-A-10'),(97,5,'B1-A-11'),(98,5,'B1-A-12'),(99,5,'B1-B-01'),(100,5,'B1-B-06'),(101,5,'B1-B-02'),(102,5,'B1-B-05'),(103,5,'B1-B-03'),(104,5,'B1-B-07'),(105,5,'B1-B-04'),(106,5,'B1-B-08'),(107,5,'B1-B-09'),(108,5,'B1-B-10'),(109,5,'B1-B-11'),(110,5,'B1-B-12'),(111,5,'B1-C-03'),(112,5,'B1-C-04'),(113,5,'B1-C-01'),(114,5,'B1-C-06'),(115,5,'B1-C-05'),(116,5,'B1-C-02'),(117,5,'B1-C-07'),(118,5,'B1-C-08'),(119,5,'B1-C-09'),(120,5,'B1-C-10'),(121,5,'B1-C-11'),(122,5,'B1-C-12'),(123,5,'B1-D-03'),(124,5,'B1-D-02'),(125,5,'B1-D-04'),(126,5,'B1-D-01'),(127,5,'B1-D-05'),(128,5,'B1-D-07'),(129,5,'B1-D-09'),(130,5,'B1-D-10'),(131,5,'B1-D-06'),(132,5,'B1-D-08'),(133,5,'B1-D-11'),(134,5,'B1-D-12'),(135,5,'B1-E-02'),(136,5,'B1-E-01'),(137,5,'B1-E-05'),(138,5,'B1-E-06'),(139,5,'B1-E-04'),(140,5,'B1-E-03'),(141,5,'B1-E-08'),(142,5,'B1-E-07'),(143,5,'B1-E-09'),(144,5,'B1-E-10'),(145,5,'B1-E-12'),(146,5,'B1-E-11');
/*!40000 ALTER TABLE `StorageLocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StorageLocationCategory`
--

DROP TABLE IF EXISTS `StorageLocationCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StorageLocationCategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `lft` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `lvl` int(11) NOT NULL,
  `root` int(11) DEFAULT NULL,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `categoryPath` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_3E39FA47727ACA70` (`parent_id`),
  KEY `IDX_3E39FA47DA439252` (`lft`),
  KEY `IDX_3E39FA47D5E02D69` (`rgt`),
  CONSTRAINT `FK_3E39FA47727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `StorageLocationCategory` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StorageLocationCategory`
--

LOCK TABLES `StorageLocationCategory` WRITE;
/*!40000 ALTER TABLE `StorageLocationCategory` DISABLE KEYS */;
INSERT INTO `StorageLocationCategory` VALUES (1,NULL,1,8,0,1,'Root Category',NULL,'Root Category'),(3,1,2,3,1,1,'RAK-MERAH','','Root Category ➤ RAK-MERAH'),(4,1,4,5,1,1,'FUSI-LANTAI-2','','Root Category ➤ FUSI-LANTAI-2'),(5,1,6,7,1,1,'RAK-BIRU','','Root Category ➤ RAK-BIRU');
/*!40000 ALTER TABLE `StorageLocationCategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StorageLocationImage`
--

DROP TABLE IF EXISTS `StorageLocationImage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StorageLocationImage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `originalname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mimetype` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `extension` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `created` datetime NOT NULL,
  `storageLocation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_666717F073CD58AF` (`storageLocation_id`),
  CONSTRAINT `FK_666717F073CD58AF` FOREIGN KEY (`storageLocation_id`) REFERENCES `StorageLocation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StorageLocationImage`
--

LOCK TABLES `StorageLocationImage` WRITE;
/*!40000 ALTER TABLE `StorageLocationImage` DISABLE KEYS */;
/*!40000 ALTER TABLE `StorageLocationImage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SystemNotice`
--

DROP TABLE IF EXISTS `SystemNotice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SystemNotice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `acknowledged` tinyint(1) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SystemNotice`
--

LOCK TABLES `SystemNotice` WRITE;
/*!40000 ALTER TABLE `SystemNotice` DISABLE KEYS */;
/*!40000 ALTER TABLE `SystemNotice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SystemPreference`
--

DROP TABLE IF EXISTS `SystemPreference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SystemPreference` (
  `preferenceKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `preferenceValue` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`preferenceKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SystemPreference`
--

LOCK TABLES `SystemPreference` WRITE;
/*!40000 ALTER TABLE `SystemPreference` DISABLE KEYS */;
INSERT INTO `SystemPreference` VALUES ('partkeepr.barcodeScanner.actions','s:116:\"[{\"code\":\"P\",\"action\":\"PartKeepr.BarcodeScanner.Actions.AddPart\",\"config\":{\"searchFields\":[],\"searchMode\":\"fixed\"}}]\";'),('partkeepr.barcodeScanner.enter','s:5:\"false\";'),('partkeepr.barcodeScanner.key','s:3:\"\"k\"\";'),('partkeepr.barcodeScanner.modifierAlt','s:4:\"true\";'),('partkeepr.barcodeScanner.modifierCtrl','s:5:\"false\";'),('partkeepr.barcodeScanner.modifierShift','s:5:\"false\";'),('partkeepr.barcodeScanner.timeout','s:3:\"500\";');
/*!40000 ALTER TABLE `SystemPreference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TempImage`
--

DROP TABLE IF EXISTS `TempImage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TempImage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `originalname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mimetype` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `extension` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TempImage`
--

LOCK TABLES `TempImage` WRITE;
/*!40000 ALTER TABLE `TempImage` DISABLE KEYS */;
/*!40000 ALTER TABLE `TempImage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TempUploadedFile`
--

DROP TABLE IF EXISTS `TempUploadedFile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TempUploadedFile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `originalname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mimetype` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `extension` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TempUploadedFile`
--

LOCK TABLES `TempUploadedFile` WRITE;
/*!40000 ALTER TABLE `TempUploadedFile` DISABLE KEYS */;
INSERT INTO `TempUploadedFile` VALUES (1,'tempfile','fdc04968-6a8d-11eb-b35e-42010ab80009','webcam.png','inode/x-empty',0,'',NULL,'2021-02-09 04:19:24'),(2,'tempfile','105ed90e-6a8e-11eb-b016-42010ab80009','photo_2021-02-09_11-15-03.jpg','image/jpeg',124633,'',NULL,'2021-02-09 04:19:55'),(3,'tempfile','8d904ede-6a8f-11eb-948b-42010ab80009','photo_2021-02-09_11-30-17.jpg','image/jpeg',65256,'',NULL,'2021-02-09 04:30:35'),(4,'tempfile','2c90cf5e-6a90-11eb-aa7f-42010ab80009','photo_2021-02-09_11-30-17.jpg','',65256,'jpeg',NULL,'2021-02-09 04:35:02');
/*!40000 ALTER TABLE `TempUploadedFile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TipOfTheDay`
--

DROP TABLE IF EXISTS `TipOfTheDay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TipOfTheDay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TipOfTheDay`
--

LOCK TABLES `TipOfTheDay` WRITE;
/*!40000 ALTER TABLE `TipOfTheDay` DISABLE KEYS */;
/*!40000 ALTER TABLE `TipOfTheDay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TipOfTheDayHistory`
--

DROP TABLE IF EXISTS `TipOfTheDayHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TipOfTheDayHistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3177BC2A76ED395` (`user_id`),
  CONSTRAINT `FK_3177BC2A76ED395` FOREIGN KEY (`user_id`) REFERENCES `PartKeeprUser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TipOfTheDayHistory`
--

LOCK TABLES `TipOfTheDayHistory` WRITE;
/*!40000 ALTER TABLE `TipOfTheDayHistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `TipOfTheDayHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Unit`
--

DROP TABLE IF EXISTS `Unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `symbol` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Unit`
--

LOCK TABLES `Unit` WRITE;
/*!40000 ALTER TABLE `Unit` DISABLE KEYS */;
INSERT INTO `Unit` VALUES (1,'Meter','m'),(2,'Gram','g'),(3,'Second','s'),(4,'Kelvin','K'),(5,'Mol','mol'),(6,'Candela','cd'),(7,'Ampere','A'),(8,'Ohm','Ω'),(9,'Volt','V'),(10,'Hertz','Hz'),(11,'Newton','N'),(12,'Pascal','Pa'),(13,'Joule','J'),(14,'Watt','W'),(15,'Coulomb','C'),(16,'Farad','F'),(17,'Siemens','S'),(18,'Weber','Wb'),(19,'Tesla','T'),(20,'Henry','H'),(21,'Celsius','°C'),(22,'Lumen','lm'),(23,'Lux','lx'),(24,'Becquerel','Bq'),(25,'Gray','Gy'),(26,'Sievert','Sv'),(27,'Katal','kat'),(28,'Ampere Hour','Ah');
/*!40000 ALTER TABLE `Unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UnitSiPrefixes`
--

DROP TABLE IF EXISTS `UnitSiPrefixes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UnitSiPrefixes` (
  `unit_id` int(11) NOT NULL,
  `siprefix_id` int(11) NOT NULL,
  PRIMARY KEY (`unit_id`,`siprefix_id`),
  KEY `IDX_72356740F8BD700D` (`unit_id`),
  KEY `IDX_723567409BE9F1F4` (`siprefix_id`),
  CONSTRAINT `FK_723567409BE9F1F4` FOREIGN KEY (`siprefix_id`) REFERENCES `SiPrefix` (`id`),
  CONSTRAINT `FK_72356740F8BD700D` FOREIGN KEY (`unit_id`) REFERENCES `Unit` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UnitSiPrefixes`
--

LOCK TABLES `UnitSiPrefixes` WRITE;
/*!40000 ALTER TABLE `UnitSiPrefixes` DISABLE KEYS */;
INSERT INTO `UnitSiPrefixes` VALUES (1,8),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(2,8),(2,11),(2,14),(3,11),(3,14),(4,11),(5,11),(6,14),(7,8),(7,11),(7,14),(7,15),(7,16),(7,17),(8,5),(8,6),(8,8),(8,11),(8,14),(8,15),(9,8),(9,11),(9,14),(10,5),(10,6),(10,8),(10,11),(10,14),(11,8),(11,11),(12,8),(12,11),(12,14),(13,8),(13,11),(13,14),(13,15),(14,6),(14,7),(14,8),(14,11),(14,14),(14,15),(15,8),(15,11),(16,11),(16,14),(16,15),(16,16),(16,17),(17,11),(17,14),(18,11),(19,11),(20,11),(20,14),(20,15),(21,11),(22,11),(23,11),(24,11),(25,11),(26,11),(26,14),(26,15),(27,11),(28,8),(28,11),(28,14);
/*!40000 ALTER TABLE `UnitSiPrefixes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserPreference`
--

DROP TABLE IF EXISTS `UserPreference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserPreference` (
  `user_id` int(11) NOT NULL,
  `preferenceKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `preferenceValue` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`preferenceKey`,`user_id`),
  KEY `IDX_922CE7A2A76ED395` (`user_id`),
  CONSTRAINT `FK_922CE7A2A76ED395` FOREIGN KEY (`user_id`) REFERENCES `PartKeeprUser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserPreference`
--

LOCK TABLES `UserPreference` WRITE;
/*!40000 ALTER TABLE `UserPreference` DISABLE KEYS */;
INSERT INTO `UserPreference` VALUES (1,'partkeepr.categorytree.showdescriptions','s:4:\"true\";'),(1,'partkeepr.formatting.currency.currencySymbolAtEnd','s:5:\"false\";'),(1,'partkeepr.formatting.currency.numdecimals','s:1:\"2\";'),(1,'partkeepr.formatting.currency.symbol','s:2:\"\"\"\";'),(1,'partkeepr.formatting.currency.thousandsSeparator','s:4:\"true\";'),(1,'partkeepr.inline-stock-change.confirm','s:5:\"false\";'),(1,'partkeepr.partmanager.compactlayout','s:5:\"false\";'),(1,'partkeepr.tipoftheday.showtips','s:4:\"true\";'),(2,'partkeepr.tipoftheday.showtips','s:4:\"true\";'),(3,'partkeepr.tipoftheday.showtips','s:4:\"true\";'),(1,'partkeepr.user.theme','s:9:\"\"classic\"\";'),(2,'partkeepr.user.theme','s:7:\"\"crisp\"\";'),(3,'partkeepr.user.theme','s:7:\"\"crisp\"\";');
/*!40000 ALTER TABLE `UserPreference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserProvider`
--

DROP TABLE IF EXISTS `UserProvider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserProvider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `editable` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserProvider`
--

LOCK TABLES `UserProvider` WRITE;
/*!40000 ALTER TABLE `UserProvider` DISABLE KEYS */;
INSERT INTO `UserProvider` VALUES (1,'Builtin',1);
/*!40000 ALTER TABLE `UserProvider` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-16  7:33:50
