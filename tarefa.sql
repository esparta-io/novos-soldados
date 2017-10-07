-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: tarefas
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
-- Table structure for table `tarefa`
--

DROP TABLE IF EXISTS `tarefa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarefa` (
  `id_tarefa` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(60) DEFAULT NULL,
  `descricao` varchar(1000) DEFAULT NULL,
  `data` varchar(45) DEFAULT NULL,
  `hora_ini` varchar(45) DEFAULT NULL,
  `hora_fim` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_tarefa`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarefa`
--

LOCK TABLES `tarefa` WRITE;
/*!40000 ALTER TABLE `tarefa` DISABLE KEYS */;
INSERT INTO `tarefa` VALUES (4,'Limpar a casa','Limpando a casa com raiva ','2015-12-11','09:00','12:00','Encerrado'),(5,'Lavar a Lou�a','Lavar a lou�a com carinho. ','1959-12-12','12:02','13:00','Inativo'),(27,'Limpeza de casa','Limpar a casa inteira','2015-12-12','13:00','14:00','Encerrado'),(28,'Adsasasa','asasasa asasa','2012-12-12','15:00','17:00','Pendente'),(29,NULL,NULL,NULL,NULL,NULL,'Inativo'),(30,NULL,NULL,NULL,NULL,NULL,'Inativo'),(31,NULL,NULL,NULL,NULL,NULL,'Inativo'),(32,NULL,NULL,NULL,NULL,NULL,'Inativo'),(33,NULL,NULL,NULL,NULL,NULL,'Inativo'),(34,NULL,NULL,NULL,NULL,NULL,'Inativo'),(35,NULL,NULL,NULL,NULL,NULL,'Inativo'),(36,NULL,NULL,NULL,NULL,NULL,'Inativo'),(37,NULL,NULL,NULL,NULL,NULL,'Inativo');
/*!40000 ALTER TABLE `tarefa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'tarefas'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-07 10:26:10
