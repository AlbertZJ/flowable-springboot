-- MySQL dump 10.13  Distrib 5.7.24, for Win64 (x86_64)
--
-- Host: localhost    Database: daffodil
-- ------------------------------------------------------
-- Server version	5.7.24-log

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
-- Table structure for table `act_ru_execution`
--

DROP TABLE IF EXISTS `act_ru_execution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_MI_ROOT_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint(4) DEFAULT NULL,
  `EVT_SUBSCR_COUNT_` int(11) DEFAULT NULL,
  `TASK_COUNT_` int(11) DEFAULT NULL,
  `JOB_COUNT_` int(11) DEFAULT NULL,
  `TIMER_JOB_COUNT_` int(11) DEFAULT NULL,
  `SUSP_JOB_COUNT_` int(11) DEFAULT NULL,
  `DEADLETTER_JOB_COUNT_` int(11) DEFAULT NULL,
  `VAR_COUNT_` int(11) DEFAULT NULL,
  `ID_LINK_COUNT_` int(11) DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_IDC_EXEC_ROOT` (`ROOT_PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE,
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_execution`
--

LOCK TABLES `act_ru_execution` WRITE;
/*!40000 ALTER TABLE `act_ru_execution` DISABLE KEYS */;
INSERT INTO `act_ru_execution` VALUES ('7098cadc-c321-11ea-a804-96e6f7651f71',1,'7098cadc-c321-11ea-a804-96e6f7651f71','4028b26c733bb8d701733bc90997007a',NULL,'AskForLeave:1:350aab0b-c321-11ea-a804-96e6f7651f71',NULL,'7098cadc-c321-11ea-a804-96e6f7651f71',NULL,1,0,1,0,0,1,NULL,'4028b26c73316c440173317049080010','没事就是请假怎么地','startEvent1','2020-07-11 10:51:37.862','孙坚',NULL,1,0,0,0,0,0,0,0,0,'submitLeaveCallback','JQueryFunction'),('7098caed-c321-11ea-a804-96e6f7651f71',2,'7098cadc-c321-11ea-a804-96e6f7651f71',NULL,'7098cadc-c321-11ea-a804-96e6f7651f71','AskForLeave:1:350aab0b-c321-11ea-a804-96e6f7651f71',NULL,'7098cadc-c321-11ea-a804-96e6f7651f71','sid-6D79B4F5-4CDB-4860-9694-C76721F2914F',1,0,0,0,0,1,NULL,'4028b26c73316c440173317049080010',NULL,NULL,'2020-07-11 10:51:37.862',NULL,NULL,1,0,1,0,0,0,0,0,0,'submitLeaveCallback','JQueryFunction'),('7f12e7af-c1dd-11ea-8c2f-96e6f7651f71',1,'7f12e7af-c1dd-11ea-8c2f-96e6f7651f71','4028b26c73337cd70173337e0a7b0000',NULL,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71',NULL,'7f12e7af-c1dd-11ea-8c2f-96e6f7651f71',NULL,1,0,1,0,0,1,NULL,'4028b26c73316c4401733171d2ad0016','第五次报销流程测试','startEvent1','2020-07-09 20:12:45.210','典韦',NULL,1,0,0,0,0,0,0,0,0,'submitExpenseCallback','JQueryFunction'),('7f135cef-c1dd-11ea-8c2f-96e6f7651f71',2,'7f12e7af-c1dd-11ea-8c2f-96e6f7651f71',NULL,'7f12e7af-c1dd-11ea-8c2f-96e6f7651f71','Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71',NULL,'7f12e7af-c1dd-11ea-8c2f-96e6f7651f71','sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A',1,0,0,0,0,1,NULL,'4028b26c73316c4401733171d2ad0016',NULL,NULL,'2020-07-09 20:12:45.213',NULL,NULL,1,0,1,0,0,0,0,0,0,'submitExpenseCallback','JQueryFunction'),('9f9731fc-c28b-11ea-b0fd-96e6f7651f71',1,'9f9731fc-c28b-11ea-b0fd-96e6f7651f71','4028b26c7337bcae017337f3337b0013',NULL,'Expense:1:5d25c3eb-c28b-11ea-b0fd-96e6f7651f71',NULL,'9f9731fc-c28b-11ea-b0fd-96e6f7651f71',NULL,1,0,1,0,0,1,NULL,'4028b26c73316c440173317228b40018','第一次部门经理级流程测试','start','2020-07-10 16:59:12.195','关羽',NULL,1,0,0,0,0,0,0,0,0,'submitExpenseCallback','JQueryFunction'),('9f97591c-c28b-11ea-b0fd-96e6f7651f71',2,'9f9731fc-c28b-11ea-b0fd-96e6f7651f71',NULL,'9f9731fc-c28b-11ea-b0fd-96e6f7651f71','Expense:1:5d25c3eb-c28b-11ea-b0fd-96e6f7651f71',NULL,'9f9731fc-c28b-11ea-b0fd-96e6f7651f71','bossTask',1,0,0,0,0,1,NULL,'4028b26c73316c440173317228b40018',NULL,NULL,'2020-07-10 16:59:12.196',NULL,NULL,1,0,1,0,0,0,0,0,0,'submitExpenseCallback','JQueryFunction'),('caba6266-c286-11ea-b0fd-96e6f7651f71',1,'caba6266-c286-11ea-b0fd-96e6f7651f71','4028b26c7337bcae017337d389c20008',NULL,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71',NULL,'caba6266-c286-11ea-b0fd-96e6f7651f71',NULL,1,0,1,0,0,1,NULL,'4028b26c73316c4401733171d2ad0016','员工级别-报销流程','startEvent1','2020-07-10 16:24:37.084','典韦',NULL,1,0,0,0,0,0,0,0,0,'submitExpenseCallback','JQueryFunction'),('caba8986-c286-11ea-b0fd-96e6f7651f71',3,'caba6266-c286-11ea-b0fd-96e6f7651f71',NULL,'caba6266-c286-11ea-b0fd-96e6f7651f71','Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71',NULL,'caba6266-c286-11ea-b0fd-96e6f7651f71','sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8',1,0,0,0,0,1,NULL,'4028b26c73316c4401733171d2ad0016',NULL,NULL,'2020-07-10 16:24:37.085',NULL,NULL,1,0,1,0,0,0,0,0,0,'submitExpenseCallback','JQueryFunction'),('cb78627d-c283-11ea-b0fd-96e6f7651f71',1,'cb78627d-c283-11ea-b0fd-96e6f7651f71','4028b26c7337bcae017337bfe56f0001',NULL,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71',NULL,'cb78627d-c283-11ea-b0fd-96e6f7651f71',NULL,1,0,1,0,0,1,NULL,'4028b26c73316c4401733171d2ad0016','第十次报销流程测试','startEvent1','2020-07-10 16:03:09.839','典韦',NULL,1,0,0,0,0,0,0,0,0,'submitExpenseCallback','JQueryFunction'),('cb78b0ad-c283-11ea-b0fd-96e6f7651f71',2,'cb78627d-c283-11ea-b0fd-96e6f7651f71',NULL,'cb78627d-c283-11ea-b0fd-96e6f7651f71','Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71',NULL,'cb78627d-c283-11ea-b0fd-96e6f7651f71','sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A',1,0,0,0,0,1,NULL,'4028b26c73316c4401733171d2ad0016',NULL,NULL,'2020-07-10 16:03:09.841',NULL,NULL,1,0,1,0,0,0,0,0,0,'submitExpenseCallback','JQueryFunction'),('d2a7ede0-c27e-11ea-8dcf-96e6f7651f71',1,'d2a7ede0-c27e-11ea-8dcf-96e6f7651f71','4028b26c73376dde0173379f4fee000f',NULL,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71',NULL,'d2a7ede0-c27e-11ea-8dcf-96e6f7651f71',NULL,1,0,1,0,0,1,NULL,'4028b26c73316c4401733171d2ad0016','第九次报销流程测试','startEvent1','2020-07-10 15:27:34.411','典韦',NULL,1,0,0,0,0,0,0,0,0,'submitExpenseCallback','JQueryFunction'),('d2a7edf0-c27e-11ea-8dcf-96e6f7651f71',2,'d2a7ede0-c27e-11ea-8dcf-96e6f7651f71',NULL,'d2a7ede0-c27e-11ea-8dcf-96e6f7651f71','Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71',NULL,'d2a7ede0-c27e-11ea-8dcf-96e6f7651f71','sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A',1,0,0,0,0,1,NULL,'4028b26c73316c4401733171d2ad0016',NULL,NULL,'2020-07-10 15:27:34.411',NULL,NULL,1,0,1,0,0,0,0,0,0,'submitExpenseCallback','JQueryFunction');
/*!40000 ALTER TABLE `act_ru_execution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_history_job`
--

DROP TABLE IF EXISTS `act_ru_history_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_history_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ADV_HANDLER_CFG_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_history_job`
--

LOCK TABLES `act_ru_history_job` WRITE;
/*!40000 ALTER TABLE `act_ru_history_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_history_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_online`
--

DROP TABLE IF EXISTS `sys_user_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_online` (
  `session_id` varchar(255) NOT NULL,
  `browser` varchar(255) DEFAULT NULL,
  `dept_name` varchar(255) DEFAULT NULL,
  `expire_time` bigint(20) DEFAULT NULL,
  `ipaddr` varchar(255) DEFAULT NULL,
  `last_access_time` datetime DEFAULT NULL,
  `login_location` varchar(255) DEFAULT NULL,
  `login_name` varchar(255) DEFAULT NULL,
  `os` varchar(255) DEFAULT NULL,
  `start_timestamp` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_online`
--

LOCK TABLES `sys_user_online` WRITE;
/*!40000 ALTER TABLE `sys_user_online` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_user_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_timer_job`
--

DROP TABLE IF EXISTS `act_ru_timer_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_timer_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TIMER_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_TIMER_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
  KEY `ACT_IDX_TJOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_TJOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_TJOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_TIMER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_timer_job`
--

LOCK TABLES `act_ru_timer_job` WRITE;
/*!40000 ALTER TABLE `act_ru_timer_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_timer_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_post` (
  `post_id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `order_num` bigint(20) DEFAULT NULL,
  `post_code` varchar(64) DEFAULT NULL,
  `post_name` varchar(50) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES ('40283e81704c759101704c78a7e70011','admin','2020-02-16 13:29:01',1,'000','董事长','','0','admin','2020-06-02 10:40:46'),('40283e81704c759101704c78d7410013','admin','2020-02-16 13:29:13',2,'100','总经理','','0',NULL,NULL),('40283e81704c759101704c79275e0015','admin','2020-02-16 13:29:33',3,'200','部门经理','','0',NULL,NULL),('40283e81704c759101704c798f1e0017','admin','2020-02-16 13:30:00',4,'300','员工','','0',NULL,NULL);
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demo_expense`
--

DROP TABLE IF EXISTS `demo_expense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demo_expense` (
  `expense_id` varchar(255) NOT NULL,
  `content` varchar(4000) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `money` double DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `deploy_id` varchar(255) DEFAULT NULL,
  `flow_type_id` varchar(255) DEFAULT NULL,
  `model_key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`expense_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demo_expense`
--

LOCK TABLES `demo_expense` WRITE;
/*!40000 ALTER TABLE `demo_expense` DISABLE KEYS */;
INSERT INTO `demo_expense` VALUES ('4028b26c73324cb00173324e37370001','第一次流程报销测试','典韦','2020-07-09 14:40:54',100,'第一次流程报销测试','第一次流程报销测试',NULL,NULL,'e5381dc2-c191-11ea-8e4d-96e6f7651f71','4028b26c73316c4401733171d2ad0016','Expense2'),('4028b26c73324cb00173324f21e00004','第二次流程报销测试','典韦','2020-07-09 14:41:54',200,'第二次流程报销测试','第二次流程报销测试',NULL,NULL,'e5381dc2-c191-11ea-8e4d-96e6f7651f71','4028b26c73316c4401733171d2ad0016','Expense2'),('4028b26c73324cb001733250c4c10007','第三次流程报销测试','典韦','2020-07-09 14:43:41',3000,'第三次流程报销测试','第三次流程报销测试',NULL,NULL,'e5381dc2-c191-11ea-8e4d-96e6f7651f71','4028b26c73316c4401733171d2ad0016','Expense2'),('4028b26c73324cb0017332529edd000a','第四次流程报销测试','典韦','2020-07-09 14:45:42',400,'第四次流程报销测试','第四次流程报销测试',NULL,NULL,'e5381dc2-c191-11ea-8e4d-96e6f7651f71','4028b26c73316c4401733171d2ad0016','Expense2'),('4028b26c73337cd70173337e0a7b0000','第五次报销流程测试','典韦','2020-07-09 20:12:45',500,'第五次报销流程测试','第五次报销流程测试','典韦','2020-07-09 21:14:53','e5381dc2-c191-11ea-8e4d-96e6f7651f71','4028b26c73316c4401733171d2ad0016','Expense2'),('4028b26c7336adf8017336c7a0950000','第六次报销流程测试','典韦','2020-07-10 11:31:59',600,'第六次报销流程测试','第六次报销流程测试',NULL,NULL,'e5381dc2-c191-11ea-8e4d-96e6f7651f71','4028b26c73316c4401733171d2ad0016','Expense2'),('4028b26c733750a4017337596a220000','第七次报销流程测试','典韦','2020-07-10 14:11:14',7000,'第七次报销流程测试','第七次报销流程测试-作废测试',NULL,NULL,'e5381dc2-c191-11ea-8e4d-96e6f7651f71','4028b26c73316c4401733171d2ad0016','Expense2'),('4028b26c73376dde0173379c30a9000a','第八次报销流程测试-作废测试','典韦','2020-07-10 15:24:10',800,'第八次报销流程测试-作废测试','第八次报销流程测试-作废测试','典韦','2020-07-10 15:24:24','e5381dc2-c191-11ea-8e4d-96e6f7651f71','4028b26c73316c4401733171d2ad0016','Expense2'),('4028b26c73376dde0173379f4fee000f','第九次报销流程测试','典韦','2020-07-10 15:27:34',900,'第九次报销流程测试','第九次报销流程测试',NULL,NULL,'e5381dc2-c191-11ea-8e4d-96e6f7651f71','4028b26c73316c4401733171d2ad0016','Expense2'),('4028b26c7337bcae017337bfe56f0001','第十次报销流程测试','典韦','2020-07-10 16:03:10',10000,'第十次报销流程测试','第十次报销流程测试',NULL,NULL,'e5381dc2-c191-11ea-8e4d-96e6f7651f71','4028b26c73316c4401733171d2ad0016','Expense2'),('4028b26c7337bcae017337d389c20008','第十一次报销流程测试','典韦','2020-07-10 16:24:37',11000,'第十一次报销流程测试','第十一次报销流程测试','典韦','2020-07-11 11:13:26','e5381dc2-c191-11ea-8e4d-96e6f7651f71','4028b26c73316c4401733171d2ad0016','Expense2'),('4028b26c7337bcae017337f3337b0013','第一次部门经理级流程测试','关羽','2020-07-10 16:59:12',600,'第一次部门经理级流程测试','第一次部门经理级流程测试',NULL,NULL,'5d1410a8-c28b-11ea-b0fd-96e6f7651f71','4028b26c73316c440173317228b40018','Expense');
/*!40000 ALTER TABLE `demo_expense` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_post` (
  `user_post_id` varchar(255) NOT NULL,
  `post_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_comment`
--

DROP TABLE IF EXISTS `act_hi_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_comment`
--

LOCK TABLES `act_hi_comment` WRITE;
/*!40000 ALTER TABLE `act_hi_comment` DISABLE KEYS */;
INSERT INTO `act_hi_comment` VALUES ('0317426f-c1c7-11ea-9b4f-96e6f7651f71','comment','2020-07-09 17:31:48.273','典韦','d84ea73b-c1c6-11ea-9b4f-96e6f7651f71','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','AddComment','已修改完成',_binary '已修改完成'),('031baf45-c1c7-11ea-9b4f-96e6f7651f71','event','2020-07-09 17:31:48.302','典韦','0318c912-c1c7-11ea-9b4f-96e6f7651f71',NULL,'AddUserLink','刘备_|_assignee',NULL),('0da8bea8-c1e7-11ea-8f09-96e6f7651f71','comment','2020-07-09 21:21:09.899','典韦','7f161c12-c1dd-11ea-8c2f-96e6f7651f71','7f12e7af-c1dd-11ea-8c2f-96e6f7651f71','AddComment','老大看你了',_binary '老大看你了'),('0db5de0f-c1e7-11ea-8f09-96e6f7651f71','event','2020-07-09 21:21:09.985','典韦','0daf274b-c1e7-11ea-8f09-96e6f7651f71',NULL,'AddUserLink','刘备_|_assignee',NULL),('1600bc9e-c323-11ea-a804-96e6f7651f71','comment','2020-07-11 11:03:24.864','典韦','cb78b0b0-c283-11ea-b0fd-96e6f7651f71','cb78627d-c283-11ea-b0fd-96e6f7651f71','AddComment','测试发送',_binary '测试发送'),('16077365-c323-11ea-a804-96e6f7651f71','event','2020-07-11 11:03:24.908','典韦','160354b1-c323-11ea-a804-96e6f7651f71',NULL,'AddUserLink','刘备_|_assignee',NULL),('175f5e26-c1c7-11ea-9b4f-96e6f7651f71','comment','2020-07-09 17:32:22.300','刘备','0318c912-c1c7-11ea-9b4f-96e6f7651f71','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','AddComment','同意',_binary '同意'),('1764673d-c1c7-11ea-9b4f-96e6f7651f71','event','2020-07-09 17:32:22.333','刘备','176159f9-c1c7-11ea-9b4f-96e6f7651f71',NULL,'AddUserLink','周瑜_|_assignee',NULL),('1bf9ff8c-c1c8-11ea-9b4f-96e6f7651f71','comment','2020-07-09 17:39:39.521','周瑜','f98fb9d8-c1c7-11ea-9b4f-96e6f7651f71','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','AddComment','死循环',_binary '死循环'),('1bff08a2-c1c8-11ea-9b4f-96e6f7651f71','event','2020-07-09 17:39:39.554','周瑜','1bfbd44f-c1c8-11ea-9b4f-96e6f7651f71',NULL,'AddUserLink','刘备_|_assignee',NULL),('2474fd96-c1cb-11ea-9b4f-96e6f7651f71','comment','2020-07-09 18:01:22.239','周瑜','fd2ef972-c1ca-11ea-9b4f-96e6f7651f71','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','AddComment','测试退回',_binary '测试退回'),('27a7b0f2-c1af-11ea-9b4f-96e6f7651f71','event','2020-07-09 14:41:01.696','典韦','2797ab5d-c1af-11ea-9b4f-96e6f7651f71',NULL,'AddUserLink','典韦_|_assignee',NULL),('28600e93-c274-11ea-9d08-96e6f7651f71','event','2020-07-10 14:11:13.760','典韦','28586d6e-c274-11ea-9d08-96e6f7651f71',NULL,'AddUserLink','典韦_|_assignee',NULL),('2e5ab66d-c1cb-11ea-9b4f-96e6f7651f71','event','2020-07-09 18:01:38.844','周瑜','291c1779-c1cb-11ea-9b4f-96e6f7651f71',NULL,'AddUserLink','曹操_|_assignee',NULL),('3aeeff3a-c1c9-11ea-9b4f-96e6f7651f71','comment','2020-07-09 17:47:40.955','周瑜','bafc2cd6-c1c8-11ea-9b4f-96e6f7651f71','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','AddComment','死循环',_binary '死循环'),('3af39320-c1c9-11ea-9b4f-96e6f7651f71','event','2020-07-09 17:47:40.985','周瑜','3af085dd-c1c9-11ea-9b4f-96e6f7651f71',NULL,'AddUserLink','刘备_|_assignee',NULL),('46a9765a-c1af-11ea-9b4f-96e6f7651f71','event','2020-07-09 14:41:53.717','典韦','46a111e5-c1af-11ea-9b4f-96e6f7651f71',NULL,'AddUserLink','典韦_|_assignee',NULL),('4a0dedfe-c1cb-11ea-9b4f-96e6f7651f71','comment','2020-07-09 18:02:25.317','曹操','291c1779-c1cb-11ea-9b4f-96e6f7651f71','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','AddComment','确认解决bug<br>',_binary '确认解决bug<br>'),('4a139354-c1cb-11ea-9b4f-96e6f7651f71','event','2020-07-09 18:02:25.354','曹操','4a10ad21-c1cb-11ea-9b4f-96e6f7651f71',NULL,'AddUserLink','周瑜_|_assignee',NULL),('5427af25-c1cb-11ea-9b4f-96e6f7651f71','comment','2020-07-09 18:02:42.263','周瑜','4a10ad21-c1cb-11ea-9b4f-96e6f7651f71','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','AddComment','收官',_binary '收官'),('58bdc12f-c27e-11ea-8dcf-96e6f7651f71','event','2020-07-10 15:24:09.872','典韦','58b9545a-c27e-11ea-8dcf-96e6f7651f71',NULL,'AddUserLink','典韦_|_assignee',NULL),('6e27aea5-c283-11ea-b0fd-96e6f7651f71','comment','2020-07-10 16:00:33.282','典韦','d2a81503-c27e-11ea-8dcf-96e6f7651f71','d2a7ede0-c27e-11ea-8dcf-96e6f7651f71','AddComment','',''),('6e38778c-c283-11ea-b0fd-96e6f7651f71','event','2020-07-10 16:00:33.392','典韦','6e30fd78-c283-11ea-b0fd-96e6f7651f71',NULL,'AddUserLink','曹操_|_assignee',NULL),('6ecf7bf1-c1c9-11ea-9b4f-96e6f7651f71','comment','2020-07-09 17:49:07.990','刘备','3af085dd-c1c9-11ea-9b4f-96e6f7651f71','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','AddComment','监听到周瑜',_binary '监听到周瑜'),('709ff6e5-c321-11ea-a804-96e6f7651f71','event','2020-07-11 10:51:37.909','孙坚','7098f200-c321-11ea-a804-96e6f7651f71',NULL,'AddUserLink','孙坚_|_assignee',NULL),('7f22ed57-c1dd-11ea-8c2f-96e6f7651f71','event','2020-07-09 20:12:45.315','典韦','7f161c12-c1dd-11ea-8c2f-96e6f7651f71',NULL,'AddUserLink','典韦_|_assignee',NULL),('81f140c6-c321-11ea-a804-96e6f7651f71','comment','2020-07-11 10:52:06.963','孙坚','7098f200-c321-11ea-a804-96e6f7651f71','7098cadc-c321-11ea-a804-96e6f7651f71','AddComment','收了你',_binary '收了你'),('81f893cd-c321-11ea-a804-96e6f7651f71','event','2020-07-11 10:52:07.011','孙坚','81f426f9-c321-11ea-a804-96e6f7651f71',NULL,'AddUserLink','刘备_|_assignee',NULL),('86923dd2-c1af-11ea-9b4f-96e6f7651f71','event','2020-07-09 14:43:40.939','典韦','868bfc3d-c1af-11ea-9b4f-96e6f7651f71',NULL,'AddUserLink','典韦_|_assignee',NULL),('86cf769f-c1c6-11ea-9b4f-96e6f7651f71','comment','2020-07-09 17:28:19.765','典韦','46a111e5-c1af-11ea-9b4f-96e6f7651f71','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','AddComment','同',_binary '同'),('86d65476-c1c6-11ea-9b4f-96e6f7651f71','event','2020-07-09 17:28:19.810','典韦','86d20eb2-c1c6-11ea-9b4f-96e6f7651f71',NULL,'AddUserLink','刘备_|_assignee',NULL),('8b4733b6-c1d7-11ea-8903-96e6f7651f71','comment','2020-07-09 19:30:08.704','典韦','cee40925-c1af-11ea-9b4f-96e6f7651f71','cee3e203-c1af-11ea-9b4f-96e6f7651f71','AddComment','务必同意',_binary '务必同意'),('8b4d754d-c1d7-11ea-8903-96e6f7651f71','event','2020-07-09 19:30:08.746','典韦','8b490879-c1d7-11ea-8903-96e6f7651f71',NULL,'AddUserLink','刘备_|_assignee',NULL),('92b312ee-c1d7-11ea-8903-96e6f7651f71','comment','2020-07-09 19:30:21.156','周瑜','e0df0bb1-c1d5-11ea-8903-96e6f7651f71','868bd51b-c1af-11ea-9b4f-96e6f7651f71','AddComment','不能急',_binary '不能急'),('9e3a46c1-c1d7-11ea-8903-96e6f7651f71','comment','2020-07-09 19:30:40.497','刘备','8b490879-c1d7-11ea-8903-96e6f7651f71','cee3e203-c1af-11ea-9b4f-96e6f7651f71','AddComment','办了',_binary '办了'),('9e40af69-c1d7-11ea-8903-96e6f7651f71','event','2020-07-09 19:30:40.539','刘备','9e3cb7c5-c1d7-11ea-8903-96e6f7651f71',NULL,'AddUserLink','周瑜_|_assignee',NULL),('9f3fbc53-c1bf-11ea-9b4f-96e6f7651f71','comment','2020-07-09 16:38:54.289','刘备','a1ebd0de-c1bc-11ea-9b4f-96e6f7651f71','279476fb-c1af-11ea-9b4f-96e6f7651f71','AddComment','同意办理',_binary '同意办理'),('9f49ce7b-c1bf-11ea-9b4f-96e6f7651f71','event','2020-07-09 16:38:54.355','刘备','9f45afc7-c1bf-11ea-9b4f-96e6f7651f71',NULL,'AddUserLink','周瑜_|_assignee',NULL),('9f9d2584-c28b-11ea-b0fd-96e6f7651f71','event','2020-07-10 16:59:12.234','关羽','9f97591f-c28b-11ea-b0fd-96e6f7651f71',NULL,'AddUserLink','关羽_|_assignee',NULL),('a1e5412b-c1bc-11ea-9b4f-96e6f7651f71','comment','2020-07-09 16:17:30.239','典韦','2797ab5d-c1af-11ea-9b4f-96e6f7651f71','279476fb-c1af-11ea-9b4f-96e6f7651f71','AddComment','',''),('a1f1c452-c1bc-11ea-9b4f-96e6f7651f71','event','2020-07-09 16:17:30.321','典韦','a1ebd0de-c1bc-11ea-9b4f-96e6f7651f71',NULL,'AddUserLink','刘备_|_assignee',NULL),('a96572cf-c27d-11ea-8dcf-96e6f7651f71','comment','2020-07-10 15:19:15.692','典韦','e98d9b17-c25d-11ea-82f3-96e6f7651f71','e988b904-c25d-11ea-82f3-96e6f7651f71','AddComment','<p>测试第二环节作废</p>',_binary '<p>测试第二环节作废</p>'),('a975ed96-c27d-11ea-8dcf-96e6f7651f71','event','2020-07-10 15:19:15.800','典韦','a96c9ec2-c27d-11ea-8dcf-96e6f7651f71',NULL,'AddUserLink','刘备_|_assignee',NULL),('adf5875a-c1d7-11ea-8903-96e6f7651f71','comment','2020-07-09 19:31:06.890','周瑜','9e3cb7c5-c1d7-11ea-8903-96e6f7651f71','cee3e203-c1af-11ea-9b4f-96e6f7651f71','AddComment','发工资',_binary '发工资'),('b11d6ea5-c28b-11ea-b0fd-96e6f7651f71','comment','2020-07-10 16:59:41.596','关羽','9f97591f-c28b-11ea-b0fd-96e6f7651f71','9f9731fc-c28b-11ea-b0fd-96e6f7651f71','AddComment','恭喜老板',_binary '恭喜老板'),('b12313fd-c28b-11ea-b0fd-96e6f7651f71','event','2020-07-10 16:59:41.633','关羽','b12006b9-c28b-11ea-b0fd-96e6f7651f71',NULL,'AddUserLink','admin_|_assignee',NULL),('b5d1b2c7-c320-11ea-a804-96e6f7651f71','event','2020-07-11 10:46:24.501','孙权','b5c83ce2-c320-11ea-a804-96e6f7651f71',NULL,'AddUserLink','孙权_|_assignee',NULL),('bafa09f3-c1c8-11ea-9b4f-96e6f7651f71','comment','2020-07-09 17:44:06.279','刘备','1bfbd44f-c1c8-11ea-9b4f-96e6f7651f71','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','AddComment','周瑜审批',_binary '周瑜审批'),('baff1309-c1c8-11ea-9b4f-96e6f7651f71','event','2020-07-09 17:44:06.312','刘备','bafc2cd6-c1c8-11ea-9b4f-96e6f7651f71',NULL,'AddUserLink','周瑜_|_assignee',NULL),('bfc98188-c1ca-11ea-9b4f-96e6f7651f71','comment','2020-07-09 17:58:33.343','周瑜','be10ca74-c1c9-11ea-9b4f-96e6f7651f71','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','AddComment','解决bug',_binary '解决bug'),('c8bb59e7-c1c9-11ea-9b4f-96e6f7651f71','event','2020-07-09 17:51:38.853','刘备','be10ca74-c1c9-11ea-9b4f-96e6f7651f71',NULL,'AddUserLink','周瑜_|_assignee',NULL),('caadc9e6-c323-11ea-a804-96e6f7651f71','comment','2020-07-11 11:08:27.988','刘备','dfae4e92-c286-11ea-b0fd-96e6f7651f71','caba6266-c286-11ea-b0fd-96e6f7651f71','AddComment','费用太高了审批不过',_binary '费用太高了审批不过'),('cab51ced-c323-11ea-a804-96e6f7651f71','event','2020-07-11 11:08:28.036','刘备','cab0fe3a-c323-11ea-a804-96e6f7651f71',NULL,'AddUserLink','典韦_|_assignee',NULL),('cabf6b8e-c286-11ea-b0fd-96e6f7651f71','event','2020-07-10 16:24:37.117','典韦','caba8989-c286-11ea-b0fd-96e6f7651f71',NULL,'AddUserLink','典韦_|_assignee',NULL),('cb7ecb35-c283-11ea-b0fd-96e6f7651f71','event','2020-07-10 16:03:09.881','典韦','cb78b0b0-c283-11ea-b0fd-96e6f7651f71',NULL,'AddUserLink','典韦_|_assignee',NULL),('cda308c5-c1d5-11ea-8903-96e6f7651f71','comment','2020-07-09 19:17:41.043','典韦','868bfc3d-c1af-11ea-9b4f-96e6f7651f71','868bd51b-c1af-11ea-9b4f-96e6f7651f71','AddComment','大哥<br>',_binary '大哥<br>'),('cdb1399c-c1d5-11ea-8903-96e6f7651f71','event','2020-07-09 19:17:41.136','典韦','cdaaf808-c1d5-11ea-8903-96e6f7651f71',NULL,'AddUserLink','曹操_|_assignee',NULL),('cee9394a-c1af-11ea-9b4f-96e6f7651f71','event','2020-07-09 14:45:42.305','典韦','cee40925-c1af-11ea-9b4f-96e6f7651f71',NULL,'AddUserLink','典韦_|_assignee',NULL),('d2ad6c38-c27e-11ea-8dcf-96e6f7651f71','event','2020-07-10 15:27:34.447','典韦','d2a81503-c27e-11ea-8dcf-96e6f7651f71',NULL,'AddUserLink','典韦_|_assignee',NULL),('d84bc107-c1c6-11ea-9b4f-96e6f7651f71','comment','2020-07-09 17:30:36.475','刘备','86d20eb2-c1c6-11ea-9b4f-96e6f7651f71','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','AddComment','不同意',_binary '不同意'),('d8529ede-c1c6-11ea-9b4f-96e6f7651f71','event','2020-07-09 17:30:36.520','刘备','d84ea73b-c1c6-11ea-9b4f-96e6f7651f71',NULL,'AddUserLink','典韦_|_assignee',NULL),('d95bd4ee-c1ca-11ea-9b4f-96e6f7651f71','event','2020-07-09 17:59:16.245','周瑜','d90e9f4b-c1ca-11ea-9b4f-96e6f7651f71',NULL,'AddUserLink','刘备_|_assignee',NULL),('dfab8f6f-c286-11ea-b0fd-96e6f7651f71','comment','2020-07-10 16:25:12.219','典韦','caba8989-c286-11ea-b0fd-96e6f7651f71','caba6266-c286-11ea-b0fd-96e6f7651f71','AddComment','大哥看你了',_binary '大哥看你了'),('dfb1f816-c286-11ea-b0fd-96e6f7651f71','event','2020-07-10 16:25:12.261','典韦','dfae4e92-c286-11ea-b0fd-96e6f7651f71',NULL,'AddUserLink','刘备_|_assignee',NULL),('e0da77cd-c1d5-11ea-8903-96e6f7651f71','comment','2020-07-09 19:18:13.282','曹操','cdaaf808-c1d5-11ea-8903-96e6f7651f71','868bd51b-c1af-11ea-9b4f-96e6f7651f71','AddComment','老周',_binary '老周'),('e0e43bd5-c1d5-11ea-8903-96e6f7651f71','event','2020-07-09 19:18:13.346','曹操','e0df0bb1-c1d5-11ea-8903-96e6f7651f71',NULL,'AddUserLink','周瑜_|_assignee',NULL),('e11c1cde-c1c7-11ea-9b4f-96e6f7651f71','comment','2020-07-09 17:38:00.759','周瑜','176159f9-c1c7-11ea-9b4f-96e6f7651f71','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','AddComment','错乱了',_binary '错乱了'),('e121e944-c1c7-11ea-9b4f-96e6f7651f71','event','2020-07-09 17:38:00.797','周瑜','e11e66d1-c1c7-11ea-9b4f-96e6f7651f71',NULL,'AddUserLink','刘备_|_assignee',NULL),('e99710fc-c25d-11ea-82f3-96e6f7651f71','event','2020-07-10 11:31:59.496','典韦','e98d9b17-c25d-11ea-82f3-96e6f7651f71',NULL,'AddUserLink','典韦_|_assignee',NULL),('eab0c84f-c1ca-11ea-9b4f-96e6f7651f71','comment','2020-07-09 17:59:45.323','刘备','d90e9f4b-c1ca-11ea-9b4f-96e6f7651f71','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','AddComment','测试解决bug',_binary '测试解决bug'),('f260cb2c-c1c1-11ea-9b4f-96e6f7651f71','comment','2020-07-09 16:55:32.750','周瑜','9f45afc7-c1bf-11ea-9b4f-96e6f7651f71','279476fb-c1af-11ea-9b4f-96e6f7651f71','AddComment','同意办结',_binary '同意办结'),('f98c3765-c1c7-11ea-9b4f-96e6f7651f71','comment','2020-07-09 17:38:41.759','刘备','e11e66d1-c1c7-11ea-9b4f-96e6f7651f71','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','AddComment','同意',_binary '同意'),('f993153b-c1c7-11ea-9b4f-96e6f7651f71','event','2020-07-09 17:38:41.804','刘备','f98fb9d8-c1c7-11ea-9b4f-96e6f7651f71',NULL,'AddUserLink','周瑜_|_assignee',NULL),('fd7c0805-c1ca-11ea-9b4f-96e6f7651f71','event','2020-07-09 18:00:16.854','刘备','fd2ef972-c1ca-11ea-9b4f-96e6f7651f71',NULL,'AddUserLink','周瑜_|_assignee',NULL);
/*!40000 ALTER TABLE `act_hi_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_membership`
--

DROP TABLE IF EXISTS `act_id_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_membership`
--

LOCK TABLES `act_id_membership` WRITE;
/*!40000 ALTER TABLE `act_id_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_identitylink`
--

DROP TABLE IF EXISTS `act_hi_identitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_IDENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_identitylink`
--

LOCK TABLES `act_hi_identitylink` WRITE;
/*!40000 ALTER TABLE `act_hi_identitylink` DISABLE KEYS */;
INSERT INTO `act_hi_identitylink` VALUES ('03187af0-c1c7-11ea-9b4f-96e6f7651f71',NULL,'participant','典韦',NULL,'2020-07-09 17:31:48.281','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL),('0318c913-c1c7-11ea-9b4f-96e6f7651f71','40283e816f92646d016f92705173001a','candidate',NULL,'0318c912-c1c7-11ea-9b4f-96e6f7651f71','2020-07-09 17:31:48.283',NULL,NULL,NULL,NULL),('031b6124-c1c7-11ea-9b4f-96e6f7651f71',NULL,'assignee','刘备','0318c912-c1c7-11ea-9b4f-96e6f7651f71','2020-07-09 17:31:48.300',NULL,NULL,NULL,NULL),('0dabcbe9-c1e7-11ea-8f09-96e6f7651f71',NULL,'participant','典韦',NULL,'2020-07-09 21:21:09.919','7f12e7af-c1dd-11ea-8c2f-96e6f7651f71',NULL,NULL,NULL),('0daf274c-c1e7-11ea-8f09-96e6f7651f71','40283e816f92646d016f92705173001a','candidate',NULL,'0daf274b-c1e7-11ea-8f09-96e6f7651f71','2020-07-09 21:21:09.941',NULL,NULL,NULL,NULL),('0db541cd-c1e7-11ea-8f09-96e6f7651f71',NULL,'assignee','刘备','0daf274b-c1e7-11ea-8f09-96e6f7651f71','2020-07-09 21:21:09.981',NULL,NULL,NULL,NULL),('0db5de0e-c1e7-11ea-8f09-96e6f7651f71',NULL,'participant','刘备',NULL,'2020-07-09 21:21:09.985','7f12e7af-c1dd-11ea-8c2f-96e6f7651f71',NULL,NULL,NULL),('1602b86f-c323-11ea-a804-96e6f7651f71',NULL,'participant','典韦',NULL,'2020-07-11 11:03:24.877','cb78627d-c283-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL),('160354b2-c323-11ea-a804-96e6f7651f71','40283e816f92646d016f92705173001a','candidate',NULL,'160354b1-c323-11ea-a804-96e6f7651f71','2020-07-11 11:03:24.881',NULL,NULL,NULL,NULL),('16072543-c323-11ea-a804-96e6f7651f71',NULL,'assignee','刘备','160354b1-c323-11ea-a804-96e6f7651f71','2020-07-11 11:03:24.906',NULL,NULL,NULL,NULL),('16077364-c323-11ea-a804-96e6f7651f71',NULL,'participant','刘备',NULL,'2020-07-11 11:03:24.908','cb78627d-c283-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL),('1760e4c7-c1c7-11ea-9b4f-96e6f7651f71',NULL,'participant','刘备',NULL,'2020-07-09 17:32:22.310','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL),('176159fa-c1c7-11ea-9b4f-96e6f7651f71',NULL,'assignee','$INITIATOR','176159f9-c1c7-11ea-9b4f-96e6f7651f71','2020-07-09 17:32:22.313',NULL,NULL,NULL,NULL),('1763f20b-c1c7-11ea-9b4f-96e6f7651f71',NULL,'assignee','周瑜','176159f9-c1c7-11ea-9b4f-96e6f7651f71','2020-07-09 17:32:22.330',NULL,NULL,NULL,NULL),('1764673c-c1c7-11ea-9b4f-96e6f7651f71',NULL,'participant','周瑜',NULL,'2020-07-09 17:32:22.333','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL),('1bfb862d-c1c8-11ea-9b4f-96e6f7651f71',NULL,'participant','周瑜',NULL,'2020-07-09 17:39:39.531','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL),('1bfbd450-c1c8-11ea-9b4f-96e6f7651f71','40283e816f92646d016f92705173001a','candidate',NULL,'1bfbd44f-c1c8-11ea-9b4f-96e6f7651f71','2020-07-09 17:39:39.533',NULL,NULL,NULL,NULL),('1bfe9371-c1c8-11ea-9b4f-96e6f7651f71',NULL,'assignee','刘备','1bfbd44f-c1c8-11ea-9b4f-96e6f7651f71','2020-07-09 17:39:39.551',NULL,NULL,NULL,NULL),('279476fc-c1af-11ea-9b4f-96e6f7651f71',NULL,'starter','典韦',NULL,'2020-07-09 14:41:01.571','279476fb-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL),('2797d26e-c1af-11ea-9b4f-96e6f7651f71',NULL,'assignee','$INITIATOR','2797ab5d-c1af-11ea-9b4f-96e6f7651f71','2020-07-09 14:41:01.592',NULL,NULL,NULL,NULL),('2797d26f-c1af-11ea-9b4f-96e6f7651f71',NULL,'participant','$INITIATOR',NULL,'2020-07-09 14:41:01.592','279476fb-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL),('27a67870-c1af-11ea-9b4f-96e6f7651f71',NULL,'assignee','典韦','2797ab5d-c1af-11ea-9b4f-96e6f7651f71','2020-07-09 14:41:01.688',NULL,NULL,NULL,NULL),('27a7b0f1-c1af-11ea-9b4f-96e6f7651f71',NULL,'participant','典韦',NULL,'2020-07-09 14:41:01.696','279476fb-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL),('2855601c-c274-11ea-9d08-96e6f7651f71',NULL,'starter','典韦',NULL,'2020-07-10 14:11:13.691','2855601b-c274-11ea-9d08-96e6f7651f71',NULL,NULL,NULL),('28586d6f-c274-11ea-9d08-96e6f7651f71',NULL,'assignee','$INITIATOR','28586d6e-c274-11ea-9d08-96e6f7651f71','2020-07-10 14:11:13.710',NULL,NULL,NULL,NULL),('28586d70-c274-11ea-9d08-96e6f7651f71',NULL,'participant','$INITIATOR',NULL,'2020-07-10 14:11:13.710','2855601b-c274-11ea-9d08-96e6f7651f71',NULL,NULL,NULL),('285f7251-c274-11ea-9d08-96e6f7651f71',NULL,'assignee','典韦','28586d6e-c274-11ea-9d08-96e6f7651f71','2020-07-10 14:11:13.756',NULL,NULL,NULL,NULL),('285fe782-c274-11ea-9d08-96e6f7651f71',NULL,'participant','典韦',NULL,'2020-07-10 14:11:13.759','2855601b-c274-11ea-9d08-96e6f7651f71',NULL,NULL,NULL),('28e41787-c1cb-11ea-9b4f-96e6f7651f71',NULL,'participant','周瑜',NULL,'2020-07-09 18:01:29.679','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL),('291dec3a-c1cb-11ea-9b4f-96e6f7651f71','40283e816f92646d016f92705173001a','candidate',NULL,'291c1779-c1cb-11ea-9b4f-96e6f7651f71','2020-07-09 18:01:30.058',NULL,NULL,NULL,NULL),('2e4f6bcb-c1cb-11ea-9b4f-96e6f7651f71',NULL,'assignee','曹操','291c1779-c1cb-11ea-9b4f-96e6f7651f71','2020-07-09 18:01:38.770',NULL,NULL,NULL,NULL),('2e5ab66c-c1cb-11ea-9b4f-96e6f7651f71',NULL,'participant','曹操',NULL,'2020-07-09 18:01:38.844','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL),('3af037bb-c1c9-11ea-9b4f-96e6f7651f71',NULL,'participant','周瑜',NULL,'2020-07-09 17:47:40.963','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL),('3af085de-c1c9-11ea-9b4f-96e6f7651f71','40283e816f92646d016f92705173001a','candidate',NULL,'3af085dd-c1c9-11ea-9b4f-96e6f7651f71','2020-07-09 17:47:40.965',NULL,NULL,NULL,NULL),('3af36c0f-c1c9-11ea-9b4f-96e6f7651f71',NULL,'assignee','刘备','3af085dd-c1c9-11ea-9b4f-96e6f7651f71','2020-07-09 17:47:40.984',NULL,NULL,NULL,NULL),('46a0ebc4-c1af-11ea-9b4f-96e6f7651f71',NULL,'starter','典韦',NULL,'2020-07-09 14:41:53.661','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL),('46a111e6-c1af-11ea-9b4f-96e6f7651f71',NULL,'assignee','$INITIATOR','46a111e5-c1af-11ea-9b4f-96e6f7651f71','2020-07-09 14:41:53.662',NULL,NULL,NULL,NULL),('46a111e7-c1af-11ea-9b4f-96e6f7651f71',NULL,'participant','$INITIATOR',NULL,'2020-07-09 14:41:53.662','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL),('46a8b308-c1af-11ea-9b4f-96e6f7651f71',NULL,'assignee','典韦','46a111e5-c1af-11ea-9b4f-96e6f7651f71','2020-07-09 14:41:53.712',NULL,NULL,NULL,NULL),('46a94f49-c1af-11ea-9b4f-96e6f7651f71',NULL,'participant','典韦',NULL,'2020-07-09 14:41:53.717','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL),('4a1010df-c1cb-11ea-9b4f-96e6f7651f71',NULL,'participant','曹操',NULL,'2020-07-09 18:02:25.331','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL),('4a10ad22-c1cb-11ea-9b4f-96e6f7651f71','40283e816f92646d016f926a76fd0003','candidate',NULL,'4a10ad21-c1cb-11ea-9b4f-96e6f7651f71','2020-07-09 18:02:25.335',NULL,NULL,NULL,NULL),('4a131e23-c1cb-11ea-9b4f-96e6f7651f71',NULL,'assignee','周瑜','4a10ad21-c1cb-11ea-9b4f-96e6f7651f71','2020-07-09 18:02:25.351',NULL,NULL,NULL,NULL),('5658e706-c1cb-11ea-9b4f-96e6f7651f71',NULL,'participant','周瑜',NULL,'2020-07-09 18:02:45.941','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL),('58b92d38-c27e-11ea-8dcf-96e6f7651f71',NULL,'starter','典韦',NULL,'2020-07-10 15:24:09.842','58b92d37-c27e-11ea-8dcf-96e6f7651f71',NULL,NULL,NULL),('58b9545b-c27e-11ea-8dcf-96e6f7651f71',NULL,'assignee','$INITIATOR','58b9545a-c27e-11ea-8dcf-96e6f7651f71','2020-07-10 15:24:09.843',NULL,NULL,NULL,NULL),('58b9545c-c27e-11ea-8dcf-96e6f7651f71',NULL,'participant','$INITIATOR',NULL,'2020-07-10 15:24:09.843','58b92d37-c27e-11ea-8dcf-96e6f7651f71',NULL,NULL,NULL),('58bd730d-c27e-11ea-8dcf-96e6f7651f71',NULL,'assignee','典韦','58b9545a-c27e-11ea-8dcf-96e6f7651f71','2020-07-10 15:24:09.870',NULL,NULL,NULL,NULL),('58bdc12e-c27e-11ea-8dcf-96e6f7651f71',NULL,'participant','典韦',NULL,'2020-07-10 15:24:09.872','58b92d37-c27e-11ea-8dcf-96e6f7651f71',NULL,NULL,NULL),('6e2c90a6-c283-11ea-b0fd-96e6f7651f71',NULL,'participant','典韦',NULL,'2020-07-10 16:00:33.314','d2a7ede0-c27e-11ea-8dcf-96e6f7651f71',NULL,NULL,NULL),('6e312489-c283-11ea-b0fd-96e6f7651f71','40283e816f92646d016f92705173001a','candidate',NULL,'6e30fd78-c283-11ea-b0fd-96e6f7651f71','2020-07-10 16:00:33.344',NULL,NULL,NULL,NULL),('6e38025a-c283-11ea-b0fd-96e6f7651f71',NULL,'assignee','曹操','6e30fd78-c283-11ea-b0fd-96e6f7651f71','2020-07-10 16:00:33.389',NULL,NULL,NULL,NULL),('6e38778b-c283-11ea-b0fd-96e6f7651f71',NULL,'participant','曹操',NULL,'2020-07-10 16:00:33.392','d2a7ede0-c27e-11ea-8dcf-96e6f7651f71',NULL,NULL,NULL),('7098cadd-c321-11ea-a804-96e6f7651f71',NULL,'starter','孙坚',NULL,'2020-07-11 10:51:37.862','7098cadc-c321-11ea-a804-96e6f7651f71',NULL,NULL,NULL),('7098f201-c321-11ea-a804-96e6f7651f71',NULL,'assignee','$INITIATOR','7098f200-c321-11ea-a804-96e6f7651f71','2020-07-11 10:51:37.863',NULL,NULL,NULL,NULL),('7098f202-c321-11ea-a804-96e6f7651f71',NULL,'participant','$INITIATOR',NULL,'2020-07-11 10:51:37.863','7098cadc-c321-11ea-a804-96e6f7651f71',NULL,NULL,NULL),('709f81b3-c321-11ea-a804-96e6f7651f71',NULL,'assignee','孙坚','7098f200-c321-11ea-a804-96e6f7651f71','2020-07-11 10:51:37.906',NULL,NULL,NULL,NULL),('709ff6e4-c321-11ea-a804-96e6f7651f71',NULL,'participant','孙坚',NULL,'2020-07-11 10:51:37.909','7098cadc-c321-11ea-a804-96e6f7651f71',NULL,NULL,NULL),('7f12e7b0-c1dd-11ea-8c2f-96e6f7651f71',NULL,'starter','典韦',NULL,'2020-07-09 20:12:45.211','7f12e7af-c1dd-11ea-8c2f-96e6f7651f71',NULL,NULL,NULL),('7f164323-c1dd-11ea-8c2f-96e6f7651f71',NULL,'assignee','$INITIATOR','7f161c12-c1dd-11ea-8c2f-96e6f7651f71','2020-07-09 20:12:45.232',NULL,NULL,NULL,NULL),('7f164324-c1dd-11ea-8c2f-96e6f7651f71',NULL,'participant','$INITIATOR',NULL,'2020-07-09 20:12:45.232','7f12e7af-c1dd-11ea-8c2f-96e6f7651f71',NULL,NULL,NULL),('7f222a05-c1dd-11ea-8c2f-96e6f7651f71',NULL,'assignee','典韦','7f161c12-c1dd-11ea-8c2f-96e6f7651f71','2020-07-09 20:12:45.310',NULL,NULL,NULL,NULL),('7f22ed56-c1dd-11ea-8c2f-96e6f7651f71',NULL,'participant','典韦',NULL,'2020-07-09 20:12:45.315','7f12e7af-c1dd-11ea-8c2f-96e6f7651f71',NULL,NULL,NULL),('81f3b1c7-c321-11ea-a804-96e6f7651f71',NULL,'participant','孙坚',NULL,'2020-07-11 10:52:06.979','7098cadc-c321-11ea-a804-96e6f7651f71',NULL,NULL,NULL),('81f426fa-c321-11ea-a804-96e6f7651f71','40283e816f92646d016f92705173001a','candidate',NULL,'81f426f9-c321-11ea-a804-96e6f7651f71','2020-07-11 10:52:06.982',NULL,NULL,NULL,NULL),('81f845ab-c321-11ea-a804-96e6f7651f71',NULL,'assignee','刘备','81f426f9-c321-11ea-a804-96e6f7651f71','2020-07-11 10:52:07.009',NULL,NULL,NULL,NULL),('81f893cc-c321-11ea-a804-96e6f7651f71',NULL,'participant','刘备',NULL,'2020-07-11 10:52:07.011','7098cadc-c321-11ea-a804-96e6f7651f71',NULL,NULL,NULL),('868bd51c-c1af-11ea-9b4f-96e6f7651f71',NULL,'starter','典韦',NULL,'2020-07-09 14:43:40.897','868bd51b-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL),('868bfc3e-c1af-11ea-9b4f-96e6f7651f71',NULL,'assignee','$INITIATOR','868bfc3d-c1af-11ea-9b4f-96e6f7651f71','2020-07-09 14:43:40.898',NULL,NULL,NULL,NULL),('868bfc3f-c1af-11ea-9b4f-96e6f7651f71',NULL,'participant','$INITIATOR',NULL,'2020-07-09 14:43:40.898','868bd51b-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL),('8691efb0-c1af-11ea-9b4f-96e6f7651f71',NULL,'assignee','典韦','868bfc3d-c1af-11ea-9b4f-96e6f7651f71','2020-07-09 14:43:40.937',NULL,NULL,NULL,NULL),('86923dd1-c1af-11ea-9b4f-96e6f7651f71',NULL,'participant','典韦',NULL,'2020-07-09 14:43:40.939','868bd51b-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL),('86d19980-c1c6-11ea-9b4f-96e6f7651f71',NULL,'participant','典韦',NULL,'2020-07-09 17:28:19.779','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL),('86d20eb3-c1c6-11ea-9b4f-96e6f7651f71','40283e816f92646d016f92705173001a','candidate',NULL,'86d20eb2-c1c6-11ea-9b4f-96e6f7651f71','2020-07-09 17:28:19.782',NULL,NULL,NULL,NULL),('86d62d64-c1c6-11ea-9b4f-96e6f7651f71',NULL,'assignee','刘备','86d20eb2-c1c6-11ea-9b4f-96e6f7651f71','2020-07-09 17:28:19.809',NULL,NULL,NULL,NULL),('86d65475-c1c6-11ea-9b4f-96e6f7651f71',NULL,'participant','刘备',NULL,'2020-07-09 17:28:19.810','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL),('8b489347-c1d7-11ea-8903-96e6f7651f71',NULL,'participant','典韦',NULL,'2020-07-09 19:30:08.714','cee3e203-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL),('8b492f8a-c1d7-11ea-8903-96e6f7651f71','40283e816f92646d016f92705173001a','candidate',NULL,'8b490879-c1d7-11ea-8903-96e6f7651f71','2020-07-09 19:30:08.718',NULL,NULL,NULL,NULL),('8b4d4e3b-c1d7-11ea-8903-96e6f7651f71',NULL,'assignee','刘备','8b490879-c1d7-11ea-8903-96e6f7651f71','2020-07-09 19:30:08.745',NULL,NULL,NULL,NULL),('8b4d754c-c1d7-11ea-8903-96e6f7651f71',NULL,'participant','刘备',NULL,'2020-07-09 19:30:08.746','cee3e203-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL),('92b50ebf-c1d7-11ea-8903-96e6f7651f71',NULL,'participant','周瑜',NULL,'2020-07-09 19:30:21.169','868bd51b-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL),('9e3c4293-c1d7-11ea-8903-96e6f7651f71',NULL,'participant','刘备',NULL,'2020-07-09 19:30:40.510','cee3e203-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL),('9e3cb7c6-c1d7-11ea-8903-96e6f7651f71','40283e816f92646d016f926a76fd0003','candidate',NULL,'9e3cb7c5-c1d7-11ea-8903-96e6f7651f71','2020-07-09 19:30:40.513',NULL,NULL,NULL,NULL),('9e406147-c1d7-11ea-8903-96e6f7651f71',NULL,'assignee','周瑜','9e3cb7c5-c1d7-11ea-8903-96e6f7651f71','2020-07-09 19:30:40.537',NULL,NULL,NULL,NULL),('9e40af68-c1d7-11ea-8903-96e6f7651f71',NULL,'participant','周瑜',NULL,'2020-07-09 19:30:40.539','cee3e203-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL),('9f440215-c1bf-11ea-9b4f-96e6f7651f71',NULL,'participant','刘备',NULL,'2020-07-09 16:38:54.317','279476fb-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL),('9f45afc8-c1bf-11ea-9b4f-96e6f7651f71','40283e816f92646d016f926a76fd0003','candidate',NULL,'9f45afc7-c1bf-11ea-9b4f-96e6f7651f71','2020-07-09 16:38:54.328',NULL,NULL,NULL,NULL),('9f49a769-c1bf-11ea-9b4f-96e6f7651f71',NULL,'assignee','周瑜','9f45afc7-c1bf-11ea-9b4f-96e6f7651f71','2020-07-09 16:38:54.354',NULL,NULL,NULL,NULL),('9f49ce7a-c1bf-11ea-9b4f-96e6f7651f71',NULL,'participant','周瑜',NULL,'2020-07-09 16:38:54.355','279476fb-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL),('9f9731fd-c28b-11ea-b0fd-96e6f7651f71',NULL,'starter','关羽',NULL,'2020-07-10 16:59:12.195','9f9731fc-c28b-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL),('9f975920-c28b-11ea-b0fd-96e6f7651f71',NULL,'assignee','$INITIATOR','9f97591f-c28b-11ea-b0fd-96e6f7651f71','2020-07-10 16:59:12.196',NULL,NULL,NULL,NULL),('9f975921-c28b-11ea-b0fd-96e6f7651f71',NULL,'participant','$INITIATOR',NULL,'2020-07-10 16:59:12.196','9f9731fc-c28b-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL),('9f9cb052-c28b-11ea-b0fd-96e6f7651f71',NULL,'assignee','关羽','9f97591f-c28b-11ea-b0fd-96e6f7651f71','2020-07-10 16:59:12.231',NULL,NULL,NULL,NULL),('9f9d2583-c28b-11ea-b0fd-96e6f7651f71',NULL,'participant','关羽',NULL,'2020-07-10 16:59:12.234','9f9731fc-c28b-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL),('a1eabf6c-c1bc-11ea-9b4f-96e6f7651f71',NULL,'participant','典韦',NULL,'2020-07-09 16:17:30.275','279476fb-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL),('a1ebf7ef-c1bc-11ea-9b4f-96e6f7651f71','40283e816f92646d016f92705173001a','candidate',NULL,'a1ebd0de-c1bc-11ea-9b4f-96e6f7651f71','2020-07-09 16:17:30.283',NULL,NULL,NULL,NULL),('a1f17630-c1bc-11ea-9b4f-96e6f7651f71',NULL,'assignee','刘备','a1ebd0de-c1bc-11ea-9b4f-96e6f7651f71','2020-07-09 16:17:30.319',NULL,NULL,NULL,NULL),('a1f1c451-c1bc-11ea-9b4f-96e6f7651f71',NULL,'participant','刘备',NULL,'2020-07-09 16:17:30.321','279476fb-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL),('a9688010-c27d-11ea-8dcf-96e6f7651f71',NULL,'participant','典韦',NULL,'2020-07-10 15:19:15.712','e988b904-c25d-11ea-82f3-96e6f7651f71',NULL,NULL,NULL),('a96c9ec3-c27d-11ea-8dcf-96e6f7651f71','40283e816f92646d016f92705173001a','candidate',NULL,'a96c9ec2-c27d-11ea-8dcf-96e6f7651f71','2020-07-10 15:19:15.739',NULL,NULL,NULL,NULL),('a9759f74-c27d-11ea-8dcf-96e6f7651f71',NULL,'assignee','刘备','a96c9ec2-c27d-11ea-8dcf-96e6f7651f71','2020-07-10 15:19:15.798',NULL,NULL,NULL,NULL),('a975ed95-c27d-11ea-8dcf-96e6f7651f71',NULL,'participant','刘备',NULL,'2020-07-10 15:19:15.800','e988b904-c25d-11ea-82f3-96e6f7651f71',NULL,NULL,NULL),('adf75c1b-c1d7-11ea-8903-96e6f7651f71',NULL,'participant','周瑜',NULL,'2020-07-09 19:31:06.902','cee3e203-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL),('b11fb896-c28b-11ea-b0fd-96e6f7651f71',NULL,'participant','关羽',NULL,'2020-07-10 16:59:41.611','9f9731fc-c28b-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL),('b12006ba-c28b-11ea-b0fd-96e6f7651f71','402855816f1e2a2e016f1e2a45510000','candidate',NULL,'b12006b9-c28b-11ea-b0fd-96e6f7651f71','2020-07-10 16:59:41.613',NULL,NULL,NULL,NULL),('b122eceb-c28b-11ea-b0fd-96e6f7651f71',NULL,'assignee','admin','b12006b9-c28b-11ea-b0fd-96e6f7651f71','2020-07-10 16:59:41.632',NULL,NULL,NULL,NULL),('b12313fc-c28b-11ea-b0fd-96e6f7651f71',NULL,'participant','admin',NULL,'2020-07-10 16:59:41.633','9f9731fc-c28b-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL),('b5c4452f-c320-11ea-a804-96e6f7651f71',NULL,'starter','孙权',NULL,'2020-07-11 10:46:24.414','b5c4452e-c320-11ea-a804-96e6f7651f71',NULL,NULL,NULL),('b5c863f3-c320-11ea-a804-96e6f7651f71',NULL,'assignee','$INITIATOR','b5c83ce2-c320-11ea-a804-96e6f7651f71','2020-07-11 10:46:24.440',NULL,NULL,NULL,NULL),('b5c863f4-c320-11ea-a804-96e6f7651f71',NULL,'participant','$INITIATOR',NULL,'2020-07-11 10:46:24.440','b5c4452e-c320-11ea-a804-96e6f7651f71',NULL,NULL,NULL),('b5d13d95-c320-11ea-a804-96e6f7651f71',NULL,'assignee','孙权','b5c83ce2-c320-11ea-a804-96e6f7651f71','2020-07-11 10:46:24.498',NULL,NULL,NULL,NULL),('b5d1b2c6-c320-11ea-a804-96e6f7651f71',NULL,'participant','孙权',NULL,'2020-07-11 10:46:24.501','b5c4452e-c320-11ea-a804-96e6f7651f71',NULL,NULL,NULL),('bafbdeb4-c1c8-11ea-9b4f-96e6f7651f71',NULL,'participant','刘备',NULL,'2020-07-09 17:44:06.291','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL),('bafc2cd7-c1c8-11ea-9b4f-96e6f7651f71',NULL,'assignee','$INITIATOR','bafc2cd6-c1c8-11ea-9b4f-96e6f7651f71','2020-07-09 17:44:06.293',NULL,NULL,NULL,NULL),('bafec4e8-c1c8-11ea-9b4f-96e6f7651f71',NULL,'assignee','周瑜','bafc2cd6-c1c8-11ea-9b4f-96e6f7651f71','2020-07-09 17:44:06.310',NULL,NULL,NULL,NULL),('bddff672-c1c9-11ea-9b4f-96e6f7651f71',NULL,'participant','刘备',NULL,'2020-07-09 17:51:20.639','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL),('be118dc5-c1c9-11ea-9b4f-96e6f7651f71',NULL,'assignee','$INITIATOR','be10ca74-c1c9-11ea-9b4f-96e6f7651f71','2020-07-09 17:51:20.962',NULL,NULL,NULL,NULL),('c8b08476-c1c9-11ea-9b4f-96e6f7651f71',NULL,'assignee','周瑜','be10ca74-c1c9-11ea-9b4f-96e6f7651f71','2020-07-09 17:51:38.782',NULL,NULL,NULL,NULL),('caafc5b8-c323-11ea-a804-96e6f7651f71',NULL,'participant','刘备',NULL,'2020-07-11 11:08:28.002','caba6266-c286-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL),('cab0fe3b-c323-11ea-a804-96e6f7651f71',NULL,'assignee','$INITIATOR','cab0fe3a-c323-11ea-a804-96e6f7651f71','2020-07-11 11:08:28.009',NULL,NULL,NULL,NULL),('cab4a7bc-c323-11ea-a804-96e6f7651f71',NULL,'assignee','典韦','cab0fe3a-c323-11ea-a804-96e6f7651f71','2020-07-11 11:08:28.033',NULL,NULL,NULL,NULL),('caba6267-c286-11ea-b0fd-96e6f7651f71',NULL,'starter','典韦',NULL,'2020-07-10 16:24:37.084','caba6266-c286-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL),('caba898a-c286-11ea-b0fd-96e6f7651f71',NULL,'assignee','$INITIATOR','caba8989-c286-11ea-b0fd-96e6f7651f71','2020-07-10 16:24:37.085',NULL,NULL,NULL,NULL),('caba898b-c286-11ea-b0fd-96e6f7651f71',NULL,'participant','$INITIATOR',NULL,'2020-07-10 16:24:37.085','caba6266-c286-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL),('cabf1d6c-c286-11ea-b0fd-96e6f7651f71',NULL,'assignee','典韦','caba8989-c286-11ea-b0fd-96e6f7651f71','2020-07-10 16:24:37.115',NULL,NULL,NULL,NULL),('cabf6b8d-c286-11ea-b0fd-96e6f7651f71',NULL,'participant','典韦',NULL,'2020-07-10 16:24:37.117','caba6266-c286-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL),('cb78898e-c283-11ea-b0fd-96e6f7651f71',NULL,'starter','典韦',NULL,'2020-07-10 16:03:09.840','cb78627d-c283-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL),('cb78b0b1-c283-11ea-b0fd-96e6f7651f71',NULL,'assignee','$INITIATOR','cb78b0b0-c283-11ea-b0fd-96e6f7651f71','2020-07-10 16:03:09.841',NULL,NULL,NULL,NULL),('cb78b0b2-c283-11ea-b0fd-96e6f7651f71',NULL,'participant','$INITIATOR',NULL,'2020-07-10 16:03:09.841','cb78627d-c283-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL),('cb7e7d13-c283-11ea-b0fd-96e6f7651f71',NULL,'assignee','典韦','cb78b0b0-c283-11ea-b0fd-96e6f7651f71','2020-07-10 16:03:09.879',NULL,NULL,NULL,NULL),('cb7ecb34-c283-11ea-b0fd-96e6f7651f71',NULL,'participant','典韦',NULL,'2020-07-10 16:03:09.881','cb78627d-c283-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL),('cda70066-c1d5-11ea-8903-96e6f7651f71',NULL,'participant','典韦',NULL,'2020-07-09 19:17:41.070','868bd51b-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL),('cdaaf809-c1d5-11ea-8903-96e6f7651f71','40283e816f92646d016f92705173001a','candidate',NULL,'cdaaf808-c1d5-11ea-8903-96e6f7651f71','2020-07-09 19:17:41.095',NULL,NULL,NULL,NULL),('cdb0c46a-c1d5-11ea-8903-96e6f7651f71',NULL,'assignee','曹操','cdaaf808-c1d5-11ea-8903-96e6f7651f71','2020-07-09 19:17:41.133',NULL,NULL,NULL,NULL),('cdb1399b-c1d5-11ea-8903-96e6f7651f71',NULL,'participant','曹操',NULL,'2020-07-09 19:17:41.136','868bd51b-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL),('cee3e204-c1af-11ea-9b4f-96e6f7651f71',NULL,'starter','典韦',NULL,'2020-07-09 14:45:42.270','cee3e203-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL),('cee40926-c1af-11ea-9b4f-96e6f7651f71',NULL,'assignee','$INITIATOR','cee40925-c1af-11ea-9b4f-96e6f7651f71','2020-07-09 14:45:42.271',NULL,NULL,NULL,NULL),('cee40927-c1af-11ea-9b4f-96e6f7651f71',NULL,'participant','$INITIATOR',NULL,'2020-07-09 14:45:42.271','cee3e203-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL),('cee8eb28-c1af-11ea-9b4f-96e6f7651f71',NULL,'assignee','典韦','cee40925-c1af-11ea-9b4f-96e6f7651f71','2020-07-09 14:45:42.303',NULL,NULL,NULL,NULL),('cee93949-c1af-11ea-9b4f-96e6f7651f71',NULL,'participant','典韦',NULL,'2020-07-09 14:45:42.305','cee3e203-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL),('d2a7ede1-c27e-11ea-8dcf-96e6f7651f71',NULL,'starter','典韦',NULL,'2020-07-10 15:27:34.411','d2a7ede0-c27e-11ea-8dcf-96e6f7651f71',NULL,NULL,NULL),('d2a81504-c27e-11ea-8dcf-96e6f7651f71',NULL,'assignee','$INITIATOR','d2a81503-c27e-11ea-8dcf-96e6f7651f71','2020-07-10 15:27:34.412',NULL,NULL,NULL,NULL),('d2a81505-c27e-11ea-8dcf-96e6f7651f71',NULL,'participant','$INITIATOR',NULL,'2020-07-10 15:27:34.412','d2a7ede0-c27e-11ea-8dcf-96e6f7651f71',NULL,NULL,NULL),('d2ad1e16-c27e-11ea-8dcf-96e6f7651f71',NULL,'assignee','典韦','d2a81503-c27e-11ea-8dcf-96e6f7651f71','2020-07-10 15:27:34.445',NULL,NULL,NULL,NULL),('d2ad6c37-c27e-11ea-8dcf-96e6f7651f71',NULL,'participant','典韦',NULL,'2020-07-10 15:27:34.447','d2a7ede0-c27e-11ea-8dcf-96e6f7651f71',NULL,NULL,NULL),('d84de3e9-c1c6-11ea-9b4f-96e6f7651f71',NULL,'participant','刘备',NULL,'2020-07-09 17:30:36.489','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL),('d84ea73c-c1c6-11ea-9b4f-96e6f7651f71',NULL,'assignee','$INITIATOR','d84ea73b-c1c6-11ea-9b4f-96e6f7651f71','2020-07-09 17:30:36.494',NULL,NULL,NULL,NULL),('d851db8d-c1c6-11ea-9b4f-96e6f7651f71',NULL,'assignee','典韦','d84ea73b-c1c6-11ea-9b4f-96e6f7651f71','2020-07-09 17:30:36.515',NULL,NULL,NULL,NULL),('d904db49-c1ca-11ea-9b4f-96e6f7651f71',NULL,'participant','周瑜',NULL,'2020-07-09 17:59:15.675','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL),('d90f147c-c1ca-11ea-9b4f-96e6f7651f71','40283e816f92646d016f92705173001a','candidate',NULL,'d90e9f4b-c1ca-11ea-9b4f-96e6f7651f71','2020-07-09 17:59:15.742',NULL,NULL,NULL,NULL),('d950ff7d-c1ca-11ea-9b4f-96e6f7651f71',NULL,'assignee','刘备','d90e9f4b-c1ca-11ea-9b4f-96e6f7651f71','2020-07-09 17:59:16.174',NULL,NULL,NULL,NULL),('dfae0070-c286-11ea-b0fd-96e6f7651f71',NULL,'participant','典韦',NULL,'2020-07-10 16:25:12.235','caba6266-c286-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL),('dfae4e93-c286-11ea-b0fd-96e6f7651f71','40283e816f92646d016f92705173001a','candidate',NULL,'dfae4e92-c286-11ea-b0fd-96e6f7651f71','2020-07-10 16:25:12.237',NULL,NULL,NULL,NULL),('dfb182e4-c286-11ea-b0fd-96e6f7651f71',NULL,'assignee','刘备','dfae4e92-c286-11ea-b0fd-96e6f7651f71','2020-07-10 16:25:12.258',NULL,NULL,NULL,NULL),('dfb1d105-c286-11ea-b0fd-96e6f7651f71',NULL,'participant','刘备',NULL,'2020-07-10 16:25:12.261','caba6266-c286-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL),('e0dd5dff-c1d5-11ea-8903-96e6f7651f71',NULL,'participant','曹操',NULL,'2020-07-09 19:18:13.302','868bd51b-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL),('e0df0bb2-c1d5-11ea-8903-96e6f7651f71','40283e816f92646d016f926a76fd0003','candidate',NULL,'e0df0bb1-c1d5-11ea-8903-96e6f7651f71','2020-07-09 19:18:13.313',NULL,NULL,NULL,NULL),('e0e3c6a3-c1d5-11ea-8903-96e6f7651f71',NULL,'assignee','周瑜','e0df0bb1-c1d5-11ea-8903-96e6f7651f71','2020-07-09 19:18:13.344',NULL,NULL,NULL,NULL),('e0e414c4-c1d5-11ea-8903-96e6f7651f71',NULL,'participant','周瑜',NULL,'2020-07-09 19:18:13.346','868bd51b-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL),('e11df19f-c1c7-11ea-9b4f-96e6f7651f71',NULL,'participant','周瑜',NULL,'2020-07-09 17:38:00.771','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL),('e11e66d2-c1c7-11ea-9b4f-96e6f7651f71','40283e816f92646d016f92705173001a','candidate',NULL,'e11e66d1-c1c7-11ea-9b4f-96e6f7651f71','2020-07-09 17:38:00.774',NULL,NULL,NULL,NULL),('e12125f3-c1c7-11ea-9b4f-96e6f7651f71',NULL,'assignee','刘备','e11e66d1-c1c7-11ea-9b4f-96e6f7651f71','2020-07-09 17:38:00.792',NULL,NULL,NULL,NULL),('e988e015-c25d-11ea-82f3-96e6f7651f71',NULL,'starter','典韦',NULL,'2020-07-10 11:31:59.404','e988b904-c25d-11ea-82f3-96e6f7651f71',NULL,NULL,NULL),('e98d9b18-c25d-11ea-82f3-96e6f7651f71',NULL,'assignee','$INITIATOR','e98d9b17-c25d-11ea-82f3-96e6f7651f71','2020-07-10 11:31:59.434',NULL,NULL,NULL,NULL),('e98d9b19-c25d-11ea-82f3-96e6f7651f71',NULL,'participant','$INITIATOR',NULL,'2020-07-10 11:31:59.435','e988b904-c25d-11ea-82f3-96e6f7651f71',NULL,NULL,NULL),('e99674ba-c25d-11ea-82f3-96e6f7651f71',NULL,'assignee','典韦','e98d9b17-c25d-11ea-82f3-96e6f7651f71','2020-07-10 11:31:59.492',NULL,NULL,NULL,NULL),('e99710fb-c25d-11ea-82f3-96e6f7651f71',NULL,'participant','典韦',NULL,'2020-07-10 11:31:59.496','e988b904-c25d-11ea-82f3-96e6f7651f71',NULL,NULL,NULL),('f264e9dd-c1c1-11ea-9b4f-96e6f7651f71',NULL,'participant','周瑜',NULL,'2020-07-09 16:55:32.777','279476fb-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL),('f98f1d96-c1c7-11ea-9b4f-96e6f7651f71',NULL,'participant','刘备',NULL,'2020-07-09 17:38:41.779','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL),('f98fb9d9-c1c7-11ea-9b4f-96e6f7651f71',NULL,'assignee','$INITIATOR','f98fb9d8-c1c7-11ea-9b4f-96e6f7651f71','2020-07-09 17:38:41.782',NULL,NULL,NULL,NULL),('f992a00a-c1c7-11ea-9b4f-96e6f7651f71',NULL,'assignee','周瑜','f98fb9d8-c1c7-11ea-9b4f-96e6f7651f71','2020-07-09 17:38:41.801',NULL,NULL,NULL,NULL),('fd2339a0-c1ca-11ea-9b4f-96e6f7651f71',NULL,'participant','刘备',NULL,'2020-07-09 18:00:16.272','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL),('fd2f4793-c1ca-11ea-9b4f-96e6f7651f71','40283e816f92646d016f926a76fd0003','candidate',NULL,'fd2ef972-c1ca-11ea-9b4f-96e6f7651f71','2020-07-09 18:00:16.352',NULL,NULL,NULL,NULL),('fd71a7c4-c1ca-11ea-9b4f-96e6f7651f71',NULL,'assignee','周瑜','fd2ef972-c1ca-11ea-9b4f-96e6f7651f71','2020-07-09 18:00:16.786',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `act_hi_identitylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_login_info`
--

DROP TABLE IF EXISTS `sys_login_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_login_info` (
  `login_info_id` varchar(255) NOT NULL,
  `browser` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `ipaddr` varchar(255) DEFAULT NULL,
  `login_location` varchar(255) DEFAULT NULL,
  `login_name` varchar(255) DEFAULT NULL,
  `msg` varchar(255) DEFAULT NULL,
  `os` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`login_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_login_info`
--

LOCK TABLES `sys_login_info` WRITE;
/*!40000 ALTER TABLE `sys_login_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_login_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_varinst`
--

DROP TABLE IF EXISTS `act_hi_varinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT '1',
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_VAR_SCOPE_ID_TYPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_VAR_SUB_ID_TYPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_EXE` (`EXECUTION_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_varinst`
--

LOCK TABLES `act_hi_varinst` WRITE;
/*!40000 ALTER TABLE `act_hi_varinst` DISABLE KEYS */;
INSERT INTO `act_hi_varinst` VALUES ('2794c51d-c1af-11ea-9b4f-96e6f7651f71',3,'279476fb-c1af-11ea-9b4f-96e6f7651f71','279476fb-c1af-11ea-9b4f-96e6f7651f71',NULL,'updateTime','string',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2020-07-09 14:41:01.572','2020-07-09 16:55:32.774'),('2794ec2e-c1af-11ea-9b4f-96e6f7651f71',3,'279476fb-c1af-11ea-9b4f-96e6f7651f71','279476fb-c1af-11ea-9b4f-96e6f7651f71',NULL,'remark','string',NULL,NULL,NULL,NULL,NULL,NULL,'第一次流程报销测试',NULL,'2020-07-09 14:41:01.573','2020-07-09 16:55:32.773'),('2794ec2f-c1af-11ea-9b4f-96e6f7651f71',3,'279476fb-c1af-11ea-9b4f-96e6f7651f71','279476fb-c1af-11ea-9b4f-96e6f7651f71',NULL,'title','string',NULL,NULL,NULL,NULL,NULL,NULL,'第一次流程报销测试',NULL,'2020-07-09 14:41:01.573','2020-07-09 16:55:32.774'),('2794ec30-c1af-11ea-9b4f-96e6f7651f71',3,'279476fb-c1af-11ea-9b4f-96e6f7651f71','279476fb-c1af-11ea-9b4f-96e6f7651f71',NULL,'content','string',NULL,NULL,NULL,NULL,NULL,NULL,'第一次流程报销测试',NULL,'2020-07-09 14:41:01.573','2020-07-09 16:55:32.774'),('2794ec31-c1af-11ea-9b4f-96e6f7651f71',3,'279476fb-c1af-11ea-9b4f-96e6f7651f71','279476fb-c1af-11ea-9b4f-96e6f7651f71',NULL,'modelKey','string',NULL,NULL,NULL,NULL,NULL,NULL,'Expense2',NULL,'2020-07-09 14:41:01.573','2020-07-09 16:55:32.775'),('2794ec32-c1af-11ea-9b4f-96e6f7651f71',3,'279476fb-c1af-11ea-9b4f-96e6f7651f71','279476fb-c1af-11ea-9b4f-96e6f7651f71',NULL,'createBy','string',NULL,NULL,NULL,NULL,NULL,NULL,'典韦',NULL,'2020-07-09 14:41:01.573','2020-07-09 16:55:32.775'),('2794ec33-c1af-11ea-9b4f-96e6f7651f71',3,'279476fb-c1af-11ea-9b4f-96e6f7651f71','279476fb-c1af-11ea-9b4f-96e6f7651f71',NULL,'money','string',NULL,NULL,NULL,NULL,NULL,NULL,'100',NULL,'2020-07-09 14:41:01.573','2020-07-09 16:55:32.775'),('2794ec34-c1af-11ea-9b4f-96e6f7651f71',3,'279476fb-c1af-11ea-9b4f-96e6f7651f71','279476fb-c1af-11ea-9b4f-96e6f7651f71',NULL,'createTime','string',NULL,NULL,NULL,NULL,NULL,NULL,'2020-07-09 14:40:53',NULL,'2020-07-09 14:41:01.573','2020-07-09 16:55:32.776'),('2794ec35-c1af-11ea-9b4f-96e6f7651f71',3,'279476fb-c1af-11ea-9b4f-96e6f7651f71','279476fb-c1af-11ea-9b4f-96e6f7651f71',NULL,'updateBy','string',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2020-07-09 14:41:01.573','2020-07-09 16:55:32.776'),('2794ec36-c1af-11ea-9b4f-96e6f7651f71',3,'279476fb-c1af-11ea-9b4f-96e6f7651f71','279476fb-c1af-11ea-9b4f-96e6f7651f71',NULL,'name','string',NULL,NULL,NULL,NULL,NULL,NULL,'第一次流程报销测试',NULL,'2020-07-09 14:41:01.573','2020-07-09 16:55:32.776'),('2794ec37-c1af-11ea-9b4f-96e6f7651f71',3,'279476fb-c1af-11ea-9b4f-96e6f7651f71','279476fb-c1af-11ea-9b4f-96e6f7651f71',NULL,'businessKey','string',NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c73324cb00173324e37370001',NULL,'2020-07-09 14:41:01.573','2020-07-09 16:55:32.776'),('2794ec38-c1af-11ea-9b4f-96e6f7651f71',3,'279476fb-c1af-11ea-9b4f-96e6f7651f71','279476fb-c1af-11ea-9b4f-96e6f7651f71',NULL,'id','string',NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c73324cb00173324e37370001',NULL,'2020-07-09 14:41:01.573','2020-07-09 16:55:32.776'),('2794ec39-c1af-11ea-9b4f-96e6f7651f71',3,'279476fb-c1af-11ea-9b4f-96e6f7651f71','279476fb-c1af-11ea-9b4f-96e6f7651f71',NULL,'flowTypeId','string',NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016',NULL,'2020-07-09 14:41:01.573','2020-07-09 16:55:32.777'),('2855ae3d-c274-11ea-9d08-96e6f7651f71',0,'2855601b-c274-11ea-9d08-96e6f7651f71','2855601b-c274-11ea-9d08-96e6f7651f71',NULL,'updateTime','string',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2020-07-10 14:11:13.692','2020-07-10 14:11:13.692'),('2855ae3e-c274-11ea-9d08-96e6f7651f71',0,'2855601b-c274-11ea-9d08-96e6f7651f71','2855601b-c274-11ea-9d08-96e6f7651f71',NULL,'remark','string',NULL,NULL,NULL,NULL,NULL,NULL,'第七次报销流程测试',NULL,'2020-07-10 14:11:13.692','2020-07-10 14:11:13.692'),('2855ae3f-c274-11ea-9d08-96e6f7651f71',0,'2855601b-c274-11ea-9d08-96e6f7651f71','2855601b-c274-11ea-9d08-96e6f7651f71',NULL,'title','string',NULL,NULL,NULL,NULL,NULL,NULL,'第七次报销流程测试-作废测试',NULL,'2020-07-10 14:11:13.692','2020-07-10 14:11:13.692'),('2855ae40-c274-11ea-9d08-96e6f7651f71',0,'2855601b-c274-11ea-9d08-96e6f7651f71','2855601b-c274-11ea-9d08-96e6f7651f71',NULL,'deployId','string',NULL,NULL,NULL,NULL,NULL,NULL,'e5381dc2-c191-11ea-8e4d-96e6f7651f71',NULL,'2020-07-10 14:11:13.692','2020-07-10 14:11:13.692'),('2855ae41-c274-11ea-9d08-96e6f7651f71',0,'2855601b-c274-11ea-9d08-96e6f7651f71','2855601b-c274-11ea-9d08-96e6f7651f71',NULL,'content','string',NULL,NULL,NULL,NULL,NULL,NULL,'第七次报销流程测试',NULL,'2020-07-10 14:11:13.692','2020-07-10 14:11:13.692'),('2855ae42-c274-11ea-9d08-96e6f7651f71',0,'2855601b-c274-11ea-9d08-96e6f7651f71','2855601b-c274-11ea-9d08-96e6f7651f71',NULL,'modelKey','string',NULL,NULL,NULL,NULL,NULL,NULL,'Expense2',NULL,'2020-07-10 14:11:13.692','2020-07-10 14:11:13.692'),('2855ae43-c274-11ea-9d08-96e6f7651f71',0,'2855601b-c274-11ea-9d08-96e6f7651f71','2855601b-c274-11ea-9d08-96e6f7651f71',NULL,'createBy','string',NULL,NULL,NULL,NULL,NULL,NULL,'典韦',NULL,'2020-07-10 14:11:13.692','2020-07-10 14:11:13.692'),('2855ae44-c274-11ea-9d08-96e6f7651f71',0,'2855601b-c274-11ea-9d08-96e6f7651f71','2855601b-c274-11ea-9d08-96e6f7651f71',NULL,'money','string',NULL,NULL,NULL,NULL,NULL,NULL,'7000',NULL,'2020-07-10 14:11:13.692','2020-07-10 14:11:13.692'),('2855ae45-c274-11ea-9d08-96e6f7651f71',0,'2855601b-c274-11ea-9d08-96e6f7651f71','2855601b-c274-11ea-9d08-96e6f7651f71',NULL,'createTime','string',NULL,NULL,NULL,NULL,NULL,NULL,'2020-07-10 14:11:13',NULL,'2020-07-10 14:11:13.692','2020-07-10 14:11:13.692'),('2855ae46-c274-11ea-9d08-96e6f7651f71',0,'2855601b-c274-11ea-9d08-96e6f7651f71','2855601b-c274-11ea-9d08-96e6f7651f71',NULL,'updateBy','string',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2020-07-10 14:11:13.692','2020-07-10 14:11:13.692'),('2855ae47-c274-11ea-9d08-96e6f7651f71',0,'2855601b-c274-11ea-9d08-96e6f7651f71','2855601b-c274-11ea-9d08-96e6f7651f71',NULL,'name','string',NULL,NULL,NULL,NULL,NULL,NULL,'第七次报销流程测试-作废测试',NULL,'2020-07-10 14:11:13.693','2020-07-10 14:11:13.693'),('2855d558-c274-11ea-9d08-96e6f7651f71',0,'2855601b-c274-11ea-9d08-96e6f7651f71','2855601b-c274-11ea-9d08-96e6f7651f71',NULL,'businessKey','string',NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c733750a4017337596a220000',NULL,'2020-07-10 14:11:13.693','2020-07-10 14:11:13.693'),('2855d559-c274-11ea-9d08-96e6f7651f71',0,'2855601b-c274-11ea-9d08-96e6f7651f71','2855601b-c274-11ea-9d08-96e6f7651f71',NULL,'id','string',NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c733750a4017337596a220000',NULL,'2020-07-10 14:11:13.693','2020-07-10 14:11:13.693'),('2855d55a-c274-11ea-9d08-96e6f7651f71',0,'2855601b-c274-11ea-9d08-96e6f7651f71','2855601b-c274-11ea-9d08-96e6f7651f71',NULL,'flowTypeId','string',NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016',NULL,'2020-07-10 14:11:13.693','2020-07-10 14:11:13.693'),('46a0ebc5-c1af-11ea-9b4f-96e6f7651f71',15,'46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71',NULL,'updateTime','string',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2020-07-09 14:41:53.661','2020-07-09 18:02:45.937'),('46a0ebc6-c1af-11ea-9b4f-96e6f7651f71',15,'46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71',NULL,'remark','string',NULL,NULL,NULL,NULL,NULL,NULL,'第二次流程报销测试',NULL,'2020-07-09 14:41:53.661','2020-07-09 18:02:45.936'),('46a0ebc7-c1af-11ea-9b4f-96e6f7651f71',15,'46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71',NULL,'title','string',NULL,NULL,NULL,NULL,NULL,NULL,'第二次流程报销测试',NULL,'2020-07-09 14:41:53.661','2020-07-09 18:02:45.937'),('46a0ebc8-c1af-11ea-9b4f-96e6f7651f71',15,'46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71',NULL,'content','string',NULL,NULL,NULL,NULL,NULL,NULL,'第二次流程报销测试',NULL,'2020-07-09 14:41:53.661','2020-07-09 18:02:45.938'),('46a0ebc9-c1af-11ea-9b4f-96e6f7651f71',15,'46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71',NULL,'modelKey','string',NULL,NULL,NULL,NULL,NULL,NULL,'Expense2',NULL,'2020-07-09 14:41:53.661','2020-07-09 18:02:45.938'),('46a0ebca-c1af-11ea-9b4f-96e6f7651f71',15,'46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71',NULL,'createBy','string',NULL,NULL,NULL,NULL,NULL,NULL,'典韦',NULL,'2020-07-09 14:41:53.661','2020-07-09 18:02:45.939'),('46a0ebcb-c1af-11ea-9b4f-96e6f7651f71',15,'46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71',NULL,'money','string',NULL,NULL,NULL,NULL,NULL,NULL,'200',NULL,'2020-07-09 14:41:53.661','2020-07-09 18:02:45.939'),('46a0ebcc-c1af-11ea-9b4f-96e6f7651f71',15,'46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71',NULL,'createTime','string',NULL,NULL,NULL,NULL,NULL,NULL,'2020-07-09 14:41:53',NULL,'2020-07-09 14:41:53.661','2020-07-09 18:02:45.939'),('46a0ebcd-c1af-11ea-9b4f-96e6f7651f71',15,'46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71',NULL,'updateBy','string',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2020-07-09 14:41:53.661','2020-07-09 18:02:45.939'),('46a0ebce-c1af-11ea-9b4f-96e6f7651f71',15,'46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71',NULL,'name','string',NULL,NULL,NULL,NULL,NULL,NULL,'第二次流程报销测试',NULL,'2020-07-09 14:41:53.661','2020-07-09 18:02:45.940'),('46a0ebcf-c1af-11ea-9b4f-96e6f7651f71',15,'46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71',NULL,'businessKey','string',NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c73324cb00173324f21e00004',NULL,'2020-07-09 14:41:53.661','2020-07-09 18:02:45.940'),('46a0ebd0-c1af-11ea-9b4f-96e6f7651f71',15,'46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71',NULL,'id','string',NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c73324cb00173324f21e00004',NULL,'2020-07-09 14:41:53.661','2020-07-09 18:02:45.940'),('46a0ebd1-c1af-11ea-9b4f-96e6f7651f71',15,'46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71',NULL,'flowTypeId','string',NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016',NULL,'2020-07-09 14:41:53.662','2020-07-09 18:02:45.941'),('58b92d39-c27e-11ea-8dcf-96e6f7651f71',0,'58b92d37-c27e-11ea-8dcf-96e6f7651f71','58b92d37-c27e-11ea-8dcf-96e6f7651f71',NULL,'updateTime','string',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2020-07-10 15:24:09.842','2020-07-10 15:24:09.842'),('58b92d3a-c27e-11ea-8dcf-96e6f7651f71',0,'58b92d37-c27e-11ea-8dcf-96e6f7651f71','58b92d37-c27e-11ea-8dcf-96e6f7651f71',NULL,'remark','string',NULL,NULL,NULL,NULL,NULL,NULL,'第八次报销流程测试-作废测试',NULL,'2020-07-10 15:24:09.842','2020-07-10 15:24:09.842'),('58b92d3b-c27e-11ea-8dcf-96e6f7651f71',0,'58b92d37-c27e-11ea-8dcf-96e6f7651f71','58b92d37-c27e-11ea-8dcf-96e6f7651f71',NULL,'title','string',NULL,NULL,NULL,NULL,NULL,NULL,'第八次报销流程测试-作废测试',NULL,'2020-07-10 15:24:09.842','2020-07-10 15:24:09.842'),('58b92d3c-c27e-11ea-8dcf-96e6f7651f71',0,'58b92d37-c27e-11ea-8dcf-96e6f7651f71','58b92d37-c27e-11ea-8dcf-96e6f7651f71',NULL,'deployId','string',NULL,NULL,NULL,NULL,NULL,NULL,'e5381dc2-c191-11ea-8e4d-96e6f7651f71',NULL,'2020-07-10 15:24:09.842','2020-07-10 15:24:09.842'),('58b92d3d-c27e-11ea-8dcf-96e6f7651f71',0,'58b92d37-c27e-11ea-8dcf-96e6f7651f71','58b92d37-c27e-11ea-8dcf-96e6f7651f71',NULL,'content','string',NULL,NULL,NULL,NULL,NULL,NULL,'第八次报销流程测试-作废测试',NULL,'2020-07-10 15:24:09.842','2020-07-10 15:24:09.842'),('58b92d3e-c27e-11ea-8dcf-96e6f7651f71',0,'58b92d37-c27e-11ea-8dcf-96e6f7651f71','58b92d37-c27e-11ea-8dcf-96e6f7651f71',NULL,'modelKey','string',NULL,NULL,NULL,NULL,NULL,NULL,'Expense2',NULL,'2020-07-10 15:24:09.842','2020-07-10 15:24:09.842'),('58b92d3f-c27e-11ea-8dcf-96e6f7651f71',0,'58b92d37-c27e-11ea-8dcf-96e6f7651f71','58b92d37-c27e-11ea-8dcf-96e6f7651f71',NULL,'createBy','string',NULL,NULL,NULL,NULL,NULL,NULL,'典韦',NULL,'2020-07-10 15:24:09.842','2020-07-10 15:24:09.842'),('58b92d40-c27e-11ea-8dcf-96e6f7651f71',0,'58b92d37-c27e-11ea-8dcf-96e6f7651f71','58b92d37-c27e-11ea-8dcf-96e6f7651f71',NULL,'money','string',NULL,NULL,NULL,NULL,NULL,NULL,'800',NULL,'2020-07-10 15:24:09.842','2020-07-10 15:24:09.842'),('58b92d41-c27e-11ea-8dcf-96e6f7651f71',0,'58b92d37-c27e-11ea-8dcf-96e6f7651f71','58b92d37-c27e-11ea-8dcf-96e6f7651f71',NULL,'createTime','string',NULL,NULL,NULL,NULL,NULL,NULL,'2020-07-10 15:24:09',NULL,'2020-07-10 15:24:09.842','2020-07-10 15:24:09.842'),('58b92d42-c27e-11ea-8dcf-96e6f7651f71',0,'58b92d37-c27e-11ea-8dcf-96e6f7651f71','58b92d37-c27e-11ea-8dcf-96e6f7651f71',NULL,'updateBy','string',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2020-07-10 15:24:09.842','2020-07-10 15:24:09.842'),('58b92d43-c27e-11ea-8dcf-96e6f7651f71',0,'58b92d37-c27e-11ea-8dcf-96e6f7651f71','58b92d37-c27e-11ea-8dcf-96e6f7651f71',NULL,'name','string',NULL,NULL,NULL,NULL,NULL,NULL,'第八次报销流程测试-作废测试',NULL,'2020-07-10 15:24:09.842','2020-07-10 15:24:09.842'),('58b92d44-c27e-11ea-8dcf-96e6f7651f71',0,'58b92d37-c27e-11ea-8dcf-96e6f7651f71','58b92d37-c27e-11ea-8dcf-96e6f7651f71',NULL,'businessKey','string',NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c73376dde0173379c30a9000a',NULL,'2020-07-10 15:24:09.842','2020-07-10 15:24:09.842'),('58b92d45-c27e-11ea-8dcf-96e6f7651f71',0,'58b92d37-c27e-11ea-8dcf-96e6f7651f71','58b92d37-c27e-11ea-8dcf-96e6f7651f71',NULL,'id','string',NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c73376dde0173379c30a9000a',NULL,'2020-07-10 15:24:09.842','2020-07-10 15:24:09.842'),('58b92d46-c27e-11ea-8dcf-96e6f7651f71',0,'58b92d37-c27e-11ea-8dcf-96e6f7651f71','58b92d37-c27e-11ea-8dcf-96e6f7651f71',NULL,'flowTypeId','string',NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016',NULL,'2020-07-10 15:24:09.842','2020-07-10 15:24:09.842'),('7098cade-c321-11ea-a804-96e6f7651f71',1,'7098cadc-c321-11ea-a804-96e6f7651f71','7098cadc-c321-11ea-a804-96e6f7651f71',NULL,'updateTime','string',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2020-07-11 10:51:37.862','2020-07-11 10:52:06.975'),('7098cadf-c321-11ea-a804-96e6f7651f71',1,'7098cadc-c321-11ea-a804-96e6f7651f71','7098cadc-c321-11ea-a804-96e6f7651f71',NULL,'remark','string',NULL,NULL,NULL,NULL,NULL,NULL,'没事就是请假怎么地',NULL,'2020-07-11 10:51:37.862','2020-07-11 10:52:06.974'),('7098cae0-c321-11ea-a804-96e6f7651f71',1,'7098cadc-c321-11ea-a804-96e6f7651f71','7098cadc-c321-11ea-a804-96e6f7651f71',NULL,'title','string',NULL,NULL,NULL,NULL,NULL,NULL,'没事就是请假怎么地',NULL,'2020-07-11 10:51:37.862','2020-07-11 10:52:06.975'),('7098cae1-c321-11ea-a804-96e6f7651f71',1,'7098cadc-c321-11ea-a804-96e6f7651f71','7098cadc-c321-11ea-a804-96e6f7651f71',NULL,'deployId','string',NULL,NULL,NULL,NULL,NULL,NULL,'34f6fbf8-c321-11ea-a804-96e6f7651f71',NULL,'2020-07-11 10:51:37.862','2020-07-11 10:52:06.975'),('7098cae2-c321-11ea-a804-96e6f7651f71',1,'7098cadc-c321-11ea-a804-96e6f7651f71','7098cadc-c321-11ea-a804-96e6f7651f71',NULL,'flowName','string',NULL,NULL,NULL,NULL,NULL,NULL,'没事就是请假怎么地',NULL,'2020-07-11 10:51:37.862','2020-07-11 10:52:06.976'),('7098cae3-c321-11ea-a804-96e6f7651f71',1,'7098cadc-c321-11ea-a804-96e6f7651f71','7098cadc-c321-11ea-a804-96e6f7651f71',NULL,'modelKey','string',NULL,NULL,NULL,NULL,NULL,NULL,'AskForLeave',NULL,'2020-07-11 10:51:37.862','2020-07-11 10:52:06.976'),('7098cae4-c321-11ea-a804-96e6f7651f71',1,'7098cadc-c321-11ea-a804-96e6f7651f71','7098cadc-c321-11ea-a804-96e6f7651f71',NULL,'createBy','string',NULL,NULL,NULL,NULL,NULL,NULL,'孙坚',NULL,'2020-07-11 10:51:37.862','2020-07-11 10:52:06.976'),('7098cae5-c321-11ea-a804-96e6f7651f71',1,'7098cadc-c321-11ea-a804-96e6f7651f71','7098cadc-c321-11ea-a804-96e6f7651f71',NULL,'leaveDays','string',NULL,NULL,NULL,NULL,NULL,NULL,'7',NULL,'2020-07-11 10:51:37.862','2020-07-11 10:52:06.977'),('7098cae6-c321-11ea-a804-96e6f7651f71',1,'7098cadc-c321-11ea-a804-96e6f7651f71','7098cadc-c321-11ea-a804-96e6f7651f71',NULL,'createTime','string',NULL,NULL,NULL,NULL,NULL,NULL,'2020-07-11 10:51:37',NULL,'2020-07-11 10:51:37.862','2020-07-11 10:52:06.977'),('7098cae7-c321-11ea-a804-96e6f7651f71',1,'7098cadc-c321-11ea-a804-96e6f7651f71','7098cadc-c321-11ea-a804-96e6f7651f71',NULL,'updateBy','string',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2020-07-11 10:51:37.862','2020-07-11 10:52:06.977'),('7098cae8-c321-11ea-a804-96e6f7651f71',1,'7098cadc-c321-11ea-a804-96e6f7651f71','7098cadc-c321-11ea-a804-96e6f7651f71',NULL,'callbackId','string',NULL,NULL,NULL,NULL,NULL,NULL,'submitExpenseAccount',NULL,'2020-07-11 10:51:37.862','2020-07-11 10:52:06.978'),('7098cae9-c321-11ea-a804-96e6f7651f71',1,'7098cadc-c321-11ea-a804-96e6f7651f71','7098cadc-c321-11ea-a804-96e6f7651f71',NULL,'businessKey','string',NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c733bb8d701733bc90997007a',NULL,'2020-07-11 10:51:37.862','2020-07-11 10:52:06.978'),('7098caea-c321-11ea-a804-96e6f7651f71',1,'7098cadc-c321-11ea-a804-96e6f7651f71','7098cadc-c321-11ea-a804-96e6f7651f71',NULL,'id','string',NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c733bb8d701733bc90997007a',NULL,'2020-07-11 10:51:37.862','2020-07-11 10:52:06.978'),('7098caeb-c321-11ea-a804-96e6f7651f71',1,'7098cadc-c321-11ea-a804-96e6f7651f71','7098cadc-c321-11ea-a804-96e6f7651f71',NULL,'flowTypeId','string',NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c73316c440173317049080010',NULL,'2020-07-11 10:51:37.862','2020-07-11 10:52:06.979'),('7098caec-c321-11ea-a804-96e6f7651f71',1,'7098cadc-c321-11ea-a804-96e6f7651f71','7098cadc-c321-11ea-a804-96e6f7651f71',NULL,'callbackType','string',NULL,NULL,NULL,NULL,NULL,NULL,'JQueryFunction',NULL,'2020-07-11 10:51:37.862','2020-07-11 10:52:06.979'),('7f1335d1-c1dd-11ea-8c2f-96e6f7651f71',1,'7f12e7af-c1dd-11ea-8c2f-96e6f7651f71','7f12e7af-c1dd-11ea-8c2f-96e6f7651f71',NULL,'updateTime','string',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2020-07-09 20:12:45.212','2020-07-09 21:21:09.913'),('7f1335d2-c1dd-11ea-8c2f-96e6f7651f71',1,'7f12e7af-c1dd-11ea-8c2f-96e6f7651f71','7f12e7af-c1dd-11ea-8c2f-96e6f7651f71',NULL,'remark','string',NULL,NULL,NULL,NULL,NULL,NULL,'第五次报销流程测试',NULL,'2020-07-09 20:12:45.212','2020-07-09 21:21:09.914'),('7f1335d3-c1dd-11ea-8c2f-96e6f7651f71',1,'7f12e7af-c1dd-11ea-8c2f-96e6f7651f71','7f12e7af-c1dd-11ea-8c2f-96e6f7651f71',NULL,'title','string',NULL,NULL,NULL,NULL,NULL,NULL,'第五次报销流程测试',NULL,'2020-07-09 20:12:45.212','2020-07-09 21:21:09.914'),('7f1335d4-c1dd-11ea-8c2f-96e6f7651f71',1,'7f12e7af-c1dd-11ea-8c2f-96e6f7651f71','7f12e7af-c1dd-11ea-8c2f-96e6f7651f71',NULL,'deployId','string',NULL,NULL,NULL,NULL,NULL,NULL,'e5381dc2-c191-11ea-8e4d-96e6f7651f71',NULL,'2020-07-09 20:12:45.212','2020-07-09 21:21:09.914'),('7f1335d5-c1dd-11ea-8c2f-96e6f7651f71',1,'7f12e7af-c1dd-11ea-8c2f-96e6f7651f71','7f12e7af-c1dd-11ea-8c2f-96e6f7651f71',NULL,'content','string',NULL,NULL,NULL,NULL,NULL,NULL,'第五次报销流程测试',NULL,'2020-07-09 20:12:45.213','2020-07-09 21:21:09.915'),('7f135ce6-c1dd-11ea-8c2f-96e6f7651f71',1,'7f12e7af-c1dd-11ea-8c2f-96e6f7651f71','7f12e7af-c1dd-11ea-8c2f-96e6f7651f71',NULL,'modelKey','string',NULL,NULL,NULL,NULL,NULL,NULL,'Expense2',NULL,'2020-07-09 20:12:45.213','2020-07-09 21:21:09.915'),('7f135ce7-c1dd-11ea-8c2f-96e6f7651f71',1,'7f12e7af-c1dd-11ea-8c2f-96e6f7651f71','7f12e7af-c1dd-11ea-8c2f-96e6f7651f71',NULL,'createBy','string',NULL,NULL,NULL,NULL,NULL,NULL,'典韦',NULL,'2020-07-09 20:12:45.213','2020-07-09 21:21:09.915'),('7f135ce8-c1dd-11ea-8c2f-96e6f7651f71',1,'7f12e7af-c1dd-11ea-8c2f-96e6f7651f71','7f12e7af-c1dd-11ea-8c2f-96e6f7651f71',NULL,'money','string',NULL,NULL,NULL,NULL,NULL,NULL,'500',NULL,'2020-07-09 20:12:45.213','2020-07-09 21:21:09.916'),('7f135ce9-c1dd-11ea-8c2f-96e6f7651f71',1,'7f12e7af-c1dd-11ea-8c2f-96e6f7651f71','7f12e7af-c1dd-11ea-8c2f-96e6f7651f71',NULL,'createTime','string',NULL,NULL,NULL,NULL,NULL,NULL,'2020-07-09 20:12:45',NULL,'2020-07-09 20:12:45.213','2020-07-09 21:21:09.916'),('7f135cea-c1dd-11ea-8c2f-96e6f7651f71',1,'7f12e7af-c1dd-11ea-8c2f-96e6f7651f71','7f12e7af-c1dd-11ea-8c2f-96e6f7651f71',NULL,'updateBy','string',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2020-07-09 20:12:45.213','2020-07-09 21:21:09.917'),('7f135ceb-c1dd-11ea-8c2f-96e6f7651f71',1,'7f12e7af-c1dd-11ea-8c2f-96e6f7651f71','7f12e7af-c1dd-11ea-8c2f-96e6f7651f71',NULL,'name','string',NULL,NULL,NULL,NULL,NULL,NULL,'第五次报销流程测试',NULL,'2020-07-09 20:12:45.213','2020-07-09 21:21:09.917'),('7f135cec-c1dd-11ea-8c2f-96e6f7651f71',1,'7f12e7af-c1dd-11ea-8c2f-96e6f7651f71','7f12e7af-c1dd-11ea-8c2f-96e6f7651f71',NULL,'businessKey','string',NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c73337cd70173337e0a7b0000',NULL,'2020-07-09 20:12:45.213','2020-07-09 21:21:09.917'),('7f135ced-c1dd-11ea-8c2f-96e6f7651f71',1,'7f12e7af-c1dd-11ea-8c2f-96e6f7651f71','7f12e7af-c1dd-11ea-8c2f-96e6f7651f71',NULL,'id','string',NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c73337cd70173337e0a7b0000',NULL,'2020-07-09 20:12:45.213','2020-07-09 21:21:09.918'),('7f135cee-c1dd-11ea-8c2f-96e6f7651f71',1,'7f12e7af-c1dd-11ea-8c2f-96e6f7651f71','7f12e7af-c1dd-11ea-8c2f-96e6f7651f71',NULL,'flowTypeId','string',NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016',NULL,'2020-07-09 20:12:45.213','2020-07-09 21:21:09.918'),('868bd51d-c1af-11ea-9b4f-96e6f7651f71',3,'868bd51b-c1af-11ea-9b4f-96e6f7651f71','868bd51b-c1af-11ea-9b4f-96e6f7651f71',NULL,'updateTime','string',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2020-07-09 14:43:40.897','2020-07-09 19:30:21.165'),('868bd51e-c1af-11ea-9b4f-96e6f7651f71',3,'868bd51b-c1af-11ea-9b4f-96e6f7651f71','868bd51b-c1af-11ea-9b4f-96e6f7651f71',NULL,'remark','string',NULL,NULL,NULL,NULL,NULL,NULL,'第三次流程报销测试',NULL,'2020-07-09 14:43:40.897','2020-07-09 19:30:21.165'),('868bd51f-c1af-11ea-9b4f-96e6f7651f71',3,'868bd51b-c1af-11ea-9b4f-96e6f7651f71','868bd51b-c1af-11ea-9b4f-96e6f7651f71',NULL,'title','string',NULL,NULL,NULL,NULL,NULL,NULL,'第三次流程报销测试',NULL,'2020-07-09 14:43:40.897','2020-07-09 19:30:21.166'),('868bd520-c1af-11ea-9b4f-96e6f7651f71',3,'868bd51b-c1af-11ea-9b4f-96e6f7651f71','868bd51b-c1af-11ea-9b4f-96e6f7651f71',NULL,'content','string',NULL,NULL,NULL,NULL,NULL,NULL,'第三次流程报销测试',NULL,'2020-07-09 14:43:40.897','2020-07-09 19:30:21.166'),('868bd521-c1af-11ea-9b4f-96e6f7651f71',3,'868bd51b-c1af-11ea-9b4f-96e6f7651f71','868bd51b-c1af-11ea-9b4f-96e6f7651f71',NULL,'modelKey','string',NULL,NULL,NULL,NULL,NULL,NULL,'Expense2',NULL,'2020-07-09 14:43:40.897','2020-07-09 19:30:21.166'),('868bd522-c1af-11ea-9b4f-96e6f7651f71',3,'868bd51b-c1af-11ea-9b4f-96e6f7651f71','868bd51b-c1af-11ea-9b4f-96e6f7651f71',NULL,'createBy','string',NULL,NULL,NULL,NULL,NULL,NULL,'典韦',NULL,'2020-07-09 14:43:40.897','2020-07-09 19:30:21.167'),('868bd523-c1af-11ea-9b4f-96e6f7651f71',3,'868bd51b-c1af-11ea-9b4f-96e6f7651f71','868bd51b-c1af-11ea-9b4f-96e6f7651f71',NULL,'money','string',NULL,NULL,NULL,NULL,NULL,NULL,'3000',NULL,'2020-07-09 14:43:40.897','2020-07-09 19:30:21.167'),('868bd524-c1af-11ea-9b4f-96e6f7651f71',3,'868bd51b-c1af-11ea-9b4f-96e6f7651f71','868bd51b-c1af-11ea-9b4f-96e6f7651f71',NULL,'createTime','string',NULL,NULL,NULL,NULL,NULL,NULL,'2020-07-09 14:43:40',NULL,'2020-07-09 14:43:40.897','2020-07-09 19:30:21.167'),('868bd525-c1af-11ea-9b4f-96e6f7651f71',3,'868bd51b-c1af-11ea-9b4f-96e6f7651f71','868bd51b-c1af-11ea-9b4f-96e6f7651f71',NULL,'updateBy','string',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2020-07-09 14:43:40.897','2020-07-09 19:30:21.168'),('868bd526-c1af-11ea-9b4f-96e6f7651f71',3,'868bd51b-c1af-11ea-9b4f-96e6f7651f71','868bd51b-c1af-11ea-9b4f-96e6f7651f71',NULL,'name','string',NULL,NULL,NULL,NULL,NULL,NULL,'第三次流程报销测试',NULL,'2020-07-09 14:43:40.897','2020-07-09 19:30:21.168'),('868bd527-c1af-11ea-9b4f-96e6f7651f71',3,'868bd51b-c1af-11ea-9b4f-96e6f7651f71','868bd51b-c1af-11ea-9b4f-96e6f7651f71',NULL,'businessKey','string',NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c73324cb001733250c4c10007',NULL,'2020-07-09 14:43:40.897','2020-07-09 19:30:21.168'),('868bfc38-c1af-11ea-9b4f-96e6f7651f71',3,'868bd51b-c1af-11ea-9b4f-96e6f7651f71','868bd51b-c1af-11ea-9b4f-96e6f7651f71',NULL,'id','string',NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c73324cb001733250c4c10007',NULL,'2020-07-09 14:43:40.898','2020-07-09 19:30:21.169'),('868bfc39-c1af-11ea-9b4f-96e6f7651f71',3,'868bd51b-c1af-11ea-9b4f-96e6f7651f71','868bd51b-c1af-11ea-9b4f-96e6f7651f71',NULL,'flowTypeId','string',NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016',NULL,'2020-07-09 14:43:40.898','2020-07-09 19:30:21.169'),('9e3c4292-c1d7-11ea-8903-96e6f7651f71',1,'cee3e203-c1af-11ea-9b4f-96e6f7651f71','cee3e203-c1af-11ea-9b4f-96e6f7651f71',NULL,'outcome','string',NULL,NULL,NULL,NULL,NULL,NULL,'同意',NULL,'2020-07-09 19:30:40.510','2020-07-09 19:31:06.902'),('9f440214-c1bf-11ea-9b4f-96e6f7651f71',1,'279476fb-c1af-11ea-9b4f-96e6f7651f71','279476fb-c1af-11ea-9b4f-96e6f7651f71',NULL,'outcome','string',NULL,NULL,NULL,NULL,NULL,NULL,'同意',NULL,'2020-07-09 16:38:54.317','2020-07-09 16:55:32.777'),('9f9731fe-c28b-11ea-b0fd-96e6f7651f71',1,'9f9731fc-c28b-11ea-b0fd-96e6f7651f71','9f9731fc-c28b-11ea-b0fd-96e6f7651f71',NULL,'updateTime','string',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2020-07-10 16:59:12.195','2020-07-10 16:59:41.607'),('9f9731ff-c28b-11ea-b0fd-96e6f7651f71',1,'9f9731fc-c28b-11ea-b0fd-96e6f7651f71','9f9731fc-c28b-11ea-b0fd-96e6f7651f71',NULL,'remark','string',NULL,NULL,NULL,NULL,NULL,NULL,'第一次部门经理级流程测试',NULL,'2020-07-10 16:59:12.195','2020-07-10 16:59:41.607'),('9f973200-c28b-11ea-b0fd-96e6f7651f71',1,'9f9731fc-c28b-11ea-b0fd-96e6f7651f71','9f9731fc-c28b-11ea-b0fd-96e6f7651f71',NULL,'title','string',NULL,NULL,NULL,NULL,NULL,NULL,'第一次部门经理级流程测试',NULL,'2020-07-10 16:59:12.195','2020-07-10 16:59:41.607'),('9f973201-c28b-11ea-b0fd-96e6f7651f71',1,'9f9731fc-c28b-11ea-b0fd-96e6f7651f71','9f9731fc-c28b-11ea-b0fd-96e6f7651f71',NULL,'deployId','string',NULL,NULL,NULL,NULL,NULL,NULL,'5d1410a8-c28b-11ea-b0fd-96e6f7651f71',NULL,'2020-07-10 16:59:12.195','2020-07-10 16:59:41.608'),('9f973202-c28b-11ea-b0fd-96e6f7651f71',1,'9f9731fc-c28b-11ea-b0fd-96e6f7651f71','9f9731fc-c28b-11ea-b0fd-96e6f7651f71',NULL,'content','string',NULL,NULL,NULL,NULL,NULL,NULL,'第一次部门经理级流程测试',NULL,'2020-07-10 16:59:12.195','2020-07-10 16:59:41.608'),('9f973203-c28b-11ea-b0fd-96e6f7651f71',1,'9f9731fc-c28b-11ea-b0fd-96e6f7651f71','9f9731fc-c28b-11ea-b0fd-96e6f7651f71',NULL,'modelKey','string',NULL,NULL,NULL,NULL,NULL,NULL,'Expense',NULL,'2020-07-10 16:59:12.195','2020-07-10 16:59:41.608'),('9f973204-c28b-11ea-b0fd-96e6f7651f71',1,'9f9731fc-c28b-11ea-b0fd-96e6f7651f71','9f9731fc-c28b-11ea-b0fd-96e6f7651f71',NULL,'modelName','string',NULL,NULL,NULL,NULL,NULL,NULL,'第一次部门经理级流程测试',NULL,'2020-07-10 16:59:12.195','2020-07-10 16:59:41.608'),('9f973205-c28b-11ea-b0fd-96e6f7651f71',1,'9f9731fc-c28b-11ea-b0fd-96e6f7651f71','9f9731fc-c28b-11ea-b0fd-96e6f7651f71',NULL,'createBy','string',NULL,NULL,NULL,NULL,NULL,NULL,'关羽',NULL,'2020-07-10 16:59:12.196','2020-07-10 16:59:41.609'),('9f975916-c28b-11ea-b0fd-96e6f7651f71',1,'9f9731fc-c28b-11ea-b0fd-96e6f7651f71','9f9731fc-c28b-11ea-b0fd-96e6f7651f71',NULL,'money','string',NULL,NULL,NULL,NULL,NULL,NULL,'600',NULL,'2020-07-10 16:59:12.196','2020-07-10 16:59:41.609'),('9f975917-c28b-11ea-b0fd-96e6f7651f71',1,'9f9731fc-c28b-11ea-b0fd-96e6f7651f71','9f9731fc-c28b-11ea-b0fd-96e6f7651f71',NULL,'createTime','string',NULL,NULL,NULL,NULL,NULL,NULL,'2020-07-10 16:59:12',NULL,'2020-07-10 16:59:12.196','2020-07-10 16:59:41.609'),('9f975918-c28b-11ea-b0fd-96e6f7651f71',1,'9f9731fc-c28b-11ea-b0fd-96e6f7651f71','9f9731fc-c28b-11ea-b0fd-96e6f7651f71',NULL,'updateBy','string',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2020-07-10 16:59:12.196','2020-07-10 16:59:41.610'),('9f975919-c28b-11ea-b0fd-96e6f7651f71',1,'9f9731fc-c28b-11ea-b0fd-96e6f7651f71','9f9731fc-c28b-11ea-b0fd-96e6f7651f71',NULL,'businessKey','string',NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c7337bcae017337f3337b0013',NULL,'2020-07-10 16:59:12.196','2020-07-10 16:59:41.610'),('9f97591a-c28b-11ea-b0fd-96e6f7651f71',1,'9f9731fc-c28b-11ea-b0fd-96e6f7651f71','9f9731fc-c28b-11ea-b0fd-96e6f7651f71',NULL,'id','string',NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c7337bcae017337f3337b0013',NULL,'2020-07-10 16:59:12.196','2020-07-10 16:59:41.610'),('9f97591b-c28b-11ea-b0fd-96e6f7651f71',1,'9f9731fc-c28b-11ea-b0fd-96e6f7651f71','9f9731fc-c28b-11ea-b0fd-96e6f7651f71',NULL,'flowTypeId','string',NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c73316c440173317228b40018',NULL,'2020-07-10 16:59:12.196','2020-07-10 16:59:41.611'),('b5c49350-c320-11ea-a804-96e6f7651f71',0,'b5c4452e-c320-11ea-a804-96e6f7651f71','b5c4452e-c320-11ea-a804-96e6f7651f71',NULL,'updateTime','string',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2020-07-11 10:46:24.416','2020-07-11 10:46:24.416'),('b5c4ba61-c320-11ea-a804-96e6f7651f71',0,'b5c4452e-c320-11ea-a804-96e6f7651f71','b5c4452e-c320-11ea-a804-96e6f7651f71',NULL,'remark','string',NULL,NULL,NULL,NULL,NULL,NULL,'不给我批就辞职',NULL,'2020-07-11 10:46:24.416','2020-07-11 10:46:24.416'),('b5c4ba62-c320-11ea-a804-96e6f7651f71',0,'b5c4452e-c320-11ea-a804-96e6f7651f71','b5c4452e-c320-11ea-a804-96e6f7651f71',NULL,'title','string',NULL,NULL,NULL,NULL,NULL,NULL,'不加班了我要请假去马尔代夫',NULL,'2020-07-11 10:46:24.416','2020-07-11 10:46:24.416'),('b5c4ba63-c320-11ea-a804-96e6f7651f71',0,'b5c4452e-c320-11ea-a804-96e6f7651f71','b5c4452e-c320-11ea-a804-96e6f7651f71',NULL,'deployId','string',NULL,NULL,NULL,NULL,NULL,NULL,'3484aeaf-c31d-11ea-9982-96e6f7651f71',NULL,'2020-07-11 10:46:24.416','2020-07-11 10:46:24.416'),('b5c4ba64-c320-11ea-a804-96e6f7651f71',0,'b5c4452e-c320-11ea-a804-96e6f7651f71','b5c4452e-c320-11ea-a804-96e6f7651f71',NULL,'flowName','string',NULL,NULL,NULL,NULL,NULL,NULL,'不加班了我要请假去马尔代夫',NULL,'2020-07-11 10:46:24.416','2020-07-11 10:46:24.416'),('b5c4ba65-c320-11ea-a804-96e6f7651f71',0,'b5c4452e-c320-11ea-a804-96e6f7651f71','b5c4452e-c320-11ea-a804-96e6f7651f71',NULL,'modelKey','string',NULL,NULL,NULL,NULL,NULL,NULL,'AskForLeave',NULL,'2020-07-11 10:46:24.416','2020-07-11 10:46:24.416'),('b5c4ba66-c320-11ea-a804-96e6f7651f71',0,'b5c4452e-c320-11ea-a804-96e6f7651f71','b5c4452e-c320-11ea-a804-96e6f7651f71',NULL,'createBy','string',NULL,NULL,NULL,NULL,NULL,NULL,'孙权',NULL,'2020-07-11 10:46:24.416','2020-07-11 10:46:24.416'),('b5c4ba67-c320-11ea-a804-96e6f7651f71',0,'b5c4452e-c320-11ea-a804-96e6f7651f71','b5c4452e-c320-11ea-a804-96e6f7651f71',NULL,'leaveDays','string',NULL,NULL,NULL,NULL,NULL,NULL,'7',NULL,'2020-07-11 10:46:24.416','2020-07-11 10:46:24.416'),('b5c4ba68-c320-11ea-a804-96e6f7651f71',0,'b5c4452e-c320-11ea-a804-96e6f7651f71','b5c4452e-c320-11ea-a804-96e6f7651f71',NULL,'createTime','string',NULL,NULL,NULL,NULL,NULL,NULL,'2020-07-11 10:46:24',NULL,'2020-07-11 10:46:24.416','2020-07-11 10:46:24.416'),('b5c4ba69-c320-11ea-a804-96e6f7651f71',0,'b5c4452e-c320-11ea-a804-96e6f7651f71','b5c4452e-c320-11ea-a804-96e6f7651f71',NULL,'updateBy','string',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2020-07-11 10:46:24.416','2020-07-11 10:46:24.416'),('b5c4ba6a-c320-11ea-a804-96e6f7651f71',0,'b5c4452e-c320-11ea-a804-96e6f7651f71','b5c4452e-c320-11ea-a804-96e6f7651f71',NULL,'callbackId','string',NULL,NULL,NULL,NULL,NULL,NULL,'submitExpenseAccount',NULL,'2020-07-11 10:46:24.416','2020-07-11 10:46:24.416'),('b5c4ba6b-c320-11ea-a804-96e6f7651f71',0,'b5c4452e-c320-11ea-a804-96e6f7651f71','b5c4452e-c320-11ea-a804-96e6f7651f71',NULL,'businessKey','string',NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c733bb8d701733bc441050068',NULL,'2020-07-11 10:46:24.416','2020-07-11 10:46:24.416'),('b5c4ba6c-c320-11ea-a804-96e6f7651f71',0,'b5c4452e-c320-11ea-a804-96e6f7651f71','b5c4452e-c320-11ea-a804-96e6f7651f71',NULL,'id','string',NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c733bb8d701733bc441050068',NULL,'2020-07-11 10:46:24.416','2020-07-11 10:46:24.416'),('b5c4ba6d-c320-11ea-a804-96e6f7651f71',0,'b5c4452e-c320-11ea-a804-96e6f7651f71','b5c4452e-c320-11ea-a804-96e6f7651f71',NULL,'flowTypeId','string',NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c73316c440173317049080010',NULL,'2020-07-11 10:46:24.416','2020-07-11 10:46:24.416'),('b5c4ba6e-c320-11ea-a804-96e6f7651f71',0,'b5c4452e-c320-11ea-a804-96e6f7651f71','b5c4452e-c320-11ea-a804-96e6f7651f71',NULL,'callbackType','string',NULL,NULL,NULL,NULL,NULL,NULL,'JQueryFunction',NULL,'2020-07-11 10:46:24.416','2020-07-11 10:46:24.416'),('caafc5b7-c323-11ea-a804-96e6f7651f71',0,'caba6266-c286-11ea-b0fd-96e6f7651f71','caba6266-c286-11ea-b0fd-96e6f7651f71',NULL,'outcome','string',NULL,NULL,NULL,NULL,NULL,NULL,'退回',NULL,'2020-07-11 11:08:28.001','2020-07-11 11:08:28.001'),('caba6268-c286-11ea-b0fd-96e6f7651f71',2,'caba6266-c286-11ea-b0fd-96e6f7651f71','caba6266-c286-11ea-b0fd-96e6f7651f71',NULL,'updateTime','string',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2020-07-10 16:24:37.084','2020-07-11 11:08:27.998'),('caba6269-c286-11ea-b0fd-96e6f7651f71',2,'caba6266-c286-11ea-b0fd-96e6f7651f71','caba6266-c286-11ea-b0fd-96e6f7651f71',NULL,'remark','string',NULL,NULL,NULL,NULL,NULL,NULL,'第十一次报销流程测试',NULL,'2020-07-10 16:24:37.084','2020-07-11 11:08:27.998'),('caba626a-c286-11ea-b0fd-96e6f7651f71',2,'caba6266-c286-11ea-b0fd-96e6f7651f71','caba6266-c286-11ea-b0fd-96e6f7651f71',NULL,'title','string',NULL,NULL,NULL,NULL,NULL,NULL,'第十一次报销流程测试',NULL,'2020-07-10 16:24:37.084','2020-07-11 11:08:27.998'),('caba626b-c286-11ea-b0fd-96e6f7651f71',2,'caba6266-c286-11ea-b0fd-96e6f7651f71','caba6266-c286-11ea-b0fd-96e6f7651f71',NULL,'deployId','string',NULL,NULL,NULL,NULL,NULL,NULL,'e5381dc2-c191-11ea-8e4d-96e6f7651f71',NULL,'2020-07-10 16:24:37.084','2020-07-11 11:08:27.999'),('caba626c-c286-11ea-b0fd-96e6f7651f71',2,'caba6266-c286-11ea-b0fd-96e6f7651f71','caba6266-c286-11ea-b0fd-96e6f7651f71',NULL,'content','string',NULL,NULL,NULL,NULL,NULL,NULL,'第十一次报销流程测试',NULL,'2020-07-10 16:24:37.084','2020-07-11 11:08:27.999'),('caba626d-c286-11ea-b0fd-96e6f7651f71',2,'caba6266-c286-11ea-b0fd-96e6f7651f71','caba6266-c286-11ea-b0fd-96e6f7651f71',NULL,'modelKey','string',NULL,NULL,NULL,NULL,NULL,NULL,'Expense2',NULL,'2020-07-10 16:24:37.084','2020-07-11 11:08:27.999'),('caba626e-c286-11ea-b0fd-96e6f7651f71',2,'caba6266-c286-11ea-b0fd-96e6f7651f71','caba6266-c286-11ea-b0fd-96e6f7651f71',NULL,'modelName','string',NULL,NULL,NULL,NULL,NULL,NULL,'员工级别-报销流程',NULL,'2020-07-10 16:24:37.084','2020-07-11 11:08:28.000'),('caba626f-c286-11ea-b0fd-96e6f7651f71',2,'caba6266-c286-11ea-b0fd-96e6f7651f71','caba6266-c286-11ea-b0fd-96e6f7651f71',NULL,'createBy','string',NULL,NULL,NULL,NULL,NULL,NULL,'典韦',NULL,'2020-07-10 16:24:37.085','2020-07-11 11:08:28.000'),('caba8980-c286-11ea-b0fd-96e6f7651f71',2,'caba6266-c286-11ea-b0fd-96e6f7651f71','caba6266-c286-11ea-b0fd-96e6f7651f71',NULL,'money','string',NULL,NULL,NULL,NULL,NULL,NULL,'11000',NULL,'2020-07-10 16:24:37.085','2020-07-11 11:08:28.000'),('caba8981-c286-11ea-b0fd-96e6f7651f71',2,'caba6266-c286-11ea-b0fd-96e6f7651f71','caba6266-c286-11ea-b0fd-96e6f7651f71',NULL,'createTime','string',NULL,NULL,NULL,NULL,NULL,NULL,'2020-07-10 16:24:37',NULL,'2020-07-10 16:24:37.085','2020-07-11 11:08:28.000'),('caba8982-c286-11ea-b0fd-96e6f7651f71',2,'caba6266-c286-11ea-b0fd-96e6f7651f71','caba6266-c286-11ea-b0fd-96e6f7651f71',NULL,'updateBy','string',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2020-07-10 16:24:37.085','2020-07-11 11:08:28.001'),('caba8983-c286-11ea-b0fd-96e6f7651f71',2,'caba6266-c286-11ea-b0fd-96e6f7651f71','caba6266-c286-11ea-b0fd-96e6f7651f71',NULL,'businessKey','string',NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c7337bcae017337d389c20008',NULL,'2020-07-10 16:24:37.085','2020-07-11 11:08:28.001'),('caba8984-c286-11ea-b0fd-96e6f7651f71',2,'caba6266-c286-11ea-b0fd-96e6f7651f71','caba6266-c286-11ea-b0fd-96e6f7651f71',NULL,'id','string',NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c7337bcae017337d389c20008',NULL,'2020-07-10 16:24:37.085','2020-07-11 11:08:28.001'),('caba8985-c286-11ea-b0fd-96e6f7651f71',2,'caba6266-c286-11ea-b0fd-96e6f7651f71','caba6266-c286-11ea-b0fd-96e6f7651f71',NULL,'flowTypeId','string',NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016',NULL,'2020-07-10 16:24:37.085','2020-07-11 11:08:28.001'),('cb78898f-c283-11ea-b0fd-96e6f7651f71',1,'cb78627d-c283-11ea-b0fd-96e6f7651f71','cb78627d-c283-11ea-b0fd-96e6f7651f71',NULL,'updateTime','string',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2020-07-10 16:03:09.840','2020-07-11 11:03:24.873'),('cb788990-c283-11ea-b0fd-96e6f7651f71',1,'cb78627d-c283-11ea-b0fd-96e6f7651f71','cb78627d-c283-11ea-b0fd-96e6f7651f71',NULL,'remark','string',NULL,NULL,NULL,NULL,NULL,NULL,'第十次报销流程测试',NULL,'2020-07-10 16:03:09.840','2020-07-11 11:03:24.872'),('cb788991-c283-11ea-b0fd-96e6f7651f71',1,'cb78627d-c283-11ea-b0fd-96e6f7651f71','cb78627d-c283-11ea-b0fd-96e6f7651f71',NULL,'title','string',NULL,NULL,NULL,NULL,NULL,NULL,'第十次报销流程测试',NULL,'2020-07-10 16:03:09.840','2020-07-11 11:03:24.873'),('cb788992-c283-11ea-b0fd-96e6f7651f71',1,'cb78627d-c283-11ea-b0fd-96e6f7651f71','cb78627d-c283-11ea-b0fd-96e6f7651f71',NULL,'deployId','string',NULL,NULL,NULL,NULL,NULL,NULL,'e5381dc2-c191-11ea-8e4d-96e6f7651f71',NULL,'2020-07-10 16:03:09.840','2020-07-11 11:03:24.874'),('cb788993-c283-11ea-b0fd-96e6f7651f71',1,'cb78627d-c283-11ea-b0fd-96e6f7651f71','cb78627d-c283-11ea-b0fd-96e6f7651f71',NULL,'content','string',NULL,NULL,NULL,NULL,NULL,NULL,'第十次报销流程测试',NULL,'2020-07-10 16:03:09.840','2020-07-11 11:03:24.874'),('cb788994-c283-11ea-b0fd-96e6f7651f71',1,'cb78627d-c283-11ea-b0fd-96e6f7651f71','cb78627d-c283-11ea-b0fd-96e6f7651f71',NULL,'modelKey','string',NULL,NULL,NULL,NULL,NULL,NULL,'Expense2',NULL,'2020-07-10 16:03:09.840','2020-07-11 11:03:24.874'),('cb788995-c283-11ea-b0fd-96e6f7651f71',1,'cb78627d-c283-11ea-b0fd-96e6f7651f71','cb78627d-c283-11ea-b0fd-96e6f7651f71',NULL,'createBy','string',NULL,NULL,NULL,NULL,NULL,NULL,'典韦',NULL,'2020-07-10 16:03:09.840','2020-07-11 11:03:24.875'),('cb788996-c283-11ea-b0fd-96e6f7651f71',1,'cb78627d-c283-11ea-b0fd-96e6f7651f71','cb78627d-c283-11ea-b0fd-96e6f7651f71',NULL,'money','string',NULL,NULL,NULL,NULL,NULL,NULL,'10000',NULL,'2020-07-10 16:03:09.840','2020-07-11 11:03:24.875'),('cb788997-c283-11ea-b0fd-96e6f7651f71',1,'cb78627d-c283-11ea-b0fd-96e6f7651f71','cb78627d-c283-11ea-b0fd-96e6f7651f71',NULL,'createTime','string',NULL,NULL,NULL,NULL,NULL,NULL,'2020-07-10 16:03:09',NULL,'2020-07-10 16:03:09.840','2020-07-11 11:03:24.876'),('cb788998-c283-11ea-b0fd-96e6f7651f71',1,'cb78627d-c283-11ea-b0fd-96e6f7651f71','cb78627d-c283-11ea-b0fd-96e6f7651f71',NULL,'updateBy','string',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2020-07-10 16:03:09.840','2020-07-11 11:03:24.875'),('cb78b0a9-c283-11ea-b0fd-96e6f7651f71',1,'cb78627d-c283-11ea-b0fd-96e6f7651f71','cb78627d-c283-11ea-b0fd-96e6f7651f71',NULL,'name','string',NULL,NULL,NULL,NULL,NULL,NULL,'第十次报销流程测试',NULL,'2020-07-10 16:03:09.841','2020-07-11 11:03:24.877'),('cb78b0aa-c283-11ea-b0fd-96e6f7651f71',1,'cb78627d-c283-11ea-b0fd-96e6f7651f71','cb78627d-c283-11ea-b0fd-96e6f7651f71',NULL,'businessKey','string',NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c7337bcae017337bfe56f0001',NULL,'2020-07-10 16:03:09.841','2020-07-11 11:03:24.876'),('cb78b0ab-c283-11ea-b0fd-96e6f7651f71',1,'cb78627d-c283-11ea-b0fd-96e6f7651f71','cb78627d-c283-11ea-b0fd-96e6f7651f71',NULL,'id','string',NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c7337bcae017337bfe56f0001',NULL,'2020-07-10 16:03:09.841','2020-07-11 11:03:24.877'),('cb78b0ac-c283-11ea-b0fd-96e6f7651f71',1,'cb78627d-c283-11ea-b0fd-96e6f7651f71','cb78627d-c283-11ea-b0fd-96e6f7651f71',NULL,'flowTypeId','string',NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016',NULL,'2020-07-10 16:03:09.841','2020-07-11 11:03:24.877'),('cee3e205-c1af-11ea-9b4f-96e6f7651f71',3,'cee3e203-c1af-11ea-9b4f-96e6f7651f71','cee3e203-c1af-11ea-9b4f-96e6f7651f71',NULL,'updateTime','string',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2020-07-09 14:45:42.270','2020-07-09 19:31:06.898'),('cee3e206-c1af-11ea-9b4f-96e6f7651f71',3,'cee3e203-c1af-11ea-9b4f-96e6f7651f71','cee3e203-c1af-11ea-9b4f-96e6f7651f71',NULL,'remark','string',NULL,NULL,NULL,NULL,NULL,NULL,'第四次流程报销测试',NULL,'2020-07-09 14:45:42.270','2020-07-09 19:31:06.898'),('cee3e207-c1af-11ea-9b4f-96e6f7651f71',3,'cee3e203-c1af-11ea-9b4f-96e6f7651f71','cee3e203-c1af-11ea-9b4f-96e6f7651f71',NULL,'title','string',NULL,NULL,NULL,NULL,NULL,NULL,'第四次流程报销测试',NULL,'2020-07-09 14:45:42.270','2020-07-09 19:31:06.899'),('cee3e208-c1af-11ea-9b4f-96e6f7651f71',3,'cee3e203-c1af-11ea-9b4f-96e6f7651f71','cee3e203-c1af-11ea-9b4f-96e6f7651f71',NULL,'content','string',NULL,NULL,NULL,NULL,NULL,NULL,'第四次流程报销测试',NULL,'2020-07-09 14:45:42.270','2020-07-09 19:31:06.899'),('cee3e209-c1af-11ea-9b4f-96e6f7651f71',3,'cee3e203-c1af-11ea-9b4f-96e6f7651f71','cee3e203-c1af-11ea-9b4f-96e6f7651f71',NULL,'modelKey','string',NULL,NULL,NULL,NULL,NULL,NULL,'Expense2',NULL,'2020-07-09 14:45:42.270','2020-07-09 19:31:06.899'),('cee3e20a-c1af-11ea-9b4f-96e6f7651f71',3,'cee3e203-c1af-11ea-9b4f-96e6f7651f71','cee3e203-c1af-11ea-9b4f-96e6f7651f71',NULL,'createBy','string',NULL,NULL,NULL,NULL,NULL,NULL,'典韦',NULL,'2020-07-09 14:45:42.270','2020-07-09 19:31:06.900'),('cee3e20b-c1af-11ea-9b4f-96e6f7651f71',3,'cee3e203-c1af-11ea-9b4f-96e6f7651f71','cee3e203-c1af-11ea-9b4f-96e6f7651f71',NULL,'money','string',NULL,NULL,NULL,NULL,NULL,NULL,'400',NULL,'2020-07-09 14:45:42.270','2020-07-09 19:31:06.900'),('cee3e20c-c1af-11ea-9b4f-96e6f7651f71',3,'cee3e203-c1af-11ea-9b4f-96e6f7651f71','cee3e203-c1af-11ea-9b4f-96e6f7651f71',NULL,'createTime','string',NULL,NULL,NULL,NULL,NULL,NULL,'2020-07-09 14:45:42',NULL,'2020-07-09 14:45:42.270','2020-07-09 19:31:06.900'),('cee3e20d-c1af-11ea-9b4f-96e6f7651f71',3,'cee3e203-c1af-11ea-9b4f-96e6f7651f71','cee3e203-c1af-11ea-9b4f-96e6f7651f71',NULL,'updateBy','string',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2020-07-09 14:45:42.270','2020-07-09 19:31:06.901'),('cee3e20e-c1af-11ea-9b4f-96e6f7651f71',3,'cee3e203-c1af-11ea-9b4f-96e6f7651f71','cee3e203-c1af-11ea-9b4f-96e6f7651f71',NULL,'name','string',NULL,NULL,NULL,NULL,NULL,NULL,'第四次流程报销测试',NULL,'2020-07-09 14:45:42.270','2020-07-09 19:31:06.901'),('cee3e20f-c1af-11ea-9b4f-96e6f7651f71',3,'cee3e203-c1af-11ea-9b4f-96e6f7651f71','cee3e203-c1af-11ea-9b4f-96e6f7651f71',NULL,'businessKey','string',NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c73324cb0017332529edd000a',NULL,'2020-07-09 14:45:42.270','2020-07-09 19:31:06.901'),('cee3e210-c1af-11ea-9b4f-96e6f7651f71',3,'cee3e203-c1af-11ea-9b4f-96e6f7651f71','cee3e203-c1af-11ea-9b4f-96e6f7651f71',NULL,'id','string',NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c73324cb0017332529edd000a',NULL,'2020-07-09 14:45:42.270','2020-07-09 19:31:06.902'),('cee3e211-c1af-11ea-9b4f-96e6f7651f71',3,'cee3e203-c1af-11ea-9b4f-96e6f7651f71','cee3e203-c1af-11ea-9b4f-96e6f7651f71',NULL,'flowTypeId','string',NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016',NULL,'2020-07-09 14:45:42.270','2020-07-09 19:31:06.902'),('d2a7ede2-c27e-11ea-8dcf-96e6f7651f71',1,'d2a7ede0-c27e-11ea-8dcf-96e6f7651f71','d2a7ede0-c27e-11ea-8dcf-96e6f7651f71',NULL,'updateTime','string',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2020-07-10 15:27:34.411','2020-07-10 16:00:33.306'),('d2a7ede3-c27e-11ea-8dcf-96e6f7651f71',1,'d2a7ede0-c27e-11ea-8dcf-96e6f7651f71','d2a7ede0-c27e-11ea-8dcf-96e6f7651f71',NULL,'remark','string',NULL,NULL,NULL,NULL,NULL,NULL,'第九次报销流程测试',NULL,'2020-07-10 15:27:34.411','2020-07-10 16:00:33.305'),('d2a7ede4-c27e-11ea-8dcf-96e6f7651f71',1,'d2a7ede0-c27e-11ea-8dcf-96e6f7651f71','d2a7ede0-c27e-11ea-8dcf-96e6f7651f71',NULL,'title','string',NULL,NULL,NULL,NULL,NULL,NULL,'第九次报销流程测试',NULL,'2020-07-10 15:27:34.411','2020-07-10 16:00:33.307'),('d2a7ede5-c27e-11ea-8dcf-96e6f7651f71',1,'d2a7ede0-c27e-11ea-8dcf-96e6f7651f71','d2a7ede0-c27e-11ea-8dcf-96e6f7651f71',NULL,'deployId','string',NULL,NULL,NULL,NULL,NULL,NULL,'e5381dc2-c191-11ea-8e4d-96e6f7651f71',NULL,'2020-07-10 15:27:34.411','2020-07-10 16:00:33.307'),('d2a7ede6-c27e-11ea-8dcf-96e6f7651f71',1,'d2a7ede0-c27e-11ea-8dcf-96e6f7651f71','d2a7ede0-c27e-11ea-8dcf-96e6f7651f71',NULL,'content','string',NULL,NULL,NULL,NULL,NULL,NULL,'第九次报销流程测试',NULL,'2020-07-10 15:27:34.411','2020-07-10 16:00:33.308'),('d2a7ede7-c27e-11ea-8dcf-96e6f7651f71',1,'d2a7ede0-c27e-11ea-8dcf-96e6f7651f71','d2a7ede0-c27e-11ea-8dcf-96e6f7651f71',NULL,'modelKey','string',NULL,NULL,NULL,NULL,NULL,NULL,'Expense2',NULL,'2020-07-10 15:27:34.411','2020-07-10 16:00:33.309'),('d2a7ede8-c27e-11ea-8dcf-96e6f7651f71',1,'d2a7ede0-c27e-11ea-8dcf-96e6f7651f71','d2a7ede0-c27e-11ea-8dcf-96e6f7651f71',NULL,'createBy','string',NULL,NULL,NULL,NULL,NULL,NULL,'典韦',NULL,'2020-07-10 15:27:34.411','2020-07-10 16:00:33.309'),('d2a7ede9-c27e-11ea-8dcf-96e6f7651f71',1,'d2a7ede0-c27e-11ea-8dcf-96e6f7651f71','d2a7ede0-c27e-11ea-8dcf-96e6f7651f71',NULL,'money','string',NULL,NULL,NULL,NULL,NULL,NULL,'900',NULL,'2020-07-10 15:27:34.411','2020-07-10 16:00:33.310'),('d2a7edea-c27e-11ea-8dcf-96e6f7651f71',1,'d2a7ede0-c27e-11ea-8dcf-96e6f7651f71','d2a7ede0-c27e-11ea-8dcf-96e6f7651f71',NULL,'createTime','string',NULL,NULL,NULL,NULL,NULL,NULL,'2020-07-10 15:27:34',NULL,'2020-07-10 15:27:34.411','2020-07-10 16:00:33.311'),('d2a7edeb-c27e-11ea-8dcf-96e6f7651f71',1,'d2a7ede0-c27e-11ea-8dcf-96e6f7651f71','d2a7ede0-c27e-11ea-8dcf-96e6f7651f71',NULL,'updateBy','string',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2020-07-10 15:27:34.411','2020-07-10 16:00:33.311'),('d2a7edec-c27e-11ea-8dcf-96e6f7651f71',1,'d2a7ede0-c27e-11ea-8dcf-96e6f7651f71','d2a7ede0-c27e-11ea-8dcf-96e6f7651f71',NULL,'name','string',NULL,NULL,NULL,NULL,NULL,NULL,'第九次报销流程测试',NULL,'2020-07-10 15:27:34.411','2020-07-10 16:00:33.312'),('d2a7eded-c27e-11ea-8dcf-96e6f7651f71',1,'d2a7ede0-c27e-11ea-8dcf-96e6f7651f71','d2a7ede0-c27e-11ea-8dcf-96e6f7651f71',NULL,'businessKey','string',NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c73376dde0173379f4fee000f',NULL,'2020-07-10 15:27:34.411','2020-07-10 16:00:33.312'),('d2a7edee-c27e-11ea-8dcf-96e6f7651f71',1,'d2a7ede0-c27e-11ea-8dcf-96e6f7651f71','d2a7ede0-c27e-11ea-8dcf-96e6f7651f71',NULL,'id','string',NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c73376dde0173379f4fee000f',NULL,'2020-07-10 15:27:34.411','2020-07-10 16:00:33.313'),('d2a7edef-c27e-11ea-8dcf-96e6f7651f71',1,'d2a7ede0-c27e-11ea-8dcf-96e6f7651f71','d2a7ede0-c27e-11ea-8dcf-96e6f7651f71',NULL,'flowTypeId','string',NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016',NULL,'2020-07-10 15:27:34.411','2020-07-10 16:00:33.313'),('d84de3e8-c1c6-11ea-9b4f-96e6f7651f71',13,'46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71',NULL,'outcome','string',NULL,NULL,NULL,NULL,NULL,NULL,'同意',NULL,'2020-07-09 17:30:36.489','2020-07-09 18:02:45.941'),('e0dd5dfe-c1d5-11ea-8903-96e6f7651f71',1,'868bd51b-c1af-11ea-9b4f-96e6f7651f71','868bd51b-c1af-11ea-9b4f-96e6f7651f71',NULL,'outcome','string',NULL,NULL,NULL,NULL,NULL,NULL,'同意',NULL,'2020-07-09 19:18:13.302','2020-07-09 19:30:21.169'),('e9892e36-c25d-11ea-82f3-96e6f7651f71',1,'e988b904-c25d-11ea-82f3-96e6f7651f71','e988b904-c25d-11ea-82f3-96e6f7651f71',NULL,'updateTime','string',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2020-07-10 11:31:59.407','2020-07-10 15:19:15.707'),('e9897c57-c25d-11ea-82f3-96e6f7651f71',1,'e988b904-c25d-11ea-82f3-96e6f7651f71','e988b904-c25d-11ea-82f3-96e6f7651f71',NULL,'remark','string',NULL,NULL,NULL,NULL,NULL,NULL,'第六次报销流程测试',NULL,'2020-07-10 11:31:59.407','2020-07-10 15:19:15.707'),('e9897c58-c25d-11ea-82f3-96e6f7651f71',1,'e988b904-c25d-11ea-82f3-96e6f7651f71','e988b904-c25d-11ea-82f3-96e6f7651f71',NULL,'title','string',NULL,NULL,NULL,NULL,NULL,NULL,'第六次报销流程测试',NULL,'2020-07-10 11:31:59.407','2020-07-10 15:19:15.707'),('e9897c59-c25d-11ea-82f3-96e6f7651f71',1,'e988b904-c25d-11ea-82f3-96e6f7651f71','e988b904-c25d-11ea-82f3-96e6f7651f71',NULL,'deployId','string',NULL,NULL,NULL,NULL,NULL,NULL,'e5381dc2-c191-11ea-8e4d-96e6f7651f71',NULL,'2020-07-10 11:31:59.407','2020-07-10 15:19:15.708'),('e9897c5a-c25d-11ea-82f3-96e6f7651f71',1,'e988b904-c25d-11ea-82f3-96e6f7651f71','e988b904-c25d-11ea-82f3-96e6f7651f71',NULL,'content','string',NULL,NULL,NULL,NULL,NULL,NULL,'第六次报销流程测试',NULL,'2020-07-10 11:31:59.407','2020-07-10 15:19:15.708'),('e9897c5b-c25d-11ea-82f3-96e6f7651f71',1,'e988b904-c25d-11ea-82f3-96e6f7651f71','e988b904-c25d-11ea-82f3-96e6f7651f71',NULL,'modelKey','string',NULL,NULL,NULL,NULL,NULL,NULL,'Expense2',NULL,'2020-07-10 11:31:59.407','2020-07-10 15:19:15.708'),('e9897c5c-c25d-11ea-82f3-96e6f7651f71',1,'e988b904-c25d-11ea-82f3-96e6f7651f71','e988b904-c25d-11ea-82f3-96e6f7651f71',NULL,'createBy','string',NULL,NULL,NULL,NULL,NULL,NULL,'典韦',NULL,'2020-07-10 11:31:59.407','2020-07-10 15:19:15.709'),('e9897c5d-c25d-11ea-82f3-96e6f7651f71',1,'e988b904-c25d-11ea-82f3-96e6f7651f71','e988b904-c25d-11ea-82f3-96e6f7651f71',NULL,'money','string',NULL,NULL,NULL,NULL,NULL,NULL,'600',NULL,'2020-07-10 11:31:59.407','2020-07-10 15:19:15.709'),('e9897c5e-c25d-11ea-82f3-96e6f7651f71',1,'e988b904-c25d-11ea-82f3-96e6f7651f71','e988b904-c25d-11ea-82f3-96e6f7651f71',NULL,'createTime','string',NULL,NULL,NULL,NULL,NULL,NULL,'2020-07-10 11:31:59',NULL,'2020-07-10 11:31:59.408','2020-07-10 15:19:15.710'),('e989a36f-c25d-11ea-82f3-96e6f7651f71',1,'e988b904-c25d-11ea-82f3-96e6f7651f71','e988b904-c25d-11ea-82f3-96e6f7651f71',NULL,'updateBy','string',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2020-07-10 11:31:59.408','2020-07-10 15:19:15.709'),('e989a370-c25d-11ea-82f3-96e6f7651f71',1,'e988b904-c25d-11ea-82f3-96e6f7651f71','e988b904-c25d-11ea-82f3-96e6f7651f71',NULL,'name','string',NULL,NULL,NULL,NULL,NULL,NULL,'第六次报销流程测试',NULL,'2020-07-10 11:31:59.408','2020-07-10 15:19:15.710'),('e989a371-c25d-11ea-82f3-96e6f7651f71',1,'e988b904-c25d-11ea-82f3-96e6f7651f71','e988b904-c25d-11ea-82f3-96e6f7651f71',NULL,'businessKey','string',NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c7336adf8017336c7a0950000',NULL,'2020-07-10 11:31:59.408','2020-07-10 15:19:15.710'),('e989a372-c25d-11ea-82f3-96e6f7651f71',1,'e988b904-c25d-11ea-82f3-96e6f7651f71','e988b904-c25d-11ea-82f3-96e6f7651f71',NULL,'id','string',NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c7336adf8017336c7a0950000',NULL,'2020-07-10 11:31:59.408','2020-07-10 15:19:15.711'),('e989a373-c25d-11ea-82f3-96e6f7651f71',1,'e988b904-c25d-11ea-82f3-96e6f7651f71','e988b904-c25d-11ea-82f3-96e6f7651f71',NULL,'flowTypeId','string',NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016',NULL,'2020-07-10 11:31:59.408','2020-07-10 15:19:15.711');
/*!40000 ALTER TABLE `act_hi_varinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_token`
--

DROP TABLE IF EXISTS `act_id_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_token` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TOKEN_VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TOKEN_DATE_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `IP_ADDRESS_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_AGENT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TOKEN_DATA_` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_token`
--

LOCK TABLES `act_id_token` WRITE;
/*!40000 ALTER TABLE `act_id_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_config` (
  `config_id` varchar(255) NOT NULL,
  `config_key` varchar(100) DEFAULT NULL,
  `config_name` varchar(100) DEFAULT NULL,
  `config_type` varchar(255) DEFAULT NULL,
  `config_value` varchar(500) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES ('40283e817047a079017047a4a9d00001','shiro.kaptcha.type','验证码类型','Y','default','admin','2020-02-16 13:31:49','设置验证码类型，默认字符default，数学math','admin','2020-02-15 15:12:45'),('40283e817047a079017047a6db560009','shiro.kaptcha.enabled','验证码开关','Y','false','admin','2020-02-16 13:31:49','设置验证码开关，开true，关false','admin','2020-02-15 16:25:10'),('40283e817047a079017047a81f7f000b','shiro.cookie.domain','Cookie的域名 ','Y','','admin','2020-02-16 13:31:49','设置Cookie的域名 默认空，即当前访问的域名','admin','2020-02-15 15:10:13'),('40283e817047a079017047a872e3000d','shiro.cookie.path','Cookie的有效访问路径','Y','/','admin','2020-02-16 13:31:49','设置cookie的有效访问路径','admin','2020-02-15 15:10:32'),('40283e817047a079017047a8f073000f','shiro.cookie.httpOnly','Cookie的HttpOnly属性','Y','true','admin','2020-02-16 13:31:49','设置HttpOnly属性','admin','2020-02-15 15:10:40'),('40283e817047a079017047a94a300011','shiro.cookie.maxAge','Cookie的过期时间','Y','30','admin','2020-02-16 13:31:49','设置Cookie的过期时间，天为单位','admin','2020-02-15 15:12:02'),('40283e817047a079017047a9a3800013','shiro.session.expireTime','会话超时时间','Y','30','admin','2020-02-16 13:31:49','设置会话超时时间（默认30分钟）','admin','2020-02-15 15:11:04'),('40283e817047a079017047a9fdef0015','shiro.session.maxSession','最大会话数','Y','-1','admin','2020-02-16 13:31:49','设置同一个用户登录的最大会话数，比如2的意思是同一个用户账号允许最多同时两个人登录（默认-1不限制）','admin','2020-02-15 15:11:50'),('40283e817047a079017047ab7dca0017','shiro.session.kickoutAfter','是否踢出用户','Y','false','admin','2020-02-16 13:31:49','是否踢出之前登录的/之后登录的用户，默认踢出之前登录的用户','admin','2020-02-15 15:06:39'),('40283e817047e7ff017047efed6a0001','shiro.session.kickoutUrl','踢出后重定向地址','Y','/login','admin','2020-02-16 13:31:49','设置踢出后重定向到的地址','admin','2020-02-15 16:21:28'),('40283e81704c421b01704c433bd70001','shiro.user.loginUrl','系统登录地址','Y','/login','admin','2020-02-16 13:31:49','设置系统登录地址','admin','2020-02-16 12:32:19'),('40283e81704c421b01704c43e4060003','shiro.user.indexUrl','系统登录首页地址','Y','/index','admin','2020-02-16 13:31:49','设置系统登录首页地址','admin','2020-02-16 12:32:16'),('40283e81704c421b01704c4456800005','shiro.user.unauthorizedUrl','权限认证失败跳转地址','Y','/unauth','admin','2020-02-16 13:31:49','设置权限认证失败跳转地址','admin','2020-02-16 12:32:13'),('40283e81704c759101704c7b3a550019','shiro.cookie.name','Cookie的名称','Y','rememberMe','admin','2020-02-16 13:31:49','设置Cookie的名称',NULL,NULL),('402855816f18b1e3016f18bbb5c50000','sys.user.initPassword','用户管理-账号初始密码','N','123456','admin','2020-02-16 13:31:49','用户管理的系统用户账号初始密码为 123456','admin','2020-02-15 16:23:42'),('402855816f18b1e3016f18d5a9970003','sys.index.sideTheme','主框架页-侧边栏主题','N','theme-dark','admin','2020-02-16 13:31:49','深色主题theme-dark，浅色主题theme-light','admin','2020-06-01 09:11:59'),('402855816f18b1e3016f18d612bd0004','sys.index.skinName','主框架页-默认皮肤样式名称','N','skin-blue','admin','2020-02-16 13:31:49','蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow','admin','2020-05-29 17:08:26');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demo_leave`
--

DROP TABLE IF EXISTS `demo_leave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demo_leave` (
  `leave_id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `deploy_id` varchar(255) DEFAULT NULL,
  `flow_type_id` varchar(255) DEFAULT NULL,
  `leave_days` double DEFAULT NULL,
  `model_key` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`leave_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demo_leave`
--

LOCK TABLES `demo_leave` WRITE;
/*!40000 ALTER TABLE `demo_leave` DISABLE KEYS */;
INSERT INTO `demo_leave` VALUES ('4028b26c733bb8d701733bc441050068','孙权','2020-07-11 10:46:24','3484aeaf-c31d-11ea-9982-96e6f7651f71','4028b26c73316c440173317049080010',7,'AskForLeave','不给我批就辞职','不加班了我要请假去马尔代夫',NULL,NULL),('4028b26c733bb8d701733bc90997007a','孙坚','2020-07-11 10:51:38','34f6fbf8-c321-11ea-a804-96e6f7651f71','4028b26c73316c440173317049080010',7,'AskForLeave','没事就是请假怎么地','没事就是请假怎么地',NULL,NULL);
/*!40000 ALTER TABLE `demo_leave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `user_id` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `dept_id` varchar(255) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `is_admin` varchar(255) DEFAULT NULL,
  `login_ip` varchar(255) DEFAULT NULL,
  `login_name` varchar(30) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `role_id` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `user_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES ('40283e817048902901704898b1690005',NULL,'admin','2020-02-15 19:25:31','402855816f35ac13016f35ce3bca0019','caocao@163.com',NULL,'127.0.0.1','曹操','2020-07-10 16:06:22',NULL,'47a8a1577ee38161b67a7d41a48dd31f','18088888881','',NULL,'3925a1','0','0','admin','2020-04-22 17:00:14','曹操'),('40283e817048902901704899f54e0008',NULL,'admin','2020-02-15 19:26:54','402855816f35ac13016f35ce9169001b','dianwei@163.com',NULL,'127.0.0.1','典韦','2020-07-11 13:01:52',NULL,'14d033ef4c0f62698bfe5c2c62d24bbd','18088888882','',NULL,'9abdbf','0','0','admin','2020-02-15 19:30:05','典韦'),('40283e81704890290170489a989f000b',NULL,'admin','2020-02-15 19:27:36','402855816f35ac13016f35ced093001d','guojia@163.com',NULL,NULL,'郭嘉',NULL,NULL,'a0bfed267ef76cccb2e84e0004c2de36','18088888883','',NULL,'1f0fcf','0','0','admin','2020-02-15 19:29:59','郭嘉'),('40283e8170489029017048a0d993001d',NULL,'admin','2020-02-15 19:34:26','40283e816f7dcf4f016f7ddb08dd001e','liubei@163.com',NULL,'127.0.0.1','刘备','2020-07-11 13:02:15',NULL,'b837d9b9d0b6e2c3a63892d1893103d5','18077777771','',NULL,'21ec3c','0','0','admin','2020-04-22 17:00:08','刘备'),('40283e8170489029017048a2c9610022',NULL,'admin','2020-02-15 19:36:33','40283e816f7dcf4f016f7dde4c710021','guanyu@163.com',NULL,'127.0.0.1','关羽','2020-07-10 16:58:14',NULL,'7e022364f4c638a8556fce09e347b9f3','18077777772','',NULL,'cc41c3','0','0','admin','2020-02-15 19:36:41','关羽'),('40283e8170489029017048a4533b0027',NULL,'admin','2020-02-15 19:38:14','40283e816f92646d016f926c38e4000f','sunjian@163.com',NULL,'127.0.0.1','孙坚','2020-07-11 10:51:07',NULL,'2ee6a6389daec9c00d94e86801048c99','18099999991','',NULL,'8a2f6b','0','0','admin','2020-02-15 19:46:41','孙坚'),('40283e8170489029017048a4f302002a',NULL,'admin','2020-02-15 19:38:55','40283e816f92646d016f926c38e4000f','sunquan@163.com',NULL,'127.0.0.1','孙权','2020-07-11 10:50:20',NULL,'776e22032bcf0eac0496ab9747e6a2a4','18099999992','',NULL,'1a3cd9','0','0','admin','2020-04-22 17:00:02','孙权'),('40283e8170489029017048a63954002d',NULL,'admin','2020-02-15 19:40:18','40283e816f92646d016f926c38e4000f','zhouyu@163.com',NULL,'127.0.0.1','周瑜','2020-07-09 19:30:47',NULL,'3c430eeb3c2d93eb3fdc2b3b4c705408','18099999993','',NULL,'4f0bb3','0','0','周瑜','2020-06-04 10:40:37','周瑜'),('402855816f1e2a2e016f1e2a45af0001','2020/06/08/5c76cbae50cb4fe7371fde4530bf32af.png','system','2019-12-19 20:38:04','402855816f35ac13016f35cc740b0017','daffodil@admin.com','Y','127.0.0.1','admin','2020-07-11 15:18:28',NULL,'ae4bac50de6e62586a336465bb83cdb1','18088888888','超级管理员',NULL,'5b3f96','0','0','admin','2020-02-15 19:18:26','达佛');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_deployment`
--

DROP TABLE IF EXISTS `act_re_deployment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DERIVED_FROM_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DERIVED_FROM_ROOT_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_deployment`
--

LOCK TABLES `act_re_deployment` WRITE;
/*!40000 ALTER TABLE `act_re_deployment` DISABLE KEYS */;
INSERT INTO `act_re_deployment` VALUES ('34f6fbf8-c321-11ea-a804-96e6f7651f71','请假流程','考勤 / 请假申请','AskForLeave','4028b26c73316c440173317049080010','2020-07-11 02:49:57.816',NULL,NULL,NULL,NULL),('5d1410a8-c28b-11ea-b0fd-96e6f7651f71','经理级别-差旅报销','财务 / 差旅报销 / 部门经理级','Expense','4028b26c73316c440173317228b40018','2020-07-10 08:57:20.606',NULL,NULL,NULL,NULL),('e5381dc2-c191-11ea-8e4d-96e6f7651f71','员工级别-报销流程','财务 / 差旅报销 / 普通员工级','Expense2','4028b26c73316c4401733171d2ad0016','2020-07-09 03:11:34.829',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `act_re_deployment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_variable`
--

DROP TABLE IF EXISTS `act_ru_variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_RU_VAR_SCOPE_ID_TYPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_RU_VAR_SUB_ID_TYPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_variable`
--

LOCK TABLES `act_ru_variable` WRITE;
/*!40000 ALTER TABLE `act_ru_variable` DISABLE KEYS */;
INSERT INTO `act_ru_variable` VALUES ('7098cade-c321-11ea-a804-96e6f7651f71',1,'string','updateTime','7098cadc-c321-11ea-a804-96e6f7651f71','7098cadc-c321-11ea-a804-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL),('7098cadf-c321-11ea-a804-96e6f7651f71',1,'string','remark','7098cadc-c321-11ea-a804-96e6f7651f71','7098cadc-c321-11ea-a804-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'没事就是请假怎么地',NULL),('7098cae0-c321-11ea-a804-96e6f7651f71',1,'string','title','7098cadc-c321-11ea-a804-96e6f7651f71','7098cadc-c321-11ea-a804-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'没事就是请假怎么地',NULL),('7098cae1-c321-11ea-a804-96e6f7651f71',1,'string','deployId','7098cadc-c321-11ea-a804-96e6f7651f71','7098cadc-c321-11ea-a804-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'34f6fbf8-c321-11ea-a804-96e6f7651f71',NULL),('7098cae2-c321-11ea-a804-96e6f7651f71',1,'string','flowName','7098cadc-c321-11ea-a804-96e6f7651f71','7098cadc-c321-11ea-a804-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'没事就是请假怎么地',NULL),('7098cae3-c321-11ea-a804-96e6f7651f71',1,'string','modelKey','7098cadc-c321-11ea-a804-96e6f7651f71','7098cadc-c321-11ea-a804-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'AskForLeave',NULL),('7098cae4-c321-11ea-a804-96e6f7651f71',1,'string','createBy','7098cadc-c321-11ea-a804-96e6f7651f71','7098cadc-c321-11ea-a804-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'孙坚',NULL),('7098cae5-c321-11ea-a804-96e6f7651f71',1,'string','leaveDays','7098cadc-c321-11ea-a804-96e6f7651f71','7098cadc-c321-11ea-a804-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'7',NULL),('7098cae6-c321-11ea-a804-96e6f7651f71',1,'string','createTime','7098cadc-c321-11ea-a804-96e6f7651f71','7098cadc-c321-11ea-a804-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-07-11 10:51:37',NULL),('7098cae7-c321-11ea-a804-96e6f7651f71',1,'string','updateBy','7098cadc-c321-11ea-a804-96e6f7651f71','7098cadc-c321-11ea-a804-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL),('7098cae8-c321-11ea-a804-96e6f7651f71',1,'string','callbackId','7098cadc-c321-11ea-a804-96e6f7651f71','7098cadc-c321-11ea-a804-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'submitExpenseAccount',NULL),('7098cae9-c321-11ea-a804-96e6f7651f71',1,'string','businessKey','7098cadc-c321-11ea-a804-96e6f7651f71','7098cadc-c321-11ea-a804-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c733bb8d701733bc90997007a',NULL),('7098caea-c321-11ea-a804-96e6f7651f71',1,'string','id','7098cadc-c321-11ea-a804-96e6f7651f71','7098cadc-c321-11ea-a804-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c733bb8d701733bc90997007a',NULL),('7098caeb-c321-11ea-a804-96e6f7651f71',1,'string','flowTypeId','7098cadc-c321-11ea-a804-96e6f7651f71','7098cadc-c321-11ea-a804-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c73316c440173317049080010',NULL),('7098caec-c321-11ea-a804-96e6f7651f71',1,'string','callbackType','7098cadc-c321-11ea-a804-96e6f7651f71','7098cadc-c321-11ea-a804-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'JQueryFunction',NULL),('7f1335d1-c1dd-11ea-8c2f-96e6f7651f71',1,'string','updateTime','7f12e7af-c1dd-11ea-8c2f-96e6f7651f71','7f12e7af-c1dd-11ea-8c2f-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL),('7f1335d2-c1dd-11ea-8c2f-96e6f7651f71',1,'string','remark','7f12e7af-c1dd-11ea-8c2f-96e6f7651f71','7f12e7af-c1dd-11ea-8c2f-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'第五次报销流程测试',NULL),('7f1335d3-c1dd-11ea-8c2f-96e6f7651f71',1,'string','title','7f12e7af-c1dd-11ea-8c2f-96e6f7651f71','7f12e7af-c1dd-11ea-8c2f-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'第五次报销流程测试',NULL),('7f1335d4-c1dd-11ea-8c2f-96e6f7651f71',1,'string','deployId','7f12e7af-c1dd-11ea-8c2f-96e6f7651f71','7f12e7af-c1dd-11ea-8c2f-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'e5381dc2-c191-11ea-8e4d-96e6f7651f71',NULL),('7f1335d5-c1dd-11ea-8c2f-96e6f7651f71',1,'string','content','7f12e7af-c1dd-11ea-8c2f-96e6f7651f71','7f12e7af-c1dd-11ea-8c2f-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'第五次报销流程测试',NULL),('7f135ce6-c1dd-11ea-8c2f-96e6f7651f71',1,'string','modelKey','7f12e7af-c1dd-11ea-8c2f-96e6f7651f71','7f12e7af-c1dd-11ea-8c2f-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Expense2',NULL),('7f135ce7-c1dd-11ea-8c2f-96e6f7651f71',1,'string','createBy','7f12e7af-c1dd-11ea-8c2f-96e6f7651f71','7f12e7af-c1dd-11ea-8c2f-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'典韦',NULL),('7f135ce8-c1dd-11ea-8c2f-96e6f7651f71',1,'string','money','7f12e7af-c1dd-11ea-8c2f-96e6f7651f71','7f12e7af-c1dd-11ea-8c2f-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'500',NULL),('7f135ce9-c1dd-11ea-8c2f-96e6f7651f71',1,'string','createTime','7f12e7af-c1dd-11ea-8c2f-96e6f7651f71','7f12e7af-c1dd-11ea-8c2f-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-07-09 20:12:45',NULL),('7f135cea-c1dd-11ea-8c2f-96e6f7651f71',1,'string','updateBy','7f12e7af-c1dd-11ea-8c2f-96e6f7651f71','7f12e7af-c1dd-11ea-8c2f-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL),('7f135ceb-c1dd-11ea-8c2f-96e6f7651f71',1,'string','name','7f12e7af-c1dd-11ea-8c2f-96e6f7651f71','7f12e7af-c1dd-11ea-8c2f-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'第五次报销流程测试',NULL),('7f135cec-c1dd-11ea-8c2f-96e6f7651f71',1,'string','businessKey','7f12e7af-c1dd-11ea-8c2f-96e6f7651f71','7f12e7af-c1dd-11ea-8c2f-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c73337cd70173337e0a7b0000',NULL),('7f135ced-c1dd-11ea-8c2f-96e6f7651f71',1,'string','id','7f12e7af-c1dd-11ea-8c2f-96e6f7651f71','7f12e7af-c1dd-11ea-8c2f-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c73337cd70173337e0a7b0000',NULL),('7f135cee-c1dd-11ea-8c2f-96e6f7651f71',1,'string','flowTypeId','7f12e7af-c1dd-11ea-8c2f-96e6f7651f71','7f12e7af-c1dd-11ea-8c2f-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016',NULL),('9f9731fe-c28b-11ea-b0fd-96e6f7651f71',1,'string','updateTime','9f9731fc-c28b-11ea-b0fd-96e6f7651f71','9f9731fc-c28b-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL),('9f9731ff-c28b-11ea-b0fd-96e6f7651f71',1,'string','remark','9f9731fc-c28b-11ea-b0fd-96e6f7651f71','9f9731fc-c28b-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'第一次部门经理级流程测试',NULL),('9f973200-c28b-11ea-b0fd-96e6f7651f71',1,'string','title','9f9731fc-c28b-11ea-b0fd-96e6f7651f71','9f9731fc-c28b-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'第一次部门经理级流程测试',NULL),('9f973201-c28b-11ea-b0fd-96e6f7651f71',1,'string','deployId','9f9731fc-c28b-11ea-b0fd-96e6f7651f71','9f9731fc-c28b-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'5d1410a8-c28b-11ea-b0fd-96e6f7651f71',NULL),('9f973202-c28b-11ea-b0fd-96e6f7651f71',1,'string','content','9f9731fc-c28b-11ea-b0fd-96e6f7651f71','9f9731fc-c28b-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'第一次部门经理级流程测试',NULL),('9f973203-c28b-11ea-b0fd-96e6f7651f71',1,'string','modelKey','9f9731fc-c28b-11ea-b0fd-96e6f7651f71','9f9731fc-c28b-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Expense',NULL),('9f973204-c28b-11ea-b0fd-96e6f7651f71',1,'string','modelName','9f9731fc-c28b-11ea-b0fd-96e6f7651f71','9f9731fc-c28b-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'第一次部门经理级流程测试',NULL),('9f973205-c28b-11ea-b0fd-96e6f7651f71',1,'string','createBy','9f9731fc-c28b-11ea-b0fd-96e6f7651f71','9f9731fc-c28b-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'关羽',NULL),('9f975916-c28b-11ea-b0fd-96e6f7651f71',1,'string','money','9f9731fc-c28b-11ea-b0fd-96e6f7651f71','9f9731fc-c28b-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'600',NULL),('9f975917-c28b-11ea-b0fd-96e6f7651f71',1,'string','createTime','9f9731fc-c28b-11ea-b0fd-96e6f7651f71','9f9731fc-c28b-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-07-10 16:59:12',NULL),('9f975918-c28b-11ea-b0fd-96e6f7651f71',1,'string','updateBy','9f9731fc-c28b-11ea-b0fd-96e6f7651f71','9f9731fc-c28b-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL),('9f975919-c28b-11ea-b0fd-96e6f7651f71',1,'string','businessKey','9f9731fc-c28b-11ea-b0fd-96e6f7651f71','9f9731fc-c28b-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c7337bcae017337f3337b0013',NULL),('9f97591a-c28b-11ea-b0fd-96e6f7651f71',1,'string','id','9f9731fc-c28b-11ea-b0fd-96e6f7651f71','9f9731fc-c28b-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c7337bcae017337f3337b0013',NULL),('9f97591b-c28b-11ea-b0fd-96e6f7651f71',1,'string','flowTypeId','9f9731fc-c28b-11ea-b0fd-96e6f7651f71','9f9731fc-c28b-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c73316c440173317228b40018',NULL),('caafc5b7-c323-11ea-a804-96e6f7651f71',1,'string','outcome','caba6266-c286-11ea-b0fd-96e6f7651f71','caba6266-c286-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'退回',NULL),('caba6268-c286-11ea-b0fd-96e6f7651f71',1,'string','updateTime','caba6266-c286-11ea-b0fd-96e6f7651f71','caba6266-c286-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL),('caba6269-c286-11ea-b0fd-96e6f7651f71',1,'string','remark','caba6266-c286-11ea-b0fd-96e6f7651f71','caba6266-c286-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'第十一次报销流程测试',NULL),('caba626a-c286-11ea-b0fd-96e6f7651f71',1,'string','title','caba6266-c286-11ea-b0fd-96e6f7651f71','caba6266-c286-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'第十一次报销流程测试',NULL),('caba626b-c286-11ea-b0fd-96e6f7651f71',1,'string','deployId','caba6266-c286-11ea-b0fd-96e6f7651f71','caba6266-c286-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'e5381dc2-c191-11ea-8e4d-96e6f7651f71',NULL),('caba626c-c286-11ea-b0fd-96e6f7651f71',1,'string','content','caba6266-c286-11ea-b0fd-96e6f7651f71','caba6266-c286-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'第十一次报销流程测试',NULL),('caba626d-c286-11ea-b0fd-96e6f7651f71',1,'string','modelKey','caba6266-c286-11ea-b0fd-96e6f7651f71','caba6266-c286-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Expense2',NULL),('caba626e-c286-11ea-b0fd-96e6f7651f71',1,'string','modelName','caba6266-c286-11ea-b0fd-96e6f7651f71','caba6266-c286-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'员工级别-报销流程',NULL),('caba626f-c286-11ea-b0fd-96e6f7651f71',1,'string','createBy','caba6266-c286-11ea-b0fd-96e6f7651f71','caba6266-c286-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'典韦',NULL),('caba8980-c286-11ea-b0fd-96e6f7651f71',1,'string','money','caba6266-c286-11ea-b0fd-96e6f7651f71','caba6266-c286-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'11000',NULL),('caba8981-c286-11ea-b0fd-96e6f7651f71',1,'string','createTime','caba6266-c286-11ea-b0fd-96e6f7651f71','caba6266-c286-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-07-10 16:24:37',NULL),('caba8982-c286-11ea-b0fd-96e6f7651f71',1,'string','updateBy','caba6266-c286-11ea-b0fd-96e6f7651f71','caba6266-c286-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL),('caba8983-c286-11ea-b0fd-96e6f7651f71',1,'string','businessKey','caba6266-c286-11ea-b0fd-96e6f7651f71','caba6266-c286-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c7337bcae017337d389c20008',NULL),('caba8984-c286-11ea-b0fd-96e6f7651f71',1,'string','id','caba6266-c286-11ea-b0fd-96e6f7651f71','caba6266-c286-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c7337bcae017337d389c20008',NULL),('caba8985-c286-11ea-b0fd-96e6f7651f71',1,'string','flowTypeId','caba6266-c286-11ea-b0fd-96e6f7651f71','caba6266-c286-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016',NULL),('cb78898f-c283-11ea-b0fd-96e6f7651f71',1,'string','updateTime','cb78627d-c283-11ea-b0fd-96e6f7651f71','cb78627d-c283-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL),('cb788990-c283-11ea-b0fd-96e6f7651f71',1,'string','remark','cb78627d-c283-11ea-b0fd-96e6f7651f71','cb78627d-c283-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'第十次报销流程测试',NULL),('cb788991-c283-11ea-b0fd-96e6f7651f71',1,'string','title','cb78627d-c283-11ea-b0fd-96e6f7651f71','cb78627d-c283-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'第十次报销流程测试',NULL),('cb788992-c283-11ea-b0fd-96e6f7651f71',1,'string','deployId','cb78627d-c283-11ea-b0fd-96e6f7651f71','cb78627d-c283-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'e5381dc2-c191-11ea-8e4d-96e6f7651f71',NULL),('cb788993-c283-11ea-b0fd-96e6f7651f71',1,'string','content','cb78627d-c283-11ea-b0fd-96e6f7651f71','cb78627d-c283-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'第十次报销流程测试',NULL),('cb788994-c283-11ea-b0fd-96e6f7651f71',1,'string','modelKey','cb78627d-c283-11ea-b0fd-96e6f7651f71','cb78627d-c283-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Expense2',NULL),('cb788995-c283-11ea-b0fd-96e6f7651f71',1,'string','createBy','cb78627d-c283-11ea-b0fd-96e6f7651f71','cb78627d-c283-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'典韦',NULL),('cb788996-c283-11ea-b0fd-96e6f7651f71',1,'string','money','cb78627d-c283-11ea-b0fd-96e6f7651f71','cb78627d-c283-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'10000',NULL),('cb788997-c283-11ea-b0fd-96e6f7651f71',1,'string','createTime','cb78627d-c283-11ea-b0fd-96e6f7651f71','cb78627d-c283-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-07-10 16:03:09',NULL),('cb788998-c283-11ea-b0fd-96e6f7651f71',1,'string','updateBy','cb78627d-c283-11ea-b0fd-96e6f7651f71','cb78627d-c283-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL),('cb78b0a9-c283-11ea-b0fd-96e6f7651f71',1,'string','name','cb78627d-c283-11ea-b0fd-96e6f7651f71','cb78627d-c283-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'第十次报销流程测试',NULL),('cb78b0aa-c283-11ea-b0fd-96e6f7651f71',1,'string','businessKey','cb78627d-c283-11ea-b0fd-96e6f7651f71','cb78627d-c283-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c7337bcae017337bfe56f0001',NULL),('cb78b0ab-c283-11ea-b0fd-96e6f7651f71',1,'string','id','cb78627d-c283-11ea-b0fd-96e6f7651f71','cb78627d-c283-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c7337bcae017337bfe56f0001',NULL),('cb78b0ac-c283-11ea-b0fd-96e6f7651f71',1,'string','flowTypeId','cb78627d-c283-11ea-b0fd-96e6f7651f71','cb78627d-c283-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016',NULL),('d2a7ede2-c27e-11ea-8dcf-96e6f7651f71',1,'string','updateTime','d2a7ede0-c27e-11ea-8dcf-96e6f7651f71','d2a7ede0-c27e-11ea-8dcf-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL),('d2a7ede3-c27e-11ea-8dcf-96e6f7651f71',1,'string','remark','d2a7ede0-c27e-11ea-8dcf-96e6f7651f71','d2a7ede0-c27e-11ea-8dcf-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'第九次报销流程测试',NULL),('d2a7ede4-c27e-11ea-8dcf-96e6f7651f71',1,'string','title','d2a7ede0-c27e-11ea-8dcf-96e6f7651f71','d2a7ede0-c27e-11ea-8dcf-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'第九次报销流程测试',NULL),('d2a7ede5-c27e-11ea-8dcf-96e6f7651f71',1,'string','deployId','d2a7ede0-c27e-11ea-8dcf-96e6f7651f71','d2a7ede0-c27e-11ea-8dcf-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'e5381dc2-c191-11ea-8e4d-96e6f7651f71',NULL),('d2a7ede6-c27e-11ea-8dcf-96e6f7651f71',1,'string','content','d2a7ede0-c27e-11ea-8dcf-96e6f7651f71','d2a7ede0-c27e-11ea-8dcf-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'第九次报销流程测试',NULL),('d2a7ede7-c27e-11ea-8dcf-96e6f7651f71',1,'string','modelKey','d2a7ede0-c27e-11ea-8dcf-96e6f7651f71','d2a7ede0-c27e-11ea-8dcf-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Expense2',NULL),('d2a7ede8-c27e-11ea-8dcf-96e6f7651f71',1,'string','createBy','d2a7ede0-c27e-11ea-8dcf-96e6f7651f71','d2a7ede0-c27e-11ea-8dcf-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'典韦',NULL),('d2a7ede9-c27e-11ea-8dcf-96e6f7651f71',1,'string','money','d2a7ede0-c27e-11ea-8dcf-96e6f7651f71','d2a7ede0-c27e-11ea-8dcf-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'900',NULL),('d2a7edea-c27e-11ea-8dcf-96e6f7651f71',1,'string','createTime','d2a7ede0-c27e-11ea-8dcf-96e6f7651f71','d2a7ede0-c27e-11ea-8dcf-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-07-10 15:27:34',NULL),('d2a7edeb-c27e-11ea-8dcf-96e6f7651f71',1,'string','updateBy','d2a7ede0-c27e-11ea-8dcf-96e6f7651f71','d2a7ede0-c27e-11ea-8dcf-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL),('d2a7edec-c27e-11ea-8dcf-96e6f7651f71',1,'string','name','d2a7ede0-c27e-11ea-8dcf-96e6f7651f71','d2a7ede0-c27e-11ea-8dcf-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'第九次报销流程测试',NULL),('d2a7eded-c27e-11ea-8dcf-96e6f7651f71',1,'string','businessKey','d2a7ede0-c27e-11ea-8dcf-96e6f7651f71','d2a7ede0-c27e-11ea-8dcf-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c73376dde0173379f4fee000f',NULL),('d2a7edee-c27e-11ea-8dcf-96e6f7651f71',1,'string','id','d2a7ede0-c27e-11ea-8dcf-96e6f7651f71','d2a7ede0-c27e-11ea-8dcf-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c73376dde0173379f4fee000f',NULL),('d2a7edef-c27e-11ea-8dcf-96e6f7651f71',1,'string','flowTypeId','d2a7ede0-c27e-11ea-8dcf-96e6f7651f71','d2a7ede0-c27e-11ea-8dcf-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016',NULL);
/*!40000 ALTER TABLE `act_ru_variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_procdef_info`
--

DROP TABLE IF EXISTS `act_procdef_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_procdef_info`
--

LOCK TABLES `act_procdef_info` WRITE;
/*!40000 ALTER TABLE `act_procdef_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_procdef_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_identitylink`
--

DROP TABLE IF EXISTS `act_ru_identitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_IDENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_IDENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_identitylink`
--

LOCK TABLES `act_ru_identitylink` WRITE;
/*!40000 ALTER TABLE `act_ru_identitylink` DISABLE KEYS */;
INSERT INTO `act_ru_identitylink` VALUES ('0dabcbe9-c1e7-11ea-8f09-96e6f7651f71',1,NULL,'participant','典韦',NULL,'7f12e7af-c1dd-11ea-8c2f-96e6f7651f71',NULL,NULL,NULL,NULL),('0daf274c-c1e7-11ea-8f09-96e6f7651f71',1,'40283e816f92646d016f92705173001a','candidate',NULL,'0daf274b-c1e7-11ea-8f09-96e6f7651f71',NULL,NULL,NULL,NULL,NULL),('0db5de0e-c1e7-11ea-8f09-96e6f7651f71',1,NULL,'participant','刘备',NULL,'7f12e7af-c1dd-11ea-8c2f-96e6f7651f71',NULL,NULL,NULL,NULL),('1602b86f-c323-11ea-a804-96e6f7651f71',1,NULL,'participant','典韦',NULL,'cb78627d-c283-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL),('160354b2-c323-11ea-a804-96e6f7651f71',1,'40283e816f92646d016f92705173001a','candidate',NULL,'160354b1-c323-11ea-a804-96e6f7651f71',NULL,NULL,NULL,NULL,NULL),('16077364-c323-11ea-a804-96e6f7651f71',1,NULL,'participant','刘备',NULL,'cb78627d-c283-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL),('6e2c90a6-c283-11ea-b0fd-96e6f7651f71',1,NULL,'participant','典韦',NULL,'d2a7ede0-c27e-11ea-8dcf-96e6f7651f71',NULL,NULL,NULL,NULL),('6e312489-c283-11ea-b0fd-96e6f7651f71',1,'40283e816f92646d016f92705173001a','candidate',NULL,'6e30fd78-c283-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL,NULL),('6e38778b-c283-11ea-b0fd-96e6f7651f71',1,NULL,'participant','曹操',NULL,'d2a7ede0-c27e-11ea-8dcf-96e6f7651f71',NULL,NULL,NULL,NULL),('7098cadd-c321-11ea-a804-96e6f7651f71',1,NULL,'starter','孙坚',NULL,'7098cadc-c321-11ea-a804-96e6f7651f71',NULL,NULL,NULL,NULL),('7098f202-c321-11ea-a804-96e6f7651f71',1,NULL,'participant','$INITIATOR',NULL,'7098cadc-c321-11ea-a804-96e6f7651f71',NULL,NULL,NULL,NULL),('709ff6e4-c321-11ea-a804-96e6f7651f71',1,NULL,'participant','孙坚',NULL,'7098cadc-c321-11ea-a804-96e6f7651f71',NULL,NULL,NULL,NULL),('7f12e7b0-c1dd-11ea-8c2f-96e6f7651f71',1,NULL,'starter','典韦',NULL,'7f12e7af-c1dd-11ea-8c2f-96e6f7651f71',NULL,NULL,NULL,NULL),('7f164324-c1dd-11ea-8c2f-96e6f7651f71',1,NULL,'participant','$INITIATOR',NULL,'7f12e7af-c1dd-11ea-8c2f-96e6f7651f71',NULL,NULL,NULL,NULL),('7f22ed56-c1dd-11ea-8c2f-96e6f7651f71',1,NULL,'participant','典韦',NULL,'7f12e7af-c1dd-11ea-8c2f-96e6f7651f71',NULL,NULL,NULL,NULL),('81f3b1c7-c321-11ea-a804-96e6f7651f71',1,NULL,'participant','孙坚',NULL,'7098cadc-c321-11ea-a804-96e6f7651f71',NULL,NULL,NULL,NULL),('81f426fa-c321-11ea-a804-96e6f7651f71',1,'40283e816f92646d016f92705173001a','candidate',NULL,'81f426f9-c321-11ea-a804-96e6f7651f71',NULL,NULL,NULL,NULL,NULL),('81f893cc-c321-11ea-a804-96e6f7651f71',1,NULL,'participant','刘备',NULL,'7098cadc-c321-11ea-a804-96e6f7651f71',NULL,NULL,NULL,NULL),('9f9731fd-c28b-11ea-b0fd-96e6f7651f71',1,NULL,'starter','关羽',NULL,'9f9731fc-c28b-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL),('9f975921-c28b-11ea-b0fd-96e6f7651f71',1,NULL,'participant','$INITIATOR',NULL,'9f9731fc-c28b-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL),('9f9d2583-c28b-11ea-b0fd-96e6f7651f71',1,NULL,'participant','关羽',NULL,'9f9731fc-c28b-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL),('b11fb896-c28b-11ea-b0fd-96e6f7651f71',1,NULL,'participant','关羽',NULL,'9f9731fc-c28b-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL),('b12006ba-c28b-11ea-b0fd-96e6f7651f71',1,'402855816f1e2a2e016f1e2a45510000','candidate',NULL,'b12006b9-c28b-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL,NULL),('b12313fc-c28b-11ea-b0fd-96e6f7651f71',1,NULL,'participant','admin',NULL,'9f9731fc-c28b-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL),('caafc5b8-c323-11ea-a804-96e6f7651f71',1,NULL,'participant','刘备',NULL,'caba6266-c286-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL),('caba6267-c286-11ea-b0fd-96e6f7651f71',1,NULL,'starter','典韦',NULL,'caba6266-c286-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL),('caba898b-c286-11ea-b0fd-96e6f7651f71',1,NULL,'participant','$INITIATOR',NULL,'caba6266-c286-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL),('cabf6b8d-c286-11ea-b0fd-96e6f7651f71',1,NULL,'participant','典韦',NULL,'caba6266-c286-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL),('cb78898e-c283-11ea-b0fd-96e6f7651f71',1,NULL,'starter','典韦',NULL,'cb78627d-c283-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL),('cb78b0b2-c283-11ea-b0fd-96e6f7651f71',1,NULL,'participant','$INITIATOR',NULL,'cb78627d-c283-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL),('cb7ecb34-c283-11ea-b0fd-96e6f7651f71',1,NULL,'participant','典韦',NULL,'cb78627d-c283-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL),('d2a7ede1-c27e-11ea-8dcf-96e6f7651f71',1,NULL,'starter','典韦',NULL,'d2a7ede0-c27e-11ea-8dcf-96e6f7651f71',NULL,NULL,NULL,NULL),('d2a81505-c27e-11ea-8dcf-96e6f7651f71',1,NULL,'participant','$INITIATOR',NULL,'d2a7ede0-c27e-11ea-8dcf-96e6f7651f71',NULL,NULL,NULL,NULL),('d2ad6c37-c27e-11ea-8dcf-96e6f7651f71',1,NULL,'participant','典韦',NULL,'d2a7ede0-c27e-11ea-8dcf-96e6f7651f71',NULL,NULL,NULL,NULL),('dfae0070-c286-11ea-b0fd-96e6f7651f71',1,NULL,'participant','典韦',NULL,'caba6266-c286-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL),('dfb1d105-c286-11ea-b0fd-96e6f7651f71',1,NULL,'participant','刘备',NULL,'caba6266-c286-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `act_ru_identitylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dictionary`
--

DROP TABLE IF EXISTS `sys_dictionary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dictionary` (
  `dict_id` varchar(255) NOT NULL,
  `dict_name` varchar(255) DEFAULT NULL,
  `dict_type` varchar(255) DEFAULT NULL,
  `dict_label` varchar(255) DEFAULT NULL,
  `dict_value` varchar(255) DEFAULT NULL,
  `is_default` varchar(10) DEFAULT NULL,
  `order_num` bigint(20) DEFAULT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `ancestors` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`dict_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dictionary`
--

LOCK TABLES `sys_dictionary` WRITE;
/*!40000 ALTER TABLE `sys_dictionary` DISABLE KEYS */;
INSERT INTO `sys_dictionary` VALUES ('04dd93d28f1540eb83186209ac721037','PC端','dictionary','','1','Y',1,'ddfbc54298134a6e8e1c61100f5e6453','root,ddfbc54298134a6e8e1c61100f5e6453','',NULL,NULL,'admin','2020-03-18 15:56:47','0'),('0682885ad8144601806f118278bf4b0b','正常','dictionary','','0','Y',1,'dca26407442443b1a7c49a38a8eac93f','root,dca26407442443b1a7c49a38a8eac93f','',NULL,NULL,'admin','2020-03-18 10:41:12','0'),('0b0f4ecbca8c45e38210c71d6e8c2e9f','其他','dictionary','','0','N',0,'ddfbc54298134a6e8e1c61100f5e6453','root,ddfbc54298134a6e8e1c61100f5e6453','',NULL,NULL,'admin','2020-03-18 15:56:23','0'),('0e4ad1b471d0459b8de904ac487116d8','删除','dictionary','','3','N',3,'5c3cd4b16d0b4dc28c2cea11629230c9',',root,5c3cd4b16d0b4dc28c2cea11629230c9','',NULL,NULL,'admin','2020-03-18 10:30:10','0'),('1f5255985c374d64920f2bda198ced58','成功','dictionary','','0','Y',1,'4ae041232b854064bbd574bfb2cc4bd0',',root,4ae041232b854064bbd574bfb2cc4bd0','','admin','2020-04-24 09:39:16','admin','2020-03-18 09:46:08','0'),('1f77b35a233f4819baea460b84cd3036','新增','dictionary','','1','N',1,'5c3cd4b16d0b4dc28c2cea11629230c9',',root,5c3cd4b16d0b4dc28c2cea11629230c9','','admin','2020-03-18 10:29:18','admin','2020-03-18 09:55:32','0'),('2da4d568038f482dba7753492d18f974','删除','dictionary','','2','N',3,'dca26407442443b1a7c49a38a8eac93f','root,dca26407442443b1a7c49a38a8eac93f','',NULL,NULL,'admin','2020-03-18 10:41:39','0'),('320ad502da6746988a7d2d43f8a7b34d','目录','dictionary','','catalog','Y',1,'ec9fb496e40e4ae5bd422d65e30577e3',',root,ec9fb496e40e4ae5bd422d65e30577e3','',NULL,NULL,'admin','2020-03-18 10:51:54','0'),('34b1eab26685480a8d5a93aeaf79affd','导入','dictionary','','6','N',6,'5c3cd4b16d0b4dc28c2cea11629230c9',',root,5c3cd4b16d0b4dc28c2cea11629230c9','',NULL,NULL,'admin','2020-03-18 10:30:42','0'),('39bcc5e71b154d79bf8c91ef4e7f5ff4','失败','dictionary','','1','N',2,'4ae041232b854064bbd574bfb2cc4bd0',',root,4ae041232b854064bbd574bfb2cc4bd0','','admin','2020-03-18 10:29:07','admin','2020-03-18 09:46:21','0'),('3efbf0f7037f4d05ace7c07a58864acd','隐藏','dictionary','','1','N',2,'4b332d745d7c4555a988676fb627138f','root,4b332d745d7c4555a988676fb627138f','',NULL,NULL,'admin','2020-03-18 10:43:00','0'),('4028b2ec72a1fb980172a1fd2c400000','商城平台','catalog','mall_shop_dict','','Y',12,'root',',root','','admin','2020-06-11 16:49:14','admin','2020-06-11 14:07:03','0'),('4028b2ec72a1fb980172a1fdc7090002','轮播图位置','catalog','mall_img_position','','Y',1,'4028b2ec72a1fb980172a1fd2c400000',',root,4028b2ec72a1fb980172a1fd2c400000','','admin','2020-06-11 14:08:16','admin','2020-06-11 14:07:43','0'),('4028b2ec72a1fb980172a1fe8bae0009','首页','dictionary','','index','Y',1,'4028b2ec72a1fb980172a1fdc7090002',',root,4028b2ec72a1fb980172a1fd2c400000,4028b2ec72a1fb980172a1fdc7090002','',NULL,NULL,'admin','2020-06-11 14:08:33','0'),('4028b2ec72a1fb980172a1fed99e000b','个人中心','dictionary','','userinfo','N',2,'4028b2ec72a1fb980172a1fdc7090002',',root,4028b2ec72a1fb980172a1fd2c400000,4028b2ec72a1fb980172a1fdc7090002','','admin','2020-06-11 14:09:03','admin','2020-06-11 14:08:53','0'),('4028b2ec72a1fb980172a1ffe585000e','编辑状态','catalog','mall_edit_status','','Y',2,'4028b2ec72a1fb980172a1fd2c400000',',root,4028b2ec72a1fb980172a1fd2c400000','',NULL,NULL,'admin','2020-06-11 14:10:02','0'),('4028b2ec72a1fb980172a20029a90010','新稿','dictionary','','1','Y',1,'4028b2ec72a1fb980172a1ffe585000e',',root,4028b2ec72a1fb980172a1fd2c400000,4028b2ec72a1fb980172a1ffe585000e','','admin','2020-06-11 14:11:19','admin','2020-06-11 14:10:19','0'),('4028b2ec72a1fb980172a2006af10012','发布','dictionary','','2','Y',2,'4028b2ec72a1fb980172a1ffe585000e',',root,4028b2ec72a1fb980172a1fd2c400000,4028b2ec72a1fb980172a1ffe585000e','',NULL,NULL,'admin','2020-06-11 14:10:36','0'),('4028b2ec72a1fb980172a200b46d0014','撤回','dictionary','','3','N',3,'4028b2ec72a1fb980172a1ffe585000e',',root,4028b2ec72a1fb980172a1fd2c400000,4028b2ec72a1fb980172a1ffe585000e','','admin','2020-06-11 17:02:28','admin','2020-06-11 14:10:55','0'),('4028b2ec72a264320172a271f2de0021','商品目录','dictionary','','shopcatalog','Y',3,'4028b2ec72a1fb980172a1fdc7090002',',root,4028b2ec72a1fb980172a1fd2c400000,4028b2ec72a1fb980172a1fdc7090002','','admin','2020-06-11 16:47:45','admin','2020-06-11 16:14:36','0'),('41fe59dd732a45fc85868f243fa08278','新稿','dictionary','','0','Y',1,'6a794ac896e64e9daf58e0501d75587c','root,6a794ac896e64e9daf58e0501d75587c','','admin','2020-03-18 10:35:31','admin','2020-03-18 10:34:48','0'),('42c45e85e62f47f4a86d4e1a0c96a2f9','目录','dictionary','','catalog','Y',1,'72cf3e936c0e44fa8dc45b4defb2d614',',root,72cf3e936c0e44fa8dc45b4defb2d614','',NULL,NULL,'admin','2020-03-18 10:45:44','0'),('4982bb49add744ccbfae5117c886e15e','未知','dictionary','','2','N',3,'e824488f1d4643529b046e5c6ca23cc9',',root,e824488f1d4643529b046e5c6ca23cc9','',NULL,NULL,'admin','2020-03-18 10:44:36','0'),('4ae041232b854064bbd574bfb2cc4bd0','系统状态','catalog','sys_success_status','','Y',1,'root',',root','','admin','2020-04-24 09:39:34','admin','2020-03-18 09:37:12','0'),('4b332d745d7c4555a988676fb627138f','菜单状态','catalog','sys_show_hide','','N',7,'root','root','',NULL,NULL,'admin','2020-03-18 10:42:05','0'),('4d5ed6e3511a46a2a8e75cef381e37ef','清空','dictionary','','9','N',9,'5c3cd4b16d0b4dc28c2cea11629230c9',',root,5c3cd4b16d0b4dc28c2cea11629230c9','',NULL,NULL,'admin','2020-03-18 10:31:05','0'),('52bacdd6a0624e57a6a09c4098dd355b','男','dictionary','','0','Y',1,'e824488f1d4643529b046e5c6ca23cc9',',root,e824488f1d4643529b046e5c6ca23cc9','',NULL,NULL,'admin','2020-03-18 10:44:08','0'),('5a6faf23a96948ac9a5877b9cbd52b50','修改','dictionary','','2','N',2,'5c3cd4b16d0b4dc28c2cea11629230c9',',root,5c3cd4b16d0b4dc28c2cea11629230c9','',NULL,NULL,'admin','2020-03-18 10:29:56','0'),('5c3cd4b16d0b4dc28c2cea11629230c9','操作类型','catalog','sys_business_type','','Y',2,'root',',root','','admin','2020-03-18 15:53:14','admin','2020-03-18 09:43:13','0'),('64fdac8643d54d45b32e5016955a9ca8','发布','dictionary','','1','N',2,'6a794ac896e64e9daf58e0501d75587c','root,6a794ac896e64e9daf58e0501d75587c','',NULL,NULL,'admin','2020-03-18 10:35:56','0'),('6a794ac896e64e9daf58e0501d75587c','通知状态','catalog','sys_notice_status','','N',3,'root','root','',NULL,NULL,'admin','2020-03-18 10:32:02','0'),('71dcbce5601f4d6da76611af40ed34ef','否','dictionary','','N','N',2,'9d77ae358e4b4f98b5fd26e92b326840','root,9d77ae358e4b4f98b5fd26e92b326840','',NULL,NULL,'admin','2020-03-18 10:40:25','0'),('72cf3e936c0e44fa8dc45b4defb2d614','菜单类型','catalog','sys_menu_type','','N',8,'root',',root','','admin','2020-03-18 10:45:17','admin','2020-03-18 10:44:57','0'),('7b76d93f8cdb4bd89602af52318c873c','菜单','dictionary','','menu','N',2,'72cf3e936c0e44fa8dc45b4defb2d614',',root,72cf3e936c0e44fa8dc45b4defb2d614','',NULL,NULL,'admin','2020-03-18 10:45:58','0'),('826445d6cf4441bb99f18ac661c4e436','是','dictionary','','Y','Y',1,'9d77ae358e4b4f98b5fd26e92b326840','root,9d77ae358e4b4f98b5fd26e92b326840','',NULL,NULL,'admin','2020-03-18 10:40:09','0'),('868b2d9ab6eb4c27a21c50ce728634c9','字典','dictionary','','dictionary','N',2,'ec9fb496e40e4ae5bd422d65e30577e3',',root,ec9fb496e40e4ae5bd422d65e30577e3','',NULL,NULL,'admin','2020-03-18 10:52:24','0'),('8abb25c2138d4e58ad785e9c266042d7','女','dictionary','','1','N',2,'e824488f1d4643529b046e5c6ca23cc9',',root,e824488f1d4643529b046e5c6ca23cc9','',NULL,NULL,'admin','2020-03-18 10:44:20','0'),('9d77ae358e4b4f98b5fd26e92b326840','系统是否','catalog','sys_yes_no','','N',5,'root','root','',NULL,NULL,'admin','2020-03-18 10:39:40','0'),('a160ed2405fa482784a985078310b21d','通知公告','dictionary','','1','Y',1,'ddd7ef5169d54afd962662d05984c4eb','root,ddd7ef5169d54afd962662d05984c4eb','','admin','2020-03-18 10:39:03','admin','2020-03-18 10:38:07','0'),('b0c9bc34ebf342eca6b1db948462d6a9','显示','dictionary','','0','Y',1,'4b332d745d7c4555a988676fb627138f','root,4b332d745d7c4555a988676fb627138f','',NULL,NULL,'admin','2020-03-18 10:42:46','0'),('c5e3c2d24a324f0fa7ed0465c9112d5f','APP端','dictionary','','3','N',3,'ddfbc54298134a6e8e1c61100f5e6453','root,ddfbc54298134a6e8e1c61100f5e6453','',NULL,NULL,'admin','2020-03-18 15:57:21','0'),('d2b0c204de5d4723af26ed0e0b9a4e2b','强退','dictionary','','7','N',7,'5c3cd4b16d0b4dc28c2cea11629230c9',',root,5c3cd4b16d0b4dc28c2cea11629230c9','',NULL,NULL,'admin','2020-03-18 10:30:49','0'),('dca26407442443b1a7c49a38a8eac93f','数据状态','catalog','sys_data_status','','N',6,'root','root','',NULL,NULL,'admin','2020-03-18 10:40:45','0'),('ddd7ef5169d54afd962662d05984c4eb','通知类型','catalog','sys_notice_type','','N',4,'root','root','',NULL,NULL,'admin','2020-03-18 10:37:48','0'),('ddfbc54298134a6e8e1c61100f5e6453','客户端类型','catalog','sys_client_type','','N',11,'root','root','',NULL,NULL,'admin','2020-03-18 15:55:51','0'),('e0f1bdc8bb394055a0d856651fc3a58a','按钮','dictionary','','button','N',3,'72cf3e936c0e44fa8dc45b4defb2d614',',root,72cf3e936c0e44fa8dc45b4defb2d614','',NULL,NULL,'admin','2020-03-18 10:46:10','0'),('e4a82e16d6a442e79a6fef81cade175a','其他','dictionary','','0','N',0,'5c3cd4b16d0b4dc28c2cea11629230c9',',root,5c3cd4b16d0b4dc28c2cea11629230c9','',NULL,NULL,'admin','2020-03-18 15:53:32','0'),('e4e8be8843c448fb8069f6df05baa56b','生成','dictionary','','8','N',8,'5c3cd4b16d0b4dc28c2cea11629230c9',',root,5c3cd4b16d0b4dc28c2cea11629230c9','',NULL,NULL,'admin','2020-03-18 10:30:57','0'),('e824488f1d4643529b046e5c6ca23cc9','用户性别','catalog','sys_user_sex','','N',9,'root',',root','','admin','2020-03-18 10:45:06','admin','2020-03-18 10:43:43','0'),('e8a1fbfce6044f78a2d69707bb3849fb','新闻消息','dictionary','','2','N',2,'ddd7ef5169d54afd962662d05984c4eb','root,ddd7ef5169d54afd962662d05984c4eb','','admin','2020-03-18 10:39:14','admin','2020-03-18 10:38:19','0'),('ec9fb496e40e4ae5bd422d65e30577e3','字典类型','catalog','sys_dict_type','','N',10,'root',',root','','admin','2020-03-18 10:53:18','admin','2020-03-18 10:51:37','0'),('eed0134ee8c34bf2b016a5ed7954a440','导出','dictionary','','5','N',5,'5c3cd4b16d0b4dc28c2cea11629230c9',',root,5c3cd4b16d0b4dc28c2cea11629230c9','',NULL,NULL,'admin','2020-03-18 10:30:32','0'),('efa82a97bc0747f69365833115e65dfa','授权','dictionary','','4','N',4,'5c3cd4b16d0b4dc28c2cea11629230c9',',root,5c3cd4b16d0b4dc28c2cea11629230c9','',NULL,NULL,'admin','2020-03-18 10:30:22','0'),('efd3cb2ce5dc407aa9dd6721323f66fc','微信端','dictionary','','2','N',2,'ddfbc54298134a6e8e1c61100f5e6453','root,ddfbc54298134a6e8e1c61100f5e6453','',NULL,NULL,'admin','2020-03-18 15:57:00','0'),('f701324f2b5a4ac6a7fd0d01418669f5','停用','dictionary','','1','N',2,'dca26407442443b1a7c49a38a8eac93f','root,dca26407442443b1a7c49a38a8eac93f','',NULL,NULL,'admin','2020-03-18 10:41:27','0');
/*!40000 ALTER TABLE `sys_dictionary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_de_databasechangeloglock`
--

DROP TABLE IF EXISTS `act_de_databasechangeloglock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_de_databasechangeloglock` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_de_databasechangeloglock`
--

LOCK TABLES `act_de_databasechangeloglock` WRITE;
/*!40000 ALTER TABLE `act_de_databasechangeloglock` DISABLE KEYS */;
INSERT INTO `act_de_databasechangeloglock` VALUES (1,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `act_de_databasechangeloglock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_de_databasechangelog`
--

DROP TABLE IF EXISTS `act_de_databasechangelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_de_databasechangelog` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_de_databasechangelog`
--

LOCK TABLES `act_de_databasechangelog` WRITE;
/*!40000 ALTER TABLE `act_de_databasechangelog` DISABLE KEYS */;
INSERT INTO `act_de_databasechangelog` VALUES ('1','flowable','META-INF/liquibase/flowable-modeler-app-db-changelog.xml','2020-04-24 10:56:28',1,'EXECUTED','8:e70d1d9d3899a734296b2514ccc71501','createTable tableName=ACT_DE_MODEL; createIndex indexName=idx_proc_mod_created, tableName=ACT_DE_MODEL; createTable tableName=ACT_DE_MODEL_HISTORY; createIndex indexName=idx_proc_mod_history_proc, tableName=ACT_DE_MODEL_HISTORY; createTable tableN...','',NULL,'3.6.3',NULL,NULL,'7696988461'),('3','flowable','META-INF/liquibase/flowable-modeler-app-db-changelog.xml','2020-04-24 10:56:28',2,'EXECUTED','8:3a9143bef2e45f2316231cc1369138b6','addColumn tableName=ACT_DE_MODEL; addColumn tableName=ACT_DE_MODEL_HISTORY','',NULL,'3.6.3',NULL,NULL,'7696988461');
/*!40000 ALTER TABLE `act_de_databasechangelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ge_property`
--

DROP TABLE IF EXISTS `act_ge_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ge_property`
--

LOCK TABLES `act_ge_property` WRITE;
/*!40000 ALTER TABLE `act_ge_property` DISABLE KEYS */;
INSERT INTO `act_ge_property` VALUES ('cfg.execution-related-entities-count','true',1),('cfg.task-related-entities-count','true',1),('common.schema.version','6.4.0.0',1),('identitylink.schema.version','6.4.0.0',1),('job.schema.version','6.4.0.0',1),('next.dbid','1',1),('schema.history','create(6.3.2.0)',1),('schema.version','6.4.0.0',1),('task.schema.version','6.4.0.0',1),('variable.schema.version','6.4.0.0',1);
/*!40000 ALTER TABLE `act_ge_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_de_model_history`
--

DROP TABLE IF EXISTS `act_de_model_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_de_model_history` (
  `id` varchar(255) NOT NULL,
  `name` varchar(400) NOT NULL,
  `model_key` varchar(400) NOT NULL,
  `description` varchar(4000) DEFAULT NULL,
  `model_comment` varchar(4000) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `last_updated_by` varchar(255) DEFAULT NULL,
  `removal_date` datetime(6) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `model_editor_json` longtext,
  `model_id` varchar(255) NOT NULL,
  `model_type` int(11) DEFAULT NULL,
  `tenant_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_proc_mod_history_proc` (`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_de_model_history`
--

LOCK TABLES `act_de_model_history` WRITE;
/*!40000 ALTER TABLE `act_de_model_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_de_model_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_suspended_job`
--

DROP TABLE IF EXISTS `act_ru_suspended_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_suspended_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_SUSPENDED_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_SUSPENDED_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
  KEY `ACT_IDX_SJOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_SJOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_SJOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_SUSPENDED_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_suspended_job`
--

LOCK TABLES `act_ru_suspended_job` WRITE;
/*!40000 ALTER TABLE `act_ru_suspended_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_suspended_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_notice` (
  `notice_id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `notice_content` varchar(4000) DEFAULT NULL,
  `notice_title` varchar(50) DEFAULT NULL,
  `notice_type` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES ('40283e81704c759101704c823917001b','admin','2020-02-16 13:39:28','<p>本系统是基于SpringBoot的后台管理系统 易读易懂、界面简洁美观。 采用技术SpringBoot、SpringDataJpa、Shiro、Flowable、thymeleaf等。</p><p>本系统仅作为学习使用目的，不作为商业使用的目的。若使用本系统作为商业活动，导致一切后果自行负责。<br></p>','使用Daffodil后台管理系统公告说明','2',NULL,'0','admin','2020-06-02 10:43:09');
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_procinst`
--

DROP TABLE IF EXISTS `act_hi_procinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT '1',
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_procinst`
--

LOCK TABLES `act_hi_procinst` WRITE;
/*!40000 ALTER TABLE `act_hi_procinst` DISABLE KEYS */;
INSERT INTO `act_hi_procinst` VALUES ('279476fb-c1af-11ea-9b4f-96e6f7651f71',2,'279476fb-c1af-11ea-9b4f-96e6f7651f71','4028b26c73324cb00173324e37370001','Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','2020-07-09 14:41:01.570','2020-07-09 16:55:32.799',8071229,'典韦','startEvent1','sid-B637838A-8E37-481C-8131-A50DEC3D3812',NULL,NULL,'4028b26c73316c4401733171d2ad0016','第一次流程报销测试','submitExpenseCallback','JQueryFunction'),('2855601b-c274-11ea-9d08-96e6f7651f71',2,'2855601b-c274-11ea-9d08-96e6f7651f71','4028b26c733750a4017337596a220000','Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','2020-07-10 14:11:13.690','2020-07-10 14:17:41.213',387523,'典韦','startEvent1',NULL,NULL,'作废','4028b26c73316c4401733171d2ad0016','第七次报销流程测试-作废测试','submitExpenseCallback','JQueryFunction'),('46a0ebc3-c1af-11ea-9b4f-96e6f7651f71',2,'46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','4028b26c73324cb00173324f21e00004','Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','2020-07-09 14:41:53.660','2020-07-09 18:02:45.956',12052296,'典韦','startEvent1','sid-B637838A-8E37-481C-8131-A50DEC3D3812',NULL,NULL,'4028b26c73316c4401733171d2ad0016','第二次流程报销测试','submitExpenseCallback','JQueryFunction'),('58b92d37-c27e-11ea-8dcf-96e6f7651f71',2,'58b92d37-c27e-11ea-8dcf-96e6f7651f71','4028b26c73376dde0173379c30a9000a','Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','2020-07-10 15:24:09.841','2020-07-10 15:24:31.583',21742,'典韦','startEvent1',NULL,NULL,'作废','4028b26c73316c4401733171d2ad0016','第八次报销流程测试-作废测试','submitExpenseCallback','JQueryFunction'),('7098cadc-c321-11ea-a804-96e6f7651f71',1,'7098cadc-c321-11ea-a804-96e6f7651f71','4028b26c733bb8d701733bc90997007a','AskForLeave:1:350aab0b-c321-11ea-a804-96e6f7651f71','2020-07-11 10:51:37.862',NULL,NULL,'孙坚','startEvent1',NULL,NULL,NULL,'4028b26c73316c440173317049080010','没事就是请假怎么地','submitLeaveCallback','JQueryFunction'),('7f12e7af-c1dd-11ea-8c2f-96e6f7651f71',1,'7f12e7af-c1dd-11ea-8c2f-96e6f7651f71','4028b26c73337cd70173337e0a7b0000','Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','2020-07-09 20:12:45.210',NULL,NULL,'典韦','startEvent1',NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016','第五次报销流程测试','submitExpenseCallback','JQueryFunction'),('868bd51b-c1af-11ea-9b4f-96e6f7651f71',2,'868bd51b-c1af-11ea-9b4f-96e6f7651f71','4028b26c73324cb001733250c4c10007','Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','2020-07-09 14:43:40.897','2020-07-09 19:30:21.208',17200311,'典韦','startEvent1','sid-B637838A-8E37-481C-8131-A50DEC3D3812',NULL,NULL,'4028b26c73316c4401733171d2ad0016','第三次流程报销测试','submitExpenseCallback','JQueryFunction'),('9f9731fc-c28b-11ea-b0fd-96e6f7651f71',1,'9f9731fc-c28b-11ea-b0fd-96e6f7651f71','4028b26c7337bcae017337f3337b0013','Expense:1:5d25c3eb-c28b-11ea-b0fd-96e6f7651f71','2020-07-10 16:59:12.195',NULL,NULL,'关羽','start',NULL,NULL,NULL,'4028b26c73316c440173317228b40018','第一次部门经理级流程测试','submitExpenseCallback','JQueryFunction'),('b5c4452e-c320-11ea-a804-96e6f7651f71',2,'b5c4452e-c320-11ea-a804-96e6f7651f71','4028b26c733bb8d701733bc441050068','AskForLeave:1:34963ae2-c31d-11ea-9982-96e6f7651f71','2020-07-11 10:46:24.413','2020-07-11 10:46:57.577',33164,'孙权','startEvent1',NULL,NULL,'作废','4028b26c73316c440173317049080010','不加班了我要请假去马尔代夫','submitLeaveCallback','JQueryFunction'),('caba6266-c286-11ea-b0fd-96e6f7651f71',1,'caba6266-c286-11ea-b0fd-96e6f7651f71','4028b26c7337bcae017337d389c20008','Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','2020-07-10 16:24:37.084',NULL,NULL,'典韦','startEvent1',NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016','员工级别-报销流程','submitExpenseCallback','JQueryFunction'),('cb78627d-c283-11ea-b0fd-96e6f7651f71',1,'cb78627d-c283-11ea-b0fd-96e6f7651f71','4028b26c7337bcae017337bfe56f0001','Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','2020-07-10 16:03:09.839',NULL,NULL,'典韦','startEvent1',NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016','第十次报销流程测试','submitExpenseCallback','JQueryFunction'),('cee3e203-c1af-11ea-9b4f-96e6f7651f71',2,'cee3e203-c1af-11ea-9b4f-96e6f7651f71','4028b26c73324cb0017332529edd000a','Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','2020-07-09 14:45:42.270','2020-07-09 19:31:06.908',17124638,'典韦','startEvent1','sid-B637838A-8E37-481C-8131-A50DEC3D3812',NULL,NULL,'4028b26c73316c4401733171d2ad0016','第四次流程报销测试','submitExpenseCallback','JQueryFunction'),('d2a7ede0-c27e-11ea-8dcf-96e6f7651f71',1,'d2a7ede0-c27e-11ea-8dcf-96e6f7651f71','4028b26c73376dde0173379f4fee000f','Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','2020-07-10 15:27:34.411',NULL,NULL,'典韦','startEvent1',NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016','第九次报销流程测试','submitExpenseCallback','JQueryFunction'),('e988b904-c25d-11ea-82f3-96e6f7651f71',2,'e988b904-c25d-11ea-82f3-96e6f7651f71','4028b26c7336adf8017336c7a0950000','Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','2020-07-10 11:31:59.402','2020-07-10 15:19:35.552',13656150,'典韦','startEvent1',NULL,NULL,'作废','4028b26c73316c4401733171d2ad0016','第六次报销流程测试','submitExpenseCallback','JQueryFunction');
/*!40000 ALTER TABLE `act_hi_procinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_cn_flow_user`
--

DROP TABLE IF EXISTS `act_cn_flow_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_cn_flow_user` (
  `model_user_id` varchar(255) NOT NULL,
  `deploy_id` varchar(255) DEFAULT NULL,
  `flow_type_id` varchar(255) DEFAULT NULL,
  `model_key` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`model_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_cn_flow_user`
--

LOCK TABLES `act_cn_flow_user` WRITE;
/*!40000 ALTER TABLE `act_cn_flow_user` DISABLE KEYS */;
INSERT INTO `act_cn_flow_user` VALUES ('4028b26c73317f120173318ecfe8000f','e5381dc2-c191-11ea-8e4d-96e6f7651f71','4028b26c73316c4401733171d2ad0016','Expense2','2','40283e817048902901704899f54e0008'),('4028b26c7337bcae017337f209c3000f','5d1410a8-c28b-11ea-b0fd-96e6f7651f71','4028b26c73316c440173317228b40018','Expense','0','40283e8170489029017048a2c9610022'),('4028b26c7337bcae017337f2345d0010','e5381dc2-c191-11ea-8e4d-96e6f7651f71','4028b26c73316c4401733171d2ad0016','Expense2','0','40283e8170489029017048a2c9610022'),('4028b26c733bb8d701733bc7abc50075','34f6fbf8-c321-11ea-a804-96e6f7651f71','4028b26c73316c440173317049080010','AskForLeave','0','40283e8170489029017048a4533b0027'),('4028b26c733cbcf001733cca94580001','34f6fbf8-c321-11ea-a804-96e6f7651f71','4028b26c73316c440173317049080010','AskForLeave','2','40283e8170489029017048a63954002d'),('4028b26c733cd35401733cd406840000','34f6fbf8-c321-11ea-a804-96e6f7651f71','4028b26c73316c440173317049080010','AskForLeave','0','40283e8170489029017048a63954002d'),('4028b26c733cd35401733cd420160001','5d1410a8-c28b-11ea-b0fd-96e6f7651f71','4028b26c73316c440173317228b40018','Expense','2','40283e8170489029017048a63954002d'),('4028b26c733cd35401733cd4332d0002','e5381dc2-c191-11ea-8e4d-96e6f7651f71','4028b26c73316c4401733171d2ad0016','Expense2','2','40283e8170489029017048a63954002d'),('4028b26c733cd35401733ce228e00003','e5381dc2-c191-11ea-8e4d-96e6f7651f71','4028b26c73316c4401733171d2ad0016','Expense2','0','40283e817048902901704899f54e0008');
/*!40000 ALTER TABLE `act_cn_flow_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_actinst`
--

DROP TABLE IF EXISTS `act_hi_actinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT '1',
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_actinst`
--

LOCK TABLES `act_hi_actinst` WRITE;
/*!40000 ALTER TABLE `act_hi_actinst` DISABLE KEYS */;
INSERT INTO `act_hi_actinst` VALUES ('0318c911-c1c7-11ea-9b4f-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','46a111e2-c1af-11ea-9b4f-96e6f7651f71','sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A','0318c912-c1c7-11ea-9b4f-96e6f7651f71',NULL,'部门经理审批','userTask','刘备','2020-07-09 17:31:48.283','2020-07-09 17:32:22.313',34030,NULL,'4028b26c73316c4401733171d2ad0016'),('0dad528a-c1e7-11ea-8f09-96e6f7651f71',2,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','7f12e7af-c1dd-11ea-8c2f-96e6f7651f71','7f135cef-c1dd-11ea-8c2f-96e6f7651f71','sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A','0daf274b-c1e7-11ea-8f09-96e6f7651f71',NULL,'部门经理审批','userTask','刘备','2020-07-09 21:21:09.929',NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016'),('160354b0-c323-11ea-a804-96e6f7651f71',2,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','cb78627d-c283-11ea-b0fd-96e6f7651f71','cb78b0ad-c283-11ea-b0fd-96e6f7651f71','sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A','160354b1-c323-11ea-a804-96e6f7651f71',NULL,'部门经理审批','userTask','刘备','2020-07-11 11:03:24.881',NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016'),('176159f8-c1c7-11ea-9b4f-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','46a111e2-c1af-11ea-9b4f-96e6f7651f71','sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8','176159f9-c1c7-11ea-9b4f-96e6f7651f71',NULL,'报销申请','userTask','周瑜','2020-07-09 17:32:22.313','2020-07-09 17:38:00.774',338461,NULL,'4028b26c73316c4401733171d2ad0016'),('1bfbd44e-c1c8-11ea-9b4f-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','46a111e2-c1af-11ea-9b4f-96e6f7651f71','sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A','1bfbd44f-c1c8-11ea-9b4f-96e6f7651f71',NULL,'部门经理审批','userTask','刘备','2020-07-09 17:39:39.533','2020-07-09 17:44:06.293',266760,NULL,'4028b26c73316c4401733171d2ad0016'),('27953a5b-c1af-11ea-9b4f-96e6f7651f71',1,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','279476fb-c1af-11ea-9b4f-96e6f7651f71','2794ec3a-c1af-11ea-9b4f-96e6f7651f71','startEvent1',NULL,NULL,'开始','startEvent',NULL,'2020-07-09 14:41:01.575','2020-07-09 14:41:01.576',1,NULL,'4028b26c73316c4401733171d2ad0016'),('2795887c-c1af-11ea-9b4f-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','279476fb-c1af-11ea-9b4f-96e6f7651f71','2794ec3a-c1af-11ea-9b4f-96e6f7651f71','sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8','2797ab5d-c1af-11ea-9b4f-96e6f7651f71',NULL,'报销申请','userTask','典韦','2020-07-09 14:41:01.577','2020-07-09 16:17:30.282',5788705,NULL,'4028b26c73316c4401733171d2ad0016'),('2855fc6c-c274-11ea-9d08-96e6f7651f71',1,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','2855601b-c274-11ea-9d08-96e6f7651f71','2855d55b-c274-11ea-9d08-96e6f7651f71','startEvent1',NULL,NULL,'开始','startEvent',NULL,'2020-07-10 14:11:13.694','2020-07-10 14:11:13.695',1,NULL,'4028b26c73316c4401733171d2ad0016'),('28564a8d-c274-11ea-9d08-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','2855601b-c274-11ea-9d08-96e6f7651f71','2855d55b-c274-11ea-9d08-96e6f7651f71','sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8','28586d6e-c274-11ea-9d08-96e6f7651f71',NULL,'报销申请','userTask','典韦','2020-07-10 14:11:13.696','2020-07-10 14:17:41.198',387502,'作废','4028b26c73316c4401733171d2ad0016'),('291ba248-c1cb-11ea-9b4f-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','46a111e2-c1af-11ea-9b4f-96e6f7651f71','sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A','291c1779-c1cb-11ea-9b4f-96e6f7651f71',NULL,'部门经理审批','userTask','曹操','2020-07-09 18:01:30.042','2020-07-09 18:02:25.334',55292,NULL,'4028b26c73316c4401733171d2ad0016'),('3af085dc-c1c9-11ea-9b4f-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','46a111e2-c1af-11ea-9b4f-96e6f7651f71','sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A','3af085dd-c1c9-11ea-9b4f-96e6f7651f71',NULL,'部门经理审批','userTask','刘备','2020-07-09 17:47:40.965','2020-07-09 17:51:20.939',219974,NULL,'4028b26c73316c4401733171d2ad0016'),('46a111e3-c1af-11ea-9b4f-96e6f7651f71',1,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','46a111e2-c1af-11ea-9b4f-96e6f7651f71','startEvent1',NULL,NULL,'开始','startEvent',NULL,'2020-07-09 14:41:53.662','2020-07-09 14:41:53.662',0,NULL,'4028b26c73316c4401733171d2ad0016'),('46a111e4-c1af-11ea-9b4f-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','46a111e2-c1af-11ea-9b4f-96e6f7651f71','sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8','46a111e5-c1af-11ea-9b4f-96e6f7651f71',NULL,'报销申请','userTask','典韦','2020-07-09 14:41:53.662','2020-07-09 17:28:19.782',9986120,NULL,'4028b26c73316c4401733171d2ad0016'),('4a10ad20-c1cb-11ea-9b4f-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','46a111e2-c1af-11ea-9b4f-96e6f7651f71','sid-7C468FA0-CF11-4C38-80C7-1CBAC3CAED79','4a10ad21-c1cb-11ea-9b4f-96e6f7651f71',NULL,'财务审批','userTask','周瑜','2020-07-09 18:02:25.335','2020-07-09 18:02:45.944',20609,NULL,'4028b26c73316c4401733171d2ad0016'),('56598347-c1cb-11ea-9b4f-96e6f7651f71',1,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','46a111e2-c1af-11ea-9b4f-96e6f7651f71','sid-B637838A-8E37-481C-8131-A50DEC3D3812',NULL,NULL,'结束','endEvent',NULL,'2020-07-09 18:02:45.945','2020-07-09 18:02:45.945',0,NULL,'4028b26c73316c4401733171d2ad0016'),('58b95458-c27e-11ea-8dcf-96e6f7651f71',1,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','58b92d37-c27e-11ea-8dcf-96e6f7651f71','58b92d47-c27e-11ea-8dcf-96e6f7651f71','startEvent1',NULL,NULL,'开始','startEvent',NULL,'2020-07-10 15:24:09.843','2020-07-10 15:24:09.843',0,NULL,'4028b26c73316c4401733171d2ad0016'),('58b95459-c27e-11ea-8dcf-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','58b92d37-c27e-11ea-8dcf-96e6f7651f71','58b92d47-c27e-11ea-8dcf-96e6f7651f71','sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8','58b9545a-c27e-11ea-8dcf-96e6f7651f71',NULL,'报销申请','userTask','典韦','2020-07-10 15:24:09.843','2020-07-10 15:24:31.581',21738,'作废','4028b26c73316c4401733171d2ad0016'),('6e2e8c77-c283-11ea-b0fd-96e6f7651f71',2,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','d2a7ede0-c27e-11ea-8dcf-96e6f7651f71','d2a7edf0-c27e-11ea-8dcf-96e6f7651f71','sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A','6e30fd78-c283-11ea-b0fd-96e6f7651f71',NULL,'部门经理审批','userTask','曹操','2020-07-10 16:00:33.327',NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016'),('7098f1fe-c321-11ea-a804-96e6f7651f71',1,'AskForLeave:1:350aab0b-c321-11ea-a804-96e6f7651f71','7098cadc-c321-11ea-a804-96e6f7651f71','7098caed-c321-11ea-a804-96e6f7651f71','startEvent1',NULL,NULL,'开始','startEvent',NULL,'2020-07-11 10:51:37.863','2020-07-11 10:51:37.863',0,NULL,'4028b26c73316c440173317049080010'),('7098f1ff-c321-11ea-a804-96e6f7651f71',3,'AskForLeave:1:350aab0b-c321-11ea-a804-96e6f7651f71','7098cadc-c321-11ea-a804-96e6f7651f71','7098caed-c321-11ea-a804-96e6f7651f71','sid-FA5DEC96-DF3B-476A-9911-6603A764994E','7098f200-c321-11ea-a804-96e6f7651f71',NULL,'请假申请','userTask','孙坚','2020-07-11 10:51:37.863','2020-07-11 10:52:06.982',29119,NULL,'4028b26c73316c440173317049080010'),('7f138400-c1dd-11ea-8c2f-96e6f7651f71',1,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','7f12e7af-c1dd-11ea-8c2f-96e6f7651f71','7f135cef-c1dd-11ea-8c2f-96e6f7651f71','startEvent1',NULL,NULL,'开始','startEvent',NULL,'2020-07-09 20:12:45.214','2020-07-09 20:12:45.216',2,NULL,'4028b26c73316c4401733171d2ad0016'),('7f13f931-c1dd-11ea-8c2f-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','7f12e7af-c1dd-11ea-8c2f-96e6f7651f71','7f135cef-c1dd-11ea-8c2f-96e6f7651f71','sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8','7f161c12-c1dd-11ea-8c2f-96e6f7651f71',NULL,'报销申请','userTask','典韦','2020-07-09 20:12:45.217','2020-07-09 21:21:09.926',4104709,NULL,'4028b26c73316c4401733171d2ad0016'),('81f426f8-c321-11ea-a804-96e6f7651f71',2,'AskForLeave:1:350aab0b-c321-11ea-a804-96e6f7651f71','7098cadc-c321-11ea-a804-96e6f7651f71','7098caed-c321-11ea-a804-96e6f7651f71','sid-6D79B4F5-4CDB-4860-9694-C76721F2914F','81f426f9-c321-11ea-a804-96e6f7651f71',NULL,'部门经理审批','userTask','刘备','2020-07-11 10:52:06.982',NULL,NULL,NULL,'4028b26c73316c440173317049080010'),('868bfc3b-c1af-11ea-9b4f-96e6f7651f71',1,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','868bd51b-c1af-11ea-9b4f-96e6f7651f71','868bfc3a-c1af-11ea-9b4f-96e6f7651f71','startEvent1',NULL,NULL,'开始','startEvent',NULL,'2020-07-09 14:43:40.898','2020-07-09 14:43:40.898',0,NULL,'4028b26c73316c4401733171d2ad0016'),('868bfc3c-c1af-11ea-9b4f-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','868bd51b-c1af-11ea-9b4f-96e6f7651f71','868bfc3a-c1af-11ea-9b4f-96e6f7651f71','sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8','868bfc3d-c1af-11ea-9b4f-96e6f7651f71',NULL,'报销申请','userTask','典韦','2020-07-09 14:43:40.898','2020-07-09 19:17:41.080',16440182,NULL,'4028b26c73316c4401733171d2ad0016'),('86d20eb1-c1c6-11ea-9b4f-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','46a111e2-c1af-11ea-9b4f-96e6f7651f71','sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A','86d20eb2-c1c6-11ea-9b4f-96e6f7651f71',NULL,'部门经理审批','userTask','刘备','2020-07-09 17:28:19.782','2020-07-09 17:30:36.493',136711,NULL,'4028b26c73316c4401733171d2ad0016'),('8b490878-c1d7-11ea-8903-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','cee3e203-c1af-11ea-9b4f-96e6f7651f71','cee3e212-c1af-11ea-9b4f-96e6f7651f71','sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A','8b490879-c1d7-11ea-8903-96e6f7651f71',NULL,'部门经理审批','userTask','刘备','2020-07-09 19:30:08.717','2020-07-09 19:30:40.513',31796,NULL,'4028b26c73316c4401733171d2ad0016'),('92b55ce0-c1d7-11ea-8903-96e6f7651f71',1,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','868bd51b-c1af-11ea-9b4f-96e6f7651f71','868bfc3a-c1af-11ea-9b4f-96e6f7651f71','sid-B637838A-8E37-481C-8131-A50DEC3D3812',NULL,NULL,'结束','endEvent',NULL,'2020-07-09 19:30:21.171','2020-07-09 19:30:21.197',26,NULL,'4028b26c73316c4401733171d2ad0016'),('9e3cb7c4-c1d7-11ea-8903-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','cee3e203-c1af-11ea-9b4f-96e6f7651f71','cee3e212-c1af-11ea-9b4f-96e6f7651f71','sid-7C468FA0-CF11-4C38-80C7-1CBAC3CAED79','9e3cb7c5-c1d7-11ea-8903-96e6f7651f71',NULL,'财务审批','userTask','周瑜','2020-07-09 19:30:40.513','2020-07-09 19:31:06.904',26391,NULL,'4028b26c73316c4401733171d2ad0016'),('9f4588b6-c1bf-11ea-9b4f-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','279476fb-c1af-11ea-9b4f-96e6f7651f71','2794ec3a-c1af-11ea-9b4f-96e6f7651f71','sid-7C468FA0-CF11-4C38-80C7-1CBAC3CAED79','9f45afc7-c1bf-11ea-9b4f-96e6f7651f71',NULL,'财务审批','userTask','周瑜','2020-07-09 16:38:54.327','2020-07-09 16:55:32.780',998453,NULL,'4028b26c73316c4401733171d2ad0016'),('9f97591d-c28b-11ea-b0fd-96e6f7651f71',1,'Expense:1:5d25c3eb-c28b-11ea-b0fd-96e6f7651f71','9f9731fc-c28b-11ea-b0fd-96e6f7651f71','9f97591c-c28b-11ea-b0fd-96e6f7651f71','start',NULL,NULL,'开始','startEvent',NULL,'2020-07-10 16:59:12.196','2020-07-10 16:59:12.196',0,NULL,'4028b26c73316c440173317228b40018'),('9f97591e-c28b-11ea-b0fd-96e6f7651f71',3,'Expense:1:5d25c3eb-c28b-11ea-b0fd-96e6f7651f71','9f9731fc-c28b-11ea-b0fd-96e6f7651f71','9f97591c-c28b-11ea-b0fd-96e6f7651f71','fillTask','9f97591f-c28b-11ea-b0fd-96e6f7651f71',NULL,'报销申请','userTask','关羽','2020-07-10 16:59:12.196','2020-07-10 16:59:41.612',29416,NULL,'4028b26c73316c440173317228b40018'),('a1ebd0dd-c1bc-11ea-9b4f-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','279476fb-c1af-11ea-9b4f-96e6f7651f71','2794ec3a-c1af-11ea-9b4f-96e6f7651f71','sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A','a1ebd0de-c1bc-11ea-9b4f-96e6f7651f71',NULL,'部门经理审批','userTask','刘备','2020-07-09 16:17:30.282','2020-07-09 16:38:54.321',1284039,NULL,'4028b26c73316c4401733171d2ad0016'),('a96aa2f1-c27d-11ea-8dcf-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','e988b904-c25d-11ea-82f3-96e6f7651f71','e989a374-c25d-11ea-82f3-96e6f7651f71','sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A','a96c9ec2-c27d-11ea-8dcf-96e6f7651f71',NULL,'部门经理审批','userTask','刘备','2020-07-10 15:19:15.726','2020-07-10 15:19:35.543',19817,'作废','4028b26c73316c4401733171d2ad0016'),('adf7d14c-c1d7-11ea-8903-96e6f7651f71',1,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','cee3e203-c1af-11ea-9b4f-96e6f7651f71','cee3e212-c1af-11ea-9b4f-96e6f7651f71','sid-B637838A-8E37-481C-8131-A50DEC3D3812',NULL,NULL,'结束','endEvent',NULL,'2020-07-09 19:31:06.905','2020-07-09 19:31:06.905',0,NULL,'4028b26c73316c4401733171d2ad0016'),('b11fdfa7-c28b-11ea-b0fd-96e6f7651f71',1,'Expense:1:5d25c3eb-c28b-11ea-b0fd-96e6f7651f71','9f9731fc-c28b-11ea-b0fd-96e6f7651f71','9f97591c-c28b-11ea-b0fd-96e6f7651f71','judgeTask',NULL,NULL,NULL,'exclusiveGateway',NULL,'2020-07-10 16:59:41.612','2020-07-10 16:59:41.613',1,NULL,'4028b26c73316c440173317228b40018'),('b12006b8-c28b-11ea-b0fd-96e6f7651f71',2,'Expense:1:5d25c3eb-c28b-11ea-b0fd-96e6f7651f71','9f9731fc-c28b-11ea-b0fd-96e6f7651f71','9f97591c-c28b-11ea-b0fd-96e6f7651f71','bossTask','b12006b9-c28b-11ea-b0fd-96e6f7651f71',NULL,'老板审批','userTask','admin','2020-07-10 16:59:41.613',NULL,NULL,NULL,'4028b26c73316c440173317228b40018'),('b5c50890-c320-11ea-a804-96e6f7651f71',1,'AskForLeave:1:34963ae2-c31d-11ea-9982-96e6f7651f71','b5c4452e-c320-11ea-a804-96e6f7651f71','b5c4ba6f-c320-11ea-a804-96e6f7651f71','startEvent1',NULL,NULL,'开始','startEvent',NULL,'2020-07-11 10:46:24.418','2020-07-11 10:46:24.420',2,NULL,'4028b26c73316c440173317049080010'),('b5c5a4d1-c320-11ea-a804-96e6f7651f71',3,'AskForLeave:1:34963ae2-c31d-11ea-9982-96e6f7651f71','b5c4452e-c320-11ea-a804-96e6f7651f71','b5c4ba6f-c320-11ea-a804-96e6f7651f71','sid-FA5DEC96-DF3B-476A-9911-6603A764994E','b5c83ce2-c320-11ea-a804-96e6f7651f71',NULL,'请假申请','userTask','孙权','2020-07-11 10:46:24.422','2020-07-11 10:46:57.552',33130,'作废','4028b26c73316c440173317049080010'),('bafc2cd5-c1c8-11ea-9b4f-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','46a111e2-c1af-11ea-9b4f-96e6f7651f71','sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8','bafc2cd6-c1c8-11ea-9b4f-96e6f7651f71',NULL,'报销申请','userTask','周瑜','2020-07-09 17:44:06.293','2020-07-09 17:47:40.965',214672,NULL,'4028b26c73316c4401733171d2ad0016'),('be105543-c1c9-11ea-9b4f-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','46a111e2-c1af-11ea-9b4f-96e6f7651f71','sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8','be10ca74-c1c9-11ea-9b4f-96e6f7651f71',NULL,'报销申请','userTask','周瑜','2020-07-09 17:51:20.955','2020-07-09 17:59:15.738',474783,NULL,'4028b26c73316c4401733171d2ad0016'),('cab0fe39-c323-11ea-a804-96e6f7651f71',2,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','caba6266-c286-11ea-b0fd-96e6f7651f71','caba8986-c286-11ea-b0fd-96e6f7651f71','sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8','cab0fe3a-c323-11ea-a804-96e6f7651f71',NULL,'报销申请','userTask','典韦','2020-07-11 11:08:28.009',NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016'),('caba8987-c286-11ea-b0fd-96e6f7651f71',1,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','caba6266-c286-11ea-b0fd-96e6f7651f71','caba8986-c286-11ea-b0fd-96e6f7651f71','startEvent1',NULL,NULL,'开始','startEvent',NULL,'2020-07-10 16:24:37.085','2020-07-10 16:24:37.085',0,NULL,'4028b26c73316c4401733171d2ad0016'),('caba8988-c286-11ea-b0fd-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','caba6266-c286-11ea-b0fd-96e6f7651f71','caba8986-c286-11ea-b0fd-96e6f7651f71','sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8','caba8989-c286-11ea-b0fd-96e6f7651f71',NULL,'报销申请','userTask','典韦','2020-07-10 16:24:37.085','2020-07-10 16:25:12.237',35152,NULL,'4028b26c73316c4401733171d2ad0016'),('cb78b0ae-c283-11ea-b0fd-96e6f7651f71',1,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','cb78627d-c283-11ea-b0fd-96e6f7651f71','cb78b0ad-c283-11ea-b0fd-96e6f7651f71','startEvent1',NULL,NULL,'开始','startEvent',NULL,'2020-07-10 16:03:09.841','2020-07-10 16:03:09.841',0,NULL,'4028b26c73316c4401733171d2ad0016'),('cb78b0af-c283-11ea-b0fd-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','cb78627d-c283-11ea-b0fd-96e6f7651f71','cb78b0ad-c283-11ea-b0fd-96e6f7651f71','sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8','cb78b0b0-c283-11ea-b0fd-96e6f7651f71',NULL,'报销申请','userTask','典韦','2020-07-10 16:03:09.841','2020-07-11 11:03:24.881',68415040,NULL,'4028b26c73316c4401733171d2ad0016'),('cda8fc37-c1d5-11ea-8903-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','868bd51b-c1af-11ea-9b4f-96e6f7651f71','868bfc3a-c1af-11ea-9b4f-96e6f7651f71','sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A','cdaaf808-c1d5-11ea-8903-96e6f7651f71',NULL,'部门经理审批','userTask','曹操','2020-07-09 19:17:41.082','2020-07-09 19:18:13.307',32225,NULL,'4028b26c73316c4401733171d2ad0016'),('cee40923-c1af-11ea-9b4f-96e6f7651f71',1,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','cee3e203-c1af-11ea-9b4f-96e6f7651f71','cee3e212-c1af-11ea-9b4f-96e6f7651f71','startEvent1',NULL,NULL,'开始','startEvent',NULL,'2020-07-09 14:45:42.271','2020-07-09 14:45:42.271',0,NULL,'4028b26c73316c4401733171d2ad0016'),('cee40924-c1af-11ea-9b4f-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','cee3e203-c1af-11ea-9b4f-96e6f7651f71','cee3e212-c1af-11ea-9b4f-96e6f7651f71','sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8','cee40925-c1af-11ea-9b4f-96e6f7651f71',NULL,'报销申请','userTask','典韦','2020-07-09 14:45:42.271','2020-07-09 19:30:08.717',17066446,NULL,'4028b26c73316c4401733171d2ad0016'),('d2a81501-c27e-11ea-8dcf-96e6f7651f71',1,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','d2a7ede0-c27e-11ea-8dcf-96e6f7651f71','d2a7edf0-c27e-11ea-8dcf-96e6f7651f71','startEvent1',NULL,NULL,'开始','startEvent',NULL,'2020-07-10 15:27:34.412','2020-07-10 15:27:34.412',0,NULL,'4028b26c73316c4401733171d2ad0016'),('d2a81502-c27e-11ea-8dcf-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','d2a7ede0-c27e-11ea-8dcf-96e6f7651f71','d2a7edf0-c27e-11ea-8dcf-96e6f7651f71','sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8','d2a81503-c27e-11ea-8dcf-96e6f7651f71',NULL,'报销申请','userTask','典韦','2020-07-10 15:27:34.412','2020-07-10 16:00:33.324',1978912,NULL,'4028b26c73316c4401733171d2ad0016'),('d84ea73a-c1c6-11ea-9b4f-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','46a111e2-c1af-11ea-9b4f-96e6f7651f71','sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8','d84ea73b-c1c6-11ea-9b4f-96e6f7651f71',NULL,'报销申请','userTask','典韦','2020-07-09 17:30:36.494','2020-07-09 17:31:48.283',71789,NULL,'4028b26c73316c4401733171d2ad0016'),('d90e783a-c1ca-11ea-9b4f-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','46a111e2-c1af-11ea-9b4f-96e6f7651f71','sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A','d90e9f4b-c1ca-11ea-9b4f-96e6f7651f71',NULL,'部门经理审批','userTask','刘备','2020-07-09 17:59:15.738','2020-07-09 18:00:16.344',60606,NULL,'4028b26c73316c4401733171d2ad0016'),('dfae4e91-c286-11ea-b0fd-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','caba6266-c286-11ea-b0fd-96e6f7651f71','caba8986-c286-11ea-b0fd-96e6f7651f71','sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A','dfae4e92-c286-11ea-b0fd-96e6f7651f71',NULL,'部门经理审批','userTask','刘备','2020-07-10 16:25:12.237','2020-07-11 11:08:28.004',67395767,NULL,'4028b26c73316c4401733171d2ad0016'),('e0df0bb0-c1d5-11ea-8903-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','868bd51b-c1af-11ea-9b4f-96e6f7651f71','868bfc3a-c1af-11ea-9b4f-96e6f7651f71','sid-7C468FA0-CF11-4C38-80C7-1CBAC3CAED79','e0df0bb1-c1d5-11ea-8903-96e6f7651f71',NULL,'财务审批','userTask','周瑜','2020-07-09 19:18:13.313','2020-07-09 19:30:21.171',727858,NULL,'4028b26c73316c4401733171d2ad0016'),('e11e66d0-c1c7-11ea-9b4f-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','46a111e2-c1af-11ea-9b4f-96e6f7651f71','sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A','e11e66d1-c1c7-11ea-9b4f-96e6f7651f71',NULL,'部门经理审批','userTask','刘备','2020-07-09 17:38:00.774','2020-07-09 17:38:41.782',41008,NULL,'4028b26c73316c4401733171d2ad0016'),('e98a18a5-c25d-11ea-82f3-96e6f7651f71',1,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','e988b904-c25d-11ea-82f3-96e6f7651f71','e989a374-c25d-11ea-82f3-96e6f7651f71','startEvent1',NULL,NULL,'开始','startEvent',NULL,'2020-07-10 11:31:59.411','2020-07-10 11:31:59.414',3,NULL,'4028b26c73316c4401733171d2ad0016'),('e98ab4e6-c25d-11ea-82f3-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','e988b904-c25d-11ea-82f3-96e6f7651f71','e989a374-c25d-11ea-82f3-96e6f7651f71','sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8','e98d9b17-c25d-11ea-82f3-96e6f7651f71',NULL,'报销申请','userTask','典韦','2020-07-10 11:31:59.415','2020-07-10 15:19:15.724',13636309,NULL,'4028b26c73316c4401733171d2ad0016'),('f2655f0e-c1c1-11ea-9b4f-96e6f7651f71',1,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','279476fb-c1af-11ea-9b4f-96e6f7651f71','2794ec3a-c1af-11ea-9b4f-96e6f7651f71','sid-B637838A-8E37-481C-8131-A50DEC3D3812',NULL,NULL,'结束','endEvent',NULL,'2020-07-09 16:55:32.780','2020-07-09 16:55:32.783',3,NULL,'4028b26c73316c4401733171d2ad0016'),('f98fb9d7-c1c7-11ea-9b4f-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','46a111e2-c1af-11ea-9b4f-96e6f7651f71','sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8','f98fb9d8-c1c7-11ea-9b4f-96e6f7651f71',NULL,'报销申请','userTask','周瑜','2020-07-09 17:38:41.782','2020-07-09 17:39:39.533',57751,NULL,'4028b26c73316c4401733171d2ad0016'),('fd2ed261-c1ca-11ea-9b4f-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','46a111e2-c1af-11ea-9b4f-96e6f7651f71','sid-7C468FA0-CF11-4C38-80C7-1CBAC3CAED79','fd2ef972-c1ca-11ea-9b4f-96e6f7651f71',NULL,'财务审批','userTask','周瑜','2020-07-09 18:00:16.348','2020-07-09 18:01:30.026',73678,NULL,'4028b26c73316c4401733171d2ad0016');
/*!40000 ALTER TABLE `act_hi_actinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_de_model`
--

DROP TABLE IF EXISTS `act_de_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_de_model` (
  `id` varchar(255) NOT NULL,
  `name` varchar(400) NOT NULL,
  `model_key` varchar(400) NOT NULL,
  `description` varchar(4000) DEFAULT NULL,
  `model_comment` varchar(4000) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `last_updated_by` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `model_editor_json` longtext,
  `thumbnail` longblob,
  `model_type` int(11) DEFAULT NULL,
  `tenant_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_proc_mod_created` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_de_model`
--

LOCK TABLES `act_de_model` WRITE;
/*!40000 ALTER TABLE `act_de_model` DISABLE KEYS */;
INSERT INTO `act_de_model` VALUES ('d6f1739e-c31c-11ea-9982-96e6f7651f71','请假流程','AskForLeave','请假流程',NULL,'2020-07-11 10:18:42.050000','admin','2020-07-11 10:49:39.111000','admin',1,'{\"modelId\":\"d6f1739e-c31c-11ea-9982-96e6f7651f71\",\"bounds\":{\"lowerRight\":{\"x\":1200,\"y\":1050},\"upperLeft\":{\"x\":0,\"y\":0}},\"properties\":{\"process_id\":\"AskForLeave\",\"name\":\"请假流程\",\"documentation\":\"请假流程\",\"process_author\":\"\",\"process_version\":\"\",\"process_namespace\":\"http://www.flowable.org/processdef\",\"process_historylevel\":\"\",\"isexecutable\":true,\"dataproperties\":\"\",\"executionlisteners\":\"\",\"eventlisteners\":\"\",\"signaldefinitions\":\"\",\"messagedefinitions\":\"\",\"process_potentialstarteruser\":\"\",\"process_potentialstartergroup\":\"\",\"iseagerexecutionfetch\":\"false\"},\"childShapes\":[{\"resourceId\":\"startEvent1\",\"properties\":{\"overrideid\":\"\",\"name\":\"开始\",\"documentation\":\"\",\"executionlisteners\":\"\",\"initiator\":\"\",\"formkeydefinition\":\"\",\"formreference\":\"\",\"formproperties\":\"\"},\"stencil\":{\"id\":\"StartNoneEvent\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-D2D6A238-1998-40B2-8329-11C421644087\"}],\"bounds\":{\"lowerRight\":{\"x\":130,\"y\":193},\"upperLeft\":{\"x\":100,\"y\":163}},\"dockers\":[]},{\"resourceId\":\"sid-FA5DEC96-DF3B-476A-9911-6603A764994E\",\"properties\":{\"overrideid\":\"\",\"name\":\"请假申请\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"type\":\"idm\",\"idm\":{\"type\":\"initiator\"}}},\"formkeydefinition\":\"\",\"formreference\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\",\"skipexpression\":\"\",\"nodetype\":\"\",\"iseditdata\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-BE0C6AA2-056B-47EC-91C7-E2234AD454EB\"}],\"bounds\":{\"lowerRight\":{\"x\":295,\"y\":218},\"upperLeft\":{\"x\":195,\"y\":138}},\"dockers\":[]},{\"resourceId\":\"sid-D2D6A238-1998-40B2-8329-11C421644087\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-FA5DEC96-DF3B-476A-9911-6603A764994E\"}],\"bounds\":{\"lowerRight\":{\"x\":194.234375,\"y\":178},\"upperLeft\":{\"x\":130.21875,\"y\":178}},\"dockers\":[{\"x\":15,\"y\":15},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-FA5DEC96-DF3B-476A-9911-6603A764994E\"}},{\"resourceId\":\"sid-6D79B4F5-4CDB-4860-9694-C76721F2914F\",\"properties\":{\"overrideid\":\"\",\"name\":\"部门经理审批\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"type\":\"idm\",\"idm\":{\"type\":\"groups\",\"candidateGroups\":[{\"id\":\"40283e816f92646d016f92705173001a\",\"name\":\"部门管理员\",\"type\":null,\"$$hashKey\":\"object:582\"}]}}},\"formkeydefinition\":\"\",\"formreference\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\",\"skipexpression\":\"\",\"nodetype\":\"\",\"iseditdata\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-96831967-22AF-4844-A34E-1019295CC71B\"}],\"bounds\":{\"lowerRight\":{\"x\":475,\"y\":218},\"upperLeft\":{\"x\":375,\"y\":138}},\"dockers\":[]},{\"resourceId\":\"sid-BE0C6AA2-056B-47EC-91C7-E2234AD454EB\",\"properties\":{\"overrideid\":\"\",\"name\":\"提交\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-6D79B4F5-4CDB-4860-9694-C76721F2914F\"}],\"bounds\":{\"lowerRight\":{\"x\":374.78125,\"y\":178},\"upperLeft\":{\"x\":295.21875,\"y\":178}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-6D79B4F5-4CDB-4860-9694-C76721F2914F\"}},{\"resourceId\":\"sid-FC44C064-B4A8-4F8F-AE0F-BB4D7D42FDEC\",\"properties\":{\"overrideid\":\"\",\"name\":\"结束\",\"documentation\":\"\",\"executionlisteners\":\"\"},\"stencil\":{\"id\":\"EndNoneEvent\"},\"childShapes\":[],\"outgoing\":[],\"bounds\":{\"lowerRight\":{\"x\":583,\"y\":192},\"upperLeft\":{\"x\":555,\"y\":164}},\"dockers\":[]},{\"resourceId\":\"sid-96831967-22AF-4844-A34E-1019295CC71B\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-FC44C064-B4A8-4F8F-AE0F-BB4D7D42FDEC\"}],\"bounds\":{\"lowerRight\":{\"x\":554.5,\"y\":178},\"upperLeft\":{\"x\":475.5,\"y\":178}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":14,\"y\":14}],\"target\":{\"resourceId\":\"sid-FC44C064-B4A8-4F8F-AE0F-BB4D7D42FDEC\"}}],\"stencil\":{\"id\":\"BPMNDiagram\"},\"stencilset\":{\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\",\"url\":\"../editor/stencilsets/bpmn2.0/bpmn2.0.json\"}}',_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\08\0\0\0�f\�\0\0\�IDATx^\�MHcW���̪ݴ��\�]���j\�r���\�1\�\�T\�h\\X)\nR\nR��P�h-��qSPJc%\�0ka\n\�jL�\�i5\�\�w$�\�~��1\�ޯ}xQ�\�s޼\�\�s��fn\�\0\0\0\0\0\0\0\0\0\0\0\0\0p���ysyy��X,����4\'&&D�ڜ���ވD\"�y\�\�����~Oo��H$\�\�\�c3�L��j�j{4\Z=�\0\�\��s��B�\�\�n`�6s~��\\G{�gĭ�\�\�\�\���n���$\�s)~�<Q\�\\��\�\n�\�/S�eíR}������\rDϥ�\r�D\�+\�o�=��\�Y�p�T_x�\��[I�\��y\�k믳�Y�p�$���$\�s	~�<\��\��\����\�\�XT\�%�\r�\�Xu�\�~6{8�EV(\�,	�\��d\�%�\r�\�\n�\n�=�vI��.!��	B�\��yb����Í�X��=\�\��s�$�\r�/y%KB`\�7���?���\�fiii���\�\����u�j�VI?\�\�?\�\�X��o\�ioo\�Ν;il~J\n\��\��\��\��x<\��|��\�\�ֵ����\�\�mS����\Z[�\�Ԉ�\�\�\�W�k��\��v����h~L\�f\�\��/ѿ\�\�\�+**^\�\�Z-�@\�h~~��|Vxgggf8^�z�?�\�k8��\��:x���5455����\�\�\�900`���\�\'�=Z��\ZWB�hrx�\����Dz{{\���\�q\nV/�[?555/\�����_WW��9�笯��\�\�\�\�DqF\n�Z�B\�Yhr\�\\XX\�\�z*\�!������^\���\0�\��\�Of[a�B��\�\�.�Y���[�\�c\Z�o�z9C>\�\�\�|\�p###fss󗼞 �z�\�z����e�ksss|(>���!k���9gc��}!KKKfCC\��\��^\�^<\�;j�766��8|�~�?��&�&���a\�\�\�\��\�rxx��)^�\�Pg�jhV}\��[X�\���\�=��}W\r�p8̇\������YE�9\��zOS��{!���fyyy�\�+4�\�*\�ު�\��[X�\���\�=\'\�S߫m�e>\�\���#\'���UW\�\�ՏmqL������M�\�]q�W\���9Q[[{\�\� hO��Whʰ\�\��~�\�\�5u\�\�eP�3#�^{\�k>�/\�\�Օ\�\�/B-w\�\�ھ\���\0�\��֋�\�P�ATUUm_�>\�^�***\�\���\0�\��֏uD}}���>�\�\����I�wR���%ik\�Ճ�\��֏�N\�P(dj��҂\Zp�V\�\�ZI�g1�~�C<�QI,�v�K>��m\�bXd�\�\�\�\�\�\�W.mOs���l��7q\�VL\�i\�\�IB`\�sXOs�\�d`\�\�}\��4���y4	DH獠�m�\�� �HB`\��8�yRA`���(X��o \nV/���\���@`���(X��o \nV/���\���@`���(&\'\'\�\�	S�\�K�a�{\��\�6\�7\����F\"�\�\n�4���~C��\��\�6\�7E$��F\����\�3�9���2La]#\�\��s��C�\�\�l@J�}�0�6���	�jk�\��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��Ջ6*\�w�O\0\0\0\0IEND�B`�',0,NULL),('e84f4db3-c0e0-11ea-b3db-96e6f7651f71','员工级别-报销流程','Expense2','员工级别-报销流程',NULL,'2020-07-08 14:04:38.861000','admin','2020-07-11 10:17:27.486000','admin',1,'{\"modelId\":\"e84f4db3-c0e0-11ea-b3db-96e6f7651f71\",\"bounds\":{\"lowerRight\":{\"x\":1200,\"y\":1050},\"upperLeft\":{\"x\":0,\"y\":0}},\"properties\":{\"process_id\":\"Expense2\",\"name\":\"员工级别-报销流程\",\"documentation\":\"员工级别-报销流程\",\"process_author\":\"\",\"process_version\":\"\",\"process_namespace\":\"http://www.flowable.org/processdef\",\"process_historylevel\":\"\",\"isexecutable\":true,\"dataproperties\":\"\",\"executionlisteners\":\"{\\\"executionListeners\\\":[]}\",\"eventlisteners\":\"{\\\"eventListeners\\\":[]}\",\"signaldefinitions\":\"[]\",\"messagedefinitions\":\"[]\",\"process_potentialstarteruser\":\"\",\"process_potentialstartergroup\":\"\",\"iseagerexecutionfetch\":\"false\",\"messages\":[]},\"childShapes\":[{\"resourceId\":\"startEvent1\",\"properties\":{\"overrideid\":\"startEvent1\",\"name\":\"开始\",\"documentation\":\"\",\"executionlisteners\":{\"executionListeners\":[]},\"initiator\":\"\",\"formkeydefinition\":\"\",\"formreference\":\"\",\"formproperties\":\"\",\"interrupting\":true},\"stencil\":{\"id\":\"StartNoneEvent\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-4A04755F-E8EB-4ADA-959C-69CDD2B166C2\"}],\"bounds\":{\"lowerRight\":{\"x\":70,\"y\":133},\"upperLeft\":{\"x\":40,\"y\":103}},\"dockers\":[]},{\"resourceId\":\"sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8\",\"properties\":{\"overrideid\":\"sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8\",\"name\":\"报销申请\",\"documentation\":\"\",\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"executionlisteners\":{\"executionListeners\":[]},\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"type\":\"static\",\"assignee\":\"$INITIATOR\"}},\"formkeydefinition\":\"\",\"formreference\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":{\"taskListeners\":[]},\"skipexpression\":\"\",\"nodetype\":\"\",\"iseditdata\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-39209A63-834F-4027-9105-032D12A10F23\"}],\"bounds\":{\"lowerRight\":{\"x\":235,\"y\":158},\"upperLeft\":{\"x\":135,\"y\":78}},\"dockers\":[]},{\"resourceId\":\"sid-4A04755F-E8EB-4ADA-959C-69CDD2B166C2\",\"properties\":{\"overrideid\":\"sid-4A04755F-E8EB-4ADA-959C-69CDD2B166C2\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8\"}],\"bounds\":{\"lowerRight\":{\"x\":134.234375,\"y\":118},\"upperLeft\":{\"x\":70.21875,\"y\":118}},\"dockers\":[{\"x\":15,\"y\":15},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8\"}},{\"resourceId\":\"sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A\",\"properties\":{\"overrideid\":\"sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A\",\"name\":\"部门经理审批\",\"documentation\":\"\",\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"executionlisteners\":{\"executionListeners\":[]},\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"type\":\"idm\",\"idm\":{\"candidateGroups\":[{\"id\":\"40283e816f92646d016f92705173001a\",\"name\":\"部门管理员\"}],\"type\":\"groups\"},\"initiatorCanCompleteTask\":false}},\"formkeydefinition\":\"\",\"formreference\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":{\"taskListeners\":[]},\"skipexpression\":\"\",\"nodetype\":\"\",\"iseditdata\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-9A6178EA-6108-4D9B-8310-3C5F078B7B03\"},{\"resourceId\":\"sid-9F5A558A-4B27-4FB6-9225-7BEFD35F952F\"}],\"bounds\":{\"lowerRight\":{\"x\":440,\"y\":158},\"upperLeft\":{\"x\":340,\"y\":78}},\"dockers\":[]},{\"resourceId\":\"sid-7C468FA0-CF11-4C38-80C7-1CBAC3CAED79\",\"properties\":{\"overrideid\":\"sid-7C468FA0-CF11-4C38-80C7-1CBAC3CAED79\",\"name\":\"财务审批\",\"documentation\":\"\",\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"executionlisteners\":{\"executionListeners\":[]},\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"type\":\"idm\",\"idm\":{\"candidateGroups\":[{\"id\":\"40283e816f92646d016f926a76fd0003\",\"name\":\"财务管理员\"}],\"type\":\"groups\"},\"initiatorCanCompleteTask\":false}},\"formkeydefinition\":\"\",\"formreference\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":{\"taskListeners\":[]},\"skipexpression\":\"\",\"nodetype\":\"\",\"iseditdata\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-DF0CDE91-3C56-4068-B6F6-02FB82B40359\"},{\"resourceId\":\"sid-58CBF731-1CED-43B2-A876-AD1B6BCB8365\"}],\"bounds\":{\"lowerRight\":{\"x\":645,\"y\":158},\"upperLeft\":{\"x\":545,\"y\":78}},\"dockers\":[]},{\"resourceId\":\"sid-B637838A-8E37-481C-8131-A50DEC3D3812\",\"properties\":{\"overrideid\":\"sid-B637838A-8E37-481C-8131-A50DEC3D3812\",\"name\":\"结束\",\"documentation\":\"\",\"executionlisteners\":{\"executionListeners\":[]}},\"stencil\":{\"id\":\"EndNoneEvent\"},\"childShapes\":[],\"outgoing\":[],\"bounds\":{\"lowerRight\":{\"x\":768,\"y\":132},\"upperLeft\":{\"x\":740,\"y\":104}},\"dockers\":[]},{\"resourceId\":\"sid-39209A63-834F-4027-9105-032D12A10F23\",\"properties\":{\"overrideid\":\"sid-39209A63-834F-4027-9105-032D12A10F23\",\"name\":\"提交\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A\"}],\"bounds\":{\"lowerRight\":{\"x\":339.3515625,\"y\":118},\"upperLeft\":{\"x\":235.6484375,\"y\":118}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A\"}},{\"resourceId\":\"sid-9A6178EA-6108-4D9B-8310-3C5F078B7B03\",\"properties\":{\"overrideid\":\"sid-9A6178EA-6108-4D9B-8310-3C5F078B7B03\",\"name\":\"同意\",\"documentation\":\"\",\"conditionsequenceflow\":\"${ outcome == \'同意\' }\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-7C468FA0-CF11-4C38-80C7-1CBAC3CAED79\"}],\"bounds\":{\"lowerRight\":{\"x\":544.3515625,\"y\":118},\"upperLeft\":{\"x\":440.6484375,\"y\":118}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-7C468FA0-CF11-4C38-80C7-1CBAC3CAED79\"}},{\"resourceId\":\"sid-DF0CDE91-3C56-4068-B6F6-02FB82B40359\",\"properties\":{\"overrideid\":\"sid-DF0CDE91-3C56-4068-B6F6-02FB82B40359\",\"name\":\"同意\",\"documentation\":\"\",\"conditionsequenceflow\":\"${ outcome == \'同意\' }\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-B637838A-8E37-481C-8131-A50DEC3D3812\"}],\"bounds\":{\"lowerRight\":{\"x\":739.3359375,\"y\":118},\"upperLeft\":{\"x\":645.6875,\"y\":118}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":14,\"y\":14}],\"target\":{\"resourceId\":\"sid-B637838A-8E37-481C-8131-A50DEC3D3812\"}},{\"resourceId\":\"sid-58CBF731-1CED-43B2-A876-AD1B6BCB8365\",\"properties\":{\"overrideid\":\"sid-58CBF731-1CED-43B2-A876-AD1B6BCB8365\",\"name\":\"退回\",\"documentation\":\"\",\"conditionsequenceflow\":\"${ outcome == \'退回\' }\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A\"}],\"bounds\":{\"lowerRight\":{\"x\":595,\"y\":77.359375},\"upperLeft\":{\"x\":390,\"y\":32}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":595,\"y\":32},{\"x\":390,\"y\":32},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A\"}},{\"resourceId\":\"sid-9F5A558A-4B27-4FB6-9225-7BEFD35F952F\",\"properties\":{\"overrideid\":\"sid-9F5A558A-4B27-4FB6-9225-7BEFD35F952F\",\"name\":\"退回\",\"documentation\":\"\",\"conditionsequenceflow\":\"${ outcome == \'退回\' }\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8\"}],\"bounds\":{\"lowerRight\":{\"x\":390,\"y\":221},\"upperLeft\":{\"x\":185,\"y\":158.4296875}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":390,\"y\":221},{\"x\":185,\"y\":221},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8\"}}],\"stencil\":{\"id\":\"BPMNDiagram\"},\"stencilset\":{\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\",\"url\":\"../editor/stencilsets/bpmn2.0/bpmn2.0.json\"}}',_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0,\0\0\0Y\0\0\0�\��\0\0`IDATx^\�\�\�K\\W\�񴋬�J����\r�EVƉ��\�(J�4t�q㢨t\�\�E�Zj\�]!`}AH��CB��T\�Ɖզ\r\nƷ�}�\�L��Q:g��\�\������^O~�<\�ܹ��S�\0\0\0\0\0\0\0\0\0pr�Dİ\r7S\0UB�ِgC~@@�\r�Qp6\�D�ِgC~@@�\r�Qp6\�D�ِgC~@@�\r�Qp6\�D�ِgC~@ Rl(8��b�E�ِH]]\�[�\r��\�(:�\�ѣ/��������2�\����\�\�\�\�yw�qT\���\�ܯ��{��{\�\�b�����G;;;\�\�\�\���\�enn\�,�s\�|\��l\�^��MOP��-�~vl���\�d�\�tzS\�\�|\��l\�^�2��-�`~�*:�!�\�I\�sw�qC~6\�/����D\�\�\�\��Nb\�ss\�7\�gC~�r܂qO\�I�ZX0\�gC~�R�`��A~��t���z\�!?���\�/w�\'1䨅C~6\�/\�%y�F-,�!?xa�ؐ�\r�\�455��H$��Ϻ\�\�\�[\�\�\�\�t���\�\�\��nܸ�}GGǶ�:W?\�\�w;;;\�u��&�\r�ِ_y�1��x�\�\�;��i\\_U�q����\�\�ח\�\�\�:�s\�N�\�ɓH\�G�\\�\�\�\���n\�\�[\r,�!���\"�iR�Sccct��\�(�JE���QKKK&׸\�\Z\Z\�qw�v\�ʕOo޼y����mT.��|���\�w\�j`�ؐ�\r���+�vmJmmm\�����\�\�\�F$;���\�MWZr�3\�d��q\�*O�/Owt{��Ƃ�!?��ϼ\�**�\rivv\�mY����M\�k�%koo�F���B�\�H�t�Qi,�!??Ҁ\�j#�z�j�1G�����d\�L\�WY\�7�@�\���\r��\"��\�s�S�!??��.\\�0�\rktt\�mE�7\�\�\�\�\�\�㕤��aO�\�=�n����\���q\��A~�A~\���q�e\�\�m�a}\����455�\�+�t�\�\�\�\�\�1*-\�Ɲoܐ�\r���ԥMhdd\�mE�\�ru\�\��$\�\�>���\��(�TjM�w�Qi,�!??�,\�mmB\�\�֖\�6���=�me\�}}q�{��\�\���ӥ��\�\�\�\�\��\�\�=F��`l\�φ��IZЦ544TԴ�F������5{�J_\\\�\�\�Er\�ҥK�����\�\�\���L&��\�at\�\�=��v ?lC�s���\r�ِ��ܛ���\r)�LF\�\�\�\�\�\�D�i\�k\�\n\�uM\�+\�\���\�A^\�\�\�\�~��o�/_\�_=F�Q>������~\�ݧZX06\�gC~\�\�5�\�\�\�g}q��\��cC~6\�g����L��zC�l�?\�;,�!?xa�ؐ�\r��Ɔ�l\�^X06\�gC~��!?�\�\�\�L\�\"\�2���\Zx#K�!?x���_+|��\�\�\�/�j\�\�\�φ�\�eff\��\�\�ܳt:��G:�Czee\�sY,�\�8\�\�7n\�φ�\�MO�>�\�\�\�\�\�\'<t:��Y,:\�ܜɯ:\�ܜ\�\�\��\\��\����\0\n΀��@�\�Pp6\�D�ِgC~@@�\r�Qp6\�D�ِgC~@@�\r�Qp6\�D�ِgC~@@�\r�Qp6\�D�ِgC~@@�\r�Qp6\�D�ِgC~@@�\r�Qp6\�D�ِ�\�6\�L\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\"�φ�eb�R\0\0\0\0IEND�B`�',0,NULL),('ee737287-c28a-11ea-b0fd-96e6f7651f71','经理级别-差旅报销','Expense','报销流程',NULL,'2020-07-10 16:54:14.962000','admin','2020-07-11 10:17:21.772000','admin',1,'{\"modelId\":\"ee737287-c28a-11ea-b0fd-96e6f7651f71\",\"bounds\":{\"lowerRight\":{\"x\":1200,\"y\":1050},\"upperLeft\":{\"x\":0,\"y\":0}},\"properties\":{\"process_id\":\"Expense\",\"name\":\"经理级别-差旅报销\",\"documentation\":\"报销流程\",\"process_author\":\"\",\"process_version\":\"\",\"process_namespace\":\"http://www.flowable.org/processdef\",\"process_historylevel\":\"\",\"isexecutable\":true,\"dataproperties\":\"\",\"executionlisteners\":\"{\\\"executionListeners\\\":[]}\",\"eventlisteners\":\"{\\\"eventListeners\\\":[]}\",\"signaldefinitions\":\"[]\",\"messagedefinitions\":\"[]\",\"process_potentialstarteruser\":\"\",\"process_potentialstartergroup\":\"\",\"iseagerexecutionfetch\":\"false\",\"messages\":[]},\"childShapes\":[{\"resourceId\":\"start\",\"properties\":{\"overrideid\":\"start\",\"name\":\"开始\",\"documentation\":\"\",\"executionlisteners\":{\"executionListeners\":[]},\"initiator\":\"\",\"formkeydefinition\":\"\",\"formreference\":\"\",\"formproperties\":\"\",\"interrupting\":true},\"stencil\":{\"id\":\"StartNoneEvent\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"flow1\"}],\"bounds\":{\"lowerRight\":{\"x\":75,\"y\":165},\"upperLeft\":{\"x\":45,\"y\":135}},\"dockers\":[]},{\"resourceId\":\"fillTask\",\"properties\":{\"overrideid\":\"fillTask\",\"name\":\"报销申请\",\"documentation\":\"\",\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"executionlisteners\":{\"executionListeners\":[]},\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"type\":\"static\",\"assignee\":\"$INITIATOR\"}},\"formkeydefinition\":\"\",\"formreference\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":{\"taskListeners\":[]},\"skipexpression\":\"\",\"nodetype\":\"\",\"iseditdata\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"flow2\"}],\"bounds\":{\"lowerRight\":{\"x\":265,\"y\":190},\"upperLeft\":{\"x\":165,\"y\":110}},\"dockers\":[]},{\"resourceId\":\"judgeTask\",\"properties\":{\"overrideid\":\"judgeTask\",\"name\":\"\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"sequencefloworder\":\"\",\"executionlisteners\":{\"executionListeners\":[]}},\"stencil\":{\"id\":\"ExclusiveGateway\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"judgeMore\"},{\"resourceId\":\"judgeLess\"}],\"bounds\":{\"lowerRight\":{\"x\":385,\"y\":170},\"upperLeft\":{\"x\":345,\"y\":130}},\"dockers\":[]},{\"resourceId\":\"directorTak\",\"properties\":{\"overrideid\":\"directorTak\",\"name\":\"财务审批\",\"documentation\":\"\",\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"executionlisteners\":{\"executionListeners\":[]},\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"type\":\"idm\",\"idm\":{\"candidateGroups\":[{\"id\":\"40283e816f92646d016f926a76fd0003\",\"name\":\"财务管理员\"}],\"type\":\"groups\"},\"initiatorCanCompleteTask\":false}},\"formkeydefinition\":\"\",\"formreference\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":{\"taskListeners\":[]},\"skipexpression\":\"\",\"nodetype\":\"\",\"iseditdata\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"directorNotPassFlow\"},{\"resourceId\":\"directorPassFlow\"}],\"bounds\":{\"lowerRight\":{\"x\":595,\"y\":190},\"upperLeft\":{\"x\":495,\"y\":110}},\"dockers\":[]},{\"resourceId\":\"bossTask\",\"properties\":{\"overrideid\":\"bossTask\",\"name\":\"老板审批\",\"documentation\":\"\",\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"executionlisteners\":{\"executionListeners\":[]},\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"type\":\"idm\",\"idm\":{\"candidateGroups\":[{\"id\":\"402855816f1e2a2e016f1e2a45510000\",\"name\":\"超级管理员\"}],\"type\":\"groups\"},\"initiatorCanCompleteTask\":false}},\"formkeydefinition\":\"\",\"formreference\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":{\"taskListeners\":[]},\"skipexpression\":\"\",\"nodetype\":\"\",\"iseditdata\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"bossNotPassFlow\"},{\"resourceId\":\"bossPassFlow\"}],\"bounds\":{\"lowerRight\":{\"x\":415,\"y\":335},\"upperLeft\":{\"x\":315,\"y\":255}},\"dockers\":[]},{\"resourceId\":\"end\",\"properties\":{\"overrideid\":\"end\",\"name\":\"结束\",\"documentation\":\"\",\"executionlisteners\":{\"executionListeners\":[]}},\"stencil\":{\"id\":\"EndNoneEvent\"},\"childShapes\":[],\"outgoing\":[],\"bounds\":{\"lowerRight\":{\"x\":748,\"y\":164},\"upperLeft\":{\"x\":720,\"y\":136}},\"dockers\":[]},{\"resourceId\":\"flow1\",\"properties\":{\"overrideid\":\"flow1\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"fillTask\"}],\"bounds\":{\"lowerRight\":{\"x\":164.3515625,\"y\":150},\"upperLeft\":{\"x\":75.53125,\"y\":150}},\"dockers\":[{\"x\":15,\"y\":15},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"fillTask\"}},{\"resourceId\":\"judgeMore\",\"properties\":{\"overrideid\":\"judgeMore\",\"name\":\"大于500元\",\"documentation\":\"\",\"conditionsequenceflow\":\"${money > 500}\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"bossTask\"}],\"bounds\":{\"lowerRight\":{\"x\":365,\"y\":254.3515625},\"upperLeft\":{\"x\":365,\"y\":170.2578125}},\"dockers\":[{\"x\":20,\"y\":20},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"bossTask\"}},{\"resourceId\":\"judgeLess\",\"properties\":{\"overrideid\":\"judgeLess\",\"name\":\"小于500元\",\"documentation\":\"\",\"conditionsequenceflow\":\"${money <= 500}\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"directorTak\"}],\"bounds\":{\"lowerRight\":{\"x\":494.78125,\"y\":150},\"upperLeft\":{\"x\":384.984375,\"y\":150}},\"dockers\":[{\"x\":20,\"y\":20},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"directorTak\"}},{\"resourceId\":\"flow2\",\"properties\":{\"overrideid\":\"flow2\",\"name\":\"提交\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"judgeTask\"}],\"bounds\":{\"lowerRight\":{\"x\":345.25,\"y\":150},\"upperLeft\":{\"x\":265.21875,\"y\":150}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":20,\"y\":20}],\"target\":{\"resourceId\":\"judgeTask\"}},{\"resourceId\":\"bossPassFlow\",\"properties\":{\"overrideid\":\"bossPassFlow\",\"name\":\"同意\",\"documentation\":\"\",\"conditionsequenceflow\":\"${ handle == \'同意\' }\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"directorTak\"}],\"bounds\":{\"lowerRight\":{\"x\":545,\"y\":295},\"upperLeft\":{\"x\":415.21875,\"y\":190.6484375}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":545,\"y\":295},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"directorTak\"}},{\"resourceId\":\"directorPassFlow\",\"properties\":{\"overrideid\":\"directorPassFlow\",\"name\":\"同意\",\"documentation\":\"\",\"conditionsequenceflow\":\"${ handle == \'同意\' }\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"end\"}],\"bounds\":{\"lowerRight\":{\"x\":719.7109375,\"y\":150},\"upperLeft\":{\"x\":595.46484375,\"y\":150}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":14,\"y\":14}],\"target\":{\"resourceId\":\"end\"}},{\"resourceId\":\"bossNotPassFlow\",\"properties\":{\"overrideid\":\"bossNotPassFlow\",\"name\":\"退回\",\"documentation\":\"\",\"conditionsequenceflow\":{\"expression\":{\"type\":\"static\",\"staticValue\":\"${ handle == \'退回\' }\"}},\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"fillTask\"}],\"bounds\":{\"lowerRight\":{\"x\":314.78125,\"y\":295},\"upperLeft\":{\"x\":215,\"y\":190.6484375}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":215,\"y\":295},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"fillTask\"}},{\"resourceId\":\"directorNotPassFlow\",\"properties\":{\"overrideid\":\"directorNotPassFlow\",\"name\":\"退回\",\"documentation\":\"\",\"conditionsequenceflow\":{\"expression\":{\"type\":\"static\",\"staticValue\":\"${ handle == \'退回\' }\"}},\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"fillTask\"}],\"bounds\":{\"lowerRight\":{\"x\":545,\"y\":109.2734375},\"upperLeft\":{\"x\":215,\"y\":37}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":545,\"y\":37},{\"x\":215,\"y\":37},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"fillTask\"}}],\"stencil\":{\"id\":\"BPMNDiagram\"},\"stencilset\":{\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\",\"url\":\"../editor/stencilsets/bpmn2.0/bpmn2.0.json\"}}',_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0)\0\0\0�\0\0\0J���\0\0�IDATx^\�\�_l[\�\��m�\�4i\��\�p1m��]\0\"\�iS7�br���!T\"!*\�-\Z\�MPK\�\�ZiljY;7�� H���\�m.�N ��\�X���\nhHKs�<�G�>i���\��\�\��#=r�\�q\�s��_�\�^�\n\0\0\0\0\0\0\0໫lp���;��t\��b(�&�0\�\�ۻ\��g)��\�9	��\�>\�!�4���\r6|\��g)�\�<L\n�\�mp��BZE\�%�n�}�B\ni2�\�\�\���\�\�RH�y8�nݺ�mp��B�\�è�ԏlp��B�\�\�\�\�b�g�8CH!-��a	��\�\�RH�y8 �\��g)�\�<<*\�g��3�\�d�I\r\�>\�!�4��\�J�\��g)�\�<< 5d��3�\��,JϦlp��BZ�X�UE��}�B\ni��=�Gmp��B��Im�3���8CH!M�m�\�:�}�B\niP?��x\��g)�\�+ HP�\�>\�!�4	�[d&�\�>\�!�4}UN���\�>\�!�4}}s}�s\�r\'\�tD�VG\����I}S\�\�-\�r\'�ؕ\n�.{=¤\�\'�0c��\�ٔ\�#\\r&�5��3�8��M\�>\�\�\�ۻZfb\����\�q|�\�\�\��\�\�\��R����4U\ZR���d�\�ryflll�]/Z볞�^x!��hY?K1���|J �V����|���\�t�����2�k\�\�:\���\�1u\0��x��}K�\�ܩeÒwU*�Y\�cv\�h\�\�\�S��w\�d(Oyxِ\�]�.\�\�\�:\�����Ӄ�\��\�ˆ\�E\��\�\�:\���\�P\�\�pUe��x\'=��s�d(\�x\�e\�\�|1�N2�\�0ڲC�w��P~\�6\��\0\�\�\�{\�\��M�Z�\�\��\�P6,	�m�ˎ*\���B�p}www�Ԑ^\�\��6��\�ر\����}\���w\���=�\����V{[_0�\r�gP�\�\�<\�K\�\�ɇgk�o\�Y�\�~NC�=��={��988���ƧO���^\�\�\�z{{�\�\�\��y���1���H+�\�\n��[\�(�\�j I>Ļw\�\�Dg\���\�o_�ջz;���\�ݻ���zh\�\�f���������\�\���\�\�JAt�\�\�<\�C�\�\�Z\0-�\�\�\�\�%��k_�/��7\���\�����z�R@%��͛7\���Џ��[�T\�\�\�<\�C�\�pP���6.�h?T�\�}\�m׮]\�\�C�z<�\�3o\�\�\�\�\�}\��\�\�|\�J>f(/e�OM\�\�\�z{�\�\�\�<�N��k�V��\�\���\�oڴ\�#��~��Ϻ\�u\�]\�\�\�\���,�\�E	�S�>�\\��\�P^\�\�U�N�����63��\�gɀ�饞%\�\��<_�\�\��>\�aÆ\�.\���,�]j �(߇Ү7\�*\n�\�ի��Ч4b��O\�\��y\��\�5�k<x\�F\�e=��\�K!%�\�V�����zϤN�>]�/����<u�p\�S\�����3�F?/w\�mfZ\'\�\�6wh\�\�ݻ��͈ˑ3��ZH\�a\�.۷o�ޟI:t\�\�IYe]�N\�\�{�yh��\�\�_+��\\^����1q	����G&���\�\�W]�l\��\�\��~�w\�ܹ3�E���\�^��h(\�\r�zo\�%\�!�Գ#y$��\�k�ٸX�\�\�\�/��O���\�\�\��\�d``\���;wίT\��������P0��\\)��t����|\n�/J<W�x\�֭�c�=\���\�\��\��ϯ�\�\�\��\�D�I�\�(�T<���Ͽ�<\�Z�~�\�ON\�\�I\r(�q��<ʕ�h�~[a�#��9Ʌ�(�fR���Sz�\�\�~n\�\�o�/xHBi\�ʿߖ˃ڷ��C\�H�\�\�<\�OO^֭[ws�X��\�K�\�Ǔ\Z\'ʆ%�ī \�X\�Z��l\�mzƬ���v\�<�;esj!\�1�x��l!�o�>h��9�T�\��<�\�\�R��\��(�J�\�w���d]3#��cm���\0\�\�\�j��l |�\�\�\�\'d(�\�5��\�B�y�w\�\�\�֎����T*��|�uT���\�@��Zc\�\�N)\�^\��x�%����-}y=hm��\�u\�z�\�N)�����������3\�6�\0\�u�z9w\�~�ж7��d��[ꢽȝb���\�\�w*BjeQ�\"�	���\��@����Z�\�w*B\��j\�\"5\�m\0\'B;hC\�ެ$���}T�}��\�\�ж7+	�\�dM\�>\�Lhmhۛ��\�\r��޴}��\�\�ж7+	���(:n��3���moV��S,_�}��\�\�ж7+\�?ߗ��\�΄vІ��Y\���U�l��3���moV�~(5j��3���moV\�b񧲏��}��\�\�ж7+	�����n��3���moVR�(��mp&��6�\�\�JBj��\�_mp&��6�\�\�JB\�	�?\�>\�Lhmhۛ�T�՟lp&��6�\�\�J�Ϡ�\�lp&��6�\�\�J�\�6�\�\�>\�Lhmhۛ�\�\�H\�}��\�\�ж7+\�?H\r\�>\�L(mw�/���\�\�Qm�}���B�+R]�z|�X,\�j��3���JΦl�\�\�\�IH�\��gB:h��)\�\�\'�9R�\\)\������\��\�\�\�\�቉��RɾS���u,�\�\�}�s�\�v�\�6\�g�\�>\��\�!%��B\\�V\����xaa�y\�:t=\�\�\�gG:\�\��\���\��lp\���\�3(\r�$ ^?|\�R�7wjYx\�]�JeVB\�]s;\�W@\�WB�}�\�CJ\�Ϡ��:q\�\�e��w\�$�>�kng2�\�ה�}�\�CJ��$���\�X\Z.J\�g\�\�\�d�����\�>\�L���\rWՁ!U����\�δSH\�ϡ��z\�G���\������\�-�8\�.!���-\ZyW�\�+===߳}��v	)_�\�BJ߽XB\�۶8CH5W�R�P\�x�P�\��g�\�\�BJ\�\�M	�lp��j�:0��%���}�B��\����HH]c��3�TsՁ!uFB\�\�8CH5WR\�oܸ�˶8CH5WR\�����`��3\ZR��\r�ʮ�\�\��O��\0�R\0�FH�\Z!�k�\0�R\0�FH�\Z!�k�\0�R\0�FH�\Z!�k�Ri1�\�>��kf�\�\��@F\�ry�Z�.jzz�		�cv\�\0266�v||�l�R��\�J\�Q���:$uRj�]3��h\��Ԃ�ȃ\�u\�z(\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�]��):\�\�\00\0\0\0\0IEND�B`�',0,NULL);
/*!40000 ALTER TABLE `act_de_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_deadletter_job`
--

DROP TABLE IF EXISTS `act_ru_deadletter_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_deadletter_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_DEADLETTER_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_DEADLETTER_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
  KEY `ACT_IDX_DJOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_DJOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_DJOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_DEADLETTER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_deadletter_job`
--

LOCK TABLES `act_ru_deadletter_job` WRITE;
/*!40000 ALTER TABLE `act_ru_deadletter_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_deadletter_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ge_bytearray`
--

DROP TABLE IF EXISTS `act_ge_bytearray`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ge_bytearray`
--

LOCK TABLES `act_ge_bytearray` WRITE;
/*!40000 ALTER TABLE `act_ge_bytearray` DISABLE KEYS */;
INSERT INTO `act_ge_bytearray` VALUES ('34f6fbf9-c321-11ea-a804-96e6f7651f71',1,'请假流程.bpmn20.xml','34f6fbf8-c321-11ea-a804-96e6f7651f71',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"AskForLeave\" name=\"请假流程\" isExecutable=\"true\">\n    <documentation>请假流程</documentation>\n    <startEvent id=\"startEvent1\" name=\"开始\"></startEvent>\n    <userTask id=\"sid-FA5DEC96-DF3B-476A-9911-6603A764994E\" name=\"请假申请\" flowable:assignee=\"$INITIATOR\">\n      <extensionElements>\n        <modeler:activiti-idm-initiator xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[true]]></modeler:activiti-idm-initiator>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-D2D6A238-1998-40B2-8329-11C421644087\" sourceRef=\"startEvent1\" targetRef=\"sid-FA5DEC96-DF3B-476A-9911-6603A764994E\"></sequenceFlow>\n    <userTask id=\"sid-6D79B4F5-4CDB-4860-9694-C76721F2914F\" name=\"部门经理审批\" flowable:candidateGroups=\"40283e816f92646d016f92705173001a\">\n      <extensionElements>\n        <modeler:group-info-name-40283e816f92646d016f92705173001a xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[部门管理员]]></modeler:group-info-name-40283e816f92646d016f92705173001a>\n        <modeler:activiti-idm-candidate-group xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[true]]></modeler:activiti-idm-candidate-group>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-BE0C6AA2-056B-47EC-91C7-E2234AD454EB\" name=\"提交\" sourceRef=\"sid-FA5DEC96-DF3B-476A-9911-6603A764994E\" targetRef=\"sid-6D79B4F5-4CDB-4860-9694-C76721F2914F\"></sequenceFlow>\n    <endEvent id=\"sid-FC44C064-B4A8-4F8F-AE0F-BB4D7D42FDEC\" name=\"结束\"></endEvent>\n    <sequenceFlow id=\"sid-96831967-22AF-4844-A34E-1019295CC71B\" sourceRef=\"sid-6D79B4F5-4CDB-4860-9694-C76721F2914F\" targetRef=\"sid-FC44C064-B4A8-4F8F-AE0F-BB4D7D42FDEC\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_AskForLeave\">\n    <bpmndi:BPMNPlane bpmnElement=\"AskForLeave\" id=\"BPMNPlane_AskForLeave\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-FA5DEC96-DF3B-476A-9911-6603A764994E\" id=\"BPMNShape_sid-FA5DEC96-DF3B-476A-9911-6603A764994E\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"195.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-6D79B4F5-4CDB-4860-9694-C76721F2914F\" id=\"BPMNShape_sid-6D79B4F5-4CDB-4860-9694-C76721F2914F\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"375.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-FC44C064-B4A8-4F8F-AE0F-BB4D7D42FDEC\" id=\"BPMNShape_sid-FC44C064-B4A8-4F8F-AE0F-BB4D7D42FDEC\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"555.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-BE0C6AA2-056B-47EC-91C7-E2234AD454EB\" id=\"BPMNEdge_sid-BE0C6AA2-056B-47EC-91C7-E2234AD454EB\">\n        <omgdi:waypoint x=\"294.9499999999431\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"374.99999999997226\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-96831967-22AF-4844-A34E-1019295CC71B\" id=\"BPMNEdge_sid-96831967-22AF-4844-A34E-1019295CC71B\">\n        <omgdi:waypoint x=\"474.94999999998265\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"555.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-D2D6A238-1998-40B2-8329-11C421644087\" id=\"BPMNEdge_sid-D2D6A238-1998-40B2-8329-11C421644087\">\n        <omgdi:waypoint x=\"129.94999891869114\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"194.99999999999022\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('350a83fa-c321-11ea-a804-96e6f7651f71',1,'请假流程.AskForLeave.png','34f6fbf8-c321-11ea-a804-96e6f7651f71',_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0Q\0\0\0\�\0\0\0�\�q1\0\0\�IDATx^\�\�	�u�\0py��P˫��<A-��.\�,�\�*\�A$d1��8� Ňx�\"x ��<\r�/!@B�@@L\�I�B�$$!H���\�\�\�vj\�;	�ۻ�\�\�߯\�\�\���Lf�\�\�\����IO\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�WY����%K.�7o\�fΜ�]q\�b�#\�7͙3\�\�Y�f\�U�|\����C>\�F^p�7\�\�e+V�\�֯_�=�\�#b�#\��x�gϞ�6/B{�?#:\'��\�g`؈=�\�\��7�b�c��\�+�3��\�9�\\��\�@\�\�!{\����򢳡�\�9�\\��\�@\�\���\�Ol��ϣ�\�9�\\��\�@�uZtZ�<[r\�Y\�\�+OH?\�m\�\�D�Pt��\��\n�4Z\'Eg\�\�eق\�f7�\�[D\����}E�\Z�\\��\�@�uRt\�^xI��S\�=/�\�{(:\�\�\�z�|\Z���s\�U�ӣ\����}E�\Z�\\��\�@�uRt\\q|�bSD\�W^^�=�j\�s�B>��\�\�+�j\�s�B>�\�Iщ��\�Ŧ�����\�{(:\�\�\�z�|\Z�����\�\�z�\"\���\�\�T#�\��h�N�Ϊe�d.?�G��\�\���\�\�T#�\��h�N�N\�\�\�\�Qt\��r�Z(:\�\�\�z�|\Z����aC�x\�\�=�N\���X^�9�j\�s�B>��DE\'�\�|۵��(8E\�}��\��\�T#�\��h���|�|�\�Y\�\�.;�G�)G,\�ڋ��N5�^!��FkWt�ho}ka/�z(:\�\�\�z�|\Z�]\�\�do}k�-�Ot�N5�^!��FkWtʅ��Q^�\�<�j\�s�B>�֮\�\��N5�^!��FSt\��N5�^!��FSt\��N5�^!��FSt\��N5�^!��&�,��y�\�\�s\�9\�\\>y�\�Gu\��C9d\�\�ѣ�	&l<��\�\�o�\�)SN;v\�Kˏ�=E�^�\�T#�\��y\��1b��N5j\�%����;\�b���o�˕\�0�7O;^v\�eg{\��\�\�\�\�~�d\�]w]v�\�g�V�\�B��\�\�q��q\��4iҒ�>��\���%E�^�\�T#�\��y\��9r��9�\�\�0u\Zs\�q\�u\�PyS4qʔ)\���/e�\�\�\�{\�\�4=�X.�?\�\�6z\�7\��\�\�u�8E�^�\�T#�\���E=˛�\�m\Z�\�\�tu���>h�3f�f���ٴiӲG}�\�\'u$�?��\�w\�}�(?�N\�BѩF>\�+\�s�\Z9r\�\�y-[\�\�\���\�I\'��͜9�\���=\�\�J�\����s0\�\��S�N���C\���l\��Q����\�\�1cƌ+?\�p�\�\�+�j\�s�B>���\�9(o�-����\�/�\�\�~��^��\\�ڊ\�b�x\\K#�1\�[~.����0aB�bŊrT\�;v\�:����z��S�|�W\�\��\�=����\���-]��\\\�:��Ƿ6R\�bC̝;wb4P�5U��w\��zĈ���{�Rt\��N5�^!���z5f̘\�E\��o|#[�vm���J<>\�\�\�H�R���s\��\�O\\s�\�\�_�:O\�\�\�\�?\\):�\nE�\Z�\\��\�\�\�\rδ\���\rT!\�S\Z��V~n��\�ӧ�g\��uy�b�]]]�;\��q�N�BѩF>\�+\�s5ݗ1\�<����&\�\�:GJ]��\��9\��\�e	\�5\�\\g7\\]~Ñ�S�Pt��\��\n�\\Mԩ���I\�!\�\�2\Z�.Es\�\�\��\��\��:PU\��\�\���&_�5�2\\�Ǯ\�\�\��z��Ӟ|�!�\�\�$���D��*G\\��ӳ�z+\�\�r��MM���u�\�g_W\ZL�\'O^0jԨCʯ�)Z�,��eUt\��N{�yh�|n��|��T,�\�o�\\\��U��x�&\�\�ƚ2e\���u(�p\�W.\�fj��4E˗t�_VE�^�\�\'��f\�\��:\�\����\��y�*��~\�oy-����u\�G�_�dI�sP�-�#O�ʯ�)\�|I\�~Y�z��\�^�<�\�C \�s{m�G>\��\�P\�>\��1\�\��\Z\Z[k	�x\���\�:�V�Z�.O�e\�\�\�m��\�H_VE�^�\�\�&\�!�k�6�[�\�\�\�\�]c�-\�\�غ\�X1�m\�ƍ\�\�u@\�\��`�\�v�\�\�+ʟ�\�]\�\�zE��}�������\�\�P�\�\�\���\�7t�]v����st�;\��%�\Z��ļ�\�ӧg�\�w\�\�\�~��ğ\�\�\�ϟ\�c��\���ٻ\��\�t�\�G�}\�s�\�&M��}\�;߉k�d��zj�aÆ����~���\�z\��E�\��t\�so�MX>G�D�u\�Q\�\�?�-[�,�\�w��p�٧?�\�\�\�c�\�\��\�\�\�_��\�Z;���ӟ�)S�d\�sLv衇ftPv\�%�l��o~�\�^{\�����\�\�:\�\��\�Ͼ�կ�\�~���x=}����\�\��\���\�}�\�\�\�\���.�(�\�[��\��\�Ov\�=��X�7!�\�k�\�=�9�wYq�@\�G#QC\\�yp����\��G7�\�ﶾ����\�t\Z�A\�m�ݲ=�\�3m��\�\��\�\�S��\�Ը��\�oN\�|p�cb\�\�N;�\��\�\�f\'NL?\�_(�?RQ,{�\�w���ź�������?�Ϥ�v�\�7Wz=�N{��\�s\�\�\�N<�\�\�\�/~q��g<#{׻ޕ�/\Z�\�?>��\�?�\Z�(:��_��ה�ozӛR\�9y\�׬Y�R\�Ŏ@��ȥh\�ƌ�N-�뮻b�.�;��\�\�6/\��\\���\��x����\'1bDz\rq[�َxL4{\�cb� ��\"^��ק(~�ǟ~�\�[��Ǎ�\"����\�?�y\�����\�ې\�\�u�ϣ͉�SG}�m�}vޅ^x\�\�����/g��E��q\�uץ�;wn*V/{\�˲�<\�)\�[\���\"V,{\�w�\ry�~��\�{\��\�\�\roxC\�$FⱭ�\��\�w\�}S��\�\�\�c�s�ͺ馛��z#��+�c\�)\Z���|�1cFʏ��_�\�W�o}\�[i��X~\�ԩ�	?\�Ӳ�\�\�o��h�\"[�?\�3�|{�F�\�����&=F�\"�cD���\�˗���\�#D�\\�x�^�v.\��wdGy\�\�\�\�HmD��׾���s��}�\�_�?}�~�\�\�\�g���\���\�^��\�e�\�{j\n�&*\Z�h \���NC>�\�I>G}*�sv\�4y�\�S�:Q�FqZ�����/g��E�\�X�hQ* ��\�/9?~|\�㏦%�\�\�����\�%��ǜt\�Ii\���׼&�(<�\�\�7�=�h�#�\�\�۲����ً^���׽\�;���_�\�Wf��R!\�\�\��Pt\�\�|>��\�Rҋ\���\�/O�M��矿y*\"\Z�|;�˕\�Sn��!�\\~\�3��=\�Y\�J�w\�UWe{\�w:��\�{d��\�\'�?��\�[�\'\Z�����&\��Q���6I+W�\�~�_�\�ؙx��\"~��KkC�\��;[�n]\Z����hc�\�\�O~r�\�\�w瓟�d�\�_��\���Ӑ\�\�u�ϮE\��=��vuu=6�W,�/O��]���N\'�f͚�Ws�\"���\�\�SNI 6�1JsI��&�\�{o:4#Co{\�۲]w\�5{�\�_��\�O>�\�\�E\�i�\�q������س.��޾��\nE��*�9MR43���\�h\�^��\�|?��\�M\rѹ瞛\���C`Qx:i�b�+����ѣ\�\�h\�y��\���>��4\�T�~\��&(��e\�|\�;�W�\�[�D���oM�Z���0wр\�\�\�F�_g|g^�\��C���ԧ\�HT\�����j�\�\�\�+�\�\���<�|\�\�5iҤ��uH/\�P�;\�\�J��\�F\��FS�Х�^�aĜ�b�(6ڋ/N\�ƨRN�MTl���\�>��w\�y�@\�hA��xLll:i�z�z+�j�\�s\�c�f:Fx\�\�]4\�\�`Ĝ�ȿ�=#\�\\�\�\�]\�M\�a\'MTDR�Q\�X>��5�|�(F�\"ϋ\�񊜎\�A\�[��{W_}�摨x��\��ߞ��\�<~\�s��\"~\�e�]\�hk�\\F�1\�R\���?�!}Z\��O�\r�\\Mԩb�\�\�\�c��/\�G;찍�>�h�3\�W��\�\�e��V��*E��Q4-1�s\�g��t��/��(TQ(Z�/��hpb\�w�N8!\�߈�\�h��\�o��\�,\�Km\�p^L�C�}}=��N5U�9\�\'1D\'#\�����f\'�MZ�\�{3���\��\�̺��RCMRqFh1\"U�b4)FNc\�y�b\�(T\��G>�\�{\��\�\�\��h�ʇ�^�\�W�\�-��Q��\��\�\�y\�&*&\�ǎD���\�\�$\�s5Q��\'�,]��\\\�*���3���\\]\��\r\�MӦM\�T���Ѧ�O>��<Y���{��ZtzѴ\����iӆ;ѵ��|\�c\�jU�D\�\�16k�\����}L?\�s\�\�#Qy^�BgO���F(:\�T\�\�8\�yM{�\Z�\�b\�)\Z\�|�)b2wq\�fo��\"\�l�?��ٯ~��4a;\�m���9K\�~��S#4s\�\�4!��*/�?�_L?\�{\�\��)�\'EM\�\��\��\�c\�,^__Gd\�suQ��&\'��k׮-׵>��L�8�Q(uq�1b\�.�\�d]lXB�A8;O�\��<\�\��\�mT*b�6&\�\�\�\�\�ۍ��֑�8;)���\�\�K�q�v\��&*F���=��DL\�-?O�\�ݺ\�]�޾��E�����D\�\\\\Z �C\�w\\:�\�+F�b\�T\�L^�	ۿ�\�/7\�\�-�={v�c�>���n�3C�\�a�\�Yr?�\�OSc\'C<\�iOK�\�\�\�a]�`A����%\�~�\�\'YD3\r~4EŜ�8\�/\�P��`\�\Z1�<�|{D�?�!�\�G��\\�[�\�;�sDL4�����NB>W�*�[��f\'����T<>o�7�@\��\�ņ\��~�ȋ\�\�+V�(\�\��K�D�w\�ȑ���s8�Ztz�FD�{�Qlb�S�8[)F��e\�L����%&yO�<9\�I�т	��\'&\0o\�\�* }y=��N5U�9�|]�h�b�3\� ./#Q1\�(.u\�z{*{\�k_��\�%/I\rQ�q\�\�\"�\���F�=Q�\�\�\�j\�|��\��\�1�\r\\4�q�2\�X�Ѯ�}\r�\�?�n\��kc\�T_\�\�\�J#P\�ņ\��\�ƍ;���\Z�\�����T~�\�j\���N5�^!��Oԯ\�F*\�HŤ�N\�ڋ\�b�\�9P\�\�S�(:\���\��\�_����\�cy���t\�\�):�\nE�\Z�\\��\���{Dꁖ&(���{c1.��\��o��\��-�1(\�u�\�F�\Z�s\�5\�\�\�\���k�Y\�\�u��\�V����ɓdq\�c=\�u�8E�^�\�T#�\���E=��Vj�z\�\�p\�}�\���\�o\��\�����^�hѢ�V�\\�P\�3��׿��d\�7^t\�EO�4)�ke,\�t\�\'�\�\�+�j\�s�B>��.�i��\�\�p\�}\�	y�n~qͧH��w~�\�\\q�s�N�BѩF>\�+\���Sa;Rt\��N5�^!��FSt\��N5�^!��FSt\��N5�^!��FSt\��N5�^!��FSt\��N5�^!��FSt\��N5�^!��FSt\��N5�^!��FSt\��N5�^!��FSt\��N5�^!��FSt\��N5�^!��FSt\��N5�^!��FSt\��N5�^!��FSt\��N5�^!��FSt\��N5�^!��FSt\��N5�^!��FSt\��N5�^!��FSt\��N5�^!��FSt\��N5�^!��FSt\��N5�^!��FSt\��N5�^!��FSt\��N5�^!��F�9s\��\�\��\������s�7/:ʟ��\��	�4ޜ9s\�]�bE�\r����\�;\�ϋ\���gD\�\�s}B>�7k֬�fϞ�v��\�+\��o�\�\��\�w\�q\�yy��+�=˟��\�\�?\�30�Ć.��x$\�0�A�x\�\��Wp�A��\�\�|\�>!�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\��y(pOw\0\0\0\0IEND�B`�',1),('5d1410a9-c28b-11ea-b0fd-96e6f7651f71',1,'经理级别-差旅报销.bpmn20.xml','5d1410a8-c28b-11ea-b0fd-96e6f7651f71',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"Expense\" name=\"经理级别-差旅报销\" isExecutable=\"true\">\n    <documentation>报销流程</documentation>\n    <startEvent id=\"start\" name=\"开始\"></startEvent>\n    <userTask id=\"fillTask\" name=\"报销申请\" flowable:assignee=\"$INITIATOR\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[true]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <exclusiveGateway id=\"judgeTask\"></exclusiveGateway>\n    <userTask id=\"directorTak\" name=\"财务审批\" flowable:candidateGroups=\"40283e816f92646d016f926a76fd0003\">\n      <extensionElements>\n        <modeler:group-info-name-40283e816f92646d016f926a76fd0003 xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[财务管理员]]></modeler:group-info-name-40283e816f92646d016f926a76fd0003>\n        <modeler:activiti-idm-candidate-group xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[true]]></modeler:activiti-idm-candidate-group>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <userTask id=\"bossTask\" name=\"老板审批\" flowable:candidateGroups=\"402855816f1e2a2e016f1e2a45510000\">\n      <extensionElements>\n        <modeler:group-info-name-402855816f1e2a2e016f1e2a45510000 xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[超级管理员]]></modeler:group-info-name-402855816f1e2a2e016f1e2a45510000>\n        <modeler:activiti-idm-candidate-group xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[true]]></modeler:activiti-idm-candidate-group>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <endEvent id=\"end\" name=\"结束\"></endEvent>\n    <sequenceFlow id=\"flow1\" sourceRef=\"start\" targetRef=\"fillTask\"></sequenceFlow>\n    <sequenceFlow id=\"judgeMore\" name=\"大于500元\" sourceRef=\"judgeTask\" targetRef=\"bossTask\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${money > 500}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"judgeLess\" name=\"小于500元\" sourceRef=\"judgeTask\" targetRef=\"directorTak\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${money <= 500}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow2\" name=\"提交\" sourceRef=\"fillTask\" targetRef=\"judgeTask\"></sequenceFlow>\n    <sequenceFlow id=\"bossPassFlow\" name=\"同意\" sourceRef=\"bossTask\" targetRef=\"directorTak\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ handle == \'同意\' }]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"directorPassFlow\" name=\"同意\" sourceRef=\"directorTak\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ handle == \'同意\' }]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"bossNotPassFlow\" name=\"退回\" sourceRef=\"bossTask\" targetRef=\"fillTask\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ handle == \'退回\' }]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"directorNotPassFlow\" name=\"退回\" sourceRef=\"directorTak\" targetRef=\"fillTask\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ handle == \'退回\' }]]></conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_Expense\">\n    <bpmndi:BPMNPlane bpmnElement=\"Expense\" id=\"BPMNPlane_Expense\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"BPMNShape_start\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"45.0\" y=\"135.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"fillTask\" id=\"BPMNShape_fillTask\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"165.0\" y=\"110.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"judgeTask\" id=\"BPMNShape_judgeTask\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"345.0\" y=\"130.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"directorTak\" id=\"BPMNShape_directorTak\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"495.0\" y=\"110.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"bossTask\" id=\"BPMNShape_bossTask\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"315.0\" y=\"255.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"BPMNShape_end\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"720.0\" y=\"136.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"flow1\" id=\"BPMNEdge_flow1\">\n        <omgdi:waypoint x=\"74.94999923927439\" y=\"150.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"164.9999999999684\" y=\"150.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\">\n        <omgdi:waypoint x=\"264.9499999998728\" y=\"150.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"345.0\" y=\"150.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"judgeLess\" id=\"BPMNEdge_judgeLess\">\n        <omgdi:waypoint x=\"384.9444614102993\" y=\"150.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"494.99999999997226\" y=\"150.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"directorNotPassFlow\" id=\"BPMNEdge_directorNotPassFlow\">\n        <omgdi:waypoint x=\"545.0\" y=\"110.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"545.0\" y=\"37.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"215.0\" y=\"37.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"215.0\" y=\"110.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"bossPassFlow\" id=\"BPMNEdge_bossPassFlow\">\n        <omgdi:waypoint x=\"414.9499999999431\" y=\"295.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"545.0\" y=\"295.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"545.0\" y=\"189.95\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"judgeMore\" id=\"BPMNEdge_judgeMore\">\n        <omgdi:waypoint x=\"365.0\" y=\"169.94312543073744\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"365.0\" y=\"255.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"directorPassFlow\" id=\"BPMNEdge_directorPassFlow\">\n        <omgdi:waypoint x=\"594.9499999999675\" y=\"150.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"720.0\" y=\"150.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"bossNotPassFlow\" id=\"BPMNEdge_bossNotPassFlow\">\n        <omgdi:waypoint x=\"315.0\" y=\"295.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"215.0\" y=\"295.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"215.0\" y=\"189.95\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('5d254eba-c28b-11ea-b0fd-96e6f7651f71',1,'经理级别-差旅报销.Expense.png','5d1410a8-c28b-11ea-b0fd-96e6f7651f71',_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0Y\0\0\0�Ck�\0\0,CIDATx^���\\u}8pT�h����hǡ##��uZm�H6a\n��w��$�	�G�bQ,��5�E���C1����� Ʌ@(	�����4{��sw�n����;{?����{Ϟsv��o������ٝv\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�Ѵ���gB!ZG9w@r,���I\0*A�hM��,���I\0*A�hM��,���I\0*A�hM��,���I\0*A�hM��,���I\0*A�hM��,���I\0*A�hM��,���I\0*A�hM��,���I\0*A�hM��,���I\0*A�hM��,���I\0*A�hM��,���I\0*A�hM��,���I\0*A�hM��,���I\0*A�hM��,���I\0*A�hM��,���I\0*A�hM��,���I\0*A�hM��,���I\0*A�hM��,���I\0*A�hM��,���I\0*A�hM��,���I\0*A�hM��,���I\0*A�hM��,���I\0*A�hM��,���I\0*A�hM��,���I\0*A�hM��,���I\0*A�hM��,���I\0*A�hM��,���I\0*A�hM��,���I\0*A�hM��,��.]����;/�4i����\0 )\Z{�Ʋ,�?6lظnݺ��C��|9\0$Ec�زeˮ˶�?��S�N�\\^\0���jŊ�l�R�볭[�n�={���I�^Y^\0����^�ǿd``���~�X6}����@4�\0�[�t��M}�e�]�Ԕ)S�,o\0=�7���&��/֬Y��M�6��cpJ6o����{�ĉw.o\0=�7�4��X�`�X�j�=�f���{�];u�ԓ��@OŌ|�f�l=0�M�4�%�/~��ȗ=��?����~y\0�31#ߠ�7[��={�<��s/���:O�p�	�������o�ԛ�ƽ8v��+�x�����~�����坎� 	Mf�\'���f̘�w+W�|���oٲ��ӧO�Yq\0HJi��l=@�s�=��[su}��X�������*��O,_0��7��x��Ժ�5k�\\���G|�,\0I��ڗ���N�w܁�ׯ~ݺu�!�r�ԩS\'���$�f����_]t��w^��9�|\0}\"˲�._��ʛo���y��e7�xc%#\Z��D~�o]�h��������\0c���UW]U���Y��\n!O�!/V�ϓe600�mܸ1{��D�#����.\\�!/`��#`l�K�\\�z��eU	y�\r1ɲ�DE�c͚5��uk�1Ɩ<�Nȓ\0-���U��꧈�!/X�ʏ0���tB�h!�],\'N1v�G�1Ɩ<�Vȓ\0M�[�~�Ԛl�mgK~��E�ﱬ��Y(X�y2��\'�h�`=����fgw^���\"��e��E�`Az�ɴB�h�����k��Z<��GC�����\'�\ny��v\n�}�R�j�������\'�\ny��v\n�=7�R�j�������\'�\ny�	+�P� =�dZ!O4�N���;�U-�����P� =�dZ!O4�N�z�_R�j�������\'�\ny��v\n��ޕ��3��X�������\'�\ny��v\nVĊ�/R�bYy=1�P� =�dZ!O4�V�ڴ){���X�\rY_t\n�G�L+�I�&�+X�Ky��bU��̷*�^(X�y2��\'�hZ�6m��<8?��ǧ)R�ub]�R#�#O��$@�\n�p�O�¬��C���ȓi�<	�D�����S��m��퇂��W�0�ȓi�<	�D��U.B;\Z����C�Jʄ<��d�\'�\ny��FK�](Xɨ5�\'m�����ɴB�hB�J+�$�g��3�ȓi�<	Є��V(Xc�Y�l9�<�Vȓ\0M(Xi��5��kއ��>%O��$tY�e/���?v饗�䬳�Zw�)�l<�#����٬Y�^8餓�Η-;��ϛ1c�n��;\nVZ�`��v��vף�ȓi�<I#�&MzC�wΚ2eʵ��[�x8��m?oݶ|V�Wޖm�~����_�={��3g��.����[n�~���fO<�D�g����C=t�1�����۷�?zO�J+�1������O�ɓi�<I�ɓ\'�7싶5��Ƣخ��q-oԏ:��7����7ߜmٲ�h�����{�Gy���ԛ���w��B��N��N����ɴB�$D��7��7h�w$��}hޛ��n����͝;7ۼys�woKl�|����:u�>��7��B�꩑6�#ݞ��\'�\ny�ɓ\'���O�7�p@���~6�7o^�#Gby\\땚�\'c�����EW]uկ�8�����߾S�P�g�̙�N�6�����}\nVZ�`��h5壵&O�����7��M��Zc>}�����F�~��r��P���vu�����u�����5kV600P��F$�7cƌg��+�1�`�\nVO�v3>��#1�dZ!O�_�f�����>:[�bE��lKl��7���馛���~�f����n=���O�4i��u�=\nVZ�`u]�	Qm��#�ە�K�\'�\nyr|��pڴi�k��i���mذ��N��>�S��?1.�����3����8&�������������=\nVZ�`uU�����[y�}?�m�mW�?}B�L+���)o����ԏ������f�疯��\\��_���t�A�v��gΜ��S����V(X]Ө����k�Ns_�������]\'O�����픖���wz�M3���c�������~����)*{���E|�����Aw(Xi���͚�FMz�����ܶ�^�룢�ɴb�<9gΜ��Qm�֚���k7�~�f����馛>z�a��}������_5=��F&��X^^�`��������pMv�f�Qs�h�FM}�p�K�W�dZ�,O�]�v�U�Vݳx����8�s&N��sy���sp�7�n��;NU���ovT��T�[����Kn�o���:�)S�Q�-���Ug�\'���V4+X�]�㹤��Q�^��7��US_���3F�W�dZQΓy��K�~qӦM�3��z/\\q��Θ1����%-�<������}��[}���u�mz��g?ޫ�pj~�ӟ.��ԫʷ���=YZ>i���\\��_��:;�T7j���xK������fGo=�\'ӊ�<�bŊ	������+W>��~ҤI��LIC;����j���a�!U����ҟ}��\'��q�������x����z[��оO��O\Z+���7�`7��t�L7j�(��#M}M���.k0�\Z�+y2���#��eˮk�0᭹|�gN8ᄃ�~��7�9��������h��6�g:k֬�O>�d��\'�x��}�|[h_�\'I9�\'���Vh�k0~�Q��F�D7j�G��׌�v�\r�Q9�q%O�q��\r6�{��_����.��I�&�^��Ϲr�sp]��n��������>4>H��/����ʯ����B(XiE���G^��]v�%\Z��yl��7���{�g�8�|�E5B�L\'V�^��w�yٺu�ʭðb�ض����D������m*\'�p�ᇿ��WHe�?�������R���u�`�1|���3��9�lٲe�E]��N:�l�ĉ���{l���̙�}�S�*��~��bYl�f͚\"��Q�3fd����+G��\\���ڵk�}�K_*����[��ߋ0c�X�q�p<�4��V3��ΖӮ��.���xj8�z�\'����eq6�ȉ���/~񋃗���6��+_��������O?�ȵ_��ײ��~zȺ����{�c�9&��<���ub��v[v��Wgw�uW�F���},{�G���͸ꪫ�;o~2��Ƿn�:��8Y�9������q�k�>\r�{C����Gk˻ݏ�����{���4�������ئi�$���u��f�zhn�t�AE��h�<����g�\\7����.��w��]��_����+��}�CE��k����~�(NGqDQ��������_��_�#�<2���;��(��o���B��Mo*�\'n�_��_��UQ���7��xަ�&�QS_��魯����e펫^��x�<\"~�|Q�,oh�(o��#�H������8��o��o�7n�nݘЈ\r�x���VD��x���/�n����^{mq�7���\"OF�oK���\'�N�:y����><�e˖_Ǉg����X���2��y����uꩧ.��Yq~��^��~\Z�GZ=I���`�w�}�W�����菊)��׾���3O�\n�w���_�BѰ�ߟ��g�F���}�����xKuժU����S���=���يSXE�\\�x�v�q�-�q�M7e���g�?��?���� {�;�Q�E�\r�_�\Z����uv��n���1��Ί�#����z��qի<Y��>8{�ߘ�v�i�_��_dѠG��ܶ뮻�������b�M�6e����Y�ș1!�����G?��������O�DĻ����~���ӟ�tv�5��\\�2��K���o}k���{�*���)��RL����C��Q�\'�l7ӧO���.{j����ֵO�~����/{$l/pV�4����YqF�Yg�u^��c��G�����H�\'I�^��U�8���f;f��g|��QGU4�Q�귉������ŋ�X/\Z���l����wf�s���K�.����!��?��b�)�����w�}��=�yO��q���oQ�˿�Kv�	\'�0\n����}\\_Ƹ�X���t+4���;�K�m��5������4��^?c��qի<Y�h�_��W3���^R�^~�����w+�����]LPĻ�y3;8N㐕�#���o}�[E�1��G�;��������=��3�l}����s�=��w޹��ȱq�PLĔ��[�(O�=Þ�wܽ��O>���O<����c{g,/�K:�y:��(��n3g����)�FC~=k�;���Ư���`Ec���뿊�~_��W�$f���w�b�(N7�pC��~pp&�����5��[Q�j���o[�t5�����\Z���z�(��}�/��������cv����z�!�C7�Q�bD�k�5��~�h�V��p�K��:OF��>&j����K��)./o3�q(b�� 1��F����-f�k�~F��y9\"~?�裋(�?�3�-�6mZq�O������O2y2�iv�ԩ\'G?}�l��7���@q=q}}݇s�1+zu8��_��;����@w��`��7�)\Z��*�׼�5�a3�t�L�ܹs�SO=�x�Ʊ��~�� f�^�W��-\n]�����wb�>��Nc3Qqy���GE1�C}j3�Q�|��!�K7�Y�bD�5ٍ��FM}M��5�ͮ���U��E4���f���\'��Z��<r�{�݇g�Y��+�w6cݿ����^�җ�|���B��E/�N>��⃁���\\�.rkD���w/k���W�*����(��?(���P����v�\'�̙3�3X���k3����7ʭ㨈�֮�����I������͛��è���p~g>�\'��ʷ���U��vŇ��	S(�[�����|qf�8ƽ�~|�6f�cy�p��}��6c3S��E�q�q,j�Cq���w��֯5�1c������h��x!�V�A������`ѱF��A;����4j������Pq�ʓ�8�3��3�q��8#M�8�X��E}�ٽ\"�Ƌ��i1����|���т���5\Z��8o~󛷛@���8�\'���Sn��zc$�	-_O7B��/�5��uŊ�rDbӦM�������C�&g�ܹs���Q�5o�.��й��{z]����GD���5k֪�(\Z�����X�Ռ}�xqp饗��xW��/���h���e��P�;N�Y?cg�����r�]ߤ����4ۮ��D���\r��>����w�[_�th��G�]�L�2xX͉\'�X4A�\'�E�Ĉ�=�6�������]o���wY�3P��!>p����Nyr|����x��[<OFC�稣��R7[?>��I�&�7Q�ħ޻!O��w暸��u�=�x7\">83Hј�,{4�1�\r��%K��ߜl	��{m���V,�cGc����X4�Ֆ���NW��e�w\0��}��a����,Y��/o��P����|GS3��6�5�������*O�\"�A<��s��uM�sbL`���9��pk�mj�,��8>������!��u���(/��Y�x��6�	��~�${��PL~��19s�Wپ!O�O��}��<�\Z5��>��_������U�\'�}���ف���}3\"y��Q~g��<y���뤻zU��\n�6r~���&�&��=N��lOy���+\"~��M#}���m�8�ڷ���!�U�VŪ1�#������}��^W�1\'f���t3���&|��Gbz�\'#���\\�	�8�MD4���o�C�[����t�9�c��nd�n�E�����ȁ�E��y�������3�͛7oȺ�\nyr��>1�_�������خ4S�¸�C�M�v�3����m3��b������e�Ç��3�Ռ��~H�<�Vȓ�[���}�s|m�l9�^�_L�����>4^�p�믹���~�6>(������R\"��B�꩑6�#ݞ��\'�\ny�m3�O�5��a��En�nR��������xR�S�o�_��0s����_<��y���.�����w�y\\�)��Q��\n��:m�;ݎ\n�\'�\ny��c���&}GCZ��D��O��aΜ9w篈�y��V�[��wy��c�=�|ɒ%�_}���s�1�\0����ũ�*@�J+�1��M���O�ɓi�<I�Zڠio���l�f�Y�+�k��礏;/~޺m����&�\nR��\nk̴۬��}D�L+�I\Zч�N\nVj�`�����.�Oɓi�<	Є��V(Xc�Y��l9�<�Vȓ\0M(Xi����r_��qF�L+�I�&��B�JF��?i�OM�8&O��$@\nVZ�`%eB|�*~�/`|�\'�\ny�	+�P�Ҳ��g��\'�\ny�	+�P�Ң�\'ȓi�<	Є��V(Xi���ɴB�hB�J+��h�	�dZ!O4�`�\nVZ4�y2��\'�P��\n+-\Z{�<�Vȓ\0M(Xi����=A�L+�I�&��B�J�ƞ O��$@\nVZ�`�EcO�\'�\ny�	+�P�Ң�\'ȓi�<	Є��V(Xi���ɴB�hB�J+��h�	�dZ!O4�`�\nVZ4�y2��\'�P��\n+-\Z{�<�Vȓ\0M(Xi����=A�L+�I�&��B�J�ƞ O��$@���ۺq��!�S�>��au^�6�#Ǝƞ O��$@�-Z=000$y���C=ty^�n-?F��=A�L\'�I��ϟ��nX�f�:3Rc���f�ʕ���jU��#Ǝƞ O�}ȓ\0m�$3 y<�.V-.���,\Z���\nE��q�+V���S��m�SyrlB��b�@F7W�y���jb�m1�|9��F�~ OP	�Y�m��|9��ƞ~ O���,��(F�ƞ��\'���yjP��F1j4�T�<	@�bƩA�2Ũ��Se�$\0���Y�Z��bT�x*/���\'H���g�j1���K�eP�$\0���Y�Z��b�b,��Aȓ\0T��n0��\'�3\0��`�\r���x�,������\0T��E7W���JP���~b<P	\n�`\\�O�g\0*A���+���@%(Xt�qE?1���n0��\'�3\0��`�\r���x�,������\0T��E7W���JP���~b<P	\n�`\\�O�g\0*A���+���@%(Xt�qE?1���n0��\'�3\0��`�\r���x�,������\0T��E7W���JP���~b<P	\n�`\\�O�g\0*A���+���@%(Xt�qE?1���n0��\'�3\0��`�\r���x�,������\0T��E7W���JP���~b<P	\n�`\\�O�g\0*A���+���@%(Xt�qE?1���n0��\'�3\0��`�\r���x�,������\0T��E7W���JP���~b<P	\n�`\\�O�g\0*A���+���@%(Xt�qE?1���n0��\'�3\0��`�\r���x�,������\0T��E7W���JP���~b<P	\n#���1�����*�I\0*A�b��14�A#_����*�I\0*A�b4Č|�f�l=}A��,FC��7h�����I\0*A�b���|���l=�\'OP	\n�%f�4���A�ȓ\0T���h*�ڛ��/ȓ\0T���h*��O,_U$OP	\n��6k_^Ue<P	\n��6k_^Ue<P	\nVZ�,{���˯��曟�7o^v�7�G~�o]�h��������0>ɓ\0T�������~�Tf�ƍ��{N�8�~����F��c��#OP	\nVZb�>��r�)zk֬Y�7���#�y�JP���ߘ�O#�q��M�ǈ�G�����1��S�]��Q~��I\0*A�JK����Z�-���l�O����=���#�=A�������?����fgw^���\"��e��E硱\'ȓ\0T����v\Z���\\;����#K~4d}�yh�	�$\0��`�������i�k�����ƞ OP	\nVZ�i��qΐ��qYy}�yh�	�$\0��`�Ec�Vh�	�$\0��`����>΂Sn�k�����ƞ OP	\nVZ�i���W�4�������CcO�\'�+-�4�O<zWv�O���ǲ�����<4�y�JP���Nc���K�4�����Yh�	�$\0��`����~Ӧ���.��ǲ�l�������I\0*A�J�p�}|���_�?���E\\��gG/4�y�JP��Ҵ�ߴ)[������:��/G�뚽yh�	�$\0��`��Qc?�,}�0{?����I\0*A�JK�ƾ�Y�fۖ�\'��=A����4j�����Fy�����I\0*A�JK��^�]h�	�$\0��`�Ec�Vh�	�$\0��`�Ec�Vh�	�$\0��`�Ec�Vh�	�$\0��`�Ec�Vh�	�$\0��`�Ec�Vh�	�$\0��`�Ec�Vh�	�$\0��`�Ec�Vh�	�$\0��`�Ec�Vh�	�$\0��`�Ec�Vh�	�$\0��`�Ec�Vh�	�$\0��`�Ec�Vh�	�$\0��`�Ec�Vh�	�$\0��`�֜9s^\\^VOc�V���x��I\0*A�ꍵk��jժ{/^��g�q�ĉw.�4�iE�ƾ�Ǔ� OP	\nVweY���K�~qӦM[�m��+����3f�]y}�}ZQn�w��?ȓ\0T���=+V��000�X�,[�r���{��\'M����6\Z��������?ȓ\0T��5��o�e˖]�e��nS[sy���	\'�pPl��O+���F�x��I\0*A�\Z]K�.�Ć\r6���_����.�莫��jHs)�.n���l$��I�v/��G���`�ы��;/[�n]��Vl��>V�^=����xF�����	\0�����9s�O�ϟ��֭[�?v#�6�Y���C9��y�;�3�����>��e���狿�\\v�e1c��z�~x6cƌ�g�\\v�wd�~���w��]�m��6d���{ov�1�d_��\\V�N~���ꫳ��+�5kV���},{�G���͈�`$��{\0���:u��ٳg����-[~���Gb�خ���?����/|�ف���e/����7e�W3��n��=����ms�Aq�wf{�W��K^��}�{_v�Wdyc;����_��t�I�񶷽����y�]x�����C-��k�-.��7�Y���(��nG�ó�>�\0\0�8;����/��˞ڼy�u=�ӷ�~����ɛ����8˗//��h�?��d_�җ�����o~���V�\\�]r�%�+^񊢙�0aB��{f��������?��O���g?�>��Og�\\s�v��u�]�����o���{��{���`c�)�d�\'O����!�Ս�?+N\'�\'\0\0}dʔ){w�q���>��??����\r�����n/��k����f�����\ru-v�}�b�~�}��|������}���b����|gv��wg���-oyKv����Gyd�hѢ��cͿ��oeGuT��k_��\"����?���׍���=���;���;�sq{v�e���w��!�K��|��#�\'\0\0}&��t�ԩ\'�\r����7����߸qcq�����ಋ.�(�c�=������~D4�;mk�k\rx̠��<q�}�X�t�v�q�E���|���G]D�:>�����}6mڴ�#�H1c�	��>�C=4d�nF��>��x\0Ч�̙���z�l��c���Ō��_���.Ȯ�����e˖m��9�3xL}_?a��h�~4��!����k^S�+�W����=^@�6��~��_e�y�{������~��/��)��Ѭ����\0`�\Z��>�h�7��h�����;~�F?�������_����_|qq��8���`Ѥ��S�8�M4��Cq���7�g׋��[n��8ܦv(N������mzꩧ�\\O7b��\0\0\Z�ecM���gp@ѠǱ�����}��٪U���.Y��8�>֏c�#Ⱈ�8-e4�р��u�+Ί���O���s��w�qE���6����o�O=����o{6u����q�}��n��\0��4jt{?���)S�g��-[�`A���}�h��׍{	ى\'�XS�i�e��?����?�Sq&�f籏�����򈘅���_���8KO~��&ċ��=\">L�����Fh�\0��X5�q��8�Nugũ�W���֍3����\'>��T�q�X��q��{������rqNDyyD�gΜ9��4�<���݂xa_�U^�W��\0�#c�؋ơ�\0�#\Z��Bc\0@G4�i��\0��h��\n�=\0\0�ا\Z{\0\0:��O+4�\0\0tDc�Vh�\0��>���\0��}Z��\0�#\Z��Bc\0@G4�i��\0��h��\n�=\0\0�ا\Z{\0\0:��O+4�\0\0tDc�Vh�\0��>���\0��}Z��\0�#\Z��Bc\0@G4�i��\0��h��\n�=\0\0�ا\Z{\0\0:��O+4�\0\0tDc�Vh�\0��>���\0��}Z��\0�#\Z��Bc\0@G�͛�u�ƍC\ZL�����yc���\0��-Z�z```H�)z=���yck�1\0�a͟?��.ܰf͚uf��&��}�ʕ+/˛�Uy�W~�\0\0�-�L�Lq��1ޢ��{���z\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��F�\'�H�;o\0\0\0\0IEND�B`�',1),('e5381dc3-c191-11ea-8e4d-96e6f7651f71',1,'员工级别-报销流程.bpmn20.xml','e5381dc2-c191-11ea-8e4d-96e6f7651f71',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"Expense2\" name=\"员工级别-报销流程\" isExecutable=\"true\">\n    <documentation>员工级别-报销流程</documentation>\n    <startEvent id=\"startEvent1\" name=\"开始\"></startEvent>\n    <userTask id=\"sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8\" name=\"报销申请\" flowable:assignee=\"$INITIATOR\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[true]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-4A04755F-E8EB-4ADA-959C-69CDD2B166C2\" sourceRef=\"startEvent1\" targetRef=\"sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8\"></sequenceFlow>\n    <userTask id=\"sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A\" name=\"部门经理审批\" flowable:candidateGroups=\"40283e816f92646d016f92705173001a\">\n      <extensionElements>\n        <modeler:group-info-name-40283e816f92646d016f92705173001a xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[部门管理员]]></modeler:group-info-name-40283e816f92646d016f92705173001a>\n        <modeler:activiti-idm-candidate-group xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[true]]></modeler:activiti-idm-candidate-group>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <userTask id=\"sid-7C468FA0-CF11-4C38-80C7-1CBAC3CAED79\" name=\"财务审批\" flowable:candidateGroups=\"40283e816f92646d016f926a76fd0003\">\n      <extensionElements>\n        <modeler:group-info-name-40283e816f92646d016f926a76fd0003 xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[财务管理员]]></modeler:group-info-name-40283e816f92646d016f926a76fd0003>\n        <modeler:activiti-idm-candidate-group xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[true]]></modeler:activiti-idm-candidate-group>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <endEvent id=\"sid-B637838A-8E37-481C-8131-A50DEC3D3812\" name=\"结束\"></endEvent>\n    <sequenceFlow id=\"sid-39209A63-834F-4027-9105-032D12A10F23\" name=\"提交\" sourceRef=\"sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8\" targetRef=\"sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A\"></sequenceFlow>\n    <sequenceFlow id=\"sid-9A6178EA-6108-4D9B-8310-3C5F078B7B03\" name=\"同意\" sourceRef=\"sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A\" targetRef=\"sid-7C468FA0-CF11-4C38-80C7-1CBAC3CAED79\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ outcome == \'同意\' }]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-DF0CDE91-3C56-4068-B6F6-02FB82B40359\" name=\"同意\" sourceRef=\"sid-7C468FA0-CF11-4C38-80C7-1CBAC3CAED79\" targetRef=\"sid-B637838A-8E37-481C-8131-A50DEC3D3812\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ outcome == \'同意\' }]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-9F5A558A-4B27-4FB6-9225-7BEFD35F952F\" name=\"退回\" sourceRef=\"sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A\" targetRef=\"sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ outcome == \'退回\' }]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-58CBF731-1CED-43B2-A876-AD1B6BCB8365\" name=\"退回\" sourceRef=\"sid-7C468FA0-CF11-4C38-80C7-1CBAC3CAED79\" targetRef=\"sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ outcome == \'退回\' }]]></conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_Expense2\">\n    <bpmndi:BPMNPlane bpmnElement=\"Expense2\" id=\"BPMNPlane_Expense2\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"40.0\" y=\"103.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8\" id=\"BPMNShape_sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"135.0\" y=\"78.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A\" id=\"BPMNShape_sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"340.0\" y=\"78.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-7C468FA0-CF11-4C38-80C7-1CBAC3CAED79\" id=\"BPMNShape_sid-7C468FA0-CF11-4C38-80C7-1CBAC3CAED79\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"545.0\" y=\"78.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-B637838A-8E37-481C-8131-A50DEC3D3812\" id=\"BPMNShape_sid-B637838A-8E37-481C-8131-A50DEC3D3812\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"740.0\" y=\"104.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-39209A63-834F-4027-9105-032D12A10F23\" id=\"BPMNEdge_sid-39209A63-834F-4027-9105-032D12A10F23\">\n        <omgdi:waypoint x=\"234.95000000000002\" y=\"118.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"339.9999999999998\" y=\"118.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-9F5A558A-4B27-4FB6-9225-7BEFD35F952F\" id=\"BPMNEdge_sid-9F5A558A-4B27-4FB6-9225-7BEFD35F952F\">\n        <omgdi:waypoint x=\"390.0\" y=\"157.95\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"390.0\" y=\"221.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"185.0\" y=\"221.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"185.0\" y=\"157.95\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-9A6178EA-6108-4D9B-8310-3C5F078B7B03\" id=\"BPMNEdge_sid-9A6178EA-6108-4D9B-8310-3C5F078B7B03\">\n        <omgdi:waypoint x=\"439.9499999999582\" y=\"118.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"544.9999999999998\" y=\"118.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-4A04755F-E8EB-4ADA-959C-69CDD2B166C2\" id=\"BPMNEdge_sid-4A04755F-E8EB-4ADA-959C-69CDD2B166C2\">\n        <omgdi:waypoint x=\"69.94999891869115\" y=\"118.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"135.0\" y=\"118.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-DF0CDE91-3C56-4068-B6F6-02FB82B40359\" id=\"BPMNEdge_sid-DF0CDE91-3C56-4068-B6F6-02FB82B40359\">\n        <omgdi:waypoint x=\"644.9499999999747\" y=\"118.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"740.0\" y=\"118.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-58CBF731-1CED-43B2-A876-AD1B6BCB8365\" id=\"BPMNEdge_sid-58CBF731-1CED-43B2-A876-AD1B6BCB8365\">\n        <omgdi:waypoint x=\"595.0\" y=\"78.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"595.0\" y=\"32.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"390.0\" y=\"32.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"390.0\" y=\"78.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('e5462784-c191-11ea-8e4d-96e6f7651f71',1,'员工级别-报销流程.Expense2.png','e5381dc2-c191-11ea-8e4d-96e6f7651f71',_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\n\0\0\0�\0\0\0�\n��\0\0\"�IDATx^���Tu��qM+����أi�ty�_�.�=����X6�P)�J���fԖ]��R)	��h�H,�\n���@�\"�,˂������i�v���r�^f�3��z��0sffwv>�����٣�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Hh��Ꭲ�t��\0\0����\0�\0\0�	4=@:d\0\0dM��\0\0�@��Cf\0\0@&��\0�\0\0�	4=@:d\0\0dM��\0\0�@��Cf\0\0@&��\0�\0\0�	4=@:d\0\0dM��\0\0�@��Cf\0\0@&��\0�\0\0�	4=@:d\0\0dM��\0\0�@��Cf\0\0@&��\0�\0\0�	4=@:d\0\0dM��\0\0�@��Cf\0\0@&��\0�\0\0�	4=@:d\0\0dM��\0\0�@��Cf\0\0@&��\0�\0\0�	4=@:d\0\0dM��\0\0�@��Cf\0\0@&��\0�\0\0�	4=@r���_���v�\\�$�:\0\0���DH�9���������nԨQ��\0\0J\n �\r6��:����,//�o\0\0P2�(\0GVWW7���-�\'���������\\.w��-\0\0@I`�\0�,���а�s��A�UTT\\�o\0\0P�(\0=����֟$Df͚�gذa���\0\0(*��`�&G�%�퀬���?�����yZ[[��0aº���c��\0\0�`P�gb�W�; �6o޼Ɵ�֭[����|�[\0\0����<�V\0O.�;f������o�����٩���\0\0\0(\ZZ1�3A`5ȣ�����\'1{\'M�TÊ\0\0(	Z9�3I`5��܃9s�l�g�U�V�d�a�Q\0\0\0%��U�2;\0GUYYyڦM��������***��G\0\0��x�\n�&\0=�>}����yB�.�s��-\0\0@Q�V�������E��E������An��\0@I�V��t5q��󚚚666��#G>R^^>��\0\0�$D�\n��\0�1cƃ���Z���_\0%�9���7�qŊ/^�-ZD���}ٲe�jjj��?��T2���Y��).����s熙�W��b(2�W���O���\Z\Z\Z����݁���w=�K�.m����l!3�_d���Jf�m���b)2�W��G��?�P������`\0_���`��Sd�8�;Ef\0��e�b��SJ��C0����#�Bf��)d�N�\0���E �����G����*2c��Ud@bI��Ի��������ҿu��շb\0����*2c��Ud@bI�}M[ݚ�U��;�qX�2]�oO����#3����Gfl��X��ɵ�w��ڲ��.�S�/p�Ȍ�\"3��[Ef\0$�d\0����]�t��=��b\0����*2c��Ud@bI�5��t���u��T��>2c�Ȍ}d�V�\0�1��*p�Ȍ�\"3��[Ef\0$�d\0קO�wT��ߞ�}1��Gfl�����*2 �$�c��������z_���[Ef�#3���\0H,�\0�k�ܚ���e��e��ߞ�}1��Gfl�����*2 �$��n��.�.��V���[Ef�#3���\0H,�\0���[~}�\\��.�S�.p�Ȍ�\"3��[Ef\0$v�\\����u���u����+p�Ȍ�\"3��[Ef\0$��\0�����q����.��_�F۲ק��\0n��Ud�>2c�����\r�Gڻ�]�ק��\0n��Ud�>2c�����\r�I��tW��T�b\0����*2c��Ud@b�pPN[��Qɋ�>2c�Ȍ}d�V�\0�����+p�Ȍ�\"3��[Ef\0$�\0n���#3����Gfl����b\0����*2c��Ud@bඊ�>2c�Ȍ}d�V��$��3V�X�3g�=u����.�l��q�ڇ�Ǝ{��K/�\\�aڴiՕ��\'��G~ඊ�>2c�Ȍ}d�V��r��k��v�a�n���I��_Wv\\>V���ͤ`�p�]w��������G�v�]w�������?�v���D_�]��G�\Z�6~���\\p�Y���pඊ�>2c�Ȍ}d�V���zz0X�1)HZ�t;��2#h�/�6m��K.�ĭX�µ����#�v�~	�.�������d���_ඊ�>2c�Ȍ}d�V�[ԣ\r��<��4� S�n���p��[ƌ��ϟ�Z[[��@\"��n���?U^^~��8`\0�V���[Ef�#3����1t��3��tO��?��s�5�\\�/^���]�뵝7Yح�������s���Ǹq�ܣ�>zx��K��ѣG?=bĈQ��e��b\0����*2c��UdƆ��LZ�F�����p�\r����oc��v�^��M�~��*)ZI;v�khh�>��UVV���l+p[�\0n��Ud�>2c�����XI�$\\|�Ů���o]��t��d�d{��˗_�IB�$���m?��r��)�cg��b\0����*2c��Udfp�1bDS��_~�容��oYS��u?��®��u��󸫮�j��)H���k\n~Aw���Uඊ�>2c�Ȍ}d�V���4���+	}�$Dt?���|���ڂ~�O7���I��G��3�\'�\0n���#3����Gfl�<��yNBo7��/~�B�������+���>Ҵ��^�a~��}d��b\0���ت#efʔ)��/Ca�[Ef�zϨ�׉�A�[U(�^w��埿��������3�=��W�ǒ����}��H8�)��.3۷o?i���kV�^}��+��nYYٱ�6�2S�Ef�_�,t���v5��hӤ�n���7�ѩ�%���|�͋��i�ԩk�\r6��^JEl6�㋗�Vu7�c����,?3��~Lmm�---�{���͙3gkee�i�m�7d�8����$YP�m���}/z���?z���u�M���P�E�����\r�����R*b/�_����Q8d�8+�����!\r\r\r;��>�iӦ�ӧO�S.�;>�;E�,2���d!���������~���}/���N�<y�ƍ��s@�_�~S��=�/�\"ϋ6�V1Q<y�Bf�����`Æ\rw&9|�=�fߤI������d��A����\']�|} �|�{^��{(�^w�ر�w����k׮}�����^JE��_዗�V1Q<y2��1XZ�nnn���G���tpƌ�r�����ɓ�Ȍ�\"3�/�k�/e�1��@�����c���.:���*x��y~��+p[��~({Ef�Զm�\\uu�kll��#�mt[��K��;Efl�@�������}w�3f̡��]�v�ܹax)̲��(c�d� .	�;�q#G�t6lp3f��g��K/�ԕ���_w��q��S�Lq���7�ꩧ�\n/�mT���a��Uee����y;��We��n��흗���?o�r��.��XQ<y�2`��k���������O?�n��~�����;�}�_tUUU�\'������G���?������w7m�4w�W�/�0����~��_}���s�q��ݍ7�f��_�zx�O��.�Ookݺun����\'?�I���m�}>����ns��׿�رc����e˖.ۧ��s��o��]SS�������Q8�\Z�������:�����\'+��4��?��������?�����t�ʿ�J����C�P�/�f��_��{�v�6*H[d����@�,_�F�t�[r+\n��ށ>^��{��R8n�=�X�\n=�O�0��\Z5J�~��|�+a�r5�j��4E�jr�O}J��{�����縉\'����~���`~��wN�|��p�7n\\8�?�y�K��җ�6U?�p��kp���>��p��v\'�|r�8�~��w�yOo�]LO�2�l�2w�UW�W����/x���>>�^ך��_\r\'\Z��?��ϰ�y���6z�뵫�o��k;�����ƈ#�ۼy�v����qꩧ�9s�tn�I�������O~�}��tA~����/o�	MtM�ՀE����%�������_�Ϭ̫4�������Ì���\'mE�)//\ZL�\Zz:1����!��<�[����E:��L��Q\n*�[��躠A˿�2���}�}��wd��W4�ؿ�a�Z�@�\"3�/I�s�B�}��߮-���z뭷/�3���Ӌ5�P����o���ܽ�E/\n5�/��;���0��߅{Y����\\sM�ؿ�t�~���%P5A��ڳda������I���ի{���?��˗����^�:��g>ӽ��s5u��2��Da�*3Z=P��U+�f.\\�/��b���}�}���u?���:���?�E��M���o�=���\Z�&h2�ɮV$>�я�{5���iUNٻ�K½�z�������x�{�k_������ɓ\'w�&>�Wi�O�k��[����7o^��M�6��o�9�O�{����8�p�e^�M�}��þ��ό>�%�d]?k֬=���Oǆ���V��)�nK𻽎Op���L�:���݉\'�Nt5�Vï��7D��1cƸ|0ܾ��%\\�����s�����=���|8����Z���I�0�O=꽩S�V��(o��K�e��Ӌ5�P����Ԍ�y׊��j��E]6�\Z����������q�vj����vX�z׻¦*ھ���}��v�zի½:�w\\X��I\'��>򑏄���]�~}�Pi��I��7�qh/�&\nz<�Q�1����T1Q<�̌\Z���#�����p�p�i��ٳgw�&��pcUx�?�DA�7���/|ax�^�K�,	vt�g��tQ��r�Z�vmش����D��EM�J+}���o�ܪ�҄_��g�OZ����}���{R�wM��Bq�ǆV>uh�v\n�?[�ʗ���:u�ĉ�<l��๼\'����ۇu��-z���ISj�_���+	���TM�����	\'���z�p��ո�9�|��$ݿo���-2���d����A�O=zt[������l����R�ku}T�\\͈���G�R�K^�pp�5�ZY�v\Z����3��L�J���%R�p�	�@tߏ?�x؀u�����&\n{��	�8t{�}���P�!�������ǉ��\rథ/�щ�jV԰�cW�^��ׇ�ؗ���a�����><�!��U�`�d���\n�IR��U�����DX͉��}Ȑ!��;�����\Z69��������{b�+\n���������&��&;*��T.��átx����PC=}�Xw��_�\r���\Z����2;x���ޔ^o�(�B��5��Nx����U�*k����k[��?��pU Z�VY�@�\"3�C=���e栯	G�W2������\nu�Q�F���ɻ����P���V�<�{��^r�&^{��ϟ*����Pm5T�}�s�����?~l���VtI&\n*����z��;�7��@h\0�Ǻ�,Y�\rణ/��y��jO�3��T\r��1Ps��u\"���3�kS��$�}�\n���A{>��u����A��&ʍ\Zת�u���}���㪉R���R��r�)��\\��y�$(x��I�_��0s��.��)m)3����2V_2ӛR<l�b�q]\'����M�����j�uގ&��V��=�Y�\n\'ZY�*��GN��+}�2�����Q�������_�~��(�^7�Y&L8�������*��\'�\'� ���Cj\0׉b�K�n�У7��M�^O���s���Pi��.�R�.�p���ў��5�΃б��z��F�RmM���_�*|5e�N5nj���e �H8__3�Ì49U��	�N��D9�(赭��0 m�fEA+e�~��æD�jM�5�>�+ZY�+�#�̩iRS��eI\r�V\0��+�j���.���76�מRҡC+��.�&Ic�&�����+I������u�W�Њ�&�:7G������x��~�5��{����/��oo)i����Q��h]]�ߦ���oĈ�j�&����o���ϟ������=hJo����cgU�p��P���/\r�:�Z+ڮ�\r��l̜93��\rA�j��Kǚ(����i�[�\Z_QЧ_0Q����ѡAz�E{:u��VԜ�q���jF���f��>�����馛�$u�sO?�\ZP��x����hE��V�<��o}�J��s�����5I���#}�Z�����;2c_���@Vsss8Iй��rK����n����^�E�i�O�\\�C3�����Ef�zШ��\"�^���碋.j��&�^����N	����m a�9x���8�cgU�m J\'2k�\Z}�h��&I\r���j@�7dȐpe ��N���:vT۫�@��Nr�+��>/*���\n����wG{v�+\n��ٹ��,p���5\nZQ�ǒj���ѡBz�О|v߳�C�t��o�����)-K�.\r�w֧����/קzi��C%��+ڃ��_\'��0>�ȬO\\ѡk֬	O�ԹB:�_�\n�	�&�jz�s�l)k��C~�N��J?��/�^!�VOax�����*�(����>I���������ӧ��f7$xO�$Y��yl�R�������v��׺�g�ߠCf�m�\Z��-23�ԃ�讨�׎��Nt�`�ٹ���/�^7�A3�tCC��<�I�;�\'n�СC��3�\n5��SԴ�9�jYW\05=�����{T��ΰ�oo�ҡZ����i���XQ�4xG�יJ��Q󥓨�$�c����f �ܾ�fF]�os���j�>���^+\n:���ҠC�^�ׄM���O���������N�O{�Ct(��J�Ѫ�&)�i��>mL����-2c__3���e&��ܨ48묳����a�*���Q�&^��N�h��_��W����Ef�zѠ\'=_Y��aH����p��{�#F������_++	��x#��ʺB�ԑ��>2c�Ȍ}d�V�ԓ�\':BB\'\"\'�4$m����$t�_6z]͆�=�ܦy��5��g���qN����]���b\0����*2c��UdƎ���ݱF?<<[��j�I���Pm�W�_����G�F�;s��a�NfJG����{�ݓ��,�5̞=���I{,�����_ඊ�>2c�Ȍ}d�V�[ԣ�W������^��㤖UTT4O�2�`6�f�����\n��v�رq�ڵ�n��y�Ǐדݨ�K�c�\0��b\0����*2c��UdƦ���3	��u�:����`�t{�ueP��z��ue��cK��\0��b\0����*2c��Ud�6z]��\0n���#3����Gfl����b\0����*2c��Ud@bඊ�>2c�Ȍ}d�V�\0�1��*p�Ȍ�\"3��[Ef\0$�\0n���#3����Gfl����b\0����*2c��Ud@bඊ�>2c�Ȍ}d�V�\0�1��*p�Ȍ�\"3��[Ef\0$�\0n���#3����Gfl����b\0����*2c��Ud@bඊ�>2c�Ȍ}d�V�\0�1��*p�Ȍ�\"3��[Ef\0$�\0n���#3����Gfl����b\0����*2c��Ud@bඊ�>2c�Ȍ}d�V�\0�1��*p�Ȍ�\"3��[Ef\0$�\0n���#3����Gfl����b\0����*2c��Ud@bඊ�>2c�Ȍ}d�V�\0�1��*p�Ȍ�\"3��[Ef\0$�\0n���#3����Gfl����ŋ�����e �\n_��a[0����#�Bf��)d�N�\0�,[�l[CCC���*|=����|��;�-d�N���@f���JMM�9K�.m���od���T��oڴiV0xo�l�w[J%3۶m�rY��).���b.2��4hhCPt�b��̙3���û\\^D��]�?�w����wV��Y�b����vs���r]��)2�]u�Ί23%Pd@6��%�(����9���������nԨQ��\0\0JB0A(�$�����nÆ\rw�555;��ˇ��\0\0\0�h5����������!mmm�<�����UUU5�r���m\0\0������Ѓ`^pLCCÎ�YB]VQQq��=\0\0@��VXU\0zP[[{�?I�̚5kϰa�N�o\0\0Pt�YM`Uȣ���Ė���s�imm}z	���ʎ�o\0\0PT�YM`U�c���k�Ɂoݺu����\'��\0\0(\ZGXM`U���rǬ^���?1��޽�� 7;��\0\0\0EA+y&~��\0t����������A��I�&հ�\0\0\0J�&�e\0�K�̙3g�?;��Z�� Cs�\0\0(9L��UVV��iӦ��$������-|�\0\0(IL�#�>}����yB�.�s��-\0\0@I`�\0���E��E������Av��\0@�b�\0$3q��󚚚666��#G>R^^>��\0\0�d0Q\0��1cƃ����t���u\0\0\0%���\\.�;I��W�:\0\0���DH��\0\0�L���!3\0\0 hz�t�\0\0�� 2\0\02��H��\0\0�L���!3\0\0 hz�t�\0\0�� 2\0\02��H��\0\0�L���!3\0\0 hz�t�\0\0�� 2\0\02��H��\0\0�L���!3\0\0 hz�t�\0\0�� 2\0\02��H��\0\0�L���!3\0\0 hz�t�\0\0�� 2\0\02��H��\0\0�L���!3\0\0 hz�t�\0\0�� 2\0\02��H��\0\0�L���!3\0\0 hz�t�\0\0�� 2\0\02��H��\0\0�L���!3\0\0 hz�t�\0\0�� 2\0\02��H��\0\0�L���!3\0\0 hz�t�\0\0�� 2\0\02��H��\0\0�L���!3\0\0 hz�t�\0\0�� 2\0\02��H��\0\0�L���!3\0\0 hz�t�\0\0�� 2\0\02��H��\0\0�L���!3\0\0 ��P���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0f�?M6��e)2R\0\0\0\0IEND�B`�',1);
/*!40000 ALTER TABLE `act_ge_bytearray` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_menu` (
  `role_menu_id` varchar(255) NOT NULL,
  `menu_id` varchar(255) DEFAULT NULL,
  `role_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES ('402881836fc146a7016fc147b5ec0004','40283e816fad93ca016fad95619f0004','40283e816f92646d016f92758ce50051'),('402881836fc146a7016fc147b5ec0005','40283e816fad93ca016fad964b710006','40283e816f92646d016f92758ce50051'),('402881836fc146a7016fc147b5ec0006','40283e816fb691df016fb6936b730003','40283e816f92646d016f92758ce50051'),('402881836fc146a7016fc147b5fc0007','40283e816fb8fb58016fb8fcca990002','40283e816f92646d016f92758ce50051'),('402881836fc146a7016fc147b5fc0008','40283e816fb691df016fb6947ace0007','40283e816f92646d016f92758ce50051'),('402881836fc146a7016fc147b5fc0009','40283e816fad93ca016fad96d4db0008','40283e816f92646d016f92758ce50051'),('402881836fc146a7016fc147b5fc000a','40283e816fad93ca016fad97367b000a','40283e816f92646d016f92758ce50051'),('402881836fc146a7016fc147b5fc000b','402881836fbd0217016fbd18b3950004','40283e816f92646d016f92758ce50051'),('402881836fc146a7016fc147b5fc000c','40283e816fad93ca016fada7346d0035','40283e816f92646d016f92758ce50051'),('402881836fc146a7016fc147b5fc000d','40283e816fad93ca016fada787940037','40283e816f92646d016f92758ce50051'),('402881836fc146a7016fc147b5fc000e','402881836fbcd7d6016fbcda617a0005','40283e816f92646d016f92758ce50051'),('402881836fc146a7016fc147b5fc000f','402881836fc0c451016fc0c5a1490001','40283e816f92646d016f92758ce50051'),('4028b26c733bb8d701733bbe2cce0016','402855816f31c4de016f31c4f6260024','40283e816f92646d016f92705173001a'),('4028b26c733bb8d701733bbe2ccf0017','402855816f31c4de016f31c4f668002a','40283e816f92646d016f92705173001a'),('4028b26c733bb8d701733bbe2ccf0018','402855816f31c4de016f31c4f7530047','40283e816f92646d016f92705173001a'),('4028b26c733bb8d701733bbe2ccf0019','402855816f31c4de016f31c4f7590048','40283e816f92646d016f92705173001a'),('4028b26c733bb8d701733bbe2ccf001a','402855816f31c4de016f31c4f75f0049','40283e816f92646d016f92705173001a'),('4028b26c733bb8d701733bbe2ccf001b','40283e816fad93ca016fad95619f0004','40283e816f92646d016f92705173001a'),('4028b26c733bb8d701733bbe2ccf001c','40283e816fad93ca016fad964b710006','40283e816f92646d016f92705173001a'),('4028b26c733bb8d701733bbe2ccf001d','40283e816fb691df016fb6936b730003','40283e816f92646d016f92705173001a'),('4028b26c733bb8d701733bbe2ccf001e','40283e816fb8fb58016fb8fcca990002','40283e816f92646d016f92705173001a'),('4028b26c733bb8d701733bbe2ccf001f','40283e816fb691df016fb6947ace0007','40283e816f92646d016f92705173001a'),('4028b26c733bb8d701733bbe2ccf0020','40283e816fad93ca016fad96d4db0008','40283e816f92646d016f92705173001a'),('4028b26c733bb8d701733bbe2ccf0021','40283e816fad93ca016fad97367b000a','40283e816f92646d016f92705173001a'),('4028b26c733bb8d701733bbe2ccf0022','40283e816fad93ca016fada7346d0035','40283e816f92646d016f92705173001a'),('4028b26c733bb8d701733bbe2ccf0023','40283e816fad93ca016fada787940037','40283e816f92646d016f92705173001a'),('4028b26c733bb8d701733bbe2ccf0024','402881836fbcd7d6016fbcda617a0005','40283e816f92646d016f92705173001a'),('4028b26c733bb8d701733bbe2cd00025','402881836fc0c451016fc0c5a1490001','40283e816f92646d016f92705173001a'),('4028b26c733bb8d701733bbe2cd00026','40283e816f8ed7d2016f8ed942780001','40283e816f92646d016f92705173001a'),('4028b26c733bb8d701733bbe2cd00027','40283e816f8ed7d2016f8eda4eb00003','40283e816f92646d016f92705173001a'),('4028b26c733bb8d701733bbe2cd00028','40283e816f8ed7d2016f8edb2ed20005','40283e816f92646d016f92705173001a'),('4028b26c733bb8d701733bbe2cd00029','40283e816f8ed7d2016f8edb81d10007','40283e816f92646d016f92705173001a'),('4028b26c733bb8d701733bbe2cd0002a','40283e816f8ed7d2016f8edbda4e0009','40283e816f92646d016f92705173001a'),('4028b26c733bb8d701733bbe2cd0002b','40283e816f8ed7d2016f8edc1cf9000b','40283e816f92646d016f92705173001a'),('4028b26c733bb8d701733bbe2cd0002c','4028b26c733bb8d701733bbabdbf0005','40283e816f92646d016f92705173001a'),('4028b26c733bb8d701733bbe2cd0002d','4028b26c733bb8d701733bbb62310007','40283e816f92646d016f92705173001a'),('4028b26c733bb8d701733bbe2cd0002e','4028b26c733bb8d701733bbba9870009','40283e816f92646d016f92705173001a'),('4028b26c733bb8d701733bbe2cd0002f','4028b26c733bb8d701733bbc1133000b','40283e816f92646d016f92705173001a'),('4028b26c733bb8d701733bbe2cd00030','4028b26c733bb8d701733bbc6658000d','40283e816f92646d016f92705173001a'),('4028b26c733bb8d701733bbe45770032','40283e816fad93ca016fad95619f0004','40283e816f92646d016f926a76fd0003'),('4028b26c733bb8d701733bbe45770033','40283e816fad93ca016fad964b710006','40283e816f92646d016f926a76fd0003'),('4028b26c733bb8d701733bbe45770034','40283e816fb691df016fb6936b730003','40283e816f92646d016f926a76fd0003'),('4028b26c733bb8d701733bbe45770035','40283e816fb8fb58016fb8fcca990002','40283e816f92646d016f926a76fd0003'),('4028b26c733bb8d701733bbe45770036','40283e816fb691df016fb6947ace0007','40283e816f92646d016f926a76fd0003'),('4028b26c733bb8d701733bbe45770037','40283e816fad93ca016fad96d4db0008','40283e816f92646d016f926a76fd0003'),('4028b26c733bb8d701733bbe45770038','40283e816fad93ca016fad97367b000a','40283e816f92646d016f926a76fd0003'),('4028b26c733bb8d701733bbe45770039','40283e816fad93ca016fada7346d0035','40283e816f92646d016f926a76fd0003'),('4028b26c733bb8d701733bbe4577003a','40283e816fad93ca016fada787940037','40283e816f92646d016f926a76fd0003'),('4028b26c733bb8d701733bbe4577003b','402881836fbcd7d6016fbcda617a0005','40283e816f92646d016f926a76fd0003'),('4028b26c733bb8d701733bbe4577003c','402881836fc0c451016fc0c5a1490001','40283e816f92646d016f926a76fd0003'),('4028b26c733bb8d701733bbe4577003d','40283e816f8ed7d2016f8ed942780001','40283e816f92646d016f926a76fd0003'),('4028b26c733bb8d701733bbe4577003e','40283e816f8ed7d2016f8eda4eb00003','40283e816f92646d016f926a76fd0003'),('4028b26c733bb8d701733bbe4578003f','40283e816f8ed7d2016f8edb2ed20005','40283e816f92646d016f926a76fd0003'),('4028b26c733bb8d701733bbe45780040','40283e816f8ed7d2016f8edb81d10007','40283e816f92646d016f926a76fd0003'),('4028b26c733bb8d701733bbe45780041','40283e816f8ed7d2016f8edbda4e0009','40283e816f92646d016f926a76fd0003'),('4028b26c733bb8d701733bbe45780042','40283e816f8ed7d2016f8edc1cf9000b','40283e816f92646d016f926a76fd0003'),('4028b26c733bb8d701733bbe45780043','4028b26c733bb8d701733bbabdbf0005','40283e816f92646d016f926a76fd0003'),('4028b26c733bb8d701733bbe45780044','4028b26c733bb8d701733bbb62310007','40283e816f92646d016f926a76fd0003'),('4028b26c733bb8d701733bbe45780045','4028b26c733bb8d701733bbba9870009','40283e816f92646d016f926a76fd0003'),('4028b26c733bb8d701733bbe45780046','4028b26c733bb8d701733bbc1133000b','40283e816f92646d016f926a76fd0003'),('4028b26c733bb8d701733bbe45780047','4028b26c733bb8d701733bbc6658000d','40283e816f92646d016f926a76fd0003'),('4028b26c733bb8d701733bbe6a2d0049','40283e816fad93ca016fad95619f0004','402855816f329db1016f32a226ef0005'),('4028b26c733bb8d701733bbe6a2d004a','40283e816fad93ca016fad964b710006','402855816f329db1016f32a226ef0005'),('4028b26c733bb8d701733bbe6a2d004b','40283e816fb691df016fb6936b730003','402855816f329db1016f32a226ef0005'),('4028b26c733bb8d701733bbe6a2d004c','40283e816fb8fb58016fb8fcca990002','402855816f329db1016f32a226ef0005'),('4028b26c733bb8d701733bbe6a2d004d','40283e816fb691df016fb6947ace0007','402855816f329db1016f32a226ef0005'),('4028b26c733bb8d701733bbe6a2d004e','40283e816fad93ca016fad96d4db0008','402855816f329db1016f32a226ef0005'),('4028b26c733bb8d701733bbe6a2d004f','40283e816fad93ca016fad97367b000a','402855816f329db1016f32a226ef0005'),('4028b26c733bb8d701733bbe6a2d0050','40283e816fad93ca016fada7346d0035','402855816f329db1016f32a226ef0005'),('4028b26c733bb8d701733bbe6a2d0051','40283e816fad93ca016fada787940037','402855816f329db1016f32a226ef0005'),('4028b26c733bb8d701733bbe6a2d0052','402881836fbcd7d6016fbcda617a0005','402855816f329db1016f32a226ef0005'),('4028b26c733bb8d701733bbe6a2e0053','402881836fc0c451016fc0c5a1490001','402855816f329db1016f32a226ef0005'),('4028b26c733bb8d701733bbe6a2e0054','40283e816f8ed7d2016f8ed942780001','402855816f329db1016f32a226ef0005'),('4028b26c733bb8d701733bbe6a2e0055','40283e816f8ed7d2016f8eda4eb00003','402855816f329db1016f32a226ef0005'),('4028b26c733bb8d701733bbe6a2e0056','40283e816f8ed7d2016f8edb2ed20005','402855816f329db1016f32a226ef0005'),('4028b26c733bb8d701733bbe6a2e0057','40283e816f8ed7d2016f8edb81d10007','402855816f329db1016f32a226ef0005'),('4028b26c733bb8d701733bbe6a2e0058','40283e816f8ed7d2016f8edbda4e0009','402855816f329db1016f32a226ef0005'),('4028b26c733bb8d701733bbe6a2e0059','40283e816f8ed7d2016f8edc1cf9000b','402855816f329db1016f32a226ef0005'),('4028b26c733bb8d701733bbe6a2e005a','4028b26c733bb8d701733bbabdbf0005','402855816f329db1016f32a226ef0005'),('4028b26c733bb8d701733bbe6a2e005b','4028b26c733bb8d701733bbb62310007','402855816f329db1016f32a226ef0005'),('4028b26c733bb8d701733bbe6a2e005c','4028b26c733bb8d701733bbba9870009','402855816f329db1016f32a226ef0005'),('4028b26c733bb8d701733bbe6a2e005d','4028b26c733bb8d701733bbc1133000b','402855816f329db1016f32a226ef0005'),('4028b26c733bb8d701733bbe6a2e005e','4028b26c733bb8d701733bbc6658000d','402855816f329db1016f32a226ef0005');
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_user`
--

DROP TABLE IF EXISTS `act_id_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DISPLAY_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_user`
--

LOCK TABLES `act_id_user` WRITE;
/*!40000 ALTER TABLE `act_id_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_attachment`
--

DROP TABLE IF EXISTS `act_hi_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_attachment`
--

LOCK TABLES `act_hi_attachment` WRITE;
/*!40000 ALTER TABLE `act_hi_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dept` (
  `dept_id` varchar(255) NOT NULL,
  `ancestors` varchar(255) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `dept_name` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `leader` varchar(255) DEFAULT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `order_num` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES ('40283e816f7dcf4f016f7ddb08dd001e',',root,402855816f35ac13016f35cc740b0017','admin','2020-01-07 10:35:04','项目美工部','','','402855816f35ac13016f35cc740b0017','','部门','0','admin','2020-01-07 10:42:19',2),('40283e816f7dcf4f016f7dde4c710021',',root,402855816f35ac13016f35cc740b0017,40283e816f7dcf4f016f7ddb08dd001e','admin','2020-01-07 10:38:38','美工一组','','','40283e816f7dcf4f016f7ddb08dd001e','','部门小组','0','admin','2020-01-07 10:42:25',1),('40283e816f7dcf4f016f7de00ef30023',',root,402855816f35ac13016f35cc740b0017,40283e816f7dcf4f016f7ddb08dd001e','admin','2020-01-07 10:40:34','美工二组','','','40283e816f7dcf4f016f7ddb08dd001e','','部门小组','0','admin','2020-01-07 10:42:30',2),('40283e816f7dcf4f016f7de064990027',',root,402855816f35ac13016f35cc740b0017,402855816f35ac13016f35ce3bca0019','admin','2020-01-07 10:40:55','研发三组','','','402855816f35ac13016f35ce3bca0019','','部门小组','0','admin','2020-01-07 10:42:12',3),('40283e816f92646d016f926c38e4000f',',root,402855816f35ac13016f35cc740b0017','admin','2020-01-11 10:26:04','财务部门','','','402855816f35ac13016f35cc740b0017','','','0',NULL,NULL,3),('402855816f35ac13016f35cc740b0017',',root','admin','2019-12-24 10:46:29','福州Daffodil科技有限公司','Daffodil@163.com','Daffodil','root','18088888888','企业机构','0','admin','2020-06-02 10:40:02',1),('402855816f35ac13016f35ce3bca0019',',root,402855816f35ac13016f35cc740b0017','admin','2019-12-24 15:03:36','项目研发部','','','402855816f35ac13016f35cc740b0017','','部门','0','admin','2020-01-07 10:30:50',1),('402855816f35ac13016f35ce9169001b',',root,402855816f35ac13016f35cc740b0017,402855816f35ac13016f35ce3bca0019','admin','2019-12-24 14:44:58','研发一组','','','402855816f35ac13016f35ce3bca0019','','部门小组','0','admin','2020-01-11 10:28:45',1),('402855816f35ac13016f35ced093001d',',root,402855816f35ac13016f35cc740b0017,402855816f35ac13016f35ce3bca0019','admin','2019-12-24 14:56:43','研发二组','','','402855816f35ac13016f35ce3bca0019','','部门小组','0','admin','2020-01-07 10:40:45',2),('402855816f35e8b6016f35ea04530001',',root,402855816f35fff2016f360af3b6000c','admin','2019-12-24 14:56:59','项目实施部','','','402855816f35fff2016f360af3b6000c','','部门','0','admin','2020-01-07 10:31:31',1),('402855816f35e8b6016f35ea41fb0003',',root,402855816f35fff2016f360af3b6000c,402855816f35e8b6016f35ea04530001','admin','2019-12-24 11:53:45','实施一组','','','402855816f35e8b6016f35ea04530001','','部门小组','0','admin','2020-05-29 11:01:03',1),('402855816f35fff2016f3609e1760007',',root,402855816f35fff2016f360af3b6000c,402855816f35e8b6016f35ea04530001','admin','2019-12-24 14:58:43','实施二组','','','402855816f35e8b6016f35ea04530001','','部门小组','0','admin','2020-01-07 10:31:42',2),('402855816f35fff2016f360af3b6000c',',root','admin','2019-12-24 15:02:10','厦门Daffodil科技有限公司','Daffodil@163.com','Daffodil','root','18088888888','企业机构','0','admin','2020-01-07 10:33:54',2);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_priv_mapping`
--

DROP TABLE IF EXISTS `act_id_priv_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_priv_mapping` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PRIV_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_PRIV_MAPPING` (`PRIV_ID_`),
  KEY `ACT_IDX_PRIV_USER` (`USER_ID_`),
  KEY `ACT_IDX_PRIV_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_PRIV_MAPPING` FOREIGN KEY (`PRIV_ID_`) REFERENCES `act_id_priv` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_priv_mapping`
--

LOCK TABLES `act_id_priv_mapping` WRITE;
/*!40000 ALTER TABLE `act_id_priv_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_priv_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_event_subscr`
--

DROP TABLE IF EXISTS `act_ru_event_subscr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_event_subscr`
--

LOCK TABLES `act_ru_event_subscr` WRITE;
/*!40000 ALTER TABLE `act_ru_event_subscr` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_event_subscr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu` (
  `menu_id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `menu_name` varchar(50) DEFAULT NULL,
  `menu_type` varchar(255) DEFAULT NULL,
  `order_num` bigint(20) DEFAULT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `perms` varchar(100) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `target` varchar(255) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `visible` varchar(255) DEFAULT NULL,
  `ancestors` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES ('40283e816f8d4089016f8d420c4c0003','admin','2020-01-10 10:21:54','fa fa-sliders','流程管理','catalog',2,'root','',NULL,'menuItem','admin','2020-04-22 17:20:41','','0',',root'),('40283e816f8d4089016f8d43534b0006','admin','2020-01-10 10:23:17','','流程模板','menu',1,'40283e816f8d4089016f8d420c4c0003','flowable:modeler:view',NULL,'menuItem','admin','2020-02-11 21:18:27','/flowable/modeler','0',',root,40283e816f8d4089016f8d420c4c0003'),('40283e816f8ed7d2016f8ed942780001','admin','2020-01-10 17:46:41','fa fa-gift','流程演示','catalog',4,'root','',NULL,'menuItem','admin','2020-02-15 18:50:50','','0',',root'),('40283e816f8ed7d2016f8eda4eb00003','admin','2020-01-10 17:47:49','','报销管理','menu',1,'40283e816f8ed7d2016f8ed942780001','demo:expense:view',NULL,'menuItem',NULL,NULL,'/demo/expense','0',''),('40283e816f8ed7d2016f8edb2ed20005','admin','2020-01-10 17:48:47','','报销查询','button',1,'40283e816f8ed7d2016f8eda4eb00003','demo:expense:list',NULL,'menuItem',NULL,NULL,'','0',''),('40283e816f8ed7d2016f8edb81d10007','admin','2020-01-10 17:49:08','','报销新增','button',2,'40283e816f8ed7d2016f8eda4eb00003','demo:expense:add',NULL,'menuItem',NULL,NULL,'','0',''),('40283e816f8ed7d2016f8edbda4e0009','admin','2020-01-10 17:49:31','','报销修改','button',3,'40283e816f8ed7d2016f8eda4eb00003','demo:expense:edit',NULL,'menuItem',NULL,NULL,'','0',''),('40283e816f8ed7d2016f8edc1cf9000b','admin','2020-01-10 17:49:48','','报销删除','button',4,'40283e816f8ed7d2016f8eda4eb00003','demo:expense:remove',NULL,'menuItem',NULL,NULL,'','0',''),('40283e816f94047b016f9405ae250001','admin','2020-01-11 17:53:18','fa fa-database','发布管理','catalog',3,'40283e816f8d4089016f8d420c4c0003','',NULL,'menuItem','admin','2020-02-11 18:29:30','','0',',root,40283e816f8d4089016f8d420c4c0003'),('40283e816f9d0921016f9d12329a0009','admin','2020-01-13 12:03:33','','新增','button',1,'40283e816f8d4089016f8d43534b0006','system:modeler:add',NULL,'menuItem','admin','2020-01-13 16:10:07','','0',',root,40283e816f8d4089016f8d420c4c0003,40283e816f8d4089016f8d43534b0006'),('40283e816f9d0921016f9d129946000b','admin','2020-01-13 12:03:59','','修改','button',2,'40283e816f8d4089016f8d43534b0006','flowable:modeler:edit',NULL,'menuItem','admin','2020-01-13 16:10:32','','0',',root,40283e816f8d4089016f8d420c4c0003,40283e816f8d4089016f8d43534b0006'),('40283e816f9d0921016f9d12e584000d','admin','2020-01-13 12:04:19','','删除','button',3,'40283e816f8d4089016f8d43534b0006','flowable:modeler:remove',NULL,'menuItem','admin','2020-01-13 16:10:51','','0',',root,40283e816f8d4089016f8d420c4c0003,40283e816f8d4089016f8d43534b0006'),('40283e816f9de0d5016f9dee83d90008','admin','2020-01-13 16:04:12','','预览','button',4,'40283e816f8d4089016f8d43534b0006','flowable:modeler:image',NULL,'menuItem','admin','2020-02-11 21:18:50','','0',',root,40283e816f8d4089016f8d420c4c0003,40283e816f8d4089016f8d43534b0006'),('40283e816f9de0d5016f9deef439000a','admin','2020-01-13 16:04:41','','发布','button',3,'40283e816f94047b016f9405ae250001','flowable:process:publish',NULL,'menuItem','admin','2020-01-13 16:11:36','','0',',root,40283e816f8d4089016f8d420c4c0003,40283e816f94047b016f9405ae250001'),('40283e816f9de0d5016f9def3ad9000c','admin','2020-01-13 16:04:59','','取消发布','button',4,'40283e816f94047b016f9405ae250001','flowable:process:unPublish',NULL,'menuItem','admin','2020-01-13 16:11:42','','0',',root,40283e816f8d4089016f8d420c4c0003,40283e816f94047b016f9405ae250001'),('40283e816fad93ca016fad95619f0004','admin','2020-01-16 17:00:46','fa fa-envelope-o','任务管理','catalog',3,'root','',NULL,'menuItem',NULL,NULL,'','0',''),('40283e816fad93ca016fad964b710006','admin','2020-01-16 17:01:46','fa fa-address-book','我的任务','catalog',1,'40283e816fad93ca016fad95619f0004','',NULL,'menuItem','admin','2020-01-18 10:54:28','','0','null,40283e816fad93ca016fad95619f0004'),('40283e816fad93ca016fad96d4db0008','admin','2020-01-16 17:02:21','','待办任务','menu',2,'40283e816fad93ca016fad95619f0004','flowable:task:view',NULL,'menuItem','admin','2020-07-11 13:00:53','/flowable/task/task/3','0',',40283e816fad93ca016fad95619f0004'),('40283e816fad93ca016fad97367b000a','admin','2020-01-16 17:02:46','','经办任务','menu',3,'40283e816fad93ca016fad95619f0004','flowable:task:view',NULL,'menuItem','admin','2020-07-11 13:01:08','/flowable/task/task/4','0',',40283e816fad93ca016fad95619f0004'),('40283e816fad93ca016fada7346d0035','admin','2020-01-16 17:20:14','','任务查询','button',5,'40283e816fad93ca016fad95619f0004','flowable:task:list',NULL,'menuItem','admin','2020-01-19 17:17:27','','0','null,40283e816fad93ca016fad95619f0004'),('40283e816fad93ca016fada787940037','admin','2020-01-16 17:20:35','','任务办理','button',6,'40283e816fad93ca016fad95619f0004','flowable:task:edit',NULL,'menuItem','admin','2020-01-19 17:17:34','','0','null,40283e816fad93ca016fad95619f0004'),('40283e816fb691df016fb6936b730003','admin','2020-01-18 10:55:12','','待发送','menu',1,'40283e816fad93ca016fad964b710006','flowable:task:view',NULL,'menuItem','admin','2020-07-09 14:51:28','/flowable/task/myself/0','0','null,40283e816fad93ca016fad95619f0004,40283e816fad93ca016fad964b710006'),('40283e816fb691df016fb6947ace0007','admin','2020-01-18 10:56:22','','已办结','menu',3,'40283e816fad93ca016fad964b710006','flowable:task:view',NULL,'menuItem','admin','2020-02-12 17:10:36','/flowable/task/myself/2','0','null,40283e816fad93ca016fad95619f0004,40283e816fad93ca016fad964b710006'),('40283e816fb8fb58016fb8fcca990002','admin','2020-01-18 22:09:32','','已发送','menu',2,'40283e816fad93ca016fad964b710006','flowable:common:view',NULL,'menuItem','admin','2020-07-09 14:51:40','/flowable/task/myself/1','0','null,40283e816fad93ca016fad95619f0004,40283e816fad93ca016fad964b710006'),('40283e817033b5f7017033b783410001','admin','2020-02-11 18:07:10','','查询','button',1,'402880e46f9ecae8016f9ecc9c7e0001','flowable:user:list',NULL,'menuItem',NULL,NULL,'','0',''),('40283e817033b5f7017033cbd3fe0005','admin','2020-02-11 18:29:21','','流程类型','menu',2,'40283e816f8d4089016f8d420c4c0003','flowable:type:view',NULL,'menuItem',NULL,NULL,'/flowable/type','0',''),('40283e817034009f01703401fd1d0001','admin','2020-02-11 19:28:30','','查询','button',1,'40283e817033b5f7017033cbd3fe0005','flowable:type:list',NULL,'menuItem',NULL,NULL,'','0',''),('40283e817034009f017034023c610003','admin','2020-02-11 19:28:47','','新增','button',2,'40283e817033b5f7017033cbd3fe0005','flowable:type:add',NULL,'menuItem',NULL,NULL,'','0',''),('40283e817034009f01703402814d0005','admin','2020-02-11 19:29:04','','修改','button',3,'40283e817033b5f7017033cbd3fe0005','flowable:type:edit',NULL,'menuItem',NULL,NULL,'','0',''),('40283e817034009f01703402c9210007','admin','2020-02-11 19:29:23','','删除','button',4,'40283e817033b5f7017033cbd3fe0005','flowable:type:remove',NULL,'menuItem',NULL,NULL,'','0',''),('40283e8170470c040170470dc5c90001','admin','2020-02-15 12:14:10','','约束管理','menu',7,'402855816f31c4de016f31c4f6260024','system:filter:view',NULL,'menuItem',NULL,NULL,'/system/filter','0',''),('40283e8170470c040170470fab270006','admin','2020-02-15 12:16:14','','约束查询','button',1,'40283e8170470c040170470dc5c90001','system:filter:list',NULL,'menuItem',NULL,NULL,'','0',''),('40283e8170470c04017047101c110008','admin','2020-02-15 12:16:43','','约束新增','button',2,'40283e8170470c040170470dc5c90001','system:filter:add',NULL,'menuItem',NULL,NULL,'','0',''),('40283e8170470c04017047107206000a','admin','2020-02-15 12:17:05','','约束修改','button',3,'40283e8170470c040170470dc5c90001','system:filter:edit',NULL,'menuItem',NULL,NULL,'','0',''),('40283e8170470c0401704710b2d8000c','admin','2020-02-15 12:17:22','','约束删除','button',4,'40283e8170470c040170470dc5c90001','system:filter:remove',NULL,'menuItem',NULL,NULL,'','0',''),('402855816f31c4de016f31c4f6260024','system','2019-12-23 15:59:49','fa fa-gear','系统管理','catalog',1,'root','','系统管理目录','menuItem','admin','2020-06-02 10:41:38','','0',',root'),('402855816f31c4de016f31c4f6350025','system','2019-12-23 15:59:49','fa fa-video-camera','系统监控','catalog',5,'root','','系统监控目录','menuItem','admin','2020-02-15 18:50:36','','0',',root'),('402855816f31c4de016f31c4f6470027','system','2019-12-23 15:59:49','','用户管理','menu',1,'402855816f31c4de016f31c4f6260024','system:user:view','用户管理菜单','menuItem','admin','2019-12-25 15:43:53','/system/user','0',',root,402855816f31c4de016f31c4f6260024'),('402855816f31c4de016f31c4f6570028','system','2019-12-23 15:59:49','','角色管理','menu',2,'402855816f31c4de016f31c4f6260024','system:role:view','角色管理菜单','menuItem','admin','2019-12-25 15:44:23','/system/role','0',',root,402855816f31c4de016f31c4f6260024'),('402855816f31c4de016f31c4f6580029','system','2019-12-23 15:59:49','','菜单管理','menu',5,'402855816f31c4de016f31c4f6260024','system:menu:view','菜单管理菜单','menuItem','admin','2019-12-25 15:56:31','/system/menu','0',',root,402855816f31c4de016f31c4f6260024'),('402855816f31c4de016f31c4f668002a','system','2019-12-23 15:59:49','','部门管理','menu',3,'402855816f31c4de016f31c4f6260024','system:dept:view','部门管理菜单','menuItem','admin','2019-12-25 15:56:11','/system/dept','0',',root,402855816f31c4de016f31c4f6260024'),('402855816f31c4de016f31c4f67a002b','system','2019-12-23 15:59:49','','岗位管理','menu',4,'402855816f31c4de016f31c4f6260024','system:post:view','岗位管理菜单','menuItem','admin','2019-12-25 15:56:23','/system/post','0',',root,402855816f31c4de016f31c4f6260024'),('402855816f31c4de016f31c4f67a002c','system','2019-12-23 15:59:49','','字典管理','menu',6,'402855816f31c4de016f31c4f6260024','system:dictionary:view','字典管理菜单','menuItem','admin','2020-04-22 18:06:02','/system/dictionary','0',',root,402855816f31c4de016f31c4f6260024'),('402855816f31c4de016f31c4f689002d','system','2019-12-23 15:59:49','','参数设置','menu',8,'402855816f31c4de016f31c4f6260024','system:config:view','参数设置菜单','menuItem','admin','2020-02-15 12:15:00','/system/config','0',',root,402855816f31c4de016f31c4f6260024'),('402855816f31c4de016f31c4f69b002e','system','2019-12-23 15:59:49','','通知公告','menu',9,'402855816f31c4de016f31c4f6260024','system:notice:view','通知公告菜单','menuItem','admin','2020-02-15 12:15:10','/system/notice','0',',root,402855816f31c4de016f31c4f6260024'),('402855816f31c4de016f31c4f6a5002f','system','2019-12-23 15:59:49','','日志管理','catalog',2,'402855816f31c4de016f31c4f6350025','','日志管理菜单','menuItem','admin','2020-02-22 10:01:23','','0',',root,402855816f31c4de016f31c4f6350025'),('402855816f31c4de016f31c4f6ae0030','system','2019-12-23 15:59:49','','在线用户','menu',1,'402855816f31c4de016f31c4f6350025','monitor:online:view','在线用户菜单','menuItem','admin','2019-12-25 15:45:48','/monitor/online','0',',root,402855816f31c4de016f31c4f6350025'),('402855816f31c4de016f31c4f6bd0031','system','2019-12-23 15:59:49','','服务监控','menu',3,'402855816f31c4de016f31c4f6350025','monitor:server:view','服务监控菜单','menuItem','admin','2019-12-25 15:45:52','/monitor/server','0',',root,402855816f31c4de016f31c4f6350025'),('402855816f31c4de016f31c4f6e20035','system','2019-12-23 15:59:49','','操作日志','menu',1,'402855816f31c4de016f31c4f6a5002f','monitor:operlog:view','操作日志菜单','menuItem','admin','2019-12-25 15:46:34','/monitor/operlog','0',',root,402855816f31c4de016f31c4f6350025,402855816f31c4de016f31c4f6a5002f'),('402855816f31c4de016f31c4f6e70036','system','2019-12-23 15:59:49','','登录日志','menu',2,'402855816f31c4de016f31c4f6a5002f','monitor:logininfo:view','登录日志菜单','menuItem','admin','2019-12-25 15:46:39','/monitor/logininfo','0',',root,402855816f31c4de016f31c4f6350025,402855816f31c4de016f31c4f6a5002f'),('402855816f31c4de016f31c4f6ec0037','system','2019-12-23 15:59:49','','用户查询','button',1,'402855816f31c4de016f31c4f6470027','system:user:list','','menuItem','admin','2019-12-25 15:44:07','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f6470027'),('402855816f31c4de016f31c4f6f30038','system','2019-12-23 15:59:49','','用户新增','button',2,'402855816f31c4de016f31c4f6470027','system:user:add','','menuItem','admin','2019-12-25 15:46:49','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f6470027'),('402855816f31c4de016f31c4f6f90039','system','2019-12-23 15:59:49','','用户修改','button',3,'402855816f31c4de016f31c4f6470027','system:user:edit','','menuItem','admin','2019-12-25 15:46:53','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f6470027'),('402855816f31c4de016f31c4f6fe003a','system','2019-12-23 15:59:50','','用户删除','button',4,'402855816f31c4de016f31c4f6470027','system:user:remove','','menuItem','admin','2019-12-25 15:47:07','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f6470027'),('402855816f31c4de016f31c4f703003b','system','2019-12-23 15:59:50','','用户导出','button',5,'402855816f31c4de016f31c4f6470027','system:user:export','','menuItem','admin','2019-12-25 15:47:12','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f6470027'),('402855816f31c4de016f31c4f709003c','system','2019-12-23 15:59:50','','用户导入','button',6,'402855816f31c4de016f31c4f6470027','system:user:import','','menuItem','admin','2019-12-25 15:47:17','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f6470027'),('402855816f31c4de016f31c4f710003d','system','2019-12-23 15:59:50','','重置密码','button',7,'402855816f31c4de016f31c4f6470027','system:user:resetPwd','','menuItem','admin','2019-12-25 15:47:21','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f6470027'),('402855816f31c4de016f31c4f716003e','system','2019-12-23 15:59:50','','角色查询','button',1,'402855816f31c4de016f31c4f6570028','system:role:list','','menuItem','admin','2019-12-25 15:47:37','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f6570028'),('402855816f31c4de016f31c4f71d003f','system','2019-12-23 15:59:50','','角色新增','button',2,'402855816f31c4de016f31c4f6570028','system:role:add','','menuItem','admin','2019-12-25 15:49:21','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f6570028'),('402855816f31c4de016f31c4f7240040','system','2019-12-23 15:59:50','','角色修改','button',3,'402855816f31c4de016f31c4f6570028','system:role:edit','','menuItem','admin','2019-12-25 15:49:26','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f6570028'),('402855816f31c4de016f31c4f7290041','system','2019-12-23 15:59:50','','角色删除','button',4,'402855816f31c4de016f31c4f6570028','system:role:remove','','menuItem','admin','2019-12-25 15:49:32','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f6570028'),('402855816f31c4de016f31c4f72f0042','system','2019-12-23 15:59:50','','角色导出','button',5,'402855816f31c4de016f31c4f6570028','system:role:export','','menuItem','admin','2019-12-25 15:49:37','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f6570028'),('402855816f31c4de016f31c4f7340043','system','2019-12-23 15:59:50','','菜单查询','button',1,'402855816f31c4de016f31c4f6580029','system:menu:list','','menuItem','admin','2019-12-25 15:47:59','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f6580029'),('402855816f31c4de016f31c4f7340044','system','2019-12-23 15:59:50','','菜单新增','button',2,'402855816f31c4de016f31c4f6580029','system:menu:add','','menuItem','admin','2019-12-25 15:48:06','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f6580029'),('402855816f31c4de016f31c4f7450045','system','2019-12-23 15:59:50','','菜单修改','button',3,'402855816f31c4de016f31c4f6580029','system:menu:edit','','menuItem','admin','2019-12-25 15:47:48','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f6580029'),('402855816f31c4de016f31c4f74b0046','system','2019-12-23 15:59:50','','菜单删除','button',4,'402855816f31c4de016f31c4f6580029','system:menu:remove','','menuItem','admin','2019-12-25 15:48:19','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f6580029'),('402855816f31c4de016f31c4f7530047','system','2019-12-23 15:59:50','','部门查询','button',1,'402855816f31c4de016f31c4f668002a','system:dept:list','','menuItem','admin','2019-12-25 15:50:01','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f668002a'),('402855816f31c4de016f31c4f7590048','system','2019-12-23 15:59:50','','部门新增','button',2,'402855816f31c4de016f31c4f668002a','system:dept:add','','menuItem','admin','2019-12-25 15:50:07','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f668002a'),('402855816f31c4de016f31c4f75f0049','system','2019-12-23 15:59:50','','部门修改','button',3,'402855816f31c4de016f31c4f668002a','system:dept:edit','','menuItem','admin','2019-12-25 15:50:12','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f668002a'),('402855816f31c4de016f31c4f765004a','system','2019-12-23 15:59:50','','部门删除','button',4,'402855816f31c4de016f31c4f668002a','system:dept:remove','','menuItem','admin','2019-12-25 15:49:04','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f668002a'),('402855816f31c4de016f31c4f76c004b','system','2019-12-23 15:59:50','','岗位查询','button',1,'402855816f31c4de016f31c4f67a002b','system:post:list','','menuItem','admin','2019-12-25 15:48:30','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f67a002b'),('402855816f31c4de016f31c4f773004c','system','2019-12-23 15:59:50','','岗位新增','button',2,'402855816f31c4de016f31c4f67a002b','system:post:add','','menuItem','admin','2019-12-25 15:48:37','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f67a002b'),('402855816f31c4de016f31c4f775004d','system','2019-12-23 15:59:50','','岗位修改','button',3,'402855816f31c4de016f31c4f67a002b','system:post:edit','','menuItem','admin','2019-12-25 15:48:48','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f67a002b'),('402855816f31c4de016f31c4f775004e','system','2019-12-23 15:59:50','','岗位删除','button',4,'402855816f31c4de016f31c4f67a002b','system:post:remove','','menuItem','admin','2019-12-25 15:48:58','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f67a002b'),('402855816f31c4de016f31c4f788004f','system','2019-12-23 15:59:50','','岗位导出','button',5,'402855816f31c4de016f31c4f67a002b','system:post:export','','menuItem','admin','2019-12-25 15:51:15','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f67a002b'),('402855816f31c4de016f31c4f7900050','system','2019-12-23 15:59:50','','字典查询','button',1,'402855816f31c4de016f31c4f67a002c','system:dict:list','','menuItem','admin','2019-12-25 15:50:29','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f67a002c'),('402855816f31c4de016f31c4f7980051','system','2019-12-23 15:59:50','','字典新增','button',2,'402855816f31c4de016f31c4f67a002c','system:dict:add','','menuItem','admin','2019-12-25 15:50:34','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f67a002c'),('402855816f31c4de016f31c4f79c0052','system','2019-12-23 15:59:50','','字典修改','button',3,'402855816f31c4de016f31c4f67a002c','system:dict:edit','','menuItem','admin','2019-12-25 15:50:39','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f67a002c'),('402855816f31c4de016f31c4f79c0053','system','2019-12-23 15:59:50','','字典删除','button',4,'402855816f31c4de016f31c4f67a002c','system:dict:remove','','menuItem','admin','2019-12-25 15:50:47','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f67a002c'),('402855816f31c4de016f31c4f7ae0054','system','2019-12-23 15:59:50','','字典导出','button',5,'402855816f31c4de016f31c4f67a002c','system:dict:export','','menuItem','admin','2019-12-25 15:50:53','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f67a002c'),('402855816f31c4de016f31c4f7ae0055','system','2019-12-23 15:59:50','','参数查询','button',1,'402855816f31c4de016f31c4f689002d','system:config:list','','menuItem','admin','2019-12-25 15:51:24','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f689002d'),('402855816f31c4de016f31c4f7bd0056','system','2019-12-23 15:59:50','','参数新增','button',2,'402855816f31c4de016f31c4f689002d','system:config:add','','menuItem','admin','2019-12-25 15:51:29','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f689002d'),('402855816f31c4de016f31c4f7bd0057','system','2019-12-23 15:59:50','','参数修改','button',3,'402855816f31c4de016f31c4f689002d','system:config:edit','','menuItem','admin','2019-12-25 15:51:34','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f689002d'),('402855816f31c4de016f31c4f7bd0058','system','2019-12-23 15:59:50','','参数删除','button',4,'402855816f31c4de016f31c4f689002d','system:config:remove','','menuItem','admin','2019-12-25 15:53:09','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f689002d'),('402855816f31c4de016f31c4f7cd0059','system','2019-12-23 15:59:50','','参数导出','button',5,'402855816f31c4de016f31c4f689002d','system:config:export','','menuItem','admin','2019-12-25 15:53:15','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f689002d'),('402855816f31c4de016f31c4f7cd005a','system','2019-12-23 15:59:50','','公告查询','button',1,'402855816f31c4de016f31c4f69b002e','system:notice:list','','menuItem','admin','2019-12-25 15:51:40','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f69b002e'),('402855816f31c4de016f31c4f7cd005b','system','2019-12-23 15:59:50','','公告新增','button',2,'402855816f31c4de016f31c4f69b002e','system:notice:add','','menuItem','admin','2019-12-25 15:51:45','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f69b002e'),('402855816f31c4de016f31c4f7e2005c','system','2019-12-23 15:59:50','','公告修改','button',3,'402855816f31c4de016f31c4f69b002e','system:notice:edit','','menuItem','admin','2019-12-25 15:51:50','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f69b002e'),('402855816f31c4de016f31c4f7e7005d','system','2019-12-23 15:59:50','','公告删除','button',4,'402855816f31c4de016f31c4f69b002e','system:notice:remove','','menuItem','admin','2019-12-25 15:51:55','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f69b002e'),('402855816f31c4de016f31c4f7ed005e','system','2019-12-23 15:59:50','','操作查询','button',1,'402855816f31c4de016f31c4f6e20035','monitor:operlog:list','','menuItem','admin','2019-12-25 15:52:03','#','0',',root,402855816f31c4de016f31c4f6350025,402855816f31c4de016f31c4f6a5002f,402855816f31c4de016f31c4f6e20035'),('402855816f31c4de016f31c4f7f2005f','system','2019-12-23 15:59:50','','操作删除','button',2,'402855816f31c4de016f31c4f6e20035','monitor:operlog:remove','','menuItem','admin','2019-12-25 15:52:09','#','0',',root,402855816f31c4de016f31c4f6350025,402855816f31c4de016f31c4f6a5002f,402855816f31c4de016f31c4f6e20035'),('402855816f31c4de016f31c4f7f80060','system','2019-12-23 15:59:50','','详细信息','button',3,'402855816f31c4de016f31c4f6e20035','monitor:operlog:detail','','menuItem','admin','2019-12-25 15:52:16','#','0',',root,402855816f31c4de016f31c4f6350025,402855816f31c4de016f31c4f6a5002f,402855816f31c4de016f31c4f6e20035'),('402855816f31c4de016f31c4f7ff0061','system','2019-12-23 15:59:50','','日志导出','button',4,'402855816f31c4de016f31c4f6e20035','monitor:operlog:export','','menuItem','admin','2019-12-25 15:52:23','#','0',',root,402855816f31c4de016f31c4f6350025,402855816f31c4de016f31c4f6a5002f,402855816f31c4de016f31c4f6e20035'),('402855816f31c4de016f31c4f8060062','system','2019-12-23 15:59:50','','登录查询','button',1,'402855816f31c4de016f31c4f6e70036','monitor:logininfo:list','','menuItem','admin','2019-12-25 15:52:34','#','0',',root,402855816f31c4de016f31c4f6350025,402855816f31c4de016f31c4f6a5002f,402855816f31c4de016f31c4f6e70036'),('402855816f31c4de016f31c4f80b0063','system','2019-12-23 15:59:50','','登录删除','button',2,'402855816f31c4de016f31c4f6e70036','monitor:logininfo:remove','','menuItem','admin','2019-12-25 15:52:41','#','0',',root,402855816f31c4de016f31c4f6350025,402855816f31c4de016f31c4f6a5002f,402855816f31c4de016f31c4f6e70036'),('402855816f31c4de016f31c4f8110064','system','2019-12-23 15:59:50','','日志导出','button',3,'402855816f31c4de016f31c4f6e70036','monitor:logininfo:export','','menuItem','admin','2019-12-25 15:52:48','#','0',',root,402855816f31c4de016f31c4f6350025,402855816f31c4de016f31c4f6a5002f,402855816f31c4de016f31c4f6e70036'),('402855816f31c4de016f31c4f8180065','system','2019-12-23 15:59:50','','在线查询','button',1,'402855816f31c4de016f31c4f6ae0030','monitor:online:list','','menuItem','admin','2019-12-25 15:46:18','#','0',',root,402855816f31c4de016f31c4f6350025,402855816f31c4de016f31c4f6ae0030'),('402855816f31c4de016f31c4f81e0066','system','2019-12-23 15:59:50','','批量强退','button',2,'402855816f31c4de016f31c4f6ae0030','monitor:online:batchForceLogout','','menuItem','admin','2019-12-25 15:46:22','#','0',',root,402855816f31c4de016f31c4f6350025,402855816f31c4de016f31c4f6ae0030'),('402855816f31c4de016f31c4f8240067','system','2019-12-23 15:59:50','','单条强退','button',3,'402855816f31c4de016f31c4f6ae0030','monitor:online:forceLogout','','menuItem','admin','2019-12-25 15:46:27','#','0',',root,402855816f31c4de016f31c4f6350025,402855816f31c4de016f31c4f6ae0030'),('402880e46f9812b4016f981912eb0003','admin','2020-01-12 12:52:58','','已发布','menu',2,'40283e816f94047b016f9405ae250001','flowable:modeler:view',NULL,'menuItem','admin','2020-02-11 21:19:55','/flowable/modeler/deploy','0',',root,40283e816f8d4089016f8d420c4c0003,40283e816f94047b016f9405ae250001'),('402880e46f9812b4016f9819a6f00005','admin','2020-01-12 12:53:36','','待发布','menu',1,'40283e816f94047b016f9405ae250001','flowable:modeler:view',NULL,'menuItem','admin','2020-02-11 21:19:34','/flowable/modeler/undeploy','0',',root,40283e816f8d4089016f8d420c4c0003,40283e816f94047b016f9405ae250001'),('402880e46f9ecae8016f9ecc9c7e0001','admin','2020-01-13 20:06:47','','绑定流程','menu',4,'40283e816f8d4089016f8d420c4c0003','flowable:user:view',NULL,'menuItem','admin','2020-02-11 18:29:40','/flowable/user','0',',root,40283e816f8d4089016f8d420c4c0003'),('402881836fbcd7d6016fbcda617a0005','admin','2020-01-19 16:10:26','','查看流程图','button',7,'40283e816fad93ca016fad95619f0004','flowable:task:image',NULL,'menuItem','admin','2020-01-19 17:17:41','','0','null,40283e816fad93ca016fad95619f0004'),('402881836fbd0217016fbd18b3950004','admin','2020-01-19 17:18:30','','办结任务','menu',4,'40283e816fad93ca016fad95619f0004','flowable:task:view',NULL,'menuItem','admin','2020-07-11 13:01:16','/flowable/task/task/5','0',',40283e816fad93ca016fad95619f0004'),('402881836fc0c451016fc0c5a1490001','admin','2020-01-20 10:26:15','','流程步骤详情','button',8,'40283e816fad93ca016fad95619f0004','flowable:task:detail',NULL,'menuItem',NULL,NULL,'','0',''),('4028b26c733bb8d701733bbabdbf0005','admin','2020-07-11 10:36:01','','请假管理','menu',2,'40283e816f8ed7d2016f8ed942780001','demo:leave:view',NULL,'menuItem',NULL,NULL,'/demo/leave','0',',root,40283e816f8ed7d2016f8ed942780001'),('4028b26c733bb8d701733bbb62310007','admin','2020-07-11 10:36:43','','请假查询','button',1,'4028b26c733bb8d701733bbabdbf0005','demo:leave:list',NULL,'menuItem',NULL,NULL,'','0',',root,40283e816f8ed7d2016f8ed942780001,4028b26c733bb8d701733bbabdbf0005'),('4028b26c733bb8d701733bbba9870009','admin','2020-07-11 10:37:01','','请假新增','button',2,'4028b26c733bb8d701733bbabdbf0005','demo:leave:add',NULL,'menuItem',NULL,NULL,'','0',',root,40283e816f8ed7d2016f8ed942780001,4028b26c733bb8d701733bbabdbf0005'),('4028b26c733bb8d701733bbc1133000b','admin','2020-07-11 10:37:28','','请假修改','button',3,'4028b26c733bb8d701733bbabdbf0005','demo:leave:edit',NULL,'menuItem',NULL,NULL,'','0',',root,40283e816f8ed7d2016f8ed942780001,4028b26c733bb8d701733bbabdbf0005'),('4028b26c733bb8d701733bbc6658000d','admin','2020-07-11 10:37:50','','请假删除','button',4,'4028b26c733bb8d701733bbabdbf0005','demo:leave:remove',NULL,'menuItem',NULL,NULL,'','0',',root,40283e816f8ed7d2016f8ed942780001,4028b26c733bb8d701733bbabdbf0005'),('4028b2ec722fa06f01722fa1dc8c0001','admin','2020-05-20 09:10:36','fa fa-wrench','代码生成','catalog',6,'root','',NULL,'menuItem','admin','2020-07-11 10:38:53','','1',',root'),('4028b2ec722fa06f01722fa447880003','admin','2020-05-20 09:13:15','','元数据管理','menu',1,'4028b2ec722fa06f01722fa1dc8c0001','devtool:metadata:view',NULL,'menuItem','admin','2020-05-20 09:13:35','/devtool/metadata','0',',rootn,rootu,rootl,rootl,root,,root4,root0,root2,root8,rootb,root2,roote,rootc,root7,root2,root2,rootf,roota,root0,root6,rootf,root0,root1,root7,root2,root2,rootf,roota,root1,rootd,rootc,root8,rootc,root0,root0,root0,root1,root'),('4028b2ec722fa06f01722fa556140006','admin','2020-05-20 09:14:24','','元数据查询','button',1,'4028b2ec722fa06f01722fa447880003','devtool:metadata:list',NULL,'menuItem','admin','2020-05-20 09:14:52','','0',',rootn,rootu,rootl,rootl,root,,root4,root0,root2,root8,rootb,root2,roote,rootc,root7,root2,root2,rootf,roota,root0,root6,rootf,root0,root1,root7,root2,root2,rootf,roota,root1,rootd,rootc,root8,rootc,root0,root0,root0,root1,root,,root4,root0,root2,root8,rootb,root2,roote,rootc,root7,root2,root2,rootf,roota,root0,root6,rootf,root0,root1,root7,root2,root2,rootf,roota,root4,root4,root7,root8,root8,root0,root0,root0,root3,root'),('4028b2ec722fa06f01722fa65e1b0009','admin','2020-05-20 09:15:32','','元数据新增','button',2,'4028b2ec722fa06f01722fa447880003','devtool:metadata:add',NULL,'menuItem',NULL,NULL,'','0',''),('4028b2ec722fa06f01722fa6b88d000b','admin','2020-05-20 09:15:55','','元数据修改','button',3,'4028b2ec722fa06f01722fa447880003','devtool:metadata:edit',NULL,'menuItem',NULL,NULL,'','0',''),('4028b2ec722fa06f01722fa70ede000d','admin','2020-05-20 09:16:17','','元数据删除','button',4,'4028b2ec722fa06f01722fa447880003','devtool:metadata:remove',NULL,'menuItem',NULL,NULL,'','0',''),('4028b2ec722fa06f01722fa7eff7000f','admin','2020-05-20 09:17:15','','数据库表管理','menu',2,'4028b2ec722fa06f01722fa1dc8c0001','devtool:table:view',NULL,'menuItem',NULL,NULL,'/devtool/table','0',''),('4028b2ec722fa06f01722fa8695d0011','admin','2020-05-20 09:17:46','','数据库表查询','button',1,'4028b2ec722fa06f01722fa7eff7000f','devtool:table:list',NULL,'menuItem',NULL,NULL,'','0',''),('4028b2ec722fa06f01722fa8b2130013','admin','2020-05-20 09:18:04','','数据库表新增','button',2,'4028b2ec722fa06f01722fa7eff7000f','devtool:table:add',NULL,'menuItem',NULL,NULL,'','0',''),('4028b2ec722fa06f01722fa8f5af0015','admin','2020-05-20 09:18:22','','数据库表修改','button',3,'4028b2ec722fa06f01722fa7eff7000f','devtool:table:edit',NULL,'menuItem',NULL,NULL,'','0',''),('4028b2ec722fa06f01722fa947ad0017','admin','2020-05-20 09:18:43','','数据库表删除','button',4,'4028b2ec722fa06f01722fa7eff7000f','devtool:table:remove',NULL,'menuItem',NULL,NULL,'','0',''),('4028b2ec7273f08201727400c3fc0030','yweijian','2020-06-02 15:53:53','','商城会员','menu',1,'4028b2ec72c5682e0172c56b6bab0003','center:member:view',NULL,'menuItem','admin','2020-06-18 11:14:28','/center/member','0','null,4028b2ec72c5682e0172c56b6bab0003'),('4028b2ec7273f08201727400c3fc0031','yweijian','2020-06-02 15:53:53','','商城会员查询','button',1,'4028b2ec7273f08201727400c3fc0030','center:member:list',NULL,'menuItem',NULL,NULL,'#','0',''),('4028b2ec7273f08201727400c3fc0032','yweijian','2020-06-02 15:53:53','','商城会员新增','button',2,'4028b2ec7273f08201727400c3fc0030','center:member:add',NULL,'menuItem',NULL,NULL,'#','0',''),('4028b2ec7273f08201727400c3fc0033','yweijian','2020-06-02 15:53:53','','商城会员修改','button',3,'4028b2ec7273f08201727400c3fc0030','center:member:edit',NULL,'menuItem',NULL,NULL,'#','0',''),('4028b2ec7273f08201727400c3fc0034','yweijian','2020-06-02 15:53:53','','商城会员删除','button',4,'4028b2ec7273f08201727400c3fc0030','center:member:remove',NULL,'menuItem',NULL,NULL,'#','0',''),('4028b2ec7273f08201727400c3fc0035','yweijian','2020-06-02 15:53:53','','商城会员导出','button',5,'4028b2ec7273f08201727400c3fc0030','center:member:export',NULL,'menuItem',NULL,NULL,'#','0',''),('4028b2ec727406a3017274262e450001','admin','2020-06-02 16:29:19','fa fa-cart-plus','商城管理','catalog',7,'root','',NULL,'menuItem','admin','2020-07-11 10:38:59','','1',',root'),('4028b2ec72796af60172796b75d70000','yweijian','2020-06-03 17:03:52','','收货地址','menu',2,'4028b2ec72c5682e0172c56b6bab0003','center:receiveAddress:view',NULL,'menuItem','admin','2020-06-18 11:14:40','/center/receiveAddress','0','null,4028b2ec72c5682e0172c56b6bab0003'),('4028b2ec72796af60172796b75d70001','yweijian','2020-06-03 17:03:52','','收货地址查询','button',1,'4028b2ec72796af60172796b75d70000','center:receiveAddress:list',NULL,'menuItem',NULL,NULL,'#','0',''),('4028b2ec72796af60172796b75d70002','yweijian','2020-06-03 17:03:52','','收货地址新增','button',2,'4028b2ec72796af60172796b75d70000','center:receiveAddress:add',NULL,'menuItem',NULL,NULL,'#','0',''),('4028b2ec72796af60172796b75d70003','yweijian','2020-06-03 17:03:52','','收货地址修改','button',3,'4028b2ec72796af60172796b75d70000','center:receiveAddress:edit',NULL,'menuItem',NULL,NULL,'#','0',''),('4028b2ec72796af60172796b75d70004','yweijian','2020-06-03 17:03:52','','收货地址删除','button',4,'4028b2ec72796af60172796b75d70000','center:receiveAddress:remove',NULL,'menuItem',NULL,NULL,'#','0',''),('4028b2ec72796af60172796b75d70005','yweijian','2020-06-03 17:03:52','','收货地址导出','button',5,'4028b2ec72796af60172796b75d70000','center:receiveAddress:export',NULL,'menuItem',NULL,NULL,'#','0',''),('4028b2ec7292caa6017292d7cb1f0029','yweijian','2020-06-08 15:32:45','','轮播图管理','menu',1,'4028b2ec727406a3017274262e450001','staticres:carousel:view',NULL,'menuItem','admin','2020-06-18 11:14:54','/staticres/carousel','0',',rootn,rootu,rootl,rootl,root,,root4,root0,root2,root8,rootb,root2,roote,rootc,root7,root2,root7,root4,root0,root6,roota,root3,root0,root1,root7,root2,root7,root4,root2,root6,root2,roote,root4,root5,root0,root0,root0,root1,root'),('4028b2ec7292caa6017292d7cb1f002a','yweijian','2020-06-08 15:32:45','','轮播图查询','button',1,'4028b2ec7292caa6017292d7cb1f0029','staticres:carousel:list',NULL,'menuItem',NULL,NULL,'#','0',''),('4028b2ec7292caa6017292d7cb1f002b','yweijian','2020-06-08 15:32:45','','轮播图新增','button',2,'4028b2ec7292caa6017292d7cb1f0029','staticres:carousel:add',NULL,'menuItem',NULL,NULL,'#','0',''),('4028b2ec7292caa6017292d7cb1f002c','yweijian','2020-06-08 15:32:45','','轮播图修改','button',3,'4028b2ec7292caa6017292d7cb1f0029','staticres:carousel:edit',NULL,'menuItem',NULL,NULL,'#','0',''),('4028b2ec7292caa6017292d7cb1f002d','yweijian','2020-06-08 15:32:45','','轮播图删除','button',4,'4028b2ec7292caa6017292d7cb1f0029','staticres:carousel:remove',NULL,'menuItem',NULL,NULL,'#','0',''),('4028b2ec7292caa6017292d7cb1f002e','yweijian','2020-06-08 15:32:45','','轮播图导出','button',5,'4028b2ec7292caa6017292d7cb1f0029','staticres:carousel:export',NULL,'menuItem',NULL,NULL,'#','0',''),('4028b2ec72a231830172a23bfd8b0049','yweijian','2020-06-11 15:17:15','','商品目录','menu',3,'4028b2ec727406a3017274262e450001','shop:catalog:view',NULL,'menuItem','admin','2020-06-11 15:27:17','/shop/catalog','0',',rootn,rootu,rootl,rootl,root,,root4,root0,root2,root8,rootb,root2,roote,rootc,root7,root2,root7,root4,root0,root6,roota,root3,root0,root1,root7,root2,root7,root4,root2,root6,root2,roote,root4,root5,root0,root0,root0,root1,root'),('4028b2ec72a231830172a23bfd8b004a','yweijian','2020-06-11 15:17:15','','商品目录查询','button',1,'4028b2ec72a231830172a23bfd8b0049','shop:catalog:list',NULL,'menuItem',NULL,NULL,'#','0',''),('4028b2ec72a231830172a23bfd8b004b','yweijian','2020-06-11 15:17:15','','商品目录新增','button',2,'4028b2ec72a231830172a23bfd8b0049','shop:catalog:add',NULL,'menuItem',NULL,NULL,'#','0',''),('4028b2ec72a231830172a23bfd8b004c','yweijian','2020-06-11 15:17:15','','商品目录修改','button',3,'4028b2ec72a231830172a23bfd8b0049','shop:catalog:edit',NULL,'menuItem',NULL,NULL,'#','0',''),('4028b2ec72a231830172a23bfd8b004d','yweijian','2020-06-11 15:17:15','','商品目录删除','button',4,'4028b2ec72a231830172a23bfd8b0049','shop:catalog:remove',NULL,'menuItem',NULL,NULL,'#','0',''),('4028b2ec72a231830172a23bfd8b004e','yweijian','2020-06-11 15:17:15','','商品目录导出','button',5,'4028b2ec72a231830172a23bfd8b0049','shop:catalog:export',NULL,'menuItem',NULL,NULL,'#','0',''),('4028b2ec72c523730172c560ce290052','yweijian','2020-06-18 11:03:49','','商品信息','menu',4,'4028b2ec727406a3017274262e450001','shop:product:view',NULL,'menuItem','admin','2020-06-18 11:04:33','/shop/product','0',',rootn,rootu,rootl,rootl,root,,root4,root0,root2,root8,rootb,root2,roote,rootc,root7,root2,root7,root4,root0,root6,roota,root3,root0,root1,root7,root2,root7,root4,root2,root6,root2,roote,root4,root5,root0,root0,root0,root1,root'),('4028b2ec72c523730172c560ce290053','yweijian','2020-06-18 11:03:49','','商品信息查询','button',1,'4028b2ec72c523730172c560ce290052','shop:product:list',NULL,'menuItem',NULL,NULL,'#','0',''),('4028b2ec72c523730172c560ce290054','yweijian','2020-06-18 11:03:49','','商品信息新增','button',2,'4028b2ec72c523730172c560ce290052','shop:product:add',NULL,'menuItem',NULL,NULL,'#','0',''),('4028b2ec72c523730172c560ce290055','yweijian','2020-06-18 11:03:49','','商品信息修改','button',3,'4028b2ec72c523730172c560ce290052','shop:product:edit',NULL,'menuItem',NULL,NULL,'#','0',''),('4028b2ec72c523730172c560ce290056','yweijian','2020-06-18 11:03:49','','商品信息删除','button',4,'4028b2ec72c523730172c560ce290052','shop:product:remove',NULL,'menuItem',NULL,NULL,'#','0',''),('4028b2ec72c523730172c560ce290057','yweijian','2020-06-18 11:03:49','','商品信息导出','button',5,'4028b2ec72c523730172c560ce290052','shop:product:export',NULL,'menuItem',NULL,NULL,'#','0',''),('4028b2ec72c5682e0172c56b6bab0003','admin','2020-06-18 11:14:11','fa fa-users','会员中心','catalog',1,'4028b2ec727406a3017274262e450001','',NULL,'menuItem',NULL,NULL,'','0','');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_group`
--

DROP TABLE IF EXISTS `act_id_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_group`
--

LOCK TABLES `act_id_group` WRITE;
/*!40000 ALTER TABLE `act_id_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_task`
--

DROP TABLE IF EXISTS `act_ru_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint(4) DEFAULT NULL,
  `VAR_COUNT_` int(11) DEFAULT NULL,
  `ID_LINK_COUNT_` int(11) DEFAULT NULL,
  `SUB_TASK_COUNT_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_IDX_TASK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_TASK_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_TASK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_task`
--

LOCK TABLES `act_ru_task` WRITE;
/*!40000 ALTER TABLE `act_ru_task` DISABLE KEYS */;
INSERT INTO `act_ru_task` VALUES ('0daf274b-c1e7-11ea-8f09-96e6f7651f71',2,'7f135cef-c1dd-11ea-8c2f-96e6f7651f71','7f12e7af-c1dd-11ea-8c2f-96e6f7651f71','Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,'部门经理审批',NULL,NULL,'sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A',NULL,'刘备',NULL,50,'2020-07-09 13:21:09.929',NULL,NULL,1,'4028b26c73316c4401733171d2ad0016',NULL,NULL,1,0,1,0),('160354b1-c323-11ea-a804-96e6f7651f71',2,'cb78b0ad-c283-11ea-b0fd-96e6f7651f71','cb78627d-c283-11ea-b0fd-96e6f7651f71','Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,'部门经理审批',NULL,NULL,'sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A',NULL,'刘备',NULL,50,'2020-07-11 03:03:24.881',NULL,NULL,1,'4028b26c73316c4401733171d2ad0016',NULL,NULL,1,0,1,0),('6e30fd78-c283-11ea-b0fd-96e6f7651f71',2,'d2a7edf0-c27e-11ea-8dcf-96e6f7651f71','d2a7ede0-c27e-11ea-8dcf-96e6f7651f71','Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,'部门经理审批',NULL,NULL,'sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A',NULL,'曹操',NULL,50,'2020-07-10 08:00:33.327',NULL,NULL,1,'4028b26c73316c4401733171d2ad0016',NULL,NULL,1,0,1,0),('81f426f9-c321-11ea-a804-96e6f7651f71',2,'7098caed-c321-11ea-a804-96e6f7651f71','7098cadc-c321-11ea-a804-96e6f7651f71','AskForLeave:1:350aab0b-c321-11ea-a804-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,'部门经理审批',NULL,NULL,'sid-6D79B4F5-4CDB-4860-9694-C76721F2914F',NULL,'刘备',NULL,50,'2020-07-11 02:52:06.982',NULL,NULL,1,'4028b26c73316c440173317049080010',NULL,NULL,1,0,1,0),('b12006b9-c28b-11ea-b0fd-96e6f7651f71',2,'9f97591c-c28b-11ea-b0fd-96e6f7651f71','9f9731fc-c28b-11ea-b0fd-96e6f7651f71','Expense:1:5d25c3eb-c28b-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,'老板审批',NULL,NULL,'bossTask',NULL,'admin',NULL,50,'2020-07-10 08:59:41.613',NULL,NULL,1,'4028b26c73316c440173317228b40018',NULL,NULL,1,0,1,0),('cab0fe3a-c323-11ea-a804-96e6f7651f71',2,'caba8986-c286-11ea-b0fd-96e6f7651f71','caba6266-c286-11ea-b0fd-96e6f7651f71','Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71',NULL,NULL,NULL,NULL,NULL,'报销申请',NULL,NULL,'sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8',NULL,'典韦',NULL,50,'2020-07-11 03:08:28.009',NULL,NULL,1,'4028b26c73316c4401733171d2ad0016',NULL,NULL,1,0,0,0);
/*!40000 ALTER TABLE `act_ru_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_bytearray`
--

DROP TABLE IF EXISTS `act_id_bytearray`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_bytearray`
--

LOCK TABLES `act_id_bytearray` WRITE;
/*!40000 ALTER TABLE `act_id_bytearray` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_bytearray` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `role_id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `role_scope` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `role_key` varchar(100) DEFAULT NULL,
  `role_name` varchar(30) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `order_num` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES ('40283e816f92646d016f926a76fd0003','admin','2020-01-11 10:24:08',NULL,'财务审批','FinanceManager','财务管理员','0','admin','2020-07-11 10:39:52',3),('40283e816f92646d016f92705173001a','admin','2020-01-11 10:30:32','1','部门管理员','DivisionManager','部门管理员','0','admin','2020-07-11 10:39:46',4),('402855816f1e2a2e016f1e2a45510000','system','2019-12-19 20:38:04','1','超级管理员','SysAdmin','超级管理员','0','admin','2020-01-11 10:32:43',1),('402855816f329db1016f32a226ef0005','admin','2019-12-19 20:38:04','4','普通管理员','Admin','普通管理员','0','admin','2020-07-11 10:40:02',2);
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_model`
--

DROP TABLE IF EXISTS `act_re_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_model`
--

LOCK TABLES `act_re_model` WRITE;
/*!40000 ALTER TABLE `act_re_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_re_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_detail`
--

DROP TABLE IF EXISTS `act_hi_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_detail`
--

LOCK TABLES `act_hi_detail` WRITE;
/*!40000 ALTER TABLE `act_hi_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_job`
--

DROP TABLE IF EXISTS `act_ru_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
  KEY `ACT_IDX_JOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_JOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_JOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_job`
--

LOCK TABLES `act_ru_job` WRITE;
/*!40000 ALTER TABLE `act_ru_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_oper_log` (
  `oper_log_id` varchar(255) NOT NULL,
  `business_type` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `dept_name` varchar(255) DEFAULT NULL,
  `error_msg` varchar(4000) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `oper_ip` varchar(255) DEFAULT NULL,
  `oper_location` varchar(255) DEFAULT NULL,
  `oper_name` varchar(255) DEFAULT NULL,
  `oper_param` varchar(4000) DEFAULT NULL,
  `oper_url` varchar(1024) DEFAULT NULL,
  `operator_type` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`oper_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_priv`
--

DROP TABLE IF EXISTS `act_id_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_priv` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PRIV_NAME` (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_priv`
--

LOCK TABLES `act_id_priv` WRITE;
/*!40000 ALTER TABLE `act_id_priv` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_priv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_taskinst`
--

DROP TABLE IF EXISTS `act_hi_taskinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT '1',
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_TASK_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_TASK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_taskinst`
--

LOCK TABLES `act_hi_taskinst` WRITE;
/*!40000 ALTER TABLE `act_hi_taskinst` DISABLE KEYS */;
INSERT INTO `act_hi_taskinst` VALUES ('0318c912-c1c7-11ea-9b4f-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71',NULL,'sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','46a111e2-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL,NULL,'部门经理审批',NULL,NULL,NULL,'刘备','2020-07-09 17:31:48.283',NULL,'2020-07-09 17:32:22.311',34028,NULL,50,NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016','2020-07-09 17:32:22.311'),('0daf274b-c1e7-11ea-8f09-96e6f7651f71',2,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71',NULL,'sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A','7f12e7af-c1dd-11ea-8c2f-96e6f7651f71','7f135cef-c1dd-11ea-8c2f-96e6f7651f71',NULL,NULL,NULL,NULL,'部门经理审批',NULL,NULL,NULL,'刘备','2020-07-09 21:21:09.941',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016','2020-07-09 21:21:09.981'),('160354b1-c323-11ea-a804-96e6f7651f71',2,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71',NULL,'sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A','cb78627d-c283-11ea-b0fd-96e6f7651f71','cb78b0ad-c283-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL,'部门经理审批',NULL,NULL,NULL,'刘备','2020-07-11 11:03:24.881',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016','2020-07-11 11:03:24.906'),('176159f9-c1c7-11ea-9b4f-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71',NULL,'sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','46a111e2-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL,NULL,'报销申请',NULL,NULL,NULL,'周瑜','2020-07-09 17:32:22.313',NULL,'2020-07-09 17:38:00.772',338459,NULL,50,NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016','2020-07-09 17:38:00.772'),('1bfbd44f-c1c8-11ea-9b4f-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71',NULL,'sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','46a111e2-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL,NULL,'部门经理审批',NULL,NULL,NULL,'刘备','2020-07-09 17:39:39.533',NULL,'2020-07-09 17:44:06.292',266759,NULL,50,NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016','2020-07-09 17:44:06.292'),('2797ab5d-c1af-11ea-9b4f-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71',NULL,'sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8','279476fb-c1af-11ea-9b4f-96e6f7651f71','2794ec3a-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL,NULL,'报销申请',NULL,NULL,NULL,'典韦','2020-07-09 14:41:01.592',NULL,'2020-07-09 16:17:30.277',5788685,NULL,50,NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016','2020-07-09 16:17:30.277'),('28586d6e-c274-11ea-9d08-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71',NULL,'sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8','2855601b-c274-11ea-9d08-96e6f7651f71','2855d55b-c274-11ea-9d08-96e6f7651f71',NULL,NULL,NULL,NULL,'报销申请',NULL,NULL,NULL,'典韦','2020-07-10 14:11:13.710',NULL,'2020-07-10 14:17:41.197',387487,'作废',50,NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016','2020-07-10 14:17:41.197'),('291c1779-c1cb-11ea-9b4f-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71',NULL,'sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','46a111e2-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL,NULL,'部门经理审批',NULL,NULL,NULL,'曹操','2020-07-09 18:01:30.047',NULL,'2020-07-09 18:02:25.332',55285,NULL,50,NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016','2020-07-09 18:02:25.332'),('3af085dd-c1c9-11ea-9b4f-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71',NULL,'sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','46a111e2-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL,NULL,'部门经理审批',NULL,NULL,NULL,'刘备','2020-07-09 17:47:40.965',NULL,'2020-07-09 17:51:20.823',219858,NULL,50,NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016','2020-07-09 17:51:20.823'),('46a111e5-c1af-11ea-9b4f-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71',NULL,'sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','46a111e2-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL,NULL,'报销申请',NULL,NULL,NULL,'典韦','2020-07-09 14:41:53.662',NULL,'2020-07-09 17:28:19.781',9986119,NULL,50,NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016','2020-07-09 17:28:19.781'),('4a10ad21-c1cb-11ea-9b4f-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71',NULL,'sid-7C468FA0-CF11-4C38-80C7-1CBAC3CAED79','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','46a111e2-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL,NULL,'财务审批',NULL,NULL,NULL,'周瑜','2020-07-09 18:02:25.335',NULL,'2020-07-09 18:02:45.942',20607,NULL,50,NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016','2020-07-09 18:02:45.942'),('58b9545a-c27e-11ea-8dcf-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71',NULL,'sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8','58b92d37-c27e-11ea-8dcf-96e6f7651f71','58b92d47-c27e-11ea-8dcf-96e6f7651f71',NULL,NULL,NULL,NULL,'报销申请',NULL,NULL,NULL,'典韦','2020-07-10 15:24:09.843',NULL,'2020-07-10 15:24:31.580',21737,'作废',50,NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016','2020-07-10 15:24:31.580'),('6e30fd78-c283-11ea-b0fd-96e6f7651f71',2,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71',NULL,'sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A','d2a7ede0-c27e-11ea-8dcf-96e6f7651f71','d2a7edf0-c27e-11ea-8dcf-96e6f7651f71',NULL,NULL,NULL,NULL,'部门经理审批',NULL,NULL,NULL,'曹操','2020-07-10 16:00:33.343',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016','2020-07-10 16:00:33.389'),('7098f200-c321-11ea-a804-96e6f7651f71',3,'AskForLeave:1:350aab0b-c321-11ea-a804-96e6f7651f71',NULL,'sid-FA5DEC96-DF3B-476A-9911-6603A764994E','7098cadc-c321-11ea-a804-96e6f7651f71','7098caed-c321-11ea-a804-96e6f7651f71',NULL,NULL,NULL,NULL,'请假申请',NULL,NULL,NULL,'孙坚','2020-07-11 10:51:37.863',NULL,'2020-07-11 10:52:06.980',29117,NULL,50,NULL,NULL,NULL,'4028b26c73316c440173317049080010','2020-07-11 10:52:06.980'),('7f161c12-c1dd-11ea-8c2f-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71',NULL,'sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8','7f12e7af-c1dd-11ea-8c2f-96e6f7651f71','7f135cef-c1dd-11ea-8c2f-96e6f7651f71',NULL,NULL,NULL,NULL,'报销申请',NULL,NULL,NULL,'典韦','2020-07-09 20:12:45.232',NULL,'2020-07-09 21:21:09.921',4104689,NULL,50,NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016','2020-07-09 21:21:09.921'),('81f426f9-c321-11ea-a804-96e6f7651f71',2,'AskForLeave:1:350aab0b-c321-11ea-a804-96e6f7651f71',NULL,'sid-6D79B4F5-4CDB-4860-9694-C76721F2914F','7098cadc-c321-11ea-a804-96e6f7651f71','7098caed-c321-11ea-a804-96e6f7651f71',NULL,NULL,NULL,NULL,'部门经理审批',NULL,NULL,NULL,'刘备','2020-07-11 10:52:06.982',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'4028b26c73316c440173317049080010','2020-07-11 10:52:07.009'),('868bfc3d-c1af-11ea-9b4f-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71',NULL,'sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8','868bd51b-c1af-11ea-9b4f-96e6f7651f71','868bfc3a-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL,NULL,'报销申请',NULL,NULL,NULL,'典韦','2020-07-09 14:43:40.898',NULL,'2020-07-09 19:17:41.073',16440175,NULL,50,NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016','2020-07-09 19:17:41.073'),('86d20eb2-c1c6-11ea-9b4f-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71',NULL,'sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','46a111e2-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL,NULL,'部门经理审批',NULL,NULL,NULL,'刘备','2020-07-09 17:28:19.782',NULL,'2020-07-09 17:30:36.491',136709,NULL,50,NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016','2020-07-09 17:30:36.491'),('8b490879-c1d7-11ea-8903-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71',NULL,'sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A','cee3e203-c1af-11ea-9b4f-96e6f7651f71','cee3e212-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL,NULL,'部门经理审批',NULL,NULL,NULL,'刘备','2020-07-09 19:30:08.718',NULL,'2020-07-09 19:30:40.512',31794,NULL,50,NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016','2020-07-09 19:30:40.512'),('9e3cb7c5-c1d7-11ea-8903-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71',NULL,'sid-7C468FA0-CF11-4C38-80C7-1CBAC3CAED79','cee3e203-c1af-11ea-9b4f-96e6f7651f71','cee3e212-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL,NULL,'财务审批',NULL,NULL,NULL,'周瑜','2020-07-09 19:30:40.513',NULL,'2020-07-09 19:31:06.903',26390,NULL,50,NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016','2020-07-09 19:31:06.903'),('9f45afc7-c1bf-11ea-9b4f-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71',NULL,'sid-7C468FA0-CF11-4C38-80C7-1CBAC3CAED79','279476fb-c1af-11ea-9b4f-96e6f7651f71','2794ec3a-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL,NULL,'财务审批',NULL,NULL,NULL,'周瑜','2020-07-09 16:38:54.328',NULL,'2020-07-09 16:55:32.779',998451,NULL,50,NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016','2020-07-09 16:55:32.779'),('9f97591f-c28b-11ea-b0fd-96e6f7651f71',3,'Expense:1:5d25c3eb-c28b-11ea-b0fd-96e6f7651f71',NULL,'fillTask','9f9731fc-c28b-11ea-b0fd-96e6f7651f71','9f97591c-c28b-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL,'报销申请',NULL,NULL,NULL,'关羽','2020-07-10 16:59:12.196',NULL,'2020-07-10 16:59:41.612',29416,NULL,50,NULL,NULL,NULL,'4028b26c73316c440173317228b40018','2020-07-10 16:59:41.612'),('a1ebd0de-c1bc-11ea-9b4f-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71',NULL,'sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A','279476fb-c1af-11ea-9b4f-96e6f7651f71','2794ec3a-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL,NULL,'部门经理审批',NULL,NULL,NULL,'刘备','2020-07-09 16:17:30.282',NULL,'2020-07-09 16:38:54.320',1284038,NULL,50,NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016','2020-07-09 16:38:54.320'),('a96c9ec2-c27d-11ea-8dcf-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71',NULL,'sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A','e988b904-c25d-11ea-82f3-96e6f7651f71','e989a374-c25d-11ea-82f3-96e6f7651f71',NULL,NULL,NULL,NULL,'部门经理审批',NULL,NULL,NULL,'刘备','2020-07-10 15:19:15.739',NULL,'2020-07-10 15:19:35.542',19803,'作废',50,NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016','2020-07-10 15:19:35.542'),('b12006b9-c28b-11ea-b0fd-96e6f7651f71',2,'Expense:1:5d25c3eb-c28b-11ea-b0fd-96e6f7651f71',NULL,'bossTask','9f9731fc-c28b-11ea-b0fd-96e6f7651f71','9f97591c-c28b-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL,'老板审批',NULL,NULL,NULL,'admin','2020-07-10 16:59:41.613',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'4028b26c73316c440173317228b40018','2020-07-10 16:59:41.632'),('b5c83ce2-c320-11ea-a804-96e6f7651f71',3,'AskForLeave:1:34963ae2-c31d-11ea-9982-96e6f7651f71',NULL,'sid-FA5DEC96-DF3B-476A-9911-6603A764994E','b5c4452e-c320-11ea-a804-96e6f7651f71','b5c4ba6f-c320-11ea-a804-96e6f7651f71',NULL,NULL,NULL,NULL,'请假申请',NULL,NULL,NULL,'孙权','2020-07-11 10:46:24.439',NULL,'2020-07-11 10:46:57.551',33112,'作废',50,NULL,NULL,NULL,'4028b26c73316c440173317049080010','2020-07-11 10:46:57.551'),('bafc2cd6-c1c8-11ea-9b4f-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71',NULL,'sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','46a111e2-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL,NULL,'报销申请',NULL,NULL,NULL,'周瑜','2020-07-09 17:44:06.293',NULL,'2020-07-09 17:47:40.964',214671,NULL,50,NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016','2020-07-09 17:47:40.964'),('be10ca74-c1c9-11ea-9b4f-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71',NULL,'sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','46a111e2-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL,NULL,'报销申请',NULL,NULL,NULL,'周瑜','2020-07-09 17:51:20.959',NULL,'2020-07-09 17:59:15.711',474752,NULL,50,NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016','2020-07-09 17:59:15.711'),('cab0fe3a-c323-11ea-a804-96e6f7651f71',2,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71',NULL,'sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8','caba6266-c286-11ea-b0fd-96e6f7651f71','caba8986-c286-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL,'报销申请',NULL,NULL,NULL,'典韦','2020-07-11 11:08:28.009',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016','2020-07-11 11:08:28.033'),('caba8989-c286-11ea-b0fd-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71',NULL,'sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8','caba6266-c286-11ea-b0fd-96e6f7651f71','caba8986-c286-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL,'报销申请',NULL,NULL,NULL,'典韦','2020-07-10 16:24:37.085',NULL,'2020-07-10 16:25:12.236',35151,NULL,50,NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016','2020-07-10 16:25:12.236'),('cb78b0b0-c283-11ea-b0fd-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71',NULL,'sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8','cb78627d-c283-11ea-b0fd-96e6f7651f71','cb78b0ad-c283-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL,'报销申请',NULL,NULL,NULL,'典韦','2020-07-10 16:03:09.841',NULL,'2020-07-11 11:03:24.879',68415038,NULL,50,NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016','2020-07-11 11:03:24.879'),('cdaaf808-c1d5-11ea-8903-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71',NULL,'sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A','868bd51b-c1af-11ea-9b4f-96e6f7651f71','868bfc3a-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL,NULL,'部门经理审批',NULL,NULL,NULL,'曹操','2020-07-09 19:17:41.095',NULL,'2020-07-09 19:18:13.305',32210,NULL,50,NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016','2020-07-09 19:18:13.305'),('cee40925-c1af-11ea-9b4f-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71',NULL,'sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8','cee3e203-c1af-11ea-9b4f-96e6f7651f71','cee3e212-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL,NULL,'报销申请',NULL,NULL,NULL,'典韦','2020-07-09 14:45:42.271',NULL,'2020-07-09 19:30:08.716',17066445,NULL,50,NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016','2020-07-09 19:30:08.716'),('d2a81503-c27e-11ea-8dcf-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71',NULL,'sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8','d2a7ede0-c27e-11ea-8dcf-96e6f7651f71','d2a7edf0-c27e-11ea-8dcf-96e6f7651f71',NULL,NULL,NULL,NULL,'报销申请',NULL,NULL,NULL,'典韦','2020-07-10 15:27:34.412',NULL,'2020-07-10 16:00:33.317',1978905,NULL,50,NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016','2020-07-10 16:00:33.317'),('d84ea73b-c1c6-11ea-9b4f-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71',NULL,'sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','46a111e2-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL,NULL,'报销申请',NULL,NULL,NULL,'典韦','2020-07-09 17:30:36.494',NULL,'2020-07-09 17:31:48.281',71787,NULL,50,NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016','2020-07-09 17:31:48.281'),('d90e9f4b-c1ca-11ea-9b4f-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71',NULL,'sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','46a111e2-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL,NULL,'部门经理审批',NULL,NULL,NULL,'刘备','2020-07-09 17:59:15.739',NULL,'2020-07-09 18:00:16.318',60579,NULL,50,NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016','2020-07-09 18:00:16.318'),('dfae4e92-c286-11ea-b0fd-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71',NULL,'sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A','caba6266-c286-11ea-b0fd-96e6f7651f71','caba8986-c286-11ea-b0fd-96e6f7651f71',NULL,NULL,NULL,NULL,'部门经理审批',NULL,NULL,NULL,'刘备','2020-07-10 16:25:12.237',NULL,'2020-07-11 11:08:28.003',67395766,NULL,50,NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016','2020-07-11 11:08:28.003'),('e0df0bb1-c1d5-11ea-8903-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71',NULL,'sid-7C468FA0-CF11-4C38-80C7-1CBAC3CAED79','868bd51b-c1af-11ea-9b4f-96e6f7651f71','868bfc3a-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL,NULL,'财务审批',NULL,NULL,NULL,'周瑜','2020-07-09 19:18:13.313',NULL,'2020-07-09 19:30:21.170',727857,NULL,50,NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016','2020-07-09 19:30:21.170'),('e11e66d1-c1c7-11ea-9b4f-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71',NULL,'sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','46a111e2-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL,NULL,'部门经理审批',NULL,NULL,NULL,'刘备','2020-07-09 17:38:00.774',NULL,'2020-07-09 17:38:41.780',41006,NULL,50,NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016','2020-07-09 17:38:41.780'),('e98d9b17-c25d-11ea-82f3-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71',NULL,'sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8','e988b904-c25d-11ea-82f3-96e6f7651f71','e989a374-c25d-11ea-82f3-96e6f7651f71',NULL,NULL,NULL,NULL,'报销申请',NULL,NULL,NULL,'典韦','2020-07-10 11:31:59.434',NULL,'2020-07-10 15:19:15.715',13636281,NULL,50,NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016','2020-07-10 15:19:15.715'),('f98fb9d8-c1c7-11ea-9b4f-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71',NULL,'sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','46a111e2-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL,NULL,'报销申请',NULL,NULL,NULL,'周瑜','2020-07-09 17:38:41.782',NULL,'2020-07-09 17:39:39.532',57750,NULL,50,NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016','2020-07-09 17:39:39.532'),('fd2ef972-c1ca-11ea-9b4f-96e6f7651f71',3,'Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71',NULL,'sid-7C468FA0-CF11-4C38-80C7-1CBAC3CAED79','46a0ebc3-c1af-11ea-9b4f-96e6f7651f71','46a111e2-c1af-11ea-9b4f-96e6f7651f71',NULL,NULL,NULL,NULL,'财务审批',NULL,NULL,NULL,'周瑜','2020-07-09 18:00:16.349',NULL,'2020-07-09 18:01:29.907',73558,NULL,50,NULL,NULL,NULL,'4028b26c73316c4401733171d2ad0016','2020-07-09 18:01:29.907');
/*!40000 ALTER TABLE `act_hi_taskinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_de_model_relation`
--

DROP TABLE IF EXISTS `act_de_model_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_de_model_relation` (
  `id` varchar(255) NOT NULL,
  `parent_model_id` varchar(255) DEFAULT NULL,
  `model_id` varchar(255) DEFAULT NULL,
  `relation_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_relation_parent` (`parent_model_id`),
  KEY `fk_relation_child` (`model_id`),
  CONSTRAINT `fk_relation_child` FOREIGN KEY (`model_id`) REFERENCES `act_de_model` (`id`),
  CONSTRAINT `fk_relation_parent` FOREIGN KEY (`parent_model_id`) REFERENCES `act_de_model` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_de_model_relation`
--

LOCK TABLES `act_de_model_relation` WRITE;
/*!40000 ALTER TABLE `act_de_model_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_de_model_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_dept` (
  `role_dept_id` varchar(255) NOT NULL,
  `dept_id` varchar(255) DEFAULT NULL,
  `role_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_role` (
  `user_post_id` varchar(255) NOT NULL,
  `role_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES ('40283e817048902901704892338d0003','402855816f1e2a2e016f1e2a45510000','402855816f1e2a2e016f1e2a45af0001'),('40283e81704890290170489cc7f70019','402855816f329db1016f32a226ef0005','40283e81704890290170489a989f000b'),('40283e81704890290170489cddb0001b','402855816f329db1016f32a226ef0005','40283e817048902901704899f54e0008'),('40283e8170489029017048a2ea790025','402855816f329db1016f32a226ef0005','40283e8170489029017048a2c9610022'),('40283e8170489029017048ac11570039','40283e816f92646d016f926a76fd0003','40283e8170489029017048a4533b0027'),('4028802c71a11b570171a11d92f50001','40283e816f92646d016f926a76fd0003','40283e8170489029017048a4f302002a'),('4028802c71a11b570171a11da9830003','40283e816f92646d016f92705173001a','40283e8170489029017048a0d993001d'),('4028802c71a11b570171a11dc1120005','40283e816f92646d016f92705173001a','40283e817048902901704898b1690005'),('4028b2ec727d32ab01727d33a95d0005','40283e816f92646d016f926a76fd0003','40283e8170489029017048a63954002d');
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_cn_flow_type`
--

DROP TABLE IF EXISTS `act_cn_flow_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_cn_flow_type` (
  `flow_type_id` varchar(255) NOT NULL,
  `ancestors` varchar(255) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `order_num` bigint(20) DEFAULT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `type_name` varchar(30) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`flow_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_cn_flow_type`
--

LOCK TABLES `act_cn_flow_type` WRITE;
/*!40000 ALTER TABLE `act_cn_flow_type` DISABLE KEYS */;
INSERT INTO `act_cn_flow_type` VALUES ('4028b26c73316c440173316d1dc40000',',root','admin','2020-07-09 10:35:01',1,'root','','0','财务','admin','2020-07-09 11:10:06'),('4028b26c73316c440173316da7a30002',',root,4028b26c73316c440173316d1dc40000','admin','2020-07-09 10:35:37',1,'4028b26c73316c440173316d1dc40000','','0','差旅报销','admin','2020-07-09 11:10:11'),('4028b26c73316c440173316e56910007',',root,4028b26c73316c440173316d1dc40000','admin','2020-07-09 10:36:22',2,'4028b26c73316c440173316d1dc40000','','0','通讯报销','admin','2020-07-09 11:10:21'),('4028b26c73316c440173316f465b000c',',root,4028b26c73316c440173316d1dc40000','admin','2020-07-09 10:37:23',3,'4028b26c73316c440173316d1dc40000','','0','接待报销','admin','2020-07-09 11:10:26'),('4028b26c73316c440173316fd2b9000e',',root','admin','2020-07-09 10:37:59',2,'root','','0','考勤','admin','2020-07-09 11:10:35'),('4028b26c73316c440173317049080010',',root,4028b26c73316c440173316fd2b9000e','admin','2020-07-09 10:38:29',1,'4028b26c73316c440173316fd2b9000e','','0','请假申请','admin','2020-07-09 11:10:40'),('4028b26c73316c440173317072820012',',root,4028b26c73316c440173316fd2b9000e','admin','2020-07-09 10:38:40',2,'4028b26c73316c440173316fd2b9000e','','0','出差申请','admin','2020-07-09 11:10:44'),('4028b26c73316c4401733171d2ad0016',',root,4028b26c73316c440173316d1dc40000,4028b26c73316c440173316da7a30002','admin','2020-07-09 10:40:10',1,'4028b26c73316c440173316da7a30002','','0','普通员工级',NULL,NULL),('4028b26c73316c440173317228b40018',',root,4028b26c73316c440173316d1dc40000,4028b26c73316c440173316da7a30002','admin','2020-07-09 10:40:32',2,'4028b26c73316c440173316da7a30002','','0','部门经理级',NULL,NULL);
/*!40000 ALTER TABLE `act_cn_flow_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_info`
--

DROP TABLE IF EXISTS `act_id_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_info`
--

LOCK TABLES `act_id_info` WRITE;
/*!40000 ALTER TABLE `act_id_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_property`
--

DROP TABLE IF EXISTS `act_id_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_property`
--

LOCK TABLES `act_id_property` WRITE;
/*!40000 ALTER TABLE `act_id_property` DISABLE KEYS */;
INSERT INTO `act_id_property` VALUES ('schema.version','6.4.0.0',1);
/*!40000 ALTER TABLE `act_id_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_evt_log`
--

DROP TABLE IF EXISTS `act_evt_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_evt_log`
--

LOCK TABLES `act_evt_log` WRITE;
/*!40000 ALTER TABLE `act_evt_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_evt_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_procdef`
--

DROP TABLE IF EXISTS `act_re_procdef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DERIVED_FROM_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DERIVED_FROM_ROOT_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DERIVED_VERSION_` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`DERIVED_VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_procdef`
--

LOCK TABLES `act_re_procdef` WRITE;
/*!40000 ALTER TABLE `act_re_procdef` DISABLE KEYS */;
INSERT INTO `act_re_procdef` VALUES ('AskForLeave:1:350aab0b-c321-11ea-a804-96e6f7651f71',2,'考勤 / 请假申请','请假流程','AskForLeave',1,'34f6fbf8-c321-11ea-a804-96e6f7651f71','请假流程.bpmn20.xml','请假流程.AskForLeave.png','请假流程',0,1,1,'4028b26c73316c440173317049080010',NULL,NULL,NULL,0),('Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71',2,'财务 / 差旅报销 / 普通员工级','员工级别-报销流程','Expense2',1,'e5381dc2-c191-11ea-8e4d-96e6f7651f71','员工级别-报销流程.bpmn20.xml','员工级别-报销流程.Expense2.png','员工级别-报销流程',0,1,1,'4028b26c73316c4401733171d2ad0016',NULL,NULL,NULL,0),('Expense:1:5d25c3eb-c28b-11ea-b0fd-96e6f7651f71',2,'财务 / 差旅报销 / 部门经理级','经理级别-差旅报销','Expense',1,'5d1410a8-c28b-11ea-b0fd-96e6f7651f71','经理级别-差旅报销.bpmn20.xml','经理级别-差旅报销.Expense.png','报销流程',0,1,1,'4028b26c73316c440173317228b40018',NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `act_re_procdef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_shiro_filter`
--

DROP TABLE IF EXISTS `sys_shiro_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_shiro_filter` (
  `filter_id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `filter_key` varchar(255) DEFAULT NULL,
  `filter_name` varchar(255) DEFAULT NULL,
  `filter_value` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `order_num` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_shiro_filter`
--

LOCK TABLES `sys_shiro_filter` WRITE;
/*!40000 ALTER TABLE `sys_shiro_filter` DISABLE KEYS */;
INSERT INTO `sys_shiro_filter` VALUES ('40283e8170470c0401704712b9b7000e','admin','2020-02-15 12:19:34','/favicon.ico**','网页图标','anon','对静态资源设置匿名访问','0','admin','2020-02-15 12:36:31',11),('40283e8170470c04017047131fbb0010','admin','2020-02-15 12:20:01','/css/**','样式库','anon','对静态资源设置匿名访问','0','admin','2020-02-15 12:36:43',10),('40283e8170470c04017047139e870012','admin','2020-02-15 12:20:33','/fonts/**','字体库','anon','对静态资源设置匿名访问','0','admin','2020-02-15 12:36:21',9),('40283e8170470c0401704713db7f0014','admin','2020-02-15 12:20:49','/img/**','图片库','anon','对静态资源设置匿名访问','0','admin','2020-02-15 12:34:22',8),('40283e8170470c0401704714d7440016','admin','2020-02-15 12:21:53','/ajax/**','插件库','anon','对静态资源设置匿名访问','0','admin','2020-02-15 12:36:17',7),('40283e8170470c040170471520a60018','admin','2020-02-15 12:22:12','/js/**','脚本库','anon','对静态资源设置匿名访问','0','admin','2020-02-15 12:34:18',6),('40283e8170470c04017047157601001a','admin','2020-02-15 12:22:34','/kaptcha/**','验证码','anon','对静态资源设置匿名访问','0','admin','2020-02-15 12:34:14',5),('40283e8170470c040170471762a2001c','admin','2020-02-15 12:24:40','/modeler/**','流程设计器','anon','对静态资源设置匿名访问','0','admin','2020-02-15 12:34:09',4),('40283e8170470c0401704717cae8001e','admin','2020-02-15 12:25:07','/logout','退出请求','logout','退出请求过滤限制访问','0','admin','2020-02-15 12:37:03',3),('40283e8170470c040170471832660020','admin','2020-02-15 12:25:33','/login','登录请求','anon,kaptchaValidate','登录请求过滤限制访问','0','admin','2020-02-15 12:37:15',2),('40283e8170470c040170471892750022','admin','2020-02-15 12:25:58','/**','所有请求','user,kickout,onlineSession','所有请求过滤限制访问','0','admin','2020-02-15 12:38:05',1);
/*!40000 ALTER TABLE `sys_shiro_filter` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-11 16:10:02
