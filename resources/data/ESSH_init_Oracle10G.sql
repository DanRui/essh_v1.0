/*
Navicat Oracle Data Transfer
Oracle Client Version : 10.2.0.5.0

Source Server         : 192.168.2.234
Source Server Version : 100200
Source Host           : 192.168.2.234:1521
Source Schema         : ESSH

Target Server Type    : ORACLE
Target Server Version : 100200
File Encoding         : 65001

Date: 2013-08-15 23:47:44
*/


-- ----------------------------
-- Table structure for T_BASE_RESOURCE
-- ----------------------------
DROP TABLE "ESSH"."T_BASE_RESOURCE";
CREATE TABLE "ESSH"."T_BASE_RESOURCE" (
"ID" NUMBER(19) NOT NULL ,
"CREATE_TIME" TIMESTAMP(6)  NULL ,
"CREATE_USER" VARCHAR2(36 CHAR) NULL ,
"STATUS" NUMBER(10) NULL ,
"UPDATE_TIME" TIMESTAMP(6)  NULL ,
"UPDATE_USER" VARCHAR2(36 CHAR) NULL ,
"VERSION" NUMBER(10) NULL ,
"ICO" VARCHAR2(255 CHAR) NULL ,
"MARK_URL" VARCHAR2(2000 CHAR) NULL ,
"NAME" VARCHAR2(36 CHAR) NOT NULL ,
"ORDER_NO" NUMBER(10) NULL ,
"TYPE" NUMBER(10) NULL ,
"URL" VARCHAR2(255 CHAR) NULL ,
"PARENT_ID" NUMBER(19) NULL ,
"CODE" VARCHAR2(36 CHAR) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON COLUMN "ESSH"."T_BASE_RESOURCE"."CODE" IS '资源编码';

-- ----------------------------
-- Records of T_BASE_RESOURCE
-- ----------------------------
INSERT INTO "ESSH"."T_BASE_RESOURCE" VALUES ('1352', TO_TIMESTAMP(' 2013-08-15 23:35:02:964000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0', TO_TIMESTAMP(' 2013-08-15 23:35:45:932000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '2', 'icon-folder', '/sys/dictionary-type*', '字典类型', '6', '0', '/sys/dictionary-type.action', '52', 'sys_dictionaryType');
INSERT INTO "ESSH"."T_BASE_RESOURCE" VALUES ('1', TO_TIMESTAMP(' 2013-03-25 08:54:51:000000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '系统', '0', TO_TIMESTAMP(' 2013-08-15 19:56:59:454000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '15', 'icon-application', null, '权限管理', '1', '0', null, null, null);
INSERT INTO "ESSH"."T_BASE_RESOURCE" VALUES ('52', TO_TIMESTAMP(' 2013-03-25 08:59:36:665000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0', TO_TIMESTAMP(' 2013-08-15 19:57:06:894000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '11', 'icon-application', null, '系统配置', '5', '0', null, null, null);
INSERT INTO "ESSH"."T_BASE_RESOURCE" VALUES ('2', TO_TIMESTAMP(' 2013-03-25 08:55:19:000000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '系统', '0', TO_TIMESTAMP(' 2013-08-15 23:33:03:590000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '16', 'icon-vcard', '/base/resource*', '资源管理', '2', '0', '/base/resource.action', '1', 'base_resource');
INSERT INTO "ESSH"."T_BASE_RESOURCE" VALUES ('51', TO_TIMESTAMP(' 2013-03-25 08:59:25:390000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0', TO_TIMESTAMP(' 2013-08-15 23:33:29:730000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '5', 'icon-group', '/base/role*', '角色管理', '4', '0', '/base/role.action', '1', 'base_group');
INSERT INTO "ESSH"."T_BASE_RESOURCE" VALUES ('50', TO_TIMESTAMP(' 2013-03-25 08:59:06:333000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0', TO_TIMESTAMP(' 2013-08-15 23:33:16:866000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '10', 'icon-user', '/base/user*', '用户管理', '3', '0', '/base/user.action', '1', 'base_user');
INSERT INTO "ESSH"."T_BASE_RESOURCE" VALUES ('54', TO_TIMESTAMP(' 2013-03-25 09:00:27:841000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0', TO_TIMESTAMP(' 2013-08-15 23:35:52:455000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '7', 'icon-folder', '/sys/dictionary*', '数据字典', '7', '0', '/sys/dictionary.action', '52', 'sys_dictionary');
INSERT INTO "ESSH"."T_BASE_RESOURCE" VALUES ('106', TO_TIMESTAMP(' 2013-03-28 08:56:12:409000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0', TO_TIMESTAMP(' 2013-08-15 23:35:57:906000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '14', 'icon-bug', '/sys/bug*', 'bug管理', '8', '0', '/sys/bug.action', '52', 'sys_bug');

-- ----------------------------
-- Table structure for T_BASE_ROLE
-- ----------------------------
DROP TABLE "ESSH"."T_BASE_ROLE";
CREATE TABLE "ESSH"."T_BASE_ROLE" (
"ID" NUMBER(19) NOT NULL ,
"CREATE_TIME" TIMESTAMP(6)  NULL ,
"CREATE_USER" VARCHAR2(36 CHAR) NULL ,
"STATUS" NUMBER(10) NULL ,
"UPDATE_TIME" TIMESTAMP(6)  NULL ,
"UPDATE_USER" VARCHAR2(36 CHAR) NULL ,
"VERSION" NUMBER(10) NULL ,
"DESCRIPTION" VARCHAR2(255 CHAR) NULL ,
"NAME" VARCHAR2(100 CHAR) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of T_BASE_ROLE
-- ----------------------------

-- ----------------------------
-- Table structure for T_BASE_ROLE_MENU
-- ----------------------------
DROP TABLE "ESSH"."T_BASE_ROLE_MENU";
CREATE TABLE "ESSH"."T_BASE_ROLE_MENU" (
"ROLE_ID" NUMBER(19) NOT NULL ,
"MENU_ID" NUMBER(19) NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of T_BASE_ROLE_MENU
-- ----------------------------

-- ----------------------------
-- Table structure for T_BASE_USER
-- ----------------------------
DROP TABLE "ESSH"."T_BASE_USER";
CREATE TABLE "ESSH"."T_BASE_USER" (
"ID" NUMBER(19) NOT NULL ,
"CREATE_TIME" TIMESTAMP(6)  NULL ,
"CREATE_USER" VARCHAR2(36 CHAR) NULL ,
"STATUS" NUMBER(10) NULL ,
"UPDATE_TIME" TIMESTAMP(6)  NULL ,
"UPDATE_USER" VARCHAR2(36 CHAR) NULL ,
"VERSION" NUMBER(10) NULL ,
"ADDRESS" VARCHAR2(255 CHAR) NULL ,
"EMAIL" VARCHAR2(255 CHAR) NULL ,
"LOGINNAME" VARCHAR2(32 CHAR) NOT NULL ,
"MOBILEPHONE" VARCHAR2(255 CHAR) NULL ,
"NAME" VARCHAR2(32 CHAR) NULL ,
"PASSWORD" VARCHAR2(64 CHAR) NOT NULL ,
"SEX" NUMBER(10) NULL ,
"TEL" VARCHAR2(255 CHAR) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of T_BASE_USER
-- ----------------------------
INSERT INTO "ESSH"."T_BASE_USER" VALUES ('1', TO_TIMESTAMP(' 2013-03-25 08:53:46:000000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '系统', '0', TO_TIMESTAMP(' 2013-07-16 14:43:17:621000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '9', null, null, 'admin', null, null, '5f4dcc3b5aa765d61d8327deb882cf99', '1', null);

-- ----------------------------
-- Table structure for T_BASE_USER_ROLE
-- ----------------------------
DROP TABLE "ESSH"."T_BASE_USER_ROLE";
CREATE TABLE "ESSH"."T_BASE_USER_ROLE" (
"USER_ID" NUMBER(19) NOT NULL ,
"ROLE_ID" NUMBER(19) NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of T_BASE_USER_ROLE
-- ----------------------------

-- ----------------------------
-- Table structure for T_SYS_BUG
-- ----------------------------
DROP TABLE "ESSH"."T_SYS_BUG";
CREATE TABLE "ESSH"."T_SYS_BUG" (
"ID" NUMBER(19) NOT NULL ,
"CREATE_TIME" TIMESTAMP(6)  NULL ,
"CREATE_USER" VARCHAR2(36 CHAR) NULL ,
"STATUS" NUMBER(10) NULL ,
"UPDATE_TIME" TIMESTAMP(6)  NULL ,
"UPDATE_USER" VARCHAR2(36 CHAR) NULL ,
"VERSION" NUMBER(10) NULL ,
"TITLE" VARCHAR2(255 CHAR) NULL ,
"CONTENT" CLOB NULL ,
"TYPE" VARCHAR2(36 CHAR) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Table structure for T_SYS_DICTIONARY
-- ----------------------------
DROP TABLE "ESSH"."T_SYS_DICTIONARY";
CREATE TABLE "ESSH"."T_SYS_DICTIONARY" (
"ID" NUMBER(19) NOT NULL ,
"CREATE_TIME" TIMESTAMP(6)  NULL ,
"CREATE_USER" VARCHAR2(36 CHAR) NULL ,
"STATUS" NUMBER(10) NULL ,
"UPDATE_TIME" TIMESTAMP(6)  NULL ,
"UPDATE_USER" VARCHAR2(36 CHAR) NULL ,
"VERSION" NUMBER(10) NULL ,
"CODE" VARCHAR2(36 CHAR) NULL ,
"NAME" VARCHAR2(100 CHAR) NULL ,
"ORDER_NO" NUMBER(10) NULL ,
"REMARK" VARCHAR2(255 CHAR) NULL ,
"DICTIONARYTYPE_CODE" VARCHAR2(12 CHAR) NULL ,
"PARENT_CODE" VARCHAR2(36 CHAR) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of T_SYS_DICTIONARY
-- ----------------------------
INSERT INTO "ESSH"."T_SYS_DICTIONARY" VALUES ('178', TO_TIMESTAMP(' 2013-05-12 21:59:48:953000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0', null, null, '0', 'user001', '系统管理员', '7', null, 'user', null);
INSERT INTO "ESSH"."T_SYS_DICTIONARY" VALUES ('701', TO_TIMESTAMP(' 2013-06-07 12:56:04:661000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0', TO_TIMESTAMP(' 2013-08-07 11:29:01:965000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '1', 'bug001', '功能性问题', '8', null, 'bug', null);
INSERT INTO "ESSH"."T_SYS_DICTIONARY" VALUES ('967', TO_TIMESTAMP(' 2013-07-04 19:18:23:431000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0', TO_TIMESTAMP(' 2013-08-08 08:25:21:481000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '1', 'bug002', '新闻', '9', null, 'bug', null);
INSERT INTO "ESSH"."T_SYS_DICTIONARY" VALUES ('1232', TO_TIMESTAMP(' 2013-08-05 15:11:06:746000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0', TO_TIMESTAMP(' 2013-08-08 08:25:44:731000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '1', 'user002', '管理员', '10', null, 'user', 'user001');
INSERT INTO "ESSH"."T_SYS_DICTIONARY" VALUES ('149', TO_TIMESTAMP(' 2013-05-06 20:00:17:213000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0', TO_TIMESTAMP(' 2013-08-14 21:57:20:156000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '4', 'org001', '省中心', '1', 'test', 'org', null);
INSERT INTO "ESSH"."T_SYS_DICTIONARY" VALUES ('150', TO_TIMESTAMP(' 2013-05-06 20:00:36:369000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0', null, null, '0', 'org001001', '市中心', '2', null, 'org', 'org001');

-- ----------------------------
-- Table structure for T_SYS_DICTIONARYTYPE
-- ----------------------------
DROP TABLE "ESSH"."T_SYS_DICTIONARYTYPE";
CREATE TABLE "ESSH"."T_SYS_DICTIONARYTYPE" (
"ID" NUMBER(19) NOT NULL ,
"CREATE_TIME" TIMESTAMP(6)  NULL ,
"CREATE_USER" VARCHAR2(36 CHAR) NULL ,
"STATUS" NUMBER(10) NULL ,
"UPDATE_TIME" TIMESTAMP(6)  NULL ,
"UPDATE_USER" VARCHAR2(36 CHAR) NULL ,
"VERSION" NUMBER(10) NULL ,
"CODE" VARCHAR2(12 CHAR) NULL ,
"NAME" VARCHAR2(100 CHAR) NULL ,
"ORDER_NO" NUMBER(10) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of T_SYS_DICTIONARYTYPE
-- ----------------------------
INSERT INTO "ESSH"."T_SYS_DICTIONARYTYPE" VALUES ('177', TO_TIMESTAMP(' 2013-05-12 21:59:26:578000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0', null, null, '0', 'user', '用户类型', '2');
INSERT INTO "ESSH"."T_SYS_DICTIONARYTYPE" VALUES ('242', TO_TIMESTAMP(' 2013-06-03 08:28:17:807000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0', null, null, '0', 'bug', 'Bug缺陷', '3');
INSERT INTO "ESSH"."T_SYS_DICTIONARYTYPE" VALUES ('148', TO_TIMESTAMP(' 2013-05-06 19:59:58:728000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0', null, null, '0', 'org', '组织机构', '1');

-- ----------------------------
-- Sequence structure for ESSH_COMMON_SEQUENCE
-- ----------------------------
DROP SEQUENCE "ESSH"."ESSH_COMMON_SEQUENCE";
CREATE SEQUENCE "ESSH"."ESSH_COMMON_SEQUENCE"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 999999999999999999999999999
 START WITH 61
 CACHE 20;

-- ----------------------------
-- Sequence structure for HIBERNATE_SEQUENCE
-- ----------------------------
DROP SEQUENCE "ESSH"."HIBERNATE_SEQUENCE";
CREATE SEQUENCE "ESSH"."HIBERNATE_SEQUENCE"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 99999999999999999999
 START WITH 1370
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_GROUP
-- ----------------------------
DROP SEQUENCE "ESSH"."SEQUENCE_GROUP";
CREATE SEQUENCE "ESSH"."SEQUENCE_GROUP"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 999999999999999999999999999
 START WITH 21
 CACHE 20;

-- ----------------------------
-- Indexes structure for table T_BASE_RESOURCE
-- ----------------------------

-- ----------------------------
-- Checks structure for table T_BASE_RESOURCE
-- ----------------------------
ALTER TABLE "ESSH"."T_BASE_RESOURCE" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "ESSH"."T_BASE_RESOURCE" ADD CHECK ("NAME" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_BASE_RESOURCE
-- ----------------------------
ALTER TABLE "ESSH"."T_BASE_RESOURCE" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table T_BASE_ROLE
-- ----------------------------

-- ----------------------------
-- Checks structure for table T_BASE_ROLE
-- ----------------------------
ALTER TABLE "ESSH"."T_BASE_ROLE" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_BASE_ROLE
-- ----------------------------
ALTER TABLE "ESSH"."T_BASE_ROLE" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Checks structure for table T_BASE_ROLE_MENU
-- ----------------------------
ALTER TABLE "ESSH"."T_BASE_ROLE_MENU" ADD CHECK ("ROLE_ID" IS NOT NULL);
ALTER TABLE "ESSH"."T_BASE_ROLE_MENU" ADD CHECK ("MENU_ID" IS NOT NULL);

-- ----------------------------
-- Indexes structure for table T_BASE_USER
-- ----------------------------

-- ----------------------------
-- Checks structure for table T_BASE_USER
-- ----------------------------
ALTER TABLE "ESSH"."T_BASE_USER" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "ESSH"."T_BASE_USER" ADD CHECK ("LOGINNAME" IS NOT NULL);
ALTER TABLE "ESSH"."T_BASE_USER" ADD CHECK ("PASSWORD" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_BASE_USER
-- ----------------------------
ALTER TABLE "ESSH"."T_BASE_USER" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Checks structure for table T_BASE_USER_ROLE
-- ----------------------------
ALTER TABLE "ESSH"."T_BASE_USER_ROLE" ADD CHECK ("USER_ID" IS NOT NULL);
ALTER TABLE "ESSH"."T_BASE_USER_ROLE" ADD CHECK ("ROLE_ID" IS NOT NULL);

-- ----------------------------
-- Indexes structure for table T_SYS_BUG
-- ----------------------------

-- ----------------------------
-- Checks structure for table T_SYS_BUG
-- ----------------------------
ALTER TABLE "ESSH"."T_SYS_BUG" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_SYS_BUG
-- ----------------------------
ALTER TABLE "ESSH"."T_SYS_BUG" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table T_SYS_DICTIONARY
-- ----------------------------

-- ----------------------------
-- Uniques structure for table T_SYS_DICTIONARY
-- ----------------------------
ALTER TABLE "ESSH"."T_SYS_DICTIONARY" ADD UNIQUE ("CODE");

-- ----------------------------
-- Checks structure for table T_SYS_DICTIONARY
-- ----------------------------
ALTER TABLE "ESSH"."T_SYS_DICTIONARY" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_SYS_DICTIONARY
-- ----------------------------
ALTER TABLE "ESSH"."T_SYS_DICTIONARY" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table T_SYS_DICTIONARYTYPE
-- ----------------------------

-- ----------------------------
-- Uniques structure for table T_SYS_DICTIONARYTYPE
-- ----------------------------
ALTER TABLE "ESSH"."T_SYS_DICTIONARYTYPE" ADD UNIQUE ("CODE");

-- ----------------------------
-- Checks structure for table T_SYS_DICTIONARYTYPE
-- ----------------------------
ALTER TABLE "ESSH"."T_SYS_DICTIONARYTYPE" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_SYS_DICTIONARYTYPE
-- ----------------------------
ALTER TABLE "ESSH"."T_SYS_DICTIONARYTYPE" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Foreign Key structure for table "ESSH"."T_BASE_RESOURCE"
-- ----------------------------
ALTER TABLE "ESSH"."T_BASE_RESOURCE" ADD FOREIGN KEY ("PARENT_ID") REFERENCES "ESSH"."T_BASE_RESOURCE" ("ID");

-- ----------------------------
-- Foreign Key structure for table "ESSH"."T_BASE_ROLE_MENU"
-- ----------------------------
ALTER TABLE "ESSH"."T_BASE_ROLE_MENU" ADD FOREIGN KEY ("MENU_ID") REFERENCES "ESSH"."T_BASE_RESOURCE" ("ID");
ALTER TABLE "ESSH"."T_BASE_ROLE_MENU" ADD FOREIGN KEY ("ROLE_ID") REFERENCES "ESSH"."T_BASE_ROLE" ("ID");

-- ----------------------------
-- Foreign Key structure for table "ESSH"."T_BASE_USER_ROLE"
-- ----------------------------
ALTER TABLE "ESSH"."T_BASE_USER_ROLE" ADD FOREIGN KEY ("USER_ID") REFERENCES "ESSH"."T_BASE_USER" ("ID");
ALTER TABLE "ESSH"."T_BASE_USER_ROLE" ADD FOREIGN KEY ("ROLE_ID") REFERENCES "ESSH"."T_BASE_ROLE" ("ID");

-- ----------------------------
-- Foreign Key structure for table "ESSH"."T_SYS_DICTIONARY"
-- ----------------------------
ALTER TABLE "ESSH"."T_SYS_DICTIONARY" ADD FOREIGN KEY ("DICTIONARYTYPE_CODE") REFERENCES "ESSH"."T_SYS_DICTIONARYTYPE" ("CODE");
ALTER TABLE "ESSH"."T_SYS_DICTIONARY" ADD FOREIGN KEY ("PARENT_CODE") REFERENCES "ESSH"."T_SYS_DICTIONARY" ("CODE");
