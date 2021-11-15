CREATE DATABASE database_natural;

USE database_natural;



-- ------------------------------------------------------

-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: database_natural
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `mensaje_usuario`
--

DROP TABLE IF EXISTS `mensaje_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mensaje_usuario` (
  `id_mensaje` int NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `tipo` varchar(100) NOT NULL,
  `comentario` varchar(500) DEFAULT NULL,
  `user_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint NOT NULL,
  PRIMARY KEY (`id_mensaje`),
  KEY `fk_user` (`user_id`),
  CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensaje_usuario`
--

LOCK TABLES `mensaje_usuario` WRITE;
/*!40000 ALTER TABLE `mensaje_usuario` DISABLE KEYS */;
INSERT INTO `mensaje_usuario` VALUES (2,'Locion pinchada','cambio_producto','Compre un perfumito y me vino pinchado. Exijo cambio',4,'2021-09-09 14:29:42',0),(3,'Venta de crema a domicilio','venta_online','Quisiera saber si puedo comprar crema para mandar adomicilio y si lo mandan uds',4,'2021-09-09 15:06:47',0),(4,'test','cambio_producto','test',4,'2021-09-09 15:12:35',0),(5,'test2','cambio_producto','test2',4,'2021-09-09 15:13:14',0),(6,'Testcito','evento_adverso','testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest',8,'2021-09-09 22:11:22',0),(7,'Tarea 1','cambio_producto','test',9,'2021-09-09 23:10:03',0),(8,'asddas','cambio_producto','asdasd',9,'2021-10-21 22:53:15',0),(9,'asdasd','compra_tienda','asdasd',9,'2021-10-21 22:53:37',1),(10,'Rexona me abandono','evento_adverso','REXONA ME ABANDONO Y AAHORA QUE HAGO????\r\n\r\nHUELO MUY MAL\r\nMUY \r\nMUY\r\nMUY MAL',9,'2021-10-21 23:05:40',0),(11,'Mensaje test 2','reclamo_reventa','reclamo reventa test',10,'2021-10-21 23:17:00',1),(12,'Quiero comprar','compra_tienda','quiero testear compra',9,'2021-10-27 03:31:29',0),(13,'asdasdasd','cambio_producto','asdasd',10,'2021-11-14 23:14:55',0);
/*!40000 ALTER TABLE `mensaje_usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-15 19:59:16
-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: database_natural
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `mensaje_invitado`
--

DROP TABLE IF EXISTS `mensaje_invitado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mensaje_invitado` (
  `idmensaje_invitado` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `email` varchar(60) NOT NULL,
  `comentario` varchar(500) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `title` varchar(45) NOT NULL,
  `status` tinyint NOT NULL,
  PRIMARY KEY (`idmensaje_invitado`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensaje_invitado`
--

LOCK TABLES `mensaje_invitado` WRITE;
/*!40000 ALTER TABLE `mensaje_invitado` DISABLE KEYS */;
INSERT INTO `mensaje_invitado` VALUES (1,'Sebastián','Moschini','compra_tienda','seba.sc@live.com.ar','asdasdasdasd','2021-08-25 18:44:48','Mensaje 1',1),(5,'Maria Marta','Legrand','compra_online','maruchi_009@hotmail.com','Hola mis amores les escribo porque no soy muy amiga de la tecnología y quería saber como podía hacer una compra de internet para que me la manden a mi casa.\r\nenviar mensaje enter','2021-08-27 13:46:55','No se comprar',1),(6,'Juan Sebastián','Veron','vender_producto','labrujita_pincharrata@hotmail.es','Estimados, les escribo porque me interesaría ser revendedor de sus productos.\r\nUltimamente con la pandemia no me estuvo yendo del todo bien, y necesitaría unos ingresos extra. Tengo contactos en Inglaterra, por si les interesaría expandirse por tierras británicas.\r\n\r\nCordiales saludos,\r\nJuan','2021-08-27 13:51:48','Ser revendedor',1),(8,'Erica','Camporeale','compra_online','erik.cp@live.com','Hola, quería consutlar que cuesta el envía a Chaco y cuanto tarda aproximadamente. Gracias','2021-09-01 23:46:04','Envios a chaco',1),(15,'Pablito','Testapeliddo','compra_producto','pablitotest@hotmail.com','Quiero comprar un producto','2021-09-09 22:48:16','Test invitado',0),(16,'Sebastián','Moschini','reclamo_reventa','seba.sc@live.com.ar','Hola revendi un producto y llego pinchado','2021-09-09 23:08:10','Locion pinchada',0),(17,'Tomas','Casco','compra_producto','tcasco@mail.com','comprar productos bot','2021-10-21 23:15:27','Consulta test',0),(19,'asddas','ss','reclamo_reventa','asdasdsda@asdas.com','sdasd','2021-11-14 23:16:37','asdasd',1);
/*!40000 ALTER TABLE `mensaje_invitado` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-15 19:59:15

-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: database_natural
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL,
  `contraseña` varchar(60) NOT NULL,
  `nombre` varchar(18) NOT NULL,
  `apellido` varchar(18) NOT NULL,
  `email` varchar(30) NOT NULL,
  `rol` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'moschiifts','$2a$10$c3yEP2dHFgQZ3/9Co5j3kukFV9tAcT/tAumRU6XxY1xVZsmnLXbXe','Sebastián','Moschini','seba.sc@live.com.ar','user'),(2,'moschiifts','$2a$10$cy2twxEsTH/7QSDmF1/DAua7rGJnwHi8k4rZTs8pn.PV15Fm96Tem','Sebastián','Moschini','seba.sc@live.com.ar','user'),(3,'pollitoallboys','$2a$10$INbhicKGreDHaUpaAdgAIe.kNEwTWfnvc0ohTLaBBWtvF.1CSTTKm','Sebastián','Vignolo','pollovignolo@live.com','user'),(4,'pelaifts','$2a$10$UQyAatPRvmWepjBitl7KcuMwcf1qcSjwMYL7H.JMdWYPXKkudAML6','Sebastian','Canosa','sebacanosa@live.com','user'),(5,'nombredeusuario','$2a$10$U/E2fpzOCuXEME4GIHvTHeGAAOVmT1IHiKQhPUopbiJVwHoYDOn3K','Nombre','largo','nombre@largo.com','user'),(6,'admin','admin123','Administrador','Natural','admin@natural.com','admin'),(7,'moschiadmin','$2a$10$0Af/3FlYszRx7OvCw/2p/OiQcVf6lW5eQq/eWtLxnJGqarURzbx1y','Sebastián','Moschini','seba.sc@live.com.ar','admin'),(8,'testtest','$2a$10$jb2XnPgvK7iurRYkrdmHpOuT1c5n7vm9qoEUqZEDGok/OBIEBrkKW','test','test','test@test.test','user'),(9,'pablo1234','$2a$10$MhUgJHPM0KWTU2HB976suOExQl277T0I0tEjkR90AY0CNRHhCfHFW','Pablo','Pablez','test@test.es','user'),(10,'tcasco','$2a$10$4lLzA6wUB/6gYhmFjFrEGemtVfqYhw8QPUWXozfb4VSciuktvZ/NK','Tomas','Casco','tcasco@mail.com','user'),(11,'taperez','$2a$10$pyCLdXbp3F.9i5VmpH3ELucPRG6mD0DimM6c7AeX30C5lph5u5aLa','Tatiana','Perez','taperez@tap.com','user'),(12,'testtest','$2a$10$ulQ3Fq4O9ywmiquH4gU3ketpoZW3SfZTqTuWzM7gWxO0/Zie09GHS','test','test','test@test.test','user'),(13,'test','$2a$10$U2gsP7aGU62/1bEujq4tA.N9ndFhhccZB/I6e6z0sTbsxhdyqmm76','test','test','test@test','user');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-15 19:59:16

