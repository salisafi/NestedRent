-- phpMyAdmin SQL Dump
-- version 3.2.5
-- http://www.phpmyadmin.net
--
-- Host: db-mysql.zenit
-- Generation Time: Oct 06, 2018 at 06:17 PM
-- Server version: 5.0.24
-- PHP Version: 5.4.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `prj566_182a08`
--

-- --------------------------------------------------------

--
-- Table structure for table `CategoryTbl`
--

CREATE TABLE IF NOT EXISTS `CategoryTbl` (
  `categoryId` smallint(5) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY  (`categoryId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `CategoryTbl`
--

INSERT INTO `CategoryTbl` (`categoryId`, `name`) VALUES
(1, 'Electronics'),
(3, 'Electronics');

-- --------------------------------------------------------

--
-- Table structure for table `ItemTbl`
--

CREATE TABLE IF NOT EXISTS `ItemTbl` (
  `itemId` smallint(5) unsigned NOT NULL,
  `categoryId` smallint(5) unsigned NOT NULL,
  `userId` smallint(5) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `brand` varchar(255) NOT NULL,
  `madeYear` year(4) default NULL,
  `color` varchar(15) NOT NULL,
  `weight` decimal(4,2) NOT NULL default '4.99',
  `purchasedYear` year(4) default NULL,
  `purchasedPrice` decimal(4,2) NOT NULL default '4.99',
  `postalCode` varchar(6) NOT NULL,
  `province` varchar(2) NOT NULL,
  `photoURL` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`itemId`),
  KEY `categoryId` (`categoryId`),
  KEY `userId` (`userId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ItemTbl`
--

INSERT INTO `ItemTbl` (`itemId`, `categoryId`, `userId`, `name`, `description`, `brand`, `madeYear`, `color`, `weight`, `purchasedYear`, `purchasedPrice`, `postalCode`, `province`, `photoURL`, `creationDate`) VALUES
(1, 2, 3, 'Sony Bluetooth Headphones', 'Sony MDR-XB650BT Extra Bass Wireless Bluetooth Headphones', 'Sony', 2017, 'Red', 99.99, 2018, 99.99, 'K6T5R4', 'ON', 'https://img.grouponcdn.com/deal/3JaYunFxA1cQX8oZ5bTKev4geZby/3J-1000x600/v1/c700x420.jpg', '2018-03-24 00:00:00'),
(2, 1, 2, 'MX 686G SPORTS', 'Durable Ear bud headset designed for those with an active lifestyle.', 'MX 686G SPORTS', 2016, 'Green', 30.00, 2017, 50.00, 'M8J0R4', 'ON', 'https://assets.sennheiser.com/img/5102/product_detail_x1_desktop_MX_686G-sq-01-sennheiser.jpg', '2018-05-17 00:00:00'),
(3, 3, 3, 'Bluetooth Headphones Over Ear, Hi-Fi Stereo Wireless', 'Bluetooth Headphones Over Ear, Hi-Fi Stereo Wireless Headset, Phones/TV (Red)', 'Sony', 2017, 'Red', 99.99, 2018, 99.99, 'K6T5R4', 'ON', 'https://images-na.ssl-images-amazon.com/images/G/15/apparel/rcxgs/tile._CB211469167_.gif', '2018-05-03 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `OrderLineTbl`
--

CREATE TABLE IF NOT EXISTS `OrderLineTbl` (
  `orderLineId` smallint(5) unsigned NOT NULL,
  `orderId` smallint(5) unsigned NOT NULL,
  `itemId` smallint(5) unsigned NOT NULL,
  `rentalStartDate` date NOT NULL,
  `rentalEndDate` date NOT NULL,
  `rentPerDay` decimal(4,2) NOT NULL,
  `depositPrice` decimal(4,2) NOT NULL,
  `quantity` int(11) NOT NULL default '1',
  PRIMARY KEY  (`orderId`),
  KEY `itemId` (`itemId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `OrderLineTbl`
--


-- --------------------------------------------------------

--
-- Table structure for table `OrderTbl`
--

CREATE TABLE IF NOT EXISTS `OrderTbl` (
  `orderId` smallint(5) unsigned NOT NULL,
  `creationDate` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `total` decimal(4,2) NOT NULL,
  PRIMARY KEY  (`orderId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `OrderTbl`
--


-- --------------------------------------------------------

--
-- Table structure for table `PaymentTbl`
--

CREATE TABLE IF NOT EXISTS `PaymentTbl` (
  `paymentId` smallint(5) unsigned NOT NULL,
  `invoiceId` smallint(5) unsigned NOT NULL,
  `userId` smallint(5) unsigned NOT NULL,
  `creationDate` date NOT NULL,
  `amount` decimal(4,2) NOT NULL default '4.99',
  `status` smallint(6) NOT NULL,
  PRIMARY KEY  (`paymentId`),
  KEY `invoiceId` (`invoiceId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `PaymentTbl`
--


-- --------------------------------------------------------

--
-- Table structure for table `rentalItem`
--

CREATE TABLE IF NOT EXISTS `rentalItem` (
  `itemId` smallint(5) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `itemLine` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `madeYear` year(4) default NULL,
  `purchasedYear` year(4) default NULL,
  `purchasedPrice` decimal(4,2) NOT NULL default '4.99',
  `rentalRate` decimal(4,2) NOT NULL default '4.99',
  `weight` decimal(4,2) NOT NULL default '4.99',
  `color` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `photoURL` varchar(255) NOT NULL,
  `deposit_asked` decimal(4,2) NOT NULL default '4.99',
  `replacement_cost` decimal(5,2) NOT NULL default '19.99',
  `rate_feedback` smallint(6) default NULL,
  PRIMARY KEY  (`itemId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rentalItem`
--

INSERT INTO `rentalItem` (`itemId`, `name`, `itemLine`, `description`, `madeYear`, `purchasedYear`, `purchasedPrice`, `rentalRate`, `weight`, `color`, `location`, `photoURL`, `deposit_asked`, `replacement_cost`, `rate_feedback`) VALUES
(1, 'Motorola Power Pack', 'Electronic', 'Motorola IncipioÆ Offgridô Power Pack for Moto Z Phone', 2009, 2011, 20.25, 2.50, 10.00, 'black', 'US', 'http://google.com', 18.45, 20.00, 5),
(2, 'PopSockets Expanding Grip', 'Electronic', 'PopSockets Expanding Grip & Stand for Smartphone & Tablets - Blue Marble', 2014, 2016, 85.95, 70.50, 55.00, 'white', 'CA', 'http://google.com', 70.45, 10.00, 4),
(3, 'Nexxtech Micro USB Cable', 'Electronic', 'Nexxtech Micro USB Male to A Female OTG Cable', 2014, 2016, 85.95, 70.50, 15.00, 'white', 'CA', 'http://google.com', 70.45, 10.00, 2);

-- --------------------------------------------------------

--
-- Table structure for table `ReviewTbl`
--

CREATE TABLE IF NOT EXISTS `ReviewTbl` (
  `reviewId` smallint(5) unsigned NOT NULL,
  `type` smallint(6) NOT NULL,
  `invoiceId` smallint(5) unsigned NOT NULL,
  `userId` smallint(5) unsigned NOT NULL,
  `creationDate` date NOT NULL,
  `amount` decimal(4,2) NOT NULL default '4.99',
  PRIMARY KEY  (`reviewId`),
  KEY `invoiceId` (`invoiceId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ReviewTbl`
--


-- --------------------------------------------------------

--
-- Table structure for table `UserTbl`
--

CREATE TABLE IF NOT EXISTS `UserTbl` (
  `userId` int(11) NOT NULL,
  `firstName` varchar(30) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `userName` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `roles` varchar(20) NOT NULL default 'borrower',
  `emailAddress` varchar(100) NOT NULL,
  `phoneNumber` int(11) NOT NULL,
  `postalCode` varchar(6) NOT NULL,
  `province` varchar(2) NOT NULL,
  `registrationDate` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`userId`),
  UNIQUE KEY `userName` (`userName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `UserTbl`
--

INSERT INTO `UserTbl` (`userId`, `firstName`, `lastName`, `userName`, `password`, `roles`, `emailAddress`, `phoneNumber`, `postalCode`, `province`, `registrationDate`) VALUES
(1, 'Sali', 'Safi', 'SSAFI', 'SSSSSSS', 'lender', 'ssasi@myseneca.ca', 0, 'L3T2E9', 'ON', '2018-03-22 00:00:00'),
(2, 'Minuk', 'Minuk', 'Minuk', 'MMMMMM', 'lender', 'minuk@myseneca.ca', 0, 'L3T5F9', 'ON', '2017-07-02 00:00:00'),
(3, 'Wonkie', 'Wonkie', 'Wonkie', 'WWWW', 'borrower', 'wonki@myseneca.ca', 0, 'K6Y5F9', 'ON', '2016-02-09 00:00:00');
