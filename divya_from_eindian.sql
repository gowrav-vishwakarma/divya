-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 05, 2012 at 09:05 AM
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
-- Table structure for table `jos_xpages`
--

CREATE TABLE IF NOT EXISTS `jos_xpages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `distributor_id` int(11) DEFAULT NULL,
  `alias` varchar(45) DEFAULT NULL,
  `template` int(11) DEFAULT '1',
  `matter` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=47 ;

--
-- Dumping data for table `jos_xpages`
--

INSERT INTO `jos_xpages` (`id`, `distributor_id`, `alias`, `template`, `matter`) VALUES
(3, 2, 'a', 1, NULL),
(4, 3, 'B', 1, NULL),
(5, 4, 'c', 1, NULL),
(6, 5, 'D', 1, NULL),
(7, 6, 'e', 1, NULL),
(8, 7, 'f', 1, NULL),
(9, 8, 'g', 1, NULL),
(10, 9, 'h', 1, NULL),
(11, 10, 'I', 1, NULL),
(12, 11, 'j', 1, NULL),
(13, 12, 'k', 1, NULL),
(14, 13, 'l', 1, NULL),
(15, 14, 'm', 1, NULL),
(16, 15, 'n', 1, NULL),
(17, 16, 'o', 1, NULL),
(18, 17, 'p', 1, NULL),
(19, 18, 'q', 1, NULL),
(20, 19, 'r', 1, NULL),
(22, 20, 's', 1, NULL),
(23, 21, 't', 1, NULL),
(24, 5, 'D_1', 1, 'this is d_1 page'),
(25, 5, 'D', 1, 'This is D Matter edited'),
(26, 5, 'D', 1, 'This is D Matter edited'),
(27, 5, 'D', 1, 'This is D Matter edited 2'),
(28, 5, 'D', 1, 'This is D Matter edited'),
(31, 1, 'root', 1, 'this is gonna be very very very long text and even copied and paseted ..this is gonna be very very very long text and even copied and paseted ..this is gonna be very very very long text and even copied and paseted ..this is gonna be very very very long text and even copied and paseted ..this is gonna be very very very long text and even copied and paseted ..this is gonna be very very very long text and even copied and paseted ..this is gonna be very very very long text and even copied and paseted ..this is gonna be very very very long text and even copied and paseted ..this is gonna be very very very long text and even copied and paseted ..this is gonna be very very very long text and even copied and paseted ..this is gonna be very very very long text and even copied and paseted ..dfdfdfd 345353'),
(44, 1, 'root555', 1, 'sdjhfkjdshfjhkjflkjkaj\r\nfakjdfljfjkjg\r\n;adgk;gklkgl;gk\r\nggk;lgkl;dgk;lkrlglpl'),
(45, 1, 'root5555', 1, 'skdjf 546465qqq'),
(46, 5, 'gfdgfd', 1, NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `jos_xpersonaldetails`
--

INSERT INTO `jos_xpersonaldetails` (`id`, `fullname`, `address`, `mobile_no`, `distributor_id`, `username`, `password`, `page_alias`, `fathers_name`, `pan_no`, `bank_name`, `bank_branch`, `bank_account_no`, `bank_IFSC`) VALUES
(1, 'root', 'eindian', '12345678901111', 1, 'root', 'admin', 'root', 'rootfather', '', 'sbbj', 'surajpol', '1323244', 'jhghg'),
(2, 'A', 'jkhdfjhfjkh', '1213242434', 2, NULL, '123', 'a', 'F', '1222452536', 'hdfc', 'uda', 'hjhjh', 'lklkk'),
(3, 'B', '', '', 3, NULL, '123', 'B', 'f', '', 'b', 'h', 'h', '7'),
(4, 'C', 'jhj', '1', 4, NULL, '1', 'c', 'F', '1', '1', '1', '1', '1'),
(5, 'D', '1', '1', 5, NULL, '1', 'D', '1', '1', '1', '1', '1', '1'),
(6, 'E', 'e', 'e', 6, NULL, 'e', 'e', 'e', 'e', 'e', 'e', 'e', 'e'),
(7, 'F', 'f', 'f', 7, NULL, 'f', 'f', 'f', 'f', 'f', 'f', 'ff', 'f'),
(8, 'G', 'g', 'g', 8, NULL, 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g'),
(9, 'H', 'h', 'h', 9, NULL, 'h', 'h', 'H', 'h', 'h', 'h', 'h', 'h'),
(10, 'I', 'I', 'I', 10, NULL, 'I', 'I', 'I', 'I', 'I', 'I', 'I', 'I'),
(11, 'J', 'j', 'j', 11, NULL, 'j', 'j', 'j', 'j', 'j', 'j', 'j', 'j'),
(12, 'K', 'k', 'k', 12, NULL, 'k', 'k', 'k', 'kk', 'k', 'k', 'k', 'k'),
(13, 'L', 'L', 'L', 13, NULL, 'l', 'l', 'L', 'l', 'l', 'l', 'l', 'l'),
(14, 'M', 'm', 'm', 14, NULL, 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm'),
(15, 'N', 'n', 'n', 15, NULL, 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n'),
(16, 'O', 'o', 'o', 16, NULL, 'o', 'o', 'o', 'o', 'o', 'o', 'o', 'o'),
(17, 'P', 'p', 'p', 17, NULL, 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p'),
(18, 'Q', 'q', 'q', 18, NULL, 'q', 'q', 'q', 'q', 'q', 'q', 'q', 'q'),
(19, 'R', 'r', 'r', 19, NULL, 'r', 'r', 'r', 'r', 'r', 'r', 'r', 'r'),
(20, 'S', 's', 's', 20, NULL, 's', 's', 's', 's', 's', 's', 's', 's'),
(21, 'T', 't', 't', 21, NULL, 't', 't', 't', 't', 't', 't', 't', 't');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='	' AUTO_INCREMENT=120 ;

--
-- Dumping data for table `jos_xpin`
--

INSERT INTO `jos_xpin` (`id`, `Pin`, `assigned_to`, `is_used`, `For`) VALUES
(1, '0000-0000-0000-0000', 1, 1, 'Joining'),
(2, '6846-6850-1375-4965', 1, 1, 'Joining'),
(3, '2425-1540-3460-9996', 1, 1, 'Joining'),
(4, '4010-5850-2893-1400', 1, 1, 'Joining'),
(5, '8293-2526-9057-1677', 1, 1, 'Joining'),
(6, '2591-7769-8493-7645', 1, 1, 'Joining'),
(7, '6904-3847-3778-9212', 1, 1, 'Joining'),
(8, '1001-5610-9926-9541', 1, 1, 'Joining'),
(9, '6953-7861-7150-5656', 1, 1, 'Joining'),
(10, '1547-2935-2585-4750', 1, 1, 'Joining'),
(11, '3818-7888-8826-2781', 1, 1, 'Joining'),
(12, '6951-1425-6564-3827', 1, 1, 'Joining'),
(13, '5128-1519-5716-3491', 1, 1, 'Joining'),
(14, '3782-7103-8087-3367', 1, 1, 'Joining'),
(15, '8857-8727-3141-8858', 1, 1, 'Joining'),
(16, '4338-3067-8400-1292', 1, 1, 'Joining'),
(17, '9929-5550-5948-1476', 1, 1, 'Joining'),
(18, '7486-7533-5227-1304', 1, 1, 'Joining'),
(19, '5421-4053-3085-2373', 1, 1, 'Joining'),
(20, '4479-8650-5201-8607', 1, 1, 'Joining'),
(21, '9169-9917-2099-2952', 1, 1, 'Joining'),
(22, '7020-9186-5319-5877', 1, 0, 'Joining'),
(23, '7914-7460-4736-2252', 1, 0, 'Joining'),
(24, '9528-3136-2544-9457', 1, 0, 'Joining'),
(25, '7687-7493-9933-5173', 1, 0, 'Joining'),
(26, '5027-5161-5478-9449', 1, 0, 'Joining'),
(27, '8214-7563-1822-2694', 1, 0, 'Joining'),
(28, '6213-6024-1301-5383', 1, 0, 'Joining'),
(29, '5941-2400-7335-2961', 1, 0, 'Joining'),
(30, '1587-2655-7839-8501', 1, 0, 'Joining'),
(31, '9116-2576-9753-8644', 1, 0, 'Joining'),
(32, '4712-2298-8102-2400', 1, 0, 'Joining'),
(33, '8791-8036-6574-3818', 1, 0, 'Joining'),
(34, '3197-2052-3267-1412', 1, 0, 'Joining'),
(35, '8616-4090-3106-4830', 1, 0, 'Joining'),
(36, '9114-3408-9213-5056', 1, 0, 'Joining'),
(37, '4808-6549-7018-5396', 1, 0, 'Joining'),
(38, '8205-4857-3897-7321', 1, 0, 'Joining'),
(39, '6433-3651-5966-1146', 1, 0, 'Joining'),
(40, '4950-4069-2546-3742', 1, 0, 'Joining'),
(41, '2105-8120-6560-4303', 1, 0, 'Joining'),
(42, '9173-8828-4715-7789', 1, 0, 'Joining'),
(43, '2919-6822-2619-2033', 1, 0, 'Joining'),
(44, '9230-1832-6090-4039', 1, 0, 'Joining'),
(45, '7382-3108-8435-5587', 1, 0, 'Joining'),
(46, '6966-2333-2909-3399', 1, 0, 'Joining'),
(47, '4985-7876-3546-8935', 1, 0, 'Joining'),
(48, '1945-5093-2677-3050', 1, 0, 'Joining'),
(49, '3214-8238-6354-2387', 1, 0, 'Joining'),
(50, '7066-1069-9176-8985', 1, 0, 'Joining'),
(51, '6892-1795-1019-6122', 1, 0, 'Joining'),
(52, '2628-6110-9161-9011', 1, 0, 'Joining'),
(53, '8218-7597-4598-5184', 1, 0, 'Joining'),
(54, '8930-6508-7584-3915', 1, 0, 'Joining'),
(55, '4384-1131-2851-5329', 1, 0, 'Joining'),
(56, '5224-4528-7380-7439', 1, 0, 'Joining'),
(57, '2766-3734-8826-8833', 1, 0, 'Joining'),
(58, '3804-8003-7819-9696', 1, 0, 'Joining'),
(59, '8799-7839-5819-1427', 1, 0, 'Joining'),
(60, '3949-4981-9439-2167', 1, 0, 'Joining'),
(61, '2578-4038-6352-1508', 1, 0, 'Joining'),
(62, '9546-3937-4424-3930', 1, 0, 'Joining'),
(63, '4068-6275-8260-8292', 1, 0, 'Joining'),
(64, '9804-5641-5731-2571', 1, 0, 'Joining'),
(65, '8376-4558-1405-2181', 1, 0, 'Joining'),
(66, '2561-8224-1878-1360', 1, 0, 'Joining'),
(67, '6064-6697-1788-9013', 1, 0, 'Joining'),
(68, '1678-1228-1181-3256', 1, 0, 'Joining'),
(69, '4266-6533-3765-3812', 1, 0, 'Joining'),
(70, '9470-7190-6743-3539', 1, 0, 'Joining'),
(71, '3466-5004-1832-3270', 1, 0, 'Joining'),
(72, '9645-6564-4842-8022', 1, 0, 'Joining'),
(73, '1122-5247-9203-2684', 1, 0, 'Joining'),
(74, '3472-1081-3045-8536', 1, 0, 'Joining'),
(75, '6778-3834-7549-7457', 1, 0, 'Joining'),
(76, '4062-7731-9713-7328', 1, 0, 'Joining'),
(77, '4265-3479-1141-3735', 1, 0, 'Joining'),
(78, '9670-6885-6275-3136', 1, 0, 'Joining'),
(79, '1890-7107-5407-1536', 1, 0, 'Joining'),
(80, '3671-9249-8558-3793', 1, 0, 'Joining'),
(81, '4497-7761-5478-6970', 1, 0, 'Joining'),
(82, '7842-7523-5506-4621', 1, 0, 'Joining'),
(83, '1357-3056-2078-4420', 1, 0, 'Joining'),
(84, '9788-1792-1749-4053', 1, 0, 'Joining'),
(85, '4272-1890-6789-3942', 1, 0, 'Joining'),
(86, '7776-3064-6078-8666', 1, 0, 'Joining'),
(87, '9171-1486-9202-2842', 1, 0, 'Joining'),
(88, '9736-7761-5636-4233', 1, 0, 'Joining'),
(89, '5522-1114-1204-3365', 1, 0, 'Joining'),
(90, '7637-5711-6986-7995', 1, 0, 'Joining'),
(91, '7767-8065-2416-7556', 1, 0, 'Joining'),
(92, '8858-3165-1609-3130', 1, 0, 'Joining'),
(93, '4056-7398-6072-1832', 1, 0, 'Joining'),
(94, '9462-2151-9499-8633', 1, 0, 'Joining'),
(95, '2637-8702-1476-2373', 1, 0, 'Joining'),
(96, '6463-6112-5607-1985', 1, 0, 'Joining'),
(97, '6227-5812-4351-3865', 1, 0, 'Joining'),
(98, '1523-1338-1861-8291', 1, 0, 'Joining'),
(99, '8403-3277-5847-7261', 1, 0, 'Joining'),
(100, '5442-6456-9391-8498', 1, 0, 'Joining'),
(101, '3854-5464-9331-3317', 1, 0, 'Joining'),
(102, '6616-8830-1950-8254', 1, 0, 'Joining'),
(103, '7532-2427-9627-3995', 1, 0, 'Joining'),
(104, '7539-5235-4981-3767', 1, 0, 'Joining'),
(105, '1047-8332-6632-1571', 1, 0, 'Joining'),
(106, '8670-7493-8862-7074', 1, 0, 'Joining'),
(107, '9770-4709-4335-5212', 1, 0, 'Joining'),
(108, '1165-3727-3710-4020', 1, 0, 'Joining'),
(109, '3851-9624-6177-8999', 2, 0, 'Repurchase'),
(110, '5907-7907-4857-3329', 2, 0, 'Repurchase'),
(111, '8410-5709-8688-3833', 2, 0, 'Repurchase'),
(112, '5701-7838-4859-9690', 2, 0, 'Repurchase'),
(113, '2554-8612-1288-6816', 1, 1, 'Repurchase'),
(114, '4247-9282-9503-5900', 5, 1, 'Repurchase'),
(115, '5010-3030-1442-5854', 5, 0, 'Repurchase'),
(116, '9558-1384-1645-4444', 5, 0, 'Repurchase'),
(117, '6131-4433-5292-9276', 1, 0, 'Repurchase'),
(118, '9665-1528-8052-1434', 1, 0, 'Repurchase'),
(119, '6324-7301-7237-8965', 1, 0, 'Repurchase');

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
