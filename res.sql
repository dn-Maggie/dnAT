/*
Navicat MySQL Data Transfer

Source Server         : root-云
Source Server Version : 50716
Source Host           : 120.24.182.157:3306
Source Database       : test_class

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2017-06-07 15:56:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `res`
-- ----------------------------
DROP TABLE IF EXISTS `res`;
CREATE TABLE `res` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(8) unsigned NOT NULL,
  `resname` char(128) NOT NULL COMMENT '结果名称',
  `casecount` int(6) unsigned NOT NULL COMMENT '用例条数',
  `pass` int(6) unsigned DEFAULT NULL COMMENT 'pass的用例数',
  `fail` int(6) unsigned DEFAULT NULL COMMENT 'fail的用例数目',
  `rtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '日期',
  `status` char(4) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of res
-- ----------------------------
INSERT INTO `res` VALUES ('1', '1', 'UICases-20-28-29.xls', '22', '22', '0', '2017-04-11 20:29:06', 'PASS');
INSERT INTO `res` VALUES ('2', '1', 'UICases-20-30-09.xls', '22', '13', '9', '2017-04-11 20:30:20', 'FAIL');
INSERT INTO `res` VALUES ('3', '1', 'Kitty-21-17-17.xls', '22', '21', '1', '2017-04-11 21:18:00', 'FAIL');
INSERT INTO `res` VALUES ('4', '1', 'baidu-21-34-27.xls', '0', '0', '0', '2017-04-12 21:34:35', 'PASS');
INSERT INTO `res` VALUES ('5', '1', 'UICases-10-34-06.xls', '22', '22', '0', '2017-04-13 10:34:23', 'PASS');
INSERT INTO `res` VALUES ('6', '217', 'Dongnao_BuyProduct-11-44-20.xls', '32', '32', '0', '2017-04-13 11:44:57', 'PASS');
INSERT INTO `res` VALUES ('7', '1', 'UICases-16-12-47.xls', '22', '22', '0', '2017-04-13 16:13:05', 'PASS');
INSERT INTO `res` VALUES ('8', '1', 'Dongnao_BuyProduct-16-20-38.xls', '32', '14', '18', '2017-04-13 16:21:35', 'FAIL');
INSERT INTO `res` VALUES ('9', '1', 'UICases-16-34-24.xls', '22', '16', '6', '2017-04-13 16:35:36', 'FAIL');
INSERT INTO `res` VALUES ('10', '1', 'Dongnao_BuyProduct-16-35-58.xls', '32', '28', '4', '2017-04-13 16:36:58', 'FAIL');
INSERT INTO `res` VALUES ('11', '1', 'UICases-16-39-03.xls', '22', '20', '2', '2017-04-13 16:39:48', 'FAIL');
INSERT INTO `res` VALUES ('12', '1', 'UICases-16-43-39.xls', '22', '17', '5', '2017-04-13 16:44:40', 'FAIL');
INSERT INTO `res` VALUES ('13', '1', 'UICases-16-46-57.xls', '22', '22', '0', '2017-04-13 16:47:20', 'PASS');
INSERT INTO `res` VALUES ('14', '1', 'UICases-16-53-20.xls', '22', '21', '1', '2017-04-13 16:53:47', 'FAIL');
INSERT INTO `res` VALUES ('15', '1', 'UICases-16-55-55.xls', '22', '21', '1', '2017-04-13 16:56:28', 'FAIL');
INSERT INTO `res` VALUES ('16', '1', 'Dongnao_BuyProduct-17-02-09.xls', '32', '14', '18', '2017-04-13 17:03:05', 'FAIL');
INSERT INTO `res` VALUES ('17', '1', 'tmp-17-03-20.xls', '22', '16', '6', '2017-04-13 17:04:31', 'FAIL');
INSERT INTO `res` VALUES ('18', '1', 'baidu-17-05-38.xls', '0', '0', '0', '2017-04-13 17:05:56', 'PASS');
INSERT INTO `res` VALUES ('19', '1', 'Dongnao_BuyProduct-18-18-40.xls', '32', '14', '18', '2017-04-13 18:19:22', 'FAIL');
INSERT INTO `res` VALUES ('20', '1', 'Dongnao_BuyProduct-18-20-12.xls', '32', '14', '18', '2017-04-13 18:20:54', 'FAIL');
INSERT INTO `res` VALUES ('21', '1', 'UICases-18-22-36.xls', '22', '22', '0', '2017-04-13 18:22:50', 'PASS');
INSERT INTO `res` VALUES ('22', '1', 'UICases-18-30-17.xls', '22', '22', '0', '2017-04-13 18:30:29', 'PASS');
INSERT INTO `res` VALUES ('23', '1', 'tmp-18-55-38.xls', '22', '21', '1', '2017-04-13 18:57:26', 'FAIL');
INSERT INTO `res` VALUES ('24', '1', 'UICases-19-42-49.xls', '22', '22', '0', '2017-04-13 19:43:22', 'PASS');
INSERT INTO `res` VALUES ('25', '1', 'baidu-12-42-46.xls', '0', '0', '0', '2017-04-14 12:43:07', 'PASS');
INSERT INTO `res` VALUES ('26', '1', 'UICases-15-28-02.xls', '22', '21', '1', '2017-04-16 15:28:25', 'FAIL');
INSERT INTO `res` VALUES ('27', '1', 'UICases-19-45-50.xls', '22', '21', '1', '2017-04-16 19:46:13', 'FAIL');
INSERT INTO `res` VALUES ('28', '1', 'Dongnao_AutoTestCase-20-16-19.xls', '230', '209', '21', '2017-04-16 20:23:34', 'FAIL');
INSERT INTO `res` VALUES ('29', '1', 'Dongnao_AutoTestCase-22-22-53.xls', '230', '204', '26', '2017-04-16 22:30:35', 'FAIL');
INSERT INTO `res` VALUES ('30', '1', 'Dongnao_AutoTestCase-13-25-11.xls', '246', '115', '131', '2017-04-17 13:28:49', 'FAIL');
INSERT INTO `res` VALUES ('31', '1', 'Dongnao_AutoTestCase-13-29-35.xls', '247', '213', '34', '2017-04-17 13:38:51', 'FAIL');
INSERT INTO `res` VALUES ('32', '1', 'DN_SHOP-16-12-53.xls', '257', '231', '26', '2017-04-17 16:20:56', 'FAIL');
INSERT INTO `res` VALUES ('33', '1', 'DN_SHOP-16-52-18.xls', '257', '242', '15', '2017-04-17 17:00:00', 'FAIL');
INSERT INTO `res` VALUES ('34', '1', 'DN_SHOP-17-12-42.xls', '268', '262', '6', '2017-04-17 17:19:30', 'FAIL');
INSERT INTO `res` VALUES ('35', '1', 'DN_SHOP-17-30-03.xls', '269', '264', '5', '2017-04-17 17:36:58', 'FAIL');
INSERT INTO `res` VALUES ('36', '1', 'test20170417-17-55-09.xls', '22', '16', '6', '2017-04-17 17:56:28', 'FAIL');
INSERT INTO `res` VALUES ('37', '1', 'DN_SHOP-17-52-53.xls', '267', '252', '15', '2017-04-17 18:00:47', 'FAIL');
INSERT INTO `res` VALUES ('38', '1', 'DN_SHOP-18-08-55.xls', '267', '264', '3', '2017-04-17 18:15:27', 'FAIL');
INSERT INTO `res` VALUES ('39', '1', 'UICases-18-36-37.xls', '22', '6', '16', '2017-04-17 18:36:41', 'FAIL');
INSERT INTO `res` VALUES ('40', '1', 'DN_SHOP-18-34-26.xls', '268', '260', '8', '2017-04-17 18:41:37', 'FAIL');
INSERT INTO `res` VALUES ('41', '1', 'DN_SHOP-18-50-58.xls', '268', '264', '4', '2017-04-17 18:57:35', 'FAIL');
INSERT INTO `res` VALUES ('42', '1', 'DN_SHOP-19-03-20.xls', '274', '274', '0', '2017-04-17 19:10:04', 'PASS');
INSERT INTO `res` VALUES ('43', '1', 'DN_SHOP-20-43-11.xls', '274', '274', '0', '2017-04-17 20:49:43', 'PASS');
INSERT INTO `res` VALUES ('44', '1', 'DN_SHOP-21-06-13.xls', '274', '274', '0', '2017-04-17 21:12:59', 'PASS');
INSERT INTO `res` VALUES ('45', '1', 'Driver-21-30-30.xls', '47', '46', '1', '2017-04-17 21:31:57', 'FAIL');
INSERT INTO `res` VALUES ('46', '1', 'Register-22-18-11.xls', '13', '10', '3', '2017-04-17 22:18:43', 'FAIL');
INSERT INTO `res` VALUES ('47', '1', 'Register-22-27-24.xls', '14', '12', '2', '2017-04-17 22:27:59', 'FAIL');
INSERT INTO `res` VALUES ('48', '1', 'baidu-22-30-15.xls', '0', '0', '0', '2017-04-17 22:31:14', 'PASS');
INSERT INTO `res` VALUES ('49', '1', 'test201704117-22-30-51.xls', '0', '0', '0', '2017-04-17 22:31:37', 'PASS');
INSERT INTO `res` VALUES ('50', '1', 'test20170417-22-31-41.xls', '0', '0', '0', '2017-04-17 22:32:26', 'PASS');
INSERT INTO `res` VALUES ('51', '1', 'baidu-22-34-33.xls', '0', '0', '0', '2017-04-17 22:35:30', 'PASS');
INSERT INTO `res` VALUES ('52', '1', 'Register-22-47-49.xls', '14', '13', '1', '2017-04-17 22:48:16', 'FAIL');
INSERT INTO `res` VALUES ('53', '1', 'Register-22-48-23.xls', '14', '13', '1', '2017-04-17 22:49:00', 'FAIL');
INSERT INTO `res` VALUES ('54', '1', 'baidu-22-53-02.xls', '0', '0', '0', '2017-04-17 22:53:55', 'PASS');
INSERT INTO `res` VALUES ('55', '1', 'test201704117-22-53-19.xls', '0', '0', '0', '2017-04-17 22:54:04', 'PASS');
INSERT INTO `res` VALUES ('56', '1', 'UICases-11-01-14.xls', '22', '21', '1', '2017-04-18 11:01:32', 'FAIL');
INSERT INTO `res` VALUES ('57', '1', 'test-12-18-12.xls', '14', '13', '1', '2017-04-18 12:17:42', 'FAIL');
INSERT INTO `res` VALUES ('58', '1', 'test1-12-26-59.xls', '14', '14', '0', '2017-04-18 12:26:01', 'PASS');
INSERT INTO `res` VALUES ('59', '1', 'tmpccnn1-14-46-34.xls', '14', '9', '5', '2017-04-18 14:46:54', 'FAIL');
INSERT INTO `res` VALUES ('60', '1', 'test-gouwu-14-55-35.xls', '20', '16', '4', '2017-04-18 14:54:46', 'FAIL');
INSERT INTO `res` VALUES ('61', '1', 'test-gouwu1-15-02-08.xls', '20', '17', '3', '2017-04-18 15:01:20', 'FAIL');
INSERT INTO `res` VALUES ('62', '1', 'test12-15-09-50.xls', '21', '19', '2', '2017-04-18 15:09:19', 'FAIL');
INSERT INTO `res` VALUES ('63', '1', 'UICases-15-19-10.xls', '22', '22', '0', '2017-04-18 15:19:36', 'PASS');
INSERT INTO `res` VALUES ('64', '1', 'baidu-15-12-43.xls', '0', '0', '0', '2017-04-21 15:12:54', 'PASS');
INSERT INTO `res` VALUES ('65', '1', 'baidu-22-25-33.xls', '0', '0', '0', '2017-04-21 22:25:32', 'PASS');
INSERT INTO `res` VALUES ('66', '1', 'baidu-22-27-54.xls', '0', '0', '0', '2017-04-21 22:28:03', 'PASS');
INSERT INTO `res` VALUES ('67', '1', 'baidu-21-41-17.xls', '0', '0', '0', '2017-05-04 21:41:31', 'PASS');
INSERT INTO `res` VALUES ('68', '1', 'DN_SHOP-10-44-23.xls', '273', '237', '36', '2017-05-05 10:55:49', 'FAIL');
INSERT INTO `res` VALUES ('69', '1', 'UICases-20-58-13.xls', '22', '21', '1', '2017-05-09 20:58:36', 'FAIL');
INSERT INTO `res` VALUES ('70', '1', 'DN_SHOP-15-13-49.xls', '267', '85', '182', '2017-05-10 15:16:33', 'FAIL');
INSERT INTO `res` VALUES ('71', '217', 'Dongnao_AutoTestCase-16-45-43.xls', '244', '81', '163', '2017-05-10 16:59:08', 'FAIL');
INSERT INTO `res` VALUES ('72', '217', 'DN_SHOP-17-32-24.xls', '274', '274', '0', '2017-05-10 17:38:51', 'PASS');
INSERT INTO `res` VALUES ('73', '217', 'DN_SHOP-19-18-04.xls', '274', '274', '0', '2017-05-11 19:24:23', 'PASS');
INSERT INTO `res` VALUES ('74', '217', 'DN_SHOP-22-01-47.xls', '274', '274', '0', '2017-05-11 22:09:19', 'PASS');
INSERT INTO `res` VALUES ('75', '1', '注册20170512-15-07-11.xls', '13', '10', '3', '2017-05-12 15:07:58', 'FAIL');
INSERT INTO `res` VALUES ('76', '1', '注册20170512-15-16-23.xls', '13', '10', '3', '2017-05-12 15:17:08', 'FAIL');
INSERT INTO `res` VALUES ('77', '1', '注册20170512-15-17-25.xls', '13', '10', '3', '2017-05-12 15:18:09', 'FAIL');
INSERT INTO `res` VALUES ('78', '1', '注册20170511-15-18-53.xls', '13', '10', '3', '2017-05-12 15:19:41', 'FAIL');
INSERT INTO `res` VALUES ('79', '1', '注册20170511-15-19-21.xls', '13', '10', '3', '2017-05-12 15:20:15', 'FAIL');
INSERT INTO `res` VALUES ('80', '1', '注册20170511-17-15-27.xls', '13', '10', '3', '2017-05-12 17:16:32', 'FAIL');
INSERT INTO `res` VALUES ('81', '1', '注册20170512-23-10-15.xls', '13', '8', '5', '2017-05-16 23:13:07', 'FAIL');
INSERT INTO `res` VALUES ('82', '1', '注册20170516-23-53-58.xls', '14', '12', '2', '2017-05-16 23:55:23', 'FAIL');
INSERT INTO `res` VALUES ('83', '1', '注册20170516-23-58-14.xls', '14', '12', '2', '2017-05-16 23:59:37', 'FAIL');
INSERT INTO `res` VALUES ('84', '1', '注册-13-27-15.xls', '13', '11', '2', '2017-05-17 13:27:41', 'FAIL');
INSERT INTO `res` VALUES ('85', '1', 'UICases-17-58-18.xls', '22', '17', '5', '2017-05-17 17:59:40', 'FAIL');
INSERT INTO `res` VALUES ('86', '1', 'baidu-08-42-55.xls', '0', '0', '0', '2017-05-18 08:43:34', 'PASS');
INSERT INTO `res` VALUES ('87', '1', 'UICases-08-43-42.xls', '22', '22', '0', '2017-05-18 08:44:51', 'PASS');
INSERT INTO `res` VALUES ('88', '1', 'baidu-13-36-05.xls', '0', '0', '0', '2017-05-20 13:36:42', 'PASS');
INSERT INTO `res` VALUES ('89', '1', 'UICases-21-39-08.xls', '22', '16', '6', '2017-05-24 21:40:11', 'FAIL');
INSERT INTO `res` VALUES ('90', '1', 'baidu-21-50-14.xls', '0', '0', '0', '2017-05-24 21:50:12', 'PASS');
INSERT INTO `res` VALUES ('91', '1', 'UICases-22-44-24.xls', '22', '14', '8', '2017-05-27 22:44:44', 'FAIL');
INSERT INTO `res` VALUES ('92', '1', 'UICases-22-45-03.xls', '22', '15', '7', '2017-05-27 22:45:35', 'FAIL');
INSERT INTO `res` VALUES ('93', '1', 'test2-18-24-06.xls', '2', '2', '0', '2017-06-06 18:24:15', 'PASS');
INSERT INTO `res` VALUES ('94', '1', 'test2-14-00-34.xls', '2', '2', '0', '2017-06-07 14:00:43', 'PASS');
