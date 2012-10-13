-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 04, 2012 at 04:14 PM
-- Server version: 5.5.24
-- PHP Version: 5.3.10-1ubuntu3.2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `eindian`
--

-- --------------------------------------------------------

--
-- Table structure for table `jos_xclosings`
--

CREATE TABLE IF NOT EXISTS `jos_xclosings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `distributor_id` int(11) DEFAULT NULL,
  `Closing_1_Count` int(11) DEFAULT NULL,
  `Closing_2_Count` int(11) DEFAULT NULL,
  `Closing_3_Count` int(11) DEFAULT NULL,
  `Level_1_Income` int(11) DEFAULT NULL,
  `Level_2_Income` int(11) DEFAULT NULL,
  `Level_3_Income` int(11) DEFAULT NULL,
  `Performance_2_Bonus` int(11) DEFAULT NULL,
  `Performance_3_Bonus` int(11) DEFAULT NULL,
  `Salary_1_Income` int(11) DEFAULT NULL,
  `Salary_2_Income` int(11) DEFAULT NULL,
  `TotalAmount` int(11) DEFAULT NULL,
  `TDS` int(11) DEFAULT NULL,
  `AdminCharge` float DEFAULT NULL,
  `NetAmount` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `jos_xpages`
--

INSERT INTO `jos_xpages` (`id`, `alias_for_id`, `alias`, `template`, `matter`) VALUES
(1, 1, 'root', 1, NULL),
(2, 2, 'en2', 1, ''),
(3, 3, 'en3', 1, ''),
(4, 4, 'en4', 1, ''),
(5, 5, 'en5', 1, ''),
(6, 6, 'en6', 1, ''),
(7, 7, 'en7', 1, ''),
(8, 8, 'nidhi', 1, 'this is my page matter, and this is very very long matter .this is my page matter, and this is very very long matter .this is my page matter, and this is very very long matter .this is my page matter, and this is very very long matter .this is my page matter, and this is very very long matter .this is my page matter, and this is very very long matter .this is my page matter, and this is very very long matter .this is my page matter, and this is very very long matter .this is my page matter, and this is very very long matter .this is my page matter, and this is very very long matter .this is my page matter, and this is very very long matter .this is my page matter, and this is very very long matter .this is my page matter, and this is very very long matter .'),
(9, 9, 'nrnr1', 1, ''),
(10, 10, 'nrnr2', 1, ''),
(11, 11, 'nrnr3', 1, ''),
(12, 12, 'nrnr4', 1, ''),
(13, 13, 'nrnr5', 1, ''),
(14, 14, 'nrnr6', 1, ''),
(15, 15, 'nrnr7', 1, ''),
(16, 16, 'nrnr8', 1, ''),
(17, 17, 'nrnr9', 1, ''),
(18, 18, 'nrnr10', 1, ''),
(19, 19, 'nrnr11', 1, ''),
(20, 20, 'nrnr12', 1, '');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `jos_xpersonaldetails`
--

INSERT INTO `jos_xpersonaldetails` (`id`, `fullname`, `address`, `mobile_no`, `distributor_id`, `username`, `password`, `page_alias`, `fathers_name`, `pan_no`, `bank_name`, `bank_branch`, `bank_account_no`, `bank_IFSC`) VALUES
(1, 'root', 'root', '123', 1, 'root', 'root', 'root', 'root', '', '', '', '', NULL),
(2, 'en2', 'e', 'e', 2, 'en2', 'en2', 'en2', 'e', 'e', 'e', 'e', 'e', 'e'),
(3, 'en3', 'e', 'e', 3, 'en3', 'en3', 'en3', 'e', 'e', 'e', 'e', 'e', 'e'),
(4, 'en4', 'e', 'e', 4, 'en4', 'en4', 'en4', 'en4', 'e', 'e', 'e', 'e', 'e'),
(5, 'en5', 'en5', 'e', 5, 'en5', 'en5', 'en5', 'en5', 'e', 'e', 'ee', 'e', 'e'),
(6, 'en6', 'e', 'e', 6, 'en6', 'en6', 'en6', 'e', 'e', 'e', 'e', 'e', 'e'),
(7, 'en7', 'e', 'e', 7, 'en7', 'en7', 'en7', 'e', 'e', 'e', 'e', 'e', 'e'),
(8, 'Nidhi Rawal', '', 'hjkhjkh', 8, 'nrnr', 'nrnr', 'nidhirawal', 'om narayan', '', 'hdfc', 'jhlk;k', 'lk;kl;;', ';kl;lk;'),
(9, 'Nidhi Rawal', '', '', 9, 'nrnr1', 'nrnr1', 'nrnr1', 'om narayan', 'i', 'i', 'i', 'i', 'i'),
(10, 'Nidhi Rawal', '', 'o', 10, 'nrnr2', 'nrnr2', 'nrnr2', 'om narayan', 'o', 'o', 'o', 'o', 'o'),
(11, 'Nidhi Rawal', 'oo', 'o', 11, 'nrnr3', 'nrnr3', 'nrnr3', 'om narayan', 'o', 'o', 'o', 'o', 'o'),
(12, 'Nidhi Rawal', 'o', 'o', 12, 'nrnr4', 'nrnr4', 'nrnr4', 'om narayan', 'o', 'o', 'o', 'o', 'o'),
(13, 'Nidhi Rawal', 'o', 'o', 13, 'nrnr5', 'nrnr5', 'nrnr5', 'om narayan', 'o', 'o', 'o', 'o', 'o'),
(14, 'Nidhi Rawal', 'o', 'o', 14, 'nrnr6', 'nrnr6', 'nrnr6', 'om narayan', 'o', 'o', 'o', 'o', 'o'),
(15, 'Nidhi Rawal', 'o', 'o', 15, 'nrnr7', 'nrnr7', 'nrnr7', 'om narayan', 'o', 'o', 'o', 'o', 'o'),
(16, 'Nidhi Rawal', 'o', 'o', 16, 'nrnr8', 'nrnr8', 'nrnr8', 'om narayan', 'o', 'o', 'o', 'o', 'o'),
(17, 'Nidhi Rawal', 'o', 'o', 17, 'nrnr9', 'nrnr9', 'nrnr9', 'om narayan', 'o', 'o', 'o', 'o', 'o'),
(18, 'Nidhi Rawal', 'o', 'o', 18, 'nrnr10', 'nrnr10', 'nrnr10', 'om narayan', 'o', 'o', 'o', 'o', 'o'),
(19, 'Nidhi Rawal', 'o', 'o', 19, 'nrnr11', 'nrnr11', 'nrnr11', 'om narayan', 'o', 'o', 'o', 'o', 'o'),
(20, 'Nidhi Rawal', 'o', 'o', 20, 'nrnr12', 'nrnr12', 'nrnr12', 'om narayan', 'o', 'oo', 'o', 'oo', 'o');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='	' AUTO_INCREMENT=22 ;

--
-- Dumping data for table `jos_xpin`
--

INSERT INTO `jos_xpin` (`id`, `Pin`, `assigned_to`, `is_used`, `For`) VALUES
(1, '0000-0000-0000-0000', 1, 1, 'Joining'),
(2, '4872-9606-4581-6632', 1, 1, 'Joining'),
(3, '7028-1313-4119-2203', 1, 1, 'Joining'),
(4, '8883-3988-8190-8606', 1, 1, 'Joining'),
(5, '2703-9053-5379-5215', 1, 1, 'Joining'),
(6, '2672-9016-1023-8020', 1, 1, 'Joining'),
(7, '4331-6678-5229-8133', 1, 1, 'Joining'),
(8, '7114-9766-7206-9094', 1, 1, 'Joining'),
(9, '3355-4916-5718-7227', 1, 1, 'Joining'),
(10, '4522-9300-3859-1551', 1, 1, 'Joining'),
(11, '9614-6978-2755-8497', 1, 1, 'Joining'),
(12, '9966-9945-7104-2670', 1, 1, 'Joining'),
(13, '8998-2483-6886-1671', 1, 1, 'Joining'),
(14, '1500-6909-8692-4832', 1, 1, 'Joining'),
(15, '3588-3922-2966-9703', 1, 1, 'Joining'),
(16, '3688-9172-8797-6043', 1, 1, 'Joining'),
(17, '4088-4516-3270-7611', 1, 1, 'Joining'),
(18, '3816-6130-8163-3430', 1, 1, 'Joining'),
(19, '3109-9918-1928-3075', 1, 1, 'Joining'),
(20, '9863-8032-4746-8862', 1, 1, 'Joining'),
(21, '9516-1633-9533-1017', 1, 0, 'Joining');

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
  `Closing_1_Count` int(11) DEFAULT NULL,
  `Closing_2_Count` int(11) DEFAULT NULL,
  `Closing_3_Count` int(11) DEFAULT NULL,
  `Total_1_Count` int(11) DEFAULT NULL,
  `Total_2_Count` int(11) DEFAULT NULL,
  `Total_3_Count` int(11) DEFAULT NULL,
  `is_level_1_completed` tinyint(4) DEFAULT NULL,
  `is_level_2_completed` tinyint(4) DEFAULT NULL,
  `is_level_3_completed` tinyint(4) DEFAULT NULL,
  `Salary_1_months` int(11) DEFAULT NULL,
  `Salary_2_months` int(11) DEFAULT NULL,
  `Level_2_Income` int(11) DEFAULT NULL,
  `Level_1_Income` int(11) DEFAULT NULL,
  `Level_3_Income` int(11) DEFAULT NULL,
  `Performance_2_Bonus` int(11) DEFAULT NULL,
  `Salary_1_Income` int(11) DEFAULT NULL,
  `Salary_2_Income` int(11) DEFAULT NULL,
  `TotalAmount` int(11) DEFAULT NULL,
  `TDS` float DEFAULT NULL,
  `AdminCharge` float DEFAULT NULL,
  `NetAmount` int(11) DEFAULT NULL,
  `JoiningDate` datetime DEFAULT NULL,
  `pin_id` int(11) DEFAULT NULL,
  `Performance_3_Bonus` int(11) DEFAULT NULL,
  `is_panvarified` tinyint(1) DEFAULT '0',
  `Performance_Given` int(11) DEFAULT '0',
  `Path` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `jos_xtreedetails`
--

INSERT INTO `jos_xtreedetails` (`id`, `sponsor_id`, `Closing_1_Count`, `Closing_2_Count`, `Closing_3_Count`, `Total_1_Count`, `Total_2_Count`, `Total_3_Count`, `is_level_1_completed`, `is_level_2_completed`, `is_level_3_completed`, `Salary_1_months`, `Salary_2_months`, `Level_2_Income`, `Level_1_Income`, `Level_3_Income`, `Performance_2_Bonus`, `Salary_1_Income`, `Salary_2_Income`, `TotalAmount`, `TDS`, `AdminCharge`, `NetAmount`, `JoiningDate`, `pin_id`, `Performance_3_Bonus`, `is_panvarified`, `Performance_Given`, `Path`) VALUES
(1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2012-10-01 00:00:00', 1, 0, 0, 0, '0'),
(2, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2012-10-03 00:00:00', 2, 0, 0, 0, '0.1'),
(3, 2, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2012-10-03 00:00:00', 3, 0, 0, 0, '0.1.1'),
(4, 3, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2012-10-03 00:00:00', 4, 0, 0, 0, '0.1.1.1'),
(5, 4, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2012-10-03 00:00:00', 5, 0, 0, 0, '0.1.1.1.1'),
(6, 5, 1, 1, 12, 1, 1, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2012-10-03 00:00:00', 6, 0, 0, 0, '0.1.1.1.1.1'),
(7, 6, 1, 12, 0, 1, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2012-10-03 00:00:00', 7, 0, 0, 0, '0.1.1.1.1.1.1'),
(8, 7, 12, 0, 0, 12, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2012-10-03 00:00:00', 8, 0, 0, 0, '0.1.1.1.1.1.1.1'),
(9, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2012-10-03 00:00:00', 9, 0, 0, 0, '0.1.1.1.1.1.1.1.1'),
(10, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2012-10-03 00:00:00', 10, 0, 0, 0, '0.1.1.1.1.1.1.1.2'),
(11, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2012-10-03 00:00:00', 11, 0, 0, 0, '0.1.1.1.1.1.1.1.3'),
(12, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2012-10-03 00:00:00', 12, 0, 0, 0, '0.1.1.1.1.1.1.1.4'),
(13, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2012-10-03 00:00:00', 13, 0, 0, 0, '0.1.1.1.1.1.1.1.5'),
(14, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2012-10-03 00:00:00', 14, 0, 0, 0, '0.1.1.1.1.1.1.1.6'),
(15, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2012-10-03 00:00:00', 15, 0, 0, 0, '0.1.1.1.1.1.1.1.7'),
(16, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2012-10-03 00:00:00', 16, 0, 0, 0, '0.1.1.1.1.1.1.1.8'),
(17, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2012-10-03 00:00:00', 17, 0, 0, 0, '0.1.1.1.1.1.1.1.9'),
(18, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2012-10-03 00:00:00', 18, 0, 0, 0, '0.1.1.1.1.1.1.1.10'),
(19, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2012-10-03 00:00:00', 19, 0, 0, 0, '0.1.1.1.1.1.1.1.11'),
(20, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2012-10-03 00:00:00', 20, 0, 0, 0, '0.1.1.1.1.1.1.1.12');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
