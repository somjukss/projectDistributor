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
  `name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$120000$TP4BWhLEcVPR$YHIPu/SyTXSdI8GbiTs9DqFSqeNicmC6uSIYZgAdBwg=','2019-05-05 16:19:43.922279',1,'admin','','','momo_niti@hotmail.com',1,1,'2019-05-04 23:35:41.000000'),(2,'pbkdf2_sha256$120000$gPillPwNQPpJ$ddtmLBDJoVU8cB9Zl4Cz26sJEDSDbmaIyk06W/8zXTc=','2019-05-05 16:20:02.028196',0,'customer1','นาย นิติ','จิรการวุฒิไกร','momo_niti@hotmail.com',0,1,'2019-05-05 10:04:05.682823'),(3,'pbkdf2_sha256$120000$jLRg7vb39FHa$aa0N9YhadrFSP0pzi+Kwukijs8JkdKHWWi3UCJ5J1pQ=','2019-05-05 10:13:58.051972',0,'customer2','นาย สุภวัช','กลิ่นขจร','60070106@kmitl.ac.th',0,1,'2019-05-05 10:04:43.707530'),(4,'pbkdf2_sha256$120000$IhtWT3gYYusN$ODNf4jB7GzZy1astWiqj0SgCf1J6F3n23eu4hT1kLSE=',NULL,0,'customer3','นางสาว กัลยรัตน์','อินตา','60070004@kmitl.ac.th',0,1,'2019-05-05 10:05:16.652286'),(5,'pbkdf2_sha256$120000$HwTy0FICs923$THCkP71kelU4rT0y4DCcgC+jbmCkj3J6T3FWpqHIkuA=',NULL,0,'customer4','นางสาว นันทาศิริ','ม่วงทอง','60070040@kmitl.ac.th',0,1,'2019-05-05 10:06:18.386744'),(6,'pbkdf2_sha256$120000$xgcyW7OM4SsF$dDq8Mh3+zdkAyKDXQcylw/V28xCM12qqsW3RCq4f+k4=',NULL,0,'customer5','นาย ธนากร','จิตใจดี','konde@hotmail.com',0,1,'2019-05-05 10:07:18.619240'),(7,'pbkdf2_sha256$120000$NqFVNjIDpDls$MLjJGuiEM8j3jwsM9V934bEBJVTu3UKHME8bCjeo99I=',NULL,0,'customer6','นาง รสดี','คนอร์','cupjoke@hotmail.com',0,1,'2019-05-05 10:08:31.693816'),(8,'pbkdf2_sha256$120000$iJAnVEDFJ9dC$cGvnVgCpYJV92Y+pTqyhconZTWCNGg3SZfDC8K+MrqU=',NULL,0,'customer7','นาย ธนาคาร','กสิกรไทย','bankbank@hotmail.com',0,1,'2019-05-05 10:09:49.715415'),(9,'pbkdf2_sha256$120000$yX6SCvEarktF$X4A/2lcefNvHKQIwv0zl2wRZ2uJ00exPsrfXZfgxBYw=',NULL,0,'customer8','นาง มยุรี','สวยมาก','mayuree@hotmail.com',0,1,'2019-05-05 10:10:39.978606'),(10,'pbkdf2_sha256$120000$mAKpuhRu9PWS$dxz5vK5yB+ktYV19CGR2tkbGVm1XgAesowp174SZlyk=',NULL,0,'customer9','นาย สมศักดิ์','ร่ำรวย','richy@hotmail.com',0,1,'2019-05-05 10:11:36.458687'),(11,'pbkdf2_sha256$120000$urFsXBSO0jqn$DckJHHGQtgYI1O8G96HD5WeVmT5IrjHvgblDGvBuPPM=',NULL,0,'customer10','นาย อภิชาติ','ชัยณรงฤทธิ์','apichart@hotmail.com',0,1,'2019-05-05 10:12:39.979035');
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,2,1),(11,2,2),(2,3,1),(3,4,1),(4,5,1),(5,6,1),(6,7,1),(7,8,1),(8,9,1),(9,10,1),(10,11,1);
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
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-05-04 23:37:01.283610','1','admin',2,'[{\"added\": {\"name\": \"admin\", \"object\": \"admin\"}}]',4,1),(2,'2019-05-04 23:37:21.354847','1','customer',1,'[{\"added\": {}}]',3,1),(3,'2019-05-04 23:37:32.338527','2','blacklist',1,'[{\"added\": {}}]',3,1),(4,'2019-05-05 10:18:13.748713','10','customer2 : 2019-05-05',2,'[{\"changed\": {\"fields\": [\"cancel\", \"cancel_date\", \"reason\"]}}, {\"changed\": {\"name\": \"shipment\", \"object\": \"Kerry Express Thailand\", \"fields\": [\"status\"]}}]',13,1),(5,'2019-05-05 10:18:19.802633','8','customer2 : 2019-05-05',2,'[{\"changed\": {\"name\": \"shipment\", \"object\": \"Kerry Express Thailand\", \"fields\": [\"status\"]}}]',13,1),(6,'2019-05-05 10:18:33.658377','10','FeedBack object (10)',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',11,1),(7,'2019-05-05 10:18:36.978052','9','FeedBack object (9)',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',11,1),(8,'2019-05-05 10:18:41.218279','1','FeedBack object (1)',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',11,1),(9,'2019-05-05 10:18:45.080572','2','FeedBack object (2)',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',11,1),(10,'2019-05-05 10:18:49.906071','7','FeedBack object (7)',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',11,1),(11,'2019-05-05 10:19:28.788441','2','customer1  :นาย นิติ จิรการวุฒิไกร',2,'[{\"added\": {\"name\": \"admin_ customer\", \"object\": \"Admin_Customer object (1)\"}}]',19,1),(12,'2019-05-05 10:19:36.212095','11','customer10  :นาย อภิชาติ ชัยณรงฤทธิ์',2,'[{\"added\": {\"name\": \"admin_ customer\", \"object\": \"Admin_Customer object (2)\"}}]',19,1),(13,'2019-05-05 10:19:46.064251','2','customer1  :นาย นิติ จิรการวุฒิไกร',2,'[{\"added\": {\"name\": \"admin_ customer\", \"object\": \"Admin_Customer object (3)\"}}]',19,1),(14,'2019-05-05 10:20:06.506410','2','customer1  :นาย นิติ จิรการวุฒิไกร',2,'[{\"changed\": {\"fields\": [\"blacklist\"]}}, {\"added\": {\"name\": \"admin_ customer\", \"object\": \"Admin_Customer object (4)\"}}]',19,1),(15,'2019-05-05 10:20:12.772281','5','customer4  :นางสาว นันทาศิริ ม่วงทอง',2,'[{\"changed\": {\"fields\": [\"discount\"]}}]',19,1),(16,'2019-05-05 10:20:21.639943','3','customer2  :นาย สุภวัช กลิ่นขจร',2,'[{\"changed\": {\"fields\": [\"discount\"]}}]',19,1),(17,'2019-05-05 10:28:05.409954','1','Sweets Cafe Mist Spray กลิ่น Strawberry Cream',2,'[{\"added\": {\"name\": \"product lot\", \"object\": \"ProductLot object (1)\"}}]',15,1),(18,'2019-05-05 10:28:15.682452','9','สเปรย์ย่านางชูก้าร์บันนี่',2,'[{\"added\": {\"name\": \"product lot\", \"object\": \"ProductLot object (2)\"}}]',15,1),(19,'2019-05-05 10:28:24.352364','12','Rainbow Contact Lens',2,'[{\"added\": {\"name\": \"product lot\", \"object\": \"ProductLot object (3)\"}}]',15,1),(20,'2019-05-05 10:28:35.830045','1','Sweets Cafe Mist Spray กลิ่น Strawberry Cream',2,'[{\"added\": {\"name\": \"product lot\", \"object\": \"ProductLot object (4)\"}}]',15,1),(21,'2019-05-05 10:28:42.175139','2','Sweets Cafe Mist Spray กลิ่น Peach Blossom',2,'[{\"added\": {\"name\": \"product lot\", \"object\": \"ProductLot object (5)\"}}]',15,1),(22,'2019-05-05 10:28:50.280718','4','Sweets Cafe Mist Spray กลิ่น Orange Caramel',2,'[{\"added\": {\"name\": \"product lot\", \"object\": \"ProductLot object (6)\"}}]',15,1),(23,'2019-05-05 10:29:01.229152','9','สเปรย์ย่านางชูก้าร์บันนี่',2,'[{\"added\": {\"name\": \"product lot\", \"object\": \"ProductLot object (7)\"}}]',15,1),(24,'2019-05-05 10:29:10.033424','7','Sweets Cafe Mist Spray กลิ่น BlueBerry Cupcake',2,'[{\"added\": {\"name\": \"product lot\", \"object\": \"ProductLot object (8)\"}}]',15,1),(25,'2019-05-05 10:29:23.496090','11','Mermaid Pink Contact Lens',2,'[{\"added\": {\"name\": \"product lot\", \"object\": \"ProductLot object (9)\"}}]',15,1),(26,'2019-05-05 10:29:32.272085','10','สบู่น้ำมะลิสูตรเย็นสดชื่นผิว',2,'[{\"added\": {\"name\": \"product lot\", \"object\": \"ProductLot object (10)\"}}]',15,1),(27,'2019-05-05 10:29:46.525196','10','สบู่น้ำมะลิสูตรเย็นสดชื่นผิว',2,'[{\"added\": {\"name\": \"product lot\", \"object\": \"ProductLot object (11)\"}}]',15,1);
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
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-05-04 23:34:14.069282'),(2,'auth','0001_initial','2019-05-04 23:34:18.094186'),(3,'admin','0001_initial','2019-05-04 23:34:19.221391'),(4,'admin','0002_logentry_remove_auto_add','2019-05-04 23:34:19.258581'),(5,'admin','0003_logentry_add_action_flag_choices','2019-05-04 23:34:19.283377'),(6,'contenttypes','0002_remove_content_type_name','2019-05-04 23:34:19.887980'),(7,'auth','0002_alter_permission_name_max_length','2019-05-04 23:34:20.195973'),(8,'auth','0003_alter_user_email_max_length','2019-05-04 23:34:20.278073'),(9,'auth','0004_alter_user_username_opts','2019-05-04 23:34:20.304843'),(10,'auth','0005_alter_user_last_login_null','2019-05-04 23:34:20.660178'),(11,'auth','0006_require_contenttypes_0002','2019-05-04 23:34:20.676518'),(12,'auth','0007_alter_validators_add_error_messages','2019-05-04 23:34:20.714738'),(13,'auth','0008_alter_user_username_max_length','2019-05-04 23:34:21.221653'),(14,'auth','0009_alter_user_last_name_max_length','2019-05-04 23:34:21.590739'),(15,'products','0001_initial','2019-05-04 23:34:31.765729'),(16,'sessions','0001_initial','2019-05-04 23:34:32.149078');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_session` (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `django_session` VALUES ('ht3ohfuneb7ma0fh4hk9wj588x3ly3i1','YjU1OGY5ZTljOWMxNjFhYWZkNDQwYjAwYTY5ZjA1ZjAwZDRkMGUwYTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZTU3ZGQ5Mjc1NGQzNDVlOTBiZTVjNTJkMGU0OTIwMGJlZmNkMDBjIn0=','2019-05-19 16:20:02.090384'),('l3y4wcy7cyk5hb50r4yz3xxk1g0ull39','YjcyMmEwMzkyYzE0ZjNmNGRiMzQ5MDgyOGY5ZjJhMTg3NTE2MzM1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlZjdiYzNiNmMxMjllYmRiOGRlMWYwYjlhZDA2NzRhYWU1ZDZhYzczIn0=','2019-05-18 23:36:51.658963'),('s4dh1tuluzc0j0f4vjof25l6ovi5re3r','YjcyMmEwMzkyYzE0ZjNmNGRiMzQ5MDgyOGY5ZjJhMTg3NTE2MzM1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlZjdiYzNiNmMxMjllYmRiOGRlMWYwYjlhZDA2NzRhYWU1ZDZhYzczIn0=','2019-05-19 10:05:38.450487');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_admin`
--

DROP TABLE IF EXISTS `products_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `products_admin` (
  `phone` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `products_admin` VALUES ('0617689874',1);
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
  `result` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `evidence` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_admin_custo_admin_id_0b1b1199_fk_products_` (`admin_id`),
  KEY `products_admin_custo_customer_id_f9962291_fk_products_` (`customer_id`),
  CONSTRAINT `products_admin_custo_admin_id_0b1b1199_fk_products_` FOREIGN KEY (`admin_id`) REFERENCES `products_admin` (`user_id`),
  CONSTRAINT `products_admin_custo_customer_id_f9962291_fk_products_` FOREIGN KEY (`customer_id`) REFERENCES `products_customer` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_admin_customer`
--

LOCK TABLES `products_admin_customer` WRITE;
/*!40000 ALTER TABLE `products_admin_customer` DISABLE KEYS */;
INSERT INTO `products_admin_customer` VALUES (1,'check','2019-05-05','ได้รับการแจ้งว่าลูกค้าขายสินค้าเกินกว่าราคาที่กำหนด ตักเตือนครั้งที่ 1',1,2),(2,'check','2019-05-05','ได้รับการแจ้งว่าลูกค้าขายสินค้าเกินกว่าราคาที่กำหนด ตักเตือนครั้งที่ 1',1,11),(3,'check','2019-05-05','ได้รับการแจ้งว่าลูกค้าขายสินค้าเกินกว่าราคาที่กำหนด ตักเตือนครั้งที่ 2',1,2),(4,'check','2019-05-05','ได้รับการแจ้งว่าลูกค้าขายสินค้าเกินกว่าราคาที่กำหนด ทำการ blacklist',1,2);
/*!40000 ALTER TABLE `products_admin_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_customer`
--

DROP TABLE IF EXISTS `products_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `products_customer` (
  `address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `products_customer` VALUES ('29แยก 2 อ่อนนุช 57 เขต/แขวง ประเวศ กรุงเทพ 10250','0617689874',1,2),('อ่อนนุช 65','0954870571',0,3),('รามคำแหง 187','0827774930',0,4),('กิ่งแก้ว 22','0830048686',0,5),('อุดมสุข50','0617788456',0,6),('สุขุมวิท 108','0636664567',0,7),('จังหวัดสมุทรปราการ','0818412454',0,8),('อ่อนนุช 69','0854802020',0,9),('จังหวัดเชียงใหม่','0848441234',0,10),('รามคำแหง 14','0858236461',0,11);
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
INSERT INTO `products_dealer` VALUES (2,0.00,37000.00),(3,0.07,29600.00),(4,0.00,0.00),(5,0.02,0.00),(6,0.00,0.00),(7,0.00,0.00),(8,0.00,0.00),(9,0.00,0.00),(10,0.00,0.00),(11,0.00,0.00);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_dealerstock`
--

LOCK TABLES `products_dealerstock` WRITE;
/*!40000 ALTER TABLE `products_dealerstock` DISABLE KEYS */;
INSERT INTO `products_dealerstock` VALUES (1,2),(2,3),(3,4),(4,5),(5,6),(6,7),(7,8),(8,9),(9,10),(10,11);
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
  `status` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_feedback_admin_id_b5747881_fk_products_admin_user_id` (`admin_id`),
  KEY `products_feedback_customer_id_6d8ab2d2_fk_products_` (`customer_id`),
  CONSTRAINT `products_feedback_admin_id_b5747881_fk_products_admin_user_id` FOREIGN KEY (`admin_id`) REFERENCES `products_admin` (`user_id`),
  CONSTRAINT `products_feedback_customer_id_6d8ab2d2_fk_products_` FOREIGN KEY (`customer_id`) REFERENCES `products_customer` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_feedback`
--

LOCK TABLES `products_feedback` WRITE;
/*!40000 ALTER TABLE `products_feedback` DISABLE KEYS */;
INSERT INTO `products_feedback` VALUES (1,'read','สินค้าดีมากครับ',1,3),(2,'read','ช่วยแก้ไขคุณภาพสินค้าด้วยครับ',1,3),(3,'unread','ถ้าจัดส่งสินค้าได้ไวกว่านี้จะดีมากเลยครับ',NULL,3),(4,'unread','จัดโปรโมชั่นด้วยจะดีกว่านี้ครับ',NULL,3),(5,'unread','เว็บสวยมากครับ',NULL,2),(6,'unread','ระบบหลังบ้านไม่มีข้อผิดพลาดเลย',NULL,2),(7,'read','อยากให้มีสินค้าหลากหลายกว่านี้ครับ',1,2),(8,'unread','รบกวนช่วยส่งสินค้าไวกว่านี้',NULL,2),(9,'read','คุณภาพของสินค้าดีมาก',1,2),(10,'read','จัดโปรโมชั่นด้วยจะดีมาก',1,2);
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
  `detail` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_price1` decimal(8,2) NOT NULL,
  `total_price2` decimal(8,2) NOT NULL,
  `cancel` tinyint(1) NOT NULL,
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cancel_date` date DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_order_admin_id_c60894a1_fk_products_admin_user_id` (`admin_id`),
  KEY `products_order_customer_id_6cb09035_fk_products_customer_user_id` (`customer_id`),
  CONSTRAINT `products_order_admin_id_c60894a1_fk_products_admin_user_id` FOREIGN KEY (`admin_id`) REFERENCES `products_admin` (`user_id`),
  CONSTRAINT `products_order_customer_id_6cb09035_fk_products_customer_user_id` FOREIGN KEY (`customer_id`) REFERENCES `products_customer` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_order`
--

LOCK TABLES `products_order` WRITE;
/*!40000 ALTER TABLE `products_order` DISABLE KEYS */;
INSERT INTO `products_order` VALUES (1,'2019-05-05','29แยก 2 อ่อนนุช 57 เขต/แขวง ประเวศ กรุงเทพ 10250',3200.00,3200.00,0,NULL,NULL,NULL,2),(2,'2019-05-05','29แยก 2 อ่อนนุช 57 เขต/แขวง ประเวศ กรุงเทพ 10250',6400.00,6400.00,0,NULL,NULL,NULL,2),(3,'2019-05-05','29แยก 2 อ่อนนุช 57 เขต/แขวง ประเวศ กรุงเทพ 10250',12800.00,12800.00,0,NULL,NULL,NULL,2),(4,'2019-05-05','29แยก 2 อ่อนนุช 57 เขต/แขวง ประเวศ กรุงเทพ 10250',8200.00,8200.00,0,NULL,NULL,NULL,2),(5,'2019-05-05','อ่อนนุช 65',3200.00,3200.00,0,NULL,NULL,NULL,3),(6,'2019-05-05','อ่อนนุช 65',9600.00,9600.00,0,NULL,NULL,NULL,3),(7,'2019-05-05','อ่อนนุช 65',12800.00,12800.00,0,NULL,NULL,NULL,3),(8,'2019-05-05','อ่อนนุช 65',800.00,800.00,0,NULL,NULL,NULL,3),(9,'2019-05-05','อ่อนนุช 65',3200.00,3200.00,0,NULL,NULL,NULL,3),(10,'2019-05-05','อ่อนนุช 65',3200.00,3200.00,1,'สินค้าเกิดปัญหาชั่วคราว','2019-05-05',1,3),(11,'2019-05-05','29แยก 2 อ่อนนุช 57 เขต/แขวง ประเวศ กรุงเทพ 10250',6400.00,6400.00,0,NULL,NULL,NULL,2);
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
  `detail` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_orderdetail`
--

LOCK TABLES `products_orderdetail` WRITE;
/*!40000 ALTER TABLE `products_orderdetail` DISABLE KEYS */;
INSERT INTO `products_orderdetail` VALUES (1,'Sweets Cafe Mist Spray กลิ่น Strawberry Cream',3200.00,1,3200.00,1,1),(2,'Sweets Cafe Mist Spray กลิ่น Peach Blossom',3200.00,1,3200.00,2,2),(3,'Sweets Cafe Mist Spray กลิ่น CocoMango',3200.00,1,3200.00,2,3),(4,'Sweets Cafe Mist Spray กลิ่น Strawberry Cream',3200.00,4,12800.00,3,1),(5,'Sweets Cafe Mist Spray กลิ่น Parfait Melon',3200.00,1,3200.00,4,6),(6,'Rainbow Contact Lens',2500.00,2,5000.00,4,12),(7,'Sweets Cafe Mist Spray กลิ่น CocoMango',3200.00,1,3200.00,5,3),(8,'Sweets Cafe Mist Spray กลิ่น Peach Blossom',3200.00,1,3200.00,6,2),(9,'Sweets Cafe Mist Spray กลิ่น Milk Candy',3200.00,1,3200.00,6,5),(10,'Sweets Cafe Mist Spray กลิ่น Parfait Melon',3200.00,1,3200.00,6,6),(11,'Sweets Cafe Mist Spray กลิ่น Orange Caramel',3200.00,4,12800.00,7,4),(12,'สบู่น้ำมะลิสูตรเย็นสดชื่นผิว',800.00,1,800.00,8,10),(13,'Sweets Cafe Mist Spray กลิ่น CocoMango',3200.00,1,3200.00,9,3),(14,'Sweets Cafe Mist Spray กลิ่น Strawberry Cream',3200.00,1,3200.00,10,1),(15,'Sweets Cafe Mist Spray กลิ่น Peach Blossom',3200.00,2,6400.00,11,2);
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
  `img_url` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `products_product` VALUES (1,'Sweets Cafe Mist Spray กลิ่น Strawberry Cream','Sweets Cafe Mist Spray by Sugarbunny Skincare น้ำหอมกลิ่นขนมสูตรปราศจากแอลกฮอลล์และสารกันเสีย อ่อนโยน ใช้ได้แม้ผิวแพ้ง่าย กลิ่นไม่ฉุน มาในกลิ่นหอมธีมขนมหวานน่ารักไม่ซ้ำใคร ขนาด10ml. บรรจุ 12 ขวด',1500,532,3200.00,1,'https://sv1.picz.in.th/images/2019/05/05/wgqbZb.jpg'),(2,'Sweets Cafe Mist Spray กลิ่น Peach Blossom','Sweets Cafe Mist Spray by Sugarbunny Skincare น้ำหอมกลิ่นขนมสูตรปราศจากแอลกฮอลล์และสารกันเสีย อ่อนโยน ใช้ได้แม้ผิวแพ้ง่าย กลิ่นไม่ฉุน มาในกลิ่นหอมธีมขนมหวานน่ารักไม่ซ้ำใคร ขนาด10ml. บรรจุ 12 ขวด',1500,536,3200.00,1,'https://sv1.picz.in.th/images/2019/05/05/wgqOdJ.jpg'),(3,'Sweets Cafe Mist Spray กลิ่น CocoMango','Sweets Cafe Mist Spray by Sugarbunny Skincare น้ำหอมกลิ่นขนมสูตรปราศจากแอลกฮอลล์และสารกันเสีย อ่อนโยน ใช้ได้แม้ผิวแพ้ง่าย กลิ่นไม่ฉุน มาในกลิ่นหอมธีมขนมหวานน่ารักไม่ซ้ำใคร ขนาด10ml. บรรจุ 12 ขวด',1500,97,3200.00,1,'https://sv1.picz.in.th/images/2019/05/05/wgqjsf.jpg'),(4,'Sweets Cafe Mist Spray กลิ่น Orange Caramel','Sweets Cafe Mist Spray by Sugarbunny Skincare น้ำหอมกลิ่นขนมสูตรปราศจากแอลกฮอลล์และสารกันเสีย อ่อนโยน ใช้ได้แม้ผิวแพ้ง่าย กลิ่นไม่ฉุน มาในกลิ่นหอมธีมขนมหวานน่ารักไม่ซ้ำใคร ขนาด10ml. บรรจุ 12 ขวด',1500,246,3200.00,1,'https://sv1.picz.in.th/images/2019/05/05/wgqlma.jpg'),(5,'Sweets Cafe Mist Spray กลิ่น Milk Candy','Sweets Cafe Mist Spray by Sugarbunny Skincare น้ำหอมกลิ่นขนมสูตรปราศจากแอลกฮอลล์และสารกันเสีย อ่อนโยน ใช้ได้แม้ผิวแพ้ง่าย กลิ่นไม่ฉุน มาในกลิ่นหอมธีมขนมหวานน่ารักไม่ซ้ำใคร ขนาด10ml. บรรจุ 12 ขวด',1500,299,3200.00,1,'https://sv1.picz.in.th/images/2019/05/05/wgqD9q.jpg'),(6,'Sweets Cafe Mist Spray กลิ่น Parfait Melon','Sweets Cafe Mist Spray by Sugarbunny Skincare น้ำหอมกลิ่นขนมสูตรปราศจากแอลกฮอลล์และสารกันเสีย อ่อนโยน ใช้ได้แม้ผิวแพ้ง่าย กลิ่นไม่ฉุน มาในกลิ่นหอมธีมขนมหวานน่ารักไม่ซ้ำใคร ขนาด10ml. บรรจุ 12 ขวด',1500,398,3200.00,1,'https://sv1.picz.in.th/images/2019/05/05/wgqAjz.jpg'),(7,'Sweets Cafe Mist Spray กลิ่น BlueBerry Cupcake','Sweets Cafe Mist Spray by Sugarbunny Skincare น้ำหอมกลิ่นขนมสูตรปราศจากแอลกฮอลล์และสารกันเสีย อ่อนโยน ใช้ได้แม้ผิวแพ้ง่าย กลิ่นไม่ฉุน มาในกลิ่นหอมธีมขนมหวานน่ารักไม่ซ้ำใคร ขนาด10ml. บรรจุ 12 ขวด',1500,50,3200.00,1,'https://sv1.picz.in.th/images/2019/05/05/wgqPp8.jpg'),(8,'เซรั่มสายไหม CandyFloss Serum','เซรั่มไฮยาลูรอนนำเข้าจากญี่ปุ่น เนื้ออ่อนโยนบางเบา เหมาะกับผิวแพ้ง่าย ทาได้ทั่วหน้าแม้แต่ใต้ตาหรือริมฝีปาก ช่วยเรื่องความชุ่มชื้น รูขุมขน ริ้วรอย รอยสิว <3 ใช้ขวดเดียวจบปึ๊งไม่ยุ่งยาก อยากให้ลองรับน้องไปโดนกันซักขวดจ้า >w< ขนาด10ml. บรรจุ 10 ขวด',1500,0,1800.00,4,'https://sv1.picz.in.th/images/2019/05/05/wgq2NR.jpg'),(9,'สเปรย์ย่านางชูก้าร์บันนี่','ช่วยลดสิวผดผื่นแพ้ อาการอักเสบบวมแดง ที่เกิดจากสิวหรือผิวแพ้เหงื่อ เติมความชุ่มชื้นให้ผิวฉ่ำน้ำ หน้าไม่มัน อ่อนโยนแม้สัมผัสกับดวงตาหรือเข้าปาก สกัดเย็นจากสมุนไพร100% ขนาด 100ml. บรรจุ 6 ขวด',1500,100,750.00,5,'https://sv1.picz.in.th/images/2019/05/05/wgqCU0.jpg'),(10,'สบู่น้ำมะลิสูตรเย็นสดชื่นผิว','ใช้แล้วเย็นผิว เติมความชุ่มชื้น ลดผิวอักเสบจากแดดเผา ลดสิวผด ผิวนุ่มเด้ง ใช้ได้ทั้งหน้าและตัวขนาด 35-40 กรัม บรรจุ 12 ก้อน',1500,169,800.00,2,'https://sv1.picz.in.th/images/2019/05/05/wgquru.jpg'),(11,'Mermaid Pink Contact Lens','คอนแทคเลนส์(รายปี)สีรุ้งรุ่นใหม่!คอนแทคเลนส์ผลิตในประเทศจีนจากร้านขายยาที่มีใบอนุญาตถูกต้อง Diameter : 14.00 mm. ค่าอมน้ำ : 38%  บรรจุ 12 คู่',1500,62,2500.00,3,'https://sv1.picz.in.th/images/2019/05/05/wgqycQ.jpg'),(12,'Rainbow Contact Lens','คอนแทคเลนส์(รายปี)สีรุ้งรุ่นใหม่!คอนแทคเลนส์ผลิตในประเทศจีนจากร้านขายยาที่มีใบอนุญาตถูกต้อง Diameter : 14.00 mm. ค่าอมน้ำ : 38%  บรรจุ 12 คู่',1500,27,2500.00,3,'https://sv1.picz.in.th/images/2019/05/05/wgqm0V.jpg');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_product_dealerstock`
--

LOCK TABLES `products_product_dealerstock` WRITE;
/*!40000 ALTER TABLE `products_product_dealerstock` DISABLE KEYS */;
INSERT INTO `products_product_dealerstock` VALUES (1,5,1,1),(2,3,1,2),(3,1,1,3),(4,1,1,6),(5,2,1,12),(6,2,2,3),(7,1,2,2),(8,1,2,5),(9,1,2,6),(10,4,2,4),(11,1,2,10),(12,0,2,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_productlot`
--

LOCK TABLES `products_productlot` WRITE;
/*!40000 ALTER TABLE `products_productlot` DISABLE KEYS */;
INSERT INTO `products_productlot` VALUES (1,'2019-05-05','2020-05-05',10,1),(2,'2019-05-05','2020-05-05',10,9),(3,'2019-05-05','2020-05-05',10,12),(4,'2019-05-05','2020-05-05',28,1),(5,'2019-05-05','2020-05-05',40,2),(6,'2019-05-05','2020-05-05',50,4),(7,'2019-05-05','2020-05-04',90,9),(8,'2019-05-05','2020-05-05',50,7),(9,'2019-05-05','2020-05-05',50,11),(10,'2019-05-05','2020-05-05',20,10),(11,'2019-05-05','2021-05-05',100,10);
/*!40000 ALTER TABLE `products_productlot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_shipment`
--

DROP TABLE IF EXISTS `products_shipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `products_shipment` (
  `track_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `receive_date` date NOT NULL,
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `products_shipment` VALUES ('crcjeajhovellhvxidjm','Thailand Post','2019-05-05','Waiting',9),('duotgpvwwsolfbqhahrr','Kerry Express Thailand','2019-05-05','Arrivedatdestinationstation',8),('fmozfysepxwawmkauesi','Kerry Express Thailand','2019-05-05','Waiting',7),('hmgmcyjabvxxuqqgvsxp','Kerry Express Thailand','2019-05-05','Waiting',2),('izborbwgfonoqubsnihz','Kerry Express Thailand','2019-05-05','ArrivedatHub',10),('jfqjyzcacnfmitgozbzl','Kerry Express Thailand','2019-05-05','Waiting',5),('kjulqemdpcltilmxzfno','Kerry Express Thailand','2019-05-05','Waiting',1),('luuqatmatkrotgqyiovn','Kerry Express Thailand','2019-05-05','Waiting',4),('mlqzhhzsokpyfhoadtdj','Kerry Express Thailand','2019-05-05','Waiting',3),('rlbtjctvqirvrycwydnm','Kerry Express Thailand','2019-05-05','Waiting',11),('tgeljfniutfalfepkkym','Kerry Express Thailand','2019-05-05','Waiting',6);
/*!40000 ALTER TABLE `products_shipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'project'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-05 23:23:15
