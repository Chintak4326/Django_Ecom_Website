-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 01, 2020 at 06:08 AM
-- Server version: 5.7.21
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `django`
--

-- --------------------------------------------------------

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
CREATE TABLE IF NOT EXISTS `area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `pincode` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `area_city_id_6c07a4b7` (`city_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `area`
--

INSERT INTO `area` (`id`, `name`, `pincode`, `city_id`) VALUES
(1, 'Thakkarnager', 382350, 1),
(3, 'Nikol', 382340, 1),
(4, 'Navarangpura', 382310, 1),
(5, 'Naroda', 382345, 1);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=105 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add categories1', 6, 'add_categories1'),
(22, 'Can change categories1', 6, 'change_categories1'),
(23, 'Can delete categories1', 6, 'delete_categories1'),
(24, 'Can view categories1', 6, 'view_categories1'),
(25, 'Can add company1', 7, 'add_company1'),
(26, 'Can change company1', 7, 'change_company1'),
(27, 'Can delete company1', 7, 'delete_company1'),
(28, 'Can view company1', 7, 'view_company1'),
(29, 'Can add product1', 8, 'add_product1'),
(30, 'Can change product1', 8, 'change_product1'),
(31, 'Can delete product1', 8, 'delete_product1'),
(32, 'Can view product1', 8, 'view_product1'),
(33, 'Can add state1', 9, 'add_state1'),
(34, 'Can change state1', 9, 'change_state1'),
(35, 'Can delete state1', 9, 'delete_state1'),
(36, 'Can view state1', 9, 'view_state1'),
(37, 'Can add customer', 10, 'add_customer'),
(38, 'Can change customer', 10, 'change_customer'),
(39, 'Can delete customer', 10, 'delete_customer'),
(40, 'Can view customer', 10, 'view_customer'),
(41, 'Can add product image1', 11, 'add_productimage1'),
(42, 'Can change product image1', 11, 'change_productimage1'),
(43, 'Can delete product image1', 11, 'delete_productimage1'),
(44, 'Can view product image1', 11, 'view_productimage1'),
(45, 'Can add product attributes1', 12, 'add_productattributes1'),
(46, 'Can change product attributes1', 12, 'change_productattributes1'),
(47, 'Can delete product attributes1', 12, 'delete_productattributes1'),
(48, 'Can view product attributes1', 12, 'view_productattributes1'),
(49, 'Can add city1', 13, 'add_city1'),
(50, 'Can change city1', 13, 'change_city1'),
(51, 'Can delete city1', 13, 'delete_city1'),
(52, 'Can view city1', 13, 'view_city1'),
(53, 'Can add area1', 14, 'add_area1'),
(54, 'Can change area1', 14, 'change_area1'),
(55, 'Can delete area1', 14, 'delete_area1'),
(56, 'Can view area1', 14, 'view_area1'),
(57, 'Can add users', 15, 'add_users'),
(58, 'Can change users', 15, 'change_users'),
(59, 'Can delete users', 15, 'delete_users'),
(60, 'Can view users', 15, 'view_users'),
(61, 'Can add develiery_address', 16, 'add_develiery_address'),
(62, 'Can change develiery_address', 16, 'change_develiery_address'),
(63, 'Can delete develiery_address', 16, 'delete_develiery_address'),
(64, 'Can view develiery_address', 16, 'view_develiery_address'),
(65, 'Can add develiery_address1', 17, 'add_develiery_address1'),
(66, 'Can change develiery_address1', 17, 'change_develiery_address1'),
(67, 'Can delete develiery_address1', 17, 'delete_develiery_address1'),
(68, 'Can view develiery_address1', 17, 'view_develiery_address1'),
(69, 'Can add develiery_address_customer1', 18, 'add_develiery_address_customer1'),
(70, 'Can change develiery_address_customer1', 18, 'change_develiery_address_customer1'),
(71, 'Can delete develiery_address_customer1', 18, 'delete_develiery_address_customer1'),
(72, 'Can view develiery_address_customer1', 18, 'view_develiery_address_customer1'),
(73, 'Can add cart1', 19, 'add_cart1'),
(74, 'Can change cart1', 19, 'change_cart1'),
(75, 'Can delete cart1', 19, 'delete_cart1'),
(76, 'Can view cart1', 19, 'view_cart1'),
(77, 'Can add order1', 20, 'add_order1'),
(78, 'Can change order1', 20, 'change_order1'),
(79, 'Can delete order1', 20, 'delete_order1'),
(80, 'Can view order1', 20, 'view_order1'),
(81, 'Can add sales1', 21, 'add_sales1'),
(82, 'Can change sales1', 21, 'change_sales1'),
(83, 'Can delete sales1', 21, 'delete_sales1'),
(84, 'Can view sales1', 21, 'view_sales1'),
(85, 'Can add sales return details1', 22, 'add_salesreturndetails1'),
(86, 'Can change sales return details1', 22, 'change_salesreturndetails1'),
(87, 'Can delete sales return details1', 22, 'delete_salesreturndetails1'),
(88, 'Can view sales return details1', 22, 'view_salesreturndetails1'),
(89, 'Can add sales return1', 23, 'add_salesreturn1'),
(90, 'Can change sales return1', 23, 'change_salesreturn1'),
(91, 'Can delete sales return1', 23, 'delete_salesreturn1'),
(92, 'Can view sales return1', 23, 'view_salesreturn1'),
(93, 'Can add rating1', 24, 'add_rating1'),
(94, 'Can change rating1', 24, 'change_rating1'),
(95, 'Can delete rating1', 24, 'delete_rating1'),
(96, 'Can view rating1', 24, 'view_rating1'),
(97, 'Can add feedback1', 25, 'add_feedback1'),
(98, 'Can change feedback1', 25, 'change_feedback1'),
(99, 'Can delete feedback1', 25, 'delete_feedback1'),
(100, 'Can view feedback1', 25, 'view_feedback1'),
(101, 'Can add employee1', 26, 'add_employee1'),
(102, 'Can change employee1', 26, 'change_employee1'),
(103, 'Can delete employee1', 26, 'delete_employee1'),
(104, 'Can view employee1', 26, 'view_employee1');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
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
  `contact_no` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `contact_no`) VALUES
(2, 'pbkdf2_sha256$180000$LCRAMOzNfA0z$H7RSoOye8OuYfz2L5q/yI9aStoU4+pn66JvTodnxwtU=', '2020-08-30 11:24:50.655958', 1, 'darshan@gmail.com', 'Admin', '', 'darshan@gmail.com', 1, 1, '2020-08-02 13:52:29.217508', NULL),
(5, 'pbkdf2_sha256$180000$8EC1jfQopVSO$mzPDa53rDtcY9Q/NiwTbk70J/7I5SN5ldKUyDyrseMg=', '2020-08-29 12:37:37.467100', 0, 'darshan77@gmail.com', 'Darshan', 'Patel', 'darshan77@gmail.com', 0, 1, '2020-08-12 11:35:09.677549', NULL),
(7, 'pbkdf2_sha256$180000$Ez29g2VDhg3c$/Za95q51blgXHB4KwNUdPGcypI/c1yYwdmcG4730pA4=', '2020-08-19 10:03:11.672085', 0, 'chintakd999@gmail.com', 'Chintak', 'Doshi', 'chintakd999@gmail.com', 0, 1, '2020-08-19 09:27:50.317444', '8899665522');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_customer_id_group_id_973b33d2_uniq` (`customer_id`,`group_id`),
  KEY `auth_user_groups_customer_id_b50d5416` (`customer_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissio_customer_id_permission_i_049e91fb_uniq` (`customer_id`,`permission_id`),
  KEY `auth_user_user_permissions_customer_id_0bfa6fdf` (`customer_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qty` int(11) NOT NULL,
  `product_attributes_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_product_attributes_id_d2d2e7dd` (`product_attributes_id`),
  KEY `cart_user_id_1361a739` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=236 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_parent_id_fc02df82` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `url`, `parent_id`) VALUES
(2, 'Main Category', NULL, 0),
(5, 'Moblie', 'Moblies', 2),
(11, 'MI', 'Mi', 5),
(27, 'Motorola', 'motorola', 5),
(12, 'Vivo', 'Vivo', 5),
(19, 'Oppo', 'oppo', 5),
(26, 'Nokia', 'nokia', 5),
(20, 'Teblet', 'teblets', 2),
(32, 'Samsung', 'Samsung_tablets', 20),
(23, 'Lenovo', 'lonovo_teblet', 20),
(25, 'Samsung', 'Samsung_moblies', 5),
(28, 'Poco', 'poco', 5),
(29, 'Apple', 'Apple', 5),
(33, 'Honor', 'honor_teblet', 20),
(31, 'Apple i-pad', 'apple i-pad', 20),
(34, 'Acer', 'acer_teblet', 20);

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
CREATE TABLE IF NOT EXISTS `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `state_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `city_state_id_b686921b` (`state_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `name`, `state_id`) VALUES
(1, 'Ahmedabad', 26),
(2, 'Surat', 26),
(5, 'Vadodara', 26),
(10, 'Bhavnagar', 26);

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
CREATE TABLE IF NOT EXISTS `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(255) NOT NULL,
  `address` varchar(25255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `contact_no` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(30) NOT NULL,
  `contact_no` varchar(20) NOT NULL,
  `admin_flag` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `name`, `email`, `password`, `contact_no`, `admin_flag`) VALUES
(1, 'Darshan', 'darshan@gmail.com', 'darshan7799', '9988665544', 1),
(2, 'Darshan Vaghasiya', 'darshan77p@gmail.com', 'darshan123', '8844556630', 0),
(4, 'Chintak Doshi', 'chintakd999@gmail.com', 'chintak123', '7788666512', 0);

-- --------------------------------------------------------

--
-- Table structure for table `develiery_address`
--

DROP TABLE IF EXISTS `develiery_address`;
CREATE TABLE IF NOT EXISTS `develiery_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `landmark` varchar(255) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `contact_no` varchar(20) NOT NULL,
  `flag` tinyint(1) NOT NULL,
  `area_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `develiery_address_area_id_407b787f` (`area_id`),
  KEY `develiery_address_user_id_c32647f5` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `develiery_address`
--

INSERT INTO `develiery_address` (`id`, `customer_name`, `address`, `landmark`, `email`, `contact_no`, `flag`, `area_id`, `user_id`) VALUES
(41, 'Darshan', '58,Pratik', 'near mandir', 'darshan123@gmail.com', '7082112320', 1, 3, 2),
(17, 'Darshan', '207-Surbhi App', 'Near School', 'chintakd999@gmail.com', '8899665522', 0, 1, 4),
(40, 'Yash', '56,Pratik', 'near mandir', 'chintakd999@gmail.com', '8899665522', 0, 4, 2),
(16, 'Chintak', '204-Surbhi App', 'Near School', 'chintakd999@gmail.com', '7788666512', 0, 5, 4),
(42, 'Rilex', '68,PRATIK', 'Bapunagar', 'RILEX@GMAIL.COM', '9988774455', 1, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'contenttypes', 'contenttype'),
(5, 'sessions', 'session'),
(6, 'AdminPanel', 'categories1'),
(7, 'AdminPanel', 'company1'),
(8, 'AdminPanel', 'product1'),
(9, 'AdminPanel', 'state1'),
(10, 'AdminPanel', 'customer'),
(11, 'AdminPanel', 'productimage1'),
(12, 'AdminPanel', 'productattributes1'),
(13, 'AdminPanel', 'city1'),
(14, 'AdminPanel', 'area1'),
(15, 'AdminPanel', 'users'),
(16, 'AdminPanel', 'develiery_address'),
(17, 'AdminPanel', 'develiery_address1'),
(18, 'AdminPanel', 'develiery_address_customer1'),
(19, 'AdminPanel', 'cart1'),
(20, 'AdminPanel', 'order1'),
(21, 'AdminPanel', 'sales1'),
(22, 'AdminPanel', 'salesreturndetails1'),
(23, 'AdminPanel', 'salesreturn1'),
(24, 'AdminPanel', 'rating1'),
(25, 'AdminPanel', 'feedback1'),
(26, 'AdminPanel', 'employee1');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2020-08-18 13:34:52.812246'),
(2, 'contenttypes', '0002_remove_content_type_name', '2020-08-18 13:34:53.153469'),
(3, 'auth', '0001_initial', '2020-08-18 13:34:53.882567'),
(4, 'auth', '0002_alter_permission_name_max_length', '2020-08-18 13:34:54.841619'),
(5, 'auth', '0003_alter_user_email_max_length', '2020-08-18 13:34:54.871590'),
(6, 'auth', '0004_alter_user_username_opts', '2020-08-18 13:34:54.910571'),
(7, 'auth', '0005_alter_user_last_login_null', '2020-08-18 13:34:54.955545'),
(8, 'auth', '0006_require_contenttypes_0002', '2020-08-18 13:34:54.964546'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2020-08-18 13:34:55.000522'),
(10, 'auth', '0008_alter_user_username_max_length', '2020-08-18 13:34:55.042499'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2020-08-18 13:34:55.080474'),
(12, 'auth', '0010_alter_group_name_max_length', '2020-08-18 13:34:55.211619'),
(13, 'auth', '0011_update_proxy_permissions', '2020-08-18 13:34:55.247621'),
(14, 'AdminPanel', '0001_initial', '2020-08-18 13:34:57.761362'),
(15, 'admin', '0001_initial', '2020-08-18 13:35:00.199689'),
(16, 'admin', '0002_logentry_remove_auto_add', '2020-08-18 13:35:00.688462'),
(17, 'admin', '0003_logentry_add_action_flag_choices', '2020-08-18 13:35:00.743466'),
(18, 'sessions', '0001_initial', '2020-08-18 13:35:00.941319'),
(19, 'AdminPanel', '0002_users', '2020-08-30 10:27:37.741968'),
(20, 'AdminPanel', '0003_develiery_address', '2020-09-12 05:17:32.751191'),
(21, 'AdminPanel', '0004_develiery_address_landmark', '2020-09-12 06:56:39.108360'),
(22, 'AdminPanel', '0003_develiery_address1', '2020-09-12 07:39:51.904422'),
(23, 'AdminPanel', '0004_auto_20200912_1315', '2020-09-12 07:45:21.390798'),
(24, 'AdminPanel', '0003_develiery_address_customer1', '2020-09-12 08:05:39.295490'),
(25, 'AdminPanel', '0004_cart1', '2020-09-15 08:16:08.002246'),
(26, 'AdminPanel', '0005_auto_20200918_1604', '2020-09-18 10:34:36.179174'),
(27, 'AdminPanel', '0006_auto_20200918_1617', '2020-09-18 10:47:10.572953'),
(28, 'AdminPanel', '0007_auto_20200918_1627', '2020-09-18 10:57:19.571158'),
(29, 'AdminPanel', '0008_auto_20200918_1646', '2020-09-18 11:16:15.174721'),
(30, 'AdminPanel', '0009_auto_20200918_1715', '2020-09-18 11:45:46.426838'),
(31, 'AdminPanel', '0010_auto_20200920_1537', '2020-09-20 10:07:57.579403'),
(32, 'AdminPanel', '0011_order1_order_status', '2020-09-20 10:09:57.363206'),
(33, 'AdminPanel', '0012_remove_develiery_address_customer1_order_status', '2020-09-20 11:01:20.085142'),
(34, 'AdminPanel', '0013_auto_20200922_1622', '2020-09-22 10:53:03.087704'),
(35, 'AdminPanel', '0014_order1_flag', '2020-09-22 11:10:10.414745'),
(36, 'AdminPanel', '0015_order1_qty', '2020-09-22 13:46:57.967466'),
(37, 'AdminPanel', '0016_order1_cancle_flag', '2020-09-24 06:25:01.444408'),
(38, 'AdminPanel', '0017_auto_20200924_2226', '2020-09-24 16:56:55.762675'),
(39, 'AdminPanel', '0018_auto_20200926_1331', '2020-09-26 08:02:03.639219'),
(40, 'AdminPanel', '0019_order1_develiery_address', '2020-10-02 06:22:55.862518'),
(41, 'AdminPanel', '0020_auto_20201201_1015', '2020-12-01 04:45:29.112147'),
(42, 'AdminPanel', '0021_auto_20201201_1058', '2020-12-01 05:28:13.729379');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('2jc7ascctv1gvtnhaejaw9e0qj8pbsvm', 'YTY3ZGUyMDU4ZjRkNTdjNDc2NTk2NzE2ZmRhYjExMjUzMzU0NDM5Mzp7fQ==', '2020-10-15 12:32:33.306379'),
('yfbh4qhji8qna3ejfcg0njeo6jbylmar', 'MTFiNDFkYWMyYjllNTM4OGMxYjRhOWRlZTczNmVkNzYyZmEyYWI0NTp7InVzZXJuYW1lIjoyLCJlbXBfbmFtZSI6NX0=', '2020-12-15 06:07:23.400394'),
('j5iwi3rf3fa8utw5ps74xodw9z0fh0hq', 'YTY3ZGUyMDU4ZjRkNTdjNDc2NTk2NzE2ZmRhYjExMjUzMzU0NDM5Mzp7fQ==', '2020-11-18 10:01:26.326042'),
('dglkpq12ljku31wynp279q8xegllot53', 'M2VlNjQyN2I2MTNlZmRiZTQ2M2RiNzA3NzU1YmVmYmQxZGIwZTBkNzp7InVzZXJuYW1lIjoyfQ==', '2020-10-01 10:14:31.801121');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_name` varchar(255) NOT NULL,
  `emp_address` varchar(25255) NOT NULL,
  `emp_contact_no` bigint(20) NOT NULL,
  `emp_email` varchar(254) DEFAULT NULL,
  `emp_password` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `emp_name`, `emp_address`, `emp_contact_no`, `emp_email`, `emp_password`) VALUES
(4, 'Jay Shah', '5-Rupal', 7567425061, 'jay@gmail.com', 'jay1234'),
(5, 'Darshan', '12-Rupal', 7048281082, 'd@gmail.com', '12345678');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
CREATE TABLE IF NOT EXISTS `feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` longtext,
  `feedback_date` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `feedback_user_id_0104a377` (`user_id`),
  KEY `feedback_product_id_4ccd4c45` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `landmark` varchar(255) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `contact_no` varchar(20) NOT NULL,
  `order_date` datetime(6) NOT NULL,
  `area_id` int(11) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `product_attributes_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_status` varchar(200) DEFAULT NULL,
  `flag` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `cancle_flag` tinyint(1) NOT NULL,
  `develiery_address_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_area_id_7a50e12c` (`area_id`),
  KEY `orders_product_attributes_id_621d06ab` (`product_attributes_id`),
  KEY `orders_user_id_7e2523fb` (`user_id`),
  KEY `orders_develiery_address_id_c9ce0c80` (`develiery_address_id`),
  KEY `orders_employee_id_098e8632` (`employee_id`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_name`, `address`, `landmark`, `email`, `contact_no`, `order_date`, `area_id`, `amount`, `product_attributes_id`, `user_id`, `order_status`, `flag`, `qty`, `cancle_flag`, `develiery_address_id`, `employee_id`) VALUES
(57, 'Darshan', '58,Pratik', 'near mandir', 'darshan123@gmail.com', '7082112320', '2020-12-01 10:16:36.949099', 3, 77999, 16, 2, 'Delivered', 4207, 1, 0, 41, 5),
(58, 'Darshan', '58,Pratik', 'near mandir', 'darshan123@gmail.com', '7082112320', '2020-12-01 11:29:55.553854', 3, 27990, 19, 2, 'Delivered', 4759, 1, 0, 41, 5);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) NOT NULL,
  `model_name` varchar(255) NOT NULL,
  `model_code` varchar(255) DEFAULT NULL,
  `images` varchar(100) DEFAULT NULL,
  `description` longtext,
  `browser_type` varchar(255) NOT NULL,
  `touchscreen` int(11) NOT NULL,
  `sim_type` varchar(255) NOT NULL,
  `hybrid_sim_slot` int(11) NOT NULL,
  `otg_compatible` int(11) NOT NULL,
  `display_size` varchar(250) NOT NULL,
  `resolution` varchar(255) NOT NULL,
  `resolution_type` varchar(255) NOT NULL,
  `other_display_features` longtext,
  `operating_system` longtext,
  `processor_type` varchar(500) NOT NULL,
  `processor_core` varchar(255) NOT NULL,
  `primary_clock_speed` varchar(255) NOT NULL,
  `secondary_clock_speed` varchar(255) NOT NULL,
  `operating_frequency` varchar(255) DEFAULT NULL,
  `supported_memory_card_type` varchar(255) NOT NULL,
  `memory_card_slot_type` varchar(255) NOT NULL,
  `primary_camera_available` int(11) NOT NULL,
  `primary_camera` varchar(255) NOT NULL,
  `primary_camera_features` longtext,
  `secondary_camera_available` int(11) NOT NULL,
  `secondary_camera` varchar(255) NOT NULL,
  `secondary_camera_features` longtext,
  `flash` varchar(250) NOT NULL,
  `dual_camera_lens` varchar(255) NOT NULL,
  `network_type` varchar(255) NOT NULL,
  `supported_networks` varchar(255) NOT NULL,
  `internet_connectivity` varchar(255) DEFAULT NULL,
  `gprs` int(11) NOT NULL,
  `pre_installed_browser` varchar(255) NOT NULL,
  `blutooth_support` int(11) NOT NULL,
  `blutooth_version` varchar(100) NOT NULL,
  `wifi` int(11) NOT NULL,
  `wifi_version` varchar(255) NOT NULL,
  `usb_connectivity` int(11) NOT NULL,
  `audio_jack` varchar(100) NOT NULL,
  `touchscreen_type` varchar(255) NOT NULL,
  `sim_size` varchar(100) NOT NULL,
  `sensors` longtext,
  `other_features` longtext,
  `gps_type` varchar(255) NOT NULL,
  `fm_radio` int(11) NOT NULL,
  `music_player` int(11) NOT NULL,
  `video_format` varchar(255) DEFAULT NULL,
  `battery_capacity` varchar(255) NOT NULL,
  `width` varchar(100) NOT NULL,
  `height` varchar(100) NOT NULL,
  `depth` varchar(100) NOT NULL,
  `weight` varchar(100) NOT NULL,
  `warranty` longtext,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_category_id_640030a0` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `product_name`, `model_name`, `model_code`, `images`, `description`, `browser_type`, `touchscreen`, `sim_type`, `hybrid_sim_slot`, `otg_compatible`, `display_size`, `resolution`, `resolution_type`, `other_display_features`, `operating_system`, `processor_type`, `processor_core`, `primary_clock_speed`, `secondary_clock_speed`, `operating_frequency`, `supported_memory_card_type`, `memory_card_slot_type`, `primary_camera_available`, `primary_camera`, `primary_camera_features`, `secondary_camera_available`, `secondary_camera`, `secondary_camera_features`, `flash`, `dual_camera_lens`, `network_type`, `supported_networks`, `internet_connectivity`, `gprs`, `pre_installed_browser`, `blutooth_support`, `blutooth_version`, `wifi`, `wifi_version`, `usb_connectivity`, `audio_jack`, `touchscreen_type`, `sim_size`, `sensors`, `other_features`, `gps_type`, `fm_radio`, `music_player`, `video_format`, `battery_capacity`, `width`, `height`, `depth`, `weight`, `warranty`, `category_id`) VALUES
(17, 'Redmi Note 9 Pro', 'Redmi Note 9 Pro', 'M2003J6A1I', 'images/mi_note_9_pro.jpg', '48MP rear camera with ultra-wide, super macro, portrait, night mode, 960fps slowmotion, AI scene recognition, pro color, HDR, pro mode | 13MP facing camera 16.9418 centimeters (6.67-inch) FHD+ full screen dot display LCD multi-touch capacitive touchscreen with 2400 x 1080 pixels resolution, 400 ppi pixel density and 20:9 aspect ratio | 2.5D curved glass Android v10 operating system with 2.3GHz Qualcomm Snapdragon 720G with 8nm octa core processor Memory, Storage & SIM: 4GB RAM | 64GB internal memory expandable up to 512GB with dedicated SD card slot | Dual SIM (nano+nano) dual-standby (4G+4G) 5020mAH lithium-polymer large battery providing talk-time of 29 hours and standby time of 492 hours | 18W fast charger in-box and Type-C connectivity', 'Smartphones', 1, 'Dual Sim', 1, 1, '16.94 cm (6.67 inch)', '2400 x 1080 pixel', 'Full HD+', 'Screen Protection: Gorilla Glass 5 (Front Glass), Screen Mirror/Cast', 'Android Pie 10', 'Qualcomm® Snapdragon™ 720G', 'Octa Core', '2.3 GHz', '1.8 GHz', 'GSM: B2, B3, B5, B8, WCDMA: B1, B2, B5, B8, LTE TDD: B40, B41, LTE FDD: B1, B3, B5, B8', 'MicroSD', 'Dedicated Slot', 1, '48MP + 8MP + 5MP + 2MP', 'Ultra nightscape mode | AI scene detection | Smart ultra-wide angle mode | Ultra wide-angle edge distortion correction | AI Beautify | Burst mode | Tilt-shift | Level display | Custom watermark | Pro mode | Portrait mode background blur adjustment | Studio Lighting | Panorama mode | AI high resolution photos', 1, '16MP Front Camera', 'Panorama selfie | Palm shutter | AI silhouette detection | wide-angle distortion correction | Front camera HDR | Front camera display brightness correction | Selfie timer | Face recognition | Age recognition | Full screen camera frame | AI Beautify | AI feature adjustment | AI makeup | AI portrait mode | AI scene detection | AI studio lighting', 'Black', 'Primary Camera', '4G VOLTE, 3G', '4G LTE, GSM', 'GSM , WCDMA , LTE FDD , LTE TDD , DLCA , ULCA', 1, 'YES', 1, '5', 1, '802.11a/b/g/n/ac', 1, '3.5mm', 'capacitive', 'Nano', 'Ambient Light Sensor , Proximity Sensor , E Compass , Accelerometer , Gyroscope', 'AI Face Unlock, Dual App Support, Quick Charging Version: QC 3.0, Charger Details: 5V/2A (Phone Support 18W), USB Type: Type C 2.0, Processor Type: 4 x 1.95 GHz, 4 x 1.45 GHz, A53 + A53, Aura Mirror Design, Splash-proof by P2i, Wireless FM Radio, IR Blaster', 'A-GPS', 1, 1, 'MP4, 3GP, ASF, AVI, FLV, MKV, MPG, WEBM, WMV', '5020 mAh', '76.68 mm', '165.75 mm', '8.8 mm', '209 g', '1 year manufacturer warranty for device and 6 months manufacturer warranty for in-box accessories', 11),
(21, 'Samsung Galaxy Note 20', 'Galaxy Note 20', 'SM-N980FZGGINS', 'images/sumsung_note_20_b4sfbzk.jpg', '8 GB RAM | 256 GB ROM,12 GB RAM | 256 GB ROM\r\n17.02 cm (6.7 inch) Full HD+ Display 64MP + 12MP + 12MP | 10MP Front Camera\r\n4300 mAh Lithium-ion Battery\r\nExynos Octa Core Processor,Full HD+ Super AMOLED Plus Display, 4G, 3G, Wi-Fi, EDGE, GPRS, Accelerometer, Barometer, Fingerprint Sensor, Gyro Sensor, Geomagnetic Sensor, Hall Sensor, Light Sensor, Proximity Sensor, GPS, Glonass, Beidou, Galileo, 4300 mAh.', 'Smartphones', 1, 'Dual Sim', 0, 1, '17.02 cm (6.7 inch)', '2400 x 1080 Pixels', 'Full HD+', 'Full HD+ Super AMOLED Plus Display', 'Android 10', 'Exynos Octa Core', 'Octa Core', '2.73 GHz', '2.5 GHz', 'GSM: B2, B3, B5, B8, WCDMA: B1, B2, B5, B8, LTE TDD: B40, B41, LTE FDD: B1, B3, B5, B8', 'MicroSD', 'Dedicated Slot', 1, '64MP + 12MP + 12MP', '64MP + 12MP + 12MP Rear Camera Setup', 1, '10MP Front Camera', '10MP Front Camera', 'Rear LED Flash', 'Primary Camera', '4G, 3G, 2G', '4G LTE, WCDMA, GSM', '4G, 3G, Wi-Fi, EDGE, GPRS', 1, 'YES', 1, 'v5.0', 1, '802.11a/b/g/n/ac', 1, 'USB Type C', 'capacitive', 'Nano', 'Accelerometer, Barometer, Fingerprint Sensor, Gyro Sensor, Geomagnetic Sensor, Hall Sensor, Light Sensor, Proximity Sensor', 'AI Face Unlock, Dual App Support, Quick Charging Version: QC 3.0, Charger Details: 5V/2A (Phone Support 18W), USB Type: Type C 2.5, Processor Type: 4 x 2.5 GHz, 4 x 2.75 GHz, A53 + A53, Aura Mirror Design, Splash-proof by P2i, Wireless FM Radio, IR Blaster', 'GPS, Glonass, Beidou, Galileo', 1, 1, 'MP4, 3GP, ASF, AVI, FLV, MKV, MPG, WEBM, WMV', '4300 mAh', '75.2 mm', '161.6 mm', '8.3 mm', '192 g', '1 Year Warranty Provided by the Manufacturer from Date of Purchase', 25),
(22, 'Vivo V19', 'V19', 'vivo 1933 / PD1969F_EX', 'images/vivo_v19_FjiuAM3.jpg', '8 GB RAM | 256 GB ROM | Expandable Upto 512 GB\r\n16.36 cm (6.44 inch) Full HD+ Display\r\n48MP + 8MP + 2MP + 2MP | 32MP + 8MP Dual Front Camera\r\n4500 mAh Lithium-ion Battery\r\nQualcomm Snapdragon 712 AIE Processor. Enjoy a true blue smartphone experience with the V19 handset from Vivo. Featuring a Qualcomm Snapdragon 712 processor and up to 8 GB of RAM, this smartphone delivers power-packed performance that will blow your mind. Its 4,500-mAh battery helps you use this device for long hours, so you are always prepared for more.', 'Smartphones', 1, 'Dual Sim', 1, 1, '16.36 cm (6.44 inch)', '2400 x 1080 Pixels', 'Full HD+', 'iView Display, 91.1% Screen to Body Ratio, LIV (E3) Super AMOLED, Schott Xensation UP Display Protection, 6th Generation Gorilla Glass', 'Android 10', 'Qualcomm Snapdragon 712 AIE', 'Octa Core', '2.3 GHz', '1.77 GHz', 'GSM: B2, B3, B5, B8, WCDMA: B1, B5, B8, LTE FDD: B1, B3, B5, B8, LTE TDD: B38, B40, B41', 'MicroSD', 'Dedicated Slot', 1, '48MP + 8MP + 2MP + 2MP', 'Aperture: 48MP (f/1.79) + 8 MP (f/2.2) + 2 MP ( f/2.4) + 2 MP (f/2.4), EIS, Camera Features: Super Night Mode, Ultra Stable Video, Art Portrait Video, Super Macro, Bokeh Portrait', 1, '32MP + 8MP Dual Front Camera', 'Aperture: 32 MP (f/2.08) + 8 MP (f/2.28), Camera Features: Super Night Selfie, Super Wide Angle Selfie, Art Portrait Video', 'Rear Flash | Front Aura Screen Light', 'Primary & Secondary Camera', '4G VOLTE, 4G, 3G, 2G', '4G VoLTE, 4G LTE, WCDMA, GSM', '4G, 3G, Wi-Fi, EDGE, GPRS', 1, 'Vivo Browser, Google Chrome', 1, 'v5.0', 1, '802.11a/b/g/n/ac', 1, '3.5mm', 'capacitive', 'Nano', 'In-Display Fingerprint Scanning Sensor, Accelerometer, Ambient Light Sensor, Proximity, E-compass and Gyroscope Sensor', 'Support Dual 4G, App Clone, 33 W Vivo Flash Charge 2.0, Widwine L1 Support', 'A-GPS, GLONASS, Galileo', 1, 1, 'MP4, 3GP, AVI, FLV, TS, MKV', '4500 mAh', '75.04 mm', '159.64 mm', '8.5 mm', '186.5 g', '1 Year for Handset and 6 Months for In-box Accessories', 12),
(23, 'OPPO F17', 'F17', 'CPH2095', 'images/vivo_f17.jpg', '6 GB RAM | 128 GB ROM,8 GB RAM | 128 GB ROM\r\n16.36 cm (6.44 inch) Full HD+ Display\r\n16MP + 8MP + 2MP + 2MP | 16MP Front Camera\r\n4015 mAh Lithium Polymer Battery\r\nQualcomm Snapdragon 662 Processor\r\n30W VOOC Flash Charge 4.0. Not just a looker, the Oppo F17 is definitely a beast whether it comes to speed, storage, or battery life. With a massive AMOLED display, a (16MP+8MP+2MP+2MP) quadcam rear camera setup, a 16 MP front camera, and a ton of innovative features, the Oppo F17 is here to make your life simpler and a lot more fun!', 'Smartphones', 1, 'Dual Sim', 1, 1, '16.36 cm (6.44 inch)', '2400 x 1080 Pixels', 'Full HD+', 'Screen Proportion, 60 Hz Screen Refresh Rate', 'Android 10', 'Qualcomm Snapdragon 662', 'Octa Core', '2 GHz', '1.8 GHz', 'GSM: 850/900/1800/1900, WCDMA: B1/B5/B8, 4G LTE FDD: B1/B3/B5/B8, 4G LTE TDD: B38/B40/B41 (2535-2655 MHz)', 'MicroSD', 'Dedicated Slot', 1, '16MP + 8MP + 2MP + 2MP', '16MP + 8MP + 2MP + 2MP Rear Camera Setup, Main Camera (16MP): OV16A10, 1/3.06 inch, f/2.2, 5P, AF, Ultra Wide Angle Camera (8MP): Hi846, 1/4 inch, f/2.2, 5P, 119.9 Degree, Light Leak Filter Camera (2MP): f/2.4, 1/5 inch, f/2.4, 3P.', 1, '16MP Front Camera', '16MP Selfie Camera Setup, f/2.0, FOV 79.3 Degree, 5P, FF, Equivalent Focal Length: 25.6 mm, 3.41 mm Effective Focal Length, Sensor Size: 1/3.1 inch, 1.0um (Sony IMX471)', 'Rear LED Flash', 'Primary Camera', '4G VOLTE, 4G, 3G, 2G', '4G VoLTE, 4G LTE, WCDMA, GSM', '4G, 3G, Wi-Fi, EDGE, GPRS', 1, 'Google Chrome', 1, 'v5.1', 1, '802.11a/b/g/n/ac', 1, '3.5mm', 'capacitive', 'Nano', 'Geomagnetic Induction, Light Induction, Proximity Sensor, Acceleration Sensor, Gravity Sensor, Gyroscope, Support Step Function', '1804 MHz RAM Frequency, OTG Storage Format: NTFS, vfat, exfat, Maximum Support for OTG Storage: 2 TB, Support SBC, AAC, APTX Bluetooth Codec, Bluetooth Shared Network, Face Unlock, Fingerprint Under Optical Screen, VOOC 4.0 Fast Charging', 'A-GPS, Beidou, Glonass, Galileo', 1, 1, 'MP4, 3GP, ASF, AVI, FLV, MKV, MPG, WEBM, WMV', '4015 mAh', '72.9 mm', '159.8 mm', '7.45 mm', '163 g', 'Brand Warranty of 1 Year Available for Mobile Including Battery and 6 Months for Accessories', 19),
(24, 'Nokia 5.3 Android One', '7.2', '12.3', 'images/nokia_5.3.jpg', 'With the Nokia 7.2 smartphone, you will experience seamless multitasking, immersive entertainment, and crystal-clear photography on-the-go. This high-end smartphone features a Triple-sensor Camera, a 20 MP Front Camera, the Qualcomm Snapdragon 660 Processor, and a 16-cm (6.3) Full HD+ Display for beautiful photos, easy computing, and excellent viewing.', 'smartphones', 1, 'dual sim', 0, 1, '16.0cm', '1080*2340 Pixels', 'Full HD+', 'Screen Protection - 2.5D Corning Gorilla Glass Type, Screen Ratio - 19.5:9, Real-time HDR Conversion, Screen Mirror/Cast', 'Android Pie 9.0', 'Qualcomm Snapdragon 660', 'Octa Core', '2.2 GHz', '1.9 GHz', 'GSM: 900,1800, WCDMA: 1,5,8, LTE: 1,3,5,8,40,41(120 MHz)', 'microsd', 'dedicated slot', 1, '48MP + 5MP + 8MP', 'Triple Camera, 48MP 1/2inch Quad Pixel, 5MP Depth Sensor, 8MP Sensor with Ultra-wide Lens, Ziess Optics, Frame Rate: 30fps, Slow Motion Capture - Yes', 1, '20MP Front Camera', 'Quad Pixel, Frame Rate: 30fps', 'Rear and Front Screen Flash', 'Primary Camera', '3G, 4G, 2G', 'GSM, WCDMA, 4G LTE', '4G, 3G, Wi-Fi', 1, 'mvc', 1, 'v4.2', 1, '801.11 b/g/n', 1, '4.5mm', 'Fingerprint', 'Nano Sim', 'Fingerprint', 'Fingerprint Sensor - Yes, Fingerprint Scanner Position - Back Panel, Face Unlock, Charger Details - 5V/2A Compatible, USB Type: Type-C, Standby Time(4G) - 356', 'rawtian', 1, 1, 'mvc', '6000 mAh', '75.4 mm', '158.3 mm', '8.26 mm', '181 g', 'Brand Warranty of 1 Year Available for Mobile', 26),
(25, 'Infinix Note 7', '7.5', '12.5', 'images/infinix-note-7-raw.jpg', 'Experience an uninterrupted visual experience with the Infinix Note 7’s 17.65-cm (6.95) HD+ Pinhole display. With a 48 MP AI Quad camera that comes with Quad LED flash along with a 16 MP In-display selfie camera, your photography game is taken to an all new level. Powered by 4 GB of RAM and a 12 nm G70 octa-core processor, the Infinix Note 7 also comes with 64 GB of RAM. Apart from a side-mounted fingerprint sensor and face unlock, this phone also features a massive 5000 mAh battery, keeping the entertainment going all day long.', 'smartphones', 1, 'dual sim', 1, 1, '15.0cm', '1080*2240 Pixels', 'Full HD+', '20.5:9 Aspect ratio, 480 nits Brightness, 91.5% Screen to Body Ratio, Eye Care Mode, 1500:1 Contrast Ratio', 'Android Pie 9.0', 'Qualcomm Snapdragon 660', 'Octa Core', '2.0GHz', '1.9 GHz', 'GSM: B2/B3/B5/B8, WCDMA: B1/B5/B8, 4G LTE: B1/B3/B5/B8/B38/B40/B41', 'microsd', 'dedicated slot', 1, '48MP + 5MP + 8MP', '48MP + 2MP + 2MP + AI Lens Quad Camera Setup, 48MP (Main, f/1.79) + 2MP (Depth Sensor) + 2MP (Macro Lens), Auto Scene Detection, Modes: Super Night Mode, Document Mode, Slow Motion Video, Stabilize Video Recording, Custom Bokeh, AI HDR, AI 3D Beauty, Panorama, AR Animoji, AI 3D Body Shaping', 1, '20MP Front Camera', '16MP AI (f /2.0) In-display Selfie Camera with Screen Flash, Camera Modes: AI HDR, AI Portrait, AI 3D Face Beauty, WideSelfie', 'Rear Quad LED Flash | Front Screen Flash', 'Primary Camera', '3G, 4G, 2G', 'GSM, WCDMA, 4G LTE', '4G, 3G, Wi-Fi', 1, 'mvc', 1, 'v4.7', 1, '802.11 b/g/n', 1, '3.5mm', 'Fingerprint', 'Nano Sim', 'Ambient Light, G-Sensor, Proximity, Gyroscope, E-Compass', 'VoWiFi, Dual VoLTE Support, Side Mounted Fingerprint Sensor, 3D Glass Finish Design, Social Turbo, Wi-Fi Share, Smart Gestures, Digital Wellbeing, Hide Apps, Dark Theme, Eye Care, Photo Editor, Multi Window, Bike Mode, Game Mode, Smart Panel, AI Gallery, Battery Lab', 'A-GPS', 1, 1, 'H.264, H.263, MPEG-4', '5000 mAh', '79mm', '173.4mm', '8.26 mm', '207g', '1 Year on Handset and 6 Months on Accessories', 27),
(26, 'POCO M2', '7.5', '12.3', 'images/poco_m2.jpg', 'Style, performance, and innovation - the Poco M2 brings together all these aspects with its 16.58 cm (6.53) FHD+ 1080p Full Screen Display, MediaTek Helio G80 Octa-core processor, a quad-camera setup, and an 8 MP selfie camera. What’s more, this phone is also highly durable, thanks to P2i protection and Corning Gorilla Glass 3.', 'smartphones', 1, 'dual sim', 1, 1, '16.0cm', '1080*2240 Pixels', 'Full HD+', '70% NTSC Ratio, 1500:1 Contrast Ratio, Corning Gorilla Glass 3, 2.5D Glass', 'Android Pie 9.0', 'Qualcomm Snapdragon 660', 'Octa Core', '2.2 GHz', '1.9 GHz', 'GSM: B2/B3/B5/B8, WCDMA: B1/B2/B5/B8, 4G LTE: B1/B3/B5/B8/B40/B41', 'microsd', 'dual/dual', 1, '48MP + 5MP + 8MP', 'Features\r\n13MP + 8MP + 5MP + 2MP Rear Camera Setup, Main Camera (13MP, AF, 5P, 1.12?m, f/2.2, FOV 75.2 Degree) + UW Camera (8MP, FF, 5P, 1.12?m, f/2.2, 5P, FOV 118.2 Degree) + Micro Camera (5MP + 1.75?m, f/2.4, 3P, FOV 83 Degree) + Portrait Camera (2MP, FF, 1.75?m, f/2.4, 3P, FOV 83 Degree), Slow Motion Support', 1, '20MP Front Camera', '8MP Selfie Camera Setup, f/2.05 Aperture, 1.12um Pixel Size', 'Rear and Front Screen Flash', 'dual/dual', '3G, 4G, 2G', 'GSM, WCDMA, 4G LTE', '4G, 3G, Wi-Fi', 1, 'mvc', 1, 'v4.7', 1, '801.11 b/g/n', 1, '4.5mm', 'Fingerprint', 'Nano Sim', 'Ambient Light Sensor, Proximity Sensor, E-compass, Accelerometer', 'eMMC Internal Storage, IR Blaster, 18W Charging Support, Rear Fingerprint Scanner', 'A-GPS', 1, 1, 'H.264, H.263, MPEG-4', '6000 mAh', '77', '163.4mm', '9.1', '181 g', '1 Year for Handset, 6 Months for Accessories', 28),
(27, 'Apple iPhone 11', 'iPhone 11', '12.5', 'images/iPhone-11.jpg', 'NA', 'smartphones', 1, 'dual sim', 1, 1, '15.49cm', '1792*828Pixels', 'Liquid Retina HD Display', '1400:1 Contrast Ratio (Typical), True Tone Display, Wide Colour Display (P3), Haptic Touch, 625 nits Max Brightness (Typical), Fingerprint Resistant Oleophobic Coating, Support for Display of Multiple Languages and Characters Simultaneously', 'iOS 13', 'A13 Bionic Chip', 'Octa Core', '2.0GHz', '1.9 GHz', 'Rear- 4K Video Recording at 24 fps', 'microsd', 'dual/dual', 1, '48MP + 5MP + 8MP', 'Dual 12MP Ultra Wide and Wide Cameras, Ultra Wide: f/2.4 Aperture and 120Degree Field of View, Wide: f/1.8 Aperture, Portrait Mode with Advanced Bokeh and Depth Control, Portrait Lighting with Six Effects (Natural, Studio, Contour, Stage, Stage Mono, High-key Mono), Optical Image Stabilisation (Wide), Five Element Lens (Ultra Wide), Six Element Lens (Wide), Brighter True Tone Flash with Slow Sync, Panorama (Up to 64MP), 100% Focus Pixels (Wide), Night Mode, Auto Adjustments, Next-generation Smart HDR for Photos, Wide Colour Capture for Photos and Live Photos, Advanced Red Eye Correction, Auto Image Stabilisation, Burst Mode, Photo Geotagging, Image Formats Captured: HEIF and JPEG', 1, '12mp', 'TrueDepth Camera - 12MP Camera, f/2.2 Aperture, Portrait Mode with Advanced Bokeh and Depth Control, Portrait Lighting with Six Effects (Natural, Studio, Contour, Stage, Stage Mono, High Key Mono), Animoji and Memoji, 4K Video Recording at 24 fps,', 'Rear and Front Screen Flash', 'dual/dual', '3G, 4G, 2G', 'GSM, WCDMA, 4G LTE', '4G, 3G, Wi-Fi', 1, 'mvc', 1, 'v5', 1, '802.11 b/g/n', 1, '4.5mm', 'Fingerprint', 'Nano Sim', 'Face ID, Barometer, Three Axis Gyro, Accelerometer, Proximity Sensor, Ambient Light Sensor', 'Faster Face ID, Slo-mo Selfies, Water Resistant upto 2 Metres for up to 30 Minutes?', 'A-GPS', 1, 1, 'HEVC, H.264, MPEG 4 Part 2 and Motion JPEG, Supports Dolby Vision and HDR10 Content', '6000 mAh', '75.4 mm', '150.9 mm', '8.3mm', '194g', 'Brand Warranty for 1 Year', 29),
(28, 'Nokia C3', '7.5', '12.3', 'images/nokia_c3_Mi6RrTx.jpg', 'With a large HD+ display, an octa-core processor, adaptive battery technology, efficient front and rear cameras, and many more features such Google Assistant and Fingerprint sensor, the Nokia C3 helps you go through your day effortlessly.', 'smartphones', 1, 'dual sim', 1, 1, '15.49cm', '2160 x 1620 Pixels', 'Full HD+', 'Face Unlock, Google Assistant Button', 'Android Pie 9.0', 'A13 Bionic Chip', 'Octa Core', '2.0GHz', '1.9 GHz', 'GSM: 850/900/1800, WCDMA: B1/B5/B8, 4G LTE: B1/B3/B5/B8/B40/B41 (120 MHz)', 'microsd', 'dual/dual', 1, '48MP + 5MP + 8MP', 'Features\r\n8MP Auto Focus Rear Camera, f/2.0 Aperture', 1, '7MP Front Camera', '5MP Selfie Camera Setup, f/2.4 Aperture', 'Rear and Front Screen Flash', 'dual/dual', '3G, 4G, 2G', 'GSM, WCDMA, 4G LTE', '4G, 3G, Wi-Fi', 1, 'mvc', 1, 'v4.7', 1, '802.11 b/g/n', 1, '3.5mm', 'Fingerprint', 'Nano Sim', 'Ambient Light Sensor, Proximity Sensor, Accelerometer (G-sensor), Fingerprint Sensor', 'Face Unlock, Google Assistant Button', 'A-GPS', 1, 1, 'H.264, H.263, MPEG-4', '3040 mAh', '76.4 mm', '173.4mm', '8.69mm', '186 g', '1 Year Manufacturer Warranty for Device and 6 Months Manufacturer Warranty for In-box Accessories Including Batteries from the Date of Purchase', 26),
(29, 'Nokia 2.3', '2.3', '2.3.1', 'images/Nokia-2.3.jpg', 'Discover the power of AI with Nokia 2.3. It lasts up to 2 days1 with Adaptive Battery technology, takes epic shots with AI imaging – even in low-light – and unlocks with a glance. Bring great stories to life with the impressive 6.2” HD+ 19:9 screen. Plus, it’s ready for Android 10 and beyond so you can look forward to 2 years of software upgrades and 3 years of monthly security updates.', 'smartphones', 1, 'dual sim', 1, 1, '15.49cm', '1080*2240 Pixels', 'Full HD+', 'HD+ with waterdrop notch , 6.2” HD+ in-cell display with selfie notch and 19:9 aspect ratio.', 'Android Pie 9.0', 'Qualcomm Snapdragon 660', 'Octa Core', '2.2 GHz', '1.9 GHz', 'Android Pie 9', 'microsd', 'dual/dual', 1, '48MP', '13 MP', 1, '12mp', 'Dual Front', 'Rear and Front Screen Flash', 'dual/dual', '3G, 4G, 2G', 'GSM, WCDMA, 4G LTE', '4G, 3G, Wi-Fi', 1, 'google chrome', 1, 'v4.7', 1, '801.11 b/g/n', 1, '3.5mm', 'Fingerprint', 'Nano Sim', 'Ambient light sensor,', 'super light', 'A-GPS', 1, 1, 'H.264, H.263, MPEG-4', '6000 mAh', '79mm', '163.4mm', '75.3 mm', '194g', '1 year of warranty', 26),
(43, 'Samsung Galaxy Tab S6 Lite', 'Galaxy Tab S6 Lite', 'SM-N980FZGGINS', 'images/galaxy-tab-s6-lite-1.jpg', 'Immerse yourself into a cinematic audio-visual experience by bringing home the Samsung Galaxy Tab S6 Lite. This tablet not only features a stylish and aesthetic design but is lightweight as well, making it your ideal travel companion. With the S Pen, you can easily draw, sketch, jot down important points, and do more. To top it off, the large 7040 mAh battery helps you browse for long hours before this tablet has to be charged again.', 'Tablets', 1, 'Single Sim', 0, 1, '26.42 cm (10.4 inch)', '2400 x 1080 Pixels', 'Full HD+', 'WUXGA+ LED Backlit TFT Touch Display', 'Android 10', 'Exynos Octa Core', 'Octa Core', '2.3 GHz', '1.7 GHz', 'Bands Supported: 2G GSM - GSM850, GSM900, DCS1800, PCS1900, 3G UMTS - B1(2100), B2(1900), B4(AWS), B5(850), B8(900), 4G FDD LTE - B1(2100), B2(1900), B3(1800), B4(AWS), B5(850), B7(2600), B8(900), B12(700), B17(700),', 'MicroSD', 'Dedicated Slot', 1, '8 Megapixels', 'NAN', 1, '5 Megapixels', 'Auto Focus Rear Camera', 'NAN', 'NAN', '4G VOLTE, 4G, 3G, 2G', '4G VoLTE, 4G LTE, WCDMA, GSM', '4G, 3G, Wi-Fi, EDGE, GPRS', 1, 'Google Chrome', 1, 'v5.0', 1, '802.11a/b/g/n/ac', 1, '3.5mm', 'capacitive', 'Nano', 'Accelerometer, Gyro Sensor, Hall Sensor, RGB Light Sensor', 'Bluetooth Support, ANT+, Wi-Fi Direct, PC Sync (Smart Switch), 2.4 GHz and 5 GHz Dual Band Wireless Connectivity', 'GPS, Glonass, Beidou, Galileo', 1, 1, 'MP4, 3GP, ASF, AVI, FLV, MKV, MPG, WEBM, WMV', '7040 mAh', '125.2 mm', '209.8 mm', '8.5 mm', '250 g', '1 Year on Tablet, 6 Months on Accessories', 32),
(31, 'POCO X2', 'x2', 'x2 11', 'images/poco_x2_Zcnw9eI.jpg', 'Get set to game, capture, and watch your favourite content on the POCO X2 smartphone. Featuring the RealityFlow display, a quad rear camera system (64 MP Sony IMX686 sensor, 8 MP ultra-wide sensor, 2 MP depth sensor, and 2 MP macro sensor), and the liquid cooling system, this smartphone has everything in place to help you do anything in the most suitable manner. Get ready to stun everyone with your picture-perfect selfies, thanks to this smartphone\'s dual in-screen cameras. That’s not all, with the presence of the 4500 mAh battery, you can be sure that this smartphone will be with you throughout', 'smartphones', 1, 'dual sim', 1, 1, '25.91 cm (10.2 inch)', '2160 x 1620 Pixels', 'Full HD+', 'Corning Gorilla Glass 5, 120Hz Display Refresh Rate, 20:9 Aspect Ratio, Screen Mirror/cast', 'Android Pie 9.0', 'Qualcomm Snapdragon 660', 'Octa Core', '2.0GHz', '1.9 GHz', '4G: FDD - B1/B3/B5/B8, TDD - B40/B41, 3G: B1/B2/B5/B8, 2G: B2/B3/B5/B8', 'microsd', 'dual/dual', 1, '48MP', 'dual', 1, '20MP', 'super', 'Rear and Front Screen Flash', 'dual/dual', '3G, 4G, 2G', 'GSM, WCDMA, 4G LTE', '4G, 3G, Wi-Fi', 0, 'google chrome', 1, 'v5', 1, '802.11 b/g/n', 1, '4.4mm', 'Fingerprint', 'Nano Sim', 'Fingerprint Scanner', 'Face Unlock, Dual App Support, USB Type C,', 'rawtian', 1, 1, 'H.264, H.263, MPEG-4', '5000 mAh', '77', '175 mm', '75.3 mm', '186 g', '1 year of warranty', 28),
(32, 'OPPO A1K', 'A1K', '11.67', 'images/oppo_a1k.jpg', 'NA', 'smartphones', 1, 'dual sim', 1, 1, '16.0cm', '1080*2240 Pixels', 'Full HD+', 'Screen Texture: a-Si TFT, GFF Touch Panel Technology, 87.43% Screen Ratio, Screen Contrast: 1200:1 (Typical), Color Saturation:', 'Android 10', 'SC9863A Octa Core', 'Octa Core', '2.0GHz', '1.9 GHz', 'GSM: 850, 900, 1800,', 'microsd', 'dual/dual', 1, '48MP', '5 lens', 1, '12mp', 'snesor', 'Rear and Front Screen Flash', 'dual/dual', '3G, 4G, 2G', 'GSM, WCDMA, 4G LTE', '4G, 3G, Wi-Fi', 1, 'google chrome', 1, 'v4.2', 1, '802.11 b/g/n', 1, '3.5mm', 'Fingerprint', 'Nano Sim', 'Features\r\n5P Lens', '4G Data Rate: Uplink - 50 Mbps, Downlink - 150 Mbps, 4G+, Connection and Sharing, Flashlight, Charge Speed, Power: 5V, 2A, 10W, Theoretical Audio Playing Time: 125hrs, Face Recognition,', 'rawtian', 1, 1, 'H.264, H.263, MPEG-4', '6000 mAh', '76.4 mm', '173.4mm', '92 mm', '181 g', '1 year', 19),
(33, 'OPPO A52', 'A52', '11.67', 'images/oppo_5_main.jpg', 'The OPPO A52 smartphone will make your life a seamless one. It comes with the 1080p Neo Display and dual stereo speakers that will ensure you get to watch everything clearly and loudly. Oh, and do you spend a long time using your phone? Then, the Eye Care mode and the Dark mode will ensure that your eyes are not strained much. When it comes to pictures, this phone’s AI Quad Camera will let you capture everything really well.', 'smartphones', 1, 'dual sim', 1, 1, '15.0cm', '1080*2240 Pixels', 'Full HD+', '80 nit Brightness (typ), 82% NTSC Color Saturation (typ)', 'GSM: 850, 900, 1800 |', 'SC9863A Octa Core', 'Octa Core', '2.0GHz', '1.9 GHz', 'a1 bk', 'microsd', 'dual/dual', 1, '48MP', 'dual', 1, '20MP', '11', 'Rear and Front Screen Flash', 'dual/dual', '3G, 4G, 2G', 'GSM, WCDMA, 4G LTE', '4G, 3G, Wi-Fi', 1, 'google chrome', 1, 'v4.7', 1, '802.11 b/g/n', 1, '4.5mm', 'Fingerprint', 'Nano Sim', 'az mox', '18 W Fast Charging', 'rawtian', 1, 1, 'H.264, H.263, MPEG-4', '5000 mAh', '75.4 mm', '158.3 mm', '75.3 mm', '181 g', '1 year of warranty', 19),
(34, 'Apple iPhone 7 Plus', '7', '7.1', 'images/iphone_5_aU2qtGS.jpg', 'With better cameras, long-lasting battery life, powerful processor and enhanced stereo speakers, the iPhone 7 Plus takes your iPhone experience till date to the next level. Thanks to its vibrant display, sleek design and a water-', 'smartphones', 1, 'dual sim', 1, 1, '15.49cm', '1792*828Pixels', 'Full HD+', 'amitigo', 'node', 'Qualcomm Snapdragon 660', 'Octa Core', '2.0GHz', '1.9 GHz', 'dual', 'microsd', 'dual/dual', 1, '48MP', 'supe', 1, '20MP', 'rear', 'Rear and Front Screen Flash', 'dual/dual', '3G, 4G, 2G', 'GSM, WCDMA, 4G LTE', '4G, 3G, Wi-Fi', 1, 'google chrome', 1, 'v4.2', 1, '802.11 b/g/n', 1, '3.5mm', 'Fingerprint', 'Nano Sim', 'amitigo', 'super', 'rawtian', 1, 1, 'H.264, H.263, MPEG-4', '6000 mAh', '79mm', '150.9 mm', '8.26 mm', '194g', '1 year', 29),
(35, 'Apple iPhone SE', 'SE', 'iphone se', 'images/se_5_XsGzRdD.jpg', 'iPhone SE is the most powerful 11.94-cm (4.7) iPhone ever. It features the incredibly-fast A13 Bionic for incredible performance in apps, games, and photography, Portrait mode for studio-quality portraits and six lighting effects, Next-generation Smart HDR for incredible detail across highlights and shadows,', 'smartphones', 1, 'dual sim', 1, 1, '16.0cm', '1080*2240 Pixels', 'Full HD+', 'Widescreen HD LCD Retina Multi-touch', 'Android Pie 9.0', 'Qualcomm Snapdragon 660', 'Octa Core', '2.0GHz', '1.9 GHz', 'dual', 'microsd', 'dual/dual', 1, '48MP', 'Widescreen', 1, '20MP', 'Aperture', 'Rear and Front Screen Flash', 'dual/dual', '3G, 4G, 2G', 'GSM, WCDMA, 4G LTE', '4G, 3G, Wi-Fi', 1, 'google chrome', 1, 'v4.7', 1, '801.11 b/g/n', 1, '3.5mm', 'Fingerprint', 'Nano Sim', 'Touch ID Fingerprint', 'Splash, Water and Dust Resistant ouch ID Fingerprint', 'A-GPS', 1, 1, 'H.264, H.263, MPEG-4', '6000 mAh', '76.4 mm', '157.9 mm', '75.3 mm', '194g', '1 year warrnty', 29),
(36, 'Vivo Y91i', 'Y91', '91', 'images/Vivo_Y91C_2020_2.jpg', 'The Vivo Y91i smartphone is here to make your life simpler. Its Halo Fullview Display paves the way for an enhanced viewing experience.', 'smartphones', 1, 'dual sim', 1, 1, '16.0cm', '1080*2240 Pixels', 'Full HD+', 'Halo FullView Display, 88.6% Screen to Body Ratio,', 'GSM: 850, 900, 1800 |', 'Qualcomm Snapdragon 660', 'Octa Core', '2.0GHz', '1.9 GHz', 'rear', 'microsd', 'dual/dual', 1, '48MP', 'flash', 1, '20MP', 'rear', 'Rear and Front Screen Flash', 'dual/dual', '3G, 4G, 2G', 'GSM, WCDMA, 4G LTE', '4G, 3G, Wi-Fi', 1, 'google chrome', 1, 'v4.7', 1, '802.11 b/g/n', 1, '3.5mm', 'Fingerprint', 'Nano Sim', 'rear light', 'Halo FullView Display,', 'A-GPS', 1, 1, 'H.264, H.263, MPEG-4', '6000 mAh', '75.4 mm', '157.9 mm', '8.3mm', '190 g', '1 year warranty', 12),
(37, 'Galaxy M21', '7.2', 'M21', 'images/Samsung-M21.jpg', '48MP (F2.0) Main Camera +8MP (F2.2) Ultra Wide Camera +5MP(F2.2) Depth Camera | 20MP (F2.2) front facing camera 16.21 centimeters', 'smartphones', 1, 'dual sim', 1, 1, '16.0cm', '1080*2240 Pixels', 'Full HD+', 'super light', 'Android 10', 'Qualcomm Snapdragon 660', 'Octa Core', '2.0GHz', '1.9 GHz', 'android pie', 'microsd', 'dual/dual', 1, '48MP', 'rear', 1, '20MP', 'super', 'Rear and Front Screen Flash', 'dual/dual', '3G, 4G, 2G', 'GSM, WCDMA, 4G LTE', '4G, 3G, Wi-Fi', 1, 'google chrome', 1, 'v4.7', 1, '801.11 b/g/n', 1, '3.5mm', 'Fingerprint', 'Nano Sim', 'rear light', 'adaptalble', 'rawtian', 1, 1, 'H.264, H.263, MPEG-4', '6000 mAh', '75.4 mm', '158.3 mm', '75.3 mm', '194g', '1 year', 25),
(38, 'Redmi K20', 'k20', '20', 'images/redmi_k20.jpg', 'The K20 opens up new possibilities. The 48 MP AI Triple camera setup lets you see things from a different perspective altogether. Be it ultra-wides or telephoto shots, the K20 produces flawless images.', 'smartphones', 1, 'dual sim', 1, 1, '16.0cm', '1080*2240 Pixels', 'Full HD+', 'super light', 'dual', 'Qualcomm Snapdragon 660', 'Octa Core', '2.0GHz', '1.9 GHz', 'rear', 'microsd', 'dual/dual', 1, '48MP', 'dual', 1, '20MP', 'adptive', 'Rear and Front Screen Flash', 'dual/dual', '3G, 4G, 2G', 'GSM, WCDMA, 4G LTE', '4G, 3G, Wi-Fi', 1, 'google chrome', 1, 'v4.2', 1, '802.11 b/g/n', 1, '3.5mm', 'Fingerprint', 'Nano Sim', 'adaptive', 'super light', 'rawtian', 1, 1, 'H.264, H.263, MPEG-4', '6000 mAh', '75.4 mm', '173.4mm', '92 mm', '207g', '1 year warranty', 11),
(39, 'Redmi 8 Sapphire', '7.2', '8', 'images/red.jpg', 'If you are a travel blogger, gamer, entertainment seeker, or a person who loves a high-end personal device, then the Redmi 8 has been created to meet your needs. This smartphone features a 15.8-cm (6.22) Dot Notch Display, a 12 MP + 2 MP AI Dual Camera, and a 5000 mAh High-capacity Battery to offer detailed views of the stunning photos that you can click all day long without running out of battery life.', 'smartphones', 1, 'dual sim', 1, 1, '16.0cm', '1080*2240 Pixels', 'Full HD+', 'super', 'qualcomm', 'SC9863A Octa Core', 'Octa Core', '2.0GHz', '1.9 GHz', 'adapter', 'microsd', 'dual/dual', 1, '48MP', 'super', 1, '20MP', 'light', 'Rear Quad LED Flash | Front Screen Flash', 'dual/dual', '3G, 4G, 2G', 'GSM, WCDMA, 4G LTE', '4G, 3G, Wi-Fi', 1, 'google chrome', 1, 'v4.7', 1, '802.11 b/g/n', 1, '3.5mm', 'Fingerprint', 'Nano Sim', 'super adaptive', 'light', 'rawtian', 1, 1, 'H.264, H.263, MPEG-4', '6000 mAh', '75.4 mm', '158.3 mm', '75.3 mm', '190 g', '1 year', 11),
(40, 'Vivo V17', 'V17', '17', 'images/vivo_v17.jpg', 'Stunning pictures, enough space to store everything, and seamless performance - everything is possible with the Vivo V17 smartphone. It comes with features such as the Super Night mode, a quad-camera system (48 MP main camera + 8 MP super wide-angle camera + 2 MP macro camera + 2 MP bokeh camera), and a 32 MP front camera to help you capture gorgeous pictures. With the presence of a 4500 mAh battery, you can count on this phone to be by your side for work and leisure.', 'smartphones', 1, 'dual sim', 1, 1, '15.0cm', '1080*2340 Pixels', 'Full HD+', 'super light', 'Android 10', 'Qualcomm Snapdragon 660', 'Octa Core', '2.0GHz', '1.9 GHz', 'amitigo', 'microsd', 'dual/dual', 1, '48MP', 'super', 1, '20MP', 'seam', 'Rear and Front Screen Flash', 'dual/dual', '3G, 4G, 2G', 'GSM, WCDMA, 4G LTE', '4G, 3G, Wi-Fi', 1, 'google chrome', 1, 'v4.7', 1, '802.11 b/g/n', 1, '3.5mm', 'Fingerprint', 'Nano Sim', 'touch', 'super battery', 'rawtian', 1, 1, 'H.264, H.263, MPEG-4', '6000 mAh', '75.4 mm', '158.3 mm', '75.3 mm', '181 g', '1 year', 12),
(41, 'Lenovo Tab M10', 'M10', '10', 'images/lenovo_tab_WUIe3dw.jpg', '1 year manufacturer warranty for device and 6 months manufacturer warranty for in-box accessories including batteries from the date of purchase', 'smartphones', 1, 'dual sim', 1, 1, '16.0cm', '1080*2240 Pixels', 'Full HD+', 'super battery', '13.1', 'Qualcomm Snapdragon 660', 'Octa Core', '2.2 GHz', '1.9 GHz', 'amitog', 'microsd', 'dual/dual', 1, '48MP', 'rear', 1, '20MP', 'super', 'Rear and Front Screen Flash', 'dual/dual', '3G, 4G, 2G', 'GSM, WCDMA, 4G LTE', '4G, 3G, Wi-Fi', 1, 'google chrome', 1, 'v4.7', 1, '802.11 b/g/n', 1, '3.5mm', 'Fingerprint', 'Nano Sim', 'amtigo', 'super light', 'rawtian', 1, 1, 'H.264, H.263, MPEG-4', '5000 mAh', '8.3 mm', '158.3 mm', '75.3 mm', '194g', '1 year', 23),
(42, 'Apple iPad (7th Gen) 32', 'ipad', '12.3', 'images/apple_ipad.jpg', 'The 7th generation iPad comes with a Retina display and combines the power and capability of a computer. Powered by the advanced A10 Fusion chip, this lightweight and robust iPad comes with a versatile camera set-up. The built-in FaceTime HD camera helps you have video calls in a seamless manner, while the 8 MP rear shooter helps you take amazing pictures and record HD videos.', 'smartphones', 1, 'dual sim', 1, 1, '16.0cm', '1080*2240 Pixels', 'Full HD+', 'super light', 'iOS 13', 'Qualcomm Snapdragon 660', 'Octa Core', '2.0GHz', '1.9 GHz', '2.34GHz', 'microsd', 'dual/dual', 1, '48MP', 'rear', 1, '20MP', 'super light', 'Rear and Front Screen Flash', 'dual/dual', '3G, 4G, 2G', 'GSM, WCDMA, 4G LTE', '4G, 3G, Wi-Fi', 1, 'google chrome', 1, 'v4.7', 1, '802.11 b/g/n', 1, '3.5mm', 'Fingerprint', 'Nano Sim', 'super light', 'rear', 'A-GPS', 1, 1, 'H.264, H.263, MPEG-4', '8000mah', '79mm', '158.3 mm', '8.69mm', '207g', '1 year', 31),
(44, 'Honor Pad 5', 'Pad 5', 'JDN2-AL00HN', 'images/honor_teblet.jpg', 'Enjoy a true, cinematic experience while watching movies on the Honor Pad 5 Tablet, thanks to the 20.3-cm (8) Full HD screen and dual stereo speakers with Dolby Atmos surround sound. You can also experience a smooth and seamless gaming experience as this tablet is powered by a Kirin 710 chipset and an ARM Cortex-A73 processor. With this tablet, you can also develop a healthy device-usage habit as the Time Limit feature helps you effectively manage your screen time.', 'Tablets', 1, 'Single Sim', 0, 1, '20.32 cm (8 inch)', '1920 x 1200 Pixels', 'Full HD+', 'Full HD Multi touch IPS Display', 'Android 9', 'Kirin 710 (64-bit) Octa Core (4 x Cortex A73 at 2.2 GHz + 4 x Cortex A53 at 1.7 GHz)', 'Octa Core', '2.2 GHz', '1.7 GHz', 'Built-in Dual Stereo Speakers, Dolby Atmos Sound, GPU Turbo 2.0, Quick and Secure Face Unlock', 'MicroSD', 'Dedicated Slot', 1, '8 Megapixels', 'NAN', 1, '8 Megapixels', 'Autofocus Rear Camera and Fixed Focus Front Camera', 'NAN', 'NAN', '4G LTE, WCDMA, GSM', '4G LTE, WCDMA, GSM', '4G LTE, WCDMA, GSM', 1, 'Google Chrome', 1, 'v4.2', 1, '802.11a/b/g/n/ac', 1, '3.5mm', 'capacitive', 'Nano', 'Gravity Sensor', 'Bluetooth Support, 2.4 GHz and 5 GHz Dual Band Wireless Connectivity', 'A-GPS, GLONASS', 1, 1, 'MP4, 3GP, AVI', '5100 mAh', '125.2 mm', '209.8 mm', '8.5 mm', '250 g', '1 Year on Tablet, 6 Months on Battery', 33),
(45, 'Acer One 10', 'One 10', 'T8-129L', 'images/acer_jUvn3tP.jpg', 'The Acer One 10 is a handy tablet that comes with a clean and simple design that would impress anyone who sees it. Powered by a powerful quad-core processor and a 4GB of RAM, this tablet is ideal for multitasking. The Acer One 10 also comes equipped with an 8 MP primary camera and 5 MP front shooter that help you create memories by capturing amazing photographs.', 'Tablets', 1, 'Single Sim', 0, 1, '25.65 cm (10.1 inch)', '1280 x 800 Pixels', 'Full HD+', 'HD LED Backlit Multi Touch IPS Display (16:10 Aspect Ratio', 'Android 9', 'MT8766WA Quad Core (Cortex A53)', 'Quad Core', '2 GHz', '1.7 GHz', 'GSM: 850/900/1800/1900, WCDM: 900/2100, 4G LTE FDD: B3/B5/B40/B41', 'MicroSD', 'Dedicated Slot', 1, '8 Megapixels', 'NAN', 1, '5 Megapixels', 'Auto Focus Rear Camera, Digital Zoom', 'NAN', 'NAN', '4G LTE, 4G VoLTE, WCDMA, GSM', '4G LTE, 4G VoLTE, WCDMA, GSM', 'LTE', 1, 'Google Chrome', 1, 'v5.0', 1, 'IEEE 802.11 a/b/g/n/ac', 1, '3.5mm', 'capacitive', 'Nano', 'Accelerometer, Light Sensor, G Sensor', 'Bluetooth Support, Dual Band Support (2.4GHz | 5GHz)', 'A-GPS', 1, 1, 'MP4, 3GP, ASF, AVI, FLV, MKV, MPG, WEBM, WMV', '6600 mAh', '125.2 mm', '209.8 mm', '8.5 mm', '250 g', '1 Year Warranty', 34);

-- --------------------------------------------------------

--
-- Table structure for table `product_attributes`
--

DROP TABLE IF EXISTS `product_attributes`;
CREATE TABLE IF NOT EXISTS `product_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ram` varchar(255) NOT NULL,
  `rom` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_attributes_product_id_78966835` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=97 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_attributes`
--

INSERT INTO `product_attributes` (`id`, `ram`, `rom`, `color`, `price`, `stock`, `product_id`) VALUES
(10, '4 GB', '64 GB', 'Interstellar Black', 13999, 22, 17),
(11, '6 GB', '128 GB', 'Interstellar Black', 14999, 21, 17),
(12, '6 GB', '128 GB', 'Aurora Blue', 13999, 21, 17),
(16, '8 GB', '256 GB', 'Mystic Green', 77999, 28, 21),
(17, '12 GB', '256 GB', 'Mystic Black', 104999, 20, 21),
(18, '12 GB', '256 GB', 'Mystic Bronze', 104999, 20, 21),
(19, '8 GB', '256 GB', 'Piano Black', 27990, 18, 22),
(20, '8 GB', '256 GB', 'Mystic Silver', 27990, 20, 22),
(21, '8 GB', '128 GB', 'Mystic Silver', 24990, 20, 22),
(22, '8 GB', '128 GB', 'Piano Black', 24990, 20, 22),
(23, '6 GB', '128 GB', 'Dynamic Orange', 17990, 20, 23),
(24, '6 GB', '128 GB', 'Classic Silver', 17990, 20, 23),
(25, '8 GB', '128 GB', 'Classic Silver', 19990, 20, 23),
(26, '8 GB', '128 GB', 'Dynamic Orange', 17990, 20, 23),
(27, '4 GB', '16 GB', 'Blue', 11999, 6, 24),
(28, '4 GB', '32 GB', 'White', 13999, 11, 24),
(29, '8 GB', '32 GB', 'Black', 17999, 4, 24),
(30, '8 GB', '64 GB', 'Blue', 18000, 20, 25),
(31, '8 GB', '64 GB', 'White', 20000, 16, 25),
(32, '6 GB', '64 GB', 'White', 12500, 7, 25),
(33, '4 GB', '32 GB', 'Blue', 9500, 22, 25),
(34, '6 GB', '64 GB', 'Black', 18000, 4, 25),
(35, '6 GB', '6 GB', 'White', 68999, 6, 27),
(36, '8 GB', '128 GB', 'Blue', 78000, 4, 27),
(37, '6 GB', '64 GB', 'Black', 65000, 23, 27),
(38, '4 GB', '32 GB', 'White', 33000, 17, 27),
(39, '8 GB', '64 GB', 'Black', 48000, 15, 27),
(40, '8 GB', '32 GB', 'Blue', 13999, 22, 27),
(41, '6 GB', '32 GB', 'White', 17999, 23, 27),
(42, '4 GB', '16 GB', 'Black', 8999, 8, 27),
(43, '4 GB', '64 GB', 'Black', 15000, 20, 28),
(44, '8 GB', '64 GB', 'White', 13999, 21, 29),
(45, '8 GB', '64 GB', 'Black', 17999, 22, 29),
(46, '4 GB', '32 GB', 'Black', 9999, 7, 29),
(49, '8 GB', '64 GB', 'White', 17999, 31, 26),
(50, '4 GB', '32 GB', 'White', 9999, 25, 26),
(52, '8 GB', '64 GB', 'Blue', 13999, 22, 31),
(53, '4 GB', '16 GB', 'Black', 9999, 33, 31),
(54, '8 GB', '64 GB', 'White', 18000, 78, 31),
(55, '8 GB', '64 GB', 'Black', 18000, 55, 32),
(56, '8 GB', '64 GB', 'Blue', 17999, 22, 32),
(57, '4 GB', '32 GB', 'Blue', 11000, 66, 32),
(58, '8 GB', '64 GB', 'Black', 12500, 7, 33),
(59, '8 GB', '64 GB', 'Black', 34500, 22, 34),
(60, '8 GB', '64 GB', 'White', 36999, 22, 34),
(61, '8 GB', '64 GB', 'Blue', 38000, 23, 34),
(62, '8 GB', '64 GB', 'Black', 29999, 44, 35),
(63, '8 GB', '64 GB', 'Blue', 31500, 47, 35),
(64, '8 GB', '64 GB', 'White', 28500, 23, 35),
(65, '8 GB', '32 GB', 'Black', 27999, 55, 36),
(66, '8 GB', '64 GB', 'Blue', 34500, 28, 36),
(67, '8 GB', '64 GB', 'White', 38999, 41, 36),
(68, '8 GB', '64 GB', 'Blue', 22500, 7, 37),
(69, '8 GB', '64 GB', 'Silver', 18000, 67, 37),
(70, '8 GB', '64 GB', 'Blue', 21499, 22, 17),
(71, '4 GB', '32 GB', 'White', 12500, 23, 17),
(72, '8 GB', '64 GB', 'Silver', 17999, 22, 17),
(73, '8 GB', '64 GB', 'Black', 21500, 34, 38),
(74, '8 GB', '64 GB', 'Silver', 22500, 22, 38),
(75, '4 GB', '32 GB', 'Blue', 13999, 22, 38),
(76, '4 GB', '32 GB', 'Blue', 9999, 101, 39),
(77, '8 GB', '64 GB', 'Silver', 23500, 44, 39),
(78, '8 GB', '64 GB', 'Black', 26899, 7, 39),
(79, '8 GB', '64 GB', 'Midnight Ocean ', 23500, 25, 40),
(80, '8 GB', '64 GB', 'Black', 24899, 10, 40),
(81, '4 GB', '32 GB', 'Blue', 18000, 14, 40),
(82, '8 GB', '64 GB', 'Black', 18999, 44, 41),
(83, '4 GB', '16 GB', 'Blue', 9999, 25, 41),
(84, '8 GB', '64 GB', 'Silver', 19500, 22, 41),
(85, '8 GB', '64 GB', 'Black', 44300, 11, 42),
(86, '8 GB', '128 GB', 'Midnight Ocean ', 55000, 56, 42),
(87, '4 GB', '32 GB', 'White', 18000, 22, 42),
(88, '8 GB', '64 GB', 'Blue', 44300, 22, 42),
(89, '8 GB', '64 GB', 'Midnight Ocean ', 28000, 22, 28),
(92, '4 GB', '64 GB', 'Chiffon Pink', 30999, 20, 43),
(91, '4 GB', '64 GB', 'Angora Blue', 30999, 20, 43),
(90, '8 GB', '128 GB', 'White', 15500, 20, 33),
(93, '3 GB', '32 GB', 'Glacial Blue', 12999, 20, 44),
(94, '4 GB', '64 GB', 'Glacial Blue', 14999, 20, 44),
(95, '4 GB', '64 GB', 'Rose Gold', 13999, 19, 45);

-- --------------------------------------------------------

--
-- Table structure for table `product_image`
--

DROP TABLE IF EXISTS `product_image`;
CREATE TABLE IF NOT EXISTS `product_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(100) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_image_product_id_8b9355c5` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=158 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_image`
--

INSERT INTO `product_image` (`id`, `url`, `product_id`) VALUES
(33, 'images/mi_note_9_pro_5.jpg', 17),
(32, 'images/mi_note_9_pro_4.jpg', 17),
(31, 'images/mi_note_9_pro_3.jpg', 17),
(30, 'images/mi_note_9_pro_2.jpg', 17),
(49, 'images/vivo_v19_2.jpg', 22),
(50, 'images/vivo_v19_3.jpg', 22),
(51, 'images/vivo_v19_4.jpg', 22),
(47, 'images/sumsung_note_20_5.jpg', 21),
(34, 'images/mi_note_9_pro_6.jpg', 17),
(35, 'images/mi_note_9_pro_7.jpg', 17),
(46, 'images/sumsung_note_20_4.jpg', 21),
(44, 'images/sumsung_note_20_2.jpg', 21),
(45, 'images/sumsung_note_20_3.jpg', 21),
(48, 'images/vivo_v19_1.jpg', 22),
(52, 'images/oppo_f17_1.jpg', 23),
(53, 'images/oppo_f17_2.jpg', 23),
(54, 'images/oppo_f17_3.jpg', 23),
(55, 'images/oppo_f17_4.jpg', 23),
(60, 'images/nokia-4.jpeg', 24),
(59, 'images/nokia-3.jpeg', 24),
(62, 'images/nokia-5.jpeg', 24),
(63, 'images/moto2.jpeg', 25),
(64, 'images/moto5.jpeg', 25),
(65, 'images/moto-4.jpeg', 25),
(66, 'images/moto6.jpeg', 25),
(69, 'images/poco3.jpeg', 25),
(70, 'images/apple1.jpeg', 27),
(71, 'images/apple2.jpeg', 27),
(72, 'images/apple3.jpeg', 27),
(73, 'images/apple4.jpeg', 27),
(142, 'images/iphone_1_mSzf8P3.jpg', 34),
(76, 'images/nokia11.jpeg', 28),
(77, 'images/nokia12.jpeg', 28),
(78, 'images/nokia13.jpeg', 28),
(79, 'images/nokiac31.jpg', 28),
(80, 'images/nokiac3_2.jpg', 28),
(81, 'images/nokia_c33.jpg', 28),
(82, 'images/nokia_c3.jpg', 28),
(83, 'images/nokia_2.3_1.jpg', 29),
(151, 'images/nokia_2_3-3654_1.jpg', 29),
(150, 'images/Nokia_2.3_1_8C01arM.jpg', 29),
(155, 'images/honor_teblet3.jpg', 44),
(153, 'images/honor_teblet1.jpg', 44),
(154, 'images/honor_teblet2.jpg', 44),
(91, 'images/poco3_SXfl8nD.jpeg', 26),
(92, 'images/poco_2_1_0TREbjo.jpg', 26),
(93, 'images/poco_3__3_4NCXTpt.jpg', 26),
(94, 'images/poco_x1.jpg', 31),
(95, 'images/poco_x_2.jpg', 31),
(96, 'images/poco_x_3.jpg', 31),
(97, 'images/poco_x4.jpg', 31),
(98, 'images/oppo2_1.jpg', 32),
(100, 'images/oppo2_4.jpg', 32),
(101, 'images/oppo_45.jpg', 32),
(102, 'images/oppo_3_1.jpg', 33),
(103, 'images/oppo_3_2.jpg', 33),
(104, 'images/oppo_3_3.jpg', 33),
(105, 'images/oppo_3_4.jpg', 33),
(106, 'images/iphone_1.jpg', 34),
(107, 'images/iphone_3.jpg', 34),
(108, 'images/iphone_4.jpg', 34),
(143, 'images/se_apple_89VV4DN.jpg', 35),
(144, 'images/se_2_P8JZSq2.jpg', 35),
(112, 'images/se_4.jpg', 35),
(146, 'images/vivo_main_B7zWtnV.jpg', 36),
(114, 'images/vivo2.jpg', 36),
(115, 'images/vivo_3.jpg', 36),
(147, 'images/vivo-y91i-1_zeu0cdA.jpg', 36),
(118, 'images/2.jpg', 37),
(119, 'images/3.jpg', 37),
(120, 'images/4.jpg', 37),
(148, 'images/sams_M21_siyMCFj.jpg', 37),
(122, 'images/k20_1.jpg', 38),
(123, 'images/k20_3.jpg', 38),
(126, 'images/red_2.jpg', 39),
(125, 'images/k20_5.jpg', 38),
(127, 'images/red_3.jpg', 39),
(129, 'images/vivo_17_1.jpg', 40),
(130, 'images/vivo_17_4.jpg', 40),
(131, 'images/vivo_17_5.jpg', 40),
(132, 'images/vivo_17_6.jpg', 40),
(133, 'images/tab_1.jpg', 41),
(134, 'images/tab.jpg', 41),
(135, 'images/tab_4.jpg', 41),
(136, 'images/tab_5.jpg', 41),
(137, 'images/apple_ipad_2.jpg', 42),
(138, 'images/ipad_3.jpg', 42),
(139, 'images/ipad_4.jpg', 42),
(140, 'images/ipad_5.jpg', 42),
(141, 'images/ipad_6.jpg', 42),
(149, 'images/k20_LB3cZ59.jpg', 38),
(156, 'images/honor_teblet4.jpg', 44);

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
CREATE TABLE IF NOT EXISTS `rating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rating_user_id_029b834f` (`user_id`),
  KEY `rating_product_id_e5b0067d` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
CREATE TABLE IF NOT EXISTS `sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sales_date` date NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_order_id_8261c1ab` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `sales_date`, `order_id`) VALUES
(27, '2020-12-01', 58),
(26, '2020-12-01', 57);

-- --------------------------------------------------------

--
-- Table structure for table `sales_return`
--

DROP TABLE IF EXISTS `sales_return`;
CREATE TABLE IF NOT EXISTS `sales_return` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reason` longtext,
  `product_attributes_id` int(11) NOT NULL,
  `sales_id` int(11) NOT NULL,
  `sales_return_date` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_return_product_attributes_id_ad2cab92` (`product_attributes_id`),
  KEY `sales_return_sales_id_6b433189` (`sales_id`),
  KEY `sales_return_user_id_b14ce366` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
CREATE TABLE IF NOT EXISTS `state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`id`, `name`) VALUES
(26, 'Gujarat'),
(27, 'Bihar'),
(28, 'Delhi');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
