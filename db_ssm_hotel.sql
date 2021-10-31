/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : db_ssm_hotel

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2021-10-31 15:35:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门编号',
  `deptName` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `address` varchar(255) DEFAULT NULL COMMENT '部门地址',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('1', '管理部', '101', '2021-10-25 11:37:18', '管理部');
INSERT INTO `sys_dept` VALUES ('2', '市场部', '102', '2021-10-25 11:37:31', '市场部');
INSERT INTO `sys_dept` VALUES ('4', '开发部', '103', '2021-10-25 20:13:22', '开发部');
INSERT INTO `sys_dept` VALUES ('5', '测试部', '104', '2021-10-25 21:35:59', '1');
INSERT INTO `sys_dept` VALUES ('9', '技术部', '105', '2021-10-26 18:21:35', '技术部');
INSERT INTO `sys_dept` VALUES ('10', '111', '106', '2021-10-29 09:46:31', '1');

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限菜单编号',
  `pid` int(11) DEFAULT NULL COMMENT '父级菜单编号',
  `type` varchar(20) DEFAULT NULL COMMENT '菜单类型(菜单为menu，权限为permission)',
  `title` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `permissionCode` varchar(100) DEFAULT NULL COMMENT '权限编码',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `href` varchar(200) DEFAULT NULL COMMENT '菜单地址',
  `spread` int(11) DEFAULT NULL COMMENT '是否展开（1-展开 2-折叠）',
  `target` varchar(50) DEFAULT '_self',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES ('1', '0', 'menu', '系统管理', '', 'fa fa-cog', '', '1', '_self');
INSERT INTO `sys_permission` VALUES ('2', '0', 'menu', '客房管理', null, 'fa fa-home', null, '1', '_self');
INSERT INTO `sys_permission` VALUES ('3', '1', 'menu', '用户管理', null, 'fa fa-user', '/admin/toUserManager.html', '2', '_self');
INSERT INTO `sys_permission` VALUES ('4', '1', 'menu', '角色管理', null, 'fa fa-users', '/admin/toRoleManager.html', '2', '_self');
INSERT INTO `sys_permission` VALUES ('5', '1', 'menu', '权限管理', null, 'fa fa-key', '/admin/toPermissionManager.html', '2', '_self');
INSERT INTO `sys_permission` VALUES ('6', '2', 'menu', '房型管理', '', 'fa fa-university', '/admin/toRoomTypeManager.html', '1', '_self');
INSERT INTO `sys_permission` VALUES ('7', '2', 'menu', '房间管理', null, 'fa fa-hotel', '/admin/toRoomManager.html', '2', '_self');
INSERT INTO `sys_permission` VALUES ('8', '1', 'menu', '部门管理', null, 'fa fa-codepen', '/admin/toDeptManager.html', '2', '_self');
INSERT INTO `sys_permission` VALUES ('9', '0', 'menu', '报表管理', '', 'fa fa-area-chart', '', '1', '_self');
INSERT INTO `sys_permission` VALUES ('10', '9', 'menu', '月营业额报表分析', '', 'fa fa-bar-chart', '/admin/toYearOfMonthCharts.html', '0', '_self');
INSERT INTO `sys_permission` VALUES ('17', '2', 'menu', '楼层管理', '', 'fa fa-stack-overflow', '/admin/toFloorManager.html', '0', '_self');
INSERT INTO `sys_permission` VALUES ('18', '0', 'menu', '订单管理', '', 'fa fa-reorder', '', '1', '_self');
INSERT INTO `sys_permission` VALUES ('20', '18', 'menu', '预订管理', '', 'fa fa-list-alt', '/admin/toOrdersManager.html', '0', '_self');
INSERT INTO `sys_permission` VALUES ('21', '18', 'menu', '入住管理', '', 'fa fa-building', '/admin/toCheckinManager.html', '0', '_self');
INSERT INTO `sys_permission` VALUES ('22', '9', 'menu', '年营业额统计报表', '', 'fa fa-bar-chart-o', '/admin/toYearTotalPriceManager.html', '0', '_self');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色编号',
  `roleCode` varchar(50) DEFAULT NULL COMMENT '角色代码',
  `roleName` varchar(50) DEFAULT NULL COMMENT '角色名称',
  `roleDesc` varchar(255) DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', 'ROLE_USER', '系统用户', '用户必须拥有该角色才能进入系统');
INSERT INTO `sys_role` VALUES ('2', 'ROLE_SUPER', '超级管理员', '超级管理员角色，拥有所有操作权限');
INSERT INTO `sys_role` VALUES ('3', 'ROLE_SYSTEM', '系统管理员', '系统管理员');
INSERT INTO `sys_role` VALUES ('4', 'ROLE_TEST', '测试用户', '测试用户');

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission` (
  `rid` int(11) DEFAULT NULL COMMENT '角色编号',
  `pid` int(11) DEFAULT NULL COMMENT '菜单权限编号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES ('1', '2');
INSERT INTO `sys_role_permission` VALUES ('1', '7');
INSERT INTO `sys_role_permission` VALUES ('1', '9');
INSERT INTO `sys_role_permission` VALUES ('1', '14');
INSERT INTO `sys_role_permission` VALUES ('2', '1');
INSERT INTO `sys_role_permission` VALUES ('2', '3');
INSERT INTO `sys_role_permission` VALUES ('2', '4');
INSERT INTO `sys_role_permission` VALUES ('2', '5');
INSERT INTO `sys_role_permission` VALUES ('2', '8');
INSERT INTO `sys_role_permission` VALUES ('2', '2');
INSERT INTO `sys_role_permission` VALUES ('2', '6');
INSERT INTO `sys_role_permission` VALUES ('2', '7');
INSERT INTO `sys_role_permission` VALUES ('2', '17');
INSERT INTO `sys_role_permission` VALUES ('2', '9');
INSERT INTO `sys_role_permission` VALUES ('2', '10');
INSERT INTO `sys_role_permission` VALUES ('2', '22');
INSERT INTO `sys_role_permission` VALUES ('2', '18');
INSERT INTO `sys_role_permission` VALUES ('2', '20');
INSERT INTO `sys_role_permission` VALUES ('2', '21');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `userName` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(200) NOT NULL COMMENT '密码',
  `realName` varchar(50) DEFAULT NULL COMMENT '真实姓名\r\n',
  `sex` int(11) DEFAULT NULL COMMENT '性别（1-男 2-女）',
  `deptId` int(11) DEFAULT NULL COMMENT '所属部门，对应部门表主键',
  `status` int(11) DEFAULT NULL COMMENT '状态（1-可用 2-禁用）',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(50) DEFAULT NULL COMMENT '电话',
  `userType` int(11) DEFAULT NULL COMMENT '用户类型（1-超级管理员 2-普通用户）',
  `hireDate` datetime DEFAULT NULL COMMENT '入职日期',
  `createdBy` int(11) DEFAULT NULL COMMENT '创建人',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `modifyBy` int(11) DEFAULT NULL COMMENT '修改人',
  `modifyDate` datetime DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `fk_deptid` (`deptId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '$2a$10$.9AgvP/c6UeTJJ7Z89DLR.CRWByVMEH53q1eRRMVXSdCQP1CPQ006', '超级管理员', '0', '1', '1', '', null, '1', '2020-11-13 09:21:40', '1', '2020-11-13 09:21:44', '1', '2020-11-13 09:21:46', null);
INSERT INTO `sys_user` VALUES ('2', 'tom', '$2a$10$Y.kBsd.J3zbyl3/x5qRFD.M.wbEjqD09ZCnT7ILFSlNpWIST6cbme', '汤姆', '0', '2', '1', '11', '11234567890', '2', '2021-10-26 00:00:00', '1', '2021-10-26 15:21:20', '1', '2021-10-27 11:28:30', null);
INSERT INTO `sys_user` VALUES ('3', 'lucy', '$2a$10$ie4I.JQdE53lAh9sZTV7tuRMIBR7tUoiq6BuAx9kJkkdv18MXZ846', '露西', '0', '5', '1', '123@qq.como', '12345678910', '2', '2021-10-26 00:00:00', '1', '2021-10-26 18:20:46', '2', '2021-10-27 11:37:58', null);
INSERT INTO `sys_user` VALUES ('4', '冰冰', '$2a$10$PAsKCPSNK0x6pFrRbKQexO1qsirvtbk4JUD/JqsjZskp84q2pFJWC', '冰冰', '0', '9', '1', '1511464004@qq.com', '17634168715', '2', '2021-10-27 00:00:00', '2', '2021-10-27 11:47:45', '1', '2021-10-29 09:44:57', null);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `uid` int(11) DEFAULT NULL COMMENT '用户编号',
  `rid` int(11) DEFAULT NULL COMMENT '角色编号',
  KEY `fk_uid` (`uid`),
  KEY `fk_rid` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('1', '2');
INSERT INTO `sys_user_role` VALUES ('1', '3');
INSERT INTO `sys_user_role` VALUES ('2', '1');
INSERT INTO `sys_user_role` VALUES ('2', '3');
INSERT INTO `sys_user_role` VALUES ('3', '1');

-- ----------------------------
-- Table structure for t_account
-- ----------------------------
DROP TABLE IF EXISTS `t_account`;
CREATE TABLE `t_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `loginName` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '登录账号',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '登录密码',
  `realName` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '真实姓名',
  `idCard` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '身份证号码',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '电话号码',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱',
  `status` int(11) DEFAULT NULL COMMENT '状态1-可用 2-异常',
  `registTime` datetime DEFAULT NULL COMMENT '注册时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_account
-- ----------------------------
INSERT INTO `t_account` VALUES ('1', '冰冰', '$2a$10$VfQl72zKM880FCKsQQs1VO8YjQ7HruKLFe08fMJKG15k5F5CxpCP6', null, null, '17634168715', null, '1', '2021-10-29 19:33:03');

-- ----------------------------
-- Table structure for t_account_role
-- ----------------------------
DROP TABLE IF EXISTS `t_account_role`;
CREATE TABLE `t_account_role` (
  `accountId` int(11) DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_account_role
-- ----------------------------
INSERT INTO `t_account_role` VALUES ('1', '1');

-- ----------------------------
-- Table structure for t_checkin
-- ----------------------------
DROP TABLE IF EXISTS `t_checkin`;
CREATE TABLE `t_checkin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `roomTypeId` int(11) DEFAULT NULL COMMENT '所属房型',
  `roomId` bigint(20) DEFAULT NULL COMMENT '所属房间',
  `customerName` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '入住人姓名',
  `idCard` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '入住人身份证号',
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '手机号',
  `arriveDate` date DEFAULT NULL COMMENT '入住日期',
  `leaveDate` date DEFAULT NULL COMMENT '离店日期',
  `payPrice` decimal(10,2) NOT NULL COMMENT '实付金额',
  `ordersId` bigint(20) DEFAULT NULL COMMENT '关联预订订单ID',
  `status` int(11) unsigned DEFAULT NULL COMMENT '状态（1-入住中  2-已离店）',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `createdBy` int(11) DEFAULT NULL COMMENT '创建人',
  `modifyDate` datetime DEFAULT NULL COMMENT '修改时间',
  `modifyBy` int(11) DEFAULT NULL COMMENT '修改人',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`,`payPrice`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_checkin
-- ----------------------------
INSERT INTO `t_checkin` VALUES ('1', '2', '1', '小冰', '111', '12112112112', '2021-09-30', '2021-10-01', '500.00', '1', '1', '2021-10-31 12:59:48', '1', null, null, '11');
INSERT INTO `t_checkin` VALUES ('7', '3', '2', '冰冰', '131613', '12112112112', '2021-10-01', '2021-10-02', '300.00', '3', '2', '2021-10-31 14:00:54', '1', null, null, '');
INSERT INTO `t_checkin` VALUES ('8', '3', '2', '冰冰', '1215', '12112112112', '2020-10-01', '2020-10-02', '300.00', '4', '2', '2020-10-31 14:00:54', '1', null, null, null);

-- ----------------------------
-- Table structure for t_checkout
-- ----------------------------
DROP TABLE IF EXISTS `t_checkout`;
CREATE TABLE `t_checkout` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `checkOutNumber` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '退房记录编号',
  `checkInId` bigint(20) DEFAULT NULL COMMENT '关联入住ID',
  `consumePrice` decimal(10,2) DEFAULT NULL COMMENT '消费金额',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `createdBy` int(11) DEFAULT NULL COMMENT '操作人',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_checkout
-- ----------------------------
INSERT INTO `t_checkout` VALUES ('1', 'cf2a5de6f35a4acca32d87f9f128638a', '7', null, '2021-10-31 14:20:56', '1', null);

-- ----------------------------
-- Table structure for t_floor
-- ----------------------------
DROP TABLE IF EXISTS `t_floor`;
CREATE TABLE `t_floor` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `floorName` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '楼层名称',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_floor
-- ----------------------------
INSERT INTO `t_floor` VALUES ('1', '1楼', null);
INSERT INTO `t_floor` VALUES ('2', '2楼', null);
INSERT INTO `t_floor` VALUES ('3', '3楼', '11');

-- ----------------------------
-- Table structure for t_orders
-- ----------------------------
DROP TABLE IF EXISTS `t_orders`;
CREATE TABLE `t_orders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '预订编号',
  `ordersNo` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预订单号',
  `accountId` bigint(20) DEFAULT NULL COMMENT '预订人账号ID',
  `roomTypeId` int(11) DEFAULT NULL COMMENT '房型编号',
  `roomId` bigint(20) DEFAULT NULL COMMENT '房间ID',
  `reservationName` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预订人姓名',
  `idCard` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '身份证号码',
  `phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '电话号码',
  `status` int(11) DEFAULT NULL COMMENT '状态1-待确认  2-已确认 3-已入住',
  `reserveDate` datetime DEFAULT NULL COMMENT '预定时间（创建时间）',
  `arriveDate` date DEFAULT NULL COMMENT '到店时间',
  `leaveDate` date DEFAULT NULL COMMENT '离店时间',
  `reservePrice` decimal(10,2) DEFAULT NULL COMMENT '预订价格',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_orders
-- ----------------------------
INSERT INTO `t_orders` VALUES ('1', 'd007b963505840888eee4946cdb4c792', '1', '2', '1', '小冰', '111', '12112112112', '3', '2021-10-30 18:06:31', '2021-10-01', '2021-10-02', '500.00', '11');
INSERT INTO `t_orders` VALUES ('3', '14e6f31a0cc3487b93566901ddf9140a', '1', '3', '2', '冰冰', '131613', '12112112112', '4', '2021-10-31 14:00:01', '2021-10-02', '2021-10-03', '300.00', '');
INSERT INTO `t_orders` VALUES ('4', '14e6f31a0cc3487b93566901ddf9140b', '1', '3', '2', '冰冰', '123156', '1515616', '4', '2020-10-31 14:00:01', '2020-10-02', '2020-10-03', '300.00', null);

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleCode` varchar(50) DEFAULT NULL,
  `roleName` varchar(50) DEFAULT NULL,
  `roleDesc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', 'ROLE_USER', '注册用户', null);
INSERT INTO `t_role` VALUES ('2', 'ROLE_VIP', '会员用户', null);

-- ----------------------------
-- Table structure for t_room
-- ----------------------------
DROP TABLE IF EXISTS `t_room`;
CREATE TABLE `t_room` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '房间标题',
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '房间图片',
  `roomNum` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '房间编号',
  `roomTypeId` int(11) DEFAULT NULL COMMENT '房型',
  `floorId` int(11) DEFAULT NULL COMMENT '所属楼层',
  `status` int(11) DEFAULT NULL COMMENT '状态(1-可预订 2-已预订 3-已入住)',
  `roomDesc` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '房间描述',
  `roomRequirement` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '要求',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_room
-- ----------------------------
INSERT INTO `t_room` VALUES ('1', '经济双人间', '20211029/f5345f4f43494e87b5250d9ba1d74fd9.jpg', '101', '2', '1', '3', '', '1', '1');
INSERT INTO `t_room` VALUES ('2', '经济单人间', '20211029/9d3ba40a6dc84ecf8017d229672b8554.jpg', '102', '3', '1', '1', 0x3232323C696D67207372633D222F75706C6F61642F726F6F6D2D7069632F64657461696C2F32303231313032392F36343236376463656135623734393963626134373864663138373563633234342E6A70672220616C743D22756E646566696E6564223E, '102', '102');
INSERT INTO `t_room` VALUES ('3', '豪华5人间', '20211029/1e3d1bcfe8bb48a6988c189cdc5d23a8.jpg', '202', '5', '2', '1', '', '202', '202');
INSERT INTO `t_room` VALUES ('6', '豪华双人间', '20211029/5829db6f14c64117a5044abebf4afaf5.jpg', '104', '2', '1', '2', 0x313034, '104', '4');
INSERT INTO `t_room` VALUES ('8', '豪华5人间', '20211029/e811bf1699294c0485dd168408de3f1c.jpg', '301', '5', '3', '1', '', '301', '301');

-- ----------------------------
-- Table structure for t_room_type
-- ----------------------------
DROP TABLE IF EXISTS `t_room_type`;
CREATE TABLE `t_room_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '房型编号',
  `typeName` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '房型名称',
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '房型图片',
  `price` decimal(8,2) DEFAULT NULL COMMENT '参考价格',
  `liveNum` int(11) DEFAULT NULL COMMENT '可入住人数',
  `bedNum` int(11) DEFAULT NULL COMMENT '床位数',
  `roomNum` int(11) DEFAULT NULL COMMENT '房间数量',
  `reservedNum` int(11) DEFAULT NULL COMMENT '已预定数量',
  `avilableNum` int(11) DEFAULT NULL COMMENT '可住房间数',
  `livedNum` int(11) DEFAULT NULL COMMENT '已入住数量',
  `status` int(11) DEFAULT NULL COMMENT '房型状态（1-可预订 2-房型已满）',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_room_type
-- ----------------------------
INSERT INTO `t_room_type` VALUES ('2', '双人间', '20211029/0f4f8fb2b48541948051428c9c6727ca.jpg', '500.00', '2', '2', '20', '1', '19', '1', '1', '1');
INSERT INTO `t_room_type` VALUES ('3', '单人间', '20211029/18796b15b940469586027e35f9aa1130.jpg', '300.00', '1', '1', '20', '2', '20', '1', '1', '1');
INSERT INTO `t_room_type` VALUES ('5', '豪华5人套间', '20211029/d14cbc2678534aca9cd4466c822db880.jpg', '6000.00', '5', '5', '2', '0', '2', '0', '1', '2');
INSERT INTO `t_room_type` VALUES ('6', '标准间', '20211030/7a1fa1656dbf417b8a190334ba5e7356.jpg', '300.00', '2', '2', '20', '0', '20', '0', '1', '');
INSERT INTO `t_room_type` VALUES ('7', '商务间', 'images/defaultimg.jpg', '2000.00', '4', '4', '40', '0', '40', '0', '1', '');
INSERT INTO `t_room_type` VALUES ('8', '总统套房', '20211030/42cc813fff6446429e7256e246d124ad.jpg', '5000.00', '2', '2', '5', '0', '5', '0', '1', '');
