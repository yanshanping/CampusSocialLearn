/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50705
Source Host           : localhost:3306
Source Database       : campus_social

Target Server Type    : MYSQL
Target Server Version : 50705
File Encoding         : 65001

Date: 2019-03-10 16:21:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cap_comment
-- ----------------------------
DROP TABLE IF EXISTS `cap_comment`;
CREATE TABLE `cap_comment` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `content` varchar(2000) DEFAULT NULL COMMENT '评论内容',
  `notice_id` int(4) NOT NULL COMMENT '被评论帖子ID',
  `reply_sign` int(4) DEFAULT '1' COMMENT '是否是回复，1 评论 2 回复',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='评论表';

-- ----------------------------
-- Records of cap_comment
-- ----------------------------
INSERT INTO `cap_comment` VALUES ('1', '非常棒', '4', '1', 'test1', '2019-03-10 09:22:23', '', null, '0', null);

-- ----------------------------
-- Table structure for cap_friend
-- ----------------------------
DROP TABLE IF EXISTS `cap_friend`;
CREATE TABLE `cap_friend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `user_group` varchar(50) DEFAULT NULL COMMENT '用户分组',
  `friend_id` int(11) DEFAULT NULL COMMENT '朋友ID',
  `friend_group` varchar(50) DEFAULT NULL COMMENT '好友分组',
  `friend_remark` varchar(50) DEFAULT NULL COMMENT '好友备注',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户朋友表';

-- ----------------------------
-- Records of cap_friend
-- ----------------------------
INSERT INTO `cap_friend` VALUES ('2', '1', null, '1', null, null, 'admin', '2019-03-10 12:37:50', '', null, '2');
INSERT INTO `cap_friend` VALUES ('3', '4', null, '2', null, '测试', 'test1', '2019-03-10 15:06:23', '', null, '0');
INSERT INTO `cap_friend` VALUES ('4', '1', null, '3', null, null, 'admin', '2019-03-10 15:16:04', '', null, '0');

-- ----------------------------
-- Table structure for cap_user
-- ----------------------------
DROP TABLE IF EXISTS `cap_user`;
CREATE TABLE `cap_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `login_name` varchar(30) NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_label` int(11) DEFAULT '0' COMMENT '用户标签（普通学生、学生干部、老师）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) DEFAULT '' COMMENT '密码',
  `salt` varchar(20) DEFAULT '' COMMENT '盐加密',
  `schoool` varchar(50) DEFAULT '' COMMENT '学校信息',
  `community` varchar(50) DEFAULT '' COMMENT '社团信息',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='注册用户信息表';

-- ----------------------------
-- Records of cap_user
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `blob_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) NOT NULL,
  `calendar_name` varchar(200) NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `cron_expression` varchar(200) NOT NULL,
  `time_zone_id` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('SocialScheduler', '__TASK_CLASS_NAME__1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('SocialScheduler', '__TASK_CLASS_NAME__2', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `entry_id` varchar(95) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) NOT NULL,
  `job_name` varchar(200) DEFAULT NULL,
  `job_group` varchar(200) DEFAULT NULL,
  `is_nonconcurrent` varchar(1) DEFAULT NULL,
  `requests_recovery` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `job_class_name` varchar(250) NOT NULL,
  `is_durable` varchar(1) NOT NULL,
  `is_nonconcurrent` varchar(1) NOT NULL,
  `is_update_data` varchar(1) NOT NULL,
  `requests_recovery` varchar(1) NOT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', '__TASK_CLASS_NAME__1', 'DEFAULT', null, 'com.ruoyi.project.monitor.job.util.ScheduleJob', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000017400135F5F5441534B5F50524F504552544945535F5F73720028636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200084C000E63726F6E45787072657373696F6E7400124C6A6176612F6C616E672F537472696E673B4C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C000C6D6574686F64506172616D7371007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E0787074000070707074000E302F3130202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672795461736B74000A72794E6F506172616D7374000074000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', '__TASK_CLASS_NAME__2', 'DEFAULT', null, 'com.ruoyi.project.monitor.job.util.ScheduleJob', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000017400135F5F5441534B5F50524F504552544945535F5F73720028636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200084C000E63726F6E45787072657373696F6E7400124C6A6176612F6C616E672F537472696E673B4C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C000C6D6574686F64506172616D7371007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E0787074000070707074000E302F3230202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000274000672795461736B7400087279506172616D73740002727974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('SocialScheduler', '__TASK_CLASS_NAME__1', 'DEFAULT', null, 'com.social.project.monitor.job.util.ScheduleJob', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000017400135F5F5441534B5F50524F504552544945535F5F73720029636F6D2E736F6369616C2E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200084C000E63726F6E45787072657373696F6E7400124C6A6176612F6C616E672F537472696E673B4C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C000C6D6574686F64506172616D7371007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E00097872002A636F6D2E736F6369616C2E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E0787074000070707074000E302F3130202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672795461736B74000A72794E6F506172616D7374000074000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('SocialScheduler', '__TASK_CLASS_NAME__2', 'DEFAULT', null, 'com.social.project.monitor.job.util.ScheduleJob', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000017400135F5F5441534B5F50524F504552544945535F5F73720029636F6D2E736F6369616C2E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200084C000E63726F6E45787072657373696F6E7400124C6A6176612F6C616E672F537472696E673B4C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C000C6D6574686F64506172616D7371007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E00097872002A636F6D2E736F6369616C2E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E0787074000070707074000E302F3230202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000274000672795461736B7400087279506172616D73740002727974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) NOT NULL,
  `lock_name` varchar(40) NOT NULL,
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('SocialScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('SocialScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'Thinkpad-PC1552205776755', '1552205944738', '15000');
INSERT INTO `qrtz_scheduler_state` VALUES ('SocialScheduler', 'Thinkpad-PC1552205967754', '1552206075734', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `str_prop_1` varchar(512) DEFAULT NULL,
  `str_prop_2` varchar(512) DEFAULT NULL,
  `str_prop_3` varchar(512) DEFAULT NULL,
  `int_prop_1` int(11) DEFAULT NULL,
  `int_prop_2` int(11) DEFAULT NULL,
  `long_prop_1` bigint(20) DEFAULT NULL,
  `long_prop_2` bigint(20) DEFAULT NULL,
  `dec_prop_1` decimal(13,4) DEFAULT NULL,
  `dec_prop_2` decimal(13,4) DEFAULT NULL,
  `bool_prop_1` varchar(1) DEFAULT NULL,
  `bool_prop_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `next_fire_time` bigint(13) DEFAULT NULL,
  `prev_fire_time` bigint(13) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `trigger_state` varchar(16) NOT NULL,
  `trigger_type` varchar(8) NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) DEFAULT NULL,
  `calendar_name` varchar(200) DEFAULT NULL,
  `misfire_instr` smallint(2) DEFAULT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', '__TASK_CLASS_NAME__1', 'DEFAULT', '__TASK_CLASS_NAME__1', 'DEFAULT', null, '1552097810000', '-1', '5', 'PAUSED', 'CRON', '1552097810000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000017400135F5F5441534B5F50524F504552544945535F5F73720029636F6D2E736F6369616C2E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200084C000E63726F6E45787072657373696F6E7400124C6A6176612F6C616E672F537472696E673B4C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C000C6D6574686F64506172616D7371007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E00097872002A636F6D2E736F6369616C2E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E0787074000070707074000E302F3130202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672795461736B74000A72794E6F506172616D7374000074000133740001317800);
INSERT INTO `qrtz_triggers` VALUES ('SocialScheduler', '__TASK_CLASS_NAME__1', 'DEFAULT', '__TASK_CLASS_NAME__1', 'DEFAULT', null, '1552205970000', '-1', '5', 'PAUSED', 'CRON', '1552205967000', '0', null, '2', '');
INSERT INTO `qrtz_triggers` VALUES ('SocialScheduler', '__TASK_CLASS_NAME__2', 'DEFAULT', '__TASK_CLASS_NAME__2', 'DEFAULT', null, '1552205980000', '-1', '5', 'PAUSED', 'CRON', '1552205967000', '0', null, '2', '');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(100) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES ('2', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '初始化密码 123456');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` int(11) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('100', '0', '0', '若依科技', '0', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('101', '100', '0,100', '深圳总公司', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('102', '100', '0,100', '长沙分公司', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('103', '101', '0,100,101', '研发部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('104', '101', '0,100,101', '市场部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('105', '101', '0,100,101', '测试部门', '3', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('106', '101', '0,100,101', '财务部门', '4', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('107', '101', '0,100,101', '运维部门', '5', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('108', '102', '0,100,102', '市场部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('109', '102', '0,100,102', '财务部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('1', '1', '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别男');
INSERT INTO `sys_dict_data` VALUES ('2', '2', '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别女');
INSERT INTO `sys_dict_data` VALUES ('3', '3', '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别未知');
INSERT INTO `sys_dict_data` VALUES ('4', '1', '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '显示菜单');
INSERT INTO `sys_dict_data` VALUES ('5', '2', '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES ('6', '1', '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('7', '2', '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('8', '1', '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('9', '2', '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('10', '1', '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认是');
INSERT INTO `sys_dict_data` VALUES ('11', '2', '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认否');
INSERT INTO `sys_dict_data` VALUES ('12', '1', '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知');
INSERT INTO `sys_dict_data` VALUES ('13', '2', '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '公告');
INSERT INTO `sys_dict_data` VALUES ('14', '1', '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('15', '2', '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '关闭状态');
INSERT INTO `sys_dict_data` VALUES ('16', '1', '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES ('17', '2', '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '修改操作');
INSERT INTO `sys_dict_data` VALUES ('18', '3', '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '删除操作');
INSERT INTO `sys_dict_data` VALUES ('19', '4', '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '授权操作');
INSERT INTO `sys_dict_data` VALUES ('20', '5', '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导出操作');
INSERT INTO `sys_dict_data` VALUES ('21', '6', '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导入操作');
INSERT INTO `sys_dict_data` VALUES ('22', '7', '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '强退操作');
INSERT INTO `sys_dict_data` VALUES ('23', '8', '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '生成操作');
INSERT INTO `sys_dict_data` VALUES ('24', '8', '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '清空操作');
INSERT INTO `sys_dict_data` VALUES ('25', '1', '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('26', '2', '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('27', '3', '学生动态', '3', 'sys_notice_type', '', 'success', 'Y', '0', 'admin', '2019-03-09 15:00:55', 'admin', '2019-03-09 15:01:06', '学生动态');
INSERT INTO `sys_dict_data` VALUES ('28', '1', '霹雳舞团', '1', 'sys_community_info', null, 'primary', 'Y', '0', 'admin', '2019-03-10 15:27:08', '', null, '霹雳舞团');
INSERT INTO `sys_dict_data` VALUES ('29', '2', '太极社团', '2', 'sys_community_info', '', 'primary', 'Y', '0', 'admin', '2019-03-10 15:27:29', 'admin', '2019-03-10 15:27:36', '');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES ('2', '菜单状态', 'sys_show_hide', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES ('3', '系统开关', 'sys_normal_disable', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统开关列表');
INSERT INTO `sys_dict_type` VALUES ('4', '任务状态', 'sys_job_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES ('5', '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES ('6', '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知类型列表');
INSERT INTO `sys_dict_type` VALUES ('7', '通知状态', 'sys_notice_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES ('8', '操作类型', 'sys_oper_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES ('9', '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录状态列表');
INSERT INTO `sys_dict_type` VALUES ('10', '社团信息', 'sys_community_info', '0', 'admin', '2019-03-10 15:25:14', 'admin', '2019-03-10 15:25:29', '社团信息');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT '' COMMENT '任务组名',
  `method_name` varchar(500) DEFAULT '' COMMENT '任务方法',
  `method_params` varchar(50) DEFAULT NULL COMMENT '方法参数',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES ('1', 'ryTask', '系统默认（无参）', 'ryNoParams', '', '0/10 * * * * ?', '3', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES ('2', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', '0/20 * * * * ?', '3', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `method_name` varchar(500) DEFAULT NULL COMMENT '任务方法',
  `method_params` varchar(50) DEFAULT NULL COMMENT '方法参数',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES ('1', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-03-09 10:25:30');
INSERT INTO `sys_logininfor` VALUES ('2', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-09 10:30:18');
INSERT INTO `sys_logininfor` VALUES ('3', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-09 14:32:13');
INSERT INTO `sys_logininfor` VALUES ('4', 'test', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-09 14:48:00');
INSERT INTO `sys_logininfor` VALUES ('5', 'test', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-09 14:57:03');
INSERT INTO `sys_logininfor` VALUES ('6', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-09 14:57:55');
INSERT INTO `sys_logininfor` VALUES ('7', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-09 15:04:37');
INSERT INTO `sys_logininfor` VALUES ('8', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-09 15:08:05');
INSERT INTO `sys_logininfor` VALUES ('9', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-09 15:24:46');
INSERT INTO `sys_logininfor` VALUES ('10', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-09 15:41:06');
INSERT INTO `sys_logininfor` VALUES ('11', 'test', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-09 15:41:16');
INSERT INTO `sys_logininfor` VALUES ('12', 'test1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '用户不存在/密码错误', '2019-03-09 15:47:38');
INSERT INTO `sys_logininfor` VALUES ('13', 'test1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-09 15:47:49');
INSERT INTO `sys_logininfor` VALUES ('14', 'test1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-09 15:49:08');
INSERT INTO `sys_logininfor` VALUES ('15', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-09 15:49:17');
INSERT INTO `sys_logininfor` VALUES ('16', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-09 15:49:48');
INSERT INTO `sys_logininfor` VALUES ('17', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-09 15:49:52');
INSERT INTO `sys_logininfor` VALUES ('18', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-09 15:50:32');
INSERT INTO `sys_logininfor` VALUES ('19', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-09 15:50:43');
INSERT INTO `sys_logininfor` VALUES ('20', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-09 15:51:26');
INSERT INTO `sys_logininfor` VALUES ('21', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-09 15:51:37');
INSERT INTO `sys_logininfor` VALUES ('22', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-09 15:53:26');
INSERT INTO `sys_logininfor` VALUES ('23', 'yanglingfeng', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-09 15:53:41');
INSERT INTO `sys_logininfor` VALUES ('24', 'yanglingfeng', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-09 15:54:03');
INSERT INTO `sys_logininfor` VALUES ('25', 'test1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-09 15:54:21');
INSERT INTO `sys_logininfor` VALUES ('26', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-09 16:07:03');
INSERT INTO `sys_logininfor` VALUES ('27', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-09 16:20:34');
INSERT INTO `sys_logininfor` VALUES ('28', 'test1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-09 16:20:47');
INSERT INTO `sys_logininfor` VALUES ('29', 'test1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-09 16:24:00');
INSERT INTO `sys_logininfor` VALUES ('30', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-09 16:24:04');
INSERT INTO `sys_logininfor` VALUES ('31', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-09 16:31:46');
INSERT INTO `sys_logininfor` VALUES ('32', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-09 16:32:43');
INSERT INTO `sys_logininfor` VALUES ('33', 'test1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-09 16:33:32');
INSERT INTO `sys_logininfor` VALUES ('34', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-09 16:36:06');
INSERT INTO `sys_logininfor` VALUES ('35', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-09 16:37:02');
INSERT INTO `sys_logininfor` VALUES ('36', 'test1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-09 16:37:11');
INSERT INTO `sys_logininfor` VALUES ('37', 'test1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-09 16:42:02');
INSERT INTO `sys_logininfor` VALUES ('38', 'test1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-09 16:44:40');
INSERT INTO `sys_logininfor` VALUES ('39', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-09 16:44:45');
INSERT INTO `sys_logininfor` VALUES ('40', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-09 16:44:55');
INSERT INTO `sys_logininfor` VALUES ('41', 'test1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-09 16:45:09');
INSERT INTO `sys_logininfor` VALUES ('42', 'test1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-09 16:45:12');
INSERT INTO `sys_logininfor` VALUES ('43', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-09 16:45:23');
INSERT INTO `sys_logininfor` VALUES ('44', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-09 17:12:31');
INSERT INTO `sys_logininfor` VALUES ('45', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-09 17:16:57');
INSERT INTO `sys_logininfor` VALUES ('46', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-09 17:20:41');
INSERT INTO `sys_logininfor` VALUES ('47', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-09 17:40:51');
INSERT INTO `sys_logininfor` VALUES ('48', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-09 17:43:17');
INSERT INTO `sys_logininfor` VALUES ('49', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-09 17:48:08');
INSERT INTO `sys_logininfor` VALUES ('50', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-09 17:51:28');
INSERT INTO `sys_logininfor` VALUES ('51', 'test1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-09 18:36:25');
INSERT INTO `sys_logininfor` VALUES ('52', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-09 18:57:42');
INSERT INTO `sys_logininfor` VALUES ('53', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-09 19:06:45');
INSERT INTO `sys_logininfor` VALUES ('54', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-09 19:19:50');
INSERT INTO `sys_logininfor` VALUES ('55', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-09 19:21:41');
INSERT INTO `sys_logininfor` VALUES ('56', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-03-10 10:18:06');
INSERT INTO `sys_logininfor` VALUES ('57', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-10 10:18:10');
INSERT INTO `sys_logininfor` VALUES ('58', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-10 10:36:39');
INSERT INTO `sys_logininfor` VALUES ('59', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-10 11:19:43');
INSERT INTO `sys_logininfor` VALUES ('60', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-10 11:35:48');
INSERT INTO `sys_logininfor` VALUES ('61', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-10 11:41:31');
INSERT INTO `sys_logininfor` VALUES ('62', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-10 11:56:26');
INSERT INTO `sys_logininfor` VALUES ('63', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-10 12:37:23');
INSERT INTO `sys_logininfor` VALUES ('64', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-10 12:44:33');
INSERT INTO `sys_logininfor` VALUES ('65', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-10 13:12:46');
INSERT INTO `sys_logininfor` VALUES ('66', 'test1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-10 13:12:56');
INSERT INTO `sys_logininfor` VALUES ('67', 'test1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-10 13:13:17');
INSERT INTO `sys_logininfor` VALUES ('68', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-10 13:13:21');
INSERT INTO `sys_logininfor` VALUES ('69', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-10 13:14:08');
INSERT INTO `sys_logininfor` VALUES ('70', 'test1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-10 13:14:16');
INSERT INTO `sys_logininfor` VALUES ('71', 'test1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-10 13:14:27');
INSERT INTO `sys_logininfor` VALUES ('72', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-10 13:14:31');
INSERT INTO `sys_logininfor` VALUES ('73', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-10 13:15:32');
INSERT INTO `sys_logininfor` VALUES ('74', 'test1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-10 13:15:42');
INSERT INTO `sys_logininfor` VALUES ('75', 'test1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-10 13:16:01');
INSERT INTO `sys_logininfor` VALUES ('76', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-10 13:16:08');
INSERT INTO `sys_logininfor` VALUES ('77', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-10 13:20:01');
INSERT INTO `sys_logininfor` VALUES ('78', 'test1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-10 13:27:55');
INSERT INTO `sys_logininfor` VALUES ('79', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-10 14:24:32');
INSERT INTO `sys_logininfor` VALUES ('80', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-10 14:46:13');
INSERT INTO `sys_logininfor` VALUES ('81', 'test1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-10 15:02:49');
INSERT INTO `sys_logininfor` VALUES ('82', 'test1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-10 15:06:07');
INSERT INTO `sys_logininfor` VALUES ('83', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-10 15:11:24');
INSERT INTO `sys_logininfor` VALUES ('84', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-10 15:13:31');
INSERT INTO `sys_logininfor` VALUES ('85', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-10 15:14:18');
INSERT INTO `sys_logininfor` VALUES ('86', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-10 15:17:32');
INSERT INTO `sys_logininfor` VALUES ('87', 'test1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-10 15:17:45');
INSERT INTO `sys_logininfor` VALUES ('88', 'test1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-10 15:18:19');
INSERT INTO `sys_logininfor` VALUES ('89', 'test1', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-10 15:23:58');
INSERT INTO `sys_logininfor` VALUES ('90', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-10 15:24:02');
INSERT INTO `sys_logininfor` VALUES ('91', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-10 15:31:02');
INSERT INTO `sys_logininfor` VALUES ('92', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-10 15:35:35');
INSERT INTO `sys_logininfor` VALUES ('93', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-10 15:36:59');
INSERT INTO `sys_logininfor` VALUES ('94', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-10 15:54:20');
INSERT INTO `sys_logininfor` VALUES ('95', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-10 15:54:38');
INSERT INTO `sys_logininfor` VALUES ('96', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-10 16:11:41');
INSERT INTO `sys_logininfor` VALUES ('97', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-10 16:14:51');
INSERT INTO `sys_logininfor` VALUES ('98', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-10 16:14:55');
INSERT INTO `sys_logininfor` VALUES ('99', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-10 16:16:52');
INSERT INTO `sys_logininfor` VALUES ('100', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-10 16:19:40');
INSERT INTO `sys_logininfor` VALUES ('101', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-10 16:19:49');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` int(11) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `url` varchar(200) DEFAULT '#' COMMENT '请求地址',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1080 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '1', '#', 'M', '0', '', 'fa fa-gear', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统管理目录');
INSERT INTO `sys_menu` VALUES ('2', '系统监控', '0', '2', '#', 'M', '0', '', 'fa fa-video-camera', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统监控目录');
INSERT INTO `sys_menu` VALUES ('100', '用户管理', '1', '1', '/system/user', 'C', '0', 'system:user:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户管理菜单');
INSERT INTO `sys_menu` VALUES ('101', '角色管理', '1', '2', '/system/role', 'C', '0', 'system:role:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '角色管理菜单');
INSERT INTO `sys_menu` VALUES ('102', '菜单管理', '1', '3', '/system/menu', 'C', '0', 'system:menu:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES ('103', '部门管理', '1', '4', '/system/dept', 'C', '0', 'system:dept:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '部门管理菜单');
INSERT INTO `sys_menu` VALUES ('104', '岗位管理', '1', '5', '/system/post', 'C', '0', 'system:post:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES ('105', '字典管理', '1', '6', '/system/dict', 'C', '0', 'system:dict:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '字典管理菜单');
INSERT INTO `sys_menu` VALUES ('106', '参数设置', '1', '7', '/system/config', 'C', '0', 'system:config:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '参数设置菜单');
INSERT INTO `sys_menu` VALUES ('107', '通知公告', '1', '8', '/system/notice', 'C', '0', 'system:notice:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-09 15:30:56', '通知公告菜单');
INSERT INTO `sys_menu` VALUES ('108', '日志管理', '1', '9', '#', 'M', '0', '', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '日志管理菜单');
INSERT INTO `sys_menu` VALUES ('109', '在线用户', '2', '1', '/monitor/online', 'C', '0', 'monitor:online:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '在线用户菜单');
INSERT INTO `sys_menu` VALUES ('110', '定时任务', '2', '2', '/monitor/job', 'C', '0', 'monitor:job:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '定时任务菜单');
INSERT INTO `sys_menu` VALUES ('111', '数据监控', '2', '3', '/monitor/data', 'C', '0', 'monitor:data:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '数据监控菜单');
INSERT INTO `sys_menu` VALUES ('112', '服务监控', '2', '3', '/monitor/server', 'C', '0', 'monitor:server:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '服务监控菜单');
INSERT INTO `sys_menu` VALUES ('500', '操作日志', '108', '1', '/monitor/operlog', 'C', '0', 'monitor:operlog:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作日志菜单');
INSERT INTO `sys_menu` VALUES ('501', '登录日志', '108', '2', '/monitor/logininfor', 'C', '0', 'monitor:logininfor:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录日志菜单');
INSERT INTO `sys_menu` VALUES ('1000', '用户查询', '100', '1', '#', 'F', '0', 'system:user:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1001', '用户新增', '100', '2', '#', 'F', '0', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1002', '用户修改', '100', '3', '#', 'F', '0', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1003', '用户删除', '100', '4', '#', 'F', '0', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1004', '用户导出', '100', '5', '#', 'F', '0', 'system:user:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1005', '用户导入', '100', '6', '#', 'F', '0', 'system:user:import', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1006', '重置密码', '100', '7', '#', 'F', '0', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1007', '角色查询', '101', '1', '#', 'F', '0', 'system:role:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1008', '角色新增', '101', '2', '#', 'F', '0', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1009', '角色修改', '101', '3', '#', 'F', '0', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1010', '角色删除', '101', '4', '#', 'F', '0', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1011', '角色导出', '101', '5', '#', 'F', '0', 'system:role:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1012', '菜单查询', '102', '1', '#', 'F', '0', 'system:menu:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1013', '菜单新增', '102', '2', '#', 'F', '0', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1014', '菜单修改', '102', '3', '#', 'F', '0', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1015', '菜单删除', '102', '4', '#', 'F', '0', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1016', '部门查询', '103', '1', '#', 'F', '0', 'system:dept:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1017', '部门新增', '103', '2', '#', 'F', '0', 'system:dept:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1018', '部门修改', '103', '3', '#', 'F', '0', 'system:dept:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1019', '部门删除', '103', '4', '#', 'F', '0', 'system:dept:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1020', '岗位查询', '104', '1', '#', 'F', '0', 'system:post:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1021', '岗位新增', '104', '2', '#', 'F', '0', 'system:post:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1022', '岗位修改', '104', '3', '#', 'F', '0', 'system:post:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1023', '岗位删除', '104', '4', '#', 'F', '0', 'system:post:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1024', '岗位导出', '104', '5', '#', 'F', '0', 'system:post:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1025', '字典查询', '105', '1', '#', 'F', '0', 'system:dict:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1026', '字典新增', '105', '2', '#', 'F', '0', 'system:dict:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1027', '字典修改', '105', '3', '#', 'F', '0', 'system:dict:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1028', '字典删除', '105', '4', '#', 'F', '0', 'system:dict:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1029', '字典导出', '105', '5', '#', 'F', '0', 'system:dict:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1030', '参数查询', '106', '1', '#', 'F', '0', 'system:config:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1031', '参数新增', '106', '2', '#', 'F', '0', 'system:config:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1032', '参数修改', '106', '3', '#', 'F', '0', 'system:config:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1033', '参数删除', '106', '4', '#', 'F', '0', 'system:config:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1034', '参数导出', '106', '5', '#', 'F', '0', 'system:config:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1035', '公告查询', '107', '1', '#', 'F', '0', 'system:notice:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1036', '公告新增', '107', '2', '/system/notice/add', 'F', '0', 'system:notice:add', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-09 16:08:56', '');
INSERT INTO `sys_menu` VALUES ('1037', '公告修改', '107', '3', '#', 'F', '0', 'system:notice:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1038', '公告删除', '107', '4', '#', 'F', '0', 'system:notice:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1039', '操作查询', '500', '1', '#', 'F', '0', 'monitor:operlog:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1040', '操作删除', '500', '2', '#', 'F', '0', 'monitor:operlog:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1041', '详细信息', '500', '3', '#', 'F', '0', 'monitor:operlog:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1042', '日志导出', '500', '4', '#', 'F', '0', 'monitor:operlog:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1043', '登录查询', '501', '1', '#', 'F', '0', 'monitor:logininfor:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1044', '登录删除', '501', '2', '#', 'F', '0', 'monitor:logininfor:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1045', '日志导出', '501', '3', '#', 'F', '0', 'monitor:logininfor:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1046', '在线查询', '109', '1', '#', 'F', '0', 'monitor:online:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1047', '批量强退', '109', '2', '#', 'F', '0', 'monitor:online:batchForceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1048', '单条强退', '109', '3', '#', 'F', '0', 'monitor:online:forceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1049', '任务查询', '110', '1', '#', 'F', '0', 'monitor:job:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1050', '任务新增', '110', '2', '#', 'F', '0', 'monitor:job:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1051', '任务修改', '110', '3', '#', 'F', '0', 'monitor:job:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1052', '任务删除', '110', '4', '#', 'F', '0', 'monitor:job:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1053', '状态修改', '110', '5', '#', 'F', '0', 'monitor:job:changeStatus', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1054', '任务详细', '110', '6', '#', 'F', '0', 'monitor:job:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1055', '任务导出', '110', '7', '#', 'F', '0', 'monitor:job:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1058', '评论', '1068', '1', '/system/comment', 'C', '0', 'system:comment:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2019-03-09 15:29:10', '评论菜单');
INSERT INTO `sys_menu` VALUES ('1059', '评论查询', '1058', '1', '#', 'F', '0', 'system:comment:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('1060', '评论新增', '1058', '2', '#', 'F', '0', 'system:comment:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('1061', '评论修改', '1058', '3', '#', 'F', '0', 'system:comment:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('1062', '评论删除', '1058', '4', '#', 'F', '0', 'system:comment:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('1068', '社交动态', '0', '4', '#', 'M', '0', ' ', 'fa fa-address-card', 'admin', '2019-03-09 15:27:07', '', null, '');
INSERT INTO `sys_menu` VALUES ('1069', '用户朋友', '1068', '1', '/system/friend', 'C', '0', 'system:friend:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2019-03-09 15:30:39', '用户朋友菜单');
INSERT INTO `sys_menu` VALUES ('1070', '用户朋友查询', '1069', '1', '#', 'F', '0', 'system:friend:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('1071', '用户朋友新增', '1069', '2', '#', 'F', '0', 'system:friend:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('1072', '用户朋友修改', '1069', '3', '#', 'F', '0', 'system:friend:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('1073', '用户朋友删除', '1069', '4', '#', 'F', '0', 'system:friend:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('1074', '发表动态', '1068', '1', '/system/notice/add', 'C', '0', 'system:notice:add', '#', 'admin', '2019-03-09 15:33:28', 'admin', '2019-03-09 15:34:59', '');
INSERT INTO `sys_menu` VALUES ('1079', '我的动态', '1068', '3', '/system/notice', 'C', '0', 'system:notice:view,system:notice:list', '#', 'admin', '2019-03-10 13:11:43', 'admin', '2019-03-10 13:15:28', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告3学生动态）',
  `notice_content` text COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('1', '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_notice` VALUES ('2', '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_notice` VALUES ('3', '测sbiaot', '3', '<p>测试<img src=\"http://localhost:8081/profile/upload/2019/03/09/1745745cd515ed1e5d054adcefbbf09e.jpg\" data-filename=\"2019/03/09/1745745cd515ed1e5d054adcefbbf09e.jpg\" style=\"width: 681px;\"></p>', '0', 'test1', '2019-03-09 16:42:56', '', null, null);
INSERT INTO `sys_notice` VALUES ('4', '我的第一条动态', '3', '<p>大大哇</p>', '0', 'admin', '2019-03-09 19:40:01', '', null, null);

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(255) DEFAULT '' COMMENT '请求参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('1', '个人信息', '2', 'com.ruoyi.project.system.user.controller.ProfileController.updateAvatar()', '1', 'test', null, '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '{}', '0', null, '2019-03-09 14:53:24');
INSERT INTO `sys_oper_log` VALUES ('2', '字典数据', '1', 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"学生动态\"],\"dictValue\":[\"3\"],\"dictType\":[\"sys_notice_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"success\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2019-03-09 15:00:55');
INSERT INTO `sys_oper_log` VALUES ('3', '字典数据', '2', 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', '1', 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"27\"],\"dictLabel\":[\"学生动态\"],\"dictValue\":[\"3\"],\"dictType\":[\"sys_notice_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"success\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"学生动态\"]}', '0', null, '2019-03-09 15:01:06');
INSERT INTO `sys_oper_log` VALUES ('4', '代码生成', '8', 'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()', '1', 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"cap_friend,cap_comment\"]}', '0', null, '2019-03-09 15:08:52');
INSERT INTO `sys_oper_log` VALUES ('5', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"社交动态\"],\"url\":[\"\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-address-card\"],\"visible\":[\"0\"]}', '0', null, '2019-03-09 15:27:07');
INSERT INTO `sys_oper_log` VALUES ('6', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"107\"],\"parentId\":[\"1068\"],\"menuType\":[\"C\"],\"menuName\":[\"通知公告\"],\"url\":[\"/system/notice\"],\"perms\":[\"system:notice:view\"],\"orderNum\":[\"8\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-03-09 15:27:31');
INSERT INTO `sys_oper_log` VALUES ('7', '菜单管理', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/1067', '127.0.0.1', '内网IP', '{}', '0', null, '2019-03-09 15:28:13');
INSERT INTO `sys_oper_log` VALUES ('8', '菜单管理', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/1063', '127.0.0.1', '内网IP', '{}', '0', null, '2019-03-09 15:28:25');
INSERT INTO `sys_oper_log` VALUES ('9', '菜单管理', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/1064', '127.0.0.1', '内网IP', '{}', '0', null, '2019-03-09 15:28:31');
INSERT INTO `sys_oper_log` VALUES ('10', '菜单管理', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/1065', '127.0.0.1', '内网IP', '{}', '0', null, '2019-03-09 15:28:37');
INSERT INTO `sys_oper_log` VALUES ('11', '菜单管理', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/1066', '127.0.0.1', '内网IP', '{}', '0', null, '2019-03-09 15:28:43');
INSERT INTO `sys_oper_log` VALUES ('12', '菜单管理', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/1063', '127.0.0.1', '内网IP', '{}', '0', null, '2019-03-09 15:28:49');
INSERT INTO `sys_oper_log` VALUES ('13', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1058\"],\"parentId\":[\"1068\"],\"menuType\":[\"C\"],\"menuName\":[\"评论\"],\"url\":[\"/system/comment\"],\"perms\":[\"system:comment:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-03-09 15:29:10');
INSERT INTO `sys_oper_log` VALUES ('14', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1069\"],\"parentId\":[\"1068\"],\"menuType\":[\"C\"],\"menuName\":[\"用户朋友\"],\"url\":[\"/system/friend\"],\"perms\":[\"system:friend:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-03-09 15:30:39');
INSERT INTO `sys_oper_log` VALUES ('15', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"107\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"通知公告\"],\"url\":[\"/system/notice\"],\"perms\":[\"system:notice:view\"],\"orderNum\":[\"8\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-03-09 15:30:56');
INSERT INTO `sys_oper_log` VALUES ('16', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1068\"],\"menuType\":[\"C\"],\"menuName\":[\"发表动态\"],\"url\":[\"\"],\"perms\":[\"system:notice:add\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-03-09 15:33:28');
INSERT INTO `sys_oper_log` VALUES ('17', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1036\"],\"parentId\":[\"107\"],\"menuType\":[\"C\"],\"menuName\":[\"公告新增\"],\"url\":[\"/system/notice/add\"],\"perms\":[\"system:notice:add\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-03-09 15:34:27');
INSERT INTO `sys_oper_log` VALUES ('18', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1074\"],\"parentId\":[\"1068\"],\"menuType\":[\"C\"],\"menuName\":[\"发表动态\"],\"url\":[\"/system/notice/add\"],\"perms\":[\"system:notice:add\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-03-09 15:34:59');
INSERT INTO `sys_oper_log` VALUES ('19', '角色管理', '1', 'com.ruoyi.project.system.role.controller.RoleController.addSave()', '1', 'admin', '研发部门', '/system/role/add', '127.0.0.1', '内网IP', '{\"roleName\":[\"学生\"],\"roleKey\":[\"student\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1068,1058,1059,1060,1061,1062,1069,1070,1071,1072,1073,1074\"]}', '0', null, '2019-03-09 15:36:12');
INSERT INTO `sys_oper_log` VALUES ('20', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"1\"],\"roleName\":[\"管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"管理员\"],\"menuIds\":[\"1068,1058,1059,1060,1061,1062,1069,1070,1071,1072,1073,1074\"]}', '0', null, '2019-03-09 15:36:22');
INSERT INTO `sys_oper_log` VALUES ('21', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"3\"],\"roleName\":[\"学生\"],\"roleKey\":[\"student\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1068,1058,1059,1060,1061,1062,1069,1070,1071,1072,1073,1074\"]}', '0', null, '2019-03-09 15:37:00');
INSERT INTO `sys_oper_log` VALUES ('22', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"3\"],\"roleName\":[\"学生\"],\"roleKey\":[\"student\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,107,1035,1036,1037,1038,1068,1058,1059,1060,1061,1062,1069,1070,1071,1072,1073,1074\"]}', '0', null, '2019-03-09 15:40:31');
INSERT INTO `sys_oper_log` VALUES ('23', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'yanglingfeng', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"3\"],\"roleName\":[\"学生\"],\"roleKey\":[\"student\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1068,1058,1059,1060,1061,1062,1069,1070,1071,1072,1073,1074\"]}', '0', null, '2019-03-09 15:54:00');
INSERT INTO `sys_oper_log` VALUES ('24', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1036\"],\"parentId\":[\"107\"],\"menuType\":[\"F\"],\"menuName\":[\"公告新增\"],\"url\":[\"/system/notice/add\"],\"perms\":[\"system:notice:add\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-03-09 16:07:38');
INSERT INTO `sys_oper_log` VALUES ('25', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1036\"],\"parentId\":[\"107\"],\"menuType\":[\"C\"],\"menuName\":[\"公告新增\"],\"url\":[\"/system/notice/add\"],\"perms\":[\"system:notice:add\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-03-09 16:07:50');
INSERT INTO `sys_oper_log` VALUES ('26', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1036\"],\"parentId\":[\"107\"],\"menuType\":[\"F\"],\"menuName\":[\"公告新增\"],\"url\":[\"\"],\"perms\":[\"system:notice:add\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-03-09 16:08:56');
INSERT INTO `sys_oper_log` VALUES ('27', '通知公告', '1', 'com.ruoyi.project.system.notice.controller.NoticeController.addSave()', '1', 'test1', null, '/system/notice/add', '127.0.0.1', '内网IP', '{\"noticeTitle\":[\"测试\"],\"noticeContent\":[\"<p>测试<img src=\\\"http://localhost:8081/profile/upload/2019/03/09/740ed3ebcb18161aec448e851b9d848b.jpg\\\" data-filename=\\\"2019/03/09/740ed3ebcb18161aec448e851b9d848b.jpg\\\" style=\\\"width: 130px;\\\"></p>\"],\"status\":[\"0\"]}', '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'notice_type\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.project.system.notice.mapper.NoticeMapper.insertNotice-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_notice (     notice_title,            notice_content,       status,             create_by,      create_time    )values(     ?,            ?,       ?,             ?,      sysdate()   )\r\n### Cause: java.sql.SQLException: Field \'notice_type\' doesn\'t have a default value\n; Field \'notice_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'notice_type\' doesn\'t have a default value', '2019-03-09 16:37:39');
INSERT INTO `sys_oper_log` VALUES ('28', '个人信息', '2', 'com.ruoyi.project.system.user.controller.ProfileController.update()', '1', 'admin', '研发部门', '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"loginName\":[\"admin\"],\"dept.deptName\":[\"研发部门\"],\"userName\":[\"若依\"],\"email\":[\"13146950818@qq.com\"],\"phonenumber\":[\"15888888888\"],\"sex\":[\"1\"]}', '0', null, '2019-03-09 18:32:24');
INSERT INTO `sys_oper_log` VALUES ('29', '通知公告', '1', 'com.ruoyi.project.system.notice.controller.NoticeController.addSave()', '1', 'admin', '研发部门', '/system/notice/add', '127.0.0.1', '内网IP', '{\"noticeTitle\":[\"我的第一条动态\"],\"noticeType\":[\"3\"],\"noticeContent\":[\"<p>大大哇</p>\"],\"status\":[\"0\"]}', '0', null, '2019-03-09 19:40:01');
INSERT INTO `sys_oper_log` VALUES ('30', '评论', '1', 'com.ruoyi.project.system.comment.controller.CommentController.addSave()', '1', 'admin', null, '/system/comment/add', '127.0.0.1', '内网IP', '{\"content\":[\"非常棒\"],\"noticeId\":[\"4\"]}', '0', null, '2019-03-09 20:22:09');
INSERT INTO `sys_oper_log` VALUES ('31', '菜单管理', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/115', '127.0.0.1', '内网IP', '{}', '0', null, '2019-03-10 12:48:43');
INSERT INTO `sys_oper_log` VALUES ('32', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"3\"],\"roleName\":[\"学生\"],\"roleKey\":[\"student\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1068,1058,1059,1060,1061,1062,1069,1070,1071,1072,1073,1074\"]}', '0', null, '2019-03-10 12:49:00');
INSERT INTO `sys_oper_log` VALUES ('33', '菜单管理', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/113', '127.0.0.1', '内网IP', '{}', '0', null, '2019-03-10 12:49:08');
INSERT INTO `sys_oper_log` VALUES ('34', '菜单管理', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/115', '127.0.0.1', '内网IP', '{}', '0', null, '2019-03-10 12:49:19');
INSERT INTO `sys_oper_log` VALUES ('35', '菜单管理', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/1056', '127.0.0.1', '内网IP', '{}', '0', null, '2019-03-10 12:49:31');
INSERT INTO `sys_oper_log` VALUES ('36', '菜单管理', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/1057', '127.0.0.1', '内网IP', '{}', '0', null, '2019-03-10 12:49:42');
INSERT INTO `sys_oper_log` VALUES ('37', '菜单管理', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/114', '127.0.0.1', '内网IP', '{}', '0', null, '2019-03-10 12:49:50');
INSERT INTO `sys_oper_log` VALUES ('38', '菜单管理', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/3', '127.0.0.1', '内网IP', '{}', '0', null, '2019-03-10 12:49:57');
INSERT INTO `sys_oper_log` VALUES ('39', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"我的圈子\"],\"url\":[\"\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-adjust\"],\"visible\":[\"0\"]}', '0', null, '2019-03-10 12:51:08');
INSERT INTO `sys_oper_log` VALUES ('40', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1075\"],\"menuType\":[\"C\"],\"menuName\":[\"我的评论\"],\"url\":[\"/system/comment\"],\"perms\":[\"system:comment:view\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-03-10 12:54:40');
INSERT INTO `sys_oper_log` VALUES ('41', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1075\"],\"menuType\":[\"C\"],\"menuName\":[\"我的动态\"],\"url\":[\"/system/notice\"],\"perms\":[\"system:notice:view\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-03-10 12:56:06');
INSERT INTO `sys_oper_log` VALUES ('42', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1076\"],\"parentId\":[\"1075\"],\"menuType\":[\"C\"],\"menuName\":[\"我的评论\"],\"url\":[\"/system/myComment\"],\"perms\":[\"system:comment:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-03-10 12:56:46');
INSERT INTO `sys_oper_log` VALUES ('43', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1077\"],\"parentId\":[\"1075\"],\"menuType\":[\"C\"],\"menuName\":[\"我的动态\"],\"url\":[\"/system/myNotice\"],\"perms\":[\"system:notice:view\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-03-10 12:56:57');
INSERT INTO `sys_oper_log` VALUES ('44', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1075\"],\"menuType\":[\"C\"],\"menuName\":[\"我的朋友\"],\"url\":[\"/system/myFriend\"],\"perms\":[\"system:friend:view\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-03-10 12:57:43');
INSERT INTO `sys_oper_log` VALUES ('45', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"3\"],\"roleName\":[\"学生\"],\"roleKey\":[\"student\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1075,1076,1077,1078\"]}', '0', null, '2019-03-10 12:57:55');
INSERT INTO `sys_oper_log` VALUES ('46', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1076\"],\"parentId\":[\"1075\"],\"menuType\":[\"C\"],\"menuName\":[\"我的评论\"],\"url\":[\"/system/myComment\"],\"perms\":[\"system:comment:myComment\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-03-10 13:03:02');
INSERT INTO `sys_oper_log` VALUES ('47', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1076\"],\"parentId\":[\"1075\"],\"menuType\":[\"C\"],\"menuName\":[\"我的评论\"],\"url\":[\"/system/myComment\"],\"perms\":[\"system:myComment\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-03-10 13:03:27');
INSERT INTO `sys_oper_log` VALUES ('48', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1077\"],\"parentId\":[\"1075\"],\"menuType\":[\"C\"],\"menuName\":[\"我的动态\"],\"url\":[\"/system/myNotice\"],\"perms\":[\"system:MyNotice\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-03-10 13:03:48');
INSERT INTO `sys_oper_log` VALUES ('49', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1078\"],\"parentId\":[\"1075\"],\"menuType\":[\"C\"],\"menuName\":[\"我的朋友\"],\"url\":[\"/system/myFriend\"],\"perms\":[\"system:myFriend\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-03-10 13:04:01');
INSERT INTO `sys_oper_log` VALUES ('50', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', null, '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"3\"],\"roleName\":[\"学生\"],\"roleKey\":[\"student\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1075,1076,1077,1078\"]}', '0', null, '2019-03-10 13:04:21');
INSERT INTO `sys_oper_log` VALUES ('51', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', null, '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1068\"],\"menuType\":[\"C\"],\"menuName\":[\"我的动态\"],\"url\":[\"/system/notice\"],\"perms\":[\"system:notice:view\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-03-10 13:11:43');
INSERT INTO `sys_oper_log` VALUES ('52', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', null, '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"3\"],\"roleName\":[\"学生\"],\"roleKey\":[\"student\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1068,1058,1059,1069,1070,1071,1072,1073,1074,1079\"]}', '0', null, '2019-03-10 13:12:43');
INSERT INTO `sys_oper_log` VALUES ('53', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1079\"],\"parentId\":[\"1068\"],\"menuType\":[\"C\"],\"menuName\":[\"我的动态\"],\"url\":[\"/system/notice\"],\"perms\":[\"system:notice:list\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-03-10 13:14:06');
INSERT INTO `sys_oper_log` VALUES ('54', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1079\"],\"parentId\":[\"1068\"],\"menuType\":[\"C\"],\"menuName\":[\"我的动态\"],\"url\":[\"/system/notice\"],\"perms\":[\"system:notice:view,system:notice:list\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-03-10 13:15:28');
INSERT INTO `sys_oper_log` VALUES ('55', '菜单管理', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/1078', '127.0.0.1', '内网IP', '{}', '0', null, '2019-03-10 14:25:10');
INSERT INTO `sys_oper_log` VALUES ('56', '菜单管理', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/1077', '127.0.0.1', '内网IP', '{}', '0', null, '2019-03-10 14:25:18');
INSERT INTO `sys_oper_log` VALUES ('57', '菜单管理', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/1076', '127.0.0.1', '内网IP', '{}', '0', null, '2019-03-10 14:25:23');
INSERT INTO `sys_oper_log` VALUES ('58', '菜单管理', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/1075', '127.0.0.1', '内网IP', '{}', '0', null, '2019-03-10 14:25:27');
INSERT INTO `sys_oper_log` VALUES ('59', '用户朋友', '1', 'com.ruoyi.project.system.friend.controller.FriendController.addSave()', '1', 'test1', null, '/system/friend/add', '127.0.0.1', '内网IP', '{\"userId\":[\"4\"],\"friendId\":[\"2\"],\"friendRemark\":[\"测试\"]}', '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\r\n### The error may involve com.ruoyi.project.system.friend.mapper.FriendMapper.insertFriend-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into cap_friend    ( user_id,        friend_id,        friend_remark,    create_by,    create_time )           values ( ?,        ?,        ?,             sysdate() )\r\n### Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\n; bad SQL grammar []; nested exception is java.sql.SQLException: Column count doesn\'t match value count at row 1', '2019-03-10 15:03:30');
INSERT INTO `sys_oper_log` VALUES ('60', '用户朋友', '1', 'com.ruoyi.project.system.friend.controller.FriendController.addSave()', '1', 'test1', null, '/system/friend/add', '127.0.0.1', '内网IP', '{\"userId\":[\"4\"],\"friendId\":[\"2\"],\"friendRemark\":[\"测试\"]}', '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\r\n### The error may involve com.ruoyi.project.system.friend.mapper.FriendMapper.insertFriend-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into cap_friend    ( user_id,        friend_id,        friend_remark,    create_by,    create_time )           values ( ?,        ?,        ?,             sysdate() )\r\n### Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\n; bad SQL grammar []; nested exception is java.sql.SQLException: Column count doesn\'t match value count at row 1', '2019-03-10 15:05:36');
INSERT INTO `sys_oper_log` VALUES ('61', '用户朋友', '1', 'com.ruoyi.project.system.friend.controller.FriendController.addSave()', '1', 'test1', null, '/system/friend/add', '127.0.0.1', '内网IP', '{\"userId\":[\"4\"],\"friendId\":[\"2\"],\"friendRemark\":[\"测试\"]}', '0', null, '2019-03-10 15:06:23');
INSERT INTO `sys_oper_log` VALUES ('62', '用户朋友', '3', 'com.ruoyi.project.system.friend.controller.FriendController.remove()', '1', 'admin', '研发部门', '/system/friend/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', '1', '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'del_flag\' in \'field list\'\r\n### The error may involve com.ruoyi.project.system.friend.mapper.FriendMapper.deleteFriendByIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update cap_friend set del_flag = \'2\' where id in          (               ?          )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'del_flag\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'del_flag\' in \'field list\'', '2019-03-10 15:11:45');
INSERT INTO `sys_oper_log` VALUES ('63', '用户朋友', '1', 'com.ruoyi.project.system.friend.controller.FriendController.addSave()', '1', 'admin', '研发部门', '/system/friend/add', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"friendId\":[\"3\"],\"friendRemark\":[\"\"]}', '0', null, '2019-03-10 15:16:04');
INSERT INTO `sys_oper_log` VALUES ('64', '用户朋友', '3', 'com.ruoyi.project.system.friend.controller.FriendController.remove()', '1', 'admin', '研发部门', '/system/friend/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', '0', null, '2019-03-10 15:16:11');
INSERT INTO `sys_oper_log` VALUES ('65', '字典类型', '1', 'com.ruoyi.project.system.dict.controller.DictTypeController.addSave()', '1', 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"社团信息\"],\"dictType\":[\"community_info\"],\"status\":[\"0\"],\"remark\":[\"社团信息\"]}', '0', null, '2019-03-10 15:25:14');
INSERT INTO `sys_oper_log` VALUES ('66', '字典类型', '2', 'com.ruoyi.project.system.dict.controller.DictTypeController.editSave()', '1', 'admin', '研发部门', '/system/dict/edit', '127.0.0.1', '内网IP', '{\"dictId\":[\"10\"],\"dictName\":[\"社团信息\"],\"dictType\":[\"sys_community_info\"],\"status\":[\"0\"],\"remark\":[\"社团信息\"]}', '0', null, '2019-03-10 15:25:29');
INSERT INTO `sys_oper_log` VALUES ('67', '字典数据', '1', 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"霹雳舞团\"],\"dictValue\":[\"1\"],\"dictType\":[\"sys_community_info\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"primary\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"霹雳舞团\"]}', '0', null, '2019-03-10 15:27:08');
INSERT INTO `sys_oper_log` VALUES ('68', '字典数据', '1', 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"太极社团\"],\"dictValue\":[\"2\"],\"dictType\":[\"sys_community_info\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"success\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2019-03-10 15:27:29');
INSERT INTO `sys_oper_log` VALUES ('69', '字典数据', '2', 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', '1', 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"29\"],\"dictLabel\":[\"太极社团\"],\"dictValue\":[\"2\"],\"dictType\":[\"sys_community_info\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"primary\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2019-03-10 15:27:36');
INSERT INTO `sys_oper_log` VALUES ('70', '个人信息', '2', 'com.ruoyi.project.system.user.controller.ProfileController.update()', '1', 'admin', '研发部门', '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"loginName\":[\"admin\"],\"schoool\":[\"科技大学\"],\"community\":[\"1\"],\"userName\":[\"若依\"],\"email\":[\"13146950818@qq.com\"],\"phonenumber\":[\"15888888888\"],\"sex\":[\"1\"]}', '0', null, '2019-03-10 15:31:25');
INSERT INTO `sys_oper_log` VALUES ('71', '个人信息', '2', 'com.ruoyi.project.system.user.controller.ProfileController.update()', '1', 'admin', '研发部门', '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"loginName\":[\"admin\"],\"schoool\":[\"科技大学\"],\"community\":[\"2\"],\"userName\":[\"若依\"],\"email\":[\"13146950818@qq.com\"],\"phonenumber\":[\"15888888888\"],\"sex\":[\"1\"]}', '0', null, '2019-03-10 15:35:50');
INSERT INTO `sys_oper_log` VALUES ('72', '个人信息', '2', 'com.ruoyi.project.system.user.controller.ProfileController.update()', '1', 'admin', '研发部门', '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"loginName\":[\"admin\"],\"schoool\":[\"科技大学\"],\"community\":[\"2\"],\"userName\":[\"若依\"],\"email\":[\"13146950818@qq.com\"],\"phonenumber\":[\"15888888888\"],\"sex\":[\"1\"]}', '0', null, '2019-03-10 15:37:19');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('1', 'ceo', '董事长', '1', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('2', 'se', '项目经理', '2', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('3', 'hr', '人力资源', '3', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('4', 'user', '普通员工', '4', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限）',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '管理员', 'admin', '1', '1', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-10 12:48:52', '管理员');
INSERT INTO `sys_role` VALUES ('2', '普通角色', 'common', '2', '2', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-10 12:48:57', '普通角色');
INSERT INTO `sys_role` VALUES ('3', '学生', 'student', '3', '1', '0', '0', 'admin', '2019-03-09 15:36:12', 'admin', '2019-03-10 13:12:43', '');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `dept_id` int(11) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('2', '100');
INSERT INTO `sys_role_dept` VALUES ('2', '101');
INSERT INTO `sys_role_dept` VALUES ('2', '105');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '2');
INSERT INTO `sys_role_menu` VALUES ('1', '100');
INSERT INTO `sys_role_menu` VALUES ('1', '101');
INSERT INTO `sys_role_menu` VALUES ('1', '102');
INSERT INTO `sys_role_menu` VALUES ('1', '103');
INSERT INTO `sys_role_menu` VALUES ('1', '104');
INSERT INTO `sys_role_menu` VALUES ('1', '105');
INSERT INTO `sys_role_menu` VALUES ('1', '106');
INSERT INTO `sys_role_menu` VALUES ('1', '107');
INSERT INTO `sys_role_menu` VALUES ('1', '108');
INSERT INTO `sys_role_menu` VALUES ('1', '109');
INSERT INTO `sys_role_menu` VALUES ('1', '110');
INSERT INTO `sys_role_menu` VALUES ('1', '111');
INSERT INTO `sys_role_menu` VALUES ('1', '112');
INSERT INTO `sys_role_menu` VALUES ('1', '500');
INSERT INTO `sys_role_menu` VALUES ('1', '501');
INSERT INTO `sys_role_menu` VALUES ('1', '1000');
INSERT INTO `sys_role_menu` VALUES ('1', '1001');
INSERT INTO `sys_role_menu` VALUES ('1', '1002');
INSERT INTO `sys_role_menu` VALUES ('1', '1003');
INSERT INTO `sys_role_menu` VALUES ('1', '1004');
INSERT INTO `sys_role_menu` VALUES ('1', '1005');
INSERT INTO `sys_role_menu` VALUES ('1', '1006');
INSERT INTO `sys_role_menu` VALUES ('1', '1007');
INSERT INTO `sys_role_menu` VALUES ('1', '1008');
INSERT INTO `sys_role_menu` VALUES ('1', '1009');
INSERT INTO `sys_role_menu` VALUES ('1', '1010');
INSERT INTO `sys_role_menu` VALUES ('1', '1011');
INSERT INTO `sys_role_menu` VALUES ('1', '1012');
INSERT INTO `sys_role_menu` VALUES ('1', '1013');
INSERT INTO `sys_role_menu` VALUES ('1', '1014');
INSERT INTO `sys_role_menu` VALUES ('1', '1015');
INSERT INTO `sys_role_menu` VALUES ('1', '1016');
INSERT INTO `sys_role_menu` VALUES ('1', '1017');
INSERT INTO `sys_role_menu` VALUES ('1', '1018');
INSERT INTO `sys_role_menu` VALUES ('1', '1019');
INSERT INTO `sys_role_menu` VALUES ('1', '1020');
INSERT INTO `sys_role_menu` VALUES ('1', '1021');
INSERT INTO `sys_role_menu` VALUES ('1', '1022');
INSERT INTO `sys_role_menu` VALUES ('1', '1023');
INSERT INTO `sys_role_menu` VALUES ('1', '1024');
INSERT INTO `sys_role_menu` VALUES ('1', '1025');
INSERT INTO `sys_role_menu` VALUES ('1', '1026');
INSERT INTO `sys_role_menu` VALUES ('1', '1027');
INSERT INTO `sys_role_menu` VALUES ('1', '1028');
INSERT INTO `sys_role_menu` VALUES ('1', '1029');
INSERT INTO `sys_role_menu` VALUES ('1', '1030');
INSERT INTO `sys_role_menu` VALUES ('1', '1031');
INSERT INTO `sys_role_menu` VALUES ('1', '1032');
INSERT INTO `sys_role_menu` VALUES ('1', '1033');
INSERT INTO `sys_role_menu` VALUES ('1', '1034');
INSERT INTO `sys_role_menu` VALUES ('1', '1035');
INSERT INTO `sys_role_menu` VALUES ('1', '1036');
INSERT INTO `sys_role_menu` VALUES ('1', '1037');
INSERT INTO `sys_role_menu` VALUES ('1', '1038');
INSERT INTO `sys_role_menu` VALUES ('1', '1039');
INSERT INTO `sys_role_menu` VALUES ('1', '1040');
INSERT INTO `sys_role_menu` VALUES ('1', '1041');
INSERT INTO `sys_role_menu` VALUES ('1', '1042');
INSERT INTO `sys_role_menu` VALUES ('1', '1043');
INSERT INTO `sys_role_menu` VALUES ('1', '1044');
INSERT INTO `sys_role_menu` VALUES ('1', '1045');
INSERT INTO `sys_role_menu` VALUES ('1', '1046');
INSERT INTO `sys_role_menu` VALUES ('1', '1047');
INSERT INTO `sys_role_menu` VALUES ('1', '1048');
INSERT INTO `sys_role_menu` VALUES ('1', '1049');
INSERT INTO `sys_role_menu` VALUES ('1', '1050');
INSERT INTO `sys_role_menu` VALUES ('1', '1051');
INSERT INTO `sys_role_menu` VALUES ('1', '1052');
INSERT INTO `sys_role_menu` VALUES ('1', '1053');
INSERT INTO `sys_role_menu` VALUES ('1', '1054');
INSERT INTO `sys_role_menu` VALUES ('1', '1055');
INSERT INTO `sys_role_menu` VALUES ('1', '1058');
INSERT INTO `sys_role_menu` VALUES ('1', '1059');
INSERT INTO `sys_role_menu` VALUES ('1', '1060');
INSERT INTO `sys_role_menu` VALUES ('1', '1061');
INSERT INTO `sys_role_menu` VALUES ('1', '1062');
INSERT INTO `sys_role_menu` VALUES ('1', '1068');
INSERT INTO `sys_role_menu` VALUES ('1', '1069');
INSERT INTO `sys_role_menu` VALUES ('1', '1070');
INSERT INTO `sys_role_menu` VALUES ('1', '1071');
INSERT INTO `sys_role_menu` VALUES ('1', '1072');
INSERT INTO `sys_role_menu` VALUES ('1', '1073');
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '2');
INSERT INTO `sys_role_menu` VALUES ('2', '100');
INSERT INTO `sys_role_menu` VALUES ('2', '101');
INSERT INTO `sys_role_menu` VALUES ('2', '102');
INSERT INTO `sys_role_menu` VALUES ('2', '103');
INSERT INTO `sys_role_menu` VALUES ('2', '104');
INSERT INTO `sys_role_menu` VALUES ('2', '105');
INSERT INTO `sys_role_menu` VALUES ('2', '106');
INSERT INTO `sys_role_menu` VALUES ('2', '107');
INSERT INTO `sys_role_menu` VALUES ('2', '108');
INSERT INTO `sys_role_menu` VALUES ('2', '109');
INSERT INTO `sys_role_menu` VALUES ('2', '110');
INSERT INTO `sys_role_menu` VALUES ('2', '111');
INSERT INTO `sys_role_menu` VALUES ('2', '112');
INSERT INTO `sys_role_menu` VALUES ('2', '500');
INSERT INTO `sys_role_menu` VALUES ('2', '501');
INSERT INTO `sys_role_menu` VALUES ('2', '1000');
INSERT INTO `sys_role_menu` VALUES ('2', '1001');
INSERT INTO `sys_role_menu` VALUES ('2', '1002');
INSERT INTO `sys_role_menu` VALUES ('2', '1003');
INSERT INTO `sys_role_menu` VALUES ('2', '1004');
INSERT INTO `sys_role_menu` VALUES ('2', '1005');
INSERT INTO `sys_role_menu` VALUES ('2', '1006');
INSERT INTO `sys_role_menu` VALUES ('2', '1007');
INSERT INTO `sys_role_menu` VALUES ('2', '1008');
INSERT INTO `sys_role_menu` VALUES ('2', '1009');
INSERT INTO `sys_role_menu` VALUES ('2', '1010');
INSERT INTO `sys_role_menu` VALUES ('2', '1011');
INSERT INTO `sys_role_menu` VALUES ('2', '1012');
INSERT INTO `sys_role_menu` VALUES ('2', '1013');
INSERT INTO `sys_role_menu` VALUES ('2', '1014');
INSERT INTO `sys_role_menu` VALUES ('2', '1015');
INSERT INTO `sys_role_menu` VALUES ('2', '1016');
INSERT INTO `sys_role_menu` VALUES ('2', '1017');
INSERT INTO `sys_role_menu` VALUES ('2', '1018');
INSERT INTO `sys_role_menu` VALUES ('2', '1019');
INSERT INTO `sys_role_menu` VALUES ('2', '1020');
INSERT INTO `sys_role_menu` VALUES ('2', '1021');
INSERT INTO `sys_role_menu` VALUES ('2', '1022');
INSERT INTO `sys_role_menu` VALUES ('2', '1023');
INSERT INTO `sys_role_menu` VALUES ('2', '1024');
INSERT INTO `sys_role_menu` VALUES ('2', '1025');
INSERT INTO `sys_role_menu` VALUES ('2', '1026');
INSERT INTO `sys_role_menu` VALUES ('2', '1027');
INSERT INTO `sys_role_menu` VALUES ('2', '1028');
INSERT INTO `sys_role_menu` VALUES ('2', '1029');
INSERT INTO `sys_role_menu` VALUES ('2', '1030');
INSERT INTO `sys_role_menu` VALUES ('2', '1031');
INSERT INTO `sys_role_menu` VALUES ('2', '1032');
INSERT INTO `sys_role_menu` VALUES ('2', '1033');
INSERT INTO `sys_role_menu` VALUES ('2', '1034');
INSERT INTO `sys_role_menu` VALUES ('2', '1035');
INSERT INTO `sys_role_menu` VALUES ('2', '1036');
INSERT INTO `sys_role_menu` VALUES ('2', '1037');
INSERT INTO `sys_role_menu` VALUES ('2', '1038');
INSERT INTO `sys_role_menu` VALUES ('2', '1039');
INSERT INTO `sys_role_menu` VALUES ('2', '1040');
INSERT INTO `sys_role_menu` VALUES ('2', '1041');
INSERT INTO `sys_role_menu` VALUES ('2', '1042');
INSERT INTO `sys_role_menu` VALUES ('2', '1043');
INSERT INTO `sys_role_menu` VALUES ('2', '1044');
INSERT INTO `sys_role_menu` VALUES ('2', '1045');
INSERT INTO `sys_role_menu` VALUES ('2', '1046');
INSERT INTO `sys_role_menu` VALUES ('2', '1047');
INSERT INTO `sys_role_menu` VALUES ('2', '1048');
INSERT INTO `sys_role_menu` VALUES ('2', '1049');
INSERT INTO `sys_role_menu` VALUES ('2', '1050');
INSERT INTO `sys_role_menu` VALUES ('2', '1051');
INSERT INTO `sys_role_menu` VALUES ('2', '1052');
INSERT INTO `sys_role_menu` VALUES ('2', '1053');
INSERT INTO `sys_role_menu` VALUES ('2', '1054');
INSERT INTO `sys_role_menu` VALUES ('2', '1055');
INSERT INTO `sys_role_menu` VALUES ('3', '1058');
INSERT INTO `sys_role_menu` VALUES ('3', '1059');
INSERT INTO `sys_role_menu` VALUES ('3', '1068');
INSERT INTO `sys_role_menu` VALUES ('3', '1069');
INSERT INTO `sys_role_menu` VALUES ('3', '1070');
INSERT INTO `sys_role_menu` VALUES ('3', '1071');
INSERT INTO `sys_role_menu` VALUES ('3', '1072');
INSERT INTO `sys_role_menu` VALUES ('3', '1073');
INSERT INTO `sys_role_menu` VALUES ('3', '1074');
INSERT INTO `sys_role_menu` VALUES ('3', '1079');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` int(11) DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '0' COMMENT '用户类型（0.系统用户，1.普通学生2.学生社长，3.老师）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) DEFAULT '' COMMENT '密码',
  `salt` varchar(20) DEFAULT '' COMMENT '盐加密',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  `school` varchar(50) DEFAULT '' COMMENT '学校信息',
  `community` int(11) DEFAULT NULL COMMENT '社团信息',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '103', 'admin', '若依', '00', '13146950818@qq.com', '15888888888', '1', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2019-03-10 16:19:41', 'admin', '2018-03-16 11:33:00', 'ry', '2019-03-10 16:19:40', '管理员', '科技大学', '2');
INSERT INTO `sys_user` VALUES ('2', '105', 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '测试员', '', null);
INSERT INTO `sys_user` VALUES ('3', null, 'test', 'test', '0', '', '13146950818', '0', '2019/03/09/8f76e0bf1662cf563da6c71dd51ff5e6.jpg', '5c2d1c88a3c6906a752c74c901fd3e5c', 'ce7ff6', '0', '0', '127.0.0.1', '2019-03-09 15:41:17', 'test', '2019-03-09 14:47:06', '', '2019-03-09 15:41:16', '', '', null);
INSERT INTO `sys_user` VALUES ('4', null, 'test1', 'test1', '1', '', '', '0', '', 'd20e1f2ebb981f95a4f76e0f2d1a337b', '346857', '0', '0', '127.0.0.1', '2019-03-10 15:18:20', 'test1', '2019-03-09 15:47:10', '', '2019-03-10 15:18:19', '', '', null);
INSERT INTO `sys_user` VALUES ('5', '103', 'yanglingfeng', 'yanglingfeng', '0', '13146950189@qq.com', '13146950189', '0', '', '865786365f0e56eec6f2b584d7da51b5', '98bfff', '0', '0', '127.0.0.1', '2019-03-09 15:53:41', 'admin', '2019-03-09 15:53:17', '', '2019-03-09 15:53:41', '', '', null);

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online` (
  `sessionId` varchar(50) NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) DEFAULT '0' COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='在线用户记录';

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('50afb052-8052-4298-bb88-f67811c555b5', 'admin', '研发部门', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', 'on_line', '2019-03-10 16:11:36', '2019-03-10 16:11:42', '1800000');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `post_id` int(11) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('1', '1');
INSERT INTO `sys_user_post` VALUES ('2', '2');
INSERT INTO `sys_user_post` VALUES ('5', '1');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('2', '2');
INSERT INTO `sys_user_role` VALUES ('4', '3');
INSERT INTO `sys_user_role` VALUES ('5', '1');
