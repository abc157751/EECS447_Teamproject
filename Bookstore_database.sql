-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: bookstore_database
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
  `CopyID` bigint unsigned DEFAULT NULL,
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
INSERT INTO `book` VALUES ('1023832279531','Twilight Covenant','Orion Black','Wandering Word Works','Mystery',2011,'No',488808576803),('1273754815743','Shadows of Eternity','Elena Winters','Silver Quill Press','Fantasy',1974,'No',491485519980),('3233694870907','Labyrinth of Souls','Mira Langley','Stormwatch Publications','Biography',1972,'No',426357542125),('3262456709743','The Crystal Code','Marcus Thorn','Midnight Lantern Publishing','Fiction',1980,'No',323189472559),('3621070726942','The Hollow Crown','Evelyn Storm','Crimson Hearth Books','Romance',1996,'No',705529635231),('4029656002307','Echoes of Tomorrow','Julian Frost','Ironbound Books','Non-Fiction',1967,'Yes',658393445831),('4887721181798','Whispers in the Wind','Isabella Drake','Starlight House','Biography',1968,'No',771900436262),('5407350920242','Sands of Time','Ivy Nightshade','Golden Atlas Publishing','History',1981,'No',785782374802),('5421207680208','Beneath the Iron Sky','Natalie Crowe','Echo Peak Publishing','Fiction',2012,'Yes',778084897890),('5665528842083','Chronicles of the Void','Connor Vance','Emberlight Publications','History',1997,'Yes',984901710141),('5976911093807','Frozen Reverie','Dorian Cross','Moonrise Editions','Science Fiction',2022,'No',530239166629),('6030091410282','The Last Ember','Seraphina Moore','Northern Gate Books','Biography',1966,'Yes',946002405289),('6684668056401','Legacy of the Stars','Tristan Vale','Zephyrbound Press','Fantasy',1963,'Yes',550685652433),('672027792524','Voices from the Deep','Victor Stone','Twilight Beacon','Romance',1974,'No',565393293913),('6796154824223','Path of the Ancients','Aria Tempest','Radiant Leaf Press','Romance',1987,'No',354023658054),('6851259388489','The Ninth Horizon','Clara Voss','Sapphire Tome House','History',2024,'No',767151867182),('7721818335132','Realm of Secrets','Lydia Blackwood','Whispering Pines Press','Fantasy',2024,'No',411437495765),('8049194392752','The Forgotten Kingdom','Damien Hale','Celestial Ink','Mystery',2010,'No',139441916268),('8769680377543','Oath of Ashes','Rowan Vale','Phoenix Crest Press','Fantasy',1986,'No',925634441473),('9158736461602','Dreams of Glass','Gideon Stroud','Obsidian Scroll','Non-Fiction',1984,'No',106071650495),('MST0001','Mystery Dawn','Alice Chen','Penguin','Mystery',2021,'Available',9001),('MST0002','Mystery Dusk','Bob Li','HarperCollins','Mystery',2020,'Available',9003),('MST0003','Mystery Midnight','Carol Wang','Random House','Mystery',2019,'Borrowed',9002),('MST0004','Mystery Shadows','David Sun','Vintage','Mystery',2022,'Borrowed',9004),('MST0005','Mystery Echoes','Eve Zhang','Pan Macmillan','Mystery',2023,'Available',9005),('MST0006','Mystery Winds','Frank Gao','Tor','Mystery',2024,'Available',9006),('MST0007','Mystery Secrets','Grace Liu','Pan Macmillan','Mystery',2022,'Borrowed',9007),('MST0008','Mystery Codes','Henry Wu','Scholastic','Mystery',2020,'Available',9008);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrowtransaction`
--

DROP TABLE IF EXISTS `borrowtransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrowtransaction` (
  `TransactionID` bigint unsigned NOT NULL,
  `CheckoutDate` date NOT NULL,
  `DueDate` date NOT NULL,
  `ReturnDate` date DEFAULT NULL,
  `CopyID` bigint unsigned NOT NULL,
  `ClientID` bigint unsigned NOT NULL,
  `StaffID` bigint unsigned DEFAULT NULL,
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
INSERT INTO `borrowtransaction` VALUES (1001,'2024-01-15','2024-01-29',NULL,778084897890,779102014641,277043089914),(1002,'2024-01-17','2024-01-31','2024-01-30',925634441473,162788563211,277043089914),(1003,'2024-01-20','2024-02-03',NULL,18446744073709551615,392888992260,384994027174),(1004,'2024-01-22','2024-02-05','2024-02-01',18020094731993304080,926509076716,192707852656),(1005,'2024-01-25','2024-02-08',NULL,730795000000,777315144757,482225930755),(1006,'2024-01-27','2024-02-10',NULL,232557000000,670019806533,847157462649),(1007,'2024-01-30','2024-02-13','2024-02-12',31515362208,106325369465,655919975680),(1008,'2024-02-02','2024-02-16',NULL,963484000000,862536141388,18984280546),(1009,'2024-02-05','2024-02-19',NULL,213939000000,908358000255,841606709552),(1010,'2024-02-07','2024-02-21','2024-02-20',770388000000,664904820126,63911658753),(1011,'2025-03-01','2025-03-15',NULL,491485519980,242955608655,277043089914),(1012,'2025-03-03','2025-03-17',NULL,323189472559,98844556456,384994027174),(1013,'2025-03-05','2025-03-19',NULL,771900436262,600450083709,277043089914),(1014,'2025-03-07','2025-03-21',NULL,658393445831,72458122216,384994027174),(1015,'2025-03-09','2025-03-23',NULL,139441916268,368798545706,277043089914),(1016,'2025-03-11','2025-03-25','2025-03-22',411437495765,345462137506,384994027174),(1017,'2025-03-13','2025-03-27','2025-03-24',984901710141,534771852898,277043089914),(1018,'2025-03-15','2025-03-29','2025-03-26',946002405289,588022882666,384994027174),(1019,'2025-03-17','2025-03-31','2025-03-28',106071650495,386979565044,277043089914),(1020,'2025-03-19','2025-04-02','2025-03-30',354023658054,609741931457,384994027174),(1021,'2025-03-21','2025-04-04','2025-04-01',565393293913,963447298338,277043089914),(1022,'2025-03-23','2025-04-06','2025-04-03',426357542125,152491468918,384994027174),(1023,'2025-03-25','2025-04-08','2025-04-05',488808576803,65543315395,277043089914),(1024,'2025-03-27','2025-04-10','2025-04-07',767151867182,151534339699,384994027174),(1025,'2025-03-29','2025-04-12','2025-04-09',785782374802,363714941482,277043089914),(2001,'2025-01-01','2025-01-10',NULL,31515362208,44756014165,NULL),(2002,'2025-04-20','2025-04-30',NULL,50304107602,65543315395,NULL),(2003,'2025-03-01','2025-03-10','2025-03-12',91099697472,72458122216,18984280546),(2004,'2025-02-15','2025-02-25','2025-02-20',101184000000,80444014843,63911658753),(2005,'2025-01-05','2025-01-15',NULL,106071650495,98844556456,NULL),(2006,'2025-05-01','2025-05-08','2025-05-08',139441916268,100708262468,192707852656),(2007,'2024-06-05','2024-06-15','2024-06-14',171365000000,106325369465,277043089914),(2008,'2024-11-10','2024-11-20','2024-11-22',171753000000,108706256089,347903932193),(2009,'2025-04-10','2025-04-20','2025-04-19',213939000000,136178644349,384994027174),(2010,'2025-03-15','2025-03-25','2025-03-24',232557000000,151534339699,NULL),(2011,'2025-04-05','2025-04-15',NULL,262956000000,152491468918,NULL),(2012,'2025-04-07','2025-04-17','2025-04-16',301162000000,158774376402,482225930755),(3001,'2025-05-02','2025-05-05',NULL,91099697472,151534339699,NULL),(3002,'2025-05-03','2025-05-07',NULL,101184000000,152491468918,NULL),(3003,'2025-04-29','2025-05-08',NULL,139441916268,100708262468,NULL),(3004,'2025-05-01','2025-05-09',NULL,171365000000,106325369465,NULL),(3005,'2025-05-02','2025-05-06',NULL,171753000000,108706256089,192707852656),(3006,'2025-04-30','2025-05-03',NULL,232557000000,151534339699,NULL),(3007,'2025-05-01','2025-05-04',NULL,301162000000,152491468918,NULL),(3008,'2025-04-29','2025-05-05',NULL,213939000000,136178644349,NULL),(3009,'2025-05-02','2025-05-06',NULL,91099697472,72458122216,NULL),(3010,'2025-04-28','2025-05-07',NULL,139441916268,98844556456,NULL),(3011,'2025-05-03','2025-05-08',NULL,106071650495,65543315395,NULL),(3012,'2025-05-02','2025-05-09',NULL,171365000000,106325369465,NULL),(3013,'2025-04-27','2025-05-03',NULL,171753000000,108706256089,NULL),(3014,'2025-05-01','2025-05-04',NULL,31515362208,44756014165,NULL),(3015,'2025-04-26','2025-05-05',NULL,50304107602,80444014843,NULL);
/*!40000 ALTER TABLE `borrowtransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `ClientID` bigint unsigned NOT NULL,
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
INSERT INTO `client` VALUES (44756014165,'Timothy Garza','(513) 758-0660','C','Warning',2),(65543315395,'Elizabeth Vincent',NULL,'C','Inactive',2),(72458122216,'Angel Campbell','(759) 459-9246','C','Warning',2),(80444014843,'Monique Santana','(001) 045-0932','C','Warning',2),(98844556456,'Antonio Mcdonald','(116) 345-7923','C','Suspended',2),(100708262468,'Justin Roberts',NULL,'A','Inactive',0),(106325369465,'Amanda Zavala','(711) 220-1868','A','Inactive',0),(108706256089,'Brooke Mccarthy','(173) 864-0140','B','Suspended',1),(136178644349,'Steven Henderson','(161) 162-0766','B','Active',1),(151534339699,'Elizabeth Houston','(611) 877-5517','C','Active',2),(152491468918,'Brian Cross',NULL,'C','Active',2),(158774376402,'Stephanie Williams','(089) 933-1886','A','Inactive',0),(162788563211,'Danielle Browning','(001) 924-1157','C','Warning',2),(227259652028,'Briana Smith',NULL,'C','Suspended',2),(240123516435,'Lorraine Garcia','(153) 671-0979','C','Inactive',2),(242955608655,'Robert Giles','(869) 141-3145','A','Inactive',0),(320195254711,'Megan Hernandez','(609) 767-0172','C','Suspended',2),(331180881681,'Rodney Farrell','(873) 176-4303','C','Active',2),(345462137506,'Melissa Moore','(769) 606-9602','C','Warning',2),(363714941482,'Nicholas Kline','(961) 113-3060','B','Active',1),(368798545706,'Sandra Miller',NULL,'C','Active',2),(386979565044,'William Garcia','(104) 714-2851','A','Warning',0),(392888992260,'Christine Tran','(840) 801-6097','C','Suspended',2),(424533559245,'Michelle Roman','(180) 132-0407','C','Warning',2),(487380045830,'Miss Shelly Daniels DVM','(555) 082-4926','B','Active',1),(534771852898,'David Moore','(789) 007-5470','A','Active',0),(540877402763,'Tristan Davis',NULL,'B','Warning',1),(574947128222,'Mark Webb','(407) 970-3414','C','Inactive',2),(588022882666,'Mrs. Meghan Stewart','(008) 913-1934','A','Inactive',0),(600450083709,'Autumn Morse','(120) 769-8456','B','Suspended',1),(609741931457,'Michael Grant','(909) 776-5823','A','Active',0),(616208160855,'Ashley Ellis','(821) 972-9668','A','Suspended',0),(664904820126,'Alyssa Reid','(191) 615-1090','C','Warning',2),(670019806533,'Thomas Harris','(189) 471-9659','C','Warning',2),(690064463489,'Christopher Hernandez','(175) 868-8091','A','Active',0),(702703408825,'Emily Sanchez',NULL,'C','Active',2),(774490855370,'Steven Butler','(699) 300-2489','A','Active',0),(777315144757,'Eddie Martinez',NULL,'A','Active',0),(779102014641,'Norma Fisher','(876) 475-9382','C','Inactive',2),(799911506282,'Rachel Klein','(615) 349-2635','A','Active',0),(862536141388,'Stephanie Lawrence','(947) 751-5917','A','Active',0),(878829203004,'Terri Turner','(660) 223-4500','B','Inactive',1),(881493143287,'Daniel Rogers','(485) 291-1894','B','Warning',1),(908358000255,'Autumn Robinson','(560) 123-0989','C','Suspended',2),(913899456057,'Brian Rodriguez','(127) 626-6237','C','Warning',2),(926509076716,'Amy Stark','(328) 711-5871','A','Warning',0),(935868384284,'Tracy Reeves','(264) 183-0675','A','Active',0),(963447298338,'Chris Cook','(159) 004-2294','C','Inactive',2),(978212965548,'Thomas Rivers','(001) 415-1150','B','Inactive',1),(981758150271,'Donna Barnes','(290) 611-2648','A','Warning',0);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `copy`
--

DROP TABLE IF EXISTS `copy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `copy` (
  `CopyID` bigint unsigned NOT NULL,
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
INSERT INTO `copy` VALUES (9001,'Hardcover','Available'),(9002,'Paperback','Borrowed'),(9003,'Hardcover','Available'),(9004,'eBook','Borrowed'),(9005,'Paperback','Available'),(9006,'Hardcover','Available'),(9007,'eBook','Borrowed'),(9008,'Paperback','Available'),(31515362208,'DigitalMedia','Borrowed'),(50304107602,'DigitalMedia','Borrowed'),(91099697472,'DigitalMedia','Borrowed'),(101184000000,'DigitalMedia','Borrowed'),(106071650495,'Book','Borrowed'),(139441916268,'Book','Borrowed'),(171365000000,'DigitalMedia','Borrowed'),(171753000000,'DigitalMedia','Borrowed'),(213939000000,'DigitalMedia','Borrowed'),(232557000000,'DigitalMedia','Borrowed'),(262956000000,'DigitalMedia','Borrowed'),(301162000000,'DigitalMedia','Borrowed'),(323189472559,'Book','Available'),(337415000000,'DigitalMedia','Available'),(354023658054,'Book','Available'),(405912000000,'DigitalMedia','Available'),(411437495765,'Book','Available'),(426357542125,'Book','Available'),(433216000000,'DigitalMedia','Available'),(444570000000,'DigitalMedia','Available'),(488808576803,'Book','Available'),(491485519980,'Book','Available'),(497119000000,'DigitalMedia','Available'),(530239166629,'Book','Available'),(550685652433,'Book','Available'),(565393293913,'Book','Available'),(626674000000,'DigitalMedia','Available'),(636887000000,'DigitalMedia','Available'),(653070000000,'DigitalMedia','Available'),(658393445831,'Book','Available'),(705529635231,'Book','Available'),(730795000000,'DigitalMedia','Available'),(767151867182,'Book','Available'),(770388000000,'DigitalMedia','Available'),(771900436262,'Book','Available'),(778084897890,'Book','Available'),(785782374802,'Book','Available'),(790022000000,'DigitalMedia','Available'),(925634441473,'Book','Available'),(935982000000,'DigitalMedia','Available'),(946002405289,'Book','Available'),(963484000000,'DigitalMedia','Available'),(984901710141,'Book','Available'),(10752600121128046276,'Magazine','Available'),(14037923478426030347,'Magazine','Available'),(18020094731993304080,'Magazine','Available'),(18446744073709551615,'Magazine','Available');
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
  `CopyID` bigint unsigned DEFAULT NULL,
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
INSERT INTO `digitalmedia` VALUES ('227710000000','La casa de papel','Paule Rodell','Blu-ray',2021,'Crime','yes',301162000000),('230129000000','Saved by the Bell','Cairistiona Abbie','DVD',1994,'Children','no',31515362208),('324128000000','Rancho Notorious','Mella Janauschek','Blu-ray',2009,'Western','no',50304107602),('395777000000','Hit & Run','Moe Hoyes','Blu-ray',2021,'Mystery','no',337415000000),('435700000000','Tobot Galaxy Detectives','Nikoletta Connealy','DVD',2019,'Children','no',91099697472),('496599000000','School of Rock','Richard Linklater','DVD',2003,'Comedy','yes',262956000000),('539922000000','Beowulf','Robert Zemeckis','DVD',2007,'Fantasy','no',444570000000),('558347000000','Green Lantern','Martin Campbell','Blu-ray',2011,'Sci-Fi','yes',790022000000),('618148000000','Gridlock\'d','Merwyn Harriagn','DVD',1986,'Crime','yes',171753000000),('669280000000','Blade Runner: The Final Cut','Ridley Scott','DVD',1982,'Action','yes',497119000000),('675201000000','Ferris Bueller\'s Day Off','John Hughes','Blu-ray',1986,'Comedy','no',171365000000),('678339000000','The Howling','Somerset Goly','DVD',1992,'Horror','no',433216000000),('69015153056','Marshall','Reginald Hudlin','Blu-ray',2017,'Drama','yes',935982000000),('704559000000','The World\'s Most Amazing Vacation Rentals','Engelbert Shenley','DVD',2021,'Reality','no',770388000000),('707642000000','King of Boys','Kemi Adetiba','DVD',2018,'Drama','yes',213939000000),('726774000000','Paranoia','Robert Luketic','DVD',2013,'Thrillers','no',730795000000),('83218955767','Level 16','Danishka Esterhazy','DVD',2018,'Sci-Fi','yes',636887000000),('837187000000','A Cinderella Story','Mark Rosman','Blu-ray',2004,'Children','no',626674000000),('85913602825','Predictions of Fire','Paulina Haward','DVD',1992,'Documentary','no',963484000000),('894366000000','Jaws','Steven Spielberg','Blu-ray',1975,'Action','no',232557000000),('935952000000','Inception','Christopher Nolan','DVD',2010,'Thrillers','yes',405912000000),('982096000000','Bob Ross: Happy Accidents','Betrayal & Greed','Blu-ray',2021,'Documentary','yes',101184000000),('983241000000','The Englishman','Carina Ciobutaru','Blu-ray',2007,'Romance','no',653070000000);
/*!40000 ALTER TABLE `digitalmedia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fine`
--

DROP TABLE IF EXISTS `fine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fine` (
  `FineID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `TransactionID` bigint unsigned NOT NULL,
  `Amount` decimal(5,2) NOT NULL,
  `PaymentDate` date DEFAULT NULL,
  PRIMARY KEY (`FineID`),
  KEY `fk_Fine_Trans` (`TransactionID`),
  CONSTRAINT `fk_Fine_Trans` FOREIGN KEY (`TransactionID`) REFERENCES `borrowtransaction` (`TransactionID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9168790051 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fine`
--

LOCK TABLES `fine` WRITE;
/*!40000 ALTER TABLE `fine` DISABLE KEYS */;
INSERT INTO `fine` VALUES (1319303452,1012,1.00,'2023-05-13'),(1708487944,1014,4.00,'2023-07-28'),(4066723545,1011,16.00,'2023-05-20'),(7979615417,1015,0.50,'2023-11-18'),(9168790045,1013,2.00,'2023-07-14'),(9168790046,2001,28.00,NULL),(9168790047,2003,0.50,'2025-03-13'),(9168790048,2005,26.75,NULL),(9168790049,2008,0.50,'2024-11-23'),(9168790050,2011,0.00,NULL);
/*!40000 ALTER TABLE `fine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magazine`
--

DROP TABLE IF EXISTS `magazine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `magazine` (
  `ID` varchar(50) NOT NULL,
  `Title` varchar(100) NOT NULL,
  `IssueNumber` varchar(20) NOT NULL,
  `PublicationDate` date DEFAULT NULL,
  `AvailabilityStatus` varchar(20) DEFAULT NULL,
  `CopyID` bigint unsigned DEFAULT NULL,
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
INSERT INTO `magazine` VALUES ('11050203816882597162','Autocar','822','1998-03-16','Available',18446744073709551615),('12663784891363892912','National Geographic','940','2014-05-14','Available',18446744073709551615),('14131106827042409105','TIME','72','2024-02-01','Available',18446744073709551615),('14826729814846290022','Nature','673','2024-02-02','Available',18446744073709551615),('16596213807127021220','Road & Track','796','2007-09-16','Available',10752600121128046276),('16802116532868856372','Forbes','579','2024-05-01','Available',18446744073709551615),('24452447094200899317','Motor Trend','918','2006-08-18','Available',18020094731993304080),('31433342416844503857','The New Yorker','280','2024-06-01','Available',18446744073709551615),('32665537064772465207','New Scientist','751','2020-01-11','Available',18446744073709551615),('53382725813343369496','Elle','316','2000-12-01','Available',18446744073709551615),('55546063833112115344','Popular Science','640','2012-11-01','Available',18446744073709551615),('62101756267638911122','Scientific American','400','2024-03-05','Available',14037923478426030347),('66511524920328405331','GQ','993','2024-11-01','Available',18446744073709551615),('75212912953541359066','The Economist','142','2024-03-01','Available',18446744073709551615),('77560604328349747458','W Magazine','961','2024-02-17','Available',18446744073709551615),('77576093034374493339','Harper\'s Bazaar','301','2023-07-12','Available',18446744073709551615),('87902198241574797489','Vogue','881','2021-02-05','Available',18446744073709551615),('90639621556383653871','Top Gear Magazine','336','2013-04-01','Available',18446744073709551615),('90877976502182879450','Newsweek','948','2024-04-01','Available',18446744073709551615),('91364862083766535851','Car and Driver','831','2015-03-16','Available',18446744073709551615);
/*!40000 ALTER TABLE `magazine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membership`
--

DROP TABLE IF EXISTS `membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membership` (
  `MembershipTypeID` int NOT NULL,
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
INSERT INTO `membership` VALUES (0,'A',5,0.00),(1,'B',3,0.25),(2,'C',1,1.00);
/*!40000 ALTER TABLE `membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report` (
  `ReportID` bigint unsigned NOT NULL,
  `DateOfGeneration` date NOT NULL,
  `Type` varchar(20) DEFAULT NULL,
  `StaffID` bigint unsigned NOT NULL,
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
INSERT INTO `report` VALUES (81326531512,'2016-05-12','revenue',277043089914),(290084112145,'2019-09-24','revenue',482225930755),(521230953672,'2006-07-24','popularity',847157462649),(941415280066,'2001-03-17','monthly',192707852656),(990121808357,'2021-03-06','revenue',384994027174);
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `ReservationID` int NOT NULL,
  `ClientID` bigint unsigned NOT NULL,
  `ItemID` bigint unsigned NOT NULL,
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
INSERT INTO `reservation` VALUES (501,779102014641,778084897890,'2024-01-10','Fulfilled'),(502,162788563211,925634441473,'2024-01-12','Fulfilled'),(503,392888992260,18446744073709551615,'2024-01-15','Fulfilled'),(504,926509076716,18020094731993304080,'2024-01-17','Fulfilled'),(505,777315144757,730795000000,'2024-01-20','Fulfilled'),(506,670019806533,232557000000,'2024-01-22','Fulfilled'),(507,106325369465,31515362208,'2024-01-25','Fulfilled'),(508,862536141388,963484000000,'2024-01-28','Fulfilled'),(509,908358000255,213939000000,'2024-01-30','Fulfilled'),(510,664904820126,770388000000,'2024-02-02','Fulfilled');
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `StaffID` bigint unsigned NOT NULL,
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
INSERT INTO `staff` VALUES (18984280546,'Paula Palmer',21,'(844) 301-9126','886 David Rue, Davidshire, IN 88959','734-91-8957','2004-03-31'),(63911658753,'Stephanie Rodriguez',35,'(895) 774-0382','785 Jonathon Rapids Suite 354, Acevedoborough, MD 95719','766-32-5623','1989-04-25'),(192707852656,'Brian Smith',63,'(432) 943-1675','72852 Renee Mills Suite 667, Blairborough, IL 77378','728-07-6363','1961-07-23'),(277043089914,'Michelle Wallace',55,'(001) 454-3910','64482 Amanda Loop, Figueroaview, NV 49234','582-81-2258','1969-12-24'),(347903932193,'Mary Perez',39,'(240) 598-0250','51056 Patricia Forge, Grahamstad, HI 85576','337-94-6696','1985-05-02'),(384994027174,'Bryan Morales',65,'(284) 576-3778','709 Anthony Mountains, Onealtown, NC 09211','704-11-6474','1959-09-24'),(482225930755,'Bradley Lopez',39,'(239) 491-8456','774 Lewis Grove Apt. 002, Adamtown, CA 56566','697-29-9972','1986-04-11'),(655919975680,'Juan Smith',52,'(706) 777-1113','8602 Tracy Crossroad, Sarahmouth, CT 73515','293-79-8865','1972-12-25'),(841606709552,'Patrick Valenzuela',56,'(845) 357-4922','9026 Theresa Pass Apt. 237, East Jessica, IN 50912','362-78-9684','1968-04-24'),(847157462649,'Connie Lee',62,'(119) 155-8754','533 Chambers Street, Larryfurt, NJ 45581','893-92-3932','1962-04-28');
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

-- Dump completed on 2025-05-03  6:30:52
