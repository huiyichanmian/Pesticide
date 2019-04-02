-- MySQL dump 10.13  Distrib 5.7.24, for Win64 (x86_64)
--
-- Host: localhost    Database: pesticide
-- ------------------------------------------------------
-- Server version	5.7.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `receiver` varchar(20) NOT NULL,
  `addr` varchar(256) NOT NULL,
  `zip_code` varchar(6) DEFAULT NULL,
  `phone` varchar(11) NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `address_user_id_c030de7d_fk_user_id` (`user_id`),
  CONSTRAINT `address_user_id_c030de7d_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'2019-03-27 03:17:59.663687','2019-03-27 03:17:59.663687',0,'梅刚','陕西省西安市','','15829060275',1,16),(2,'2019-03-29 07:35:09.527151','2019-03-29 07:35:09.527151',0,'梅刚','陕西西安','','15929060275',1,15),(3,'2019-03-29 07:35:50.115242','2019-03-29 07:35:50.115242',0,'梅刚','南京山阴路','','15929060275',0,15),(4,'2019-03-30 02:44:01.139896','2019-03-30 02:44:01.139896',0,'张林炎','陕西省榆林市','725001','18791457632',0,16);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add 用户',6,'add_user'),(17,'Can change 用户',6,'change_user'),(18,'Can delete 用户',6,'delete_user'),(19,'Can add 地址',7,'add_address'),(20,'Can change 地址',7,'change_address'),(21,'Can delete 地址',7,'delete_address'),(22,'Can add 商品SPU',8,'add_goods'),(23,'Can change 商品SPU',8,'change_goods'),(24,'Can delete 商品SPU',8,'delete_goods'),(25,'Can add 商品图片',9,'add_goodsimage'),(26,'Can change 商品图片',9,'change_goodsimage'),(27,'Can delete 商品图片',9,'delete_goodsimage'),(28,'Can add 商品',10,'add_goodssku'),(29,'Can change 商品',10,'change_goodssku'),(30,'Can delete 商品',10,'delete_goodssku'),(31,'Can add 商品种类',11,'add_goodstype'),(32,'Can change 商品种类',11,'change_goodstype'),(33,'Can delete 商品种类',11,'delete_goodstype'),(34,'Can add 首页轮播商品',12,'add_indexgoodsbanner'),(35,'Can change 首页轮播商品',12,'change_indexgoodsbanner'),(36,'Can delete 首页轮播商品',12,'delete_indexgoodsbanner'),(37,'Can add 主页促销活动',13,'add_indexpromotionbanner'),(38,'Can change 主页促销活动',13,'change_indexpromotionbanner'),(39,'Can delete 主页促销活动',13,'delete_indexpromotionbanner'),(40,'Can add 主页分类展示商品',14,'add_indextypegoodsbanner'),(41,'Can change 主页分类展示商品',14,'change_indextypegoodsbanner'),(42,'Can delete 主页分类展示商品',14,'delete_indextypegoodsbanner'),(43,'Can add 订单商品',15,'add_ordergoods'),(44,'Can change 订单商品',15,'change_ordergoods'),(45,'Can delete 订单商品',15,'delete_ordergoods'),(46,'Can add 订单',16,'add_orderinfo'),(47,'Can change 订单',16,'change_orderinfo'),(48,'Can delete 订单',16,'delete_orderinfo');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=430 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (7,'2019-03-26 05:06:55.835308','1','除草剂',1,'[{\"added\": {}}]',11,16),(8,'2019-03-26 05:07:39.521355','2','杀虫剂',1,'[{\"added\": {}}]',11,16),(9,'2019-03-26 05:08:03.262771','3','杀菌剂',1,'[{\"added\": {}}]',11,16),(10,'2019-03-26 05:08:39.475532','4','杀螨剂',1,'[{\"added\": {}}]',11,16),(11,'2019-03-26 05:09:06.004500','5','调节剂',1,'[{\"added\": {}}]',11,16),(12,'2019-03-26 05:09:22.757857','6','叶面肥',1,'[{\"added\": {}}]',11,16),(13,'2019-03-26 05:59:04.029117','1','Goods object (1)',1,'[{\"added\": {}}]',8,16),(14,'2019-03-26 06:02:29.703900','2','Goods object (2)',1,'[{\"added\": {}}]',8,16),(15,'2019-03-26 06:12:38.260242','3','Goods object (3)',1,'[{\"added\": {}}]',8,16),(16,'2019-03-26 06:13:20.691463','4','Goods object (4)',1,'[{\"added\": {}}]',8,16),(17,'2019-03-26 06:14:00.010222','5','Goods object (5)',1,'[{\"added\": {}}]',8,16),(18,'2019-03-26 06:14:58.740014','6','Goods object (6)',1,'[{\"added\": {}}]',8,16),(19,'2019-03-26 06:20:36.244276','1','GoodsSKU object (1)',1,'[{\"added\": {}}]',10,16),(20,'2019-03-26 06:22:15.257367','2','GoodsSKU object (2)',1,'[{\"added\": {}}]',10,16),(21,'2019-03-26 06:24:03.156914','3','GoodsSKU object (3)',1,'[{\"added\": {}}]',10,16),(22,'2019-03-26 06:27:16.946164','4','GoodsSKU object (4)',1,'[{\"added\": {}}]',10,16),(23,'2019-03-26 06:30:41.188745','5','GoodsSKU object (5)',1,'[{\"added\": {}}]',10,16),(24,'2019-03-26 06:32:52.108896','1','IndexTypeGoodsBanner object (1)',1,'[{\"added\": {}}]',14,16),(25,'2019-03-26 06:33:04.035569','2','IndexTypeGoodsBanner object (2)',1,'[{\"added\": {}}]',14,16),(26,'2019-03-26 06:33:12.133329','3','IndexTypeGoodsBanner object (3)',1,'[{\"added\": {}}]',14,16),(27,'2019-03-26 06:33:20.474477','4','IndexTypeGoodsBanner object (4)',1,'[{\"added\": {}}]',14,16),(28,'2019-03-26 06:33:27.039638','5','IndexTypeGoodsBanner object (5)',1,'[{\"added\": {}}]',14,16),(29,'2019-03-26 06:33:33.620331','6','IndexTypeGoodsBanner object (6)',1,'[{\"added\": {}}]',14,16),(30,'2019-03-26 06:35:20.547003','7','IndexTypeGoodsBanner object (7)',1,'[{\"added\": {}}]',14,16),(31,'2019-03-26 06:36:23.928275','1','Goods object (1)',2,'[]',8,16),(32,'2019-03-26 06:36:39.294384','7','Goods object (7)',1,'[{\"added\": {}}]',8,16),(33,'2019-03-26 06:36:47.497548','8','Goods object (8)',1,'[{\"added\": {}}]',8,16),(34,'2019-03-26 06:37:04.291641','9','Goods object (9)',1,'[{\"added\": {}}]',8,16),(35,'2019-03-26 06:37:11.504620','10','Goods object (10)',1,'[{\"added\": {}}]',8,16),(36,'2019-03-26 06:37:22.495858','11','Goods object (11)',1,'[{\"added\": {}}]',8,16),(37,'2019-03-26 06:37:53.879756','1','GoodsSKU object (1)',2,'[]',10,16),(38,'2019-03-26 06:38:30.438096','2','GoodsSKU object (2)',2,'[{\"changed\": {\"fields\": [\"goods\"]}}]',10,16),(39,'2019-03-26 06:38:39.135762','3','GoodsSKU object (3)',2,'[{\"changed\": {\"fields\": [\"goods\"]}}]',10,16),(40,'2019-03-26 06:38:53.670592','4','GoodsSKU object (4)',2,'[{\"changed\": {\"fields\": [\"goods\"]}}]',10,16),(41,'2019-03-26 06:39:08.486570','5','GoodsSKU object (5)',2,'[{\"changed\": {\"fields\": [\"goods\"]}}]',10,16),(42,'2019-03-26 06:41:23.281884','6','IndexTypeGoodsBanner object (6)',2,'[{\"changed\": {\"fields\": [\"sku\"]}}]',14,16),(43,'2019-03-26 06:41:33.003016','5','IndexTypeGoodsBanner object (5)',2,'[{\"changed\": {\"fields\": [\"sku\"]}}]',14,16),(44,'2019-03-26 06:41:39.560590','4','IndexTypeGoodsBanner object (4)',2,'[{\"changed\": {\"fields\": [\"sku\"]}}]',14,16),(45,'2019-03-26 06:41:45.178275','3','IndexTypeGoodsBanner object (3)',2,'[{\"changed\": {\"fields\": [\"sku\"]}}]',14,16),(46,'2019-03-26 06:42:53.991544','2','IndexTypeGoodsBanner object (2)',3,'',14,16),(47,'2019-03-26 06:43:05.279094','7','IndexTypeGoodsBanner object (7)',3,'',14,16),(48,'2019-03-26 06:43:05.413753','6','IndexTypeGoodsBanner object (6)',3,'',14,16),(49,'2019-03-26 06:43:05.506484','5','IndexTypeGoodsBanner object (5)',3,'',14,16),(50,'2019-03-26 06:43:05.606864','4','IndexTypeGoodsBanner object (4)',3,'',14,16),(51,'2019-03-26 06:43:05.647879','3','IndexTypeGoodsBanner object (3)',3,'',14,16),(52,'2019-03-26 06:43:05.683535','1','IndexTypeGoodsBanner object (1)',3,'',14,16),(53,'2019-03-26 06:43:23.610419','11','Goods object (11)',3,'',8,16),(54,'2019-03-26 06:43:23.738647','10','Goods object (10)',3,'',8,16),(55,'2019-03-26 06:43:23.768566','9','Goods object (9)',3,'',8,16),(56,'2019-03-26 06:43:23.803468','8','Goods object (8)',3,'',8,16),(57,'2019-03-26 06:43:23.891234','7','Goods object (7)',3,'',8,16),(58,'2019-03-26 06:43:23.924922','6','Goods object (6)',3,'',8,16),(59,'2019-03-26 06:43:23.958405','5','Goods object (5)',3,'',8,16),(60,'2019-03-26 06:43:23.988327','4','Goods object (4)',3,'',8,16),(61,'2019-03-26 06:43:24.023680','3','Goods object (3)',3,'',8,16),(62,'2019-03-26 06:43:24.057047','2','Goods object (2)',3,'',8,16),(63,'2019-03-26 06:43:24.089966','1','Goods object (1)',3,'',8,16),(64,'2019-03-26 06:53:33.962789','12','Goods object (12)',1,'[{\"added\": {}}]',8,16),(65,'2019-03-26 06:54:18.855752','6','GoodsSKU object (6)',1,'[{\"added\": {}}]',10,16),(66,'2019-03-26 06:54:34.660371','1','GoodsImage object (1)',1,'[{\"added\": {}}]',9,16),(67,'2019-03-26 06:55:13.747527','2','GoodsImage object (2)',1,'[{\"added\": {}}]',9,16),(68,'2019-03-26 06:55:23.882242','3','GoodsImage object (3)',1,'[{\"added\": {}}]',9,16),(69,'2019-03-26 06:55:30.078472','4','GoodsImage object (4)',1,'[{\"added\": {}}]',9,16),(70,'2019-03-26 06:55:36.604656','5','GoodsImage object (5)',1,'[{\"added\": {}}]',9,16),(71,'2019-03-26 06:55:42.005671','6','GoodsImage object (6)',1,'[{\"added\": {}}]',9,16),(72,'2019-03-26 06:55:59.270097','1','IndexGoodsBanner object (1)',1,'[{\"added\": {}}]',12,16),(73,'2019-03-26 06:56:06.543002','2','IndexGoodsBanner object (2)',1,'[{\"added\": {}}]',12,16),(74,'2019-03-26 06:56:13.985960','3','IndexGoodsBanner object (3)',1,'[{\"added\": {}}]',12,16),(75,'2019-03-26 06:56:19.772816','4','IndexGoodsBanner object (4)',1,'[{\"added\": {}}]',12,16),(76,'2019-03-26 06:56:33.986837','5','IndexGoodsBanner object (5)',1,'[{\"added\": {}}]',12,16),(77,'2019-03-26 06:56:42.854495','6','IndexGoodsBanner object (6)',1,'[{\"added\": {}}]',12,16),(78,'2019-03-26 07:01:19.954458','13','Goods object (13)',1,'[{\"added\": {}}]',8,16),(79,'2019-03-26 07:01:27.581627','14','Goods object (14)',1,'[{\"added\": {}}]',8,16),(80,'2019-03-26 07:01:33.718110','15','Goods object (15)',1,'[{\"added\": {}}]',8,16),(81,'2019-03-26 07:01:39.181661','16','Goods object (16)',1,'[{\"added\": {}}]',8,16),(82,'2019-03-26 07:01:45.235094','17','Goods object (17)',1,'[{\"added\": {}}]',8,16),(83,'2019-03-26 07:04:29.587900','7','GoodsSKU object (7)',1,'[{\"added\": {}}]',10,16),(84,'2019-03-26 07:10:21.561567','8','GoodsSKU object (8)',1,'[{\"added\": {}}]',10,16),(85,'2019-03-26 07:10:56.958175','8','IndexTypeGoodsBanner object (8)',1,'[{\"added\": {}}]',14,16),(86,'2019-03-26 07:12:49.760540','9','IndexTypeGoodsBanner object (9)',1,'[{\"added\": {}}]',14,16),(87,'2019-03-26 07:20:16.478714','9','GoodsSKU object (9)',1,'[{\"added\": {}}]',10,16),(88,'2019-03-26 07:20:52.654491','10','GoodsSKU object (10)',1,'[{\"added\": {}}]',10,16),(89,'2019-03-26 07:22:20.077868','11','GoodsSKU object (11)',1,'[{\"added\": {}}]',10,16),(90,'2019-03-26 07:22:59.074261','10','IndexTypeGoodsBanner object (10)',1,'[{\"added\": {}}]',14,16),(91,'2019-03-26 07:23:11.485169','11','IndexTypeGoodsBanner object (11)',1,'[{\"added\": {}}]',14,16),(92,'2019-03-26 07:24:03.801547','10','GoodsSKU object (10)',3,'',10,16),(93,'2019-03-26 07:25:24.320608','12','GoodsSKU object (12)',1,'[{\"added\": {}}]',10,16),(94,'2019-03-26 07:26:20.897231','12','IndexTypeGoodsBanner object (12)',1,'[{\"added\": {}}]',14,16),(95,'2019-03-26 07:26:29.993642','13','IndexTypeGoodsBanner object (13)',1,'[{\"added\": {}}]',14,16),(96,'2019-03-26 07:27:49.768284','13','IndexTypeGoodsBanner object (13)',3,'',14,16),(97,'2019-03-26 07:29:39.211125','18','Goods object (18)',1,'[{\"added\": {}}]',8,16),(98,'2019-03-26 07:30:35.033221','13','GoodsSKU object (13)',1,'[{\"added\": {}}]',10,16),(99,'2019-03-26 07:31:58.851968','14','GoodsSKU object (14)',1,'[{\"added\": {}}]',10,16),(100,'2019-03-26 07:32:17.826083','13','GoodsSKU object (13)',2,'[{\"changed\": {\"fields\": [\"stock\", \"sales\"]}}]',10,16),(101,'2019-03-26 07:34:07.488209','15','GoodsSKU object (15)',1,'[{\"added\": {}}]',10,16),(102,'2019-03-26 07:34:17.032109','14','IndexTypeGoodsBanner object (14)',1,'[{\"added\": {}}]',14,16),(103,'2019-03-26 07:40:01.190300','19','Goods object (19)',1,'[{\"added\": {}}]',8,16),(104,'2019-03-26 07:40:48.071909','16','GoodsSKU object (16)',1,'[{\"added\": {}}]',10,16),(105,'2019-03-26 07:40:57.333997','15','IndexTypeGoodsBanner object (15)',1,'[{\"added\": {}}]',14,16),(106,'2019-03-26 07:42:12.247294','17','GoodsSKU object (17)',1,'[{\"added\": {}}]',10,16),(107,'2019-03-26 07:42:50.479613','16','IndexTypeGoodsBanner object (16)',1,'[{\"added\": {}}]',14,16),(108,'2019-03-26 07:43:59.946315','20','Goods object (20)',1,'[{\"added\": {}}]',8,16),(109,'2019-03-26 07:46:01.223215','18','GoodsSKU object (18)',1,'[{\"added\": {}}]',10,16),(110,'2019-03-26 07:46:06.827425','17','IndexTypeGoodsBanner object (17)',1,'[{\"added\": {}}]',14,16),(111,'2019-03-26 07:46:11.765769','19','GoodsSKU object (19)',1,'[{\"added\": {}}]',10,16),(112,'2019-03-26 07:46:22.085501','18','IndexTypeGoodsBanner object (18)',1,'[{\"added\": {}}]',14,16),(113,'2019-03-26 07:46:31.401868','21','Goods object (21)',1,'[{\"added\": {}}]',8,16),(114,'2019-03-26 07:47:38.865747','20','GoodsSKU object (20)',1,'[{\"added\": {}}]',10,16),(115,'2019-03-26 07:47:49.816195','21','GoodsSKU object (21)',1,'[{\"added\": {}}]',10,16),(116,'2019-03-26 07:47:53.104930','19','IndexTypeGoodsBanner object (19)',1,'[{\"added\": {}}]',14,16),(117,'2019-03-26 07:47:56.280661','20','IndexTypeGoodsBanner object (20)',1,'[{\"added\": {}}]',14,16),(118,'2019-03-26 07:48:47.873247','22','Goods object (22)',1,'[{\"added\": {}}]',8,16),(119,'2019-03-26 07:49:18.169578','21','GoodsSKU object (21)',2,'[{\"changed\": {\"fields\": [\"stock\"]}}]',10,16),(120,'2019-03-26 07:49:41.692750','22','GoodsSKU object (22)',1,'[{\"added\": {}}]',10,16),(121,'2019-03-26 07:49:44.602982','21','IndexTypeGoodsBanner object (21)',1,'[{\"added\": {}}]',14,16),(122,'2019-03-26 07:51:26.399132','23','Goods object (23)',1,'[{\"added\": {}}]',8,16),(123,'2019-03-26 07:52:43.287413','23','GoodsSKU object (23)',1,'[{\"added\": {}}]',10,16),(124,'2019-03-26 07:52:46.939118','22','IndexTypeGoodsBanner object (22)',1,'[{\"added\": {}}]',14,16),(125,'2019-03-26 07:53:56.477106','24','GoodsSKU object (24)',1,'[{\"added\": {}}]',10,16),(126,'2019-03-26 07:54:00.169744','23','IndexTypeGoodsBanner object (23)',1,'[{\"added\": {}}]',14,16),(127,'2019-03-26 08:00:47.050058','25','GoodsSKU object (25)',1,'[{\"added\": {}}]',10,16),(128,'2019-03-26 08:00:52.961490','24','IndexTypeGoodsBanner object (24)',1,'[{\"added\": {}}]',14,16),(129,'2019-03-26 08:03:21.219375','26','GoodsSKU object (26)',1,'[{\"added\": {}}]',10,16),(130,'2019-03-26 08:03:27.076870','25','IndexTypeGoodsBanner object (25)',1,'[{\"added\": {}}]',14,16),(131,'2019-03-26 08:10:10.880956','24','Goods object (24)',1,'[{\"added\": {}}]',8,16),(132,'2019-03-26 08:12:46.380388','27','GoodsSKU object (27)',1,'[{\"added\": {}}]',10,16),(133,'2019-03-26 08:12:54.176134','26','IndexTypeGoodsBanner object (26)',1,'[{\"added\": {}}]',14,16),(134,'2019-03-26 08:15:24.722652','28','GoodsSKU object (28)',1,'[{\"added\": {}}]',10,16),(135,'2019-03-26 08:15:27.515715','27','IndexTypeGoodsBanner object (27)',1,'[{\"added\": {}}]',14,16),(136,'2019-03-26 08:22:12.882339','29','GoodsSKU object (29)',1,'[{\"added\": {}}]',10,16),(137,'2019-03-26 08:22:18.844583','28','IndexTypeGoodsBanner object (28)',1,'[{\"added\": {}}]',14,16),(138,'2019-03-26 08:24:50.177551','30','GoodsSKU object (30)',1,'[{\"added\": {}}]',10,16),(139,'2019-03-26 08:24:53.389588','29','IndexTypeGoodsBanner object (29)',1,'[{\"added\": {}}]',14,16),(140,'2019-03-26 08:25:34.153699','25','Goods object (25)',1,'[{\"added\": {}}]',8,16),(141,'2019-03-26 08:26:23.737577','31','GoodsSKU object (31)',1,'[{\"added\": {}}]',10,16),(142,'2019-03-26 08:26:28.922194','30','IndexTypeGoodsBanner object (30)',1,'[{\"added\": {}}]',14,16),(143,'2019-03-26 08:30:49.667258','32','GoodsSKU object (32)',1,'[{\"added\": {}}]',10,16),(144,'2019-03-26 08:30:54.473302','31','IndexTypeGoodsBanner object (31)',1,'[{\"added\": {}}]',14,16),(145,'2019-03-26 08:33:56.945347','33','GoodsSKU object (33)',1,'[{\"added\": {}}]',10,16),(146,'2019-03-26 08:34:00.481037','32','IndexTypeGoodsBanner object (32)',1,'[{\"added\": {}}]',14,16),(147,'2019-03-26 08:35:46.283159','34','GoodsSKU object (34)',1,'[{\"added\": {}}]',10,16),(148,'2019-03-26 08:35:50.127945','33','IndexTypeGoodsBanner object (33)',1,'[{\"added\": {}}]',14,16),(149,'2019-03-26 12:40:28.957047','34','GoodsSKU object (34)',3,'',10,16),(150,'2019-03-26 12:40:28.989264','33','GoodsSKU object (33)',3,'',10,16),(151,'2019-03-26 12:40:29.027887','32','GoodsSKU object (32)',3,'',10,16),(152,'2019-03-26 12:40:29.055685','31','GoodsSKU object (31)',3,'',10,16),(153,'2019-03-26 12:40:29.094920','30','GoodsSKU object (30)',3,'',10,16),(154,'2019-03-26 12:40:30.670805','29','GoodsSKU object (29)',3,'',10,16),(155,'2019-03-26 12:40:30.737626','28','GoodsSKU object (28)',3,'',10,16),(156,'2019-03-26 12:40:30.786681','27','GoodsSKU object (27)',3,'',10,16),(157,'2019-03-26 12:40:30.856650','26','GoodsSKU object (26)',3,'',10,16),(158,'2019-03-26 12:40:30.917552','25','GoodsSKU object (25)',3,'',10,16),(159,'2019-03-26 12:40:31.023871','24','GoodsSKU object (24)',3,'',10,16),(160,'2019-03-26 12:40:31.062904','6','GoodsSKU object (6)',3,'',10,16),(161,'2019-03-26 12:40:49.054892','25','Goods object (25)',3,'',8,16),(162,'2019-03-26 12:40:49.100515','24','Goods object (24)',3,'',8,16),(163,'2019-03-26 12:40:49.129438','23','Goods object (23)',3,'',8,16),(164,'2019-03-26 12:40:49.156366','22','Goods object (22)',3,'',8,16),(165,'2019-03-26 12:40:49.195262','21','Goods object (21)',3,'',8,16),(166,'2019-03-26 12:40:49.222190','20','Goods object (20)',3,'',8,16),(167,'2019-03-26 12:40:49.261585','19','Goods object (19)',3,'',8,16),(168,'2019-03-26 12:40:49.288467','18','Goods object (18)',3,'',8,16),(169,'2019-03-26 12:40:49.328137','17','Goods object (17)',3,'',8,16),(170,'2019-03-26 12:40:49.365622','16','Goods object (16)',3,'',8,16),(171,'2019-03-26 12:40:49.404505','15','Goods object (15)',3,'',8,16),(172,'2019-03-26 12:40:49.442564','14','Goods object (14)',3,'',8,16),(173,'2019-03-26 12:40:49.481503','13','Goods object (13)',3,'',8,16),(174,'2019-03-26 12:40:49.508435','12','Goods object (12)',3,'',8,16),(175,'2019-03-26 12:49:07.882171','26','Goods object (26)',1,'[{\"added\": {}}]',8,16),(176,'2019-03-26 12:53:45.712775','35','GoodsSKU object (35)',1,'[{\"added\": {}}]',10,16),(177,'2019-03-26 12:53:55.837784','34','IndexTypeGoodsBanner object (34)',1,'[{\"added\": {}}]',14,16),(178,'2019-03-26 13:06:27.078169','27','Goods object (27)',1,'[{\"added\": {}}]',8,16),(179,'2019-03-26 13:16:30.600749','36','GoodsSKU object (36)',1,'[{\"added\": {}}]',10,16),(180,'2019-03-26 13:16:33.865736','35','IndexTypeGoodsBanner object (35)',1,'[{\"added\": {}}]',14,16),(181,'2019-03-26 13:19:25.529776','36','IndexTypeGoodsBanner object (36)',1,'[{\"added\": {}}]',14,16),(182,'2019-03-26 13:19:33.689567','37','IndexTypeGoodsBanner object (37)',1,'[{\"added\": {}}]',14,16),(183,'2019-03-26 13:24:43.914509','37','GoodsSKU object (37)',1,'[{\"added\": {}}]',10,16),(184,'2019-03-26 13:25:01.305579','38','IndexTypeGoodsBanner object (38)',1,'[{\"added\": {}}]',14,16),(185,'2019-03-26 13:28:30.104730','37','IndexTypeGoodsBanner object (37)',3,'',14,16),(186,'2019-03-26 13:30:02.098565','36','IndexTypeGoodsBanner object (36)',3,'',14,16),(187,'2019-03-26 13:30:02.225375','34','IndexTypeGoodsBanner object (34)',3,'',14,16),(188,'2019-03-26 13:36:02.494145','28','Goods object (28)',1,'[{\"added\": {}}]',8,16),(189,'2019-03-26 13:40:07.854623','38','GoodsSKU object (38)',1,'[{\"added\": {}}]',10,16),(190,'2019-03-26 13:40:15.133784','39','IndexTypeGoodsBanner object (39)',1,'[{\"added\": {}}]',14,16),(191,'2019-03-26 13:43:41.419257','39','GoodsSKU object (39)',1,'[{\"added\": {}}]',10,16),(192,'2019-03-26 13:43:45.272425','40','IndexTypeGoodsBanner object (40)',1,'[{\"added\": {}}]',14,16),(193,'2019-03-26 13:45:57.089924','40','GoodsSKU object (40)',1,'[{\"added\": {}}]',10,16),(194,'2019-03-26 13:46:03.794579','41','IndexTypeGoodsBanner object (41)',1,'[{\"added\": {}}]',14,16),(195,'2019-03-26 13:48:49.371076','41','GoodsSKU object (41)',1,'[{\"added\": {}}]',10,16),(196,'2019-03-26 13:48:53.533568','42','IndexTypeGoodsBanner object (42)',1,'[{\"added\": {}}]',14,16),(197,'2019-03-26 13:55:26.440132','42','GoodsSKU object (42)',1,'[{\"added\": {}}]',10,16),(198,'2019-03-26 13:55:30.827015','43','IndexTypeGoodsBanner object (43)',1,'[{\"added\": {}}]',14,16),(199,'2019-03-26 13:59:23.145877','43','GoodsSKU object (43)',1,'[{\"added\": {}}]',10,16),(200,'2019-03-26 13:59:28.497277','44','IndexTypeGoodsBanner object (44)',1,'[{\"added\": {}}]',14,16),(201,'2019-03-26 14:00:34.142878','29','Goods object (29)',1,'[{\"added\": {}}]',8,16),(202,'2019-03-26 14:02:12.875459','44','GoodsSKU object (44)',1,'[{\"added\": {}}]',10,16),(203,'2019-03-26 14:02:18.612004','45','IndexTypeGoodsBanner object (45)',1,'[{\"added\": {}}]',14,16),(204,'2019-03-26 14:03:16.472166','45','GoodsSKU object (45)',1,'[{\"added\": {}}]',10,16),(205,'2019-03-26 14:03:19.534498','46','IndexTypeGoodsBanner object (46)',1,'[{\"added\": {}}]',14,16),(206,'2019-03-26 14:04:37.402138','46','GoodsSKU object (46)',1,'[{\"added\": {}}]',10,16),(207,'2019-03-26 14:04:43.715865','47','IndexTypeGoodsBanner object (47)',1,'[{\"added\": {}}]',14,16),(208,'2019-03-26 14:05:43.296551','47','GoodsSKU object (47)',1,'[{\"added\": {}}]',10,16),(209,'2019-03-26 14:05:52.078048','48','IndexTypeGoodsBanner object (48)',1,'[{\"added\": {}}]',14,16),(210,'2019-03-26 14:07:34.159755','30','Goods object (30)',1,'[{\"added\": {}}]',8,16),(211,'2019-03-26 14:08:38.688802','48','GoodsSKU object (48)',1,'[{\"added\": {}}]',10,16),(212,'2019-03-26 14:08:48.520448','49','IndexTypeGoodsBanner object (49)',1,'[{\"added\": {}}]',14,16),(213,'2019-03-26 14:12:56.271974','49','GoodsSKU object (49)',1,'[{\"added\": {}}]',10,16),(214,'2019-03-26 14:12:59.859215','50','IndexTypeGoodsBanner object (50)',1,'[{\"added\": {}}]',14,16),(215,'2019-03-26 14:14:31.542701','50','GoodsSKU object (50)',1,'[{\"added\": {}}]',10,16),(216,'2019-03-26 14:14:34.692925','51','IndexTypeGoodsBanner object (51)',1,'[{\"added\": {}}]',14,16),(217,'2019-03-26 14:17:28.082324','51','GoodsSKU object (51)',1,'[{\"added\": {}}]',10,16),(218,'2019-03-26 14:17:31.260822','52','IndexTypeGoodsBanner object (52)',1,'[{\"added\": {}}]',14,16),(219,'2019-03-26 14:24:51.298546','39','IndexTypeGoodsBanner object (39)',2,'[]',14,16),(220,'2019-03-27 01:41:38.665190','52','IndexTypeGoodsBanner object (52)',3,'',14,16),(221,'2019-03-27 01:41:38.777048','51','IndexTypeGoodsBanner object (51)',3,'',14,16),(222,'2019-03-27 01:41:38.814881','50','IndexTypeGoodsBanner object (50)',3,'',14,16),(223,'2019-03-27 01:41:38.842807','49','IndexTypeGoodsBanner object (49)',3,'',14,16),(224,'2019-03-27 01:41:38.880076','48','IndexTypeGoodsBanner object (48)',3,'',14,16),(225,'2019-03-27 01:41:38.908984','47','IndexTypeGoodsBanner object (47)',3,'',14,16),(226,'2019-03-27 01:41:38.946973','46','IndexTypeGoodsBanner object (46)',3,'',14,16),(227,'2019-03-27 01:41:38.974881','45','IndexTypeGoodsBanner object (45)',3,'',14,16),(228,'2019-03-27 01:41:39.012387','44','IndexTypeGoodsBanner object (44)',3,'',14,16),(229,'2019-03-27 01:41:39.041128','43','IndexTypeGoodsBanner object (43)',3,'',14,16),(230,'2019-03-27 01:41:39.078409','42','IndexTypeGoodsBanner object (42)',3,'',14,16),(231,'2019-03-27 01:41:39.106794','41','IndexTypeGoodsBanner object (41)',3,'',14,16),(232,'2019-03-27 01:41:39.144030','40','IndexTypeGoodsBanner object (40)',3,'',14,16),(233,'2019-03-27 01:41:39.171981','39','IndexTypeGoodsBanner object (39)',3,'',14,16),(234,'2019-03-27 01:41:39.210317','38','IndexTypeGoodsBanner object (38)',3,'',14,16),(235,'2019-03-27 01:41:39.238699','35','IndexTypeGoodsBanner object (35)',3,'',14,16),(236,'2019-03-27 01:43:31.223546','31','Goods object (31)',1,'[{\"added\": {}}]',8,16),(237,'2019-03-27 01:49:52.269170','52','GoodsSKU object (52)',1,'[{\"added\": {}}]',10,16),(238,'2019-03-27 01:49:58.357771','53','IndexTypeGoodsBanner object (53)',1,'[{\"added\": {}}]',14,16),(239,'2019-03-27 01:58:42.975921','53','GoodsSKU object (53)',1,'[{\"added\": {}}]',10,16),(240,'2019-03-27 01:58:46.709391','54','IndexTypeGoodsBanner object (54)',1,'[{\"added\": {}}]',14,16),(241,'2019-03-27 02:00:54.681123','54','GoodsSKU object (54)',1,'[{\"added\": {}}]',10,16),(242,'2019-03-27 02:01:00.792341','55','IndexTypeGoodsBanner object (55)',1,'[{\"added\": {}}]',14,16),(243,'2019-03-27 02:03:01.100439','55','GoodsSKU object (55)',1,'[{\"added\": {}}]',10,16),(244,'2019-03-27 02:03:05.435049','56','IndexTypeGoodsBanner object (56)',1,'[{\"added\": {}}]',14,16),(245,'2019-03-27 02:04:34.614748','32','Goods object (32)',1,'[{\"added\": {}}]',8,16),(246,'2019-03-27 02:06:39.454354','56','GoodsSKU object (56)',1,'[{\"added\": {}}]',10,16),(247,'2019-03-27 02:06:43.052393','57','IndexTypeGoodsBanner object (57)',1,'[{\"added\": {}}]',14,16),(248,'2019-03-27 02:09:14.458193','57','GoodsSKU object (57)',1,'[{\"added\": {}}]',10,16),(249,'2019-03-27 02:09:20.644556','58','IndexTypeGoodsBanner object (58)',1,'[{\"added\": {}}]',14,16),(250,'2019-03-27 02:11:19.022187','58','GoodsSKU object (58)',1,'[{\"added\": {}}]',10,16),(251,'2019-03-27 02:11:22.182405','59','IndexTypeGoodsBanner object (59)',1,'[{\"added\": {}}]',14,16),(252,'2019-03-27 02:13:33.028391','59','GoodsSKU object (59)',1,'[{\"added\": {}}]',10,16),(253,'2019-03-27 02:13:37.144493','60','IndexTypeGoodsBanner object (60)',1,'[{\"added\": {}}]',14,16),(254,'2019-03-27 02:15:49.841716','33','Goods object (33)',1,'[{\"added\": {}}]',8,16),(255,'2019-03-27 02:17:33.480960','60','GoodsSKU object (60)',1,'[{\"added\": {}}]',10,16),(256,'2019-03-27 02:17:39.763588','61','IndexTypeGoodsBanner object (61)',1,'[{\"added\": {}}]',14,16),(257,'2019-03-27 02:20:01.751739','61','GoodsSKU object (61)',1,'[{\"added\": {}}]',10,16),(258,'2019-03-27 02:20:05.078156','62','IndexTypeGoodsBanner object (62)',1,'[{\"added\": {}}]',14,16),(259,'2019-03-27 02:21:41.217296','62','GoodsSKU object (62)',1,'[{\"added\": {}}]',10,16),(260,'2019-03-27 02:21:44.759820','63','IndexTypeGoodsBanner object (63)',1,'[{\"added\": {}}]',14,16),(261,'2019-03-27 02:23:23.477052','63','GoodsSKU object (63)',1,'[{\"added\": {}}]',10,16),(262,'2019-03-27 02:23:33.884462','64','IndexTypeGoodsBanner object (64)',1,'[{\"added\": {}}]',14,16),(263,'2019-03-27 02:24:45.418041','34','Goods object (34)',1,'[{\"added\": {}}]',8,16),(264,'2019-03-27 02:26:17.891024','64','GoodsSKU object (64)',1,'[{\"added\": {}}]',10,16),(265,'2019-03-27 02:26:21.445552','65','IndexTypeGoodsBanner object (65)',1,'[{\"added\": {}}]',14,16),(266,'2019-03-27 02:28:41.517542','65','GoodsSKU object (65)',1,'[{\"added\": {}}]',10,16),(267,'2019-03-27 02:28:45.753277','66','IndexTypeGoodsBanner object (66)',1,'[{\"added\": {}}]',14,16),(268,'2019-03-27 02:31:02.773229','66','GoodsSKU object (66)',1,'[{\"added\": {}}]',10,16),(269,'2019-03-27 02:31:07.638423','67','IndexTypeGoodsBanner object (67)',1,'[{\"added\": {}}]',14,16),(270,'2019-03-27 02:33:37.113254','67','GoodsSKU object (67)',1,'[{\"added\": {}}]',10,16),(271,'2019-03-27 02:34:10.599304','68','IndexTypeGoodsBanner object (68)',1,'[{\"added\": {}}]',14,16),(272,'2019-03-27 02:36:06.910457','35','Goods object (35)',1,'[{\"added\": {}}]',8,16),(273,'2019-03-27 02:37:56.370068','68','GoodsSKU object (68)',1,'[{\"added\": {}}]',10,16),(274,'2019-03-27 02:38:10.078090','69','IndexTypeGoodsBanner object (69)',1,'[{\"added\": {}}]',14,16),(275,'2019-03-27 02:39:44.368764','69','GoodsSKU object (69)',1,'[{\"added\": {}}]',10,16),(276,'2019-03-27 02:39:48.102271','70','IndexTypeGoodsBanner object (70)',1,'[{\"added\": {}}]',14,16),(277,'2019-03-27 02:42:18.366145','70','GoodsSKU object (70)',1,'[{\"added\": {}}]',10,16),(278,'2019-03-27 02:42:22.743474','71','IndexTypeGoodsBanner object (71)',1,'[{\"added\": {}}]',14,16),(279,'2019-03-27 02:43:46.668453','71','GoodsSKU object (71)',1,'[{\"added\": {}}]',10,16),(280,'2019-03-27 02:43:58.839939','72','IndexTypeGoodsBanner object (72)',1,'[{\"added\": {}}]',14,16),(281,'2019-03-27 02:47:21.974178','36','Goods object (36)',1,'[{\"added\": {}}]',8,16),(282,'2019-03-27 02:50:49.639155','72','GoodsSKU object (72)',1,'[{\"added\": {}}]',10,16),(283,'2019-03-27 02:50:54.297824','73','IndexTypeGoodsBanner object (73)',1,'[{\"added\": {}}]',14,16),(284,'2019-03-27 02:52:31.202986','73','GoodsSKU object (73)',1,'[{\"added\": {}}]',10,16),(285,'2019-03-27 02:52:34.354312','74','IndexTypeGoodsBanner object (74)',1,'[{\"added\": {}}]',14,16),(286,'2019-03-27 02:53:41.333132','74','GoodsSKU object (74)',1,'[{\"added\": {}}]',10,16),(287,'2019-03-27 02:53:45.778177','75','IndexTypeGoodsBanner object (75)',1,'[{\"added\": {}}]',14,16),(288,'2019-03-27 02:55:32.397764','75','GoodsSKU object (75)',1,'[{\"added\": {}}]',10,16),(289,'2019-03-27 02:55:38.401192','76','IndexTypeGoodsBanner object (76)',1,'[{\"added\": {}}]',14,16),(290,'2019-03-27 03:02:11.007572','7','IndexGoodsBanner object (7)',1,'[{\"added\": {}}]',12,16),(291,'2019-03-27 03:04:45.166142','77','IndexTypeGoodsBanner object (77)',1,'[{\"added\": {}}]',14,16),(292,'2019-03-27 03:05:13.880092','78','IndexTypeGoodsBanner object (78)',1,'[{\"added\": {}}]',14,16),(293,'2019-03-27 03:05:19.794449','79','IndexTypeGoodsBanner object (79)',1,'[{\"added\": {}}]',14,16),(294,'2019-03-27 03:05:27.772309','80','IndexTypeGoodsBanner object (80)',1,'[{\"added\": {}}]',14,16),(295,'2019-03-27 03:06:13.755798','79','IndexTypeGoodsBanner object (79)',2,'[{\"changed\": {\"fields\": [\"display_type\"]}}]',14,16),(296,'2019-03-27 03:07:02.110529','80','IndexTypeGoodsBanner object (80)',2,'[{\"changed\": {\"fields\": [\"type\"]}}]',14,16),(297,'2019-03-27 03:07:51.146470','81','IndexTypeGoodsBanner object (81)',1,'[{\"added\": {}}]',14,16),(298,'2019-03-27 03:08:24.827515','82','IndexTypeGoodsBanner object (82)',1,'[{\"added\": {}}]',14,16),(299,'2019-03-27 03:08:31.521191','8','IndexGoodsBanner object (8)',1,'[{\"added\": {}}]',12,16),(300,'2019-03-27 03:08:50.467701','83','IndexTypeGoodsBanner object (83)',1,'[{\"added\": {}}]',14,16),(301,'2019-03-27 03:09:12.838384','9','IndexGoodsBanner object (9)',1,'[{\"added\": {}}]',12,16),(302,'2019-03-27 03:09:15.417355','84','IndexTypeGoodsBanner object (84)',1,'[{\"added\": {}}]',14,16),(303,'2019-03-27 03:09:38.287097','10','IndexGoodsBanner object (10)',1,'[{\"added\": {}}]',12,16),(304,'2019-03-27 03:09:38.440687','85','IndexTypeGoodsBanner object (85)',1,'[{\"added\": {}}]',14,16),(305,'2019-03-27 03:10:02.856698','86','IndexTypeGoodsBanner object (86)',1,'[{\"added\": {}}]',14,16),(306,'2019-03-27 03:10:04.669831','10','IndexGoodsBanner object (10)',3,'',12,16),(307,'2019-03-27 03:10:12.540409','87','IndexTypeGoodsBanner object (87)',1,'[{\"added\": {}}]',14,16),(308,'2019-03-27 03:10:21.095946','88','IndexTypeGoodsBanner object (88)',1,'[{\"added\": {}}]',14,16),(309,'2019-03-27 03:10:35.561154','9','IndexGoodsBanner object (9)',3,'',12,16),(310,'2019-03-27 03:10:59.240956','89','IndexTypeGoodsBanner object (89)',1,'[{\"added\": {}}]',14,16),(311,'2019-03-27 03:11:02.459037','11','IndexGoodsBanner object (11)',1,'[{\"added\": {}}]',12,16),(312,'2019-03-27 03:11:08.791266','90','IndexTypeGoodsBanner object (90)',1,'[{\"added\": {}}]',14,16),(313,'2019-03-27 03:11:12.596250','12','IndexGoodsBanner object (12)',1,'[{\"added\": {}}]',12,16),(314,'2019-03-27 03:11:18.119800','91','IndexTypeGoodsBanner object (91)',1,'[{\"added\": {}}]',14,16),(315,'2019-03-27 03:11:21.381298','13','IndexGoodsBanner object (13)',1,'[{\"added\": {}}]',12,16),(316,'2019-03-27 03:11:28.671903','92','IndexTypeGoodsBanner object (92)',1,'[{\"added\": {}}]',14,16),(317,'2019-03-27 03:11:50.766657','12','IndexGoodsBanner object (12)',3,'',12,16),(318,'2019-03-27 03:12:03.994914','93','IndexTypeGoodsBanner object (93)',1,'[{\"added\": {}}]',14,16),(319,'2019-03-27 03:12:07.414232','11','IndexGoodsBanner object (11)',3,'',12,16),(320,'2019-03-27 03:12:12.130441','94','IndexTypeGoodsBanner object (94)',1,'[{\"added\": {}}]',14,16),(321,'2019-03-27 03:12:21.084013','95','IndexTypeGoodsBanner object (95)',1,'[{\"added\": {}}]',14,16),(322,'2019-03-27 03:12:30.199083','96','IndexTypeGoodsBanner object (96)',1,'[{\"added\": {}}]',14,16),(323,'2019-03-27 03:12:30.532952','14','IndexGoodsBanner object (14)',1,'[{\"added\": {}}]',12,16),(324,'2019-03-27 03:12:40.756841','15','IndexGoodsBanner object (15)',1,'[{\"added\": {}}]',12,16),(325,'2019-03-27 03:13:13.162218','97','IndexTypeGoodsBanner object (97)',1,'[{\"added\": {}}]',14,16),(326,'2019-03-27 03:13:20.463838','98','IndexTypeGoodsBanner object (98)',1,'[{\"added\": {}}]',14,16),(327,'2019-03-27 03:13:27.785613','99','IndexTypeGoodsBanner object (99)',1,'[{\"added\": {}}]',14,16),(328,'2019-03-27 03:13:35.709329','100','IndexTypeGoodsBanner object (100)',1,'[{\"added\": {}}]',14,16),(329,'2019-03-27 03:18:05.860732','101','IndexTypeGoodsBanner object (101)',1,'[{\"added\": {}}]',14,16),(330,'2019-03-27 03:18:22.448869','101','IndexTypeGoodsBanner object (101)',3,'',14,16),(331,'2019-03-27 13:12:04.169492','76','GoodsSKU object (76)',1,'[{\"added\": {}}]',10,16),(332,'2019-03-27 13:16:56.738426','77','GoodsSKU object (77)',1,'[{\"added\": {}}]',10,16),(333,'2019-03-27 13:44:45.573464','78','GoodsSKU object (78)',1,'[{\"added\": {}}]',10,16),(334,'2019-03-27 13:52:27.929244','79','GoodsSKU object (79)',1,'[{\"added\": {}}]',10,16),(335,'2019-03-27 13:53:38.584462','80','GoodsSKU object (80)',1,'[{\"added\": {}}]',10,16),(336,'2019-03-27 13:54:27.386822','81','GoodsSKU object (81)',1,'[{\"added\": {}}]',10,16),(337,'2019-03-27 15:34:34.408289','35','GoodsSKU object (35)',2,'[{\"changed\": {\"fields\": [\"unite\"]}}]',10,16),(338,'2019-03-28 01:26:10.646970','75','GoodsSKU object (75)',2,'[{\"changed\": {\"fields\": [\"unite\", \"sales\"]}}]',10,16),(339,'2019-03-28 01:26:18.235713','76','IndexTypeGoodsBanner object (76)',2,'[]',14,16),(340,'2019-03-28 01:27:14.850065','74','GoodsSKU object (74)',2,'[{\"changed\": {\"fields\": [\"unite\", \"sales\"]}}]',10,16),(341,'2019-03-28 01:27:17.733985','75','IndexTypeGoodsBanner object (75)',2,'[]',14,16),(342,'2019-03-28 01:28:09.965448','73','GoodsSKU object (73)',2,'[{\"changed\": {\"fields\": [\"unite\"]}}]',10,16),(343,'2019-03-28 01:28:19.549078','73','GoodsSKU object (73)',2,'[{\"changed\": {\"fields\": [\"sales\"]}}]',10,16),(344,'2019-03-28 01:28:23.838367','74','IndexTypeGoodsBanner object (74)',2,'[]',14,16),(345,'2019-03-28 01:29:25.345015','72','GoodsSKU object (72)',2,'[{\"changed\": {\"fields\": [\"unite\", \"sales\"]}}]',10,16),(346,'2019-03-28 01:29:28.359106','73','IndexTypeGoodsBanner object (73)',2,'[]',14,16),(347,'2019-03-28 01:30:30.185206','71','GoodsSKU object (71)',2,'[{\"changed\": {\"fields\": [\"unite\", \"sales\"]}}]',10,16),(348,'2019-03-28 01:30:32.878774','72','IndexTypeGoodsBanner object (72)',2,'[]',14,16),(349,'2019-03-28 01:32:02.903658','70','GoodsSKU object (70)',2,'[{\"changed\": {\"fields\": [\"unite\", \"sales\"]}}]',10,16),(350,'2019-03-28 01:32:10.513612','71','IndexTypeGoodsBanner object (71)',2,'[]',14,16),(351,'2019-03-28 01:33:12.239344','68','GoodsSKU object (68)',2,'[{\"changed\": {\"fields\": [\"unite\", \"sales\"]}}]',10,16),(352,'2019-03-28 01:33:18.405313','69','IndexTypeGoodsBanner object (69)',2,'[]',14,16),(353,'2019-03-28 01:33:39.198882','69','IndexTypeGoodsBanner object (69)',2,'[]',14,16),(354,'2019-03-28 01:34:23.780470','69','GoodsSKU object (69)',2,'[{\"changed\": {\"fields\": [\"unite\", \"sales\"]}}]',10,16),(355,'2019-03-28 01:34:28.632591','70','IndexTypeGoodsBanner object (70)',2,'[]',14,16),(356,'2019-03-28 01:34:53.628313','68','GoodsSKU object (68)',2,'[{\"changed\": {\"fields\": [\"unite\"]}}]',10,16),(357,'2019-03-28 01:34:55.364289','69','IndexTypeGoodsBanner object (69)',2,'[]',14,16),(358,'2019-03-28 01:35:59.158789','67','GoodsSKU object (67)',2,'[{\"changed\": {\"fields\": [\"unite\", \"sales\"]}}]',10,16),(359,'2019-03-28 01:36:04.227540','68','IndexTypeGoodsBanner object (68)',2,'[]',14,16),(360,'2019-03-28 01:37:17.002695','66','GoodsSKU object (66)',2,'[{\"changed\": {\"fields\": [\"unite\", \"sales\"]}}]',10,16),(361,'2019-03-28 01:37:20.797730','67','IndexTypeGoodsBanner object (67)',2,'[]',14,16),(362,'2019-03-28 01:38:15.973429','65','GoodsSKU object (65)',2,'[{\"changed\": {\"fields\": [\"unite\", \"sales\"]}}]',10,16),(363,'2019-03-28 01:38:21.057953','90','IndexTypeGoodsBanner object (90)',2,'[]',14,16),(364,'2019-03-28 01:38:56.671623','64','GoodsSKU object (64)',2,'[{\"changed\": {\"fields\": [\"unite\", \"sales\"]}}]',10,16),(365,'2019-03-28 01:38:58.740136','65','IndexTypeGoodsBanner object (65)',2,'[]',14,16),(366,'2019-03-28 01:39:52.890362','63','GoodsSKU object (63)',2,'[{\"changed\": {\"fields\": [\"unite\", \"sales\"]}}]',10,16),(367,'2019-03-28 01:39:58.532633','64','IndexTypeGoodsBanner object (64)',2,'[]',14,16),(368,'2019-03-28 01:40:33.981829','62','GoodsSKU object (62)',2,'[{\"changed\": {\"fields\": [\"unite\", \"sales\"]}}]',10,16),(369,'2019-03-28 01:41:41.384624','63','IndexTypeGoodsBanner object (63)',2,'[]',14,16),(370,'2019-03-28 01:42:17.979001','61','GoodsSKU object (61)',2,'[{\"changed\": {\"fields\": [\"unite\", \"sales\"]}}]',10,16),(371,'2019-03-28 01:42:21.281027','62','IndexTypeGoodsBanner object (62)',2,'[]',14,16),(372,'2019-03-28 01:43:18.586314','60','GoodsSKU object (60)',2,'[{\"changed\": {\"fields\": [\"unite\", \"sales\"]}}]',10,16),(373,'2019-03-28 01:43:34.996966','61','IndexTypeGoodsBanner object (61)',2,'[]',14,16),(374,'2019-03-28 01:44:54.262105','59','GoodsSKU object (59)',2,'[{\"changed\": {\"fields\": [\"unite\", \"sales\"]}}]',10,16),(375,'2019-03-28 01:44:56.877917','60','IndexTypeGoodsBanner object (60)',2,'[]',14,16),(376,'2019-03-28 01:46:48.452130','58','GoodsSKU object (58)',2,'[{\"changed\": {\"fields\": [\"unite\", \"sales\"]}}]',10,16),(377,'2019-03-28 01:46:55.103215','59','IndexTypeGoodsBanner object (59)',2,'[]',14,16),(378,'2019-03-28 01:47:40.243674','57','GoodsSKU object (57)',2,'[{\"changed\": {\"fields\": [\"unite\", \"sales\"]}}]',10,16),(379,'2019-03-28 01:47:43.947615','82','IndexTypeGoodsBanner object (82)',2,'[]',14,16),(380,'2019-03-28 01:49:58.003722','56','GoodsSKU object (56)',2,'[{\"changed\": {\"fields\": [\"unite\", \"sales\"]}}]',10,16),(381,'2019-03-28 01:50:01.674394','57','IndexTypeGoodsBanner object (57)',2,'[]',14,16),(382,'2019-03-28 01:51:19.290012','55','GoodsSKU object (55)',2,'[{\"changed\": {\"fields\": [\"unite\", \"sales\"]}}]',10,16),(383,'2019-03-28 01:51:22.487423','56','IndexTypeGoodsBanner object (56)',2,'[]',14,16),(384,'2019-03-28 01:52:17.441633','54','GoodsSKU object (54)',2,'[{\"changed\": {\"fields\": [\"unite\", \"sales\"]}}]',10,16),(385,'2019-03-28 01:52:19.455092','55','IndexTypeGoodsBanner object (55)',2,'[]',14,16),(386,'2019-03-28 01:52:55.660255','53','GoodsSKU object (53)',2,'[{\"changed\": {\"fields\": [\"unite\", \"sales\"]}}]',10,16),(387,'2019-03-28 01:52:58.727163','54','IndexTypeGoodsBanner object (54)',2,'[]',14,16),(388,'2019-03-28 01:53:24.970655','52','GoodsSKU object (52)',2,'[{\"changed\": {\"fields\": [\"unite\", \"sales\"]}}]',10,16),(389,'2019-03-28 01:53:27.981838','53','IndexTypeGoodsBanner object (53)',2,'[]',14,16),(390,'2019-03-28 02:01:26.868370','82','GoodsSKU object (82)',1,'[{\"added\": {}}]',10,16),(391,'2019-03-28 02:03:13.170314','83','GoodsSKU object (83)',1,'[{\"added\": {}}]',10,16),(392,'2019-03-28 02:04:15.426999','84','GoodsSKU object (84)',1,'[{\"added\": {}}]',10,16),(393,'2019-03-28 02:05:07.051204','85','GoodsSKU object (85)',1,'[{\"added\": {}}]',10,16),(394,'2019-03-28 02:06:46.707146','86','GoodsSKU object (86)',1,'[{\"added\": {}}]',10,16),(395,'2019-03-28 02:07:42.070523','87','GoodsSKU object (87)',1,'[{\"added\": {}}]',10,16),(396,'2019-03-28 02:09:09.690113','88','GoodsSKU object (88)',1,'[{\"added\": {}}]',10,16),(397,'2019-03-28 02:10:07.592190','89','GoodsSKU object (89)',1,'[{\"added\": {}}]',10,16),(398,'2019-03-28 02:11:49.741914','90','GoodsSKU object (90)',1,'[{\"added\": {}}]',10,16),(399,'2019-03-28 02:16:14.055507','91','GoodsSKU object (91)',1,'[{\"added\": {}}]',10,16),(400,'2019-03-28 02:17:22.677601','92','GoodsSKU object (92)',1,'[{\"added\": {}}]',10,16),(401,'2019-03-28 02:19:08.634930','93','GoodsSKU object (93)',1,'[{\"added\": {}}]',10,16),(402,'2019-03-28 02:20:13.384210','94','GoodsSKU object (94)',1,'[{\"added\": {}}]',10,16),(403,'2019-03-28 02:20:13.715021','95','GoodsSKU object (95)',1,'[{\"added\": {}}]',10,16),(404,'2019-03-28 02:21:23.708667','96','GoodsSKU object (96)',1,'[{\"added\": {}}]',10,16),(405,'2019-03-28 02:25:00.535090','97','GoodsSKU object (97)',1,'[{\"added\": {}}]',10,16),(406,'2019-03-28 02:25:59.305102','98','GoodsSKU object (98)',1,'[{\"added\": {}}]',10,16),(407,'2019-03-28 02:26:43.769633','99','GoodsSKU object (99)',1,'[{\"added\": {}}]',10,16),(408,'2019-03-28 02:28:45.473505','100','GoodsSKU object (100)',1,'[{\"added\": {}}]',10,16),(409,'2019-03-28 02:29:55.265043','101','GoodsSKU object (101)',1,'[{\"added\": {}}]',10,16),(410,'2019-03-28 02:34:10.855515','102','GoodsSKU object (102)',1,'[{\"added\": {}}]',10,16),(411,'2019-03-28 02:37:28.318465','103','GoodsSKU object (103)',1,'[{\"added\": {}}]',10,16),(412,'2019-03-28 02:38:57.653956','104','GoodsSKU object (104)',1,'[{\"added\": {}}]',10,16),(413,'2019-03-28 02:41:38.088265','105','GoodsSKU object (105)',1,'[{\"added\": {}}]',10,16),(414,'2019-03-28 02:44:13.198694','106','GoodsSKU object (106)',1,'[{\"added\": {}}]',10,16),(415,'2019-03-28 02:45:13.562903','107','GoodsSKU object (107)',1,'[{\"added\": {}}]',10,16),(416,'2019-03-28 02:45:59.856678','108','GoodsSKU object (108)',1,'[{\"added\": {}}]',10,16),(417,'2019-03-28 02:46:58.723675','109','GoodsSKU object (109)',1,'[{\"added\": {}}]',10,16),(418,'2019-03-28 02:47:54.911342','110','GoodsSKU object (110)',1,'[{\"added\": {}}]',10,16),(419,'2019-03-28 02:49:00.239294','111','GoodsSKU object (111)',1,'[{\"added\": {}}]',10,16),(420,'2019-03-28 02:51:46.000532','112','GoodsSKU object (112)',1,'[{\"added\": {}}]',10,16),(421,'2019-03-28 02:53:42.688630','113','GoodsSKU object (113)',1,'[{\"added\": {}}]',10,16),(422,'2019-03-28 02:55:00.893347','114','GoodsSKU object (114)',1,'[{\"added\": {}}]',10,16),(423,'2019-03-28 07:52:28.653899','77','IndexTypeGoodsBanner object (77)',2,'[]',14,16),(424,'2019-03-28 07:55:27.741466','36','GoodsSKU object (36)',2,'[{\"changed\": {\"fields\": [\"unite\"]}}]',10,16),(425,'2019-03-28 07:55:35.657262','78','IndexTypeGoodsBanner object (78)',2,'[]',14,16),(426,'2019-03-28 07:56:31.408433','37','GoodsSKU object (37)',2,'[{\"changed\": {\"fields\": [\"unite\"]}}]',10,16),(427,'2019-03-28 07:56:33.001801','79','IndexTypeGoodsBanner object (79)',2,'[]',14,16),(428,'2019-03-28 07:57:47.359832','38','GoodsSKU object (38)',2,'[{\"changed\": {\"fields\": [\"unite\"]}}]',10,16),(429,'2019-03-28 07:57:49.057907','80','IndexTypeGoodsBanner object (80)',2,'[]',14,16);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(8,'goods','goods'),(9,'goods','goodsimage'),(10,'goods','goodssku'),(11,'goods','goodstype'),(12,'goods','indexgoodsbanner'),(13,'goods','indexpromotionbanner'),(14,'goods','indextypegoodsbanner'),(15,'order','ordergoods'),(16,'order','orderinfo'),(5,'sessions','session'),(7,'user','address'),(6,'user','user');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-03-20 11:15:26.928674'),(2,'contenttypes','0002_remove_content_type_name','2019-03-20 11:15:28.257120'),(3,'auth','0001_initial','2019-03-20 11:15:32.676916'),(4,'auth','0002_alter_permission_name_max_length','2019-03-20 11:15:33.365118'),(5,'auth','0003_alter_user_email_max_length','2019-03-20 11:15:33.427585'),(6,'auth','0004_alter_user_username_opts','2019-03-20 11:15:33.474404'),(7,'auth','0005_alter_user_last_login_null','2019-03-20 11:15:33.506335'),(8,'auth','0006_require_contenttypes_0002','2019-03-20 11:15:33.553185'),(9,'auth','0007_alter_validators_add_error_messages','2019-03-20 11:15:33.599381'),(10,'auth','0008_alter_user_username_max_length','2019-03-20 11:15:33.646278'),(11,'auth','0009_alter_user_last_name_max_length','2019-03-20 11:15:33.677943'),(12,'user','0001_initial','2019-03-20 11:15:38.962861'),(13,'admin','0001_initial','2019-03-20 11:15:40.725802'),(14,'admin','0002_logentry_remove_auto_add','2019-03-20 11:15:40.772679'),(15,'goods','0001_initial','2019-03-20 11:15:48.803031'),(16,'order','0001_initial','2019-03-20 11:15:49.474678'),(17,'order','0002_auto_20190320_1915','2019-03-20 11:15:54.359304'),(18,'sessions','0001_initial','2019-03-20 11:15:55.085709'),(19,'goods','0002_auto_20190325_1811','2019-03-25 10:11:39.633529'),(20,'goods','0003_auto_20190325_2214','2019-03-25 14:15:35.025469');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('hvm4e8je5fui6r6f5a84jh8nbe7om0m6','YTQyNjU4NTY4MjA1MWJhZmNiNjhlYzAzYmE0MDUxMzU2ZDNjOTllMzp7Il9hdXRoX3VzZXJfaWQiOiIxNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOWE4NDk3YjYwZjI3MmUzN2Q0YjhlODM3ZGRhMTA2OWMyOTYwMGViNSJ9','2019-04-04 09:21:25.300017'),('p308usappc3yspxmqrrtd55v2x9aju6v','YTQyNjU4NTY4MjA1MWJhZmNiNjhlYzAzYmE0MDUxMzU2ZDNjOTllMzp7Il9hdXRoX3VzZXJfaWQiOiIxNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOWE4NDk3YjYwZjI3MmUzN2Q0YjhlODM3ZGRhMTA2OWMyOTYwMGViNSJ9','2019-04-04 07:49:40.556220');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `name` varchar(20) NOT NULL,
  `detail` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (26,'2019-03-26 12:49:07.845276','2019-03-26 12:49:07.845276',0,'除草剂01','<p><span style=\"color: #333333; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px;\">可使杂草彻底地或选择地发生枯死的药剂，又称除莠剂， 用以消灭或抑制植物生长的一类物质。</span></p>'),(27,'2019-03-26 13:06:27.077169','2019-03-26 13:06:27.077169',0,'叶面肥01','<p><span style=\"color: #333333; font-family: arial; font-size: 13px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">叶面施肥是植物吸收营养成分的一种补充，来弥补根系吸收养分的不足，叶面施肥不能代替土壤施肥。</span><em style=\"font-style: normal; color: #cc0000; font-family: arial; font-size: 13px; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial;\">叶面肥</em><span style=\"color: #333333; font-family: arial; font-size: 13px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">的原理首先有明确叶片结构，叶的基本结构是叶片，叶柄，托叶。叶片又包括表皮，叶肉，叶脉</span></p>'),(28,'2019-03-26 13:36:02.492080','2019-03-26 13:36:02.492080',0,'杀虫剂01','<p><span style=\"color: #333333; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px;\">杀死害虫的一种药剂，如甲虫、苍蝇、蛴螬、鼻虫、跳虫以及近万种其他害虫。杀虫剂的使用先后经历了几个阶段：最早发现的是天然杀虫剂及无机化合物，但是它们作用单一、用量大、持效期短；有机氯、有机磷和氨基甲酸酯等有机合成杀虫剂，它们的特征是高效高残留或低残留，其中有不少品种对哺乳动物有高的急性毒性。</span></p>'),(29,'2019-03-26 14:00:34.141880','2019-03-26 14:00:34.141880',0,'杀菌剂01','<p><span style=\"color: #333333; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px;\">杀菌剂又称杀生剂、杀菌灭藻剂、杀微生物剂等，通常是指能有效地控制或杀死水系统中的微生物&mdash;&mdash;细菌、真菌和藻类的化学制剂。在国际上，通常是作为防治各类病原微生物的药剂的总称。</span></p>'),(30,'2019-03-26 14:07:34.157807','2019-03-26 14:07:34.157807',0,'杀螨剂01','<p><span style=\"color: #333333; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px;\">用于防治植食性</span><a style=\"color: #136ec2; text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px;\" href=\"https://baike.baidu.com/item/%E5%AE%B3%E8%9E%A8/1955532\" target=\"_blank\" data-lemmaid=\"1955532\">害螨</a><span style=\"color: #333333; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px;\">的药剂称为杀螨剂。早期使用的杀螨剂多为硫磺和无机硫制剂。</span></p>'),(31,'2019-03-27 01:43:30.613798','2019-03-27 01:43:30.613798',0,'除草剂01','<p><span style=\"color: #333333; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px;\">可使杂草彻底地或选择地发生枯死的药剂，又称除莠剂， 用以消灭或抑制植物生长的一类物质。</span></p>'),(32,'2019-03-27 02:04:34.613751','2019-03-27 02:04:34.613751',0,'杀虫剂01','<p><span style=\"color: #333333; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px;\">杀死害虫的一种药剂，如甲虫、苍蝇、蛴螬、鼻虫、跳虫以及近万种其他害虫。</span></p>'),(33,'2019-03-27 02:15:49.838772','2019-03-27 02:15:49.838772',0,'杀菌剂01','<p><span style=\"color: #333333; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px;\">能有效地控制或杀死水系统中的微生物&mdash;&mdash;细菌、真菌和藻类的化学制剂</span></p>'),(34,'2019-03-27 02:24:45.415045','2019-03-27 02:24:45.415045',0,'杀螨剂01','<p><span style=\"color: #333333; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px;\">用于防治植食性</span><a style=\"color: #136ec2; text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px;\" href=\"https://baike.baidu.com/item/%E5%AE%B3%E8%9E%A8/1955532\" target=\"_blank\" data-lemmaid=\"1955532\">害螨</a><span style=\"color: #333333; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px;\">的药剂称为杀螨剂。早期使用的杀螨剂多为硫磺和无机硫制剂。</span></p>'),(35,'2019-03-27 02:36:06.908462','2019-03-27 02:36:06.908462',0,'调节剂01','<p><span style=\"color: #333333; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px;\">天然合成的植物激素含量甚微，不可能大量提取用于调控植物的生长发育，改善农作物生长</span></p>'),(36,'2019-03-27 02:47:21.971245','2019-03-27 02:47:21.971245',0,'叶面肥01','<p><span style=\"color: #333333; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px;\">植物吸收</span><a style=\"color: #136ec2; text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px;\" href=\"https://baike.baidu.com/item/%E8%90%A5%E5%85%BB/2260162\" target=\"_blank\" data-lemmaid=\"2260162\">营养</a><span style=\"color: #333333; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px;\">成分的一种补充，来弥补根系吸收养分的不足，叶面施肥不能代替土壤施肥</span></p>');
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_image`
--

DROP TABLE IF EXISTS `goods_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `image` varchar(100) NOT NULL,
  `sku_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_image_sku_id_f6ac9096_fk_goods_sku_id` (`sku_id`),
  CONSTRAINT `goods_image_sku_id_f6ac9096_fk_goods_sku_id` FOREIGN KEY (`sku_id`) REFERENCES `goods_sku` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_image`
--

LOCK TABLES `goods_image` WRITE;
/*!40000 ALTER TABLE `goods_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `goods_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_sku`
--

DROP TABLE IF EXISTS `goods_sku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_sku` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `name` varchar(20) NOT NULL,
  `desc` varchar(256) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `unite` varchar(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  `stock` int(11) NOT NULL,
  `sales` int(11) NOT NULL,
  `status` smallint(6) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_sku_goods_id_29d98d3b_fk_goods_id` (`goods_id`),
  KEY `goods_sku_type_id_8cbd73ec_fk_df_goods_type_id` (`type_id`),
  CONSTRAINT `goods_sku_goods_id_29d98d3b_fk_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`),
  CONSTRAINT `goods_sku_type_id_8cbd73ec_fk_df_goods_type_id` FOREIGN KEY (`type_id`) REFERENCES `goods_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_sku`
--

LOCK TABLES `goods_sku` WRITE;
/*!40000 ALTER TABLE `goods_sku` DISABLE KEYS */;
INSERT INTO `goods_sku` VALUES (35,'2019-03-26 12:53:45.705793','2019-03-27 15:34:34.330497',0,'草甘膦异丙铵盐','非选择性芽后除草剂，对多年生深根杂草，一年颧二年生禾本科杂草和莎草有特效，通常用于玉米、棉花、大豆田和果园中，并可用于非耕地除草。',180.00,'盒','group1\\M00/00/00/CiOmUVyaINmAKM8EAAB_KcMcJW07023970',999,0,1,26,1),(36,'2019-03-26 13:16:30.585788','2019-03-28 07:55:27.738475',0,'草铵膦','属广谱触杀型除草剂，内吸作用不强，与草甘膦杀根不同，草铵膦先杀叶，通过植物蒸腾作用可以在植物木质部进行传导，其速效性间于百草枯和草甘膦之间。',196.00,'200g/瓶','group1\\M00/00/00/CiOmUVyaJi6AM7oBAABqMzvi9uM4880353',999,0,1,26,1),(37,'2019-03-26 13:24:43.890602','2019-03-28 07:56:31.405440',0,'草甘膦','广泛使用的许多除草剂中的有效活性化学成分，它在欧盟的使用受到了严格的监管。草甘膦与转基因作物并无直接关系，非转基因作物一样要打除草剂草甘膦',215.00,'500ml/瓶','group1\\M00/00/00/CiOmUVyaKBuAG_2GAABd85-qcPM4383433',999,0,1,26,1),(38,'2019-03-26 13:40:07.824702','2019-03-28 07:57:47.357840',0,'甲维盐','白色或淡黄色结晶粉末，溶于丙酮和甲醇、微溶于水、不溶于己烷。是从发酵产品阿维菌素B1开始合成的一种新型高效半合成抗生素杀虫剂，它具有超高效、低毒（制剂近无毒）、低残留、无公害等生物农药的特点。广泛用于蔬菜、果树、棉花等农作物上的多种害虫的防治。',122.00,'200g/瓶','group1\\M00/00/00/CiOmUVyaK7eAHifJAAIAfLmAvfM4157554',999,0,1,28,2),(39,'2019-03-26 13:43:41.403265','2019-03-26 13:43:41.403265',0,'高效氯氰菊酯','农业杀虫剂，主要防治农作物上发生的鳞翅目害虫，具有强毒性。原药外观为白色至奶油色结晶体， 易溶于芳烃、酮类和醇类。',325.00,'陕西悦雨农业科技有限公司','group1\\M00/00/00/CiOmUVyaLI2AcAZpAABmJQmCGo06725850',999,0,1,28,2),(40,'2019-03-26 13:45:57.084936','2019-03-26 13:45:57.084936',0,'甲氨基阿维菌素苯甲酸盐','一种微生物源低毒杀虫、杀螨剂，是在阿维菌素的基础上合成的高效生物药剂，具有活性高、杀虫谱广、可混用性好、持效期长、使用安全等特点，作用方式以胃毒为主，兼有触杀作用。其杀虫机制是阻碍害虫运动神经。不要在鱼塘、蜂场、桑园及其周围使用，药液不要污染池塘等水域。',365.00,'北京中林佳诚科技有限公司','group1\\M00/00/00/CiOmUVyaLRWAbiHwAACX4zZQ7no0759092',999,0,1,28,2),(41,'2019-03-26 13:48:49.366091','2019-03-26 13:48:49.366091',0,'异丙威','一种触杀性兼有内吸作用的杀虫剂，属中等毒性杀虫剂。',250.00,'山东大泰药业有限公司','group1\\M00/00/00/CiOmUVyaLcGAemYRAACGLM__wTs9784530',999,0,1,28,2),(42,'2019-03-26 13:55:26.421184','2019-03-26 13:55:26.421184',0,'草甘膦异丙胺盐','是非选择性芽后除草剂，对多年生深根杂草，一年颧二年生禾本科杂草和莎草有特效，通常用于玉米、棉花、大豆田和果园中，并可用于非耕地除草。',245.00,'邢台金耕农业开发有限公司','group1\\M00/00/00/CiOmUVyaL06ADAyEAAB_KcMcJW04617203',999,0,1,26,1),(43,'2019-03-26 13:59:23.140890','2019-03-26 13:59:23.140890',0,'炔草酯','原药为白色晶体，熔点48.2–57.1 °℃，沸点100.6℃(0.082 Pa)，蒸气压3.19 × 10-3 mPa (25 °C) (OECD 104) ，比重1.35(20℃)，水中溶解度4.0mg/L(pH=7, 25℃)，能溶于乙醇、乙醚、丙酮、氯仿等有机溶剂，分解温度105℃，在强酸强碱条件下分解。',158.00,'歙县早稻田农业技术服务部','group1\\M00/00/00/CiOmUVyaMDuAamQuAABkcL2oxlE5330230',999,0,1,26,1),(44,'2019-03-26 14:02:12.871469','2019-03-26 14:02:12.871469',0,'多菌灵','又名棉萎灵、苯并咪唑44号。多菌灵是一种广谱性杀菌剂，对多种作物由真菌（如半知菌、多子囊菌）引起的病害有防治效果。可用于叶面喷雾、种子处理和土壤处理等。可以有效防治由真菌引起的多种作物病害，在我国的使用范围广泛，但其残留能引起肝病和染色体畸变，对哺乳动物有毒害。',352.00,'广州虎傲化工有限公司','group1\\M00/00/00/CiOmUVyaMOSAM9WdAACxKgdhKL00618162',999,0,1,29,3),(45,'2019-03-26 14:03:16.457180','2019-03-26 14:03:16.457180',0,'烯唑醇','为三唑类杀菌剂，是具有保护、治疗、铲除作用的广谱性杀菌剂；在真菌的麦角甾醇生物合成中抑制14α－脱甲基化作用，对真菌细胞膜起作用，从而起到杀菌作用。',264.00,'上海曙灿实业有限公司','group1\\M00/00/00/CiOmUVyaMSSAbqlBAAC3St5f_CI5197827',999,0,1,29,3),(46,'2019-03-26 14:04:37.398148','2019-03-26 14:04:37.398148',0,'阿维菌素','是一种被广泛使用的农用或兽用杀菌、杀虫、杀螨剂。也称阿灭丁。阿维菌素是由日本北里大学大村智等和美国Merck公司首先开发的一类具有杀菌、杀虫、杀螨、杀线虫活性的十六元大环内酯化合物，由链霉菌中阿维链霉菌Streptomyces avermitilis发酵产生。',185.00,'武汉远城科技发展有限公司','group1\\M00/00/00/CiOmUVyaMXWADNphAACm94NyUEo7030154',999,0,1,29,3),(47,'2019-03-26 14:05:43.263634','2019-03-26 14:05:43.263634',0,'三环唑','防治稻瘟病专用杀菌剂，属于噻唑类。杀菌作用机理主要是抑制附着孢黑色素的形成，从而抑制孢子萌发和附着孢形成，阻止病菌侵人和减少稻瘟病菌孢子的产生。',196.00,'昆山嘉隆生物科技有限公司','group1\\M00/00/00/CiOmUVyaMbeABaW5AAC-7XDDauw4085992',999,0,1,29,3),(48,'2019-03-26 14:08:38.683814','2019-03-26 14:08:38.683814',0,'扑虱灵','是高效，持效期长，选择性强，安全的新型昆虫生长调节剂，属非杀生性农药，它保护天敌，为化学防治和生物防治相结合提供了一个成功的范例。',243.00,'化形生物科技有限公司','group1\\M00/00/00/CiOmUVyaMmaAO8ehAAKgG0Bw4c04703495',999,0,1,30,4),(49,'2019-03-26 14:12:56.255973','2019-03-26 14:12:56.255973',0,'甲氨基阿维菌素苯甲酸盐','一种微生物源低毒杀虫、杀螨剂，是在阿维菌素的基础上合成的高效生物药剂，具有活性高、杀虫谱广、可混用性好、持效期长、使用安全等特点，作用方式以胃毒为主，兼有触杀作用。其杀虫机制是阻碍害虫运动神经。不要在鱼塘、蜂场、桑园及其周围使用，药液不要污染池塘等水域。对蜜蜂有毒，不要在果树开花期使用。一般作物的安全采收间隔期为7天.',342.00,'富农化工有限公司','group1\\M00/00/00/CiOmUVyaM2iAKP3lAACX4_mhKdg2926932',999,0,1,30,4),(50,'2019-03-26 14:14:31.519756','2019-03-26 14:14:31.519756',0,'克百威','一种氨基甲酸酯类杀虫剂和杀线虫剂。1963年由美国创制，1967年推广。纯品为白色结晶，25℃时水中溶解度为700ppm，在中性和酸性条件下较稳定，在碱性介质中不稳定，水解速度随pH值和温度的升高而加快。',235.00,'澄西生物科技有限公司','group1\\M00/00/00/CiOmUVyaM8eAGCTPAACKxa_E9EM5933433',999,0,1,30,4),(51,'2019-03-26 14:17:28.067362','2019-03-26 14:17:28.067362',0,'吡虫啉','是烟碱类超高效杀虫剂，具有广谱、高效、低毒、低残留，害虫不易产生抗性，并有触杀、胃毒和内吸等多重作用 [1]  。害虫接触药剂后，中枢神经正常传导受阻，使其麻痹死亡。产品速效性好，药后1天即有较高的防效，残留期长达25天左右。药效和温度呈正相关，温度高，杀虫效果好。主要用于防治刺吸式口器害虫。',126.00,'四川贝斯特力科技有限公司','group1\\M00/00/00/CiOmUVyaNHiAWKZfAACYx2m7VRM6917356',999,0,1,30,4),(52,'2019-03-27 01:49:51.894285','2019-03-30 02:59:07.330367',0,'草甘膦异丙铵盐','非选择性芽后除草剂，对多年生深根杂草，一年颧二年生禾本科杂草和莎草有特效',40.00,'120ml/瓶','group1\\M00/00/00/CiOmUVya1sCAB9xfAAB_KcMcJW06166100',75,109,1,31,1),(53,'2019-03-27 01:58:42.971930','2019-03-29 16:46:33.611020',0,'草铵膦','通过植物蒸腾作用可以在植物木质部进行传导，其速效性间于百草枯和草甘膦之间。',56.00,'120ml/瓶','group1\\M00/00/00/CiOmUVya2NKAcK48AABqMzvi9uM6208368',87,54,1,31,1),(54,'2019-03-27 02:00:54.676137','2019-03-29 16:41:12.980827',0,'草甘膦','广泛使用的许多除草剂中的有效活性化学成分',32.50,'245ml/瓶','group1\\M00/00/00/CiOmUVya2VaAE8vNAABd85-qcPM8699620',94,41,1,31,1),(55,'2019-03-27 02:03:01.084481','2019-03-28 01:51:19.287985',0,'炔草酯','能溶于乙醇、乙醚、丙酮、氯仿等有机溶剂，分解温度105℃，在强酸强碱条件下分解。',68.00,'120ml/瓶','group1\\M00/00/00/CiOmUVya2dWAd0XmAABkcL2oxlE4100711',99,50,1,31,1),(56,'2019-03-27 02:06:39.427426','2019-03-28 01:49:58.001728',0,'甲维盐','它具有超高效、低毒（制剂近无毒）、低残留、无公害等生物农药的特点。',85.00,'20g/瓶/15g/袋/200g/瓶','group1\\M00/00/00/CiOmUVya2q-AYNBsAAIAfLmAvfM8319145',99,87,1,32,2),(57,'2019-03-27 02:09:14.452226','2019-03-28 01:47:40.241627',0,'高效氯氟氰菊酯','杀虫谱广，活性较高，药效迅速，喷洒后耐雨水冲刷',64.00,'120ml/瓶','group1\\M00/00/00/CiOmUVya20qAPRo1AABmJQmCGo08107060',99,57,1,32,2),(58,'2019-03-27 02:11:19.006230','2019-03-28 01:46:48.450135',0,'甲氨基阿维菌素苯甲酸盐','高效生物药剂，具有活性高、杀虫谱广、可混用性好、持效期长、使用安全等特点',132.00,'35g/袋','group1\\M00/00/00/CiOmUVya28eADZKFAACX4zZQ7no0860832',99,32,1,32,2),(59,'2019-03-27 02:13:33.011437','2019-03-28 01:44:54.259112',0,'联苯菊酯','杀虫活性很高，主要为触杀和胃毒作用，无内吸和熏蒸活性。',156.00,'120ml/瓶','group1\\M00/00/00/CiOmUVya3E2AYElwAABfyfdZdx08939854',99,58,1,32,2),(60,'2019-03-27 02:17:33.455031','2019-03-28 01:43:18.585334',0,'多菌灵','一种广谱性杀菌剂，对多种作物由真菌（如半知菌、多子囊菌）引起的病害有防治效果。',75.00,'35g/包','group1\\M00/00/00/CiOmUVya3T2AMKIkAACxKgdhKL08489295',99,65,1,33,3),(61,'2019-03-27 02:20:01.724338','2019-03-28 01:42:17.976964',0,'烯唑醇','具有保护、治疗、铲除作用的广谱性杀菌剂',94.00,'35g/包','group1\\M00/00/00/CiOmUVya3dGADalNAAC3St5f_CI7183276',99,13,1,33,3),(62,'2019-03-27 02:21:41.202298','2019-03-28 01:40:33.979836',0,'阿维菌素','广泛使用的农用或兽用杀菌、杀虫、杀螨剂。',76.00,'35g/包','group1\\M00/00/00/CiOmUVya3jWAA5DGAACm94NyUEo4678663',99,31,1,33,3),(63,'2019-03-27 02:23:23.459100','2019-03-28 01:39:52.887371',0,'吡虫啉','具有广谱、高效、低毒、低残留，害虫不易产生抗性，并有触杀、胃毒和内吸等多重作用',68.00,'120ml/瓶','group1\\M00/00/00/CiOmUVya3puAQT5ZAAB_Jaxyyzc7946865',99,26,1,33,3),(64,'2019-03-27 02:26:17.875066','2019-03-28 01:38:56.669677',0,'扑虱灵','高效，持效期长，选择性强，安全的新型昆虫生长调节剂',57.00,'35g/包','group1\\M00/00/00/CiOmUVya30mATmVMAAKgG0Bw4c04583900',99,15,1,34,4),(65,'2019-03-27 02:28:41.499509','2019-03-28 01:38:15.971434',0,'异丙威','又称为叶蝉散、灭扑威，是一种触杀性兼有内吸作用的杀虫剂，属中等毒性杀虫剂。',55.00,'120ml/袋','group1\\M00/00/00/CiOmUVya39mAAwRSAABaqr7QFk44932798',99,36,1,34,4),(66,'2019-03-27 02:31:02.754280','2019-03-28 01:37:16.998710',0,'克百威','一种氨基甲酸酯类杀虫剂和杀线虫剂。',108.00,'75g/包','group1\\M00/00/00/CiOmUVya4GaAE1LVAACKxa_E9EM1795371',99,22,1,34,4),(67,'2019-03-27 02:33:36.997534','2019-03-28 01:35:59.155834',0,'辛硫磷','杀虫谱广，击倒力强，以触杀和胃毒作用为主，无内吸作用，对鳞翅目幼虫很有效',134.00,'120g/袋','group1\\M00/00/01/CiOmUVya4QGAY-qaAACBll8KDR06564855',99,47,1,34,4),(68,'2019-03-27 02:37:56.363909','2019-03-28 01:34:53.626331',0,'萘乙酸','一种广谱植物生长调节剂。可用于小麦、水稻增加有效分蘖，提高成穗率,促进籽粒饱满，增产显著',16.00,'245ml/瓶','group1\\M00/00/01/CiOmUVya4gSALoKwAABNYk1p7QQ6590770',99,14,1,35,5),(69,'2019-03-27 02:39:44.346817','2019-03-28 01:34:23.778478',0,'乙烯利','一种优质高效植物生长调节剂，具有促进果实成熟，刺激伤流，调节部分植物性别转化等效应',25.00,'45ml/袋','group1\\M00/00/01/CiOmUVya4nCAQwXUAAC2wHRVHQw6085522',99,25,1,35,5),(70,'2019-03-27 02:42:18.361157','2019-03-28 01:32:02.900668',0,'芸苔素内酯','其通过适宜浓度浸种和茎叶喷施处理，可以促进蔬菜、瓜类、水果等作物生长',38.00,'35ml/袋','group1\\M00/00/01/CiOmUVya4wqAI1PdAABySj48Pio7804389',99,36,1,35,5),(71,'2019-03-27 02:43:46.653493','2019-03-28 01:30:30.183211',0,'赤霉酸','可促进作物生长发育，使之提早成熟、提高产量、改进品质',58.00,'320ml/瓶','group1\\M00/00/01/CiOmUVya42KAcRFlAABhyfiTrFc8567545',99,42,1,35,5),(72,'2019-03-27 02:50:49.619209','2019-03-29 11:29:33.750103',0,'高产绝招（辣椒） 水剂','叶面肥农肥 有效成分： Mn+Zn+B≥10.0%微量元素',19.50,'600g/袋','group1\\M00/00/01/CiOmUVya5QmAfPMHAAC4WySv09c7755317',98,22,1,36,6),(73,'2019-03-27 02:52:31.186030','2019-03-28 01:28:19.547047',0,'大豆粒粒饱 水剂','叶面肥农有效成分： Mn+Zn+B≥100g/L微量元素',230.00,'200g/袋','group1\\M00/00/01/CiOmUVya5W-ANXeMAAC9ACh4xwQ0671010',99,14,1,36,6),(74,'2019-03-27 02:53:41.309174','2019-03-28 01:27:14.848051',0,'花生三配套 粉剂','叶面肥农肥有效成分： Mn+Zn+B≥10.0%微量元素',165.00,'200g/袋','group1\\M00/00/01/CiOmUVya5bWADq-mAADEORUWexs1738592',99,14,1,36,6),(75,'2019-03-27 02:55:32.392789','2019-03-28 01:26:10.156856',0,'沃德力 粉剂','叶面肥农肥有效成分： Mn+Zn+B≥100g/L',255.00,'4000g/袋','group1\\M00/00/01/CiOmUVya5iSAJgSXAAB4Lt-vmRY5210841',99,21,1,36,6),(76,'2019-03-27 13:12:04.006926','2019-03-27 13:12:04.006926',0,'草甘膦铵盐','为内吸传导型灭生性除草剂',68.00,'武汉远城科技发展有限公司','group1\\M00/00/01/CiOmUVybdqOANEULAAClNIxtvI44700613',99,15,1,31,1),(77,'2019-03-27 13:16:56.730448','2019-03-27 13:16:56.730448',0,'草甘膦铵盐','为内吸传导型灭生性除草剂',68.00,'济南诚源化工有限公司','group1\\M00/00/01/CiOmUVybd8iAERxQAACl-qKF_0M8555507',99,10,1,31,1),(78,'2019-03-27 13:44:45.495196','2019-03-27 13:44:45.495196',0,'氰氟草酯','一种除草剂，对水稻的安全性比较高，但是只能作茎叶处理，芽前处理无效',45.00,'济南诚源化工有限公司','group1\\M00/00/01/CiOmUVybfk2AXw3TAABcckpiuuY2633809',99,42,1,31,1),(79,'2019-03-27 13:52:27.922132','2019-03-27 13:52:27.922132',0,'草甘膦异丙胺盐','对多年生深根杂草，一年颧二年生禾本科杂草和莎草有特效，通常用于玉米、棉花、大豆田和果园中，并可用于非耕地除草',85.00,'河南中之州植保有限公司','group1\\M00/00/01/CiOmUVybgBuAA_zKAABOZNwqwfk8779841',99,20,1,31,1),(80,'2019-03-27 13:53:38.556527','2019-03-27 13:53:38.556527',0,'草甘膦铵盐','为内吸传导型灭生性除草剂',56.00,'武汉远城科技发展有限公司','group1\\M00/00/01/CiOmUVybgGKATTX0AACdzb93UFo8514064',99,16,1,31,1),(81,'2019-03-27 13:54:27.379876','2019-03-27 13:54:27.379876',0,'草甘膦铵盐','为内吸传导型灭生性除草剂',45.00,'漯河市四季丰生物肥业有限公司','group1\\M00/00/01/CiOmUVybgJOAR2AoAACVgGDiJvY8892283',99,25,1,31,1),(82,'2019-03-28 02:01:26.770674','2019-03-28 02:01:26.770674',0,'除草一号','为内吸传导型灭生性除草剂',56.00,'25g/袋','group1\\M00/00/01/CiOmUVycKvaAVh64AAB1WbC8s1Y2439324',99,35,1,31,1),(83,'2019-03-28 02:03:13.025398','2019-03-28 02:03:13.026395',0,'2甲4氯钠','为内吸传导型灭生性除草剂',15.00,'25g/袋','group1\\M00/00/01/CiOmUVycK2GAchtiAABuiPq6MVE0261777',99,31,1,31,1),(84,'2019-03-28 02:04:15.420015','2019-03-28 02:04:15.420015',0,'草甘膦','为内吸传导型灭生性除草剂',35.00,'45g/袋','group1\\M00/00/01/CiOmUVycK5-AOAuNAAB38eV19Dg5435653',99,35,1,31,1),(85,'2019-03-28 02:05:07.036195','2019-03-28 02:05:07.036195',0,'乙草胺','为内吸传导型灭生性除草剂',45.00,'120ml/瓶','group1\\M00/00/01/CiOmUVycK9OAdEuoAADnUqJko6c6939972',99,2,1,31,1),(86,'2019-03-28 02:06:46.701162','2019-03-28 02:06:46.701162',0,'吡嘧磺隆','为内吸传导型灭生性除草剂',53.00,'35g/包','group1\\M00/00/01/CiOmUVycLDaAOymOAACHHKEuWHY4381558',99,23,1,31,1),(87,'2019-03-28 02:07:41.960804','2019-03-28 02:07:41.960804',0,'草甘膦异丙胺盐','为内吸传导型灭生性除草剂',42.00,'120ml/瓶','group1\\M00/00/01/CiOmUVycLG2ASbhbAABkAK3AQVA8371847',99,12,1,31,1),(88,'2019-03-28 02:09:09.557098','2019-03-28 02:09:09.557098',0,'精喹禾灵','为内吸传导型灭生性除草剂',21.00,'35g/包','group1\\M00/00/01/CiOmUVycLMWAZSp6AAFvkchD04U1035023',99,3,1,31,1),(89,'2019-03-28 02:10:07.588200','2019-03-28 02:10:07.588200',0,'灭草松','为内吸传导型灭生性除草剂',54.00,'120ml/瓶','group1\\M00/00/01/CiOmUVycLP-AP55eAABZnbNcOUs8097153',99,4,1,31,1),(90,'2019-03-28 02:11:49.628156','2019-03-28 02:11:49.628156',0,'异丙基草胺','为内吸传导型灭生性除草剂',15.00,'120ml/瓶','group1\\M00/00/01/CiOmUVycLWWAHTftAABXvLQG-5c3741836',99,10,1,31,1),(91,'2019-03-28 02:16:14.039557','2019-03-28 02:16:14.039557',0,'毒死蜱','杀虫活性很高，主要为触杀和胃毒作用，无内吸和熏蒸活性。',54.00,'500ml/瓶','group1\\M00/00/01/CiOmUVycLm6AbJutAAFP6v9Kx3I0724227',99,23,1,32,2),(92,'2019-03-28 02:17:22.649650','2019-03-28 02:17:22.649650',0,'透皮杀','杀虫谱广，击倒力强，以触杀和胃毒作用为主，无内吸作用，对鳞翅目幼虫很有效',56.00,'35g/包','group1\\M00/00/01/CiOmUVycLrKAX425AACVFu4JDF41440266',99,32,1,32,2),(93,'2019-03-28 02:19:08.629944','2019-03-28 02:19:08.629944',0,'辛硫磷','杀虫活性很高，主要为触杀和胃毒作用，无内吸和熏蒸活性。',52.00,'10g/盒','group1\\M00/00/01/CiOmUVycLxyAN0AJAABeG0M8Hgk6021214',99,2,1,32,2),(94,'2019-03-28 02:20:13.368204','2019-03-28 02:20:13.368204',0,'异丙威','杀虫谱广，击倒力强，以触杀和胃毒作用为主，无内吸作用，对鳞翅目幼虫很有效',87.00,'560g/包','group1\\M00/00/01/CiOmUVycL12AI2FgAACGLM__wTs0862295',99,12,1,32,2),(95,'2019-03-28 02:20:13.709035','2019-03-28 02:20:13.709035',0,'异丙威','杀虫谱广，击倒力强，以触杀和胃毒作用为主，无内吸作用，对鳞翅目幼虫很有效',87.00,'560g/包','group1\\M00/00/01/CiOmUVycL12AerZiAACGLM__wTs3658775',99,12,1,32,2),(96,'2019-03-28 02:21:23.689731','2019-03-28 02:21:23.689731',0,'辛硫磷','杀虫活性很高，主要为触杀和胃毒作用，无内吸和熏蒸活性。',32.00,'10g/盒','group1\\M00/00/01/CiOmUVycL6OAZgsmAABv_RHCYMs8020142',99,12,1,32,2),(97,'2019-03-28 02:25:00.527148','2019-03-28 02:25:00.527148',0,'石硫合剂','防治稻瘟病专用杀菌剂，属于噻唑类。杀菌作用机理主要是抑制附着孢黑色素的形成，从而抑制孢子萌发和附着孢形成，阻止病菌侵人和减少稻瘟病菌孢子的产生。',52.00,'400g/袋','group1\\M00/00/01/CiOmUVycMHyAE5GZAADComa4I905382501',99,23,1,33,3),(98,'2019-03-28 02:25:59.278201','2019-03-28 02:25:59.278201',0,'波尔多液','防治稻瘟病专用杀菌剂，属于噻唑类。杀菌作用机理主要是抑制附着孢黑色素的形成，从而抑制孢子萌发和附着孢形成，阻止病菌侵人和减少稻瘟病菌孢子的产生。',35.00,'350ml/袋','group1\\M00/00/01/CiOmUVycMLeAVUELAACON7hP2w02427395',99,45,1,33,3),(99,'2019-03-28 02:26:43.737559','2019-03-28 02:26:43.737559',0,'石硫合剂','防治稻瘟病专用杀菌剂，属于噻唑类。杀菌作用机理主要是抑制附着孢黑色素的形成，从而抑制孢子萌发和附着孢形成，阻止病菌侵人和减少稻瘟病菌孢子的产生。',45.00,'500ml/瓶','group1\\M00/00/01/CiOmUVycMOOAHItUAAByPD15IWE0192207',99,54,1,33,3),(100,'2019-03-28 02:28:45.458543','2019-03-28 02:28:45.458543',0,'笨醚甲环唑','防治稻瘟病专用杀菌剂，属于噻唑类。杀菌作用机理主要是抑制附着孢黑色素的形成，从而抑制孢子萌发和附着孢形成，阻止病菌侵人和减少稻瘟病菌孢子的产生。',62.00,'100g/袋','group1\\M00/00/01/CiOmUVycMV2AKeBzAACBBre8PP04142303',99,12,1,33,3),(101,'2019-03-28 02:29:55.260057','2019-03-28 02:29:55.260057',0,'敌硫钠','防治稻瘟病专用杀菌剂，属于噻唑类。杀菌作用机理主要是抑制附着孢黑色素的形成，从而抑制孢子萌发和附着孢形成，阻止病菌侵人和减少稻瘟病菌孢子的产生。',96.00,'200g/袋','group1\\M00/00/01/CiOmUVycMaOAR87nAADU0tJXq901493123',99,25,1,32,3),(102,'2019-03-28 02:34:10.847585','2019-03-28 02:34:10.847585',0,'多效唑','植物体内天然合成的植物激素含量甚微，不可能大量提取用于调控植物的生长发育，改善农作物生长',56.00,'10g/盒','group1\\M00/00/01/CiOmUVycMqKAApV0AAB8PqZlu8M7177398',99,25,1,35,5),(103,'2019-03-28 02:37:28.292576','2019-03-28 02:37:28.292576',0,'赤霉酸','植物体内天然合成的植物激素含量甚微，不可能大量提取用于调控植物的生长发育，改善农作物生长',63.00,'120ml/瓶','group1\\M00/00/01/CiOmUVycM2iAYwV1AACZbiwZPtc2867197',99,4,1,35,5),(104,'2019-03-28 02:38:57.637999','2019-03-28 02:38:57.637999',0,'芸苔素内酯','植物体内天然合成的植物激素含量甚微，不可能大量提取用于调控植物的生长发育，改善农作物生长',54.00,'120ml/瓶','group1\\M00/00/01/CiOmUVycM8GAA_70AABH850jdu88637050',99,5,1,35,5),(105,'2019-03-28 02:41:38.083279','2019-03-28 02:41:38.083279',0,'源力素','叶面肥农肥 有效成分： Mn+Zn+B≥10.0%微量元素',45.00,'25g/袋','group1\\M00/00/01/CiOmUVycNGKAKYR_AACM3pdzNr49026866',99,5,1,36,6),(106,'2019-03-28 02:44:13.193749','2019-03-28 02:44:13.193749',0,'花生增产灵','植物体内天然合成的植物激素含量甚微，不可能大量提取用于调控植物的生长发育，改善农作物生长',54.00,'120g/袋','group1\\M00/00/01/CiOmUVycNP2ATW4TAAB06DlTZNE0096716',99,6,1,36,6),(107,'2019-03-28 02:45:13.545991','2019-03-28 02:45:13.545991',0,'地疯','叶面肥农肥 有效成分： Mn+Zn+B≥10.0%微量元素',45.00,'120ml/瓶','group1\\M00/00/01/CiOmUVycNTmAJDdwAABgBSnpY5Q4488283',99,35,1,36,6),(108,'2019-03-28 02:45:59.841718','2019-03-28 02:45:59.841718',0,'天疯','叶面肥农肥 有效成分： Mn+Zn+B≥10.0%微量元素',74.00,'120ml/瓶','group1\\M00/00/01/CiOmUVycNWeAExYfAABiCNE1-844187864',99,53,1,36,6),(109,'2019-03-28 02:46:58.717691','2019-03-28 02:46:58.717691',0,'好麦郎','叶面肥农肥 有效成分： Mn+Zn+B≥10.0%微量元素',56.00,'4000g/袋','group1\\M00/00/01/CiOmUVycNaKALe8bAAB1-PcMOYo5225996',99,41,1,36,6),(110,'2019-03-28 02:47:54.885412','2019-03-28 02:47:54.885412',0,'超级棒','叶面肥农肥 有效成分： Mn+Zn+B≥10.0%微量元素',63.00,'200g/袋','group1\\M00/00/01/CiOmUVycNdqAUx_4AAB7q-vqLHM7966784',99,25,1,36,6),(111,'2019-03-28 02:49:00.232313','2019-03-28 02:49:00.232313',0,'粒粒丰','叶面肥农肥 有效成分： Mn+Zn+B≥10.0%微量元素',85.00,'120ml/瓶','group1\\M00/00/01/CiOmUVycNhyAE3EXAABvTQDIv1w8686362',99,52,1,36,6),(112,'2019-03-28 02:51:45.985449','2019-03-28 02:51:45.985449',0,'三唑锡','杀虫活性很高，主要为触杀和胃毒作用，无内吸和熏蒸活性。',81.00,'120ml/瓶','group1\\M00/00/01/CiOmUVycNsGAW3NuAACG9dw1TQQ0672272',99,2,1,34,4),(113,'2019-03-28 02:53:42.673564','2019-03-28 02:53:42.673564',0,'炔螨特','杀虫活性很高，主要为触杀和胃毒作用，无内吸和熏蒸活性。',52.00,'120ml/瓶','group1\\M00/00/01/CiOmUVycNzaAJuiVAABUlrASPZk0166745',99,12,1,34,4),(114,'2019-03-28 02:55:00.865421','2019-03-28 02:55:00.865421',0,'哒螨灵','杀虫活性很高，主要为触杀和胃毒作用，无内吸和熏蒸活性。',63.00,'120ml/瓶','group1\\M00/00/01/CiOmUVycN4SAIToAAABhnZ5QU-09448174',99,0,1,34,4);
/*!40000 ALTER TABLE `goods_sku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_type`
--

DROP TABLE IF EXISTS `goods_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `name` varchar(20) NOT NULL,
  `logo` varchar(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_type`
--

LOCK TABLES `goods_type` WRITE;
/*!40000 ALTER TABLE `goods_type` DISABLE KEYS */;
INSERT INTO `goods_type` VALUES (1,'2019-03-26 05:06:54.848770','2019-03-26 05:06:54.848770',0,'除草剂','fruit','group1\\M00/00/00/CiOmUVyZs2-AcRpbAAA534UKjLs1104221'),(2,'2019-03-26 05:07:39.488438','2019-03-26 05:07:39.488438',0,'杀虫剂','seafood','group1\\M00/00/00/CiOmUVyZs5uAJBSOAAA44cIWWmI0436976'),(3,'2019-03-26 05:08:03.235842','2019-03-26 05:08:03.235842',0,'杀菌剂','meet','group1\\M00/00/00/CiOmUVyZs7OAPG-3AABaqOOI7Ec5259170'),(4,'2019-03-26 05:08:39.471540','2019-03-26 05:08:39.471540',0,'杀螨剂','egg','group1\\M00/00/00/CiOmUVyZs9eAPQ3HAABpFuUaQos5936358'),(5,'2019-03-26 05:09:05.998515','2019-03-26 05:09:05.998515',0,'调节剂','vegetables','group1\\M00/00/00/CiOmUVyZs_GANp_jAAB8biNdVfA7631228'),(6,'2019-03-26 05:09:22.743893','2019-03-26 05:09:22.743893',0,'叶面肥','ice','group1\\M00/00/00/CiOmUVyZtAKAbZEGAABLKD0k5F45561488');
/*!40000 ALTER TABLE `goods_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_banner`
--

DROP TABLE IF EXISTS `index_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `image` varchar(100) NOT NULL,
  `index` smallint(6) NOT NULL,
  `sku_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_banner_sku_id_b076e8a8_fk_goods_sku_id` (`sku_id`),
  CONSTRAINT `index_banner_sku_id_b076e8a8_fk_goods_sku_id` FOREIGN KEY (`sku_id`) REFERENCES `goods_sku` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_banner`
--

LOCK TABLES `index_banner` WRITE;
/*!40000 ALTER TABLE `index_banner` DISABLE KEYS */;
INSERT INTO `index_banner` VALUES (7,'2019-03-27 03:02:10.992612','2019-03-27 03:02:10.992612',0,'group1\\M00/00/01/CiOmUVya57KAOi2sAAClfFPmqk85263374',0,35),(8,'2019-03-27 03:08:31.493266','2019-03-27 03:08:31.493266',0,'group1\\M00/00/01/CiOmUVya6S-AKhgIAACZ0yfsJ1U1914764',0,35),(13,'2019-03-27 03:11:21.366338','2019-03-27 03:11:21.366338',0,'group1\\M00/00/01/CiOmUVya6dmACDsAAAGpD5V3Ptk6859126',0,41),(14,'2019-03-27 03:12:30.513006','2019-03-27 03:12:30.513006',0,'group1\\M00/00/01/CiOmUVya6h6AaiQeAAH_LstzATY1869425',0,47),(15,'2019-03-27 03:12:40.729913','2019-03-27 03:12:40.729913',0,'group1\\M00/00/01/CiOmUVya6iiAOnCcAACJ8Mfex-s8311668',0,48);
/*!40000 ALTER TABLE `index_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_promotion`
--

DROP TABLE IF EXISTS `index_promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_promotion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `name` varchar(20) NOT NULL,
  `url` varchar(256) NOT NULL,
  `image` varchar(100) NOT NULL,
  `index` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_promotion`
--

LOCK TABLES `index_promotion` WRITE;
/*!40000 ALTER TABLE `index_promotion` DISABLE KEYS */;
/*!40000 ALTER TABLE `index_promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_type_goods`
--

DROP TABLE IF EXISTS `index_type_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_type_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `display_type` smallint(6) NOT NULL,
  `index` smallint(6) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_index_type_goods_sku_id_0a8a17db_fk_goods_sku_id` (`sku_id`),
  KEY `df_index_type_goods_type_id_35192ffd_fk_df_goods_type_id` (`type_id`),
  CONSTRAINT `df_index_type_goods_sku_id_0a8a17db_fk_goods_sku_id` FOREIGN KEY (`sku_id`) REFERENCES `goods_sku` (`id`),
  CONSTRAINT `df_index_type_goods_type_id_35192ffd_fk_df_goods_type_id` FOREIGN KEY (`type_id`) REFERENCES `goods_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_type_goods`
--

LOCK TABLES `index_type_goods` WRITE;
/*!40000 ALTER TABLE `index_type_goods` DISABLE KEYS */;
INSERT INTO `index_type_goods` VALUES (53,'2019-03-27 01:49:58.355814','2019-03-28 01:53:27.978845',0,1,0,52,1),(54,'2019-03-27 01:58:46.708382','2019-03-28 01:52:58.725156',0,1,0,53,1),(55,'2019-03-27 02:01:00.787290','2019-03-28 01:52:19.453121',0,1,0,54,1),(56,'2019-03-27 02:03:05.434053','2019-03-28 01:51:22.486426',0,1,0,55,1),(57,'2019-03-27 02:06:43.050398','2019-03-28 01:50:01.673397',0,1,0,56,2),(58,'2019-03-27 02:09:20.642561','2019-03-27 02:09:20.642561',0,1,0,57,2),(59,'2019-03-27 02:11:22.180409','2019-03-28 01:46:55.101263',0,1,0,58,2),(60,'2019-03-27 02:13:37.143542','2019-03-28 01:44:56.875925',0,1,0,59,2),(61,'2019-03-27 02:17:39.761594','2019-03-28 01:43:34.995924',0,1,0,60,3),(62,'2019-03-27 02:20:05.076134','2019-03-28 01:42:21.279000',0,1,0,61,3),(63,'2019-03-27 02:21:44.757826','2019-03-28 01:41:41.381633',0,1,0,62,3),(64,'2019-03-27 02:23:33.882467','2019-03-28 01:39:58.531635',0,1,0,63,3),(65,'2019-03-27 02:26:21.444554','2019-03-28 01:38:58.739139',0,1,0,64,4),(66,'2019-03-27 02:28:45.752280','2019-03-27 02:28:45.752280',0,1,0,65,4),(67,'2019-03-27 02:31:07.636468','2019-03-28 01:37:20.795735',0,1,0,66,4),(68,'2019-03-27 02:34:10.597349','2019-03-28 01:36:04.225545',0,1,0,67,4),(69,'2019-03-27 02:38:10.076095','2019-03-28 01:34:55.362293',0,1,0,68,5),(70,'2019-03-27 02:39:48.101230','2019-03-28 01:34:28.630594',0,1,0,69,5),(71,'2019-03-27 02:42:22.742425','2019-03-28 01:32:10.511617',0,1,0,70,5),(72,'2019-03-27 02:43:58.838941','2019-03-28 01:30:32.876780',0,1,0,71,5),(73,'2019-03-27 02:50:54.296827','2019-03-28 01:29:28.357117',0,1,0,72,6),(74,'2019-03-27 02:52:34.353269','2019-03-28 01:28:23.836305',0,1,0,73,6),(75,'2019-03-27 02:53:45.776223','2019-03-28 01:27:17.732988',0,1,0,74,6),(76,'2019-03-27 02:55:38.399225','2019-03-28 01:26:18.233707',0,1,0,75,6),(77,'2019-03-27 03:04:45.164150','2019-03-28 07:52:28.616003',0,0,0,35,1),(78,'2019-03-27 03:05:13.878085','2019-03-28 07:55:35.655273',0,0,0,36,1),(79,'2019-03-27 03:05:19.793407','2019-03-28 07:56:32.999804',0,0,0,37,1),(80,'2019-03-27 03:05:27.771312','2019-03-28 07:57:49.054961',0,0,0,38,2),(81,'2019-03-27 03:07:51.144475','2019-03-27 03:07:51.144475',0,0,0,55,1),(82,'2019-03-27 03:08:24.825554','2019-03-28 01:47:43.945580',0,0,0,57,2),(83,'2019-03-27 03:08:50.464747','2019-03-27 03:08:50.464747',0,0,0,58,2),(84,'2019-03-27 03:09:15.416357','2019-03-27 03:09:15.416357',0,0,0,59,2),(85,'2019-03-27 03:09:38.369876','2019-03-27 03:09:38.369876',0,0,0,60,3),(86,'2019-03-27 03:10:02.855701','2019-03-27 03:10:02.855701',0,0,0,61,3),(87,'2019-03-27 03:10:12.539412','2019-03-27 03:10:12.539412',0,0,0,62,3),(88,'2019-03-27 03:10:21.093927','2019-03-27 03:10:21.093927',0,0,0,63,3),(89,'2019-03-27 03:10:59.239958','2019-03-27 03:10:59.239958',0,0,0,64,4),(90,'2019-03-27 03:11:08.790268','2019-03-28 01:38:21.054960',0,0,0,65,4),(91,'2019-03-27 03:11:18.118804','2019-03-27 03:11:18.118804',0,0,0,66,4),(92,'2019-03-27 03:11:28.669909','2019-03-27 03:11:28.669909',0,0,0,67,4),(93,'2019-03-27 03:12:03.992838','2019-03-27 03:12:03.992838',0,0,0,68,5),(94,'2019-03-27 03:12:12.129443','2019-03-27 03:12:12.129443',0,0,0,69,5),(95,'2019-03-27 03:12:21.081986','2019-03-27 03:12:21.081986',0,0,0,70,5),(96,'2019-03-27 03:12:30.197103','2019-03-27 03:12:30.197103',0,0,0,71,5),(97,'2019-03-27 03:13:13.160215','2019-03-27 03:13:13.161212',0,0,0,72,6),(98,'2019-03-27 03:13:20.461843','2019-03-27 03:13:20.461843',0,0,0,73,6),(99,'2019-03-27 03:13:27.784616','2019-03-27 03:13:27.784616',0,0,0,74,6),(100,'2019-03-27 03:13:35.708332','2019-03-27 03:13:35.708332',0,0,0,75,6);
/*!40000 ALTER TABLE `index_type_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_goods`
--

DROP TABLE IF EXISTS `order_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `count` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `comment` varchar(256) NOT NULL,
  `order_id` varchar(128) NOT NULL,
  `sku_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_goods_order_id_8841e90f_fk_order_info_order_id` (`order_id`),
  KEY `order_goods_sku_id_3e09276e_fk_goods_sku_id` (`sku_id`),
  CONSTRAINT `order_goods_order_id_8841e90f_fk_order_info_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_info` (`order_id`),
  CONSTRAINT `order_goods_sku_id_3e09276e_fk_goods_sku_id` FOREIGN KEY (`sku_id`) REFERENCES `goods_sku` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_goods`
--

LOCK TABLES `order_goods` WRITE;
/*!40000 ALTER TABLE `order_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_info`
--

DROP TABLE IF EXISTS `order_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_info` (
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `order_id` varchar(128) NOT NULL,
  `pay_method` smallint(6) NOT NULL,
  `total_count` int(11) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `transit_price` decimal(10,2) NOT NULL,
  `order_status` smallint(6) NOT NULL,
  `trade_no` varchar(128) NOT NULL,
  `addr_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `order_info_addr_id_02844808_fk_address_id` (`addr_id`),
  KEY `order_info_user_id_f2004c3f_fk_user_id` (`user_id`),
  CONSTRAINT `order_info_addr_id_02844808_fk_address_id` FOREIGN KEY (`addr_id`) REFERENCES `address` (`id`),
  CONSTRAINT `order_info_user_id_f2004c3f_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_info`
--

LOCK TABLES `order_info` WRITE;
/*!40000 ALTER TABLE `order_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (15,'pbkdf2_sha256$100000$8WvxcnSiW3pc$imWurrVN6B/TSjGEts2mbtwhpXGPuNEJqOGFDVjmo9M=','2019-03-30 03:11:01.899090',0,'huiyichanmian','','','huiyichanmian@yeah.net',0,1,'2019-03-21 06:54:52.506185','2019-03-21 06:54:52.634868','2019-03-21 06:55:01.088366',0),(16,'pbkdf2_sha256$100000$PHfinD1DFZ1e$z+ZyFex8UEr2pnYphKVZJEIIz2TgwwMSrEu0WRaI/K0=','2019-03-30 02:52:40.003299',1,'admin','','','',1,1,'2019-03-25 09:45:43.395125','2019-03-25 09:45:43.529800','2019-03-25 09:45:43.529800',0),(26,'pbkdf2_sha256$100000$iMdHwfzsuCHf$B9alZ1Rc5WcI7VfAU5A22pdcDBb+8E9u9ZvRy99Hqzg=',NULL,0,'mei0225','','','meigang0225@163.com',0,0,'2019-03-30 02:06:14.688942','2019-03-30 02:06:14.890953','2019-03-30 02:06:15.316978',0),(27,'pbkdf2_sha256$100000$suHyIHnI4tO0$G+QS0vpUFFuZqIPEmOSSb3adM9FdPBNj37WBgBf3Dcw=',NULL,0,'1887415157','','','meigang0225@163.com',0,0,'2019-03-30 02:40:05.278236','2019-03-30 02:40:05.404956','2019-03-30 02:40:05.584491',0),(28,'pbkdf2_sha256$100000$vCpW2CGx7ojt$q41sfT9TXfQkT/HkpDPLw1oEyOMhOpjW7YNTj9QjWZs=',NULL,0,'令狐冲123','','','meigang0225@163.com',0,0,'2019-03-30 02:47:27.836942','2019-03-30 02:47:28.017465','2019-03-30 02:47:28.055970',0),(29,'pbkdf2_sha256$100000$BKqokg5Xf41n$U2JnDpEeR04vpoktrwhhhu5Pd59jjwkBFXQZmCcASmQ=',NULL,0,'张无忌11','','','meigang0225@163.com',0,0,'2019-03-30 02:48:35.465779','2019-03-30 02:48:35.596844','2019-03-30 02:48:35.694157',0),(30,'pbkdf2_sha256$100000$FvUE2R7s0V4O$2afHy0vb1NM2cIAej8oVvDSrym1p0avkYfSgovFg/UA=',NULL,0,'张无忌1122','','','meigang0225@163.com',0,0,'2019-03-30 02:48:46.547006','2019-03-30 02:48:46.674514','2019-03-30 02:48:46.713554',0),(31,'pbkdf2_sha256$100000$WKc3RRgbwUM6$cdOG1ZV2ghLWMcpTvolNd6AGv/csVMMP3WvHqDsVmHU=',NULL,0,'meigang','','','meigang0225@163.com',0,0,'2019-03-30 02:50:40.915727','2019-03-30 02:50:41.056464','2019-03-30 02:50:41.177488',0),(32,'pbkdf2_sha256$100000$dxQGBToyaWKO$W8T6zQkzlkI7V0RtL02akP+3k2mdVwS/GRIhHzRhxqA=',NULL,0,'meigang01','','','meigang0225@163.com',0,0,'2019-03-30 03:12:24.405552','2019-03-30 03:12:24.530548','2019-03-30 03:12:24.656672',0),(33,'pbkdf2_sha256$100000$AR7oxwS07i3N$9lIx8/CB2mMYUOp9SZKH2vOl3Z8PUta5cz50bu7sv6A=',NULL,0,'aaaaaa','','','15117254920@163.com',0,0,'2019-03-30 03:26:34.989892','2019-03-30 03:26:35.115306','2019-03-30 03:26:35.232789',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_groups`
--

DROP TABLE IF EXISTS `user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_groups_user_id_group_id_40beef00_uniq` (`user_id`,`group_id`),
  KEY `user_groups_group_id_b76f8aba_fk_auth_group_id` (`group_id`),
  CONSTRAINT `user_groups_group_id_b76f8aba_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_groups_user_id_abaea130_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_groups`
--

LOCK TABLES `user_groups` WRITE;
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user_permissions`
--

DROP TABLE IF EXISTS `user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_user_permissions_user_id_permission_id_7dc6e2e0_uniq` (`user_id`,`permission_id`),
  KEY `user_user_permission_permission_id_9deb68a3_fk_auth_perm` (`permission_id`),
  CONSTRAINT `user_user_permission_permission_id_9deb68a3_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_user_permissions_user_id_ed4a47ea_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user_permissions`
--

LOCK TABLES `user_user_permissions` WRITE;
/*!40000 ALTER TABLE `user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-30 11:42:50
