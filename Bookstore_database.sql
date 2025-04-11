-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: bookstore
-- ------------------------------------------------------
-- Server version	9.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `ISBN` varchar(20) NOT NULL,
  `Title` varchar(100) NOT NULL,
  `Author` varchar(100) NOT NULL,
  `Publisher` varchar(100) DEFAULT NULL,
  `Genre` varchar(50) DEFAULT NULL,
  `PublicationYear` int DEFAULT NULL,
  `AvailabilityStatus` varchar(20) DEFAULT NULL,
  `CopyID` int DEFAULT NULL,
  PRIMARY KEY (`ISBN`),
  KEY `fk_Book_Copy` (`CopyID`),
  CONSTRAINT `fk_Book_Copy` FOREIGN KEY (`CopyID`) REFERENCES `copy` (`CopyID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrowtransaction`
--

DROP TABLE IF EXISTS `borrowtransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrowtransaction` (
  `TransactionID` int NOT NULL AUTO_INCREMENT,
  `CheckoutDate` date NOT NULL,
  `DueDate` date NOT NULL,
  `ReturnDate` date DEFAULT NULL,
  `BorrowStatus` varchar(20) DEFAULT 'Active',
  `CopyID` int NOT NULL,
  `ClientID` int NOT NULL,
  `StaffID` int DEFAULT NULL,
  PRIMARY KEY (`TransactionID`),
  KEY `fk_Trans_Copy` (`CopyID`),
  KEY `fk_Trans_Client` (`ClientID`),
  KEY `fk_Trans_Staff` (`StaffID`),
  CONSTRAINT `fk_Trans_Client` FOREIGN KEY (`ClientID`) REFERENCES `client` (`ClientID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_Trans_Copy` FOREIGN KEY (`CopyID`) REFERENCES `copy` (`CopyID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_Trans_Staff` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrowtransaction`
--

LOCK TABLES `borrowtransaction` WRITE;
/*!40000 ALTER TABLE `borrowtransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `borrowtransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `ClientID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `ContactInformation` varchar(100) DEFAULT NULL,
  `Membership` varchar(20) DEFAULT NULL,
  `AccountStatus` varchar(20) DEFAULT NULL,
  `MembershipTypeID` int DEFAULT NULL,
  PRIMARY KEY (`ClientID`),
  KEY `fk_Client_Membership` (`MembershipTypeID`),
  CONSTRAINT `fk_Client_Membership` FOREIGN KEY (`MembershipTypeID`) REFERENCES `membership` (`MembershipTypeID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `copy`
--

DROP TABLE IF EXISTS `copy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `copy` (
  `CopyID` int NOT NULL AUTO_INCREMENT,
  `Type` varchar(20) NOT NULL,
  `AvailabilityStatus` varchar(20) NOT NULL,
  PRIMARY KEY (`CopyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `copy`
--

LOCK TABLES `copy` WRITE;
/*!40000 ALTER TABLE `copy` DISABLE KEYS */;
/*!40000 ALTER TABLE `copy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `digitalmedia`
--

DROP TABLE IF EXISTS `digitalmedia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `digitalmedia` (
  `ID` varchar(20) NOT NULL,
  `Title` varchar(100) NOT NULL,
  `Creator` varchar(50) DEFAULT NULL,
  `Format` varchar(50) NOT NULL,
  `ReleaseYear` int DEFAULT NULL,
  `Genre` varchar(50) DEFAULT NULL,
  `AvailabilityStatus` varchar(20) DEFAULT NULL,
  `CopyID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_Digital_Copy` (`CopyID`),
  CONSTRAINT `fk_Digital_Copy` FOREIGN KEY (`CopyID`) REFERENCES `copy` (`CopyID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `digitalmedia`
--

LOCK TABLES `digitalmedia` WRITE;
/*!40000 ALTER TABLE `digitalmedia` DISABLE KEYS */;
/*!40000 ALTER TABLE `digitalmedia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fine`
--

DROP TABLE IF EXISTS `fine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fine` (
  `FineID` int NOT NULL AUTO_INCREMENT,
  `CopyID` int NOT NULL,
  `ClientID` int NOT NULL,
  `DueDate` date DEFAULT NULL,
  `FineAmount` decimal(5,2) NOT NULL DEFAULT '0.00',
  `DatePaid` date DEFAULT NULL,
  PRIMARY KEY (`FineID`),
  KEY `fk_Fine_Copy` (`CopyID`),
  KEY `fk_Fine_Client` (`ClientID`),
  CONSTRAINT `fk_Fine_Client` FOREIGN KEY (`ClientID`) REFERENCES `client` (`ClientID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_Fine_Copy` FOREIGN KEY (`CopyID`) REFERENCES `copy` (`CopyID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fine_chk_1` CHECK ((`FineAmount` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fine`
--

LOCK TABLES `fine` WRITE;
/*!40000 ALTER TABLE `fine` DISABLE KEYS */;
/*!40000 ALTER TABLE `fine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magazine`
--

DROP TABLE IF EXISTS `magazine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `magazine` (
  `ID` varchar(20) NOT NULL,
  `Title` varchar(100) NOT NULL,
  `IssueNumber` varchar(20) NOT NULL,
  `PublicationDate` date DEFAULT NULL,
  `AvailabilityStatus` varchar(20) DEFAULT NULL,
  `CopyID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_Magazine_Copy` (`CopyID`),
  CONSTRAINT `fk_Magazine_Copy` FOREIGN KEY (`CopyID`) REFERENCES `copy` (`CopyID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magazine`
--

LOCK TABLES `magazine` WRITE;
/*!40000 ALTER TABLE `magazine` DISABLE KEYS */;
/*!40000 ALTER TABLE `magazine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membership`
--

DROP TABLE IF EXISTS `membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membership` (
  `MembershipTypeID` int NOT NULL AUTO_INCREMENT,
  `TypeName` varchar(50) NOT NULL,
  `BorrowLimit` int NOT NULL DEFAULT '5',
  `DailyFineRate` decimal(5,2) NOT NULL DEFAULT '0.25',
  PRIMARY KEY (`MembershipTypeID`),
  CONSTRAINT `membership_chk_1` CHECK ((`BorrowLimit` >= 0)),
  CONSTRAINT `membership_chk_2` CHECK ((`DailyFineRate` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membership`
--

LOCK TABLES `membership` WRITE;
/*!40000 ALTER TABLE `membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report` (
  `ReportID` int NOT NULL AUTO_INCREMENT,
  `DateOfGeneration` date NOT NULL,
  `Type` varchar(20) DEFAULT NULL,
  `StaffID` int NOT NULL,
  PRIMARY KEY (`ReportID`),
  KEY `fk_Report_Staff` (`StaffID`),
  CONSTRAINT `fk_Report_Staff` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `ReservationID` int NOT NULL AUTO_INCREMENT,
  `ClientID` int NOT NULL,
  `ItemID` int NOT NULL,
  `ReservationDate` date NOT NULL,
  `Status` varchar(20) NOT NULL,
  PRIMARY KEY (`ReservationID`),
  KEY `fk_Res_Client` (`ClientID`),
  KEY `fk_Res_Copy` (`ItemID`),
  CONSTRAINT `fk_Res_Client` FOREIGN KEY (`ClientID`) REFERENCES `client` (`ClientID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Res_Copy` FOREIGN KEY (`ItemID`) REFERENCES `copy` (`CopyID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `StaffID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Age` int DEFAULT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `SSN` varchar(20) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  PRIMARY KEY (`StaffID`),
  CONSTRAINT `staff_chk_1` CHECK ((`Age` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-11  4:00:16
