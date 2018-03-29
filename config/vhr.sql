/*
SQLyog v10.2 
MySQL - 5.7.19 : Database - vhr
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`vhr` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `vhr`;

/*Table structure for table `apis` */

DROP TABLE IF EXISTS `apis`;

CREATE TABLE `apis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `select_sql` varchar(500) DEFAULT NULL,
  `api_name` varchar(50) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `apis` */

insert  into `apis`(`id`,`select_sql`,`api_name`) values (1,'SELECT * FROM role','getRole'),(2,'SELECT * FROM hr','login'),(3,'SELECT * FROM menu','getSysmenu');

/*Table structure for table `department` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '部门名称',
  `parentId` int(11) DEFAULT NULL,
  `depPath` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  `isParent` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;

/*Data for the table `department` */

insert  into `department`(`id`,`name`,`parentId`,`depPath`,`enabled`,`isParent`) values (1,'股东会',-1,'.1',1,1),(4,'董事会',1,'.1.4',1,1),(5,'总办',4,'.1.4.5',1,1),(8,'财务部',5,'.1.4.5.8',1,0),(78,'市场部',5,'.1.4.5.78',1,0),(91,'技术部',5,'.1.4.5.91',1,0),(92,'运维部',5,'.1.4.5.92',1,0);

/*Table structure for table `employee` */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '员工编号',
  `name` varchar(10) DEFAULT NULL COMMENT '员工姓名',
  `gender` char(4) DEFAULT NULL COMMENT '性别',
  `birthday` date DEFAULT NULL COMMENT '出生日期',
  `idCard` char(18) DEFAULT NULL COMMENT '身份证号',
  `nationId` int(8) DEFAULT NULL COMMENT '民族',
  `nativePlace` varchar(20) DEFAULT NULL COMMENT '籍贯',
  `email` varchar(20) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(11) DEFAULT NULL COMMENT '电话号码',
  `address` varchar(64) DEFAULT NULL COMMENT '联系地址',
  `departmentId` int(11) DEFAULT NULL COMMENT '所属部门',
  `posId` int(11) DEFAULT NULL COMMENT '职位ID',
  `tiptopDegree` enum('博士','硕士','本科','大专','高中','初中','小学','其他') DEFAULT NULL COMMENT '最高学历',
  `beginDate` date DEFAULT NULL COMMENT '入职日期',
  `workState` enum('在职','离职') DEFAULT '在职' COMMENT '在职状态',
  `workID` char(8) DEFAULT NULL COMMENT '工号',
  `notWorkDate` date DEFAULT NULL COMMENT '离职日期',
  `workAge` int(11) DEFAULT NULL COMMENT '工龄',
  PRIMARY KEY (`id`),
  KEY `departmentId` (`departmentId`),
  KEY `dutyId` (`posId`),
  KEY `nationId` (`nationId`),
  KEY `workID_key` (`workID`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`departmentId`) REFERENCES `department` (`id`),
  CONSTRAINT `employee_ibfk_3` FOREIGN KEY (`posId`) REFERENCES `position` (`id`),
  CONSTRAINT `employee_ibfk_4` FOREIGN KEY (`nationId`) REFERENCES `nation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1522 DEFAULT CHARSET=utf8;

/*Data for the table `employee` */

insert  into `employee`(`id`,`name`,`gender`,`birthday`,`idCard`,`nationId`,`nativePlace`,`email`,`phone`,`address`,`departmentId`,`posId`,`tiptopDegree`,`beginDate`,`workState`,`workID`,`notWorkDate`,`workAge`) values (1,'张明','男','1990-01-01','610122199001011256',1,'陕西','laowang@qq.com','18565558897','深圳市南山区',5,29,'本科','2018-01-01','在职','00000001',NULL,NULL),(2,'陈静','女','1989-02-01','421288198902011234',1,'海南','chenjing@qq.com','18795556693','海南省海口市美兰区',8,30,'高中','2015-06-09','在职','00000002',NULL,NULL),(3,'赵琳浩','男','1993-03-04','610122199303041456',1,'陕西','zhao@qq.com','15698887795','陕西省西安市莲湖区',91,33,'博士','2018-01-01','在职','00000003',NULL,NULL),(1519,'李白','男','1994-02-04','330282199111051668',1,'浙江',NULL,'15836362477','浙江宁波',91,29,'大专','2018-02-21','在职','00000004',NULL,NULL),(1520,'孟浩然','男','2017-04-03','330282199111021447',2,'上海',NULL,'18805698544','静安区',8,30,'大专','2018-02-21','在职','00000005',NULL,NULL),(1521,'辛弃疾','男','2018-02-21','330282199111021445',3,'浙江',NULL,'13562486588','湖州',8,31,'硕士','2018-02-14','在职','00000006',NULL,NULL);

/*Table structure for table `hr` */

DROP TABLE IF EXISTS `hr`;

CREATE TABLE `hr` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'hrID',
  `name` varchar(32) DEFAULT NULL COMMENT '姓名',
  `enabled` tinyint(1) DEFAULT '1',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `userface` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `hr` */

insert  into `hr`(`id`,`name`,`enabled`,`username`,`password`,`userface`,`remark`) values (3,'系统管理员',1,'admin','123','http://bpic.588ku.com/element_pic/01/40/00/64573ce2edc0728.jpg',NULL),(5,'user',1,'user','123','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1514093920321&di=913e88c23f382933ef430024afd9128a&imgtype=0&src=http%3A%2F%2Fp.3761.com%2Fpic%2F9771429316733.jpg',NULL);

/*Table structure for table `hr_role` */

DROP TABLE IF EXISTS `hr_role`;

CREATE TABLE `hr_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hrid` int(11) DEFAULT NULL,
  `rid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`),
  KEY `hr_role_ibfk_1` (`hrid`),
  CONSTRAINT `hr_role_ibfk_1` FOREIGN KEY (`hrid`) REFERENCES `hr` (`id`) ON DELETE CASCADE,
  CONSTRAINT `hr_role_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

/*Data for the table `hr_role` */

insert  into `hr_role`(`id`,`hrid`,`rid`) values (1,3,6),(50,5,14);

/*Table structure for table `menu` */

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(64) DEFAULT NULL,
  `path` varchar(64) DEFAULT NULL,
  `component` varchar(64) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `iconCls` varchar(64) DEFAULT NULL,
  `keepAlive` tinyint(1) DEFAULT NULL,
  `requireAuth` tinyint(1) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `parentId` (`parentId`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parentId`) REFERENCES `menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

/*Data for the table `menu` */

insert  into `menu`(`id`,`url`,`path`,`component`,`name`,`iconCls`,`keepAlive`,`requireAuth`,`parentId`,`enabled`) values (1,'/',NULL,NULL,'所有',NULL,NULL,NULL,NULL,1),(2,'/','/home','Home','员工资料','fa fa-user-circle-o',NULL,1,1,1),(3,'/','/home','Home','物品管理','fa fa-address-card-o',NULL,1,1,1),(5,'/','/home','Home','统计管理','fa fa-bar-chart',NULL,1,1,1),(6,'/','/home','Home','系统管理','fa fa-windows',NULL,1,1,1),(7,'/employee/basic/**','/emp/basic','EmpBasic','基本资料',NULL,NULL,1,2,1),(8,'/employee/advanced/**','/emp/adv','EmpAdv','高级资料',NULL,NULL,1,2,0),(9,'/personnel/emp/**','/per/emp','PerEmp','员工资料',NULL,NULL,1,3,0),(10,'/test2/a/**','/t2/a','Test2A','物品库存',NULL,NULL,1,3,1),(11,'/test2/b/**','/t2/B','Test2B','记录查询',NULL,NULL,1,3,1),(12,'/test2/c/**','/t2/C','Test2C','测试1-3',NULL,NULL,1,3,1),(13,'/test2/d/**','/t2/D','Test2D','测试1-5',NULL,NULL,1,3,1),(19,'/test3/a/**','/t3/a','Test3A','测试3-1',NULL,NULL,1,5,1),(20,'/test3/b/**','/t3/b','Test3B','测试3-2',NULL,NULL,1,5,1),(21,'/test3/c/**','/t3/c','Test3C','测试3-3',NULL,NULL,1,5,1),(22,'/test3/d/**','/t3/d','Test3D','测试3-4',NULL,NULL,1,5,1),(23,'/system/basic/**','/sys/basic','SysBasic','基础信息设置',NULL,NULL,1,6,1),(24,'/system/cfg/**','/sys/cfg','SysCfg','系统管理',NULL,NULL,1,6,1),(25,'/system/log/**','/sys/log','SysLog','操作日志管理',NULL,NULL,1,6,1),(26,'/system/hr/**','/sys/hr','SysHr','操作员管理',NULL,NULL,1,6,1),(27,'/system/data/**','/sys/data','SysData','备份恢复数据库',NULL,NULL,1,6,1),(28,'/system/init/**','/sys/init','SysInit','初始化数据库',NULL,NULL,1,6,1);

/*Table structure for table `menu_role` */

DROP TABLE IF EXISTS `menu_role`;

CREATE TABLE `menu_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT NULL,
  `rid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  KEY `rid` (`rid`),
  CONSTRAINT `menu_role_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `menu` (`id`),
  CONSTRAINT `menu_role_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=313 DEFAULT CHARSET=utf8;

/*Data for the table `menu_role` */

insert  into `menu_role`(`id`,`mid`,`rid`) values (162,7,6),(163,9,6),(164,10,6),(165,11,6),(166,12,6),(167,13,6),(173,19,6),(174,20,6),(175,21,6),(176,22,6),(177,23,6),(178,25,6),(179,26,6),(180,27,6),(181,28,6),(182,24,6),(293,7,2),(294,10,2),(295,11,2),(296,12,2),(297,13,2),(298,19,2),(299,20,2),(300,21,2),(301,22,2),(302,23,2),(303,24,2),(304,25,2),(305,26,2),(306,27,2),(307,28,2),(308,7,14),(309,10,14),(310,11,14),(311,12,14),(312,13,14);

/*Table structure for table `nation` */

DROP TABLE IF EXISTS `nation`;

CREATE TABLE `nation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

/*Data for the table `nation` */

insert  into `nation`(`id`,`name`) values (1,'汉族'),(2,'蒙古族'),(3,'回族'),(4,'藏族'),(5,'维吾尔族'),(6,'苗族'),(7,'彝族'),(8,'壮族'),(9,'布依族'),(10,'朝鲜族'),(11,'满族'),(12,'侗族'),(13,'瑶族'),(14,'白族'),(15,'土家族'),(16,'哈尼族'),(17,'哈萨克族'),(18,'傣族'),(19,'黎族'),(20,'傈僳族'),(21,'佤族'),(22,'畲族'),(23,'高山族'),(24,'拉祜族'),(25,'水族'),(26,'东乡族'),(27,'纳西族'),(28,'景颇族'),(29,'柯尔克孜族'),(30,'土族'),(31,'达斡尔族'),(32,'仫佬族'),(33,'羌族'),(34,'布朗族'),(35,'撒拉族'),(36,'毛难族'),(37,'仡佬族'),(38,'锡伯族'),(39,'阿昌族'),(40,'普米族'),(41,'塔吉克族'),(42,'怒族'),(43,'乌孜别克族'),(44,'俄罗斯族'),(45,'鄂温克族'),(46,'崩龙族'),(47,'保安族'),(48,'裕固族'),(49,'京族'),(50,'塔塔尔族'),(51,'独龙族'),(52,'鄂伦春族'),(53,'赫哲族'),(54,'门巴族'),(55,'珞巴族'),(56,'基诺族');

/*Table structure for table `os` */

DROP TABLE IF EXISTS `os`;

CREATE TABLE `os` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oid` int(11) DEFAULT NULL,
  `eid` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `data` int(11) DEFAULT NULL,
  `time` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `os` */

insert  into `os`(`id`,`oid`,`eid`,`status`,`data`,`time`) values (1,6,1,'入库',100,'2018-02-17'),(2,4,2,'入库',100,'2018-02-17'),(3,5,3,'入库',50,'2018-02-17'),(4,6,1,'领用',-20,'2018-02-17'),(5,4,2,'入库',100,'2018-02-19'),(6,4,1,'领用',-20,'2018-02-19'),(7,4,1,'入库',20,'2018-02-19'),(8,4,1,'领用',-100,'2018-02-19'),(9,7,1,'入库',20,'2018-02-20'),(10,5,2,'入库',100,'2018-02-20'),(11,5,2,'领用',100,'2018-02-20'),(12,7,1,'领用',-10,'2018-02-20');

/*Table structure for table `ostype` */

DROP TABLE IF EXISTS `ostype`;

CREATE TABLE `ostype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `osPath` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  `isParent` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `ostype` */

insert  into `ostype`(`id`,`name`,`parentId`,`osPath`,`enabled`,`isParent`) values (1,'行政用品',-1,'.1',1,1),(3,'文具',1,'.1.3',1,1),(4,'铅笔',3,'.1.3.4',1,0),(5,'水笔',3,'.1.3.5',1,0),(6,'圆珠笔',3,'.1.3.6',1,0),(7,'橡皮',3,'.1.3.7',1,0);

/*Table structure for table `position` */

DROP TABLE IF EXISTS `position`;

CREATE TABLE `position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '职位',
  `createDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

/*Data for the table `position` */

insert  into `position`(`id`,`name`,`createDate`,`enabled`) values (29,'技术总监','2018-01-11 21:13:42',1),(30,'运营总监','2018-01-11 21:13:48',1),(31,'市场总监','2018-01-11 21:13:56',1),(32,'总经理','2018-01-11 21:35:07',1),(33,'研发工程师','2018-01-14 16:07:11',1),(34,'运维工程师','2018-01-14 16:11:41',1);

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `nameZh` varchar(64) DEFAULT NULL COMMENT '角色名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`id`,`name`,`nameZh`) values (1,'ROLE_manager','部门经理'),(2,'ROLE_personnel','人事专员'),(3,'ROLE_recruiter','招聘主管'),(4,'ROLE_train','培训主管'),(5,'ROLE_performance','薪酬绩效主管'),(6,'ROLE_admin','系统管理员'),(13,'ROLE_test2','测试角色2'),(14,'ROLE_test1','测试角色1');

/* Procedure structure for procedure `addDep` */

/*!50003 DROP PROCEDURE IF EXISTS  `addDep` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `addDep`(in depName varchar(32),in parentId int,in enabled boolean,out result int,out result2 int)
begin
  declare did int;
  declare pDepPath varchar(64);
  insert into department set name=depName,parentId=parentId,enabled=enabled;
  select row_count() into result;
  select last_insert_id() into did;
  set result2=did;
  select depPath into pDepPath from department where id=parentId;
  update department set depPath=concat(pDepPath,'.',did) where id=did;
  update department set isParent=true where id=parentId;
end */$$
DELIMITER ;

/* Procedure structure for procedure `addOsp` */

/*!50003 DROP PROCEDURE IF EXISTS  `addOsp` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `addOsp`(IN ospName VARCHAR(32), IN parentId INT, IN enabled TINYINT(1), OUT result INT, OUT result2 INT)
BEGIN
     declare did int;
    declare pOspPath varchar(64);
    insert into ostype set name=ospName,parentId=parentId,enabled=enabled;
    select row_count() into result;
    select last_insert_id() into did;
    set result2=did;
    select osPath into pOspPath from ostype where id=parentId;
    update ostype set osPath=concat(pOspPath,'.',did) where id=did;
    update ostype set isParent=true where id=parentId;
    
    
   
    
	END */$$
DELIMITER ;

/* Procedure structure for procedure `deleteDep` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteDep` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteDep`(in did int,out result int)
begin
  declare ecount int;
  declare pid int;
  declare pcount int;
  select count(*) into ecount from employee where departmentId=did;
  if ecount>0 then set result=-1;
  else 
  select parentId into pid from department where id=did;
  delete from department where id=did and isParent=false;
  select row_count() into result;
  select count(*) into pcount from department where parentId=pid;
  if pcount=0 then update department set isParent=false where id=pid;
  end if;
  end if;
end */$$
DELIMITER ;

/* Procedure structure for procedure `deleteOsp` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteOsp` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteOsp`(IN did INT, OUT result INT)
BEGIN
    declare ecount int;
    declare pid int;
    declare pcount int;
   /* select count(*) into ecount from employee where departmentId=did;*/
    /*if ecount>0 then set result=-1;*/
    /*else*/
      select parentId into pid from ostype where id=did;
      delete from ostype where id=did and isParent=false;
      select row_count() into result;
      select count(*) into pcount from ostype where parentId=pid;
      if pcount=0 then update ostype set isParent=false where id=pid;
      end if;
    
    
    
    
    
    END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
