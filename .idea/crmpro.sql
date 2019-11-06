/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.5.15 : Database - crmpro
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`crmpro` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `crmpro`;

/*Table structure for table `analysis` */

DROP TABLE IF EXISTS `analysis`;

CREATE TABLE `analysis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proname` varchar(64) DEFAULT NULL,
  `title` varchar(64) DEFAULT NULL,
  `simpledis` varchar(320) DEFAULT NULL,
  `detaileddis` varchar(320) DEFAULT NULL,
  `addtime` date DEFAULT NULL,
  `updatetime` date DEFAULT NULL,
  `remark` varchar(320) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `analysis_ibfk_1` FOREIGN KEY (`id`) REFERENCES `project` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `analysis` */

insert  into `analysis`(`id`,`proname`,`title`,`simpledis`,`detaileddis`,`addtime`,`updatetime`,`remark`) values (1,'联通收费系统','联通收费系统需求','协同办公，可以提高工作效率。','可以进行无纸化办公。。。。','2019-10-25','2019-10-25','目前还在需求确认阶段，详细内容参考需求文档'),(2,'ERP','ERP需求分析','ERP想法包含具体功能：考勤 日常管理  流程审批','考勤：和打卡机连接实时数据同步','2019-10-25','2019-10-25','需要跟进，完善需求');

/*Table structure for table `archives` */

DROP TABLE IF EXISTS `archives`;

CREATE TABLE `archives` (
  `dnum` varchar(64) NOT NULL,
  `landline` varchar(32) DEFAULT NULL COMMENT '固话',
  `school` varchar(32) DEFAULT NULL COMMENT '毕业院校',
  `zhuanye` varchar(32) DEFAULT NULL COMMENT '专业',
  `sosperson` varchar(32) DEFAULT NULL COMMENT '紧急联系人',
  `biyedate` date DEFAULT NULL COMMENT '毕业时间',
  `zzmm` varchar(32) DEFAULT NULL COMMENT '政治面貌',
  `minzu` varchar(32) DEFAULT NULL COMMENT '民族',
  `xueli` varchar(32) DEFAULT NULL COMMENT '学历',
  `email` varchar(32) DEFAULT NULL COMMENT '邮箱',
  `emp_fk` int(11) DEFAULT NULL COMMENT '员工外键',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `hirdate` date DEFAULT NULL COMMENT '入职日期',
  PRIMARY KEY (`dnum`),
  KEY `emp_fk` (`emp_fk`),
  CONSTRAINT `archives_ibfk_1` FOREIGN KEY (`emp_fk`) REFERENCES `employee` (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `archives` */

insert  into `archives`(`dnum`,`landline`,`school`,`zhuanye`,`sosperson`,`biyedate`,`zzmm`,`minzu`,`xueli`,`email`,`emp_fk`,`remark`,`hirdate`) values ('123-abc','010-110','联合大学','生物科学','仲琪','2018-05-15','群众','汉族','大专','pqc14790662614@163.com',2,'比较年轻不沉稳需要历练','2019-01-01'),('190-www','0531-120','北京大学','电子工程','李程','2018-09-11','党员','回族','本科','567@165.com',5,'学习能力强,重点培养','2019-01-03'),('456-def','0531-110','北京大学','软件工程','张三','2018-09-09','群众','维吾尔族','本科','pqc14790662614@163.com',1,'学习能力强,重点培养','2019-01-01'),('789-jjj','0531-110','北京大学','软件工程','张三','2018-09-09','群众','维吾尔族','本科','pqc14790662614@163.com',3,'学习能力强,重点培养','2019-01-01'),('900-kkk','0531-119','北京大学','航天技术','马亮','2018-09-10','团员','满族','本科','345@164.com',4,'啥也不会，找个机会开走','2019-01-02');

/*Table structure for table `attachment` */

DROP TABLE IF EXISTS `attachment`;

CREATE TABLE `attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_fk` int(11) DEFAULT NULL,
  `attname` varchar(32) DEFAULT NULL,
  `attdis` varchar(128) DEFAULT NULL,
  `remark` varchar(256) DEFAULT NULL,
  `path` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKhdq50yhhjhdiyfm03xjohqlki` (`pro_fk`),
  CONSTRAINT `attachment_ibfk_1` FOREIGN KEY (`pro_fk`) REFERENCES `project` (`pid`),
  CONSTRAINT `FKhdq50yhhjhdiyfm03xjohqlki` FOREIGN KEY (`pro_fk`) REFERENCES `project` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `attachment` */

insert  into `attachment`(`id`,`pro_fk`,`attname`,`attdis`,`remark`,`path`) values (2,1,'图片','美女图片','好好看，好好学习。','535f9775-3f99-439a-87f7-eade5d250209_2.经营为什么需要哲学（二）-2010年6月北京.docx'),(3,1,'表笑','表笑的报销','反反复复付付','f8f1ca54-c05d-4615-b3e2-bfbfd20252ea_附件1  个税专项附加扣除信息表-模板.xlsx'),(4,2,'一样一样','以以','uuuuu','bd830b44-fe41-40a4-983e-ca682e1d9395_新建文本文档.txt'),(5,2,'流程图','通天塔','柔柔弱弱若若若','e793907a-80ae-4469-85c6-61044370f87a_模板.doc'),(6,1,'兔兔','大白兔','发发发发发发付','cc2637ad-8129-493f-9167-1270bbe784a4_903Java座位图.xlsx'),(7,4,'红浪漫附件','只有你想不到','红浪漫','D:\\ideaworkspace\\idea\\pms\\src\\main\\webapp\\upload\\b13b3afcd2454ee8963eac1e9f1b41fe'),(8,3,'红浪漫附件','111','11111','D:\\ideaworkspace\\idea\\pms\\src\\main\\webapp\\upload\\3038c4eaffe346d8becf21f9c09864b4彭其昌--黄山学院毕业设计选题审批表.doc'),(9,5,'小米商城附件','欢迎购物','小米商城，欢迎购物','D:\\ideaworkspace\\idea\\pms\\src\\main\\webapp\\upload\\a567ff3ac05c408a9d5b2ac41a6eac03Day1.doc');

/*Table structure for table `baoxiao` */

DROP TABLE IF EXISTS `baoxiao`;

CREATE TABLE `baoxiao` (
  `bxid` varchar(64) NOT NULL,
  `paymode` varchar(32) DEFAULT NULL COMMENT '类型',
  `totalmoney` double DEFAULT NULL COMMENT '总金额',
  `bxtime` date DEFAULT NULL COMMENT '报销时间',
  `bxremark` varchar(100) DEFAULT NULL COMMENT '报销备注',
  `bxstatus` int(11) DEFAULT '0' COMMENT '报销状态',
  `emp_fk` int(11) DEFAULT NULL COMMENT '发起报销人',
  `result` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`bxid`),
  KEY `emp_fk` (`emp_fk`),
  CONSTRAINT `baoxiao_ibfk_1` FOREIGN KEY (`emp_fk`) REFERENCES `employee` (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `baoxiao` */

insert  into `baoxiao`(`bxid`,`paymode`,`totalmoney`,`bxtime`,`bxremark`,`bxstatus`,`emp_fk`,`result`) values ('123ad19700eb4f8699dfa3e6cd3ede01','出差票据',1234,'2019-10-30','花费1234',1,1,NULL),('17e70af2b2ae4af9b80e1cbd912bbba8','其他',112231,'2019-10-31','有钱随便花',0,1,NULL),('25b0d703eeff46fea613632f79a4ad90','出差票据',10000,'2019-10-26','出差花费',2,1,NULL),('32c2ed1e27cc4d4d8e4d18ff65eec5f0','出差票据',1223334,'2019-10-26','买了个表',0,1,NULL),('33e36e6b475743c9a136914e6ed8b76d','其他',3456,'2019-10-24','花费3456',3,1,NULL),('3a88f10e7d5648429f08f3c898d82850','出差票据',1214,'2019-10-31','出差费用',0,1,NULL),('3ed54dbd8556407d82425060f137df18','出差票据',10000,'2019-10-28','花费旅游',0,1,NULL),('423ccbf590c34eceb4492e885af35d51','出差票据',1223344,'2019-10-31','公司有钱',1,1,NULL),('5fa64b67-0864-4a45-b3bf-ca617300','办公采购',456634,'2019-08-08','呃呃呃呃呃反反复复',1,2,'44444'),('6037fa814faf4ccc925822244e9ce02f','出差票据',55555,'2019-10-31','花钱5个5',0,1,NULL),('6096eb389985444bbd42ab2258472650','出差票据',2132141,'2019-10-30','花了好多',0,1,NULL),('71de3b280a544847b03d41a9e4385d75','办公采购',123,'2019-10-19','这次不多',0,1,NULL),('863f16aaca3b4e02bcaf25bf34c2de28','出差票据',10000,'2019-10-30','出差费用',1,1,NULL),('86bf25dadb9842c99b5c6a4a53fb49d6','办公采购',1233,'2019-10-12','办公采购',1,1,NULL),('884ae8b75eba4d0db3e5085e769d4996','出差票据',12313,'2019-10-30','买个鸡脖',1,1,NULL),('a629bce153e949a4b37878600f388ef3','其他',12345,'2019-10-19','买了几件衣服',1,1,NULL),('a6c0a1f82b834cabbd9cc98f2c6357fd','出差票据',2019,'2019-10-10','出差所用花费',1,1,NULL),('ac43d30ee01140b58667dfa3d2b575cb','出差票据',666666,'2019-10-30','花钱6个6',0,1,NULL),('b020573c058d4b35bc836bec5c51ac87','出差票据',10000,'2019-11-02','豪华总统套房',0,1,NULL),('b068572e1f1a4d3284ed1aedae616f4c','办公采购',12231,'2019-10-31','采购费用',0,1,NULL),('bbdb6b17051c4a4da0550c839adfd12f','其他',213214,'2019-10-31','其他费用',0,1,NULL),('c13e844c-3a13-480e-b8e9-9839c95a','办公采购',3455,'2019-09-10','出差去岘港吃饭喝酒',2,2,'反反复复'),('c52f2098291e4f688861fcb29e9eeafb','其他',26,'2019-11-09','买了一包金皖',0,1,NULL),('d0369fbb497e4846826264a41c125394','出差票据',213214,'2019-10-30','花了又好多',0,1,NULL),('df3f07743fac44a88a332273d8d4e6a9','其他',0.5,'2019-10-26','买了一包辣条',0,1,NULL),('e56f1e5365084e96b2f4c81994ccb221','办公采购',2019,'2019-10-10','办公采购所用花费',0,1,NULL),('e71a0c55-044f-4d56-855f-bd931a36','办公采购',123,'2019-01-01','深V许昌县后天发货',2,2,'555555'),('f6a2b9c30ea44db189bd54f7d21d43be','办公采购',1111,'2019-10-10','花钱1111',0,1,NULL);

/*Table structure for table `benchmarking` */

DROP TABLE IF EXISTS `benchmarking`;

CREATE TABLE `benchmarking` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `company_name` varchar(50) NOT NULL COMMENT '公司名称',
  `sales_amount` double DEFAULT NULL COMMENT '营业额',
  `year` int(11) DEFAULT NULL COMMENT '年份',
  `business` varchar(100) DEFAULT NULL COMMENT '主要业务',
  `advantage` varchar(100) DEFAULT NULL COMMENT '优势',
  `disadvantage` varchar(100) DEFAULT NULL COMMENT '劣势',
  `status` varchar(30) DEFAULT NULL COMMENT '行业地位',
  `emp_count` int(11) DEFAULT NULL COMMENT '员工数量',
  `create_time` date DEFAULT NULL COMMENT '创建时间',
  `simple_desc` varchar(300) DEFAULT NULL COMMENT '简单描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `benchmarking` */

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comname` varchar(128) DEFAULT NULL,
  `companyperson` varchar(32) DEFAULT NULL,
  `comaddress` varchar(128) DEFAULT NULL,
  `comphone` varchar(32) DEFAULT NULL,
  `camera` varchar(128) DEFAULT NULL,
  `present` varchar(128) DEFAULT NULL,
  `remark` varchar(128) DEFAULT NULL,
  `addtime` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

/*Data for the table `customer` */

insert  into `customer`(`id`,`comname`,`companyperson`,`comaddress`,`comphone`,`camera`,`present`,`remark`,`addtime`) values (4,'用友软件','刘老师','北京市','1111111','010-11','物联网企业','最早的办公软件公司','2018-12-26'),(5,'浪潮软件','孙老师','济南市','3333333','010-22','服务器企业','比较成熟的服务器技术和软件开发技术','2018-12-26'),(6,'中科软','王老师','上海市','5555555','010-33','外包公司','没有自主研发，主要是外包','2018-12-26'),(7,'宜通世纪','李老师','北京市','6666666','010-44','软件公司','各种软件的研发和生产','2018-12-26'),(8,'腾讯','马化腾','深圳市','7777777','010-55','游戏公司','占据游戏市场的份额比较大','2018-12-26'),(9,'小米','雷军','中关村软件园23号楼','19999999','010-9999','最大的手机组装工场','香港刚刚上市，有钱尽量套取。','2018-12-26'),(10,'阿里巴巴','张勇','杭州','13855683456','0331-76547898','阿里巴巴面向全球','猜猜我是谁','2019-10-22'),(11,'华为','任正非','深圳','138556834455','0331-7777111','华而有为','不知道吧','2019-10-22'),(24,'明教','张无忌','光明顶','13723458796','111-2334434','乾坤大挪移','九阳神功','2019-10-26'),(25,'武当派','张三丰','武当山','14567891010','111-12345','诚招有意人士','诚招有意人士','2019-01-06'),(26,'老铁匠精品打铁铺','科比','美国洛杉矶','13596208118','0331-33643','老铁匠精品打铁铺，块块都是好铁','一仰化一铁，三仰化二铁，四仰化三铁','2018-12-26');

/*Table structure for table `datacollect` */

DROP TABLE IF EXISTS `datacollect`;

CREATE TABLE `datacollect` (
  `daid` int(11) NOT NULL AUTO_INCREMENT,
  `dacname` varchar(32) DEFAULT NULL COMMENT '目标公司名称',
  `daturnover` double DEFAULT NULL COMMENT '营业额',
  `datime` date DEFAULT NULL COMMENT '年度',
  `dabusiness` varchar(128) DEFAULT NULL COMMENT '主要业务',
  `dasuperiority` varchar(128) DEFAULT NULL COMMENT '优势',
  `dainforiority` varchar(128) DEFAULT NULL COMMENT '劣势',
  `dasort` int(11) DEFAULT NULL COMMENT '行业排名',
  `empcount` int(11) DEFAULT NULL COMMENT '员工数量',
  `buildtime` date DEFAULT NULL COMMENT '企业创建时间',
  `remark` varchar(256) DEFAULT NULL COMMENT '简单描述',
  `daother` varchar(128) DEFAULT NULL COMMENT '其他',
  PRIMARY KEY (`daid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `datacollect` */

insert  into `datacollect`(`daid`,`dacname`,`daturnover`,`datime`,`dabusiness`,`dasuperiority`,`dainforiority`,`dasort`,`empcount`,`buildtime`,`remark`,`daother`) values (4,'浪潮集团',70,'2019-10-31','软件研发','国家扶持','自主能力较差',4,3003,'1980-09-12','创建时间较长，市场比较稳定','2018年-浪潮集团详细调研说明书.doc'),(6,'中科软',128,'2019-10-31','软件外包服务','技术人员充沛','人才储备参差',5,1234,'1987-12-12','软件外包服务不错',NULL),(7,'新东方',210,'2019-10-31','烹饪、教育培训','烧菜好吃','学费太贵',1,10000,'1998-10-26','学厨师，就来新东方',NULL),(8,'中公教育',180,'2019-10-31','公务员、IT培训','管吃管住管就业','食堂饭是真不咋的',2,12353,'2001-10-26','中公教育发展迅猛',NULL),(10,'蓝翔',218,'2019-10-31','挖掘机技术','挖掘机技术强','别人只知道挖掘机技术强',3,123452,'2004-10-26','挖掘机技术哪家强，中国山东找蓝翔',NULL);

/*Table structure for table `dept` */

DROP TABLE IF EXISTS `dept`;

CREATE TABLE `dept` (
  `deptno` int(11) NOT NULL,
  `dname` varchar(32) DEFAULT NULL,
  `dlocation` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`deptno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dept` */

insert  into `dept`(`deptno`,`dname`,`dlocation`) values (10,'开发部','北京'),(20,'市场部','广州'),(30,'总裁办','上海');

/*Table structure for table `email` */

DROP TABLE IF EXISTS `email`;

CREATE TABLE `email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) DEFAULT NULL,
  `ename` varchar(32) DEFAULT NULL,
  `sendtime` date DEFAULT NULL,
  `content` varchar(128) DEFAULT NULL,
  `emp_fk` int(11) DEFAULT NULL,
  `path` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbwdib3s3ugq70b5h2ocn0rfvb` (`emp_fk`),
  CONSTRAINT `email_ibfk_1` FOREIGN KEY (`emp_fk`) REFERENCES `employee` (`eid`),
  CONSTRAINT `FKbwdib3s3ugq70b5h2ocn0rfvb` FOREIGN KEY (`emp_fk`) REFERENCES `employee` (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email` */

/*Table structure for table `emp_role` */

DROP TABLE IF EXISTS `emp_role`;

CREATE TABLE `emp_role` (
  `erid` int(11) NOT NULL AUTO_INCREMENT,
  `role_fk` int(11) DEFAULT NULL,
  `emp_fk` int(11) DEFAULT NULL,
  `erdis` varchar(32) DEFAULT NULL COMMENT '员工和角色的描述',
  PRIMARY KEY (`erid`),
  KEY `emp_fk` (`emp_fk`),
  KEY `role_fk` (`role_fk`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `emp_role` */

insert  into `emp_role`(`erid`,`role_fk`,`emp_fk`,`erdis`) values (1,6,6,'小孙子的角色'),(2,5,7,'444的角色'),(3,5,8,'55的角色');

/*Table structure for table `employee` */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `eid` int(11) NOT NULL AUTO_INCREMENT,
  `ename` varchar(32) DEFAULT NULL,
  `esex` varchar(32) DEFAULT NULL,
  `eage` int(11) DEFAULT NULL,
  `telephone` varchar(32) DEFAULT NULL,
  `hiredate` date DEFAULT NULL,
  `pnum` varchar(32) DEFAULT NULL,
  `username` varchar(32) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `remark` varchar(256) DEFAULT NULL,
  `p_fk` int(11) DEFAULT NULL,
  `d_fk` int(11) DEFAULT NULL,
  `l_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`eid`),
  KEY `FKt4aodqf7acjpmo7iejdmg3k78` (`p_fk`),
  KEY `d_fk` (`d_fk`),
  KEY `l_fk` (`l_fk`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`p_fk`) REFERENCES `position` (`id`),
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`d_fk`) REFERENCES `dept` (`deptno`),
  CONSTRAINT `employee_ibfk_3` FOREIGN KEY (`l_fk`) REFERENCES `level` (`jid`),
  CONSTRAINT `FKt4aodqf7acjpmo7iejdmg3k78` FOREIGN KEY (`p_fk`) REFERENCES `position` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `employee` */

insert  into `employee`(`eid`,`ename`,`esex`,`eage`,`telephone`,`hiredate`,`pnum`,`username`,`password`,`remark`,`p_fk`,`d_fk`,`l_fk`) values (1,'李四','0',45,'2344','2018-12-03','5767','433','433','234324',4,10,4),(2,'张三','1',45,'45','2018-12-25','45','45','45','45645',3,10,1),(3,'赵四','0',34,'123','2019-01-07','98','12','34','werewolf',5,20,2),(4,'刘恩能够','0',45,'345','2019-01-16','89','12','56','werewolf',2,30,3),(5,'王五','1',56,'456',NULL,'909','12','78','温热无若',4,10,4),(6,'小孙子','1',23,'123213',NULL,'123213','zsf123','000000','这个人老牛逼了会做算法题',5,10,4),(7,'444','1',44,'44',NULL,'44','44','44','444444',2,20,2),(8,'55','1',55,'55','2019-01-08','55','55','55','5555555',1,10,1);

/*Table structure for table `evaluate` */

DROP TABLE IF EXISTS `evaluate`;

CREATE TABLE `evaluate` (
  `evaid` int(11) NOT NULL AUTO_INCREMENT COMMENT '评价id',
  `forum_fk` int(11) DEFAULT NULL COMMENT '帖子外键',
  `emp_fk4` int(11) DEFAULT NULL COMMENT '评价人外键',
  `evaid_fk` int(11) DEFAULT NULL COMMENT '回复外键',
  `evacontent` varchar(256) DEFAULT NULL COMMENT '评价内容',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `evatime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `evastatus` int(11) DEFAULT '0' COMMENT '评价状态',
  PRIMARY KEY (`evaid`),
  KEY `emp_fk4` (`emp_fk4`),
  KEY `forum_fk` (`forum_fk`),
  KEY `evaid_fk` (`evaid_fk`),
  CONSTRAINT `evaluate_ibfk_1` FOREIGN KEY (`emp_fk4`) REFERENCES `employee` (`eid`),
  CONSTRAINT `evaluate_ibfk_2` FOREIGN KEY (`forum_fk`) REFERENCES `forumpost` (`forumid`),
  CONSTRAINT `evaluate_ibfk_3` FOREIGN KEY (`evaid_fk`) REFERENCES `evaluate` (`evaid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `evaluate` */

insert  into `evaluate`(`evaid`,`forum_fk`,`emp_fk4`,`evaid_fk`,`evacontent`,`updatetime`,`evatime`,`evastatus`) values (1,2,5,NULL,'<p>发发发发发发付</p>',NULL,'2019-01-07 11:08:33',NULL),(2,2,2,1,'<p>发发发发发发付</p>',NULL,'2019-01-07 11:08:27',NULL),(3,2,3,1,'<p>发发发发发发付</p>',NULL,'2019-01-07 11:08:25',NULL),(6,2,4,NULL,'<p>发发发发发发付</p>',NULL,'2019-01-07 11:08:24',0),(7,2,1,6,'<p>发发发发发发付</p>',NULL,'2019-01-07 11:08:23',0),(8,2,2,NULL,'<p>发发发发发发付</p>',NULL,'2019-01-07 11:05:34',0),(9,2,2,NULL,'<p>反反复复</p><p>反反复复</p>',NULL,'2019-01-07 11:10:07',0),(10,3,2,NULL,'<p>反反复复付付</p>',NULL,'2019-01-07 11:14:50',0);

/*Table structure for table `forumpost` */

DROP TABLE IF EXISTS `forumpost`;

CREATE TABLE `forumpost` (
  `forumid` int(11) NOT NULL AUTO_INCREMENT COMMENT '帖子id',
  `forumtitle` varchar(100) NOT NULL COMMENT '帖子的标题',
  `forumcontent` text NOT NULL COMMENT '帖子的内容',
  `emp_fk3` int(11) NOT NULL COMMENT '发帖人',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `status` int(11) DEFAULT '0' COMMENT '帖子状态',
  PRIMARY KEY (`forumid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `forumpost` */

insert  into `forumpost`(`forumid`,`forumtitle`,`forumcontent`,`emp_fk3`,`createtime`,`status`) values (2,'投入让人','<p>发发发发发发付多岁的爽肤水</p>',2,'2019-01-04 15:54:23',0),(3,'反反复复','<p>反反复复</p>',2,'2019-01-04 16:01:28',0),(4,'附近反复讲','<p>发的顺丰科技的史莱克</p><p>第三方就离开的说法</p><p>是的房间里看电视</p>',2,'2019-01-04 16:16:18',0),(6,'333333','<p>333333333<br/></p>',2,'2019-01-04 16:50:10',0),(7,'444','<p>4444</p>',2,'2019-01-04 17:48:12',0),(8,'444','<p>44444</p>',2,'2019-01-04 17:48:18',0),(9,'444','<p>5555</p>',2,'2019-01-04 17:50:03',0),(10,'666','<p>666666</p>',2,'2019-01-04 17:53:49',0),(11,'555','<p>55555</p>',2,'2019-01-04 18:22:04',0),(12,'333333','<p>ttttttttttt</p>',2,'2019-01-04 18:32:31',0),(13,'杯子出售','<p>杯子在呢么名史莱克的减肥的流口水</p>',2,'2019-01-07 09:01:37',0),(14,'测试','<p>11111</p>',1,'2019-10-31 09:15:23',NULL),(15,'测试','<p>2222222</p>',1,'2019-10-31 09:22:07',NULL),(16,'测试','<p>3333</p><p><img src=\"http://img.baidu.com/hi/jx2/j_0028.gif\"/></p>',1,'2019-10-31 09:31:36',NULL),(17,'测试','<p><img src=\"http://img.baidu.com/hi/jx2/j_0028.gif\"/></p>',1,'2019-10-31 09:33:59',NULL),(18,'测试','<p>哈哈哈<img src=\"http://img.baidu.com/hi/jx2/j_0016.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0001.gif\"/></p>',1,'2019-10-31 09:47:19',NULL),(19,'测试','<p><img src=\"http://img.baidu.com/hi/jx2/j_0015.gif\"/></p><p><img src=\"http://img.baidu.com/hi/jx2/j_0011.gif\"/></p><p><img src=\"http://img.baidu.com/hi/jx2/j_0014.gif\"/></p><p style=\"text-align:center\"><img src=\"http://img.baidu.com/hi/jx2/j_0002.gif\" width=\"50\" height=\"50\" title=\"\" alt=\"\"/></p><p style=\"text-align:center\"><img src=\"http://img.baidu.com/hi/jx2/j_0074.gif\"/></p><p><br/></p>',1,'2019-10-31 09:52:13',NULL),(20,'','<p style=\"text-align: center;\"><img src=\"http://img.baidu.com/hi/jx2/j_0001.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0003.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0029.gif\"/></p><p style=\"text-align: center;\">FUCK YOU!!!<br/></p>',1,'2019-10-31 09:54:03',NULL),(21,'测试','<p></p>',1,'2019-10-31 09:56:34',NULL),(22,'测试','<p>55555555</p>',1,'2019-10-31 14:07:15',NULL);

/*Table structure for table `function` */

DROP TABLE IF EXISTS `function`;

CREATE TABLE `function` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proname` varchar(32) DEFAULT NULL,
  `analysisname` varchar(32) DEFAULT NULL,
  `modele_fk` int(11) DEFAULT NULL,
  `functionname` varchar(32) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `simpledis` varchar(256) DEFAULT NULL,
  `detaileddis` varchar(256) DEFAULT NULL,
  `remark` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKjonpxsiii6o3xv16nttvg500w` (`modele_fk`),
  CONSTRAINT `FKjonpxsiii6o3xv16nttvg500w` FOREIGN KEY (`modele_fk`) REFERENCES `module` (`id`),
  CONSTRAINT `function_ibfk_1` FOREIGN KEY (`modele_fk`) REFERENCES `module` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `function` */

insert  into `function`(`id`,`proname`,`analysisname`,`modele_fk`,`functionname`,`level`,`simpledis`,`detaileddis`,`remark`) values (1,'1','1',2,'收费标准制定','高','3333','333','33333'),(2,'2','2',4,'删除员工信息','高','反反复复','凤飞飞','反反复复'),(3,'2','2',5,'权限添加','高','啊啊啊啊','反反复复','灌灌灌灌');

/*Table structure for table `indexvalue` */

DROP TABLE IF EXISTS `indexvalue`;

CREATE TABLE `indexvalue` (
  `in_id` int(11) NOT NULL AUTO_INCREMENT,
  `in_turnover` double DEFAULT NULL COMMENT '目标营业额',
  `in_business` varchar(128) DEFAULT NULL COMMENT '主要业务方向',
  `comname_fk` int(11) DEFAULT NULL COMMENT '对比企业名称',
  `in_remark` varchar(256) DEFAULT NULL COMMENT '简单说明',
  `in_file` varchar(128) DEFAULT NULL COMMENT '附件',
  `emp_fk5` int(11) DEFAULT NULL COMMENT '指标制定人',
  `in_starttime` date DEFAULT NULL COMMENT '开始时间',
  `in_endtime` date DEFAULT NULL COMMENT '截止时间',
  `in_updatetime` date DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`in_id`),
  KEY `comname_fk` (`comname_fk`),
  KEY `emp_fk5` (`emp_fk5`),
  CONSTRAINT `indexvalue_ibfk_1` FOREIGN KEY (`comname_fk`) REFERENCES `datacollect` (`daid`),
  CONSTRAINT `indexvalue_ibfk_2` FOREIGN KEY (`emp_fk5`) REFERENCES `employee` (`eid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `indexvalue` */

insert  into `indexvalue`(`in_id`,`in_turnover`,`in_business`,`comname_fk`,`in_remark`,`in_file`,`emp_fk5`,`in_starttime`,`in_endtime`,`in_updatetime`) values (4,75,'软件开发服务器销售',4,'扩展业务为服务器销售','a1e97cf3-ded9-4f53-860f-5e95b4fafa00_abc.xls',2,'2019-01-01','2019-06-30',NULL);

/*Table structure for table `level` */

DROP TABLE IF EXISTS `level`;

CREATE TABLE `level` (
  `jid` int(11) NOT NULL AUTO_INCREMENT,
  `jname` varchar(32) DEFAULT NULL,
  `jdis` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`jid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `level` */

insert  into `level`(`jid`,`jname`,`jdis`) values (1,'p1','实习生'),(2,'p2','初级程序员'),(3,'m1','项目组长'),(4,'m2','项目负责人');

/*Table structure for table `module` */

DROP TABLE IF EXISTS `module`;

CREATE TABLE `module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proname` varchar(32) DEFAULT NULL,
  `analysis_fk` int(11) DEFAULT NULL,
  `modname` varchar(32) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `simpledis` varchar(256) DEFAULT NULL,
  `detaileddis` varchar(256) DEFAULT NULL,
  `remark` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK986a0ufpo55087x7uc0ous7nb` (`analysis_fk`),
  CONSTRAINT `FK986a0ufpo55087x7uc0ous7nb` FOREIGN KEY (`analysis_fk`) REFERENCES `analysis` (`id`),
  CONSTRAINT `module_ibfk_1` FOREIGN KEY (`analysis_fk`) REFERENCES `analysis` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `module` */

insert  into `module`(`id`,`proname`,`analysis_fk`,`modname`,`level`,`simpledis`,`detaileddis`,`remark`) values (2,'1',1,'系统管理','低','权限分配，资源创建，','怎么分配权限，怎么创建资源的详细描述','当前模块是我们项目中最后模块，不着急'),(3,'1',1,'收费管理','中','通讯计费标准制定，实施，','通讯计费标准制定，实施，','通讯计费标准制定，实施，'),(4,'2',2,'员工管理','高','员工的考勤管理，工资管理，日常办公管理','员工的考勤管理，工资管理，日常办公管理','员工的考勤管理，工资管理，日常办公管理'),(5,'2',2,'权限管理','高','吾问无为谓','反反复复付','反反复复付');

/*Table structure for table `msg` */

DROP TABLE IF EXISTS `msg`;

CREATE TABLE `msg` (
  `msgid` int(11) NOT NULL AUTO_INCREMENT,
  `sendp` int(32) DEFAULT NULL,
  `recvp` int(32) DEFAULT NULL,
  `mark` int(11) DEFAULT '0',
  `msgcontent` varchar(32) DEFAULT NULL,
  `msgtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`msgid`),
  KEY `sendp` (`sendp`),
  KEY `recvp` (`recvp`),
  CONSTRAINT `msg_ibfk_1` FOREIGN KEY (`sendp`) REFERENCES `employee` (`eid`),
  CONSTRAINT `msg_ibfk_2` FOREIGN KEY (`recvp`) REFERENCES `employee` (`eid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `msg` */

insert  into `msg`(`msgid`,`sendp`,`recvp`,`mark`,`msgcontent`,`msgtime`) values (1,2,1,0,'反反复复','2019-01-04 00:00:00');

/*Table structure for table `notice` */

DROP TABLE IF EXISTS `notice`;

CREATE TABLE `notice` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `ntitle` varchar(32) DEFAULT NULL,
  `remark` text,
  `ndate` date DEFAULT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `notice` */

insert  into `notice`(`nid`,`ntitle`,`remark`,`ndate`) values (1,'提升张三为副总裁','张三的接口丽枫酒店\r\n的实例会计法独立思考\r\n的借款方\r\n冻死了空间发的是\r\n独立思考解放东路开始','2019-01-03'),(2,'降薪公告','关于集团为了缩减开始，特发出降薪通告\r\n1:10年员工降薪30%\r\n2：新员工降薪45%','2019-01-01'),(3,'税务改革','2019-01-01 新的纳税制度\r\n大家及时申报免税的信息','2019-09-09'),(4,'年终考核','总结大家一年中工作内容，成绩。突出贡献','2018-12-31'),(5,'集团考勤通告','张三今天迟到了5分钟，本次事故纳入年终考核，罚款500元','2019-01-03'),(6,'节约使用办公用品倡议','为了迎接互联网寒冬，我们要扎进裤腰带，共同度过','2019-01-03'),(7,'为了梦圆有所养、有所医、有所居——沿着习近平的足迹看变化','从春暖花开到数九寒天；从田间地头到高原边陲；从民众衣食住行的身边事，到关乎国计民生的大政方针……党的十八大以来，习近平总书记用脚步丈量祖国的大地，用真心聆听人民的心声，用实干履行庄严的承诺。总书记的足迹折射出的是迈向新时代的步伐，是实现中国梦的路径。今天开始，《焦点访谈》将播出系列节目《足迹》，展现在习近平新时代中国特色社会主义思想指引下，中国经济和社会发展理念的变化','2019-10-16'),(9,'唐朝诗人，谁第一？','虽说“文无第一，武无第二”，但文人争高低那是自古没消停过，堪称一场超持久的无血战争。\n\n拿唐朝诗人们来说，初唐时就评出“王杨卢骆”，别号“初唐四杰”。完事儿排第二的杨炯还非常不乐意，说自己“愧在卢前，耻居王后”，前半句敷衍一下，后半句直译就是“我才是第一”。','2019-10-26'),(10,'国家主席习近平将出席第二届中国国际进口博览会','商务部10月29日举行中外媒体吹风会。中国国际进口博览会组委会办公室主任、商务部副部长王炳南宣布，国家主席习近平将于11月5日出席在上海举办的第二届中国国际进口博览会暨虹桥国际经济论坛开幕式及相关活动，并发表主旨演讲。','2019-10-31'),(11,'记者：对裁判最后都不回看有多惊讶？ 布克：我不惊讶','直播吧10月29日讯 太阳今天在主场惜败于爵士，在比赛最后剩0.4秒时米切尔突破被犯规，后者两罚中一，最终一分险胜太阳。\n\n不过值得争议的是，米切尔被犯规后的时间被定格在0.4秒，而赛后太阳主帅蒙蒂则表示该回到1.8秒，最后裁判也没有回看来确定最后的时间。\n\n赛后记者向布克问道：“你对裁判最后都没有去回看一下时间有多惊讶？”\n\n布克：“有多惊讶？我不惊讶。”\n\n记者：为什么？\n\n布克：就是不惊讶，我来到NBA已经有一段时间了。','2019-10-29'),(12,'阿扎尔：C罗的7号球衣具有历史意义，接过它并不容易','今夏加盟皇马的阿扎尔接过了7号球衣，比利时人在接受采访时表示：“接过C罗的球衣并不容易，它具有历史意义。”\n\n“皇马本赛季的开局并不稳定，但我们会全力以赴，赢得一切。皇马必须获得冠军。我知道欧冠很重要，对我和俱乐部来说都是如此，我在世界上最好的俱乐部里，我希望能竭尽所能。”\n\n此外，阿扎尔还聊到了主教练齐达内，“如果你喜欢足球，那无论你在不在皇马，你都会喜欢上齐达内。当我还是个孩子的时候，我认为齐达内就是最棒的。现在我很荣幸能够与齐达内共事，他是一个很真诚的人，他知道球员需要什么，而且在必须发声的时候会有所行动。”','2019-10-29'),(13,'官方实力榜：76人占据榜首 快船位列第三 湖人第六','今日NBA官方公布了新赛季首期实力榜，其中76人占据榜首，快船位列第三，湖人排在第六。\n\n1、76人 \n\n节奏：106.0 (7) 进攻效率：105.2 (15) 防守效率：96.7 (5) 净胜分：+8.5 (5)\n\n2、掘金\n\n节奏：99.6 (27) 进攻效率： 102.4 (21) 防守效率：99.5 (7) 净胜分：+2.9 (15)\n\n3、快船\n\n节奏：102.8 (22) 进攻效率：122.1 (1) 防守效率：114.2 (26) 净胜分：+8.0 (6)\n\n4、雄鹿\n\n节奏：110.0 (1) 进攻效率：104.7 (16) 防守效率：104.8 (15) 净胜分：-0.0 (20)\n\n5、森林狼 \n\n节奏：105.5 (9) 进攻效率：111.0 (4) 防守效率：102.1 (13) 净胜分：+8.8 (4)\n\n6、湖人\n\n节奏： 98.0 (30) 进攻效率：107.5 (12) 防守效率：102.0 (12) 净胜分：+5.4 (8)\n\n7、爵士\n\n节奏：98.2 (29) 进攻效率101.7 (22) 防守效率：91.9 (1) 净胜分：+9.8 (2)\n\n8、火箭\n\n节奏：110.0 (2) 进攻效率：107.7 (10) 防守效率：109.1 (21) 净胜分：-1.4 (21)\n\n9、开拓者\n\n节奏：105.0 (13) 进攻效率：109.6 (8) 防守效率：106.9 (18) 净胜分：+2.6 (16)\n\n10、凯尔特人\n\n节奏：103.0 (19) 进攻效率：104.2 (18) 防守效率：100.0 (8) 净胜分：+4.2 (11)\n\n11-15：猛龙、马刺、热火、太阳、独行侠\n\n16-20：老鹰、魔术、篮网、雷霆、勇士\n\n21-25：活塞、公牛、鹈鹕、奇才、灰熊\n\n26-30：步行者、骑士、黄蜂、尼克斯、国王','2019-10-29'),(14,'科比谈库兹马：他有潜力成为一名好的防守球员','直播吧10月30日讯 近日，湖人名宿科比接受了媒体的采访。\r\n\r\n谈到湖人球员库兹马今夏没有被交易的原因：“我认为是他的全面性！之前的比赛中，通常有些绝活哥会被留在场上，现在这样的时代已经过去了。现在比赛的趋势就是什么都能打的球员比较吃香，包括进攻，防守等。库兹马有很好的身材，投篮&传球能力，同时也有潜力成为一名好的防守球员，当他能做到以上的一切时，他就是不可代替的。”','2019-10-30');

/*Table structure for table `position` */

DROP TABLE IF EXISTS `position`;

CREATE TABLE `position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `position` */

insert  into `position`(`id`,`name`) values (1,'初级开发工程师'),(2,'中级开发工程师'),(3,'高级开发工程师'),(4,'项目经理'),(5,'项目总监'),(6,' 其他');

/*Table structure for table `project` */

DROP TABLE IF EXISTS `project`;

CREATE TABLE `project` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(128) DEFAULT NULL,
  `comname` int(11) DEFAULT NULL,
  `comper` varchar(64) DEFAULT NULL,
  `emp_fk1` int(11) DEFAULT NULL,
  `empcount` int(11) DEFAULT NULL,
  `starttime` date DEFAULT NULL,
  `buildtime` date DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `endtime` date DEFAULT NULL,
  `remark` varchar(256) DEFAULT NULL,
  `emp_fk` int(11) NOT NULL,
  PRIMARY KEY (`pid`),
  KEY `emp_fk1` (`emp_fk1`),
  KEY `FKtirudsu3khj865hrqeamn153y` (`comname`),
  KEY `FKj4vtyyp6ew24vggobfcmav1be` (`emp_fk`),
  CONSTRAINT `FKj4vtyyp6ew24vggobfcmav1be` FOREIGN KEY (`emp_fk`) REFERENCES `employee` (`eid`),
  CONSTRAINT `FKtirudsu3khj865hrqeamn153y` FOREIGN KEY (`comname`) REFERENCES `customer` (`id`),
  CONSTRAINT `project_ibfk_2` FOREIGN KEY (`comname`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `project` */

insert  into `project`(`pid`,`pname`,`comname`,`comper`,`emp_fk1`,`empcount`,`starttime`,`buildtime`,`cost`,`level`,`endtime`,`remark`,`emp_fk`) values (1,'联通收费系统',5,'孙老师',NULL,4,'2019-09-09','2019-09-09',444,'一般','2222-09-09','333333333',1),(2,'ERP',4,'刘老师',NULL,5,'2019-09-09','2019-10-10',34,'暂缓','2020-09-09','进行中',1),(3,'商城',6,'王老师',NULL,5,'2019-09-09','2019-09-09',3456,'暂缓','2022-09-09','不着急',5),(4,'红浪漫会所系统',11,'任正非',NULL,34,'2019-10-24','2019-10-24',121,'暂缓','2020-03-23','欢迎入住红浪漫',5),(5,'小米商城',9,'雷军',NULL,24,'2019-10-25','2019-10-26',134,'紧急','2020-03-24','小米商城',1),(6,'王者荣耀',8,'马化腾',NULL,100,'2019-11-01','2019-11-02',13388,'紧急','2020-04-24','王者农药真好玩',5);

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `roleid` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `rolename` varchar(32) DEFAULT NULL COMMENT '角色名称',
  `roledis` varchar(32) DEFAULT NULL COMMENT '角色描述',
  `status` int(11) DEFAULT '0' COMMENT '是否启用',
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`roleid`,`rolename`,`roledis`,`status`) values (5,'5555','反反复复付付',1),(6,'vip会员','vip权限普通用户多一些',1);

/*Table structure for table `role_sources` */

DROP TABLE IF EXISTS `role_sources`;

CREATE TABLE `role_sources` (
  `rsid` int(11) NOT NULL AUTO_INCREMENT,
  `rsdis` varchar(32) DEFAULT NULL COMMENT '角色和资源的描述',
  `sid` int(11) DEFAULT NULL,
  `roleid` int(11) DEFAULT NULL,
  PRIMARY KEY (`rsid`),
  KEY `roleid` (`roleid`),
  KEY `sid` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

/*Data for the table `role_sources` */

insert  into `role_sources`(`rsid`,`rsdis`,`sid`,`roleid`) values (17,'资源和我们的角色描述',1,5),(18,'资源和我们的角色描述',2,5),(19,'资源和我们的角色描述',9,5),(20,'资源和我们的角色描述',10,5),(21,'资源和我们的角色描述',11,5),(22,'资源和我们的角色描述',12,5),(23,'资源和我们的角色描述',13,5),(24,'资源和我们的角色描述',3,5),(25,'资源和我们的角色描述',14,5),(26,'资源和我们的角色描述',15,5),(27,'资源和我们的角色描述',16,5),(28,'资源和我们的角色描述',17,5),(29,'资源和我们的角色描述',18,5),(30,'资源和我们的角色描述',19,5),(31,'资源和我们的角色描述',20,5),(32,'资源和我们的角色描述',21,5),(33,'资源和我们的角色描述',1,6),(34,'资源和我们的角色描述',2,6),(35,'资源和我们的角色描述',9,6),(36,'资源和我们的角色描述',10,6),(37,'资源和我们的角色描述',11,6),(38,'资源和我们的角色描述',12,6),(39,'资源和我们的角色描述',13,6),(40,'资源和我们的角色描述',3,6),(41,'资源和我们的角色描述',14,6),(42,'资源和我们的角色描述',15,6),(43,'资源和我们的角色描述',16,6),(44,'资源和我们的角色描述',17,6),(45,'资源和我们的角色描述',18,6),(46,'资源和我们的角色描述',19,6),(47,'资源和我们的角色描述',20,6),(48,'资源和我们的角色描述',21,6),(49,'资源和我们的角色描述',4,6),(50,'资源和我们的角色描述',27,6);

/*Table structure for table `sources` */

DROP TABLE IF EXISTS `sources`;

CREATE TABLE `sources` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(128) DEFAULT NULL COMMENT '资源路径',
  `remark` varchar(32) DEFAULT NULL COMMENT '资源备注',
  `pid` int(11) DEFAULT NULL COMMENT '父菜单id',
  `icon` varchar(32) DEFAULT NULL COMMENT '图标',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

/*Data for the table `sources` */

insert  into `sources`(`id`,`name`,`url`,`remark`,`pid`,`icon`) values (1,'oa办公协同系统',NULL,'系统名称',0,NULL),(2,'项目管理',NULL,'项目管理',1,NULL),(3,'日常办公',NULL,'日常办公',1,NULL),(4,'消息管理',NULL,'信息箱',1,NULL),(5,'客户信息管理',NULL,'客户信息管理',1,NULL),(6,'系统管理',NULL,'系统管理',1,NULL),(7,'对标管理',NULL,'对标管理',1,NULL),(8,'我的信息',NULL,'我的信息',1,NULL),(9,'基本信息管理',NULL,'项目基本信息',2,NULL),(10,'需求信息管理',NULL,'项目需求分析',2,NULL),(11,'模块管理',NULL,'模块管理',2,NULL),(12,'功能管理',NULL,'功能管理',2,NULL),(13,'附件管理',NULL,'附件管理',2,NULL),(14,'创建任务',NULL,'创建任务',3,NULL),(15,'已发布任务',NULL,'已发布任务',3,NULL),(16,'我的任务',NULL,'我的任务',3,NULL),(17,'通知公告',NULL,'通知公告',3,NULL),(18,'档案管理',NULL,'档案管理',3,NULL),(19,'我的档案',NULL,'我的档案',3,NULL),(20,'报销审批',NULL,'报销审批',3,NULL),(21,'我的报销',NULL,'我的报销',3,NULL),(27,'发送邮件','${pageContext.request.contextPath}/email-send.jsp','仅仅使用javamail发送邮件就ok啦',4,NULL);

/*Table structure for table `task` */

DROP TABLE IF EXISTS `task`;

CREATE TABLE `task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `starttime` date DEFAULT NULL,
  `endtime` date DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `remark` varchar(256) DEFAULT NULL,
  `fun_fk` int(11) DEFAULT NULL COMMENT '具体的功能外键',
  `emp_fk2` int(11) DEFAULT NULL COMMENT '具体实现功能的人',
  `emp_fk` int(11) NOT NULL COMMENT '分配任务的人',
  `tasktitle` varchar(32) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '任务的状态0,1,2',
  PRIMARY KEY (`id`),
  KEY `emp_fk2` (`emp_fk2`),
  KEY `FK8pqhf0pdn5r478vp69g6sip3` (`fun_fk`),
  KEY `FKcpxt4jxiaoqj5nwny5ai74drj` (`emp_fk`),
  CONSTRAINT `FK8pqhf0pdn5r478vp69g6sip3` FOREIGN KEY (`fun_fk`) REFERENCES `function` (`id`),
  CONSTRAINT `FKcpxt4jxiaoqj5nwny5ai74drj` FOREIGN KEY (`emp_fk`) REFERENCES `employee` (`eid`),
  CONSTRAINT `task_ibfk_1` FOREIGN KEY (`fun_fk`) REFERENCES `function` (`id`),
  CONSTRAINT `task_ibfk_3` FOREIGN KEY (`emp_fk2`) REFERENCES `employee` (`eid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `task` */

insert  into `task`(`id`,`starttime`,`endtime`,`level`,`remark`,`fun_fk`,`emp_fk2`,`emp_fk`,`tasktitle`,`status`) values (1,'2019-09-09','2019-10-10','低','慢慢做',1,2,1,'收费标准全部功能',1),(4,'2019-09-10','2019-09-20','中','权限信息中没有使用shiro和ztree，需要使用这些技术完成',3,2,1,'完善人员权限信息',2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
