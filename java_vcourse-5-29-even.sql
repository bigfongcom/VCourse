/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50538
Source Host           : localhost:3306
Source Database       : java_vcourse

Target Server Type    : MYSQL
Target Server Version : 50538
File Encoding         : 65001

Date: 2016-05-29 22:45:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `collect`
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cid` int(10) DEFAULT NULL COMMENT '课程ID',
  `sid` int(10) DEFAULT NULL COMMENT '用户ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES ('2', '1', '4', '2016-05-27 15:18:46');
INSERT INTO `collect` VALUES ('3', '2', '4', '2016-05-29 13:55:13');
INSERT INTO `collect` VALUES ('4', '1', '7', '2016-05-29 16:13:53');
INSERT INTO `collect` VALUES ('5', '3', '7', '2016-05-29 16:14:02');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `sid` int(10) DEFAULT NULL COMMENT '学生ID',
  `mid` int(11) DEFAULT NULL COMMENT '讲师ID',
  `courseid` int(10) DEFAULT NULL COMMENT '课程ID',
  `qustion` varchar(255) DEFAULT NULL COMMENT '问题',
  `qustion_time` datetime DEFAULT NULL COMMENT '提问时间',
  `answer` varchar(255) DEFAULT NULL COMMENT '答复',
  `answer_time` datetime DEFAULT NULL COMMENT '答复时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('2', '4', '5', '1', '作为一个初学者，这个教程很好，也很适合在上班的时候学，很容易理解~！', '2016-05-27 19:49:38', '非常实用', '2016-05-27 19:51:43');
INSERT INTO `comment` VALUES ('3', '4', '5', '1', '目前来说这个网站是我遇到学习前端最好的网站了，当然了，任何事物都不是完美的，网站上还有很多细节地方可以做的更好。加油支持你们！', '2016-05-27 19:49:45', '整体还是对于学习html和css很有用的', '2016-05-27 19:51:54');
INSERT INTO `comment` VALUES ('4', '4', '5', '1', '深入浅出，通俗易懂。', '2016-05-27 19:49:52', 'asdfsdasdsds', '2016-05-27 19:15:54');
INSERT INTO `comment` VALUES ('5', '4', null, '1', '很好，一开始就自己上手敲代码，由浅入深，一点都不吃力。', '2016-05-27 19:50:00', null, null);
INSERT INTO `comment` VALUES ('6', '5', '1', '1', '终于找到个这么有意思的学习网站，学习风格很喜欢！！', '2016-05-27 17:19:03', '学习风格很喜欢学习风格很喜欢学习风,格很喜欢学习风格很喜欢,格很喜欢学习风格很喜欢11111111111111111', '2016-05-29 15:24:55');
INSERT INTO `comment` VALUES ('7', '7', null, '3', 'ssssssssssssss', '2016-05-29 16:14:18', null, null);
INSERT INTO `comment` VALUES ('8', '7', null, '1', '很有用很有用很有用很有用很有用很有用很有用', '2016-05-29 16:14:41', null, null);
INSERT INTO `comment` VALUES ('9', '7', null, '1', '很喜欢很喜欢很喜欢很喜欢很喜欢很喜欢很喜欢很喜欢', '2016-05-29 16:15:15', null, null);

-- ----------------------------
-- Table structure for `course`
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) DEFAULT NULL COMMENT '标题',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `thumb` varchar(120) DEFAULT NULL COMMENT '详情内容',
  `create_time` datetime DEFAULT NULL COMMENT '添加时间',
  `mid` int(10) DEFAULT NULL,
  `click` int(10) DEFAULT '0' COMMENT '点击量',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', '1 CSS入门基础知识11nnnn', '本课程从最基本的概念开始讲起，步步深入，带领大家学习HTML、CSS样式基础知识，了解各种常用标签的意义以及基本用法，后半部分讲解CSS样式代码添加，为后面的案例课程打下基础。11111nnnnn', '/Uploads/12135d2f-52d3-42a0-b1e2-199b12ee7221.jpg', '2016-05-28 20:00:50', '1', '114');
INSERT INTO `course` VALUES ('2', '2 CSS基本样式讲解', '本课程对于有一定CSS2经验的伙伴，能让您系统的学习CSS3，快速的理解掌握并应用于工作之中。在学习的过程中实例演示结合在线编程完成任务的方式来学习，相信自己动手会让你理解的更快，学习效果更好！', '/Uploads/0cfdb6f9-781f-4e75-b3c6-817267ebd8bf.jpg', '2016-05-26 08:54:09', '5', '6');
INSERT INTO `course` VALUES ('3', '与MySQL的零距离接触', '本课程涵盖全部MySQL数据库的基础，主要学习MySQL数据库的基础知识、数据表的常用操作及各种约束的使用，以及综合的运用各种命令实现记录进行CURD等操作，本课程的目标就是“看得懂、学得会、做得出”，为后续的学习打下夯实的基础。', '/Uploads/eec039cc-5326-48a1-ab16-d6a52e696239.jpg', '2016-05-26 08:54:19', '7', '6');
INSERT INTO `course` VALUES ('4', '数据库设计那些事', '数据库作为大多数应用的存储组件，对程序猿所开发的程序是否可以稳定高效的运行起着至关重要的作用。本课程从数据库设计的基本理论入手结合简单的实例，简单明了的告诉您如何设计出一个简洁明了同时又高效稳定的数据库结构。', '/Uploads/95e13593-cd12-4e42-a817-1e7dc319b89a.jpg', '2016-05-26 08:54:46', '7', '3');
INSERT INTO `course` VALUES ('5', 'MySQL开发技巧（一）', '一个不懂SQL技巧的程序员不是一个好程序员。', '/Uploads/966e4dcf-3fe5-499f-ae72-aa51c8647e28.jpg', '2016-05-26 08:54:55', '7', '2');
INSERT INTO `course` VALUES ('6', '响应式布局基础', '本课讲解响应式布局的作用，并通过实例操作学会使用CSS3实现响应式布局效果。', '/Uploads/9f167f3e-2d54-442d-95f0-449e072a3381.png', '2016-05-26 08:56:48', '5', '2');
INSERT INTO `course` VALUES ('7', '响应式布局之Bootstrap', '了解Bootstrap，熟悉Bootstrap框架，学会简单使用Bootstrap', '/Uploads/fd814faf-f57a-41e2-abf8-61cd89356058.png', '2016-05-26 08:57:26', '5', '12');
INSERT INTO `course` VALUES ('8', 'CSS入门基础知识', '本课讲解CSS语法，并掌握基本选择器的使用。', '/Uploads/53553707-d694-4fa9-b0c4-a4268cd49e60.png', '2016-05-26 08:58:03', '5', '23');
INSERT INTO `course` VALUES ('9', 'CSS基本样式讲解', '本课主要讲解CSS的样式，让学生掌握基本的样式的处理', '/Uploads/6b70e032-745b-4cdf-9522-3a2be92913ad.png', '2016-05-26 08:58:30', '5', '0');
INSERT INTO `course` VALUES ('10', 'CSS盒子模型', '本课主要讲解盒子模型，让学生掌握内外边距的使用及盒子模型的设计。', '/Uploads/9e353c68-0ecf-4c0e-b152-b4e903041fbe.png', '2016-05-26 08:58:57', '5', '3');
INSERT INTO `course` VALUES ('11', 'CSS动画—页面特效', '本课讲解2D、3D以及过渡的动画效果，并且了解多列的设计。', '/Uploads/ba5e1d99-a081-43ba-ae55-4828a0ef90f2.png', '2016-05-26 08:59:16', '5', '0');
INSERT INTO `course` VALUES ('12', 'Java语言逻辑运算', '本课学习逻辑运算的种类、原理、优先级，并“与、或、非”在实际应用中使用。', '/Uploads/bafa5dd0-d271-4336-a1c3-283fd8c2d816.png', '2016-05-26 09:00:44', '4', '0');
INSERT INTO `course` VALUES ('13', '初识 MyBatis', '本课程让大家认识 MyBatis，讲解了 MyBatis 的介绍、开发准备，最简单的使用方法。主要包括 MyBatis 历史、特点、环境搭建，基本配置文件，映射配置文件以及一个小小的 hello world 程', '/Uploads/84fa6716-d547-428d-84ee-9266ce25ad19.png', '2016-05-26 09:01:10', '4', '0');
INSERT INTO `course` VALUES ('14', 'Spring 入门示例', '作为一个开源的 Java 的开发框架，如果单纯的从理论角度讲解，对于学员的帮助是很少的，因此在这里，通过一个实际的开发的例子，来加深大家对 Spring 的理解，同时提高大家实际操作和开发等动手能力。', '/Uploads/ea31b0c2-09df-4d98-9ffb-aba4515dec2c.png', '2016-05-26 09:01:33', '4', '0');
INSERT INTO `course` VALUES ('15', 'Bootstrap 精选网站详解及制作 - Bootstrap 中文网合作课程', '本套课程主要讲解由 Bootstrap 完成的精选网站的详解及制作，包含对网站的分析、Logo 的添加、导航的制作、内容区域的制作、网页底部的制作。', '/Uploads/7fa7409f-5a05-41ef-b5c5-1ec3883f5030.png', '2016-05-26 09:02:38', '5', '0');
INSERT INTO `course` VALUES ('16', 'Bootstrap 基本组件', '本套课程主要了解 Bootstrap 基本组件包含，分页与标签、徽章和巨幕以及页头与缩略图，让学员掌握 Bootstrap 基本组件的使用。', '/Uploads/864548e8-9067-415f-a60a-aeabb12b6386.png', '2016-05-29 12:17:07', '1', '1');

-- ----------------------------
-- Table structure for `manager`
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id，自增',
  `username` varchar(64) NOT NULL,
  `nickname` varchar(64) NOT NULL COMMENT '昵称',
  `password` varchar(64) NOT NULL COMMENT '密码',
  `email` varchar(64) NOT NULL COMMENT '邮箱',
  `thumb` varchar(120) DEFAULT NULL,
  `role` tinyint(2) DEFAULT NULL COMMENT '角色0:普通用户，1:vip,2:admin',
  `about` text COMMENT '简介',
  `isStart` int(2) DEFAULT '0' COMMENT '推荐为名师',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('1', 'admin', '2356578402', 'e10adc3949ba59abbe56e057f20f883e', '2356578402@qq.com', '/Uploads/04e5885e-7e42-4c4b-bdec-521731f86d2d.jpg', '1', null, '0');
INSERT INTO `manager` VALUES ('5', 'html', 'html讲师', 'e10adc3949ba59abbe56e057f20f883e', 'html@html.com', '/Uploads/32015d93-22e3-43ba-a668-2b145dff66c2.jpg', '2', 'html讲师html讲师html讲师html讲师', '1');
INSERT INTO `manager` VALUES ('3', 'admin2', 'ad2', 'e1bfd762321e409cee4ac0b6e841963c', '23565784022@qq.com', '/Uploads/1a44219c-7e45-45d6-9f20-437912c80cc7.jpg', '1', null, '0');
INSERT INTO `manager` VALUES ('4', 'java', 'javajava', 'e10adc3949ba59abbe56e057f20f883e', 'java@java.com', '/Uploads/f3c7bad4-7bda-4774-9689-879a27597663.jpg', '2', null, '0');
INSERT INTO `manager` VALUES ('6', 'android', 'android讲师', 'e10adc3949ba59abbe56e057f20f883e', 'android@android.com', '/Uploads/1a7c5c66-80a2-4e34-a0b1-26d2ae65e61b.jpg', '2', null, '0');
INSERT INTO `manager` VALUES ('7', 'mysql', 'mysql', 'e10adc3949ba59abbe56e057f20f883e', 'mysql@mysql.com', '/Uploads/808f5e75-0eb8-4ba8-aadd-3571e9aac69c.jpg', '2', null, '0');
INSERT INTO `manager` VALUES ('8', 'android', 'android2', 'e10adc3949ba59abbe56e057f20f883e', 'android@android.com', '/Uploads/8ad7e9b4-1fd9-49d8-b0da-bf89eddb3879.jpg', '2', null, '0');
INSERT INTO `manager` VALUES ('9', 'admin2', 'admin2', 'e10adc3949ba59abbe56e057f20f883e', 'admin2@admin2.com', '/Uploads/11e188ee-95bd-4bed-b9c9-1377a3522ec3.jpg', '1', 'admin2admin2admin2admin2admin2admin2admin2admin2', '0');

-- ----------------------------
-- Table structure for `record`
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cid` int(10) DEFAULT NULL COMMENT '课程ID',
  `sid` int(10) DEFAULT NULL COMMENT '用户ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES ('1', '1', '4', '2016-05-27 00:36:56');
INSERT INTO `record` VALUES ('2', '1', '5', '2016-05-27 17:00:15');
INSERT INTO `record` VALUES ('4', '1', '7', '2016-05-27 19:59:28');
INSERT INTO `record` VALUES ('5', '2', '4', '2016-05-27 22:40:27');
INSERT INTO `record` VALUES ('6', '3', '4', '2016-05-27 22:40:34');
INSERT INTO `record` VALUES ('7', '4', '4', '2016-05-27 22:40:41');
INSERT INTO `record` VALUES ('8', '5', '4', '2016-05-27 22:40:48');
INSERT INTO `record` VALUES ('9', '6', '4', '2016-05-27 22:40:55');
INSERT INTO `record` VALUES ('10', '7', '4', '2016-05-27 22:41:02');
INSERT INTO `record` VALUES ('11', '8', '4', '2016-05-27 22:41:09');
INSERT INTO `record` VALUES ('12', '3', '7', '2016-05-29 16:14:06');

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(120) DEFAULT NULL,
  `password` varchar(120) DEFAULT NULL,
  `thumb` varchar(120) DEFAULT NULL COMMENT '头像',
  `truename` varchar(120) DEFAULT NULL COMMENT '姓名',
  `sex` int(4) DEFAULT '1' COMMENT '性别1男2女',
  `mobile` varchar(120) DEFAULT NULL COMMENT '手机号',
  `about` text COMMENT '自我介绍',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('4', 'shasha', 'e10adc3949ba59abbe56e057f20f883e', '/Uploads/4cbca5f5-f2bf-4ccc-b808-8209500b47e6.jpg', '杨沙沙', '1', '13312345678', '杨沙沙杨沙沙杨沙沙杨沙沙2222');
INSERT INTO `student` VALUES ('5', 'yss', 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', null, null);
INSERT INTO `student` VALUES ('6', 'ss', 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', null, null);
INSERT INTO `student` VALUES ('7', 'shasha2', '', '/Uploads/ae03a7b9-84c0-4df4-ab9e-4ad0c87cfa46.jpg', null, '2', '13312345678', '杨沙沙杨沙沙杨沙沙杨沙沙杨沙沙杨沙沙杨沙沙');

-- ----------------------------
-- Table structure for `video`
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cid` int(10) DEFAULT NULL COMMENT '课程ID',
  `vtitle` varchar(60) DEFAULT NULL COMMENT '视频标题',
  `vdescription` varchar(255) DEFAULT NULL COMMENT '简述',
  `vpath` varchar(120) DEFAULT NULL COMMENT '视频路径',
  `vsort` int(5) DEFAULT '50' COMMENT '排序,越小排越前',
  `vctime` datetime DEFAULT NULL COMMENT '添加时间',
  `viewCount` int(5) DEFAULT '0' COMMENT '播放次数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of video
-- ----------------------------
INSERT INTO `video` VALUES ('1', '1', '1. CSS样式-背景', '1. CSS样式-背景1. CSS样式-背景1. CSS样式-背景1. CSS样式-背景', 'Uploads/d9365ff2-3ed9-4d03-9b78-9c6b2a441241.mp4', '1', '2016-05-27 11:51:19', '17');
INSERT INTO `video` VALUES ('3', '1', '2. CSS样式-文本1', '2. CSS样式-文本2. CSS样式-文本2. CSS样式-文本2. CSS样式-文本2. CSS样式-文本11vvvvvvv', 'Uploads/50663fda-f694-4e3e-ba20-edbb44901ce8.mp4', '2', '2016-05-29 12:16:50', '3');

-- ----------------------------
-- Table structure for `vrecord`
-- ----------------------------
DROP TABLE IF EXISTS `vrecord`;
CREATE TABLE `vrecord` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `v_id` int(11) DEFAULT NULL COMMENT '视频ID',
  `v_cid` int(10) DEFAULT NULL COMMENT '课程ID',
  `v_sid` int(10) DEFAULT NULL COMMENT '用户ID',
  `v_create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vrecord
-- ----------------------------
INSERT INTO `vrecord` VALUES ('1', null, '1', '4', '2016-05-27 00:36:56');
INSERT INTO `vrecord` VALUES ('2', '1', '1', '6', '2016-05-27 17:23:03');
INSERT INTO `vrecord` VALUES ('3', '1', '1', '7', '2016-05-27 19:59:38');
