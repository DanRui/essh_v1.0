/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50153
Source Host           : localhost:3306
Source Database       : essh

Target Server Type    : MYSQL
Target Server Version : 50153
File Encoding         : 65001

Date: 2013-09-10 00:24:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_base_organ
-- ----------------------------
DROP TABLE IF EXISTS `t_base_organ`;
CREATE TABLE `t_base_organ` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATE_USER` varchar(36) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `UPDATE_USER` varchar(36) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `code` varchar(36) DEFAULT NULL,
  `fax` varchar(64) DEFAULT NULL,
  `MANAGER_USER_ID` bigint(20) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `ORDER_NO` int(11) DEFAULT NULL,
  `phone` varchar(64) DEFAULT NULL,
  `sysCode` varchar(36) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `PARENT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `FKFE2373CE3E535456` (`PARENT_ID`),
  CONSTRAINT `FKFE2373CE3E535456` FOREIGN KEY (`PARENT_ID`) REFERENCES `t_base_organ` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_base_organ
-- ----------------------------

-- ----------------------------
-- Table structure for t_base_organ_user
-- ----------------------------
DROP TABLE IF EXISTS `t_base_organ_user`;
CREATE TABLE `t_base_organ_user` (
  `ORGAN_ID` bigint(20) NOT NULL,
  `USER_ID` bigint(20) NOT NULL,
  KEY `FK1F5599C1162FD8F` (`ORGAN_ID`),
  KEY `FK1F5599C712445C5` (`USER_ID`),
  CONSTRAINT `FK1F5599C712445C5` FOREIGN KEY (`USER_ID`) REFERENCES `t_base_user` (`id`),
  CONSTRAINT `FK1F5599C1162FD8F` FOREIGN KEY (`ORGAN_ID`) REFERENCES `t_base_organ` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_base_organ_user
-- ----------------------------

-- ----------------------------
-- Table structure for t_base_resource
-- ----------------------------
DROP TABLE IF EXISTS `t_base_resource`;
CREATE TABLE `t_base_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATE_USER` varchar(36) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `UPDATE_USER` varchar(36) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `ICON_CLS` varchar(255) DEFAULT NULL,
  `MARK_URL` varchar(255) DEFAULT NULL,
  `name` varchar(20) NOT NULL,
  `ORDER_NO` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `PARENT_ID` bigint(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `code` varchar(36) DEFAULT NULL,
  `ICON` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBDDF03E2F54C321A` (`PARENT_ID`),
  CONSTRAINT `FKBDDF03E2F54C321A` FOREIGN KEY (`PARENT_ID`) REFERENCES `t_base_resource` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_base_resource
-- ----------------------------
INSERT INTO `t_base_resource` VALUES ('1', '2013-03-21 22:42:39', '系统', '0', '2013-08-22 21:25:58', 'admin', '1', 'icon-application', '', '权限管理', '1', '0', '', null, null, '', null);
INSERT INTO `t_base_resource` VALUES ('2', '2013-03-21 22:33:15', '系统', '0', '2013-08-15 23:59:59', 'admin', '1', 'icon-vcard', '/sys/resourcey*', '资源管理', '2', '0', '/base/resource.action', '1', null, 'base_resource', null);
INSERT INTO `t_base_resource` VALUES ('3', '2013-03-21 22:42:33', '系统', '0', '2013-08-16 00:00:12', 'admin', '2', 'icon-user', '/base/user*', '用户管理', '3', '0', '/base/user.action', '1', null, 'base_user', null);
INSERT INTO `t_base_resource` VALUES ('4', '2013-03-21 22:33:20', '系统', '0', '2013-08-16 00:00:38', 'admin', '1', 'icon-group', '/base/role*', '角色管理', '4', '0', '/base/role.action', '1', null, 'base_role', null);
INSERT INTO `t_base_resource` VALUES ('5', '2013-03-21 22:10:03', 'admin', '0', null, null, '0', 'icon-application', '', '系统配置', '5', '0', '', null, null, null, null);
INSERT INTO `t_base_resource` VALUES ('7', '2013-03-21 22:11:13', 'admin', '0', '2013-08-15 23:59:34', 'admin', '3', 'icon-book', '/sys/dictionary*', '数据字典', '7', '0', '/sys/dictionary.action', '5', null, 'sys_dictionary', null);
INSERT INTO `t_base_resource` VALUES ('8', '2013-03-27 20:11:03', 'admin', '0', '2013-08-15 23:59:24', 'admin', '2', 'icon-bug', '/sys/bug*', 'bug管理', '8', '0', '/sys/bug.action', '5', null, 'sys_bug', null);
INSERT INTO `t_base_resource` VALUES ('14', '2013-08-15 23:58:46', 'admin', '0', '2013-08-18 10:36:15', 'admin', '1', 'icon-folder', '/sys/dictionary-type*', '字典类型', '9', '0', '/sys/dictionary-type.action', '5', null, 'sys_dictionaryType', null);
INSERT INTO `t_base_resource` VALUES ('15', '2013-08-17 00:42:36', 'admin', '0', '2013-08-18 14:15:22', 'admin', '2', 'icon-application', '', '演示示例', '10', '0', '', null, null, '', null);
INSERT INTO `t_base_resource` VALUES ('16', '2013-08-17 00:43:53', 'admin', '0', '2013-08-17 15:28:22', 'admin', '3', 'icon-book', '', '字典示例', '1', '0', '/fileRedirect.action?toPage=demo/dictionarydemo.jsp', '15', null, '', null);
INSERT INTO `t_base_resource` VALUES ('17', '2013-08-18 16:15:04', 'eryan', '0', '2013-08-30 08:33:40', 'admin', '16', 'icon-vcard', '/sys/bug!datagrid*', '主页权限', '11', '1', '', '1', null, '', null);
INSERT INTO `t_base_resource` VALUES ('18', '2013-09-09 21:08:27', 'admin', '0', '2013-09-09 21:08:58', 'admin', '2', 'icon-group', '', '机构管理', '12', '0', '/base/organ.action', '1', null, '/base/organ*', null);

-- ----------------------------
-- Table structure for t_base_role
-- ----------------------------
DROP TABLE IF EXISTS `t_base_role`;
CREATE TABLE `t_base_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATE_USER` varchar(36) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `UPDATE_USER` varchar(36) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
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
  KEY `FK2A18CAE5CBF981E5` (`ROLE_ID`),
  KEY `FK99003E9476B5CD65` (`RESOURCE_ID`),
  CONSTRAINT `FK2A18CAE5CBF981E5` FOREIGN KEY (`ROLE_ID`) REFERENCES `t_base_role` (`id`),
  CONSTRAINT `FK99003E9476B5CD65` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `t_base_resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_base_role_resource
-- ----------------------------

-- ----------------------------
-- Table structure for t_base_user
-- ----------------------------
DROP TABLE IF EXISTS `t_base_user`;
CREATE TABLE `t_base_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATE_USER` varchar(36) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `UPDATE_USER` varchar(36) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `loginName` varchar(32) NOT NULL,
  `mobilephone` varchar(255) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `password` varchar(64) NOT NULL,
  `sex` int(11) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_base_user
-- ----------------------------
INSERT INTO `t_base_user` VALUES ('1', null, null, '0', '2013-08-18 13:44:10', 'admin', '2', '', '', 'admin', null, '', '5f4dcc3b5aa765d61d8327deb882cf99', '2', '');

-- ----------------------------
-- Table structure for t_base_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_base_user_role`;
CREATE TABLE `t_base_user_role` (
  `USER_ID` bigint(20) NOT NULL,
  `ROLE_ID` bigint(20) NOT NULL,
  KEY `FK2A5097C7CBF981E5` (`ROLE_ID`),
  KEY `FK2A5097C7712445C5` (`USER_ID`),
  CONSTRAINT `FK2A5097C7712445C5` FOREIGN KEY (`USER_ID`) REFERENCES `t_base_user` (`id`),
  CONSTRAINT `FK2A5097C7CBF981E5` FOREIGN KEY (`ROLE_ID`) REFERENCES `t_base_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_base_user_role
-- ----------------------------

-- ----------------------------
-- Table structure for t_sys_bug
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_bug`;
CREATE TABLE `t_sys_bug` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATE_USER` varchar(36) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `UPDATE_USER` varchar(36) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `content` longtext,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_bug
-- ----------------------------

-- ----------------------------
-- Table structure for t_sys_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_dictionary`;
CREATE TABLE `t_sys_dictionary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATE_USER` varchar(36) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `UPDATE_USER` varchar(36) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `code` varchar(36) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `ORDER_NO` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `DICTIONARYTYPE_CODE` varchar(12) DEFAULT NULL,
  `PARENT_CODE` varchar(36) DEFAULT NULL,
  `value` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `FK79C52CB373CC8B3F` (`DICTIONARYTYPE_CODE`),
  KEY `FK79C52CB3BD49F8CB` (`PARENT_CODE`),
  CONSTRAINT `FK79C52CB373CC8B3F` FOREIGN KEY (`DICTIONARYTYPE_CODE`) REFERENCES `t_sys_dictionarytype` (`code`),
  CONSTRAINT `FK79C52CB3BD49F8CB` FOREIGN KEY (`PARENT_CODE`) REFERENCES `t_sys_dictionary` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_dictionary
-- ----------------------------

-- ----------------------------
-- Table structure for t_sys_dictionarytype
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_dictionarytype`;
CREATE TABLE `t_sys_dictionarytype` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATE_USER` varchar(36) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `UPDATE_USER` varchar(36) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `code` varchar(12) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `ORDER_NO` int(11) DEFAULT NULL,
  `GROUP_CODE` varchar(12) DEFAULT NULL,
  `REMARK` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `FK8551226D4DC80EF0` (`GROUP_CODE`),
  CONSTRAINT `FK8551226D4DC80EF0` FOREIGN KEY (`GROUP_CODE`) REFERENCES `t_sys_dictionarytype` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_dictionarytype
-- ----------------------------
