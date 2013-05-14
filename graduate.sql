delimiter $$
-- 重置数据库
DROP DATABASE IF EXISTS `graduate`$$
CREATE DATABASE `graduate`$$
USE `graduate`$$

-- 仓库表
DROP TABLE IF EXISTS `warehouse`$$
CREATE TABLE `warehouse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `admin` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8$$

-- 添加仓库warehouse数据
INSERT INTO `warehouse`(`name`, `admin`) VALUES('warehouse1', 'admin1')$$
INSERT INTO `warehouse`(`name`, `admin`) VALUES('warehouse2', 'admin2')$$
INSERT INTO `warehouse`(`name`, `admin`) VALUES('warehouse3', 'admin3')$$
INSERT INTO `warehouse`(`name`, `admin`) VALUES('warehouse4', 'admin4')$$

-- 设备表
DROP TABLE IF EXISTS `device`$$
CREATE TABLE `device` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `info` varchar(90) NOT NULL,
  `w_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `device_warehouse` (`w_id`),
  CONSTRAINT `device_warehouse` FOREIGN KEY (`w_id`) REFERENCES `warehouse` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8$$

-- 添加仓库device数据
INSERT INTO `device`(`name`, `info`, `w_id`) VALUES('device1', 'info1', 1)$$
INSERT INTO `device`(`name`, `info`, `w_id`) VALUES('device2', 'info2', 1)$$
INSERT INTO `device`(`name`, `info`, `w_id`) VALUES('device3', 'info3', 1)$$
INSERT INTO `device`(`name`, `info`, `w_id`) VALUES('device4', 'info4', 1)$$
INSERT INTO `device`(`name`, `info`, `w_id`) VALUES('device5', 'info5', 1)$$
INSERT INTO `device`(`name`, `info`, `w_id`) VALUES('device6', 'info6', 2)$$
INSERT INTO `device`(`name`, `info`, `w_id`) VALUES('device7', 'info7', 2)$$
INSERT INTO `device`(`name`, `info`, `w_id`) VALUES('device8', 'info8', 2)$$
INSERT INTO `device`(`name`, `info`, `w_id`) VALUES('device9', 'info9', 2)$$
INSERT INTO `device`(`name`, `info`, `w_id`) VALUES('device10', 'info10', 2)$$
INSERT INTO `device`(`name`, `info`, `w_id`) VALUES('device11', 'info11', 3)$$
INSERT INTO `device`(`name`, `info`, `w_id`) VALUES('device12', 'info12', 3)$$
INSERT INTO `device`(`name`, `info`, `w_id`) VALUES('device13', 'info13', 3)$$
INSERT INTO `device`(`name`, `info`, `w_id`) VALUES('device14', 'info14', 3)$$
INSERT INTO `device`(`name`, `info`, `w_id`) VALUES('device15', 'info15', 3)$$
INSERT INTO `device`(`name`, `info`, `w_id`) VALUES('device16', 'info16', 4)$$
INSERT INTO `device`(`name`, `info`, `w_id`) VALUES('device17', 'info17', 4)$$
INSERT INTO `device`(`name`, `info`, `w_id`) VALUES('device18', 'info18', 4)$$
INSERT INTO `device`(`name`, `info`, `w_id`) VALUES('device19', 'info19', 4)$$
INSERT INTO `device`(`name`, `info`, `w_id`) VALUES('device20', 'info20', 4)$$

-- 检查点(最终的检查项）
DROP TABLE IF EXISTS `inspect`$$
CREATE TABLE `inspect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$

--  添加检查项数据
INSERT INTO  `inspect`(`name`) VALUES ('inspect1')$$
INSERT INTO  `inspect`(`name`) VALUES ('inspect2')$$
INSERT INTO  `inspect`(`name`) VALUES ('inspect3')$$
INSERT INTO  `inspect`(`name`) VALUES ('inspect4')$$
INSERT INTO  `inspect`(`name`) VALUES ('inspect5')$$
INSERT INTO  `inspect`(`name`) VALUES ('inspect6')$$
INSERT INTO  `inspect`(`name`) VALUES ('inspect7')$$
INSERT INTO  `inspect`(`name`) VALUES ('inspect8')$$
INSERT INTO  `inspect`(`name`) VALUES ('inspect9')$$
INSERT INTO  `inspect`(`name`) VALUES ('inspect10')$$
INSERT INTO  `inspect`(`name`) VALUES ('inspect11')$$
INSERT INTO  `inspect`(`name`) VALUES ('inspect12')$$
INSERT INTO  `inspect`(`name`) VALUES ('inspect13')$$
INSERT INTO  `inspect`(`name`) VALUES ('inspect14')$$
INSERT INTO  `inspect`(`name`) VALUES ('inspect15')$$
INSERT INTO  `inspect`(`name`) VALUES ('inspect16')$$
INSERT INTO  `inspect`(`name`) VALUES ('inspect17')$$
INSERT INTO  `inspect`(`name`) VALUES ('inspect18')$$
INSERT INTO  `inspect`(`name`) VALUES ('inspect19')$$
INSERT INTO  `inspect`(`name`) VALUES ('inspect20')$$

-- 设备与检查点的关联（一个设备会有多个检查项，检查项被多个设备共享）
DROP TABLE IF EXISTS `device_inspect`$$
CREATE TABLE `device_inspect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `d_id` int(11) NOT NULL,
  `i_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `device_inspect_d` (`d_id`),
  KEY `device_inspect_i` (`i_id`),
  CONSTRAINT `device_inspect_i` FOREIGN KEY (`i_id`) REFERENCES `inspect` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `device_inspect_d` FOREIGN KEY (`d_id`) REFERENCES `device` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$

-- 添加device和inspect关联
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (1, 1)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (1, 2)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (1, 3)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (1, 4)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (2, 2)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (2, 3)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (2, 4)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (2, 5)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (3, 3)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (3, 4)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (3, 5)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (3, 6)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (4, 4)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (4, 5)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (4, 6)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (4, 7)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (5, 5)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (5, 6)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (5, 7)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (5, 8)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (6, 6)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (6, 7)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (6, 8)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (6, 9)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (7, 7)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (7, 8)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (7, 9)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (7, 10)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (8, 8)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (8, 9)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (8, 10)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (8, 11)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (9, 9)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (9, 10)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (9, 11)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (9, 12)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (10, 10)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (10, 11)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (10, 12)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (10, 13)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (11, 11)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (11, 12)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (11, 13)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (11, 14)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (12, 12)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (12, 13)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (12, 14)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (12, 15)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (13, 13)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (13, 14)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (13, 15)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (13, 16)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (14, 14)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (14, 15)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (14, 16)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (14, 17)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (15, 15)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (15, 16)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (15, 17)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (15, 18)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (16, 16)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (16, 17)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (16, 18)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (16, 19)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (17, 17)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (17, 18)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (17, 19)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (17, 20)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (18, 18)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (18, 19)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (18, 20)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (18, 1)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (19, 19)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (19, 20)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (19, 1)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (19, 2)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (20, 20)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (20, 1)$$
INSERT INTO `device_inspect`(`d_id`, `i_id`) VALUES (20, 2)$$

-- 检查计划
DROP TABLE IF EXISTS `plan`$$
CREATE TABLE `plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  -- frequency 是计划执行频率，即时间间隔，故，应该是int
  `frequency` int(20) NOT NULL,
  `d_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `plan_device` (`d_id`),
  -- 一个检查计划对应与一个设备，一个设备可以有多个检查计划
  CONSTRAINT `plan_device` FOREIGN KEY (`d_id`) REFERENCES `device` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$

-- 添加仓库device数据
INSERT INTO `plan`(`name`, `frequency`, `d_id`) VALUES('plan1', 10, 1)$$
INSERT INTO `plan`(`name`, `frequency`, `d_id`) VALUES('plan2', 10, 1)$$
INSERT INTO `plan`(`name`, `frequency`, `d_id`) VALUES('plan3', 10, 1)$$
INSERT INTO `plan`(`name`, `frequency`, `d_id`) VALUES('plan4', 10, 1)$$
INSERT INTO `plan`(`name`, `frequency`, `d_id`) VALUES('plan5', 10, 1)$$
INSERT INTO `plan`(`name`, `frequency`, `d_id`) VALUES('plan6', 10, 2)$$
INSERT INTO `plan`(`name`, `frequency`, `d_id`) VALUES('plan7', 10, 2)$$
INSERT INTO `plan`(`name`, `frequency`, `d_id`) VALUES('plan8', 10, 2)$$
INSERT INTO `plan`(`name`, `frequency`, `d_id`) VALUES('plan9', 10, 2)$$
INSERT INTO `plan`(`name`, `frequency`, `d_id`) VALUES('plan10', 10, 2)$$
INSERT INTO `plan`(`name`, `frequency`, `d_id`) VALUES('plan11', 10, 3)$$
INSERT INTO `plan`(`name`, `frequency`, `d_id`) VALUES('plan12', 10, 3)$$
INSERT INTO `plan`(`name`, `frequency`, `d_id`) VALUES('plan13', 10, 3)$$
INSERT INTO `plan`(`name`, `frequency`, `d_id`) VALUES('plan14', 10, 3)$$
INSERT INTO `plan`(`name`, `frequency`, `d_id`) VALUES('plan15', 10, 3)$$
INSERT INTO `plan`(`name`, `frequency`, `d_id`) VALUES('plan16', 10, 4)$$
INSERT INTO `plan`(`name`, `frequency`, `d_id`) VALUES('plan17', 10, 4)$$
INSERT INTO `plan`(`name`, `frequency`, `d_id`) VALUES('plan18', 10, 4)$$
INSERT INTO `plan`(`name`, `frequency`, `d_id`) VALUES('plan19', 10, 4)$$
INSERT INTO `plan`(`name`, `frequency`, `d_id`) VALUES('plan20', 10, 4)$$

-- 计划与检查点的关联（一个检查计划会有多个检查项，按顺序执行，计划中的检查项来源与设备的检查项）
DROP TABLE IF EXISTS `plan_inspect`$$
CREATE TABLE `plan_inspect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p_id` int(11) NOT NULL,
  `i_id` int(11) NOT NULL,
  -- 一个检查计划中，检查项的执行先后顺序
  `seat` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `plan_inspect_p` (`p_id`),
  KEY `plan_inspect_i` (`i_id`),
  CONSTRAINT `plan_inspect_i` FOREIGN KEY (`i_id`) REFERENCES `inspect` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `plan_inspect_p` FOREIGN KEY (`p_id`) REFERENCES `plan` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$

-- 添加device和inspect关联
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (1, 1, 1)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (1, 2, 2)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (1, 3, 3)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (1, 4, 4)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (2, 2, 1)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (2, 3, 2)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (2, 4, 3)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (2, 5, 4)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (3, 3, 1)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (3, 4, 2)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (3, 5, 3)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (3, 6, 4)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (4, 4, 1)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (4, 5, 2)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (4, 6, 3)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (4, 7, 4)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (5, 5, 1)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (5, 6, 2)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (5, 7, 3)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (5, 8, 4)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (6, 6, 1)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (6, 7, 2)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (6, 8, 3)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (6, 9, 4)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (7, 7, 1)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (7, 8, 2)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (7, 9, 3)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (7, 10, 4)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (8, 8, 1)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (8, 9, 2)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (8, 10, 3)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (8, 11, 4)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (9, 9, 1)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (9, 10, 2)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (9, 11, 3)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (9, 12, 4)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (10, 10, 1)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (10, 11, 2)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (10, 12, 3)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (10, 13, 4)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (11, 11, 1)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (11, 12, 2)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (11, 13, 3)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (11, 14, 4)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (12, 12, 1)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (12, 13, 2)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (12, 14, 3)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (12, 15, 4)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (13, 13, 1)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (13, 14, 2)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (13, 15, 3)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (13, 16, 4)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (14, 14, 1)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (14, 15, 2)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (14, 16, 3)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (14, 17, 4)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (15, 15, 1)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (15, 16, 2)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (15, 17, 3)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (15, 18, 4)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (16, 16, 1)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (16, 17, 2)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (16, 18, 3)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (16, 19, 4)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (17, 17, 1)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (17, 18, 2)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (17, 19, 3)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (17, 20, 4)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (18, 18, 1)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (18, 19, 2)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (18, 20, 3)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (18, 1, 4)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (19, 19, 1)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (19, 20, 2)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (19, 1, 3)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (19, 2, 4)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (20, 20, 1)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (20, 1, 2)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (20, 2, 3)$$
INSERT INTO `plan_inspect`(`p_id`, `i_id`, `seat`) VALUES (20, 3, 4)$$

-- 检查报告，每次对设备检查计划执行完之后都会有一个检查报告，由计划中每个检查项的检查结果组成
DROP TABLE IF EXISTS `report`$$
CREATE TABLE `report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  -- 检查计划开始执行时间
  `open` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  -- 检查计划结束时间
  `close` timestamp,
  `memo` varchar(500),
  `p_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `report_plan` (`p_id`),
  CONSTRAINT `report_plan` FOREIGN KEY (`p_id`) REFERENCES `plan` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$

-- 检查结果表，对于每次检查项的检查，都会有一个检查结果
DROP TABLE IF EXISTS `result`$$
CREATE TABLE `result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `info` varchar(80) NOT NULL,
  -- 检查结果是否正常
  `norm` int(1) NOT NULL,
  `r_id` int(11) NOT NULL,
  `i_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `result_report` (`r_id`),
  KEY `result_inspect` (`i_id`),
  CONSTRAINT `result_inspect` FOREIGN KEY (`i_id`) REFERENCES `inspect` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `result_report` FOREIGN KEY (`r_id`) REFERENCES `report` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$

-- 用户表
DROP TABLE IF EXISTS `userinfo`$$
CREATE TABLE `userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(80) NOT NULL UNIQUE,
  `password` varchar(80) NOT NULL,
  `name` varchar(50),
  `telephone` varchar(11),
  `email` varchar(20),
  `address` varchar(40),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$

-- 用户管理员
INSERT INTO `userinfo`(`username`, `password`) VALUES ('admin', 'admin')$$

-- 仓库，设备，计划管理员
INSERT INTO `userinfo`(`username`, `password`) VALUES ('warehouse_admin', 'admin')$$
INSERT INTO `userinfo`(`username`, `password`) VALUES ('device_admin', 'admin')$$
INSERT INTO `userinfo`(`username`, `password`) VALUES ('inspect_admin', 'admin')$$
INSERT INTO `userinfo`(`username`, `password`) VALUES ('plan_admin', 'admin')$$

-- 操作员
INSERT INTO `userinfo`(`username`, `password`) VALUES ('checker001', 'check')$$
INSERT INTO `userinfo`(`username`, `password`) VALUES ('checker002', 'check')$$
INSERT INTO `userinfo`(`username`, `password`) VALUES ('checker003', 'check')$$

-- 审查员
INSERT INTO `userinfo`(`username`, `password`) VALUES ('investigator', 'investigator')$$

-- 用户组
DROP TABLE IF EXISTS `group`$$
CREATE TABLE `group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL UNIQUE,
  `info` varchar(80),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$

INSERT INTO `group`(`name`, `info`) VALUES ('warehouse_group1', 'warehouse_group1')$$

-- 用户与组的关联
DROP TABLE IF EXISTS `group_userinfo`$$
CREATE TABLE `group_userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `g_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_userinfo_g` (`g_id`),
  KEY `group_userinfo_u` (`u_id`),
  CONSTRAINT `group_userinfo_g` FOREIGN KEY (`g_id`) REFERENCES `group` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `group_userinfo_u` FOREIGN KEY (`u_id`) REFERENCES `userinfo` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$

-- 操作表
DROP TABLE IF EXISTS `operator`$$
CREATE TABLE `operator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item` varchar(80) NOT NULL,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$

-- 添加操作数据
INSERT INTO `operator`(`item`, `name`) VALUES ('user', '用户管理')$$
INSERT INTO `operator`(`item`, `name`) VALUES ('warehouse', '仓库管理')$$
INSERT INTO `operator`(`item`, `name`) VALUES ('device', '设备管理')$$
INSERT INTO `operator`(`item`, `name`) VALUES ('plan', '计划管理')$$
INSERT INTO `operator`(`item`, `name`) VALUES ('inspect', '检查项管理')$$
INSERT INTO `operator`(`item`, `name`) VALUES ('check', '检查设备')$$
# INSERT INTO `operator`(`item`, `name`, `resource`, `operate`) VALUES ('warehouse', '查看所有仓库', '', 'info')$$
# INSERT INTO `operator`(`item`, `name`, `resource`, `operate`) VALUES ('warehouse', '添加仓库', 'add', 'save')$$
# INSERT INTO `operator`(`item`, `name`, `resource`, `operate`) VALUES ('warehouse', '修改仓库', 'edit', 'update')$$
# INSERT INTO `operator`(`item`, `name`, `resource`, `operate`) VALUES ('warehouse', '删除仓库', '', 'delete')$$
#
# INSERT INTO `operator`(`item`, `name`, `resource`, `operate`) VALUES ('device', '查看所有设备', '', 'info')$$
# INSERT INTO `operator`(`item`, `name`, `resource`, `operate`) VALUES ('device', '添加设备', 'add', 'save')$$
# INSERT INTO `operator`(`item`, `name`, `resource`, `operate`) VALUES ('device', '修改设备', 'edit', 'update')$$
# INSERT INTO `operator`(`item`, `name`, `resource`, `operate`) VALUES ('device', '删除设备', '', 'delete')$$
#
# INSERT INTO `operator`(`item`, `name`, `resource`, `operate`) VALUES ('inspect', '查看所有检查项', '', 'info')$$
# INSERT INTO `operator`(`item`, `name`, `resource`, `operate`) VALUES ('inspect', '添加检查项', 'add', 'save')$$
# INSERT INTO `operator`(`item`, `name`, `resource`, `operate`) VALUES ('inspect', '修改检查项', 'edit', 'update')$$
# INSERT INTO `operator`(`item`, `name`, `resource`, `operate`) VALUES ('inspect', '删除检查项', '', 'delete')$$
#
# INSERT INTO `operator`(`item`, `name`, `resource`, `operate`) VALUES ('plan', '查看所有检查计划', '', 'info')$$
# INSERT INTO `operator`(`item`, `name`, `resource`, `operate`) VALUES ('plan', '添加检查计划', 'add', 'save')$$
# INSERT INTO `operator`(`item`, `name`, `resource`, `operate`) VALUES ('plan', '修改检查计划', 'edit', 'update')$$
# INSERT INTO `operator`(`item`, `name`, `resource`, `operate`) VALUES ('plan', '删除检查计划', '', 'delete')$$
#
# INSERT INTO `operator`(`item`, `name`, `resource`, `operate`) VALUES ('user', '查看所有用户', '', 'info')$$
# INSERT INTO `operator`(`item`, `name`, `resource`, `operate`) VALUES ('user', '添加用户', 'add', 'save')$$
# INSERT INTO `operator`(`item`, `name`, `resource`, `operate`) VALUES ('user', '修改用户', 'edit', 'update')$$
# INSERT INTO `operator`(`item`, `name`, `resource`, `operate`) VALUES ('user', '删除用户', '', 'delete')$$
#
# INSERT INTO `operator`(`item`, `name`, `resource`, `operate`) VALUES ('group', '查看所有用户组', '', 'info')$$
# INSERT INTO `operator`(`item`, `name`, `resource`, `operate`) VALUES ('group', '添加用户组', 'add', 'save')$$
# INSERT INTO `operator`(`item`, `name`, `resource`, `operate`) VALUES ('group', '修改用户组', 'edit', 'update')$$
# INSERT INTO `operator`(`item`, `name`, `resource`, `operate`) VALUES ('group', '删除用户组', '', 'delete')$$
#
# INSERT INTO `operator`(`item`, `name`, `resource`, `operate`) VALUES ('operator', '查看所有操作', '', 'info')$$
# INSERT INTO `operator`(`item`, `name`, `resource`, `operate`) VALUES ('operator', '添加操作', 'add', 'save')$$
# INSERT INTO `operator`(`item`, `name`, `resource`, `operate`) VALUES ('operator', '修改操作', 'edit', 'update')$$
# INSERT INTO `operator`(`item`, `name`, `resource`, `operate`) VALUES ('operator', '删除操作', '', 'delete')$$
#
# INSERT INTO `operator`(`item`, `name`, `resource`, `operate`) VALUES ('check', '查看所有检查计划', '', 'info')$$
# INSERT INTO `operator`(`item`, `name`, `resource`, `operate`) VALUES ('check', '添加检查结果', 'check', 'update')$$

-- 组与操作的关联
DROP TABLE IF EXISTS `group_operator`$$
CREATE TABLE `group_operator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `g_id` int(11) NOT NULL,
  `o_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_operator_g` (`g_id`),
  KEY `group_operator_o` (`o_id`),
  CONSTRAINT `group_operator_g` FOREIGN KEY (`g_id`) REFERENCES `group` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `group_operator_o` FOREIGN KEY (`o_id`) REFERENCES `operator` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$

-- 用户与操作的关联
DROP TABLE IF EXISTS `userinfo_operator`$$
CREATE TABLE `userinfo_operator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) NOT NULL,
  `o_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userinfo_operator_u` (`u_id`),
  KEY userinfo_operator_o (`o_id`),
  CONSTRAINT `userinfo_operator_u` FOREIGN KEY (`u_id`) REFERENCES `userinfo` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `userinfo_operator_o` FOREIGN KEY (`o_id`) REFERENCES `operator` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$

INSERT INTO `userinfo_operator`( `u_id`, `o_id`) VALUES (1, 1)$$
