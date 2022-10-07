WARNING: --master-data is deprecated and will be removed in a future version. Use --source-data instead.
-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: assignment2
-- ------------------------------------------------------
-- Server version	8.0.29-0ubuntu0.20.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Position to start replication or point-in-time recovery from
--

-- CHANGE MASTER TO MASTER_LOG_FILE='binlog.000003', MASTER_LOG_POS=157;

--
-- Current Database: `assignment2`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `assignment2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `assignment2`;

--
-- Table structure for table `airline`
--

DROP TABLE IF EXISTS `airline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airline` (
  `carrier_code` varchar(2) NOT NULL,
  `airline_name` varchar(30) NOT NULL,
  `country_code` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`carrier_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airline`
--

LOCK TABLES `airline` WRITE;
/*!40000 ALTER TABLE `airline` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `airline` VALUES ('AA','US Airways','US'),('AC','Air Canada','CA'),('AF','Air France','FR'),('AZ','Air Italia','IT'),('BA','British Airways','UK'),('LH','Luftansa Air','DE');
/*!40000 ALTER TABLE `airline` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `country_code` varchar(2) NOT NULL,
  `country_name` varchar(60) DEFAULT NULL,
  `currency_code` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`country_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `country` VALUES ('BR','Brazil','BRL'),('CA','Canada','CAD'),('CO','Colombia','COP'),('DE','Germany','DM'),('FR','France','FF'),('IN','India','INR'),('IR','Iran','IRR'),('IT','Italy','ITL'),('NG','Nigeria','NGN'),('PH','Philippines','PHP'),('UK','UK','GBP'),('US','USA','USD');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `forex`
--

DROP TABLE IF EXISTS `forex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forex` (
  `from_ccy` varchar(3) NOT NULL,
  `to_ccy` varchar(3) NOT NULL,
  `trade_date` date NOT NULL,
  `exch_rate` float(10,4) NOT NULL,
  PRIMARY KEY (`from_ccy`,`to_ccy`,`trade_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forex`
--

LOCK TABLES `forex` WRITE;
/*!40000 ALTER TABLE `forex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `forex` VALUES ('CAD','DM','2022-10-06',0.7521),('CAD','FF','2022-10-06',0.7430),('CAD','GBP','2022-10-06',0.6524),('CAD','ITL','2022-10-06',0.7724),('CAD','USD','2022-10-06',0.7279),('USD','CAD','2022-10-06',1.3739),('USD','DM','2022-10-06',1.0394),('USD','FF','2022-10-06',1.0209),('USD','GBP','2022-10-06',0.8964),('USD','ITL','2022-10-06',1.0399);
/*!40000 ALTER TABLE `forex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping events for database 'assignment2'
--

--
-- Dumping routines for database 'assignment2'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-07  2:23:36
