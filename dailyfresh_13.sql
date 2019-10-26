-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: dailyfresh_13
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.16.04.1

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
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group__permission_id_108f3cccbeb117ab_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group__permission_id_108f3cccbeb117ab_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permission_group_id_2eea31d7f3366eb6_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
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
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth__content_type_id_2112b8320d5381ac_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add user',6,'add_user'),(17,'Can change user',6,'change_user'),(18,'Can delete user',6,'delete_user'),(19,'Can add address',7,'add_address'),(20,'Can change address',7,'change_address'),(21,'Can delete address',7,'delete_address'),(22,'Can add 商品类别',8,'add_goodscategory'),(23,'Can change 商品类别',8,'change_goodscategory'),(24,'Can delete 商品类别',8,'delete_goodscategory'),(25,'Can add 商品',9,'add_goods'),(26,'Can change 商品',9,'change_goods'),(27,'Can delete 商品',9,'delete_goods'),(28,'Can add 商品SKU',10,'add_goodssku'),(29,'Can change 商品SKU',10,'change_goodssku'),(30,'Can delete 商品SKU',10,'delete_goodssku'),(31,'Can add 商品图片',11,'add_goodsimage'),(32,'Can change 商品图片',11,'change_goodsimage'),(33,'Can delete 商品图片',11,'delete_goodsimage'),(34,'Can add 主页轮播商品',12,'add_indexgoodsbanner'),(35,'Can change 主页轮播商品',12,'change_indexgoodsbanner'),(36,'Can delete 主页轮播商品',12,'delete_indexgoodsbanner'),(37,'Can add 主页分类展示商品',13,'add_indexcategorygoodsbanner'),(38,'Can change 主页分类展示商品',13,'change_indexcategorygoodsbanner'),(39,'Can delete 主页分类展示商品',13,'delete_indexcategorygoodsbanner'),(40,'Can add 主页促销活动',14,'add_indexpromotionbanner'),(41,'Can change 主页促销活动',14,'change_indexpromotionbanner'),(42,'Can delete 主页促销活动',14,'delete_indexpromotionbanner'),(43,'Can add order info',15,'add_orderinfo'),(44,'Can change order info',15,'change_orderinfo'),(45,'Can delete order info',15,'delete_orderinfo'),(46,'Can add order goods',16,'add_ordergoods'),(47,'Can change order goods',16,'change_ordergoods'),(48,'Can delete order goods',16,'delete_ordergoods');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `celery_taskmeta`
--

DROP TABLE IF EXISTS `celery_taskmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `celery_taskmeta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL,
  `result` longtext,
  `date_done` datetime(6) NOT NULL,
  `traceback` longtext,
  `hidden` tinyint(1) NOT NULL,
  `meta` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`),
  KEY `celery_taskmeta_662f707d` (`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `celery_taskmeta`
--

LOCK TABLES `celery_taskmeta` WRITE;
/*!40000 ALTER TABLE `celery_taskmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `celery_taskmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `celery_tasksetmeta`
--

DROP TABLE IF EXISTS `celery_tasksetmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `celery_tasksetmeta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskset_id` varchar(255) NOT NULL,
  `result` longtext NOT NULL,
  `date_done` datetime(6) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taskset_id` (`taskset_id`),
  KEY `celery_tasksetmeta_662f707d` (`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `celery_tasksetmeta`
--

LOCK TABLES `celery_tasksetmeta` WRITE;
/*!40000 ALTER TABLE `celery_tasksetmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `celery_tasksetmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_address`
--

DROP TABLE IF EXISTS `df_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `df_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `receiver_name` varchar(20) NOT NULL,
  `receiver_mobile` varchar(11) NOT NULL,
  `detail_addr` varchar(256) NOT NULL,
  `zip_code` varchar(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_address_user_id_527941f52805fde2_fk_df_users_id` (`user_id`),
  CONSTRAINT `df_address_user_id_527941f52805fde2_fk_df_users_id` FOREIGN KEY (`user_id`) REFERENCES `df_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_address`
--

LOCK TABLES `df_address` WRITE;
/*!40000 ALTER TABLE `df_address` DISABLE KEYS */;
INSERT INTO `df_address` VALUES (1,'2017-10-30 02:48:11.387291','2017-10-30 02:48:11.387427','zb','18001225173','淮南师范学院','123456',1),(2,'2019-09-16 13:18:46.433029','2019-09-16 13:18:46.433165','xiaohei','18001225176','上海市浦东新区','123456',4),(3,'2019-09-29 14:41:03.012739','2019-09-29 14:41:03.013450','往','12323233789','12321323','23232',5);
/*!40000 ALTER TABLE `df_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_goods`
--

DROP TABLE IF EXISTS `df_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `df_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  `desc` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_goods`
--

LOCK TABLES `df_goods` WRITE;
/*!40000 ALTER TABLE `df_goods` DISABLE KEYS */;
INSERT INTO `df_goods` VALUES (1,'2017-10-16 03:03:05.257969','2017-10-16 03:03:05.258130','草莓','<p><strong>很不错的草莓</strong></p>'),(2,'2017-10-16 03:05:36.964951','2017-10-16 03:05:36.965129','葡萄',''),(3,'2017-10-16 03:05:52.323866','2017-10-16 03:05:52.323949','柠檬',''),(4,'2017-10-16 03:06:01.267481','2017-10-16 03:06:01.267615','奇异果',''),(5,'2017-10-16 03:06:30.418683','2017-10-16 03:06:30.418789','大青虾',''),(6,'2017-10-16 03:06:35.994464','2017-10-16 03:06:35.994567','秋刀鱼',''),(7,'2017-10-16 03:06:48.115318','2017-10-16 03:06:48.115410','扇贝',''),(8,'2017-10-16 03:07:03.057514','2017-10-16 03:07:03.057601','基围虾',''),(9,'2017-10-16 03:07:36.306725','2017-10-16 03:07:36.306926','猪肉',''),(10,'2017-10-16 03:07:39.056064','2017-10-16 03:07:39.056145','牛肉',''),(11,'2017-10-16 03:07:41.955755','2017-10-16 03:07:41.955833','羊肉',''),(12,'2017-10-16 03:07:44.741474','2017-10-16 03:07:44.741574','牛排',''),(13,'2017-10-16 03:07:51.748699','2017-10-16 03:07:51.748828','鸡蛋',''),(14,'2017-10-16 03:07:56.413773','2017-10-16 03:07:56.413853','鸡肉',''),(15,'2017-10-16 03:07:59.568405','2017-10-16 03:07:59.568554','鸭蛋',''),(16,'2017-10-16 03:08:03.020608','2017-10-16 03:08:03.020764','鸡腿',''),(17,'2017-10-16 03:08:10.063820','2017-10-16 03:08:10.063898','白菜',''),(18,'2017-10-16 03:08:13.315906','2017-10-16 03:08:13.316025','芹菜',''),(19,'2017-10-16 03:08:16.351445','2017-10-16 03:08:16.351526','香菜',''),(20,'2017-10-16 03:08:24.232660','2017-10-16 03:08:24.232743','冬瓜',''),(21,'2017-10-16 03:08:36.939678','2017-10-16 03:08:36.940113','鱼丸',''),(22,'2017-10-16 03:08:43.194862','2017-10-16 03:08:43.194985','蟹棒',''),(23,'2017-10-16 03:08:50.771785','2017-10-16 03:08:50.771931','虾丸',''),(24,'2017-10-16 03:09:01.546052','2017-10-16 03:09:01.546152','速冻水饺','');
/*!40000 ALTER TABLE `df_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_goods_category`
--

DROP TABLE IF EXISTS `df_goods_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `df_goods_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `name` varchar(20) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_goods_category`
--

LOCK TABLES `df_goods_category` WRITE;
/*!40000 ALTER TABLE `df_goods_category` DISABLE KEYS */;
INSERT INTO `df_goods_category` VALUES (1,'2017-10-16 03:00:01.655105','2017-10-16 03:00:01.655201','新鲜水果','fruit','group1/M00/00/00/CtM3BVnkILGACHh0AAAmv27pX4k2790330'),(2,'2017-10-16 03:00:26.853310','2017-10-16 03:00:26.853397','海鲜水产','seafood','group1/M00/00/00/CtM3BVnkIMqAW9MwAABHr3RQqFs8076962'),(3,'2017-10-16 03:00:41.396890','2017-10-16 03:00:41.397121','猪牛羊肉','meet','group1/M00/00/00/CtM3BVnkINmAEIKKAAAy1Tlm9So4047150'),(4,'2017-10-16 03:00:55.190135','2017-10-16 03:00:55.190223','禽类蛋品','egg','group1/M00/00/00/CtM3BVnkIOeAG0B6AAAqR4DoSUg1061194'),(5,'2017-10-16 03:01:24.116307','2017-10-16 03:01:24.116640','新鲜蔬菜','vegetables','group1/M00/00/00/CtM3BVnkIQSARC1UAAA-0ZoYkpM7754350'),(6,'2017-10-16 03:01:54.662968','2017-10-16 03:01:54.663066','速冻食品','ice','group1/M00/00/00/CtM3BVnkISKAJwJqAAA3sZPrVzQ4838643');
/*!40000 ALTER TABLE `df_goods_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_goods_image`
--

DROP TABLE IF EXISTS `df_goods_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `df_goods_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `image` varchar(100) NOT NULL,
  `sku_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_goods_image_22ad5bca` (`sku_id`),
  CONSTRAINT `df_goods_image_sku_id_75ce8a33cdb24519_fk_df_goods_sku_id` FOREIGN KEY (`sku_id`) REFERENCES `df_goods_sku` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_goods_image`
--

LOCK TABLES `df_goods_image` WRITE;
/*!40000 ALTER TABLE `df_goods_image` DISABLE KEYS */;
INSERT INTO `df_goods_image` VALUES (1,'2017-10-16 03:26:50.235040','2017-10-16 03:26:50.235119','group1/M00/00/01/CtM3BVnkJvqARg4OAAAm3lfXL-Q4989750',1),(2,'2017-10-16 03:26:58.043760','2017-10-16 03:26:58.043856','group1/M00/00/01/CtM3BVnkJwKAMbGgAAAm3lfXL-Q2310134',2);
/*!40000 ALTER TABLE `df_goods_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_goods_sku`
--

DROP TABLE IF EXISTS `df_goods_sku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `df_goods_sku` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  `title` varchar(200) NOT NULL,
  `unit` varchar(10) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `sales` int(11) NOT NULL,
  `default_image` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `category_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_goods_sku_category_id_c87ff048768edce_fk_df_goods_category_id` (`category_id`),
  KEY `df_goods_sku_goods_id_65edd041dfc86646_fk_df_goods_id` (`goods_id`),
  CONSTRAINT `df_goods_sku_category_id_c87ff048768edce_fk_df_goods_category_id` FOREIGN KEY (`category_id`) REFERENCES `df_goods_category` (`id`),
  CONSTRAINT `df_goods_sku_goods_id_65edd041dfc86646_fk_df_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `df_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_goods_sku`
--

LOCK TABLES `df_goods_sku` WRITE;
/*!40000 ALTER TABLE `df_goods_sku` DISABLE KEYS */;
INSERT INTO `df_goods_sku` VALUES (1,'2017-10-16 03:10:14.045538','2019-03-26 14:42:11.788430','草莓 500g','草莓简介','500g',10.00,83,16,'group1/M00/00/00/CtM3BVnkIxaAR7GHAAAljHPuXJg5431541',1,1,1),(2,'2017-10-16 03:11:04.490384','2017-10-16 03:11:04.490462','盒装草莓','草莓简介','盒',20.00,10,0,'group1/M00/00/00/CtM3BVnkI0iAUprjAAAljHPuXJg5371806',1,1,1),(3,'2017-10-16 03:12:32.165020','2019-03-30 08:38:31.202804','葡萄','葡萄简介','500g',20.00,96,39,'group1/M00/00/00/CtM3BVnkI6CAURm4AAAjjiYTEkw1194059',1,1,2),(4,'2017-10-16 03:13:16.457844','2017-10-16 03:13:16.457926','柠檬','简介','500g',32.00,2,10,'group1/M00/00/00/CtM3BVnkI8yAHR3YAAAgnaeGwNQ6779834',1,1,3),(5,'2017-10-16 03:14:05.799352','2017-10-16 03:14:05.799588','奇异果','简介','500g',12.12,3,9,'group1/M00/00/00/CtM3BVnkI_2AToqyAAAeuLYy0pU9946037',1,1,4),(6,'2017-10-16 03:15:09.971968','2019-03-16 07:23:35.649920','大青虾','简介','500g',34.00,109,2,'group1/M00/00/00/CtM3BVnkJD2AQx9zAAAk0DN4-yE8467862',1,2,5),(7,'2017-10-16 03:15:53.812181','2019-03-30 07:20:22.709046','北海道秋刀鱼','简介','500g',50.00,10,6,'group1/M00/00/00/CtM3BVnkJGmAecHxAAAkaP_7_181619603',1,2,6),(8,'2017-10-16 03:16:24.763232','2017-10-16 03:16:24.763324','扇贝','简介','500g',56.60,12,1,'group1/M00/00/00/CtM3BVnkJIiAd8kxAAAk8WCqqmI1965678',1,2,7),(9,'2017-10-16 03:17:13.426611','2017-10-16 03:17:13.426790','基围虾','简介','500g',100.90,14,0,'group1/M00/00/00/CtM3BVnkJLmAI1K-AAAkaP_7_189355042',1,2,8),(10,'2017-10-16 03:17:47.656066','2017-10-16 03:17:47.656152','猪肉','简介','500g',23.99,100,0,'group1/M00/00/00/CtM3BVnkJNuADLYAAAAWnwO6wpU7499459',1,3,9),(11,'2017-10-16 03:18:15.497630','2017-10-16 03:18:15.497764','牛肉','简介','500g',34.99,99,1,'group1/M00/00/00/CtM3BVnkJPeAc2aGAAAcLRyfMSc4681259',1,3,10),(12,'2017-10-16 03:18:44.453933','2017-10-16 03:18:44.454010','羊肉','简介','500g',56.99,99,1,'group1/M00/00/00/CtM3BVnkJRSAXMuGAAAgbU6nbaA2977481',1,3,11),(13,'2017-10-16 03:19:10.209472','2017-10-16 03:19:10.209556','牛排','简介','500g',99.99,98,2,'group1/M00/00/00/CtM3BVnkJS6AVSDWAAAgrKNKuOg9088924',1,3,12),(14,'2017-10-16 03:19:44.020204','2017-10-16 03:19:44.020284','盒装鸡蛋','简介','500g',23.00,100,0,'group1/M00/00/00/CtM3BVnkJVCAFDKSAAAk8WCqqmI8466582',1,4,13),(15,'2017-10-16 03:20:20.962831','2017-10-16 03:20:20.963038','鸡肉','简介','500g',32.00,100,0,'group1/M00/00/00/CtM3BVnkJXSAXbesAAAiQjDS7wA8116965',1,4,14),(16,'2017-10-16 03:20:53.724305','2017-10-16 03:20:53.724397','鸭蛋','简介','盒',45.00,121,0,'group1/M00/00/00/CtM3BVnkJZWAIwBOAAAiQjDS7wA4382174',1,4,15),(17,'2017-10-16 03:21:22.965398','2017-10-16 03:21:22.965474','鸡腿','简介','500g',45.00,12,0,'group1/M00/00/00/CtM3BVnkJbKADk2yAAAWnwO6wpU5481130',1,4,16),(18,'2017-10-16 03:22:04.462490','2017-10-16 03:22:04.462571','白菜','简介','500g',4.50,100,0,'group1/M00/00/00/CtM3BVnkJdyAKycGAAAaabPqzqc6717404',1,5,17),(19,'2017-10-16 03:22:31.745392','2017-10-16 03:22:31.745499','芹菜','简介','500g',3.50,12,0,'group1/M00/00/00/CtM3BVnkJfeAVv-jAAAjjiYTEkw8506724',1,5,18),(20,'2017-10-16 03:23:21.161526','2017-10-16 03:23:21.162070','香菜','简介','500g',7.90,100,0,'group1/M00/00/00/CtM3BVnkJimAEK7MAAAcLRyfMSc6464688',1,5,19),(21,'2017-10-16 03:23:46.986158','2017-10-16 03:23:46.986234','冬瓜','简介','500g',12.99,100,0,'group1/M00/00/00/CtM3BVnkJkKAQdJrAAAhst2hSFQ6848699',1,5,20),(22,'2017-10-16 03:24:10.445214','2017-10-16 03:24:10.445291','鱼丸','简介','500g',66.00,12,0,'group1/M00/00/01/CtM3BVnkJlqAePKjAAAcLRyfMSc8759431',1,6,21),(23,'2017-10-16 03:24:37.927158','2017-10-16 03:24:37.927235','蟹棒','简介','500g',68.00,100,0,'group1/M00/00/01/CtM3BVnkJnWAUV_LAAAljHPuXJg1247606',1,6,22),(24,'2017-10-16 03:25:18.235816','2017-10-16 03:25:18.235901','虾丸','简介','500g',89.99,100,0,'group1/M00/00/01/CtM3BVnkJp6AHVPPAAAZxC0XRLc2377246',1,6,23),(25,'2017-10-16 03:25:56.170531','2017-10-16 03:25:56.170611','速冻水饺','简介','袋',20.00,100,0,'group1/M00/00/01/CtM3BVnkJsSAYntSAAAcLRyfMSc1347281',1,6,24);
/*!40000 ALTER TABLE `df_goods_sku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_index_category_goods`
--

DROP TABLE IF EXISTS `df_index_category_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `df_index_category_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `display_type` smallint(6) NOT NULL,
  `index` smallint(6) NOT NULL,
  `category_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_index_cat_category_id_19bdee5083c88d5_fk_df_goods_category_id` (`category_id`),
  KEY `df_index_category_goo_sku_id_5a1bd13e4d7c3156_fk_df_goods_sku_id` (`sku_id`),
  CONSTRAINT `df_index_cat_category_id_19bdee5083c88d5_fk_df_goods_category_id` FOREIGN KEY (`category_id`) REFERENCES `df_goods_category` (`id`),
  CONSTRAINT `df_index_category_goo_sku_id_5a1bd13e4d7c3156_fk_df_goods_sku_id` FOREIGN KEY (`sku_id`) REFERENCES `df_goods_sku` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_index_category_goods`
--

LOCK TABLES `df_index_category_goods` WRITE;
/*!40000 ALTER TABLE `df_index_category_goods` DISABLE KEYS */;
INSERT INTO `df_index_category_goods` VALUES (1,'2017-10-16 03:33:46.743381','2017-10-16 03:33:46.743473',1,0,1,1),(2,'2017-10-16 03:33:57.241666','2017-10-16 03:33:57.241795',1,1,1,3),(3,'2017-10-16 03:34:09.716055','2017-10-16 03:34:09.716135',1,3,1,4),(4,'2017-10-16 03:34:49.901895','2017-10-16 03:34:49.902017',1,2,1,5),(5,'2017-10-16 03:35:07.990622','2017-10-16 03:35:07.990702',0,0,1,3),(6,'2017-10-16 03:35:18.892346','2017-10-16 03:35:18.892427',0,1,1,2),(7,'2017-10-16 03:35:28.860398','2017-10-16 03:35:28.860473',1,0,2,6),(8,'2017-10-16 03:35:45.966738','2017-10-16 03:35:45.966841',1,1,2,7),(9,'2017-10-16 03:35:55.209654','2017-10-16 03:35:55.209735',1,2,2,7),(10,'2017-10-16 03:36:05.106142','2017-10-16 03:36:05.106274',1,2,2,8),(11,'2017-10-16 03:36:15.971654','2017-10-16 03:36:15.971736',1,3,2,9),(12,'2017-10-16 03:36:24.626355','2017-10-16 03:36:24.626430',0,0,2,8),(13,'2017-10-16 03:36:40.897798','2017-10-16 03:36:40.897887',0,1,2,9),(14,'2017-10-16 03:37:11.911978','2017-10-16 03:37:11.912057',1,0,3,10),(15,'2017-10-16 03:37:24.784141','2017-10-16 03:37:24.784249',1,1,3,11),(16,'2017-10-16 03:37:33.887044','2017-10-16 03:37:33.887126',1,2,3,12),(17,'2017-10-16 04:06:16.091371','2017-10-16 04:06:16.091567',1,3,3,13),(18,'2017-10-16 04:06:57.562512','2017-10-16 04:06:57.562601',0,0,3,12),(19,'2017-10-16 04:07:05.412979','2017-10-16 04:07:05.413066',0,1,3,11),(20,'2017-10-16 04:07:17.042627','2017-10-16 04:07:17.042708',1,0,4,14),(21,'2017-10-16 04:07:25.607347','2017-10-16 04:07:25.607439',1,1,4,15),(22,'2017-10-16 04:07:37.327826','2017-10-16 04:07:37.327903',1,2,4,16),(23,'2017-10-16 04:07:46.115468','2017-10-16 04:07:46.115679',1,3,4,17),(24,'2017-10-16 04:07:58.518953','2017-10-16 04:07:58.519085',0,0,4,15),(25,'2017-10-16 04:08:08.603445','2017-10-16 04:08:08.603576',1,0,5,18),(26,'2017-10-16 04:08:20.212045','2017-10-16 04:08:20.212207',1,1,5,19),(27,'2017-10-16 04:08:27.535621','2017-10-16 04:08:27.535700',1,2,5,20),(28,'2017-10-16 04:08:41.184969','2017-10-16 04:08:41.185046',1,3,5,21),(29,'2017-10-16 04:08:48.173697','2017-10-16 04:08:48.174095',0,0,5,21),(30,'2017-10-16 04:08:57.442308','2017-10-16 04:08:57.442389',1,0,6,22),(31,'2017-10-16 04:09:06.721210','2017-10-16 04:09:06.721292',1,1,6,23),(32,'2017-10-16 04:09:16.107585','2017-10-16 04:09:16.108236',1,2,6,24),(33,'2017-10-16 04:09:23.550951','2017-10-16 04:09:23.551031',1,3,6,25),(34,'2017-10-16 04:09:30.560733','2017-10-16 04:09:30.560816',0,0,6,23),(35,'2017-10-16 04:09:38.751619','2017-10-16 04:09:38.751712',0,1,6,22);
/*!40000 ALTER TABLE `df_index_category_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_index_goods`
--

DROP TABLE IF EXISTS `df_index_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `df_index_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `image` varchar(100) NOT NULL,
  `index` smallint(6) NOT NULL,
  `sku_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_index_goods_sku_id_59fb549b9bbac669_fk_df_goods_sku_id` (`sku_id`),
  CONSTRAINT `df_index_goods_sku_id_59fb549b9bbac669_fk_df_goods_sku_id` FOREIGN KEY (`sku_id`) REFERENCES `df_goods_sku` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_index_goods`
--

LOCK TABLES `df_index_goods` WRITE;
/*!40000 ALTER TABLE `df_index_goods` DISABLE KEYS */;
INSERT INTO `df_index_goods` VALUES (1,'2017-10-16 03:27:56.534441','2017-10-16 03:27:56.534522','group1/M00/00/01/CtM3BVnkJzyASv1nAACpB-LsCdE4728457',0,3),(2,'2017-10-16 03:28:10.145716','2017-10-16 03:28:10.145795','group1/M00/00/01/CtM3BVnkJ0qARP2PAAC3B-z8J2c2451336',1,5),(3,'2017-10-16 03:28:30.520445','2017-10-16 03:28:30.520521','group1/M00/00/01/CtM3BVnkJ16AWegCAAETwXb_pso1012026',2,10),(4,'2017-10-16 03:32:40.934947','2017-10-16 03:32:40.935037','group1/M00/00/01/CtM3BVnkKFiAXsNcAAD0akkXmFo4487232',3,6);
/*!40000 ALTER TABLE `df_index_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_index_promotion`
--

DROP TABLE IF EXISTS `df_index_promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `df_index_promotion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `name` varchar(50) NOT NULL,
  `url` varchar(200) NOT NULL,
  `image` varchar(100) NOT NULL,
  `index` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_index_promotion`
--

LOCK TABLES `df_index_promotion` WRITE;
/*!40000 ALTER TABLE `df_index_promotion` DISABLE KEYS */;
INSERT INTO `df_index_promotion` VALUES (1,'2017-10-16 02:57:52.707965','2017-10-16 06:16:43.461496','吃货暑假趴','http://www.itcast.cn','group1/M00/00/00/CtM3BVnkIDGATx4aAAA2pLUeB600278858',1),(2,'2017-10-16 02:58:21.916410','2017-10-16 06:16:32.600365','盛夏尝鲜季','http://www.itheima.com','group1/M00/00/00/CtM3BVnkIE6AA2o8AAA98yvCs1I9520126',0);
/*!40000 ALTER TABLE `df_index_promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_order_goods`
--

DROP TABLE IF EXISTS `df_order_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `df_order_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `count` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `comment` longtext NOT NULL,
  `order_id` varchar(64) NOT NULL,
  `sku_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_order_goods_69dfcb07` (`order_id`),
  KEY `df_order_goods_22ad5bca` (`sku_id`),
  CONSTRAINT `df_order_good_order_id_77ec5fc7b4685dd_fk_df_order_info_order_id` FOREIGN KEY (`order_id`) REFERENCES `df_order_info` (`order_id`),
  CONSTRAINT `df_order_goods_sku_id_13aab4aa65d9bf73_fk_df_goods_sku_id` FOREIGN KEY (`sku_id`) REFERENCES `df_goods_sku` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_order_goods`
--

LOCK TABLES `df_order_goods` WRITE;
/*!40000 ALTER TABLE `df_order_goods` DISABLE KEYS */;
INSERT INTO `df_order_goods` VALUES (18,'2018-11-14 13:17:19.311981','2018-11-14 13:17:19.312023',1,20.00,'','201811141317191',3),(19,'2018-11-14 13:42:51.329598','2018-11-14 13:42:51.329651',1,34.99,'','201811141342511',11),(26,'2019-03-16 07:25:47.611894','2019-03-16 07:25:47.611956',1,50.00,'','201903160725471',7),(27,'2019-05-30 14:34:53.678294','2019-05-30 14:34:53.678369',3,12.12,'','201905301434531',5),(28,'2019-05-30 14:34:53.687896','2019-05-30 14:34:53.688056',4,10.00,'','201905301434531',1),(29,'2019-09-16 13:26:27.705141','2019-09-16 13:26:27.705194',1,34.00,'','201909161326274',6),(30,'2019-09-16 13:26:27.710112','2019-09-16 13:26:27.710162',1,12.12,'','201909161326274',5),(31,'2019-09-16 13:26:27.714822','2019-09-16 13:26:27.714870',9,32.00,'','201909161326274',4),(32,'2019-09-16 13:26:27.719879','2019-09-16 13:26:27.719929',1,10.00,'','201909161326274',1),(33,'2019-09-29 14:41:16.601032','2019-09-29 14:41:16.601085',1,20.00,'','201909291441165',3),(34,'2019-09-29 14:46:49.994003','2019-09-29 14:46:49.994098',1,20.00,'','201909291446495',3);
/*!40000 ALTER TABLE `df_order_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_order_info`
--

DROP TABLE IF EXISTS `df_order_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `df_order_info` (
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `order_id` varchar(64) NOT NULL,
  `total_count` int(11) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `trans_cost` decimal(10,2) NOT NULL,
  `pay_method` smallint(6) NOT NULL,
  `status` smallint(6) NOT NULL,
  `trade_id` varchar(100) DEFAULT NULL,
  `address_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `trade_id` (`trade_id`),
  KEY `df_order_info_address_id_db42c5b26f256ac_fk_df_address_id` (`address_id`),
  KEY `df_order_info_user_id_3b1c4e27122da18c_fk_df_users_id` (`user_id`),
  CONSTRAINT `df_order_info_address_id_db42c5b26f256ac_fk_df_address_id` FOREIGN KEY (`address_id`) REFERENCES `df_address` (`id`),
  CONSTRAINT `df_order_info_user_id_3b1c4e27122da18c_fk_df_users_id` FOREIGN KEY (`user_id`) REFERENCES `df_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_order_info`
--

LOCK TABLES `df_order_info` WRITE;
/*!40000 ALTER TABLE `df_order_info` DISABLE KEYS */;
INSERT INTO `df_order_info` VALUES ('2018-11-14 13:17:19.305215','2018-11-14 13:18:09.558394','201811141317191',1,30.00,10.00,2,4,'2018111422001460160500437907',1,1),('2018-11-14 13:42:51.142665','2018-11-14 13:43:58.576839','201811141342511',1,44.99,10.00,2,4,'2018111422001460160500438339',1,1),('2019-03-16 07:25:47.574573','2019-03-16 07:43:38.367511','201903160725471',1,60.00,10.00,2,4,'2019031622001460161000001001',1,1),('2019-05-30 14:34:53.648563','2019-05-30 14:34:53.691164','201905301434531',7,86.36,10.00,2,1,NULL,1,1),('2019-09-16 13:26:27.642242','2019-09-16 13:26:27.720804','201909161326274',12,354.12,10.00,2,1,NULL,2,4),('2019-09-29 14:41:16.541846','2019-09-29 14:41:16.617879','201909291441165',1,30.00,10.00,1,1,NULL,3,5),('2019-09-29 14:46:49.985360','2019-09-29 14:46:49.995447','201909291446495',1,30.00,10.00,1,1,NULL,3,5);
/*!40000 ALTER TABLE `df_order_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_users`
--

DROP TABLE IF EXISTS `df_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `df_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_users`
--

LOCK TABLES `df_users` WRITE;
/*!40000 ALTER TABLE `df_users` DISABLE KEYS */;
INSERT INTO `df_users` VALUES (1,'pbkdf2_sha256$20000$5WnGCYEN5Gug$D1Vo6G0c2ebXsQRrf6BGZoUDu7jL3PYh7XdoaYX58Gg=','2019-09-13 02:52:06.285043',1,'zhangbiao','','','as@qq.com',1,1,'2017-10-30 01:30:41.074004','2017-10-30 01:30:41.119153','2017-10-30 01:30:41.119202'),(2,'pbkdf2_sha256$20000$D98dt0wzuMch$OaR/Dqf8WoTDWKZfAvPRQByvlXPRUpyDkYdUkmrW7IY=',NULL,0,'zb12345','','','1071183139@qq.com',0,0,'2018-11-25 11:32:48.635979','2018-11-25 11:32:48.737796','2018-11-25 11:32:48.743019'),(3,'pbkdf2_sha256$20000$9e2Y2n41AbsF$LvDXJoFAaSyBDQ6gf7HnSs/dxIMxDVrmXk7zauMgCYs=','2019-09-13 03:42:07.791713',0,'zyc','','','1071183139@qq.com',0,1,'2019-03-16 07:09:18.149169','2019-03-16 07:09:18.267243','2019-09-13 03:42:25.785920'),(4,'pbkdf2_sha256$20000$JdwTu4MH2xIA$4nOXjmczBG3gid0CpLRgsTCVxtT4IDOTGlUneNaxHes=','2019-09-16 13:14:10.894435',0,'xiaohei','','','10711.qq.com',0,1,'2019-09-15 03:52:08.545690','2019-09-15 03:52:08.759655','2019-09-15 03:52:10.042858'),(5,'pbkdf2_sha256$20000$cNdoa2HReMAt$9zgq0U2M/6uDj2ipMBEevPMH9LXQep2VaejOM0xtGws=','2019-10-01 09:44:21.262330',1,'zyc123','','','',1,1,'2019-09-29 14:14:20.578269','2019-09-29 14:14:20.606631','2019-09-29 14:14:20.606705');
/*!40000 ALTER TABLE `df_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_users_groups`
--

DROP TABLE IF EXISTS `df_users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `df_users_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `df_users_groups_group_id_2b85df32ff37fc8d_fk_auth_group_id` (`group_id`),
  CONSTRAINT `df_users_groups_group_id_2b85df32ff37fc8d_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `df_users_groups_user_id_5ca028a111da58c7_fk_df_users_id` FOREIGN KEY (`user_id`) REFERENCES `df_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_users_groups`
--

LOCK TABLES `df_users_groups` WRITE;
/*!40000 ALTER TABLE `df_users_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `df_users_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_users_user_permissions`
--

DROP TABLE IF EXISTS `df_users_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `df_users_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `df_users_us_permission_id_2dfd14f1bb36c5d3_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `df_users_us_permission_id_2dfd14f1bb36c5d3_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `df_users_user_permission_user_id_5de0393858a8025a_fk_df_users_id` FOREIGN KEY (`user_id`) REFERENCES `df_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_users_user_permissions`
--

LOCK TABLES `df_users_user_permissions` WRITE;
/*!40000 ALTER TABLE `df_users_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `df_users_user_permissions` ENABLE KEYS */;
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
  KEY `django_content_type_id_8b12333307db48a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_5ba365512ca82ce8_fk_df_users_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_5ba365512ca82ce8_fk_df_users_id` FOREIGN KEY (`user_id`) REFERENCES `df_users` (`id`),
  CONSTRAINT `django_content_type_id_8b12333307db48a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-11-14 13:14:35.493784','12','1233333',3,'',6,1),(2,'2018-11-14 13:14:35.514440','11','xzxzxddd',3,'',6,1),(3,'2018-11-14 13:14:35.569374','10','xzxzxd',3,'',6,1),(4,'2018-11-14 13:14:35.573338','9','xzxzx',3,'',6,1),(5,'2018-11-14 13:14:35.579069','8','oikkh',3,'',6,1),(6,'2018-11-14 13:14:35.582193','7','opo',3,'',6,1),(7,'2018-11-14 13:14:35.585311','6','dsdsd',3,'',6,1),(8,'2018-11-14 13:14:35.588089','5','dsjjdjasdas',3,'',6,1),(9,'2018-11-14 13:14:35.598151','4','xzxzxz',3,'',6,1),(10,'2018-11-14 13:14:35.603858','3','fgh',3,'',6,1),(11,'2018-11-14 13:14:35.608313','2','zyccc',3,'',6,1),(12,'2018-11-14 13:16:48.674991','201811141309441','OrderInfo object',3,'',15,1),(13,'2018-11-14 13:16:48.695344','201811141227451','OrderInfo object',3,'',15,1),(14,'2018-11-14 13:16:48.740130','201811141218321','OrderInfo object',3,'',15,1),(15,'2018-11-14 13:16:48.749022','201811141217421','OrderInfo object',3,'',15,1),(16,'2018-11-14 13:16:48.755256','201811141202101','OrderInfo object',3,'',15,1),(17,'2018-11-14 13:16:48.758679','201811141201081','OrderInfo object',3,'',15,1),(18,'2018-11-14 13:16:48.769744','201811141200241','OrderInfo object',3,'',15,1),(19,'2018-11-14 13:16:48.775667','201811141153501','OrderInfo object',3,'',15,1),(20,'2018-11-14 13:16:48.778682','201811141150201','OrderInfo object',3,'',15,1),(21,'2018-11-14 13:16:48.782146','201811141148541','OrderInfo object',3,'',15,1),(22,'2018-11-14 13:16:48.790553','201711141251031','OrderInfo object',3,'',15,1),(23,'2018-11-14 13:16:48.793908','201711141242261','OrderInfo object',3,'',15,1),(24,'2018-11-14 13:16:48.805169','201711121229421','OrderInfo object',3,'',15,1),(25,'2018-11-14 13:16:48.811094','201711101004501','OrderInfo object',3,'',15,1),(26,'2018-11-14 13:16:48.824791','201711010859001','OrderInfo object',3,'',15,1),(27,'2018-11-14 13:16:48.830677','201710300741541','OrderInfo object',3,'',15,1),(28,'2018-11-14 13:16:48.835209','201710300725261','OrderInfo object',3,'',15,1),(29,'2019-03-16 07:23:21.115488','3','葡萄',2,'已修改 stock 。',10,1),(30,'2019-03-16 07:23:35.710333','6','大青虾',2,'已修改 stock 。',10,1),(31,'2019-03-25 15:25:57.217038','201903251525201','OrderInfo object',2,'已修改 total_count 。',15,1),(32,'2019-03-25 15:27:12.610861','201903251525201','OrderInfo object',2,'没有字段被修改。',15,1),(33,'2019-03-25 15:29:38.438348','201903251525201','OrderInfo object',2,'没有字段被修改。',15,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_results_taskresult`
--

DROP TABLE IF EXISTS `django_celery_results_taskresult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_celery_results_taskresult` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL,
  `content_type` varchar(128) NOT NULL,
  `content_encoding` varchar(64) NOT NULL,
  `result` longtext,
  `date_done` datetime(6) NOT NULL,
  `traceback` longtext,
  `hidden` tinyint(1) NOT NULL,
  `meta` longtext,
  `task_args` longtext,
  `task_kwargs` longtext,
  `task_name` varchar(255),
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`),
  KEY `django_celery_results_taskresult_662f707d` (`hidden`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_results_taskresult`
--

LOCK TABLES `django_celery_results_taskresult` WRITE;
/*!40000 ALTER TABLE `django_celery_results_taskresult` DISABLE KEYS */;
INSERT INTO `django_celery_results_taskresult` VALUES (1,'a1772ca2-4cc0-49d4-92cb-d381f6905059','FAILURE','application/json','utf-8','{\"exc_type\": \"NotRegistered\", \"exc_message\": [\"course.tasks.course_task\"], \"exc_module\": \"celery.exceptions\"}','2019-03-31 11:46:26.469835',NULL,0,'{\"children\": []}',NULL,NULL,NULL),(2,'d2c76ae8-cdd3-4dd0-80b6-5ffb08b09aed','SUCCESS','application/json','utf-8','null','2019-03-31 11:53:07.743505',NULL,0,'{\"children\": []}','[]','{}','celery_tasks.tasks.send_test'),(3,'d6cc640f-fb5b-49dc-87e6-e5b6642318f9','SUCCESS','application/json','utf-8','null','2019-03-31 11:54:22.491071',NULL,0,'{\"children\": []}','[]','{}','celery_tasks.tasks.send_test'),(4,'1fcd1b02-1ca5-4887-a218-d0aaf0abcbd4','SUCCESS','application/json','utf-8','null','2019-03-31 11:55:27.417733',NULL,0,'{\"children\": []}','[]','{}','celery_tasks.tasks.send_test'),(5,'5df37f39-77ee-4cdb-90da-0e4f87e4fda0','FAILURE','application/json','utf-8','{\"exc_type\": \"NotRegistered\", \"exc_message\": [\"course.tasks.course_task\"], \"exc_module\": \"celery.exceptions\"}','2019-03-31 12:11:08.333425',NULL,0,'{\"children\": []}',NULL,NULL,NULL),(6,'918adda3-c205-41f0-9661-69c699221cd0','SUCCESS','application/json','utf-8','null','2019-04-01 07:59:56.002006',NULL,0,'{\"children\": []}','[]','{}','celery_tasks.tasks.send_test'),(7,'9c6dd320-74f0-4f2c-8153-a4cd524b893b','SUCCESS','application/json','utf-8','null','2019-04-01 08:04:09.218000',NULL,0,'{\"children\": []}','[]','{}','celery_tasks.tasks.send_test'),(8,'03d2fa79-8e59-4d9b-938e-becbd8c55af7','SUCCESS','application/json','utf-8','null','2019-04-02 07:30:23.428205',NULL,0,'{\"children\": []}','[]','{}','celery_tasks.tasks.send_test');
/*!40000 ALTER TABLE `django_celery_results_taskresult` ENABLE KEYS */;
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
  UNIQUE KEY `django_content_type_app_label_3315155226ae3115_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(9,'goods','goods'),(8,'goods','goodscategory'),(11,'goods','goodsimage'),(10,'goods','goodssku'),(13,'goods','indexcategorygoodsbanner'),(12,'goods','indexgoodsbanner'),(14,'goods','indexpromotionbanner'),(16,'orders','ordergoods'),(15,'orders','orderinfo'),(5,'sessions','session'),(7,'users','address'),(6,'users','user');
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-10-30 01:27:46.848323'),(2,'contenttypes','0002_remove_content_type_name','2017-10-30 01:27:47.692503'),(3,'auth','0001_initial','2017-10-30 01:27:47.963157'),(4,'auth','0002_alter_permission_name_max_length','2017-10-30 01:27:48.024169'),(5,'auth','0003_alter_user_email_max_length','2017-10-30 01:27:48.056553'),(6,'auth','0004_alter_user_username_opts','2017-10-30 01:27:48.073656'),(7,'auth','0005_alter_user_last_login_null','2017-10-30 01:27:48.103554'),(8,'auth','0006_require_contenttypes_0002','2017-10-30 01:27:48.110843'),(9,'users','0001_initial','2017-10-30 01:27:48.487722'),(10,'admin','0001_initial','2017-10-30 01:27:48.639305'),(11,'goods','0001_initial','2017-10-30 01:27:49.254583'),(12,'orders','0001_initial','2017-10-30 01:27:49.759566'),(13,'sessions','0001_initial','2017-10-30 01:27:49.836063'),(14,'django_celery_results','0001_initial','2019-03-31 09:49:10.218254'),(15,'django_celery_results','0002_add_task_name_args_kwargs','2019-03-31 09:49:11.299935'),(16,'django_celery_results','0003_auto_20181106_1101','2019-03-31 09:49:11.320779'),(17,'djcelery','0001_initial','2019-03-31 09:49:12.275831');
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
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_crontabschedule`
--

DROP TABLE IF EXISTS `djcelery_crontabschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_crontabschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `minute` varchar(64) NOT NULL,
  `hour` varchar(64) NOT NULL,
  `day_of_week` varchar(64) NOT NULL,
  `day_of_month` varchar(64) NOT NULL,
  `month_of_year` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_crontabschedule`
--

LOCK TABLES `djcelery_crontabschedule` WRITE;
/*!40000 ALTER TABLE `djcelery_crontabschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_crontabschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_intervalschedule`
--

DROP TABLE IF EXISTS `djcelery_intervalschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_intervalschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `every` int(11) NOT NULL,
  `period` varchar(24) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_intervalschedule`
--

LOCK TABLES `djcelery_intervalschedule` WRITE;
/*!40000 ALTER TABLE `djcelery_intervalschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_intervalschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_periodictask`
--

DROP TABLE IF EXISTS `djcelery_periodictask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_periodictask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `task` varchar(200) NOT NULL,
  `args` longtext NOT NULL,
  `kwargs` longtext NOT NULL,
  `queue` varchar(200) DEFAULT NULL,
  `exchange` varchar(200) DEFAULT NULL,
  `routing_key` varchar(200) DEFAULT NULL,
  `expires` datetime(6) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `last_run_at` datetime(6) DEFAULT NULL,
  `total_run_count` int(10) unsigned NOT NULL,
  `date_changed` datetime(6) NOT NULL,
  `description` longtext NOT NULL,
  `crontab_id` int(11) DEFAULT NULL,
  `interval_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `djcel_crontab_id_415e8327acf086f1_fk_djcelery_crontabschedule_id` (`crontab_id`),
  KEY `djc_interval_id_11667af593a1c4d4_fk_djcelery_intervalschedule_id` (`interval_id`),
  CONSTRAINT `djc_interval_id_11667af593a1c4d4_fk_djcelery_intervalschedule_id` FOREIGN KEY (`interval_id`) REFERENCES `djcelery_intervalschedule` (`id`),
  CONSTRAINT `djcel_crontab_id_415e8327acf086f1_fk_djcelery_crontabschedule_id` FOREIGN KEY (`crontab_id`) REFERENCES `djcelery_crontabschedule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_periodictask`
--

LOCK TABLES `djcelery_periodictask` WRITE;
/*!40000 ALTER TABLE `djcelery_periodictask` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_periodictask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_periodictasks`
--

DROP TABLE IF EXISTS `djcelery_periodictasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_periodictasks` (
  `ident` smallint(6) NOT NULL,
  `last_update` datetime(6) NOT NULL,
  PRIMARY KEY (`ident`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_periodictasks`
--

LOCK TABLES `djcelery_periodictasks` WRITE;
/*!40000 ALTER TABLE `djcelery_periodictasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_periodictasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_taskstate`
--

DROP TABLE IF EXISTS `djcelery_taskstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_taskstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(64) NOT NULL,
  `task_id` varchar(36) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `tstamp` datetime(6) NOT NULL,
  `args` longtext,
  `kwargs` longtext,
  `eta` datetime(6) DEFAULT NULL,
  `expires` datetime(6) DEFAULT NULL,
  `result` longtext,
  `traceback` longtext,
  `runtime` double DEFAULT NULL,
  `retries` int(11) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `worker_id` int(11),
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`),
  KEY `djcelery_taskstate_9ed39e2e` (`state`),
  KEY `djcelery_taskstate_b068931c` (`name`),
  KEY `djcelery_taskstate_863bb2ee` (`tstamp`),
  KEY `djcelery_taskstate_662f707d` (`hidden`),
  KEY `djcelery_taskstate_ce77e6ef` (`worker_id`),
  CONSTRAINT `djcelery_t_worker_id_143d1f37ae1fe881_fk_djcelery_workerstate_id` FOREIGN KEY (`worker_id`) REFERENCES `djcelery_workerstate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_taskstate`
--

LOCK TABLES `djcelery_taskstate` WRITE;
/*!40000 ALTER TABLE `djcelery_taskstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_taskstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_workerstate`
--

DROP TABLE IF EXISTS `djcelery_workerstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_workerstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(255) NOT NULL,
  `last_heartbeat` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hostname` (`hostname`),
  KEY `djcelery_workerstate_f129901a` (`last_heartbeat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_workerstate`
--

LOCK TABLES `djcelery_workerstate` WRITE;
/*!40000 ALTER TABLE `djcelery_workerstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_workerstate` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-26 20:51:06
