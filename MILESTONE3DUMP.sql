CREATE DATABASE  IF NOT EXISTS `mm_sttest2b` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `mm_sttest2b`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: cssql.seattleu.edu    Database: mm_sttest2b
-- ------------------------------------------------------
-- Server version	5.5.60-MariaDB

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
-- Table structure for table `Booking`
--

DROP TABLE IF EXISTS `Booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Booking` (
  `Booking_Date_Time` datetime NOT NULL,
  `Booking_Party_Size` int(11) NOT NULL,
  `Table_ID` int(11) NOT NULL,
  `Customer_ID` int(11) NOT NULL,
  `Comments` varchar(45) DEFAULT NULL,
  `Cancelled` tinyint(1) NOT NULL,
  `Completed` tinyint(4) NOT NULL DEFAULT '0',
  `Walk_In_Time` datetime DEFAULT NULL,
  PRIMARY KEY (`Table_ID`,`Customer_ID`,`Booking_Date_Time`),
  KEY `Table_ID_idx` (`Table_ID`),
  KEY `Customer_ID_idx` (`Customer_ID`),
  CONSTRAINT `Customer_ID` FOREIGN KEY (`Customer_ID`) REFERENCES `Customer` (`Customer_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Table_ID` FOREIGN KEY (`Table_ID`) REFERENCES `List_of_Tables` (`Table_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Booking`
--

LOCK TABLES `Booking` WRITE;
/*!40000 ALTER TABLE `Booking` DISABLE KEYS */;
INSERT INTO `Booking` VALUES ('2018-12-25 12:00:00',8,1,1,NULL,0,1,'2018-12-25 11:30:00'),('2018-09-05 13:00:00',2,1,7,'Booth table',1,0,'2018-09-05 12:45:00'),('2018-02-25 17:00:00',4,3,4,'Birthday Party',0,1,'2018-02-25 16:30:00'),('2018-11-02 17:00:00',1,3,4,NULL,0,0,'2018-11-02 16:45:00'),('2018-09-09 11:30:00',3,3,9,'Child seat',0,1,'2018-09-09 11:12:00'),('2018-11-01 17:00:00',4,4,4,NULL,0,0,'2018-11-01 16:33:00'),('2018-11-02 17:00:00',5,4,4,NULL,0,0,'2018-11-02 16:25:00'),('2018-11-01 18:00:00',3,6,9,NULL,0,0,'2018-11-01 18:55:00'),('2018-10-31 13:00:00',3,8,5,'1 Child seat',0,1,'2018-10-31 12:15:00'),('2018-06-19 19:00:00',2,8,9,'Booth table',0,1,'2018-06-19 18:37:00'),('2018-11-01 19:00:00',9,10,2,NULL,0,0,'2018-11-01 18:25:00');
/*!40000 ALTER TABLE `Booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customer` (
  `Customer_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Customer_Name` varchar(45) NOT NULL,
  `Customer_Phone_Number` varchar(45) DEFAULT NULL,
  `Customer_Email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Customer_ID`),
  UNIQUE KEY `Customer_ID_UNIQUE` (`Customer_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES (1,'Bob Smith','4255551234','bobsmith@seattleu.edu'),(2,'Celeste','206-000-0001','broderickcel@seattleu.edu'),(4,'Eric Nunn','(425) 530-8058','nunneric@seattleu.edu'),(5,'Pabi Dhaliwal','2069999999','pdhaliwa@aol.com'),(6,'Lebron James','509-669-1286','TheChosenOne@gmail.com'),(7,'Dwyane Wade','405-567-9834','Flash@aol.com'),(8,'Kobe Bryant','345-657-8349','blackmamba@gmail.com'),(9,'Charles Wellington','206 - 234-5678','charles@gmail.com'),(10,'Tom Brady','null','theGoat@hotmail.com'),(11,'Barack Obama','704-123-1776','blackbarry@gmail.com'),(12,'Dallas Greene','425-555-0000','cityandcolour@gmail.com'),(13,'Per Knaphus','425-123-4567','randomemail@gmail.com'),(14,'George Washington','206-555-1776','george@uw.edu'),(15,'Mike Jordan','2064569839','MJ23@goat.com'),(26,'Mr.','2387312321',''),(27,'pabi charles','206454339488','dhafjkds@gmail.com'),(28,'adf adsf','2073456748','ajkdfhakdsf@gmail.com'),(29,'collin','20849583984','adhfkads@hotmail.com'),(30,'adf','asdfa','dagsdf@gmail.com'),(31,'Snoopy','2061234567','');
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employee` (
  `Employee_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Employee_First_Name` varchar(45) NOT NULL,
  `Employee_Last_Name` varchar(45) NOT NULL,
  `SSN` varchar(45) NOT NULL,
  `Phone_Number` varchar(45) NOT NULL,
  `Address` varchar(45) NOT NULL,
  `Emergency_Contact_Name` varchar(45) DEFAULT NULL,
  `Emergency_Contact_Phone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Employee_ID`),
  UNIQUE KEY `Staff_ID_UNIQUE` (`Employee_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES (1,'Will','Smith','123456789','206-123-4567','901 12th Avenue, Seattle','Mommy Smith','206-123-4568'),(2,'John','Bonham','111-22-3333','206-555-1111','123 Main St. Seattle WA 98101','Pat Phillips','206-555-1111'),(3,'Robert','Plant','222-33-4444','425-555-2222','45 Lake Dr. Bellevue, WA 98104','Maureen Wilson','425-555-2222'),(4,'Jimmy','Page','333-44-5555','360-555-3333','789 Woodsy Ln. Olympia, WA 98345','Scarlett Sabet','360-555-3333'),(5,'John Paul','Jones','444-55-6666','253-555-4444','567 So. Tacoma Way Tacoma, WA 98498','Maureen Jones','253-555-4444'),(6,'John','Lennon','121-23-3434','303-555-8989','654 Mulholland Dr Seattle WA 98101 90031','Yoko Ono','303-555-8989'),(7,'Paul','McCartney','232-34-4545','303-555-6767','321 La Cienega Blvd Seattle WA 98101 90031','Linda McCartney','303-555-2323'),(8,'George','Harrison','343-45-5656','303-555-2121','9876 Sunset Blvd Seattle WA 98101 90031','Olivia Harrison','303-555-2121'),(9,'Ringo','Starr','454-56-6767','303-555-7878','2345 Wilshire Blvd Seattle, WA 90031','Barbara Bach','303-555-7878'),(10,'Belinda','Carlisle','123-45-6789','213-555-0123','2233 Oak Ln Seattle, WA 98121','Morgan Mason','213-555-0123'),(11,'Jane','Wiedlin','234-56-7890','213-555-3456','4455 Elm St Seattle, WA 98122','Ged Malone','213-555-3456'),(12,'Charlotte','Caffey','345-67-8901','213-555-5678','6677 Maple St Seattle, WA 98123','Jeff McDonald','213-555-5678'),(13,'Gina','Schock','456-78-9012','213-555-7890','8899 Cedar Rd Seattle, WA 98124','Vance DeGeneres','213-555-7890'),(14,'Kathy','Valentine','567-89-0123','213-555-9012','11 Pine St Seattle WA 98125','Steven Weisburd','213-555-9012');
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee_Role`
--

DROP TABLE IF EXISTS `Employee_Role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employee_Role` (
  `Role_ID` int(11) NOT NULL,
  `Employee_ID` int(11) NOT NULL,
  `Notes` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`Role_ID`,`Employee_ID`),
  KEY `Role_ID_idx` (`Role_ID`),
  KEY `Employee_ID_idx` (`Employee_ID`),
  KEY `Employee_idx` (`Employee_ID`),
  CONSTRAINT `Employee` FOREIGN KEY (`Employee_ID`) REFERENCES `Employee` (`Employee_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Role_ID` FOREIGN KEY (`Role_ID`) REFERENCES `Role` (`Role_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee_Role`
--

LOCK TABLES `Employee_Role` WRITE;
/*!40000 ALTER TABLE `Employee_Role` DISABLE KEYS */;
INSERT INTO `Employee_Role` VALUES (1,9,NULL),(1,10,NULL),(1,11,NULL),(2,2,NULL),(3,3,NULL),(3,4,NULL),(4,5,NULL),(4,6,NULL),(5,12,NULL),(5,13,NULL),(5,14,NULL),(6,7,NULL),(6,8,NULL),(7,1,NULL),(8,9,NULL);
/*!40000 ALTER TABLE `Employee_Role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee_Schedule`
--

DROP TABLE IF EXISTS `Employee_Schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employee_Schedule` (
  `Employee_Schedule_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Employee_ID` int(11) NOT NULL,
  `Restaurant_Schedule_ID` int(11) NOT NULL,
  `Clock_in` datetime NOT NULL,
  `Clock_out` datetime NOT NULL,
  PRIMARY KEY (`Employee_Schedule_ID`),
  UNIQUE KEY `Employee_Schedule_ID_UNIQUE` (`Employee_Schedule_ID`),
  KEY `Employee_ID_idx` (`Employee_ID`),
  KEY `Restaurant_Schedule_idx` (`Restaurant_Schedule_ID`),
  CONSTRAINT `Employee_ID` FOREIGN KEY (`Employee_ID`) REFERENCES `Employee` (`Employee_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Restaurant_Schedule_ID` FOREIGN KEY (`Restaurant_Schedule_ID`) REFERENCES `Restaurant_Schedule` (`Restaurant_Schedule_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee_Schedule`
--

LOCK TABLES `Employee_Schedule` WRITE;
/*!40000 ALTER TABLE `Employee_Schedule` DISABLE KEYS */;
INSERT INTO `Employee_Schedule` VALUES (1,1,14,'2018-10-01 17:00:00','2018-10-01 23:00:00'),(2,1,14,'2018-10-02 17:00:00','2018-10-02 23:00:00'),(3,1,14,'2018-10-03 17:00:00','2018-10-03 23:00:00'),(4,1,14,'2018-10-04 17:00:00','2018-10-04 23:00:00'),(5,1,14,'2018-10-05 17:00:00','2018-10-05 23:00:00'),(6,3,14,'2018-10-01 17:00:00','2018-10-01 23:00:00'),(7,3,14,'2018-10-02 17:00:00','2018-10-02 23:00:00'),(8,3,14,'2018-10-03 17:00:00','2018-10-03 23:00:00'),(9,3,14,'2018-10-04 17:00:00','2018-10-04 23:00:00'),(10,3,14,'2018-10-05 17:00:00','2018-10-05 23:00:00'),(11,4,14,'2018-10-01 17:00:00','2018-10-01 23:00:00'),(12,4,14,'2018-10-02 17:00:00','2018-10-02 23:00:00'),(13,4,14,'2018-10-03 17:00:00','2018-10-03 23:00:00'),(14,4,14,'2018-10-04 17:00:00','2018-10-04 23:00:00'),(15,4,14,'2018-10-05 17:00:00','2018-10-05 23:00:00'),(16,2,14,'2018-10-01 08:00:00','2018-10-01 20:00:00'),(17,2,14,'2018-10-02 08:00:00','2018-10-02 20:00:00'),(18,2,14,'2018-10-03 08:00:00','2018-10-03 20:00:00'),(19,2,14,'2018-10-04 08:00:00','2018-10-04 20:00:00'),(20,2,14,'2018-10-05 08:00:00','2018-10-05 20:00:00'),(21,2,14,'2018-10-06 08:00:00','2018-10-06 20:00:00'),(22,5,14,'2018-09-30 17:00:00','2018-09-30 23:00:00'),(23,5,14,'2018-10-01 17:00:00','2018-10-01 23:00:00'),(24,5,14,'2018-10-02 17:00:00','2018-10-02 23:00:00'),(25,5,14,'2018-10-03 17:00:00','2018-10-03 23:00:00'),(26,6,14,'2018-10-04 17:00:00','2018-10-04 23:00:00'),(27,6,14,'2018-10-05 17:00:00','2018-10-05 23:00:00'),(28,6,14,'2018-10-06 17:00:00','2018-10-06 23:00:00'),(29,9,14,'2018-09-30 16:00:00','2018-09-30 23:00:00'),(30,9,14,'2018-10-01 16:00:00','2018-10-01 23:00:00'),(31,9,14,'2018-10-02 16:00:00','2018-10-02 23:00:00'),(32,9,14,'2018-10-03 16:00:00','2018-10-03 23:00:00'),(33,9,14,'2018-10-04 16:00:00','2018-10-04 23:00:00'),(34,9,14,'2018-10-05 16:00:00','2018-10-05 23:00:00'),(35,9,14,'2018-10-06 16:00:00','2018-10-06 23:00:00'),(36,7,14,'2018-09-30 15:00:00','2018-09-30 23:00:00'),(37,7,14,'2018-10-01 15:00:00','2018-10-01 23:00:00'),(38,7,14,'2018-10-04 15:00:00','2018-10-04 23:00:00'),(39,7,14,'2018-10-05 15:00:00','2018-10-05 23:00:00'),(40,7,14,'2018-10-06 15:00:00','2018-10-06 23:00:00'),(41,8,14,'2018-10-02 15:00:00','2018-10-02 23:00:00'),(42,8,14,'2018-10-03 15:00:00','2018-10-03 23:00:00'),(43,8,14,'2018-10-04 15:00:00','2018-10-04 23:00:00'),(44,8,14,'2018-10-05 15:00:00','2018-10-05 23:00:00'),(45,8,14,'2018-10-06 15:00:00','2018-10-06 23:00:00'),(52,10,14,'2018-10-01 15:00:00','2018-10-01 23:00:00'),(53,10,14,'2018-10-02 15:00:00','2018-10-02 23:00:00'),(54,10,14,'2018-10-03 15:00:00','2018-10-03 23:00:00'),(55,10,14,'2018-10-04 15:00:00','2018-10-04 23:00:00'),(56,10,14,'2018-10-05 15:00:00','2018-10-05 23:00:00'),(57,10,14,'2018-10-06 15:00:00','2018-10-06 23:00:00'),(58,11,14,'2018-09-30 15:00:00','2018-09-30 23:00:00'),(59,11,14,'2018-10-02 15:00:00','2018-10-02 23:00:00'),(60,11,14,'2018-10-03 15:00:00','2018-10-03 23:00:00'),(61,11,14,'2018-10-04 15:00:00','2018-10-04 23:00:00'),(62,11,14,'2018-10-05 15:00:00','2018-10-05 23:00:00'),(63,11,14,'2018-10-06 15:00:00','2018-10-06 23:00:00'),(64,12,14,'2018-09-30 15:00:00','2018-09-30 23:30:00'),(65,12,14,'2018-10-01 15:00:00','2018-10-01 23:30:00'),(66,12,14,'2018-10-03 15:00:00','2018-10-03 23:30:00'),(67,12,14,'2018-10-04 15:00:00','2018-10-04 23:30:00'),(68,12,14,'2018-10-05 15:00:00','2018-10-05 23:30:00'),(69,12,14,'2018-10-06 15:00:00','2018-10-06 23:30:00'),(70,13,14,'2018-10-01 15:00:00','2018-10-01 23:15:00'),(71,13,14,'2018-10-02 15:00:00','2018-10-02 23:15:00'),(72,13,14,'2018-10-03 15:00:00','2018-10-03 23:15:00'),(73,13,14,'2018-10-04 15:00:00','2018-10-04 23:15:00'),(74,13,14,'2018-10-05 15:00:00','2018-10-05 23:15:00'),(75,13,14,'2018-10-06 15:00:00','2018-10-06 23:15:00'),(76,14,14,'2018-09-30 15:00:00','2018-09-30 23:45:00'),(77,14,14,'2018-10-02 15:00:00','2018-10-02 23:45:00'),(78,14,14,'2018-10-03 15:00:00','2018-10-03 23:45:00'),(79,14,14,'2018-10-04 15:00:00','2018-10-04 23:45:00'),(80,14,14,'2018-10-05 15:00:00','2018-10-05 23:45:00'),(81,14,14,'2018-10-06 15:00:00','2018-10-06 23:45:00');
/*!40000 ALTER TABLE `Employee_Schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ingredients`
--

DROP TABLE IF EXISTS `Ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ingredients` (
  `Ingredients_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Ingredient_Item_Description` varchar(45) NOT NULL,
  `Ingredient_Type` varchar(45) NOT NULL,
  `Ingredient_Total_Qty` int(11) NOT NULL,
  PRIMARY KEY (`Ingredients_ID`),
  UNIQUE KEY `Ingredients_ID_UNIQUE` (`Ingredients_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ingredients`
--

LOCK TABLES `Ingredients` WRITE;
/*!40000 ALTER TABLE `Ingredients` DISABLE KEYS */;
INSERT INTO `Ingredients` VALUES (1,'heirloom tomato','produce',100),(2,'baby salad greens','produce',100),(3,'red onion','produce',100),(4,'carrots','produce',100),(5,'white wine vinegar','spices/oil',35),(6,'sea salt','spices/oil',35),(7,'black pepper','spices/oil',35),(8,'fresh basil','produce',35),(9,'chickpeas','bulk goods',70),(10,'virgin olive oil','spices/oil',70),(11,'red bell pepper','produce',70),(12,'cauliflower','produce',70),(13,'tahini','spices/oil',70),(14,'white flour','bulk goods',70),(15,'apples','produce',90),(16,'bananas','produce',90),(17,'grapes','produce',90),(18,'dates','produce',90),(19,'raisins','produce',90),(20,'walnuts','bulk goods',55),(21,'cashews','bulk goods',55),(22,'almonds','bulk goods',55),(23,'lettuce','produce',55),(24,'cabbage','produce',55),(25,'spinach','produce',55),(26,'arugula','produce',234),(27,'kale','produce',234),(28,'salmon','meat',234),(29,'halibut','meat',234),(30,'beef','meat',234),(31,'pork','meat',5),(32,'lamb','meat',5),(33,'prawns','meat',5),(34,'chicken','meat',5),(35,'turkey','meat',5),(36,'baking soda','bulk goods',200),(37,'butter','spices/oil',200);
/*!40000 ALTER TABLE `Ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inventory_Ingredient_Item`
--

DROP TABLE IF EXISTS `Inventory_Ingredient_Item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inventory_Ingredient_Item` (
  `Inventory_Order_ID` int(11) NOT NULL,
  `Ingredients_ID` int(11) NOT NULL,
  `Ingredient_Order_Qty` int(11) NOT NULL,
  `Vendor_ID` int(11) NOT NULL,
  PRIMARY KEY (`Inventory_Order_ID`,`Ingredients_ID`),
  KEY `Ingredients_ID_idx` (`Ingredients_ID`),
  KEY `Vendor_ID_idx` (`Vendor_ID`),
  CONSTRAINT `FK_Vendor_ID` FOREIGN KEY (`Vendor_ID`) REFERENCES `Inventory_Order` (`Vendor_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Ingredients_ID` FOREIGN KEY (`Ingredients_ID`) REFERENCES `Ingredients` (`Ingredients_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Inventory_Order_ID` FOREIGN KEY (`Inventory_Order_ID`) REFERENCES `Inventory_Order` (`Inventory_Order_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inventory_Ingredient_Item`
--

LOCK TABLES `Inventory_Ingredient_Item` WRITE;
/*!40000 ALTER TABLE `Inventory_Ingredient_Item` DISABLE KEYS */;
INSERT INTO `Inventory_Ingredient_Item` VALUES (1,1,10,1),(1,2,9,1),(1,3,8,1),(2,4,22,1),(2,8,4,1),(2,9,56,1),(2,11,3,1),(2,12,45,1),(3,1,2,1),(3,2,34,1),(3,3,5,1),(4,4,7,1),(4,8,9,1),(4,9,11,1),(4,11,4,1),(4,12,5,1),(5,1,6,1),(5,2,78,1),(5,3,7,1),(6,4,5,1),(6,8,4,1),(6,9,3,1),(6,11,3,1),(6,12,3,1),(7,1,4,1),(7,2,5,1),(7,3,6,1),(8,4,7,1),(8,8,8,1),(8,9,8,1),(8,11,8,1),(8,12,9,1),(9,15,9,11),(9,16,9,11),(9,17,88,11),(9,18,7,11),(9,19,7,11),(10,15,8,11),(10,16,8,11),(10,17,32,11),(10,18,44,11),(10,19,3,11),(11,15,3,11),(11,16,4,11),(11,17,5,11),(11,18,66,11),(11,19,10,11),(12,15,5,11),(12,16,4,11),(12,17,4,11),(12,18,5,11),(12,19,10,11),(13,15,54,11),(13,16,77,11),(13,17,8,11),(13,18,7,11),(13,19,10,11),(14,15,6,11),(14,16,9,11),(14,17,10,11),(14,18,6,11),(14,19,7,11),(15,15,66,11),(15,16,64,11),(15,17,11,11),(15,18,32,11),(15,19,2,11),(16,15,25,11),(16,16,36,11),(16,17,10,11),(16,18,4,11),(16,19,4,11),(17,30,4,2),(17,31,4,2),(17,35,4,2),(18,30,5,2),(18,31,6,2),(18,35,5,2),(19,30,10,2),(19,31,2,2),(19,35,2,2),(20,30,3,2),(20,31,77,2),(20,35,6,2),(21,28,55,3),(21,29,4,3),(21,33,6,3),(22,28,8,3),(22,29,88,3),(22,33,8,3),(23,28,6,3),(23,29,6,3),(23,33,6,3),(24,28,6,3),(24,29,6,3),(24,33,5,3),(25,28,10,3),(25,29,4,3),(25,33,5,3),(26,28,6,3),(26,29,12,3),(26,33,14,3),(27,28,5,3),(27,29,121,3),(27,33,23,3),(28,28,10,3),(28,29,43,3),(28,33,3,3),(29,32,2,4),(29,34,3,4),(30,32,4,4),(30,34,55,4),(31,32,6,4),(31,34,5,4),(32,32,44,4),(32,34,10,4),(33,32,3,4),(33,34,3,4),(34,32,4,4),(34,34,11,4),(35,32,20,4),(35,34,22,4),(36,32,20,4),(36,34,34,4),(37,5,31,5),(37,6,31,5),(37,7,31,5),(37,10,31,5),(37,13,31,5),(37,14,31,5),(37,37,3,5),(38,5,5,5),(38,6,5,5),(38,7,6,5),(38,10,6,5),(38,13,12,5),(38,14,12,5),(38,37,12,5),(39,5,12,5),(39,6,12,5),(39,7,15,5),(39,10,15,5),(39,13,15,5),(39,14,15,5),(39,37,15,5),(40,5,15,5),(40,6,15,5),(40,7,15,5),(40,10,15,5),(40,13,15,5),(40,14,15,5),(40,37,15,5),(41,20,15,6),(41,21,32,6),(41,22,32,6),(41,26,32,6),(41,27,32,6),(42,20,21,6),(42,21,21,6),(42,22,21,6),(42,26,21,6),(42,27,21,6),(43,20,15,6),(43,21,15,6),(43,22,15,6),(43,26,15,6),(43,27,15,6),(45,20,15,6),(45,21,15,6),(45,22,15,6),(45,26,15,6),(45,27,15,6),(49,23,2,9),(49,24,22,9),(49,25,3,9),(50,23,9,9),(50,24,9,9),(50,25,9,9),(51,23,98,9),(51,24,8,9),(51,25,7,9),(52,23,7,9),(52,24,7,9),(52,25,8,9),(53,36,7,10),(54,36,7,10);
/*!40000 ALTER TABLE `Inventory_Ingredient_Item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inventory_Order`
--

DROP TABLE IF EXISTS `Inventory_Order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inventory_Order` (
  `Inventory_Order_ID` int(11) NOT NULL,
  `Vendor_ID` int(11) NOT NULL,
  `Order_Date` date NOT NULL,
  `Is_Ingredient` tinyint(4) NOT NULL,
  PRIMARY KEY (`Inventory_Order_ID`),
  UNIQUE KEY `Inventory_Order_ID_UNIQUE` (`Inventory_Order_ID`),
  KEY `Vendor_ID_idx` (`Vendor_ID`),
  CONSTRAINT `Vendor_ID` FOREIGN KEY (`Vendor_ID`) REFERENCES `Vendors` (`Vendor_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inventory_Order`
--

LOCK TABLES `Inventory_Order` WRITE;
/*!40000 ALTER TABLE `Inventory_Order` DISABLE KEYS */;
INSERT INTO `Inventory_Order` VALUES (1,1,'2018-10-02',1),(2,1,'2018-10-05',1),(3,1,'2018-10-09',1),(4,1,'2018-10-12',1),(5,1,'2018-10-16',1),(6,1,'2018-10-19',1),(7,1,'2018-10-22',1),(8,1,'2018-10-26',1),(9,11,'2018-10-02',1),(10,11,'2018-10-05',1),(11,11,'2018-10-09',1),(12,11,'2018-10-12',1),(13,11,'2018-10-16',1),(14,11,'2018-10-19',1),(15,11,'2018-10-22',1),(16,11,'2018-10-26',1),(17,2,'2018-10-04',1),(18,2,'2018-10-11',1),(19,2,'2018-10-18',1),(20,2,'2018-10-25',1),(21,3,'2018-10-02',1),(22,3,'2018-10-05',1),(23,3,'2018-10-09',1),(24,3,'2018-10-12',1),(25,3,'2018-10-16',1),(26,3,'2018-10-19',1),(27,3,'2018-10-23',1),(28,3,'2018-10-26',1),(29,4,'2018-10-02',1),(30,4,'2018-10-05',1),(31,4,'2018-10-09',1),(32,4,'2018-10-12',1),(33,4,'2018-10-16',1),(34,4,'2018-10-19',1),(35,4,'2018-10-23',1),(36,4,'2018-10-26',1),(37,5,'2018-10-04',1),(38,5,'2018-10-11',1),(39,5,'2018-10-18',1),(40,5,'2018-10-25',1),(41,6,'2018-10-03',1),(42,6,'2018-10-10',1),(43,6,'2018-10-17',1),(45,6,'2018-10-24',1),(46,7,'2018-10-01',0),(47,7,'2018-10-15',0),(48,8,'2018-10-03',0),(49,9,'2018-10-01',1),(50,9,'2018-10-08',1),(51,9,'2018-10-15',1),(52,9,'2018-10-22',1),(53,10,'2018-10-08',0),(54,10,'2018-10-22',0);
/*!40000 ALTER TABLE `Inventory_Order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inventory_Supply_Item`
--

DROP TABLE IF EXISTS `Inventory_Supply_Item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inventory_Supply_Item` (
  `Inventory_Order_ID` int(11) NOT NULL,
  `Supplies_ID` int(11) NOT NULL,
  `Supply_Order_Qty` int(11) NOT NULL,
  `Vendor_ID` int(11) NOT NULL,
  PRIMARY KEY (`Inventory_Order_ID`,`Supplies_ID`),
  KEY `Inventory_Order_ID_idx` (`Supplies_ID`),
  KEY `Inventory_OrderSupply_ID_idx` (`Inventory_Order_ID`),
  KEY `Vendor_ID_idx` (`Vendor_ID`),
  CONSTRAINT `FK2_Vendor_ID` FOREIGN KEY (`Vendor_ID`) REFERENCES `Inventory_Order` (`Vendor_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Inventory_OrderSupply_ID` FOREIGN KEY (`Inventory_Order_ID`) REFERENCES `Inventory_Order` (`Inventory_Order_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Supply_ID` FOREIGN KEY (`Supplies_ID`) REFERENCES `Supplies` (`Supply_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inventory_Supply_Item`
--

LOCK TABLES `Inventory_Supply_Item` WRITE;
/*!40000 ALTER TABLE `Inventory_Supply_Item` DISABLE KEYS */;
INSERT INTO `Inventory_Supply_Item` VALUES (46,2,10,7),(46,4,10,7),(47,2,10,7),(47,4,10,7),(48,19,10,8),(48,20,10,8),(48,21,10,8),(48,22,10,8),(48,23,10,8),(53,1,5,10),(53,2,5,10),(53,4,5,10),(53,6,5,10),(53,8,5,10),(53,9,10,10),(53,10,10,10),(53,11,10,10),(53,12,10,10),(54,1,5,10),(54,2,5,10),(54,4,5,10),(54,6,5,10),(54,11,10,10),(54,16,10,10),(54,17,10,10),(54,18,10,10);
/*!40000 ALTER TABLE `Inventory_Supply_Item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `List_Of_Menu_Items`
--

DROP TABLE IF EXISTS `List_Of_Menu_Items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `List_Of_Menu_Items` (
  `Menu_ID` int(11) NOT NULL,
  `Menu_Item` int(11) NOT NULL,
  `Description` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`Menu_ID`,`Menu_Item`),
  KEY `Menu_Item_idx` (`Menu_Item`),
  CONSTRAINT `Menu_Item` FOREIGN KEY (`Menu_Item`) REFERENCES `Menu_Item` (`Menu_Item_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Menu_ID` FOREIGN KEY (`Menu_ID`) REFERENCES `Menu` (`Menu_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `List_Of_Menu_Items`
--

LOCK TABLES `List_Of_Menu_Items` WRITE;
/*!40000 ALTER TABLE `List_Of_Menu_Items` DISABLE KEYS */;
INSERT INTO `List_Of_Menu_Items` VALUES (1,3,NULL),(1,4,NULL),(1,5,NULL),(6,7,NULL),(7,5,NULL);
/*!40000 ALTER TABLE `List_Of_Menu_Items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `List_Of_Orders`
--

DROP TABLE IF EXISTS `List_Of_Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `List_Of_Orders` (
  `Order_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Order_Date_Time` datetime NOT NULL,
  `Employee_ID` int(11) NOT NULL,
  `Table_ID` int(11) NOT NULL,
  `Order_Notes` varchar(250) DEFAULT NULL,
  `Order_Tip` int(11) DEFAULT NULL,
  `Completed` tinyint(4) NOT NULL DEFAULT '0',
  `Completed_Time` datetime DEFAULT NULL,
  PRIMARY KEY (`Order_ID`),
  UNIQUE KEY `Order_ID_UNIQUE` (`Order_ID`),
  KEY `Employee_ID_idx` (`Employee_ID`),
  KEY `Table_ID_idx` (`Table_ID`),
  CONSTRAINT `FK_Employee_ID` FOREIGN KEY (`Employee_ID`) REFERENCES `Employee` (`Employee_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Table_ID` FOREIGN KEY (`Table_ID`) REFERENCES `List_of_Tables` (`Table_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `List_Of_Orders`
--

LOCK TABLES `List_Of_Orders` WRITE;
/*!40000 ALTER TABLE `List_Of_Orders` DISABLE KEYS */;
INSERT INTO `List_Of_Orders` VALUES (1,'2010-01-19 03:14:07',1,1,'penut allergy',NULL,1,'2018-12-03 15:59:46'),(2,'2017-01-19 03:14:07',5,1,'',NULL,1,'2018-12-03 15:59:46'),(3,'2017-02-19 03:14:07',3,2,'',NULL,1,'2018-12-03 16:00:19'),(4,'2017-03-19 12:14:07',1,5,'penut allergy',NULL,1,'2018-12-03 16:00:51'),(5,'2017-04-19 03:14:07',4,3,'lots of ice for the drinks',NULL,1,'2018-12-03 16:00:37'),(6,'2017-05-19 03:14:07',2,2,'needs a booster chair',NULL,1,'2018-12-03 16:00:19'),(7,'2017-06-19 21:14:07',1,1,'penut allergy',NULL,1,'2018-12-03 15:59:46'),(8,'2017-07-19 03:14:07',2,1,'regular',NULL,1,'2018-12-03 15:59:46'),(9,'2018-01-19 03:14:07',7,9,'',NULL,1,NULL),(10,'2018-02-19 03:14:07',1,3,'',NULL,1,'2018-12-03 16:00:37'),(11,'2018-03-19 12:14:07',3,2,'penut allergy',NULL,1,'2018-12-03 16:00:19'),(12,'2018-04-19 03:14:07',1,7,'lots of ice for the drinks',NULL,1,'2018-12-03 16:01:00'),(13,'2018-05-19 03:14:07',7,2,'needs a booster chair',NULL,1,'2018-12-03 16:00:19'),(14,'2018-06-19 21:14:07',9,1,'penut allergy',NULL,1,'2018-12-03 15:59:46'),(15,'2018-11-05 03:14:07',1,9,'',NULL,1,NULL),(16,'2018-11-07 03:14:07',8,3,'',NULL,1,'2018-12-03 16:00:37'),(17,'2018-11-10 12:14:07',10,2,'penut allergy',NULL,1,'2018-12-03 16:00:19'),(18,'2018-11-10 21:14:07',5,7,'lots of ice for the drinks',NULL,1,'2018-12-03 16:01:00'),(19,'2018-11-01 19:20:00',4,10,NULL,NULL,1,'2018-12-03 17:34:11'),(20,'2018-11-02 17:00:00',2,4,NULL,NULL,1,'2018-12-03 16:00:49'),(21,'2018-11-02 17:00:00',14,3,NULL,NULL,1,'2018-12-03 16:00:37'),(22,'2018-12-03 16:50:17',1,1,'Coool',NULL,1,'2018-12-03 17:49:30'),(23,'2018-12-03 17:08:24',1,1,'Test',NULL,1,'2018-12-03 17:49:30'),(24,'2018-12-03 17:37:39',1,1,'Test GUI',NULL,1,'2018-12-03 17:49:30'),(25,'2018-12-03 17:40:52',1,1,'Test2',NULL,1,'2018-12-03 17:49:30'),(26,'2018-12-03 17:41:04',1,1,'Test2',NULL,1,'2018-12-03 17:49:30'),(27,'2018-12-03 17:41:44',1,1,'Test Gui2',NULL,1,'2018-12-03 17:49:30'),(28,'2018-12-03 17:42:04',1,1,'Test2',NULL,1,'2018-12-03 17:49:30'),(29,'2018-12-03 17:42:56',1,1,'Test Gui3',NULL,1,'2018-12-03 17:49:30'),(30,'2018-12-03 17:44:21',1,1,'Testing Gui4',NULL,1,'2018-12-03 17:49:30'),(31,'2018-12-03 17:47:03',1,1,'test123',NULL,1,'2018-12-03 17:49:30'),(32,'2018-12-03 17:48:08',1,1,'test gui10',NULL,1,'2018-12-03 17:49:30'),(33,'2018-12-03 17:54:19',1,1,'Names',NULL,1,'2018-12-03 17:54:19'),(34,'2018-12-03 17:54:20',1,1,'Names',NULL,1,'2018-12-03 17:54:20'),(35,'2018-12-03 17:59:35',1,1,'Names',NULL,1,'2018-12-03 17:59:35'),(36,'2018-12-03 18:00:16',1,1,'Test output',NULL,1,'2018-12-03 18:00:16'),(37,'2018-12-03 20:22:33',2,4,'Example',NULL,1,'2018-12-03 20:24:12'),(38,'2018-12-03 20:36:02',2,4,'null',NULL,1,'2018-12-03 20:36:57'),(39,'2018-12-04 14:34:33',1,1,'More Gin',NULL,1,'2018-12-04 14:35:19'),(40,'2018-12-04 16:29:13',2,5,'Dressing on the side',NULL,1,'2018-12-04 16:30:33'),(41,'2018-12-04 16:29:47',2,5,'Strong',NULL,1,'2018-12-04 16:30:33'),(42,'2018-12-04 21:53:06',2,7,'extra napkins',NULL,1,'2018-12-04 21:53:39'),(43,'2018-12-04 22:16:47',4,3,'',NULL,1,'2018-12-04 22:17:06'),(44,'2018-12-06 11:53:34',2,5,'Extra large',NULL,1,'2018-12-06 11:53:53'),(45,'2018-12-06 12:33:04',2,5,'Testing user',NULL,0,'2018-12-06 12:33:04'),(46,'2018-12-06 12:56:13',1,4,'Extra plates',NULL,1,'2018-12-06 12:57:36'),(47,'2018-12-06 14:53:58',3,1,'Extra plates',NULL,1,'2018-12-06 14:54:11');
/*!40000 ALTER TABLE `List_Of_Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `List_of_Tables`
--

DROP TABLE IF EXISTS `List_of_Tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `List_of_Tables` (
  `Table_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Table_Capacity` int(11) NOT NULL,
  `Occupied` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Table_ID`),
  UNIQUE KEY `Table_ID_UNIQUE` (`Table_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `List_of_Tables`
--

LOCK TABLES `List_of_Tables` WRITE;
/*!40000 ALTER TABLE `List_of_Tables` DISABLE KEYS */;
INSERT INTO `List_of_Tables` VALUES (1,2,0),(2,2,0),(3,2,0),(4,4,0),(5,4,0),(6,4,0),(7,4,0),(8,6,0),(9,6,0),(10,10,0),(11,10,0),(12,2,0);
/*!40000 ALTER TABLE `List_of_Tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Menu`
--

DROP TABLE IF EXISTS `Menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Menu` (
  `Menu_ID` int(11) NOT NULL,
  `Description` varchar(250) NOT NULL,
  PRIMARY KEY (`Menu_ID`),
  UNIQUE KEY `Menu_ID_UNIQUE` (`Menu_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Menu`
--

LOCK TABLES `Menu` WRITE;
/*!40000 ALTER TABLE `Menu` DISABLE KEYS */;
INSERT INTO `Menu` VALUES (0,'appetizers'),(1,'dessert'),(2,'Winter menu'),(3,'Fall menu'),(4,'Christmas menu'),(5,'Non-alchololic drinks'),(6,'Alcoholic drinks'),(7,'Summer menu'),(8,'Chicken menu');
/*!40000 ALTER TABLE `Menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Menu_Item`
--

DROP TABLE IF EXISTS `Menu_Item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Menu_Item` (
  `Menu_Item_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Menu_Product` varchar(45) NOT NULL,
  `Prices` varchar(45) NOT NULL,
  `Product_Type` varchar(45) NOT NULL,
  `Active` tinyint(4) NOT NULL,
  `Season` varchar(45) DEFAULT NULL,
  `Gluten_Free` tinyint(4) DEFAULT NULL,
  `Vegetarian` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`Menu_Item_ID`),
  UNIQUE KEY `Menu_Item_ID_UNIQUE` (`Menu_Item_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Menu_Item`
--

LOCK TABLES `Menu_Item` WRITE;
/*!40000 ALTER TABLE `Menu_Item` DISABLE KEYS */;
INSERT INTO `Menu_Item` VALUES (3,'Fresh pickled veggies','7.00','vegetable side',1,'Summer',1,1),(4,'Hummus platter','7.00','vegetable side',1,'Summer',0,1),(5,'House salad','6.00','vegetable side',1,'All',1,1),(6,'Chicken Soup','5.0','soup',1,'All',1,0),(7,'Gin and tonic','5.0','drink',1,'All',1,1),(8,'Falafel sandwich','9.00','entree',1,'All',0,1),(9,'Chicken Nuggets','8','entree',1,'All',0,0),(10,'Grilled Chicken','13','entree',1,'All',1,0),(11,'Chicken Caesar Salad','8','entree',1,'All',0,0),(12,'Tomato Soup','5.00','soup',1,'All',1,1),(13,'Grilled cheese sandwich','8.00','entree',1,'All',0,1),(14,'Orange soda','2.00','drink',1,'All',1,1),(15,'Grape soda','2.00','drink',1,'All',1,1),(16,'Root beer','2.00','drink',1,'All',1,1),(17,'Waffle fries','7.00','side',1,'All',0,0),(18,'Sweet potato fries','7.00','side',1,'All',0,1),(19,'Cheese fries','7.00','side',1,'All',0,1),(20,'Greek salad','6.00','vegetable side',1,'All',0,1);
/*!40000 ALTER TABLE `Menu_Item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Menu_Item_Ingredient`
--

DROP TABLE IF EXISTS `Menu_Item_Ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Menu_Item_Ingredient` (
  `Menu_Item_Ingredient_Quantity` int(11) DEFAULT NULL,
  `Menu_Item_ID` int(11) NOT NULL,
  `Ingredients_ID` int(11) NOT NULL,
  PRIMARY KEY (`Menu_Item_ID`,`Ingredients_ID`),
  KEY `Ingredients_ID_idx` (`Ingredients_ID`),
  KEY `Menu_Item_ID_idx` (`Menu_Item_ID`),
  CONSTRAINT `FK_Ingredients_ID` FOREIGN KEY (`Ingredients_ID`) REFERENCES `Ingredients` (`Ingredients_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Menu_Item_ID` FOREIGN KEY (`Menu_Item_ID`) REFERENCES `Menu_Item` (`Menu_Item_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Menu_Item_Ingredient`
--

LOCK TABLES `Menu_Item_Ingredient` WRITE;
/*!40000 ALTER TABLE `Menu_Item_Ingredient` DISABLE KEYS */;
INSERT INTO `Menu_Item_Ingredient` VALUES (1,3,3),(2,3,4),(3,3,5),(4,3,6),(5,3,7),(7,3,11),(6,3,12),(8,4,1),(9,4,2),(10,4,4),(11,4,6),(12,4,9),(13,4,10),(14,4,11),(15,4,12),(16,4,13),(17,4,14),(18,5,1),(19,5,2),(20,5,3),(21,5,4),(22,5,5),(23,5,6),(24,5,7),(25,5,8),(26,5,10),(28,8,1),(29,8,2),(30,8,3),(33,8,6),(27,8,9),(31,8,13),(32,8,14),(10,9,34),(3,10,34),(5,11,23);
/*!40000 ALTER TABLE `Menu_Item_Ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order_Menu_Item`
--

DROP TABLE IF EXISTS `Order_Menu_Item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Order_Menu_Item` (
  `Order_ID` int(11) NOT NULL,
  `Menu_Item_ID` int(11) NOT NULL,
  `Order_Menu_Item_Quantity` int(11) NOT NULL,
  `Notes` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Order_ID`,`Menu_Item_ID`),
  KEY `Menu_Item_idx` (`Menu_Item_ID`),
  KEY `Order_ID_idx` (`Order_ID`),
  CONSTRAINT `Order_ID` FOREIGN KEY (`Order_ID`) REFERENCES `List_Of_Orders` (`Order_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Menu_Item_ID` FOREIGN KEY (`Menu_Item_ID`) REFERENCES `Menu_Item` (`Menu_Item_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order_Menu_Item`
--

LOCK TABLES `Order_Menu_Item` WRITE;
/*!40000 ALTER TABLE `Order_Menu_Item` DISABLE KEYS */;
INSERT INTO `Order_Menu_Item` VALUES (7,3,2,'Caeser dressing'),(14,4,2,''),(14,6,1,''),(19,4,1,NULL),(19,6,1,NULL),(19,7,1,NULL),(19,8,1,'no tomatoes'),(20,3,1,NULL),(20,4,1,NULL),(20,7,2,NULL),(20,8,2,NULL),(21,5,1,NULL),(21,7,1,NULL),(21,8,2,NULL),(22,7,4,NULL),(23,7,1,NULL),(27,7,7,NULL),(28,7,1,NULL),(29,7,7,NULL),(30,7,7,NULL),(31,7,7,NULL),(32,7,6,NULL),(33,7,2,NULL),(34,7,2,NULL),(35,7,4,NULL),(36,7,3,NULL),(37,7,4,NULL),(38,20,2,NULL),(39,7,5,NULL),(40,5,4,NULL),(41,7,4,NULL),(42,8,2,NULL),(43,6,9,NULL),(44,17,2,NULL),(45,7,3,NULL),(46,11,4,NULL),(47,11,5,NULL);
/*!40000 ALTER TABLE `Order_Menu_Item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Restaurant_Schedule`
--

DROP TABLE IF EXISTS `Restaurant_Schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Restaurant_Schedule` (
  `Restaurant_Schedule_ID` int(11) NOT NULL,
  `WeekOf` datetime NOT NULL,
  PRIMARY KEY (`Restaurant_Schedule_ID`),
  UNIQUE KEY `idRestaurant_Schedule_UNIQUE` (`Restaurant_Schedule_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Restaurant_Schedule`
--

LOCK TABLES `Restaurant_Schedule` WRITE;
/*!40000 ALTER TABLE `Restaurant_Schedule` DISABLE KEYS */;
INSERT INTO `Restaurant_Schedule` VALUES (14,'2018-09-30 06:00:01'),(15,'2018-10-07 06:00:01'),(16,'2018-10-14 06:00:01'),(17,'2018-10-21 06:00:01');
/*!40000 ALTER TABLE `Restaurant_Schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Role`
--

DROP TABLE IF EXISTS `Role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Role` (
  `Role_ID` int(11) NOT NULL,
  `Role_Title` varchar(45) NOT NULL,
  `Role_Description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Role_ID`),
  UNIQUE KEY `Role_ID_UNIQUE` (`Role_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Role`
--

LOCK TABLES `Role` WRITE;
/*!40000 ALTER TABLE `Role` DISABLE KEYS */;
INSERT INTO `Role` VALUES (1,'Waiter','Takes orders'),(2,'Manager','Manages staff and operations'),(3,'Cook','Prepares food from line'),(4,'Pantry Chef','Prepares food prior to line'),(5,'Dishwasher','Kitchen cleanup'),(6,'Server','Serves table customers'),(7,'Busser','Table Cleanup'),(8,'Expeditor','Transfers food from cooks to servers');
/*!40000 ALTER TABLE `Role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Supplies`
--

DROP TABLE IF EXISTS `Supplies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Supplies` (
  `Supply_ID` int(11) NOT NULL,
  `Supply_Name` varchar(45) NOT NULL,
  `Supply_Total_Qty` varchar(45) NOT NULL,
  PRIMARY KEY (`Supply_ID`),
  UNIQUE KEY `Supply_ID_UNIQUE` (`Supply_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Supplies`
--

LOCK TABLES `Supplies` WRITE;
/*!40000 ALTER TABLE `Supplies` DISABLE KEYS */;
INSERT INTO `Supplies` VALUES (1,'aprons','25'),(2,'hand towels','100'),(3,'paper towel rolls','40'),(4,'garbage bags','200'),(5,'paper napkins','1000'),(6,'cloth napkins','500'),(7,'floor mats','20'),(8,'degreaser - spray','20'),(9,'cleaner - spray','20'),(10,'dish soap - liquid','20'),(11,'hand soap - solid','50'),(12,'hand soap - liquid','30'),(13,'mop bucket','4'),(14,'mop','8'),(15,'broom','10'),(16,'bleach - liquid','12'),(17,'disposable gloves','50'),(18,'rubber gloves','40'),(19,'pens','70'),(20,'notepads','30'),(21,'markers','50'),(22,'printer paper','80'),(23,'cardstock paper','80');
/*!40000 ALTER TABLE `Supplies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vendors`
--

DROP TABLE IF EXISTS `Vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Vendors` (
  `Vendor_ID` int(11) NOT NULL,
  `Vendor_Company_Name` varchar(45) NOT NULL,
  `Point_Of_Contact` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Vendor_ID`),
  UNIQUE KEY `idSuppliers_UNIQUE` (`Vendor_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vendors`
--

LOCK TABLES `Vendors` WRITE;
/*!40000 ALTER TABLE `Vendors` DISABLE KEYS */;
INSERT INTO `Vendors` VALUES (1,'ABC Fresh Produce','Jerry'),(2,'Deanos Italian Meats','Sal'),(3,'Captain Ahabs Briney Seafoods Inc','Ishmael'),(4,'Samsons Exotic Meats','Delilah'),(5,'Endless Hippie Artisanal Sustainable Farm','Bob'),(6,'Straight-Edge Vegan Everything and More','Ian'),(7,'JoJos Paper Product Supply Company','Chuck'),(8,'Dunder Mifflin Office Products','Dwight'),(9,'Schrute Beet Farms','Dwight'),(10,'SYSCO','Karen'),(11,'Husky Brand Produce','Don');
/*!40000 ALTER TABLE `Vendors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mm_sttest2b'
--

--
-- Dumping routines for database 'mm_sttest2b'
--
/*!50003 DROP PROCEDURE IF EXISTS `Insert_Order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`mm_sttest2b`@`%` PROCEDURE `Insert_Order`(
IN Employee int(11),
IN TableID int(11),
IN Notes varchar(50),
IN Menu_ItemId int(11),
IN Quantity int(11)
)
BEGIN
DECLARE Item varchar(50);
DECLARE OrderID int;

INSERT INTO List_Of_Orders(Order_Date_Time, Employee_ID, Table_ID, Order_Notes, Completed, Completed_Time)
VALUES (CURRENT_TIMESTAMP, Employee, TableID, Notes, 0, CURRENT_TIMESTAMP);

select Max(Order_ID) 
INTO OrderID
from List_Of_Orders where Completed = 0;

INSERT INTO Order_Menu_Item(Order_ID, Menu_Item_Id, Order_Menu_Item_Quantity)
VALUES (OrderID, Menu_ItemId, Quantity);

select a.Menu_Product
INTO Item
from Menu_Item a
Where Menu_Item_ID = Menu_ItemId;

set @returnMessage = Concat("Table ", TableID, " ordered ", Quantity, " ", Item, "!");

SELECT @returnMessage;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Order_Completed` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`mm_sttest2b`@`%` PROCEDURE `Order_Completed`(
table_num int(11)
)
BEGIN

set @returnMessage = Concat("Table ", table_num, " order completed, available for next customer");

update List_Of_Orders
Set Completed_Time = CURRENT_TIMESTAMP
Where Completed = 0
AND Table_ID = Table_num;
    
update List_Of_Orders
Set Completed = 1
WHERE Table_ID = Table_num;
    
Update mm_sttest2b.List_of_Tables
Set Occupied = False
Where Table_ID = Table_num;


SELECT @returnMessage;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Receipts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`mm_sttest2b`@`%` PROCEDURE `Receipts`(
IN Table_num int(11))
BEGIN

	SELECT Menu_Product as 'Name', Concat(Order_Menu_Item_Quantity, " x") as 'Quantity', Prices, Order_Menu_Item_Quantity * Prices AS 'SUBTOTAL'
	FROM List_Of_Orders as ord
	JOIN Order_Menu_Item as menuit
	JOIN Menu_Item
	WHERE ord.Order_ID = menuit.Order_ID
	AND ord.Table_ID = ord.Table_ID
	AND menuit.Menu_Item_ID = Menu_Item.Menu_Item_ID
	AND ord.Completed = 0
	AND ord.Table_ID = Table_num

	UNION ALL

	select 'Subtotal' as Sub, '', '', sum(lineItems.SUBTOTAL) as 'TOTAL'
	from (SELECT ord.Table_ID, ord.Order_ID, Menu_Product, Order_Menu_Item_Quantity, Prices, Order_Menu_Item_Quantity * Prices AS 'SUBTOTAL'
		FROM List_Of_Orders as ord
	   JOIN Order_Menu_Item as menuit
	   JOIN Menu_Item
	   WHERE ord.Order_ID = menuit.Order_ID
	   AND ord.Table_ID = ord.Table_ID
	   AND menuit.Menu_Item_ID = Menu_Item.Menu_Item_ID
	   AND ord.Completed = 0
		AND ord.Table_ID = Table_num) as lineItems
	group by Sub
		
	UNION ALL

	select 'Tax', '', '', round(sum(lineItems.SUBTOTAL)*0.1010,2) as 'Tax'
	from (SELECT ord.Table_ID, ord.Order_ID, Menu_Product, Order_Menu_Item_Quantity, Prices, Order_Menu_Item_Quantity * Prices AS 'SUBTOTAL'
		FROM List_Of_Orders as ord
	   JOIN Order_Menu_Item as menuit
	   JOIN Menu_Item
	   WHERE ord.Order_ID = menuit.Order_ID
	   AND ord.Table_ID = ord.Table_ID
	   AND menuit.Menu_Item_ID = Menu_Item.Menu_Item_ID
	   AND ord.Completed = 0
		AND ord.Table_ID = Table_num) as lineItems
		
	UNION ALL    

	select 'Total', '', '', Concat('$',round(sum(lineItems.SUBTOTAL)*0.1010,2) + sum(lineItems.SUBTOTAL)) as 'Tax'
	from (SELECT ord.Table_ID, ord.Order_ID, Menu_Product, Order_Menu_Item_Quantity, Prices, Order_Menu_Item_Quantity * Prices AS 'SUBTOTAL'
		FROM List_Of_Orders as ord
	   JOIN Order_Menu_Item as menuit
	   JOIN Menu_Item
	   WHERE ord.Order_ID = menuit.Order_ID
	   AND ord.Table_ID = ord.Table_ID
	   AND menuit.Menu_Item_ID = Menu_Item.Menu_Item_ID
	   AND ord.Completed = 0
		AND ord.Table_ID = Table_num) as lineItems
		
	UNION ALL

	select '', '', '', ''
	from Menu
	where Menu.Menu_ID = 0

	UNION ALL

	select Concat('10% Tip = $', Round((sum(lineItems.SUBTOTAL)*0.1010 + sum(lineItems.SUBTOTAL)) * 0.10,2)), 
		   Concat('15% Tip = $', Round((sum(lineItems.SUBTOTAL)*0.1010 + sum(lineItems.SUBTOTAL)) * 0.15,2)),
           Concat('20% Tip = $', Round((sum(lineItems.SUBTOTAL)*0.1010 + sum(lineItems.SUBTOTAL)) * 0.20,2)),
           Concat('25% Tip = $', Round((sum(lineItems.SUBTOTAL)*0.1010 + sum(lineItems.SUBTOTAL)) * 0.25,2))
	from (SELECT ord.Table_ID, ord.Order_ID, Menu_Product, Order_Menu_Item_Quantity, Prices, Order_Menu_Item_Quantity * Prices AS 'SUBTOTAL'
		FROM List_Of_Orders as ord
	   JOIN Order_Menu_Item as menuit
	   JOIN Menu_Item
	   WHERE ord.Order_ID = menuit.Order_ID
	   AND ord.Table_ID = ord.Table_ID
	   AND menuit.Menu_Item_ID = Menu_Item.Menu_Item_ID
	   AND ord.Completed = 0
		AND ord.Table_ID = Table_num) as lineItems;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Reservations` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`mm_sttest2b`@`%` PROCEDURE `Reservations`(IN Reservation_Time DATETIME, Party_Size VARCHAR(45))
BEGIN
	SELECT List_of_Tables.Table_ID, List_of_Tables.Table_Capacity, List_of_Tables.Occupied
    FROM List_of_Tables, Booking
    WHERE Reservation_Time <> Booking.Booking_Date_Time
    AND Party_Size <= List_of_Tables.Table_Capacity
    AND List_of_Tables.Occupied = 0
    GROUP BY List_of_Tables.Table_ID
    ORDER BY List_of_Tables.Table_Capacity
    LIMIT 5;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-06 15:08:11
