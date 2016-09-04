/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50538
Source Host           : localhost:3306
Source Database       : java_vcourse

Target Server Type    : MYSQL
Target Server Version : 50538
File Encoding         : 65001

Date: 2016-09-04 15:40:08
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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES ('7', '17', '4', '2016-05-30 16:08:07');

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
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------

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
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('17', '响应式布局基础', '本课讲解响应式布局的作用，并通过实例操作学会使用CSS3实现响应式布局效果。', '/Uploads/fbfb8090-a507-4cf3-b6e0-2940fb16b1a6.png', '2016-05-31 12:04:50', '7', '47');
INSERT INTO `course` VALUES ('20', 'CSS基本样式讲解', '本课主要讲解CSS的样式，让学生掌握基本的样式的处理', '/Uploads/2c190f63-054a-4349-9df6-689aa2d2d590.png', '2016-05-31 18:04:21', '7', '4');
INSERT INTO `course` VALUES ('25', 'CSS入门基础知识', '本课讲解CSS语法，并掌握基本选择器的使用。', '/Uploads/319da976-5911-4d1f-a873-64439100279b.png', '2016-05-31 18:01:18', '10', '0');
INSERT INTO `course` VALUES ('26', '响应式布局之Bootstrap', '了解Bootstrap，熟悉Bootstrap框架，学会简单使用Bootstrap', '/Uploads/926010a4-7b81-411c-99b3-5adecebc841d.png', '2016-05-31 18:00:16', '10', '1');
INSERT INTO `course` VALUES ('22', 'CSS动画—页面特效', '本课讲解2D、3D以及过渡的动画效果，并且了解多列的设计。', '/Uploads/1e0858ef-9aad-4ea3-a61d-e0c837dc70ad.png', '2016-05-31 18:03:24', '10', '0');
INSERT INTO `course` VALUES ('23', 'Java语言逻辑运算', '本课学习逻辑运算的种类、原理、优先级，并“与、或、非”在实际应用中使用。', '/Uploads/e1d5f57f-50f3-4926-ba32-79fcb17ca12c.png', '2016-05-31 18:02:40', '10', '0');

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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('1', 'admin', '2356578402', 'e10adc3949ba59abbe56e057f20f883e', '2356578402@qq.com', '/Uploads/04e5885e-7e42-4c4b-bdec-521731f86d2d.jpg', '1', null, '0');
INSERT INTO `manager` VALUES ('7', 'mysql', 'mysql', 'e10adc3949ba59abbe56e057f20f883e', 'mysql@mysql.com', '/Uploads/5c215fdb-f109-4388-a5c2-843bc07ecffe.png', '2', '', '0');
INSERT INTO `manager` VALUES ('10', 'xubinbin', 'xu', 'e10adc3949ba59abbe56e057f20f883e', '123@qq.com', '/Uploads/01d14840-e068-49ba-9282-482b9ca459ab.png', '2', '', '1');

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
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES ('15', '17', '5', '2016-05-31 12:12:30');
INSERT INTO `record` VALUES ('14', '17', '4', '2016-05-30 13:29:22');

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
INSERT INTO `student` VALUES ('4', 'shasha', 'e10adc3949ba59abbe56e057f20f883e', '/Uploads/b8b71767-3f64-4fc2-a489-24b26841f4b3.png', '沙沙', '2', '13312345678', '关于我');
INSERT INTO `student` VALUES ('5', 'yss', 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', null, null);

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of video
-- ----------------------------
INSERT INTO `video` VALUES ('4', '17', '1. 响应式布局介绍', '11111', 'Uploads/cead556e-f325-404c-b1df-a7d9ac59ca8d.mp4', '1', '2016-05-31 12:13:58', '6');

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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vrecord
-- ----------------------------
INSERT INTO `vrecord` VALUES ('6', '4', '17', '5', '2016-05-31 12:12:34');
INSERT INTO `vrecord` VALUES ('5', '4', '17', '4', '2016-05-30 22:23:40');
