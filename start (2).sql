-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: project
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (2,'blacklist'),(1,'customer');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add admin',7,'add_admin'),(26,'Can change admin',7,'change_admin'),(27,'Can delete admin',7,'delete_admin'),(28,'Can view admin',7,'view_admin'),(29,'Can add admin_ customer',8,'add_admin_customer'),(30,'Can change admin_ customer',8,'change_admin_customer'),(31,'Can delete admin_ customer',8,'delete_admin_customer'),(32,'Can view admin_ customer',8,'view_admin_customer'),(33,'Can add customer',9,'add_customer'),(34,'Can change customer',9,'change_customer'),(35,'Can delete customer',9,'delete_customer'),(36,'Can view customer',9,'view_customer'),(37,'Can add dealer stock',10,'add_dealerstock'),(38,'Can change dealer stock',10,'change_dealerstock'),(39,'Can delete dealer stock',10,'delete_dealerstock'),(40,'Can view dealer stock',10,'view_dealerstock'),(41,'Can add feed back',11,'add_feedback'),(42,'Can change feed back',11,'change_feedback'),(43,'Can delete feed back',11,'delete_feedback'),(44,'Can view feed back',11,'view_feedback'),(45,'Can add manufactor',12,'add_manufactor'),(46,'Can change manufactor',12,'change_manufactor'),(47,'Can delete manufactor',12,'delete_manufactor'),(48,'Can view manufactor',12,'view_manufactor'),(49,'Can add order',13,'add_order'),(50,'Can change order',13,'change_order'),(51,'Can delete order',13,'delete_order'),(52,'Can view order',13,'view_order'),(53,'Can add order detail',14,'add_orderdetail'),(54,'Can change order detail',14,'change_orderdetail'),(55,'Can delete order detail',14,'delete_orderdetail'),(56,'Can view order detail',14,'view_orderdetail'),(57,'Can add product',15,'add_product'),(58,'Can change product',15,'change_product'),(59,'Can delete product',15,'delete_product'),(60,'Can view product',15,'view_product'),(61,'Can add product_ dealer stock',16,'add_product_dealerstock'),(62,'Can change product_ dealer stock',16,'change_product_dealerstock'),(63,'Can delete product_ dealer stock',16,'delete_product_dealerstock'),(64,'Can view product_ dealer stock',16,'view_product_dealerstock'),(65,'Can add product lot',17,'add_productlot'),(66,'Can change product lot',17,'change_productlot'),(67,'Can delete product lot',17,'delete_productlot'),(68,'Can view product lot',17,'view_productlot'),(69,'Can add shipment',18,'add_shipment'),(70,'Can change shipment',18,'change_shipment'),(71,'Can delete shipment',18,'delete_shipment'),(72,'Can view shipment',18,'view_shipment'),(73,'Can add dealer',19,'add_dealer'),(74,'Can change dealer',19,'change_dealer'),(75,'Can delete dealer',19,'delete_dealer'),(76,'Can view dealer',19,'view_dealer');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$120000$ikudl8c6hLS0$oRH+Bu2TkThaaaZyMvnioAkM1hbZnCvNVz3U6XwSGnE=','2019-05-04 22:25:59.346052',1,'admin','','','momo_niti@hotmail.com',1,1,'2019-05-04 22:25:38.472533');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-05-04 22:26:14.709870','1','customer',1,'[{\"added\": {}}]',3,1),(2,'2019-05-04 22:26:21.758818','2','blacklist',1,'[{\"added\": {}}]',3,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'products','admin'),(8,'products','admin_customer'),(9,'products','customer'),(19,'products','dealer'),(10,'products','dealerstock'),(11,'products','feedback'),(12,'products','manufactor'),(13,'products','order'),(14,'products','orderdetail'),(15,'products','product'),(16,'products','product_dealerstock'),(17,'products','productlot'),(18,'products','shipment'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-05-04 22:20:15.692536'),(2,'auth','0001_initial','2019-05-04 22:20:20.121189'),(3,'admin','0001_initial','2019-05-04 22:20:21.023033'),(4,'admin','0002_logentry_remove_auto_add','2019-05-04 22:20:21.058745'),(5,'admin','0003_logentry_add_action_flag_choices','2019-05-04 22:20:21.094455'),(6,'contenttypes','0002_remove_content_type_name','2019-05-04 22:20:22.001810'),(7,'auth','0002_alter_permission_name_max_length','2019-05-04 22:20:22.585187'),(8,'auth','0003_alter_user_email_max_length','2019-05-04 22:20:22.690309'),(9,'auth','0004_alter_user_username_opts','2019-05-04 22:20:22.726021'),(10,'auth','0005_alter_user_last_login_null','2019-05-04 22:20:23.056535'),(11,'auth','0006_require_contenttypes_0002','2019-05-04 22:20:23.071922'),(12,'auth','0007_alter_validators_add_error_messages','2019-05-04 22:20:23.110103'),(13,'auth','0008_alter_user_username_max_length','2019-05-04 22:20:23.521676'),(14,'auth','0009_alter_user_last_name_max_length','2019-05-04 22:20:23.917696'),(15,'products','0001_initial','2019-05-04 22:20:34.059790'),(16,'sessions','0001_initial','2019-05-04 22:20:34.266751');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('8aqf5sjh2n0idcoso6bc4umi8hvmq910','YmUzZjA1ZjM5YWVkMTQ1YzJkOGFiZjU4ZTdjNDA5ODM1Nzk2YTVhMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiYTBkMDFiNzE3NGY4MGI5MjRhYmEwNDc5MmVjNDNkZjRhMzM3ZjIxIn0=','2019-05-18 22:25:59.358453');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_admin`
--

DROP TABLE IF EXISTS `products_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `products_admin` (
  `phone` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `products_admin_user_id_3aa2dd7f_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_admin`
--

LOCK TABLES `products_admin` WRITE;
/*!40000 ALTER TABLE `products_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_admin_customer`
--

DROP TABLE IF EXISTS `products_admin_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `products_admin_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `result` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `evidence` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_admin_custo_admin_id_0b1b1199_fk_products_` (`admin_id`),
  KEY `products_admin_custo_customer_id_f9962291_fk_products_` (`customer_id`),
  CONSTRAINT `products_admin_custo_admin_id_0b1b1199_fk_products_` FOREIGN KEY (`admin_id`) REFERENCES `products_admin` (`user_id`),
  CONSTRAINT `products_admin_custo_customer_id_f9962291_fk_products_` FOREIGN KEY (`customer_id`) REFERENCES `products_customer` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_admin_customer`
--

LOCK TABLES `products_admin_customer` WRITE;
/*!40000 ALTER TABLE `products_admin_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_admin_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_customer`
--

DROP TABLE IF EXISTS `products_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `products_customer` (
  `address` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `blacklist` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `products_customer_user_id_1eea4cea_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_customer`
--

LOCK TABLES `products_customer` WRITE;
/*!40000 ALTER TABLE `products_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_dealer`
--

DROP TABLE IF EXISTS `products_dealer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `products_dealer` (
  `customer_ptr_id` int(11) NOT NULL,
  `discount` decimal(8,2) NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  PRIMARY KEY (`customer_ptr_id`),
  CONSTRAINT `products_dealer_customer_ptr_id_e543c5f2_fk_products_` FOREIGN KEY (`customer_ptr_id`) REFERENCES `products_customer` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_dealer`
--

LOCK TABLES `products_dealer` WRITE;
/*!40000 ALTER TABLE `products_dealer` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_dealer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_dealerstock`
--

DROP TABLE IF EXISTS `products_dealerstock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `products_dealerstock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dealer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dealer_id` (`dealer_id`),
  CONSTRAINT `products_dealerstock_dealer_id_0793a253_fk_products_` FOREIGN KEY (`dealer_id`) REFERENCES `products_dealer` (`customer_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_dealerstock`
--

LOCK TABLES `products_dealerstock` WRITE;
/*!40000 ALTER TABLE `products_dealerstock` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_dealerstock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_feedback`
--

DROP TABLE IF EXISTS `products_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `products_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_feedback_admin_id_b5747881_fk_products_admin_user_id` (`admin_id`),
  KEY `products_feedback_customer_id_6d8ab2d2_fk_products_` (`customer_id`),
  CONSTRAINT `products_feedback_admin_id_b5747881_fk_products_admin_user_id` FOREIGN KEY (`admin_id`) REFERENCES `products_admin` (`user_id`),
  CONSTRAINT `products_feedback_customer_id_6d8ab2d2_fk_products_` FOREIGN KEY (`customer_id`) REFERENCES `products_customer` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_feedback`
--

LOCK TABLES `products_feedback` WRITE;
/*!40000 ALTER TABLE `products_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_manufactor`
--

DROP TABLE IF EXISTS `products_manufactor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `products_manufactor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_manufactor`
--

LOCK TABLES `products_manufactor` WRITE;
/*!40000 ALTER TABLE `products_manufactor` DISABLE KEYS */;
INSERT INTO `products_manufactor` VALUES (1,'บริษัท วธูธร จำกัด','46, 154 ซอย 5 ตำบล บ้านใหม่ อำเภอ ปากเกร็ด นนทบุรี 11120','0829617944'),(2,'บริษัท ไลฟ์ พลัส ฟาร์มาซูติคอล จำกัด','89/8 ม.9 โครงการ MARIGOLD WAREHOUSE PARK ถ.หนามแดง-บางพลี ตำบลบางแก้ว อำเภอบางพลี สมุทรปราการ 10540','0888241433'),(3,'บริษัท เดอร์มา อินโนเวชั่น จำกัด','111/1 หมู่ 4 ซ.แจ้งวัฒนะ 19 ต.คลองเกลือ อ.ปากเกร็ด จ.นนทบุรี 11120','0819850111'),(4,'บริษัท ไอ-คอสเมติก จำกัด','51/474 เมืองเอกรังสิต  ถ.เอกทักษิณ5 ต.หลักหก อ.เมือง  ปทุมธานี  12000','098-249-07'),(5,'Bioticon Co.,Ltd.','The Compound Ramintra 109 , Room C4 , Bangchan Khlong Sam Wa, Bangkok 10510','0993569156');
/*!40000 ALTER TABLE `products_manufactor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_order`
--

DROP TABLE IF EXISTS `products_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `products_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `detail` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_price1` decimal(8,2) NOT NULL,
  `total_price2` decimal(8,2) NOT NULL,
  `cancel` tinyint(1) NOT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cancel_date` date DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_order_admin_id_c60894a1_fk_products_admin_user_id` (`admin_id`),
  KEY `products_order_customer_id_6cb09035_fk_products_customer_user_id` (`customer_id`),
  CONSTRAINT `products_order_admin_id_c60894a1_fk_products_admin_user_id` FOREIGN KEY (`admin_id`) REFERENCES `products_admin` (`user_id`),
  CONSTRAINT `products_order_customer_id_6cb09035_fk_products_customer_user_id` FOREIGN KEY (`customer_id`) REFERENCES `products_customer` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_order`
--

LOCK TABLES `products_order` WRITE;
/*!40000 ALTER TABLE `products_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_orderdetail`
--

DROP TABLE IF EXISTS `products_orderdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `products_orderdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `detail` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_orderdetail_order_id_f7ac041c_fk_products_order_id` (`order_id`),
  KEY `products_orderdetail_product_id_621fbe24_fk_products_product_id` (`product_id`),
  CONSTRAINT `products_orderdetail_order_id_f7ac041c_fk_products_order_id` FOREIGN KEY (`order_id`) REFERENCES `products_order` (`id`),
  CONSTRAINT `products_orderdetail_product_id_621fbe24_fk_products_product_id` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_orderdetail`
--

LOCK TABLES `products_orderdetail` WRITE;
/*!40000 ALTER TABLE `products_orderdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_orderdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_product`
--

DROP TABLE IF EXISTS `products_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `products_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `describe` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `minimum_stock` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `manufactor_id` int(11) NOT NULL,
  `img_url` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_product_manufactor_id_4b28e972_fk_products_` (`manufactor_id`),
  CONSTRAINT `products_product_manufactor_id_4b28e972_fk_products_` FOREIGN KEY (`manufactor_id`) REFERENCES `products_manufactor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_product`
--

LOCK TABLES `products_product` WRITE;
/*!40000 ALTER TABLE `products_product` DISABLE KEYS */;
INSERT INTO `products_product` VALUES (1,'Sweets Cafe Mist Spray กลิ่น Strawberry Cream','Sweets Cafe Mist Spray by Sugarbunny Skincare น้ำหอมกลิ่นขนมสูตรปราศจากแอลกฮอลล์และสารกันเสีย อ่อนโยน ใช้ได้แม้ผิวแพ้ง่าย กลิ่นไม่ฉุน มาในกลิ่นหอมธีมขนมหวานน่ารักไม่ซ้ำใคร ขนาด10ml. บรรจุ 12 ขวด',1500,500,3200.00,1,'https://sv1.picz.in.th/images/2019/05/05/wgqbZb.jpg'),(2,'Sweets Cafe Mist Spray กลิ่น Peach Blossom','Sweets Cafe Mist Spray by Sugarbunny Skincare น้ำหอมกลิ่นขนมสูตรปราศจากแอลกฮอลล์และสารกันเสีย อ่อนโยน ใช้ได้แม้ผิวแพ้ง่าย กลิ่นไม่ฉุน มาในกลิ่นหอมธีมขนมหวานน่ารักไม่ซ้ำใคร ขนาด10ml. บรรจุ 12 ขวด',1500,500,3200.00,1,'https://sv1.picz.in.th/images/2019/05/05/wgqOdJ.jpg'),(3,'Sweets Cafe Mist Spray กลิ่น CocoMango','Sweets Cafe Mist Spray by Sugarbunny Skincare น้ำหอมกลิ่นขนมสูตรปราศจากแอลกฮอลล์และสารกันเสีย อ่อนโยน ใช้ได้แม้ผิวแพ้ง่าย กลิ่นไม่ฉุน มาในกลิ่นหอมธีมขนมหวานน่ารักไม่ซ้ำใคร ขนาด10ml. บรรจุ 12 ขวด',1500,100,3200.00,1,'https://sv1.picz.in.th/images/2019/05/05/wgqjsf.jpg'),(4,'Sweets Cafe Mist Spray กลิ่น Orange Caramel','Sweets Cafe Mist Spray by Sugarbunny Skincare น้ำหอมกลิ่นขนมสูตรปราศจากแอลกฮอลล์และสารกันเสีย อ่อนโยน ใช้ได้แม้ผิวแพ้ง่าย กลิ่นไม่ฉุน มาในกลิ่นหอมธีมขนมหวานน่ารักไม่ซ้ำใคร ขนาด10ml. บรรจุ 12 ขวด',1500,200,3200.00,1,'https://sv1.picz.in.th/images/2019/05/05/wgqlma.jpg'),(5,'Sweets Cafe Mist Spray กลิ่น Milk Candy','Sweets Cafe Mist Spray by Sugarbunny Skincare น้ำหอมกลิ่นขนมสูตรปราศจากแอลกฮอลล์และสารกันเสีย อ่อนโยน ใช้ได้แม้ผิวแพ้ง่าย กลิ่นไม่ฉุน มาในกลิ่นหอมธีมขนมหวานน่ารักไม่ซ้ำใคร ขนาด10ml. บรรจุ 12 ขวด',1500,300,3200.00,1,'https://sv1.picz.in.th/images/2019/05/05/wgqD9q.jpg'),(6,'Sweets Cafe Mist Spray กลิ่น Parfait Melon','Sweets Cafe Mist Spray by Sugarbunny Skincare น้ำหอมกลิ่นขนมสูตรปราศจากแอลกฮอลล์และสารกันเสีย อ่อนโยน ใช้ได้แม้ผิวแพ้ง่าย กลิ่นไม่ฉุน มาในกลิ่นหอมธีมขนมหวานน่ารักไม่ซ้ำใคร ขนาด10ml. บรรจุ 12 ขวด',1500,400,3200.00,1,'https://sv1.picz.in.th/images/2019/05/05/wgqAjz.jpg'),(7,'Sweets Cafe Mist Spray กลิ่น BlueBerry Cupcake','Sweets Cafe Mist Spray by Sugarbunny Skincare น้ำหอมกลิ่นขนมสูตรปราศจากแอลกฮอลล์และสารกันเสีย อ่อนโยน ใช้ได้แม้ผิวแพ้ง่าย กลิ่นไม่ฉุน มาในกลิ่นหอมธีมขนมหวานน่ารักไม่ซ้ำใคร ขนาด10ml. บรรจุ 12 ขวด',1500,0,3200.00,1,'https://sv1.picz.in.th/images/2019/05/05/wgqPp8.jpg'),(8,'เซรั่มสายไหม CandyFloss Serum','เซรั่มไฮยาลูรอนนำเข้าจากญี่ปุ่น เนื้ออ่อนโยนบางเบา เหมาะกับผิวแพ้ง่าย ทาได้ทั่วหน้าแม้แต่ใต้ตาหรือริมฝีปาก ช่วยเรื่องความชุ่มชื้น รูขุมขน ริ้วรอย รอยสิว <3 ใช้ขวดเดียวจบปึ๊งไม่ยุ่งยาก อยากให้ลองรับน้องไปโดนกันซักขวดจ้า >w< ขนาด10ml. บรรจุ 10 ขวด',1500,0,1800.00,4,'https://sv1.picz.in.th/images/2019/05/05/wgq2NR.jpg'),(9,'สเปรย์ย่านางชูก้าร์บันนี่','ช่วยลดสิวผดผื่นแพ้ อาการอักเสบบวมแดง ที่เกิดจากสิวหรือผิวแพ้เหงื่อ เติมความชุ่มชื้นให้ผิวฉ่ำน้ำ หน้าไม่มัน อ่อนโยนแม้สัมผัสกับดวงตาหรือเข้าปาก สกัดเย็นจากสมุนไพร100% ขนาด 100ml. บรรจุ 6 ขวด',1500,0,750.00,5,'https://sv1.picz.in.th/images/2019/05/05/wgqCU0.jpg'),(10,'สบู่น้ำมะลิสูตรเย็นสดชื่นผิว','ใช้แล้วเย็นผิว เติมความชุ่มชื้น ลดผิวอักเสบจากแดดเผา ลดสิวผด ผิวนุ่มเด้ง ใช้ได้ทั้งหน้าและตัวขนาด 35-40 กรัม บรรจุ 12 ก้อน',1500,50,800.00,2,'https://sv1.picz.in.th/images/2019/05/05/wgquru.jpg'),(11,'Mermaid Pink Contact Lens','คอนแทคเลนส์(รายปี)สีรุ้งรุ่นใหม่!คอนแทคเลนส์ผลิตในประเทศจีนจากร้านขายยาที่มีใบอนุญาตถูกต้อง Diameter : 14.00 mm. ค่าอมน้ำ : 38%  บรรจุ 12 คู่',1500,12,2500.00,3,'https://sv1.picz.in.th/images/2019/05/05/wgqycQ.jpg'),(12,'Rainbow Contact Lens','คอนแทคเลนส์(รายปี)สีรุ้งรุ่นใหม่!คอนแทคเลนส์ผลิตในประเทศจีนจากร้านขายยาที่มีใบอนุญาตถูกต้อง Diameter : 14.00 mm. ค่าอมน้ำ : 38%  บรรจุ 12 คู่',1500,19,2500.00,3,'https://sv1.picz.in.th/images/2019/05/05/wgqm0V.jpg');
/*!40000 ALTER TABLE `products_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_product_dealerstock`
--

DROP TABLE IF EXISTS `products_product_dealerstock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `products_product_dealerstock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `dealer_stock_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_product_dea_dealer_stock_id_470c543b_fk_products_` (`dealer_stock_id`),
  KEY `products_product_dea_product_id_0d49234e_fk_products_` (`product_id`),
  CONSTRAINT `products_product_dea_dealer_stock_id_470c543b_fk_products_` FOREIGN KEY (`dealer_stock_id`) REFERENCES `products_dealerstock` (`id`),
  CONSTRAINT `products_product_dea_product_id_0d49234e_fk_products_` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_product_dealerstock`
--

LOCK TABLES `products_product_dealerstock` WRITE;
/*!40000 ALTER TABLE `products_product_dealerstock` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_product_dealerstock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_productlot`
--

DROP TABLE IF EXISTS `products_productlot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `products_productlot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mfd` date NOT NULL,
  `exp_date` date NOT NULL,
  `quantity` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_productlot_product_id_7a081490_fk_products_product_id` (`product_id`),
  CONSTRAINT `products_productlot_product_id_7a081490_fk_products_product_id` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_productlot`
--

LOCK TABLES `products_productlot` WRITE;
/*!40000 ALTER TABLE `products_productlot` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_productlot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_shipment`
--

DROP TABLE IF EXISTS `products_shipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `products_shipment` (
  `track_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `receive_date` date NOT NULL,
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`track_number`),
  KEY `products_shipment_order_id_080729d5_fk_products_order_id` (`order_id`),
  CONSTRAINT `products_shipment_order_id_080729d5_fk_products_order_id` FOREIGN KEY (`order_id`) REFERENCES `products_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_shipment`
--

LOCK TABLES `products_shipment` WRITE;
/*!40000 ALTER TABLE `products_shipment` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_shipment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-05  5:28:12
