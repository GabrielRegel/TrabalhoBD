-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: BD_POLO
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno` (
  `CGM` int NOT NULL,
  `Nome` varchar(100) DEFAULT NULL,
  `Data_Nacimento` varchar(10) DEFAULT NULL,
  `Turma_Numero` int DEFAULT NULL,
  PRIMARY KEY (`CGM`),
  KEY `Turma_Numero` (`Turma_Numero`),
  CONSTRAINT `aluno_ibfk_1` FOREIGN KEY (`Turma_Numero`) REFERENCES `turma` (`Numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aula`
--

DROP TABLE IF EXISTS `aula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aula` (
  `Id` int NOT NULL,
  `Data` varchar(10) DEFAULT NULL,
  `Observacoes` varchar(200) DEFAULT NULL,
  `Aluno_CGM` int DEFAULT NULL,
  `Diciplina_Id` int DEFAULT NULL,
  `Conteudo_Id` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Aluno_CGM` (`Aluno_CGM`),
  KEY `Diciplina_Id` (`Diciplina_Id`),
  KEY `Conteudo_Id` (`Conteudo_Id`),
  CONSTRAINT `aula_ibfk_1` FOREIGN KEY (`Aluno_CGM`) REFERENCES `aluno` (`CGM`),
  CONSTRAINT `aula_ibfk_2` FOREIGN KEY (`Diciplina_Id`) REFERENCES `diciplina` (`Id`),
  CONSTRAINT `aula_ibfk_3` FOREIGN KEY (`Conteudo_Id`) REFERENCES `conteudo` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aula`
--

LOCK TABLES `aula` WRITE;
/*!40000 ALTER TABLE `aula` DISABLE KEYS */;
/*!40000 ALTER TABLE `aula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colegio`
--

DROP TABLE IF EXISTS `colegio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `colegio` (
  `Id` int NOT NULL,
  `Nome` varchar(100) DEFAULT NULL,
  `Endereco` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colegio`
--

LOCK TABLES `colegio` WRITE;
/*!40000 ALTER TABLE `colegio` DISABLE KEYS */;
/*!40000 ALTER TABLE `colegio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `componentecurricular`
--

DROP TABLE IF EXISTS `componentecurricular`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `componentecurricular` (
  `Id` int NOT NULL,
  `Nome` varchar(100) DEFAULT NULL,
  `Ementa` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `componentecurricular`
--

LOCK TABLES `componentecurricular` WRITE;
/*!40000 ALTER TABLE `componentecurricular` DISABLE KEYS */;
/*!40000 ALTER TABLE `componentecurricular` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conteudo`
--

DROP TABLE IF EXISTS `conteudo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conteudo` (
  `Id` int NOT NULL,
  `Titulo` varchar(100) DEFAULT NULL,
  `Numero` int DEFAULT NULL,
  `URL_Material` varchar(200) DEFAULT NULL,
  `CompCurric_Id` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `CompCurric_Id` (`CompCurric_Id`),
  CONSTRAINT `conteudo_ibfk_1` FOREIGN KEY (`CompCurric_Id`) REFERENCES `componentecurricular` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conteudo`
--

LOCK TABLES `conteudo` WRITE;
/*!40000 ALTER TABLE `conteudo` DISABLE KEYS */;
/*!40000 ALTER TABLE `conteudo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diciplina`
--

DROP TABLE IF EXISTS `diciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diciplina` (
  `Id` int NOT NULL,
  `Carga_Horaria` int DEFAULT NULL,
  `Turma_Numero` int DEFAULT NULL,
  `Professor_CPF` varchar(14) DEFAULT NULL,
  `CompCurric_Id` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Turma_Numero` (`Turma_Numero`),
  KEY `Professor_CPF` (`Professor_CPF`),
  KEY `CompCurric_Id` (`CompCurric_Id`),
  CONSTRAINT `diciplina_ibfk_1` FOREIGN KEY (`Turma_Numero`) REFERENCES `turma` (`Numero`),
  CONSTRAINT `diciplina_ibfk_2` FOREIGN KEY (`Professor_CPF`) REFERENCES `professor` (`CPF`),
  CONSTRAINT `diciplina_ibfk_3` FOREIGN KEY (`CompCurric_Id`) REFERENCES `componentecurricular` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diciplina`
--

LOCK TABLES `diciplina` WRITE;
/*!40000 ALTER TABLE `diciplina` DISABLE KEYS */;
/*!40000 ALTER TABLE `diciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor` (
  `CPF` varchar(14) NOT NULL,
  `Nome` varchar(100) DEFAULT NULL,
  `Telefone` varchar(17) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Salario` float DEFAULT NULL,
  PRIMARY KEY (`CPF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turma`
--

DROP TABLE IF EXISTS `turma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turma` (
  `Numero` int NOT NULL,
  `serie` varchar(3) DEFAULT NULL,
  `Quantidade_Alunos` int DEFAULT NULL,
  `Colegio_Id` int DEFAULT NULL,
  PRIMARY KEY (`Numero`),
  KEY `Colegio_Id` (`Colegio_Id`),
  CONSTRAINT `turma_ibfk_1` FOREIGN KEY (`Colegio_Id`) REFERENCES `colegio` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turma`
--

LOCK TABLES `turma` WRITE;
/*!40000 ALTER TABLE `turma` DISABLE KEYS */;
/*!40000 ALTER TABLE `turma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'BD_POLO'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-27 17:17:59
