-- MySQL dump 10.13  Distrib 5.7.24, for Win64 (x86_64)
--
-- Host: 47.114.83.206    Database: daffodil
-- ------------------------------------------------------
-- Server version	5.7.27

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
INSERT INTO `act_cn_flow_user` VALUES ('402881827340b10b017340e63a380017','2c165a9d-c3e9-11ea-9902-96e6f7651f71','4028b26c73316c440173316f465b000c','Reception','2','40283e81704890290170489a989f000b'),('4028b26c73317f120173318ecfe8000f','e5381dc2-c191-11ea-8e4d-96e6f7651f71','4028b26c73316c4401733171d2ad0016','Expense2','2','40283e817048902901704899f54e0008'),('4028b26c7337bcae017337f209c3000f','5d1410a8-c28b-11ea-b0fd-96e6f7651f71','4028b26c73316c440173317228b40018','Expense','0','40283e8170489029017048a2c9610022'),('4028b26c7337bcae017337f2345d0010','e5381dc2-c191-11ea-8e4d-96e6f7651f71','4028b26c73316c4401733171d2ad0016','Expense2','0','40283e8170489029017048a2c9610022'),('4028b26c733bb8d701733bc7abc50075','34f6fbf8-c321-11ea-a804-96e6f7651f71','4028b26c73316c440173317049080010','AskForLeave','2','40283e8170489029017048a4533b0027'),('4028b26c733cbcf001733cca94580001','34f6fbf8-c321-11ea-a804-96e6f7651f71','4028b26c73316c440173317049080010','AskForLeave','2','40283e8170489029017048a63954002d'),('4028b26c733cd35401733cd406840000','34f6fbf8-c321-11ea-a804-96e6f7651f71','4028b26c73316c440173317049080010','AskForLeave','2','40283e8170489029017048a63954002d'),('4028b26c733cd35401733cd420160001','5d1410a8-c28b-11ea-b0fd-96e6f7651f71','4028b26c73316c440173317228b40018','Expense','2','40283e8170489029017048a63954002d'),('4028b26c733cd35401733cd4332d0002','e5381dc2-c191-11ea-8e4d-96e6f7651f71','4028b26c73316c4401733171d2ad0016','Expense2','2','40283e8170489029017048a63954002d'),('4028b26c733cd35401733ce228e00003','e5381dc2-c191-11ea-8e4d-96e6f7651f71','4028b26c73316c4401733171d2ad0016','Expense2','0','40283e817048902901704899f54e0008'),('4028b26c734c522301734c6ddc6e000e','74efe6ed-c5ab-11ea-91f9-96e6f7651f71','4028b26c73316c440173316f465b000c','Reception','2','40283e81704890290170489a989f000b'),('4028b26c734c522301734c73ac3d0020','6967854e-c5ac-11ea-91f9-96e6f7651f71','4028b26c73316c440173316f465b000c','Reception','0','40283e81704890290170489a989f000b'),('4028b26c734ca07c01734cb38dbc000e','2de47d53-c5b6-11ea-8271-96e6f7651f71','4028b26c73316c440173316f465b000c','HighReception','2','40283e81704890290170489a989f000b'),('4028b26c734ca07c01734cbcf1bb0019','995fca42-c5b7-11ea-8271-96e6f7651f71','4028b26c73316c440173316f465b000c','HighReception','0','40283e81704890290170489a989f000b');
/*!40000 ALTER TABLE `act_cn_flow_user` ENABLE KEYS */;
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
INSERT INTO `act_de_model` VALUES ('01150082-c5b4-11ea-8271-96e6f7651f71','高级接待流程报销','HighReception','高级接待流程报销-包容网关测试',NULL,'2020-07-14 17:25:49.071000','admin','2020-07-14 17:51:22.256000','admin',1,'{\"modelId\":\"01150082-c5b4-11ea-8271-96e6f7651f71\",\"bounds\":{\"lowerRight\":{\"x\":1200,\"y\":1050},\"upperLeft\":{\"x\":0,\"y\":0}},\"properties\":{\"process_id\":\"HighReception\",\"name\":\"高级接待流程报销\",\"documentation\":\"高级接待流程报销-包容网关测试\",\"process_author\":\"\",\"process_version\":\"\",\"process_namespace\":\"http://www.flowable.org/processdef\",\"process_historylevel\":\"\",\"isexecutable\":true,\"dataproperties\":\"\",\"executionlisteners\":\"\",\"eventlisteners\":\"\",\"signaldefinitions\":\"\",\"messagedefinitions\":\"\",\"process_potentialstarteruser\":\"\",\"process_potentialstartergroup\":\"\",\"iseagerexecutionfetch\":\"false\"},\"childShapes\":[{\"resourceId\":\"startEvent1\",\"properties\":{\"overrideid\":\"\",\"name\":\"开始\",\"documentation\":\"\",\"executionlisteners\":\"\",\"initiator\":\"\",\"formkeydefinition\":\"\",\"formreference\":\"\",\"formproperties\":\"\"},\"stencil\":{\"id\":\"StartNoneEvent\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-9B93E7F2-F1B7-452E-B462-45E1C7C5026D\"}],\"bounds\":{\"lowerRight\":{\"x\":110,\"y\":193},\"upperLeft\":{\"x\":80,\"y\":163}},\"dockers\":[]},{\"resourceId\":\"sid-14072E99-2BDD-4EEB-BA3A-92EE73696E39\",\"properties\":{\"overrideid\":\"\",\"name\":\"接待申请\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"type\":\"idm\",\"idm\":{\"type\":\"initiator\"}}},\"formkeydefinition\":\"\",\"formreference\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\",\"skipexpression\":\"\",\"nodetype\":\"\",\"iseditdata\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-FEEEC218-9CEE-462F-92F3-78FE50A6EC32\"}],\"bounds\":{\"lowerRight\":{\"x\":275,\"y\":218},\"upperLeft\":{\"x\":175,\"y\":138}},\"dockers\":[]},{\"resourceId\":\"sid-9B93E7F2-F1B7-452E-B462-45E1C7C5026D\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-14072E99-2BDD-4EEB-BA3A-92EE73696E39\"}],\"bounds\":{\"lowerRight\":{\"x\":174.234375,\"y\":178},\"upperLeft\":{\"x\":110.21875,\"y\":178}},\"dockers\":[{\"x\":15,\"y\":15},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-14072E99-2BDD-4EEB-BA3A-92EE73696E39\"}},{\"resourceId\":\"sid-54B96349-6739-49F7-BB3E-905F9A181488\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"sequencefloworder\":\"\"},\"stencil\":{\"id\":\"InclusiveGateway\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-B3B6D06F-068E-4E8E-A124-FA433277B3D5\"},{\"resourceId\":\"sid-E0AEA166-AFAA-4FC4-ABF9-DAACB61E90B4\"},{\"resourceId\":\"sid-62CEC576-8A1D-4FA2-96BF-63FF4A295A17\"}],\"bounds\":{\"lowerRight\":{\"x\":414.5,\"y\":198},\"upperLeft\":{\"x\":374.5,\"y\":158}},\"dockers\":[]},{\"resourceId\":\"sid-FEEEC218-9CEE-462F-92F3-78FE50A6EC32\",\"properties\":{\"overrideid\":\"\",\"name\":\"提交\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-54B96349-6739-49F7-BB3E-905F9A181488\"}],\"bounds\":{\"lowerRight\":{\"x\":374.9609375,\"y\":178},\"upperLeft\":{\"x\":275.658203125,\"y\":178}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":20,\"y\":20}],\"target\":{\"resourceId\":\"sid-54B96349-6739-49F7-BB3E-905F9A181488\"}},{\"resourceId\":\"sid-001C5377-49E0-4720-A1D4-C6B6528206A9\",\"properties\":{\"overrideid\":\"\",\"name\":\"部门经理审批\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"type\":\"idm\",\"idm\":{\"type\":\"groups\",\"candidateGroups\":[{\"id\":\"40283e816f92646d016f92705173001a\",\"name\":\"部门管理员\",\"type\":null,\"$$hashKey\":\"object:9845\"}]}}},\"formkeydefinition\":\"\",\"formreference\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\",\"skipexpression\":\"\",\"nodetype\":\"\",\"iseditdata\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-F2E8AD2E-6F00-4E55-A6C1-19C2E361AC79\"}],\"bounds\":{\"lowerRight\":{\"x\":620,\"y\":110},\"upperLeft\":{\"x\":520,\"y\":30}},\"dockers\":[]},{\"resourceId\":\"sid-AB0D67C6-8425-46DE-AB03-A8B21B5CD223\",\"properties\":{\"overrideid\":\"\",\"name\":\"总经理审批\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"type\":\"idm\",\"idm\":{\"type\":\"user\",\"assignee\":{\"id\":\"曹操\",\"firstName\":\"曹操\",\"lastName\":null,\"email\":\"caocao@163.com\",\"fullName\":\"曹操 \",\"groups\":[],\"privileges\":[\"access-idm\",\"access-modeler\",\"access-task\",\"access-admin\",\"access-rest-api\"],\"$$hashKey\":\"object:10023\"}}}},\"formkeydefinition\":\"\",\"formreference\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\",\"skipexpression\":\"\",\"nodetype\":\"\",\"iseditdata\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-798CE0F2-35FD-4512-A41C-D5C6B8713510\"}],\"bounds\":{\"lowerRight\":{\"x\":620,\"y\":218},\"upperLeft\":{\"x\":520,\"y\":138}},\"dockers\":[]},{\"resourceId\":\"sid-11DE1894-54A9-4065-8AE9-C862A149E37A\",\"properties\":{\"overrideid\":\"\",\"name\":\"老板审批\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"type\":\"idm\",\"idm\":{\"type\":\"user\",\"assignee\":{\"id\":\"admin\",\"firstName\":\"admin\",\"lastName\":null,\"email\":\"daffodil@admin.com\",\"fullName\":\"admin \",\"groups\":[],\"privileges\":[\"access-idm\",\"access-modeler\",\"access-task\",\"access-admin\",\"access-rest-api\"],\"$$hashKey\":\"object:10200\"}}}},\"formkeydefinition\":\"\",\"formreference\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\",\"skipexpression\":\"\",\"nodetype\":\"\",\"iseditdata\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-7D10ECA2-5A97-42D1-BAF0-28685612F579\"}],\"bounds\":{\"lowerRight\":{\"x\":620,\"y\":335},\"upperLeft\":{\"x\":520,\"y\":255}},\"dockers\":[]},{\"resourceId\":\"sid-79F6FE83-E514-4037-AEC2-BA82329B78BA\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"sequencefloworder\":\"\"},\"stencil\":{\"id\":\"InclusiveGateway\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-C3BF4E3B-F772-4230-82A6-86CF6BBC9F8F\"}],\"bounds\":{\"lowerRight\":{\"x\":804.5,\"y\":198},\"upperLeft\":{\"x\":764.5,\"y\":158}},\"dockers\":[]},{\"resourceId\":\"sid-B3B6D06F-068E-4E8E-A124-FA433277B3D5\",\"properties\":{\"overrideid\":\"\",\"name\":\"小于500元\",\"documentation\":\"\",\"conditionsequenceflow\":{\"expression\":{\"type\":\"static\",\"staticValue\":\"${money <= 500}\"}},\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-001C5377-49E0-4720-A1D4-C6B6528206A9\"}],\"bounds\":{\"lowerRight\":{\"x\":519.78125,\"y\":157.15625},\"upperLeft\":{\"x\":395,\"y\":70}},\"dockers\":[{\"x\":20.5,\"y\":20.5},{\"x\":395,\"y\":70},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-001C5377-49E0-4720-A1D4-C6B6528206A9\"}},{\"resourceId\":\"sid-F2E8AD2E-6F00-4E55-A6C1-19C2E361AC79\",\"properties\":{\"overrideid\":\"\",\"name\":\"同意\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-79F6FE83-E514-4037-AEC2-BA82329B78BA\"}],\"bounds\":{\"lowerRight\":{\"x\":784.5,\"y\":158.4375},\"upperLeft\":{\"x\":620.435546875,\"y\":70}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":784.5,\"y\":70},{\"x\":20,\"y\":20}],\"target\":{\"resourceId\":\"sid-79F6FE83-E514-4037-AEC2-BA82329B78BA\"}},{\"resourceId\":\"sid-798CE0F2-35FD-4512-A41C-D5C6B8713510\",\"properties\":{\"overrideid\":\"\",\"name\":\"同意\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-79F6FE83-E514-4037-AEC2-BA82329B78BA\"}],\"bounds\":{\"lowerRight\":{\"x\":764.228515625,\"y\":178},\"upperLeft\":{\"x\":620.435546875,\"y\":178}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":20,\"y\":20}],\"target\":{\"resourceId\":\"sid-79F6FE83-E514-4037-AEC2-BA82329B78BA\"}},{\"resourceId\":\"sid-7D10ECA2-5A97-42D1-BAF0-28685612F579\",\"properties\":{\"overrideid\":\"\",\"name\":\"同意\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-79F6FE83-E514-4037-AEC2-BA82329B78BA\"}],\"bounds\":{\"lowerRight\":{\"x\":784.5,\"y\":295},\"upperLeft\":{\"x\":620.435546875,\"y\":198.1953125}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":784.5,\"y\":295},{\"x\":20,\"y\":20}],\"target\":{\"resourceId\":\"sid-79F6FE83-E514-4037-AEC2-BA82329B78BA\"}},{\"resourceId\":\"sid-3BA60A30-A1EA-4559-B16D-0F036D1BF99F\",\"properties\":{\"overrideid\":\"\",\"name\":\"财务审批\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"type\":\"idm\",\"idm\":{\"type\":\"groups\",\"candidateGroups\":[{\"id\":\"40283e816f92646d016f926a76fd0003\",\"name\":\"财务管理员\",\"type\":null,\"$$hashKey\":\"object:11187\"}]}}},\"formkeydefinition\":\"\",\"formreference\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\",\"skipexpression\":\"\",\"nodetype\":\"\",\"iseditdata\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-EBF7FDC4-8C12-44C1-B3FE-C53B644A9C50\"}],\"bounds\":{\"lowerRight\":{\"x\":949.5,\"y\":218},\"upperLeft\":{\"x\":849.5,\"y\":138}},\"dockers\":[]},{\"resourceId\":\"sid-C3BF4E3B-F772-4230-82A6-86CF6BBC9F8F\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-3BA60A30-A1EA-4559-B16D-0F036D1BF99F\"}],\"bounds\":{\"lowerRight\":{\"x\":849.3007907843881,\"y\":178.41360197940782},\"upperLeft\":{\"x\":804.7851467156119,\"y\":178.21921052059218}},\"dockers\":[{\"x\":20.5,\"y\":20.5},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-3BA60A30-A1EA-4559-B16D-0F036D1BF99F\"}},{\"resourceId\":\"sid-F529486F-073B-47A7-9234-0651A8E08C34\",\"properties\":{\"overrideid\":\"\",\"name\":\"结束\",\"documentation\":\"\",\"executionlisteners\":\"\"},\"stencil\":{\"id\":\"EndNoneEvent\"},\"childShapes\":[],\"outgoing\":[],\"bounds\":{\"lowerRight\":{\"x\":1043,\"y\":192},\"upperLeft\":{\"x\":1015,\"y\":164}},\"dockers\":[]},{\"resourceId\":\"sid-EBF7FDC4-8C12-44C1-B3FE-C53B644A9C50\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-F529486F-073B-47A7-9234-0651A8E08C34\"}],\"bounds\":{\"lowerRight\":{\"x\":1014.84765625,\"y\":178},\"upperLeft\":{\"x\":950.07421875,\"y\":178}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":14,\"y\":14}],\"target\":{\"resourceId\":\"sid-F529486F-073B-47A7-9234-0651A8E08C34\"}},{\"resourceId\":\"sid-E0AEA166-AFAA-4FC4-ABF9-DAACB61E90B4\",\"properties\":{\"overrideid\":\"\",\"name\":\"小于1000元\",\"documentation\":\"\",\"conditionsequenceflow\":{\"expression\":{\"type\":\"static\",\"staticValue\":\"${money <= 1000}\"}},\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-AB0D67C6-8425-46DE-AB03-A8B21B5CD223\"}],\"bounds\":{\"lowerRight\":{\"x\":519.7812540816077,\"y\":178.4424553688046},\"upperLeft\":{\"x\":415.14062091839236,\"y\":178.1434821311954}},\"dockers\":[{\"x\":20.5,\"y\":20.5},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-AB0D67C6-8425-46DE-AB03-A8B21B5CD223\"}},{\"resourceId\":\"sid-62CEC576-8A1D-4FA2-96BF-63FF4A295A17\",\"properties\":{\"overrideid\":\"\",\"name\":\"大于1000元\",\"documentation\":\"\",\"conditionsequenceflow\":{\"expression\":{\"type\":\"static\",\"staticValue\":\"${money > 1000}\"}},\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-11DE1894-54A9-4065-8AE9-C862A149E37A\"}],\"bounds\":{\"lowerRight\":{\"x\":519.78125,\"y\":295},\"upperLeft\":{\"x\":395,\"y\":198.61328125}},\"dockers\":[{\"x\":20.5,\"y\":20.5},{\"x\":395,\"y\":295},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-11DE1894-54A9-4065-8AE9-C862A149E37A\"}}],\"stencil\":{\"id\":\"BPMNDiagram\"},\"stencilset\":{\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\",\"url\":\"../editor/stencilsets/bpmn2.0/bpmn2.0.json\"}}',_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0$\0\0\0g\0\0\0�B?�\0\0\\IDATx^�{l��]�R�\n�jӇ��ԨQ�h�*M����&E��Hj���2���P*�M��&��h*J%��B	�@U\nQ��L�[0郂��\Zw�!XϢc7��|�;���־��{?��IG��vwf|�̙;�;wkj!�B!�B!�B��쁁�]���c���A&�)�0�񾾾�{����^>!�\\a�a###���h�%���۷���;�:BH�IXHpy�3/(�����i�_�:BH9M{FQ�,�tI�!��k<a`H?�sE��S�<���\'��wu/��D�&{H��rMH�o` B���D�!����s�i�.] �,��\'U#��:XS\rC����7T#��:X��UWWW�넘��d>�N�R��t��0��R������N�IH��%��>�넘��d>���N�?�넘��d>����t��0�lR\"�x=�;t���H2�uTC�ja9\'3�h�O@�t���H2�~8�m���r;3Ƈ�M�R�BM�N�I|$�%|_ƻ�����e������A����]�	1�o�$HHH�\Z�k<H�+�7FB\"��zH��uBL�c ������uBL�@�\rzH��CZ�넘��d9]��6]\'�$$��m���넘��d��>�넘��d���\r�uBL�@�\rzHߖ�Gt�&���������򽕒%�Dȷ��z��ķ@��.��۠>]w�m�	0a7\Z)�[\"�vp~��-�G_��-���2�<�������9\"H#E�;�\"�%\"���S�R腴U�~��8]��u�x�tO%�+a�,\'���R腴U�~���!}\n�t݅8�^!��Hb��=W4^�%���P-|��Q%��ɋ�nݺY��E��ʲc�y?�\ni��P���GF��5�*�G^�0����.�J��\'\\��~��ʕ�\'F|\Z�5�*%O�p!�t<|��?ɶ��.E��ޑ���_S*14\"ܘ; ���f���#�^���{`��n̄�Go�#ȉf�~h�	�\Zg�-[�pGGǅC�]�t�Rp��ѡ��6�a����<����,S��Ah;4\'|Q���.D���Gg�>Ј��\'h<�N��y��Ӣ�������ϟ?LD�nmm���ߢ��u#��ޘCdC�\rZ6l���F��p!R�,�=:)?ChÆ\r���ۃ�7�/��LI?�~��c{��F!R_�b���=�X6b\Z\\kc�����)����J/\\��?�m_<M������?)+Ξ=��b(e,X���)�jժ�\'NL�y��q*��~�t�\n>}ͪS�����Y�f��)\\s���l�s�Q#~�t/\\��?����%	����Q��,k�ʕ��P��~��hii��FWC�MMMc���j��!j͟??����\r�u�/���+�8x�J�g��mۦ��2[�n���Л��n�)�D�088��G�mmm��=�T��buM�:��.~N� rb���g��2�%l֮]{Ng� �Z�|����r�!uvv>�e˖q=sa���盛�7���b�G��h\"%o��\"f^��V�^]C���kH��0r��TWWW�^��===c�#�@��6m:�ӹ���=�X5�9��QV��BY6�r3/\\��?�m?�S������S6��S��.�S6AB����W��\\3jmm}����r��`�G�:�|\Z^\0-yc.1�H������R��s����ź��G��IeY6�rS/\\��_ɷ�3��\'|S�\'�SA2�pd�Et�����Wp;<|���Ķ��8�@�ǋ�R~�H�psmɰ�=A���j�N-,�dƣ��|�8{�BKK���i]w�m�	2�x8lj���r;3\r��[ ��\Z?_�u��� �� ���8�Q!0ߡl6�&f<\Z�ܷ@��.$����˺���#�q$��Q9��@2_��W&�H��Q��b�����úI�m�����Hd�R�/���N�IH�A }��:!&a ��lw��\'u��0�l�@�G/i��b�md�\rh��b�m�_ԣ넘��d���\0>�넘��d��r�,!U��d������b�m�t\rZ�넘ķ@\n�`�����������^}�AY$w�ˍ�r�^�5�;��\\��uBL�[ !�v#,����S�y�4K��8*�I3�禍��J-�N�I|$��C`DH�����!0��n�r��b�IN�¡/$���\"H�%YN�� a�od��G�e|$��#a����%���:X���\r��N�I|\r�JiR?Nپ�넘��d>�� m�N�IH��t:�]\'�$$�����넘��d>�����@�	1	�| ��@z��b	$h4�J]��tz:�H$���A��g���<�~W�ma�{�nh\rj���u��RL�x�j�o544|�[���M�݀駱C}���V ��������}K�,y?��u����:^����oƺ~����:�!�ꋠ�M��b�=h�݇�Ŷ��?�t�������H��Y��b�g�b����zz�s�^�ƒ�J�?�M�7`盽p�¹���QB�7a��UB�&߉��x]\n���·��Zu�iӄ�n;��\'�?��<��;۱d!�$O���j�=�,��ow���:I��,��!��O\Zx�3���$a�3Y����\r�R��)j]�B(�(Q���n�.Ŵ	j�s���]��vЗ%������r�\Z����f]]]��h\rÈ��F �u ��<$B�70�!��@\"�x��\r$B�70�!� �]��E-,�d��\0m������!l�V.�ۙ1>�-!$B�@d�}�:���;��fw �3��\'�D����\\�Q���d�2�!�B!�B!�B!�B!�B����RK}�c\0\0\0\0IEND�B`�',0,NULL),('04e927e5-c3e4-11ea-9902-96e6f7651f71','接待报销流程','Reception','接待报销流程，并行审批测试',NULL,'2020-07-12 10:04:29.016000','admin','2020-07-14 16:29:41.645000','admin',1,'{\"modelId\":\"04e927e5-c3e4-11ea-9902-96e6f7651f71\",\"bounds\":{\"lowerRight\":{\"x\":1200,\"y\":1050},\"upperLeft\":{\"x\":0,\"y\":0}},\"properties\":{\"process_id\":\"Reception\",\"name\":\"接待报销流程\",\"documentation\":\"接待报销流程，并行审批测试\",\"process_author\":\"\",\"process_version\":\"\",\"process_namespace\":\"http://www.flowable.org/processdef\",\"process_historylevel\":\"\",\"isexecutable\":true,\"dataproperties\":\"\",\"executionlisteners\":\"\",\"eventlisteners\":\"\",\"signaldefinitions\":\"\",\"messagedefinitions\":\"\",\"process_potentialstarteruser\":\"\",\"process_potentialstartergroup\":\"\",\"iseagerexecutionfetch\":\"false\"},\"childShapes\":[{\"resourceId\":\"startEvent1\",\"properties\":{\"overrideid\":\"\",\"name\":\"开始\",\"documentation\":\"\",\"executionlisteners\":\"\",\"initiator\":\"\",\"formkeydefinition\":\"\",\"formreference\":\"\",\"formproperties\":\"\"},\"stencil\":{\"id\":\"StartNoneEvent\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-A59577B3-FD13-4CD8-BC57-4727053716B4\"}],\"bounds\":{\"lowerRight\":{\"x\":105,\"y\":253},\"upperLeft\":{\"x\":75,\"y\":223}},\"dockers\":[]},{\"resourceId\":\"sid-2A06C0F5-F8F4-4F93-80CF-CB43E1EAA0CB\",\"properties\":{\"overrideid\":\"\",\"name\":\"报销申请\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"type\":\"idm\",\"idm\":{\"type\":\"initiator\"}}},\"formkeydefinition\":\"\",\"formreference\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\",\"skipexpression\":\"\",\"nodetype\":\"\",\"iseditdata\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-F80224CD-88FB-4655-BE0E-3A433838B160\"}],\"bounds\":{\"lowerRight\":{\"x\":250,\"y\":278},\"upperLeft\":{\"x\":150,\"y\":198}},\"dockers\":[]},{\"resourceId\":\"sid-A59577B3-FD13-4CD8-BC57-4727053716B4\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-2A06C0F5-F8F4-4F93-80CF-CB43E1EAA0CB\"}],\"bounds\":{\"lowerRight\":{\"x\":149.15625,\"y\":238},\"upperLeft\":{\"x\":105.609375,\"y\":238}},\"dockers\":[{\"x\":15,\"y\":15},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-2A06C0F5-F8F4-4F93-80CF-CB43E1EAA0CB\"}},{\"resourceId\":\"sid-46931CE5-5528-4C03-895A-D2D7884B5CC3\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"sequencefloworder\":\"\"},\"stencil\":{\"id\":\"ParallelGateway\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-BDAC066E-0A2F-440E-963E-78D4C3AC01B6\"},{\"resourceId\":\"sid-70FF1EDC-0EFC-454A-B57B-F663D1893858\"}],\"bounds\":{\"lowerRight\":{\"x\":385,\"y\":258},\"upperLeft\":{\"x\":345,\"y\":218}},\"dockers\":[]},{\"resourceId\":\"sid-8B4DDDD7-CAD2-4337-A368-0C8E43B84734\",\"properties\":{\"overrideid\":\"\",\"name\":\"部门经理审批\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"type\":\"idm\",\"idm\":{\"type\":\"groups\",\"candidateGroups\":[{\"id\":\"40283e816f92646d016f92705173001a\",\"name\":\"部门管理员\",\"type\":null,\"$$hashKey\":\"object:9792\"}]}}},\"formkeydefinition\":\"\",\"formreference\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\",\"skipexpression\":\"\",\"nodetype\":\"\",\"iseditdata\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-70141BF7-F0A5-4A56-9696-28986F5E3B05\"}],\"bounds\":{\"lowerRight\":{\"x\":565,\"y\":170},\"upperLeft\":{\"x\":465,\"y\":90}},\"dockers\":[]},{\"resourceId\":\"sid-BDAC066E-0A2F-440E-963E-78D4C3AC01B6\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-8B4DDDD7-CAD2-4337-A368-0C8E43B84734\"}],\"bounds\":{\"lowerRight\":{\"x\":464.9453125,\"y\":217.15625},\"upperLeft\":{\"x\":365.5,\"y\":130}},\"dockers\":[{\"x\":20.5,\"y\":20.5},{\"x\":365.5,\"y\":130},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-8B4DDDD7-CAD2-4337-A368-0C8E43B84734\"}},{\"resourceId\":\"sid-B23A76A1-E56E-4D7C-B584-BE36129EE520\",\"properties\":{\"overrideid\":\"\",\"name\":\"老板审批\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"type\":\"idm\",\"idm\":{\"type\":\"groups\",\"candidateGroups\":[{\"id\":\"402855816f1e2a2e016f1e2a45510000\",\"name\":\"超级管理员\",\"type\":null,\"$$hashKey\":\"object:10344\"}]}}},\"formkeydefinition\":\"\",\"formreference\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\",\"skipexpression\":\"\",\"nodetype\":\"\",\"iseditdata\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-56B17419-CB46-492E-AE9F-156294F0AC11\"}],\"bounds\":{\"lowerRight\":{\"x\":565,\"y\":380},\"upperLeft\":{\"x\":465,\"y\":300}},\"dockers\":[]},{\"resourceId\":\"sid-70FF1EDC-0EFC-454A-B57B-F663D1893858\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-B23A76A1-E56E-4D7C-B584-BE36129EE520\"}],\"bounds\":{\"lowerRight\":{\"x\":464.9453125,\"y\":340},\"upperLeft\":{\"x\":365.5,\"y\":258.53125}},\"dockers\":[{\"x\":20.5,\"y\":20.5},{\"x\":365.5,\"y\":340},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-B23A76A1-E56E-4D7C-B584-BE36129EE520\"}},{\"resourceId\":\"sid-010C73B2-613A-4911-B1F2-F54696F2802E\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"sequencefloworder\":\"\"},\"stencil\":{\"id\":\"ParallelGateway\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-86EB88FC-8B00-45A0-9E3E-3D0D3C0DD5CE\"}],\"bounds\":{\"lowerRight\":{\"x\":670,\"y\":262},\"upperLeft\":{\"x\":630,\"y\":222}},\"dockers\":[]},{\"resourceId\":\"sid-FB552126-E694-4716-9894-E532640BD780\",\"properties\":{\"overrideid\":\"\",\"name\":\"财务审批\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"type\":\"idm\",\"idm\":{\"type\":\"groups\",\"candidateGroups\":[{\"id\":\"40283e816f92646d016f926a76fd0003\",\"name\":\"财务管理员\",\"type\":null,\"$$hashKey\":\"object:10530\"}]}}},\"formkeydefinition\":\"\",\"formreference\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\",\"skipexpression\":\"\",\"nodetype\":\"\",\"iseditdata\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-133B727D-C6B1-461B-BA51-657480CCE474\"},{\"resourceId\":\"sid-240A8C29-E6F6-4E5F-9CF5-EEA6814BDD28\"}],\"bounds\":{\"lowerRight\":{\"x\":835,\"y\":282},\"upperLeft\":{\"x\":735,\"y\":202}},\"dockers\":[]},{\"resourceId\":\"sid-86EB88FC-8B00-45A0-9E3E-3D0D3C0DD5CE\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-FB552126-E694-4716-9894-E532640BD780\"}],\"bounds\":{\"lowerRight\":{\"x\":734.6132881597279,\"y\":242.42597005356777},\"upperLeft\":{\"x\":670.4140555902721,\"y\":242.18731119643223}},\"dockers\":[{\"x\":20.5,\"y\":20.5},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-FB552126-E694-4716-9894-E532640BD780\"}},{\"resourceId\":\"sid-1DE867CC-C195-48D0-9B6B-FD69C768CA89\",\"properties\":{\"overrideid\":\"\",\"name\":\"结束\",\"documentation\":\"\",\"executionlisteners\":\"\"},\"stencil\":{\"id\":\"EndNoneEvent\"},\"childShapes\":[],\"outgoing\":[],\"bounds\":{\"lowerRight\":{\"x\":928,\"y\":256},\"upperLeft\":{\"x\":900,\"y\":228}},\"dockers\":[]},{\"resourceId\":\"sid-F80224CD-88FB-4655-BE0E-3A433838B160\",\"properties\":{\"overrideid\":\"\",\"name\":\"提交\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\",\"showdiamondmarker\":false},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-46931CE5-5528-4C03-895A-D2D7884B5CC3\"}],\"bounds\":{\"lowerRight\":{\"x\":344.4589889386365,\"y\":238.43643199075117},\"upperLeft\":{\"x\":250.13280793636352,\"y\":238.15145863424883}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":20.5,\"y\":20.5}],\"target\":{\"resourceId\":\"sid-46931CE5-5528-4C03-895A-D2D7884B5CC3\"}},{\"resourceId\":\"sid-56B17419-CB46-492E-AE9F-156294F0AC11\",\"properties\":{\"overrideid\":\"\",\"name\":\"同意\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-010C73B2-613A-4911-B1F2-F54696F2802E\"}],\"bounds\":{\"lowerRight\":{\"x\":650,\"y\":340},\"upperLeft\":{\"x\":565.5703125,\"y\":262.140625}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":650,\"y\":340},{\"x\":20,\"y\":20}],\"target\":{\"resourceId\":\"sid-010C73B2-613A-4911-B1F2-F54696F2802E\"}},{\"resourceId\":\"sid-70141BF7-F0A5-4A56-9696-28986F5E3B05\",\"properties\":{\"overrideid\":\"\",\"name\":\"同意\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-010C73B2-613A-4911-B1F2-F54696F2802E\"}],\"bounds\":{\"lowerRight\":{\"x\":650,\"y\":221.75},\"upperLeft\":{\"x\":565.5703125,\"y\":130}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":650,\"y\":130},{\"x\":20,\"y\":20}],\"target\":{\"resourceId\":\"sid-010C73B2-613A-4911-B1F2-F54696F2802E\"}},{\"resourceId\":\"sid-133B727D-C6B1-461B-BA51-657480CCE474\",\"properties\":{\"overrideid\":\"\",\"name\":\"同意\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-1DE867CC-C195-48D0-9B6B-FD69C768CA89\"}],\"bounds\":{\"lowerRight\":{\"x\":899.8984375,\"y\":242},\"upperLeft\":{\"x\":835.3828125,\"y\":242}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":14,\"y\":14}],\"target\":{\"resourceId\":\"sid-1DE867CC-C195-48D0-9B6B-FD69C768CA89\"}},{\"resourceId\":\"sid-240A8C29-E6F6-4E5F-9CF5-EEA6814BDD28\",\"properties\":{\"overrideid\":\"\",\"name\":\"退回\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-2A06C0F5-F8F4-4F93-80CF-CB43E1EAA0CB\"}],\"bounds\":{\"lowerRight\":{\"x\":785,\"y\":405},\"upperLeft\":{\"x\":200,\"y\":278.140625}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":785,\"y\":405},{\"x\":200,\"y\":405},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-2A06C0F5-F8F4-4F93-80CF-CB43E1EAA0CB\"}}],\"stencil\":{\"id\":\"BPMNDiagram\"},\"stencilset\":{\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\",\"url\":\"../editor/stencilsets/bpmn2.0/bpmn2.0.json\"}}',_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0#\0\0\0t\0\0\0��T�\0\0\rIDATx^�}�Tg�Y�����Ƙ6&�?��5�h�D�?����fvfvW ز j�J.lBA�Hm�(M(�A>�\0k��d�²\rH*u�����6��Җ����s�ΐ��tgv���{�<����=sg�;��s�{ǌ!�B!�B!�Bq��ƶ���lmm�kll�R�T����߿�����a�BH�!�a�Nw��}�ֻr�N���W�zgϞ����/C��m\"�� �G$�Ж���H�Z<�������C�M��D�dO�D�z_�d�E#(��B�zu�!%���a8޲�#�j��d��M��D�@DH����bD����2�!ćbDq�!�	(F�\'�B��bD�F2�|=�H,��b�)F���g�\\#ݦ�M�2fP���$.��nS�؎7!�b�8(F���A1\"���.�!��vqP�!>���bD�]#B����B|l�<�C��\"a°���agmǛg�]�� �_�	���ܞ2< ��x�,��C�]&��\'u��C�zz:::�A��R�Ud;ބ8��!� {(����1`�Y�Q!\\�7!N��0�MHXfa�	���,�7!9`q���&$,�0ބ��aƛ��8��x��YoBr��0�M�x�7���}gkkk_cc��\"7��@��+��A��Xfa���.�\'7e^��w�Z�����w��h��k%�{�Rn=��YLƛ`G��d�oK��b$S- A���2|wx��,b6��\0;�l�w��hY�\'F�:�A��7exܜ|1Y�l��vم��x�:?12�A�d��M.`�8��xs�(Y1��hӁ���LG��X���77��2416���L��5Y�δiӞ4on��bt����̓`�XVVva������|q����=�dɒ��%�Io�̙隚�&���^���d�(+@z��>7�ܸq��?�}>�}\Z�\n�r�ʼ^fD���Ο?���ŋ�8��=800��9s�۽{���3�-F����<�%<���xtl�|`D��O�4���x���=�!����?S���[���p���߻{����R��\\�D510\\�>)�\\1��U����Ν���^9rZ�b��u�V*�Q�+����͜9s�����\Zt�S�5kֈ�*�bb\n �Ο�rdx���p�M�<�f�Nuuu[[�M\Z!����j�ټ��������ˇ����a���J��O�p|3���9q�����9��Hn�o���Wh�]nDD��g�ɡـ�,��e��C���w��I��78wôkC�2��d���<O�Z%����К�g7�.�yݶ���M��\\__���0�e˖����?�ߓ8�kٲe���:t�[�ti��\\�D)1#d8��}�?�����F�Xs���6��m޼Y��Mlڴ�W������<ٰa��ٳg�9rD�\'\'����V�Z�D._\\H�n�rI.?9��t���&j}{GU\"2�����?�B��-�,����;��V-�$�w��)�ڵk�<t������b�2��|�Zb�@��\'�G����*Q��X�v�̥�ޑ�c(2/���%Y^GAlܸ�+W�RSS�|iuu�;��r�^����\"�C�|E�EQ�h����>����@�s��o�ڵގ;���g��,�?�QLL�+\nbG������˿�9�=��쨼�?�QML��}s����x<~/�o�D�2��q��\'f�P��2j�����01��bd���d���E\nώzgڰ��ޙ,�R\'1xw��xS�E�X�شuvvnO9:���(u�Gz��Q��)��(�T�������mHJW��\'%�,b6��\0;����]H&��9)D��� f��\rpDI&�_EG����c�8��x� d6��\0G��\Zt���vLG��xGqj���?�����b	S��,�7���2ӧO�s^��N��#\n�)�S�N������2UUUw�#�x<%W	SqD�0�;��Ѓ��{K��N��#\n�)�h띰��O,���Fb�iر]��moo�����\'φ�ſ3�nr1�\\�#}����xB,�<�ۮ��2���_� ���a�vq@�vA�����_�\\��2���x���d�M�\'�����:ҿ�?��.�#a�r��x�j���b��᫄mǻ2���~b$fsP�Î��C3�SiK��b$S-\ZA��7e��)��.��>�a�\'�AR&�^���c�8��É����T�F�&��m\n��.������X&�?������c�8�bt�e�/F2Ղ�Q�r1�����XI�!��vl�����6-\ZA�(7��?@{_�~by�\0��/�vlGv�ȖQ�r���0ڻG��e FI$f�����A1r�Q�~��ˠ̈́m���c�8(F�\"OdE{��~b$e.��;���b�.h�,س�O,���ϰۺV�Î�����<���O,1Z���N�Î��񡲯)F���s�����XIyi����2)X/���C�G��߰W`��/a��������jX=���/���L�\'0���_Ó0EE��0�����ݘ_��#bT��>&CfTVV~Vn��݋�N�M��2\'sg�o��GaK�z%�L<���.�?a����`��ކ]����2��o�~[��ˠ�Ök�2e�GQ����}�9�AR���[�M������y�R��j�jb~����������͘�3����/�^��b�UL߀�Kg\n�׶�۷O��z�=���q,1($���<~�Ό��o|\n����/�5]����C��\"p��\'E�ƄD���:�\n�\'�ARV��=���8l�Qv�H���}~���O,!Z#���O��1\"�\0}�����O,�-�:$f�������i9�~b��3���O��b�.��c�h?���EN�j?)�����?����2H�6�QR�IqP����O8L��~b��_��k?)�����r����@��Gb�~R�S�k�z�S���\r��{`S��XI�1z@�Iq�#�d@~-&���s{����a��%��U��e F��m����8��e�� yR��=$�����c��+e�QEa��I���~b��A$g����A�=XZ��0Y���B��Ϸ�����2H��~]�	�*��a�i?�����=�OHTAM�����2�cH���OHTI&�o��O,1��5�������.�\'�AR������~B���y؝�O,��\\�������>^F��~b$�\n����OHTa�w$&�Č�~B�\n���$���J�tB!�B!�B!�B!�B!��l���&�8\0\0\0\0IEND�B`�',0,NULL),('d6f1739e-c31c-11ea-9982-96e6f7651f71','请假流程','AskForLeave','请假流程','','2020-07-11 10:18:42.050000','admin','2020-07-12 10:23:34.331000','admin',2,'{\"modelId\":\"d6f1739e-c31c-11ea-9982-96e6f7651f71\",\"bounds\":{\"lowerRight\":{\"x\":1200,\"y\":1050},\"upperLeft\":{\"x\":0,\"y\":0}},\"properties\":{\"process_id\":\"AskForLeave\",\"name\":\"请假流程\",\"documentation\":\"请假流程\",\"process_author\":\"\",\"process_version\":\"\",\"process_namespace\":\"http://www.flowable.org/processdef\",\"process_historylevel\":\"\",\"isexecutable\":true,\"dataproperties\":\"\",\"executionlisteners\":\"\",\"eventlisteners\":\"\",\"signaldefinitions\":\"\",\"messagedefinitions\":\"\",\"process_potentialstarteruser\":\"\",\"process_potentialstartergroup\":\"\",\"iseagerexecutionfetch\":\"false\"},\"childShapes\":[{\"resourceId\":\"startEvent1\",\"properties\":{\"overrideid\":\"\",\"name\":\"开始\",\"documentation\":\"\",\"executionlisteners\":\"\",\"initiator\":\"\",\"formkeydefinition\":\"\",\"formreference\":\"\",\"formproperties\":\"\"},\"stencil\":{\"id\":\"StartNoneEvent\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-D2D6A238-1998-40B2-8329-11C421644087\"}],\"bounds\":{\"lowerRight\":{\"x\":130,\"y\":193},\"upperLeft\":{\"x\":100,\"y\":163}},\"dockers\":[]},{\"resourceId\":\"sid-FA5DEC96-DF3B-476A-9911-6603A764994E\",\"properties\":{\"overrideid\":\"\",\"name\":\"请假申请\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"type\":\"idm\",\"idm\":{\"type\":\"initiator\"}}},\"formkeydefinition\":\"\",\"formreference\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\",\"skipexpression\":\"\",\"nodetype\":\"\",\"iseditdata\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-BE0C6AA2-056B-47EC-91C7-E2234AD454EB\"}],\"bounds\":{\"lowerRight\":{\"x\":295,\"y\":218},\"upperLeft\":{\"x\":195,\"y\":138}},\"dockers\":[]},{\"resourceId\":\"sid-D2D6A238-1998-40B2-8329-11C421644087\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-FA5DEC96-DF3B-476A-9911-6603A764994E\"}],\"bounds\":{\"lowerRight\":{\"x\":194.234375,\"y\":178},\"upperLeft\":{\"x\":130.21875,\"y\":178}},\"dockers\":[{\"x\":15,\"y\":15},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-FA5DEC96-DF3B-476A-9911-6603A764994E\"}},{\"resourceId\":\"sid-6D79B4F5-4CDB-4860-9694-C76721F2914F\",\"properties\":{\"overrideid\":\"\",\"name\":\"部门经理审批\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"type\":\"idm\",\"idm\":{\"type\":\"groups\",\"candidateGroups\":[{\"id\":\"40283e816f92646d016f92705173001a\",\"name\":\"部门管理员\",\"type\":null,\"$$hashKey\":\"object:582\"}]}}},\"formkeydefinition\":\"\",\"formreference\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\",\"skipexpression\":\"\",\"nodetype\":\"\",\"iseditdata\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-96831967-22AF-4844-A34E-1019295CC71B\"},{\"resourceId\":\"sid-7FF42D21-2DCA-40F9-A489-C95A249883D0\"}],\"bounds\":{\"lowerRight\":{\"x\":475,\"y\":218},\"upperLeft\":{\"x\":375,\"y\":138}},\"dockers\":[]},{\"resourceId\":\"sid-BE0C6AA2-056B-47EC-91C7-E2234AD454EB\",\"properties\":{\"overrideid\":\"\",\"name\":\"提交\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-6D79B4F5-4CDB-4860-9694-C76721F2914F\"}],\"bounds\":{\"lowerRight\":{\"x\":374.78125,\"y\":178},\"upperLeft\":{\"x\":295.21875,\"y\":178}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-6D79B4F5-4CDB-4860-9694-C76721F2914F\"}},{\"resourceId\":\"sid-FC44C064-B4A8-4F8F-AE0F-BB4D7D42FDEC\",\"properties\":{\"overrideid\":\"\",\"name\":\"结束\",\"documentation\":\"\",\"executionlisteners\":\"\"},\"stencil\":{\"id\":\"EndNoneEvent\"},\"childShapes\":[],\"outgoing\":[],\"bounds\":{\"lowerRight\":{\"x\":583,\"y\":192},\"upperLeft\":{\"x\":555,\"y\":164}},\"dockers\":[]},{\"resourceId\":\"sid-96831967-22AF-4844-A34E-1019295CC71B\",\"properties\":{\"overrideid\":\"\",\"name\":\"同意\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-FC44C064-B4A8-4F8F-AE0F-BB4D7D42FDEC\"}],\"bounds\":{\"lowerRight\":{\"x\":554.5,\"y\":178},\"upperLeft\":{\"x\":475.5,\"y\":178}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":14,\"y\":14}],\"target\":{\"resourceId\":\"sid-FC44C064-B4A8-4F8F-AE0F-BB4D7D42FDEC\"}},{\"resourceId\":\"sid-7FF42D21-2DCA-40F9-A489-C95A249883D0\",\"properties\":{\"overrideid\":\"\",\"name\":\"退回\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-FA5DEC96-DF3B-476A-9911-6603A764994E\"}],\"bounds\":{\"lowerRight\":{\"x\":425,\"y\":137.46875},\"upperLeft\":{\"x\":245,\"y\":86}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":425,\"y\":86},{\"x\":245,\"y\":86},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-FA5DEC96-DF3B-476A-9911-6603A764994E\"}}],\"stencil\":{\"id\":\"BPMNDiagram\"},\"stencilset\":{\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\",\"url\":\"../editor/stencilsets/bpmn2.0/bpmn2.0.json\"}}',_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0S\0\0\0cș\0\0�IDATx^��[he�z+�R�߼������U+-��%��ɦi�P�J0�XJ)0i4RRm�\"&�\r�\r�ui�CRj�\n��b�k�6��l�I�s⎌g���3ߧ��M��9{���df�i\0\0\0\0\0\0\0\0\0H�\0c�A���$���%��;�@�q9`$4]��Ij[�8��� tQ�S�H�9`$4]��+�p�y9`$4]�������8��� tQ��� ^��\0FB��E���B���8��� tQ��(��q\0#�A�|��C��0\Z�.:��Q%������C\'�A�	\rB��E�0\Z�.��\'��0\Z�.n�P�]�	\rB5�f>̐�\0FB���\'()>��\0FB��E����N9`$4]|�5��r�Hh��A�K9�N�	\rBߨE9��q\0#�A��\Z��G9`*���qA>��C���\0F�\"��4�z�8�5�(߿�q\0��\'hww�/��������8�q�P�pBWUU�S��	9`�p8�2\Z�.��9��;r`M��<::z<�L���300P��!�6\"h���������n&����S�:�[�*+&l�7�����N&�q�����y�����}ppp�\n���`��w6�-+6l�7����w����H�r�����@L�t:=A{^��id�9l̹-��\"�n����-T��OZP��lV��id�9l̹-��\"�q����륁���09x]���F��֜ېo(�,Xo��z���(L\nV��֜ېo(�,��.|�O�ʂ0=l(X�o[snC��Hނ�d�w�+g?+(\n�Æ��\r��ېo(�[�\\��B��-g�m(Xo��=�6����,P�8L\n�� d�e��3-l�7I���6,�\rVA��B���������`0�}8N�?a��[\ZO��	P���o����=\n�ޠ��m�c�}�&o��g7LYY�[�������w�̙3��q�F����R,����p���	����֭[�m�j��o��\nzl�����xZ�nQho!ZSS3;22����aqq����NE\"���o�����/(X]ȷ?h�`m���f����tuu9\'O�t�9��ݻ��(n�\r�s��9Ps��N�eO������h4����/(X]ȷ�����h��׮]K�F.7�e�T�9x��()br�5�cj�/^�(���&����,u�g�|~@��B���+���ƥ�7o�M�@��$��v���o�h�����o�\'Xɱcǜ���/�|~@��B�uћ�#��9���a�)��ѣG�&��s�Z,;�L&��+�|���gϞq9�P���o]eee����Դ$��������ϟ�xQλ*�h���䤜{E333|����Z���QQ��tiliɜ#ߥ��9m�;y#���>�g~/\"*�cU\"��B.���haa�	��Kr�R˯,�,[u�ɢ`KK��.=o�)���|X�V����y>�ϱ*555S�݃�����Y��V�r�L�۟X�ĝ��G嶿*\r\r\r��{������Z��dΑ�����=��=��_4\Z����Deee����r���Nkk�7r>?�`u!ߺ|�+_Q[[;��� ��\"WQQ��(X]ȷ>�:�ݻw;��A�H$�m���^I���9O�&F�=0�.�[��J���FG�JJ-�Nړ�{Оߋ���3S]]}�b�&l(X��k�cj���p��ɸ���)>q鹛��]��ޤ��4��,]�P�ȷܻ9)2n3�\r�u7���<j	�兠\'�� T�E�����A�\n����`u!�`�.����Յ|�UP���o�\n\nV�\rVA��B��*(X]�7X������%��T�����8lV��i�o�����x&�)(\0�bll�k*��r�L�|�U�Ď����t:=a�;-s��ի�T��(���3\r�\r����\r(���Ҳ�e�e��XyY�ˌ|\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��3�9��a�\0\0\0\0IEND�B`�',0,NULL),('e84f4db3-c0e0-11ea-b3db-96e6f7651f71','员工级别-报销流程','Expense2','员工级别-报销流程',NULL,'2020-07-08 14:04:38.861000','admin','2020-07-11 10:17:27.486000','admin',1,'{\"modelId\":\"e84f4db3-c0e0-11ea-b3db-96e6f7651f71\",\"bounds\":{\"lowerRight\":{\"x\":1200,\"y\":1050},\"upperLeft\":{\"x\":0,\"y\":0}},\"properties\":{\"process_id\":\"Expense2\",\"name\":\"员工级别-报销流程\",\"documentation\":\"员工级别-报销流程\",\"process_author\":\"\",\"process_version\":\"\",\"process_namespace\":\"http://www.flowable.org/processdef\",\"process_historylevel\":\"\",\"isexecutable\":true,\"dataproperties\":\"\",\"executionlisteners\":\"{\\\"executionListeners\\\":[]}\",\"eventlisteners\":\"{\\\"eventListeners\\\":[]}\",\"signaldefinitions\":\"[]\",\"messagedefinitions\":\"[]\",\"process_potentialstarteruser\":\"\",\"process_potentialstartergroup\":\"\",\"iseagerexecutionfetch\":\"false\",\"messages\":[]},\"childShapes\":[{\"resourceId\":\"startEvent1\",\"properties\":{\"overrideid\":\"startEvent1\",\"name\":\"开始\",\"documentation\":\"\",\"executionlisteners\":{\"executionListeners\":[]},\"initiator\":\"\",\"formkeydefinition\":\"\",\"formreference\":\"\",\"formproperties\":\"\",\"interrupting\":true},\"stencil\":{\"id\":\"StartNoneEvent\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-4A04755F-E8EB-4ADA-959C-69CDD2B166C2\"}],\"bounds\":{\"lowerRight\":{\"x\":70,\"y\":133},\"upperLeft\":{\"x\":40,\"y\":103}},\"dockers\":[]},{\"resourceId\":\"sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8\",\"properties\":{\"overrideid\":\"sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8\",\"name\":\"报销申请\",\"documentation\":\"\",\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"executionlisteners\":{\"executionListeners\":[]},\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"type\":\"static\",\"assignee\":\"$INITIATOR\"}},\"formkeydefinition\":\"\",\"formreference\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":{\"taskListeners\":[]},\"skipexpression\":\"\",\"nodetype\":\"\",\"iseditdata\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-39209A63-834F-4027-9105-032D12A10F23\"}],\"bounds\":{\"lowerRight\":{\"x\":235,\"y\":158},\"upperLeft\":{\"x\":135,\"y\":78}},\"dockers\":[]},{\"resourceId\":\"sid-4A04755F-E8EB-4ADA-959C-69CDD2B166C2\",\"properties\":{\"overrideid\":\"sid-4A04755F-E8EB-4ADA-959C-69CDD2B166C2\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8\"}],\"bounds\":{\"lowerRight\":{\"x\":134.234375,\"y\":118},\"upperLeft\":{\"x\":70.21875,\"y\":118}},\"dockers\":[{\"x\":15,\"y\":15},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8\"}},{\"resourceId\":\"sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A\",\"properties\":{\"overrideid\":\"sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A\",\"name\":\"部门经理审批\",\"documentation\":\"\",\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"executionlisteners\":{\"executionListeners\":[]},\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"type\":\"idm\",\"idm\":{\"candidateGroups\":[{\"id\":\"40283e816f92646d016f92705173001a\",\"name\":\"部门管理员\"}],\"type\":\"groups\"},\"initiatorCanCompleteTask\":false}},\"formkeydefinition\":\"\",\"formreference\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":{\"taskListeners\":[]},\"skipexpression\":\"\",\"nodetype\":\"\",\"iseditdata\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-9A6178EA-6108-4D9B-8310-3C5F078B7B03\"},{\"resourceId\":\"sid-9F5A558A-4B27-4FB6-9225-7BEFD35F952F\"}],\"bounds\":{\"lowerRight\":{\"x\":440,\"y\":158},\"upperLeft\":{\"x\":340,\"y\":78}},\"dockers\":[]},{\"resourceId\":\"sid-7C468FA0-CF11-4C38-80C7-1CBAC3CAED79\",\"properties\":{\"overrideid\":\"sid-7C468FA0-CF11-4C38-80C7-1CBAC3CAED79\",\"name\":\"财务审批\",\"documentation\":\"\",\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"executionlisteners\":{\"executionListeners\":[]},\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"type\":\"idm\",\"idm\":{\"candidateGroups\":[{\"id\":\"40283e816f92646d016f926a76fd0003\",\"name\":\"财务管理员\"}],\"type\":\"groups\"},\"initiatorCanCompleteTask\":false}},\"formkeydefinition\":\"\",\"formreference\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":{\"taskListeners\":[]},\"skipexpression\":\"\",\"nodetype\":\"\",\"iseditdata\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-DF0CDE91-3C56-4068-B6F6-02FB82B40359\"},{\"resourceId\":\"sid-58CBF731-1CED-43B2-A876-AD1B6BCB8365\"}],\"bounds\":{\"lowerRight\":{\"x\":645,\"y\":158},\"upperLeft\":{\"x\":545,\"y\":78}},\"dockers\":[]},{\"resourceId\":\"sid-B637838A-8E37-481C-8131-A50DEC3D3812\",\"properties\":{\"overrideid\":\"sid-B637838A-8E37-481C-8131-A50DEC3D3812\",\"name\":\"结束\",\"documentation\":\"\",\"executionlisteners\":{\"executionListeners\":[]}},\"stencil\":{\"id\":\"EndNoneEvent\"},\"childShapes\":[],\"outgoing\":[],\"bounds\":{\"lowerRight\":{\"x\":768,\"y\":132},\"upperLeft\":{\"x\":740,\"y\":104}},\"dockers\":[]},{\"resourceId\":\"sid-39209A63-834F-4027-9105-032D12A10F23\",\"properties\":{\"overrideid\":\"sid-39209A63-834F-4027-9105-032D12A10F23\",\"name\":\"提交\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A\"}],\"bounds\":{\"lowerRight\":{\"x\":339.3515625,\"y\":118},\"upperLeft\":{\"x\":235.6484375,\"y\":118}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A\"}},{\"resourceId\":\"sid-9A6178EA-6108-4D9B-8310-3C5F078B7B03\",\"properties\":{\"overrideid\":\"sid-9A6178EA-6108-4D9B-8310-3C5F078B7B03\",\"name\":\"同意\",\"documentation\":\"\",\"conditionsequenceflow\":\"${ outcome == \'同意\' }\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-7C468FA0-CF11-4C38-80C7-1CBAC3CAED79\"}],\"bounds\":{\"lowerRight\":{\"x\":544.3515625,\"y\":118},\"upperLeft\":{\"x\":440.6484375,\"y\":118}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-7C468FA0-CF11-4C38-80C7-1CBAC3CAED79\"}},{\"resourceId\":\"sid-DF0CDE91-3C56-4068-B6F6-02FB82B40359\",\"properties\":{\"overrideid\":\"sid-DF0CDE91-3C56-4068-B6F6-02FB82B40359\",\"name\":\"同意\",\"documentation\":\"\",\"conditionsequenceflow\":\"${ outcome == \'同意\' }\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-B637838A-8E37-481C-8131-A50DEC3D3812\"}],\"bounds\":{\"lowerRight\":{\"x\":739.3359375,\"y\":118},\"upperLeft\":{\"x\":645.6875,\"y\":118}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":14,\"y\":14}],\"target\":{\"resourceId\":\"sid-B637838A-8E37-481C-8131-A50DEC3D3812\"}},{\"resourceId\":\"sid-58CBF731-1CED-43B2-A876-AD1B6BCB8365\",\"properties\":{\"overrideid\":\"sid-58CBF731-1CED-43B2-A876-AD1B6BCB8365\",\"name\":\"退回\",\"documentation\":\"\",\"conditionsequenceflow\":\"${ outcome == \'退回\' }\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A\"}],\"bounds\":{\"lowerRight\":{\"x\":595,\"y\":77.359375},\"upperLeft\":{\"x\":390,\"y\":32}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":595,\"y\":32},{\"x\":390,\"y\":32},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A\"}},{\"resourceId\":\"sid-9F5A558A-4B27-4FB6-9225-7BEFD35F952F\",\"properties\":{\"overrideid\":\"sid-9F5A558A-4B27-4FB6-9225-7BEFD35F952F\",\"name\":\"退回\",\"documentation\":\"\",\"conditionsequenceflow\":\"${ outcome == \'退回\' }\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8\"}],\"bounds\":{\"lowerRight\":{\"x\":390,\"y\":221},\"upperLeft\":{\"x\":185,\"y\":158.4296875}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":390,\"y\":221},{\"x\":185,\"y\":221},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8\"}}],\"stencil\":{\"id\":\"BPMNDiagram\"},\"stencilset\":{\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\",\"url\":\"../editor/stencilsets/bpmn2.0/bpmn2.0.json\"}}',_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0,\0\0\0Y\0\0\0���\0\0`IDATx^���K\\W�񴋬�J����\r�EVƉ���(J�4t�q㢨t��E�Zj�]!`}AH��CB��T�Ɖզ\r\nƷ�}��L��Q:g���������^O~�<�ܹ��S�\0\0\0\0\0\0\0\0\0pr�Dİ\r7S\0UB�ِgC~@@�\r�Qp6�D�ِgC~@@�\r�Qp6�D�ِgC~@@�\r�Qp6�D�ِgC~@ Rl(8��b�E�ِH]]�[�\r���(:��ѣ/��������2���������yw�qT����ܯ��{��{��b�����G;;;�������enn�,�s�|��l�^��MOP��-�~vl����d��tzS��|��l�^�2��-�`~�*:�!��I�sw�qC~6�/����D�����Nb�ss�7�gC~�r܂qO�I�ZX0�gC~�R�`��A~��t���z�!?����/w�\'1䨅C~6�/�%y�F-,�!?xa�ؐ�\r��455��H$��Ϻ���[����t�������nܸ�}GGǶ�:W?��w;;;�u��&�\r�ِ_y�1��x���;��i\\_U�q������ח���:�s�N��ɓH�G�\\������n��[\r,�!���\"�iR�Sccct���(�JE���QKKK&׸�\Z\Z�qw�v�ʕOo޼y����mT.��|����w�j`�ؐ�\r���+�vmJmmm��������F$;����MWZr�3�d��q�*O�/Owt{��Ƃ�!?��ϼ�**�\rivv�mY����M�k�%koo�F���B��H�t�Qi,�!??Ҁ�j#�z�j�1G�����d�L�WY�7�@����\r��\"���s�S�!??��.\\�0�\rktt�mE�7������㕤��aO��=�n�������q��A~�A~���q�e��m�a}����455��+�t������1*-�Ɲoܐ�\r���ԥMhdd�mE��ru���$��>�����(�TjM�w�Qi,�!??�,�mmB��֖�6���=�me�}}q�{������ӥ����������=F��`l�φ��IZЦ544TԴ�F������5{�J_\\���Er�ҥK����������L&���at��=��v ?lC�s���\r�ِ��ܛ���\r)�LF������D�i�k�\n�uM�+�����A^����~��o�/_�_=F�Q>������~�ݧZX06�gC~��5����g}q����cC~6�g����L��zC�l�?�;,�!?xa�ؐ�\r��Ɔ�l�^X06�gC~��!?����L�\"�2���\Zx#K�!?x���_+|�����/�j���φ��eff����ܳt:��G:�Czee�sY,��8��7n�φ��MO�>������\'<t:��Y,:�ܜɯ:�ܜ����\\������\0\n΀��@��Pp6�D�ِgC~@@�\r�Qp6�D�ِgC~@@�\r�Qp6�D�ِgC~@@�\r�Qp6�D�ِgC~@@�\r�Qp6�D�ِgC~@@�\r�Qp6�D�ِ��6�L\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\"�φ�eb�R\0\0\0\0IEND�B`�',0,NULL),('ee737287-c28a-11ea-b0fd-96e6f7651f71','经理级别-差旅报销','Expense','报销流程',NULL,'2020-07-10 16:54:14.962000','admin','2020-07-11 10:17:21.772000','admin',1,'{\"modelId\":\"ee737287-c28a-11ea-b0fd-96e6f7651f71\",\"bounds\":{\"lowerRight\":{\"x\":1200,\"y\":1050},\"upperLeft\":{\"x\":0,\"y\":0}},\"properties\":{\"process_id\":\"Expense\",\"name\":\"经理级别-差旅报销\",\"documentation\":\"报销流程\",\"process_author\":\"\",\"process_version\":\"\",\"process_namespace\":\"http://www.flowable.org/processdef\",\"process_historylevel\":\"\",\"isexecutable\":true,\"dataproperties\":\"\",\"executionlisteners\":\"{\\\"executionListeners\\\":[]}\",\"eventlisteners\":\"{\\\"eventListeners\\\":[]}\",\"signaldefinitions\":\"[]\",\"messagedefinitions\":\"[]\",\"process_potentialstarteruser\":\"\",\"process_potentialstartergroup\":\"\",\"iseagerexecutionfetch\":\"false\",\"messages\":[]},\"childShapes\":[{\"resourceId\":\"start\",\"properties\":{\"overrideid\":\"start\",\"name\":\"开始\",\"documentation\":\"\",\"executionlisteners\":{\"executionListeners\":[]},\"initiator\":\"\",\"formkeydefinition\":\"\",\"formreference\":\"\",\"formproperties\":\"\",\"interrupting\":true},\"stencil\":{\"id\":\"StartNoneEvent\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"flow1\"}],\"bounds\":{\"lowerRight\":{\"x\":75,\"y\":165},\"upperLeft\":{\"x\":45,\"y\":135}},\"dockers\":[]},{\"resourceId\":\"fillTask\",\"properties\":{\"overrideid\":\"fillTask\",\"name\":\"报销申请\",\"documentation\":\"\",\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"executionlisteners\":{\"executionListeners\":[]},\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"type\":\"static\",\"assignee\":\"$INITIATOR\"}},\"formkeydefinition\":\"\",\"formreference\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":{\"taskListeners\":[]},\"skipexpression\":\"\",\"nodetype\":\"\",\"iseditdata\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"flow2\"}],\"bounds\":{\"lowerRight\":{\"x\":265,\"y\":190},\"upperLeft\":{\"x\":165,\"y\":110}},\"dockers\":[]},{\"resourceId\":\"judgeTask\",\"properties\":{\"overrideid\":\"judgeTask\",\"name\":\"\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"sequencefloworder\":\"\",\"executionlisteners\":{\"executionListeners\":[]}},\"stencil\":{\"id\":\"ExclusiveGateway\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"judgeMore\"},{\"resourceId\":\"judgeLess\"}],\"bounds\":{\"lowerRight\":{\"x\":385,\"y\":170},\"upperLeft\":{\"x\":345,\"y\":130}},\"dockers\":[]},{\"resourceId\":\"directorTak\",\"properties\":{\"overrideid\":\"directorTak\",\"name\":\"财务审批\",\"documentation\":\"\",\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"executionlisteners\":{\"executionListeners\":[]},\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"type\":\"idm\",\"idm\":{\"candidateGroups\":[{\"id\":\"40283e816f92646d016f926a76fd0003\",\"name\":\"财务管理员\"}],\"type\":\"groups\"},\"initiatorCanCompleteTask\":false}},\"formkeydefinition\":\"\",\"formreference\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":{\"taskListeners\":[]},\"skipexpression\":\"\",\"nodetype\":\"\",\"iseditdata\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"directorNotPassFlow\"},{\"resourceId\":\"directorPassFlow\"}],\"bounds\":{\"lowerRight\":{\"x\":595,\"y\":190},\"upperLeft\":{\"x\":495,\"y\":110}},\"dockers\":[]},{\"resourceId\":\"bossTask\",\"properties\":{\"overrideid\":\"bossTask\",\"name\":\"老板审批\",\"documentation\":\"\",\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"executionlisteners\":{\"executionListeners\":[]},\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"type\":\"idm\",\"idm\":{\"candidateGroups\":[{\"id\":\"402855816f1e2a2e016f1e2a45510000\",\"name\":\"超级管理员\"}],\"type\":\"groups\"},\"initiatorCanCompleteTask\":false}},\"formkeydefinition\":\"\",\"formreference\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":{\"taskListeners\":[]},\"skipexpression\":\"\",\"nodetype\":\"\",\"iseditdata\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"bossNotPassFlow\"},{\"resourceId\":\"bossPassFlow\"}],\"bounds\":{\"lowerRight\":{\"x\":415,\"y\":335},\"upperLeft\":{\"x\":315,\"y\":255}},\"dockers\":[]},{\"resourceId\":\"end\",\"properties\":{\"overrideid\":\"end\",\"name\":\"结束\",\"documentation\":\"\",\"executionlisteners\":{\"executionListeners\":[]}},\"stencil\":{\"id\":\"EndNoneEvent\"},\"childShapes\":[],\"outgoing\":[],\"bounds\":{\"lowerRight\":{\"x\":748,\"y\":164},\"upperLeft\":{\"x\":720,\"y\":136}},\"dockers\":[]},{\"resourceId\":\"flow1\",\"properties\":{\"overrideid\":\"flow1\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"fillTask\"}],\"bounds\":{\"lowerRight\":{\"x\":164.3515625,\"y\":150},\"upperLeft\":{\"x\":75.53125,\"y\":150}},\"dockers\":[{\"x\":15,\"y\":15},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"fillTask\"}},{\"resourceId\":\"judgeMore\",\"properties\":{\"overrideid\":\"judgeMore\",\"name\":\"大于500元\",\"documentation\":\"\",\"conditionsequenceflow\":\"${money > 500}\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"bossTask\"}],\"bounds\":{\"lowerRight\":{\"x\":365,\"y\":254.3515625},\"upperLeft\":{\"x\":365,\"y\":170.2578125}},\"dockers\":[{\"x\":20,\"y\":20},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"bossTask\"}},{\"resourceId\":\"judgeLess\",\"properties\":{\"overrideid\":\"judgeLess\",\"name\":\"小于500元\",\"documentation\":\"\",\"conditionsequenceflow\":\"${money <= 500}\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"directorTak\"}],\"bounds\":{\"lowerRight\":{\"x\":494.78125,\"y\":150},\"upperLeft\":{\"x\":384.984375,\"y\":150}},\"dockers\":[{\"x\":20,\"y\":20},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"directorTak\"}},{\"resourceId\":\"flow2\",\"properties\":{\"overrideid\":\"flow2\",\"name\":\"提交\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"judgeTask\"}],\"bounds\":{\"lowerRight\":{\"x\":345.25,\"y\":150},\"upperLeft\":{\"x\":265.21875,\"y\":150}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":20,\"y\":20}],\"target\":{\"resourceId\":\"judgeTask\"}},{\"resourceId\":\"bossPassFlow\",\"properties\":{\"overrideid\":\"bossPassFlow\",\"name\":\"同意\",\"documentation\":\"\",\"conditionsequenceflow\":\"${ handle == \'同意\' }\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"directorTak\"}],\"bounds\":{\"lowerRight\":{\"x\":545,\"y\":295},\"upperLeft\":{\"x\":415.21875,\"y\":190.6484375}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":545,\"y\":295},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"directorTak\"}},{\"resourceId\":\"directorPassFlow\",\"properties\":{\"overrideid\":\"directorPassFlow\",\"name\":\"同意\",\"documentation\":\"\",\"conditionsequenceflow\":\"${ handle == \'同意\' }\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"end\"}],\"bounds\":{\"lowerRight\":{\"x\":719.7109375,\"y\":150},\"upperLeft\":{\"x\":595.46484375,\"y\":150}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":14,\"y\":14}],\"target\":{\"resourceId\":\"end\"}},{\"resourceId\":\"bossNotPassFlow\",\"properties\":{\"overrideid\":\"bossNotPassFlow\",\"name\":\"退回\",\"documentation\":\"\",\"conditionsequenceflow\":{\"expression\":{\"type\":\"static\",\"staticValue\":\"${ handle == \'退回\' }\"}},\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"fillTask\"}],\"bounds\":{\"lowerRight\":{\"x\":314.78125,\"y\":295},\"upperLeft\":{\"x\":215,\"y\":190.6484375}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":215,\"y\":295},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"fillTask\"}},{\"resourceId\":\"directorNotPassFlow\",\"properties\":{\"overrideid\":\"directorNotPassFlow\",\"name\":\"退回\",\"documentation\":\"\",\"conditionsequenceflow\":{\"expression\":{\"type\":\"static\",\"staticValue\":\"${ handle == \'退回\' }\"}},\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"fillTask\"}],\"bounds\":{\"lowerRight\":{\"x\":545,\"y\":109.2734375},\"upperLeft\":{\"x\":215,\"y\":37}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":545,\"y\":37},{\"x\":215,\"y\":37},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"fillTask\"}}],\"stencil\":{\"id\":\"BPMNDiagram\"},\"stencilset\":{\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\",\"url\":\"../editor/stencilsets/bpmn2.0/bpmn2.0.json\"}}',_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0)\0\0\0�\0\0\0J���\0\0�IDATx^��_l[���m��4i���p1m��]\0\"�iS7�br���!T\"!*�-\Z�MPK��ZiljY;7�� H����m.�N ���X���\nhHKs�<�G�>i��������#=r��q�s��_��^�\n\0\0\0\0\0\0\0໫lp���;��t��b(�&�0��ۻ��g)���9	���>�!�4���\r6|��g)��<L\n��mp��BZE�%�n�}�B\ni2��������RH�y8�nݺ�mp��B��è�ԏlp��B�����b�g�8CH!-��a	����RH�y8 ���g)��<<*�g��3��d�I\r�>�!�4���J���g)��<< 5d��3���,JϦlp��BZ�X�UE��}�B\ni��=�Gmp��B��Im�3���8CH!M�m��:�}�B\niP?��x��g)��+ HP��>�!�4	�[d&��>�!�4}UN����>�!�4}}s}�s�r\'�tD�VG����I}S��-�r\'�ؕ\n�.{=¤�\'�0c���ٔ�#\\r&�5��3�8��M�>���ۻZfb�����q|���������R����4U\ZR���d��ryflll�]/Z볞�^x!��hY?K1���|J �V����|����t�����2�k��:����1u\0��x��}K��ܩeÒwU*�Y�cv�h���S��w�d(Oyxِ�]�.���:�����Ӄ����ˆ�E����:����P��pUe��x\'=��s�d(�x�e��|1�N2��0ڲC�w��P~�6��\0���{���M�Z�����P6,	�m�ˎ*���B�p}www�Ԑ^���6���ر����}���w���=�����V{[_0�\r�gP���<�K��ɇgk�o�Y��~NC�=��={��988���ƧO���^���z{{�����y���1���H+��\n��[�(��j I>Ļw��Dg����o_�ջz;����ݻ���zh��f���������������JAt���<�C���Z\0-�����%��k_�/��7��������z�R@%��͛7���Џ��[�T���<�C��pP���6.�h?T��}�m׮]��C�z<��3o�����}����|�J>f(/e�OM���z{����<�N��k�V�������oڴ�#��~��Ϻ�u�]������,��E	�S�>�\\���P^��U�N�����63���gɀ�饞%���<_����>�aÆ�.���,�]j �(߇Ү7�*\n��ի��Ч4b��O���y���5�k<x�F�e=���K!%��V�����zϤN�>]�/����<u�p�S�����3�F?/w�mfZ\'��6wh��ݻ��͈ˑ3��ZH�a�.۷o�ޟI:t��IYe]�N��{�yh����_+��\\^����1q	����G&�����W]�l�����~�w�ܹ3�E����^��h(�\r�zo�%�!�Գ#y$���k�ٸX����/��O��������d``���;wίT��������P0��\\)��t����|\n�/J<W�x�֭�c�=��������ϯ������D�I��(�T<���Ͽ�<�Z�~��ON��I\r(�q��<ʕ�h�~[a�#��9Ʌ�(�fR���Sz���~n��o�/xHBi�ʿߖ˃ڷ��C�H���<�OO^֭[ws�X���K��Ǔ\Z\'ʆ%�ī �X�Z��l�mzƬ���v�<�;esj!�1�x��l!�o�>h��9�T���<���R����(�J��w���d]3#��cm���\0���j��l |����\'d(��5���B�y�w���֎����T*��|�uT����@��Zc��N)�^��x�%����-}y=hm���u�z��N)�����������3�6�\0�u�z9w�~�ж7��d��[ꢽȝb�����w*BjeQ�\"�	�����@����Z��w*B��j�\"5�m\0\'B;hC�ެ$���}T�}����ж7+	��dM�>�Lhmhۛ���\r��޴}����ж7+	���(:n��3���moV��S,_�}����ж7+�?ߗ���΄vІ��Y���U�l��3���moV�~(5j��3���moV�b񧲏��}����ж7+	�����n��3���moVR�(��mp&��6���JBj���_mp&��6���JB�	�?�>�Lhmhۛ�T�՟lp&��6���J�Ϡ��lp&��6���J��6���>�Lhmhۛ���H�}����ж7+�?H\r�>�L(mw�/�����Qm�}���B�+R]�z|�X,�j��3���JΦl����IH���gB:h��)��\'�9R�\\)������������቉��RɾS���u,���}�s��v��6�g��>���!%��B\\�V����xaa�y�:t=���gG:��������lp����3(\r�$ ^?|�R�7wjYx�]�JeVB�]s;�W@�WB�}��CJ�Ϡ��:q��e��w�$�>�kng2��ה�}��CJ��$����X\Z.J�g���d������>�L���\rWՁ!U�����δSH�ϡ��z�G����������-�8�.!���-\ZyW��+===߳}��v	)_��BJ߽XB�۶8CH5W�R�P�x�P���g���BJ��M	�lp��j�:0��%���}�B������HH]c��3�TsՁ!uFB��8CH5WR�oܸ�˶8CH5WR�����`��3\ZR��\r�ʮ����O��\0�R\0�FH�\Z!�k�\0�R\0�FH�\Z!�k�\0�R\0�FH�\Z!�k�Ri1��>��kf����@F�ry�Z�.jzz�		�cv�\0266�v||�l�R���J�Q���:$uRj�]3��h��Ԃ�ȃ�u�z(\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�]��):��\00\0\0\0\0IEND�B`�',0,NULL);
/*!40000 ALTER TABLE `act_de_model` ENABLE KEYS */;
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
INSERT INTO `act_de_model_history` VALUES ('af8b5636-c3e6-11ea-9902-96e6f7651f71','请假流程','AskForLeave','请假流程',NULL,'2020-07-11 10:18:42.050000','admin','2020-07-12 10:22:47.965000','admin',NULL,1,'{\"modelId\":\"d6f1739e-c31c-11ea-9982-96e6f7651f71\",\"bounds\":{\"lowerRight\":{\"x\":1200,\"y\":1050},\"upperLeft\":{\"x\":0,\"y\":0}},\"properties\":{\"process_id\":\"AskForLeave\",\"name\":\"请假流程\",\"documentation\":\"请假流程\",\"process_author\":\"\",\"process_version\":\"\",\"process_namespace\":\"http://www.flowable.org/processdef\",\"process_historylevel\":\"\",\"isexecutable\":true,\"dataproperties\":\"\",\"executionlisteners\":\"\",\"eventlisteners\":\"\",\"signaldefinitions\":\"\",\"messagedefinitions\":\"\",\"process_potentialstarteruser\":\"\",\"process_potentialstartergroup\":\"\",\"iseagerexecutionfetch\":\"false\"},\"childShapes\":[{\"resourceId\":\"startEvent1\",\"properties\":{\"overrideid\":\"\",\"name\":\"开始\",\"documentation\":\"\",\"executionlisteners\":\"\",\"initiator\":\"\",\"formkeydefinition\":\"\",\"formreference\":\"\",\"formproperties\":\"\"},\"stencil\":{\"id\":\"StartNoneEvent\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-D2D6A238-1998-40B2-8329-11C421644087\"}],\"bounds\":{\"lowerRight\":{\"x\":130,\"y\":193},\"upperLeft\":{\"x\":100,\"y\":163}},\"dockers\":[]},{\"resourceId\":\"sid-FA5DEC96-DF3B-476A-9911-6603A764994E\",\"properties\":{\"overrideid\":\"\",\"name\":\"请假申请\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"type\":\"idm\",\"idm\":{\"type\":\"initiator\"}}},\"formkeydefinition\":\"\",\"formreference\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\",\"skipexpression\":\"\",\"nodetype\":\"\",\"iseditdata\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-BE0C6AA2-056B-47EC-91C7-E2234AD454EB\"}],\"bounds\":{\"lowerRight\":{\"x\":295,\"y\":218},\"upperLeft\":{\"x\":195,\"y\":138}},\"dockers\":[]},{\"resourceId\":\"sid-D2D6A238-1998-40B2-8329-11C421644087\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-FA5DEC96-DF3B-476A-9911-6603A764994E\"}],\"bounds\":{\"lowerRight\":{\"x\":194.234375,\"y\":178},\"upperLeft\":{\"x\":130.21875,\"y\":178}},\"dockers\":[{\"x\":15,\"y\":15},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-FA5DEC96-DF3B-476A-9911-6603A764994E\"}},{\"resourceId\":\"sid-6D79B4F5-4CDB-4860-9694-C76721F2914F\",\"properties\":{\"overrideid\":\"\",\"name\":\"部门经理审批\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"type\":\"idm\",\"idm\":{\"type\":\"groups\",\"candidateGroups\":[{\"id\":\"40283e816f92646d016f92705173001a\",\"name\":\"部门管理员\",\"type\":null,\"$$hashKey\":\"object:582\"}]}}},\"formkeydefinition\":\"\",\"formreference\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\",\"skipexpression\":\"\",\"nodetype\":\"\",\"iseditdata\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-96831967-22AF-4844-A34E-1019295CC71B\"},{\"resourceId\":\"sid-7FF42D21-2DCA-40F9-A489-C95A249883D0\"}],\"bounds\":{\"lowerRight\":{\"x\":475,\"y\":218},\"upperLeft\":{\"x\":375,\"y\":138}},\"dockers\":[]},{\"resourceId\":\"sid-BE0C6AA2-056B-47EC-91C7-E2234AD454EB\",\"properties\":{\"overrideid\":\"\",\"name\":\"提交\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-6D79B4F5-4CDB-4860-9694-C76721F2914F\"}],\"bounds\":{\"lowerRight\":{\"x\":374.78125,\"y\":178},\"upperLeft\":{\"x\":295.21875,\"y\":178}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-6D79B4F5-4CDB-4860-9694-C76721F2914F\"}},{\"resourceId\":\"sid-FC44C064-B4A8-4F8F-AE0F-BB4D7D42FDEC\",\"properties\":{\"overrideid\":\"\",\"name\":\"结束\",\"documentation\":\"\",\"executionlisteners\":\"\"},\"stencil\":{\"id\":\"EndNoneEvent\"},\"childShapes\":[],\"outgoing\":[],\"bounds\":{\"lowerRight\":{\"x\":583,\"y\":192},\"upperLeft\":{\"x\":555,\"y\":164}},\"dockers\":[]},{\"resourceId\":\"sid-96831967-22AF-4844-A34E-1019295CC71B\",\"properties\":{\"overrideid\":\"\",\"name\":\"同意\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-FC44C064-B4A8-4F8F-AE0F-BB4D7D42FDEC\"}],\"bounds\":{\"lowerRight\":{\"x\":554.5,\"y\":178},\"upperLeft\":{\"x\":475.5,\"y\":178}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":14,\"y\":14}],\"target\":{\"resourceId\":\"sid-FC44C064-B4A8-4F8F-AE0F-BB4D7D42FDEC\"}},{\"resourceId\":\"sid-7FF42D21-2DCA-40F9-A489-C95A249883D0\",\"properties\":{\"overrideid\":\"\",\"name\":\"退回\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"skipexpression\":\"\",\"sequence_flow_text_x\":\"\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-FA5DEC96-DF3B-476A-9911-6603A764994E\"}],\"bounds\":{\"lowerRight\":{\"x\":425,\"y\":137.46875},\"upperLeft\":{\"x\":245,\"y\":86}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":425,\"y\":86},{\"x\":245,\"y\":86},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-FA5DEC96-DF3B-476A-9911-6603A764994E\"}}],\"stencil\":{\"id\":\"BPMNDiagram\"},\"stencilset\":{\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\",\"url\":\"../editor/stencilsets/bpmn2.0/bpmn2.0.json\"},\"name\":\"请假流程\",\"key\":\"AskForLeave\"}','d6f1739e-c31c-11ea-9982-96e6f7651f71',0,NULL);
/*!40000 ALTER TABLE `act_de_model_history` ENABLE KEYS */;
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
INSERT INTO `act_ge_bytearray` VALUES ('5d1410a9-c28b-11ea-b0fd-96e6f7651f71',1,'经理级别-差旅报销.bpmn20.xml','5d1410a8-c28b-11ea-b0fd-96e6f7651f71',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"Expense\" name=\"经理级别-差旅报销\" isExecutable=\"true\">\n    <documentation>报销流程</documentation>\n    <startEvent id=\"start\" name=\"开始\"></startEvent>\n    <userTask id=\"fillTask\" name=\"报销申请\" flowable:assignee=\"$INITIATOR\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[true]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <exclusiveGateway id=\"judgeTask\"></exclusiveGateway>\n    <userTask id=\"directorTak\" name=\"财务审批\" flowable:candidateGroups=\"40283e816f92646d016f926a76fd0003\">\n      <extensionElements>\n        <modeler:group-info-name-40283e816f92646d016f926a76fd0003 xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[财务管理员]]></modeler:group-info-name-40283e816f92646d016f926a76fd0003>\n        <modeler:activiti-idm-candidate-group xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[true]]></modeler:activiti-idm-candidate-group>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <userTask id=\"bossTask\" name=\"老板审批\" flowable:candidateGroups=\"402855816f1e2a2e016f1e2a45510000\">\n      <extensionElements>\n        <modeler:group-info-name-402855816f1e2a2e016f1e2a45510000 xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[超级管理员]]></modeler:group-info-name-402855816f1e2a2e016f1e2a45510000>\n        <modeler:activiti-idm-candidate-group xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[true]]></modeler:activiti-idm-candidate-group>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <endEvent id=\"end\" name=\"结束\"></endEvent>\n    <sequenceFlow id=\"flow1\" sourceRef=\"start\" targetRef=\"fillTask\"></sequenceFlow>\n    <sequenceFlow id=\"judgeMore\" name=\"大于500元\" sourceRef=\"judgeTask\" targetRef=\"bossTask\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${money > 500}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"judgeLess\" name=\"小于500元\" sourceRef=\"judgeTask\" targetRef=\"directorTak\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${money <= 500}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow2\" name=\"提交\" sourceRef=\"fillTask\" targetRef=\"judgeTask\"></sequenceFlow>\n    <sequenceFlow id=\"bossPassFlow\" name=\"同意\" sourceRef=\"bossTask\" targetRef=\"directorTak\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ handle == \'同意\' }]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"directorPassFlow\" name=\"同意\" sourceRef=\"directorTak\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ handle == \'同意\' }]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"bossNotPassFlow\" name=\"退回\" sourceRef=\"bossTask\" targetRef=\"fillTask\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ handle == \'退回\' }]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"directorNotPassFlow\" name=\"退回\" sourceRef=\"directorTak\" targetRef=\"fillTask\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ handle == \'退回\' }]]></conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_Expense\">\n    <bpmndi:BPMNPlane bpmnElement=\"Expense\" id=\"BPMNPlane_Expense\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"BPMNShape_start\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"45.0\" y=\"135.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"fillTask\" id=\"BPMNShape_fillTask\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"165.0\" y=\"110.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"judgeTask\" id=\"BPMNShape_judgeTask\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"345.0\" y=\"130.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"directorTak\" id=\"BPMNShape_directorTak\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"495.0\" y=\"110.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"bossTask\" id=\"BPMNShape_bossTask\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"315.0\" y=\"255.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"BPMNShape_end\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"720.0\" y=\"136.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"flow1\" id=\"BPMNEdge_flow1\">\n        <omgdi:waypoint x=\"74.94999923927439\" y=\"150.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"164.9999999999684\" y=\"150.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\">\n        <omgdi:waypoint x=\"264.9499999998728\" y=\"150.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"345.0\" y=\"150.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"judgeLess\" id=\"BPMNEdge_judgeLess\">\n        <omgdi:waypoint x=\"384.9444614102993\" y=\"150.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"494.99999999997226\" y=\"150.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"directorNotPassFlow\" id=\"BPMNEdge_directorNotPassFlow\">\n        <omgdi:waypoint x=\"545.0\" y=\"110.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"545.0\" y=\"37.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"215.0\" y=\"37.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"215.0\" y=\"110.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"bossPassFlow\" id=\"BPMNEdge_bossPassFlow\">\n        <omgdi:waypoint x=\"414.9499999999431\" y=\"295.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"545.0\" y=\"295.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"545.0\" y=\"189.95\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"judgeMore\" id=\"BPMNEdge_judgeMore\">\n        <omgdi:waypoint x=\"365.0\" y=\"169.94312543073744\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"365.0\" y=\"255.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"directorPassFlow\" id=\"BPMNEdge_directorPassFlow\">\n        <omgdi:waypoint x=\"594.9499999999675\" y=\"150.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"720.0\" y=\"150.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"bossNotPassFlow\" id=\"BPMNEdge_bossNotPassFlow\">\n        <omgdi:waypoint x=\"315.0\" y=\"295.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"215.0\" y=\"295.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"215.0\" y=\"189.95\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('5d254eba-c28b-11ea-b0fd-96e6f7651f71',1,'经理级别-差旅报销.Expense.png','5d1410a8-c28b-11ea-b0fd-96e6f7651f71',_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0Y\0\0\0�Ck�\0\0,CIDATx^���\\u}8pT�h����hǡ##��uZm�H6a\n��w��$�	�G�bQ,��5�E���C1����� Ʌ@(	�����4{��sw�n����;{?����{Ϟsv��o������ٝv\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�Ѵ���gB!ZG9w@r,���I\0*A�hM��,���I\0*A�hM��,���I\0*A�hM��,���I\0*A�hM��,���I\0*A�hM��,���I\0*A�hM��,���I\0*A�hM��,���I\0*A�hM��,���I\0*A�hM��,���I\0*A�hM��,���I\0*A�hM��,���I\0*A�hM��,���I\0*A�hM��,���I\0*A�hM��,���I\0*A�hM��,���I\0*A�hM��,���I\0*A�hM��,���I\0*A�hM��,���I\0*A�hM��,���I\0*A�hM��,���I\0*A�hM��,���I\0*A�hM��,���I\0*A�hM��,���I\0*A�hM��,���I\0*A�hM��,���I\0*A�hM��,���I\0*A�hM��,���I\0*A�hM��,��.]����;/�4i����\0 )\Z{�Ʋ,�?6lظnݺ��C��|9\0$Ec�زeˮ˶�?��S�N�\\^\0���jŊ�l�R�볭[�n�={���I�^Y^\0����^�ǿd``���~�X6}����@4�\0�[�t��M}�e�]�Ԕ)S�,o\0=�7���&��/֬Y��M�6��cpJ6o����{�ĉw.o\0=�7�4��X�`�X�j�=�f���{�];u�ԓ��@OŌ|�f�l=0�M�4�%�/~��ȗ=��?����~y\0�31#ߠ�7[��={�<��s/���:O�p�	�������o�ԛ�ƽ8v��+�x�����~�����坎� 	Mf�\'���f̘�w+W�|���oٲ��ӧO�Yq\0HJi��l=@�s�=��[su}��X�������*��O,_0��7��x��Ժ�5k�\\���G|�,\0I��ڗ���N�w܁�ׯ~ݺu�!�r�ԩS\'���$�f����_]t��w^��9�|\0}\"˲�._��ʛo���y��e7�xc%#\Z��D~�o]�h��������\0c���UW]U���Y��\n!O�!/V�ϓe600�mܸ1{��D�#����.\\�!/`��#`l�K�\\�z��eU	y�\r1ɲ�DE�c͚5��uk�1Ɩ<�Nȓ\0-���U��꧈�!/X�ʏ0���tB�h!�],\'N1v�G�1Ɩ<�Vȓ\0M�[�~�Ԛl�mgK~��E�ﱬ��Y(X�y2��\'�h�`=����fgw^���\"��e��E�`Az�ɴB�h�����k��Z<��GC�����\'�\ny��v\n�}�R�j�������\'�\ny��v\n�=7�R�j�������\'�\ny�	+�P� =�dZ!O4�N���;�U-�����P� =�dZ!O4�N�z�_R�j�������\'�\ny��v\n��ޕ��3��X�������\'�\ny��v\nVĊ�/R�bYy=1�P� =�dZ!O4�V�ڴ){���X�\rY_t\n�G�L+�I�&�+X�Ky��bU��̷*�^(X�y2��\'�hZ�6m��<8?��ǧ)R�ub]�R#�#O��$@�\n�p�O�¬��C���ȓi�<	�D�����S��m��퇂��W�0�ȓi�<	�D��U.B;\Z����C�Jʄ<��d�\'�\ny��FK�](Xɨ5�\'m�����ɴB�hB�J+�$�g��3�ȓi�<	Є��V(Xc�Y�l9�<�Vȓ\0M(Xi��5��kއ��>%O��$tY�e/���?v饗�䬳�Zw�)�l<�#����٬Y�^8餓�Η-;��ϛ1c�n��;\nVZ�`��v��vף�ȓi�<I#�&MzC�wΚ2eʵ��[�x8��m?oݶ|V�Wޖm�~����_�={��3g��.����[n�~���fO<�D�g����C=t�1�����۷�?zO�J+�1������O�ɓi�<I�ɓ\'�7싶5��Ƣخ��q-oԏ:��7����7ߜmٲ�h�����{�Gy���ԛ���w��B��N��N����ɴB�$D��7��7h�w$��}hޛ��n����͝;7ۼys�woKl�|����:u�>��7��B�꩑6�#ݞ��\'�\ny�ɓ\'���O�7�p@���~6�7o^�#Gby\\땚�\'c�����EW]uկ�8�����߾S�P�g�̙�N�6�����}\nVZ�`��h5壵&O�����7��M��Zc>}�����F�~��r��P���vu�����u�����5kV600P��F$�7cƌg��+�1�`�\nVO�v3>��#1�dZ!O�_�f�����>:[�bE��lKl��7���馛���~�f����n=���O�4i��u�=\nVZ�`u]�	Qm��#�ە�K�\'�\nyr|��pڴi�k��i���mذ��N��>�S��?1.�����3����8&�������������=\nVZ�`uU�����[y�}?�m�mW�?}B�L+���)o����ԏ������f�疯��\\��_���t�A�v��gΜ��S����V(X]Ө����k�Ns_�������]\'O�����픖���wz�M3���c�������~����)*{���E|�����Aw(Xi���͚�FMz�����ܶ�^�룢�ɴb�<9gΜ��Qm�֚���k7�~�f����馛>z�a��}������_5=��F&��X^^�`��������pMv�f�Qs�h�FM}�p�K�W�dZ�,O�]�v�U�Vݳx����8�s&N��sy���sp�7�n��;NU���ovT��T�[����Kn�o���:�)S�Q�-���Ug�\'���V4+X�]�㹤��Q�^��7��US_���3F�W�dZQΓy��K�~qӦM�3��z/\\q��Θ1����%-�<������}��[}���u�mz��g?ޫ�pj~�ӟ.��ԫʷ���=YZ>i���\\��_��:;�T7j���xK������fGo=�\'ӊ�<�bŊ	������+W>��~ҤI��LIC;����j���a�!U����ҟ}��\'��q�������x����z[��оO��O\Z+���7�`7��t�L7j�(��#M}M���.k0�\Z�+y2���#��eˮk�0᭹|�gN8ᄃ�~��7�9��������h��6�g:k֬�O>�d��\'�x��}�|[h_�\'I9�\'���Vh�k0~�Q��F�D7j�G��׌�v�\r�Q9�q%O�q��\r6�{��_����.��I�&�^��Ϲr�sp]��n��������>4>H��/����ʯ����B(XiE���G^��]v�%\Z��yl��7���{�g�8�|�E5B�L\'V�^��w�yٺu�ʭðb�ض����D������m*\'�p�ᇿ��WHe�?�������R���u�`�1|���3��9�lٲe�E]��N:�l�ĉ���{l���̙�}�S�*��~��bYl�f͚\"��Q�3fd����+G��\\���ڵk�}�K_*����[��ߋ0c�X�q�p<�4��V3��ΖӮ��.���xj8�z�\'����eq6�ȉ���/~񋃗���6��+_��������O?�ȵ_��ײ��~zȺ����{�c�9&��<���ub��v[v��Wgw�uW�F���},{�G���͸ꪫ�;o~2��Ƿn�:��8Y�9������q�k�>\r�{C����Gk˻ݏ�����{���4�������ئi�$���u��f�zhn�t�AE��h�<����g�\\7����.��w��]��_����+��}�CE��k����~�(NGqDQ��������_��_�#�<2���;��(��o���B��Mo*�\'n�_��_��UQ���7��xަ�&�QS_��魯����e펫^��x�<\"~�|Q�,oh�(o��#�H������8��o��o�7n�nݘЈ\r�x���VD��x���/�n����^{mq�7���\"OF�oK���\'�N�:y����><�e˖_Ǉg����X���2��y����uꩧ.��Yq~��^��~\Z�GZ=I���`�w�}�W�����菊)��׾���3O�\n�w���_�BѰ�ߟ��g�F���}�����xKuժU����S���=���يSXE�\\�x�v�q�-�q�M7e���g�?��?���� {�;�Q�E�\r�_�\Z����uv��n���1��Ί�#����z��qի<Y��>8{�ߘ�v�i�_��_dѠG��ܶ뮻�������b�M�6e����Y�ș1!�����G?��������O�DĻ����~���ӟ�tv�5��\\�2��K���o}k���{�*���)��RL����C��Q�\'�l7ӧO���.{j����ֵO�~����/{$l/pV�4����YqF�Yg�u^��c��G�����H�\'I�^��U�8���f;f��g|��QGU4�Q�귉������ŋ�X/\Z���l����wf�s���K�.����!��?��b�)�����w�}��=�yO��q���oQ�˿�Kv�	\'�0\n����}\\_Ƹ�X���t+4���;�K�m��5������4��^?c��qի<Y�h�_��W3���^R�^~�����w+�����]LPĻ�y3;8N㐕�#���o}�[E�1��G�;��������=��3�l}����s�=��w޹��ȱq�PLĔ��[�(O�=Þ�wܽ��O>���O<����c{g,/�K:�y:��(��n3g����)�FC~=k�;���Ư���`Ec���뿊�~_��W�$f���w�b�(N7�pC��~pp&�����5��[Q�j���o[�t5�����\Z���z�(��}�/��������cv����z�!�C7�Q�bD�k�5��~�h�V��p�K��:OF��>&j����K��)./o3�q(b�� 1��F����-f�k�~F��y9\"~?�裋(�?�3�-�6mZq�O������O2y2�iv�ԩ\'G?}�l��7���@q=q}}݇s�1+zu8��_��;����@w��`��7�)\Z��*�׼�5�a3�t�L�ܹs�SO=�x�Ʊ��~�� f�^�W��-\n]�����wb�>��Nc3Qqy���GE1�C}j3�Q�|��!�K7�Y�bD�5ٍ��FM}M��5�ͮ���U��E4���f���\'��Z��<r�{�݇g�Y��+�w6cݿ����^�җ�|���B��E/�N>��⃁���\\�.rkD���w/k���W�*����(��?(���P����v�\'�̙3�3X���k3����7ʭ㨈�֮�����I������͛��è���p~g>�\'��ʷ���U��vŇ��	S(�[�����|qf�8ƽ�~|�6f�cy�p��}��6c3S��E�q�q,j�Cq���w��֯5�1c������h��x!�V�A������`ѱF��A;����4j������Pq�ʓ�8�3��3�q��8#M�8�X��E}�ٽ\"�Ƌ��i1����|���т���5\Z��8o~󛷛@���8�\'���Sn��zc$�	-_O7B��/�5��uŊ�rDbӦM�������C�&g�ܹs���Q�5o�.��й��{z]����GD���5k֪�(\Z�����X�Ռ}�xqp饗��xW��/���h���e��P�;N�Y?cg�����r�]ߤ����4ۮ��D���\r��>����w�[_�th��G�]�L�2xX͉\'�X4A�\'�E�Ĉ�=�6�������]o���wY�3P��!>p����Nyr|����x��[<OFC�稣��R7[?>��I�&�7Q�ħ޻!O��w暸��u�=�x7\">83Hј�,{4�1�\r��%K��ߜl	��{m���V,�cGc����X4�Ֆ���NW��e�w\0��}��a����,Y��/o��P����|GS3��6�5�������*O�\"�A<��s��uM�sbL`���9��pk�mj�,��8>������!��u���(/��Y�x��6�	��~�${��PL~��19s�Wپ!O�O��}��<�\Z5��>��_������U�\'�}���ف���}3\"y��Q~g��<y���뤻zU��\n�6r~���&�&��=N��lOy���+\"~��M#}���m�8�ڷ���!�U�VŪ1�#������}��^W�1\'f���t3���&|��Gbz�\'#���\\�	�8�MD4���o�C�[����t�9�c��nd�n�E�����ȁ�E��y�������3�͛7oȺ�\nyr��>1�_�������خ4S�¸�C�M�v�3����m3��b������e�Ç��3�Ռ��~H�<�Vȓ�[���}�s|m�l9�^�_L�����>4^�p�믹���~�6>(������R\"��B�꩑6�#ݞ��\'�\ny�m3�O�5��a��En�nR��������xR�S�o�_��0s����_<��y���.�����w�y\\�)��Q��\n��:m�;ݎ\n�\'�\ny��c���&}GCZ��D��O��aΜ9w篈�y��V�[��wy��c�=�|ɒ%�_}���s�1�\0����ũ�*@�J+�1��M���O�ɓi�<I�Zڠio���l�f�Y�+�k��礏;/~޺m����&�\nR��\nk̴۬��}D�L+�I\Zч�N\nVj�`�����.�Oɓi�<	Є��V(Xc�Y��l9�<�Vȓ\0M(Xi����r_��qF�L+�I�&��B�JF��?i�OM�8&O��$@\nVZ�`%eB|�*~�/`|�\'�\ny�	+�P�Ҳ��g��\'�\ny�	+�P�Ң�\'ȓi�<	Є��V(Xi���ɴB�hB�J+��h�	�dZ!O4�`�\nVZ4�y2��\'�P��\n+-\Z{�<�Vȓ\0M(Xi����=A�L+�I�&��B�J�ƞ O��$@\nVZ�`�EcO�\'�\ny�	+�P�Ң�\'ȓi�<	Є��V(Xi���ɴB�hB�J+��h�	�dZ!O4�`�\nVZ4�y2��\'�P��\n+-\Z{�<�Vȓ\0M(Xi����=A�L+�I�&��B�J�ƞ O��$@���ۺq��!�S�>��au^�6�#Ǝƞ O��$@�-Z=000$y���C=ty^�n-?F��=A�L\'�I��ϟ��nX�f�:3Rc���f�ʕ���jU��#Ǝƞ O�}ȓ\0m�$3 y<�.V-.���,\Z���\nE��q�+V���S��m�SyrlB��b�@F7W�y���jb�m1�|9��F�~ OP	�Y�m��|9��ƞ~ O���,��(F�ƞ��\'���yjP��F1j4�T�<	@�bƩA�2Ũ��Se�$\0���Y�Z��bT�x*/���\'H���g�j1���K�eP�$\0���Y�Z��b�b,��Aȓ\0T��n0��\'�3\0��`�\r���x�,������\0T��E7W���JP���~b<P	\n�`\\�O�g\0*A���+���@%(Xt�qE?1���n0��\'�3\0��`�\r���x�,������\0T��E7W���JP���~b<P	\n�`\\�O�g\0*A���+���@%(Xt�qE?1���n0��\'�3\0��`�\r���x�,������\0T��E7W���JP���~b<P	\n�`\\�O�g\0*A���+���@%(Xt�qE?1���n0��\'�3\0��`�\r���x�,������\0T��E7W���JP���~b<P	\n�`\\�O�g\0*A���+���@%(Xt�qE?1���n0��\'�3\0��`�\r���x�,������\0T��E7W���JP���~b<P	\n�`\\�O�g\0*A���+���@%(Xt�qE?1���n0��\'�3\0��`�\r���x�,������\0T��E7W���JP���~b<P	\n#���1�����*�I\0*A�b��14�A#_����*�I\0*A�b4Č|�f�l=}A��,FC��7h�����I\0*A�b���|���l=�\'OP	\n�%f�4���A�ȓ\0T���h*�ڛ��/ȓ\0T���h*��O,_U$OP	\n��6k_^Ue<P	\n��6k_^Ue<P	\nVZ�,{���˯��曟�7o^v�7�G~�o]�h��������0>ɓ\0T�������~�Tf�ƍ��{N�8�~����F��c��#OP	\nVZb�>��r�)zk֬Y�7���#�y�JP���ߘ�O#�q��M�ǈ�G�����1��S�]��Q~��I\0*A�JK����Z�-���l�O����=���#�=A�������?����fgw^���\"��e��E硱\'ȓ\0T����v\Z���\\;����#K~4d}�yh�	�$\0��`�������i�k�����ƞ OP	\nVZ�i��qΐ��qYy}�yh�	�$\0��`�Ec�Vh�	�$\0��`����>΂Sn�k�����ƞ OP	\nVZ�i���W�4�������CcO�\'�+-�4�O<zWv�O���ǲ�����<4�y�JP���Nc���K�4�����Yh�	�$\0��`����~Ӧ���.��ǲ�l�������I\0*A�J�p�}|���_�?���E\\��gG/4�y�JP��Ҵ�ߴ)[������:��/G�뚽yh�	�$\0��`��Qc?�,}�0{?����I\0*A�JK�ƾ�Y�fۖ�\'��=A����4j�����Fy�����I\0*A�JK��^�]h�	�$\0��`�Ec�Vh�	�$\0��`�Ec�Vh�	�$\0��`�Ec�Vh�	�$\0��`�Ec�Vh�	�$\0��`�Ec�Vh�	�$\0��`�Ec�Vh�	�$\0��`�Ec�Vh�	�$\0��`�Ec�Vh�	�$\0��`�Ec�Vh�	�$\0��`�Ec�Vh�	�$\0��`�Ec�Vh�	�$\0��`�Ec�Vh�	�$\0��`�֜9s^\\^VOc�V���x��I\0*A�ꍵk��jժ{/^��g�q�ĉw.�4�iE�ƾ�Ǔ� OP	\nVweY���K�~qӦM[�m��+����3f�]y}�}ZQn�w��?ȓ\0T���=+V��000�X�,[�r���{��\'M����6\Z��������?ȓ\0T��5��o�e˖]�e��nS[sy���	\'�pPl��O+���F�x��I\0*A�\Z]K�.�Ć\r6���_����.�莫��jHs)�.n���l$��I�v/��G���`�ы��;/[�n]��Vl��>V�^=����xF�����	\0�����9s�O�ϟ��֭[�?v#�6�Y���C9��y�;�3�����>��e���狿�\\v�e1c��z�~x6cƌ�g�\\v�wd�~���w��]�m��6d���{ov�1�d_��\\V�N~���ꫳ��+�5kV���},{�G���͈�`$��{\0���:u��ٳg����-[~���Gb�خ���?����/|�ف���e/����7e�W3��n��=����ms�Aq�wf{�W��K^��}�{_v�Wdyc;����_��t�I�񶷽����y�]x�����C-��k�-.��7�Y���(��nG�ó�>�\0\0�8;����/��˞ڼy�u=�ӷ�~����ɛ����8˗//��h�?��d_�җ�����o~���V�\\�]r�%�+^񊢙�0aB��{f��������?��O���g?�>��Og�\\s�v��u�]�����o���{��{���`c�)�d�\'O����!�Ս�?+N\'�\'\0\0}dʔ){w�q���>��??����\r�����n/��k����f�����\ru-v�}�b�~�}��|������}���b����|gv��wg���-oyKv����Gyd�hѢ��cͿ��oeGuT��k_��\"����?���׍���=���;���;�sq{v�e���w��!�K��|��#�\'\0\0}&��t�ԩ\'�\r����7����߸qcq�����ಋ.�(�c�=������~D4�;mk�k\rx̠��<q�}�X�t�v�q�E���|���G]D�:>�����}6mڴ�#�H1c�	��>�C=4d�nF��>��x\0Ч�̙���z�l��c���Ō��_���.Ȯ�����e˖m��9�3xL}_?a��h�~4��!����k^S�+�W����=^@�6��~��_e�y�{������~��/��)��Ѭ����\0`�\Z��>�h�7��h�����;~�F?�������_����_|qq��8���`Ѥ��S�8�M4��Cq���7�g׋��[n��8ܦv(N������mzꩧ�\\O7b��\0\0\Z�ecM���gp@ѠǱ�����}��٪U���.Y��8�>֏c�#Ⱈ�8-e4�р��u�+Ί���O���s��w�qE���6����o�O=����o{6u����q�}��n��\0��4jt{?���)S�g��-[�`A���}�h��׍{	ى\'�XS�i�e��?����?�Sq&�f籏�����򈘅���_���8KO~��&ċ��=\">L�����Fh�\0��X5�q��8�Nugũ�W���֍3����\'>��T�q�X��q��{������rqNDyyD�gΜ9��4�<���݂xa_�U^�W��\0�#c�؋ơ�\0�#\Z��Bc\0@G4�i��\0��h��\n�=\0\0�ا\Z{\0\0:��O+4�\0\0tDc�Vh�\0��>���\0��}Z��\0�#\Z��Bc\0@G4�i��\0��h��\n�=\0\0�ا\Z{\0\0:��O+4�\0\0tDc�Vh�\0��>���\0��}Z��\0�#\Z��Bc\0@G4�i��\0��h��\n�=\0\0�ا\Z{\0\0:��O+4�\0\0tDc�Vh�\0��>���\0��}Z��\0�#\Z��Bc\0@G�͛�u�ƍC\ZL�����yc���\0��-Z�z```H�)z=���yck�1\0�a͟?��.ܰf͚uf��&��}�ʕ+/˛�Uy�W~�\0\0�-�L�Lq��1ޢ��{���z\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��F�\'�H�;o\0\0\0\0IEND�B`�',1),('6967854f-c5ac-11ea-91f9-96e6f7651f71',1,'接待报销流程.bpmn20.xml','6967854e-c5ac-11ea-91f9-96e6f7651f71',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"Reception\" name=\"接待报销流程\" isExecutable=\"true\">\n    <documentation>接待报销流程，并行审批测试</documentation>\n    <startEvent id=\"startEvent1\" name=\"开始\"></startEvent>\n    <userTask id=\"sid-2A06C0F5-F8F4-4F93-80CF-CB43E1EAA0CB\" name=\"报销申请\" flowable:assignee=\"$INITIATOR\">\n      <extensionElements>\n        <modeler:activiti-idm-initiator xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[true]]></modeler:activiti-idm-initiator>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-A59577B3-FD13-4CD8-BC57-4727053716B4\" sourceRef=\"startEvent1\" targetRef=\"sid-2A06C0F5-F8F4-4F93-80CF-CB43E1EAA0CB\"></sequenceFlow>\n    <parallelGateway id=\"sid-46931CE5-5528-4C03-895A-D2D7884B5CC3\"></parallelGateway>\n    <userTask id=\"sid-8B4DDDD7-CAD2-4337-A368-0C8E43B84734\" name=\"部门经理审批\" flowable:candidateGroups=\"40283e816f92646d016f92705173001a\">\n      <extensionElements>\n        <modeler:group-info-name-40283e816f92646d016f92705173001a xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[部门管理员]]></modeler:group-info-name-40283e816f92646d016f92705173001a>\n        <modeler:activiti-idm-candidate-group xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[true]]></modeler:activiti-idm-candidate-group>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-BDAC066E-0A2F-440E-963E-78D4C3AC01B6\" sourceRef=\"sid-46931CE5-5528-4C03-895A-D2D7884B5CC3\" targetRef=\"sid-8B4DDDD7-CAD2-4337-A368-0C8E43B84734\"></sequenceFlow>\n    <userTask id=\"sid-B23A76A1-E56E-4D7C-B584-BE36129EE520\" name=\"老板审批\" flowable:candidateGroups=\"402855816f1e2a2e016f1e2a45510000\">\n      <extensionElements>\n        <modeler:group-info-name-402855816f1e2a2e016f1e2a45510000 xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[超级管理员]]></modeler:group-info-name-402855816f1e2a2e016f1e2a45510000>\n        <modeler:activiti-idm-candidate-group xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[true]]></modeler:activiti-idm-candidate-group>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-70FF1EDC-0EFC-454A-B57B-F663D1893858\" sourceRef=\"sid-46931CE5-5528-4C03-895A-D2D7884B5CC3\" targetRef=\"sid-B23A76A1-E56E-4D7C-B584-BE36129EE520\"></sequenceFlow>\n    <parallelGateway id=\"sid-010C73B2-613A-4911-B1F2-F54696F2802E\"></parallelGateway>\n    <userTask id=\"sid-FB552126-E694-4716-9894-E532640BD780\" name=\"财务审批\" flowable:candidateGroups=\"40283e816f92646d016f926a76fd0003\">\n      <extensionElements>\n        <modeler:group-info-name-40283e816f92646d016f926a76fd0003 xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[财务管理员]]></modeler:group-info-name-40283e816f92646d016f926a76fd0003>\n        <modeler:activiti-idm-candidate-group xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[true]]></modeler:activiti-idm-candidate-group>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-86EB88FC-8B00-45A0-9E3E-3D0D3C0DD5CE\" sourceRef=\"sid-010C73B2-613A-4911-B1F2-F54696F2802E\" targetRef=\"sid-FB552126-E694-4716-9894-E532640BD780\"></sequenceFlow>\n    <endEvent id=\"sid-1DE867CC-C195-48D0-9B6B-FD69C768CA89\" name=\"结束\"></endEvent>\n    <sequenceFlow id=\"sid-F80224CD-88FB-4655-BE0E-3A433838B160\" name=\"提交\" sourceRef=\"sid-2A06C0F5-F8F4-4F93-80CF-CB43E1EAA0CB\" targetRef=\"sid-46931CE5-5528-4C03-895A-D2D7884B5CC3\"></sequenceFlow>\n    <sequenceFlow id=\"sid-56B17419-CB46-492E-AE9F-156294F0AC11\" name=\"同意\" sourceRef=\"sid-B23A76A1-E56E-4D7C-B584-BE36129EE520\" targetRef=\"sid-010C73B2-613A-4911-B1F2-F54696F2802E\"></sequenceFlow>\n    <sequenceFlow id=\"sid-70141BF7-F0A5-4A56-9696-28986F5E3B05\" name=\"同意\" sourceRef=\"sid-8B4DDDD7-CAD2-4337-A368-0C8E43B84734\" targetRef=\"sid-010C73B2-613A-4911-B1F2-F54696F2802E\"></sequenceFlow>\n    <sequenceFlow id=\"sid-133B727D-C6B1-461B-BA51-657480CCE474\" name=\"同意\" sourceRef=\"sid-FB552126-E694-4716-9894-E532640BD780\" targetRef=\"sid-1DE867CC-C195-48D0-9B6B-FD69C768CA89\"></sequenceFlow>\n    <sequenceFlow id=\"sid-240A8C29-E6F6-4E5F-9CF5-EEA6814BDD28\" name=\"退回\" sourceRef=\"sid-FB552126-E694-4716-9894-E532640BD780\" targetRef=\"sid-2A06C0F5-F8F4-4F93-80CF-CB43E1EAA0CB\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_Reception\">\n    <bpmndi:BPMNPlane bpmnElement=\"Reception\" id=\"BPMNPlane_Reception\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"75.0\" y=\"223.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-2A06C0F5-F8F4-4F93-80CF-CB43E1EAA0CB\" id=\"BPMNShape_sid-2A06C0F5-F8F4-4F93-80CF-CB43E1EAA0CB\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"150.0\" y=\"198.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-46931CE5-5528-4C03-895A-D2D7884B5CC3\" id=\"BPMNShape_sid-46931CE5-5528-4C03-895A-D2D7884B5CC3\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"345.0\" y=\"218.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-8B4DDDD7-CAD2-4337-A368-0C8E43B84734\" id=\"BPMNShape_sid-8B4DDDD7-CAD2-4337-A368-0C8E43B84734\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"465.0\" y=\"90.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-B23A76A1-E56E-4D7C-B584-BE36129EE520\" id=\"BPMNShape_sid-B23A76A1-E56E-4D7C-B584-BE36129EE520\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"465.0\" y=\"300.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-010C73B2-613A-4911-B1F2-F54696F2802E\" id=\"BPMNShape_sid-010C73B2-613A-4911-B1F2-F54696F2802E\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"630.0\" y=\"222.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-FB552126-E694-4716-9894-E532640BD780\" id=\"BPMNShape_sid-FB552126-E694-4716-9894-E532640BD780\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"735.0\" y=\"202.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-1DE867CC-C195-48D0-9B6B-FD69C768CA89\" id=\"BPMNShape_sid-1DE867CC-C195-48D0-9B6B-FD69C768CA89\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"900.0\" y=\"228.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-86EB88FC-8B00-45A0-9E3E-3D0D3C0DD5CE\" id=\"BPMNEdge_sid-86EB88FC-8B00-45A0-9E3E-3D0D3C0DD5CE\">\n        <omgdi:waypoint x=\"669.5135906040264\" y=\"242.42910447761193\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"734.9999999999984\" y=\"242.185687732342\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-A59577B3-FD13-4CD8-BC57-4727053716B4\" id=\"BPMNEdge_sid-A59577B3-FD13-4CD8-BC57-4727053716B4\">\n        <omgdi:waypoint x=\"104.94999848995758\" y=\"238.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"149.9999999999917\" y=\"238.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-56B17419-CB46-492E-AE9F-156294F0AC11\" id=\"BPMNEdge_sid-56B17419-CB46-492E-AE9F-156294F0AC11\">\n        <omgdi:waypoint x=\"564.95\" y=\"340.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"650.0\" y=\"340.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"650.0\" y=\"261.91013789581206\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-133B727D-C6B1-461B-BA51-657480CCE474\" id=\"BPMNEdge_sid-133B727D-C6B1-461B-BA51-657480CCE474\">\n        <omgdi:waypoint x=\"834.949999999939\" y=\"242.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"900.0\" y=\"242.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-70FF1EDC-0EFC-454A-B57B-F663D1893858\" id=\"BPMNEdge_sid-70FF1EDC-0EFC-454A-B57B-F663D1893858\">\n        <omgdi:waypoint x=\"365.5\" y=\"257.4406742125985\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"365.5\" y=\"340.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"465.0\" y=\"340.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-240A8C29-E6F6-4E5F-9CF5-EEA6814BDD28\" id=\"BPMNEdge_sid-240A8C29-E6F6-4E5F-9CF5-EEA6814BDD28\">\n        <omgdi:waypoint x=\"785.0\" y=\"281.95000000000005\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"785.0\" y=\"405.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"200.0\" y=\"405.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"200.0\" y=\"277.95000000000005\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-F80224CD-88FB-4655-BE0E-3A433838B160\" id=\"BPMNEdge_sid-F80224CD-88FB-4655-BE0E-3A433838B160\">\n        <omgdi:waypoint x=\"249.94999999998078\" y=\"238.1509063444109\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"345.439393939394\" y=\"238.43939393939397\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-BDAC066E-0A2F-440E-963E-78D4C3AC01B6\" id=\"BPMNEdge_sid-BDAC066E-0A2F-440E-963E-78D4C3AC01B6\">\n        <omgdi:waypoint x=\"365.5\" y=\"218.5\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"365.5\" y=\"130.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"465.0\" y=\"130.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-70141BF7-F0A5-4A56-9696-28986F5E3B05\" id=\"BPMNEdge_sid-70141BF7-F0A5-4A56-9696-28986F5E3B05\">\n        <omgdi:waypoint x=\"564.9499999999526\" y=\"130.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"650.0\" y=\"130.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"650.0\" y=\"222.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('697b3460-c5ac-11ea-91f9-96e6f7651f71',1,'接待报销流程.Reception.png','6967854e-c5ac-11ea-91f9-96e6f7651f71',_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0�\0\0\0VT/)\0\08UIDATx^��	�\\e�?`��2�q߆�q8.�QGG��pCEP�E� aTpPq�P�Q�Q�Qd�Y��+*D�!�!v$A��_�5�S���U�}��WU�s�{ҩ��������߭[m\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P����W�Xq�E]�ǅ�s�=W�\\����K�.�yѢE[�_\0\0������Ii���i�ڵ����W5W|����dɒ�\Z�u��k\0\00Rb%5BR9<��kժUk\ZA���k\0\00R�p_+�yT������\Z\0\0��x�d90��U���\0\0`��\ZT�sUZqىi�y�QT|���S�+A\0\0y��{�)]y·�/�\r*.���۫���\n\0\0��^��\r��l�ͺq�Ym۫���\n\0\0��^���-�6+�+o��^�*\0\00�z	�W�{d[@mV\\W�^M�U\0\0`�	�y��\n\0\0��^�j��P�ו�WS/A\0\0y���|�-�6+�+o��^�*\0\00�z	���tE��GG��Ը,�+o��^�*\0\00�z	�Q���䶠\Z���S�+A\0\0y=�u����k�qY\\׶��r	�\0\0���T��t�Ǵ��f�u�M�vjj%�\0\0#�cP]�.�Z�(�ꇇ���r�6����闠\n\0\0���j�U�Neuu�%�\0\0#o����*j��ۖ�O�^�*\0\00�����9�*ߟ�U\0\0`�TU�JP\0\0F���W	�\0\0��T�*A\0\0y�j^%�\0\0#OPͫU\0\0`�	�y��\n\0\0�<A5�T\0��\'��U�*\0\00�ռJP\0\0F���W	�\0\0��T�*A\0\0y�j^%�\0\0#OPͫU\0\0`�	�y��\n\0\0�v�aq�f�//T�*A\0\0Z����ׄ�UPͫU\0\0`h��	���W	�\0\0��\Z\'��XռJP\0\0��8�\\E`T�*A\0\0�`����X�j^U~}T5U�C\0\0�Cc=ʃzK-ޡ�C�������/r�!���K7�tS��g>�v�u�����-}�CJ�]w����\\rI�i��ҧ>��t��秣�:*~��i�}�M{�G:��37���~��i뭷N���wӉ\'��>���������_�b��j]u�U�H_��ڮk��&��e�]�N?��t�W����m��6�x�m�O���VO�\0�+Cc=�Ԧ�եK���|�#�O}jzԣ�^�җ����ۧ#�<2���,B���^l��_�\"}���N���`w�\r7�.�E���������}n�����\"�Ν;7�q����O��zk���?�^�����|�;c��r�-��SO-B������<m��v�s��;��6���9�쳋�۬�<�9E5��?��6�7��EE����կ��w߽���g�%�VO�\0�+Cc=�Ԧ��X=��w饗+��sN������������}�c�c�����NK[m�U�җ��֮]��}EP�q�7���NH�zh����W��X���W�����f����V�ZUƃ:�X��z�s�����\'�M7�4���/N����n�w�����?��_�j�?��t�g_�re:餓�@��֥g?��i�-�(�w3�F��~��Wo��z-A�zz\0\0]\Z��-�6M7�F��n�Jh�+�?�я���/��/�SN[M���7gΜ������j����?�C�������G?�XY]�xq�f�m��~��r���7�1��g?��~\"�F-[���q>c��5�F�Y�&}�k_K��_����\'>���:�-����C��{��Խ�ګ�B�Ї>��o�qzӛޔ��o���z-A�zz\0\0]\Z�2��z��7A4��뿦�������ӫ^�����?������]���y�8\\6��^�j�֞w�yE،U�O~����~w���n�-͚5�X5m�����~4���������O�+�/|�����>�>��ST|���u����`��\'?�8��o}k��\Z�Ǎ�C�{q�R�j��\0\0�24�e:A5�Wz�+�q�o�TF����F����DJ����a�g�uVF{	�Qq�m��)���\Z�����\\ɍp��>��.��R��+V\';��<��\Z�7��q�P�\'<�	�{R���_o��fi���.9������{��^���z�o��4�T���\0\0Е�1/�	�Qq�o�o4�Z�G5���)m����a���dVT�����������+�s\ZA���|\n�+��j����U�dK�\Z��Oy�S�k_�����~v���NTˇ�>�Y�*��]����o���桿�\Z\'�Z�|y���ϫ�T���\0\0Е�1/�\r�qh��ٳ���G��ᶱ����;3*N`g��\'T�g����������8IQ�t��\Z�!}�cS�ͅ\'Aj�����Z�`AQ���XT|ߛ�?N[�j��=�y�s��x~V˷����9\0\0teh��xAl2a-VT�ca\"Dq�š���\Z+��>����87NR�_��_c��[�.-Y��x�g|l͗������/���y�C�����E�|�+_�6�d��DJq��x�W^�~��-�=,}��E��Cx#x6ߣ\Zg���^t�Em���8�RT���wD��G���Ʒ���׿��c�<N�ߏ��{)A�zz\0\0]\Z�2ݠ\Z+����fE8��V=��c۶��x�g|LM��qX��o���o�����5?zf���m׵V��7*Bel?�Cp��-_g��U����p����X�-o;�T���\0\0Е�1/�\r���T���\0\0Е�1/�j^%�VO�\0�+Cc^ռJP���\0@W�Ƽ�y��Z==\0���yT�*A�zz\0\0]\Z�\"��U�j��\0\0�24�EPͫ���9\0\0teh̋��W	���s\0\0��ИA5�T���\0\0Е�1/�j^%�VO�\0�+Cc^ռJP���\0@W�Ƽ�y��Z==\0���yT�*A�zz\0\0]\Z�\"��U�j��\0\0�24�EPͫ���9\0\0teh̋��W	���s\0\0��ИA5�T���\0\0Е�1/�j^%�VO�\0�+Cc^ռJP���\0@W�Ƽ�y��Z==\0���yT�*A�zz\0\0]\Z�\"��U�j��\0\0�24�EPͫ���9\0\0teh̋��W	���s\0\0��ИA5�T���\0\0Е�1/�j^%�VO�\0�+Cc^.\\��ڵk����\Z��͍����\Z1=z\0\0]\Z�t�қW�^��T�u�uם����_#�G�\0�+Cc^-Z���%K�Z�j�\Z+�����}�ʕ+����7j��k���9\0\0teh�O��X�k���IU{��=��B��s\0\0����I�\0�+C#P\'=\0���@��\0\0�24u�s\0\0����I�\0�+C#P\'=\0���@��\0\0�24u�s\0\0����I�\0�+C#P\'=\0���@��\0\0�24u�s\0\0����I�\0�+C#P\'=\0���@��\0\0�24u�s\0\0����I�\0�+C#P\'=\0���@��\0\0�24u�s\0\0����I�\0�+C#P\'=\0���@��\0\0�24u�s\0\0����I�\0�+C#P\'=\0���@��\0�JJ��+V�8���.��ӹ瞫j������K�޼hѢ�˯����I�`�4B��4BRZ�zuZ�vm����U�����/Y��Fpݪ�\Z1��@��\0�J��FH*�\'U�Z�jM#�^Z~�L�F�Nz\0C%����G�����ʯ����I�`��{$ˁI����(�F&C#P\'=�z����ra��ai����Ui�e\'�e��GQ�u\\V�NM���(�F&C#P\'=�z����ra��{�)]y·�/�\r*.���۫���:<�@����9�G>�<0�z	�7,;�-�6��eg�m��^���04u�s��<���x��%��z�\'�j����j�%�C#P\'=�z��H��2#���	_y�m�Yq]y{5�҄������S�^f�(���H0bzij}�	C#P\'=�z��H��Q_��`��҄㷃�ܬ�����zi�����Iϩ^/3��x�Wf$1�4��|���6+�+o��^���04u�s��ˌ�<��	FL/M����HW�舶��u����K�F�NzN�z���=��2#���	G]�ӓ�\Zp\\V�NM�4��ahfJ��,�ӥ�o���2#	���	FL/M��u����kk�qY\\׶��ri��CPfJ���\'��kv�vLN/3��x�Wf$1ݚp����ik�͊�ծ�҄���\n̤X1\'�ZM�P�)�y<�+3���Mxݺ�j������x��ĶVW�_���T��+��T���8#���x�Wf$1�5�n�������K�*0�b�t��j5�\"��H��x�Sf$1�5�^VQ;Uܶ|��҄���\n̴�����15��Hm�<��	F�xM��l\'[��S��&<4f����W\0T���j5�B��H���4G�U[f$1ݚ���4��tu�^���\n̘Ҫ����L]��y<�Rf$1���Ki��R���w��5WU˗3=��H�VQ;����	F�xMX��4��)�v������v����b��H���v*��^��`ČׄU�JX��h���c��o��1\ZoF*���V��T�eFbd����E]���\'�����k9䐵��σq�����8����n\\�ۣ�:�ӻ���ʷ�5aտ҄R�!���\0&��[�/�bf��ʌ��kԍ����>��?Λ7/{���/N�����m�ݖB�����=����p������u��t�p^�	�Ɇ��n0�rO)��i0#�Uf$�Z#x�w�QG�=蠃�E]����?����.�׻������{��9s�Y��A�	�U��@��@8�����K:]�$���*3C��5r�9�|s��N,H�ӟ�Y�\'q���n��v�;�e�q�&�Wi�c���to��n=�������W��:�|���N;�}��\']}����9%q?��ͻo�ܹ{�o�h�y�&<z\0�ulV\'��@Y���������W��z��v�m��;̟3gΙ�?/m�\r�?g9��t���c��m�Y��Ο??�^���7�%�o��w�g��ߢ���DΫ4���:��TC��&�3&�=-�Hy�ib�L�F\0]�>��ZK�v���^x�~R�ZI-k����m��f���p^�	gm2_�A5L�~��5�^1�ۍ<3R^eF\Z_�;�8�\'�N���s�d��#7��G>�6�S:��8�;�Ν����\nM8�҄�5�Ao2A5L����2�1�ۏ$3R^eFjGv��w���]v�%}��i��~�I\\��v��z��):0�>����S=qR����͛w�.�k�y�&���x�\r�a*��^zC/=�����)�2#m�,�h��?5��N;픾򕯤;W����q����@�o���P�{��?��?�G���\'?�I�&����14�J��T�^���L����kO���zldFʭ�H�g�J�XH���ӵ�^[�(=����[ê��t�n��^{��9�����N;ݙ�ٳ\Z;��F�._^�	�U�p�z�Y�t�^���L�q��1�^0��3��if��ʌ�qn��s�����vX�뮻��dR��q?-a��A>O�N:�s�=���k0�>��_9gΜ}�ϥ_Zv�	�tM8�҄����B�t�������m�=`�=g��?��Hy��/\Z�̂�l+��\r�Mq?����ǦGuԭu��t�y�-k�����K���d�p^�	W�ן�Up�\Z�S��\0�T~���s��8#Ō�W���>���g⽥S=ܷ�������9x������+�������fe����\\�e��|�!]Ϋ4���30���zU\rnS\Z�S���T��s��x#���W�������9&N�4�~[f��<O��ϟ����^��Ϩ�n��ƋyS����8Cy��!]Ϋ4�ꍳ�Yب���u��:��Q��������K:������?!3R^5�3R/�d���̓1��G��zv�Ɋ�m��s:�P�o�<P��Ϩ���=�\0�}i�yU��Q�T�	��7�8�<��OJ��ʚH<�$7)_�YM/,��K:�������x�	)�\Z��u��s�4����?^�\"���o>VN��\n{��u���z뭿�a0VT7���	q�i�=�H���o���Ǿ��>8͞=��������y���@Z�fM���{���6Q�V�*����}����;�<v�r����>��t�-��]�����ݥ�^ڶ}5�M�_���ga���r���:��Q���*~�{�%�T�<B�ꞑ��5�3R/�d��5�?���Q�Rq�-�%�s������w��ի���;��ն>�݄���w�=��3�N�x�;���#������6������?ޗ��%鑏|d:��������%���H�y�kƂ�\r7ܐ���/�}��\'~��������������}��7����o����V[m�N?��b�g>���������4��t��w��;f���	�K�?�U5�U14������~���I���q��{FR�0�H��m�d��˚��tΉ�oy�䛡p衇^S�Y���CF�qoO]M�׿�u�җ������F8|�����n���Q����7��>��4�~��G���O~rz�#�>��O�믿~l����*��E����}7�?a�C�/���\r��/.��/L��G����ߥ�=�a�/xAq8�ҥK��-3Y�܄��ן�UjU�U< _���������Yu^����NU�Q׌�z�a���������g��Ѹ�����ѡ����u����� �c���г˗��Մc�3ꠃ*�c��Ɵq\n���ۯ���ԧ6�M��>�y�+Bml��կ~���/|���>�������W�2=�)O)#��F���x�3ҫ^��t�W���7�I\'�pBz��ޖ���w�x��NO}�S��\Z��O��O�cƶ��L�07�~��g�d��Z/��D���@�����3������G�ꚑToU~}F�f�\\<q�-���� ���w��i����sC��>#\Z�sK�E�uϊUw�����>7}���M�y�s����b4��@+��O��t�9�7���c+�ox���z�ӞV��y߿����n���qE5�T������q��.��X������c�����J�]w]ۿa&KP�ʬ��{�3��G/?��pYeu2k���k�����Z�C�����]�-1��MoJ����Ʈk�i��=�я.�3L�$~?�[��(�8�x�T��֊m��.���mR1G�̶��o�*o?�5�3�8�b�>�����VT\\��ں�=�S�{�������/~�\"h62=�	O(\Zd4�X�\\�`A:��C�p\'Y��o������M6٤�M��<���M�������±�\Z��KP����P\\\r����*Vk����\n�[n��/_��o��\Z�&<��:��2�g����~��sʪz>Y�(��kFjV�0Q�u�o#�y]�?�3P�\",���oM���*��_��b�Y�v���	$c�iV,D5�G�w�q�&�+u�g���_m���a��z�\'w�����}ݻ������?����j��\r�p���o���su5�h��<c�o=�w��7O���\'����{D���I�b�3.o6�X]��6WT���͆����ߗ����Jms�fP������,\'k\\�v���/~P�����an�l*��T�Ʃ<0���ٟJ�)��y���@��f�f�QaO���a�����秘i��1�<�Q�*^�x���~��b�u��o���%���x��-m��6�ga���$�QqYT|}���~���3�(��r��t�I\'�=���[��͠z�!�\'�����k&j�g�^����w�4���,x��ͯЃ��ub�\\P~�AQw.�G5*oy�C:�[+\Z��[o]���v����g�ݓO>��{�j�ڞx�c\'f���\Zͼ�m(�;>\"�uE5~;)���d�����`�L�L��M���Da�U�3R�4q�X���ۤ���K�8¬�t�C{[����^�2�_��6Q��vZ�}Gŧ)|�k_+�\r�7Nj_�j�1�3�m�H��sO��\Z�T�ƾ�e/+�x�X��)N|Y~���a��z�\'}��i��m����\'~�3�?���\Z/�x��c���p�H)~�A3VA#��{��-[�,��=�)\Z߬Y������)�����>*\Zr��I�ʏլN��4+Vyc�6N��!���i]Q��e\\{�m���\Z�&<&3�Mfh����k:�`2=�l:�;�ꚑ�+�T�$�͏ȋ�cnj<����mb��)�2��0�\ngl��׾�Xm�%}�!űx_�QdQ���ǌO[�;wnq�q�K�q���(��W���;���D��3!�w�w.\'o��30v�q�-��իW�_�iY�r�Y���FCآ�����&��;�����U�˾��/�5]��Ǌh�=�?���������u�M7���(_�����Y�è���ET�x��%K��8=�IO*��Q,�f&kԛ�\0�u��uh�����0՞�k�)��㍄�f�fE\0l<l1�D�_�GЌ���6�l��)E���w�S��>�}�_�����4~����C�����\'�i�.�l�+$��P_���a���.�������G�}�{�+�������2#+�?n�t~�+_)ǓJ��6#����ܹs�l�@�]������8����\Z4u7a5qi����������F�TzC/=�l*�3Rꞑ�����x\rcE5��GvE��_������n�����q�p���B@|���ŋ۶�_�GP-���g=k���b�4+�#ߚ����j<n,0�\')�g&ʌ��FqN�f��_HđU��k��jj�bc ��3pb�s�]v��3θc�\'X�\'�O�-����TwV�&<0�;�M���p�l��lP������g����^�o~���I�oI�T���Gs��;�7�N!���o�6��_x��E���o���|�fP����3�#�	��=���f��H��!�A2׎��\nq?��ߟ[VS�<��C�̹s�3o޼[�����6�[}�)�|��-o��q?��T�5%տ҄�T���-���	���ߑV���@��O|\"]x�i֬YŪe|\\_|N|�����͊U���^��X�x�����۬&���\"������X��Ìߒ�馛\'������J��zj��g��H��i�ۚ�2�=ݰ\Z�?��C�VR���<m���ҝv��#�<�W.��7����k֬���Z�����~Ųe�~z�駟q����vMl?���u7a5qi�g��d�F[�=�נ����Q�3ҕW^Y|Vi�q�ި��{��׶�c���\Zq\"���q�o��Z��۩��W�<*��ј��ϳ?�#�_�p�	�13�m[W���O���&4�e��N�0�]i%��a9rt��?{��9s�����F�g��^�����|��:���^��@�u��u;�V��^�j/�C3R^eF�P#���\ZV�p�8R�g��b��������?CBΫ4��m\0�v=�D��C�{��dFʫ�H�֯���4���9�裋��8l<>2ğ���<�o��f�n%��h�y�&<�:\r��.�������n䙑�*3����9��oUl\r����:CBΫ4�W�������nO3R^eF�X�<�Љj(��ÐЄ�*Mx(4Ã��i@��k��u;:0#�Uf��8CCΫ4�1+�S�?�W\0T�[�v==0#�Uf$1�p^�	��A`�t\n��.g��Hy�	F�&�Wi��CPjP��3\rf��ʌ#FΫ4��!�5i�S�)�2#��ф�*Mxx�@]6�|�7�x��9Bj��Hy�	F�&�Wi��CP���7���n;=�bf��ʌ#FΫ4��!�uh����?z\"jv�z�Ό�W��`�h�y�&<<U����T��g��Hy�	F�&�Wi��CPfZi5ժj��Hy�	F�&�Wi��CPfZi5ժj��Hy�	F�&�Wi��CPfR��T��2#�Uf$1�p^�	A�IVS��VȌ�W��`�h�y�&<<U`�Ċ�8�\\�˷cr�Hy�	F�&�Wi��CPfJ���L�eUu��Hy�	F�&�Wi��CP��Tό�W��`�h�y�&<<�@���ꙑ�*3�M8�҄������S=3R^eF��p��׮]��T��xnn4�u�׈�dh��TOPͫU1K�.�y���m�@�_�]w�)�&|i�5b0\Z�:�9�T�*AF̢E��^�d�]�V�Zce�?����Z�r�\Z\r��FmU~�L�F�NzN�ռJP��(V�\Zu4�A��O>�8�������_H\"�F�NzN����rXR��x=ʯ@����Mn�@����9�G>�<��i��<;�s^_���C�\Z�:�9�s�|�y<���\\M]_���C�\Z�:�9�s����x\0���jU��\Z�:�93#����H�y<�b�(_6@�<��)��ZU%+�F�Nz��7\0j+��T��d�`\0�Iϡ�@�b�t��jU�l�:�9tb�\0�I���N�5�|;���\0���C\'�\r���0�jj����W�Nz��7\0�H&7�I�Nz��7\0�H&7�I�Nz��7\0�H&7�I�Nz��7\0�H&7�I�Nz��7\0�H&7�I�Nz��7\0�H&7�I�Nz��7\0�H&7�I�Nz��7\0�H&7�I�Nz��7\0�H&7�I�Nz��7\0�H&7�I�Nz��7\0�H&7�I�Nz��7\0�H&7�I�Nz��7\0�H&7�ɼ���bŊS/��?.\\�0�{�j|�\\�t�͋-ں��0}z��7\0�H&7�ɼ4B��4BRZ�zuZ�vm����U�����/Y��Fpݪ�\Z1=z��7\0�H&7�ɼ�Jj��rxR�תU��4���׈��s�ľ�G�0��O�%����G�����ʯӣ�Љ}��4arc��K�G��T�*^��k���9tb�\0�#M���\'��kP���Ui�e\'�e��GQ�u\\V�NM����9tb�\0�#M���\'��KP�玛ҕ�|(���۠Ⲹ����z	���s�ľ�G�0��O楗�zò3�Bj�n\\vV��j�%�VOϡ�@i���>��^���-�6+�+o��^�j��:�o\0��&Ln�y�%�^y�m�Yq]y{5�T���Љ}��4arc�̋��W	���s�ľ�G�0��O楗�\Zg�-�f�u����KP���C\'�\r�>҄ɍ}2/���|�-�6+�+o��^�j��:�o\0��&Ln�y�%��v����R㲸����z	���s�ľ�G�0��O楗�\Zu�OOn�qYy;5�T���Љ}��4arc��KOAuݺ����ڂj\\׵m��\\�j��:�o\0��&Ln�y�T��t�Ǵ��f�u�M�vjj%�VOϡ�@i���>���Auݺ�j�����N��ĶVW�_�j��:�o\0��&Ln�y/�v[E�TVW�_�j��:�o\0��&Ln�y/����ک���S���Z==�N�\0}�	��d^����9�*ߟ����9tb�\0�#M���\'�2^PU�+A�zz��7\0�H&7�ɼ�y��Z==�N�\0}�	��d^ռJP���C\'�\r�>҄ɍ}2/�j^%�VOϡ�@i���>�A5�T���Љ}��4arc�̋��W	���s�ľ�G�0��O�EPͫ���9tb�\0�#M���\'�\"��U�j��:�o\0��&Ln�yT�*A�zz��7\0�H&7�ɼ�y��Z==�N�\0}�	��d^ռJP���C\'�\r�>҄ɍ}2/�j^%�VOϡ�@i���>�A5�T���Љ}��4arc�̋��W	���s�ľ�G�0��O֣�}^ܨ����ռJP���C\'�\r�>҄ɍ}��}^_VA5�T���Љ}��4arc��GKP�0�\n�y��Z==�N�\0}�	��d=�	��VA5�T���Љ}��4arc���8�\\E`T�*A�zz��7\0�H&7�&��T��룪�r�`�\0�#MFSyPo��;dr���[����O~���i������o���k����{��{�g첟��g�/}iz�K^�.�첶���ꪫ�����/�]�Z��{�Q��駟����4����ۦo��m��,+�P3@i�0��Ԧ���}�ݗ�,Y�>�Ϥ]w�5=��H�|�3Ӌ^���U�iO{Z��6��;��~��_�׼�5�v�W�^��ק�|�;iժUc۞}�������<�9E5���vۥ�;n���s�=�:��3���կ�8���g�U��	��4aM�jS�A5jŊE茐��7�)}��O;�SV�_�m�r��t�I\'�M6٤��f�J/{����?���lV3�6���|�������O���g����?�Q�*����~v�b�-ҷ���z�!����>]}��m�5%�B}�H\0}�	�h�P�����rKqhosu�\roxC���g<�X]}��^��/_����?��o��X}�_�~��_�Y����曧�?�X�w�}�ҥK�c͚5�k_�Z�o���m���\'_�j�1�3�m�N���^{����Ї�g�7.��7���L��\n�1#��&L�Π�v���0�իW�]v��ǧ�6�,}��m�>*��F�l3P�\ng>�]�P{�5�lp�}�٧�����**�����*?�n�햞��\'��s禷���Ŋj���[�뮻�m��,A�cF�#M�H�A��.���bE�q�{\\:��cө��Z�o������}�c+Bj�\'5ޟ:k֬��6��GP����;�����b����}lQ�u�Ms�K.�$��U�*��/xA����W��C��=�%�B}�H\0}�	�GP�3�n��E@�p\Z!2���\Z��6���曋��>�,V=O<����qX����\"t��۬8[o���zֳҼy�ƶ��ҋ/��8��y�o9��Y�9�y�m�3%�B}�H\0}�	�3�F��򗿜v�e�\"p�{M��ǧ��:*]���ɍ�-[V�/5����F�a�Q�124#P>�IO*��{��w�=΂���<����������p�\ZT=�����=/���	��=��z&KP����\0�H&2^p������9s�g�m^�x��t�	\'�u���f�J�y�{���v�a���n�����L��>G5*V_�ʗG�*i�㭶�*����Y�ߒb�7Bp|\'W�C�˷��T�>f$�>҄���+��ǽ�Y~7j9�o����/n�m��7V^���w-g���c6ޯ��׾6��׿n{��8�7�|yT����#�,>��#�(Vs#(/\\��mۺJP����\0�H&ү���/A�cF�#M����W	�P3@i��DռJP����\0�H&\"��U�*�ǌ�G�00A5�T�>f$�>҄���y��\n�1#��&LDPͫU��	��4a`\"�j^%�B}�H\0}�	T�*A�cF�#M����W	�P3@i��DռJP����\0�H&\"��U�*�ǌ�G�00A5�T�>f$�>҄���y��\n�1#��&LDPͫU��	��4a`\"�j^%�B}�H\0}�	T�*A�cF�#M����W	�P3@i��DռJP����\0�H&\"��U�*�ǌ�G�00A5�T�>f$�>҄���y��\n�1#��&LDPͫU��	��4a`\"�j^%�B}�H\0}�	T�*A�cF�#M����W	�P3@i��D.\\��ڵk����\Z��͍����\Z3Ì�G�00��K�޼z��Ф�뮻�FP���\Z3Ì�G�00�E�m�dɒ�V�Z���j��}_�r��o5B���ڪ�\Z3Ì�G�0�M��X�k���IU{��=��B*�Ȍ�G�0\0@;3@i�\0\0��H\0}�	\0�3#��&\0�Ό�G�0\0@;3@i�\0\0��H\0}�	\0�3#��&\0�Ό�G�0\0@;3@i�\0\0��H\0}�	\0�3#��&\0�Ό�G�0\0@;3@i�\0\0��H\0}�	\0�3#��&\0�Ό�G�0\0@;3@i�\0\0��H\0}�	\0�3#��&\0�Ό�G�0\0@;3@i�\0\0��H\0}�	\0�3#��&\0�Ό�Gф�RJ)�T{��&\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0���K�w}\r�\0\0\0\0\0IEND�B`�',1),('995fca43-c5b7-11ea-8271-96e6f7651f71',1,'高级接待流程报销.bpmn20.xml','995fca42-c5b7-11ea-8271-96e6f7651f71',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"HighReception\" name=\"高级接待流程报销\" isExecutable=\"true\">\n    <documentation>高级接待流程报销-包容网关测试</documentation>\n    <startEvent id=\"startEvent1\" name=\"开始\"></startEvent>\n    <userTask id=\"sid-14072E99-2BDD-4EEB-BA3A-92EE73696E39\" name=\"接待申请\" flowable:assignee=\"$INITIATOR\">\n      <extensionElements>\n        <modeler:activiti-idm-initiator xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[true]]></modeler:activiti-idm-initiator>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-9B93E7F2-F1B7-452E-B462-45E1C7C5026D\" sourceRef=\"startEvent1\" targetRef=\"sid-14072E99-2BDD-4EEB-BA3A-92EE73696E39\"></sequenceFlow>\n    <inclusiveGateway id=\"sid-54B96349-6739-49F7-BB3E-905F9A181488\"></inclusiveGateway>\n    <sequenceFlow id=\"sid-FEEEC218-9CEE-462F-92F3-78FE50A6EC32\" name=\"提交\" sourceRef=\"sid-14072E99-2BDD-4EEB-BA3A-92EE73696E39\" targetRef=\"sid-54B96349-6739-49F7-BB3E-905F9A181488\"></sequenceFlow>\n    <userTask id=\"sid-001C5377-49E0-4720-A1D4-C6B6528206A9\" name=\"部门经理审批\" flowable:candidateGroups=\"40283e816f92646d016f92705173001a\">\n      <extensionElements>\n        <modeler:group-info-name-40283e816f92646d016f92705173001a xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[部门管理员]]></modeler:group-info-name-40283e816f92646d016f92705173001a>\n        <modeler:activiti-idm-candidate-group xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[true]]></modeler:activiti-idm-candidate-group>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <userTask id=\"sid-AB0D67C6-8425-46DE-AB03-A8B21B5CD223\" name=\"总经理审批\" flowable:assignee=\"曹操\">\n      <extensionElements>\n        <modeler:activiti-idm-assignee xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[true]]></modeler:activiti-idm-assignee>\n        <modeler:assignee-info-email xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[caocao@163.com]]></modeler:assignee-info-email>\n        <modeler:assignee-info-firstname xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[曹操]]></modeler:assignee-info-firstname>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <userTask id=\"sid-11DE1894-54A9-4065-8AE9-C862A149E37A\" name=\"老板审批\" flowable:assignee=\"admin\">\n      <extensionElements>\n        <modeler:activiti-idm-assignee xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[true]]></modeler:activiti-idm-assignee>\n        <modeler:assignee-info-email xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[daffodil@admin.com]]></modeler:assignee-info-email>\n        <modeler:assignee-info-firstname xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[admin]]></modeler:assignee-info-firstname>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <inclusiveGateway id=\"sid-79F6FE83-E514-4037-AEC2-BA82329B78BA\"></inclusiveGateway>\n    <sequenceFlow id=\"sid-B3B6D06F-068E-4E8E-A124-FA433277B3D5\" name=\"小于500元\" sourceRef=\"sid-54B96349-6739-49F7-BB3E-905F9A181488\" targetRef=\"sid-001C5377-49E0-4720-A1D4-C6B6528206A9\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${money <= 500}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-F2E8AD2E-6F00-4E55-A6C1-19C2E361AC79\" name=\"同意\" sourceRef=\"sid-001C5377-49E0-4720-A1D4-C6B6528206A9\" targetRef=\"sid-79F6FE83-E514-4037-AEC2-BA82329B78BA\"></sequenceFlow>\n    <sequenceFlow id=\"sid-798CE0F2-35FD-4512-A41C-D5C6B8713510\" name=\"同意\" sourceRef=\"sid-AB0D67C6-8425-46DE-AB03-A8B21B5CD223\" targetRef=\"sid-79F6FE83-E514-4037-AEC2-BA82329B78BA\"></sequenceFlow>\n    <sequenceFlow id=\"sid-7D10ECA2-5A97-42D1-BAF0-28685612F579\" name=\"同意\" sourceRef=\"sid-11DE1894-54A9-4065-8AE9-C862A149E37A\" targetRef=\"sid-79F6FE83-E514-4037-AEC2-BA82329B78BA\"></sequenceFlow>\n    <userTask id=\"sid-3BA60A30-A1EA-4559-B16D-0F036D1BF99F\" name=\"财务审批\" flowable:candidateGroups=\"40283e816f92646d016f926a76fd0003\">\n      <extensionElements>\n        <modeler:group-info-name-40283e816f92646d016f926a76fd0003 xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[财务管理员]]></modeler:group-info-name-40283e816f92646d016f926a76fd0003>\n        <modeler:activiti-idm-candidate-group xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[true]]></modeler:activiti-idm-candidate-group>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-C3BF4E3B-F772-4230-82A6-86CF6BBC9F8F\" sourceRef=\"sid-79F6FE83-E514-4037-AEC2-BA82329B78BA\" targetRef=\"sid-3BA60A30-A1EA-4559-B16D-0F036D1BF99F\"></sequenceFlow>\n    <endEvent id=\"sid-F529486F-073B-47A7-9234-0651A8E08C34\" name=\"结束\"></endEvent>\n    <sequenceFlow id=\"sid-EBF7FDC4-8C12-44C1-B3FE-C53B644A9C50\" sourceRef=\"sid-3BA60A30-A1EA-4559-B16D-0F036D1BF99F\" targetRef=\"sid-F529486F-073B-47A7-9234-0651A8E08C34\"></sequenceFlow>\n    <sequenceFlow id=\"sid-E0AEA166-AFAA-4FC4-ABF9-DAACB61E90B4\" name=\"小于1000元\" sourceRef=\"sid-54B96349-6739-49F7-BB3E-905F9A181488\" targetRef=\"sid-AB0D67C6-8425-46DE-AB03-A8B21B5CD223\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${money <= 1000}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-62CEC576-8A1D-4FA2-96BF-63FF4A295A17\" name=\"大于1000元\" sourceRef=\"sid-54B96349-6739-49F7-BB3E-905F9A181488\" targetRef=\"sid-11DE1894-54A9-4065-8AE9-C862A149E37A\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${money > 1000}]]></conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_HighReception\">\n    <bpmndi:BPMNPlane bpmnElement=\"HighReception\" id=\"BPMNPlane_HighReception\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"80.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-14072E99-2BDD-4EEB-BA3A-92EE73696E39\" id=\"BPMNShape_sid-14072E99-2BDD-4EEB-BA3A-92EE73696E39\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"175.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-54B96349-6739-49F7-BB3E-905F9A181488\" id=\"BPMNShape_sid-54B96349-6739-49F7-BB3E-905F9A181488\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"374.5\" y=\"158.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-001C5377-49E0-4720-A1D4-C6B6528206A9\" id=\"BPMNShape_sid-001C5377-49E0-4720-A1D4-C6B6528206A9\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"520.0\" y=\"30.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-AB0D67C6-8425-46DE-AB03-A8B21B5CD223\" id=\"BPMNShape_sid-AB0D67C6-8425-46DE-AB03-A8B21B5CD223\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"520.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-11DE1894-54A9-4065-8AE9-C862A149E37A\" id=\"BPMNShape_sid-11DE1894-54A9-4065-8AE9-C862A149E37A\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"520.0\" y=\"255.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-79F6FE83-E514-4037-AEC2-BA82329B78BA\" id=\"BPMNShape_sid-79F6FE83-E514-4037-AEC2-BA82329B78BA\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"764.5\" y=\"158.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-3BA60A30-A1EA-4559-B16D-0F036D1BF99F\" id=\"BPMNShape_sid-3BA60A30-A1EA-4559-B16D-0F036D1BF99F\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"849.5\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-F529486F-073B-47A7-9234-0651A8E08C34\" id=\"BPMNShape_sid-F529486F-073B-47A7-9234-0651A8E08C34\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"1015.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-9B93E7F2-F1B7-452E-B462-45E1C7C5026D\" id=\"BPMNEdge_sid-9B93E7F2-F1B7-452E-B462-45E1C7C5026D\">\n        <omgdi:waypoint x=\"109.94999891869115\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"174.99999999999022\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-E0AEA166-AFAA-4FC4-ABF9-DAACB61E90B4\" id=\"BPMNEdge_sid-E0AEA166-AFAA-4FC4-ABF9-DAACB61E90B4\">\n        <omgdi:waypoint x=\"413.9988402061831\" y=\"178.44555873925503\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"519.9999999999911\" y=\"178.14271428571425\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-F2E8AD2E-6F00-4E55-A6C1-19C2E361AC79\" id=\"BPMNEdge_sid-F2E8AD2E-6F00-4E55-A6C1-19C2E361AC79\">\n        <omgdi:waypoint x=\"619.9499999999999\" y=\"70.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"784.5\" y=\"70.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"784.5\" y=\"158.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-798CE0F2-35FD-4512-A41C-D5C6B8713510\" id=\"BPMNEdge_sid-798CE0F2-35FD-4512-A41C-D5C6B8713510\">\n        <omgdi:waypoint x=\"619.9499999999546\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"764.5\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-B3B6D06F-068E-4E8E-A124-FA433277B3D5\" id=\"BPMNEdge_sid-B3B6D06F-068E-4E8E-A124-FA433277B3D5\">\n        <omgdi:waypoint x=\"395.0\" y=\"158.5\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"395.0\" y=\"70.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"520.0\" y=\"70.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-7D10ECA2-5A97-42D1-BAF0-28685612F579\" id=\"BPMNEdge_sid-7D10ECA2-5A97-42D1-BAF0-28685612F579\">\n        <omgdi:waypoint x=\"619.9499999999999\" y=\"295.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"784.5\" y=\"295.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"784.5\" y=\"197.9084901625321\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-C3BF4E3B-F772-4230-82A6-86CF6BBC9F8F\" id=\"BPMNEdge_sid-C3BF4E3B-F772-4230-82A6-86CF6BBC9F8F\">\n        <omgdi:waypoint x=\"804.0247370727428\" y=\"178.41666666666663\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"849.4999999999953\" y=\"178.21812227074233\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FEEEC218-9CEE-462F-92F3-78FE50A6EC32\" id=\"BPMNEdge_sid-FEEEC218-9CEE-462F-92F3-78FE50A6EC32\">\n        <omgdi:waypoint x=\"274.94999999996367\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"374.5\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-EBF7FDC4-8C12-44C1-B3FE-C53B644A9C50\" id=\"BPMNEdge_sid-EBF7FDC4-8C12-44C1-B3FE-C53B644A9C50\">\n        <omgdi:waypoint x=\"949.4499999999852\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1015.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-62CEC576-8A1D-4FA2-96BF-63FF4A295A17\" id=\"BPMNEdge_sid-62CEC576-8A1D-4FA2-96BF-63FF4A295A17\">\n        <omgdi:waypoint x=\"395.0\" y=\"197.44187392795888\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"395.0\" y=\"295.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"519.9999999999375\" y=\"295.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('99765f84-c5b7-11ea-8271-96e6f7651f71',1,'高级接待流程报销.HighReception.png','995fca42-c5b7-11ea-8271-96e6f7651f71',_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0Y\0\0\0��WC\0\0:6IDATx^��	�\\U�?��wd�mT\\�Q��q�q��n��� K��	*��(��(��������m�삊D4�&d;�����w͍�[�I��V��{��y~O��nUu���s�W�ޚ6\r\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�J)=`ɒ%\'����7o^\Z�	N��~�E��Ο?���\0\0\0S֒%K���Û�/_�V�\\���n����=~�.�mddd��s\0\0\0SR�p��ꎰL|�-[�bdd��s\0\0\0SRRa�C��adddU�9\0\0�))�)P����K<��\0\0\0��A�w޺,-�����,_�e��d|�t\0\0\0�1i:�q�\r��sI?������,��n/c��\0\0\0�1H���g�4�\\��̞�e��t\0\0\0�1i:�j��z�\re���2�h:\0\0\0��4.9���P&��n/c��\0\0\0���W4\0\0\0h�A��i�fC������=�\0\0\04� M����lO��L\\W�^�M\0\0\0\Zc���M7\\�.���=\r��,��n/c��\0\0\0�1H�!�|����U���E�\0\0����jU���z�qY\\׳��9�\0\0\04���w�rC���cz\Ze�ئz;[4\0\0\0h�Q��V�eW�O��ށ=��jb��֪��G�\0\0����tX���b�����\0\0\0@c�k:��a��m��\'�G�\0\0����t�664������\0\0\0@c�k:��E�\0\0���t�+�\0\0\04��C^�t\0\0\0�14�\0\0\0���W4\0\0\0hM����\0\0\0@ch:�M\0\0\0\ZC�!�h:\0\0\0��yE�\0\0���t�+�\0\0\04��C^�t\0\0\0�14�\0\0\0���W4\0\0\0hM����\0\0\0@�f͚���-��Wi:�M\0\0\0�7k֬�:�l>h:�M\0\0\0���tXg�A�!�h:\0\0\0��>M���M����\0\0\0@��4�)��yE�\0\0h�>;���h:���#2٩�\0\00f&��Q�q�ʂY5^q�w����=�Hw�uW���QG�v�q���7�9r�!�k�Y���^���~���<���?L�~x:���Ӟ{�v�e�t�g�u��Ї�6�l����o��?>������~wq�g>󙞟g���/���g���O����6�s^|����NK�]vY�;wnzӛޔ������7$V:�c\0\0�2�l��5J�m:,Z�(q��1�yLzЃ�^�����ۦ�;,���o/\Z7�|s���~����o}+=��,vү��bG=����Ooy�[ҧ>��5�����ٳg�[n�%]{�����}��G?�^����N:iͶ7�xc:�䓋�k^����(͘1��ⲃ:��M4G�ۜ}��E��Ӟ��\"��q��;n����Z$�#q��������;��~64��Ę\0\0@�L0�c}͆�x���!v�/��b��9眓.������{�w��]���p:�c�l�)�����:}���M+W�\\뾢��vۭ�����t���^��+\nb���^��b�A�����-[V����~�\n�x��?��i�M6I�n�iz�s�������������\"���{����ױ\n���:��Ӌﯾ��t�	\'͕ί.=��OM[n�e�D)��Ј��W\\���6h4ȉ1\0�Z�`6���\r��6\";�S�B!��w�����M���K\'�x�U�؁�9sfq�D�~�M�XE�<%=��Ny�C�,Ho|��C+��j���׾6]r�%k�O4\"�/.�\0q�H���M�Ȋ+җ����^{�!��G������\0������b��n��V4[b����w��	��F�׽�u��_�z��m�h:�c\0\0�2�l��4�.]Z4b���xEzֳ�����)���/M�Ë����>(o�$��� M�XE���h��#�<2���,v����n�)M�>�X�P~ꩧM��-=���OOx��Z���g?�8D����E��a_G�$R�9���G=�8��\roxC��!�_���sW�%��Ę\0\0@�L0�g<M�8ù�[� �C)bA��9bg=.��Hƹ�C)�<�̢�0H�!�8�I)c�h6Ī�X�)WXD���>\Z;�C�8X�dIq����GkV:���~�8��xDq��=�aE���6�,���k���:�����\r��|�;Ŋ���+���\r��91&\0\0P+��O�!�R�yb�;���@�`(�����8�!�ߐ���zkz�s�S��ϙ3�8GC4�>��b�\\�PM�Z!��\'��U���я~tz�+_�>��O��}��2���+���\'�[n��|qEyxE��\'żꪫ����s\rMrbL\0\0�V&��3ަC���[\'v����C\Zbe�[��֢Y��7ƧP���t(�V���~7}��_-N��LXW�!ι�Ї>�h̛7�8d�ҡ�m䬳�*_��E�������D����M�g<���+3���C�v�DӁ�\0\0��	f��۩ސĎw�t��������Z+b�A����]�8�!N����|e�e�V�J.,Α����}����K/-\Z���}�O����?_4^򒗤�7޸8�d|zD�O���/O?��O�������>�͋8L\"��9�0��~��%\'��T/���#\Zq�h��*�ί���W���k�,qb��}To?H4ȉ1\0�Z�`��x����\\�P&\Z\rGqD:��c{���q��������Ѕ�7�<=���-\Z�ە��|����.�Al���9�狨^�O�������J2��)�ێ5��Ę\0\0@�L0�g�M�7��Ę\0\0@�L0�G�!�h:�c\0\0�2�lM����@N�	\0\0���}4�91&\0\0P+���t�+��Ę\0\0@�L0�G�!�h:�c\0\0�2�lM����@N�	\0\0���}4�91&\0\0P+���t�+��Ę\0\0@�L0�G�!�h:�c\0\0�2�lM����@N�	\0\0���}4�91&\0\0P+���t�+��Ę\0\0@�L0�G�!�h:�c\0\0�2�lM����@N�	\0\0���}4�91&\0\0P+���t�+��Ę\0\0@�L0�G�!�h:�c\0\0�2�lM����@N�	\0\0���}4�91&\0\0P+���t�+��Ę\0\0@�L0�G�!�h:�c\0\0�2�lM����@N�	\0\0���}4�91&\0\0P+���t�+��Ę\0\0@�L0�G�!�h:�c\0\0�2�l�y��ݻr�ʞ�_��t���###���Lc\0\0�2�l�E�-]�|y��L|���GFF.�>G0Y�	\0\0���}�ϟ��o[�l�\n+&\'���������###�v�u�9��bL\0\0�V&��;��{\'w�9d�����k8�c\0\0�2��dL\0\0�V&�\0��	\0\0����1\0�Z�`P2&\0\0P+L\0J�\0\0je�	@ɘ\0\0@�L0(\0\0��	&\0%c\0\0�2��dL\0\0�V&�\0��	\0\0����1\0�Z�`P2&\0\0P+L\0J�\0\0je�	@ɘ\0\0@�L0(\0\0��	&\0%c\0\0�2��dL\0\0�V&�\0��	\0\0����1\0�Z�`P2&\0\0P+L\0J�\0\0je�	@ɘ\0\0@�L0(\0\0��	&\0%c\0\0�2��dL\0\0�V&�\0��	\0\0����1�VH)=`ɒ%\'����7o^\Z�	N��~�E��Ο?���C��`��\Z;�Qcɕ1A��!j$0t�B�?�B��/_�V�\\���n����=~�.��S���>G4�	f����5�\\���FC��(4�$�e˖�������a��>jl>Qcɍ1A��)j$04��Mg9����)�����a��>jl>Qcɍ1A��)j$04q,W����%���sDs�`��\Z�W�XrbLP#s�\Z	Š���[��%����E�븬���/�}��`��\Z�W�XrbLP#s�\Z	� ���[nH��sH����g��eq]u{{�f3�l56����Ę�F�5�A��u���)�e�_|f��2�(��f��>jl^Qcɉ1A��-j$0��_-�XO�/�U���G�o6��Qc�\ZKN�	jdnQ#����_>rXO�/�U���G�o6��Qc�\ZKN�	jdnQ#��P��b�l&����5��ҩ�bXOTo�tjd^Q#�����Y��E�L\\W�^�ž�4�G��+j,��S����d�f���N��+j$0�����lO�/�U���G�o6M��Qc�\Z�d��}\Z\r�]��ȼ�FC1H�������?����eq]u{{�f�th56���L�X�Ч���UA��+j$0����~�b�U���E�o6M��Qc�\Z�d�\r}\Z�\\��ȼ�FC1P�_�*]u�q=�>.��z��1G�o6M��Qc�\Z�de�����B��+j$0�+�w�rC���cz\n}��.���N�ž�4�G��+j,9��vh�*��F�5�Q���Ui�U��/�w`O��&��mu��ž�4�G��+j,9��vآz}���yE���_�__Wy��6�?�}�i:��\Z�W�XrQ�v�^�6jd^Q#���W��*���m��d�(����	f���yE�%��aƌ��{T#�\Z	E�b_-������Q�kz\'�5�G��+j,���F��c���F�5�~�^&/�}#\r�N�_�o�\'�m���5�LVS#�\Z	�b�W��)\'�儲�=\r���5�Tǁ����F�5\n�>�(��2�Dr��i 56���L����h�7�\Z�W�H`(����7��&�뻞�Pc�\Z�$Z_�_����F�5��K)����?�M_��׾��|`��r�=��7N�6w��?����w.������w�����ӟb�W�Ft�8�vLajl^Qc�$���A�k52�����1cƦ��й3g�<���E�\\�����h��sc��m�PJi��}�{�u�!��qΜ9��c�M\\pA��o�n�����>.��w�u�{��g�%��۫��������Oy:a���b�ؼ��2	6��o��S�\Z�W����v�m_>k֬E��fQܮz_d�.����_��~����??�s�=E�a}b����xǟ��s�KgΜ���}��}^Q짴�N�z;�\056���L������n�Q#�\Z9�؟�5k��}\Z\n���f$�t�s�9���{:묳ҟ���j_a q���N;�t�v�m�U�qP�s�b?e�w�8�ۓ)56���L������~JP#�\Z�߶�n�eg_����;�>򑏤y���]�����]��ps�_�1�`���>��rʅ{�G��+��\"�Q�Ϝ9s�={����k;�>�(�SR���}:yY\'GurQ\'�u�m����q}lW�w?Lqjl^Qc� ��q�52����f͚��v�m��i���ۧ/~��[n��r����q���ß�~����s��M˗/�>g�����;ߡ��6�>�(�SN�	aԘK��e2���v�5���1���yE�e���ƅQ��yE�\\��k\Z{�w���~W��H�.n��x�_:I�;］��P�\n����޻�;�2cƌͪ��V�}^Q짔�D�=�w9H�vq�P�_�056���Y�~�C��+j�_����ٳo)�tP��۪��$n���x��~��<q�+��t������^���J��+���Q�\0����ikO���N^���Vo���qy\\߽}ܾ�̶Qc�\Z�U�qa\0jd^Q#�j֬Ygu�poá�SY�pV�����>��)c=i����̙�{[��}^Q진~��;Y\'u�I������]���~J��)F��+j,Cү^�F�5�/V,�s8�������u���~�����������ˉ���8�>�����F�}^Q��o���uO?�u� b��۷�X�6Pc�\Z����ƅ��yE����O,q�a���Z�`�t\"�w�yo�m���=��S}>�\"g��uƌ�V�����.�d���U�}^Q�\'Ơ���~�8��%��:1�w�Ƣ�����V��|*\Z�oH��+j,��5]ѯ>V�w�F敦��A�&c���ͽ�����S*6T�o��i�����l�p�	#�{l���|��Ϝ9s�������#�|q)�y���>��>��6���7+\'�q,�־z`q��cy�~����L�A���ؼ��2�A_�]F��ƅ�����y��5r����?,���G?Z݅�U��XM�/������:����`q�	>���4E׋j�/.�>�4���b���j���窗�8	�x�������Z����oH��+j,��5�ں�qa�A~�jd^iz��o���)������.d����~���f��}��%K�T������}u�ɽ���4E�U��b�W�^�s��u���1m���!�p����}�h�i}?���N߿!56������k��kz���qa�>�˞ߩ\Z�W�^#��-��Mv����|���q�]?�h�q�2w��{o�����0T7�t��\'�����}^L�/.�>�4����롚�o�����?��\ZRN[�nC����ZWm�v��&}�f�Y0K��.j,���\Z�Ƹ�����Y�F敦��>��,�dE����O���{]�q�\'��ӟ�T}���x���Ck]��R}~dr2cƌ��F�g=�Y�|WM�����6Tܾ����uٿ��՟[�\Z�W�ϏȠ1.\'jd^����9��?���z������w��O��$U�����ͬw��/��,�5�K��wߴ�{�;���c�I�vX��z���q��MozS���P|���{�������o�ٶ��w޹���;��.�9��׺���>���E]Գ�D���\\�y]�{}�Αw�Z���N�������O?=}�+_IK�.M�w^�n���\'>��\"�Ї�6�l����o��?>������~wq�g>��ǚ_��i�}�I����{��Nl��.���/�8�v�i��.Ks��-j���_߳}QcM��r��� �׸�Z��e��t�5��o}�[)>1/���^����O}j�uqy�z�Hl���<$���/N|pQ�bnz���l[&�Z8Z�^#��-��Mv����|���V:L�Τ��a3S�)?���cg��b�6��~���*���㎋3���?��镯|e�b�-��>��5���Hs��Io{��ҏ���?��,���[�s�UW�����+\n{45b@�ۿ��\"��[���{�����k��B�򗿼��(�ݓ��������/��/E�_׀Rw�^�s1��c��\'r��m�A���]c���e/+\Z�GqD�D�ה�:��7�9͞=����k��6��ř�_����N:iͶq��O>����y�kҋ^���]޷����etPq�8`�m����2O{�ӊ�����w�L��k�h.��_�җ�����uE�e4������V�w:�\ZYM�����1_���Ŝ3R�M����7�W����7��M���\r��+W���T�����5r���Y���\\x������z��\Z|��u���MT��	n����=�<����w�#}�,v����7��?|��D!&����.�m�ݶ�\"��x�/&��}w�:&�1�\\z�k��.(�Ƅ�������b�d�E��<�0��b��A_��kB�,�-5���0k�~���nF�|��_�^�җ\r�h�~�k_[k�xG�3��❺h�^x���Q_���I��eˊZ��~��Es6\Zěl�I�t�M�s�������w�m�1#���{�����?�������bUF|��W�N8a�x�ԧ>5m���;�e���ƶ�n���⊞��x��2�A_ӫ��V�w:�\Z�/;�Sz��P4O���g�h|�#)�eM�}���%�\\Rl�jժ����Gu�QE����ע�F�z�S������A�&g�����>��c�=��<��{�}V�?u]/�nU����0�XmKȢ�]���.\nmL`_�洛��E7��C)VĄ::������{��tyhƕW^Y�ǣ����8�2_?�O,&�1y�m��_��x���|g1�� ��<����߾T���V�?�JӋ}.}}tmb���[jп�a��#�<��U݇�E�u�wL�qu�e�<}�S����˃��-X���4ǡ[m�Uz�k_�f�]&\Z�ŋ�8.&�qH\\�D:�bŊ��/�X���G>�E�먣q�r�X������xg0VN��~�+���nǲ���=���F�e4�����V���\r�;f��ؑ��V�p�Fj��&�\'�X���)۽�O���ͩX-�����|.�)���sߑ�RGK�k� ��X6��4Lq��c5y�4������=��b(:�sc���}�ſi�gi��.�qN�X���8�)�W�%kQx��ƒ�(Ա,-��>._�|y�%^�p�Z�����-:أ�t���l:�z��}�`9��s��c��U��5�\\��s\r3M/�S\\�	�}:�d�_\'�\'u]�!�v�}������=.S�0klr5��t�Z+��ˢ1�D� V\'D�\"��1���o��4}��b5C�����Z���!=���/��^���g?�X����t/U.�u��H�珟�Q�zTq�G���^4L�	2�ګ�R�~�ٸ��Y#�%�N4������1���8����Ċ�X}�acuX�<�m#qxp�V�C|��B--j�i���O�7\Z�w��0��v�A�ǉǳ_:A��g��M�!\'�x�w��U�6��b�8v槭.ұs\r����>�D6��wڢ��!�Q�Nq�+���qn�M$\n������_G\"#V:Dq���FG\\Ιg�Y$q��reD��sFLD�����us�p�u���o�}p��c\nf���A�++��J�X�p衇��m,�]q�[4�����	o��&\Z\r��Ѩ�z\Z��h\0��8��\\���H�c�D��xDQCcR��7�l�b%Y�]�+�:���P��|�;E-�^R\\���5�!�W��\Zf�엘gv6��=�)�}Q3�iu\'jU��$c�\Z绉�ll�r��������ؘ�F3�|c,2j�hQ#�\"��_��������-�~���^��w��O���I�:�]牽�S^^��h��}��d�8d!v��P�8�8��d��q�q�}�H�8�&DLzc��_D�����ȯ~����vx�^��bi\\�}�t����_�U�h>�uѤ�ǈ�v��2�(�SB�	���֞ �;T�t]�O\\��NV$���q�b�Yc���h��F� �X�2V���g?[�]��z�s�S���!i�|��B�i=劇j�w�bUXL�cb���Ƥ;��ӽ}4�c�]]R��\'?y����;w�\\9�\r�K���8q[4}�g��\\�\Zː���ƅ�F������X���b.\Z�����k�Y՝��Q��As�x�:>�\'\Z�q�Zu��PG�\Z���X6��������K9.q�g�.W9D��~�D���]z�Yg�[}bjt�Gy|��=���m5�ž\\Z�6�i,����U�zU�3�w\0q\\��V�k:DQ����u߶�wU��׽�-�qLs<~����q�bMFQ��ݷ�3��=Q�cq�$`���q��������X�H�>�\'T�)jX5v����\'L���R��\"}��,Ϊ+ ���j���Ĺr���羚~���I��8�u5��>��-&����+NzV�t�n�:����#�u����\Z]N�����g<���GC%~��W���Q�nЯ63qR�h8Ĺ��ou�|�i��C$�_��<T�]�zW�3\Zo�U��\n�p�����eS �;�o�q?{��=]��N�3fl֙\0���a�pO�<���q���V���0gC�.mLb���b)Z�6m��\Z� �\'2��r��>�\"�?^�������h}T&��q�F,���r��{�Ct��Y��0��O)�	`L��l\r��]�\'�m5�\Z�+N6\'؍C#��A���E�l쑸,V�Ų�XgN�w���\'��x㍋C�������//N��҉���}D�7��1q.���Xr�EV�H�����#1D��ǻ�����*�7���u$N������5�!��o��z�F�+�\",>�=>�l���E�u�ҥ�y��D�ݟ<Q&jn4\0��F͋�9��(�n[M��p�������ƛ��@|��xq�<p�\n�������ު��yW�_�΋����t�m��g&7�D�h����?�c��\\���8�Y�>����(�ݷ�㒻�M���?�q�+����\\W�/g�h6Dg9�%�s�9��:��w��aF��r�M��\\:�w�/�]c��e�56��V��z�c[Ld��Fʏ�,υ3Z������<_D��H��X-\r������iB����m�Qc�\0��qaî�݉�j�#,Ǎ��(\"1����gm�	�M�hD��C+�U�ݟD1Zr���E�\\[�7v��Խ�a��Z��*+�d�t�͞={םw����V<�^�pC\'�T��&������OI�&�q���x��\\��:�n�_&��o|����<9���5�	ү��P#�\Z�+��qXM�r�O���b��s8��?��9���;�p�駟~�XO.\'�\\}�u��S��b?e�wb8�ۓ)56���L������~JP#�\Z���7w5\r�Ox�CceJ�7���>.��>����K33s��\'͞=��9s����?����sO���_g��\'�x�7:O�U���S�o�B��+���6�	�Xo����5�	6��>��M9jd^Q#G���_Yi lh��l�ǖ,�~��o;��~1o޼���__�bŊ;SJw����ߒŋ���N;}�}��?����Y?�>�(�SކN7t{�56���L�\r������F�5r����>\r�u�~�T2cƌM;O�ܙ3g�����N�[�Dƿ��|nlW�-�)�yE�o�A\'��n����5�I2h�t��P#�\Z98�������7��&�뻞�Pc�\Z�$Z_�_����F�5\n�>�(��2�r��i 56���L����h�7�\Z�W�H`(����7Nu\"Y���Sc�\ZK��@��VQ#�\Z	�b�W�F*\'������˶Rc�\ZK&����yE��B��+�}c�8�P�\n�M��+j,��|����h���ﱵ\r��F�5\n�>�(�����C���yE�%��`��3Z���F�5\n�>�(�ͦ��>jl^Qc�Ag,�b�G�E��^�&jd^Q#��P��b�l����5��*���Â��m�F�5\n�>�(�ͦ��>jl^Qc�l�U�_�F�5\n�>�(�ͦ��>jl^Qc�l�U�_�F�5\n�>�(�ͦ��>jl^Qc�L��rh�j52����P(�yE�o6M��Qc�\Z�d\Ze�C�W;��yE��B��+�}�i:��\Z�W�X&K�d��h�f���N��+j$0�}^Q�Mӡ}�ؼ��2Yb%C�&C5�[�F�5\n�>�(�ͦ��>jl^Qcɉ1A��-j$0�}^Q���}�ؼ�ƒc�\Z�[�H`(����7�	f���yE�%\'�52����P(�yE�o6��Qc�\ZKN�	jdnQ#��P��b�l&����5����ܢFC���ž�L0�G��+j,91&���E��B��+�}��`��\Z�W�XrbLP#s�\Z	ży��]�reOё�O�yX�)�����a��>jl>Qcɍ1A��)j$04�-Z�|���#�k����N�����&����5���Ȝ�FC3��m.\\x۲e�V�4ON:��eW_}�7;���N��>G4�	f����5�\\���F\"\nLt6;�;��	O������7�	f;�k{�k\\�����dɘ���\\�\ZU#\'\'j$\04�	&\0%c\0\0�2��dL\0\0�V&�\0��	\0\0����1\0�Z�`P2&\0\0P+L\0J�\0\0je�	@ɘ\0\0@�L0(\0\0��	&\0%c\0\0�2��dL\0\0�V&�\0��	\0\0����1\0�Z�`P2&\0\0P+L\0J�\0\0je�	@ɘ\0\0@�L0(\0\0��	&\0%c\0\0�2��dL\0\0�V&�\0��	\0\0����1\0�Z�`P2&\0\0P+L\0J�\0\0je�	@ɘ\0\0@�L0(\0\0��	&\0%c\0\0�2��dL\0\0�V&�\0��	\0\0����1\0�Z�`P2&\0\0P+L\0J�\0\0je�	@ɘ\0\0@�L0(\0\0��	&\0%c\0\0�2��dL\0\0�V&�\0��	\0\0����1\0�Z�`�OJ�K�,9������y���ȈLp:��{-Z�t����T��L�\0\0je��>K�,���oZ�|yZ�re���e�����/\\�𶑑����Lc\0\0�2�l�X�;��a��,[�l����E��&�1\0�Z�`�ORa�C��adddU�9��bL\0\0�V&��������%���s�Ř\0\0@�L0�gЦÝ�.KK.>>-�����qYu;_4ȉ1\0�Z�`�� M�;n�!]~�!��������u��e��t \'�\0\0je��>�4�[|FOá������^�MrbL\0\0�V&��3H��W>��l(�U���GӁ�\0\0��	f��t�|䰞fC������=��Ę\0\0@�L0�G�!�h:�c\0\0�2�l�A��i�fC������=��Ę\0\0@�L0�g���U�~���P&��n/c��91&\0\0P+����p�\r��˿hO�!.����أ�@N�	\0\0���}i:D~����4��v2�h:�c\0\0�2�l����V���;�����u=�˘��@N�	\0\0���}��t��ҕ���p(��6���آ�@N�	\0\0���}Fm:�Z��]5?��{�4\Z��mb[��MrbL\0\0�V&��ӯ鰾�\r�Ū��GӁ�\0\0��	f��k:��a��m��\'�GӁ�\0\0��	f��k:T	������t \'�\0\0je��>��2y�t \'�\0\0je��>�yEӁ�\0\0��	f�h:�MrbL\0\0�V&���W4ȉ1\0�Z�`���C^�t \'�\0\0je��>�yEӁ�\0\0��	f�h:�MrbL\0\0�V&���W4ȉ1\0�Z�`���C^�t \'�\0\0je��>�yEӁ�\0\0��	f�h:�MrbL\0\0�V&���W4ȉ1\0�Z�`���C^�t \'�\0\0je��>�yEӁ�\0\0��	fst���lQ��J�!�h:�c\0\0�2�l�x.Wg��M����@N�	\0\0���9���l>h:�MrbL\0\0�V&��ѧ�з���W4ȉ1\0�Z�`6G�fC5E�A�!�h:�c\0\0��c*\r��C^�>?\"���8\0\0��҂Y�^1o޼�����#�,�?�S�7���t�m������v�y�t�w���K.I/x�����t����w䗿�e�g�}ҧ?������.���v�i��.Ks��Mozӛ���_߳�0c�\0\0\0�[_��4�M���+-\\�0u�Qi�wL�7����\'��<�9�����ǧ뮻n�ۼ�mo+���<���//���}�^��W��N:)-[�lͶg�}v�����iO{Z���3f��;n���u�]��q���_�җ�&G���;�\0\0\0do}͆�D7\"K�,)\Z�0x��^��>����������gk�����	\'��6�x��0}�����0}����2e����}�{_����?�az��ߟN?�����AzPq�O}�SӖ[n����o�i:p�i�m�MW\\qE�c\r#�\0\0\0do}͆�D6n������r��k^�bg�����b�ë^��t�UW�?����o.V*<���N���/������o�>��bu{�-Z��1V�X����/���ګ�摏|d��:V1s�1k����C6�~v�m�b�D45�w��?�FmT4E������_�M\0\0\0\Zc\"�+W�,�X�|���>��ϧ�6�,}�C��>��i��es V�!\Zq��hP\\y�k�f�=�(_��~E���޻H�1v�i���G=*͞=;��\ro(V:ġ[m�U��kz�f4\0\0\0h��l:t��K/-V:����}:��c��\'�\\���7���Z�}��^s�8���������b�h:�	��M�G<��j��=�aE��hn�m��.����җ����g=�Y�;��N���>��z�Î�\0\0\0�1M���M7ݴ�ُFC4��hB�a�vK�.-����>�X�p����2�N����/\Z݇V��O���C���\'?��iΜ9k��U\\pAqEyxE���^?ӭ����8È�\0\0\0�1�M�؁���>�v�a��y�fx���?��t��\'v\\�xqq��>���C\"�і�4���&�lR|z�����8g�uV��z�}�-_�����7\Z\r�M�<0=��H�m�]q��8�Cw3d��t\0\0\0�1��ODN=��4s����#��,X����/���mc�����]�zWq��:(}���N����^|���_�s�ebUD�zy$V/D�c뭷No}�[�O���J�U�Ј�#qb�8��z�aD�\0\0�Ƙ��C|e|ZŴ�O�(��|f�m�*bE�������.�*��X�wx�+_�~��_�<F$��T/�ħWv�a�Grz��*�hz̛7�gۉ��\0\0\0�1YM�M\0\0\0\ZC�!�h:\0\0\0��yE�\0\0���t�+�\0\0\04��C^�t\0\0\0�14�\0\0\0���W4\0\0\0hM����\0\0\0@ch:�M\0\0\0\ZC�!�h:\0\0\0��yE�\0\0���t�+�\0\0\04��C^�t\0\0\0�14�\0\0\0���W4\0\0\0hM����\0\0\0@ch:�M\0\0\0\ZC�!�h:\0\0\0��yE�\0\0���t�+�\0\0\04��C^�t\0\0\0�14�\0\0\0���W4\0\0\0hM����\0\0\0@ch:�M\0\0\0\ZC�!�h:\0\0\0���ͻw�ʕ=;�2��<KGFFVU�#\0\0\0��-Z�t���=;�2��kN���\0\0��4��m.\\x۲e�VX�09��ޗ]}���������\0\0\0LY���wrw�S@&<�{�߿�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�T��1|={Ԕ�5\0\0\0\0IEND�B`�',1),('e5381dc3-c191-11ea-8e4d-96e6f7651f71',1,'员工级别-报销流程.bpmn20.xml','e5381dc2-c191-11ea-8e4d-96e6f7651f71',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"Expense2\" name=\"员工级别-报销流程\" isExecutable=\"true\">\n    <documentation>员工级别-报销流程</documentation>\n    <startEvent id=\"startEvent1\" name=\"开始\"></startEvent>\n    <userTask id=\"sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8\" name=\"报销申请\" flowable:assignee=\"$INITIATOR\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[true]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-4A04755F-E8EB-4ADA-959C-69CDD2B166C2\" sourceRef=\"startEvent1\" targetRef=\"sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8\"></sequenceFlow>\n    <userTask id=\"sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A\" name=\"部门经理审批\" flowable:candidateGroups=\"40283e816f92646d016f92705173001a\">\n      <extensionElements>\n        <modeler:group-info-name-40283e816f92646d016f92705173001a xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[部门管理员]]></modeler:group-info-name-40283e816f92646d016f92705173001a>\n        <modeler:activiti-idm-candidate-group xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[true]]></modeler:activiti-idm-candidate-group>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <userTask id=\"sid-7C468FA0-CF11-4C38-80C7-1CBAC3CAED79\" name=\"财务审批\" flowable:candidateGroups=\"40283e816f92646d016f926a76fd0003\">\n      <extensionElements>\n        <modeler:group-info-name-40283e816f92646d016f926a76fd0003 xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[财务管理员]]></modeler:group-info-name-40283e816f92646d016f926a76fd0003>\n        <modeler:activiti-idm-candidate-group xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[true]]></modeler:activiti-idm-candidate-group>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <endEvent id=\"sid-B637838A-8E37-481C-8131-A50DEC3D3812\" name=\"结束\"></endEvent>\n    <sequenceFlow id=\"sid-39209A63-834F-4027-9105-032D12A10F23\" name=\"提交\" sourceRef=\"sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8\" targetRef=\"sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A\"></sequenceFlow>\n    <sequenceFlow id=\"sid-9A6178EA-6108-4D9B-8310-3C5F078B7B03\" name=\"同意\" sourceRef=\"sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A\" targetRef=\"sid-7C468FA0-CF11-4C38-80C7-1CBAC3CAED79\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ outcome == \'同意\' }]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-DF0CDE91-3C56-4068-B6F6-02FB82B40359\" name=\"同意\" sourceRef=\"sid-7C468FA0-CF11-4C38-80C7-1CBAC3CAED79\" targetRef=\"sid-B637838A-8E37-481C-8131-A50DEC3D3812\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ outcome == \'同意\' }]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-9F5A558A-4B27-4FB6-9225-7BEFD35F952F\" name=\"退回\" sourceRef=\"sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A\" targetRef=\"sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ outcome == \'退回\' }]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-58CBF731-1CED-43B2-A876-AD1B6BCB8365\" name=\"退回\" sourceRef=\"sid-7C468FA0-CF11-4C38-80C7-1CBAC3CAED79\" targetRef=\"sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ outcome == \'退回\' }]]></conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_Expense2\">\n    <bpmndi:BPMNPlane bpmnElement=\"Expense2\" id=\"BPMNPlane_Expense2\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"40.0\" y=\"103.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8\" id=\"BPMNShape_sid-9DD8EFB6-34DC-42FE-BB36-D21E1DB327E8\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"135.0\" y=\"78.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A\" id=\"BPMNShape_sid-C34E2DA6-7A08-4D27-ABA8-79B6C63FE53A\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"340.0\" y=\"78.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-7C468FA0-CF11-4C38-80C7-1CBAC3CAED79\" id=\"BPMNShape_sid-7C468FA0-CF11-4C38-80C7-1CBAC3CAED79\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"545.0\" y=\"78.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-B637838A-8E37-481C-8131-A50DEC3D3812\" id=\"BPMNShape_sid-B637838A-8E37-481C-8131-A50DEC3D3812\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"740.0\" y=\"104.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-39209A63-834F-4027-9105-032D12A10F23\" id=\"BPMNEdge_sid-39209A63-834F-4027-9105-032D12A10F23\">\n        <omgdi:waypoint x=\"234.95000000000002\" y=\"118.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"339.9999999999998\" y=\"118.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-9F5A558A-4B27-4FB6-9225-7BEFD35F952F\" id=\"BPMNEdge_sid-9F5A558A-4B27-4FB6-9225-7BEFD35F952F\">\n        <omgdi:waypoint x=\"390.0\" y=\"157.95\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"390.0\" y=\"221.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"185.0\" y=\"221.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"185.0\" y=\"157.95\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-9A6178EA-6108-4D9B-8310-3C5F078B7B03\" id=\"BPMNEdge_sid-9A6178EA-6108-4D9B-8310-3C5F078B7B03\">\n        <omgdi:waypoint x=\"439.9499999999582\" y=\"118.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"544.9999999999998\" y=\"118.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-4A04755F-E8EB-4ADA-959C-69CDD2B166C2\" id=\"BPMNEdge_sid-4A04755F-E8EB-4ADA-959C-69CDD2B166C2\">\n        <omgdi:waypoint x=\"69.94999891869115\" y=\"118.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"135.0\" y=\"118.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-DF0CDE91-3C56-4068-B6F6-02FB82B40359\" id=\"BPMNEdge_sid-DF0CDE91-3C56-4068-B6F6-02FB82B40359\">\n        <omgdi:waypoint x=\"644.9499999999747\" y=\"118.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"740.0\" y=\"118.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-58CBF731-1CED-43B2-A876-AD1B6BCB8365\" id=\"BPMNEdge_sid-58CBF731-1CED-43B2-A876-AD1B6BCB8365\">\n        <omgdi:waypoint x=\"595.0\" y=\"78.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"595.0\" y=\"32.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"390.0\" y=\"32.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"390.0\" y=\"78.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('e5462784-c191-11ea-8e4d-96e6f7651f71',1,'员工级别-报销流程.Expense2.png','e5381dc2-c191-11ea-8e4d-96e6f7651f71',_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\n\0\0\0�\0\0\0�\n��\0\0\"�IDATx^���Tu��qM+����أi�ty�_�.�=����X6�P)�J���fԖ]��R)	��h�H,�\n���@�\"�,˂������i�v���r�^f�3��z��0sffwv>�����٣�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Hh��Ꭲ�t��\0\0����\0�\0\0�	4=@:d\0\0dM��\0\0�@��Cf\0\0@&��\0�\0\0�	4=@:d\0\0dM��\0\0�@��Cf\0\0@&��\0�\0\0�	4=@:d\0\0dM��\0\0�@��Cf\0\0@&��\0�\0\0�	4=@:d\0\0dM��\0\0�@��Cf\0\0@&��\0�\0\0�	4=@:d\0\0dM��\0\0�@��Cf\0\0@&��\0�\0\0�	4=@:d\0\0dM��\0\0�@��Cf\0\0@&��\0�\0\0�	4=@:d\0\0dM��\0\0�@��Cf\0\0@&��\0�\0\0�	4=@r���_���v�\\�$�:\0\0���DH�9���������nԨQ��\0\0J\n �\r6��:����,//�o\0\0P2�(\0GVWW7���-�\'���������\\.w��-\0\0@I`�\0�,���а�s��A�UTT\\�o\0\0P�(\0=����֟$Df͚�gذa���\0\0(*��`�&G�%�퀬���?�����yZ[[��0aº���c��\0\0�`P�gb�W�; �6o޼Ɵ�֭[����|�[\0\0����<�V\0O.�;f������o�����٩���\0\0\0(\ZZ1�3A`5ȣ�����\'1{\'M�TÊ\0\0(	Z9�3I`5��܃9s�l�g�U�V�d�a�Q\0\0\0%��U�2;\0GUYYyڦM��������***��G\0\0��x�\n�&\0=�>}����yB�.�s��-\0\0@Q�V�������E��E������An��\0@I�V��t5q��󚚚666��#G>R^^>��\0\0�$D�\n��\0�1cƃ���Z���_\0%�9���7�qŊ/^�-ZD���}ٲe�jjj��?��T2���Y��).����s熙�W��b(2�W���O���\Z\Z\Z����݁���w=�K�.m����l!3�_d���Jf�m���b)2�W��G��?�P������`\0_���`��Sd�8�;Ef\0��e�b��SJ��C0����#�Bf��)d�N�\0���E �����G����*2c��Ud@bI��Ի��������ҿu��շb\0����*2c��Ud@bI�}M[ݚ�U��;�qX�2]�oO����#3����Gfl��X��ɵ�w��ڲ��.�S�/p�Ȍ�\"3��[Ef\0$�d\0����]�t��=��b\0����*2c��Ud@bI�5��t���u��T��>2c�Ȍ}d�V�\0�1��*p�Ȍ�\"3��[Ef\0$�d\0קO�wT��ߞ�}1��Gfl�����*2 �$�c��������z_���[Ef�#3���\0H,�\0�k�ܚ���e��e��ߞ�}1��Gfl�����*2 �$��n��.�.��V���[Ef�#3���\0H,�\0���[~}�\\��.�S�.p�Ȍ�\"3��[Ef\0$v�\\����u���u����+p�Ȍ�\"3��[Ef\0$��\0�����q����.��_�F۲ק��\0n��Ud�>2c�����\r�Gڻ�]�ק��\0n��Ud�>2c�����\r�I��tW��T�b\0����*2c��Ud@b�pPN[��Qɋ�>2c�Ȍ}d�V�\0�����+p�Ȍ�\"3��[Ef\0$�\0n���#3����Gfl����b\0����*2c��Ud@bඊ�>2c�Ȍ}d�V��$��3V�X�3g�=u����.�l��q�ڇ�Ǝ{��K/�\\�aڴiՕ��\'��G~ඊ�>2c�Ȍ}d�V��r��k��v�a�n���I��_Wv\\>V���ͤ`�p�]w��������G�v�]w�������?�v���D_�]��G�\Z�6~���\\p�Y���pඊ�>2c�Ȍ}d�V���zz0X�1)HZ�t;��2#h�/�6m��K.�ĭX�µ����#�v�~	�.�������d���_ඊ�>2c�Ȍ}d�V�[ԣ\r��<��4� S�n���p��[ƌ��ϟ�Z[[��@\"��n���?U^^~��8`\0�V���[Ef�#3����1t��3��tO��?��s�5�\\�/^���]�뵝7Yح�������s���Ǹq�ܣ�>zx��K��ѣG?=bĈQ��e��b\0����*2c��UdƆ��LZ�F�����p�\r����oc��v�^��M�~��*)ZI;v�khh�>��UVV���l+p[�\0n��Ud�>2c�����XI�$\\|�Ů���o]��t��d�d{��˗_�IB�$���m?��r��)�cg��b\0����*2c��Udfp�1bDS��_~�容��oYS��u?��®��u��󸫮�j��)H���k\n~Aw���Uඊ�>2c�Ȍ}d�V���4���+	}�$Dt?���|���ڂ~�O7���I��G��3�\'�\0n���#3����Gfl�<��yNBo7��/~�B�������+���>Ҵ��^�a~��}d��b\0���ت#efʔ)��/Ca�[Ef�zϨ�׉�A�[U(�^w��埿��������3�=��W�ǒ����}��H8�)��.3۷o?i���kV�^}��+��nYYٱ�6�2S�Ef�_�,t���v5��hӤ�n���7�ѩ�%���|�͋��i�ԩk�\r6��^JEl6�㋗�Vu7�c����,?3��~Lmm�---�{���͙3gkee�i�m�7d�8����$YP�m���}/z���?z���u�M���P�E�����\r�����R*b/�_����Q8d�8+�����!\r\r\r;��>�iӦ�ӧO�S.�;>�;E�,2���d!���������~���}/���N�<y�ƍ��s@�_�~S��=�/�\"ϋ6�V1Q<y�Bf�����`Æ\rw&9|�=�fߤI������d��A����\']�|} �|�{^��{(�^w�ر�w����k׮}�����^JE��_዗�V1Q<y2��1XZ�nnn���G���tpƌ�r�����ɓ�Ȍ�\"3�/�k�/e�1��@�����c���.:���*x��y~��+p[��~({Ef�Զm�\\uu�kll��#�mt[��K��;Efl�@�������}w�3f̡��]�v�ܹax)̲��(c�d� .	�;�q#G�t6lp3f��g��K/�ԕ���_w��q��S�Lq���7�ꩧ�\n/�mT���a��Uee����y;��We��n��흗���?o�r��.��XQ<y�2`��k���������O?�n��~�����;�}�_tUUU�\'������G���?������w7m�4w�W�/�0����~��_}���s�q��ݍ7�f��_�zx�O��.�Ookݺun����\'?�I���m�}>����ns��׿�رc����e˖.ۧ��s��o��]SS�������Q8�\Z�������:�����\'+��4��?��������?�����t�ʿ�J����C�P�/�f��_��{�v�6*H[d����@�,_�F�t�[r+\n��ށ>^��{��R8n�=�X�\n=�O�0��\Z5J�~��|�+a�r5�j��4E�jr�O}J��{�����縉\'����~���`~��wN�|��p�7n\\8�?�y�K��җ�6U?�p��kp���>��p��v\'�|r�8�~��w�yOo�]LO�2�l�2w�UW�W����/x���>>�^ך��_\r\'\Z��?��ϰ�y���6z�뵫�o��k;�����ƈ#�ۼy�v����qꩧ�9s�tn�I�������O~�}��tA~����/o�	MtM�ՀE����%�������_�Ϭ̫4�������Ì���\'mE�)//\ZL�\Zz:1����!��<�[����E:��L��Q\n*�[��躠A˿�2���}�}��wd��W4�ؿ�a�Z�@�\"3�/I�s�B�}��߮-���z뭷/�3���Ӌ5�P����o���ܽ�E/\n5�/��;���0��߅{Y����\\sM�ؿ�t�~���%P5A��ڳda������I���ի{���?��˗����^�:��g>ӽ��s5u��2��Da�*3Z=P��U+�f.\\�/��b���}�}���u?���:���?�E��M���o�=���\Z�&h2�ɮV$>�я�{5���iUNٻ�K½�z�������x�{�k_������ɓ\'w�&>�Wi�O�k��[����7o^��M�6��o�9�O�{����8�p�e^�M�}��þ��ό>�%�d]?k֬=���Oǆ���V��)�nK𻽎Op���L�:���݉\'�Nt5�Vï��7D��1cƸ|0ܾ��%\\�����s�����=���|8����Z���I�0�O=꽩S�V��(o��K�e��Ӌ5�P����Ԍ�y׊��j��E]6�\Z����������q�vj����vX�z׻¦*ھ���}��v�zի½:�w\\X��I\'��>򑏄���]�~}�Pi��I��7�qh/�&\nz<�Q�1����T1Q<�̌\Z���#�����p�p�i��ٳgw�&��pcUx�?�DA�7���/|ax�^�K�,	vt�g��tQ��r�Z�vmش����D��EM�J+}���o�ܪ�҄_��g�OZ����}���{R�wM��Bq�ǆV>uh�v\n�?[�ʗ���:u�ĉ�<l��๼\'����ۇu��-z���ISj�_���+	���TM�����	\'���z�p��ո�9�|��$ݿo���-2���d����A�O=zt[������l����R�ku}T�\\͈���G�R�K^�pp�5�ZY�v\Z����3��L�J���%R�p�	�@tߏ?�x؀u�����&\n{��	�8t{�}���P�!�������ǉ��\rథ/�щ�jV԰�cW�^��ׇ�ؗ���a�����><�!��U�`�d���\n�IR��U�����DX͉��}Ȑ!��;�����\Z69��������{b�+\n���������&��&;*��T.��átx����PC=}�Xw��_�\r���\Z����2;x���ޔ^o�(�B��5��Nx����U�*k����k[��?��pU Z�VY�@�\"3�C=���e栯	G�W2������\nu�Q�F���ɻ����P���V�<�{��^r�&^{��ϟ*����Pm5T�}�s�����?~l���VtI&\n*����z��;�7��@h\0�Ǻ�,Y�\rణ/��y��jO�3��T\r��1Ps��u\"���3�kS��$�}�\n���A{>��u����A��&ʍ\Zת�u���}���㪉R���R��r�)��\\��y�$(x��I�_��0s��.��)m)3����2V_2ӛR<l�b�q]\'����M�����j�uގ&��V��=�Y�\n\'ZY�*��GN��+}�2�����Q�������_�~��(�^7�Y&L8�������*��\'�\'� ���Cj\0׉b�K�n�У7��M�^O���s���Pi��.�R�.�p���ў��5�΃б��z��F�RmM���_�*|5e�N5nj���e �H8__3�Ì49U��	�N��D9�(赭��0 m�fEA+e�~��æD�jM�5�>�+ZY�+�#�̩iRS��eI\r�V\0��+�j���.���76�מRҡC+��.�&Ic�&�����+I������u�W�Њ�&�:7G������x��~�5��{����/��oo)i����Q��h]]�ߦ���oĈ�j�&����o���ϟ������=hJo����cgU�p��P���/\r�:�Z+ڮ�\r��l̜93��\rA�j��Kǚ(����i�[�\Z_QЧ_0Q����ѡAz�E{:u��VԜ�q���jF���f��>�����馛�$u�sO?�\ZP��x����hE��V�<��o}�J��s�����5I���#}�Z�����;2c_���@Vsss8Iй��rK����n����^�E�i�O�\\�C3�����Ef�zШ��\"�^���碋.j��&�^����N	����m a�9x���8�cgU�m J\'2k�\Z}�h��&I\r���j@�7dȐpe ��N���:vT۫�@��Nr�+��>/*���\n����wG{v�+\n��ٹ��,p���5\nZQ�ǒj���ѡBz�О|v߳�C�t��o�����)-K�.\r�w֧����/קzi��C%��+ڃ��_\'��0>�ȬO\\ѡk֬	O�ԹB:�_�\n�	�&�jz�s�l)k��C~�N��J?��/�^!�VOax�����*�(����>I���������ӧ��f7$xO�$Y��yl�R�������v��׺�g�ߠCf�m�\Z��-23�ԃ�讨�׎��Nt�`�ٹ���/�^7�A3�tCC��<�I�;�\'n�СC��3�\n5��SԴ�9�jYW\05=�����{T��ΰ�oo�ҡZ����i���XQ�4xG�יJ��Q󥓨�$�c����f �ܾ�fF]�os���j�>���^+\n:���ҠC�^�ׄM���O���������N�O{�Ct(��J�Ѫ�&)�i��>mL����-2c__3���e&��ܨ48묳����a�*���Q�&^��N�h��_��W����Ef�zѠ\'=_Y��aH����p��{�#F������_++	��x#��ʺB�ԑ��>2c�Ȍ}d�V�ԓ�\':BB\'\"\'�4$m����$t�_6z]͆�=�ܦy��5��g���qN����]���b\0����*2c��UdƎ���ݱF?<<[��j�I���Pm�W�_����G�F�;s��a�NfJG����{�ݓ��,�5̞=���I{,�����_ඊ�>2c�Ȍ}d�V�[ԣ�W������^��㤖UTT4O�2�`6�f�����\n��v�رq�ڵ�n��y�Ǐדݨ�K�c�\0��b\0����*2c��UdƦ���3	��u�:����`�t{�ueP��z��ue��cK��\0��b\0����*2c��Ud�6z]��\0n���#3����Gfl����b\0����*2c��Ud@bඊ�>2c�Ȍ}d�V�\0�1��*p�Ȍ�\"3��[Ef\0$�\0n���#3����Gfl����b\0����*2c��Ud@bඊ�>2c�Ȍ}d�V�\0�1��*p�Ȍ�\"3��[Ef\0$�\0n���#3����Gfl����b\0����*2c��Ud@bඊ�>2c�Ȍ}d�V�\0�1��*p�Ȍ�\"3��[Ef\0$�\0n���#3����Gfl����b\0����*2c��Ud@bඊ�>2c�Ȍ}d�V�\0�1��*p�Ȍ�\"3��[Ef\0$�\0n���#3����Gfl����b\0����*2c��Ud@bඊ�>2c�Ȍ}d�V�\0�1��*p�Ȍ�\"3��[Ef\0$�\0n���#3����Gfl����ŋ�����e �\n_��a[0����#�Bf��)d�N�\0�,[�l[CCC���*|=����|��;�-d�N���@f���JMM�9K�.m���od���T��oڴiV0xo�l�w[J%3۶m�rY��).���b.2��4hhCPt�b��̙3���û\\^D��]�?�w����wV��Y�b����vs���r]��)2�]u�Ί23%Pd@6��%�(����9���������nԨQ��\0\0JB0A(�$�����nÆ\rw�555;��ˇ��\0\0\0�h5����������!mmm�<�����UUU5�r���m\0\0������Ѓ`^pLCCÎ�YB]VQQq��=\0\0@��VXU\0zP[[{�?I�̚5kϰa�N�o\0\0Pt�YM`Uȣ���Ė���s�imm}z	���ʎ�o\0\0PT�YM`U�c���k�Ɂoݺu����\'��\0\0(\ZGXM`U���rǬ^���?1��޽�� 7;��\0\0\0EA+y&~��\0t����������A��I�&հ�\0\0\0J�&�e\0�K�̙3g�?;��Z�� Cs�\0\0(9L��UVV��iӦ��$������-|�\0\0(IL�#�>}����yB�.�s��-\0\0@I`�\0���E��E������Av��\0@�b�\0$3q��󚚚666��#G>R^^>��\0\0�d0Q\0��1cƃ����t���u\0\0\0%���\\.�;I��W�:\0\0���DH��\0\0�L���!3\0\0 hz�t�\0\0�� 2\0\02��H��\0\0�L���!3\0\0 hz�t�\0\0�� 2\0\02��H��\0\0�L���!3\0\0 hz�t�\0\0�� 2\0\02��H��\0\0�L���!3\0\0 hz�t�\0\0�� 2\0\02��H��\0\0�L���!3\0\0 hz�t�\0\0�� 2\0\02��H��\0\0�L���!3\0\0 hz�t�\0\0�� 2\0\02��H��\0\0�L���!3\0\0 hz�t�\0\0�� 2\0\02��H��\0\0�L���!3\0\0 hz�t�\0\0�� 2\0\02��H��\0\0�L���!3\0\0 hz�t�\0\0�� 2\0\02��H��\0\0�L���!3\0\0 hz�t�\0\0�� 2\0\02��H��\0\0�L���!3\0\0 hz�t�\0\0�� 2\0\02��H��\0\0�L���!3\0\0 ��P���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0f�?M6��e)2R\0\0\0\0IEND�B`�',1),('f880c99a-c3e8-11ea-9902-96e6f7651f71',1,'请假流程.bpmn20.xml','f880c999-c3e8-11ea-9902-96e6f7651f71',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"AskForLeave\" name=\"请假流程\" isExecutable=\"true\">\n    <documentation>请假流程</documentation>\n    <startEvent id=\"startEvent1\" name=\"开始\"></startEvent>\n    <userTask id=\"sid-FA5DEC96-DF3B-476A-9911-6603A764994E\" name=\"请假申请\" flowable:assignee=\"$INITIATOR\">\n      <extensionElements>\n        <modeler:activiti-idm-initiator xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[true]]></modeler:activiti-idm-initiator>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-D2D6A238-1998-40B2-8329-11C421644087\" sourceRef=\"startEvent1\" targetRef=\"sid-FA5DEC96-DF3B-476A-9911-6603A764994E\"></sequenceFlow>\n    <userTask id=\"sid-6D79B4F5-4CDB-4860-9694-C76721F2914F\" name=\"部门经理审批\" flowable:candidateGroups=\"40283e816f92646d016f92705173001a\">\n      <extensionElements>\n        <modeler:group-info-name-40283e816f92646d016f92705173001a xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[部门管理员]]></modeler:group-info-name-40283e816f92646d016f92705173001a>\n        <modeler:activiti-idm-candidate-group xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[true]]></modeler:activiti-idm-candidate-group>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-BE0C6AA2-056B-47EC-91C7-E2234AD454EB\" name=\"提交\" sourceRef=\"sid-FA5DEC96-DF3B-476A-9911-6603A764994E\" targetRef=\"sid-6D79B4F5-4CDB-4860-9694-C76721F2914F\"></sequenceFlow>\n    <endEvent id=\"sid-FC44C064-B4A8-4F8F-AE0F-BB4D7D42FDEC\" name=\"结束\"></endEvent>\n    <sequenceFlow id=\"sid-96831967-22AF-4844-A34E-1019295CC71B\" name=\"同意\" sourceRef=\"sid-6D79B4F5-4CDB-4860-9694-C76721F2914F\" targetRef=\"sid-FC44C064-B4A8-4F8F-AE0F-BB4D7D42FDEC\"></sequenceFlow>\n    <sequenceFlow id=\"sid-7FF42D21-2DCA-40F9-A489-C95A249883D0\" name=\"退回\" sourceRef=\"sid-6D79B4F5-4CDB-4860-9694-C76721F2914F\" targetRef=\"sid-FA5DEC96-DF3B-476A-9911-6603A764994E\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_AskForLeave\">\n    <bpmndi:BPMNPlane bpmnElement=\"AskForLeave\" id=\"BPMNPlane_AskForLeave\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-FA5DEC96-DF3B-476A-9911-6603A764994E\" id=\"BPMNShape_sid-FA5DEC96-DF3B-476A-9911-6603A764994E\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"195.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-6D79B4F5-4CDB-4860-9694-C76721F2914F\" id=\"BPMNShape_sid-6D79B4F5-4CDB-4860-9694-C76721F2914F\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"375.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-FC44C064-B4A8-4F8F-AE0F-BB4D7D42FDEC\" id=\"BPMNShape_sid-FC44C064-B4A8-4F8F-AE0F-BB4D7D42FDEC\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"555.0\" y=\"164.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-BE0C6AA2-056B-47EC-91C7-E2234AD454EB\" id=\"BPMNEdge_sid-BE0C6AA2-056B-47EC-91C7-E2234AD454EB\">\n        <omgdi:waypoint x=\"294.9499999999431\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"374.99999999997226\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-96831967-22AF-4844-A34E-1019295CC71B\" id=\"BPMNEdge_sid-96831967-22AF-4844-A34E-1019295CC71B\">\n        <omgdi:waypoint x=\"474.94999999998265\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"555.0\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-D2D6A238-1998-40B2-8329-11C421644087\" id=\"BPMNEdge_sid-D2D6A238-1998-40B2-8329-11C421644087\">\n        <omgdi:waypoint x=\"129.94999891869114\" y=\"178.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"194.99999999999022\" y=\"178.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-7FF42D21-2DCA-40F9-A489-C95A249883D0\" id=\"BPMNEdge_sid-7FF42D21-2DCA-40F9-A489-C95A249883D0\">\n        <omgdi:waypoint x=\"425.0\" y=\"138.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"425.0\" y=\"86.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"245.0\" y=\"86.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"245.0\" y=\"138.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('f88cd78b-c3e8-11ea-9902-96e6f7651f71',1,'请假流程.AskForLeave.png','f880c999-c3e8-11ea-9902-96e6f7651f71',_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0Q\0\0\0�\0\0\0��q1\0\03IDATx^��	�u�py��P˫��<A-��.�#X��U�� H�b1xq(BA��E�@y\Z._B�H  \n&b�$�!�B��׿f;5靄��No��S������Lv~����{�IO\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�F3fL�T����\0�B�&��\0TF��$����D?P�C��g\0*#th�@e�M����СI�3\0�:4�~�2B�&��\0TF��$����D?P�C��g\0*#th�@e�M����СI�3\0�:4�~�2B�&��\0TF��$����D?P�C��g\0*#th�@e�M����СI�3\0�:4�~�2B�&��\0TF��$����D?P�C��g\0*#th�@e�M����СI�3\0�:4�~�2B�&��\0TF��$����D?P�C��g\0*#th�@e�M����СI�3\0�:4�~�2B�&��\0tE\Z0s\"d����C�A\0]�̈6��b�(��\n�(\0�&f����B�Q\0tM�4�<����\0誘qj3�2Őg@Wme6jDq9j�\0��l�Y(\Z� \n��+�F�(��\"�(\0*��Fo��J?P�|6�x;U�`H�俗-[v���3k֬���/��S�m�T�{�4o޼{fϞ�g������/�i��o��KV�\\��_�>y�GT�����ϝ;wm\ZB{_#:����g`؈=���7���Z�bŪ4t_#:���S�h�8�a���C\Z:������)�4^��P����W�z_#:���U�h�NC�V$ˮ;3Y|��Y��q[q9U��N9��^���F�$t֭�;Y4����;|����g����K蔣��U�h�NB����	���Z|I����K蔣��U�h�NB��9��\'l��W/�S�~�W�g��:	�E��\'l��W/�S�~�W�g�фN�J蔣��U�h�NB\'�^*�M^���j�%t����*�4Z\'����S��M^���j�%t����*�4Z\'���E��\'p��Yqy5�:���z�~\Z��ЉZ~��}B\'n+.�ʕ�)G?׫�3�h�Ά\r�����	��-~�gy5�:���z�~\Z�B\'>����O�8y��|�����)G?׫�3�h[\r�t�|�����.=�O�+��e�ŗ/�S�~�W�g��څ��o��ŗ/�S�~�W�g��څN\'{�[��oq}��:���z�~\Z�]����U\\�꼄N9��^���Fk:j���)G?׫�3�hB�^%t����*�4�ЩW	�r�s�J?�&t�UB��\\���PI��ׂ�>��/�2eʪ#�<r���i̘1�ĉ7v�a���s�ԩ\'�7���ӞЩW	�r�s�J?w�ȑ#wJsp��ѣ/N�]�֝����.�}b,W�/�@:x���K/=�c��OOOO��$��k�[o�5Y�zu���>n���?��ɓ\'/;蠃>Z\\[:�*�S�~�W���5jԮ��h^Ӛ�+���JE��N���K_�R�`�����MO$���=�Ѝ�r�\r�H|��y�ЩW	�r�s�J?�ȳt04��\0�?5C.6X:�a�̙��0aB2}����G-��:���p���>��S�:���z�~\\�F��-ͲZD��_r�\'&�f�j{�&n���r�������c0ĥ��ӦM����N��l9*\Z�XOOO��cǎ_|��N�ԫ�N9��^��O:�90@=����w��g?�Y�f͚b����q�����Xo��bj�ĉ�ʕ+�=PJ�oܸq댼�$t�UB��\\��σ�wj�\0�_�B�|��b�u$��oH�ņ�?��@\r�TQ��M�����#G�R|��J�ԫ�N9��^��ˋ�\Z;v�|��o|#Y�vm1��%��iH���C\\���x�	\'��s��颋.Z�6�����N�J蔣��U���t�3�u��\0*�)�HM/>6CȌ3N���zy�b�===����qB�^%t����*�\\N��l>j���&��z��\\����>�����T᪫����,>��H�ԫ�N9��^��ˉ��8qRx7�z[f���P4���:蠎?��x�t��@�?�5}3�IkD��\"�S�:���Y���N����ȳ��O��Ux��m���MM���:묳.�O\Z�Ҕ)S�=���si��=�m�Y�N�J货��f���:��ȧ|�o���T��������5u����:����+�\r3��\\���M��7�ЩW	�����,��^\'��~?-�y�W�T������\\l�#�8b��eˊ�kW-Y�䶴Y�+>��h�&m�f:�*��^�>��C��s{m��O?��^����|���<���bcM�8q����_|]�j�����f���\\��͛�XٛU�ԫ�N{m��X������kӿŊ~^���|���<vcs��⤶�7_׮J��6�;�J�ԫ����_��zU��Q�n�c����63���0a��n������i����&l�9c���8�mƌɽ�޻������x���Y>����~��w�;�z���O>���%�\'ON����g�$��rJ�aÆ>����~���Mz�>?�\Z���v�so�Mw���_�׎<����N������n����\'�����c�9&����7/��f��=��?�)�:ujr��G\'�rHr��&_|����7����������3�L;��_�jvۏ~��>�g�����={����?��֊e�y^w�uɅ^��t�MI�刽��;�뮻�,ߟ�����>���{w~{���L��n@��1ߢts����֛��`�N��]w�5�c�=��u��;�<��O�.o~󛳍��>��>�q�i�������&�&Mʾ��P�:*_��;��#n�u?��O�*���g>��ڍ7�X��t��N{U��y�N8!y�_�<��H���we���;.���?�\r�\"tb�����Y_��Mo�у�W1��={v�w�#��?z)bcǎ�.-��;b�.�:*v~���m^6��~֗��Ǔ���=�ȑ#���ş���`/�O�Ġ,�׿��Y����O;�-���Ǐ�*{�����Y�G?�-��^\'�<�9Qtꨣ�����.�����4�*�m�9[�\r���5�\\�����z��^�<�)OI��d��|��n�-ېGP|��L����&ox����\r���n�c�{�}��&������#�b6�n�󩢄N{U�s�:�@$f\"��fΜ��G�y��|�+ɷ���l�3_~ڴi� ��SOM֯_�źb�غ�駟��ۻl�}�{_6H�����j��oŊY��_s��x�x��/�v.��w$Gq����LmT��׾�����%��׿�*�>�_g�uV6XLu��^��d��v��� *h1���g���:-��^\'���/��<�iʔ)\'W�9Q�Fqz�?c[o�VeC��Z�dI ���/9;<2al�?-�w����=�Ĳq�O<1۸��5��B,�\'������l�>�Q�c�r�-������E/zQ�׽�;f_��L>��dA4��SE	�����8 �A�Cz��_v�eY�� �����<�t;��+��8��y��3����Y�zV�{s��I��k��P���|��H���?o��@E-^�8���b`3c����U�V%���/��ؙx��U|���ݿ���dݺu�,T�l��1vX���\'g�x�|�L~��_���uZ���N���Dѱt��===�U������r�Of���x��l�:�Q���꫓�O>9����,Q�K��kr�=�d��bf�mo{[2bĈ��/y��~�I\'e����=n���,\0�6{�� ��ϧ�:����$�`���p6��W�*|?����D�sNv�P~�8��� *f�b�?B1{}�������>��l�)���.�A�-y�;ߙ����b&�o}kv>U����`�u���3�3/|��C���ԧ���8�+~e�_?\\��X�n�ǉǓ�C��ɓ�WuH/�P�3��ʔ	��V��Ơ&B�\\rIv#�I�g�b��t��l٘U��)\01���J���˹瞛T�����Ʀ�AT�OU%t�)��qS�c�\'�ŀ:qNS�_����\\���]�M�a\'���8����|�b�(�5*��>ϗ��W�t�⼕8w��+��<�7��q�����������d_��.�lk�\\F�b�k������C��������ˉ��g���<�)}�~��C��裏_�A���δQ��kՏ+:��|�3?g�qF������ \'�*��u�|�8�;������߈��8���|��I�/���yq�p\n�󩢄N9e�9��1� >.F�s��ATv\"l��Z,ߟ�����^N�f��ӓ\r�c��_��H+�M���8�<f�b*��#�H��}o����D��կ�7_.f��|�8d��+��$�ؑ��^|^��~.\'r*��)˗//FZ)���c��P1\0��CY���a��雊/� �t�I\'��6���cWeC�?��8�#}�l���Zg~>���mu��D��q2l�h=$*6�qr��g��}�:��Utq��@�O%t�)��q�-� �qehB���h���*N�ί��� *��\Z��c�_�*;a;�9�� *�Yz����\r�f͚����D���^������/f_����\'�䃨4��o̞{̜��茬~./�*��vp�ڵ�\\�XϤI�k����C�ȑ#wI7&�b��\r�᬴QV��{�j�Q�V�^m�P\'o��n������I�g�/o��K���D��S�ۓzAĉ����+��[������SE	�r��s$���b;t��f��\"�b(Λj����kq��/��ͷ��͝;7;�(>���?�qv{\\\Z�v�!�J�?�i60��!����e\'���q1úhѢ�/�K��q�C\\d���Ǡ(?\'*���s�Z/�h�8�<�x{T�?b@��Ab�r���l��_Gŉ���(޿����E^���:�Ġ��@*��7�@���bC�{?��!��ʕ+��{)��⒴Q�5j�n���ʆN+^ר��o�M���W+��P�l\\i�<E��I�S�L��I�ق�	�AO�\0����V���TQB����}U�\\�8�g\\A\\\\>f��<�������P�k_���%/yI6 *�/������Z+����/���a��|���Q��1��,�!ʸb5f���������J�kc��@���\n3P�bä{p�Ǎ��`�H��@ŧ�X|��l��-�S�~�W�����:��s���N�ڋ�b��s�z�\'�(F���ߚ�.�h�@O6���{ρ��H�=�S�:���z�~\\�3R�����7�po� �Ǽ�Gc��7�����-c���r��F��s:j����s�UW]�@��#�.�����M�$KӚ�)���	�z��)G?׫����<�\\+��[rq8��s޾������[:�^�dɒ;V�Z�P:fZ���k��ŋ����/�<yr4תX��OL�ԫ�N9��^���\'��6�m�\\�z?�ub:���{�0��̧h��wa��}�j�N�J蔣��U����\"lGB�^%t����*�4�ЩW	�r�s�J?�&t�UB��\\���@�	�z��)G?׫�3�hB�^%t����*�4�ЩW	�r�s�J?�&t�UB��\\���@�	�z��)G?׫�3�hB�^%t����*�4�ЩW	�r�s�J?�&t�UB��\\���@�	�z��)G?׫�3�hB�^%t����*�4�ЩW	�r�s�J?�&t�UB��\\���@�	�z��)G?׫�3�hB�^%t����*�4�ЩW	�r�s�J?�&t�UB��\\���@�	�z��)G?׫�3�hB�^%t����*�4ڬY�6�_����OU_��pO\Z:������)�4޼y��Y�re�\r���n������YX|��~�O�g��fϞ��ܹs׮X�b�=��S��}�m��vn\Z8w��G�5�s�y��~�����cZ��9���{��� ��c��S?o���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�������`ړ\0\0\0\0IEND�B`�',1);
/*!40000 ALTER TABLE `act_ge_bytearray` ENABLE KEYS */;
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
INSERT INTO `act_ge_property` VALUES ('cfg.execution-related-entities-count','true',1),('cfg.task-related-entities-count','true',1),('common.schema.version','6.5.0.1',1),('entitylink.schema.version','6.5.0.1',1),('eventsubscription.schema.version','6.5.0.1',1),('identitylink.schema.version','6.5.0.1',1),('job.schema.version','6.5.0.1',1),('next.dbid','1',1),('schema.history','upgrade(6.4.1.3->6.5.0.1)',3),('schema.version','6.5.0.1',3),('task.schema.version','6.5.0.1',1),('variable.schema.version','6.5.0.1',1);
/*!40000 ALTER TABLE `act_ge_property` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `act_hi_actinst` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `act_hi_comment` ENABLE KEYS */;
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
-- Table structure for table `act_hi_entitylink`
--

DROP TABLE IF EXISTS `act_hi_entitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_entitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `LINK_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HIERARCHY_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`,`LINK_TYPE_`),
  KEY `ACT_IDX_HI_ENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`,`LINK_TYPE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_entitylink`
--

LOCK TABLES `act_hi_entitylink` WRITE;
/*!40000 ALTER TABLE `act_hi_entitylink` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_entitylink` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `act_hi_identitylink` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `act_hi_procinst` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `act_hi_taskinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_tsk_log`
--

DROP TABLE IF EXISTS `act_hi_tsk_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_tsk_log` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_tsk_log`
--

LOCK TABLES `act_hi_tsk_log` WRITE;
/*!40000 ALTER TABLE `act_hi_tsk_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_tsk_log` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `act_hi_varinst` ENABLE KEYS */;
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
INSERT INTO `act_id_property` VALUES ('schema.version','6.5.0.1',1);
/*!40000 ALTER TABLE `act_id_property` ENABLE KEYS */;
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
INSERT INTO `act_re_deployment` VALUES ('5d1410a8-c28b-11ea-b0fd-96e6f7651f71','经理级别-差旅报销','财务 / 差旅报销 / 部门经理级','Expense','4028b26c73316c440173317228b40018','2020-07-10 08:57:20.606',NULL,NULL,NULL,NULL),('6967854e-c5ac-11ea-91f9-96e6f7651f71','接待报销流程','财务 / 接待报销','Reception','4028b26c73316c440173316f465b000c','2020-07-14 08:31:28.166',NULL,NULL,NULL,NULL),('995fca42-c5b7-11ea-8271-96e6f7651f71','高级接待流程报销','财务 / 接待报销','HighReception','4028b26c73316c440173316f465b000c','2020-07-14 09:51:33.110',NULL,NULL,NULL,NULL),('e5381dc2-c191-11ea-8e4d-96e6f7651f71','员工级别-报销流程','财务 / 差旅报销 / 普通员工级','Expense2','4028b26c73316c4401733171d2ad0016','2020-07-09 03:11:34.829',NULL,NULL,NULL,NULL),('f880c999-c3e8-11ea-9902-96e6f7651f71','请假流程','考勤 / 请假申请','AskForLeave','4028b26c73316c440173317049080010','2020-07-12 02:39:55.724',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `act_re_deployment` ENABLE KEYS */;
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
INSERT INTO `act_re_procdef` VALUES ('AskForLeave:1:f88cfe9c-c3e8-11ea-9902-96e6f7651f71',2,'考勤 / 请假申请','请假流程','AskForLeave',1,'f880c999-c3e8-11ea-9902-96e6f7651f71','请假流程.bpmn20.xml','请假流程.AskForLeave.png','请假流程',0,1,1,'4028b26c73316c440173317049080010',NULL,NULL,NULL,0),('Expense2:1:e5469cb5-c191-11ea-8e4d-96e6f7651f71',2,'财务 / 差旅报销 / 普通员工级','员工级别-报销流程','Expense2',1,'e5381dc2-c191-11ea-8e4d-96e6f7651f71','员工级别-报销流程.bpmn20.xml','员工级别-报销流程.Expense2.png','员工级别-报销流程',0,1,1,'4028b26c73316c4401733171d2ad0016',NULL,NULL,NULL,0),('Expense:1:5d25c3eb-c28b-11ea-b0fd-96e6f7651f71',2,'财务 / 差旅报销 / 部门经理级','经理级别-差旅报销','Expense',1,'5d1410a8-c28b-11ea-b0fd-96e6f7651f71','经理级别-差旅报销.bpmn20.xml','经理级别-差旅报销.Expense.png','报销流程',0,1,1,'4028b26c73316c440173317228b40018',NULL,NULL,NULL,0),('HighReception:1:9976ada5-c5b7-11ea-8271-96e6f7651f71',2,'财务 / 接待报销','高级接待流程报销','HighReception',1,'995fca42-c5b7-11ea-8271-96e6f7651f71','高级接待流程报销.bpmn20.xml','高级接待流程报销.HighReception.png','高级接待流程报销-包容网关测试',0,1,1,'4028b26c73316c440173316f465b000c',NULL,NULL,NULL,0),('Reception:1:697b5b71-c5ac-11ea-91f9-96e6f7651f71',2,'财务 / 接待报销','接待报销流程','Reception',1,'6967854e-c5ac-11ea-91f9-96e6f7651f71','接待报销流程.bpmn20.xml','接待报销流程.Reception.png','接待报销流程，并行审批测试',0,1,1,'4028b26c73316c440173316f465b000c',NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `act_re_procdef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_actinst`
--

DROP TABLE IF EXISTS `act_ru_actinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_actinst` (
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
  KEY `ACT_IDX_RU_ACTI_START` (`START_TIME_`),
  KEY `ACT_IDX_RU_ACTI_END` (`END_TIME_`),
  KEY `ACT_IDX_RU_ACTI_PROC` (`PROC_INST_ID_`),
  KEY `ACT_IDX_RU_ACTI_PROC_ACT` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_RU_ACTI_EXEC` (`EXECUTION_ID_`),
  KEY `ACT_IDX_RU_ACTI_EXEC_ACT` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_actinst`
--

LOCK TABLES `act_ru_actinst` WRITE;
/*!40000 ALTER TABLE `act_ru_actinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_actinst` ENABLE KEYS */;
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
  `ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
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
-- Table structure for table `act_ru_entitylink`
--

DROP TABLE IF EXISTS `act_ru_entitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_entitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LINK_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HIERARCHY_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_ENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`,`LINK_TYPE_`),
  KEY `ACT_IDX_ENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`,`LINK_TYPE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_entitylink`
--

LOCK TABLES `act_ru_entitylink` WRITE;
/*!40000 ALTER TABLE `act_ru_entitylink` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_entitylink` ENABLE KEYS */;
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
  `SUB_SCOPE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
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
/*!40000 ALTER TABLE `act_ru_identitylink` ENABLE KEYS */;
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
  `ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
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
  `ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
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
/*!40000 ALTER TABLE `act_ru_task` ENABLE KEYS */;
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
  `ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
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
/*!40000 ALTER TABLE `act_ru_variable` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `demo_expense` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `demo_leave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demo_student`
--

DROP TABLE IF EXISTS `demo_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demo_student` (
  `stu_id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `enrollment_time` datetime DEFAULT NULL,
  `hobby` varchar(255) DEFAULT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `serial_number` bigint(20) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `stu_name` varchar(255) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`stu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demo_student`
--

LOCK TABLES `demo_student` WRITE;
/*!40000 ALTER TABLE `demo_student` DISABLE KEYS */;
/*!40000 ALTER TABLE `demo_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_metadata`
--

DROP TABLE IF EXISTS `gen_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_metadata` (
  `column_id` varchar(255) NOT NULL,
  `column_comment` varchar(255) DEFAULT NULL,
  `column_name` varchar(255) DEFAULT NULL,
  `column_type` varchar(255) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_metadata`
--

LOCK TABLES `gen_metadata` WRITE;
/*!40000 ALTER TABLE `gen_metadata` DISABLE KEYS */;
INSERT INTO `gen_metadata` VALUES ('4028b2ec7273bd33017273befe6d0009','唯一标识','id','String',NULL,'2020-06-02 14:36:36','唯一标识',NULL,NULL),('4028b2ec7273bd33017273bf73b7000b','创建者','create_by','String',NULL,'2020-06-02 14:37:06','创建者',NULL,NULL),('4028b2ec7273bd33017273c0194c000d','创建时间','create_time','Date',NULL,'2020-06-02 14:37:49','创建时间',NULL,'2020-06-02 14:38:26'),('4028b2ec7273bd33017273c0875b000f','更新者','update_by','String',NULL,'2020-06-02 14:38:17','更新者',NULL,NULL),('4028b2ec7273bd33017273c108440012','更新时间','update_time','Date',NULL,'2020-06-02 14:38:50','更新时间',NULL,NULL),('4028b2ec7273bd33017273c1c14c0014','备注','remark','String',NULL,'2020-06-02 14:39:37','备注',NULL,NULL),('4028b2ec7273bd33017273e19bef0018','微信ID','weixin_id','String',NULL,'2020-06-02 15:14:25','微信ID',NULL,NULL),('4028b2ec7273bd33017273e1dcaa001a','微信名称','weixin_name','String',NULL,'2020-06-02 15:14:41','微信名称',NULL,NULL),('4028b2ec7273bd33017273e2224d001c','姓名','name','String',NULL,'2020-06-02 15:14:59','姓名',NULL,NULL),('4028b2ec7273bd33017273e25f6c001e','性别','sex','String',NULL,'2020-06-02 15:15:15','性别',NULL,NULL),('4028b2ec7273bd33017273e29e400020','邮箱','email','String',NULL,'2020-06-02 15:15:31','邮箱',NULL,NULL),('4028b2ec7273bd33017273e325f70022','联系电话','phone','String',NULL,'2020-06-02 15:16:06','联系电话',NULL,NULL),('4028b2ec7273bd33017273e3f9ed0024','身份证号码','idcard','String',NULL,'2020-06-02 15:17:00','身份证号码',NULL,NULL),('4028b2ec7273f082017273f91730001e','数据状态','status','String',NULL,'2020-06-02 15:40:04','数据状态',NULL,NULL),('4028b2ec72794bfa01727955f3420016','联系地址','address','String',NULL,'2020-06-03 16:39:35','联系地址',NULL,NULL),('4028b2ec72794bfa01727956d3d7001a','门牌号','house_num','String',NULL,'2020-06-03 16:40:33','门牌号',NULL,NULL),('4028b2ec72794bfa017279575261001e','是否默认（1是 0否）','is_default','String',NULL,'2020-06-03 16:41:05','是否默认（1是 0否）',NULL,'2020-06-03 16:41:33'),('4028b2ec72794bfa01727962c96d0023','纬度','latitude','String',NULL,'2020-06-03 16:53:37','纬度',NULL,NULL),('4028b2ec72794bfa017279632c940025','经度','longitude','String',NULL,'2020-06-03 16:54:02','经度',NULL,NULL),('4028b2ec7292caa6017292ce44090005','图片路径','img_src','String',NULL,'2020-06-08 15:21:31','',NULL,NULL),('4028b2ec7292caa6017292cf70240009','位置','position','String',NULL,'2020-06-08 15:22:48','',NULL,NULL),('4028b2ec7292caa6017292d0e9b9000d','背景元素','background','String',NULL,'2020-06-08 15:24:24','',NULL,NULL),('4028b2ec7292caa6017292d2a82b0018','标题','title','String',NULL,'2020-06-08 15:26:19','',NULL,NULL),('4028b2ec72a231830172a238496a002a','父编号','parent_id','String',NULL,'2020-06-11 15:11:37','',NULL,'2020-06-11 15:12:02'),('4028b2ec72a231830172a23969470032','祖级列表','ancestors','String',NULL,'2020-06-11 15:12:51','',NULL,NULL),('4028b2ec72a231830172a239e2ad0036','显示顺序','orderNum','Long',NULL,'2020-06-11 15:13:22','',NULL,NULL),('4028b2ec72c523730172c54c17dd0016','目录编号','catalog_id','String',NULL,'2020-06-18 10:39:58','',NULL,NULL),('4028b2ec72c523730172c553fa86001f','品牌','brand','String',NULL,'2020-06-18 10:48:35','',NULL,NULL),('4028b2ec72c523730172c55566d80024','描述','description','String',NULL,'2020-06-18 10:50:08','',NULL,NULL),('4028b2ec72c523730172c555d47c0028','型号','model','String',NULL,'2020-06-18 10:50:36','',NULL,NULL),('4028b2ec72c523730172c5564737002c','材质','material','String',NULL,'2020-06-18 10:51:05','',NULL,NULL),('4028b2ec72c523730172c5569e350030','颜色','color','String',NULL,'2020-06-18 10:51:28','',NULL,'2020-06-18 10:51:42'),('4028b2ec72c523730172c55769bb0035','尺寸','size','String',NULL,'2020-06-18 10:52:20','',NULL,NULL),('4028b2ec72c523730172c55791aa0037','款式','style','String',NULL,'2020-06-18 10:52:30','',NULL,NULL),('4028b2ec72c523730172c5581f7d003c','包装','packing','String',NULL,'2020-06-18 10:53:06','',NULL,NULL),('4028b2ec72c523730172c55906a2003e','净重','net_weight','Double',NULL,'2020-06-18 10:54:05','',NULL,'2020-06-18 11:07:28'),('4028b2ec72c523730172c55983d90040','毛重','gross_weight','Double',NULL,'2020-06-18 10:54:38','',NULL,NULL),('4028b2ec72c523730172c55d01d00046','计量单位','measure','String',NULL,'2020-06-18 10:58:26','',NULL,NULL);
/*!40000 ALTER TABLE `gen_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_table` (
  `table_id` varchar(255) NOT NULL,
  `business_name` varchar(255) DEFAULT NULL,
  `class_name` varchar(255) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `function_author` varchar(255) DEFAULT NULL,
  `function_name` varchar(255) DEFAULT NULL,
  `module_name` varchar(255) DEFAULT NULL,
  `options` varchar(255) DEFAULT NULL,
  `package_name` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `table_comment` varchar(255) DEFAULT NULL,
  `table_name` varchar(255) DEFAULT NULL,
  `tpl_category` varchar(255) DEFAULT NULL,
  `tree_code` varchar(255) DEFAULT NULL,
  `tree_name` varchar(255) DEFAULT NULL,
  `tree_parent_code` varchar(255) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
INSERT INTO `gen_table` VALUES ('4028b2ec7273bd33017273e7c2c60026','member','Member',NULL,'2020-06-02 15:21:08','yweijian','商城会员','center',NULL,'com.daffodil.mall','','商城会员','mall_member','crud','','','',NULL,'2020-06-02 15:48:22'),('4028b2ec72794bfa01727953b69c0001','receiveAddress','ReceiveAddress',NULL,'2020-06-03 16:37:09','yweijian','收货地址','center',NULL,'com.daffodil.mall','','收货地址','mall_receive_address','crud','','','',NULL,'2020-06-03 16:59:21'),('4028b2ec7292caa6017292cd4e530001','carousel','Carousel',NULL,'2020-06-08 15:20:28','yweijian','轮播图','staticres',NULL,'com.daffodil.mall','静态资源','轮播图','mall_carousel','crud','','','',NULL,'2020-06-08 15:31:49'),('4028b2ec72a231830172a235da400005','catalog','ShopCatalog',NULL,'2020-06-11 15:08:58','yweijian','商品目录','shop',NULL,'com.daffodil.mall','','商品目录','mall_shop_catalog','tree','id','name','parentId',NULL,'2020-06-11 15:22:16'),('4028b2ec72c523730172c54aeb0f0012','product','Product',NULL,'2020-06-18 10:38:41','yweijian','商品信息','shop',NULL,'com.daffodil.mall','','商品表','mall_product','crud','','','',NULL,'2020-06-18 11:08:27');
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_table_column` (
  `column_id` varchar(255) NOT NULL,
  `column_comment` varchar(255) DEFAULT NULL,
  `column_name` varchar(255) DEFAULT NULL,
  `column_type` varchar(255) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `dict_type` varchar(255) DEFAULT NULL,
  `html_type` varchar(255) DEFAULT NULL,
  `is_edit` varchar(255) DEFAULT NULL,
  `is_increment` varchar(255) DEFAULT NULL,
  `is_insert` varchar(255) DEFAULT NULL,
  `is_list` varchar(255) DEFAULT NULL,
  `is_pk` varchar(255) DEFAULT NULL,
  `is_query` varchar(255) DEFAULT NULL,
  `is_required` varchar(255) DEFAULT NULL,
  `java_field` varchar(255) DEFAULT NULL,
  `java_type` varchar(255) DEFAULT NULL,
  `query_type` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `table_id` varchar(255) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
INSERT INTO `gen_table_column` VALUES ('4028b2ec7273f082017273f52e6c000b','唯一标识','id','String',NULL,'2020-06-02 15:35:48','','input','N',NULL,'N','N','Y','N','Y','id',NULL,'','唯一标识',1,'4028b2ec7273bd33017273e7c2c60026',NULL,'2020-06-02 15:48:22'),('4028b2ec7273f082017273f57901000d','身份证号码','idcard','String',NULL,'2020-06-02 15:36:07','','input','Y',NULL,'Y','Y','N','N','Y','idcard',NULL,'','身份证号码',1,'4028b2ec7273bd33017273e7c2c60026',NULL,'2020-06-02 15:48:22'),('4028b2ec7273f082017273f57902000e','联系电话','phone','String',NULL,'2020-06-02 15:36:07','','input','Y',NULL,'Y','Y','N','Y','Y','phone',NULL,'LIKE','联系电话',1,'4028b2ec7273bd33017273e7c2c60026',NULL,'2020-06-02 15:48:22'),('4028b2ec7273f082017273f57903000f','邮箱','email','String',NULL,'2020-06-02 15:36:07','','input','Y',NULL,'Y','Y','N','N','Y','email',NULL,'','邮箱',1,'4028b2ec7273bd33017273e7c2c60026',NULL,'2020-06-02 15:48:22'),('4028b2ec7273f082017273f579050010','性别','sex','String',NULL,'2020-06-02 15:36:07','sys_user_sex','radio','Y',NULL,'Y','Y','N','N','Y','sex',NULL,'','性别',1,'4028b2ec7273bd33017273e7c2c60026',NULL,'2020-06-02 15:48:22'),('4028b2ec7273f082017273f579060011','姓名','name','String',NULL,'2020-06-02 15:36:07','','input','Y',NULL,'Y','Y','N','Y','Y','name',NULL,'LIKE','姓名',1,'4028b2ec7273bd33017273e7c2c60026',NULL,'2020-06-02 15:48:22'),('4028b2ec7273f082017273f579070012','微信名称','weixin_name','String',NULL,'2020-06-02 15:36:07','','input','N',NULL,'N','Y','N','N','N','weixinName',NULL,'','微信名称',1,'4028b2ec7273bd33017273e7c2c60026',NULL,'2020-06-02 15:48:22'),('4028b2ec7273f082017273f579090013','微信ID','weixin_id','String',NULL,'2020-06-02 15:36:07','','input','N',NULL,'N','N','N','N','N','weixinId',NULL,'','微信ID',1,'4028b2ec7273bd33017273e7c2c60026',NULL,'2020-06-02 15:48:22'),('4028b2ec7273f082017273f5ad0f0015','创建时间','create_time','Date',NULL,'2020-06-02 15:36:20','','input','N',NULL,'N','N','N','N','N','createTime',NULL,'','创建时间',1,'4028b2ec7273bd33017273e7c2c60026',NULL,'2020-06-02 15:48:22'),('4028b2ec7273f082017273f5ad100016','创建者','create_by','String',NULL,'2020-06-02 15:36:20','','input','N',NULL,'N','N','N','N','N','createBy',NULL,'','创建者',1,'4028b2ec7273bd33017273e7c2c60026',NULL,'2020-06-02 15:48:22'),('4028b2ec7273f082017273f5cc2b0018','更新时间','update_time','Date',NULL,'2020-06-02 15:36:28','','input','N',NULL,'N','N','N','N','N','updateTime',NULL,'','更新时间',1,'4028b2ec7273bd33017273e7c2c60026',NULL,'2020-06-02 15:48:22'),('4028b2ec7273f082017273f5cc2c0019','更新者','update_by','String',NULL,'2020-06-02 15:36:28','','input','N',NULL,'N','N','N','N','N','updateBy',NULL,'','更新者',1,'4028b2ec7273bd33017273e7c2c60026',NULL,'2020-06-02 15:48:22'),('4028b2ec7273f082017273f5e72b001b','备注','remark','String',NULL,'2020-06-02 15:36:35','','input','Y',NULL,'Y','N','N','N','N','remark',NULL,'','备注',1,'4028b2ec7273bd33017273e7c2c60026',NULL,'2020-06-02 15:48:22'),('4028b2ec7273f082017273f972460020','数据状态','status','String',NULL,'2020-06-02 15:40:27','sys_data_status','radio','Y',NULL,'Y','N','N','N','N','status',NULL,'','数据状态',1,'4028b2ec7273bd33017273e7c2c60026',NULL,'2020-06-02 15:48:22'),('4028b2ec72794bfa01727954b4f6000f','唯一标识','id','String',NULL,'2020-06-03 16:38:14','','input','N',NULL,'N','N','Y','N','Y','id',NULL,'','唯一标识',1,'4028b2ec72794bfa01727953b69c0001',NULL,'2020-06-03 16:59:21'),('4028b2ec72794bfa0172795522e40011','联系人','name','String',NULL,'2020-06-03 16:38:42','','input','Y',NULL,'Y','Y','N','Y','Y','name',NULL,'LIKE','姓名',1,'4028b2ec72794bfa01727953b69c0001',NULL,'2020-06-03 16:59:21'),('4028b2ec72794bfa017279558f980014','联系电话','phone','String',NULL,'2020-06-03 16:39:10','','input','Y',NULL,'Y','Y','N','Y','Y','phone',NULL,'LIKE','联系电话',1,'4028b2ec72794bfa01727953b69c0001',NULL,'2020-06-03 16:59:21'),('4028b2ec72794bfa0172795607c00018','联系地址','address','String',NULL,'2020-06-03 16:39:41','','input','Y',NULL,'Y','Y','N','Y','Y','address',NULL,'','联系地址',1,'4028b2ec72794bfa01727953b69c0001',NULL,'2020-06-03 16:59:21'),('4028b2ec72794bfa01727956e0b5001c','门牌号','house_num','String',NULL,'2020-06-03 16:40:36','','input','Y',NULL,'Y','Y','N','Y','Y','houseNum',NULL,'','门牌号',1,'4028b2ec72794bfa01727953b69c0001',NULL,'2020-06-03 16:59:21'),('4028b2ec72794bfa01727957ceae0021','是否默认（1是 0否）','is_default','String',NULL,'2020-06-03 16:41:37','sys_yes_no','radio','Y',NULL,'Y','Y','N','Y','N','isDefault',NULL,'','是否默认（1是 0否）',1,'4028b2ec72794bfa01727953b69c0001',NULL,'2020-06-03 16:59:21'),('4028b2ec72794bfa0172796343c40027','经度','longitude','String',NULL,'2020-06-03 16:54:08','','input','N',NULL,'N','N','N','N','N','longitude',NULL,'','经度',1,'4028b2ec72794bfa01727953b69c0001',NULL,'2020-06-03 16:59:21'),('4028b2ec72794bfa0172796343c50028','纬度','latitude','String',NULL,'2020-06-03 16:54:08','','input','N',NULL,'N','N','N','N','N','latitude',NULL,'','纬度',1,'4028b2ec72794bfa01727953b69c0001',NULL,'2020-06-03 16:59:21'),('4028b2ec72794bfa01727966586a0039','备注','remark','String',NULL,'2020-06-03 16:57:30','','input','Y',NULL,'Y','N','N','N','N','remark',NULL,'','备注',1,'4028b2ec72794bfa01727953b69c0001',NULL,'2020-06-03 16:59:21'),('4028b2ec72794bfa01727966586b003a','更新时间','update_time','Date',NULL,'2020-06-03 16:57:30','','input','N',NULL,'N','N','N','N','N','updateTime',NULL,'','更新时间',1,'4028b2ec72794bfa01727953b69c0001',NULL,'2020-06-03 16:59:21'),('4028b2ec72794bfa01727966586c003b','更新者','update_by','String',NULL,'2020-06-03 16:57:30','','input','N',NULL,'N','N','N','N','N','updateBy',NULL,'','更新者',1,'4028b2ec72794bfa01727953b69c0001',NULL,'2020-06-03 16:59:21'),('4028b2ec72794bfa01727966586d003c','创建时间','create_time','Date',NULL,'2020-06-03 16:57:30','','input','N',NULL,'N','N','N','N','N','createTime',NULL,'','创建时间',1,'4028b2ec72794bfa01727953b69c0001',NULL,'2020-06-03 16:59:21'),('4028b2ec72794bfa01727966586e003d','创建者','create_by','String',NULL,'2020-06-03 16:57:30','','input','N',NULL,'N','N','N','N','N','createBy',NULL,'','创建者',1,'4028b2ec72794bfa01727953b69c0001',NULL,'2020-06-03 16:59:21'),('4028b2ec7292caa6017292cda0890003','唯一标识','id','String',NULL,'2020-06-08 15:20:49','','input','N',NULL,'N','N','Y','N','Y','id',NULL,'','唯一标识',1,'4028b2ec7292caa6017292cd4e530001',NULL,'2020-06-08 15:31:49'),('4028b2ec7292caa6017292cf071d0007','图片路径','img_src','String',NULL,'2020-06-08 15:22:21','','input','Y',NULL,'Y','Y','N','N','N','imgSrc',NULL,'','',1,'4028b2ec7292caa6017292cd4e530001',NULL,'2020-06-08 15:31:49'),('4028b2ec7292caa6017292cf7b76000b','位置','position','String',NULL,'2020-06-08 15:22:51','mall_img_position','select','Y',NULL,'Y','Y','N','N','N','position',NULL,'','',1,'4028b2ec7292caa6017292cd4e530001',NULL,'2020-06-08 15:31:49'),('4028b2ec7292caa6017292d0f59f000f','背景元素','background','String',NULL,'2020-06-08 15:24:27','','input','Y',NULL,'Y','Y','N','N','N','background',NULL,'','',1,'4028b2ec7292caa6017292cd4e530001',NULL,'2020-06-08 15:31:49'),('4028b2ec7292caa6017292d15d270011','备注','remark','String',NULL,'2020-06-08 15:24:54','','input','Y',NULL,'Y','N','N','N','N','remark',NULL,'','备注',1,'4028b2ec7292caa6017292cd4e530001',NULL,'2020-06-08 15:31:49'),('4028b2ec7292caa6017292d15d280012','更新时间','update_time','Date',NULL,'2020-06-08 15:24:54','','input','N',NULL,'N','N','N','N','N','updateTime',NULL,'','更新时间',1,'4028b2ec7292caa6017292cd4e530001',NULL,'2020-06-08 15:31:49'),('4028b2ec7292caa6017292d15d290013','更新者','update_by','String',NULL,'2020-06-08 15:24:54','','input','N',NULL,'N','N','N','N','N','updateBy',NULL,'','更新者',1,'4028b2ec7292caa6017292cd4e530001',NULL,'2020-06-08 15:31:49'),('4028b2ec7292caa6017292d15d2a0014','创建时间','create_time','Date',NULL,'2020-06-08 15:24:54','','input','N',NULL,'N','N','N','N','N','createTime',NULL,'','创建时间',1,'4028b2ec7292caa6017292cd4e530001',NULL,'2020-06-08 15:31:49'),('4028b2ec7292caa6017292d1816c0016','创建者','create_by','String',NULL,'2020-06-08 15:25:03','','input','N',NULL,'N','N','N','N','N','createBy',NULL,'','创建者',1,'4028b2ec7292caa6017292cd4e530001',NULL,'2020-06-08 15:31:49'),('4028b2ec7292caa6017292d2b537001a','标题','title','String',NULL,'2020-06-08 15:26:22','','input','Y',NULL,'Y','Y','N','Y','N','title',NULL,'LIKE','',1,'4028b2ec7292caa6017292cd4e530001',NULL,'2020-06-08 15:31:49'),('4028b2ec72a231830172a236be4f0019','唯一标识','id','String',NULL,'2020-06-11 15:09:56','','input','N',NULL,'N','N','Y','N','Y','id',NULL,'','唯一标识',1,'4028b2ec72a231830172a235da400005',NULL,'2020-06-11 15:22:16'),('4028b2ec72a231830172a237bbf80028','目录名称','name','String',NULL,'2020-06-11 15:11:01','','input','Y',NULL,'Y','Y','N','Y','N','name',NULL,'LIKE','姓名',1,'4028b2ec72a231830172a235da400005',NULL,'2020-06-11 15:22:16'),('4028b2ec72a231830172a238b7f40030','父编号','parent_id','String',NULL,'2020-06-11 15:12:06','','input','N',NULL,'N','N','N','N','N','parentId',NULL,'','',1,'4028b2ec72a231830172a235da400005',NULL,'2020-06-11 15:22:16'),('4028b2ec72a231830172a23a4e58003a','备注','remark','String',NULL,'2020-06-11 15:13:50','','input','Y',NULL,'Y','N','N','N','N','remark',NULL,'','备注',1,'4028b2ec72a231830172a235da400005',NULL,'2020-06-11 15:22:16'),('4028b2ec72a231830172a23a4e59003b','更新时间','update_time','Date',NULL,'2020-06-11 15:13:50','','input','N',NULL,'N','N','N','N','N','updateTime',NULL,'','更新时间',1,'4028b2ec72a231830172a235da400005',NULL,'2020-06-11 15:22:16'),('4028b2ec72a231830172a23a4e59003c','更新者','update_by','String',NULL,'2020-06-11 15:13:50','','input','N',NULL,'N','N','N','N','N','updateBy',NULL,'','更新者',1,'4028b2ec72a231830172a235da400005',NULL,'2020-06-11 15:22:16'),('4028b2ec72a231830172a23a4e5a003d','创建时间','create_time','Date',NULL,'2020-06-11 15:13:50','','input','N',NULL,'N','N','N','N','N','createTime',NULL,'','创建时间',1,'4028b2ec72a231830172a235da400005',NULL,'2020-06-11 15:22:16'),('4028b2ec72a231830172a23a4e5a003e','创建者','create_by','String',NULL,'2020-06-11 15:13:50','','input','N',NULL,'N','N','N','N','N','createBy',NULL,'','创建者',1,'4028b2ec72a231830172a235da400005',NULL,'2020-06-11 15:22:16'),('4028b2ec72c523730172c54b34fc0014','唯一标识','id','String',NULL,'2020-06-18 10:39:00','','input','N',NULL,'N','N','Y','N','Y','id',NULL,'','唯一标识',1,'4028b2ec72c523730172c54aeb0f0012',NULL,'2020-06-18 11:08:27'),('4028b2ec72c523730172c54c22990018','目录编号','catalog_id','String',NULL,'2020-06-18 10:40:01','','input','Y',NULL,'Y','N','N','N','N','catalogId',NULL,'EQ','',1,'4028b2ec72c523730172c54aeb0f0012',NULL,'2020-06-18 11:08:27'),('4028b2ec72c523730172c54c5ea7001a','名称','name','String',NULL,'2020-06-18 10:40:16','','input','Y',NULL,'Y','Y','N','Y','N','name',NULL,'LIKE','姓名',1,'4028b2ec72c523730172c54aeb0f0012',NULL,'2020-06-18 11:08:27'),('4028b2ec72c523730172c5540aa60021','品牌','brand','String',NULL,'2020-06-18 10:48:39','','input','Y',NULL,'Y','Y','N','Y','N','brand',NULL,'LIKE','',1,'4028b2ec72c523730172c54aeb0f0012',NULL,'2020-06-18 11:08:27'),('4028b2ec72c523730172c555725a0026','描述','description','String',NULL,'2020-06-18 10:50:11','','input','Y',NULL,'Y','N','N','N','N','description',NULL,'','',1,'4028b2ec72c523730172c54aeb0f0012',NULL,'2020-06-18 11:08:27'),('4028b2ec72c523730172c555dfef002a','型号','model','String',NULL,'2020-06-18 10:50:39','','input','Y',NULL,'Y','Y','N','Y','N','model',NULL,'LIKE','',1,'4028b2ec72c523730172c54aeb0f0012',NULL,'2020-06-18 11:08:27'),('4028b2ec72c523730172c5565482002e','材质','material','String',NULL,'2020-06-18 10:51:09','','input','Y',NULL,'Y','Y','N','Y','N','material',NULL,'LIKE','',1,'4028b2ec72c523730172c54aeb0f0012',NULL,'2020-06-18 11:08:27'),('4028b2ec72c523730172c556ebed0033','颜色','color','String',NULL,'2020-06-18 10:51:48','','input','Y',NULL,'Y','Y','N','N','N','color',NULL,'','',1,'4028b2ec72c523730172c54aeb0f0012',NULL,'2020-06-18 11:08:27'),('4028b2ec72c523730172c5579ed20039','款式','style','String',NULL,'2020-06-18 10:52:33','','input','Y',NULL,'Y','Y','N','N','N','style',NULL,'','',1,'4028b2ec72c523730172c54aeb0f0012',NULL,'2020-06-18 11:08:27'),('4028b2ec72c523730172c5579ed2003a','尺寸','size','String',NULL,'2020-06-18 10:52:33','','input','Y',NULL,'Y','Y','N','N','N','size',NULL,'','',1,'4028b2ec72c523730172c54aeb0f0012',NULL,'2020-06-18 11:08:27'),('4028b2ec72c523730172c559c4fe0043','毛重','gross_weight','Double',NULL,'2020-06-18 10:54:54','','input','Y',NULL,'Y','N','N','N','N','grossWeight',NULL,'','',1,'4028b2ec72c523730172c54aeb0f0012',NULL,'2020-06-18 11:08:27'),('4028b2ec72c523730172c559c4fe0044','净重','net_weight','Double',NULL,'2020-06-18 10:54:54','','input','Y',NULL,'Y','N','N','N','N','netWeight',NULL,'','',1,'4028b2ec72c523730172c54aeb0f0012',NULL,'2020-06-18 11:08:27'),('4028b2ec72c523730172c55d10500048','计量单位','measure','String',NULL,'2020-06-18 10:58:30','','input','Y',NULL,'Y','Y','N','N','N','measure',NULL,'','',1,'4028b2ec72c523730172c54aeb0f0012',NULL,'2020-06-18 11:08:27'),('4028b2ec72c523730172c55f785c004b','备注','remark','String',NULL,'2020-06-18 11:01:08','','textarea','Y',NULL,'Y','N','N','N','N','remark',NULL,'','备注',1,'4028b2ec72c523730172c54aeb0f0012',NULL,'2020-06-18 11:08:27'),('4028b2ec72c523730172c55f785c004c','更新时间','update_time','Date',NULL,'2020-06-18 11:01:08','','input','N',NULL,'N','N','N','N','N','updateTime',NULL,'','更新时间',1,'4028b2ec72c523730172c54aeb0f0012',NULL,'2020-06-18 11:08:27'),('4028b2ec72c523730172c55f785c004d','更新者','update_by','String',NULL,'2020-06-18 11:01:08','','input','N',NULL,'N','N','N','N','N','updateBy',NULL,'','更新者',1,'4028b2ec72c523730172c54aeb0f0012',NULL,'2020-06-18 11:08:27'),('4028b2ec72c523730172c55f785d004e','创建时间','create_time','Date',NULL,'2020-06-18 11:01:08','','input','N',NULL,'N','N','N','N','N','createTime',NULL,'','创建时间',1,'4028b2ec72c523730172c54aeb0f0012',NULL,'2020-06-18 11:08:27'),('4028b2ec72c523730172c55f785d004f','创建者','create_by','String',NULL,'2020-06-18 11:01:08','','input','N',NULL,'N','N','N','N','N','createBy',NULL,'','创建者',1,'4028b2ec72c523730172c54aeb0f0012',NULL,'2020-06-18 11:08:27');
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;
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
INSERT INTO `sys_menu` VALUES ('40283e816f8d4089016f8d420c4c0003','admin','2020-01-10 10:21:54','fa fa-sliders','流程管理','catalog',2,'root','',NULL,'menuItem','admin','2020-04-22 17:20:41','','0',',root'),('40283e816f8d4089016f8d43534b0006','admin','2020-01-10 10:23:17','','流程模板','menu',1,'40283e816f8d4089016f8d420c4c0003','flowable:modeler:view',NULL,'menuItem','admin','2020-02-11 21:18:27','/flowable/modeler','0',',root,40283e816f8d4089016f8d420c4c0003'),('40283e816f8ed7d2016f8ed942780001','admin','2020-01-10 17:46:41','fa fa-gift','流程演示','catalog',4,'root','',NULL,'menuItem','admin','2020-02-15 18:50:50','','0',',root'),('40283e816f8ed7d2016f8eda4eb00003','admin','2020-01-10 17:47:49','','报销管理','menu',1,'40283e816f8ed7d2016f8ed942780001','demo:expense:view',NULL,'menuItem',NULL,NULL,'/demo/expense','0',''),('40283e816f8ed7d2016f8edb2ed20005','admin','2020-01-10 17:48:47','','报销查询','button',1,'40283e816f8ed7d2016f8eda4eb00003','demo:expense:list',NULL,'menuItem',NULL,NULL,'','0',''),('40283e816f8ed7d2016f8edb81d10007','admin','2020-01-10 17:49:08','','报销新增','button',2,'40283e816f8ed7d2016f8eda4eb00003','demo:expense:add',NULL,'menuItem',NULL,NULL,'','0',''),('40283e816f8ed7d2016f8edbda4e0009','admin','2020-01-10 17:49:31','','报销修改','button',3,'40283e816f8ed7d2016f8eda4eb00003','demo:expense:edit',NULL,'menuItem',NULL,NULL,'','0',''),('40283e816f8ed7d2016f8edc1cf9000b','admin','2020-01-10 17:49:48','','报销删除','button',4,'40283e816f8ed7d2016f8eda4eb00003','demo:expense:remove',NULL,'menuItem',NULL,NULL,'','0',''),('40283e816f94047b016f9405ae250001','admin','2020-01-11 17:53:18','fa fa-database','发布管理','catalog',3,'40283e816f8d4089016f8d420c4c0003','',NULL,'menuItem','admin','2020-02-11 18:29:30','','0',',root,40283e816f8d4089016f8d420c4c0003'),('40283e816f9d0921016f9d12329a0009','admin','2020-01-13 12:03:33','','新增','button',1,'40283e816f8d4089016f8d43534b0006','system:modeler:add',NULL,'menuItem','admin','2020-01-13 16:10:07','','0',',root,40283e816f8d4089016f8d420c4c0003,40283e816f8d4089016f8d43534b0006'),('40283e816f9d0921016f9d129946000b','admin','2020-01-13 12:03:59','','修改','button',2,'40283e816f8d4089016f8d43534b0006','flowable:modeler:edit',NULL,'menuItem','admin','2020-01-13 16:10:32','','0',',root,40283e816f8d4089016f8d420c4c0003,40283e816f8d4089016f8d43534b0006'),('40283e816f9d0921016f9d12e584000d','admin','2020-01-13 12:04:19','','删除','button',3,'40283e816f8d4089016f8d43534b0006','flowable:modeler:remove',NULL,'menuItem','admin','2020-01-13 16:10:51','','0',',root,40283e816f8d4089016f8d420c4c0003,40283e816f8d4089016f8d43534b0006'),('40283e816f9de0d5016f9dee83d90008','admin','2020-01-13 16:04:12','','流程图','button',4,'40283e816f8d4089016f8d43534b0006','flowable:modeler:image',NULL,'menuItem','admin','2020-07-12 09:55:30','','0',',root,40283e816f8d4089016f8d420c4c0003,40283e816f8d4089016f8d43534b0006'),('40283e816f9de0d5016f9deef439000a','admin','2020-01-13 16:04:41','','发布','button',3,'40283e816f94047b016f9405ae250001','flowable:process:publish',NULL,'menuItem','admin','2020-01-13 16:11:36','','0',',root,40283e816f8d4089016f8d420c4c0003,40283e816f94047b016f9405ae250001'),('40283e816f9de0d5016f9def3ad9000c','admin','2020-01-13 16:04:59','','取消发布','button',4,'40283e816f94047b016f9405ae250001','flowable:process:unPublish',NULL,'menuItem','admin','2020-01-13 16:11:42','','0',',root,40283e816f8d4089016f8d420c4c0003,40283e816f94047b016f9405ae250001'),('40283e816fad93ca016fad95619f0004','admin','2020-01-16 17:00:46','fa fa-envelope-o','任务管理','catalog',3,'root','',NULL,'menuItem',NULL,NULL,'','0',''),('40283e816fad93ca016fad964b710006','admin','2020-01-16 17:01:46','fa fa-address-book','我的任务','catalog',1,'40283e816fad93ca016fad95619f0004','',NULL,'menuItem','admin','2020-01-18 10:54:28','','0','null,40283e816fad93ca016fad95619f0004'),('40283e816fad93ca016fad96d4db0008','admin','2020-01-16 17:02:21','','待办任务','menu',2,'40283e816fad93ca016fad95619f0004','flowable:task:view',NULL,'menuItem','admin','2020-07-11 13:00:53','/flowable/task/task/3','0',',40283e816fad93ca016fad95619f0004'),('40283e816fad93ca016fad97367b000a','admin','2020-01-16 17:02:46','','经办任务','menu',3,'40283e816fad93ca016fad95619f0004','flowable:task:view',NULL,'menuItem','admin','2020-07-11 13:01:08','/flowable/task/task/4','0',',40283e816fad93ca016fad95619f0004'),('40283e816fad93ca016fada7346d0035','admin','2020-01-16 17:20:14','','任务查询','button',5,'40283e816fad93ca016fad95619f0004','flowable:task:list',NULL,'menuItem','admin','2020-01-19 17:17:27','','0','null,40283e816fad93ca016fad95619f0004'),('40283e816fad93ca016fada787940037','admin','2020-01-16 17:20:35','','任务办理','button',6,'40283e816fad93ca016fad95619f0004','flowable:task:edit',NULL,'menuItem','admin','2020-01-19 17:17:34','','0','null,40283e816fad93ca016fad95619f0004'),('40283e816fb691df016fb6936b730003','admin','2020-01-18 10:55:12','','待发送','menu',1,'40283e816fad93ca016fad964b710006','flowable:task:view',NULL,'menuItem','admin','2020-07-09 14:51:28','/flowable/task/myself/0','0','null,40283e816fad93ca016fad95619f0004,40283e816fad93ca016fad964b710006'),('40283e816fb691df016fb6947ace0007','admin','2020-01-18 10:56:22','','已办结','menu',3,'40283e816fad93ca016fad964b710006','flowable:task:view',NULL,'menuItem','admin','2020-02-12 17:10:36','/flowable/task/myself/2','0','null,40283e816fad93ca016fad95619f0004,40283e816fad93ca016fad964b710006'),('40283e816fb8fb58016fb8fcca990002','admin','2020-01-18 22:09:32','','已发送','menu',2,'40283e816fad93ca016fad964b710006','flowable:common:view',NULL,'menuItem','admin','2020-07-09 14:51:40','/flowable/task/myself/1','0','null,40283e816fad93ca016fad95619f0004,40283e816fad93ca016fad964b710006'),('40283e817033b5f7017033b783410001','admin','2020-02-11 18:07:10','','查询','button',1,'402880e46f9ecae8016f9ecc9c7e0001','flowable:user:list',NULL,'menuItem',NULL,NULL,'','0',''),('40283e817033b5f7017033cbd3fe0005','admin','2020-02-11 18:29:21','','流程类型','menu',2,'40283e816f8d4089016f8d420c4c0003','flowable:type:view',NULL,'menuItem',NULL,NULL,'/flowable/type','0',''),('40283e817034009f01703401fd1d0001','admin','2020-02-11 19:28:30','','查询','button',1,'40283e817033b5f7017033cbd3fe0005','flowable:type:list',NULL,'menuItem',NULL,NULL,'','0',''),('40283e817034009f017034023c610003','admin','2020-02-11 19:28:47','','新增','button',2,'40283e817033b5f7017033cbd3fe0005','flowable:type:add',NULL,'menuItem',NULL,NULL,'','0',''),('40283e817034009f01703402814d0005','admin','2020-02-11 19:29:04','','修改','button',3,'40283e817033b5f7017033cbd3fe0005','flowable:type:edit',NULL,'menuItem',NULL,NULL,'','0',''),('40283e817034009f01703402c9210007','admin','2020-02-11 19:29:23','','删除','button',4,'40283e817033b5f7017033cbd3fe0005','flowable:type:remove',NULL,'menuItem',NULL,NULL,'','0',''),('40283e8170470c040170470dc5c90001','admin','2020-02-15 12:14:10','','约束管理','menu',7,'402855816f31c4de016f31c4f6260024','system:filter:view',NULL,'menuItem',NULL,NULL,'/system/filter','0',''),('40283e8170470c040170470fab270006','admin','2020-02-15 12:16:14','','约束查询','button',1,'40283e8170470c040170470dc5c90001','system:filter:list',NULL,'menuItem',NULL,NULL,'','0',''),('40283e8170470c04017047101c110008','admin','2020-02-15 12:16:43','','约束新增','button',2,'40283e8170470c040170470dc5c90001','system:filter:add',NULL,'menuItem',NULL,NULL,'','0',''),('40283e8170470c04017047107206000a','admin','2020-02-15 12:17:05','','约束修改','button',3,'40283e8170470c040170470dc5c90001','system:filter:edit',NULL,'menuItem',NULL,NULL,'','0',''),('40283e8170470c0401704710b2d8000c','admin','2020-02-15 12:17:22','','约束删除','button',4,'40283e8170470c040170470dc5c90001','system:filter:remove',NULL,'menuItem',NULL,NULL,'','0',''),('402855816f31c4de016f31c4f6260024','system','2019-12-23 15:59:49','fa fa-gear','系统管理','catalog',1,'root','','系统管理目录','menuItem','admin','2020-06-02 10:41:38','','0',',root'),('402855816f31c4de016f31c4f6350025','system','2019-12-23 15:59:49','fa fa-video-camera','系统监控','catalog',5,'root','','系统监控目录','menuItem','admin','2020-02-15 18:50:36','','0',',root'),('402855816f31c4de016f31c4f6470027','system','2019-12-23 15:59:49','','用户管理','menu',1,'402855816f31c4de016f31c4f6260024','system:user:view','用户管理菜单','menuItem','admin','2019-12-25 15:43:53','/system/user','0',',root,402855816f31c4de016f31c4f6260024'),('402855816f31c4de016f31c4f6570028','system','2019-12-23 15:59:49','','角色管理','menu',2,'402855816f31c4de016f31c4f6260024','system:role:view','角色管理菜单','menuItem','admin','2019-12-25 15:44:23','/system/role','0',',root,402855816f31c4de016f31c4f6260024'),('402855816f31c4de016f31c4f6580029','system','2019-12-23 15:59:49','','菜单管理','menu',5,'402855816f31c4de016f31c4f6260024','system:menu:view','菜单管理菜单','menuItem','admin','2019-12-25 15:56:31','/system/menu','0',',root,402855816f31c4de016f31c4f6260024'),('402855816f31c4de016f31c4f668002a','system','2019-12-23 15:59:49','','部门管理','menu',3,'402855816f31c4de016f31c4f6260024','system:dept:view','部门管理菜单','menuItem','admin','2019-12-25 15:56:11','/system/dept','0',',root,402855816f31c4de016f31c4f6260024'),('402855816f31c4de016f31c4f67a002b','system','2019-12-23 15:59:49','','岗位管理','menu',4,'402855816f31c4de016f31c4f6260024','system:post:view','岗位管理菜单','menuItem','admin','2019-12-25 15:56:23','/system/post','0',',root,402855816f31c4de016f31c4f6260024'),('402855816f31c4de016f31c4f67a002c','system','2019-12-23 15:59:49','','字典管理','menu',6,'402855816f31c4de016f31c4f6260024','system:dictionary:view','字典管理菜单','menuItem','admin','2020-04-22 18:06:02','/system/dictionary','0',',root,402855816f31c4de016f31c4f6260024'),('402855816f31c4de016f31c4f689002d','system','2019-12-23 15:59:49','','参数设置','menu',8,'402855816f31c4de016f31c4f6260024','system:config:view','参数设置菜单','menuItem','admin','2020-02-15 12:15:00','/system/config','0',',root,402855816f31c4de016f31c4f6260024'),('402855816f31c4de016f31c4f69b002e','system','2019-12-23 15:59:49','','通知公告','menu',9,'402855816f31c4de016f31c4f6260024','system:notice:view','通知公告菜单','menuItem','admin','2020-02-15 12:15:10','/system/notice','0',',root,402855816f31c4de016f31c4f6260024'),('402855816f31c4de016f31c4f6a5002f','system','2019-12-23 15:59:49','','日志管理','catalog',2,'402855816f31c4de016f31c4f6350025','','日志管理菜单','menuItem','admin','2020-02-22 10:01:23','','0',',root,402855816f31c4de016f31c4f6350025'),('402855816f31c4de016f31c4f6ae0030','system','2019-12-23 15:59:49','','在线用户','menu',1,'402855816f31c4de016f31c4f6350025','monitor:online:view','在线用户菜单','menuItem','admin','2019-12-25 15:45:48','/monitor/online','0',',root,402855816f31c4de016f31c4f6350025'),('402855816f31c4de016f31c4f6bd0031','system','2019-12-23 15:59:49','','服务监控','menu',3,'402855816f31c4de016f31c4f6350025','monitor:server:view','服务监控菜单','menuItem','admin','2019-12-25 15:45:52','/monitor/server','0',',root,402855816f31c4de016f31c4f6350025'),('402855816f31c4de016f31c4f6e20035','system','2019-12-23 15:59:49','','操作日志','menu',1,'402855816f31c4de016f31c4f6a5002f','monitor:operlog:view','操作日志菜单','menuItem','admin','2019-12-25 15:46:34','/monitor/operlog','0',',root,402855816f31c4de016f31c4f6350025,402855816f31c4de016f31c4f6a5002f'),('402855816f31c4de016f31c4f6e70036','system','2019-12-23 15:59:49','','登录日志','menu',2,'402855816f31c4de016f31c4f6a5002f','monitor:logininfo:view','登录日志菜单','menuItem','admin','2019-12-25 15:46:39','/monitor/logininfo','0',',root,402855816f31c4de016f31c4f6350025,402855816f31c4de016f31c4f6a5002f'),('402855816f31c4de016f31c4f6ec0037','system','2019-12-23 15:59:49','','用户查询','button',1,'402855816f31c4de016f31c4f6470027','system:user:list','','menuItem','admin','2019-12-25 15:44:07','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f6470027'),('402855816f31c4de016f31c4f6f30038','system','2019-12-23 15:59:49','','用户新增','button',2,'402855816f31c4de016f31c4f6470027','system:user:add','','menuItem','admin','2019-12-25 15:46:49','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f6470027'),('402855816f31c4de016f31c4f6f90039','system','2019-12-23 15:59:49','','用户修改','button',3,'402855816f31c4de016f31c4f6470027','system:user:edit','','menuItem','admin','2019-12-25 15:46:53','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f6470027'),('402855816f31c4de016f31c4f6fe003a','system','2019-12-23 15:59:50','','用户删除','button',4,'402855816f31c4de016f31c4f6470027','system:user:remove','','menuItem','admin','2019-12-25 15:47:07','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f6470027'),('402855816f31c4de016f31c4f703003b','system','2019-12-23 15:59:50','','用户导出','button',5,'402855816f31c4de016f31c4f6470027','system:user:export','','menuItem','admin','2019-12-25 15:47:12','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f6470027'),('402855816f31c4de016f31c4f709003c','system','2019-12-23 15:59:50','','用户导入','button',6,'402855816f31c4de016f31c4f6470027','system:user:import','','menuItem','admin','2019-12-25 15:47:17','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f6470027'),('402855816f31c4de016f31c4f710003d','system','2019-12-23 15:59:50','','重置密码','button',7,'402855816f31c4de016f31c4f6470027','system:user:resetPwd','','menuItem','admin','2019-12-25 15:47:21','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f6470027'),('402855816f31c4de016f31c4f716003e','system','2019-12-23 15:59:50','','角色查询','button',1,'402855816f31c4de016f31c4f6570028','system:role:list','','menuItem','admin','2019-12-25 15:47:37','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f6570028'),('402855816f31c4de016f31c4f71d003f','system','2019-12-23 15:59:50','','角色新增','button',2,'402855816f31c4de016f31c4f6570028','system:role:add','','menuItem','admin','2019-12-25 15:49:21','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f6570028'),('402855816f31c4de016f31c4f7240040','system','2019-12-23 15:59:50','','角色修改','button',3,'402855816f31c4de016f31c4f6570028','system:role:edit','','menuItem','admin','2019-12-25 15:49:26','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f6570028'),('402855816f31c4de016f31c4f7290041','system','2019-12-23 15:59:50','','角色删除','button',4,'402855816f31c4de016f31c4f6570028','system:role:remove','','menuItem','admin','2019-12-25 15:49:32','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f6570028'),('402855816f31c4de016f31c4f72f0042','system','2019-12-23 15:59:50','','角色导出','button',5,'402855816f31c4de016f31c4f6570028','system:role:export','','menuItem','admin','2019-12-25 15:49:37','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f6570028'),('402855816f31c4de016f31c4f7340043','system','2019-12-23 15:59:50','','菜单查询','button',1,'402855816f31c4de016f31c4f6580029','system:menu:list','','menuItem','admin','2019-12-25 15:47:59','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f6580029'),('402855816f31c4de016f31c4f7340044','system','2019-12-23 15:59:50','','菜单新增','button',2,'402855816f31c4de016f31c4f6580029','system:menu:add','','menuItem','admin','2019-12-25 15:48:06','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f6580029'),('402855816f31c4de016f31c4f7450045','system','2019-12-23 15:59:50','','菜单修改','button',3,'402855816f31c4de016f31c4f6580029','system:menu:edit','','menuItem','admin','2019-12-25 15:47:48','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f6580029'),('402855816f31c4de016f31c4f74b0046','system','2019-12-23 15:59:50','','菜单删除','button',4,'402855816f31c4de016f31c4f6580029','system:menu:remove','','menuItem','admin','2019-12-25 15:48:19','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f6580029'),('402855816f31c4de016f31c4f7530047','system','2019-12-23 15:59:50','','部门查询','button',1,'402855816f31c4de016f31c4f668002a','system:dept:list','','menuItem','admin','2019-12-25 15:50:01','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f668002a'),('402855816f31c4de016f31c4f7590048','system','2019-12-23 15:59:50','','部门新增','button',2,'402855816f31c4de016f31c4f668002a','system:dept:add','','menuItem','admin','2019-12-25 15:50:07','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f668002a'),('402855816f31c4de016f31c4f75f0049','system','2019-12-23 15:59:50','','部门修改','button',3,'402855816f31c4de016f31c4f668002a','system:dept:edit','','menuItem','admin','2019-12-25 15:50:12','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f668002a'),('402855816f31c4de016f31c4f765004a','system','2019-12-23 15:59:50','','部门删除','button',4,'402855816f31c4de016f31c4f668002a','system:dept:remove','','menuItem','admin','2019-12-25 15:49:04','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f668002a'),('402855816f31c4de016f31c4f76c004b','system','2019-12-23 15:59:50','','岗位查询','button',1,'402855816f31c4de016f31c4f67a002b','system:post:list','','menuItem','admin','2019-12-25 15:48:30','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f67a002b'),('402855816f31c4de016f31c4f773004c','system','2019-12-23 15:59:50','','岗位新增','button',2,'402855816f31c4de016f31c4f67a002b','system:post:add','','menuItem','admin','2019-12-25 15:48:37','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f67a002b'),('402855816f31c4de016f31c4f775004d','system','2019-12-23 15:59:50','','岗位修改','button',3,'402855816f31c4de016f31c4f67a002b','system:post:edit','','menuItem','admin','2019-12-25 15:48:48','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f67a002b'),('402855816f31c4de016f31c4f775004e','system','2019-12-23 15:59:50','','岗位删除','button',4,'402855816f31c4de016f31c4f67a002b','system:post:remove','','menuItem','admin','2019-12-25 15:48:58','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f67a002b'),('402855816f31c4de016f31c4f788004f','system','2019-12-23 15:59:50','','岗位导出','button',5,'402855816f31c4de016f31c4f67a002b','system:post:export','','menuItem','admin','2019-12-25 15:51:15','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f67a002b'),('402855816f31c4de016f31c4f7900050','system','2019-12-23 15:59:50','','字典查询','button',1,'402855816f31c4de016f31c4f67a002c','system:dict:list','','menuItem','admin','2019-12-25 15:50:29','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f67a002c'),('402855816f31c4de016f31c4f7980051','system','2019-12-23 15:59:50','','字典新增','button',2,'402855816f31c4de016f31c4f67a002c','system:dict:add','','menuItem','admin','2019-12-25 15:50:34','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f67a002c'),('402855816f31c4de016f31c4f79c0052','system','2019-12-23 15:59:50','','字典修改','button',3,'402855816f31c4de016f31c4f67a002c','system:dict:edit','','menuItem','admin','2019-12-25 15:50:39','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f67a002c'),('402855816f31c4de016f31c4f79c0053','system','2019-12-23 15:59:50','','字典删除','button',4,'402855816f31c4de016f31c4f67a002c','system:dict:remove','','menuItem','admin','2019-12-25 15:50:47','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f67a002c'),('402855816f31c4de016f31c4f7ae0054','system','2019-12-23 15:59:50','','字典导出','button',5,'402855816f31c4de016f31c4f67a002c','system:dict:export','','menuItem','admin','2019-12-25 15:50:53','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f67a002c'),('402855816f31c4de016f31c4f7ae0055','system','2019-12-23 15:59:50','','参数查询','button',1,'402855816f31c4de016f31c4f689002d','system:config:list','','menuItem','admin','2019-12-25 15:51:24','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f689002d'),('402855816f31c4de016f31c4f7bd0056','system','2019-12-23 15:59:50','','参数新增','button',2,'402855816f31c4de016f31c4f689002d','system:config:add','','menuItem','admin','2019-12-25 15:51:29','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f689002d'),('402855816f31c4de016f31c4f7bd0057','system','2019-12-23 15:59:50','','参数修改','button',3,'402855816f31c4de016f31c4f689002d','system:config:edit','','menuItem','admin','2019-12-25 15:51:34','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f689002d'),('402855816f31c4de016f31c4f7bd0058','system','2019-12-23 15:59:50','','参数删除','button',4,'402855816f31c4de016f31c4f689002d','system:config:remove','','menuItem','admin','2019-12-25 15:53:09','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f689002d'),('402855816f31c4de016f31c4f7cd0059','system','2019-12-23 15:59:50','','参数导出','button',5,'402855816f31c4de016f31c4f689002d','system:config:export','','menuItem','admin','2019-12-25 15:53:15','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f689002d'),('402855816f31c4de016f31c4f7cd005a','system','2019-12-23 15:59:50','','公告查询','button',1,'402855816f31c4de016f31c4f69b002e','system:notice:list','','menuItem','admin','2019-12-25 15:51:40','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f69b002e'),('402855816f31c4de016f31c4f7cd005b','system','2019-12-23 15:59:50','','公告新增','button',2,'402855816f31c4de016f31c4f69b002e','system:notice:add','','menuItem','admin','2019-12-25 15:51:45','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f69b002e'),('402855816f31c4de016f31c4f7e2005c','system','2019-12-23 15:59:50','','公告修改','button',3,'402855816f31c4de016f31c4f69b002e','system:notice:edit','','menuItem','admin','2019-12-25 15:51:50','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f69b002e'),('402855816f31c4de016f31c4f7e7005d','system','2019-12-23 15:59:50','','公告删除','button',4,'402855816f31c4de016f31c4f69b002e','system:notice:remove','','menuItem','admin','2019-12-25 15:51:55','#','0',',root,402855816f31c4de016f31c4f6260024,402855816f31c4de016f31c4f69b002e'),('402855816f31c4de016f31c4f7ed005e','system','2019-12-23 15:59:50','','操作查询','button',1,'402855816f31c4de016f31c4f6e20035','monitor:operlog:list','','menuItem','admin','2019-12-25 15:52:03','#','0',',root,402855816f31c4de016f31c4f6350025,402855816f31c4de016f31c4f6a5002f,402855816f31c4de016f31c4f6e20035'),('402855816f31c4de016f31c4f7f2005f','system','2019-12-23 15:59:50','','操作删除','button',2,'402855816f31c4de016f31c4f6e20035','monitor:operlog:remove','','menuItem','admin','2019-12-25 15:52:09','#','0',',root,402855816f31c4de016f31c4f6350025,402855816f31c4de016f31c4f6a5002f,402855816f31c4de016f31c4f6e20035'),('402855816f31c4de016f31c4f7f80060','system','2019-12-23 15:59:50','','详细信息','button',3,'402855816f31c4de016f31c4f6e20035','monitor:operlog:detail','','menuItem','admin','2019-12-25 15:52:16','#','0',',root,402855816f31c4de016f31c4f6350025,402855816f31c4de016f31c4f6a5002f,402855816f31c4de016f31c4f6e20035'),('402855816f31c4de016f31c4f7ff0061','system','2019-12-23 15:59:50','','日志导出','button',4,'402855816f31c4de016f31c4f6e20035','monitor:operlog:export','','menuItem','admin','2019-12-25 15:52:23','#','0',',root,402855816f31c4de016f31c4f6350025,402855816f31c4de016f31c4f6a5002f,402855816f31c4de016f31c4f6e20035'),('402855816f31c4de016f31c4f8060062','system','2019-12-23 15:59:50','','登录查询','button',1,'402855816f31c4de016f31c4f6e70036','monitor:logininfo:list','','menuItem','admin','2019-12-25 15:52:34','#','0',',root,402855816f31c4de016f31c4f6350025,402855816f31c4de016f31c4f6a5002f,402855816f31c4de016f31c4f6e70036'),('402855816f31c4de016f31c4f80b0063','system','2019-12-23 15:59:50','','登录删除','button',2,'402855816f31c4de016f31c4f6e70036','monitor:logininfo:remove','','menuItem','admin','2019-12-25 15:52:41','#','0',',root,402855816f31c4de016f31c4f6350025,402855816f31c4de016f31c4f6a5002f,402855816f31c4de016f31c4f6e70036'),('402855816f31c4de016f31c4f8110064','system','2019-12-23 15:59:50','','日志导出','button',3,'402855816f31c4de016f31c4f6e70036','monitor:logininfo:export','','menuItem','admin','2019-12-25 15:52:48','#','0',',root,402855816f31c4de016f31c4f6350025,402855816f31c4de016f31c4f6a5002f,402855816f31c4de016f31c4f6e70036'),('402855816f31c4de016f31c4f8180065','system','2019-12-23 15:59:50','','在线查询','button',1,'402855816f31c4de016f31c4f6ae0030','monitor:online:list','','menuItem','admin','2019-12-25 15:46:18','#','0',',root,402855816f31c4de016f31c4f6350025,402855816f31c4de016f31c4f6ae0030'),('402855816f31c4de016f31c4f81e0066','system','2019-12-23 15:59:50','','批量强退','button',2,'402855816f31c4de016f31c4f6ae0030','monitor:online:batchForceLogout','','menuItem','admin','2019-12-25 15:46:22','#','0',',root,402855816f31c4de016f31c4f6350025,402855816f31c4de016f31c4f6ae0030'),('402855816f31c4de016f31c4f8240067','system','2019-12-23 15:59:50','','单条强退','button',3,'402855816f31c4de016f31c4f6ae0030','monitor:online:forceLogout','','menuItem','admin','2019-12-25 15:46:27','#','0',',root,402855816f31c4de016f31c4f6350025,402855816f31c4de016f31c4f6ae0030'),('402880e46f9812b4016f981912eb0003','admin','2020-01-12 12:52:58','','已发布','menu',2,'40283e816f94047b016f9405ae250001','flowable:modeler:view',NULL,'menuItem','admin','2020-02-11 21:19:55','/flowable/modeler/deploy','0',',root,40283e816f8d4089016f8d420c4c0003,40283e816f94047b016f9405ae250001'),('402880e46f9812b4016f9819a6f00005','admin','2020-01-12 12:53:36','','待发布','menu',1,'40283e816f94047b016f9405ae250001','flowable:modeler:view',NULL,'menuItem','admin','2020-02-11 21:19:34','/flowable/modeler/undeploy','0',',root,40283e816f8d4089016f8d420c4c0003,40283e816f94047b016f9405ae250001'),('402880e46f9ecae8016f9ecc9c7e0001','admin','2020-01-13 20:06:47','','绑定流程','menu',4,'40283e816f8d4089016f8d420c4c0003','flowable:user:view',NULL,'menuItem','admin','2020-02-11 18:29:40','/flowable/user','0',',root,40283e816f8d4089016f8d420c4c0003'),('402881827340b10b017340bec3b80002','admin','2020-07-12 09:58:31','','绑定','button',2,'402880e46f9ecae8016f9ecc9c7e0001','flowable:user:binding',NULL,'menuItem',NULL,NULL,'','0',',root,40283e816f8d4089016f8d420c4c0003,402880e46f9ecae8016f9ecc9c7e0001'),('402881827340b10b017340bfcf850004','admin','2020-07-12 09:59:39','','绑定详情','button',3,'402880e46f9ecae8016f9ecc9c7e0001','flowable:user:binded',NULL,'menuItem',NULL,NULL,'','0',',root,40283e816f8d4089016f8d420c4c0003,402880e46f9ecae8016f9ecc9c7e0001'),('402881827340b10b017340c0969a0006','admin','2020-07-12 10:00:30','','取消绑定','button',4,'402880e46f9ecae8016f9ecc9c7e0001','flowable:user:unbinded',NULL,'menuItem',NULL,NULL,'','0',',root,40283e816f8d4089016f8d420c4c0003,402880e46f9ecae8016f9ecc9c7e0001'),('402881836fbcd7d6016fbcda617a0005','admin','2020-01-19 16:10:26','','查看流程图','button',7,'40283e816fad93ca016fad95619f0004','flowable:task:image',NULL,'menuItem','admin','2020-01-19 17:17:41','','0','null,40283e816fad93ca016fad95619f0004'),('402881836fbd0217016fbd18b3950004','admin','2020-01-19 17:18:30','','办结任务','menu',4,'40283e816fad93ca016fad95619f0004','flowable:task:view',NULL,'menuItem','admin','2020-07-11 13:01:16','/flowable/task/task/5','0',',40283e816fad93ca016fad95619f0004'),('402881836fc0c451016fc0c5a1490001','admin','2020-01-20 10:26:15','','流程步骤详情','button',8,'40283e816fad93ca016fad95619f0004','flowable:task:detail',NULL,'menuItem',NULL,NULL,'','0',''),('4028b26c733bb8d701733bbabdbf0005','admin','2020-07-11 10:36:01','','请假管理','menu',2,'40283e816f8ed7d2016f8ed942780001','demo:leave:view',NULL,'menuItem',NULL,NULL,'/demo/leave','0',',root,40283e816f8ed7d2016f8ed942780001'),('4028b26c733bb8d701733bbb62310007','admin','2020-07-11 10:36:43','','请假查询','button',1,'4028b26c733bb8d701733bbabdbf0005','demo:leave:list',NULL,'menuItem',NULL,NULL,'','0',',root,40283e816f8ed7d2016f8ed942780001,4028b26c733bb8d701733bbabdbf0005'),('4028b26c733bb8d701733bbba9870009','admin','2020-07-11 10:37:01','','请假新增','button',2,'4028b26c733bb8d701733bbabdbf0005','demo:leave:add',NULL,'menuItem',NULL,NULL,'','0',',root,40283e816f8ed7d2016f8ed942780001,4028b26c733bb8d701733bbabdbf0005'),('4028b26c733bb8d701733bbc1133000b','admin','2020-07-11 10:37:28','','请假修改','button',3,'4028b26c733bb8d701733bbabdbf0005','demo:leave:edit',NULL,'menuItem',NULL,NULL,'','0',',root,40283e816f8ed7d2016f8ed942780001,4028b26c733bb8d701733bbabdbf0005'),('4028b26c733bb8d701733bbc6658000d','admin','2020-07-11 10:37:50','','请假删除','button',4,'4028b26c733bb8d701733bbabdbf0005','demo:leave:remove',NULL,'menuItem',NULL,NULL,'','0',',root,40283e816f8ed7d2016f8ed942780001,4028b26c733bb8d701733bbabdbf0005'),('4028b2ec722fa06f01722fa1dc8c0001','admin','2020-05-20 09:10:36','fa fa-wrench','代码生成','catalog',6,'root','',NULL,'menuItem','admin','2020-07-11 10:38:53','','1',',root'),('4028b2ec722fa06f01722fa447880003','admin','2020-05-20 09:13:15','','元数据管理','menu',1,'4028b2ec722fa06f01722fa1dc8c0001','devtool:metadata:view',NULL,'menuItem','admin','2020-05-20 09:13:35','/devtool/metadata','0',',rootn,rootu,rootl,rootl,root,,root4,root0,root2,root8,rootb,root2,roote,rootc,root7,root2,root2,rootf,roota,root0,root6,rootf,root0,root1,root7,root2,root2,rootf,roota,root1,rootd,rootc,root8,rootc,root0,root0,root0,root1,root'),('4028b2ec722fa06f01722fa556140006','admin','2020-05-20 09:14:24','','元数据查询','button',1,'4028b2ec722fa06f01722fa447880003','devtool:metadata:list',NULL,'menuItem','admin','2020-05-20 09:14:52','','0',',rootn,rootu,rootl,rootl,root,,root4,root0,root2,root8,rootb,root2,roote,rootc,root7,root2,root2,rootf,roota,root0,root6,rootf,root0,root1,root7,root2,root2,rootf,roota,root1,rootd,rootc,root8,rootc,root0,root0,root0,root1,root,,root4,root0,root2,root8,rootb,root2,roote,rootc,root7,root2,root2,rootf,roota,root0,root6,rootf,root0,root1,root7,root2,root2,rootf,roota,root4,root4,root7,root8,root8,root0,root0,root0,root3,root'),('4028b2ec722fa06f01722fa65e1b0009','admin','2020-05-20 09:15:32','','元数据新增','button',2,'4028b2ec722fa06f01722fa447880003','devtool:metadata:add',NULL,'menuItem',NULL,NULL,'','0',''),('4028b2ec722fa06f01722fa6b88d000b','admin','2020-05-20 09:15:55','','元数据修改','button',3,'4028b2ec722fa06f01722fa447880003','devtool:metadata:edit',NULL,'menuItem',NULL,NULL,'','0',''),('4028b2ec722fa06f01722fa70ede000d','admin','2020-05-20 09:16:17','','元数据删除','button',4,'4028b2ec722fa06f01722fa447880003','devtool:metadata:remove',NULL,'menuItem',NULL,NULL,'','0',''),('4028b2ec722fa06f01722fa7eff7000f','admin','2020-05-20 09:17:15','','数据库表管理','menu',2,'4028b2ec722fa06f01722fa1dc8c0001','devtool:table:view',NULL,'menuItem',NULL,NULL,'/devtool/table','0',''),('4028b2ec722fa06f01722fa8695d0011','admin','2020-05-20 09:17:46','','数据库表查询','button',1,'4028b2ec722fa06f01722fa7eff7000f','devtool:table:list',NULL,'menuItem',NULL,NULL,'','0',''),('4028b2ec722fa06f01722fa8b2130013','admin','2020-05-20 09:18:04','','数据库表新增','button',2,'4028b2ec722fa06f01722fa7eff7000f','devtool:table:add',NULL,'menuItem',NULL,NULL,'','0',''),('4028b2ec722fa06f01722fa8f5af0015','admin','2020-05-20 09:18:22','','数据库表修改','button',3,'4028b2ec722fa06f01722fa7eff7000f','devtool:table:edit',NULL,'menuItem',NULL,NULL,'','0',''),('4028b2ec722fa06f01722fa947ad0017','admin','2020-05-20 09:18:43','','数据库表删除','button',4,'4028b2ec722fa06f01722fa7eff7000f','devtool:table:remove',NULL,'menuItem',NULL,NULL,'','0',''),('4028b2ec7273f08201727400c3fc0030','yweijian','2020-06-02 15:53:53','','商城会员','menu',1,'4028b2ec72c5682e0172c56b6bab0003','center:member:view',NULL,'menuItem','admin','2020-06-18 11:14:28','/center/member','0','null,4028b2ec72c5682e0172c56b6bab0003'),('4028b2ec7273f08201727400c3fc0031','yweijian','2020-06-02 15:53:53','','商城会员查询','button',1,'4028b2ec7273f08201727400c3fc0030','center:member:list',NULL,'menuItem',NULL,NULL,'#','0',''),('4028b2ec7273f08201727400c3fc0032','yweijian','2020-06-02 15:53:53','','商城会员新增','button',2,'4028b2ec7273f08201727400c3fc0030','center:member:add',NULL,'menuItem',NULL,NULL,'#','0',''),('4028b2ec7273f08201727400c3fc0033','yweijian','2020-06-02 15:53:53','','商城会员修改','button',3,'4028b2ec7273f08201727400c3fc0030','center:member:edit',NULL,'menuItem',NULL,NULL,'#','0',''),('4028b2ec7273f08201727400c3fc0034','yweijian','2020-06-02 15:53:53','','商城会员删除','button',4,'4028b2ec7273f08201727400c3fc0030','center:member:remove',NULL,'menuItem',NULL,NULL,'#','0',''),('4028b2ec7273f08201727400c3fc0035','yweijian','2020-06-02 15:53:53','','商城会员导出','button',5,'4028b2ec7273f08201727400c3fc0030','center:member:export',NULL,'menuItem',NULL,NULL,'#','0',''),('4028b2ec727406a3017274262e450001','admin','2020-06-02 16:29:19','fa fa-cart-plus','商城管理','catalog',7,'root','',NULL,'menuItem','admin','2020-07-11 10:38:59','','1',',root'),('4028b2ec72796af60172796b75d70000','yweijian','2020-06-03 17:03:52','','收货地址','menu',2,'4028b2ec72c5682e0172c56b6bab0003','center:receiveAddress:view',NULL,'menuItem','admin','2020-06-18 11:14:40','/center/receiveAddress','0','null,4028b2ec72c5682e0172c56b6bab0003'),('4028b2ec72796af60172796b75d70001','yweijian','2020-06-03 17:03:52','','收货地址查询','button',1,'4028b2ec72796af60172796b75d70000','center:receiveAddress:list',NULL,'menuItem',NULL,NULL,'#','0',''),('4028b2ec72796af60172796b75d70002','yweijian','2020-06-03 17:03:52','','收货地址新增','button',2,'4028b2ec72796af60172796b75d70000','center:receiveAddress:add',NULL,'menuItem',NULL,NULL,'#','0',''),('4028b2ec72796af60172796b75d70003','yweijian','2020-06-03 17:03:52','','收货地址修改','button',3,'4028b2ec72796af60172796b75d70000','center:receiveAddress:edit',NULL,'menuItem',NULL,NULL,'#','0',''),('4028b2ec72796af60172796b75d70004','yweijian','2020-06-03 17:03:52','','收货地址删除','button',4,'4028b2ec72796af60172796b75d70000','center:receiveAddress:remove',NULL,'menuItem',NULL,NULL,'#','0',''),('4028b2ec72796af60172796b75d70005','yweijian','2020-06-03 17:03:52','','收货地址导出','button',5,'4028b2ec72796af60172796b75d70000','center:receiveAddress:export',NULL,'menuItem',NULL,NULL,'#','0',''),('4028b2ec7292caa6017292d7cb1f0029','yweijian','2020-06-08 15:32:45','','轮播图管理','menu',1,'4028b2ec727406a3017274262e450001','staticres:carousel:view',NULL,'menuItem','admin','2020-06-18 11:14:54','/staticres/carousel','0',',rootn,rootu,rootl,rootl,root,,root4,root0,root2,root8,rootb,root2,roote,rootc,root7,root2,root7,root4,root0,root6,roota,root3,root0,root1,root7,root2,root7,root4,root2,root6,root2,roote,root4,root5,root0,root0,root0,root1,root'),('4028b2ec7292caa6017292d7cb1f002a','yweijian','2020-06-08 15:32:45','','轮播图查询','button',1,'4028b2ec7292caa6017292d7cb1f0029','staticres:carousel:list',NULL,'menuItem',NULL,NULL,'#','0',''),('4028b2ec7292caa6017292d7cb1f002b','yweijian','2020-06-08 15:32:45','','轮播图新增','button',2,'4028b2ec7292caa6017292d7cb1f0029','staticres:carousel:add',NULL,'menuItem',NULL,NULL,'#','0',''),('4028b2ec7292caa6017292d7cb1f002c','yweijian','2020-06-08 15:32:45','','轮播图修改','button',3,'4028b2ec7292caa6017292d7cb1f0029','staticres:carousel:edit',NULL,'menuItem',NULL,NULL,'#','0',''),('4028b2ec7292caa6017292d7cb1f002d','yweijian','2020-06-08 15:32:45','','轮播图删除','button',4,'4028b2ec7292caa6017292d7cb1f0029','staticres:carousel:remove',NULL,'menuItem',NULL,NULL,'#','0',''),('4028b2ec7292caa6017292d7cb1f002e','yweijian','2020-06-08 15:32:45','','轮播图导出','button',5,'4028b2ec7292caa6017292d7cb1f0029','staticres:carousel:export',NULL,'menuItem',NULL,NULL,'#','0',''),('4028b2ec72a231830172a23bfd8b0049','yweijian','2020-06-11 15:17:15','','商品目录','menu',3,'4028b2ec727406a3017274262e450001','shop:catalog:view',NULL,'menuItem','admin','2020-06-11 15:27:17','/shop/catalog','0',',rootn,rootu,rootl,rootl,root,,root4,root0,root2,root8,rootb,root2,roote,rootc,root7,root2,root7,root4,root0,root6,roota,root3,root0,root1,root7,root2,root7,root4,root2,root6,root2,roote,root4,root5,root0,root0,root0,root1,root'),('4028b2ec72a231830172a23bfd8b004a','yweijian','2020-06-11 15:17:15','','商品目录查询','button',1,'4028b2ec72a231830172a23bfd8b0049','shop:catalog:list',NULL,'menuItem',NULL,NULL,'#','0',''),('4028b2ec72a231830172a23bfd8b004b','yweijian','2020-06-11 15:17:15','','商品目录新增','button',2,'4028b2ec72a231830172a23bfd8b0049','shop:catalog:add',NULL,'menuItem',NULL,NULL,'#','0',''),('4028b2ec72a231830172a23bfd8b004c','yweijian','2020-06-11 15:17:15','','商品目录修改','button',3,'4028b2ec72a231830172a23bfd8b0049','shop:catalog:edit',NULL,'menuItem',NULL,NULL,'#','0',''),('4028b2ec72a231830172a23bfd8b004d','yweijian','2020-06-11 15:17:15','','商品目录删除','button',4,'4028b2ec72a231830172a23bfd8b0049','shop:catalog:remove',NULL,'menuItem',NULL,NULL,'#','0',''),('4028b2ec72a231830172a23bfd8b004e','yweijian','2020-06-11 15:17:15','','商品目录导出','button',5,'4028b2ec72a231830172a23bfd8b0049','shop:catalog:export',NULL,'menuItem',NULL,NULL,'#','0',''),('4028b2ec72c523730172c560ce290052','yweijian','2020-06-18 11:03:49','','商品信息','menu',4,'4028b2ec727406a3017274262e450001','shop:product:view',NULL,'menuItem','admin','2020-06-18 11:04:33','/shop/product','0',',rootn,rootu,rootl,rootl,root,,root4,root0,root2,root8,rootb,root2,roote,rootc,root7,root2,root7,root4,root0,root6,roota,root3,root0,root1,root7,root2,root7,root4,root2,root6,root2,roote,root4,root5,root0,root0,root0,root1,root'),('4028b2ec72c523730172c560ce290053','yweijian','2020-06-18 11:03:49','','商品信息查询','button',1,'4028b2ec72c523730172c560ce290052','shop:product:list',NULL,'menuItem',NULL,NULL,'#','0',''),('4028b2ec72c523730172c560ce290054','yweijian','2020-06-18 11:03:49','','商品信息新增','button',2,'4028b2ec72c523730172c560ce290052','shop:product:add',NULL,'menuItem',NULL,NULL,'#','0',''),('4028b2ec72c523730172c560ce290055','yweijian','2020-06-18 11:03:49','','商品信息修改','button',3,'4028b2ec72c523730172c560ce290052','shop:product:edit',NULL,'menuItem',NULL,NULL,'#','0',''),('4028b2ec72c523730172c560ce290056','yweijian','2020-06-18 11:03:49','','商品信息删除','button',4,'4028b2ec72c523730172c560ce290052','shop:product:remove',NULL,'menuItem',NULL,NULL,'#','0',''),('4028b2ec72c523730172c560ce290057','yweijian','2020-06-18 11:03:49','','商品信息导出','button',5,'4028b2ec72c523730172c560ce290052','shop:product:export',NULL,'menuItem',NULL,NULL,'#','0',''),('4028b2ec72c5682e0172c56b6bab0003','admin','2020-06-18 11:14:11','fa fa-users','会员中心','catalog',1,'4028b2ec727406a3017274262e450001','',NULL,'menuItem',NULL,NULL,'','0','');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
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
INSERT INTO `sys_user` VALUES ('40283e817048902901704898b1690005',NULL,'admin','2020-02-15 19:25:31','402855816f35ac13016f35ce3bca0019','caocao@163.com',NULL,'127.0.0.1','曹操','2020-07-22 15:41:04',NULL,'47a8a1577ee38161b67a7d41a48dd31f','18088888881','',NULL,'3925a1','0','0','admin','2020-04-22 17:00:14','曹操'),('40283e817048902901704899f54e0008',NULL,'admin','2020-02-15 19:26:54','402855816f35ac13016f35ce9169001b','dianwei@163.com',NULL,'127.0.0.1','典韦','2020-07-17 08:39:18',NULL,'14d033ef4c0f62698bfe5c2c62d24bbd','18088888882','',NULL,'9abdbf','0','0','admin','2020-02-15 19:30:05','典韦'),('40283e81704890290170489a989f000b',NULL,'admin','2020-02-15 19:27:36','402855816f35ac13016f35ced093001d','guojia@163.com',NULL,'127.0.0.1','郭嘉','2020-07-22 15:40:08',NULL,'a0bfed267ef76cccb2e84e0004c2de36','18088888883','',NULL,'1f0fcf','0','0','admin','2020-02-15 19:29:59','郭嘉'),('40283e8170489029017048a0d993001d',NULL,'admin','2020-02-15 19:34:26','40283e816f7dcf4f016f7ddb08dd001e','liubei@163.com',NULL,'127.0.0.1','刘备','2020-07-22 15:43:11',NULL,'b837d9b9d0b6e2c3a63892d1893103d5','18077777771','',NULL,'21ec3c','0','0','admin','2020-04-22 17:00:08','刘备'),('40283e8170489029017048a2c9610022',NULL,'admin','2020-02-15 19:36:33','40283e816f7dcf4f016f7dde4c710021','guanyu@163.com',NULL,'127.0.0.1','关羽','2020-07-14 22:24:51',NULL,'7e022364f4c638a8556fce09e347b9f3','18077777772','',NULL,'cc41c3','0','0','admin','2020-02-15 19:36:41','关羽'),('40283e8170489029017048a4533b0027',NULL,'admin','2020-02-15 19:38:14','40283e816f92646d016f926c38e4000f','sunjian@163.com',NULL,'127.0.0.1','孙坚','2020-07-11 10:51:07',NULL,'2ee6a6389daec9c00d94e86801048c99','18099999991','',NULL,'8a2f6b','0','0','admin','2020-02-15 19:46:41','孙坚'),('40283e8170489029017048a4f302002a',NULL,'admin','2020-02-15 19:38:55','40283e816f92646d016f926c38e4000f','sunquan@163.com',NULL,'127.0.0.1','孙权','2020-07-11 10:50:20',NULL,'776e22032bcf0eac0496ab9747e6a2a4','18099999992','',NULL,'1a3cd9','0','0','admin','2020-04-22 17:00:02','孙权'),('40283e8170489029017048a63954002d',NULL,'admin','2020-02-15 19:40:18','40283e816f92646d016f926c38e4000f','zhouyu@163.com',NULL,'127.0.0.1','周瑜','2020-07-22 15:43:51',NULL,'3c430eeb3c2d93eb3fdc2b3b4c705408','18099999993','',NULL,'4f0bb3','0','0','周瑜','2020-06-04 10:40:37','周瑜'),('402855816f1e2a2e016f1e2a45af0001','2020/06/08/5c76cbae50cb4fe7371fde4530bf32af.png','system','2019-12-19 20:38:04','402855816f35ac13016f35cc740b0017','daffodil@admin.com','Y','127.0.0.1','admin','2020-07-22 15:35:57',NULL,'ae4bac50de6e62586a336465bb83cdb1','18088888888','超级管理员',NULL,'5b3f96','0','0','admin','2020-02-15 19:18:26','达佛');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
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
-- Dumping routines for database 'daffodil'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-22 16:20:00
