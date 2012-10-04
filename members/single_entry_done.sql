-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 18, 2012 at 10:37 AM
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
  PRIMARY KEY (`id`),
  KEY `fk_jos_xpersonaldetails_jos_xtreedetails` (`distributor_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `jos_xpersonaldetails`
--

INSERT INTO `jos_xpersonaldetails` (`id`, `fullname`, `address`, `mobile_no`, `distributor_id`, `username`, `password`, `page_alias`) VALUES
(1, 'root', 'address', '123', 1, 'root', 'admin', 'root');

-- --------------------------------------------------------

--
-- Table structure for table `jos_xtreedetails`
--

CREATE TABLE IF NOT EXISTS `jos_xtreedetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sponsor_id` int(11) DEFAULT NULL,
  `introducer_id` int(11) DEFAULT NULL,
  `members_in_down` int(11) DEFAULT NULL,
  `is_agent` tinyint(1) DEFAULT '0',
  `joining_date` datetime DEFAULT NULL,
  `agent_date` datetime DEFAULT NULL,
  `todays_agents_in_down` int(11) DEFAULT NULL,
  `total_agents_in_down` int(11) DEFAULT NULL,
  `is_royalty_taken` tinyint(1) DEFAULT '0',
  `LegA` int(11) DEFAULT '0',
  `LegB` int(11) DEFAULT '0',
  `LegC` int(11) DEFAULT '0',
  `LegD` int(11) DEFAULT '0',
  `Path` text,
  `group_no` int(11) DEFAULT NULL,
  `DirectIncome` int(11) DEFAULT NULL,
  `AgentIncome` int(11) DEFAULT NULL,
  `RoyaltyIncome` int(11) DEFAULT NULL,
  `LastCarryAmount` int(11) DEFAULT NULL,
  `TotalAmount` int(11) DEFAULT NULL,
  `TDS` float DEFAULT NULL,
  `AdminCharge` float DEFAULT NULL,
  `NetAmount` float DEFAULT NULL,
  `CarryAmount` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `jos_xtreedetails`
--

INSERT INTO `jos_xtreedetails` (`id`, `sponsor_id`, `introducer_id`, `members_in_down`, `is_agent`, `joining_date`, `agent_date`, `todays_agents_in_down`, `total_agents_in_down`, `is_royalty_taken`, `LegA`, `LegB`, `LegC`, `LegD`, `Path`, `group_no`, `DirectIncome`, `AgentIncome`, `RoyaltyIncome`, `LastCarryAmount`, `TotalAmount`, `TDS`, `AdminCharge`, `NetAmount`, `CarryAmount`) VALUES
(1, 0, 0, 0, 0, '2012-09-18 00:00:00', NULL, 0, 0, 0, 0, 0, 0, 0, '0', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jos_xpersonaldetails`
--
ALTER TABLE `jos_xpersonaldetails`
  ADD CONSTRAINT `fk_jos_xpersonaldetails_jos_xtreedetails` FOREIGN KEY (`distributor_id`) REFERENCES `jos_xtreedetails` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
