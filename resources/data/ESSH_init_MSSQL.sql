/*
Navicat SQL Server Data Transfer

Source Server         : 192.168.30.3_MSSQL
Source Server Version : 90000
Source Host           : 192.168.30.3:1433
Source Database       : essh
Source Schema         : dbo

Target Server Type    : SQL Server
Target Server Version : 90000
File Encoding         : 65001

Date: 2013-11-16 14:45:55
*/


-- ----------------------------
-- Table structure for T_BASE_ORGAN
-- ----------------------------
DROP TABLE [dbo].[T_BASE_ORGAN]
GO
CREATE TABLE [dbo].[T_BASE_ORGAN] (
[ID] numeric(19) NOT NULL IDENTITY(1,1) ,
[CREATE_TIME] datetime NULL ,
[CREATE_USER] varchar(36) NULL ,
[STATUS] int NULL ,
[UPDATE_TIME] datetime NULL ,
[UPDATE_USER] varchar(36) NULL ,
[VERSION] int NULL ,
[ADDRESS] varchar(255) NULL ,
[CODE] varchar(36) NULL ,
[FAX] varchar(64) NULL ,
[MANAGER_USER_ID] numeric(19) NULL ,
[NAME] varchar(255) NOT NULL ,
[ORDER_NO] int NULL ,
[PHONE] varchar(64) NULL ,
[SYS_CODE] varchar(36) NULL ,
[TYPE] int NULL ,
[PARENT_ID] numeric(19) NULL
)


GO

-- ----------------------------
-- Records of T_BASE_ORGAN
-- ----------------------------
SET IDENTITY_INSERT [dbo].[T_BASE_ORGAN] ON
GO
SET IDENTITY_INSERT [dbo].[T_BASE_ORGAN] OFF
GO

-- ----------------------------
-- Table structure for T_BASE_RESOURCE
-- ----------------------------
DROP TABLE [dbo].[T_BASE_RESOURCE]
GO
CREATE TABLE [dbo].[T_BASE_RESOURCE] (
[ID] numeric(19) NOT NULL IDENTITY(1,1) ,
[CREATE_TIME] datetime NULL ,
[CREATE_USER] varchar(36) NULL ,
[STATUS] int NULL ,
[UPDATE_TIME] datetime NULL ,
[UPDATE_USER] varchar(36) NULL ,
[VERSION] int NULL ,
[CODE] varchar(36) NULL ,
[ICON] varchar(255) NULL ,
[ICON_CLS] varchar(255) NULL ,
[MARK_URL] varchar(2000) NULL ,
[NAME] varchar(20) NOT NULL ,
[ORDER_NO] int NULL ,
[TYPE] int NULL ,
[URL] varchar(255) NULL ,
[PARENT_ID] numeric(19) NULL
)


GO
DBCC CHECKIDENT(N'[dbo].[T_BASE_RESOURCE]', RESEED, 9)
GO

-- ----------------------------
-- Records of T_BASE_RESOURCE
-- ----------------------------
SET IDENTITY_INSERT [dbo].[T_BASE_RESOURCE] ON
GO
INSERT INTO [dbo].[T_BASE_RESOURCE] ([ID], [CREATE_TIME], [CREATE_USER], [STATUS], [UPDATE_TIME], [UPDATE_USER], [VERSION], [CODE], [ICON], [ICON_CLS], [MARK_URL], [NAME], [ORDER_NO], [TYPE], [URL], [PARENT_ID]) VALUES (N'1', null, null, N'0', N'2013-11-16 14:41:25.663', N'admin', N'2', N'', null, N'icon-application', N'', N'权限管理', N'1', N'0', N'', null)
GO
GO
INSERT INTO [dbo].[T_BASE_RESOURCE] ([ID], [CREATE_TIME], [CREATE_USER], [STATUS], [UPDATE_TIME], [UPDATE_USER], [VERSION], [CODE], [ICON], [ICON_CLS], [MARK_URL], [NAME], [ORDER_NO], [TYPE], [URL], [PARENT_ID]) VALUES (N'2', null, null, N'0', N'2013-11-16 14:44:37.540', N'admin', N'3', N'', null, N'icon-folder', N'/base/resource*', N'资源管理', N'2', N'0', N'/base/resource.action', N'1')
GO
GO
INSERT INTO [dbo].[T_BASE_RESOURCE] ([ID], [CREATE_TIME], [CREATE_USER], [STATUS], [UPDATE_TIME], [UPDATE_USER], [VERSION], [CODE], [ICON], [ICON_CLS], [MARK_URL], [NAME], [ORDER_NO], [TYPE], [URL], [PARENT_ID]) VALUES (N'3', N'2013-11-16 14:41:20.413', N'admin', N'0', N'2013-11-16 14:44:28.617', N'admin', N'2', N'', null, N'icon-group', N'/base/role*', N'角色管理', N'3', N'0', N'/base/role.action', N'1')
GO
GO
INSERT INTO [dbo].[T_BASE_RESOURCE] ([ID], [CREATE_TIME], [CREATE_USER], [STATUS], [UPDATE_TIME], [UPDATE_USER], [VERSION], [CODE], [ICON], [ICON_CLS], [MARK_URL], [NAME], [ORDER_NO], [TYPE], [URL], [PARENT_ID]) VALUES (N'4', N'2013-11-16 14:41:58.950', N'admin', N'0', N'2013-11-16 14:44:15.870', N'admin', N'1', N'', null, N'icon-group', N'/base/organ*', N'机构管理', N'4', N'0', N'/base/organ.action', N'1')
GO
GO
INSERT INTO [dbo].[T_BASE_RESOURCE] ([ID], [CREATE_TIME], [CREATE_USER], [STATUS], [UPDATE_TIME], [UPDATE_USER], [VERSION], [CODE], [ICON], [ICON_CLS], [MARK_URL], [NAME], [ORDER_NO], [TYPE], [URL], [PARENT_ID]) VALUES (N'5', N'2013-11-16 14:42:18.750', N'admin', N'0', N'2013-11-16 14:43:25.193', N'admin', N'1', N'', null, N'icon-user', N'/base/user*', N'用户管理', N'5', N'0', N'/base/user.action', N'1')
GO
GO
INSERT INTO [dbo].[T_BASE_RESOURCE] ([ID], [CREATE_TIME], [CREATE_USER], [STATUS], [UPDATE_TIME], [UPDATE_USER], [VERSION], [CODE], [ICON], [ICON_CLS], [MARK_URL], [NAME], [ORDER_NO], [TYPE], [URL], [PARENT_ID]) VALUES (N'6', N'2013-11-16 14:42:34.367', N'admin', N'0', null, null, N'0', N'', null, N'icon-application', N'', N'系统配置', N'6', N'0', N'', null)
GO
GO
INSERT INTO [dbo].[T_BASE_RESOURCE] ([ID], [CREATE_TIME], [CREATE_USER], [STATUS], [UPDATE_TIME], [UPDATE_USER], [VERSION], [CODE], [ICON], [ICON_CLS], [MARK_URL], [NAME], [ORDER_NO], [TYPE], [URL], [PARENT_ID]) VALUES (N'7', N'2013-11-16 14:43:01.670', N'admin', N'0', N'2013-11-16 14:45:18.717', N'admin', N'2', N'', null, N'icon-vcard', N'/sys/dictionary-type*', N'字典类型', N'7', N'0', N'/sys/dictionary-type.action', N'6')
GO
GO
INSERT INTO [dbo].[T_BASE_RESOURCE] ([ID], [CREATE_TIME], [CREATE_USER], [STATUS], [UPDATE_TIME], [UPDATE_USER], [VERSION], [CODE], [ICON], [ICON_CLS], [MARK_URL], [NAME], [ORDER_NO], [TYPE], [URL], [PARENT_ID]) VALUES (N'8', N'2013-11-16 14:43:49.810', N'admin', N'0', N'2013-11-16 14:45:09.203', N'admin', N'1', N'', null, N'icon-book', N'/sys/dictionary*', N'数据字典', N'8', N'0', N'/sys/dictionary.action', N'6')
GO
GO
INSERT INTO [dbo].[T_BASE_RESOURCE] ([ID], [CREATE_TIME], [CREATE_USER], [STATUS], [UPDATE_TIME], [UPDATE_USER], [VERSION], [CODE], [ICON], [ICON_CLS], [MARK_URL], [NAME], [ORDER_NO], [TYPE], [URL], [PARENT_ID]) VALUES (N'9', N'2013-11-16 14:44:08.693', N'admin', N'0', null, null, N'0', N'', null, N'icon-bug', N'/sys/bug*', N'bug管理', N'9', N'0', N'/sys/bug.action', N'6')
GO
GO
SET IDENTITY_INSERT [dbo].[T_BASE_RESOURCE] OFF
GO

-- ----------------------------
-- Table structure for T_BASE_ROLE
-- ----------------------------
DROP TABLE [dbo].[T_BASE_ROLE]
GO
CREATE TABLE [dbo].[T_BASE_ROLE] (
[ID] numeric(19) NOT NULL IDENTITY(1,1) ,
[CREATE_TIME] datetime NULL ,
[CREATE_USER] varchar(36) NULL ,
[STATUS] int NULL ,
[UPDATE_TIME] datetime NULL ,
[UPDATE_USER] varchar(36) NULL ,
[VERSION] int NULL ,
[CODE] varchar(36) NULL ,
[NAME] varchar(100) NOT NULL ,
[REMARK] varchar(255) NULL
)


GO

-- ----------------------------
-- Records of T_BASE_ROLE
-- ----------------------------
SET IDENTITY_INSERT [dbo].[T_BASE_ROLE] ON
GO
SET IDENTITY_INSERT [dbo].[T_BASE_ROLE] OFF
GO

-- ----------------------------
-- Table structure for T_BASE_ROLE_RESOURCE
-- ----------------------------
DROP TABLE [dbo].[T_BASE_ROLE_RESOURCE]
GO
CREATE TABLE [dbo].[T_BASE_ROLE_RESOURCE] (
[ROLE_ID] numeric(19) NOT NULL ,
[RESOURCE_ID] numeric(19) NOT NULL
)


GO

-- ----------------------------
-- Records of T_BASE_ROLE_RESOURCE
-- ----------------------------

-- ----------------------------
-- Table structure for T_BASE_USER
-- ----------------------------
DROP TABLE [dbo].[T_BASE_USER]
GO
CREATE TABLE [dbo].[T_BASE_USER] (
[ID] numeric(19) NOT NULL IDENTITY(1,1) ,
[CREATE_TIME] datetime NULL ,
[CREATE_USER] varchar(36) NULL ,
[STATUS] int NULL ,
[UPDATE_TIME] datetime NULL ,
[UPDATE_USER] varchar(36) NULL ,
[VERSION] int NULL ,
[ADDRESS] varchar(255) NULL ,
[EMAIL] varchar(64) NULL ,
[LOGIN_NAME] varchar(36) NOT NULL ,
[MOBILEPHONE] varchar(36) NULL ,
[NAME] varchar(36) NULL ,
[PASSWORD] varchar(64) NOT NULL ,
[SEX] int NULL ,
[TEL] varchar(36) NULL ,
[DEFAULT_ORGANID] numeric(19) NULL
)


GO

-- ----------------------------
-- Records of T_BASE_USER
-- ----------------------------
SET IDENTITY_INSERT [dbo].[T_BASE_USER] ON
GO
INSERT INTO [dbo].[T_BASE_USER] ([ID], [CREATE_TIME], [CREATE_USER], [STATUS], [UPDATE_TIME], [UPDATE_USER], [VERSION], [ADDRESS], [EMAIL], [LOGIN_NAME], [MOBILEPHONE], [NAME], [PASSWORD], [SEX], [TEL], [DEFAULT_ORGANID]) VALUES (N'1', null, null, N'0', null, null, N'0', null, null, N'admin', null, null, N'5f4dcc3b5aa765d61d8327deb882cf99', null, null, null)
GO
GO
SET IDENTITY_INSERT [dbo].[T_BASE_USER] OFF
GO

-- ----------------------------
-- Table structure for T_BASE_USER_ORGAN
-- ----------------------------
DROP TABLE [dbo].[T_BASE_USER_ORGAN]
GO
CREATE TABLE [dbo].[T_BASE_USER_ORGAN] (
[USER_ID] numeric(19) NOT NULL ,
[ORGAN_ID] numeric(19) NOT NULL
)


GO

-- ----------------------------
-- Records of T_BASE_USER_ORGAN
-- ----------------------------

-- ----------------------------
-- Table structure for T_BASE_USER_RESOURCE
-- ----------------------------
DROP TABLE [dbo].[T_BASE_USER_RESOURCE]
GO
CREATE TABLE [dbo].[T_BASE_USER_RESOURCE] (
[USER_ID] numeric(19) NOT NULL ,
[RESOURCE_ID] numeric(19) NOT NULL
)


GO

-- ----------------------------
-- Records of T_BASE_USER_RESOURCE
-- ----------------------------

-- ----------------------------
-- Table structure for T_BASE_USER_ROLE
-- ----------------------------
DROP TABLE [dbo].[T_BASE_USER_ROLE]
GO
CREATE TABLE [dbo].[T_BASE_USER_ROLE] (
[USER_ID] numeric(19) NOT NULL ,
[ROLE_ID] numeric(19) NOT NULL
)


GO

-- ----------------------------
-- Records of T_BASE_USER_ROLE
-- ----------------------------

-- ----------------------------
-- Table structure for T_SYS_BUG
-- ----------------------------
DROP TABLE [dbo].[T_SYS_BUG]
GO
CREATE TABLE [dbo].[T_SYS_BUG] (
[ID] numeric(19) NOT NULL IDENTITY(1,1) ,
[CREATE_TIME] datetime NULL ,
[CREATE_USER] varchar(36) NULL ,
[STATUS] int NULL ,
[UPDATE_TIME] datetime NULL ,
[UPDATE_USER] varchar(36) NULL ,
[VERSION] int NULL ,
[CONTENT] text NULL ,
[TITLE] varchar(255) NULL ,
[TYPE] varchar(36) NULL
)


GO

-- ----------------------------
-- Records of T_SYS_BUG
-- ----------------------------
SET IDENTITY_INSERT [dbo].[T_SYS_BUG] ON
GO
SET IDENTITY_INSERT [dbo].[T_SYS_BUG] OFF
GO

-- ----------------------------
-- Table structure for T_SYS_DICTIONARY
-- ----------------------------
DROP TABLE [dbo].[T_SYS_DICTIONARY]
GO
CREATE TABLE [dbo].[T_SYS_DICTIONARY] (
[ID] numeric(19) NOT NULL IDENTITY(1,1) ,
[CREATE_TIME] datetime NULL ,
[CREATE_USER] varchar(36) NULL ,
[STATUS] int NULL ,
[UPDATE_TIME] datetime NULL ,
[UPDATE_USER] varchar(36) NULL ,
[VERSION] int NULL ,
[CODE] varchar(36) NULL ,
[NAME] varchar(100) NULL ,
[ORDER_NO] int NULL ,
[REMAK] varchar(100) NULL ,
[VALUE] varchar(100) NULL ,
[DICTIONARYTYPE_CODE] varchar(20) NULL ,
[PARENT_CODE] varchar(36) NULL
)


GO

-- ----------------------------
-- Records of T_SYS_DICTIONARY
-- ----------------------------
SET IDENTITY_INSERT [dbo].[T_SYS_DICTIONARY] ON
GO
SET IDENTITY_INSERT [dbo].[T_SYS_DICTIONARY] OFF
GO

-- ----------------------------
-- Table structure for T_SYS_DICTIONARYTYPE
-- ----------------------------
DROP TABLE [dbo].[T_SYS_DICTIONARYTYPE]
GO
CREATE TABLE [dbo].[T_SYS_DICTIONARYTYPE] (
[ID] numeric(19) NOT NULL IDENTITY(1,1) ,
[CREATE_TIME] datetime NULL ,
[CREATE_USER] varchar(36) NULL ,
[STATUS] int NULL ,
[UPDATE_TIME] datetime NULL ,
[UPDATE_USER] varchar(36) NULL ,
[VERSION] int NULL ,
[CODE] varchar(20) NULL ,
[NAME] varchar(100) NULL ,
[ORDER_NO] int NULL ,
[REMARK] varchar(255) NULL ,
[GROUP_CODE] varchar(20) NULL
)


GO

-- ----------------------------
-- Records of T_SYS_DICTIONARYTYPE
-- ----------------------------
SET IDENTITY_INSERT [dbo].[T_SYS_DICTIONARYTYPE] ON
GO
SET IDENTITY_INSERT [dbo].[T_SYS_DICTIONARYTYPE] OFF
GO

-- ----------------------------
-- Indexes structure for table T_BASE_ORGAN
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table T_BASE_ORGAN
-- ----------------------------
ALTER TABLE [dbo].[T_BASE_ORGAN] ADD PRIMARY KEY ([ID])
GO

-- ----------------------------
-- Uniques structure for table T_BASE_ORGAN
-- ----------------------------
ALTER TABLE [dbo].[T_BASE_ORGAN] ADD UNIQUE ([NAME] ASC)
GO

-- ----------------------------
-- Indexes structure for table T_BASE_RESOURCE
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table T_BASE_RESOURCE
-- ----------------------------
ALTER TABLE [dbo].[T_BASE_RESOURCE] ADD PRIMARY KEY ([ID])
GO

-- ----------------------------
-- Uniques structure for table T_BASE_RESOURCE
-- ----------------------------
ALTER TABLE [dbo].[T_BASE_RESOURCE] ADD UNIQUE ([NAME] ASC)
GO

-- ----------------------------
-- Indexes structure for table T_BASE_ROLE
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table T_BASE_ROLE
-- ----------------------------
ALTER TABLE [dbo].[T_BASE_ROLE] ADD PRIMARY KEY ([ID])
GO

-- ----------------------------
-- Uniques structure for table T_BASE_ROLE
-- ----------------------------
ALTER TABLE [dbo].[T_BASE_ROLE] ADD UNIQUE ([NAME] ASC)
GO

-- ----------------------------
-- Indexes structure for table T_BASE_USER
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table T_BASE_USER
-- ----------------------------
ALTER TABLE [dbo].[T_BASE_USER] ADD PRIMARY KEY ([ID])
GO

-- ----------------------------
-- Uniques structure for table T_BASE_USER
-- ----------------------------
ALTER TABLE [dbo].[T_BASE_USER] ADD UNIQUE ([LOGIN_NAME] ASC)
GO

-- ----------------------------
-- Indexes structure for table T_SYS_BUG
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table T_SYS_BUG
-- ----------------------------
ALTER TABLE [dbo].[T_SYS_BUG] ADD PRIMARY KEY ([ID])
GO

-- ----------------------------
-- Indexes structure for table T_SYS_DICTIONARY
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table T_SYS_DICTIONARY
-- ----------------------------
ALTER TABLE [dbo].[T_SYS_DICTIONARY] ADD PRIMARY KEY ([ID])
GO

-- ----------------------------
-- Uniques structure for table T_SYS_DICTIONARY
-- ----------------------------
ALTER TABLE [dbo].[T_SYS_DICTIONARY] ADD UNIQUE ([CODE] ASC)
GO
ALTER TABLE [dbo].[T_SYS_DICTIONARY] ADD UNIQUE ([NAME] ASC)
GO
ALTER TABLE [dbo].[T_SYS_DICTIONARY] ADD UNIQUE ([CODE] ASC)
GO

-- ----------------------------
-- Indexes structure for table T_SYS_DICTIONARYTYPE
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table T_SYS_DICTIONARYTYPE
-- ----------------------------
ALTER TABLE [dbo].[T_SYS_DICTIONARYTYPE] ADD PRIMARY KEY ([ID])
GO

-- ----------------------------
-- Uniques structure for table T_SYS_DICTIONARYTYPE
-- ----------------------------
ALTER TABLE [dbo].[T_SYS_DICTIONARYTYPE] ADD UNIQUE ([CODE] ASC)
GO
ALTER TABLE [dbo].[T_SYS_DICTIONARYTYPE] ADD UNIQUE ([NAME] ASC)
GO
ALTER TABLE [dbo].[T_SYS_DICTIONARYTYPE] ADD UNIQUE ([CODE] ASC)
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[T_BASE_ORGAN]
-- ----------------------------
ALTER TABLE [dbo].[T_BASE_ORGAN] ADD FOREIGN KEY ([PARENT_ID]) REFERENCES [dbo].[T_BASE_ORGAN] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[T_BASE_RESOURCE]
-- ----------------------------
ALTER TABLE [dbo].[T_BASE_RESOURCE] ADD FOREIGN KEY ([PARENT_ID]) REFERENCES [dbo].[T_BASE_RESOURCE] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[T_BASE_ROLE_RESOURCE]
-- ----------------------------
ALTER TABLE [dbo].[T_BASE_ROLE_RESOURCE] ADD FOREIGN KEY ([RESOURCE_ID]) REFERENCES [dbo].[T_BASE_RESOURCE] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[T_BASE_ROLE_RESOURCE] ADD FOREIGN KEY ([ROLE_ID]) REFERENCES [dbo].[T_BASE_ROLE] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[T_BASE_USER]
-- ----------------------------
ALTER TABLE [dbo].[T_BASE_USER] ADD FOREIGN KEY ([DEFAULT_ORGANID]) REFERENCES [dbo].[T_BASE_ORGAN] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[T_BASE_USER_ORGAN]
-- ----------------------------
ALTER TABLE [dbo].[T_BASE_USER_ORGAN] ADD FOREIGN KEY ([ORGAN_ID]) REFERENCES [dbo].[T_BASE_ORGAN] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[T_BASE_USER_ORGAN] ADD FOREIGN KEY ([USER_ID]) REFERENCES [dbo].[T_BASE_USER] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[T_BASE_USER_RESOURCE]
-- ----------------------------
ALTER TABLE [dbo].[T_BASE_USER_RESOURCE] ADD FOREIGN KEY ([USER_ID]) REFERENCES [dbo].[T_BASE_USER] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[T_BASE_USER_RESOURCE] ADD FOREIGN KEY ([RESOURCE_ID]) REFERENCES [dbo].[T_BASE_RESOURCE] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[T_BASE_USER_ROLE]
-- ----------------------------
ALTER TABLE [dbo].[T_BASE_USER_ROLE] ADD FOREIGN KEY ([USER_ID]) REFERENCES [dbo].[T_BASE_USER] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[T_BASE_USER_ROLE] ADD FOREIGN KEY ([ROLE_ID]) REFERENCES [dbo].[T_BASE_ROLE] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[T_SYS_DICTIONARY]
-- ----------------------------
ALTER TABLE [dbo].[T_SYS_DICTIONARY] ADD FOREIGN KEY ([DICTIONARYTYPE_CODE]) REFERENCES [dbo].[T_SYS_DICTIONARYTYPE] ([CODE]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[T_SYS_DICTIONARY] ADD FOREIGN KEY ([PARENT_CODE]) REFERENCES [dbo].[T_SYS_DICTIONARY] ([CODE]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[T_SYS_DICTIONARYTYPE]
-- ----------------------------
ALTER TABLE [dbo].[T_SYS_DICTIONARYTYPE] ADD FOREIGN KEY ([GROUP_CODE]) REFERENCES [dbo].[T_SYS_DICTIONARYTYPE] ([CODE]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
