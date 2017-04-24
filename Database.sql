-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 24, 2017 at 04:55 AM
-- Server version: 5.1.41
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `emprego`
--
CREATE DATABASE `emprego` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `emprego`;

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE IF NOT EXISTS `company` (
  `companyID` int(255) NOT NULL AUTO_INCREMENT,
  `orgNo` int(255) NOT NULL,
  `companyName` char(255) NOT NULL,
  `companyEmail` char(255) NOT NULL,
  `companyPassword` char(255) NOT NULL,
  PRIMARY KEY (`companyID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`companyID`, `orgNo`, `companyName`, `companyEmail`, `companyPassword`) VALUES
(1, 12, 'Intersoftkk (India) Pvt. Ltd.', 'shailv06@gmail.com', '21'),
(16, 54455, 'dg', 'dfg@gm.bb', '545'),
(15, 32, 'Sachin Singh', 'sacsv@gmail.com', '2121'),
(13, 123, 'dfghj', 'vshailendra2@gmail.com', 'dfghj'),
(14, 1234, 'dsf', 'as@fs.csd', '123');

-- --------------------------------------------------------

--
-- Table structure for table `companynotification`
--

CREATE TABLE IF NOT EXISTS `companynotification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jobID` int(255) DEFAULT NULL,
  `companyID` int(255) DEFAULT NULL,
  `seekerID` int(255) DEFAULT NULL,
  `notification` char(255) DEFAULT NULL,
  `flag` int(1) DEFAULT NULL,
  `time` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `companynotification`
--

INSERT INTO `companynotification` (`id`, `jobID`, `companyID`, `seekerID`, `notification`, `flag`, `time`) VALUES
(1, 6, 1, 1, 'Applied', 1, '22:16 06-04-17'),
(3, 6, 1, 0, 'Posted', 1, '20:43 07-04-17'),
(4, 2, 1, 2, 'Applied', 1, '23:55 21-04-17'),
(5, 2, 1, 1, 'Applied', 1, '23:38 23-04-17');

-- --------------------------------------------------------

--
-- Table structure for table `jobapplied`
--

CREATE TABLE IF NOT EXISTS `jobapplied` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jobID` int(11) DEFAULT NULL,
  `seekerID` int(11) DEFAULT NULL,
  `status` char(255) DEFAULT NULL,
  `time` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `jobapplied`
--

INSERT INTO `jobapplied` (`id`, `jobID`, `seekerID`, `status`, `time`) VALUES
(1, 1, 1, 'Selected', '01-Apr-2017'),
(9, 2, 1, 'Shortlisted', '23:38 23-04-17'),
(3, 1, 2, NULL, '16:14 02-04-17'),
(4, 3, 1, NULL, '16:15 02-04-17'),
(5, 5, 1, NULL, '16:16 02-04-17'),
(6, 4, 1, 'Selected', '20:36 06-04-17'),
(7, 6, 1, 'Rejected', '22:16 06-04-17'),
(8, 2, 2, 'Selected', '23:55 21-04-17');

-- --------------------------------------------------------

--
-- Table structure for table `jobpost`
--

CREATE TABLE IF NOT EXISTS `jobpost` (
  `jobID` int(255) NOT NULL AUTO_INCREMENT,
  `companyID` int(255) DEFAULT NULL,
  `jobDesignation` char(255) DEFAULT NULL,
  `jobKeySkills` text,
  `jobDetails` text,
  `experience` char(255) DEFAULT NULL,
  `specialization` char(255) DEFAULT NULL,
  `qualification` char(255) DEFAULT NULL,
  `salary` char(255) DEFAULT NULL,
  `vacancy` int(255) DEFAULT NULL,
  `location` char(255) DEFAULT NULL,
  `contactMobile` char(15) DEFAULT NULL,
  `contactEmail` char(255) DEFAULT NULL,
  `time` char(255) DEFAULT NULL,
  `round` int(11) DEFAULT NULL,
  `flag` int(11) DEFAULT NULL,
  PRIMARY KEY (`jobID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `jobpost`
--

INSERT INTO `jobpost` (`jobID`, `companyID`, `jobDesignation`, `jobKeySkills`, `jobDetails`, `experience`, `specialization`, `qualification`, `salary`, `vacancy`, `location`, `contactMobile`, `contactEmail`, `time`, `round`, `flag`) VALUES
(2, 1, 'Web Designer and Web Development', 'HTML,HTML5,PHP,Mysql,Javascript,Ajax,Css,Jquery,Css3,', '1) Responsible for caonceptualization, design and production of corporate collaterals including brochures, newsletters, posters, web sites, identity systems and promotional campaigns for print and web.\r\n2)Fluency in current graphic design practices and web production software, such as Adobe Photoshop, Adobe Illustrator, Adobe After Effects.\r\n3)Ability to create superior, original designs for the web. \r\n4)Sound understanding of client deliverables and the ability to take responsibility for them.\r\n5)Strong technical knowledge of how web-based technologies apply to web design such as HTML, Flash, Flash Basic Action Script, CSS, and Web 2. 0. \r\n6)Possess the knowledge and experience of UI Design, Flash Banners and Web E-Mailers. \r\n7)Ability to convert design into HTML manually, with browser compatibility. \r\n9)Create design specifications document. \r\n10)Create media review checklist. \r\n9)Develop prototypes. \r\n11)Create animation/ static image templates. \r\n12)Provide expertise to Instructional Designers for media related requirements', '0 to 2 Yrs', 'Graphic Designing / Animation / Web Designing', 'Any Post Graduate \n   Any Graduate', 'Rs 9.00 - 15.00 Lacs p.a.', 5, 'Chennai', '+91-9962816063', 'shailv06@gmail.com', '10 Mar, 2017', NULL, 1),
(1, 1, 'WEB DESIGNER', 'HTML,JavaScript,CSS,Photoshop Illustrator,Web development', 'Should have Minimum 2 to 3 Years experience as Web Designer. Photoshop, Dreamweaver, CSS, CSS3, HTML5, Coreldraw, JQuery, Responsive, Bootstrap. Should be Creative. Good Web Designing Experience. High Quality Layout Designing, Div based HTML Conversion - HTML5, Menu Integration, Banner Integration, Responsive Website, Bootstrap, UI Designing, Email Design Creatives, ECommerce Website Designing, Portal Look and Feel Designing', '2 to 6 Yrs', 'Application Programming , Graphic Designing / Animation / Web Designing , Software Engineer', '      MCA / PGDCA (Computer Science ) \n    BE / B.Tech ( Engineering ) (Computer Science )', 'As per Industry Standards', 5, 'Ahmedabad', '+91-9962816083', 'shailv06@gmail.com', '18 Mar, 2017', NULL, 1),
(3, 1, 'Data Mining Analyst', 'Insight Sales,Online lead generation,Data Mining Techniques,Data Mining,Web Research', 'As a Data Mining Analyst, you will be required to perform the following task:\r\n1)Maintaining healthy lead database through data mining tools, Google search, Online Directories and social media channels.\r\n2)Generate and Supply adequate quality leads to team of Sales Managers for daily calling.\r\n3)Web Scrapping, Email Testing, Maintain CRM and MIS on regular basis.\r\n4)Identifying relevant Key contacts in target organizations and sending them business proposals.\r\n5)Run various B2B email marketing campaigns based on the company requirements\r\n\r\n REQUIRED SKILLS\r\n*Excellent Communication and creativity skills\r\n*Must be expert in Web Research, Insight Sales, Social Media, Online lead generation and Data Mining Techniques\r\n*Ability to deal and cooperate with team\r\n*Ability to work under pressure and achieve assigned targets', '2 to 3 Yrs', 'Business / Systems Analysis , Database Administration ( DBA )', 'Any Graduate', 'As per Industry Standards', 8, 'Ahmedabad', '+91-9967887883', 'shailv06@gmail.com', '28 Mar, 2017', NULL, 1),
(5, 1, 'Data Mining Algorithmists', 'Data Mining,Pattern Recognition,Information Theory,Statistics', 'You must have a detailed exposure to few/more computing fields such as information theory, statistics, probability, data mining, pattern recognition, AI and adaptive control. You should be able to translate your theoretical knowledge into practical system', '3 to 5 Yrs', 'Application Programming , Data Warehousing , Database Administration ( DBA )', '   Any Post Graduate or    BE / B.Tech ( Engineering ) (Computer Science )', 'As per Industry Standards', 1, 'Bengaluru / Bangalore', '+91-9967887873', 'shailv06@gmail.com', '8 Mar, 2017', NULL, 1),
(4, 1, 'Networking', 'Networking,Routing,Proxy and Email Gateway,Switching', '1) Solid experience in routing and switching. \r\n\r\n\r\n2) Cisco Nexus 7k, Cisco Nexus 5k, Cisco Nexus 1K , Cisco 65 K \r\n\r\n\r\n3) Firewall - Checkpoint, Cisco ASA\r\n\r\n\r\n4) Cisco ACE and WAAS\r\n\r\n\r\n5) F5 LTM/GTM\r\n\r\n\r\n6) IronPort (Proxy and Email Gateway) \r\n\r\n\r\n7)', '2 to 6 Yrs', 'Network Planning , Switching / Router', 'Any Graduate', 'As per Industry Standards', 4, 'Bengaluru / Bangalore', '+91-9967887883', 'shailv06@gmail.com', '18 Feb, 2017', NULL, 1),
(6, 1, 'Networking', 'Documentation Skill,Networking Skill,Switching Routing', '1. Should have CCNA & CCNP certifications.\r\n\n2. Should have work knowledge on routing & switching. (Must)\r\n\n3. Should have work experience on Cisco Chassis Switches(6500/Nexus) & routers/Wireless.(Must)\r\n\n4. Knowledge on security products/Checkpoint firew', '2 to 6 Yrs', 'Hardware Design , Network Planning , Switching / Router', 'Any Graduate', 'As per Industry Standards', 4, 'Pune', '+91-9967887883', 'shailv06@gmail.com', '', NULL, 1),
(14, 1, 'Software Designer', 'Enterprise grade applications ,Extremely strong OOAD designer ,SOA ,REST Webservices development ', 'As a Software Designer, (JAVA), your key responsibilities will include:\r\n\r\n1. Design and develop end to end solutions to enhance various applications within the Market Risk area while improving test coverage and time to production.\r\n\r\n 2. Ensure consistency of technology usage across a program through continuous reviews of existing tools and code and recommendations on best practices.\r\n\r\n3.  Provide direction on technology use and technology menus, by performing research into new technologies, liaising with technology providers, establishing processes required for adoption.\r\n\r\nThe Skills you?ll need\r\nIn order to be successful in this role, you must have the following skills & experience:\r\n1.Around 4 to 6 years of experience in Design & Development of Enterprise grade     applications\r\n2.Extremely strong hands-on developer. (Java, JEE, Spring)\r\n3. Good technical breadth across technology domains.\r\n4. Extremely strong OOAD designer\r\n5. Extremely strong Java designer and developer\r\n6. Experience on building distributed applications\r\n7. Spring and J2EE\r\n8. Strong understanding of SOA, REST Webservices development and design etc.', '2 - 5 Year', 'Application Programming , Graphic Designing / Animation / Web Designing , Software Engineer', 'Any Graduate', 'As per Industry Standards', 10, 'Gurgaon', '8475112211', 'company@gmail.com', '00:55 24-04-17', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jobseeker`
--

CREATE TABLE IF NOT EXISTS `jobseeker` (
  `seekerID` int(255) NOT NULL AUTO_INCREMENT,
  `seekerName` char(255) NOT NULL,
  `seekerMobile` char(255) NOT NULL,
  `seekerEmail` char(255) NOT NULL,
  `seekerGender` char(10) NOT NULL,
  `seekerPassword` char(10) NOT NULL,
  PRIMARY KEY (`seekerID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `jobseeker`
--

INSERT INTO `jobseeker` (`seekerID`, `seekerName`, `seekerMobile`, `seekerEmail`, `seekerGender`, `seekerPassword`) VALUES
(1, 'Shailendra Verma', '8853616224', 'vshailendra2@gmail.com', 'Male', '12345'),
(2, 'Shailendra', '8181802887', '1995shail@gmail.com', 'Male', '12345'),
(18, 'dsf', '', 'vshailendra2@gmail.com', 'Male', '123'),
(19, 'shail', '8853616224', 'shailv06@gmail.com', 'Male', '12345'),
(20, 'Sachin Singh', '8574472122', 'sachin@gmail.com', 'Male', '12345'),
(21, 'Shailendra Kumar Verma', '8931022751', '1406shail@gmail.com', 'Male', '14061995');

-- --------------------------------------------------------

--
-- Table structure for table `jobseekerprofile`
--

CREATE TABLE IF NOT EXISTS `jobseekerprofile` (
  `seekerID` int(255) NOT NULL,
  `details_10` text,
  `details_12` text,
  `details_graduation` text,
  `other_education1` text,
  `other_education2` text,
  `job_features1` text,
  `job_details1` text,
  `job_features2` text,
  `job_details2` text,
  `skills` text,
  `intern_features1` text,
  `intern_details1` text,
  `intern_features2` text,
  `intern_details2` text,
  `proj_features1` text,
  `proj_details1` text,
  `proj_features2` text,
  `proj_details2` text,
  `proj_features3` text,
  `proj_details3` text,
  `proj_features4` text,
  `proj_details4` text,
  `work_link` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jobseekerprofile`
--

INSERT INTO `jobseekerprofile` (`seekerID`, `details_10`, `details_12`, `details_graduation`, `other_education1`, `other_education2`, `job_features1`, `job_details1`, `job_features2`, `job_details2`, `skills`, `intern_features1`, `intern_details1`, `intern_features2`, `intern_details2`, `proj_features1`, `proj_details1`, `proj_features2`, `proj_details2`, `proj_features3`, `proj_details3`, `proj_features4`, `proj_details4`, `work_link`) VALUES
(1, '2011,CBSE,8.6,Bethany Convent School', '2013,CBSE,83%,Bethany Convent School', 'United College of Engineering & Research,BTech,CS,75.04%', NULL, NULL, 'Software Engineering,TCS ,09 March 2017,Present', 'Software Engineering', NULL, NULL, 'HTML,HTML5,PHP,Mysql,Javascript,Ajax,Css,Jquery,CSS3,Bootstrap', 'Remote InternShip,Tata Consultancy Services,09 March 2017,Present', 'Valuable place for internship.', NULL, NULL, 'StuDeals,4 January 2017,15 January 2017', 'Its a ECommerce website where you can buy your course related books. StuDeals executes flawlessly and have focussed on design, database redundancy and its search feature make this a fantastic site.\r\n                                                        \r\n                                                        \r\n                                                        ', NULL, NULL, NULL, NULL, NULL, NULL, 'https://github.com/Shailv06,http://www.hackerearth.com/@Shailv06'),
(2, '2010,ICSE,78%,XYZ School Allahabad', '2012,ICS,78%,XYZ School Allahabad', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Data Mining,Pattern Recognition', NULL, NULL, NULL, NULL, 'WebRTC,12 April 2017,21 April 2017', 'Make peer to peer connection by which we can chat , video confrence and file sharing.', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `seekernotification`
--

CREATE TABLE IF NOT EXISTS `seekernotification` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `seekerID` int(255) NOT NULL,
  `jobID` int(255) NOT NULL,
  `jobStatus` char(255) NOT NULL,
  `flag` int(1) NOT NULL,
  `time` char(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `seekernotification`
--

INSERT INTO `seekernotification` (`id`, `seekerID`, `jobID`, `jobStatus`, `flag`, `time`) VALUES
(1, 1, 1, 'Shortlisted', 1, '01-Apr-2017'),
(2, 1, 2, 'Shortlisted', 1, '02-Apr-2017'),
(3, 1, 4, 'Applied', 1, '20:36 06-04-17'),
(4, 1, 6, 'Applied', 1, '22:16 06-04-17'),
(13, 2, 1, 'Shortlisted', 1, '13:08 09-04-17'),
(12, 1, 1, 'Rejected', 1, '13:08 09-04-17'),
(15, 1, 1, 'Shortlisted', 1, '13:32 09-04-17'),
(14, 1, 1, 'Shortlisted', 1, '13:13 09-04-17'),
(16, 2, 1, 'Shortlisted', 1, '23:11 15-04-17'),
(17, 1, 2, 'Shortlisted', 1, '23:54 21-04-17'),
(36, 1, 1, 'Selected', 0, '00:32 24-04-17'),
(35, 1, 1, 'Shortlisted', 0, '00:32 24-04-17'),
(34, 1, 4, 'Selected', 1, '00:03 24-04-17'),
(33, 1, 4, 'Shortlisted', 1, '00:03 24-04-17'),
(32, 1, 6, 'Rejected', 1, '00:03 24-04-17'),
(31, 1, 2, 'Shortlisted', 1, '00:00 24-04-17');

-- --------------------------------------------------------

--
-- Table structure for table `seekershortlisted`
--

CREATE TABLE IF NOT EXISTS `seekershortlisted` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seekerID` int(255) NOT NULL,
  `jobID` int(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=53 ;

--
-- Dumping data for table `seekershortlisted`
--

INSERT INTO `seekershortlisted` (`id`, `seekerID`, `jobID`) VALUES
(52, 1, 2),
(49, 1, 1),
(51, 2, 2);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
