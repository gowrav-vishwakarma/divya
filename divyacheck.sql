-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 13, 2012 at 11:21 PM
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
  `LastCarryAmount` int(11) DEFAULT NULL,
  `ClosingCarryAmount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_xpages`
--

CREATE TABLE IF NOT EXISTS `jos_xpages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alias_for_id` int(11) DEFAULT NULL,
  `alias` varchar(45) DEFAULT NULL,
  `template` int(11) DEFAULT '1',
  `matter` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `jos_xpages`
--

INSERT INTO `jos_xpages` (`id`, `alias_for_id`, `alias`, `template`, `matter`) VALUES
(1, 1, 'root', 1, NULL),
(2, 2, 'a', 1, NULL),
(3, 3, 'b', 1, NULL),
(4, 4, 'c', 1, NULL),
(5, 5, 'e', 1, NULL),
(6, 6, 'f', 1, NULL),
(7, 7, 'g', 1, NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `jos_xpersonaldetails`
--

INSERT INTO `jos_xpersonaldetails` (`id`, `fullname`, `address`, `mobile_no`, `distributor_id`, `username`, `password`, `page_alias`, `fathers_name`, `pan_no`, `bank_name`, `bank_branch`, `bank_account_no`, `bank_IFSC`) VALUES
(1, 'root', 'address', '1234567890', 1, 'root', 'root', 'root', 'fname', '1234567890', 'a', 'b', 'c', NULL),
(2, 'A', 'a', 'a', 2, 'a', 'a', NULL, 'a', 'a', 'a', 'a', 'a', 'a'),
(3, 'B', 'b', 'b', 3, 'b', 'b', NULL, 'b', 'b', 'b', 'b', 'b', 'b'),
(4, 'C', 'c', 'c', 4, 'c', 'c', NULL, 'c', 'c', 'c', 'c', 'c', 'c'),
(5, 'e', 'e', 'e', 5, 'e', 'e', NULL, 'e', 'e', 'e', 'e', 'e', 'e'),
(6, 'f', 'f', 'f', 6, 'f', 'f', NULL, 'f', 'f', 'f', 'f', 'f', 'f'),
(7, 'g', 'g', 'g', 7, 'g', 'g', NULL, 'g', 'g', 'g', 'g', 'g', 'g');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='	' AUTO_INCREMENT=8 ;

--
-- Dumping data for table `jos_xpin`
--

INSERT INTO `jos_xpin` (`id`, `Pin`, `assigned_to`, `is_used`, `For`) VALUES
(1, '0000-0000-0000-0000', 1, 1, 'Joining'),
(2, '3624-1300-7001-3903', 1, 1, 'Joining'),
(3, '5662-5226-7584-4401', 1, 1, 'Joining'),
(4, '4724-1525-6469-7977', 1, 1, 'Joining'),
(5, '5137-7026-2683-7489', 1, 1, 'Joining'),
(6, '9710-3237-4690-7328', 1, 1, 'Joining'),
(7, '8953-7917-4739-4988', 1, 1, 'Joining');

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
(1, 'admin', 'admin', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jos_xtreedetails`
--

CREATE TABLE IF NOT EXISTS `jos_xtreedetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Total_members_in_down` int(11) DEFAULT '0',
  `sponsor_id` int(11) DEFAULT '0',
  `Closing_1_agent_count` int(11) DEFAULT '0',
  `Closing_2_agent_count` int(11) DEFAULT '0',
  `Closing_3_agent_count` int(11) DEFAULT '0',
  `salary_month` int(11) DEFAULT '0',
  `is_level_2_agents_completed` tinyint(4) DEFAULT '0',
  `Total_2_agent_count` int(11) NOT NULL,
  `Self_Agent_Income` int(11) DEFAULT '0',
  `Level_1_Agent_Income` int(11) DEFAULT '0',
  `Level_2_Agent_Income` int(11) DEFAULT '0',
  `Level_3_Agent_Income` int(11) DEFAULT '0',
  `Salary_Income` int(11) DEFAULT '0',
  `Closing_4_agent_count` int(11) DEFAULT '0',
  `Royalty_Income` int(11) DEFAULT '0',
  `Total_Income` int(11) DEFAULT '0',
  `TDS` float DEFAULT '0',
  `Admin_Charge` float DEFAULT '0',
  `Net_Amount` int(11) DEFAULT '0',
  `is_new` int(11) DEFAULT '1',
  `Level_4_Agent_Income` int(11) DEFAULT NULL,
  `is_panvarified` tinyint(4) DEFAULT NULL,
  `is_agent` tinyint(4) DEFAULT '0',
  `pin_id` int(11) DEFAULT '0',
  `ClosingCarryAmount` int(11) DEFAULT '0',
  `LastCarryAmount` int(11) DEFAULT '0',
  `Path` varchar(45) DEFAULT NULL,
  `JoiningDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `jos_xtreedetails`
--

INSERT INTO `jos_xtreedetails` (`id`, `Total_members_in_down`, `sponsor_id`, `Closing_1_agent_count`, `Closing_2_agent_count`, `Closing_3_agent_count`, `salary_month`, `is_level_2_agents_completed`, `Total_2_agent_count`, `Self_Agent_Income`, `Level_1_Agent_Income`, `Level_2_Agent_Income`, `Level_3_Agent_Income`, `Salary_Income`, `Closing_4_agent_count`, `Royalty_Income`, `Total_Income`, `TDS`, `Admin_Charge`, `Net_Amount`, `is_new`, `Level_4_Agent_Income`, `is_panvarified`, `is_agent`, `pin_id`, `ClosingCarryAmount`, `LastCarryAmount`, `Path`, `JoiningDate`) VALUES
(1, 6, 0, 0, 0, 0, 0, 0, 0, 7500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0, 0, NULL, '2012-10-01 00:00:00'),
(2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 2, 0, 0, '.1', '0000-00-00 00:00:00'),
(3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 3, 0, 0, '.2', '0000-00-00 00:00:00'),
(4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 4, 0, 0, '.3', '0000-00-00 00:00:00'),
(5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 5, 0, 0, '.4', '0000-00-00 00:00:00'),
(6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 6, 0, 0, '.5', '0000-00-00 00:00:00'),
(7, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 7, 0, 0, '.6', '0000-00-00 00:00:00');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
