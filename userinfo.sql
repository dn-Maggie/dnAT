/*
Navicat MySQL Data Transfer

Source Server         : root-云
Source Server Version : 50716
Source Host           : 120.24.182.157:3306
Source Database       : test_class

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2017-06-07 15:55:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'userid',
  `nickname` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '昵称',
  `describe` varchar(128) CHARACTER SET utf8 DEFAULT NULL COMMENT '个人介绍',
  `username` char(16) CHARACTER SET utf8 NOT NULL COMMENT '用户名',
  `password` char(16) CHARACTER SET utf8 NOT NULL COMMENT '密码',
  PRIMARY KEY (`id`,`username`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `password` (`username`,`password`)
) ENGINE=InnoDB AUTO_INCREMENT=1201 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('1', '动脑最可爱的老师', '动脑最可爱的老师', 'dongnao01', 'dongnao');
INSERT INTO `userinfo` VALUES ('2', 'student', '动脑学院学生', 'dongnao02', 'student');
INSERT INTO `userinfo` VALUES ('3', '公用', '公共账号', 'dongnao03', 'dongnao110');
INSERT INTO `userinfo` VALUES ('209', 'perlly', '动脑学院老师', 'dongna', 'dongnao111');
INSERT INTO `userinfo` VALUES ('210', 'perlly', '动脑学院老师', 'dongnao004', 'dongnao111');
INSERT INTO `userinfo` VALUES ('211', 'perlly', '动脑学院老师', 'dongnao0dongnao0', 'dongnao111');
INSERT INTO `userinfo` VALUES ('212', 'perlly19', '动脑学院老师', 'dongnao19', 'dongnao111');
INSERT INTO `userinfo` VALUES ('213', 'perlly', '动脑学院老师', 'dongnao00', 'dongna');
INSERT INTO `userinfo` VALUES ('214', 'perlly', '动脑学院老师', 'dongnao061', 'dongnao1101');
INSERT INTO `userinfo` VALUES ('215', 'perlly', '动脑学院老师', 'dongnao07', 'dongnadongnadong');
INSERT INTO `userinfo` VALUES ('216', 'perlly', '动脑学院老师', 'dongnao08', 'dongnao111');
INSERT INTO `userinfo` VALUES ('217', 'kitty', '动脑学院老师', 'dongnao09', 'dongnao111');
INSERT INTO `userinfo` VALUES ('218', 'null', '动脑学院老师', 'dongnao12', 'donnao110');
INSERT INTO `userinfo` VALUES ('219', '', '动脑学院老师', 'dongnao13', 'dongnao110');
INSERT INTO `userinfo` VALUES ('220', 'perllyperllyperllyperllyperllyp', '动脑学院老师', 'dongnao14', 'dongnao110');
INSERT INTO `userinfo` VALUES ('221', '✑✒✍✉✁✂✃✄✆✉☎', '动脑学院老师', 'dongnao15', 'dongnao110');
INSERT INTO `userinfo` VALUES ('222', 'perlly', 'null', 'dongnao16', 'dongnao110');
INSERT INTO `userinfo` VALUES ('223', 'perlly', '动脑学院老师动脑学院老师动脑学院老师动脑学院老师动脑学院老师动脑学院老师动脑学院老师动脑学院老师动脑学院老师动脑学院老师动脑学', 'dongnao17', 'dongnao110');
INSERT INTO `userinfo` VALUES ('224', '✂✃✄✆✉☎☏', '✑✒✍✉✁✂✃✄✆✉☎☏✑✒✍✉✁✂✃✄✆✉☎☏', 'dongnao18', 'dongnao110');
INSERT INTO `userinfo` VALUES ('225', 'test', null, 'testuser', '123456');
INSERT INTO `userinfo` VALUES ('1200', 'FAIRY', '动脑学院老师', 'fairy', '123456');
