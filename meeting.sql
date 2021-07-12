/*
Navicat MySQL Data Transfer

Source Server         : mysql.comp
Source Server Version : 80016
Source Host           : localhost:3306
Source Database       : meeting

Target Server Type    : MYSQL
Target Server Version : 80016
File Encoding         : 65001

Date: 2021-07-12 17:50:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `department`
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `departmentid` int(16) NOT NULL AUTO_INCREMENT COMMENT '部门编号',
  `departmentname` varchar(20) DEFAULT NULL COMMENT '部门名称',
  PRIMARY KEY (`departmentid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', '技术部');
INSERT INTO `department` VALUES ('2', '人事部');
INSERT INTO `department` VALUES ('3', '财务部');
INSERT INTO `department` VALUES ('4', '行政部');
INSERT INTO `department` VALUES ('7', '运维部');

-- ----------------------------
-- Table structure for `employee`
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `employeeid` int(16) NOT NULL AUTO_INCREMENT COMMENT '用户ID（唯一）',
  `employeename` varchar(14) DEFAULT NULL COMMENT '员工姓名',
  `username` varchar(20) DEFAULT NULL COMMENT '用户名（登录的账号）',
  `phone` varchar(20) DEFAULT NULL COMMENT '电话',
  `email` varchar(100) DEFAULT NULL COMMENT '电子邮件',
  `status` varchar(20) DEFAULT NULL COMMENT '状态（0未审批 1审批通过 2审批未通过）',
  `departmentid` int(16) DEFAULT NULL COMMENT '部门编号',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `role` varchar(12) DEFAULT NULL COMMENT '角色（1普通用户 2管理员）',
  PRIMARY KEY (`employeeid`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('8', '王晓华', 'wangxh', '13671075406', 'wang@qq.com', '1', '1', '1', '1');
INSERT INTO `employee` VALUES ('9', '林耀坤', 'linyk', '13671075406', 'yang@qq.com', '1', '2', '1', '2');
INSERT INTO `employee` VALUES ('10', '熊杰文', 'xiongjw', '134555555', 'xiong@qq.com', '1', '3', '1', '2');
INSERT INTO `employee` VALUES ('11', '王敏', 'wangmin', '1324554321', 'wangm@qq.com', '1', '4', '1', '2');
INSERT INTO `employee` VALUES ('16', '黄美玲', 'huangml', 'huangml@qq.com', '13567898765', '2', '4', '1', '2');
INSERT INTO `employee` VALUES ('17', '黄美玲', 'huangml002', 'huangml@qq.com', '13567898765', '2', '1', '1', '2');
INSERT INTO `employee` VALUES ('20', '王敏', 'wangmin002', '13454332334', 'wang@qq.com', '2', '4', '1', '2');
INSERT INTO `employee` VALUES ('21', '陈敏', 'chenm', '13559994444', 'www@aa.com', '1', '2', '1', '2');
INSERT INTO `employee` VALUES ('23', '陈晨', 'wangm', '22·2', '11', '2', '1', '1', '2');
INSERT INTO `employee` VALUES ('25', '王晓华', 'wangxh222', '111', '1', '2', '4', '1', '2');
INSERT INTO `employee` VALUES ('27', '张三', 'zhangsan', '122', '22', '2', '4', '1', '2');
INSERT INTO `employee` VALUES ('29', 'wxj', 'wxj', '123', '123@qq.com', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for `meeting`
-- ----------------------------
DROP TABLE IF EXISTS `meeting`;
CREATE TABLE `meeting` (
  `meetingid` int(16) NOT NULL AUTO_INCREMENT COMMENT '会议ID',
  `meetingname` varchar(20) DEFAULT NULL COMMENT '会议名称',
  `roomid` int(16) DEFAULT NULL COMMENT '房间号',
  `reservationistid` int(16) DEFAULT NULL COMMENT '预订会议人的ID',
  `numberofparticipants` int(16) DEFAULT NULL COMMENT '参加人数',
  `starttime` datetime DEFAULT NULL COMMENT '开始时间',
  `endtime` datetime DEFAULT NULL COMMENT '结束时间',
  `reservationtime` datetime DEFAULT NULL COMMENT '预约时间',
  `canceledtime` datetime DEFAULT NULL COMMENT '取消时间',
  `description` varchar(200) DEFAULT NULL COMMENT '会议说明',
  `status` varchar(20) DEFAULT NULL COMMENT '状态（0没取消的会议 1取消的会议）',
  `canceledreason` varchar(255) DEFAULT NULL COMMENT '取消会议原因',
  PRIMARY KEY (`meetingid`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meeting
-- ----------------------------
INSERT INTO `meeting` VALUES ('26', '测测', '7', '8', '12', '2015-01-12 13:00:00', '2015-01-12 15:00:00', '2015-01-17 23:04:18', '2015-01-11 01:06:20', null, '1', null);
INSERT INTO `meeting` VALUES ('27', '我看看', '6', '8', '12', '2015-01-13 23:06:06', '2015-01-14 03:06:08', '2015-01-10 23:06:33', '2015-01-11 01:01:42', '我看看', '1', null);
INSERT INTO `meeting` VALUES ('28', '运营会', '5', '8', '12', '2015-01-10 23:26:11', '2015-01-11 23:26:13', '2015-01-10 23:26:26', null, '测试', '0', null);
INSERT INTO `meeting` VALUES ('29', '市场部会议', '6', '8', '12', '2015-01-10 23:44:22', '2015-01-11 23:44:24', '2015-01-10 23:44:41', null, '市场部', '0', null);
INSERT INTO `meeting` VALUES ('30', '内部会议', '10', '8', '12', '2015-01-10 23:55:59', '2015-01-11 23:56:01', '2015-01-10 23:56:20', null, '内部会议', '0', null);
INSERT INTO `meeting` VALUES ('31', '我的会议', '9', '8', '12', '2015-01-12 16:33:16', '2015-01-13 16:33:18', '2015-01-11 16:35:11', null, '测试', '0', null);
INSERT INTO `meeting` VALUES ('32', '我的会议哈哈', '5', '8', '10', '2015-01-12 16:40:31', '2015-01-13 16:40:35', '2015-01-11 16:40:50', null, '', '0', null);
INSERT INTO `meeting` VALUES ('33', '哈哈', '6', '8', '12', '2015-01-12 16:41:45', '2015-01-13 16:41:48', '2015-01-11 16:42:09', '2015-01-12 11:44:57', '你好', '1', null);
INSERT INTO `meeting` VALUES ('34', '我的会议3', '8', '8', '12', '2015-01-11 16:42:36', '2015-01-13 16:42:38', '2015-01-11 16:42:51', null, '测试', '0', null);
INSERT INTO `meeting` VALUES ('35', '我的会议', '7', '8', '12', '2015-01-11 16:44:03', '2015-01-11 16:44:05', '2015-01-11 16:44:35', null, '', '0', null);
INSERT INTO `meeting` VALUES ('36', '我问问', '7', '8', '12', '2015-01-11 16:56:57', '2015-01-11 16:56:59', '2015-01-11 16:57:56', '2015-01-11 16:59:57', '地点', '1', null);
INSERT INTO `meeting` VALUES ('37', '我的会议4', '7', '8', '12', '2015-01-12 16:59:26', '2015-01-12 16:59:31', '2015-01-11 16:59:49', null, '我的会议', '0', null);
INSERT INTO `meeting` VALUES ('38', '班会', '9', '8', '12', '2015-01-15 16:46:25', '2015-01-16 18:46:53', '2015-01-12 11:49:17', '2015-01-12 11:49:37', '班会', '1', null);
INSERT INTO `meeting` VALUES ('39', '测试会议', '5', '8', '12', '2015-01-14 14:41:11', '2015-01-15 14:41:14', '2015-01-14 14:44:07', null, 'ss', '0', null);
INSERT INTO `meeting` VALUES ('49', '阿萨德', '6', '29', '11', '2021-07-13 17:24:51', '2021-07-22 17:24:54', '2021-07-12 17:25:05', null, '奥术大师', '0', null);
INSERT INTO `meeting` VALUES ('50', '阿萨德', '6', '29', '11', '2021-07-12 17:25:35', '2021-07-23 17:25:37', '2021-07-12 17:25:45', null, '阿萨德', '0', null);

-- ----------------------------
-- Table structure for `meetingparticipants`
-- ----------------------------
DROP TABLE IF EXISTS `meetingparticipants`;
CREATE TABLE `meetingparticipants` (
  `meetingid` int(16) NOT NULL COMMENT '会议ID',
  `employeeid` int(16) DEFAULT NULL COMMENT '参加会议的员工的员工ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meetingparticipants
-- ----------------------------
INSERT INTO `meetingparticipants` VALUES ('28', '13');
INSERT INTO `meetingparticipants` VALUES ('28', '23');
INSERT INTO `meetingparticipants` VALUES ('28', '27');
INSERT INTO `meetingparticipants` VALUES ('28', '16');
INSERT INTO `meetingparticipants` VALUES ('29', '16');
INSERT INTO `meetingparticipants` VALUES ('29', '13');
INSERT INTO `meetingparticipants` VALUES ('29', '8');
INSERT INTO `meetingparticipants` VALUES ('30', '15');
INSERT INTO `meetingparticipants` VALUES ('30', '13');
INSERT INTO `meetingparticipants` VALUES ('30', '8');
INSERT INTO `meetingparticipants` VALUES ('30', '23');
INSERT INTO `meetingparticipants` VALUES ('27', '8');
INSERT INTO `meetingparticipants` VALUES ('26', '8');
INSERT INTO `meetingparticipants` VALUES ('25', '8');
INSERT INTO `meetingparticipants` VALUES ('28', '8');
INSERT INTO `meetingparticipants` VALUES ('31', '8');
INSERT INTO `meetingparticipants` VALUES ('31', '17');
INSERT INTO `meetingparticipants` VALUES ('31', '23');
INSERT INTO `meetingparticipants` VALUES ('32', '8');
INSERT INTO `meetingparticipants` VALUES ('32', '17');
INSERT INTO `meetingparticipants` VALUES ('33', '15');
INSERT INTO `meetingparticipants` VALUES ('34', '8');
INSERT INTO `meetingparticipants` VALUES ('34', '17');
INSERT INTO `meetingparticipants` VALUES ('35', '8');
INSERT INTO `meetingparticipants` VALUES ('36', '9');
INSERT INTO `meetingparticipants` VALUES ('36', '8');
INSERT INTO `meetingparticipants` VALUES ('37', '8');
INSERT INTO `meetingparticipants` VALUES ('37', '23');
INSERT INTO `meetingparticipants` VALUES ('38', '11');
INSERT INTO `meetingparticipants` VALUES ('38', '16');
INSERT INTO `meetingparticipants` VALUES ('38', '20');
INSERT INTO `meetingparticipants` VALUES ('39', '13');
INSERT INTO `meetingparticipants` VALUES ('40', '17');
INSERT INTO `meetingparticipants` VALUES ('40', '23');
INSERT INTO `meetingparticipants` VALUES ('41', '36');
INSERT INTO `meetingparticipants` VALUES ('42', '29');
INSERT INTO `meetingparticipants` VALUES ('42', '36');
INSERT INTO `meetingparticipants` VALUES ('43', '10');
INSERT INTO `meetingparticipants` VALUES ('45', '29');
INSERT INTO `meetingparticipants` VALUES ('46', '29');
INSERT INTO `meetingparticipants` VALUES ('46', '36');
INSERT INTO `meetingparticipants` VALUES ('47', '29');
INSERT INTO `meetingparticipants` VALUES ('47', '36');
INSERT INTO `meetingparticipants` VALUES ('48', '29');
INSERT INTO `meetingparticipants` VALUES ('48', '36');
INSERT INTO `meetingparticipants` VALUES ('49', '17');
INSERT INTO `meetingparticipants` VALUES ('49', '23');
INSERT INTO `meetingparticipants` VALUES ('49', '29');
INSERT INTO `meetingparticipants` VALUES ('50', '17');

-- ----------------------------
-- Table structure for `meetingroom`
-- ----------------------------
DROP TABLE IF EXISTS `meetingroom`;
CREATE TABLE `meetingroom` (
  `roomid` int(16) NOT NULL AUTO_INCREMENT COMMENT '会议室ID',
  `roomnum` int(16) NOT NULL COMMENT '会议室房间号',
  `roomname` varchar(20) NOT NULL COMMENT '会议室名称',
  `capacity` int(16) DEFAULT NULL COMMENT '可容纳人数',
  `status` varchar(20) DEFAULT NULL COMMENT '状态（0可用 1被占用）',
  `description` varchar(200) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`roomid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meetingroom
-- ----------------------------
INSERT INTO `meetingroom` VALUES ('5', '101', '第一会议室', '15', '0', '公共会议室');
INSERT INTO `meetingroom` VALUES ('6', '102', '第二会议室', '5', '0', '管理部门会议室');
INSERT INTO `meetingroom` VALUES ('7', '103', '第三会议室', '12', '0', '市场部专用会议室');
INSERT INTO `meetingroom` VALUES ('8', '401', '第四会议室', '15', '0', '公共会议室');
INSERT INTO `meetingroom` VALUES ('9', '201', '第五会议室', '15', '0', '最大会议室');
INSERT INTO `meetingroom` VALUES ('10', '601', '第六会议室', '12', '0', '需要提前三天预定');
