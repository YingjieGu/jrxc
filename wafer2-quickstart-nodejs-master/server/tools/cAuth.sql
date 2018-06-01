/*
 Navicat Premium Data Transfer

 Source Server         : Localhost
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost
 Source Database       : cAuth

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : utf-8

 Date: 08/10/2017 22:22:52 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `cSessionInfo`
-- ----------------------------
DROP TABLE IF EXISTS `cSessionInfo`;
CREATE TABLE `cSessionInfo` (
  `open_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uuid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `skey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_visit_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `session_key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_info` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`open_id`),
  KEY `openid` (`open_id`) USING BTREE,
  KEY `skey` (`skey`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会话管理用户信息';

DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) DEFAULT NULL,
  `BEGIN_TIME` datetime DEFAULT NULL,
  `END_TIME` datetime DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Data for table "activity"
#

INSERT INTO `activity` VALUES (1,'草莓音乐节','2018-05-30 00:00:00','2018-05-31 00:00:00','草莓音乐节，地点陕西西安'),(2,'草莓音乐节1','2018-05-30 00:00:00','2018-05-31 00:00:00','草莓音乐节，地点陕西西安');

#
# Structure for table "address"
#

DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL DEFAULT '0',
  `LOCALTION` varchar(255) DEFAULT NULL,
  `POSTCODE` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "address"
#


#
# Structure for table "collect"
#

DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
  `PRODUCT_ID` varchar(255) DEFAULT NULL,
  `TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "collect"
#


#
# Structure for table "order"
#

DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(255) DEFAULT NULL COMMENT '订单唯一码',
  `USER_ID` int(11) DEFAULT NULL,
  `PRODUCT_ID` int(11) DEFAULT NULL,
  `SESSION_ID` int(11) DEFAULT NULL,
  `SEAT` varchar(255) DEFAULT NULL,
  `NUMBER` int(11) DEFAULT NULL COMMENT '购票数',
  `PAYMENT` int(11) DEFAULT NULL COMMENT '支付方式，1-微信，2-支付宝，3-银联',
  `PARTICIPANT` varchar(255) DEFAULT NULL COMMENT '参与者id，如果有多个，使用“，”号隔开',
  `REMARK` varchar(255) DEFAULT NULL,
  `TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "order"
#


#
# Structure for table "session"
#

DROP TABLE IF EXISTS `session`;
CREATE TABLE `session` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ACTIVITY_ID` int(11) DEFAULT NULL,
  `COUNT` int(11) DEFAULT NULL COMMENT '第几场',
  `PRICE` double(2,0) DEFAULT NULL COMMENT '价格',
  `BEGIN_TIME` datetime DEFAULT NULL COMMENT '演出开始时间',
  `END_TIME` datetime DEFAULT NULL COMMENT '演出结束时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "session"
#


#
# Structure for table "user"
#

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `PHONE` varchar(20) DEFAULT '',
  `NAME` varchar(255) DEFAULT NULL,
  `AGE` int(11) DEFAULT NULL,
  `SEX` tinyint(3) DEFAULT NULL,
  `CITY` varchar(255) DEFAULT NULL,
  `HEAD` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "user"
#

SET FOREIGN_KEY_CHECKS = 1;
