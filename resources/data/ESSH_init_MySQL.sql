/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50153
Source Host           : localhost:3306
Source Database       : essh

Target Server Type    : MYSQL
Target Server Version : 50153
File Encoding         : 65001

Date: 2013-05-07 13:23:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_base_menu`
-- ----------------------------
DROP TABLE IF EXISTS `t_base_menu`;
CREATE TABLE `t_base_menu` (
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
  `content` longtext,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBDDF03E2F54C321A` (`PARENT_ID`),
  CONSTRAINT `FKBDDF03E2F54C321A` FOREIGN KEY (`PARENT_ID`) REFERENCES `t_base_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_base_menu
-- ----------------------------
INSERT INTO `t_base_menu` VALUES ('1', '2013-03-21 22:42:39', '系统', '0', null, null, '0', 'icon-application', '', '权限管理', '1', '0', '', null, null, null);
INSERT INTO `t_base_menu` VALUES ('2', '2013-03-21 22:33:15', '系统', '0', null, null, '0', 'icon-vcard', '', '菜单管理', '2', '0', '/base/menu.action', '1', null, null);
INSERT INTO `t_base_menu` VALUES ('3', '2013-03-21 22:42:33', '系统', '0', null, null, '0', 'icon-user', '', '用户管理', '3', '0', '/base/user.action', '1', null, null);
INSERT INTO `t_base_menu` VALUES ('4', '2013-03-21 22:33:20', '系统', '0', null, null, '0', 'icon-group', '', '角色管理', '4', '0', '/base/role.action', '1', null, null);
INSERT INTO `t_base_menu` VALUES ('5', '2013-03-21 22:10:03', 'admin', '0', null, null, '0', 'icon-application', '', '系统配置', '5', '0', '', null, null, null);
INSERT INTO `t_base_menu` VALUES ('6', '2013-03-21 22:10:32', 'admin', '0', null, null, '0', 'icon-application', '', '字典类型', '6', '0', '/sys/dictionary-type.action', '5', null, null);
INSERT INTO `t_base_menu` VALUES ('7', '2013-03-21 22:11:13', 'admin', '0', '2013-03-23 16:46:03', 'admin', '2', 'icon-book', '', '数据字典', '7', '0', '/sys/dictionary.action', '5', null, null);
INSERT INTO `t_base_menu` VALUES ('8', '2013-03-27 20:11:03', 'admin', '0', '2013-04-03 07:50:45', 'admin', '1', 'icon-bug', '', 'bug管理', '8', '0', '/sys/bug.action', '5', null, null);

-- ----------------------------
-- Table structure for `t_base_role`
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
INSERT INTO `t_base_role` VALUES ('1', '2013-04-17 09:25:20', 'admin', '0', '2013-04-17 09:24:40', 'admin', '0', '1', '角色');

-- ----------------------------
-- Table structure for `t_base_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `t_base_role_menu`;
CREATE TABLE `t_base_role_menu` (
  `ROLE_ID` bigint(20) NOT NULL,
  `MENU_ID` bigint(20) NOT NULL,
  KEY `FK2A18CAE5B28AED45` (`MENU_ID`),
  KEY `FK2A18CAE5CBF981E5` (`ROLE_ID`),
  CONSTRAINT `FK2A18CAE5B28AED45` FOREIGN KEY (`MENU_ID`) REFERENCES `t_base_menu` (`id`),
  CONSTRAINT `FK2A18CAE5CBF981E5` FOREIGN KEY (`ROLE_ID`) REFERENCES `t_base_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_base_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for `t_base_user`
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_base_user
-- ----------------------------
INSERT INTO `t_base_user` VALUES ('1', null, null, '0', null, null, '0', null, null, 'admin', null, null, '5f4dcc3b5aa765d61d8327deb882cf99', '2', null);

-- ----------------------------
-- Table structure for `t_base_user_role`
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
-- Table structure for `t_sys_bug`
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `t_sys_dictionary`
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `FK79C52CB373CC8B3F` (`DICTIONARYTYPE_CODE`),
  KEY `FK79C52CB3BD49F8CB` (`PARENT_CODE`),
  CONSTRAINT `FK79C52CB373CC8B3F` FOREIGN KEY (`DICTIONARYTYPE_CODE`) REFERENCES `t_sys_dictionarytype` (`code`),
  CONSTRAINT `FK79C52CB3BD49F8CB` FOREIGN KEY (`PARENT_CODE`) REFERENCES `t_sys_dictionary` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_dictionary
-- ----------------------------

-- ----------------------------
-- Table structure for `t_sys_dictionarytype`
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `code_2` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_dictionarytype
-- ----------------------------
