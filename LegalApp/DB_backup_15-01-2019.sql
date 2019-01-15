-- MySQL dump 10.13  Distrib 5.5.50, for Win32 (x86)
--
-- Host: localhost    Database: legal
-- ------------------------------------------------------
-- Server version	5.5.50

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
-- Current Database: `legal`
--

/*!40000 DROP DATABASE IF EXISTS `legal`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `legal` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `legal`;

--
-- Table structure for table `acts`
--

DROP TABLE IF EXISTS `acts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acts` (
  `actid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `rules` varchar(33555) DEFAULT NULL,
  `section` varchar(255) DEFAULT NULL,
  `subsection` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`actid`)
) ENGINE=MyISAM AUTO_INCREMENT=318 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acts`
--

LOCK TABLES `acts` WRITE;
/*!40000 ALTER TABLE `acts` DISABLE KEYS */;
INSERT INTO `acts` VALUES (289,'Companies Act','ghjbjhbjbnbjbkjbjvjbjvbjbThe <input type=\"number\"> defines a numeric input field.\r\n\r\nYou can also set restrictions on what numbers are accepted.\r\n\r\nThe following example displays a numeric input field, where you can enter a value from 1 to 5:\r\n\r\n','220A, 200C',NULL,'https://www.w3schools.com/html/html_form_input_types.asp'),(290,'Companies Act','One of the key features of Docker is the ability to limit a containers memory and CPU usage. This is one of the main reason why its economically interesting to run many Docker containers in the Cloud. Orchestration solutions like Kubernetes (k8s) will try to efficiently packcontainers on multiple nodes. Here pack refers to memory and CPU (see how k8s plays Tetris for you). If you give sensible boundaries for memory and CPU to your Docker containers, K8s will be able to efficiently arrange them on multiple nodes.\r\n\r\nUnfortunately, this is precisely where Java runs short. Lets use an example to understand the problem.\r\n\r\nImagine you have a node with 32GB of memory and you want to run a Java application with a limit of 1GB. Remember that Docker containers are no more than a glorified process on ahost machine. If you do not provide a -Xmx parameter the JVM will use its default configuration:\r\n\r\nThe JVM will check the total available memory. Because the JVM is not aware of the Linux container (in particular of the Control Group, which limits memory), it thinks it is running on the Host machine and has access to the full32GB of available memory.','Sections 1 to 27',NULL,'https://www.w3schools.com/html/html_form_input_types.asp'),(291,'Companies Act 2013','The Companies Act 2013 is an Act of the Parliament of India on Indian company law which regulates incorporation of a company, responsibilities of a company, directors, dissolution of a company.','1, 3, to 500',NULL,'https://en.wikipedia.org/wiki/Companies_Act_2013'),(317,'','','',NULL,'');
/*!40000 ALTER TABLE `acts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cases`
--

DROP TABLE IF EXISTS `cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `cavet` varchar(255) DEFAULT NULL,
  `counter` varchar(255) DEFAULT NULL,
  `dateinstitution` varchar(255) DEFAULT NULL,
  `datesummon` varchar(255) DEFAULT NULL,
  `description` varchar(33555) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `fileno` varchar(255) DEFAULT NULL,
  `judgename` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `versus` varchar(255) DEFAULT NULL,
  `cateogry` varchar(255) DEFAULT NULL,
  `nexthearing` varchar(255) DEFAULT NULL,
  `connected` varchar(255) DEFAULT NULL,
  `paymentid` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `lawyer_lawyerid` int(11) DEFAULT NULL,
  `name` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `cases_id` int(11) DEFAULT NULL,
  `acts_actid` int(11) DEFAULT NULL,
  `caseno` varchar(255) DEFAULT NULL,
  `act` varchar(255) DEFAULT NULL,
  `updateid` int(11) DEFAULT NULL,
  `court` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6h28o7tyqrsxf5gsb1fjk7iws` (`name`),
  KEY `FKpmot1ggqkx14q5m418eijamix` (`cases_id`),
  KEY `index1` (`caseno`),
  KEY `FKljivf22dpjfm5585vpcuoa5j1` (`acts_actid`),
  KEY `casses_caseno` (`id`,`caseno`),
  KEY `FK694gehtumtnv7h6svuss2fjtx` (`lawyer_lawyerid`),
  KEY `FKa5k1ks264n0wnq9xi4428swdq` (`paymentid`),
  KEY `FK323ad2we4iulat1n2deqr3dwo` (`updateid`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cases`
--

LOCK TABLES `cases` WRITE;
/*!40000 ALTER TABLE `cases` DISABLE KEYS */;
INSERT INTO `cases` VALUES (1,NULL,NULL,'','2015-09-19','','MANAGEMENT FILED EXECUTION APPLICATION AGAINST HARI CREATON PVT LTD FOR THE AMOUNT RS.  823881/-. MATTER IS PENDING HON\'BLE HISAR COURT  (CIVIL JUDGE, HISAR DECREED IN FAVOUR OF THE COMPANY FOR RECOVERY OF THE AMOUNT AND GRANTED TWO MONTHS TIME TO THE DEFENDENTS TO PAY THE DECREETAL AMOUNT. THE COMPANY FILED EXECUTION PROCEEDINGS AGAINST THE DEFENDANTS. DEFENDANTS FILED AN APPEAL PERTAINING TO THE SAID CASE IN HIGH COURT (RSA 3044/2015). CONSEQUENTLY, EXECUTION PROCEEDINGS HAVE BEEN STAYED AND THE MATTER IS PENDING. ','Civil Judge Junior Division','DCM 18','','Punjab','DCM TEXTILES V/S HARI CREATION PVT LTD',NULL,'B','2018-08-08',NULL,272,NULL,267,NULL,'OPPOORTUNITY TO SERVE THE JD HAS BEEN GRANTED ',NULL,NULL,'EXE-538-2015','Code of Civil Procedure',273,NULL),(5,NULL,NULL,'Bhavika','01-12-2018','25-05-2018','asdf','kjnkjn','4343','Rahul Sharma','Punjab','DCM Ltd VS ABC',NULL,'B','17-12-2018',NULL,292,NULL,270,NULL,'Waiting',NULL,NULL,'ADD:225/85','',293,NULL),(7,NULL,NULL,'Many to One','25, Rohini, Rohini, Rohini, Rohini, Rohini, Rohini, Rohini, Rohini, Rohini, Rohini, Rohini, Rohini','25-05-2018','sfsdvdfvdfvdfvdfvdfvvdfv','sd','12','Suresh Gupta','Delhi',' Legal Management System VS CS',NULL,'D','21-12-2018',NULL,296,NULL,270,NULL,'Pending',NULL,NULL,'13','',297,NULL),(9,NULL,NULL,'ss','12-11-2018','25-05-2018','This article demonstrated how to use Hibernate to call a stored procedure in a MySQL database using different approaches.\r\nIt is worth mentioning that not all RDBMS support stored procedures.\r\n\r\nYou can checkout the examples provided in this article in the linked GitHub project.','JM','s','Suresh Gupta','Haryana','An Example of a Google Bar Chart Vs Google mail API',NULL,'C','19-12-2018',NULL,300,NULL,271,NULL,'Pending',NULL,NULL,'VK 52362-55','',301,'Labour Court, Hisar'),(10,NULL,NULL,'','','25-05-2018','dscsssssssssssssssssssssssssssssssssssssssssss','sd','DCM-56','Akash Sharma','State Court, Delhi','46546546',NULL,'B','20-12-2018',NULL,302,NULL,276,NULL,'Pending',NULL,NULL,'132','',303,NULL),(11,NULL,NULL,'Balam Singh Rawat','2','25-05-2018','\r\n*Select the lawyer from the dropdown, if not found kindly add lawyer from the menu.','','DCM-56','mnkjn','Uttar Pradesh','An Example of a Google Bar Chart Vs Google mail API2',NULL,'C','03-08-2018',NULL,304,NULL,276,NULL,'uuu',NULL,NULL,'123','',305,NULL),(12,NULL,NULL,'GEF','25, Rohini, Rohini','25-05-2018','DCM TEXTILES V/S STATE OF HARYANA AND MARKET COMMITTEE HISAR','ok','12asdfg','mnkjn','District Court, Ludhiana','Land Tax  vs abc',NULL,'C','16-12-2018',NULL,306,NULL,270,NULL,'Waiting',NULL,NULL,'vijay.s@dcmtech.com','',307,NULL),(13,NULL,NULL,'','','25-05-2018','','sd','88rrrrrr','Rahul Sharma','District Court, Merrut','asdsad',NULL,'B','04-08-2018',NULL,308,NULL,271,NULL,'Pending',NULL,NULL,'12rrrrrrrrrrr','',309,NULL),(14,NULL,NULL,'Nitin Tyaggi','204, Mandi Hoyuse, Mandi Hoyuse, Mandi Hoyuse, Mandi Hoyuse, Mandi Hoyuse, Mandi Hoyuse, Mandi Hoyuse, Mandi Hoyuse','25-05-2018','introduce you to the stored procedure concept and discuss when you should use it. Then, we show you how to use the basic elements of the procedure code such as create procedure statement, if-else, case, loop, stored procedures parameters.','ok','1234567890','mnkjn','Delhio','DCM Ltd Vs DCM',NULL,'A','19-12-2018',NULL,310,NULL,276,NULL,'asd',NULL,NULL,'EXE-538-20154567890','',311,NULL),(15,NULL,NULL,'','','25-05-2018','','','4343sss','','Punjab','DCM Ltd VS DCM Ltd',NULL,'C','22-12-2018',NULL,312,NULL,269,NULL,'reminder check',NULL,NULL,'123sdfghjklertyuio','',313,NULL),(16,NULL,NULL,'','','','','','','','','ssss',NULL,'--SELECT--','',NULL,314,NULL,NULL,NULL,'',NULL,NULL,'ssss','',315,NULL);
/*!40000 ALTER TABLE `cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `casestrigger`
--

DROP TABLE IF EXISTS `casestrigger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `casestrigger` (
  `triggerid` int(11) NOT NULL AUTO_INCREMENT,
  `updateid` int(11) DEFAULT NULL,
  `nexthearing` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `connected` varchar(33555) DEFAULT NULL,
  `cavet` varchar(255) DEFAULT NULL,
  `lasthearing` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`triggerid`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `casestrigger`
--

LOCK TABLES `casestrigger` WRITE;
/*!40000 ALTER TABLE `casestrigger` DISABLE KEYS */;
INSERT INTO `casestrigger` VALUES (1,273,'2018-08-08','OPPOORTUNITY TO SERVE THE JD HAS BEEN GRANTED ',NULL,'','2018-07-27'),(2,273,'2018-08-17','hmmm',NULL,'','2018-08-08'),(3,273,'2018-08-20','hmmm',NULL,'NA','2018-08-17'),(4,273,'2018-08-23','<%@page contentType=\"text/html\" pageEncoding=\"UTF-8\"%>',NULL,'','2018-08-20'),(5,273,'2018-08-25','yoooo from mobile',NULL,'','2018-08-23'),(6,273,'2018-08-27','from chrome in another system',NULL,'NA','2018-08-25'),(7,273,'2018-08-28','not working ajax url','EXE-538-2015','ok','2018-08-27'),(8,273,'2018-08-29','Pending',NULL,'ok','2018-08-28'),(9,273,'2018-08-30','from IE','EXE-538-2015','ok','2018-08-29'),(10,273,'2018-08-31','Pending',NULL,'All Cleared','2018-08-30'),(11,273,'2018-09-01','waiting for decission',NULL,'','2018-08-31'),(12,273,'2018-09-02','hmmmm checking','EXE-538-2015','NA','2018-09-01'),(13,273,'03-08-2018','checking date format',NULL,'NA','02-08-2018'),(14,273,'04-08-2018','dddddddd','EXE-538-2015','Yes too amny','03-08-2018'),(15,273,'21-08-2018','',NULL,'','04-08-2018'),(16,273,'24-08-2018','Checking dates',NULL,'','21-08-2018'),(17,273,'28-08-2018','Checking entry from case view pages','EXE-538-2015','ok','24-08-2018'),(18,273,'14-12-2018','AV',NULL,'Spring MVC Hibernate Mysql','28-08-2018'),(19,280,'16-12-2018','uuu',NULL,'Yes too amny','02-08-2018'),(20,278,'2018-12-16','',NULL,'NA',''),(21,273,'16-12-2018','',NULL,'','14-12-2018'),(22,273,'17-12-2018','dddddddddddddddd',NULL,'NA','16-12-2018'),(23,278,'16-12-2018','',NULL,'NA','2018-12-16'),(24,280,'20-12-2018','ok',NULL,'Yes too amny','16-12-2018'),(25,280,'17-12-2018','checking updatecase table inputs','EXE-538-2015','Spring MVC Hibernate Mysql','20-12-2018'),(26,280,'17-12-2018','dsfdsfdsfds','EXE-538-2015','Yes too amny','17-12-2018'),(27,273,'17-12-2018','again same date',NULL,'m','17-12-2018'),(28,273,'17-12-2018','asdfghcvbn',NULL,'ok','17-12-2018'),(29,293,'17-12-2018','Waiting','EXE-538-2015','ok',''),(30,278,'17-12-2018','hhhhhhhhhhhhhhhhhhhhh',NULL,'ok','16-12-2018'),(31,295,'29-12-2018','uuu',NULL,'','21-08-2018');
/*!40000 ALTER TABLE `casestrigger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brief` varchar(33555) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `caseno` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document`
--

LOCK TABLES `document` WRITE;
/*!40000 ALTER TABLE `document` DISABLE KEYS */;
INSERT INTO `document` VALUES (1,'ffffffffffffffffffffff','Evidence','fail.png','EXE-538-2015'),(2,'','Contracts','classAssociation.jpg','EXE-538-2015'),(3,'','Pleadings','class.jpg','EXE-538-2015'),(4,'','Notification','usecase.jpg','EXE-538-2015'),(5,'','Notification','usecase.jpg','EXE-538-2015'),(6,'','Judgements','EXE Hari Creation Hisar 19-9-2017.pdf','EXE-538-2015'),(7,'','Reply(Written Statement)','TNSNAMES.ORA','EXE-538-2015'),(8,'gggggggggg','Reply(Written Statement)','sqlnet.log','EXE-538-2015'),(10,'gffhgfhgf','Pleadings','hibernate_architecture.png','EXE-538-2015'),(11,'bsbbzbz','Contracts','15445112194988047518785956595314.jpg','EXE-538-2015'),(12,'','--SELECT--','VID20181211122429.mp4','EXE-538-2015');
/*!40000 ALTER TABLE `document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (318),(318),(318),(318),(318);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lawyer`
--

DROP TABLE IF EXISTS `lawyer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lawyer` (
  `lawyerid` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `cemail` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `cname` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `cphone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `jemail` varchar(255) DEFAULT NULL,
  `jname` varchar(255) DEFAULT NULL,
  `jphone` varchar(255) DEFAULT NULL,
  `line2` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `pin` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`lawyerid`)
) ENGINE=MyISAM AUTO_INCREMENT=317 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lawyer`
--

LOCK TABLES `lawyer` WRITE;
/*!40000 ALTER TABLE `lawyer` DISABLE KEYS */;
INSERT INTO `lawyer` VALUES (266,'House no: 916','','Chandigarh','','India','','sarora.law@gmail.com','','','','Sector-7-B','Saurabh Arora','9815797779','160019','Chandigarh'),(267,'Chamber no 445, New Lawyers Chamber','','Hisar','','India','','surinderpuran2003@yahoo.com','','','','District Court Complex','Surinder Singh','9812328962','','Haryana'),(268,'House No: N-266','','New Delhi','','India','','harvinder.adv@gmail.com','','','','Greater Kailash-I','Harvinder Singh','9810000107','110048','Delhi'),(269,'Kothi No: 1530 ','','Chandigarh','','India','','','','','','Sector-7C','Om Prakash Sharma','9417724537','160019','Chandigarh'),(270,'House no: 235','','Chandigarh','','India','','mittal.chetan.asg@gmail.com','issar.varun@gmail.com','Varun Issar','9815029594','Sector-21A','Chetan Mittal','9316377766','160019','Chandigarh'),(271,'House No Q-7/A','','New Delhi','','India','','opbhadani@gmail.com','','','','Jnagpura Extension (Near Eros Cinema)','O P Bhadani','9818398187','110014','Delhi'),(276,'25, Rohini, Rohini, Rohini, Rohini, Rohini, Rohini, Rohini, Rohini, Rohini, Rohini, Rohini, Rohini, Rohini','','New Delhi','','India','','vijay.s@dcmtech.com','','','','Rohini','CDE Sharma','562423658','110091','Delhi'),(316,'','','','','','','','','','','','','','','');
/*!40000 ALTER TABLE `lawyer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `caseno` varchar(255) DEFAULT NULL,
  `specify` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `brief` varchar(33555) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `logentries` (`caseno`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES (1,'EXE-538-2015','service of summons','Critical Events','<p>fresh address from the ROC recrod was filed in the court</p>','2018-08-08'),(2,'EXE-538-2015',NULL,'Miscellanous,check','just checking log updation','2018-08-14'),(3,'EXE-538-2015','Hearings','Critical Events','All good checking type','2018-08-13'),(4,'EXE-538-2015','NA','Miscellanous','HHHHHHHHHHHHHHHHHhhhhhhhhjkkkkkkkkkkkkkbzxcvbnqwertsdfghjk','2018-08-15'),(5,'EXE-538-2015','Meetings','Miscellanous','All meeting is condidered important','2018-08-15'),(6,'EXE-538-2015','Checking','Others','Checking logs update from case view pages','28-08-2018'),(7,'13','NA','Critical Events','<p><strong>aszdxgvbnm,dsfgvhnzdxfsdfghjkl</strong></p>\r\n<p><em>bjvjbbkjb</em></p>\r\n<p>Following questions need to be addressed:</p>\r\n<ul>\r\n<li>What are the objects in the application that occupy large portions of the heap?</li>\r\n<li>In which parts of the source code are these objects being allocated?</li>\r\n</ul>\r\n<p>We can also use automated graphical tools such as&nbsp;<a href=\"http://docs.oracle.com/javase/7/docs/technotes/guides/management/jconsole.html\">JConsole</a>&nbsp;which helps to detect performance problems in the code including&nbsp;<em>java.lang.OutOfMemoryErrors.</em></p>\r\n<p>The last resort would be to increase the heap size by altering the JVM launch configuration. For example, this gives 1GB heap space for the Java application:</p>\r\n<div>\r\n<div id=\"highlighter_436644\" class=\"syntaxhighlighter notranslate bash \">\r\n<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td class=\"gutter\">\r\n<div class=\"line number1 index0 alt2\">1</div>\r\n</td>\r\n<td class=\"code\">\r\n<div class=\"container\">\r\n<div class=\"line number1 index0 alt2\"><code class=\"bash plain\">java -Xmx1024m com.xyz.TheClassName</code></div>\r\n</div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n</div>','14-12-2018'),(8,'13','Strategy','Others','<p><img src=\"E:\\demo\\srcpa.ico\" alt=\"Loo\" width=\"211\" height=\"100\" /></p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>ankbsdskdsavn&nbsp;</p>\r\n<p>All good</p>','30-11-2018');
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay`
--

DROP TABLE IF EXISTS `pay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay` (
  `paymentid` int(11) DEFAULT NULL,
  `total` varchar(255) DEFAULT NULL,
  `bill` varchar(255) DEFAULT NULL,
  `paid` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `balance` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `updateid` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`updateid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay`
--

LOCK TABLES `pay` WRITE;
/*!40000 ALTER TABLE `pay` DISABLE KEYS */;
INSERT INTO `pay` VALUES (272,'-15200','NEFT','-300','from ie','-14900','--SELECT--',1),(272,'-14900','NEFT','-14900','fffffffffffff','0','--SELECT--',2);
/*!40000 ALTER TABLE `pay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `remarks` varchar(255) DEFAULT NULL,
  `balance` bigint(20) NOT NULL,
  `bill` varchar(255) DEFAULT NULL,
  `paid` bigint(20) NOT NULL,
  `total` bigint(20) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `paymentid` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`paymentid`)
) ENGINE=MyISAM AUTO_INCREMENT=315 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES ('Checking entry from case view pages',0,'Draft NO: 12452659F',0,0,'--SELECT--',272),('',0,'',0,0,'--SELECT--',274),('',0,'',0,0,'--SELECT--',277),('',0,'',0,0,'--SELECT--',279),('',0,'',0,0,'--SELECT--',292),('',0,'',0,0,'--SELECT--',294),('',0,'',0,0,'--SELECT--',296),('',0,'',0,0,'--SELECT--',298),('sss',0,'',0,0,'--SELECT--',300),('',0,'',0,0,'--SELECT--',302),('',0,'',0,0,'--SELECT--',304),('',0,'',0,0,'--SELECT--',306),('',0,'',0,0,'--SELECT--',308),('',0,'',0,0,'--SELECT--',310),('',0,'',0,0,'--SELECT--',312),('',0,'',0,0,'--SELECT--',314);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger updatespayment after UPDATE on payment for each row BEGIN
insert into pay(paymentid, total, paid, balance, type, bill, remarks)
values (old.paymentid, old.total, old.paid, old.balance, old.type, old.bill, old.remarks);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `reminder`
--

DROP TABLE IF EXISTS `reminder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reminder` (
  `reminderid` int(11) NOT NULL AUTO_INCREMENT,
  `brief` varchar(33555) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `subtype` varchar(255) DEFAULT NULL,
  `time` varchar(255) NOT NULL DEFAULT '00:10',
  `type` varchar(255) DEFAULT NULL,
  `caseno` varchar(255) DEFAULT NULL,
  `reminder_caseno` int(11) DEFAULT NULL,
  PRIMARY KEY (`reminderid`),
  KEY `FKcv4g0fxf9qn9o6s1j5dlrgfwd` (`reminder_caseno`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reminder`
--

LOCK TABLES `reminder` WRITE;
/*!40000 ALTER TABLE `reminder` DISABLE KEYS */;
/*!40000 ALTER TABLE `reminder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `role_id` int(11) NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`role_id`),
  KEY `FKtmhh8ov8crluh7nn3uxdi841j` (`id`),
  KEY `FK61g3ambult7v7nh59xirgd9nf` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'SYSTEM',NULL,NULL),(2,'ADMIN',NULL,NULL),(3,'USER',NULL,NULL),(4,'USER',NULL,NULL);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `field1` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`field1`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES ('dcmltd','nitin'),('dcm','vikash'),('dcmtext','bhavishya'),('dcmtech','bhavishya'),('ltd','vijay'),('boss','hbr');
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `updatecase`
--

DROP TABLE IF EXISTS `updatecase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updatecase` (
  `updateid` int(11) NOT NULL,
  `nexthearing` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `caseno` varchar(255) DEFAULT NULL,
  `connected` varchar(255) DEFAULT NULL,
  `cavet` varchar(255) DEFAULT NULL,
  `lasthearing` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`updateid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `updatecase`
--

LOCK TABLES `updatecase` WRITE;
/*!40000 ALTER TABLE `updatecase` DISABLE KEYS */;
INSERT INTO `updatecase` VALUES (220,'','Case Closed',NULL,'NA','ok','2018-08-15',NULL),(222,'','','1004',NULL,'','',NULL),(229,'2018-08-24','aaaa',NULL,'1004,123','ok','2018-08-20',NULL),(231,'2018-08-03','NA',NULL,'CWP-7036-2016','NA','2018-08-01',NULL),(233,'','','132',NULL,'','',NULL),(235,'2018-08-11','Pending',NULL,'1004,123,13,132','Yes too amny','',NULL),(237,'','','325',NULL,'','',NULL),(239,'','','111',NULL,'','',NULL),(241,'','','11122222',NULL,'','',NULL),(243,'','','dcm/12345',NULL,'','',NULL),(245,'','','621',NULL,'','',NULL),(247,'2018-08-07','Pending',NULL,'111,11122222,CWP-7036-2016','NA','2018-08-01',NULL),(249,'','','12',NULL,'','',NULL),(251,'','','DCM/25/52',NULL,'','',NULL),(253,'2018-08-27','Waiting','132','DCM/25/52','ok','2018-08-26',NULL),(255,'','','132',NULL,'','',NULL),(257,'','','DCM/25/52',NULL,'','',NULL),(259,'','','132','DCM/25/52','','',NULL),(261,'','','DCM/85/00',NULL,'','',NULL),(263,'','','dcm/12345',NULL,'','',NULL),(265,'2018-08-09','hmmmm',NULL,'235,dcm/12345','ok','',NULL),(273,'19-12-2018','asdfghjkk','EXE-538-2015',NULL,'ok','17-12-2018','DCM TEXTILES V/S HARI CREATION PVT LTD'),(275,'','','',NULL,'','',NULL),(278,'20-12-2018','all good','12test',NULL,'Yes too amny','17-12-2018',' Legal Management System'),(280,'17-12-2018','sadfghj','okkkk','12test,EXE-538-2015,okkkk','m','17-12-2018',' Legal Management System VS DCM Ltd'),(293,'19-12-2018','kjsdhkjhdcbkjbn','ADD:225/85',NULL,'ok','17-12-2018','DCM Ltd VS ABC'),(295,'18-12-2018','dfd','EXE-538-201500',NULL,'fffffffffff','29-12-2018','Land Tax '),(297,'21-12-2018','Pending','13','ADD:225/85,EXE-538-2015','Yes too amny','03-08-2018',' Legal Management System VS CS'),(299,'19-12-2018','Pending','12','ADD:225/85','','',' Legal Management System VS asdfghjkl;'),(301,'19-12-2018','Pending','VK 52362-55','ADD:225/85','Yes too amny','21-08-2018','An Example of a Google Bar Chart Vs Google mail API'),(303,'20-12-2018','Pending','132','ADD:225/85,EXE-538-2015','m','24-08-2018','46546546'),(305,'03-08-2018','uuu','123','ADD:225/85,EXE-538-2015','Yes too amny','03-08-2018','An Example of a Google Bar Chart Vs Google mail API2'),(307,'16-12-2018','Waiting','vijay.s@dcmtech.com','13,ADD:225/85','ok','24-08-2018','Land Tax  vs abc'),(309,'04-08-2018','Pending','12rrrrrrrrrrr','13','m','02-08-2018','asdsad'),(311,'19-12-2018','asd','EXE-538-20154567890','12rrrrrrrrrrr,132,EXE-538-2015','Spring MVC Hibernate Mysql','','DCM Ltd Vs DCM'),(313,'22-12-2018','reminder check','123sdfghjklertyuio','12rrrrrrrrrrr','Yes too amny','20-12-2018','DCM Ltd VS DCM Ltd'),(315,'','','ssss',NULL,'','','ssss');
/*!40000 ALTER TABLE `updatecase` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger updatecasestrigger after UPDATE on updatecase for each row BEGIN
insert into casestrigger(updateid, nexthearing, status, connected, cavet, lasthearing)
values (old.updateid, old.nexthearing, old.status, old.connected, old.cavet, old.lasthearing);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `active` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `roles_role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `FKfq4vo46ku9bjidg1ti4whkcmd` (`roles_role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,1,'Vikash Kumar','vikash','vikash.k@dcmtech.com',1),(13,0,'aaaaaaaa','a','a@a.a',NULL),(14,0,'','','',NULL),(2,1,'Viku','admin','vik6@ghg11.com',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  UNIQUE KEY `UK_it77eq964jhfqtu54081ebtio` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,1),(2,2),(3,3);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `v1`
--

DROP TABLE IF EXISTS `v1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `benefits` varchar(33000) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `features` varchar(255) DEFAULT NULL,
  `proposed` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `v1`
--

LOCK TABLES `v1` WRITE;
/*!40000 ALTER TABLE `v1` DISABLE KEYS */;
INSERT INTO `v1` VALUES (1,'User will be able to know the updates in the software easily','24-08-2018','Easily track the updates and by whom it has been proposed','Vikash Kumar');
/*!40000 ALTER TABLE `v1` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-15 13:03:13
