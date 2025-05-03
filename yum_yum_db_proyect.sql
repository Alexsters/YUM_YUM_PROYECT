/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.4.32-MariaDB : Database - yum_yum_db_proyect
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`yum_yum_db_proyect` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `yum_yum_db_proyect`;

/*Table structure for table `comentarios` */

DROP TABLE IF EXISTS `comentarios`;

CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receta_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `comentario` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `receta_id` (`receta_id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`receta_id`) REFERENCES `recetas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `comentarios` */

insert  into `comentarios`(`id`,`receta_id`,`usuario_id`,`comentario`,`created_at`) values 
(2,1,1,'Delicious recipe!','2025-04-11 19:47:33'),
(3,1,1,'Delicious recipe!','2025-04-11 23:22:24'),
(5,1,2,'Delicious recipe!','2025-04-11 23:23:19'),
(7,1,1,'Updated delicious recipe!','2025-04-12 19:30:27'),
(8,1,1,'QUE RICO!','2025-04-23 20:21:48');

/*Table structure for table `ingredientes` */

DROP TABLE IF EXISTS `ingredientes`;

CREATE TABLE `ingredientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ingredientes` */

insert  into `ingredientes`(`id`,`nombre`) values 
(2,'Cebolla'),
(7,'leche'),
(9,'Tomato');

/*Table structure for table `recetas` */

DROP TABLE IF EXISTS `recetas`;

CREATE TABLE `recetas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `tiempo_preparacion` int(11) NOT NULL,
  `dificultad` enum('Fácil','Media','Difícil') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `recetas_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `recetas` */

insert  into `recetas`(`id`,`usuario_id`,`titulo`,`descripcion`,`tiempo_preparacion`,`dificultad`,`created_at`) values 
(1,1,'huevitos revuelto actualizados','huevos batidos y cocinados en sartén con queso',15,'Media','2025-03-29 04:10:49'),
(3,1,'pollo marinado','pollo marinado en especias',90,'','2025-03-29 11:08:43'),
(7,1,'milanesa de pollo','pollo empanizado y frito',20,'Fácil','2025-04-05 21:40:27'),
(8,1,'milanesa de pollo','pollo empanizado y frito',20,'Fácil','2025-04-05 22:16:09'),
(9,1,'Pasta','Easy pasta recipe',30,'Fácil','2025-04-11 19:31:12'),
(10,1,'Pasta','Easy pasta recipe',30,'Fácil','2025-04-11 23:22:36'),
(11,1,'Pasta','Easy pasta recipe',30,'Fácil','2025-04-11 23:29:14');

/*Table structure for table `recetas_ingredientes` */

DROP TABLE IF EXISTS `recetas_ingredientes`;

CREATE TABLE `recetas_ingredientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receta_id` int(11) NOT NULL,
  `ingrediente_id` int(11) NOT NULL,
  `cantidad` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `receta_id` (`receta_id`),
  KEY `ingrediente_id` (`ingrediente_id`),
  CONSTRAINT `recetas_ingredientes_ibfk_1` FOREIGN KEY (`receta_id`) REFERENCES `recetas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `recetas_ingredientes_ibfk_2` FOREIGN KEY (`ingrediente_id`) REFERENCES `ingredientes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `recetas_ingredientes` */

insert  into `recetas_ingredientes`(`id`,`receta_id`,`ingrediente_id`,`cantidad`) values 
(2,1,2,'200g'),
(3,1,2,'200g');

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre1` varchar(50) NOT NULL,
  `nombre2` varchar(50) DEFAULT NULL,
  `apellido1` varchar(50) NOT NULL,
  `apellido2` varchar(50) DEFAULT NULL,
  `edad` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contraseña` varchar(255) NOT NULL,
  `nacionalidad` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `usuarios` */

insert  into `usuarios`(`id`,`nombre1`,`nombre2`,`apellido1`,`apellido2`,`edad`,`email`,`contraseña`,`nacionalidad`,`created_at`) values 
(1,'Juan','mno','perez','oteyo',31,'juan.perez@example.com','','español','2025-03-29 03:47:10'),
(2,'Maria','sofia','carrillo','menezes',30,'juan@google.com','','colombiana','2025-03-29 11:03:59'),
(3,'Jane','Doe','Smith','Johnson',28,'jane.doe@example.com','','American','2025-03-29 03:50:05'),
(9,'Test',NULL,'User',NULL,25,'test@example.com','$2b$10$jWOkQii2ayu671s7CO7qM.PrDNXRj6887ia9ooLCYa3DISZ4X62aW','test','2025-04-04 20:51:32'),
(10,'Maria','sofia','carrillo','menezes',30,'maria@example.com','$2b$10$.9GQAm3Nj6X5THNas.936.keKj68REn/qwqWQtbWMthoahxBlNXfa','colombiana','2025-04-04 20:56:23'),
(13,'Maria','sofia','carrillo','menezes',30,'maria1@example.com','$2b$10$jHo/hBd.ZsDat9toALk0F.UAtpD5zjfuJKLLtLe0VcEjoTobYaCFy','colombiana','2025-04-05 02:08:00'),
(15,'Juan','','Perez','',30,'juan5@google.com','$2b$10$aoYygOuxC/V/Pplsjs9nsOBrmhZ4CPMd0wRzdG3SbYXCQ4kOOUnuG','Mexicana','2025-04-05 02:58:48'),
(16,'Juan','','Perez','',30,'juan2@google.com','$2b$10$44RIAP3yDvJrbl7AMLUSz.uL9JenVkotfiVY3E.4XizMAUF5G7u.C','Mexicana','2025-04-05 03:00:53'),
(17,'fabian','andres','coral','garcia',19,'fabian@example.com','$2b$10$HCN1RldGvQSA2A1OJ/Od.uzAjikjqvGp.CQZY4kZBHJDzrx9WKMAy','colombiana','2025-04-05 11:52:35'),
(24,'juan','andres','coral','garcia',19,'juan-andres@example.com','$2b$10$OC062gAh5rfx3z8d6UzWw.DYZaYwieN4u2lfmxEkklfC1qbH5pJgm','colombiana','2025-04-26 11:48:41');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
