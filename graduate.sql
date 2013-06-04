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
  `address` varchar(40),
  `phone` varchar(40),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8$$

-- 添加仓库warehouse数据
INSERT INTO `warehouse`(`name`, `admin`, `address`, `phone`) VALUES('天津工业大学', '王洁', '天津', '11111111111')$$
INSERT INTO `warehouse`(`name`, `admin`, `address`, `phone`) VALUES('warehouse2', 'admin2', 'address2', 'phone2')$$
INSERT INTO `warehouse`(`name`, `admin`, `address`, `phone`) VALUES('warehouse3', 'admin3', 'address3', 'phone3')$$
INSERT INTO `warehouse`(`name`, `admin`, `address`, `phone`) VALUES('warehouse4', 'admin4', 'address4', 'phone4')$$

-- 设备表
DROP TABLE IF EXISTS `device`$$
CREATE TABLE `device` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `info` varchar(90) NOT NULL,
  `type` varchar(40),
  `w_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `device_warehouse` (`w_id`),
  CONSTRAINT `device_warehouse` FOREIGN KEY (`w_id`) REFERENCES `warehouse` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8$$

-- 添加仓库device数据
INSERT INTO `device`(`name`, `info`, `type`, `w_id`) VALUES('服务器', '公司主机', '电脑', 1)$$
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
  `type` varchar(40) NOT NULL,
  `method` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$

--  添加检查项数据
INSERT INTO `inspect`(`name`, `type`, `method`) VALUES ('屏幕积灰', '积灰', '眼睛看')$$
INSERT INTO `inspect`(`name`, `type`, `method`) VALUES ('键盘积灰', '积灰', '眼睛看')$$
INSERT INTO `inspect`(`name`, `type`, `method`) VALUES ('风扇积灰', '积灰', '眼睛看')$$
INSERT INTO `inspect`(`name`, `type`, `method`) VALUES ('鼠标积灰', '积灰', '眼睛看')$$
INSERT INTO `inspect`(`name`, `type`, `method`) VALUES ('cpu速率', '速率', '软件测试')$$
INSERT INTO `inspect`(`name`, `type`, `method`) VALUES ('内存速率', '速率', '软件测试')$$
INSERT INTO `inspect`(`name`, `type`, `method`) VALUES ('硬盘速率', '速率', '软件测试')$$

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


-- 检查计划
DROP TABLE IF EXISTS `plan`$$
CREATE TABLE `plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
#   frequency 是计划执行频率，即时间间隔，故，应该是int
#   TODO 暂时废弃
#   `frequency` int(20) NOT NULL,
  `start` date NOT NULL,
  `deadline` date NOT NULL,
  `admin` varchar(40) NOT NULL,
  `info` varchar(200),
  `d_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `plan_device` (`d_id`),
  -- 一个检查计划对应与一个设备，一个设备可以有多个检查计划
  CONSTRAINT `plan_device` FOREIGN KEY (`d_id`) REFERENCES `device` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$

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
  `update` timestamp,
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
INSERT INTO `userinfo`(`username`, `password`, `name`, `telephone`, `email`, `address`) VALUES ('admin', 'admin', '胡勇刚', '15222825385', '337223471@qq.com', '天津工业大学')$$

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
-- 不再需要group
# CREATE TABLE `group` (
#   `id` int(11) NOT NULL AUTO_INCREMENT,
#   `name` varchar(80) NOT NULL UNIQUE,
#   `info` varchar(80),
#   PRIMARY KEY (`id`)
# ) ENGINE=InnoDB DEFAULT CHARSET=utf8$$

# INSERT INTO `group`(`name`, `info`) VALUES ('warehouse_group1', 'warehouse_group1')$$

-- 用户与组的关联
DROP TABLE IF EXISTS `group_userinfo`$$
# CREATE TABLE `group_userinfo` (
#   `id` int(11) NOT NULL AUTO_INCREMENT,
#   `g_id` int(11) NOT NULL,
#   `u_id` int(11) NOT NULL,
#   PRIMARY KEY (`id`),
#   KEY `group_userinfo_g` (`g_id`),
#   KEY `group_userinfo_u` (`u_id`),
#   CONSTRAINT `group_userinfo_g` FOREIGN KEY (`g_id`) REFERENCES `group` (`id`) ON UPDATE CASCADE,
#   CONSTRAINT `group_userinfo_u` FOREIGN KEY (`u_id`) REFERENCES `userinfo` (`id`) ON UPDATE CASCADE
# ) ENGINE=InnoDB DEFAULT CHARSET=utf8$$

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

-- 组与操作的关联
DROP TABLE IF EXISTS `group_operator`$$
# CREATE TABLE `group_operator` (
#   `id` int(11) NOT NULL AUTO_INCREMENT,
#   `g_id` int(11) NOT NULL,
#   `o_id` int(11) NOT NULL,
#   PRIMARY KEY (`id`),
#   KEY `group_operator_g` (`g_id`),
#   KEY `group_operator_o` (`o_id`),
#   CONSTRAINT `group_operator_g` FOREIGN KEY (`g_id`) REFERENCES `group` (`id`) ON UPDATE CASCADE,
#   CONSTRAINT `group_operator_o` FOREIGN KEY (`o_id`) REFERENCES `operator` (`id`) ON UPDATE CASCADE
# ) ENGINE=InnoDB DEFAULT CHARSET=utf8$$

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
INSERT INTO `userinfo_operator`( `u_id`, `o_id`) VALUES (1, 2)$$
INSERT INTO `userinfo_operator`( `u_id`, `o_id`) VALUES (1, 3)$$
INSERT INTO `userinfo_operator`( `u_id`, `o_id`) VALUES (1, 4)$$
INSERT INTO `userinfo_operator`( `u_id`, `o_id`) VALUES (1, 5)$$
INSERT INTO `userinfo_operator`( `u_id`, `o_id`) VALUES (1, 6)$$
