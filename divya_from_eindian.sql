-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 05, 2012 at 01:42 PM
-- Server version: 5.5.24
-- PHP Version: 5.3.10-1ubuntu3.2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `divya`
--

-- --------------------------------------------------------

--
-- Table structure for table `jos_xclosings`
--

CREATE TABLE IF NOT EXISTS `jos_xclosings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `distributor_id` int(11) DEFAULT NULL,
  `Closing_1_agent_count` int(11) DEFAULT NULL,
  `Closing_2_agent_count` int(11) DEFAULT NULL,
  `Closing_3_agent_count` int(11) DEFAULT NULL,
  `Level_1_Agent_Income` int(11) DEFAULT NULL,
  `Level_2_Agent_Income` int(11) DEFAULT NULL,
  `Level_3_Agent_Income` int(11) DEFAULT NULL,
  `Salary_Income` int(11) DEFAULT NULL,
  `Royalty_Income` float DEFAULT NULL,
  `TotalAmount` float DEFAULT NULL,
  `TDS` float DEFAULT NULL,
  `AdminCharge` float DEFAULT NULL,
  `NetAmount` float DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_xpages`
--

CREATE TABLE IF NOT EXISTS `jos_xpages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `distributor_id` int(11) DEFAULT NULL,
  `alias` varchar(45) DEFAULT NULL,
  `template` int(11) DEFAULT '1',
  `matter` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_xpersonaldetails`
--

CREATE TABLE IF NOT EXISTS `jos_xpersonaldetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(100) DEFAULT NULL,
  `address` text,
  `mobile_no` varchar(45) DEFAULT NULL,
  `distributor_id` int(11) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `page_alias` varchar(45) DEFAULT NULL,
  `fathers_name` varchar(45) DEFAULT NULL,
  `pan_no` varchar(10) DEFAULT NULL,
  `bank_name` varchar(45) DEFAULT NULL,
  `bank_branch` varchar(45) DEFAULT NULL,
  `bank_account_no` varchar(45) DEFAULT NULL,
  `bank_IFSC` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_jos_xpersonaldetails_jos_xtreedetails` (`distributor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_xpin`
--

CREATE TABLE IF NOT EXISTS `jos_xpin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '	',
  `Pin` varchar(45) DEFAULT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `is_used` tinyint(4) DEFAULT NULL,
  `For` varchar(45) DEFAULT 'Joining',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='	' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_xstaff`
--

CREATE TABLE IF NOT EXISTS `jos_xstaff` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '			',
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `AccessLevel` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='		' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `jos_xstaff`
--

INSERT INTO `jos_xstaff` (`id`, `username`, `password`, `AccessLevel`) VALUES
(1, 'root', 'admin', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jos_xtreedetails`
--

CREATE TABLE IF NOT EXISTS `jos_xtreedetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sponsor_id` int(11) DEFAULT NULL,
  `Closing_1_agent_count` int(11) DEFAULT NULL,
  `Total_members_in_down` int(11) DEFAULT NULL,
  `Closing_2_agent_count` int(11) DEFAULT NULL,
  `Total_2_agent_count` int(11) NOT NULL,
  `Closing_3_agent_count` int(11) DEFAULT NULL,
  `salary_month` int(11) DEFAULT '0',
  `is_level_2_agents_completed` tinyint(4) DEFAULT '0',
  `Self_Agent_Income` int(11) DEFAULT '0',
  `Level_1_Agent_Income` int(11) DEFAULT '0',
  `Level_2_Agent_Income` int(11) DEFAULT '0',
  `Level_3_Agent_Income` int(11) DEFAULT '0',
  `Salary_Income` int(11) DEFAULT '0',
  `Royalty_Income` int(11) DEFAULT '0',
  `Total_Income` int(11) DEFAULT '0',
  `TDS` float DEFAULT '0',
  `Admin_Charge` float DEFAULT '0',
  `Net_Amount` int(11) DEFAULT '0',
  `is_new` int(11) DEFAULT '1',
  `Joining_Date` datetime DEFAULT NULL,
  `is_panvarified` tinyint(4) DEFAULT NULL,
  `is_agent` tinyint(4) DEFAULT NULL,
  `jos_xtreedetailscol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
