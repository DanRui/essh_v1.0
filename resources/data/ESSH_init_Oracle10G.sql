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

Date: 2013-09-10 00:42:01
*/


-- ----------------------------
-- Table structure for T_BASE_ORGAN
-- ----------------------------
DROP TABLE "T_BASE_ORGAN";
CREATE TABLE "T_BASE_ORGAN" (
"ID" NUMBER(19) NOT NULL ,
"CREATE_TIME" TIMESTAMP(6)  NULL ,
"CREATE_USER" VARCHAR2(36 CHAR) NULL ,
"STATUS" NUMBER(10) NULL ,
"UPDATE_TIME" TIMESTAMP(6)  NULL ,
"UPDATE_USER" VARCHAR2(36 CHAR) NULL ,
"VERSION" NUMBER(10) NULL ,
"ADDRESS" VARCHAR2(255 CHAR) NULL ,
"CODE" VARCHAR2(36 CHAR) NULL ,
"FAX" VARCHAR2(64 CHAR) NULL ,
"MANAGER_USER_ID" NUMBER(19) NULL ,
"NAME" VARCHAR2(255 CHAR) NOT NULL ,
"ORDER_NO" NUMBER(10) NULL ,
"PHONE" VARCHAR2(64 CHAR) NULL ,
"SYSCODE" VARCHAR2(36 CHAR) NULL ,
"TYPE" NUMBER(10) NULL ,
"PARENT_ID" NUMBER(19) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of T_BASE_ORGAN
-- ----------------------------

-- ----------------------------
-- Table structure for T_BASE_ORGAN_USER
-- ----------------------------
DROP TABLE "T_BASE_ORGAN_USER";
CREATE TABLE "T_BASE_ORGAN_USER" (
"ORGAN_ID" NUMBER(19) NOT NULL ,
"USER_ID" NUMBER(19) NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of T_BASE_ORGAN_USER
-- ----------------------------

-- ----------------------------
-- Table structure for T_BASE_RESOURCE
-- ----------------------------
DROP TABLE "T_BASE_RESOURCE";
CREATE TABLE "T_BASE_RESOURCE" (
"ID" NUMBER(19) NOT NULL ,
"CREATE_TIME" TIMESTAMP(6)  NULL ,
"CREATE_USER" VARCHAR2(36 CHAR) NULL ,
"STATUS" NUMBER(10) NULL ,
"UPDATE_TIME" TIMESTAMP(6)  NULL ,
"UPDATE_USER" VARCHAR2(36 CHAR) NULL ,
"VERSION" NUMBER(10) NULL ,
"MARK_URL" VARCHAR2(2000 CHAR) NULL ,
"NAME" VARCHAR2(36 CHAR) NOT NULL ,
"ORDER_NO" NUMBER(10) NULL ,
"TYPE" NUMBER(10) NULL ,
"URL" VARCHAR2(255 CHAR) NULL ,
"PARENT_ID" NUMBER(19) NULL ,
"CODE" VARCHAR2(36 CHAR) NULL ,
"ICON" VARCHAR2(255 CHAR) NULL ,
"ICON_CLS" VARCHAR2(255 CHAR) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON COLUMN "T_BASE_RESOURCE"."CODE" IS '资源编码';

-- ----------------------------
-- Records of T_BASE_RESOURCE
-- ----------------------------
INSERT INTO "T_BASE_RESOURCE" VALUES ('1430', TO_TIMESTAMP(' 2013-09-10 00:27:55:993000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0', TO_TIMESTAMP(' 2013-09-10 00:40:09:643000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '4', null, '机构管理', '5', '0', '/base/organ.action', '1', '/base/organ*', null, 'icon-group');
INSERT INTO "T_BASE_RESOURCE" VALUES ('1352', TO_TIMESTAMP(' 2013-08-15 23:35:02:964000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0', TO_TIMESTAMP(' 2013-09-03 19:41:37:225000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'eryan', '9', '/sys/dictionary-type*', '字典类型', '6', '0', '/sys/dictionary-type.action', '52', 'sys_dictionaryType', null, 'icon-book');
INSERT INTO "T_BASE_RESOURCE" VALUES ('1376', TO_TIMESTAMP(' 2013-08-19 08:45:35:699000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0', TO_TIMESTAMP(' 2013-09-03 00:16:17:402000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '3', '/sys/bug!datagrid*', '首页权限', '11', '1', null, null, null, null, 'icon-monitor');
INSERT INTO "T_BASE_RESOURCE" VALUES ('1410', TO_TIMESTAMP(' 2013-08-19 20:31:34:371000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0', TO_TIMESTAMP(' 2013-09-03 00:16:31:088000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '3', '/login!index*', '后台管理', '12', '1', null, null, null, null, 'icon-server');
INSERT INTO "T_BASE_RESOURCE" VALUES ('1377', TO_TIMESTAMP(' 2013-08-19 08:46:27:637000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0', null, null, '0', null, '演示示例', '10', '0', null, null, null, null, null);
INSERT INTO "T_BASE_RESOURCE" VALUES ('1', TO_TIMESTAMP(' 2013-03-25 08:54:51:000000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '系统', '0', TO_TIMESTAMP(' 2013-09-10 00:39:09:066000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '20', null, '权限管理', '1', '0', null, null, null, null, 'icon-application');
INSERT INTO "T_BASE_RESOURCE" VALUES ('52', TO_TIMESTAMP(' 2013-03-25 08:59:36:665000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0', TO_TIMESTAMP(' 2013-09-03 00:14:27:441000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '12', null, '系统配置', '5', '0', null, null, null, null, 'icon-application');
INSERT INTO "T_BASE_RESOURCE" VALUES ('2', TO_TIMESTAMP(' 2013-03-25 08:55:19:000000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '系统', '0', TO_TIMESTAMP(' 2013-09-04 15:14:07:092000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '19', '/base/resource*', '资源管理', '2', '0', '/base/resource.action', '1', 'base_resource', null, 'icon-folder');
INSERT INTO "T_BASE_RESOURCE" VALUES ('51', TO_TIMESTAMP(' 2013-03-25 08:59:25:390000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0', TO_TIMESTAMP(' 2013-09-05 09:36:13:139000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '7', '/base/role*', '角色管理', '4', '0', '/base/role.action', '1', 'base_role', null, 'icon-group');
INSERT INTO "T_BASE_RESOURCE" VALUES ('50', TO_TIMESTAMP(' 2013-03-25 08:59:06:333000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0', TO_TIMESTAMP(' 2013-09-03 00:14:18:427000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '11', '/base/user*', '用户管理', '3', '0', '/base/user.action', '1', 'base_user', null, 'icon-user');
INSERT INTO "T_BASE_RESOURCE" VALUES ('54', TO_TIMESTAMP(' 2013-03-25 09:00:27:841000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0', TO_TIMESTAMP(' 2013-09-03 00:14:43:444000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '8', '/sys/dictionary*', '数据字典', '7', '0', '/sys/dictionary.action', '52', 'sys_dictionary', null, 'icon-book');
INSERT INTO "T_BASE_RESOURCE" VALUES ('106', TO_TIMESTAMP(' 2013-03-28 08:56:12:409000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0', TO_TIMESTAMP(' 2013-09-03 00:14:49:187000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '15', '/sys/bug*', 'bug管理', '8', '0', '/sys/bug.action', '52', 'sys_bug', null, 'icon-bug');
INSERT INTO "T_BASE_RESOURCE" VALUES ('1378', TO_TIMESTAMP(' 2013-08-19 08:47:01:480000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0', TO_TIMESTAMP(' 2013-09-09 15:07:36:228000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '4', null, '字典演示', '11', '0', '/fileRedirect.action?toPage=demo/dictionarydemo.jsp', '1377', null, null, 'icon-book');

-- ----------------------------
-- Table structure for T_BASE_ROLE
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
-- Table structure for T_BASE_ROLE_RESOURCE
-- ----------------------------
DROP TABLE "T_BASE_ROLE_RESOURCE";
CREATE TABLE "T_BASE_ROLE_RESOURCE" (
"ROLE_ID" NUMBER(19) NOT NULL ,
"RESOURCE_ID" NUMBER(19) NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of T_BASE_ROLE_RESOURCE
-- ----------------------------

-- ----------------------------
-- Table structure for T_BASE_USER
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
INSERT INTO "T_BASE_USER" VALUES ('1', TO_TIMESTAMP(' 2013-03-25 08:53:46:000000', 'YYYY-MM-DD HH24:MI:SS:FF6'), '系统', '0', TO_TIMESTAMP(' 2013-07-16 14:43:17:621000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '9', null, null, 'admin', null, null, '5f4dcc3b5aa765d61d8327deb882cf99', '1', null);

-- ----------------------------
-- Table structure for T_BASE_USER_ROLE
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
-- Table structure for T_SYS_BUG
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
"CONTENT" CLOB NULL ,
"TYPE" VARCHAR2(36 CHAR) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of T_SYS_BUG
-- ----------------------------
INSERT INTO "T_SYS_BUG" VALUES ('181', TO_TIMESTAMP(' 2013-05-12 22:13:40:609000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0', TO_TIMESTAMP(' 2013-06-15 17:56:13:343000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '7', '杏林子', '<p>
	信念、希望、爱 ...
</p>
<p>
	<a href="/essh/attached/file/20130609/20130609091231_249.pdf" target="_blank">杏林子.pdf</a> 
</p>
<p style="text-align:center;">
	<strong><span style="font-family:宋体;font-size:16pt;">序</span></strong> 
</p>
<p>
	<span style="font-family:宋体;">&nbsp;</span><span style="font-family:宋体;">“生命的大河永不停息，一路行来，有悲有喜，有伤感，有怀念。我们的生命时而壮阔，时而蜿蜒；时而波涛汹涌，风高浪急；时而山青水秀，柳岸花明。无尽的风光，无限的人生场景，丰富了我们一生的岁月。这个世界似乎再也没有什么令我眷恋不舍的，只除了人。每当我的触角伸的更广更远，我的根便扎的更牢更深，我于是被这一片大地整个攫住了。”确如杏林子所说，在这个世界上她没有什么眷恋不舍的，她把爱也留下了。</span> 
</p>
<p>
	<span style="font-family:宋体;">杏林子效法圣经所强调的“信、望、爱”，勉励我们道：“人生路途，遥远漫长，抱着信心，怀着希望，发挥爱的力量，你们的人生永不寂寞。”论到爱，杏林子如此描述：“爱里没有忍耐，爱便肤浅；爱里没有宽容，爱便狭窄；爱里没有尊重，爱便专制；爱里没有信赖，爱便短促；爱里没有了解，爱便痛苦；爱里没有交流，爱便死亡。”她又说：“当你说爱的时候，其实你还不懂爱，只有当你付出的时候，你的爱才开始成熟。然而，你不能等到需要别人时，才开始付出你的爱。爱不是商品，无法现场交易。爱如积蓄，需要及早储备，以免一旦急用，却发现囊空如洗。”</span> 
</p>
<p>
	<span style="font-family:宋体;">杏林子不只是这样说，更是以身作则，用自身为药引子治疗孩子的心病，用爱抚平孩子的创伤，这是多么残忍和感动呢！</span> 
</p>
<p>
	<span style="font-family:宋体;">身体虽然枯萎了，却结出了生命之果，这使我想到了圣经上记载的亚伦的杖，生了花苞，开了花，结了熟杏。这是多么地相似啊！“我的存在，对我是一个永久的神迹，这就是生活。”就让我用泰戈尔的这句诗描绘杏林子的生命所发出的奇迹和美丽吧！</span> 
</p>
<p>
	<span style="font-family:宋体;">杏林子在她的作品中处处流露对人、对社会的关爱之情，讴歌天地间种种的美，抒发她对生命的欣赏与喜悦，以过人的毅力和爱心，在繁杂晦暗的社会中透出温暖的亮光。</span> 
</p>', 'bug002');
INSERT INTO "T_SYS_BUG" VALUES ('1570', TO_TIMESTAMP(' 2013-08-29 13:39:06:664000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0', TO_TIMESTAMP(' 2013-08-29 23:47:52:249000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '3', '【欢迎捐赠】', '<p>
	essh不封闭任何源代码，如果您愿意，您可以点击以下图片支持我们essh，感谢！
</p>
<p>
	<br />
</p>
<p>
	<a href="https://me.alipay.com/essh" target="_blank"></a><a href="https://me.alipay.com/essh" target="_blank"><img src="/essh/attached/image/20130819/20130819223202_289.jpg" alt="" /></a>
</p>', null);
INSERT INTO "T_SYS_BUG" VALUES ('35', TO_TIMESTAMP(' 2013-04-15 13:27:33:638000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0', TO_TIMESTAMP(' 2013-08-08 08:26:50:294000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '25', '源码下载及说明', '<h3 style="margin-left:12px;">
	源码下载
</h3>
<div>
	&nbsp; &nbsp;&nbsp;<a href="https://github.com/eryanwcp/essh_v1.0/archive/master.zip">点击下载</a>
</div>
<div>
	&nbsp; &nbsp; 演示地址:<a href="http://117.40.138.25:8080/essh" target="_blank">http://117.40.138.25:8080/essh</a><br />
&nbsp; &nbsp; 最新源码:<a href="https://github.com/eryanwcp/essh_v1.0" target="_blank">https://github.com/eryanwcp/essh_v1.0</a>&nbsp;&nbsp;<br />
</div>
<div>
	<br />
</div>
<div>
	&nbsp; &nbsp; <span style="color:#ff0000;">注：项目仅用于个人学习，请勿用于商业项目！</span>
</div>
<div>
	<span style="color:#ff0000;">&nbsp; &nbsp; QQ群:20769940</span>
</div>
<h3 style="margin-left:12px;">
	技术组合
</h3>
<ul>
	<li>
		jQuery EasyUI、Kindeditor、Jackson、Struts2、Spring、Spring JDBC、Quartz、Hibernate、Ehcache、ehcache-spring-annotations、Hibernate Validator
	</li>
</ul>
<h3 style="margin-left:12px;">
	功能介绍
</h3>
<ul>
	<li>
		UI组件:采用jQuery EasyUI组件完成页面布局、数据表格、表单校验、换肤等功能.
	</li>
<br />
	<li>
		拦截器:页面请求的js、css以及图片等静态文件使用GzipFilter过滤器压缩返回数据减少网络带宽；使用静态静态资源过滤器缓存js、css以及图片等资源.
	</li>
<br />
	<li>
		异步与json数据:采用异步操作，增强的用户体验；采用Jackson完善的Java对象与json字符的转换，支持List, POJO[], POJO, 也可以Map名值对等，支持注解过滤属性以及自定义日期格式.
	</li>
<br />
	<li>
		查询条件生成器:采用QBC面向对象查询，自定义PropertyFilter，后台无需添加代码即可完成各种列表查询，自定义特殊字符过滤器，屏蔽特殊字符"_","%"等查询.
	</li>
<br />
	<li>
		后台校验:采用Hibernate Validator注解方式完成后台数据校验.
	</li>
<br />
	<li>
		并发控制: 采用乐观锁机制，防止数据并发问题.
	</li>
<br />
	<li>
		异常处理:统一定义异常出口，完善的常见各种<span style="font-family:微软雅黑, 宋体, 新宋体;">异</span>常提示，再也难以在界面上看见后台的一堆的异常信息，增强用户体验.
	</li>
<br />
	<li>
		持久化:采用统一HibenateDao基类完成数据库操作、亦可以使用Spring JDBC原生SQL语句操作数据库.
	</li>
<br />
	<li>
		对象缓存:使用ehcache-spring-annotations，只需简单的注解即可完成对象的缓存、更新，例如对用户菜单的缓存.
	</li>
<br />
	<li>
		各种共通封装(数据字典/邮件发送/定时任务/各种工具类).
	</li>
<br />
	<li>
		支持SQL Server、Oracle和MySQL等主流数据库.
	</li>
<br />
	<li>
		兼容IE 6+、Firefox以及Google等浏览器.
	</li>
</ul>', 'bug002');
INSERT INTO "T_SYS_BUG" VALUES ('182', TO_TIMESTAMP(' 2013-05-12 22:36:18:671000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0', TO_TIMESTAMP(' 2013-06-15 17:56:27:625000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '4', '永远的小女儿', '<p align="center" style="font-family:Arial;font-size:14px;text-align:center;">
	<strong><span style="font-family:宋体;font-size:14pt;">永 远 的 小 女 儿<br />
<img src="/essh/attached/image/20130609/20130609090148_219.png" alt="" />&nbsp;</span></strong><span style="font-family:宋体;font-size:14pt;"></span> 
</p>
<p align="center" style="font-family:Arial;font-size:14px;text-align:center;">
	<span style="font-family:楷体_GB2312;font-size:10pt;">杏林子</span> 
</p>
<p align="center" style="font-family:Arial;font-size:14px;text-align:center;">
	<span style="font-family:宋体;font-size:10pt;">&nbsp;</span> 
</p>
<p align="left" style="font-family:Arial;font-size:14px;text-indent:21pt;">
	<span style="font-family:宋体;">许多做父母的，在孩子幼小时，看到他们童真可爱的模样，稚言稚语，总恨不得孩子永远不要长大，永远陪伴在自己身边。可是，当孩子应该长大、却没有长大时，做父母的心情又如何呢？</span> 
</p>
<p align="left" style="font-family:Arial;font-size:14px;">
	<span style="font-family:宋体;">　　那天，在医院看到周子祥时，我就在想这个问题。二十二岁的她，理应像任何一位正常发育的少女，婀娜多姿，闪耀着青春灿烂的光彩，向往爱情，追逐流行，这是个多么意气风发的年岁阿！</span> 
</p>
<p align="left" style="font-family:Arial;font-size:14px;">
	<span style="font-family:宋体;">　　可是没有，子祥安安静静坐在一辆比婴儿车大不了多少的特制轮椅上，扎着两条可爱的小辫子，身着一袭妈妈亲手缝制的童装，一张脸孔仍稚气未脱，就连讲话的声音也仍带着童音。如果别人不说，你会直觉地认为，她只是一个单纯的小女孩，看外表，最多不过五岁吧！</span> 
</p>
<p align="left" style="font-family:Arial;font-size:14px;">
	<span style="font-family:宋体;">　　子祥并非侏儒症患者，她身体的比例倒是十分正常，只是比别人小了很多号。造成子祥长不大的原因是她和我一样得了“类风湿关节炎”，只不过她在幼儿期发病。</span> 
</p>
<p align="left" style="font-family:Arial;font-size:14px;">
	<span style="font-family:宋体;">　　子祥的父亲是老师，母亲是公务员，一个很平凡也很平常的家庭。在生了两个男孩后，他们一直很渴望有个小女儿，中间周妈妈也几度流产，但都未打消她要生一个女儿的决心，终于在三十六岁高龄生下子祥。可想而知，他们一家，上自老奶奶，下至两个哥哥，是多么高兴，尤其周爸爸，简直可以用欢喜若狂来形容。</span> 
</p>
<p align="left" style="font-family:Arial;font-size:14px;">
	<span style="font-family:宋体;">　　偏偏子祥又长得特别讨喜，一双圆圆的大眼睛，翘翘的小鼻子，加上皮肤白皙，活脱脱像个洋娃娃，更难得的是她特别好带。周妈妈回忆说，她几乎从不生病，也很少哭闹，每天都开开心心的，任谁见了她，都忍不住想要亲亲她，捏捏他的小脸蛋。</span> 
</p>
<p align="left" style="font-family:Arial;font-size:14px;">
	<span style="font-family:宋体;">　　这样一个健康宝宝，不到一岁就会说话走路，记得许多单字，记忆力尤其好，他的娃娃书、玩具放在什么地方，她全记得一清二楚，甚至有谁动过，她都知道。除此之外，她的音感很好，任何曲子只要听过一、两遍，就能在她的玩具纲琴上弹出简单的旋律，简直可以说是个小天才。</span> 
</p>
<p align="left" style="font-family:Arial;font-size:14px;">
	<span style="font-family:宋体;">　　渴望多年，又是这样的活泼可爱、聪颖美丽，周爸爸对这个小女儿爱若瑰宝，“捧在手上怕摔了，含在口里怕化了”，连蚊子叮一口都舍不得。</span> 
</p>
<p align="left" style="font-family:Arial;font-size:14px;">
	<span style="font-family:宋体;">　　两个儿子从小跟着外婆长大，老人家的观念，小孩子非得跟泥土亲近才能长得结实，所以两个男孩都是在泥巴里长大，长得又黑又壮。到了子祥，过分宝贝的结果，周爸爸特别注重她的卫生，不论吃、用都是一再消毒。</span> 
</p>
<p align="left" style="font-family:Arial;font-size:14px;">
	<span style="font-family:宋体;">　　子祥好动，难免有其他小朋友找她玩，只要被周爸爸看到，就成了不得了的大事，立刻抱回家，用毛巾擦了一遍又一遍，深怕被细菌传染。亲友看到子祥可爱，想要逗逗她，周爸爸说话了：“不成，先把手洗干净再说！”</span> 
</p>
<p align="left" style="font-family:Arial;font-size:14px;">
	<span style="font-family:宋体;">　　有谁想抱抱子祥，周爸爸就先检查人家身上有没有戴手表、链子等物，非得除去才行；穿了有扣子的衣服，也得换另一件，怕的是这些硬物刮到他宝贝女儿的细皮嫩肉。</span> 
</p>
<p align="left" style="font-family:Arial;font-size:14px;">
	<span style="font-family:宋体;">　　对于周爸爸的紧张兮兮和小题大作，亲友都不免啼笑皆非，然而，尽管是这样的小心呵护，仍然无法保证病魔不找上门来。</span> 
</p>
<p align="left" style="font-family:Arial;font-size:14px;">
	<span style="font-family:宋体;">　　子祥近两岁时，周妈妈无意中发现她的左膝关节处有一个小疱，不痛不痒，但由于周爸爸绝不允许女儿身上有任何疔疤，周妈妈唯恐又引起夫妻争执，私下带子祥到台大检查。骨科大夫用手在子祥的膝盖上按了按，脸色凝重，“唉呀”了一声，这一声也把周妈妈的心沉了下去。</span> 
</p>
<p align="left" style="font-family:Arial;font-size:14px;">
	<span style="font-family:宋体;">　　从子祥膝盖里抽出的一些青黄色液体，经过检查后，终于证实是“类风湿关节炎”。在子祥自己写的一篇“今生今世”的文章中，她这样写着：“美好的日子总是不长久，在我还来不及探索这世界，享受新生命时，上天已安排我承受这一场艰辛的磨练，从此‘类风湿关节炎’成了我往后每一个日子里必须面对的挑战，而医院、药物与病魔突如其来的捉弄和辗转反侧的住院，还有那些令人望之却步的医疗检查，已渐渐成为我生活中的一部分。”</span> 
</p>
<p align="left" style="font-family:Arial;font-size:14px;">
	<span style="font-family:宋体;">　　直到今天，连医师也不敢确定，子祥的病发现得早，对她到底是好还是不好。太多的药物，特别是早期大量使用类固醇，抑制了她的生长机能，造成她始终无法长大的原因。</span> 
</p>
<p align="left" style="font-family:Arial;font-size:14px;">
	<span style="font-family:宋体;">　　我常自夸，病史悠久，病历丰富，但比起子祥，我还得甘拜下风。全台湾各大医院，子祥几乎全跑遍了，“周游列国”的结果，耗费的时间、人力，投注的金钱，真是无法计算。</span> 
</p>
<p align="left" style="font-family:Arial;font-size:14px;">
	<span style="font-family:宋体;">　　为了专心照顾她，周妈妈辞去公职。然而，一份薪水实不足以应付庞大的医药费，周爸爸只好卖掉房子，日夜兼课，周妈妈则在家开小吃店、小说出租店，或是帮附近学童补习功课，贴补家用，一家老少共同打这场仗。</span> 
</p>
<p align="left" style="font-family:Arial;font-size:14px;">
	<span style="font-family:宋体;">　　类风湿是一种到今天仍无法根治的慢性病，随着时间，子祥发病的关节愈来愈多，但父母并未阻止她求学的愿望和机会，只要身体状况许可，周妈妈就会背着她上下学，尽管念书和住院的时间几乎是一样的多，但她的功课仍然非常好。原来，要强的子祥总是偷偷以三、四个同学为她的“假想敌”，暗中和他们较劲，好不容易读到国二，因为食道血管破裂造成大出血，经过九个小时的手术，拿掉脾脏，才总算把她从死神手中抢救回来，但体力却急速衰竭，学校几乎没法去了，只有把课业拿回家自修。</span> 
</p>
<p align="left" style="font-family:Arial;font-size:14px;">
	<span style="font-family:宋体;">　　毕业考时，老师原先准备把考卷送到家里，但子祥坚持不肯享受这样的“特权”，她的理由是：“如果考不好，同学会笑我在家里根本没念书，万一考得很好，等一下又有人怀疑我作弊……”勉强支撑着病体，考完了毕业考，顺利地拿到国中毕业证书，这也是她最后一次走进学校。</span> 
</p>
<p align="left" style="font-family:Arial;font-size:14px;">
	<span style="font-family:宋体;">　　不能继续升学是子祥最大的遗憾，周妈妈了解女儿的心事，总是劝慰她：“有一颗上进心很好，但求知不一定非到学校不可，在家自修也是一样，你可以叫大哥哥教你计算机呀！”</span> 
</p>
<p align="left" style="font-family:Arial;font-size:14px;">
	<span style="font-family:宋体;">　　聪明的子祥不但学会计算机，也跟小哥小嫂学画画、美工设计。不去医院的日子，她敲敲计算机，画几笔画，自得其乐。</span> 
</p>
<p align="left" style="font-family:Arial;font-size:14px;">
	<span style="font-family:宋体;">　　病了二十年，子祥练就了一流的忍功，无论身体如何不适，她都很少呻吟诉苦，恐怕增加父母的负担，反倒是父母有时看到她脸色不对，才发现病又发作。有一次，她肾结石开刀，由于身体太弱，医师不敢下麻药，就在无麻醉的情况下，开刀取出石子，她的勇敢令医师都敬佩。</span> 
</p>
<p align="left" style="font-family:Arial;font-size:14px;">
	<span style="font-family:宋体;">　　子祥病的辛苦，但更辛苦的是父母，从小到大，他们对子祥的照顾无微不至。</span> 
</p>
<p align="left" style="font-family:Arial;font-size:14px;">
	<span style="font-family:宋体;">　　子祥上学时，因为肠胃吸收不好，只能少量多餐，周妈妈经常一天要跑四、五趟学校，给她送饭送点心。一直到今天，每晚夫妻俩都轮流在子祥床边打地铺，怕的是万一她有什么需要，或是突发状况。至于跑医院，则早已成了家常便饭。</span> 
</p>
<p align="left" style="font-family:Arial;font-size:14px;">
	<span style="font-family:宋体;">　　其实，再累再辛苦，他们都甘愿，唯独看到爱女的病情日益严重，却又无能为力时，才使他们的内心备感煎熬，不论再多的爱和保护都不能阻止病魔对子祥的节节进攻，才真是让他们心如刀割啊！</span> 
</p>
<p align="left" style="font-family:Arial;font-size:14px;">
	<span style="font-family:宋体;">　　反倒是子祥，因为父母这份完整无缺的爱，心理上不曾有任何的偏差，相反的，她十分开朗活泼、善解人意，看到父母的辛苦劳累，她总是体贴地说：“你们不要管我，我痛一下没关系的！”目前类风湿已经侵蚀到子祥所有的内脏器官：心、肝、肺、肾……几乎无一幸免。每隔几天就会出一次状况，单单去年一年，她就住了十次医院，其中有九次都发出病危通知单。</span> 
</p>
<p align="left" style="font-family:Arial;font-size:14px;">
	<span style="font-family:宋体;">　　子祥对自已的痛也很能坦然面对，对于不可知的未来，我问“你怕死吗？”</span> 
</p>
<p align="left" style="font-family:Arial;font-size:14px;">
	<span style="font-family:宋体;">　　她露出纯稚的笑容，说：“有一点点，也不是很怕啦，我舍不得爸爸妈妈！”</span> 
</p>
<p style="font-family:Arial;font-size:14px;text-indent:21pt;">
	<span style="font-family:宋体;">两个哥哥都已经长大成人，结婚生子，各自拥有他们的家庭，除了星期假日，平日也难得全家相聚，家中只剩二老和子祥，相较于许多空巢期的夫妻，有子祥这个长不大的女儿相伴，周爸爸周妈妈也算是福气吧;只是这样的福气充满多少辛酸无奈，其中的伤痛又岂是外人所能了解?</span> 
</p>
<p style="font-family:Arial;font-size:14px;text-indent:21pt;">
	<span style="font-family:宋体;">子祥说：“这一生，虽然失去了健康，但老天爷赐给了我最好的妈妈和爸爸，拥有他们，其余失去的，我已不再执着，只是如果还有来世，能有再一次的机会，我依然眷恋做爸妈的小孩，而如果真有那么一天，但愿我能是个永远都健康的小孩，别再让他们那么辛苦、那么为难了。”</span> 
</p>
<p style="font-family:Arial;font-size:14px;text-indent:21pt;">
	<span style="font-family:宋体;">永远的小女儿，父母心头的最爱，也是最痛。</span> 
</p>', 'bug002');
INSERT INTO "T_SYS_BUG" VALUES ('236', TO_TIMESTAMP(' 2013-05-27 22:52:03:109000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0', TO_TIMESTAMP(' 2013-06-15 17:55:54:140000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '3', 'essh开发文档', '<p>
	整理的文档 还比较粗糙...
</p>
<p>
	<a class="ke-insertfile" href="/essh/attached/file/20130609/20130609090221_964.doc" target="_blank">essh开发文档</a>
</p>', 'bug002');
INSERT INTO "T_SYS_BUG" VALUES ('176', TO_TIMESTAMP(' 2013-05-12 10:14:47:937000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0', TO_TIMESTAMP(' 2013-08-08 08:27:00:762000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '26', '版本更新日志', '<p>
	<span style="font-size:16px;"><span style="font-family:SimSun;"></span></span> 
</p>
<p>
	&nbsp;* 2013-07-04<br />
<br />
&nbsp; &nbsp; &nbsp;1. 新增spy数据库监控.<br />
<br />
&nbsp; &nbsp; &nbsp;2. 重构保存save方法,系统统一使用saveEntity方法.<br />
<br />
* 2013-06-25<br />
<br />
&nbsp; &nbsp; 1. 新增jndi配置模板.<br />
&nbsp; &nbsp;&nbsp;<br />
<br />
* 2013-06-16<br />
<br />
&nbsp; &nbsp; 1. 数据字典、菜单管理 原设置父级节点的模块修改父级节点为空 无效 bug修正<br />
<br />
<br />
* 2013-06-16<br />
&nbsp;&nbsp;<br />
&nbsp; &nbsp; 1. dao saveOrUpdate方法内部去除清空session缓存方法clear 废弃saveOrUpdate方法 改用merge 以及相关 修改部分缓存控制.<br />
&nbsp; &nbsp;<br />
&nbsp; &nbsp; 2. 用户两个模块关于外键关联时 设置为空 bug等（好糗的bug啊） 顺便可能改正了些其它bug.<br />
&nbsp; &nbsp;&nbsp;<br />
&nbsp; &nbsp; 3. 部分页面宽度调整.<br />
&nbsp; &nbsp;&nbsp;<br />
&nbsp; &nbsp; 4. 修正easyui tree死循环bug.<br />
&nbsp; &nbsp;&nbsp;<br />
&nbsp; &nbsp; 5. 部分struts标签改成jstl标签.<br />
<br />
<br />
* 2013-06-15<br />
&nbsp;&nbsp;<br />
&nbsp; &nbsp; 1. Excel导入导出 以bug管理为示例.<br />
&nbsp; &nbsp;<br />
&nbsp; &nbsp; 2. 数据字典根据类型编码查询bug修正.<br />
&nbsp; &nbsp;&nbsp;<br />
&nbsp; &nbsp; 3. 表单提交 进度条提示.<br />
<br />
* 2013-06-10<br />
<br />
&nbsp; &nbsp; 1. 修改菜单树为默认不展开.
</p>
<p>
	<br />
</p>
<p>
	* 2013-06-07<br />
<br />
&nbsp; &nbsp; 1. 修复用户管理bug(修改用户功能修改登录名空指针异常).<br />
<br />
&nbsp; &nbsp; 2. entity基类重构,变更包名.<br />
&nbsp; &nbsp;&nbsp;<br />
&nbsp; &nbsp; 3. bug管理使用kingeditor编辑器.<br />
<br />
<br />
* 2013-06-02<br />
<br />
1. bug管理新增bug类型.
</p>
<p>
	<br />
</p>
<p>
	* 2013-05-29<br />
<br />
<span> </span>1. tab关闭选项面板 tip提示不会自动消失修正.<br />
<br />
<br />
* 2013-05-27<br />
<br />
<br />
<span> </span>1.form 是否可用disable扩展.<br />
<span> </span><br />
<span> </span>2.combo是否可用文本域方法扩展disableTextbox、enableTextbox.<br />
<span> </span><br />
<span> </span>3.初步整理了下开发文档,还是比较粗糙.<br />
<span> </span><br />
* 2013-05-26<br />
<br />
<br />
&nbsp; &nbsp; 1.datagrid tooltip提示扩展.&nbsp;<br />
&nbsp; &nbsp;&nbsp;<br />
&nbsp; &nbsp; 2.分离jQuery、EasyUI扩展，部分名称调整，小幅度重构.<br />
&nbsp; &nbsp;&nbsp;<br />
&nbsp; &nbsp; 3.EasyUI form方法扩展：获取表单数据 getData.<br />
&nbsp; &nbsp;&nbsp;<br />
&nbsp; &nbsp; 4.jstl jar升级.<br />
<br />
<br />
* 2013-05-24<br />
<br />
<br />
&nbsp; &nbsp; 1.新增QBC别名查询说明.
</p>
<p>
	<br />
</p>
<p>
	* 2013-05-23
</p>
<br />
<br />
&nbsp; &nbsp; 1.整理EasyUI1.3.3官网api文档.<br />
<br />
<br />
* 2013-05-22<br />
<br />
<br />
<br />
<br />
&nbsp; &nbsp;1.新编自定义查询PropertyFilter与QBC说明.<br />
<br />
<br />
&nbsp; &nbsp;2.doc下新加EasyUI、jQuery、JPA注解文档.<br />
<br />
<br />
&nbsp; &nbsp;3.在菜单管理中去除[字典类型],字典类型由数据字典管理菜单栏直接连接.<br />
<br />
<br />
&nbsp; &nbsp;4.用户逻辑删除时,将用户关联的角色信息设置为空.<br />
&nbsp; &nbsp;<br />
* 2013-05-21<br />
<br />
<br />
&nbsp; &nbsp;1.各模块关于选中多条记录进行编辑操作时，提示错误，修改为默认操作最后一条被选中的记录.<br />
<br />
<br />
&nbsp; &nbsp;2.反射工具类ReflectionUtils新增获取对象、构造函数、方法等的注解类，对象转换工具类ConvertUtils小改动.<br />
<br />
<br />
&nbsp; &nbsp;3.新增逻辑删除注解@Delete,Dao删除对象时自动根据注解修改为相应的状态标识,实现逻辑删除.<br />
<br />
<br />
&nbsp; &nbsp;4.用户管理新增逻辑删除功能.<br />
<br />
<br />
&nbsp; &nbsp;5.jsp隐式注释.<br />
&nbsp; &nbsp;<br />
* 2013-05-15<br />
<br />
<br />
&nbsp; &nbsp;1、tab页Iframe朦胧效果.<br />
<br />
<br />
* 2013-05-12<br />
<br />
<br />
&nbsp; &nbsp;1、easyui整合my97控件.<br />
&nbsp; &nbsp;&nbsp;<br />
* 2013-05-11&nbsp;<br />
<br />
<br />
&nbsp; &nbsp;1.修正Struts二次绑定对象(根据ID查找对象)导致Hibernate乐观锁失效bug.<br />
<br />
<br />
&nbsp; &nbsp;2.拆分Spring配置文件、支持Spring原生缓存注解,将MenuManager缓存修改为Spring原生注重方式(演示用).<br />
<br />
<br />
&nbsp; &nbsp;3.添加spring任务调度xml配置方式示例.<span style="font-size:16px;"></span><br />', 'bug001');

-- ----------------------------
-- Table structure for T_SYS_DICTIONARY
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
"PARENT_CODE" VARCHAR2(36 CHAR) NULL ,
"VALUE" VARCHAR2(100 CHAR) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of T_SYS_DICTIONARY
-- ----------------------------
INSERT INTO "T_SYS_DICTIONARY" VALUES ('1412', TO_TIMESTAMP(' 2013-09-09 15:14:10:978000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0', null, null, '0', 'domain003', '研究生', '3', 'tt', 'domain003', null, 'domain003');
INSERT INTO "T_SYS_DICTIONARY" VALUES ('1393', TO_TIMESTAMP(' 2013-09-09 11:01:11:275000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0', null, null, '0', 'xl01001', '本科', '1', null, 'xl01', null, 'xl01001');
INSERT INTO "T_SYS_DICTIONARY" VALUES ('1394', TO_TIMESTAMP(' 2013-09-09 11:01:26:837000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0', null, null, '0', 'xl01002', '硕士', '2', null, 'xl01', null, 'xl01002');

-- ----------------------------
-- Table structure for T_SYS_DICTIONARYTYPE
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
"ORDER_NO" NUMBER(10) NULL ,
"REMARK" VARCHAR2(255 CHAR) NULL ,
"GROUP_CODE" VARCHAR2(12 CHAR) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of T_SYS_DICTIONARYTYPE
-- ----------------------------
INSERT INTO "T_SYS_DICTIONARYTYPE" VALUES ('1391', TO_TIMESTAMP(' 2013-09-09 10:59:53:978000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0', null, null, '0', 'xl', '学历', '2', null, null);
INSERT INTO "T_SYS_DICTIONARYTYPE" VALUES ('1431', TO_TIMESTAMP(' 2013-08-19 23:35:10:152000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0', TO_TIMESTAMP(' 2013-09-09 13:35:01:384000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '1', 'domain', '区域', '1', null, null);
INSERT INTO "T_SYS_DICTIONARYTYPE" VALUES ('1432', TO_TIMESTAMP(' 2013-08-19 23:35:21:059000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0', null, null, '0', 'domain001', '江西', '2', null, 'domain');
INSERT INTO "T_SYS_DICTIONARYTYPE" VALUES ('1433', TO_TIMESTAMP(' 2013-08-19 23:35:36:309000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0', null, null, '0', 'domain002', '广东', '3', null, 'domain');
INSERT INTO "T_SYS_DICTIONARYTYPE" VALUES ('1434', TO_TIMESTAMP(' 2013-08-19 23:35:50:371000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0', TO_TIMESTAMP(' 2013-08-19 23:36:02:871000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '1', 'domain003', '上海', '4', null, 'domain');
INSERT INTO "T_SYS_DICTIONARYTYPE" VALUES ('1455', TO_TIMESTAMP(' 2013-08-20 14:40:01:605000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0', null, null, '0', 'org', '虚拟组织', '10', null, null);
INSERT INTO "T_SYS_DICTIONARYTYPE" VALUES ('1456', TO_TIMESTAMP(' 2013-08-20 14:40:22:293000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0', TO_TIMESTAMP(' 2013-08-20 15:20:54:012000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '2', 'org001', '真实的组织', '11', null, 'org');
INSERT INTO "T_SYS_DICTIONARYTYPE" VALUES ('1457', TO_TIMESTAMP(' 2013-08-20 14:40:31:730000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0', TO_TIMESTAMP(' 2013-08-20 15:20:57:762000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '2', 'org002', '虚拟组织', '12', null, 'org');
INSERT INTO "T_SYS_DICTIONARYTYPE" VALUES ('1445', TO_TIMESTAMP(' 2013-08-20 12:27:40:934000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0', TO_TIMESTAMP(' 2013-08-20 12:29:24:934000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '4', 'security', '权限控制', '5', null, null);
INSERT INTO "T_SYS_DICTIONARYTYPE" VALUES ('1458', TO_TIMESTAMP(' 2013-08-20 14:40:50:746000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0', TO_TIMESTAMP(' 2013-08-20 14:45:01:559000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '1', 'org003', '虚拟组织3', '13', null, 'org');
INSERT INTO "T_SYS_DICTIONARYTYPE" VALUES ('1392', TO_TIMESTAMP(' 2013-09-09 11:00:02:478000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0', null, null, '0', 'xl01', '学历1', '3', null, 'xl');
INSERT INTO "T_SYS_DICTIONARYTYPE" VALUES ('1410', TO_TIMESTAMP(' 2013-09-09 15:09:17:087000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '0', TO_TIMESTAMP(' 2013-09-09 15:09:47:212000', 'YYYY-MM-DD HH24:MI:SS:FF6'), 'admin', '2', 'xml', 'aaa', '14', 'bbss', 'xl');

-- ----------------------------
-- Sequence structure for ESSH_COMMON_SEQUENCE
-- ----------------------------
DROP SEQUENCE "ESSH_COMMON_SEQUENCE";
CREATE SEQUENCE "ESSH_COMMON_SEQUENCE"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 999999999999999999999999999
 START WITH 61
 CACHE 20;

-- ----------------------------
-- Sequence structure for HIBERNATE_SEQUENCE
-- ----------------------------
DROP SEQUENCE "HIBERNATE_SEQUENCE";
CREATE SEQUENCE "HIBERNATE_SEQUENCE"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 99999999999999999999
 START WITH 1450
 CACHE 20;

-- ----------------------------
-- Sequence structure for SEQUENCE_GROUP
-- ----------------------------
DROP SEQUENCE "SEQUENCE_GROUP";
CREATE SEQUENCE "SEQUENCE_GROUP"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 999999999999999999999999999
 START WITH 21
 CACHE 20;

-- ----------------------------
-- Indexes structure for table T_BASE_ORGAN
-- ----------------------------

-- ----------------------------
-- Uniques structure for table T_BASE_ORGAN
-- ----------------------------
ALTER TABLE "T_BASE_ORGAN" ADD UNIQUE ("NAME");

-- ----------------------------
-- Checks structure for table T_BASE_ORGAN
-- ----------------------------
ALTER TABLE "T_BASE_ORGAN" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "T_BASE_ORGAN" ADD CHECK ("NAME" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_BASE_ORGAN
-- ----------------------------
ALTER TABLE "T_BASE_ORGAN" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Checks structure for table T_BASE_ORGAN_USER
-- ----------------------------
ALTER TABLE "T_BASE_ORGAN_USER" ADD CHECK ("ORGAN_ID" IS NOT NULL);
ALTER TABLE "T_BASE_ORGAN_USER" ADD CHECK ("USER_ID" IS NOT NULL);

-- ----------------------------
-- Indexes structure for table T_BASE_RESOURCE
-- ----------------------------

-- ----------------------------
-- Checks structure for table T_BASE_RESOURCE
-- ----------------------------
ALTER TABLE "T_BASE_RESOURCE" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "T_BASE_RESOURCE" ADD CHECK ("NAME" IS NOT NULL);
ALTER TABLE "T_BASE_RESOURCE" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "T_BASE_RESOURCE" ADD CHECK ("NAME" IS NOT NULL);
ALTER TABLE "T_BASE_RESOURCE" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "T_BASE_RESOURCE" ADD CHECK ("NAME" IS NOT NULL);
ALTER TABLE "T_BASE_RESOURCE" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "T_BASE_RESOURCE" ADD CHECK ("NAME" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_BASE_RESOURCE
-- ----------------------------
ALTER TABLE "T_BASE_RESOURCE" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table T_BASE_ROLE
-- ----------------------------

-- ----------------------------
-- Checks structure for table T_BASE_ROLE
-- ----------------------------
ALTER TABLE "T_BASE_ROLE" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "T_BASE_ROLE" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "T_BASE_ROLE" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "T_BASE_ROLE" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_BASE_ROLE
-- ----------------------------
ALTER TABLE "T_BASE_ROLE" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Checks structure for table T_BASE_ROLE_RESOURCE
-- ----------------------------
ALTER TABLE "T_BASE_ROLE_RESOURCE" ADD CHECK ("ROLE_ID" IS NOT NULL);
ALTER TABLE "T_BASE_ROLE_RESOURCE" ADD CHECK ("RESOURCE_ID" IS NOT NULL);
ALTER TABLE "T_BASE_ROLE_RESOURCE" ADD CHECK ("ROLE_ID" IS NOT NULL);
ALTER TABLE "T_BASE_ROLE_RESOURCE" ADD CHECK ("RESOURCE_ID" IS NOT NULL);
ALTER TABLE "T_BASE_ROLE_RESOURCE" ADD CHECK ("ROLE_ID" IS NOT NULL);
ALTER TABLE "T_BASE_ROLE_RESOURCE" ADD CHECK ("RESOURCE_ID" IS NOT NULL);

-- ----------------------------
-- Indexes structure for table T_BASE_USER
-- ----------------------------

-- ----------------------------
-- Checks structure for table T_BASE_USER
-- ----------------------------
ALTER TABLE "T_BASE_USER" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "T_BASE_USER" ADD CHECK ("LOGINNAME" IS NOT NULL);
ALTER TABLE "T_BASE_USER" ADD CHECK ("PASSWORD" IS NOT NULL);
ALTER TABLE "T_BASE_USER" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "T_BASE_USER" ADD CHECK ("LOGINNAME" IS NOT NULL);
ALTER TABLE "T_BASE_USER" ADD CHECK ("PASSWORD" IS NOT NULL);
ALTER TABLE "T_BASE_USER" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "T_BASE_USER" ADD CHECK ("LOGINNAME" IS NOT NULL);
ALTER TABLE "T_BASE_USER" ADD CHECK ("PASSWORD" IS NOT NULL);
ALTER TABLE "T_BASE_USER" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "T_BASE_USER" ADD CHECK ("LOGINNAME" IS NOT NULL);
ALTER TABLE "T_BASE_USER" ADD CHECK ("PASSWORD" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_BASE_USER
-- ----------------------------
ALTER TABLE "T_BASE_USER" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Checks structure for table T_BASE_USER_ROLE
-- ----------------------------
ALTER TABLE "T_BASE_USER_ROLE" ADD CHECK ("USER_ID" IS NOT NULL);
ALTER TABLE "T_BASE_USER_ROLE" ADD CHECK ("ROLE_ID" IS NOT NULL);
ALTER TABLE "T_BASE_USER_ROLE" ADD CHECK ("USER_ID" IS NOT NULL);
ALTER TABLE "T_BASE_USER_ROLE" ADD CHECK ("ROLE_ID" IS NOT NULL);
ALTER TABLE "T_BASE_USER_ROLE" ADD CHECK ("USER_ID" IS NOT NULL);
ALTER TABLE "T_BASE_USER_ROLE" ADD CHECK ("ROLE_ID" IS NOT NULL);

-- ----------------------------
-- Indexes structure for table T_SYS_BUG
-- ----------------------------

-- ----------------------------
-- Triggers structure for table T_SYS_BUG
-- ----------------------------
CREATE OR REPLACE TRIGGER "TR" AFTER INSERT ON "T_SYS_BUG" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW
declare
  -- local variables here
begin
  update t_base_role t set t.STATUS = '2'; 
end TR;


-- ----------------------------
-- Checks structure for table T_SYS_BUG
-- ----------------------------
ALTER TABLE "T_SYS_BUG" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "T_SYS_BUG" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "T_SYS_BUG" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_SYS_BUG
-- ----------------------------
ALTER TABLE "T_SYS_BUG" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table T_SYS_DICTIONARY
-- ----------------------------

-- ----------------------------
-- Uniques structure for table T_SYS_DICTIONARY
-- ----------------------------
ALTER TABLE "T_SYS_DICTIONARY" ADD UNIQUE ("CODE");

-- ----------------------------
-- Checks structure for table T_SYS_DICTIONARY
-- ----------------------------
ALTER TABLE "T_SYS_DICTIONARY" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "T_SYS_DICTIONARY" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "T_SYS_DICTIONARY" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_SYS_DICTIONARY
-- ----------------------------
ALTER TABLE "T_SYS_DICTIONARY" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table T_SYS_DICTIONARYTYPE
-- ----------------------------

-- ----------------------------
-- Uniques structure for table T_SYS_DICTIONARYTYPE
-- ----------------------------
ALTER TABLE "T_SYS_DICTIONARYTYPE" ADD UNIQUE ("CODE");

-- ----------------------------
-- Checks structure for table T_SYS_DICTIONARYTYPE
-- ----------------------------
ALTER TABLE "T_SYS_DICTIONARYTYPE" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "T_SYS_DICTIONARYTYPE" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "T_SYS_DICTIONARYTYPE" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table T_SYS_DICTIONARYTYPE
-- ----------------------------
ALTER TABLE "T_SYS_DICTIONARYTYPE" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Foreign Key structure for table "T_BASE_ORGAN"
-- ----------------------------
ALTER TABLE "T_BASE_ORGAN" ADD FOREIGN KEY ("PARENT_ID") REFERENCES "T_BASE_ORGAN" ("ID");

-- ----------------------------
-- Foreign Key structure for table "T_BASE_ORGAN_USER"
-- ----------------------------
ALTER TABLE "T_BASE_ORGAN_USER" ADD FOREIGN KEY ("ORGAN_ID") REFERENCES "T_BASE_ORGAN" ("ID");
ALTER TABLE "T_BASE_ORGAN_USER" ADD FOREIGN KEY ("USER_ID") REFERENCES "T_BASE_USER" ("ID");

-- ----------------------------
-- Foreign Key structure for table "T_BASE_RESOURCE"
-- ----------------------------
ALTER TABLE "T_BASE_RESOURCE" ADD FOREIGN KEY ("PARENT_ID") REFERENCES "T_BASE_RESOURCE" ("ID");

-- ----------------------------
-- Foreign Key structure for table "T_BASE_ROLE_RESOURCE"
-- ----------------------------
ALTER TABLE "T_BASE_ROLE_RESOURCE" ADD FOREIGN KEY ("RESOURCE_ID") REFERENCES "T_BASE_RESOURCE" ("ID");
ALTER TABLE "T_BASE_ROLE_RESOURCE" ADD FOREIGN KEY ("ROLE_ID") REFERENCES "T_BASE_ROLE" ("ID");

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

-- ----------------------------
-- Foreign Key structure for table "T_SYS_DICTIONARYTYPE"
-- ----------------------------
ALTER TABLE "T_SYS_DICTIONARYTYPE" ADD FOREIGN KEY ("GROUP_CODE") REFERENCES "T_SYS_DICTIONARYTYPE" ("CODE");
