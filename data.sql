-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: java_28_30
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES ('129a671f-da75-41e2-be1e-45c4ee15b92c','The Hobbit','Tolkien','fantasy','in_stock',1937),('39b238a1-85a7-4d9d-974e-bb82ca83d845','The Little Prince','Saint-Exupéry','kids','in_stock',1943),('3acee820-4110-4a09-a2cd-2587a2ee7b04','1984','Orwell','dystopia','in_stock',1949),('4f3d6f4e-1c24-49c4-a435-ea84c463c13c','The Catcher in the Rye','J.D. Salinger','classic','in_stock',1951),('50e2fd10-1b61-40d2-9a8f-9a5952a74399','The Great Gatsby','F. Scott Fitzge','classic','in_stock',1925),('54f794b3-a516-443a-8183-e525eb78c1c2','The Old Man and the Sea','Ernest Hemingwa','classic','in_stock',1952),('720a25dd-4e9d-4d54-b650-6cd83c803706','The Catcher in the Rye','J.D. Salinger','classic','in_stock',1951),('7ecf298e-56d9-4798-88f9-fdc93b7a1529','The Great Gatsby','F. Scott Fitzge','classic','in_stock',1925),('8c0a6ba3-f4b7-44e8-8192-23e4f2fb1731','To Kill a Mockingbird','Harper Lee','classic','in_stock',1960),('99691692-44a9-4d34-8613-4e3a93ae83b0','To Kill a Mockingbird','Harper Lee','classic','in_stock',1960),('99f0b737-3ba7-421c-b0ef-7ff345ea4f3d','The Hobbit','Tolkien','fantasy','in_stock',1937),('bec8f113-ca46-4911-aeee-c7f6b7d4ccab','The Hound of the Baskervilles','Conan Doyle','detective','in_stock',1902),('ce0a9132-049b-4382-9978-397677622a08','Brave New World','Huxley','dystopia','in_stock',1932),('e113dd94-0ec6-47d7-b952-5898accd1782','Harry Potter and the Philosoph','J.K. Rowling','fantasy','in_stock',1997),('e827dbf1-4f10-40d3-88af-a064b196809d','Pride and Prejudice (Modern Ed','Jane Austen','romantic','in_stock',2003),('f3bc8c63-1600-4acb-9128-1ab8bb3a13ff','Brave New World','Huxley','dystopia','in_stock',1932),('fd54f06d-5050-495d-9535-e0dfa2fe6a96','The Little Prince','Saint-Exupéry','kids','in_stock',1943);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `books_readers`
--

LOCK TABLES `books_readers` WRITE;
/*!40000 ALTER TABLE `books_readers` DISABLE KEYS */;
INSERT INTO `books_readers` VALUES (1,'129a671f-da75-41e2-be1e-45c4ee15b92c',100000000,'2025-11-23 17:12:49','2025-11-23 17:18:35');
/*!40000 ALTER TABLE `books_readers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `readers`
--

LOCK TABLES `readers` WRITE;
/*!40000 ALTER TABLE `readers` DISABLE KEYS */;
INSERT INTO `readers` VALUES (100000000,'Alexandr','alexandr@example.com'),(100000001,'Andrey','andrey@example.com'),(100000002,'Maria','maria@example.com'),(100000003,'Ivan','ivan@example.com'),(100000004,'Olga','olga@example.com'),(100000005,'Dmitry','dmitry@example.com'),(100000006,'Svetlana','svetlana@example.com'),(100000007,'Sergey','sergey@example.com');
/*!40000 ALTER TABLE `readers` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER check_reader_id
BEFORE INSERT ON readers
FOR EACH ROW
BEGIN
    IF NEW.id > 999999999 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Reader ID exceeds maximum allowed value';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-23 20:12:09
