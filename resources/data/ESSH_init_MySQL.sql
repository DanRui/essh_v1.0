/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50153
Source Host           : localhost:3306
Source Database       : essh

Target Server Type    : MYSQL
Target Server Version : 50153
File Encoding         : 65001

Date: 2013-08-19 08:28:56
*/

SET FOREIGN_KEY_CHECKS=0;

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
  `ico` varchar(255) DEFAULT NULL,
  `MARK_URL` varchar(255) DEFAULT NULL,
  `name` varchar(20) NOT NULL,
  `ORDER_NO` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `PARENT_ID` bigint(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `code` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBDDF03E2F54C321A` (`PARENT_ID`),
  CONSTRAINT `FKBDDF03E2F54C321A` FOREIGN KEY (`PARENT_ID`) REFERENCES `t_base_resource` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_base_resource
-- ----------------------------
INSERT INTO `t_base_resource` VALUES ('1', '2013-03-21 22:42:39', '系统', '0', null, null, '0', 'icon-application', '', '权限管理', '1', '0', '', null, null, null);
INSERT INTO `t_base_resource` VALUES ('2', '2013-03-21 22:33:15', '系统', '0', '2013-08-15 23:59:59', 'admin', '1', 'icon-vcard', '/sys/resourcey*', '资源管理', '2', '0', '/base/resource.action', '1', null, 'base_resource');
INSERT INTO `t_base_resource` VALUES ('3', '2013-03-21 22:42:33', '系统', '0', '2013-08-16 00:00:12', 'admin', '2', 'icon-user', '/base/user*', '用户管理', '3', '0', '/base/user.action', '1', null, 'base_user');
INSERT INTO `t_base_resource` VALUES ('4', '2013-03-21 22:33:20', '系统', '0', '2013-08-16 00:00:38', 'admin', '1', 'icon-group', '/base/role*', '角色管理', '4', '0', '/base/role.action', '1', null, 'base_role');
INSERT INTO `t_base_resource` VALUES ('5', '2013-03-21 22:10:03', 'admin', '0', null, null, '0', 'icon-application', '', '系统配置', '5', '0', '', null, null, null);
INSERT INTO `t_base_resource` VALUES ('7', '2013-03-21 22:11:13', 'admin', '0', '2013-08-15 23:59:34', 'admin', '3', 'icon-book', '/sys/dictionary*', '数据字典', '7', '0', '/sys/dictionary.action', '5', null, 'sys_dictionary');
INSERT INTO `t_base_resource` VALUES ('8', '2013-03-27 20:11:03', 'admin', '0', '2013-08-15 23:59:24', 'admin', '2', 'icon-bug', '/sys/bug*', 'bug管理', '8', '0', '/sys/bug.action', '5', null, 'sys_bug');
INSERT INTO `t_base_resource` VALUES ('14', '2013-08-15 23:58:46', 'admin', '0', '2013-08-18 10:36:15', 'admin', '1', 'icon-folder', '/sys/dictionary-type*', '字典类型', '9', '0', '/sys/dictionary-type.action', '5', null, 'sys_dictionaryType');
INSERT INTO `t_base_resource` VALUES ('15', '2013-08-17 00:42:36', 'admin', '0', '2013-08-18 14:15:22', 'admin', '2', 'icon-application', '', '演示示例', '10', '0', '', null, null, '');
INSERT INTO `t_base_resource` VALUES ('16', '2013-08-17 00:43:53', 'admin', '0', '2013-08-17 15:28:22', 'admin', '3', 'icon-book', '', '字典示例', '1', '0', '/fileRedirect.action?toPage=demo/dictionarydemo.jsp', '15', null, '');
INSERT INTO `t_base_resource` VALUES ('17', '2013-08-18 16:15:04', 'eryan', '0', '2013-08-18 16:15:14', 'eryan', '1', '', '/sys/bug!datagrid*', '主页权限', '11', '1', '', '1', null, '');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_base_role
-- ----------------------------
INSERT INTO `t_base_role` VALUES ('1', '2013-08-17 00:47:56', 'admin', '0', null, null, '0', '', '啊');
INSERT INTO `t_base_role` VALUES ('2', '2013-08-17 14:07:27', 'admin', '0', '2013-08-18 22:27:41', 'admin', '6', '', 'sd');

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
INSERT INTO `t_base_role_resource` VALUES ('1', '1');
INSERT INTO `t_base_role_resource` VALUES ('1', '2');
INSERT INTO `t_base_role_resource` VALUES ('1', '3');
INSERT INTO `t_base_role_resource` VALUES ('1', '4');
INSERT INTO `t_base_role_resource` VALUES ('1', '5');
INSERT INTO `t_base_role_resource` VALUES ('1', '7');
INSERT INTO `t_base_role_resource` VALUES ('1', '8');
INSERT INTO `t_base_role_resource` VALUES ('1', '14');
INSERT INTO `t_base_role_resource` VALUES ('1', '15');
INSERT INTO `t_base_role_resource` VALUES ('1', '16');
INSERT INTO `t_base_role_resource` VALUES ('2', '1');
INSERT INTO `t_base_role_resource` VALUES ('2', '5');
INSERT INTO `t_base_role_resource` VALUES ('2', '7');
INSERT INTO `t_base_role_resource` VALUES ('2', '14');

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
INSERT INTO `t_base_user` VALUES ('2', '2013-08-18 14:36:57', 'admin', '0', '2013-08-18 14:37:04', 'admin', '1', '', '', 'eryan', null, '', 'aec60231d83fe6cf81444bc536596887', '2', '');

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
INSERT INTO `t_base_user_role` VALUES ('2', '2');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_bug
-- ----------------------------
INSERT INTO `t_sys_bug` VALUES ('1', '2013-08-17 12:22:29', 'admin', '0', null, null, '0', 'sdsd', 'sd', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_dictionary
-- ----------------------------
INSERT INTO `t_sys_dictionary` VALUES ('9', '2013-08-18 01:54:53', 'admin', '0', null, null, '0', 'domain001_001', '南昌', '1', '', 'domain001', null, 'domain001_001');
INSERT INTO `t_sys_dictionary` VALUES ('10', '2013-08-18 01:55:07', 'admin', '0', null, null, '0', 'domain001_002', '赣州', '2', '', 'domain001', null, 'domain001_002');
INSERT INTO `t_sys_dictionary` VALUES ('11', '2013-08-18 01:55:23', 'admin', '0', null, null, '0', 'domain002_001', '广州', '3', '', 'domain002', null, 'domain002_001');

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_dictionarytype
-- ----------------------------
INSERT INTO `t_sys_dictionarytype` VALUES ('4', '2013-08-18 01:24:20', 'admin', '0', '2013-08-18 12:49:52', 'admin', '2', 'domain', '地区', '1', null, '');
INSERT INTO `t_sys_dictionarytype` VALUES ('6', '2013-08-18 01:53:56', 'admin', '0', '2013-08-18 12:49:56', 'admin', '2', 'domain001', '江西', '2', 'domain', '');
INSERT INTO `t_sys_dictionarytype` VALUES ('7', '2013-08-18 01:54:19', 'admin', '0', null, null, '0', 'domain002', '广东', '3', 'domain', null);
INSERT INTO `t_sys_dictionarytype` VALUES ('8', '2013-08-18 01:55:45', 'admin', '0', null, null, '0', 'hy', '行业', '4', null, null);
INSERT INTO `t_sys_dictionarytype` VALUES ('9', '2013-08-18 02:11:14', 'admin', '0', null, null, '0', 'hy001', 'A行业', '5', 'hy', null);
INSERT INTO `t_sys_dictionarytype` VALUES ('10', '2013-08-18 11:48:36', 'admin', '0', '2013-08-18 11:48:44', 'admin', '1', '13是', '123', '6', 'domain', '');
INSERT INTO `t_sys_dictionarytype` VALUES ('15', '2013-08-18 13:26:20', 'admin', '0', '2013-08-18 13:30:41', 'admin', '1', 'hy23', '123', '7', null, '');
