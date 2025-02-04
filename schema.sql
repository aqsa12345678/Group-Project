-- MySQL dump 10.13  Distrib 9.2.0, for macos14.7 (x86_64)
--
-- Host: localhost    Database: PAANN
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `Allele`
--

DROP TABLE IF EXISTS `Allele`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Allele` (
  `SNP_ID` varchar(45) NOT NULL,
  `Reference` varchar(50) NOT NULL,
  `Alternate` varchar(50) NOT NULL,
  PRIMARY KEY (`SNP_ID`),
  CONSTRAINT `SNP_ID_Allele` FOREIGN KEY (`SNP_ID`) REFERENCES `SNP - central` (`SNP_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Chromosome`
--

DROP TABLE IF EXISTS `Chromosome`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Chromosome` (
  `Chromosome_Pos` varchar(100) NOT NULL,
  `SNP_ID` varchar(100) NOT NULL,
  PRIMARY KEY (`Chromosome_Pos`),
  KEY `SNP_ID_Chromosome_idx` (`SNP_ID`),
  CONSTRAINT `SNP_ID_Chromosome` FOREIGN KEY (`SNP_ID`) REFERENCES `SNP - central` (`SNP_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Gene`
--

DROP TABLE IF EXISTS `Gene`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Gene` (
  `Gene_ID` varchar(100) NOT NULL,
  `Gene_Name` varchar(100) NOT NULL,
  PRIMARY KEY (`Gene_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Population`
--

DROP TABLE IF EXISTS `Population`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Population` (
  `Population_ID` varchar(100) NOT NULL,
  `SNP_ID` varchar(100) NOT NULL,
  PRIMARY KEY (`Population_ID`),
  KEY `SNP_ID_POP_idx` (`SNP_ID`),
  CONSTRAINT `SNP_ID_POP` FOREIGN KEY (`SNP_ID`) REFERENCES `SNP - central` (`SNP_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Population_SNP`
--

DROP TABLE IF EXISTS `Population_SNP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Population_SNP` (
  `Population_ID` varchar(100) NOT NULL,
  `SNP_ID` varchar(100) NOT NULL,
  `Allele_freq` float NOT NULL,
  PRIMARY KEY (`Population_ID`,`SNP_ID`),
  KEY `SNP_ID_PopSNP_idx` (`SNP_ID`),
  CONSTRAINT `SNP_ID_PopSNP` FOREIGN KEY (`SNP_ID`) REFERENCES `SNP - central` (`SNP_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SNP - central`
--

DROP TABLE IF EXISTS `SNP - central`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SNP - central` (
  `SNP_ID` varchar(100) NOT NULL,
  `Genomic_Coordinates` varchar(100) NOT NULL,
  `P_Value` float NOT NULL,
  `Mapped_Gene` varchar(100) NOT NULL,
  PRIMARY KEY (`SNP_ID`),
  KEY `Genomic_Coordinates` (`Genomic_Coordinates`),
  KEY `Mapped_Gene` (`Mapped_Gene`),
  CONSTRAINT `Mapped_Gene` FOREIGN KEY (`Mapped_Gene`) REFERENCES `Gene` (`Gene_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Summary_Statistics`
--

DROP TABLE IF EXISTS `Summary_Statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Summary_Statistics` (
  `SNP_ID` varchar(100) NOT NULL,
  `Tajima's D` float NOT NULL,
  `FST` float NOT NULL,
  `iHS` float NOT NULL,
  `MK test` float NOT NULL,
  PRIMARY KEY (`SNP_ID`),
  CONSTRAINT `SNP_ID_SS` FOREIGN KEY (`SNP_ID`) REFERENCES `SNP - central` (`SNP_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-04 11:51:25
