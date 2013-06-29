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

Date: 2013-04-15 13:50:43
*/


-- ----------------------------
-- Table structure for "T_BASE_MENU"
-- ----------------------------
DROP TABLE "T_BASE_MENU";
CREATE TABLE "T_BASE_MENU" (
"ID" NUMBER(19) NOT NULL ,
"CREATE_TIME" TIMESTAMP(6)  NULL ,
"CREATE_USER" VARCHAR2(36 CHAR) NULL ,
"STATUS" NUMBER(10) NULL ,
"UPDATE_TIME" TIMESTAMP(6)  NULL ,
"UPDATE_USER" VARCHAR2(36 CHAR) NULL ,
"VERSION" NUMBER(10) NULL ,
"ICO" VARCHAR2(255 CHAR) NULL ,
"MARK_URL" VARCHAR2(255 CHAR) NULL ,
"NAME" VARCHAR2(20 CHAR) NOT NULL ,
"ORDER_NO" NUMBER(10) NULL ,
"TYPE" NUMBER(10) NULL ,
"URL" VARCHAR2(255 CHAR) NULL ,
"PARENT_ID" NUMBER(19) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of T_BASE_MENU
-- ----------------------------
INSERT INTO "T_BASE_MENU" VALUES ('53', TO_TIMESTAMP(' 2013-03-25 09:00:06:752000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0', null, null, '0', 'icon-folder', null, '字典类型', '6', '0', '/sys/dictionary-type.action', '52');
INSERT INTO "T_BASE_MENU" VALUES ('1', TO_TIMESTAMP(' 2013-03-25 08:54:51:000000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '系统', '0', null, null, '0', 'icon-application', null, '权限管理', '1', '0', null, null);
INSERT INTO "T_BASE_MENU" VALUES ('52', TO_TIMESTAMP(' 2013-03-25 08:59:36:665000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0', null, null, '0', 'icon-application', null, '系统配置', '5', '0', null, null);
INSERT INTO "T_BASE_MENU" VALUES ('2', TO_TIMESTAMP(' 2013-03-25 08:55:19:000000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '系统', '0', TO_TIMESTAMP(' 2013-04-11 11:34:21:873000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '1', 'icon-vcard', null, '菜单管理', '2', '0', '/base/menu.action', '1');
INSERT INTO "T_BASE_MENU" VALUES ('51', TO_TIMESTAMP(' 2013-03-25 08:59:25:390000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0', null, null, '0', 'icon-group', null, '角色管理', '4', '0', '/base/role.action', '1');
INSERT INTO "T_BASE_MENU" VALUES ('50', TO_TIMESTAMP(' 2013-03-25 08:59:06:333000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0', null, null, '0', 'icon-user', null, '用户管理', '3', '0', '/base/user.action', '1');
INSERT INTO "T_BASE_MENU" VALUES ('54', TO_TIMESTAMP(' 2013-03-25 09:00:27:841000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0', TO_TIMESTAMP(' 2013-04-12 16:10:02:451000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '2', 'icon-folder', null, '数据字典', '7', '0', '/sys/dictionary.action', '52');
INSERT INTO "T_BASE_MENU" VALUES ('106', TO_TIMESTAMP(' 2013-03-28 08:56:12:409000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0', TO_TIMESTAMP(' 2013-04-12 16:30:52:888000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '2', 'icon-bug', null, 'bug管理', '8', '0', '/sys/bug.action', '52');

-- ----------------------------
-- Table structure for "T_BASE_ROLE"
-- ----------------------------
DROP TABLE "T_BASE_ROLE";
CREATE TABLE "T_BASE_ROLE" (
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
-- Table structure for "T_BASE_ROLE_MENU"
-- ----------------------------
DROP TABLE "T_BASE_ROLE_MENU";
CREATE TABLE "T_BASE_ROLE_MENU" (
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
-- Table structure for "T_BASE_USER"
-- ----------------------------
DROP TABLE "T_BASE_USER";
CREATE TABLE "T_BASE_USER" (
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
INSERT INTO "T_BASE_USER" VALUES ('1', TO_TIMESTAMP(' 2013-03-25 08:53:46:000000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '系统', '0', TO_TIMESTAMP(' 2013-04-08 14:22:25:920000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '3', null, null, 'admin', null, null, '5f4dcc3b5aa765d61d8327deb882cf99', '1', null);

-- ----------------------------
-- Table structure for "T_BASE_USER_ROLE"
-- ----------------------------
DROP TABLE "T_BASE_USER_ROLE";
CREATE TABLE "T_BASE_USER_ROLE" (
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
-- Table structure for "T_SYS_BUG"
-- ----------------------------
DROP TABLE "T_SYS_BUG";
CREATE TABLE "T_SYS_BUG" (
"ID" NUMBER(19) NOT NULL ,
"CREATE_TIME" TIMESTAMP(6)  NULL ,
"CREATE_USER" VARCHAR2(36 CHAR) NULL ,
"STATUS" NUMBER(10) NULL ,
"UPDATE_TIME" TIMESTAMP(6)  NULL ,
"UPDATE_USER" VARCHAR2(36 CHAR) NULL ,
"VERSION" NUMBER(10) NULL ,
"TITLE" VARCHAR2(255 CHAR) NULL ,
"TYPE" VARCHAR2(36 CHAR) NULL ,
"CONTENT" CLOB NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Table structure for "T_SYS_DICTIONARY"
-- ----------------------------
DROP TABLE "T_SYS_DICTIONARY";
CREATE TABLE "T_SYS_DICTIONARY" (
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

-- ----------------------------
-- Table structure for "T_SYS_DICTIONARYTYPE"
-- ----------------------------
DROP TABLE "T_SYS_DICTIONARYTYPE";
CREATE TABLE "T_SYS_DICTIONARYTYPE" (
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

-- ----------------------------
-- Sequence structure for "ESSH_COMMON_SEQUENCE"
-- ----------------------------
DROP SEQUENCE "ESSH_COMMON_SEQUENCE";
CREATE SEQUENCE "ESSH_COMMON_SEQUENCE"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 999999999999999999999999999
 START WITH 61
 CACHE 20;

-- ----------------------------
-- Sequence structure for "HIBERNATE_SEQUENCE"
-- ----------------------------
DROP SEQUENCE "HIBERNATE_SEQUENCE";
CREATE SEQUENCE "HIBERNATE_SEQUENCE"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 99999999999999999999
 START WITH 41
 CACHE 20;

-- ----------------------------
-- Indexes structure for table T_BASE_MENU
-- ----------------------------

-- ----------------------------
-- Checks structure for table "T_BASE_MENU"
-- ----------------------------
ALTER TABLE "T_BASE_MENU" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "T_BASE_MENU" ADD CHECK ("NAME" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "T_BASE_MENU"
-- ----------------------------
ALTER TABLE "T_BASE_MENU" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table T_BASE_ROLE
-- ----------------------------

-- ----------------------------
-- Checks structure for table "T_BASE_ROLE"
-- ----------------------------
ALTER TABLE "T_BASE_ROLE" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "T_BASE_ROLE"
-- ----------------------------
ALTER TABLE "T_BASE_ROLE" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Checks structure for table "T_BASE_ROLE_MENU"
-- ----------------------------
ALTER TABLE "T_BASE_ROLE_MENU" ADD CHECK ("ROLE_ID" IS NOT NULL);
ALTER TABLE "T_BASE_ROLE_MENU" ADD CHECK ("MENU_ID" IS NOT NULL);

-- ----------------------------
-- Indexes structure for table T_BASE_USER
-- ----------------------------

-- ----------------------------
-- Checks structure for table "T_BASE_USER"
-- ----------------------------
ALTER TABLE "T_BASE_USER" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "T_BASE_USER" ADD CHECK ("LOGINNAME" IS NOT NULL);
ALTER TABLE "T_BASE_USER" ADD CHECK ("PASSWORD" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "T_BASE_USER"
-- ----------------------------
ALTER TABLE "T_BASE_USER" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Checks structure for table "T_BASE_USER_ROLE"
-- ----------------------------
ALTER TABLE "T_BASE_USER_ROLE" ADD CHECK ("USER_ID" IS NOT NULL);
ALTER TABLE "T_BASE_USER_ROLE" ADD CHECK ("ROLE_ID" IS NOT NULL);

-- ----------------------------
-- Indexes structure for table T_SYS_BUG
-- ----------------------------

-- ----------------------------
-- Checks structure for table "T_SYS_BUG"
-- ----------------------------
ALTER TABLE "T_SYS_BUG" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "T_SYS_BUG"
-- ----------------------------
ALTER TABLE "T_SYS_BUG" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table T_SYS_DICTIONARY
-- ----------------------------

-- ----------------------------
-- Uniques structure for table "T_SYS_DICTIONARY"
-- ----------------------------
ALTER TABLE "T_SYS_DICTIONARY" ADD UNIQUE ("CODE");

-- ----------------------------
-- Checks structure for table "T_SYS_DICTIONARY"
-- ----------------------------
ALTER TABLE "T_SYS_DICTIONARY" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "T_SYS_DICTIONARY"
-- ----------------------------
ALTER TABLE "T_SYS_DICTIONARY" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table T_SYS_DICTIONARYTYPE
-- ----------------------------

-- ----------------------------
-- Uniques structure for table "T_SYS_DICTIONARYTYPE"
-- ----------------------------
ALTER TABLE "T_SYS_DICTIONARYTYPE" ADD UNIQUE ("CODE");

-- ----------------------------
-- Checks structure for table "T_SYS_DICTIONARYTYPE"
-- ----------------------------
ALTER TABLE "T_SYS_DICTIONARYTYPE" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "T_SYS_DICTIONARYTYPE"
-- ----------------------------
ALTER TABLE "T_SYS_DICTIONARYTYPE" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Foreign Key structure for table "T_BASE_MENU"
-- ----------------------------
ALTER TABLE "T_BASE_MENU" ADD FOREIGN KEY ("PARENT_ID") REFERENCES "T_BASE_MENU" ("ID");

-- ----------------------------
-- Foreign Key structure for table "T_BASE_ROLE_MENU"
-- ----------------------------
ALTER TABLE "T_BASE_ROLE_MENU" ADD FOREIGN KEY ("MENU_ID") REFERENCES "T_BASE_MENU" ("ID");
ALTER TABLE "T_BASE_ROLE_MENU" ADD FOREIGN KEY ("ROLE_ID") REFERENCES "T_BASE_ROLE" ("ID");

-- ----------------------------
-- Foreign Key structure for table "T_BASE_USER_ROLE"
-- ----------------------------
ALTER TABLE "T_BASE_USER_ROLE" ADD FOREIGN KEY ("USER_ID") REFERENCES "T_BASE_USER" ("ID");
ALTER TABLE "T_BASE_USER_ROLE" ADD FOREIGN KEY ("ROLE_ID") REFERENCES "T_BASE_ROLE" ("ID");

-- ----------------------------
-- Foreign Key structure for table "T_SYS_DICTIONARY"
-- ----------------------------
ALTER TABLE "T_SYS_DICTIONARY" ADD FOREIGN KEY ("DICTIONARYTYPE_CODE") REFERENCES "T_SYS_DICTIONARYTYPE" ("CODE");
ALTER TABLE "T_SYS_DICTIONARY" ADD FOREIGN KEY ("PARENT_CODE") REFERENCES "T_SYS_DICTIONARY" ("CODE");
