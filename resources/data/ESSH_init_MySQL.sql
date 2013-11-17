/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50153
Source Host           : localhost:3306
Source Database       : essh

Target Server Type    : MYSQL
Target Server Version : 50153
File Encoding         : 65001

Date: 2013-11-17 18:57:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_base_organ
-- ----------------------------
DROP TABLE IF EXISTS `t_base_organ`;
CREATE TABLE `t_base_organ` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATE_USER` varchar(36) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `UPDATE_USER` varchar(36) DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `ADDRESS` varchar(255) DEFAULT NULL,
  `CODE` varchar(36) DEFAULT NULL,
  `FAX` varchar(64) DEFAULT NULL,
  `MANAGER_USER_ID` bigint(20) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  `ORDER_NO` int(11) DEFAULT NULL,
  `PHONE` varchar(64) DEFAULT NULL,
  `SYS_CODE` varchar(36) DEFAULT NULL,
  `TYPE` int(11) DEFAULT NULL,
  `PARENT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NAME` (`NAME`),
  KEY `FKFE2373CE3E535456` (`PARENT_ID`),
  CONSTRAINT `FKFE2373CE3E535456` FOREIGN KEY (`PARENT_ID`) REFERENCES `t_base_organ` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_base_organ
-- ----------------------------

-- ----------------------------
-- Table structure for t_base_resource
-- ----------------------------
DROP TABLE IF EXISTS `t_base_resource`;
CREATE TABLE `t_base_resource` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATE_USER` varchar(36) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `UPDATE_USER` varchar(36) DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `CODE` varchar(36) DEFAULT NULL,
  `ICON` varchar(255) DEFAULT NULL,
  `ICON_CLS` varchar(255) DEFAULT NULL,
  `MARK_URL` varchar(2000) DEFAULT NULL,
  `NAME` varchar(20) NOT NULL,
  `ORDER_NO` int(11) DEFAULT NULL,
  `TYPE` int(11) DEFAULT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `PARENT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKFCD7B111A886F349` (`PARENT_ID`),
  CONSTRAINT `FKFCD7B111A886F349` FOREIGN KEY (`PARENT_ID`) REFERENCES `t_base_resource` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_base_resource
-- ----------------------------
INSERT INTO `t_base_resource` VALUES ('1', null, null, '0', '2013-11-12 22:12:42', 'admin', '1', '', null, 'icon-application', '', '权限管理', '1', '0', '', null);
INSERT INTO `t_base_resource` VALUES ('2', null, null, '0', '2013-11-12 22:17:18', 'admin', '3', '', null, 'icon-folder', '', '资源管理', '2', '0', '/base/resource.action', '1');
INSERT INTO `t_base_resource` VALUES ('3', '2013-11-12 22:13:42', 'admin', '0', null, null, '0', '', null, 'icon-group', '', '角色管理', '3', '0', '/base/role.action', '1');
INSERT INTO `t_base_resource` VALUES ('4', '2013-11-12 22:14:10', 'admin', '0', null, null, '0', '', null, 'icon-group', '', '机构管理', '4', '0', '/base/organ.action', '1');
INSERT INTO `t_base_resource` VALUES ('5', '2013-11-12 22:14:28', 'admin', '0', null, null, '0', '', null, 'icon-user', '', '用户管理', '5', '0', '/base/user.action', '1');
INSERT INTO `t_base_resource` VALUES ('6', '2013-11-12 22:14:54', 'admin', '0', '2013-11-12 22:15:18', 'admin', '1', '', null, 'icon-application', '', '系统配置', '6', '0', '', null);
INSERT INTO `t_base_resource` VALUES ('7', '2013-11-12 22:15:13', 'admin', '0', '2013-11-12 22:28:36', 'admin', '1', '', null, 'icon-book', '', '字典类型', '7', '0', '/sys/dictionary-type.action', '6');
INSERT INTO `t_base_resource` VALUES ('8', '2013-11-12 22:15:40', 'admin', '0', '2013-11-12 22:28:43', 'admin', '1', '', null, 'icon-ipod', '', '数据字典', '8', '0', '/sys/dictionary.action', '6');
INSERT INTO `t_base_resource` VALUES ('9', '2013-11-12 22:15:57', 'admin', '0', null, null, '0', '', null, 'icon-bug', '', 'bug管理', '9', '0', '/sys/bug.action', '6');
INSERT INTO `t_base_resource` VALUES ('11', '2013-11-16 23:45:54', 'admin', '0', '2013-11-17 00:40:32', 'eryan', '3', 'bug:add', null, '', '/sys/bug!input*;/sys/bug!save*', '新增', '10', '0', '', '9');
INSERT INTO `t_base_resource` VALUES ('16', '2013-11-17 00:10:23', 'admin', '0', '2013-11-17 00:18:48', 'eryan', '1', 'bug:edit', null, '', '/sys/bug!save*', '编辑', '11', '0', '', '9');
INSERT INTO `t_base_resource` VALUES ('17', '2013-11-17 00:11:05', 'admin', '0', '2013-11-17 00:12:40', 'admin', '1', 'bug:importExcel', null, '', '/sys/bug!importExcel*', 'Excel导入', '12', '0', '', '9');
INSERT INTO `t_base_resource` VALUES ('18', '2013-11-17 00:13:35', 'admin', '0', null, null, '0', 'bug:exportExcel', null, '', '/sys/bug!exportExcel*', 'Excel导出', '13', '0', '', '9');
INSERT INTO `t_base_resource` VALUES ('19', '2013-11-17 00:14:32', 'admin', '0', null, null, '0', 'bug:remove', null, '', '/sys/bug!delete*;/sys/bug!remove*', '批量删除', '14', '0', '', '9');
INSERT INTO `t_base_resource` VALUES ('20', '2013-11-17 00:46:09', 'eryan', '0', null, null, '0', 'bug:view', null, '', '/sys/bug!view*', '查看', '15', '0', '', '9');

-- ----------------------------
-- Table structure for t_base_role
-- ----------------------------
DROP TABLE IF EXISTS `t_base_role`;
CREATE TABLE `t_base_role` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATE_USER` varchar(36) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `UPDATE_USER` varchar(36) DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `CODE` varchar(36) DEFAULT NULL,
  `NAME` varchar(100) NOT NULL,
  `REMARK` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NAME` (`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_base_role
-- ----------------------------

-- ----------------------------
-- Table structure for t_base_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `t_base_role_resource`;
CREATE TABLE `t_base_role_resource` (
  `ROLE_ID` bigint(20) NOT NULL,
  `RESOURCE_ID` bigint(20) NOT NULL,
  KEY `FK99003E94CBF981E5` (`ROLE_ID`),
  KEY `FK99003E9476B5CD65` (`RESOURCE_ID`),
  CONSTRAINT `FK99003E9476B5CD65` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `t_base_resource` (`ID`),
  CONSTRAINT `FK99003E94CBF981E5` FOREIGN KEY (`ROLE_ID`) REFERENCES `t_base_role` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_base_role_resource
-- ----------------------------

-- ----------------------------
-- Table structure for t_base_user
-- ----------------------------
DROP TABLE IF EXISTS `t_base_user`;
CREATE TABLE `t_base_user` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATE_USER` varchar(36) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `UPDATE_USER` varchar(36) DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `ADDRESS` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(64) DEFAULT NULL,
  `LOGIN_NAME` varchar(36) NOT NULL,
  `MOBILEPHONE` varchar(36) DEFAULT NULL,
  `NAME` varchar(36) DEFAULT NULL,
  `PASSWORD` varchar(64) NOT NULL,
  `SEX` int(11) DEFAULT NULL,
  `TEL` varchar(36) DEFAULT NULL,
  `DEFAULT_ORGANID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `LOGIN_NAME` (`LOGIN_NAME`),
  KEY `FKBDE2DA4E7AEFAE74` (`DEFAULT_ORGANID`),
  CONSTRAINT `FKBDE2DA4E7AEFAE74` FOREIGN KEY (`DEFAULT_ORGANID`) REFERENCES `t_base_organ` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_base_user
-- ----------------------------
INSERT INTO `t_base_user` VALUES ('1', null, null, '0', '2013-11-13 08:02:20', 'admin', '3', '', '', 'admin', null, '', '5f4dcc3b5aa765d61d8327deb882cf99', '2', '', null);

-- ----------------------------
-- Table structure for t_base_user_organ
-- ----------------------------
DROP TABLE IF EXISTS `t_base_user_organ`;
CREATE TABLE `t_base_user_organ` (
  `USER_ID` bigint(20) NOT NULL,
  `ORGAN_ID` bigint(20) NOT NULL,
  KEY `FK1F9964C01162FD8F` (`ORGAN_ID`),
  KEY `FK1F9964C0712445C5` (`USER_ID`),
  CONSTRAINT `FK1F9964C0712445C5` FOREIGN KEY (`USER_ID`) REFERENCES `t_base_user` (`ID`),
  CONSTRAINT `FK1F9964C01162FD8F` FOREIGN KEY (`ORGAN_ID`) REFERENCES `t_base_organ` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_base_user_organ
-- ----------------------------

-- ----------------------------
-- Table structure for t_base_user_resource
-- ----------------------------
DROP TABLE IF EXISTS `t_base_user_resource`;
CREATE TABLE `t_base_user_resource` (
  `USER_ID` bigint(20) NOT NULL,
  `RESOURCE_ID` bigint(20) NOT NULL,
  KEY `FKD8C9C2DF712445C5` (`USER_ID`),
  KEY `FKD8C9C2DF76B5CD65` (`RESOURCE_ID`),
  CONSTRAINT `FKD8C9C2DF76B5CD65` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `t_base_resource` (`ID`),
  CONSTRAINT `FKD8C9C2DF712445C5` FOREIGN KEY (`USER_ID`) REFERENCES `t_base_user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_base_user_resource
-- ----------------------------

-- ----------------------------
-- Table structure for t_base_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_base_user_role`;
CREATE TABLE `t_base_user_role` (
  `USER_ID` bigint(20) NOT NULL,
  `ROLE_ID` bigint(20) NOT NULL,
  KEY `FK2A5097C7CBF981E5` (`ROLE_ID`),
  KEY `FK2A5097C7712445C5` (`USER_ID`),
  CONSTRAINT `FK2A5097C7712445C5` FOREIGN KEY (`USER_ID`) REFERENCES `t_base_user` (`ID`),
  CONSTRAINT `FK2A5097C7CBF981E5` FOREIGN KEY (`ROLE_ID`) REFERENCES `t_base_role` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_base_user_role
-- ----------------------------

-- ----------------------------
-- Table structure for t_sys_bug
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_bug`;
CREATE TABLE `t_sys_bug` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATE_USER` varchar(36) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `UPDATE_USER` varchar(36) DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `CONTENT` longtext,
  `TITLE` varchar(255) DEFAULT NULL,
  `TYPE` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_bug
-- ----------------------------

-- ----------------------------
-- Table structure for t_sys_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_dictionary`;
CREATE TABLE `t_sys_dictionary` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATE_USER` varchar(36) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `UPDATE_USER` varchar(36) DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `CODE` varchar(36) DEFAULT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `ORDER_NO` int(11) DEFAULT NULL,
  `REMAK` varchar(100) DEFAULT NULL,
  `VALUE` varchar(100) DEFAULT NULL,
  `DICTIONARYTYPE_CODE` varchar(20) DEFAULT NULL,
  `PARENT_CODE` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CODE` (`CODE`),
  UNIQUE KEY `NAME` (`NAME`),
  UNIQUE KEY `CODE_2` (`CODE`),
  KEY `FK79C52CB373CC8B3F` (`DICTIONARYTYPE_CODE`),
  KEY `FK79C52CB3BD49F8CB` (`PARENT_CODE`),
  CONSTRAINT `FK79C52CB3BD49F8CB` FOREIGN KEY (`PARENT_CODE`) REFERENCES `t_sys_dictionary` (`CODE`),
  CONSTRAINT `FK79C52CB373CC8B3F` FOREIGN KEY (`DICTIONARYTYPE_CODE`) REFERENCES `t_sys_dictionarytype` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_dictionary
-- ----------------------------

-- ----------------------------
-- Table structure for t_sys_dictionarytype
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_dictionarytype`;
CREATE TABLE `t_sys_dictionarytype` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATE_USER` varchar(36) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `UPDATE_USER` varchar(36) DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `CODE` varchar(20) DEFAULT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `ORDER_NO` int(11) DEFAULT NULL,
  `REMARK` varchar(255) DEFAULT NULL,
  `GROUP_CODE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CODE` (`CODE`),
  UNIQUE KEY `NAME` (`NAME`),
  UNIQUE KEY `CODE_2` (`CODE`),
  KEY `FK8551226D4DC80EF0` (`GROUP_CODE`),
  CONSTRAINT `FK8551226D4DC80EF0` FOREIGN KEY (`GROUP_CODE`) REFERENCES `t_sys_dictionarytype` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_dictionarytype
-- ----------------------------
