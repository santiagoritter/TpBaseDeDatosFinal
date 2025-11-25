-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bdd_paginaweb
-- ------------------------------------------------------
-- Server version	9.3.0

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
-- Table structure for table `adopcion`
--

DROP TABLE IF EXISTS `adopcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adopcion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(255) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `id_mascota` int NOT NULL,
  `id_usuario` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adopcion`
--

LOCK TABLES `adopcion` WRITE;
/*!40000 ALTER TABLE `adopcion` DISABLE KEYS */;
INSERT INTO `adopcion` VALUES (1,'En Proceso','2024-01-10',1,2),(2,'Aprobada','2024-01-12',2,1),(3,'Rechazada','2024-01-15',3,4),(4,'En Proceso','2024-01-18',4,3),(5,'Aprobada','2024-01-20',5,6),(6,'Finalizada','2024-01-22',6,5),(7,'En Proceso','2024-01-25',7,8),(8,'Aprobada','2024-01-28',8,7),(9,'Pendiente','2024-01-30',9,10),(10,'Aprobada','2024-02-01',10,9),(11,'En Proceso','2024-02-03',11,12),(12,'Rechazada','2024-02-05',12,11),(13,'Aprobada','2024-02-08',13,14),(14,'Finalizada','2024-02-10',14,13),(15,'En Proceso','2024-02-12',15,16),(16,'Aprobada','2024-02-15',16,15),(17,'Pendiente','2024-02-18',17,18),(18,'Aprobada','2024-02-20',18,17),(19,'Rechazada','2024-02-22',19,20),(20,'Aprobada','2024-02-25',20,19);
/*!40000 ALTER TABLE `adopcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alertas_stock`
--

DROP TABLE IF EXISTS `alertas_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alertas_stock` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha_alerta` datetime(6) DEFAULT NULL,
  `mensaje` varchar(255) DEFAULT NULL,
  `tipo_vacuna` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alertas_stock`
--

LOCK TABLES `alertas_stock` WRITE;
/*!40000 ALTER TABLE `alertas_stock` DISABLE KEYS */;
INSERT INTO `alertas_stock` VALUES (1,'2024-01-01 10:00:00.000000','Stock bajo','Gripe Aviar'),(2,'2024-01-02 11:30:00.000000','Stock critico','Giardia'),(3,'2024-01-03 09:15:00.000000','Reponer urgente','Lyme'),(4,'2024-01-04 14:20:00.000000','Stock bajo','Mixomatosis'),(5,'2024-01-05 16:45:00.000000','Stock critico','Chlamydia'),(6,'2024-01-06 08:10:00.000000','Stock bajo','Leucemia Felina'),(7,'2024-01-07 12:00:00.000000','Stock normalizado','Antirrabica'),(8,'2024-01-08 13:30:00.000000','Vencimiento proximo','Quintuple'),(9,'2024-01-09 10:05:00.000000','Stock bajo','Sextuple'),(10,'2024-01-10 15:50:00.000000','Stock critico','Tos de las perreras'),(11,'2024-01-11 09:40:00.000000','Reponer','Parvovirus'),(12,'2024-01-12 11:20:00.000000','Stock bajo','Moquillo'),(13,'2024-01-13 14:10:00.000000','Stock critico','Leptospirosis'),(14,'2024-01-14 17:30:00.000000','Reponer','Corona Virus'),(15,'2024-01-15 08:25:00.000000','Vencimiento proximo','Hemorragica Viral'),(16,'2024-01-16 12:45:00.000000','Stock bajo','Panleucopenia'),(17,'2024-01-17 10:15:00.000000','Stock critico','Calicivirus'),(18,'2024-01-18 16:00:00.000000','Reponer','Rinotraqueitis'),(19,'2024-01-19 13:50:00.000000','Stock bajo','Bordetella'),(20,'2024-01-20 09:00:00.000000','Stock critico','Gripe Aviar');
/*!40000 ALTER TABLE `alertas_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrito`
--

DROP TABLE IF EXISTS `carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrito` (
  `id` int NOT NULL,
  `id_usuario` int DEFAULT NULL,
  `monto_total` int DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito`
--

LOCK TABLES `carrito` WRITE;
/*!40000 ALTER TABLE `carrito` DISABLE KEYS */;
INSERT INTO `carrito` VALUES (1,1,5000,1),(2,2,3000,1),(3,3,0,0),(4,4,1500,1),(5,5,8000,1),(6,6,200,0),(7,7,4500,1),(8,8,1200,1),(9,9,6000,0),(10,10,3500,1),(11,11,2200,1),(12,12,1800,0),(13,13,900,1),(14,14,4000,1),(15,15,100,0),(16,16,12000,1),(17,17,300,1),(18,18,5500,0),(19,19,2800,1),(20,20,3200,1);
/*!40000 ALTER TABLE `carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrito_has_producto`
--

DROP TABLE IF EXISTS `carrito_has_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrito_has_producto` (
  `id_Carrito` int DEFAULT NULL,
  `id_Producto` int DEFAULT NULL,
  KEY `id_Carrito` (`id_Carrito`),
  KEY `id_Producto` (`id_Producto`),
  CONSTRAINT `carrito_has_producto_ibfk_1` FOREIGN KEY (`id_Carrito`) REFERENCES `carrito` (`id`),
  CONSTRAINT `carrito_has_producto_ibfk_2` FOREIGN KEY (`id_Producto`) REFERENCES `producto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito_has_producto`
--

LOCK TABLES `carrito_has_producto` WRITE;
/*!40000 ALTER TABLE `carrito_has_producto` DISABLE KEYS */;
INSERT INTO `carrito_has_producto` VALUES (1,1),(1,10),(2,2),(4,7),(5,9),(5,3),(7,5),(8,4),(10,10),(11,11),(13,13),(14,14),(16,16),(17,17),(19,19),(20,20),(1,15),(2,13),(5,17),(7,16);
/*!40000 ALTER TABLE `carrito_has_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invitacion`
--

DROP TABLE IF EXISTS `invitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invitacion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) DEFAULT NULL,
  `email_invitado` varchar(255) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `id_invitado` int DEFAULT NULL,
  `id_invitante` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invitacion`
--

LOCK TABLES `invitacion` WRITE;
/*!40000 ALTER TABLE `invitacion` DISABLE KEYS */;
INSERT INTO `invitacion` VALUES (1,'INV001','friend1@mail.com','Pendiente','2024-12-31',NULL,1),(2,'INV002','friend2@mail.com','Aceptada','2024-12-31',2,1),(3,'INV003','friend3@mail.com','Expirada','2023-12-31',NULL,3),(4,'INV004','friend4@mail.com','Pendiente','2024-12-31',NULL,4),(5,'INV005','friend5@mail.com','Aceptada','2024-12-31',5,2),(6,'INV006','friend6@mail.com','Pendiente','2024-11-30',NULL,6),(7,'INV007','friend7@mail.com','Rechazada','2024-10-30',NULL,7),(8,'INV008','friend8@mail.com','Aceptada','2024-12-31',8,3),(9,'INV009','friend9@mail.com','Pendiente','2024-09-30',NULL,9),(10,'INV010','friend10@mail.com','Expirada','2023-11-30',NULL,10),(11,'INV011','friend11@mail.com','Aceptada','2024-12-31',11,4),(12,'INV012','friend12@mail.com','Pendiente','2024-12-31',NULL,12),(13,'INV013','friend13@mail.com','Pendiente','2024-12-31',NULL,13),(14,'INV014','friend14@mail.com','Aceptada','2024-12-31',14,5),(15,'INV015','friend15@mail.com','Rechazada','2024-08-30',NULL,15),(16,'INV016','friend16@mail.com','Pendiente','2024-12-31',NULL,16),(17,'INV017','friend17@mail.com','Aceptada','2024-12-31',17,6),(18,'INV018','friend18@mail.com','Expirada','2023-10-30',NULL,18),(19,'INV019','friend19@mail.com','Pendiente','2024-12-31',NULL,19),(20,'INV020','friend20@mail.com','Aceptada','2024-12-31',20,7);
/*!40000 ALTER TABLE `invitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mascota`
--

DROP TABLE IF EXISTS `mascota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mascota` (
  `id` int NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `edad` int DEFAULT NULL,
  `id_Duenio` int DEFAULT NULL,
  `id_Tipo` int DEFAULT NULL,
  `peso` int DEFAULT NULL,
  `raza` varchar(255) DEFAULT NULL,
  `visitas` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_Duenio` (`id_Duenio`),
  KEY `id_Tipo` (`id_Tipo`),
  CONSTRAINT `mascota_ibfk_1` FOREIGN KEY (`id_Duenio`) REFERENCES `usuario` (`id`),
  CONSTRAINT `mascota_ibfk_2` FOREIGN KEY (`id_Tipo`) REFERENCES `tipo_mascota` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mascota`
--

LOCK TABLES `mascota` WRITE;
/*!40000 ALTER TABLE `mascota` DISABLE KEYS */;
INSERT INTO `mascota` VALUES (1,'Firulais',5,1,1,12,'Callejero',10),(2,'Michi',3,2,2,4,'Siames',5),(3,'Piolin',1,3,3,0,'Canario',2),(4,'Bugs',2,4,5,2,'Angora',4),(5,'Donatello',10,5,6,1,'Orejas Rojas',1),(6,'Nemo',1,6,7,0,'Payaso',0),(7,'Rango',3,7,8,1,'Verde',3),(8,'Stuart',2,8,16,0,'Blanca',6),(9,'Alvin',4,9,17,1,'Gris',2),(10,'Lucas',2,10,18,3,'Pekin',1),(11,'Rex',7,11,1,30,'Ovejero',15),(12,'Luna',4,12,1,25,'Labrador',8),(13,'Simba',6,13,2,5,'Persa',4),(14,'Nala',2,14,2,3,'Bengali',3),(15,'Thor',8,15,1,10,'Bulldog',12),(16,'Loki',5,16,1,8,'Pug',9),(17,'Rocky',3,17,4,0,'Sirio',1),(18,'Pepe',12,18,14,1,'Guacamayo',20),(19,'Slinky',6,19,11,2,'Piton',2),(20,'Bolt',4,20,1,15,'Pastor Blanco',7);
/*!40000 ALTER TABLE `mascota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `id` int NOT NULL,
  `fecha_llegada` date DEFAULT NULL,
  `fecha_salida` date DEFAULT NULL,
  `id_Carrito` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_Carrito` (`id_Carrito`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_Carrito`) REFERENCES `carrito` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,'2024-02-01','2024-01-28',1),(2,'2024-02-02','2024-01-29',2),(3,'2024-02-03','2024-01-30',4),(4,'2024-02-05','2024-02-01',5),(5,'2024-02-06','2024-02-02',7),(6,'2024-02-08','2024-02-04',8),(7,'2024-02-10','2024-02-06',10),(8,'2024-02-12','2024-02-08',11),(9,'2024-02-15','2024-02-11',13),(10,'2024-02-18','2024-02-14',14),(11,'2024-02-20','2024-02-16',16),(12,'2024-02-22','2024-02-18',17),(13,'2024-02-25','2024-02-21',19),(14,'2024-02-28','2024-02-24',20),(15,'2024-03-01','2024-02-25',1),(16,'2024-03-02','2024-02-26',2),(17,'2024-03-05','2024-03-01',5),(18,'2024-03-08','2024-03-04',7),(19,'2024-03-10','2024-03-06',11),(20,'2024-03-12','2024-03-08',14);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id` int NOT NULL,
  `precio` int DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `categoria` varchar(45) DEFAULT NULL,
  `descuento` tinyint(1) DEFAULT NULL,
  `mascota_que_lo_consume` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mascota_que_lo_consume` (`mascota_que_lo_consume`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`mascota_que_lo_consume`) REFERENCES `tipo_mascota` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,2500,'Alimento Premium Perro','DogChow','Alimento',0,1),(2,3000,'Alimento Gato Pescado','Whiskas','Alimento',1,2),(3,500,'Semillas Girasol','Mix Aves','Alimento',0,3),(4,1200,'Heno de Alfalfa','HenoFresh','Alimento',0,5),(5,4500,'Pecera Chica','FishHome','Accesorio',1,7),(6,800,'Calcio Tortuga','TortuCal','Suplemento',0,6),(7,1500,'Sustrato Reptil','CocoBed','Accesorio',0,8),(8,200,'Rueda Hamster','Speedy','Juguete',0,4),(9,6000,'Jaula Grande','BirdMansion','Accesorio',1,3),(10,3500,'Correa Extensible','FlexiWalk','Accesorio',0,1),(11,2200,'Rascador Gato','CatTree','Juguete',1,2),(12,1800,'Shampoo Neutro','CleanPet','Higiene',0,1),(13,900,'Cepillo Cardina','SoftBrush','Higiene',0,2),(14,4000,'Transportadora M','TravelSafe','Accesorio',1,1),(15,100,'Pelota Tenis','Ball','Juguete',0,1),(16,12000,'Filtro Acuario','AquaClean','Accesorio',0,7),(17,300,'Piedra Calcio','BirdCalc','Suplemento',0,3),(18,5500,'Cama Redonda','SleepWell','Accesorio',1,1),(19,2800,'Pipeta Pulgas','NoFlea','Salud',0,1),(20,3200,'Abrigo Invierno','WarmDog','Ropa',1,1);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profecional`
--

DROP TABLE IF EXISTS `profecional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profecional` (
  `id` int NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `anios_experencia` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profecional`
--

LOCK TABLES `profecional` WRITE;
/*!40000 ALTER TABLE `profecional` DISABLE KEYS */;
INSERT INTO `profecional` VALUES (1,'Dr. House','Gregory','Diagnosta',20),(2,'Dra. Polo','Ana','Veterinaria General',10),(3,'Dr. Strange','Stephen','Cirujano',15),(4,'Dr. Dolittle','John','Comunicador Animal',25),(5,'Dra. Grey','Meredith','Cirujana',8),(6,'Dr. Shephard','Derek','Neurologo Vet',12),(7,'Dra. Yang','Cristina','Cardiologa Vet',10),(8,'Dr. Karev','Alex','Pediatria Animal',9),(9,'Dra. Bailey','Miranda','General',18),(10,'Dr. Webber','Richard','Director',30),(11,'Dr. Oz','Mehmet','Nutricionista',22),(12,'Dra. Quinn','Michaela','Holistica',14),(13,'Dr. Phil','McGraw','Psicologo Canino',20),(14,'Dra. Bones','Temperance','Traumatologa',11),(15,'Dr. House','Rodolfo','Clinico',5),(16,'Dra. Cuddy','Lisa','Administradora',15),(17,'Dr. Wilson','James','Oncologo',16),(18,'Dra. Cameron','Allison','Inmunologa',7),(19,'Dr. Chase','Robert','Intensivista',9),(20,'Dra. Thirteen','Remy','Internista',6);
/*!40000 ALTER TABLE `profecional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_mascota`
--

DROP TABLE IF EXISTS `tipo_mascota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_mascota` (
  `id` int NOT NULL,
  `nombre_tipo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_mascota`
--

LOCK TABLES `tipo_mascota` WRITE;
/*!40000 ALTER TABLE `tipo_mascota` DISABLE KEYS */;
INSERT INTO `tipo_mascota` VALUES (1,'Perro'),(2,'Gato'),(3,'Ave'),(4,'Hamster'),(5,'Conejo'),(6,'Tortuga'),(7,'Pez'),(8,'Iguana'),(9,'Cobaya'),(10,'Huron'),(11,'Serpiente'),(12,'Caballo'),(13,'Erizo'),(14,'Loro'),(15,'Tarantula'),(16,'Rata Domestica'),(17,'Chinchilla'),(18,'Pato'),(19,'Minipig'),(20,'Gecko');
/*!40000 ALTER TABLE `tipo_mascota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turno`
--

DROP TABLE IF EXISTS `turno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turno` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_Usuario` int DEFAULT NULL,
  `id_Mascota` int DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `id_Profecional` int DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `id_Vacunas` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_Vacunas` (`id_Vacunas`),
  KEY `id_Profecional` (`id_Profecional`),
  KEY `id_Usuario` (`id_Usuario`),
  KEY `id_Mascota` (`id_Mascota`),
  CONSTRAINT `turno_ibfk_1` FOREIGN KEY (`id_Vacunas`) REFERENCES `vacunas` (`id`),
  CONSTRAINT `turno_ibfk_2` FOREIGN KEY (`id_Profecional`) REFERENCES `profecional` (`id`),
  CONSTRAINT `turno_ibfk_3` FOREIGN KEY (`id_Usuario`) REFERENCES `usuario` (`id`),
  CONSTRAINT `turno_ibfk_4` FOREIGN KEY (`id_Mascota`) REFERENCES `mascota` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turno`
--

LOCK TABLES `turno` WRITE;
/*!40000 ALTER TABLE `turno` DISABLE KEYS */;
INSERT INTO `turno` VALUES (1,1,1,'2024-03-01',1,'Chequeo General',NULL),(2,2,2,'2024-03-02',2,'Vacunacion',3),(3,3,3,'2024-03-03',3,'Ala rota',NULL),(4,4,4,'2024-03-04',4,'Revision dental',NULL),(5,5,5,'2024-03-05',1,'Caparazon blando',NULL),(6,6,6,'2024-03-06',2,'Manchas en escamas',NULL),(7,7,7,'2024-03-07',3,'Cambio de piel',NULL),(8,8,8,'2024-03-08',4,'Perdida de peso',NULL),(9,9,9,'2024-03-09',5,'Control post operatorio',NULL),(10,10,10,'2024-03-10',6,'Consulta comportamiento',NULL),(11,11,11,'2024-03-11',7,'Soplo cardiaco',NULL),(12,12,12,'2024-03-12',8,'Vacunacion cachorro',6),(13,13,13,'2024-03-13',9,'Alergia alimentaria',NULL),(14,14,14,'2024-03-14',10,'Esterilizacion',NULL),(15,15,15,'2024-03-15',11,'Dieta especial',NULL),(16,16,16,'2024-03-16',12,'Terapias alternativas',NULL),(17,17,17,'2024-03-17',13,'Ansiedad',NULL),(18,18,18,'2024-03-18',14,'Fractura pata',NULL),(19,19,19,'2024-03-19',15,'Problemas respiratorios',NULL),(20,20,20,'2024-03-20',16,'Analisis sangre',NULL);
/*!40000 ALTER TABLE `turno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` int NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `contrasenia` varchar(255) DEFAULT NULL,
  `edad` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Juan','Perez','juan@mail.com','1234',30),(2,'Maria','Gomez','maria@mail.com','1234',25),(3,'Carlos','Lopez','carlos@mail.com','1234',40),(4,'Ana','Martinez','ana@mail.com','1234',22),(5,'Luis','Rodriguez','luis@mail.com','1234',35),(6,'Sofia','Hernandez','sofia@mail.com','1234',28),(7,'Miguel','Gonzalez','miguel@mail.com','1234',50),(8,'Lucia','Fernandez','lucia@mail.com','1234',19),(9,'David','Ruiz','david@mail.com','1234',33),(10,'Elena','Diaz','elena@mail.com','1234',27),(11,'Pedro','Moreno','pedro@mail.com','1234',45),(12,'Laura','Alvarez','laura@mail.com','1234',29),(13,'Daniel','Romero','daniel@mail.com','1234',31),(14,'Carmen','Navarro','carmen@mail.com','1234',55),(15,'Manuel','Torres','manuel@mail.com','1234',24),(16,'Isabel','Dominguez','isabel@mail.com','1234',38),(17,'Jorge','Vazquez','jorge@mail.com','1234',42),(18,'Marta','Ramos','marta@mail.com','1234',26),(19,'Raul','Gil','raul@mail.com','1234',34),(20,'Patricia','Serrano','patricia@mail.com','1234',30);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacuna_stock`
--

DROP TABLE IF EXISTS `vacuna_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vacuna_stock` (
  `tipo` varchar(45) NOT NULL,
  `duracion_meses` int DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `stock_minimo` int DEFAULT NULL,
  PRIMARY KEY (`tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacuna_stock`
--

LOCK TABLES `vacuna_stock` WRITE;
/*!40000 ALTER TABLE `vacuna_stock` DISABLE KEYS */;
INSERT INTO `vacuna_stock` VALUES ('Antirrabica',12,100,10),('Bordetella',6,55,10),('Calicivirus',12,28,5),('Chlamydia',12,14,2),('Corona Virus',12,35,5),('Giardia',6,20,2),('Gripe Aviar',6,10,1),('Hemorragica Viral',12,18,3),('Leptospirosis',12,45,8),('Leucemia Felina',12,25,3),('Lyme',12,15,2),('Mixomatosis',6,12,2),('Moquillo',12,70,15),('Panleucopenia',12,22,4),('Parvovirus',12,80,15),('Quintuple',12,50,5),('Rinotraqueitis',12,32,6),('Sextuple',12,40,5),('Tos de las perreras',6,30,5),('Triple Felina',12,60,10);
/*!40000 ALTER TABLE `vacuna_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacunas`
--

DROP TABLE IF EXISTS `vacunas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vacunas` (
  `id` int NOT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `vencimiento` date DEFAULT NULL,
  `id_Mascota` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_Mascota` (`id_Mascota`),
  CONSTRAINT `vacunas_ibfk_1` FOREIGN KEY (`id_Mascota`) REFERENCES `mascota` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacunas`
--

LOCK TABLES `vacunas` WRITE;
/*!40000 ALTER TABLE `vacunas` DISABLE KEYS */;
INSERT INTO `vacunas` VALUES (1,'Antirrabica','2025-01-01',1),(2,'Quintuple','2025-02-01',1),(3,'Triple Felina','2025-03-01',2),(4,'Mixomatosis','2025-01-15',4),(5,'Parvovirus','2025-04-01',11),(6,'Moquillo','2025-05-01',12),(7,'Leucemia','2025-06-01',13),(8,'Antirrabica','2025-07-01',15),(9,'Bordetella','2025-08-01',16),(10,'Gripe Aviar','2024-12-01',18),(11,'Antirrabica','2025-09-01',20),(12,'Sextuple','2025-02-15',1),(13,'Triple Felina','2025-03-15',14),(14,'Giardia','2024-11-01',11),(15,'Lyme','2025-01-20',15),(16,'Corona Virus','2025-04-10',12),(17,'Rinotraqueitis','2025-05-20',13),(18,'Panleucopenia','2025-06-15',2),(19,'Antirrabica','2025-10-01',5),(20,'Quintuple','2025-11-01',8);
/*!40000 ALTER TABLE `vacunas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-25 18:06:18
