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
) ENGINE=InnoDB AUTO_INCREMENT=1  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `endere??os`
--

DROP TABLE IF EXISTS `endere??os`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endere??os` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Tipo de Logradouro` varchar(20) NOT NULL,
  `Logradouro` varchar(255) NOT NULL,
  `n??mero` int NOT NULL,
  `complemento` varchar(45) DEFAULT NULL,
  `cep` varchar(9) NOT NULL,
  `bairro` varchar(45) NOT NULL,
  `Tipo` varchar(45) NOT NULL,
  `cliente_id` int NOT NULL,
  `cidade_estado_id` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKendere??os_clientes_idx` (`cliente_id`),
  KEY `FK_endere??os_cidade/estado_idx` (`cidade_estado_id`),
  CONSTRAINT `FK_endere??os_cidade/estado` FOREIGN KEY (`cidade_estado_id`) REFERENCES `cidade_estado` (`id`),
  CONSTRAINT `FK_endere??os_clientes` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=1  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `itens`
--

DROP TABLE IF EXISTS `itens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantidade` int NOT NULL,
  `pre??o_unit??rio` int NOT NULL,
  `pre??o_total_iten` int GENERATED ALWAYS AS ((`quantidade` * `pre??o_unit??rio`)) VIRTUAL,
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
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `c??digo` varchar(45) NOT NULL,
  `data` varchar(45) NOT NULL,
  `valor total do pedido` varchar(45) NOT NULL,
  `clientes_id` int NOT NULL,
  `endere??o_id` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_produto_e_idx` (`clientes_id`),
  KEY `FK_produto_endere??o_idx` (`clientes_id`),
  KEY `FK_produto_endere??o` (`endere??o_id`),
  CONSTRAINT `FK_produto_cliente` FOREIGN KEY (`clientes_id`) REFERENCES `clientes` (`ID`),
  CONSTRAINT `FK_produto_endere??o` FOREIGN KEY (`endere??o_id`) REFERENCES `endere??os` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pedidos_status`
--

DROP TABLE IF EXISTS `pedidos_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos_status` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `data_mudan??a_status` datetime NOT NULL,
  `status` varchar(20) NOT NULL,
  `pedidos_id` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_status_pedidos_idx` (`pedidos_id`),
  CONSTRAINT `FK_status_pedidos` FOREIGN KEY (`pedidos_id`) REFERENCES `pedidos` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `c??digo` int NOT NULL,
  `descri????o` varchar(255) NOT NULL,
  `pre??o` int NOT NULL,
  `dispon??vel` varchar(3) NOT NULL,
  `destaque` varchar(3) NOT NULL,
  `estoque_id` int NOT NULL,
  `departamento_id` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_produtos_estoque_idx` (`estoque_id`),
  KEY `FK_produtos_departamento_idx` (`departamento_id`),
  CONSTRAINT `FK_produtos_departamento` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`ID`),
  CONSTRAINT `FK_produtos_estoque` FOREIGN KEY (`estoque_id`) REFERENCES `estoques` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'banco_desafio_api'
--
/*!50003 DROP PROCEDURE IF EXISTS `altera????o de produto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `altera????o de produto`(
in _id int,
in _c??digo int, 
in _descri????o varchar(255),
in _pre??o int, 
in _dispon??vel varchar(3), 
in _destaque varchar(3), 
in _qtd_estoque int, 
in _Nome_depto varchar(255))
BEGIN
Update estoques
inner join produtos on estoques.id = produtos.estoque_id
set`quantidade em estoque` = _qtd_estoque 
where produtos.id = _id  ;
Update ignore departamentos
inner join produtos on departamentos.id = produtos.departamento_id
set nome = _Nome_depto
where produtos.id = _id;
Update produtos, estoques, departamentos
set c??digo = _c??digo,
    descri????o = _descri????o,
    pre??o = _pre??o,
    dispon??vel = _dispon??vel,
    destaque = _destaque,
    estoque_id = estoques.id,
    departamento_id = departamentos.id
where produtos.id = _id;
Select produtos.ID, produtos.c??digo, produtos.descri????o, 
produtos.pre??o, produtos.dispon??vel, produtos.destaque, estoques.`quantidade em estoque`, departamentos.nome as `Nome do departamento` from produtos
inner join estoques
on estoques.id = produtos.estoque_id
inner join departamentos
on departamentos.id = produtos.departamento_id
Where produtos.id = _id
;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `novo produto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `novo produto`(
in _c??digo int, 
in _descri????o varchar(255),
in _pre??o int, 
in _dispon??vel varchar(3), 
in _destaque varchar(3), 
in _qtd_estoque int, 
in _Nome_depto varchar(255))
BEGIN
Insert into estoques (`quantidade em estoque`) values (_qtd_estoque);
Insert into departamentos (nome) values (_Nome_depto)
on duplicate key update departamentos.nome = departamentos.nome;
insert into produtos (c??digo, descri????o, pre??o, dispon??vel, destaque , estoque_id, departamento_id) 
select _c??digo,_descri????o,_pre??o,_dispon??vel,_destaque, max(estoques.id),departamentos.id from departamentos, estoques
where departamentos.nome = _Nome_depto and estoques.`quantidade em estoque` = _qtd_estoque;
Select produtos.ID, produtos.c??digo, produtos.descri????o, 
produtos.pre??o, produtos.dispon??vel, produtos.destaque, estoques.`quantidade em estoque`, departamentos.nome as `Nome do departamento` from produtos
inner join estoques
on estoques.id = produtos.estoque_id
inner join departamentos
on departamentos.id = produtos.departamento_id
Where produtos.id = last_insert_id();
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

-- Dump completed on 2021-06-11  6:57:53
