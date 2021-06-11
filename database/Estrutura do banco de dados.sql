CREATE DATABASE  IF NOT EXISTS `banco_desafio_api` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `banco_desafio_api`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: banco_desafio_api
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `cidade_estado`
--

DROP TABLE IF EXISTS `cidade_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cidade_estado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cidade` varchar(45) NOT NULL,
  `estado` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidade_estado`
--

LOCK TABLES `cidade_estado` WRITE;
/*!40000 ALTER TABLE `cidade_estado` DISABLE KEYS */;
INSERT INTO `cidade_estado` VALUES (1,'São Paulo','SP'),(2,'Sorocaba','SP');
/*!40000 ALTER TABLE `cidade_estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  `E-mail` varchar(45) NOT NULL,
  `Whatsapp` varchar(14) NOT NULL,
  `Senha` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Cesar','Cesar.bertini@gmail.com','11994541116','abcle2002'),(2,'Raquel','Raquel.maciel.bertini@gmail.com','11992453876','nicholas2508'),(3,'João','João.almeida@gmail.com','11994459873','Ddragon_bang'),(4,'Joana','Joana.leni@gmail.com','11997285967','pssoa_mt_prcosa');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamentos` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `nome_UNIQUE` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES (2,'Eletrodomésticos'),(1,'Informática');
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereços`
--

DROP TABLE IF EXISTS `endereços`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereços` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Tipo de Logradouro` varchar(20) NOT NULL,
  `Logradouro` varchar(255) NOT NULL,
  `número` int NOT NULL,
  `complemento` varchar(45) DEFAULT NULL,
  `cep` varchar(9) NOT NULL,
  `bairro` varchar(45) NOT NULL,
  `Tipo` varchar(45) NOT NULL,
  `cliente_id` int NOT NULL,
  `cidade_estado_id` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKendereços_clientes_idx` (`cliente_id`),
  KEY `FK_endereços_cidade/estado_idx` (`cidade_estado_id`),
  CONSTRAINT `FK_endereços_cidade/estado` FOREIGN KEY (`cidade_estado_id`) REFERENCES `cidade_estado` (`id`),
  CONSTRAINT `FK_endereços_clientes` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereços`
--

LOCK TABLES `endereços` WRITE;
/*!40000 ALTER TABLE `endereços` DISABLE KEYS */;
INSERT INTO `endereços` VALUES (1,'rua','Carlos Weber',457,'apto 61 b','05303-000','Vila Leopoldina','residêncial',1,1),(2,'avenida','Paulista',900,NULL,'01310-100','Bela Vista','comercial',3,1),(3,'rua','Carlos Weber',457,'apto 61 b','05303-000','Vila Leopoldina','residêncial',2,1),(4,'avenida','Sorocaba',500,NULL,'18044-390','Jardim Magnolia','comercial',1,2),(5,'rua','Mergenthaler',345,'apto 102A','05311-030','Vila Leopoldina','residêncial',4,1);
/*!40000 ALTER TABLE `endereços` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoques`
--

DROP TABLE IF EXISTS `estoques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoques` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `quantidade em estoque` int DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoques`
--

LOCK TABLES `estoques` WRITE;
/*!40000 ALTER TABLE `estoques` DISABLE KEYS */;
INSERT INTO `estoques` VALUES (1,14),(2,975),(3,320);
/*!40000 ALTER TABLE `estoques` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itens`
--

DROP TABLE IF EXISTS `itens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantidade` int NOT NULL,
  `preço_unitário` int NOT NULL,
  `preço_total_iten` int GENERATED ALWAYS AS ((`quantidade` * `preço_unitário`)) VIRTUAL,
  `pedidos_id` int NOT NULL,
  `produtos_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_itens_produtos_idx` (`produtos_id`),
  KEY `FK_itens_pedidos_idx` (`pedidos_id`),
  CONSTRAINT `FK_itens_pedidos` FOREIGN KEY (`pedidos_id`) REFERENCES `pedidos` (`ID`),
  CONSTRAINT `FK_itens_produtos` FOREIGN KEY (`produtos_id`) REFERENCES `produtos` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itens`
--

LOCK TABLES `itens` WRITE;
/*!40000 ALTER TABLE `itens` DISABLE KEYS */;
INSERT INTO `itens` (`id`, `quantidade`, `preço_unitário`, `pedidos_id`, `produtos_id`) VALUES (1,2,3500,1,1),(2,1,2500,1,2),(3,1,1500,2,3),(4,1,3500,3,1),(5,1,2500,3,2),(6,1,1500,3,3),(7,3,2500,4,2);
/*!40000 ALTER TABLE `itens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `código` varchar(45) NOT NULL,
  `data` varchar(45) NOT NULL,
  `valor total do pedido` varchar(45) NOT NULL,
  `clientes_id` int NOT NULL,
  `endereço_id` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_produto_e_idx` (`clientes_id`),
  KEY `FK_produto_endereço_idx` (`clientes_id`),
  KEY `FK_produto_endereço` (`endereço_id`),
  CONSTRAINT `FK_produto_cliente` FOREIGN KEY (`clientes_id`) REFERENCES `clientes` (`ID`),
  CONSTRAINT `FK_produto_endereço` FOREIGN KEY (`endereço_id`) REFERENCES `endereços` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,'RL-100','30/04/2021','9500',2,3),(2,'CR-200','16/05/2021','1500',1,4),(3,'JA-000','20/04/2021','7500',3,2),(4,'JO-300','17/05/2021','7500',4,5);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos_status`
--

DROP TABLE IF EXISTS `pedidos_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos_status` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `data_mudança_status` datetime NOT NULL,
  `status` varchar(20) NOT NULL,
  `pedidos_id` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_status_pedidos_idx` (`pedidos_id`),
  CONSTRAINT `FK_status_pedidos` FOREIGN KEY (`pedidos_id`) REFERENCES `pedidos` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos_status`
--

LOCK TABLES `pedidos_status` WRITE;
/*!40000 ALTER TABLE `pedidos_status` DISABLE KEYS */;
INSERT INTO `pedidos_status` VALUES (1,'2021-04-20 20:10:00','novo pedido',3),(2,'2021-04-20 20:10:23','aguardando pagamento',3),(3,'2021-04-21 10:09:42','pagamento autorizado',3),(4,'2021-04-23 12:38:47','em separação',3),(5,'2021-04-24 09:29:27','em transporte',3),(6,'2021-04-25 15:57:19','entregue',3),(7,'2021-04-30 18:44:31','novo pedido',1),(8,'2021-04-30 18:44:54','aguardando pagamento',1),(9,'2021-05-01 10:49:56','pagamento autorizado',1),(10,'2021-05-02 09:12:33','em separação',1),(11,'2021-05-03 14:52:19','em transporte',1),(12,'2021-05-04 12:38:02','entregue',1),(13,'2021-05-16 00:12:10','novo pedido',2),(14,'2021-05-16 00:12:37','aguardando pagamento',2),(15,'2021-05-16 13:30:43','pagamento autorizado',2),(16,'2021-05-17 16:41:30','em separação',2),(17,'2021-05-18 14:27:13','em transporte',2),(18,'2021-05-20 21:17:53','novo pedido',4),(19,'2021-05-20 21:18:21','aguardando pagamento',4);
/*!40000 ALTER TABLE `pedidos_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `código` int NOT NULL,
  `descrição` varchar(255) NOT NULL,
  `preço` int NOT NULL,
  `disponível` varchar(3) NOT NULL,
  `destaque` varchar(3) NOT NULL,
  `estoque_id` int NOT NULL,
  `departamento_id` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_produtos_estoque_idx` (`estoque_id`),
  KEY `FK_produtos_departamento_idx` (`departamento_id`),
  CONSTRAINT `FK_produtos_departamento` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`ID`),
  CONSTRAINT `FK_produtos_estoque` FOREIGN KEY (`estoque_id`) REFERENCES `estoques` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,934,'Geladeira/Refrigerador Consul Frost Free Duplex - Evox 397L CRE44AK',3500,'sim','sim',1,2),(2,1235,'Computador Dualcore 2gb de ram',2500,'sim','não',2,1),(3,1316,'Monitor Gamer AOC G2 Hero 27” LED Widescreen - Full HD HDMI VGA IPS 144Hz 1ms',1500,'sim','sim',3,1);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-11  1:50:09
