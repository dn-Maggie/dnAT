/*
Navicat MySQL Data Transfer

Source Server         : root-云
Source Server Version : 50716
Source Host           : 120.24.182.157:3306
Source Database       : test_class

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2017-06-07 15:56:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `KW`
-- ----------------------------
DROP TABLE IF EXISTS `KW`;
CREATE TABLE `KW` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '关键字id',
  `keyword` char(16) NOT NULL COMMENT '关键字',
  `type` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '关键字类型',
  `describes` varchar(256) DEFAULT 'null' COMMENT '关键字描述',
  `uses` varchar(256) DEFAULT 'null' COMMENT '使用方法',
  PRIMARY KEY (`id`,`keyword`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of KW
-- ----------------------------
INSERT INTO `KW` VALUES ('1', 'openBrowser', '1', '打开浏览器', 'openBrowser(参数1：浏览器Chrome、ff、IE ；参数2：浏览器位置，默认安装可以不写；参数3：driver文件位置：默认可不填)');
INSERT INTO `KW` VALUES ('2', 'getUrl', '1', '打开网址', 'getURL(参数1：URL需要以http开头，例如http://www.baidu.com) ');
INSERT INTO `KW` VALUES ('3', 'clickElement', '1', '点击元素', 'clickElement(参数1：元素定位的xPath)');
INSERT INTO `KW` VALUES ('4', 'inputText', '1', '输入文本', 'inputText(参数1:元素定位的xPath； 参数2:要输入的值value)');
INSERT INTO `KW` VALUES ('5', 'getText', '1', '获取元素的text文本', 'getText(参数1：要回去的文本元素的xPath)；注：(获取元素的text属性值，并保存为text系统变量)');
INSERT INTO `KW` VALUES ('6', 'setValue', '1', '保存变量', 'setValue(参数1：变量名，后面可以用{变量名}使用；参数2：变量值，字符串，也可以引用变量aaa{text})');
INSERT INTO `KW` VALUES ('7', 'checkPoint', '1', '设置校验点', 'checkPoint(参数1：变量名，使用系统变量或者setValue设置的变量；参数2：校验方法equals、unequals、contains ；参数3：期望值，可引用变量；参数4：成功的提示；参数5：失败的提示)');
INSERT INTO `KW` VALUES ('8', 'equals', '1', '相等', '校验参数值和期望值相等');
INSERT INTO `KW` VALUES ('9', 'unequals', '1', '不相等', '校验参数值和期望值不相等');
INSERT INTO `KW` VALUES ('10', 'contains', '1', '包含', '校验参数值包含期望值');
INSERT INTO `KW` VALUES ('11', 'sleep', '1', '等待程序运行', 'sleep(参数1：5000，这里填数字，注意单位是ms哦)');
INSERT INTO `KW` VALUES ('12', 'selectiFrame', '1', '选定iFrame', 'selectiFrame(参数1：iFrame的定位字段，可以是id、name、className、xPath)');
INSERT INTO `KW` VALUES ('13', 'selectNewWindow', '1', '选定新打开的页面', 'selectNewWindow(无参数)');
INSERT INTO `KW` VALUES ('14', 'closeNewWindow', '1', '关闭新打开的页面', 'closeNewWindow(无参数)');
INSERT INTO `KW` VALUES ('15', 'closeOldWindow', '1', '关闭旧页面', 'closeOldWindow(无参数。选定新页面后，关闭之前的页面)');
INSERT INTO `KW` VALUES ('16', 'closeBrowser', '1', '关闭浏览器', 'closeBrowser(无参数)');
INSERT INTO `KW` VALUES ('17', 'TryclickElement', '1', '尝试点击按钮', 'clickElement(参数1：需要点击元素的xPath。作用描述：尝试点击网页元素，无论成功失败，都是通过的)');
INSERT INTO `KW` VALUES ('18', 'hoverAndClick', '1', 'hover并点击按钮', 'hoverAndClick(参数1：需要获取焦点元素的xPath1 ；参数2：需要点击的元素的xPath2。作用描述：把焦点设置到元素1上，然后点击元素2)');
INSERT INTO `KW` VALUES ('19', 'inputVerify', '1', '手动输入验证码', 'inputText(无参数)');
INSERT INTO `KW` VALUES ('20', '变量', '0', '变量定义和使用', '定义：getValue；使用：{变量名})');
INSERT INTO `KW` VALUES ('21', 'text', '0', '系统文本变量', '通过getText关键字更新内容，被使用方法：{text})');
INSERT INTO `KW` VALUES ('22', 'JSInput', '1', 'JS输入文本', 'JSInput(参数1：元素的定位字段可以是id、name、class；参数2：要输入的文本内容value。作用描述：通过js给不能输入的元素输入innerHTML文本)');
INSERT INTO `KW` VALUES ('23', 'JSiFrameInput', '1', 'JS输入iframe中文本', '(JSiFrameInput：(参数1：iframe的定位id/name/class；参数2：需要输入的元素定位的id/name/class；参数3：要输入的文本value。作用描述：通过js给不能输入的元素输入innerHTML文本)');
INSERT INTO `KW` VALUES ('24', 'formSubmit', '1', '提交form表单', 'formSubmit(参数1：form表单xpath。作用描述：提交表单内容。)');
