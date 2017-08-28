/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50548
Source Host           : localhost:3306
Source Database       : project

Target Server Type    : MYSQL
Target Server Version : 50548
File Encoding         : 65001

Date: 2016-12-14 21:16:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for commonds
-- ----------------------------
DROP TABLE IF EXISTS `commonds`;
CREATE TABLE `commonds` (
  `sid` mediumint(8) unsigned NOT NULL COMMENT '学生id',
  `cid` mediumint(8) unsigned NOT NULL COMMENT '课程id',
  `commond` text COMMENT '评论',
  PRIMARY KEY (`sid`,`cid`),
  KEY `sid` (`sid`) USING BTREE,
  KEY `cid` (`cid`) USING BTREE,
  CONSTRAINT `commonds_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `courses` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `commonds_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `students` (`sid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of commonds
-- ----------------------------

-- ----------------------------
-- Table structure for courses
-- ----------------------------
DROP TABLE IF EXISTS `courses`;
CREATE TABLE `courses` (
  `cid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '课程id',
  `cname` varchar(255) NOT NULL COMMENT '课程名',
  `tid` mediumint(8) unsigned NOT NULL COMMENT '教师id',
  `startdate` date NOT NULL COMMENT '课程开始时间',
  `enddate` date NOT NULL COMMENT '课程结束时间',
  `timesegment` char(1) NOT NULL COMMENT '课程时段 1上午2下午3晚上',
  `cplace` varchar(255) NOT NULL COMMENT '课程地点',
  `number` smallint(11) NOT NULL COMMENT '课程号',
  `ctype` varchar(255) NOT NULL COMMENT '课程类型',
  `cprice` decimal(5,2) unsigned NOT NULL COMMENT '课程价格',
  `cintroduce` text NOT NULL COMMENT '课程介绍',
  `leftcourse` smallint(11) NOT NULL COMMENT '剩余课程量',
  `confirm` varchar(1) NOT NULL DEFAULT '0' COMMENT '确认审核（1通过，0未通过）',
  PRIMARY KEY (`cid`),
  KEY `tid` (`tid`) USING BTREE,
  KEY `cprice` (`cprice`),
  CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `teachers` (`tid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses
-- ----------------------------
INSERT INTO `courses` VALUES ('1', 'php', '1', '2016-12-08', '0000-00-00', '', '河北工业大学北辰校区计算机学院楼', '1', '计算机', '200.00', '学习php', '0', '0');
INSERT INTO `courses` VALUES ('2', 'c++', '2', '2016-12-02', '0000-00-00', '', '2', '2', '2', '2.00', '2', '0', '0');
INSERT INTO `courses` VALUES ('3', 'c', '3', '2016-12-08', '0000-00-00', '', '3', '3', '3', '3.00', '3', '0', '0');
INSERT INTO `courses` VALUES ('4', 'vb', '1', '2016-12-08', '0000-00-00', '', '4', '4', '4', '4.00', '4', '0', '0');
INSERT INTO `courses` VALUES ('5', 'c', '1', '2016-12-08', '0000-00-00', '', '5', '5', '5', '5.00', '5', '0', '0');
INSERT INTO `courses` VALUES ('6', 'c++', '1', '2016-12-09', '0000-00-00', '', '6', '6', '6', '0.00', '6', '0', '0');

-- ----------------------------
-- Table structure for courses_copy
-- ----------------------------
DROP TABLE IF EXISTS `courses_copy`;
CREATE TABLE `courses_copy` (
  `cid` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '课程id',
  `cname` varchar(255) NOT NULL,
  `tid` int(20) unsigned NOT NULL,
  `ctime` datetime NOT NULL,
  `cplace` varchar(255) NOT NULL,
  `number` int(11) NOT NULL,
  `ctype` varchar(255) NOT NULL,
  `cprice` float(10,2) NOT NULL,
  `cintroduce` text NOT NULL,
  `leftcourse` int(11) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `tid` (`tid`) USING BTREE,
  KEY `cprice` (`cprice`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_copy
-- ----------------------------
INSERT INTO `courses_copy` VALUES ('1', 'php', '1', '2016-12-08 19:00:00', '河北工业大学北辰校区计算机学院楼', '1', '计算机', '200.00', '学习php', '0');
INSERT INTO `courses_copy` VALUES ('2', 'c++', '2', '2016-12-02 00:00:00', '2', '2', '2', '2.00', '2', '0');
INSERT INTO `courses_copy` VALUES ('3', 'c', '3', '2016-12-08 00:00:00', '3', '3', '3', '3.00', '3', '0');
INSERT INTO `courses_copy` VALUES ('4', 'vb', '1', '2016-12-08 00:00:00', '4', '4', '4', '4.00', '4', '0');
INSERT INTO `courses_copy` VALUES ('5', 'c', '1', '2016-12-08 00:00:00', '5', '5', '5', '5.00', '5', '0');
INSERT INTO `courses_copy` VALUES ('6', 'c++', '1', '2016-12-09 00:00:00', '6', '6', '6', '0.00', '6', '0');

-- ----------------------------
-- Table structure for managments
-- ----------------------------
DROP TABLE IF EXISTS `managments`;
CREATE TABLE `managments` (
  `mid` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `mname` varchar(255) NOT NULL COMMENT '管理员姓名',
  `mpassword` varchar(255) NOT NULL COMMENT '管理员密码',
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of managments
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `oid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `sid` mediumint(8) unsigned NOT NULL COMMENT '学生id',
  `cid` mediumint(8) unsigned NOT NULL COMMENT '课程id',
  `otype` varchar(255) NOT NULL COMMENT '订单类型（收益，退款）',
  `otime` datetime NOT NULL COMMENT '订单时间',
  `payway` varchar(255) NOT NULL COMMENT '付款方式',
  `paynumber` int(11) NOT NULL COMMENT '付款账号',
  `money` decimal(5,2) NOT NULL COMMENT '订单金额',
  PRIMARY KEY (`oid`),
  KEY `sid` (`sid`) USING BTREE,
  KEY `cid` (`cid`) USING BTREE,
  KEY `money` (`money`) USING BTREE,
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`money`) REFERENCES `courses` (`cprice`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `students` (`sid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `courses` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for orders_copy
-- ----------------------------
DROP TABLE IF EXISTS `orders_copy`;
CREATE TABLE `orders_copy` (
  `oid` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `sid` int(20) unsigned NOT NULL,
  `cid` int(20) unsigned NOT NULL,
  `otype` varchar(255) NOT NULL,
  `otime` datetime NOT NULL,
  `payway` varchar(255) NOT NULL,
  `paynumber` int(11) NOT NULL,
  `money` float NOT NULL,
  PRIMARY KEY (`oid`),
  KEY `sid` (`sid`) USING BTREE,
  KEY `cid` (`cid`) USING BTREE,
  KEY `money` (`money`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders_copy
-- ----------------------------

-- ----------------------------
-- Table structure for students
-- ----------------------------
DROP TABLE IF EXISTS `students`;
CREATE TABLE `students` (
  `sid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '学生id',
  `sname` varchar(255) NOT NULL COMMENT '学生姓名',
  `ssex` varchar(10) NOT NULL COMMENT '学生性别',
  `sdate` date NOT NULL COMMENT '学生用户出生日期',
  `stel` varchar(20) NOT NULL COMMENT '学生用户电话',
  `sadd` varchar(255) NOT NULL COMMENT '学生用户地址',
  `spassword` varchar(255) NOT NULL COMMENT '学生用户密码',
  `registerdate` datetime NOT NULL COMMENT '学生用户注册时间',
  `id` char(255) NOT NULL COMMENT '学生用户用户名',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of students
-- ----------------------------
INSERT INTO `students` VALUES ('30', '慕蕊', '女', '1997-04-12', '15122908619', '河北省衡水市故城县故城村', '1527752009', '2016-11-28 22:17:14', '1527752009');

-- ----------------------------
-- Table structure for students_copy
-- ----------------------------
DROP TABLE IF EXISTS `students_copy`;
CREATE TABLE `students_copy` (
  `sid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '学生id',
  `sname` varchar(255) NOT NULL COMMENT '学生姓名',
  `ssex` varchar(10) NOT NULL COMMENT '学生性别',
  `sdate` date NOT NULL COMMENT '学生出生日期',
  `stel` varchar(20) NOT NULL COMMENT '学生电话',
  `sadd` varchar(255) NOT NULL COMMENT '学生地址',
  `spassword` varchar(255) NOT NULL COMMENT '学生密码',
  `registerdate` datetime NOT NULL COMMENT '学生注册时间',
  `id` char(255) NOT NULL COMMENT '学生用户名',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of students_copy
-- ----------------------------
INSERT INTO `students_copy` VALUES ('30', '慕蕊', '女', '1997-04-12', '15122908619', '河北省衡水市故城县故城村', '1527752009', '2016-11-28 22:17:14', '1527752009');

-- ----------------------------
-- Table structure for teachers
-- ----------------------------
DROP TABLE IF EXISTS `teachers`;
CREATE TABLE `teachers` (
  `tid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '教师id',
  `tsex` varchar(20) NOT NULL COMMENT '教师性别',
  `tname` varchar(255) NOT NULL COMMENT '教师姓名',
  `tdate` date NOT NULL COMMENT '教师出生日期',
  `tadd` varchar(255) NOT NULL COMMENT '教师地址',
  `unit` varchar(255) NOT NULL COMMENT '教师所在单位',
  `tpassword` varchar(255) NOT NULL COMMENT '教师密码',
  `ttel` varchar(20) NOT NULL COMMENT '教师电话',
  `tintroduce` text NOT NULL COMMENT '教师自我介绍',
  `position` varchar(255) NOT NULL COMMENT '教师职称',
  `tregistetime` datetime NOT NULL COMMENT '教师注册时间',
  `id` char(255) NOT NULL COMMENT '教师用户名',
  `confirm` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否审核（1审核，0未审核）',
  PRIMARY KEY (`tid`),
  UNIQUE KEY `ttel` (`ttel`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teachers
-- ----------------------------
INSERT INTO `teachers` VALUES ('1', '男', '谢必磊', '1996-05-03', '天津市北辰区双口镇', '河北工业大学', 'XIELEI1992', '13752625733', '大家好，我是谢必磊', '教师', '2016-12-08 00:00:00', '568231952', '1');
INSERT INTO `teachers` VALUES ('2', '2', '2', '2016-12-08', '2', '2', '2', '2', '2', '2', '2016-12-08 00:00:00', '2', '1');
INSERT INTO `teachers` VALUES ('3', '3', '3', '2016-12-08', '3', '3', '3', '3', '3', '3', '2016-12-08 00:00:00', '3', '1');

-- ----------------------------
-- Table structure for teachers_copy
-- ----------------------------
DROP TABLE IF EXISTS `teachers_copy`;
CREATE TABLE `teachers_copy` (
  `tid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '教师id',
  `tsex` varchar(20) NOT NULL COMMENT '教师性别',
  `tname` varchar(255) NOT NULL COMMENT '教师姓名',
  `tdate` date NOT NULL COMMENT '教师出生日期',
  `tadd` varchar(255) NOT NULL COMMENT '教师地址',
  `unit` varchar(255) NOT NULL COMMENT '教师单位',
  `tpassword` varchar(255) NOT NULL COMMENT '教师密码',
  `ttel` varchar(20) NOT NULL COMMENT '教师电话',
  `tintroduce` text NOT NULL COMMENT '教师自我介绍',
  `position` varchar(255) NOT NULL COMMENT '教师职称',
  `tregistetime` datetime NOT NULL COMMENT '教师注册时间',
  `id` char(255) NOT NULL COMMENT '教师用户名',
  `auth` int(1) NOT NULL COMMENT '是否核验',
  PRIMARY KEY (`tid`),
  UNIQUE KEY `ttel` (`ttel`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teachers_copy
-- ----------------------------
INSERT INTO `teachers_copy` VALUES ('1', '男', '谢必磊', '1996-05-03', '天津市北辰区双口镇', '河北工业大学', 'XIELEI1992', '13752625733', '大家好，我是谢必磊', '教师', '2016-12-08 00:00:00', '568231952', '1');
INSERT INTO `teachers_copy` VALUES ('2', '2', '2', '2016-12-08', '2', '2', '2', '2', '2', '2', '2016-12-08 00:00:00', '2', '1');
INSERT INTO `teachers_copy` VALUES ('3', '3', '3', '2016-12-08', '3', '3', '3', '3', '3', '3', '2016-12-08 00:00:00', '3', '1');
