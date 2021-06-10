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
-- Dumping data for table `cidade_estado`
--

LOCK TABLES `cidade_estado` WRITE;
/*!40000 ALTER TABLE `cidade_estado` DISABLE KEYS */;
INSERT INTO `cidade_estado` VALUES (1,'São Paulo','SP'),(2,'Sorocaba','SP');
/*!40000 ALTER TABLE `cidade_estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Cesar','Cesar.bertini@gmail.com','11994541116','abcle2002'),(2,'Raquel','Raquel.maciel.bertini@gmail.com','11992453876','nicholas2508'),(3,'João','João.almeida@gmail.com','11994459873','Ddragon_bang'),(4,'Joana','Joana.leni@gmail.com','11997285967','pssoa_mt_prcosa');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES (1,'Informática'),(2,'Eletrodomésticos');
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `endereços`
--

LOCK TABLES `endereços` WRITE;
/*!40000 ALTER TABLE `endereços` DISABLE KEYS */;
INSERT INTO `endereços` VALUES (1,'rua','Carlos Weber',457,'apto 61 b','05303-000','Vila Leopoldina','residêncial',1,1),(2,'avenida','Paulista',900,NULL,'01310-100','Bela Vista','comercial',3,1),(3,'rua','Carlos Weber',457,'apto 61 b','05303-000','Vila Leopoldina','residêncial',2,1),(4,'avenida','Sorocaba',500,NULL,'18044-390','Jardim Magnolia','comercial',1,2),(5,'rua','Mergenthaler',345,'apto 102A','05311-030','Vila Leopoldina','residêncial',4,1);
/*!40000 ALTER TABLE `endereços` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `estoques`
--

LOCK TABLES `estoques` WRITE;
/*!40000 ALTER TABLE `estoques` DISABLE KEYS */;
INSERT INTO `estoques` VALUES (1,14),(2,975),(3,320);
/*!40000 ALTER TABLE `estoques` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `itens`
--

LOCK TABLES `itens` WRITE;
/*!40000 ALTER TABLE `itens` DISABLE KEYS */;
INSERT INTO `itens` (`id`, `quantidade`, `preço_unitário`, `pedidos_id`, `produtos_id`) VALUES (1,2,3500,1,1),(2,1,2500,1,2),(3,1,1500,2,3),(4,1,3500,3,1),(5,1,2500,3,2),(6,1,1500,3,3),(7,3,2500,4,2);
/*!40000 ALTER TABLE `itens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,'RL-100','30/04/2021','9500',2,3),(2,'CR-200','16/05/2021','1500',1,4),(3,'JA-000','20/04/2021','7500',3,2),(4,'JO-300','17/05/2021','7500',4,5);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pedidos_status`
--

LOCK TABLES `pedidos_status` WRITE;
/*!40000 ALTER TABLE `pedidos_status` DISABLE KEYS */;
INSERT INTO `pedidos_status` VALUES (1,'2021-04-20 20:10:00','novo pedido',3),(2,'2021-04-20 20:10:23','aguardando pagamento',3),(3,'2021-04-21 10:09:42','pagamento autorizado',3),(4,'2021-04-23 12:38:47','em separação',3),(5,'2021-04-24 09:29:27','em transporte',3),(6,'2021-04-25 15:57:19','entregue',3),(7,'2021-04-30 18:44:31','novo pedido',1),(8,'2021-04-30 18:44:54','aguardando pagamento',1),(9,'2021-05-01 10:49:56','pagamento autorizado',1),(10,'2021-05-02 09:12:33','em separação',1),(11,'2021-05-03 14:52:19','em transporte',1),(12,'2021-05-04 12:38:02','entregue',1),(13,'2021-05-16 00:12:10','novo pedido',2),(14,'2021-05-16 00:12:37','aguardando pagamento',2),(15,'2021-05-16 13:30:43','pagamento autorizado',2),(16,'2021-05-17 16:41:30','em separação',2),(17,'2021-05-18 14:27:13','em transporte',2),(18,'2021-05-20 21:17:53','novo pedido',4),(19,'2021-05-20 21:18:21','aguardando pagamento',4);
/*!40000 ALTER TABLE `pedidos_status` ENABLE KEYS */;
UNLOCK TABLES;

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

-- Dump completed on 2021-06-10 13:41:07
