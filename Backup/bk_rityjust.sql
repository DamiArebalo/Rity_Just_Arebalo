-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: rityjust
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
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id_cat` int NOT NULL AUTO_INCREMENT,
  `nombre_cat` varchar(60) DEFAULT NULL COMMENT 'nombre de la categoria',
  PRIMARY KEY (`id_cat`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla que contiene las categorias de los productos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'botiquin'),(2,'aromaterapia'),(3,'dermatologico'),(4,'intimo');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `dni` varchar(8) NOT NULL,
  `nombre_completo` varchar(100) NOT NULL,
  `mail` varchar(100) NOT NULL COMMENT 'Dato Validado desde backend con formato mail',
  `numero_tel` varchar(20) NOT NULL,
  PRIMARY KEY (`id_cliente`) COMMENT 'clave conformada por id_cliente',
  UNIQUE KEY `mail` (`mail`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla con informacion de los clientes al momento de la factura';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'12345678','Ana García','ana.garcia@gmail.com','1122334455'),(2,'87654321','Carlos Martínez','carlos.martinez@hotmail.com','1133557799'),(3,'23456789','Elena Pérez','elena.perez@hotmail.com','1144667788'),(4,'34567890','Diego Fernández','diego.fernandez@gmail.com','1155889900'),(5,'98765432','Sofía Rodríguez','sofia.rodriguez@gmail.com','1166778899'),(6,'87654321','Mateo López','mateo.lopez@hotmail.com','1177889900'),(7,'76543210','Valentina Gómez','valentina.gomez@gmail.com','1188990011'),(8,'65432109','Benjamín Torres','benjamin.torres@hotmail.com','1199001122'),(9,'54321098','Isabella Sánchez','isabella.sanchez@gmail.com','1100112233'),(10,'43210987','Santiago Ramírez','santiago.ramirez@hotmail.com','1111223344'),(11,'32109876','Emma Flores','emma.flores@gmail.com','1122334456'),(12,'21098765','Sebastián Castro','sebastian.castro@hotmail.com','1133445566'),(13,'10987654','Olivia Ortiz','olivia.ortiz@gmail.com','1144556677'),(14,'09876543','Nicolás Morales','nicolas.morales@hotmail.com','1155667788'),(15,'98765432','Martina Ríos','martina.rios@gmail.com','1166778899'),(16,'87654321','Emiliano Vargas','emiliano.vargas@hotmail.com','1177889900'),(17,'76543210','Renata Silva','renata.silva@gmail.com','1188990011'),(18,'65432109','Thiago Mendoza','thiago.mendoza@hotmail.com','1199001122'),(19,'54321098','Antonella Rojas','antonella.rojas@gmail.com','1100112233');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturaciones`
--

DROP TABLE IF EXISTS `facturaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturaciones` (
  `id_fact` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL COMMENT 'cliente foraneo a tabla clientes',
  `total` decimal(12,2) DEFAULT (0) COMMENT 'total de la factura calculado con la suma de los totales de productos facturados',
  `fecha_fact` datetime NOT NULL DEFAULT (now()) COMMENT 'Fecha de compra',
  `pagado` tinyint(1) NOT NULL DEFAULT (true) COMMENT 'estado de la compra',
  PRIMARY KEY (`id_fact`),
  KEY `fk_fact_cl` (`id_cliente`),
  CONSTRAINT `fk_fact_cl` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='TABLA CON INFORMACION PROPIA DE CADA FACTURA';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturaciones`
--

LOCK TABLES `facturaciones` WRITE;
/*!40000 ALTER TABLE `facturaciones` DISABLE KEYS */;
INSERT INTO `facturaciones` VALUES (1,1,34500.00,'2024-04-02 00:00:00',1),(2,2,78200.00,'2024-04-06 00:00:00',1),(3,3,88800.00,'2024-04-10 00:00:00',1),(4,4,32500.00,'2024-04-15 00:00:00',1),(5,13,80000.00,'2024-04-20 00:00:00',1),(6,2,23400.00,'2024-04-25 00:00:00',1),(7,1,96000.00,'2024-08-29 00:00:00',0),(8,2,71100.00,'2024-08-29 00:00:00',0),(9,3,29000.00,'2024-08-29 00:00:00',0),(10,4,90000.00,'2024-08-29 00:00:00',0),(11,1,30000.00,'2024-05-01 00:00:00',1),(12,2,4500.00,'2024-05-05 00:00:00',1),(13,3,43200.00,'2024-05-10 00:00:00',1),(14,4,35000.00,'2024-05-15 00:00:00',1),(15,4,60000.00,'2024-05-20 00:00:00',1),(16,5,24900.00,'2024-05-25 00:00:00',1),(17,6,25850.00,'2024-05-30 00:00:00',1),(18,7,52850.00,'2024-06-05 00:00:00',1),(19,8,24200.00,'2024-06-10 00:00:00',1),(20,9,33800.00,'2024-06-15 00:00:00',0),(21,10,39750.00,'2024-06-20 00:00:00',1),(22,11,22300.00,'2024-06-25 00:00:00',1),(23,12,12600.00,'2024-06-30 00:00:00',0);
/*!40000 ALTER TABLE `facturaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupos`
--

DROP TABLE IF EXISTS `grupos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupos` (
  `id_grupo` int NOT NULL AUTO_INCREMENT,
  `id_lider` int NOT NULL,
  PRIMARY KEY (`id_grupo`),
  KEY `fk_grupo_lider` (`id_lider`),
  CONSTRAINT `fk_grupo_lider` FOREIGN KEY (`id_lider`) REFERENCES `lideres` (`id_lider`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='TABLA DE INFO DE GRUPOS CON SU LIDER';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupos`
--

LOCK TABLES `grupos` WRITE;
/*!40000 ALTER TABLE `grupos` DISABLE KEYS */;
INSERT INTO `grupos` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `grupos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lideres`
--

DROP TABLE IF EXISTS `lideres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lideres` (
  `id_lider` int NOT NULL AUTO_INCREMENT,
  `nombre_completo` varchar(100) NOT NULL,
  `cuit` varchar(11) NOT NULL,
  PRIMARY KEY (`id_lider`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='TABLA DE INFORMACION DE LIDERES';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lideres`
--

LOCK TABLES `lideres` WRITE;
/*!40000 ALTER TABLE `lideres` DISABLE KEYS */;
INSERT INTO `lideres` VALUES (1,'María Rodríguez','20123456780'),(2,'Juan Pérez','20234567891'),(3,'Luciana Fernández','20567890123'),(4,'Tomás González','20678901234'),(5,'Camila Martínez','20789012345');
/*!40000 ALTER TABLE `lideres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link_fact_producto`
--

DROP TABLE IF EXISTS `link_fact_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `link_fact_producto` (
  `id_prod` int NOT NULL,
  `id_fact` int NOT NULL,
  `cantidad` int NOT NULL DEFAULT (1) COMMENT 'cantidad del pructo agregado',
  `total` decimal(10,2) DEFAULT NULL COMMENT 'Campo calculable del total de cada producto * su cantidad',
  PRIMARY KEY (`id_prod`,`id_fact`),
  KEY `fk_link_prod_fact` (`id_fact`),
  CONSTRAINT `fk_link_fact_prod` FOREIGN KEY (`id_prod`) REFERENCES `productos` (`id_prod`),
  CONSTRAINT `fk_link_prod_fact` FOREIGN KEY (`id_fact`) REFERENCES `facturaciones` (`id_fact`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla de relacion entre productos y facturas';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link_fact_producto`
--

LOCK TABLES `link_fact_producto` WRITE;
/*!40000 ALTER TABLE `link_fact_producto` DISABLE KEYS */;
INSERT INTO `link_fact_producto` VALUES (1,1,2,30000.00),(1,3,4,60000.00),(1,5,3,45000.00),(1,7,5,75000.00),(1,9,1,15000.00),(1,11,2,30000.00),(1,15,4,60000.00),(2,1,1,4500.00),(2,4,1,4500.00),(2,6,2,9000.00),(2,8,3,13500.00),(2,10,4,18000.00),(2,12,1,4500.00),(3,2,3,43200.00),(3,3,2,28800.00),(3,6,1,14400.00),(3,8,4,57600.00),(3,10,5,72000.00),(3,13,3,43200.00),(4,2,5,35000.00),(4,4,4,28000.00),(4,5,5,35000.00),(4,7,3,21000.00),(4,9,2,14000.00),(4,14,5,35000.00),(5,16,2,20400.00),(6,22,1,6300.00),(7,16,1,4500.00),(8,17,3,20250.00),(9,22,2,16000.00),(10,17,2,5600.00),(11,18,1,11050.00),(12,23,3,12600.00),(13,18,2,41800.00),(14,19,3,14850.00),(16,19,1,9350.00),(17,20,2,21000.00),(19,20,1,12800.00),(20,21,3,22950.00),(21,21,2,16800.00);
/*!40000 ALTER TABLE `link_fact_producto` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_calcula_total` BEFORE INSERT ON `link_fact_producto` FOR EACH ROW BEGIN
    
    SET @product_price = (
        SELECT CASE
            WHEN o.precio_final > 0 THEN o.precio_final  -- condicion para ver si tiene oferta
            ELSE p.precio_lista
        END
        FROM productos AS p  
        LEFT JOIN ofertas AS o ON p.id_prod = o.id_prod
        WHERE p.id_prod = NEW.id_prod
    );
    SET NEW.total =  COALESCE(@product_price * NEW.cantidad, 0);

 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_calcula_total_factura` AFTER INSERT ON `link_fact_producto` FOR EACH ROW BEGIN 
	CALL actualizarTotalFactura(NEW.id_fact); 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `link_vendedor_fact`
--

DROP TABLE IF EXISTS `link_vendedor_fact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `link_vendedor_fact` (
  `id_vendedor` int NOT NULL,
  `id_fact` int NOT NULL,
  PRIMARY KEY (`id_vendedor`,`id_fact`),
  KEY `fk_link_vendedor_fact` (`id_fact`),
  CONSTRAINT `fk_link_fact_vendedor` FOREIGN KEY (`id_vendedor`) REFERENCES `vendedores` (`id_vendedor`),
  CONSTRAINT `fk_link_vendedor_fact` FOREIGN KEY (`id_fact`) REFERENCES `facturaciones` (`id_fact`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='TABLA DE RELACION ENTRE FACTURAS Y VENDEDORES';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link_vendedor_fact`
--

LOCK TABLES `link_vendedor_fact` WRITE;
/*!40000 ALTER TABLE `link_vendedor_fact` DISABLE KEYS */;
INSERT INTO `link_vendedor_fact` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(1,7),(2,8),(3,9),(4,10),(1,11),(2,12),(3,13),(4,14),(5,15),(7,16),(8,17),(9,18),(10,19),(11,20),(12,21),(13,22),(14,23);
/*!40000 ALTER TABLE `link_vendedor_fact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_errores`
--

DROP TABLE IF EXISTS `log_errores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_errores` (
  `id_error` int NOT NULL AUTO_INCREMENT,
  `error_message` varchar(100) DEFAULT NULL,
  `error_details` varchar(255) DEFAULT NULL,
  `error_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_error`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='TABLA PARA LA GESTION DE ERRORES GUARDA LAS ALERTAS Y LA HORA EN LA QUE SE EFECTUA';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_errores`
--

LOCK TABLES `log_errores` WRITE;
/*!40000 ALTER TABLE `log_errores` DISABLE KEYS */;
INSERT INTO `log_errores` VALUES (1,'Vendedor no encontrado','Producto ID: 3, Valor/Descuento: Juan Perez','2024-08-29 22:41:57'),(2,'Vendedor no encontrado','Producto ID: 3, Valor/Descuento: Juan Perez','2024-08-29 22:41:57'),(3,'Vendedor no encontrado','Producto ID: 3, Valor/Descuento: Juan Pérez','2024-08-29 22:42:07'),(4,'Vendedor no encontrado','Producto ID: 3, Valor/Descuento: Juan Pérez','2024-08-29 22:42:07'),(5,'Vendedor no encontrado','Producto ID: 3, Valor/Descuento: Juan Pérez','2024-08-29 22:43:11'),(6,'Vendedor no encontrado','Producto ID: 3, Valor/Descuento: Juan Pérez','2024-08-29 22:43:11');
/*!40000 ALTER TABLE `log_errores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_ofertas`
--

DROP TABLE IF EXISTS `log_ofertas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_ofertas` (
  `id_oferta` int NOT NULL AUTO_INCREMENT,
  `id_prod` int DEFAULT NULL,
  `precio_lista` decimal(10,2) DEFAULT NULL,
  `descuento` decimal(5,2) DEFAULT NULL,
  `precio_final` decimal(10,2) DEFAULT NULL,
  `tiempo` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_oferta`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='TABLA PARA LA GESTION DE ERRORES EN EL CALCULO DE DATOS';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_ofertas`
--

LOCK TABLES `log_ofertas` WRITE;
/*!40000 ALTER TABLE `log_ofertas` DISABLE KEYS */;
INSERT INTO `log_ofertas` VALUES (1,3,18000.00,20.00,14400.00,'2024-08-29 22:35:37'),(2,6,9000.00,30.00,6300.00,'2024-08-29 22:35:37'),(3,4,7000.00,0.00,7000.00,'2024-08-29 22:35:37'),(4,2,5000.00,10.00,4500.00,'2024-08-29 22:35:37'),(5,5,12000.00,15.00,10200.00,'2024-08-29 22:35:37'),(6,7,6000.00,25.00,4500.00,'2024-08-29 22:35:37'),(7,8,7500.00,10.00,6750.00,'2024-08-29 22:35:37'),(8,10,3500.00,20.00,2800.00,'2024-08-29 22:35:37'),(9,11,13000.00,15.00,11050.00,'2024-08-29 22:35:37'),(10,12,6000.00,30.00,4200.00,'2024-08-29 22:35:37'),(11,13,22000.00,5.00,20900.00,'2024-08-29 22:35:37'),(12,14,5500.00,10.00,4950.00,'2024-08-29 22:35:37'),(13,15,8500.00,20.00,6800.00,'2024-08-29 22:35:37'),(14,16,11000.00,15.00,9350.00,'2024-08-29 22:35:37'),(15,17,14000.00,25.00,10500.00,'2024-08-29 22:35:37'),(16,18,7000.00,10.00,6300.00,'2024-08-29 22:35:37'),(17,19,16000.00,20.00,12800.00,'2024-08-29 22:35:37'),(18,20,9000.00,15.00,7650.00,'2024-08-29 22:35:37'),(19,21,12000.00,30.00,8400.00,'2024-08-29 22:35:37');
/*!40000 ALTER TABLE `log_ofertas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ofertas`
--

DROP TABLE IF EXISTS `ofertas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofertas` (
  `id_oferta` int NOT NULL AUTO_INCREMENT,
  `id_prod` int NOT NULL COMMENT 'Campo FK con tabla PRODUCTOS',
  `descuento` int NOT NULL DEFAULT (0) COMMENT 'Porcentaje de descuento de 2 digitos SI ES 0 = NO HAY DESCUENTO',
  `precio_final` decimal(10,2) NOT NULL DEFAULT (0) COMMENT 'campo calculable con funcion',
  PRIMARY KEY (`id_oferta`),
  KEY `fk_ofertas_prod` (`id_prod`),
  CONSTRAINT `fk_ofertas_prod` FOREIGN KEY (`id_prod`) REFERENCES `productos` (`id_prod`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='TABLA CON LA INFORMACION DE LAS OFERTAS VIGENTES O NO VIGENTES DE LOS PRODUCTOS';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofertas`
--

LOCK TABLES `ofertas` WRITE;
/*!40000 ALTER TABLE `ofertas` DISABLE KEYS */;
INSERT INTO `ofertas` VALUES (1,3,20,14400.00),(2,6,30,6300.00),(3,4,0,7000.00),(4,2,10,4500.00),(5,5,15,10200.00),(6,7,25,4500.00),(7,8,10,6750.00),(8,10,20,2800.00),(9,11,15,11050.00),(10,12,30,4200.00),(11,13,5,20900.00),(12,14,10,4950.00),(13,15,20,6800.00),(14,16,15,9350.00),(15,17,25,10500.00),(16,18,10,6300.00),(17,19,20,12800.00),(18,20,15,7650.00),(19,21,30,8400.00);
/*!40000 ALTER TABLE `ofertas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_ofertas_calcula_precio_final` BEFORE INSERT ON `ofertas` FOR EACH ROW BEGIN
    
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Insertar el mensaje de error en la tabla de log de errores
        CALL manejar_error("Error al calcular precio de oferta", NEW.id_prod , NEW.descuento);
    END;

    -- Obtener el precio de lista del producto
    SET @precio_lista = obtenerPrecioLista(NEW.id_prod);

    -- Calcular el precio final utilizando la función calcularPrecioFinal
    SET NEW.precio_final = COALESCE(calcularPrecioFinal(@precio_lista, NEW.descuento), 0);

    -- Insertar los valores en la tabla de registro
    INSERT INTO log_ofertas (id_prod, precio_lista, descuento, precio_final)
    VALUES (NEW.id_prod, @precio_lista, NEW.descuento, NEW.precio_final);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id_prod` int NOT NULL AUTO_INCREMENT,
  `id_cat` int NOT NULL COMMENT 'Campo con FK',
  `descripcion` varchar(150) NOT NULL COMMENT 'Descripcion de los beneficios del producto',
  `nombre_prod` varchar(70) NOT NULL,
  `stock` int DEFAULT (0) COMMENT 'Stock del producto. campo actualizable con cada facturacion',
  `precio_lista` decimal(12,2) NOT NULL DEFAULT (10000),
  PRIMARY KEY (`id_prod`),
  KEY `fk_cat_prod` (`id_cat`),
  CONSTRAINT `fk_cat_prod` FOREIGN KEY (`id_cat`) REFERENCES `categorias` (`id_cat`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='TABLA CON INFORMACION PROPIA DE CADA PRODUCTO';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,3,'Hidratación profunda para una piel suave y radiante.','Crema Facial Hidratante',20,15000.00),(2,2,'Relajación y bienestar con aroma floral.','Aceite Esencial de Lavanda',15,5000.00),(3,3,'Reduce arrugas y líneas de expresión. Fórmula con colágeno y ácido hialurónico.','Serum Antiedad',25,18000.00),(4,2,'Regeneración celular y cicatrización. Ideal para pieles sensibles.','Aceite de Rosa Mosqueta',18,7000.00),(5,3,'Limpieza profunda y suave para todo tipo de piel.','Gel Limpiador Facial',30,12000.00),(6,1,'Fortalece el cabello y previene la caída.','Champú de Hierbas',22,9000.00),(7,1,'Suavidad y cuidado para la piel.','Jabón de Caléndula',40,6000.00),(8,2,'Hidratación y nutrición para la piel.','Aceite de Almendras',28,7500.00),(9,3,'Protege y suaviza la piel de las manos.','Crema para Manos',15,8000.00),(10,4,'Hidratación y protección para los labios.','Bálsamo Labial',50,3500.00),(11,3,'Limpieza profunda y desintoxicación para la piel.','Mascarilla de Arcilla',25,13000.00),(12,2,'Refrescante y energizante. Ideal para aromaterapia.','Aceite Esencial de Menta',20,6000.00),(13,3,'Combate los signos del envejecimiento. Con retinol y vitamina E.','Crema Antiarrugas',15,22000.00),(14,1,'Hidratante y calmante para todo tipo de piel.','Jabón de Aloe Vera',35,5500.00),(15,2,'Hidratación profunda para piel y cabello.','Aceite de Jojoba',18,8500.00),(16,3,'Hidratación intensa para todo el cuerpo.','Loción Corporal',30,11000.00),(17,3,'Renovación celular para una piel más suave y luminosa.','Exfoliante Facial',22,14000.00),(18,2,'Descongestivo y purificante. Ideal para masajes.','Aceite Esencial de Eucalipto',25,7000.00),(19,4,'Reduce ojeras y líneas de expresión.','Crema para Contorno de Ojos',20,16000.00),(20,1,'Multiusos: hidratante, calmante y regenerador.','Gel de Aloe Vera',40,9000.00),(21,2,'Nutrición intensa para piel y cabello.','Aceite de Argán',15,12000.00),(22,3,'Alta protección UVA/UVB. Textura ligera.','Protector Solar Facial',25,18000.00),(23,1,'Ecológico y libre de sulfatos. Para todo tipo de cabello.','Champú Sólido',30,7500.00),(24,2,'Propiedades antibacterianas y purificantes.','Aceite Esencial de Tea Tree',20,6500.00),(25,3,'Iluminador y antioxidante para una piel radiante.','Sérum de Vitamina C',18,20000.00);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `control_de_stock` BEFORE UPDATE ON `productos` FOR EACH ROW BEGIN
    IF NEW.stock < 0 THEN
        CALL manejar_error('Stock no puede ser negativo', NEW.id_prod, NEW.stock);
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `vendedores`
--

DROP TABLE IF EXISTS `vendedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedores` (
  `id_vendedor` int NOT NULL AUTO_INCREMENT,
  `id_grupo` int NOT NULL,
  `nombre_completo` varchar(100) NOT NULL,
  `cuit` varchar(11) NOT NULL,
  PRIMARY KEY (`id_vendedor`),
  KEY `fk_vendedor_grupo` (`id_grupo`),
  CONSTRAINT `fk_vendedor_grupo` FOREIGN KEY (`id_grupo`) REFERENCES `grupos` (`id_grupo`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='TABLA CON INFOMRACION PROPIA DE CADA VENDEDOR';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedores`
--

LOCK TABLES `vendedores` WRITE;
/*!40000 ALTER TABLE `vendedores` DISABLE KEYS */;
INSERT INTO `vendedores` VALUES (1,1,'Pedro López','20345678902'),(2,2,'Laura Fernández','20456789013'),(3,1,'Damian Arebalo','20345776902'),(4,2,'Sheila Gonzalez','20446789013'),(5,1,'Juan López','20345788902'),(6,2,'Abril Fernández','20426789013'),(7,1,'Valentín Acosta','20890123456'),(8,1,'Martina Blanco','20901234567'),(9,1,'Lautaro Cabrera','20012345678'),(10,2,'Zoe Díaz','20123456789'),(11,2,'Benjamín Escobar','20234567890'),(12,2,'Alma Figueroa','20345678901'),(13,3,'Ignacio Giménez','20456789012'),(14,3,'Mía Hernández','20567890123'),(15,3,'Felipe Ibáñez','20678901234'),(16,4,'Emilia Jiménez','20789012345'),(17,4,'Mateo Keller','20890123456'),(18,4,'Sofía Luna','20901234567'),(19,5,'Dante Moreno','20012345678'),(20,5,'Olivia Navarro','20123456789'),(21,5,'Santino Ortega','20234567890'),(22,1,'Renata Pacheco','20345678901'),(23,2,'Thiago Quintana','20456789012'),(24,3,'Isabella Romero','20567890123');
/*!40000 ALTER TABLE `vendedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_factura_detalle`
--

DROP TABLE IF EXISTS `vw_factura_detalle`;
/*!50001 DROP VIEW IF EXISTS `vw_factura_detalle`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_factura_detalle` AS SELECT 
 1 AS `id_fact`,
 1 AS `nombre_cliente`,
 1 AS `nombre_vendedor`,
 1 AS `productos_involucrados`,
 1 AS `total_factura`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_listado_productos`
--

DROP TABLE IF EXISTS `vw_listado_productos`;
/*!50001 DROP VIEW IF EXISTS `vw_listado_productos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_listado_productos` AS SELECT 
 1 AS `id_prod`,
 1 AS `categoria`,
 1 AS `nombre_prod`,
 1 AS `precio_lista`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_productos_con_stock`
--

DROP TABLE IF EXISTS `vw_productos_con_stock`;
/*!50001 DROP VIEW IF EXISTS `vw_productos_con_stock`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_productos_con_stock` AS SELECT 
 1 AS `id_prod`,
 1 AS `nombre_prod`,
 1 AS `stock`,
 1 AS `precio_lista`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_vendedores_facturas`
--

DROP TABLE IF EXISTS `vw_vendedores_facturas`;
/*!50001 DROP VIEW IF EXISTS `vw_vendedores_facturas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_vendedores_facturas` AS SELECT 
 1 AS `vendedor_nombre`,
 1 AS `id_fact`,
 1 AS `total`,
 1 AS `comision`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_factura_detalle`
--

/*!50001 DROP VIEW IF EXISTS `vw_factura_detalle`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_factura_detalle` AS select `f`.`id_fact` AS `id_fact`,max(`c`.`nombre_completo`) AS `nombre_cliente`,max(`v`.`nombre_completo`) AS `nombre_vendedor`,group_concat(concat(`lfp`.`cantidad`,' ',`p`.`nombre_prod`) separator ',') AS `productos_involucrados`,sum(`lfp`.`total`) AS `total_factura` from (((((`facturaciones` `f` join `link_fact_producto` `lfp` on((`f`.`id_fact` = `lfp`.`id_fact`))) join `productos` `p` on((`lfp`.`id_prod` = `p`.`id_prod`))) join `clientes` `c` on((`f`.`id_cliente` = `c`.`id_cliente`))) join `link_vendedor_fact` `lvf` on((`f`.`id_fact` = `lvf`.`id_fact`))) join `vendedores` `v` on((`lvf`.`id_vendedor` = `v`.`id_vendedor`))) group by `f`.`id_fact` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_listado_productos`
--

/*!50001 DROP VIEW IF EXISTS `vw_listado_productos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_listado_productos` AS select `p`.`id_prod` AS `id_prod`,`c`.`nombre_cat` AS `categoria`,`p`.`nombre_prod` AS `nombre_prod`,`p`.`precio_lista` AS `precio_lista` from (`productos` `p` join `categorias` `c` on((`p`.`id_cat` = `c`.`id_cat`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_productos_con_stock`
--

/*!50001 DROP VIEW IF EXISTS `vw_productos_con_stock`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_productos_con_stock` AS select `productos`.`id_prod` AS `id_prod`,`productos`.`nombre_prod` AS `nombre_prod`,`productos`.`stock` AS `stock`,`productos`.`precio_lista` AS `precio_lista` from `productos` where (`productos`.`stock` > 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_vendedores_facturas`
--

/*!50001 DROP VIEW IF EXISTS `vw_vendedores_facturas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_vendedores_facturas` AS select `v`.`nombre_completo` AS `vendedor_nombre`,`lf`.`id_fact` AS `id_fact`,`f`.`total` AS `total`,(`f`.`total` * 0.2) AS `comision` from ((`vendedores` `v` join `link_vendedor_fact` `lf` on((`v`.`id_vendedor` = `lf`.`id_vendedor`))) join `facturaciones` `f` on((`f`.`id_fact` = `lf`.`id_fact`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-29 19:55:54
