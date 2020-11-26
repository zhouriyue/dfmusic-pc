/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : dfmusic

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2020-11-01 12:08:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for collectiones
-- ----------------------------
DROP TABLE IF EXISTS `collectiones`;
CREATE TABLE `collectiones` (
  `col_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '收藏id',
  `sl_id` int(11) DEFAULT NULL COMMENT '歌单id',
  `collect_by` int(11) DEFAULT NULL COMMENT '收藏者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_time` datetime DEFAULT NULL COMMENT '删除时间',
  `del_flag` int(1) NOT NULL DEFAULT '0' COMMENT '删除标识符',
  PRIMARY KEY (`col_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collectiones
-- ----------------------------

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `com_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论编号',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `c_type` int(1) DEFAULT NULL COMMENT '评论类型',
  `song_id` int(11) DEFAULT NULL COMMENT '歌曲编号',
  `sl_id` int(11) DEFAULT NULL COMMENT '歌单编号',
  `content` varchar(255) DEFAULT NULL COMMENT '评论内容',
  `like_number` int(8) DEFAULT NULL COMMENT '点赞量',
  `be_answer_number` int(8) DEFAULT NULL COMMENT '回放量',
  `be_answer` int(255) DEFAULT NULL COMMENT '回复人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_time` datetime DEFAULT NULL COMMENT '删除时间',
  `del_flag` int(1) NOT NULL DEFAULT '0' COMMENT '删除标识符',
  PRIMARY KEY (`com_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '1', '1', '1', '1', '1', '1', null, null, null, null, null, '0');
INSERT INTO `comment` VALUES ('2', '1', '1', '1', '1', '1', '1', null, null, null, null, null, '0');

-- ----------------------------
-- Table structure for download
-- ----------------------------
DROP TABLE IF EXISTS `download`;
CREATE TABLE `download` (
  `dl_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '下载id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `song_id` int(11) DEFAULT NULL COMMENT '歌曲id',
  `tone_quality` varchar(10) DEFAULT NULL COMMENT '下载音质',
  `dl_lenght` int(8) DEFAULT NULL COMMENT '下载时长',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_time` datetime DEFAULT NULL COMMENT '删除时间',
  `del_flag` int(1) NOT NULL DEFAULT '0' COMMENT '删除标识符',
  PRIMARY KEY (`dl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of download
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES ('1', 'songlist', '歌单管理', 'Songlist', 'crud', 'com.ruoyi.business', 'business', 'songlist', '歌单', 'zhouriyue', '0', '/', '{\"treeCode\":\"sin_id\",\"treeName\":\"sin_id\",\"treeParentCode\":\"sin_id\",\"parentMenuId\":\"2007\"}', 'admin', '2020-10-09 01:35:51', '', '2020-10-09 10:11:13', null);
INSERT INTO `gen_table` VALUES ('3', 'download', '下载信息', 'Download', 'crud', 'com.ruoyi.business', 'business', 'download', '下载信息', 'ruoyi', '0', '/', '{\"parentMenuId\":\"2007\"}', 'admin', '2020-10-09 10:37:46', '', '2020-10-09 13:13:44', null);
INSERT INTO `gen_table` VALUES ('4', 'lyric', '歌词管理', 'Lyric', 'crud', 'com.ruoyi.business', 'business', 'lyric', '歌词', 'ruoyi', '0', '/', '{\"parentMenuId\":\"2007\"}', 'admin', '2020-10-09 10:37:46', '', '2020-10-09 13:14:12', '歌词');
INSERT INTO `gen_table` VALUES ('7', 'recharge', '充值管理', 'Recharge', 'crud', 'com.ruoyi.business', 'business', 'recharge', '充值信息', 'ruoyi', '0', '/', '{\"parentMenuId\":\"2007\"}', 'admin', '2020-10-09 10:37:46', '', '2020-10-09 13:14:27', '充值管理');
INSERT INTO `gen_table` VALUES ('9', 'song', '歌曲管理', 'Song', 'crud', 'com.ruoyi.business', 'business', 'song', '歌曲', 'ruoyi', '0', '/', '{\"parentMenuId\":\"2007\"}', 'admin', '2020-10-09 10:37:46', '', '2020-10-09 13:15:12', '歌曲管理');
INSERT INTO `gen_table` VALUES ('11', 'song_type', '歌曲类型管理', 'SongType', 'crud', 'com.ruoyi.business', 'business', 'songtype', '歌曲类型', 'ruoyi', '0', '/', '{\"parentMenuId\":\"2007\"}', 'admin', '2020-10-09 10:37:46', '', '2020-10-09 13:15:26', '歌曲类型管理');
INSERT INTO `gen_table` VALUES ('16', 'collectiones', '歌单收藏管理', 'Collectiones', 'crud', 'com.ruoyi.business', 'business', 'collectiones', '歌单收藏', 'ruoyi', '0', '/', '{\"parentMenuId\":2007}', 'admin', '2020-10-09 11:58:43', '', '2020-10-09 12:00:05', '歌单收藏管理');
INSERT INTO `gen_table` VALUES ('17', 'singer', '歌手信息管理', 'Singer', 'crud', 'com.ruoyi.business', 'business', 'singer', '歌手信息', 'ruoyi', '0', '/', '{\"parentMenuId\":\"2007\"}', 'admin', '2020-10-09 12:39:12', '', '2020-10-09 13:16:14', '歌手信息管理');
INSERT INTO `gen_table` VALUES ('18', 'member', '会员信息', 'Member', 'crud', 'com.ruoyi.business', 'business', 'member', '会员信息管理', 'ruoyi', '0', '/', '{\"parentMenuId\":2007}', 'admin', '2020-10-09 12:42:00', '', '2020-10-09 12:43:25', '会员信息');
INSERT INTO `gen_table` VALUES ('19', 'comment', '评论信息', 'Comment', 'crud', 'com.ruoyi.business', 'business', 'comment', '评论管理', 'ruoyi', '0', '/', '{\"parentMenuId\":2007}', 'admin', '2020-10-09 12:44:23', '', '2020-10-09 12:47:01', '评论信息');
INSERT INTO `gen_table` VALUES ('20', 'songlist_type', '歌单类型', 'SonglistType', 'crud', 'com.ruoyi.business', 'business', 'songlisttype', '歌单类型管理', 'ruoyi', '0', '/', '{\"parentMenuId\":\"2007\"}', 'admin', '2020-10-09 12:47:54', '', '2020-10-09 13:32:57', '歌单类型');
INSERT INTO `gen_table` VALUES ('21', 'privilege', '特权', 'Privilege', 'crud', 'com.ruoyi.business', 'business', 'privilege', '特权', 'ruoyi', '0', '/', '{\"parentMenuId\":2007}', 'admin', '2020-10-09 23:36:35', '', '2020-10-09 23:37:45', '特权');

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8 COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES ('1', '1', 'sl_id', '歌单id', 'int(11)', 'Long', 'slId', '1', '1', null, null, null, null, '1', 'EQ', 'input', '', '1', 'admin', '2020-10-09 01:35:51', '', '2020-10-09 10:11:13');
INSERT INTO `gen_table_column` VALUES ('2', '1', 'sl_name', '歌单名', 'varchar(50)', 'String', 'slName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', '2', 'admin', '2020-10-09 01:35:51', '', '2020-10-09 10:11:13');
INSERT INTO `gen_table_column` VALUES ('3', '1', 'cover_picture', '歌单封面', 'varchar(255)', 'String', 'coverPicture', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2020-10-09 01:35:51', '', '2020-10-09 10:11:13');
INSERT INTO `gen_table_column` VALUES ('4', '1', 'sl_title', '标题', 'varchar(50)', 'String', 'slTitle', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2020-10-09 01:35:51', '', '2020-10-09 10:11:13');
INSERT INTO `gen_table_column` VALUES ('5', '1', 'play_number', '播放量', 'int(8)', 'Integer', 'playNumber', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '5', 'admin', '2020-10-09 01:35:51', '', '2020-10-09 10:11:13');
INSERT INTO `gen_table_column` VALUES ('6', '1', 'song_number', '歌曲数', 'int(8)', 'Integer', 'songNumber', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '6', 'admin', '2020-10-09 01:35:51', '', '2020-10-09 10:11:13');
INSERT INTO `gen_table_column` VALUES ('7', '1', 'col_number', '收藏量', 'int(8)', 'Integer', 'colNumber', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '7', 'admin', '2020-10-09 01:35:51', '', '2020-10-09 10:11:13');
INSERT INTO `gen_table_column` VALUES ('8', '1', 'comments_number', '评论量', 'int(8)', 'Integer', 'commentsNumber', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '8', 'admin', '2020-10-09 01:35:51', '', '2020-10-09 10:11:13');
INSERT INTO `gen_table_column` VALUES ('9', '1', 'share_number', '分享量', 'int(8)', 'Integer', 'shareNumber', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '9', 'admin', '2020-10-09 01:35:51', '', '2020-10-09 10:11:13');
INSERT INTO `gen_table_column` VALUES ('10', '1', 'create_by', '歌单创建者', 'int(11)', 'Long', 'createBy', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '10', 'admin', '2020-10-09 01:35:51', '', '2020-10-09 10:11:13');
INSERT INTO `gen_table_column` VALUES ('11', '1', 'detail', '详情', 'varchar(255)', 'String', 'detail', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '11', 'admin', '2020-10-09 01:35:51', '', '2020-10-09 10:11:13');
INSERT INTO `gen_table_column` VALUES ('12', '1', 'is_album', '是否是专辑', 'int(1)', 'Integer', 'isAlbum', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '12', 'admin', '2020-10-09 01:35:51', '', '2020-10-09 10:11:13');
INSERT INTO `gen_table_column` VALUES ('13', '1', 'sin_id', '歌手', 'int(11)', 'Long', 'sinId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '13', 'admin', '2020-10-09 01:35:51', '', '2020-10-09 10:11:13');
INSERT INTO `gen_table_column` VALUES ('14', '1', 'is_public', '是否公开', 'varchar(255)', 'String', 'isPublic', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '14', 'admin', '2020-10-09 01:35:51', '', '2020-10-09 10:11:13');
INSERT INTO `gen_table_column` VALUES ('15', '1', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', null, null, null, '1', '1', 'EQ', 'datetime', '', '15', 'admin', '2020-10-09 01:35:51', '', '2020-10-09 10:11:13');
INSERT INTO `gen_table_column` VALUES ('16', '1', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', null, null, null, '1', '1', 'EQ', 'datetime', '', '16', 'admin', '2020-10-09 01:35:51', '', '2020-10-09 10:11:13');
INSERT INTO `gen_table_column` VALUES ('17', '1', 'del_time', '删除时间', 'datetime', 'Date', 'delTime', '0', '0', null, null, null, null, null, 'EQ', 'datetime', '', '17', 'admin', '2020-10-09 01:35:51', '', '2020-10-09 10:11:13');
INSERT INTO `gen_table_column` VALUES ('18', '1', 'del_flag', '删除标识符', 'int(1)', 'Integer', 'delFlag', '0', '0', '1', null, null, null, null, 'EQ', 'input', '', '18', 'admin', '2020-10-09 01:35:51', '', '2020-10-09 10:11:13');
INSERT INTO `gen_table_column` VALUES ('26', '3', 'dl_id', '下载id', 'int(11)', 'Long', 'dlId', '1', '1', null, null, null, '1', '1', 'EQ', 'input', '', '1', 'admin', '2020-10-09 10:37:46', '', '2020-10-09 13:13:44');
INSERT INTO `gen_table_column` VALUES ('27', '3', 'user_id', '用户id', 'int(11)', 'Long', 'userId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2020-10-09 10:37:46', '', '2020-10-09 13:13:44');
INSERT INTO `gen_table_column` VALUES ('28', '3', 'song_id', '歌曲id', 'int(11)', 'Long', 'songId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2020-10-09 10:37:46', '', '2020-10-09 13:13:44');
INSERT INTO `gen_table_column` VALUES ('29', '3', 'tone_quality', '下载音质', 'varchar(10)', 'String', 'toneQuality', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2020-10-09 10:37:46', '', '2020-10-09 13:13:44');
INSERT INTO `gen_table_column` VALUES ('30', '3', 'dl_lenght', '下载时长', 'int(8)', 'Integer', 'dlLenght', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '5', 'admin', '2020-10-09 10:37:46', '', '2020-10-09 13:13:44');
INSERT INTO `gen_table_column` VALUES ('31', '3', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', null, null, null, null, null, 'EQ', 'datetime', '', '6', 'admin', '2020-10-09 10:37:46', '', '2020-10-09 13:13:44');
INSERT INTO `gen_table_column` VALUES ('32', '3', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', null, null, null, null, null, 'EQ', 'datetime', '', '7', 'admin', '2020-10-09 10:37:46', '', '2020-10-09 13:13:44');
INSERT INTO `gen_table_column` VALUES ('33', '3', 'del_time', '删除时间', 'datetime', 'Date', 'delTime', '0', '0', null, null, null, null, null, 'EQ', 'datetime', '', '8', 'admin', '2020-10-09 10:37:46', '', '2020-10-09 13:13:44');
INSERT INTO `gen_table_column` VALUES ('34', '3', 'del_flag', '删除标识符', 'int(1)', 'Integer', 'delFlag', '0', '0', null, null, null, null, null, 'EQ', 'input', '', '9', 'admin', '2020-10-09 10:37:46', '', '2020-10-09 13:13:44');
INSERT INTO `gen_table_column` VALUES ('35', '4', 'lyr_id', '歌词id', 'int(11)', 'Long', 'lyrId', '1', '1', null, null, null, '1', '1', 'EQ', 'input', '', '1', 'admin', '2020-10-09 10:37:46', '', '2020-10-09 13:14:12');
INSERT INTO `gen_table_column` VALUES ('36', '4', 'lyr_name', '歌词名', 'varchar(50)', 'String', 'lyrName', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '2', 'admin', '2020-10-09 10:37:46', '', '2020-10-09 13:14:12');
INSERT INTO `gen_table_column` VALUES ('37', '4', 'lyr_url', '文件地址', 'varchar(255)', 'String', 'lyrUrl', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '3', 'admin', '2020-10-09 10:37:46', '', '2020-10-09 13:14:12');
INSERT INTO `gen_table_column` VALUES ('38', '4', 'issuing_date', '发行时间', 'datetime', 'Date', 'issuingDate', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '4', 'admin', '2020-10-09 10:37:46', '', '2020-10-09 13:14:12');
INSERT INTO `gen_table_column` VALUES ('39', '4', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', null, null, null, '1', '1', 'EQ', 'datetime', '', '5', 'admin', '2020-10-09 10:37:46', '', '2020-10-09 13:14:12');
INSERT INTO `gen_table_column` VALUES ('40', '4', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', null, null, null, '1', '1', 'EQ', 'datetime', '', '6', 'admin', '2020-10-09 10:37:46', '', '2020-10-09 13:14:12');
INSERT INTO `gen_table_column` VALUES ('41', '4', 'del_time', '删除时间', 'datetime', 'Date', 'delTime', '0', '0', null, null, null, null, null, 'EQ', 'datetime', '', '7', 'admin', '2020-10-09 10:37:46', '', '2020-10-09 13:14:12');
INSERT INTO `gen_table_column` VALUES ('42', '4', 'del_flag', '删除标识符', 'int(1)', 'Integer', 'delFlag', '0', '0', null, null, null, null, null, 'EQ', 'input', '', '8', 'admin', '2020-10-09 10:37:46', '', '2020-10-09 13:14:12');
INSERT INTO `gen_table_column` VALUES ('55', '7', 'rec_id', '充值id', 'int(11)', 'Long', 'recId', '1', '1', null, null, null, '1', '1', 'EQ', 'input', '', '1', 'admin', '2020-10-09 10:37:46', '', '2020-10-09 13:14:27');
INSERT INTO `gen_table_column` VALUES ('56', '7', 'user_id', '用户id', 'int(11)', 'Long', 'userId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2020-10-09 10:37:46', '', '2020-10-09 13:14:27');
INSERT INTO `gen_table_column` VALUES ('57', '7', 'amount', '充值金额', 'int(11)', 'Long', 'amount', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '3', 'admin', '2020-10-09 10:37:46', '', '2020-10-09 13:14:27');
INSERT INTO `gen_table_column` VALUES ('58', '7', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', null, null, null, '1', '1', 'EQ', 'datetime', '', '4', 'admin', '2020-10-09 10:37:46', '', '2020-10-09 13:14:27');
INSERT INTO `gen_table_column` VALUES ('59', '7', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', null, null, null, '1', '1', 'EQ', 'datetime', '', '5', 'admin', '2020-10-09 10:37:46', '', '2020-10-09 13:14:27');
INSERT INTO `gen_table_column` VALUES ('60', '7', 'del_time', '删除时间', 'datetime', 'Date', 'delTime', '0', '0', null, null, null, null, null, 'EQ', 'datetime', '', '6', 'admin', '2020-10-09 10:37:46', '', '2020-10-09 13:14:27');
INSERT INTO `gen_table_column` VALUES ('61', '7', 'del_flag', '删除标识符', 'int(1)', 'Integer', 'delFlag', '0', '0', null, null, null, null, null, 'EQ', 'input', '', '7', 'admin', '2020-10-09 10:37:46', '', '2020-10-09 13:14:27');
INSERT INTO `gen_table_column` VALUES ('82', '9', 'song_id', '歌曲id', 'int(11)', 'Long', 'songId', '1', '1', null, null, null, '1', '1', 'EQ', 'input', '', '1', 'admin', '2020-10-09 10:37:46', '', '2020-10-09 13:15:12');
INSERT INTO `gen_table_column` VALUES ('83', '9', 'song_name', '歌曲名', 'varchar(50)', 'String', 'songName', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '2', 'admin', '2020-10-09 10:37:46', '', '2020-10-09 13:15:12');
INSERT INTO `gen_table_column` VALUES ('84', '9', 'sin_id', '歌手id', 'int(11)', 'Long', 'sinId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2020-10-09 10:37:46', '', '2020-10-09 13:15:12');
INSERT INTO `gen_table_column` VALUES ('85', '9', 'duration', '时长', 'int(11)', 'Long', 'duration', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '4', 'admin', '2020-10-09 10:37:46', '', '2020-10-09 13:15:12');
INSERT INTO `gen_table_column` VALUES ('86', '9', 'issuing_date', '发行时间', 'datetime', 'Date', 'issuingDate', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '5', 'admin', '2020-10-09 10:37:46', '', '2020-10-09 13:15:12');
INSERT INTO `gen_table_column` VALUES ('87', '9', 'mv_url', 'mv', 'varchar(255)', 'String', 'mvUrl', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '6', 'admin', '2020-10-09 10:37:46', '', '2020-10-09 13:15:12');
INSERT INTO `gen_table_column` VALUES ('88', '9', 'is_charge', '是否收费', 'int(1)', 'Integer', 'isCharge', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '7', 'admin', '2020-10-09 10:37:46', '', '2020-10-09 13:15:12');
INSERT INTO `gen_table_column` VALUES ('89', '9', 'is_copyright', '是否有版权', 'int(1)', 'Integer', 'isCopyright', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '8', 'admin', '2020-10-09 10:37:46', '', '2020-10-09 13:15:12');
INSERT INTO `gen_table_column` VALUES ('90', '9', 'is_single', '是否是单曲', 'int(1)', 'Integer', 'isSingle', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '9', 'admin', '2020-10-09 10:37:46', '', '2020-10-09 13:15:12');
INSERT INTO `gen_table_column` VALUES ('91', '9', 'sl_id', '歌单id', 'int(11)', 'Long', 'slId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '10', 'admin', '2020-10-09 10:37:46', '', '2020-10-09 13:15:12');
INSERT INTO `gen_table_column` VALUES ('92', '9', 'standard_url', '标注音质(S)', 'varchar(255)', 'String', 'standardUrl', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '11', 'admin', '2020-10-09 10:37:46', '', '2020-10-09 13:15:12');
INSERT INTO `gen_table_column` VALUES ('93', '9', 'hq_url', '高品质（HQ）', 'varchar(255)', 'String', 'hqUrl', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '12', 'admin', '2020-10-09 10:37:46', '', '2020-10-09 13:15:12');
INSERT INTO `gen_table_column` VALUES ('94', '9', 'sq_url', '超音质（SQ）', 'varchar(255)', 'String', 'sqUrl', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '13', 'admin', '2020-10-09 10:37:46', '', '2020-10-09 13:15:12');
INSERT INTO `gen_table_column` VALUES ('95', '9', 'wit_pre_url', '无损（WP）', 'varchar(255)', 'String', 'witPreUrl', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '14', 'admin', '2020-10-09 10:37:46', '', '2020-10-09 13:15:12');
INSERT INTO `gen_table_column` VALUES ('96', '9', 'lyr_id', '歌词id', 'int(11)', 'Long', 'lyrId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '15', 'admin', '2020-10-09 10:37:46', '', '2020-10-09 13:15:12');
INSERT INTO `gen_table_column` VALUES ('97', '9', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', null, null, null, '1', '1', 'EQ', 'datetime', '', '16', 'admin', '2020-10-09 10:37:46', '', '2020-10-09 13:15:12');
INSERT INTO `gen_table_column` VALUES ('98', '9', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', null, null, null, '1', '1', 'EQ', 'datetime', '', '17', 'admin', '2020-10-09 10:37:46', '', '2020-10-09 13:15:12');
INSERT INTO `gen_table_column` VALUES ('99', '9', 'del_time', '删除时间', 'datetime', 'Date', 'delTime', '0', '0', null, null, null, null, null, 'EQ', 'datetime', '', '18', 'admin', '2020-10-09 10:37:46', '', '2020-10-09 13:15:12');
INSERT INTO `gen_table_column` VALUES ('100', '9', 'del_flag', '删除标识符', 'int(1)', 'Integer', 'delFlag', '0', '0', null, null, null, null, null, 'EQ', 'input', '', '19', 'admin', '2020-10-09 10:37:46', '', '2020-10-09 13:15:12');
INSERT INTO `gen_table_column` VALUES ('108', '11', 'st_id', '类型id', 'int(11)', 'Long', 'stId', '1', '1', null, null, null, '1', '1', 'EQ', 'input', '', '1', 'admin', '2020-10-09 10:37:46', '', '2020-10-09 13:15:26');
INSERT INTO `gen_table_column` VALUES ('109', '11', 'st_name', '类型名', 'varchar(255)', 'String', 'stName', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '2', 'admin', '2020-10-09 10:37:46', '', '2020-10-09 13:15:26');
INSERT INTO `gen_table_column` VALUES ('110', '11', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', null, null, null, '1', '1', 'EQ', 'datetime', '', '3', 'admin', '2020-10-09 10:37:46', '', '2020-10-09 13:15:26');
INSERT INTO `gen_table_column` VALUES ('111', '11', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', null, null, null, '1', '1', 'EQ', 'datetime', '', '4', 'admin', '2020-10-09 10:37:46', '', '2020-10-09 13:15:26');
INSERT INTO `gen_table_column` VALUES ('112', '11', 'del_time', '删除时间', 'datetime', 'Date', 'delTime', '0', '0', null, null, null, null, null, 'EQ', 'datetime', '', '5', 'admin', '2020-10-09 10:37:46', '', '2020-10-09 13:15:26');
INSERT INTO `gen_table_column` VALUES ('113', '11', 'del_flag', '删除标识符', 'int(1)', 'Integer', 'delFlag', '0', '0', null, null, null, null, null, 'EQ', 'input', '', '6', 'admin', '2020-10-09 10:37:46', '', '2020-10-09 13:15:26');
INSERT INTO `gen_table_column` VALUES ('146', '16', 'col_id', '收藏id', 'int(11)', 'Long', 'colId', '1', '1', null, null, null, '1', '1', 'EQ', 'input', '', '1', 'admin', '2020-10-09 11:58:43', '', '2020-10-09 12:00:05');
INSERT INTO `gen_table_column` VALUES ('147', '16', 'sl_id', '歌单id', 'int(11)', 'Long', 'slId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2020-10-09 11:58:43', '', '2020-10-09 12:00:05');
INSERT INTO `gen_table_column` VALUES ('148', '16', 'collect_by', '收藏者', 'int(11)', 'Long', 'collectBy', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2020-10-09 11:58:43', '', '2020-10-09 12:00:05');
INSERT INTO `gen_table_column` VALUES ('149', '16', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', null, null, null, '1', '1', 'EQ', 'datetime', '', '4', 'admin', '2020-10-09 11:58:43', '', '2020-10-09 12:00:05');
INSERT INTO `gen_table_column` VALUES ('150', '16', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', null, null, null, '1', '1', 'EQ', 'datetime', '', '5', 'admin', '2020-10-09 11:58:43', '', '2020-10-09 12:00:05');
INSERT INTO `gen_table_column` VALUES ('151', '16', 'del_time', '删除时间', 'datetime', 'Date', 'delTime', '0', '0', null, null, null, null, null, 'EQ', 'datetime', '', '6', 'admin', '2020-10-09 11:58:43', '', '2020-10-09 12:00:05');
INSERT INTO `gen_table_column` VALUES ('152', '16', 'del_flag', '删除标识符', 'int(1)', 'Integer', 'delFlag', '0', '0', null, null, null, null, null, 'EQ', 'input', '', '7', 'admin', '2020-10-09 11:58:43', '', '2020-10-09 12:00:05');
INSERT INTO `gen_table_column` VALUES ('153', '17', 'sin_id', '歌手编号', 'int(11)', 'Long', 'sinId', '1', '1', null, null, null, '1', '1', 'EQ', 'input', '', '1', 'admin', '2020-10-09 12:39:12', '', '2020-10-09 13:16:14');
INSERT INTO `gen_table_column` VALUES ('154', '17', 'sin_name', '歌手名', 'varchar(50)', 'String', 'sinName', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '2', 'admin', '2020-10-09 12:39:12', '', '2020-10-09 13:16:14');
INSERT INTO `gen_table_column` VALUES ('155', '17', 'nickname', '歌手昵称', 'varchar(50)', 'String', 'nickname', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '3', 'admin', '2020-10-09 12:39:12', '', '2020-10-09 13:16:14');
INSERT INTO `gen_table_column` VALUES ('156', '17', 'sex', '性别', 'int(1)', 'Integer', 'sex', '0', '0', null, '1', '1', '1', '1', 'EQ', 'select', '', '4', 'admin', '2020-10-09 12:39:12', '', '2020-10-09 13:16:14');
INSERT INTO `gen_table_column` VALUES ('157', '17', 'year', '年龄', 'int(3)', 'Integer', 'year', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '5', 'admin', '2020-10-09 12:39:12', '', '2020-10-09 13:16:14');
INSERT INTO `gen_table_column` VALUES ('158', '17', 'sin_type', '歌手类型', 'int(1)', 'Integer', 'sinType', '0', '0', null, '1', '1', '1', '1', 'EQ', 'select', '', '6', 'admin', '2020-10-09 12:39:12', '', '2020-10-09 13:16:14');
INSERT INTO `gen_table_column` VALUES ('159', '17', 'area', '住址', 'varchar(255)', 'String', 'area', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '7', 'admin', '2020-10-09 12:39:12', '', '2020-10-09 13:16:14');
INSERT INTO `gen_table_column` VALUES ('160', '17', 'song_number', '歌曲编号', 'int(8)', 'Integer', 'songNumber', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '8', 'admin', '2020-10-09 12:39:12', '', '2020-10-09 13:16:14');
INSERT INTO `gen_table_column` VALUES ('161', '17', 'follower_number', '关注数', 'int(8)', 'Integer', 'followerNumber', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '9', 'admin', '2020-10-09 12:39:12', '', '2020-10-09 13:16:14');
INSERT INTO `gen_table_column` VALUES ('162', '17', 'album_number', '专辑数', 'int(8)', 'Integer', 'albumNumber', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '10', 'admin', '2020-10-09 12:39:12', '', '2020-10-09 13:16:14');
INSERT INTO `gen_table_column` VALUES ('163', '17', 'mv_number', 'mv数', 'int(8)', 'Integer', 'mvNumber', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '11', 'admin', '2020-10-09 12:39:12', '', '2020-10-09 13:16:14');
INSERT INTO `gen_table_column` VALUES ('164', '17', 'detail', '详情', 'varchar(255)', 'String', 'detail', '0', '0', null, '1', '1', null, null, 'EQ', 'input', '', '12', 'admin', '2020-10-09 12:39:12', '', '2020-10-09 13:16:14');
INSERT INTO `gen_table_column` VALUES ('165', '17', 'influence_power', '影响力', 'varchar(255)', 'String', 'influencePower', '0', '0', null, '1', '1', null, null, 'EQ', 'input', '', '13', 'admin', '2020-10-09 12:39:12', '', '2020-10-09 13:16:14');
INSERT INTO `gen_table_column` VALUES ('166', '17', 'cert_info', '认证信息', 'varchar(255)', 'String', 'certInfo', '0', '0', null, '1', '1', null, null, 'EQ', 'input', '', '14', 'admin', '2020-10-09 12:39:12', '', '2020-10-09 13:16:14');
INSERT INTO `gen_table_column` VALUES ('167', '17', 'early_exp', '早期经历', 'varchar(255)', 'String', 'earlyExp', '0', '0', null, '1', '1', null, null, 'EQ', 'input', '', '15', 'admin', '2020-10-09 12:39:12', '', '2020-10-09 13:16:14');
INSERT INTO `gen_table_column` VALUES ('168', '17', 'performing_exp', '演绎经历', 'varchar(255)', 'String', 'performingExp', '0', '0', null, '1', '1', null, null, 'EQ', 'input', '', '16', 'admin', '2020-10-09 12:39:12', '', '2020-10-09 13:16:14');
INSERT INTO `gen_table_column` VALUES ('169', '17', 'del_flag', '删除标识符', 'int(1)', 'Integer', 'delFlag', '0', '0', null, null, null, null, null, 'EQ', 'input', '', '17', 'admin', '2020-10-09 12:39:12', '', '2020-10-09 13:16:14');
INSERT INTO `gen_table_column` VALUES ('170', '17', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', null, null, null, null, null, 'EQ', 'datetime', '', '18', 'admin', '2020-10-09 12:39:12', '', '2020-10-09 13:16:14');
INSERT INTO `gen_table_column` VALUES ('171', '17', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', null, null, null, null, null, 'EQ', 'datetime', '', '19', 'admin', '2020-10-09 12:39:12', '', '2020-10-09 13:16:14');
INSERT INTO `gen_table_column` VALUES ('172', '17', 'del_time', '删除时间', 'datetime', 'Date', 'delTime', '0', '0', null, null, null, null, null, 'EQ', 'datetime', '', '20', 'admin', '2020-10-09 12:39:12', '', '2020-10-09 13:16:14');
INSERT INTO `gen_table_column` VALUES ('173', '18', 'm_id', '会员编号', 'int(11)', 'Long', 'mId', '1', '1', null, null, null, '1', null, 'EQ', 'input', '', '1', 'admin', '2020-10-09 12:42:00', '', '2020-10-09 12:43:25');
INSERT INTO `gen_table_column` VALUES ('174', '18', 'm_grade', '等级', 'int(3)', 'Integer', 'mGrade', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2020-10-09 12:42:00', '', '2020-10-09 12:43:25');
INSERT INTO `gen_table_column` VALUES ('175', '18', 'user_id', '用户编号', 'int(11)', 'Long', 'userId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2020-10-09 12:42:00', '', '2020-10-09 12:43:25');
INSERT INTO `gen_table_column` VALUES ('176', '18', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', null, null, null, '1', '1', 'EQ', 'datetime', '', '4', 'admin', '2020-10-09 12:42:00', '', '2020-10-09 12:43:25');
INSERT INTO `gen_table_column` VALUES ('177', '18', 'update_time', '更新时间', 'varchar(255)', 'String', 'updateTime', '0', '0', null, null, null, '1', '1', 'EQ', 'input', '', '5', 'admin', '2020-10-09 12:42:00', '', '2020-10-09 12:43:25');
INSERT INTO `gen_table_column` VALUES ('178', '18', 'del_time', '删除时间', 'datetime', 'Date', 'delTime', '0', '0', null, null, null, null, null, 'EQ', 'datetime', '', '6', 'admin', '2020-10-09 12:42:00', '', '2020-10-09 12:43:25');
INSERT INTO `gen_table_column` VALUES ('179', '18', 'del_flag', '删除标识符', 'int(1)', 'Integer', 'delFlag', '0', '0', null, null, null, null, null, 'EQ', 'input', '', '7', 'admin', '2020-10-09 12:42:00', '', '2020-10-09 12:43:25');
INSERT INTO `gen_table_column` VALUES ('180', '19', 'com_id', '评论编号', 'int(11)', 'Long', 'comId', '1', '1', null, '1', null, '1', '1', 'EQ', 'input', '', '1', 'admin', '2020-10-09 12:44:23', '', '2020-10-09 12:47:01');
INSERT INTO `gen_table_column` VALUES ('181', '19', 'user_id', '用户id', 'int(11)', 'Long', 'userId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2020-10-09 12:44:23', '', '2020-10-09 12:47:01');
INSERT INTO `gen_table_column` VALUES ('182', '19', 'c_type', '评论类型', 'int(1)', 'Integer', 'cType', '0', '0', null, '1', '1', '1', '1', 'EQ', 'select', '', '3', 'admin', '2020-10-09 12:44:23', '', '2020-10-09 12:47:01');
INSERT INTO `gen_table_column` VALUES ('183', '19', 'song_id', '歌曲编号', 'int(11)', 'Long', 'songId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2020-10-09 12:44:23', '', '2020-10-09 12:47:01');
INSERT INTO `gen_table_column` VALUES ('184', '19', 'sl_id', '歌单编号', 'int(11)', 'Long', 'slId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '5', 'admin', '2020-10-09 12:44:23', '', '2020-10-09 12:47:01');
INSERT INTO `gen_table_column` VALUES ('185', '19', 'content', '评论内容', 'varchar(255)', 'String', 'content', '0', '0', null, '1', '1', null, null, 'EQ', 'editor', '', '6', 'admin', '2020-10-09 12:44:23', '', '2020-10-09 12:47:01');
INSERT INTO `gen_table_column` VALUES ('186', '19', 'like_number', '点赞量', 'int(8)', 'Integer', 'likeNumber', '0', '0', null, '1', '1', null, null, 'EQ', 'input', '', '7', 'admin', '2020-10-09 12:44:23', '', '2020-10-09 12:47:01');
INSERT INTO `gen_table_column` VALUES ('187', '19', 'be_answer_number', '回放量', 'int(8)', 'Integer', 'beAnswerNumber', '0', '0', null, '1', '1', null, null, 'EQ', 'input', '', '8', 'admin', '2020-10-09 12:44:23', '', '2020-10-09 12:47:01');
INSERT INTO `gen_table_column` VALUES ('188', '19', 'be_answer', '回复人', 'int(255)', 'Long', 'beAnswer', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '9', 'admin', '2020-10-09 12:44:23', '', '2020-10-09 12:47:01');
INSERT INTO `gen_table_column` VALUES ('189', '19', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', null, null, null, '1', '1', 'EQ', 'datetime', '', '10', 'admin', '2020-10-09 12:44:23', '', '2020-10-09 12:47:01');
INSERT INTO `gen_table_column` VALUES ('190', '19', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', null, null, null, '1', '1', 'EQ', 'datetime', '', '11', 'admin', '2020-10-09 12:44:23', '', '2020-10-09 12:47:01');
INSERT INTO `gen_table_column` VALUES ('191', '19', 'del_time', '删除时间', 'datetime', 'Date', 'delTime', '0', '0', null, null, null, null, null, 'EQ', 'datetime', '', '12', 'admin', '2020-10-09 12:44:23', '', '2020-10-09 12:47:01');
INSERT INTO `gen_table_column` VALUES ('192', '19', 'del_flag', '删除标识符', 'int(1)', 'Integer', 'delFlag', '0', '0', null, null, null, null, null, 'EQ', 'input', '', '13', 'admin', '2020-10-09 12:44:23', '', '2020-10-09 12:47:01');
INSERT INTO `gen_table_column` VALUES ('193', '20', 'slt_id', '歌单类型编号', 'int(11)', 'Long', 'sltId', '1', '0', null, null, null, '1', '1', 'EQ', 'input', '', '1', 'admin', '2020-10-09 12:47:54', '', '2020-10-09 13:32:57');
INSERT INTO `gen_table_column` VALUES ('194', '20', 'slt_name', '歌单名称', 'varchar(50)', 'String', 'sltName', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '2', 'admin', '2020-10-09 12:47:54', '', '2020-10-09 13:32:57');
INSERT INTO `gen_table_column` VALUES ('195', '20', 'del_flag', '删除标识符', 'int(1)', 'Integer', 'delFlag', '0', '0', null, null, null, null, null, 'EQ', 'input', '', '3', 'admin', '2020-10-09 12:47:54', '', '2020-10-09 13:32:57');
INSERT INTO `gen_table_column` VALUES ('196', '20', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', null, null, null, '1', '1', 'EQ', 'datetime', '', '4', 'admin', '2020-10-09 12:47:54', '', '2020-10-09 13:32:57');
INSERT INTO `gen_table_column` VALUES ('197', '20', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', null, null, null, '1', '1', 'EQ', 'datetime', '', '5', 'admin', '2020-10-09 12:47:54', '', '2020-10-09 13:32:57');
INSERT INTO `gen_table_column` VALUES ('198', '20', 'del_time', '删除时间', 'datetime', 'Date', 'delTime', '0', '0', null, null, null, null, null, 'EQ', 'datetime', '', '6', 'admin', '2020-10-09 12:47:54', '', '2020-10-09 13:32:57');
INSERT INTO `gen_table_column` VALUES ('199', '21', 'pri_id', '特权编号', 'int(11)', 'Long', 'priId', '1', '1', null, null, null, '1', '1', 'EQ', 'input', '', '1', 'admin', '2020-10-09 23:36:35', '', '2020-10-09 23:37:45');
INSERT INTO `gen_table_column` VALUES ('200', '21', 'pri_name', '特权名', 'varchar(50)', 'String', 'priName', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '2', 'admin', '2020-10-09 23:36:35', '', '2020-10-09 23:37:45');
INSERT INTO `gen_table_column` VALUES ('201', '21', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', null, null, null, '1', '1', 'EQ', 'datetime', '', '3', 'admin', '2020-10-09 23:36:35', '', '2020-10-09 23:37:45');
INSERT INTO `gen_table_column` VALUES ('202', '21', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', null, null, null, '1', '1', 'EQ', 'datetime', '', '4', 'admin', '2020-10-09 23:36:35', '', '2020-10-09 23:37:45');
INSERT INTO `gen_table_column` VALUES ('203', '21', 'del_time', '删除时间', 'datetime', 'Date', 'delTime', '0', '0', null, null, null, null, null, 'EQ', 'datetime', '', '5', 'admin', '2020-10-09 23:36:35', '', '2020-10-09 23:37:45');
INSERT INTO `gen_table_column` VALUES ('204', '21', 'del_flag', '删除标识符', 'int(1)', 'Integer', 'delFlag', '0', '0', null, null, null, null, null, 'EQ', 'input', '', '6', 'admin', '2020-10-09 23:36:35', '', '2020-10-09 23:37:45');

-- ----------------------------
-- Table structure for lyric
-- ----------------------------
DROP TABLE IF EXISTS `lyric`;
CREATE TABLE `lyric` (
  `lyr_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '歌词id',
  `lyr_name` varchar(50) DEFAULT NULL COMMENT '歌词名',
  `lyr_url` varchar(255) DEFAULT NULL COMMENT '文件地址',
  `issuing_date` datetime DEFAULT NULL COMMENT '发行时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_time` datetime DEFAULT NULL COMMENT '删除时间',
  `del_flag` int(1) NOT NULL DEFAULT '0' COMMENT '删除标识符',
  PRIMARY KEY (`lyr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lyric
-- ----------------------------
INSERT INTO `lyric` VALUES ('1', '有没有那么一首歌', '/static/lrc/youmeiynamoyishouge.lrc', '2020-10-23 14:54:40', '2020-10-23 14:54:43', null, null, '0');
INSERT INTO `lyric` VALUES ('2', '海阔天空', '/static/lrc/8e496d133287434a933dcb63a5de8982-47933972-00000000.lrc', '2020-10-24 23:07:41', null, null, null, '0');
INSERT INTO `lyric` VALUES ('3', '海口', '/static/lrc/8e808666555643cba18eb433c282b9c9-38654327-00000000.lrc', '2020-10-13 23:07:44', null, null, null, '0');
INSERT INTO `lyric` VALUES ('4', '最长的电影', '/static/lrc/c068d5983ac7cab286137dc4f3217318-48219263-00000000.lrc', '2020-10-27 23:07:47', null, null, null, '0');
INSERT INTO `lyric` VALUES ('5', ' 等你下课', '/static/lrc/718567d263c17bb3945b596cdd887c27-37577696-00000000.lrc', '2020-10-14 23:07:50', null, null, null, '0');
INSERT INTO `lyric` VALUES ('6', '给我一首歌的时间', '/static/lrc/15aa32948dca48649077253257f19654-39364112-00000023.lrc', '2020-10-20 23:07:54', null, null, null, '0');
INSERT INTO `lyric` VALUES ('7', '大鱼', '/static/lrc/3b15f1e26c4f8e24d5c7129fb61d487a-34034503-00000000.lrc', '2020-10-21 23:07:58', null, null, null, '0');
INSERT INTO `lyric` VALUES ('8', '错的人', '/static/lrc/a71fe3a1b430c5295528914309efdd9b-37240615-00000000.lrc', '2020-10-20 23:08:01', null, null, null, '0');
INSERT INTO `lyric` VALUES ('9', '春天花会开', '/static/lrc/25cb2dbfc3749f5ce80ecdfbfe1f321b-26094536-000000B9.lrc', '2020-10-13 00:55:11', null, null, null, '0');
INSERT INTO `lyric` VALUES ('10', '男孩', '/static/lrc/ae12165f6b0aa82c2b3ae9f23cf4085a-34455869-00000017.lrc', null, null, null, null, '0');

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `m_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '会员编号',
  `valid_day` int(11) NOT NULL DEFAULT '0' COMMENT '有效天数',
  `m_grade` int(3) DEFAULT NULL COMMENT '等级',
  `user_id` int(11) NOT NULL COMMENT '用户编号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_time` datetime DEFAULT NULL COMMENT '删除时间',
  `del_flag` int(1) NOT NULL DEFAULT '0' COMMENT '删除标识符',
  PRIMARY KEY (`m_id`),
  UNIQUE KEY `userId` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------

-- ----------------------------
-- Table structure for operate
-- ----------------------------
DROP TABLE IF EXISTS `operate`;
CREATE TABLE `operate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `o_id` varchar(50) DEFAULT NULL COMMENT '功能唯一标识',
  `o_name` varchar(50) DEFAULT NULL COMMENT '操作名',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `type` int(2) DEFAULT NULL COMMENT '0:表示歌单，1表示歌曲，2表示本地歌曲',
  PRIMARY KEY (`id`),
  UNIQUE KEY `oId` (`o_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operate
-- ----------------------------
INSERT INTO `operate` VALUES ('1', 'song:add_sl', '加入新到歌单', '/static/icon/icon_col.png', null);
INSERT INTO `operate` VALUES ('2', 'song:col', '收藏到歌单', '/static/icon/icon_col.png', null);
INSERT INTO `operate` VALUES ('3', 'song:del', '删除', '/static/icon/icon_del.png', null);
INSERT INTO `operate` VALUES ('4', 'song:download', '下载', '/static/icon/icon_download.png', null);
INSERT INTO `operate` VALUES ('5', 'song:set_ring', '设为铃声', '/static/icon/icon_ring.png', null);

-- ----------------------------
-- Table structure for privilege
-- ----------------------------
DROP TABLE IF EXISTS `privilege`;
CREATE TABLE `privilege` (
  `pri_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '特权编号',
  `pri_name` varchar(50) DEFAULT NULL COMMENT '特权名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_time` datetime DEFAULT NULL COMMENT '删除时间',
  `del_flag` int(1) NOT NULL DEFAULT '0' COMMENT '删除标识符',
  PRIMARY KEY (`pri_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of privilege
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
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
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
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

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
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', null, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200094C0009626567696E54696D6571007E00094C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0007656E6454696D6571007E00094C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C78707074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E07870707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', null, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200094C0009626567696E54696D6571007E00094C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0007656E6454696D6571007E00094C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C78707074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E07870707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', null, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200094C0009626567696E54696D6571007E00094C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0007656E6454696D6571007E00094C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C78707074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E07870707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

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
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

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
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'PC-2020060202101604161788432', '1604203684860', '15000');

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
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
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
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
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
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', null, '1604161790000', '-1', '5', 'PAUSED', 'CRON', '1604161788000', '0', null, '2', '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', null, '1604161800000', '-1', '5', 'PAUSED', 'CRON', '1604161788000', '0', null, '2', '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', null, '1604161800000', '-1', '5', 'PAUSED', 'CRON', '1604161788000', '0', null, '2', '');

-- ----------------------------
-- Table structure for recharge
-- ----------------------------
DROP TABLE IF EXISTS `recharge`;
CREATE TABLE `recharge` (
  `rec_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '充值id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `amount` int(11) DEFAULT NULL COMMENT '充值金额',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_time` datetime DEFAULT NULL COMMENT '删除时间',
  `del_flag` int(1) NOT NULL DEFAULT '0' COMMENT '删除标识符',
  PRIMARY KEY (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of recharge
-- ----------------------------

-- ----------------------------
-- Table structure for singer
-- ----------------------------
DROP TABLE IF EXISTS `singer`;
CREATE TABLE `singer` (
  `sin_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '歌手编号',
  `sin_name` varchar(50) DEFAULT NULL COMMENT '歌手名',
  `nickname` varchar(50) DEFAULT NULL COMMENT '歌手昵称',
  `sex` int(1) DEFAULT NULL COMMENT '性别',
  `year` int(3) DEFAULT NULL COMMENT '年龄',
  `sin_type` int(1) DEFAULT '0' COMMENT '歌手类型',
  `area` varchar(255) DEFAULT NULL COMMENT '住址',
  `song_number` int(8) NOT NULL DEFAULT '0' COMMENT '歌曲编号',
  `follower_number` int(8) NOT NULL DEFAULT '0' COMMENT '关注数',
  `album_number` int(8) NOT NULL DEFAULT '0' COMMENT '专辑数',
  `mv_number` int(8) NOT NULL DEFAULT '0' COMMENT 'mv数',
  `detail` varchar(255) DEFAULT NULL COMMENT '详情',
  `influence_power` varchar(255) DEFAULT NULL COMMENT '影响力',
  `cert_info` varchar(255) DEFAULT NULL COMMENT '认证信息',
  `early_exp` varchar(255) DEFAULT NULL COMMENT '早期经历',
  `performing_exp` varchar(255) DEFAULT NULL COMMENT '演绎经历',
  `del_flag` int(1) NOT NULL DEFAULT '0' COMMENT '删除标识符',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_time` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`sin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of singer
-- ----------------------------
INSERT INTO `singer` VALUES ('1', '周华健', null, '1', null, '0', null, '0', '0', '0', '0', null, null, null, null, null, '0', null, null, null);
INSERT INTO `singer` VALUES ('2', '林俊杰', null, '1', null, '0', null, '0', '0', '0', '0', null, null, null, null, null, '0', null, null, null);
INSERT INTO `singer` VALUES ('3', '周杰伦', null, '1', null, '0', null, '0', '0', '0', '0', null, null, null, null, null, '0', null, null, null);
INSERT INTO `singer` VALUES ('4', '周深', null, '1', null, '0', null, '0', '0', '0', '0', null, null, null, null, null, '0', null, null, null);
INSERT INTO `singer` VALUES ('5', '后弦', null, '1', null, '0', null, '0', '0', '0', '0', null, null, null, null, null, '0', null, null, null);
INSERT INTO `singer` VALUES ('6', '杨雨衡', null, '1', null, '0', null, '0', '0', '0', '0', null, null, null, null, null, '0', null, null, null);
INSERT INTO `singer` VALUES ('7', '松果', null, '1', null, '0', null, '0', '0', '0', '0', null, null, null, null, null, '0', null, null, null);
INSERT INTO `singer` VALUES ('8', '梁博', null, '1', null, '0', null, '0', '0', '0', '0', null, null, null, null, null, '0', null, null, null);
INSERT INTO `singer` VALUES ('9', '任贤齐', null, '1', null, '0', null, '0', '0', '0', '0', null, null, null, null, null, '0', null, null, null);

-- ----------------------------
-- Table structure for song
-- ----------------------------
DROP TABLE IF EXISTS `song`;
CREATE TABLE `song` (
  `song_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '歌曲id',
  `song_name` varchar(50) DEFAULT NULL COMMENT '歌曲名',
  `cover_picture` varchar(255) DEFAULT NULL COMMENT '封面',
  `lyr_id` int(11) DEFAULT NULL COMMENT '歌词id',
  `duration` int(11) DEFAULT NULL COMMENT '时长',
  `standard_url` varchar(255) DEFAULT NULL COMMENT '标注音质(S)',
  `hq_url` varchar(255) DEFAULT NULL COMMENT '高品质（HQ）',
  `sq_url` varchar(255) DEFAULT NULL COMMENT '超音质（SQ）',
  `wit_pre_url` varchar(255) DEFAULT NULL COMMENT '无损（WP）',
  `issuing_date` datetime DEFAULT NULL COMMENT '发行时间',
  `mv_url` varchar(255) DEFAULT NULL COMMENT 'mv',
  `is_charge` int(1) NOT NULL DEFAULT '0' COMMENT '是否收费',
  `is_copyright` int(1) NOT NULL DEFAULT '1' COMMENT '是否有版权',
  `is_single` int(1) NOT NULL DEFAULT '1' COMMENT '是否是单曲',
  `sl_id` int(11) DEFAULT '0' COMMENT '歌单id',
  `sin_id` int(11) DEFAULT NULL COMMENT '歌手编号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_time` datetime DEFAULT NULL COMMENT '删除时间',
  `del_flag` int(1) NOT NULL DEFAULT '0' COMMENT '删除标识符',
  PRIMARY KEY (`song_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of song
-- ----------------------------
INSERT INTO `song` VALUES ('1', '大鱼', '/static/images/zhoushen1.jpg', '7', null, '/static/mp3/zhoujielun-nengbunenggeiwoyishougedeshijan.mp3', '', null, null, null, null, '0', '1', '1', '0', null, null, null, null, '0');
INSERT INTO `song` VALUES ('2', '海口', '/static/images/youth.jpg', '3', null, '/static/mp3/zhoujielun-nengbunenggeiwoyishougedeshijan.mp3', '', null, null, null, null, '0', '1', '1', '0', null, null, null, null, '0');
INSERT INTO `song` VALUES ('3', '海阔天空', '/static/images/youth.jpg', '2', null, '/static/mp3/zhoujielun-nengbunenggeiwoyishougedeshijan.mp3', '', null, null, null, null, '0', '1', '1', '0', null, null, null, null, '0');
INSERT INTO `song` VALUES ('4', '大鸟', '/static/images/zhoushen.jpg', null, null, '/static/mp3/zhoujielun-nengbunenggeiwoyishougedeshijan.mp3', '', null, null, null, null, '0', '1', '1', '0', null, null, null, null, '0');
INSERT INTO `song` VALUES ('5', '有没有那么一首歌', '/static/images/zhoushen.jpg', '1', null, '/static/mp3/zhoujielun-nengbunenggeiwoyishougedeshijan.mp3', null, null, null, null, null, '0', '1', '1', '0', null, null, null, null, '0');
INSERT INTO `song` VALUES ('6', '错的人', '/static/images/zhoushen1.jpg', '8', null, '/static/mp3/zhoujielun-nengbunenggeiwoyishougedeshijan.mp3', null, null, null, null, null, '0', '1', '1', '0', null, null, null, null, '0');
INSERT INTO `song` VALUES ('7', '等你下课', '/static/images/youth.jpg', '5', null, '/static/mp3/zhoujielun-nengbunenggeiwoyishougedeshijan.mp3', null, null, null, null, null, '0', '1', '1', '0', null, null, null, null, '0');
INSERT INTO `song` VALUES ('8', '一首歌的时间', '/static/images/youth.jpg', '6', null, '/static/mp3/zhoujielun-nengbunenggeiwoyishougedeshijan.mp3', null, null, null, null, null, '0', '1', '1', '0', null, null, null, null, '0');
INSERT INTO `song` VALUES ('9', '最长的电影', '/static/images/youth.jpg', '4', null, '/static/mp3/zhoujielun-nengbunenggeiwoyishougedeshijan.mp3', null, null, null, null, null, '0', '1', '1', '0', null, null, null, null, '0');
INSERT INTO `song` VALUES ('10', '不想睡', '/static/images/youth.png', null, null, '/static/mp3/zhoujielun-nengbunenggeiwoyishougedeshijan.mp3', null, null, null, null, null, '0', '1', '1', '0', null, null, null, null, '0');
INSERT INTO `song` VALUES ('11', '我不愿让你一个人', '/static/images/youth.jpg', null, null, '/static/mp3/zhoujielun-nengbunenggeiwoyishougedeshijan.mp3', null, null, null, null, null, '0', '1', '1', '0', null, null, null, null, '0');
INSERT INTO `song` VALUES ('12', '男孩', '/static/images/zhoushen.jpg', '10', null, '/static/mp3/liangbo-nanhai.flac', null, null, null, null, null, '0', '1', '1', '0', null, null, null, null, '0');
INSERT INTO `song` VALUES ('13', '春天花会开', '/static/images/zhoushen1.jpg', '9', null, '/static/mp3/renxianqi-chuntianhuahuikai.flac', null, null, null, null, null, '0', '1', '1', '0', null, null, null, null, '0');

-- ----------------------------
-- Table structure for songlist
-- ----------------------------
DROP TABLE IF EXISTS `songlist`;
CREATE TABLE `songlist` (
  `sl_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '歌单id',
  `sl_name` varchar(50) DEFAULT NULL COMMENT '歌单名',
  `cover_picture` varchar(255) DEFAULT NULL COMMENT '歌单封面',
  `sl_title` varchar(50) DEFAULT NULL COMMENT '标题',
  `play_number` int(8) NOT NULL DEFAULT '0' COMMENT '播放量',
  `song_number` int(8) NOT NULL DEFAULT '0' COMMENT '歌曲数',
  `col_number` int(8) NOT NULL DEFAULT '0' COMMENT '收藏量',
  `comments_number` int(8) NOT NULL DEFAULT '0' COMMENT '评论量',
  `share_number` int(8) NOT NULL DEFAULT '0' COMMENT '分享量',
  `create_by_id` int(11) DEFAULT NULL COMMENT '歌单创建者',
  `detail` varchar(255) DEFAULT NULL COMMENT '详情',
  `is_album` int(1) NOT NULL DEFAULT '0' COMMENT '是否是专辑',
  `sin_id` int(11) DEFAULT NULL COMMENT '歌手',
  `is_public` int(1) NOT NULL DEFAULT '1' COMMENT '是否公开',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_time` datetime DEFAULT NULL COMMENT '删除时间',
  `del_flag` int(1) NOT NULL DEFAULT '0' COMMENT '删除标识符',
  PRIMARY KEY (`sl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of songlist
-- ----------------------------
INSERT INTO `songlist` VALUES ('5', '我喜欢的音乐', '/static/images/youth.jpg', null, '0', '0', '0', '0', '0', '3', '它什么都没留下........', '0', null, '1', '2020-10-14 23:04:32', '2020-10-28 23:04:38', null, '0');
INSERT INTO `songlist` VALUES ('6', '周深', '/static/images/zhoushen.jpg', null, '0', '0', '0', '0', '0', '3', '它什么都没留下........', '0', null, '1', '2020-10-14 22:40:10', '2020-10-28 23:04:40', null, '0');
INSERT INTO `songlist` VALUES ('7', '周杰伦', '/static/images/不想睡-封面.png', null, '0', '0', '0', '0', '0', '3', '它什么都没留下........', '0', null, '1', '2020-10-28 23:04:35', '2020-10-28 23:04:43', null, '0');
INSERT INTO `songlist` VALUES ('9', '林俊杰', null, null, '0', '0', '0', '0', '0', '3', '它什么都没留下........', '0', null, '1', '2020-10-26 09:15:47', '2020-10-28 23:04:47', null, '0');

-- ----------------------------
-- Table structure for songlist_songlisttype
-- ----------------------------
DROP TABLE IF EXISTS `songlist_songlisttype`;
CREATE TABLE `songlist_songlisttype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sl_id` int(11) DEFAULT NULL COMMENT '歌单id',
  `slt_id` int(11) DEFAULT NULL COMMENT '歌单类型id',
  `del_flag` int(1) NOT NULL DEFAULT '0' COMMENT '删除标识符',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_time` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of songlist_songlisttype
-- ----------------------------

-- ----------------------------
-- Table structure for songlist_type
-- ----------------------------
DROP TABLE IF EXISTS `songlist_type`;
CREATE TABLE `songlist_type` (
  `slt_id` int(11) NOT NULL COMMENT '歌单类型编号',
  `slt_name` varchar(50) DEFAULT NULL COMMENT '歌单名称',
  `del_flag` int(1) NOT NULL DEFAULT '0' COMMENT '删除标识符',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_time` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`slt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of songlist_type
-- ----------------------------

-- ----------------------------
-- Table structure for song_singer
-- ----------------------------
DROP TABLE IF EXISTS `song_singer`;
CREATE TABLE `song_singer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `song_id` int(11) DEFAULT NULL COMMENT '歌单编号',
  `sin_id` int(11) DEFAULT NULL COMMENT '歌手编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of song_singer
-- ----------------------------
INSERT INTO `song_singer` VALUES ('1', '5', '1');
INSERT INTO `song_singer` VALUES ('2', '1', '4');
INSERT INTO `song_singer` VALUES ('3', '2', '5');
INSERT INTO `song_singer` VALUES ('4', '6', '6');
INSERT INTO `song_singer` VALUES ('5', '6', '7');
INSERT INTO `song_singer` VALUES ('6', '7', '3');
INSERT INTO `song_singer` VALUES ('7', '8', '3');
INSERT INTO `song_singer` VALUES ('8', '9', '3');
INSERT INTO `song_singer` VALUES ('9', '4', '2');
INSERT INTO `song_singer` VALUES ('11', '12', '8');
INSERT INTO `song_singer` VALUES ('12', '13', '9');

-- ----------------------------
-- Table structure for song_songlist
-- ----------------------------
DROP TABLE IF EXISTS `song_songlist`;
CREATE TABLE `song_songlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sl_id` int(11) DEFAULT NULL,
  `song_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of song_songlist
-- ----------------------------
INSERT INTO `song_songlist` VALUES ('1', '5', '1');
INSERT INTO `song_songlist` VALUES ('2', '5', '2');
INSERT INTO `song_songlist` VALUES ('3', '6', '1');
INSERT INTO `song_songlist` VALUES ('6', '5', '4');
INSERT INTO `song_songlist` VALUES ('13', '6', '10');
INSERT INTO `song_songlist` VALUES ('17', '6', '12');
INSERT INTO `song_songlist` VALUES ('18', '5', '13');
INSERT INTO `song_songlist` VALUES ('19', '5', '12');
INSERT INTO `song_songlist` VALUES ('21', '9', '6');
INSERT INTO `song_songlist` VALUES ('22', '5', '6');
INSERT INTO `song_songlist` VALUES ('23', '7', '8');

-- ----------------------------
-- Table structure for song_songtype
-- ----------------------------
DROP TABLE IF EXISTS `song_songtype`;
CREATE TABLE `song_songtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `song_id` int(11) DEFAULT NULL COMMENT '歌曲id',
  `st_id` int(11) DEFAULT NULL COMMENT '歌曲类型id',
  `del_flag` int(1) NOT NULL DEFAULT '0' COMMENT '删除标识符',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_time` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of song_songtype
-- ----------------------------

-- ----------------------------
-- Table structure for song_type
-- ----------------------------
DROP TABLE IF EXISTS `song_type`;
CREATE TABLE `song_type` (
  `st_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类型id',
  `st_name` varchar(255) DEFAULT NULL COMMENT '类型名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_time` datetime DEFAULT NULL COMMENT '删除时间',
  `del_flag` int(1) NOT NULL DEFAULT '0' COMMENT '删除标识符',
  PRIMARY KEY (`st_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of song_type
-- ----------------------------
INSERT INTO `song_type` VALUES ('1', '中国风', '2020-10-12 15:13:40', null, null, '0');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES ('2', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '初始化密码 123456');
INSERT INTO `sys_config` VALUES ('3', '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '深色主题theme-dark，浅色主题theme-light');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
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
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('100', '0', '0', '若依科技', '0', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-10-09 23:47:12');
INSERT INTO `sys_dept` VALUES ('101', '100', '0,100', '深圳总公司', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('102', '100', '0,100', '长沙分公司', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('103', '101', '0,100,101', '研发部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('104', '101', '0,100,101', '市场部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('105', '101', '0,100,101', '测试部门', '3', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('106', '101', '0,100,101', '财务部门', '4', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('107', '101', '0,100,101', '运维部门', '5', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('108', '102', '0,100,102', '市场部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('109', '102', '0,100,102', '财务部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('110', '100', '0,100', '多芬音乐公司', '3', '周日月', '18307884396', '1742204618@qq.com', '0', '0', 'admin', '2020-10-09 23:47:02', 'admin', '2020-10-09 23:47:12');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='字典数据表';

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
INSERT INTO `sys_dict_data` VALUES ('10', '1', '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '默认分组');
INSERT INTO `sys_dict_data` VALUES ('11', '2', '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统分组');
INSERT INTO `sys_dict_data` VALUES ('12', '1', '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认是');
INSERT INTO `sys_dict_data` VALUES ('13', '2', '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认否');
INSERT INTO `sys_dict_data` VALUES ('14', '1', '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知');
INSERT INTO `sys_dict_data` VALUES ('15', '2', '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '公告');
INSERT INTO `sys_dict_data` VALUES ('16', '1', '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('17', '2', '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '关闭状态');
INSERT INTO `sys_dict_data` VALUES ('18', '1', '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES ('19', '2', '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '修改操作');
INSERT INTO `sys_dict_data` VALUES ('20', '3', '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '删除操作');
INSERT INTO `sys_dict_data` VALUES ('21', '4', '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '授权操作');
INSERT INTO `sys_dict_data` VALUES ('22', '5', '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导出操作');
INSERT INTO `sys_dict_data` VALUES ('23', '6', '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导入操作');
INSERT INTO `sys_dict_data` VALUES ('24', '7', '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '强退操作');
INSERT INTO `sys_dict_data` VALUES ('25', '8', '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '生成操作');
INSERT INTO `sys_dict_data` VALUES ('26', '9', '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '清空操作');
INSERT INTO `sys_dict_data` VALUES ('27', '1', '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('28', '2', '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
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
INSERT INTO `sys_dict_type` VALUES ('5', '任务分组', 'sys_job_group', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务分组列表');
INSERT INTO `sys_dict_type` VALUES ('6', '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES ('7', '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知类型列表');
INSERT INTO `sys_dict_type` VALUES ('8', '通知状态', 'sys_notice_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES ('9', '操作类型', 'sys_oper_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES ('10', '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES ('1', '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES ('2', '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES ('3', '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
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
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8 COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES ('100', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2020-10-09 01:34:59');
INSERT INTO `sys_logininfor` VALUES ('101', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-10-09 01:35:06');
INSERT INTO `sys_logininfor` VALUES ('102', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-10-09 09:52:24');
INSERT INTO `sys_logininfor` VALUES ('103', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2020-10-09 10:25:48');
INSERT INTO `sys_logininfor` VALUES ('104', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-10-09 10:25:53');
INSERT INTO `sys_logininfor` VALUES ('105', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-10-09 10:34:59');
INSERT INTO `sys_logininfor` VALUES ('106', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-10-09 10:48:42');
INSERT INTO `sys_logininfor` VALUES ('107', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码已失效', '2020-10-09 11:47:51');
INSERT INTO `sys_logininfor` VALUES ('108', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2020-10-09 11:47:54');
INSERT INTO `sys_logininfor` VALUES ('109', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-10-09 11:47:58');
INSERT INTO `sys_logininfor` VALUES ('110', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-10-09 12:37:56');
INSERT INTO `sys_logininfor` VALUES ('111', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-10-09 13:28:37');
INSERT INTO `sys_logininfor` VALUES ('112', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-10-09 13:43:17');
INSERT INTO `sys_logininfor` VALUES ('113', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-10-09 13:45:36');
INSERT INTO `sys_logininfor` VALUES ('114', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-10-09 23:30:38');
INSERT INTO `sys_logininfor` VALUES ('115', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-10-09 23:48:31');
INSERT INTO `sys_logininfor` VALUES ('116', 'client', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-10-09 23:48:37');
INSERT INTO `sys_logininfor` VALUES ('117', 'client', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-10-09 23:50:07');
INSERT INTO `sys_logininfor` VALUES ('118', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-10-09 23:50:17');
INSERT INTO `sys_logininfor` VALUES ('119', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-10-09 23:52:17');
INSERT INTO `sys_logininfor` VALUES ('120', 'client', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-10-09 23:52:22');
INSERT INTO `sys_logininfor` VALUES ('121', 'client', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-10-12 14:57:48');
INSERT INTO `sys_logininfor` VALUES ('122', 'client', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-10-12 15:00:28');
INSERT INTO `sys_logininfor` VALUES ('123', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-10-12 15:00:35');
INSERT INTO `sys_logininfor` VALUES ('124', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-10-12 15:04:09');
INSERT INTO `sys_logininfor` VALUES ('125', 'client', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-10-12 15:04:18');
INSERT INTO `sys_logininfor` VALUES ('126', 'client', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-10-12 15:04:42');
INSERT INTO `sys_logininfor` VALUES ('127', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-10-12 15:04:50');
INSERT INTO `sys_logininfor` VALUES ('128', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-10-12 15:04:57');
INSERT INTO `sys_logininfor` VALUES ('129', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-10-12 15:05:03');
INSERT INTO `sys_logininfor` VALUES ('130', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-10-12 15:12:07');
INSERT INTO `sys_logininfor` VALUES ('131', 'client', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-10-12 15:12:13');
INSERT INTO `sys_logininfor` VALUES ('132', 'client', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-10-14 11:39:30');
INSERT INTO `sys_logininfor` VALUES ('133', 'client', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-10-14 11:40:01');
INSERT INTO `sys_logininfor` VALUES ('134', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2020-10-14 11:40:08');
INSERT INTO `sys_logininfor` VALUES ('135', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-10-14 11:40:12');
INSERT INTO `sys_logininfor` VALUES ('136', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2020-10-14 13:35:50');
INSERT INTO `sys_logininfor` VALUES ('137', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-10-14 13:35:54');
INSERT INTO `sys_logininfor` VALUES ('138', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-10-26 15:16:20');
INSERT INTO `sys_logininfor` VALUES ('139', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-10-26 15:16:58');
INSERT INTO `sys_logininfor` VALUES ('140', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-26 15:17:17');
INSERT INTO `sys_logininfor` VALUES ('141', 'zhouriyue', '127.0.0.1', '内网IP', 'Internet Explorer 11', 'Windows 10', '1', '用户不存在/密码错误', '2020-10-28 20:29:45');
INSERT INTO `sys_logininfor` VALUES ('142', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-10-28 20:29:59');
INSERT INTO `sys_logininfor` VALUES ('143', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-28 20:30:04');
INSERT INTO `sys_logininfor` VALUES ('144', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-28 22:44:57');
INSERT INTO `sys_logininfor` VALUES ('145', 'zhouriyue', '127.0.0.1', '内网IP', 'Internet Explorer 11', 'Windows 10', '1', '用户不存在/密码错误', '2020-10-28 23:04:53');
INSERT INTO `sys_logininfor` VALUES ('146', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-10-28 23:07:10');
INSERT INTO `sys_logininfor` VALUES ('147', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-28 23:07:13');
INSERT INTO `sys_logininfor` VALUES ('148', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-28 23:09:07');
INSERT INTO `sys_logininfor` VALUES ('149', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-28 23:30:49');
INSERT INTO `sys_logininfor` VALUES ('150', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-31 17:12:59');
INSERT INTO `sys_logininfor` VALUES ('151', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-31 17:31:09');
INSERT INTO `sys_logininfor` VALUES ('152', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-31 18:00:16');
INSERT INTO `sys_logininfor` VALUES ('153', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-31 18:02:12');
INSERT INTO `sys_logininfor` VALUES ('154', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-31 18:09:56');
INSERT INTO `sys_logininfor` VALUES ('155', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-31 18:34:09');
INSERT INTO `sys_logininfor` VALUES ('156', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-31 19:01:52');
INSERT INTO `sys_logininfor` VALUES ('157', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-31 21:54:58');
INSERT INTO `sys_logininfor` VALUES ('158', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-31 22:36:26');
INSERT INTO `sys_logininfor` VALUES ('159', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-31 22:55:14');
INSERT INTO `sys_logininfor` VALUES ('160', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-31 22:57:30');
INSERT INTO `sys_logininfor` VALUES ('161', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-31 23:03:13');
INSERT INTO `sys_logininfor` VALUES ('162', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-31 23:20:17');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `is_frame` int(1) DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2110 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '1', 'system', null, '1', '0', 'M', '0', '0', '', 'system', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统管理目录');
INSERT INTO `sys_menu` VALUES ('2', '系统监控', '0', '2', 'monitor', null, '1', '0', 'M', '0', '0', '', 'monitor', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统监控目录');
INSERT INTO `sys_menu` VALUES ('3', '系统工具', '0', '3', 'tool', null, '1', '0', 'M', '0', '0', '', 'tool', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统工具目录');
INSERT INTO `sys_menu` VALUES ('4', '若依官网', '0', '4', 'http://ruoyi.vip', null, '0', '0', 'M', '0', '0', '', 'guide', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '若依官网地址');
INSERT INTO `sys_menu` VALUES ('100', '用户管理', '1', '1', 'user', 'system/user/index', '1', '0', 'C', '0', '0', 'system:user:list', 'user', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户管理菜单');
INSERT INTO `sys_menu` VALUES ('101', '角色管理', '1', '2', 'role', 'system/role/index', '1', '0', 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '角色管理菜单');
INSERT INTO `sys_menu` VALUES ('102', '菜单管理', '1', '3', 'menu', 'system/menu/index', '1', '0', 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES ('103', '部门管理', '1', '4', 'dept', 'system/dept/index', '1', '0', 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '部门管理菜单');
INSERT INTO `sys_menu` VALUES ('104', '岗位管理', '1', '5', 'post', 'system/post/index', '1', '0', 'C', '0', '0', 'system:post:list', 'post', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES ('105', '字典管理', '1', '6', 'dict', 'system/dict/index', '1', '0', 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '字典管理菜单');
INSERT INTO `sys_menu` VALUES ('106', '参数设置', '1', '7', 'config', 'system/config/index', '1', '0', 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '参数设置菜单');
INSERT INTO `sys_menu` VALUES ('107', '通知公告', '1', '8', 'notice', 'system/notice/index', '1', '0', 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知公告菜单');
INSERT INTO `sys_menu` VALUES ('108', '日志管理', '1', '9', 'log', 'system/log/index', '1', '0', 'M', '0', '0', '', 'log', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '日志管理菜单');
INSERT INTO `sys_menu` VALUES ('109', '在线用户', '2', '1', 'online', 'monitor/online/index', '1', '0', 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '在线用户菜单');
INSERT INTO `sys_menu` VALUES ('110', '定时任务', '2', '2', 'job', 'monitor/job/index', '1', '0', 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '定时任务菜单');
INSERT INTO `sys_menu` VALUES ('111', '数据监控', '2', '3', 'druid', 'monitor/druid/index', '1', '0', 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '数据监控菜单');
INSERT INTO `sys_menu` VALUES ('112', '服务监控', '2', '4', 'server', 'monitor/server/index', '1', '0', 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '服务监控菜单');
INSERT INTO `sys_menu` VALUES ('113', '表单构建', '3', '1', 'build', 'tool/build/index', '1', '0', 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '表单构建菜单');
INSERT INTO `sys_menu` VALUES ('114', '代码生成', '3', '2', 'gen', 'tool/gen/index', '1', '0', 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '代码生成菜单');
INSERT INTO `sys_menu` VALUES ('115', '系统接口', '3', '3', 'swagger', 'tool/swagger/index', '1', '0', 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统接口菜单');
INSERT INTO `sys_menu` VALUES ('500', '操作日志', '108', '1', 'operlog', 'monitor/operlog/index', '1', '0', 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作日志菜单');
INSERT INTO `sys_menu` VALUES ('501', '登录日志', '108', '2', 'logininfor', 'monitor/logininfor/index', '1', '0', 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录日志菜单');
INSERT INTO `sys_menu` VALUES ('1001', '用户查询', '100', '1', '', '', '1', '0', 'F', '0', '0', 'system:user:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1002', '用户新增', '100', '2', '', '', '1', '0', 'F', '0', '0', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1003', '用户修改', '100', '3', '', '', '1', '0', 'F', '0', '0', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1004', '用户删除', '100', '4', '', '', '1', '0', 'F', '0', '0', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1005', '用户导出', '100', '5', '', '', '1', '0', 'F', '0', '0', 'system:user:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1006', '用户导入', '100', '6', '', '', '1', '0', 'F', '0', '0', 'system:user:import', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1007', '重置密码', '100', '7', '', '', '1', '0', 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1008', '角色查询', '101', '1', '', '', '1', '0', 'F', '0', '0', 'system:role:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1009', '角色新增', '101', '2', '', '', '1', '0', 'F', '0', '0', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1010', '角色修改', '101', '3', '', '', '1', '0', 'F', '0', '0', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1011', '角色删除', '101', '4', '', '', '1', '0', 'F', '0', '0', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1012', '角色导出', '101', '5', '', '', '1', '0', 'F', '0', '0', 'system:role:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1013', '菜单查询', '102', '1', '', '', '1', '0', 'F', '0', '0', 'system:menu:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1014', '菜单新增', '102', '2', '', '', '1', '0', 'F', '0', '0', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1015', '菜单修改', '102', '3', '', '', '1', '0', 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1016', '菜单删除', '102', '4', '', '', '1', '0', 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1017', '部门查询', '103', '1', '', '', '1', '0', 'F', '0', '0', 'system:dept:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1018', '部门新增', '103', '2', '', '', '1', '0', 'F', '0', '0', 'system:dept:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1019', '部门修改', '103', '3', '', '', '1', '0', 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1020', '部门删除', '103', '4', '', '', '1', '0', 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1021', '岗位查询', '104', '1', '', '', '1', '0', 'F', '0', '0', 'system:post:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1022', '岗位新增', '104', '2', '', '', '1', '0', 'F', '0', '0', 'system:post:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1023', '岗位修改', '104', '3', '', '', '1', '0', 'F', '0', '0', 'system:post:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1024', '岗位删除', '104', '4', '', '', '1', '0', 'F', '0', '0', 'system:post:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1025', '岗位导出', '104', '5', '', '', '1', '0', 'F', '0', '0', 'system:post:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1026', '字典查询', '105', '1', '#', '', '1', '0', 'F', '0', '0', 'system:dict:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1027', '字典新增', '105', '2', '#', '', '1', '0', 'F', '0', '0', 'system:dict:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1028', '字典修改', '105', '3', '#', '', '1', '0', 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1029', '字典删除', '105', '4', '#', '', '1', '0', 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1030', '字典导出', '105', '5', '#', '', '1', '0', 'F', '0', '0', 'system:dict:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1031', '参数查询', '106', '1', '#', '', '1', '0', 'F', '0', '0', 'system:config:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1032', '参数新增', '106', '2', '#', '', '1', '0', 'F', '0', '0', 'system:config:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1033', '参数修改', '106', '3', '#', '', '1', '0', 'F', '0', '0', 'system:config:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1034', '参数删除', '106', '4', '#', '', '1', '0', 'F', '0', '0', 'system:config:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1035', '参数导出', '106', '5', '#', '', '1', '0', 'F', '0', '0', 'system:config:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1036', '公告查询', '107', '1', '#', '', '1', '0', 'F', '0', '0', 'system:notice:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1037', '公告新增', '107', '2', '#', '', '1', '0', 'F', '0', '0', 'system:notice:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1038', '公告修改', '107', '3', '#', '', '1', '0', 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1039', '公告删除', '107', '4', '#', '', '1', '0', 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1040', '操作查询', '500', '1', '#', '', '1', '0', 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1041', '操作删除', '500', '2', '#', '', '1', '0', 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1042', '日志导出', '500', '4', '#', '', '1', '0', 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1043', '登录查询', '501', '1', '#', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1044', '登录删除', '501', '2', '#', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1045', '日志导出', '501', '3', '#', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1046', '在线查询', '109', '1', '#', '', '1', '0', 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1047', '批量强退', '109', '2', '#', '', '1', '0', 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1048', '单条强退', '109', '3', '#', '', '1', '0', 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1049', '任务查询', '110', '1', '#', '', '1', '0', 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1050', '任务新增', '110', '2', '#', '', '1', '0', 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1051', '任务修改', '110', '3', '#', '', '1', '0', 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1052', '任务删除', '110', '4', '#', '', '1', '0', 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1053', '状态修改', '110', '5', '#', '', '1', '0', 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1054', '任务导出', '110', '7', '#', '', '1', '0', 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1055', '生成查询', '114', '1', '#', '', '1', '0', 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1056', '生成修改', '114', '2', '#', '', '1', '0', 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1057', '生成删除', '114', '3', '#', '', '1', '0', 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1058', '导入代码', '114', '2', '#', '', '1', '0', 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1059', '预览代码', '114', '4', '#', '', '1', '0', 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1060', '生成代码', '114', '5', '#', '', '1', '0', 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('2008', '歌单管理', '0', '5', 'songlist', 'business/songlist/index', '1', '0', 'C', '0', '0', 'business:songlist:list', 'user', 'admin', '2018-03-01 00:00:00', 'admin', '2020-10-12 15:09:36', '歌单菜单');
INSERT INTO `sys_menu` VALUES ('2009', '歌单查询', '2008', '1', '#', '', '1', '0', 'F', '0', '0', 'business:songlist:query', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2010', '歌单新增', '2008', '2', '#', '', '1', '0', 'F', '0', '0', 'business:songlist:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2011', '歌单修改', '2008', '3', '#', '', '1', '0', 'F', '0', '0', 'business:songlist:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2012', '歌单删除', '2008', '4', '#', '', '1', '0', 'F', '0', '0', 'business:songlist:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2013', '歌单导出', '2008', '5', '#', '', '1', '0', 'F', '0', '0', 'business:songlist:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2014', '特权管理', '0', '15', 'privilege', 'business/privilege/index', '1', '0', 'C', '0', '0', 'business:privilege:list', 'component', 'admin', '2018-03-01 00:00:00', 'admin', '2020-10-12 15:11:50', '特权菜单');
INSERT INTO `sys_menu` VALUES ('2015', '特权查询', '2014', '1', '#', '', '1', '0', 'F', '0', '0', 'business:privilege:query', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2016', '特权新增', '2014', '2', '#', '', '1', '0', 'F', '0', '0', 'business:privilege:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2017', '特权修改', '2014', '3', '#', '', '1', '0', 'F', '0', '0', 'business:privilege:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2018', '特权删除', '2014', '4', '#', '', '1', '0', 'F', '0', '0', 'business:privilege:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2019', '特权导出', '2014', '5', '#', '', '1', '0', 'F', '0', '0', 'business:privilege:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2038', '下载信息', '0', '16', 'download', 'business/download/index', '1', '0', 'C', '0', '0', 'business:download:list', 'upload', 'admin', '2018-03-01 00:00:00', 'admin', '2020-10-12 15:12:01', '下载信息菜单');
INSERT INTO `sys_menu` VALUES ('2039', '下载信息查询', '2038', '1', '#', '', '1', '0', 'F', '0', '0', 'business:download:query', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2040', '下载信息新增', '2038', '2', '#', '', '1', '0', 'F', '0', '0', 'business:download:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2041', '下载信息修改', '2038', '3', '#', '', '1', '0', 'F', '0', '0', 'business:download:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2042', '下载信息删除', '2038', '4', '#', '', '1', '0', 'F', '0', '0', 'business:download:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2043', '下载信息导出', '2038', '5', '#', '', '1', '0', 'F', '0', '0', 'business:download:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2044', '歌词管理', '0', '10', 'lyric', 'business/lyric/index', '1', '0', 'C', '0', '0', 'business:lyric:list', 'education', 'admin', '2018-03-01 00:00:00', 'admin', '2020-10-12 15:11:04', '歌词菜单');
INSERT INTO `sys_menu` VALUES ('2045', '歌词查询', '2044', '1', '#', '', '1', '0', 'F', '0', '0', 'business:lyric:query', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2046', '歌词新增', '2044', '2', '#', '', '1', '0', 'F', '0', '0', 'business:lyric:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2047', '歌词修改', '2044', '3', '#', '', '1', '0', 'F', '0', '0', 'business:lyric:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2048', '歌词删除', '2044', '4', '#', '', '1', '0', 'F', '0', '0', 'business:lyric:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2049', '歌词导出', '2044', '5', '#', '', '1', '0', 'F', '0', '0', 'business:lyric:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2050', '会员信息管理', '0', '13', 'member', 'business/member/index', '1', '0', 'C', '0', '0', 'business:member:list', 'qq', 'admin', '2018-03-01 00:00:00', 'admin', '2020-10-12 15:11:33', '会员菜单');
INSERT INTO `sys_menu` VALUES ('2051', '会员查询', '2050', '1', '#', '', '1', '0', 'F', '0', '0', 'business:member:query', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2052', '会员新增', '2050', '2', '#', '', '1', '0', 'F', '0', '0', 'business:member:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2053', '会员修改', '2050', '3', '#', '', '1', '0', 'F', '0', '0', 'business:member:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2054', '会员删除', '2050', '4', '#', '', '1', '0', 'F', '0', '0', 'business:member:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2055', '会员导出', '2050', '5', '#', '', '1', '0', 'F', '0', '0', 'business:member:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2056', '充值信息管理', '0', '14', 'recharge', 'business/recharge/index', '1', '0', 'C', '0', '0', 'business:recharge:list', 'documentation', 'admin', '2018-03-01 00:00:00', 'admin', '2020-10-12 15:11:41', '充值信息菜单');
INSERT INTO `sys_menu` VALUES ('2057', '充值信息查询', '2056', '1', '#', '', '1', '0', 'F', '0', '0', 'business:recharge:query', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2058', '充值信息新增', '2056', '2', '#', '', '1', '0', 'F', '0', '0', 'business:recharge:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2059', '充值信息修改', '2056', '3', '#', '', '1', '0', 'F', '0', '0', 'business:recharge:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2060', '充值信息删除', '2056', '4', '#', '', '1', '0', 'F', '0', '0', 'business:recharge:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2061', '充值信息导出', '2056', '5', '#', '', '1', '0', 'F', '0', '0', 'business:recharge:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2062', '歌手信息管理', '0', '6', 'singer', 'business/singer/index', '1', '0', 'C', '0', '0', 'business:singer:list', 'user', 'admin', '2018-03-01 00:00:00', 'admin', '2020-10-12 15:10:03', '歌手菜单');
INSERT INTO `sys_menu` VALUES ('2063', '歌手查询', '2062', '1', '#', '', '1', '0', 'F', '0', '0', 'business:singer:query', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2064', '歌手新增', '2062', '2', '#', '', '1', '0', 'F', '0', '0', 'business:singer:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2065', '歌手修改', '2062', '3', '#', '', '1', '0', 'F', '0', '0', 'business:singer:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2066', '歌手删除', '2062', '4', '#', '', '1', '0', 'F', '0', '0', 'business:singer:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2067', '歌手导出', '2062', '5', '#', '', '1', '0', 'F', '0', '0', 'business:singer:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2074', '曲库管理', '0', '8', 'song', 'business/song/index', '1', '0', 'C', '0', '0', 'business:song:list', 'documentation', 'admin', '2018-03-01 00:00:00', 'admin', '2020-10-12 15:10:48', '歌曲菜单');
INSERT INTO `sys_menu` VALUES ('2075', '歌曲查询', '2074', '1', '#', '', '1', '0', 'F', '0', '0', 'business:song:query', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2076', '歌曲新增', '2074', '2', '#', '', '1', '0', 'F', '0', '0', 'business:song:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2077', '歌曲修改', '2074', '3', '#', '', '1', '0', 'F', '0', '0', 'business:song:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2078', '歌曲删除', '2074', '4', '#', '', '1', '0', 'F', '0', '0', 'business:song:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2079', '歌曲导出', '2074', '5', '#', '', '1', '0', 'F', '0', '0', 'business:song:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2080', '歌单收藏', '0', '9', 'collectiones', 'business/collectiones/index', '1', '0', 'C', '0', '0', 'business:collectiones:list', 'clipboard', 'admin', '2018-03-01 00:00:00', 'admin', '2020-10-12 15:10:56', '歌单收藏菜单');
INSERT INTO `sys_menu` VALUES ('2081', '歌单收藏查询', '2080', '1', '#', '', '1', '0', 'F', '0', '0', 'business:collectiones:query', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2082', '歌单收藏新增', '2080', '2', '#', '', '1', '0', 'F', '0', '0', 'business:collectiones:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2083', '歌单收藏修改', '2080', '3', '#', '', '1', '0', 'F', '0', '0', 'business:collectiones:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2084', '歌单收藏删除', '2080', '4', '#', '', '1', '0', 'F', '0', '0', 'business:collectiones:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2085', '歌单收藏导出', '2080', '5', '#', '', '1', '0', 'F', '0', '0', 'business:collectiones:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2086', '歌曲类型', '0', '7', 'songtype', 'business/songtype/index', '1', '0', 'C', '0', '0', 'business:songtype:list', 'form', 'admin', '2018-03-01 00:00:00', 'admin', '2020-10-12 15:10:38', '歌曲类型菜单');
INSERT INTO `sys_menu` VALUES ('2087', '歌曲类型查询', '2086', '1', '#', '', '1', '0', 'F', '0', '0', 'business:songtype:query', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2088', '歌曲类型新增', '2086', '2', '#', '', '1', '0', 'F', '0', '0', 'business:songtype:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2089', '歌曲类型修改', '2086', '3', '#', '', '1', '0', 'F', '0', '0', 'business:songtype:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2090', '歌曲类型删除', '2086', '4', '#', '', '1', '0', 'F', '0', '0', 'business:songtype:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2091', '歌曲类型导出', '2086', '5', '#', '', '1', '0', 'F', '0', '0', 'business:songtype:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2092', '评论管理', '0', '12', 'comment', 'business/comment/index', '1', '0', 'C', '0', '0', 'business:comment:list', 'tool', 'admin', '2018-03-01 00:00:00', 'admin', '2020-10-12 15:11:23', '评论菜单');
INSERT INTO `sys_menu` VALUES ('2093', '评论查询', '2092', '1', '#', '', '1', '0', 'F', '0', '0', 'business:comment:query', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2094', '评论新增', '2092', '2', '#', '', '1', '0', 'F', '0', '0', 'business:comment:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2095', '评论修改', '2092', '3', '#', '', '1', '0', 'F', '0', '0', 'business:comment:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2096', '评论删除', '2092', '4', '#', '', '1', '0', 'F', '0', '0', 'business:comment:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2097', '评论导出', '2092', '5', '#', '', '1', '0', 'F', '0', '0', 'business:comment:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2104', '歌单类型管理', '0', '11', 'songlisttype', 'business/songlisttype/index', '1', '0', 'C', '0', '0', 'business:songlisttype:list', 'example', 'admin', '2018-03-01 00:00:00', 'admin', '2020-10-12 15:11:14', '歌单类型管理菜单');
INSERT INTO `sys_menu` VALUES ('2105', '歌单类型管理查询', '2104', '1', '#', '', '1', '0', 'F', '0', '0', 'business:songlisttype:query', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2106', '歌单类型管理新增', '2104', '2', '#', '', '1', '0', 'F', '0', '0', 'business:songlisttype:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2107', '歌单类型管理修改', '2104', '3', '#', '', '1', '0', 'F', '0', '0', 'business:songlisttype:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2108', '歌单类型管理删除', '2104', '4', '#', '', '1', '0', 'F', '0', '0', 'business:songlisttype:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2109', '歌单类型管理导出', '2104', '5', '#', '', '1', '0', 'F', '0', '0', 'business:songlisttype:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('1', '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_notice` VALUES ('2', '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=289 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('100', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'songlist', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 01:35:51');
INSERT INTO `sys_oper_log` VALUES ('101', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', '0', null, '2020-10-09 01:36:16');
INSERT INTO `sys_oper_log` VALUES ('102', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"server\",\"orderNum\":\"1\",\"menuName\":\"业务管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"system\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 01:44:58');
INSERT INTO `sys_oper_log` VALUES ('103', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"chart\",\"orderNum\":\"1\",\"menuName\":\"歌单管理\",\"params\":{},\"parentId\":2006,\"isCache\":\"0\",\"path\":\"songlist\",\"component\":\"system/songlist/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"C\",\"perms\":\"system:songlist:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 01:45:20');
INSERT INTO `sys_oper_log` VALUES ('104', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"server\",\"orderNum\":\"2\",\"menuName\":\"业务管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"system\",\"children\":[],\"createTime\":1602179098000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2006,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 01:45:59');
INSERT INTO `sys_oper_log` VALUES ('105', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"server\",\"orderNum\":\"3\",\"menuName\":\"业务管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"system\",\"children\":[],\"createTime\":1602179098000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2006,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 01:46:04');
INSERT INTO `sys_oper_log` VALUES ('106', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"server\",\"orderNum\":\"4\",\"menuName\":\"业务管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"system\",\"children\":[],\"createTime\":1602179098000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2006,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 01:46:08');
INSERT INTO `sys_oper_log` VALUES ('107', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"server\",\"orderNum\":\"5\",\"menuName\":\"业务管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"system\",\"children\":[],\"createTime\":1602179098000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2006,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 01:46:12');
INSERT INTO `sys_oper_log` VALUES ('108', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"server\",\"orderNum\":\"5\",\"menuName\":\"业务管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"business\",\"children\":[],\"createTime\":1602179098000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2006,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 01:46:49');
INSERT INTO `sys_oper_log` VALUES ('109', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', '0', null, '2020-10-09 02:01:14');
INSERT INTO `sys_oper_log` VALUES ('110', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2006', '127.0.0.1', '内网IP', '{menuId=2006}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}', '0', null, '2020-10-09 09:52:46');
INSERT INTO `sys_oper_log` VALUES ('111', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2000', '127.0.0.1', '内网IP', '{menuId=2000}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}', '0', null, '2020-10-09 09:52:50');
INSERT INTO `sys_oper_log` VALUES ('112', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2005', '127.0.0.1', '内网IP', '{menuId=2005}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 09:52:57');
INSERT INTO `sys_oper_log` VALUES ('113', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2004', '127.0.0.1', '内网IP', '{menuId=2004}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 09:53:00');
INSERT INTO `sys_oper_log` VALUES ('114', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2003', '127.0.0.1', '内网IP', '{menuId=2003}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 09:53:02');
INSERT INTO `sys_oper_log` VALUES ('115', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2002', '127.0.0.1', '内网IP', '{menuId=2002}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 09:53:04');
INSERT INTO `sys_oper_log` VALUES ('116', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2001', '127.0.0.1', '内网IP', '{menuId=2001}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 09:53:06');
INSERT INTO `sys_oper_log` VALUES ('117', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2000', '127.0.0.1', '内网IP', '{menuId=2000}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 09:53:08');
INSERT INTO `sys_oper_log` VALUES ('118', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2006', '127.0.0.1', '内网IP', '{menuId=2006}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 09:53:10');
INSERT INTO `sys_oper_log` VALUES ('119', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"checkbox\",\"orderNum\":\"2\",\"menuName\":\"业务管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"business\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 09:56:41');
INSERT INTO `sys_oper_log` VALUES ('120', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"ruoyi\",\"columns\":[{\"usableColumn\":false,\"columnId\":1,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"slId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"歌单id\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1602178551000,\"tableId\":1,\"pk\":true,\"columnName\":\"sl_id\"},{\"usableColumn\":false,\"columnId\":2,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"slName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"歌单名\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602178551000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"sl_name\"},{\"usableColumn\":false,\"columnId\":3,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"coverPicture\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"歌单封面\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602178551000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"cover_picture\"},{\"usableColumn\":false,\"columnId\":4,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"slTitle\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"标题\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602178551000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"sl_title\"},{\"usab', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 10:01:14');
INSERT INTO `sys_oper_log` VALUES ('121', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"ruoyi\",\"columns\":[{\"usableColumn\":false,\"columnId\":1,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"slId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"歌单id\",\"updateTime\":1602208874000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1602178551000,\"tableId\":1,\"pk\":true,\"columnName\":\"sl_id\"},{\"usableColumn\":false,\"columnId\":2,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"slName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"歌单名\",\"isQuery\":\"1\",\"updateTime\":1602208874000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602178551000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"sl_name\"},{\"usableColumn\":false,\"columnId\":3,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"coverPicture\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"歌单封面\",\"isQuery\":\"1\",\"updateTime\":1602208874000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602178551000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"cover_picture\"},{\"usableColumn\":false,\"columnId\":4,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"slTitle\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"标题\",\"isQuery\":\"1\",\"updateTime\":1602208874000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(50)\",\"createBy\":\"admi', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 10:04:10');
INSERT INTO `sys_oper_log` VALUES ('122', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"zhouriyue\",\"columns\":[{\"usableColumn\":false,\"columnId\":1,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"slId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"歌单id\",\"updateTime\":1602209050000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1602178551000,\"tableId\":1,\"pk\":true,\"columnName\":\"sl_id\"},{\"usableColumn\":false,\"columnId\":2,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"slName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"歌单名\",\"isQuery\":\"1\",\"updateTime\":1602209050000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602178551000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"sl_name\"},{\"usableColumn\":false,\"columnId\":3,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"coverPicture\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"歌单封面\",\"isQuery\":\"1\",\"updateTime\":1602209050000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602178551000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"cover_picture\"},{\"usableColumn\":false,\"columnId\":4,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"slTitle\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"标题\",\"isQuery\":\"1\",\"updateTime\":1602209050000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(50)\",\"createBy\":\"', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 10:04:47');
INSERT INTO `sys_oper_log` VALUES ('123', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"zhouriyue\",\"columns\":[{\"usableColumn\":false,\"columnId\":1,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"slId\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"歌单id\",\"isQuery\":\"1\",\"updateTime\":1602209087000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1602178551000,\"tableId\":1,\"pk\":true,\"columnName\":\"sl_id\"},{\"usableColumn\":false,\"columnId\":2,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"slName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"歌单名\",\"isQuery\":\"1\",\"updateTime\":1602209087000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602178551000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"sl_name\"},{\"usableColumn\":false,\"columnId\":3,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"coverPicture\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"歌单封面\",\"isQuery\":\"1\",\"updateTime\":1602209087000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602178551000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"cover_picture\"},{\"usableColumn\":false,\"columnId\":4,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"slTitle\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"标题\",\"isQuery\":\"1\",\"updateTime\":1602209087000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(50)\",\"createBy\":\"a', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 10:06:06');
INSERT INTO `sys_oper_log` VALUES ('124', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"zhouriyue\",\"columns\":[{\"usableColumn\":false,\"columnId\":1,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"slId\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"歌单id\",\"isQuery\":\"1\",\"updateTime\":1602209166000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1602178551000,\"tableId\":1,\"pk\":true,\"columnName\":\"sl_id\"},{\"usableColumn\":false,\"columnId\":2,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"slName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"歌单名\",\"isQuery\":\"1\",\"updateTime\":1602209166000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602178551000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"sl_name\"},{\"usableColumn\":false,\"columnId\":3,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"coverPicture\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"歌单封面\",\"isQuery\":\"1\",\"updateTime\":1602209166000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602178551000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"cover_picture\"},{\"usableColumn\":false,\"columnId\":4,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"slTitle\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"标题\",\"isQuery\":\"1\",\"updateTime\":1602209166000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(50)\",\"createBy\":\"a', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 10:06:24');
INSERT INTO `sys_oper_log` VALUES ('125', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', '0', null, '2020-10-09 10:06:27');
INSERT INTO `sys_oper_log` VALUES ('126', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"zhouriyue\",\"columns\":[{\"usableColumn\":false,\"columnId\":1,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"slId\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"歌单id\",\"isQuery\":\"1\",\"updateTime\":1602209184000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1602178551000,\"tableId\":1,\"pk\":true,\"columnName\":\"sl_id\"},{\"usableColumn\":false,\"columnId\":2,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"slName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"歌单名\",\"isQuery\":\"1\",\"updateTime\":1602209184000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602178551000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"sl_name\"},{\"usableColumn\":false,\"columnId\":3,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"coverPicture\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"歌单封面\",\"isQuery\":\"1\",\"updateTime\":1602209184000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602178551000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"cover_picture\"},{\"usableColumn\":false,\"columnId\":4,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"slTitle\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"标题\",\"isQuery\":\"1\",\"updateTime\":1602209184000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(50)\",\"createBy\":\"a', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 10:11:13');
INSERT INTO `sys_oper_log` VALUES ('127', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', '0', null, '2020-10-09 10:11:16');
INSERT INTO `sys_oper_log` VALUES ('128', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 10:37:11');
INSERT INTO `sys_oper_log` VALUES ('129', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'collection', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 10:37:35');
INSERT INTO `sys_oper_log` VALUES ('130', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'download,lyric,member,privilege,recharge,singer,song,song_songtype,song_type', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 10:37:47');
INSERT INTO `sys_oper_log` VALUES ('131', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'comment,songlist_songlisttype,songlist_type', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 10:38:37');
INSERT INTO `sys_oper_log` VALUES ('132', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"ruoyi\",\"columns\":[{\"usableColumn\":false,\"columnId\":19,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"colId\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"收藏id\",\"isQuery\":\"1\",\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1602211055000,\"tableId\":2,\"pk\":true,\"columnName\":\"col_id\"},{\"usableColumn\":false,\"columnId\":20,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"slId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"歌单id\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602211055000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"sl_id\"},{\"usableColumn\":false,\"columnId\":21,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"collectBy\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"收藏者\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602211055000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"collect_by\"},{\"usableColumn\":false,\"columnId\":22,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":true,\"updateBy\":\"\",\"javaField\":\"createTime\",\"htmlType\":\"datetime\",\"edit\":false,\"query\":true,\"columnComment\":\"创建时间\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602211055000,\"tableId\":2,\"pk\":false,\"columnName\":\"create_time\"},{\"usableColumn\":false,\"columnId\":23,\"isIncrement\":\"', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 10:40:21');
INSERT INTO `sys_oper_log` VALUES ('133', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"ruoyi\",\"columns\":[{\"usableColumn\":false,\"columnId\":26,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"dlId\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"下载id\",\"isQuery\":\"1\",\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1602211066000,\"tableId\":3,\"pk\":true,\"columnName\":\"dl_id\"},{\"usableColumn\":false,\"columnId\":27,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"userId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"用户id\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602211066000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"user_id\"},{\"usableColumn\":false,\"columnId\":28,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"songId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"歌曲id\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602211066000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"song_id\"},{\"usableColumn\":false,\"columnId\":29,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"toneQuality\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"下载音质\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(10)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602211066000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"tone_quality\"},{\"usableColumn\":false,\"', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 10:41:35');
INSERT INTO `sys_oper_log` VALUES ('134', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"ruoyi\",\"columns\":[{\"usableColumn\":false,\"columnId\":35,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"lyrId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"歌词id\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1602211066000,\"tableId\":4,\"pk\":true,\"columnName\":\"lyr_id\"},{\"usableColumn\":false,\"columnId\":36,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"lyrName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"歌词名\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602211066000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"lyr_name\"},{\"usableColumn\":false,\"columnId\":37,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"lyrUrl\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"文件地址\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602211066000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"lyr_url\"},{\"usableColumn\":false,\"columnId\":38,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"issuingDate\",\"htmlType\":\"datetime\",\"edit\":true,\"query\":true,\"columnComment\":\"发行时间\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602211066000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"issuing_date\"},{\"usableColumn\":fa', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 10:42:41');
INSERT INTO `sys_oper_log` VALUES ('135', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"ruoyi\",\"columns\":[{\"usableColumn\":false,\"columnId\":35,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"lyrId\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"歌词id\",\"isQuery\":\"1\",\"updateTime\":1602211361000,\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1602211066000,\"tableId\":4,\"pk\":true,\"columnName\":\"lyr_id\"},{\"usableColumn\":false,\"columnId\":36,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"lyrName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"歌词名\",\"isQuery\":\"1\",\"updateTime\":1602211361000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602211066000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"lyr_name\"},{\"usableColumn\":false,\"columnId\":37,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"lyrUrl\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"文件地址\",\"isQuery\":\"1\",\"updateTime\":1602211361000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602211066000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"lyr_url\"},{\"usableColumn\":false,\"columnId\":38,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"issuingDate\",\"htmlType\":\"datetime\",\"edit\":true,\"query\":true,\"columnComment\":\"发行时间\",\"isQuery\":\"1\",\"updateTime\":1602211361000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"i', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 10:43:09');
INSERT INTO `sys_oper_log` VALUES ('136', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"ruoyi\",\"columns\":[{\"usableColumn\":false,\"columnId\":43,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"mId\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"isQuery\":\"1\",\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1602211066000,\"tableId\":5,\"pk\":true,\"columnName\":\"m_id\"},{\"usableColumn\":false,\"columnId\":44,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"mGrade\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(3)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602211066000,\"isEdit\":\"1\",\"tableId\":5,\"pk\":false,\"columnName\":\"m_grade\"},{\"usableColumn\":false,\"columnId\":45,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"userId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602211066000,\"isEdit\":\"1\",\"tableId\":5,\"pk\":false,\"columnName\":\"user_id\"},{\"usableColumn\":false,\"columnId\":46,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":true,\"updateBy\":\"\",\"javaField\":\"createTime\",\"htmlType\":\"datetime\",\"edit\":false,\"query\":true,\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602211066000,\"tableId\":5,\"pk\":false,\"columnName\":\"create_time\"},{\"usableColumn\":false,\"columnId\":47,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":t', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 10:44:15');
INSERT INTO `sys_oper_log` VALUES ('137', '歌单', '3', 'com.ruoyi.web.controller.business.SonglistController.remove()', 'DELETE', '1', 'admin', null, '/business/songlist/1', '127.0.0.1', '内网IP', '{slIds=1}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 10:49:13');
INSERT INTO `sys_oper_log` VALUES ('138', '代码生成', '3', 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', '1', 'admin', null, '/tool/gen/6', '127.0.0.1', '内网IP', '{tableIds=6}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 10:54:48');
INSERT INTO `sys_oper_log` VALUES ('139', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'privilege', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 10:54:52');
INSERT INTO `sys_oper_log` VALUES ('140', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"ruoyi\",\"columns\":[{\"usableColumn\":false,\"columnId\":55,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"recId\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"充值id\",\"isQuery\":\"1\",\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1602211066000,\"tableId\":7,\"pk\":true,\"columnName\":\"rec_id\"},{\"usableColumn\":false,\"columnId\":56,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"userId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"用户id\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602211066000,\"isEdit\":\"1\",\"tableId\":7,\"pk\":false,\"columnName\":\"user_id\"},{\"usableColumn\":false,\"columnId\":57,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"amount\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"充值金额\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602211066000,\"isEdit\":\"1\",\"tableId\":7,\"pk\":false,\"columnName\":\"amount\"},{\"usableColumn\":false,\"columnId\":58,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":true,\"updateBy\":\"\",\"javaField\":\"createTime\",\"htmlType\":\"datetime\",\"edit\":false,\"query\":true,\"columnComment\":\"创建时间\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602211066000,\"tableId\":7,\"pk\":false,\"columnName\":\"create_time\"},{\"usableColumn\":false,\"columnId\":59,\"isIncrement\":\"0\"', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 10:56:01');
INSERT INTO `sys_oper_log` VALUES ('141', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"ruoyi\",\"columns\":[{\"usableColumn\":false,\"columnId\":62,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"sinId\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"isQuery\":\"1\",\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1602211066000,\"tableId\":8,\"pk\":true,\"columnName\":\"sin_id\"},{\"usableColumn\":false,\"columnId\":63,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sinName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602211066000,\"isEdit\":\"1\",\"tableId\":8,\"pk\":false,\"columnName\":\"sin_name\"},{\"usableColumn\":false,\"columnId\":64,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"nickname\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602211066000,\"isEdit\":\"1\",\"tableId\":8,\"pk\":false,\"columnName\":\"nickname\"},{\"usableColumn\":false,\"columnId\":65,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sex\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(1)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602211066000,\"isEdit\":\"1\",\"tableId\":8,\"pk\":false,\"columnName\":\"sex\"},{\"usableColumn\":false,\"columnId\":66,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\"', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 10:57:09');
INSERT INTO `sys_oper_log` VALUES ('142', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"ruoyi\",\"columns\":[{\"usableColumn\":false,\"columnId\":82,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"songId\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"歌曲id\",\"isQuery\":\"1\",\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1602211066000,\"tableId\":9,\"pk\":true,\"columnName\":\"song_id\"},{\"usableColumn\":false,\"columnId\":83,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"songName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"歌曲名\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602211066000,\"isEdit\":\"1\",\"tableId\":9,\"pk\":false,\"columnName\":\"song_name\"},{\"usableColumn\":false,\"columnId\":84,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sinId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"歌手id\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602211066000,\"isEdit\":\"1\",\"tableId\":9,\"pk\":false,\"columnName\":\"sin_id\"},{\"usableColumn\":false,\"columnId\":85,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"duration\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"时长\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602211066000,\"isEdit\":\"1\",\"tableId\":9,\"pk\":false,\"columnName\":\"duration\"},{\"usableColumn\":false,\"co', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 10:58:29');
INSERT INTO `sys_oper_log` VALUES ('143', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"ruoyi\",\"columns\":[{\"usableColumn\":false,\"columnId\":101,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"isQuery\":\"1\",\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1602211066000,\"tableId\":10,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":102,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"songId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"歌曲id\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602211066000,\"isEdit\":\"1\",\"tableId\":10,\"pk\":false,\"columnName\":\"song_id\"},{\"usableColumn\":false,\"columnId\":103,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"stId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"歌曲类型id\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602211066000,\"isEdit\":\"1\",\"tableId\":10,\"pk\":false,\"columnName\":\"st_id\"},{\"usableColumn\":false,\"columnId\":104,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"delFlag\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"删除标识符\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(1)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602211066000,\"isEdit\":\"1\",\"tableId\":10,\"pk\":false,\"columnName\":\"del_flag\"},{\"usableColumn\":false,\"columnId\":105,\"isIncrement\":\"0\",\"', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 10:59:42');
INSERT INTO `sys_oper_log` VALUES ('144', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"ruoyi\",\"columns\":[{\"usableColumn\":false,\"columnId\":108,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"stId\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"类型id\",\"isQuery\":\"1\",\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1602211066000,\"tableId\":11,\"pk\":true,\"columnName\":\"st_id\"},{\"usableColumn\":false,\"columnId\":109,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"stName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"类型名\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602211066000,\"isEdit\":\"1\",\"tableId\":11,\"pk\":false,\"columnName\":\"st_name\"},{\"usableColumn\":false,\"columnId\":110,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":true,\"updateBy\":\"\",\"javaField\":\"createTime\",\"htmlType\":\"datetime\",\"edit\":false,\"query\":true,\"columnComment\":\"创建时间\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602211066000,\"tableId\":11,\"pk\":false,\"columnName\":\"create_time\"},{\"usableColumn\":false,\"columnId\":111,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":true,\"updateBy\":\"\",\"javaField\":\"updateTime\",\"htmlType\":\"datetime\",\"edit\":false,\"query\":true,\"columnComment\":\"更新时间\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602211066000,\"tableId\":11,\"pk\":false,\"columnName\":\"update_time\"},{\"usableColumn\":false,\"columnId\":112,\"isIncrement\":\"0', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 11:01:24');
INSERT INTO `sys_oper_log` VALUES ('145', '代码生成', '3', 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', '1', 'admin', null, '/tool/gen/10', '127.0.0.1', '内网IP', '{tableIds=10}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 11:02:00');
INSERT INTO `sys_oper_log` VALUES ('146', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"ruoyi\",\"columns\":[{\"usableColumn\":false,\"columnId\":134,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"sltId\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"isQuery\":\"1\",\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1602211117000,\"tableId\":14,\"pk\":true,\"columnName\":\"slt_id\"},{\"usableColumn\":false,\"columnId\":135,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sltName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602211117000,\"isEdit\":\"1\",\"tableId\":14,\"pk\":false,\"columnName\":\"slt_name\"},{\"usableColumn\":false,\"columnId\":136,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"delFlag\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"删除标识符\",\"sort\":3,\"list\":false,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(1)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602211117000,\"tableId\":14,\"pk\":false,\"columnName\":\"del_flag\"},{\"usableColumn\":false,\"columnId\":137,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":true,\"updateBy\":\"\",\"javaField\":\"createTime\",\"htmlType\":\"datetime\",\"edit\":false,\"query\":true,\"columnComment\":\"创建时间\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602211117000,\"tableId\":14,\"pk\":false,\"columnName\":\"create_time\"},{\"usableColumn\":false,\"columnId\":138,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\"', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 11:03:18');
INSERT INTO `sys_oper_log` VALUES ('147', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"ruoyi\",\"columns\":[{\"usableColumn\":false,\"columnId\":140,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"priId\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"isQuery\":\"1\",\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1602212092000,\"tableId\":15,\"pk\":true,\"columnName\":\"pri_id\"},{\"usableColumn\":false,\"columnId\":141,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"priName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602212092000,\"isEdit\":\"1\",\"tableId\":15,\"pk\":false,\"columnName\":\"pri_name\"},{\"usableColumn\":false,\"columnId\":142,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":true,\"updateBy\":\"\",\"javaField\":\"createTime\",\"htmlType\":\"datetime\",\"edit\":false,\"query\":true,\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602212092000,\"tableId\":15,\"pk\":false,\"columnName\":\"create_time\"},{\"usableColumn\":false,\"columnId\":143,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":true,\"updateBy\":\"\",\"javaField\":\"updateTime\",\"htmlType\":\"datetime\",\"edit\":false,\"query\":true,\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602212092000,\"tableId\":15,\"pk\":false,\"columnName\":\"update_time\"},{\"usableColumn\":false,\"columnId\":144,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superCol', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 11:04:58');
INSERT INTO `sys_oper_log` VALUES ('148', '代码生成', '3', 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', '1', 'admin', null, '/tool/gen/13', '127.0.0.1', '内网IP', '{tableIds=13}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 11:05:22');
INSERT INTO `sys_oper_log` VALUES ('149', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"ruoyi\",\"columns\":[{\"usableColumn\":false,\"columnId\":114,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"comId\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"isQuery\":\"1\",\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1602211117000,\"tableId\":12,\"pk\":true,\"columnName\":\"com_id\"},{\"usableColumn\":false,\"columnId\":115,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"userId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602211117000,\"isEdit\":\"1\",\"tableId\":12,\"pk\":false,\"columnName\":\"user_id\"},{\"usableColumn\":false,\"columnId\":116,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"cType\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(1)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602211117000,\"isEdit\":\"1\",\"tableId\":12,\"pk\":false,\"columnName\":\"c_type\"},{\"usableColumn\":false,\"columnId\":117,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"songId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602211117000,\"isEdit\":\"1\",\"tableId\":12,\"pk\":false,\"columnName\":\"song_id\"},{\"usableColumn\":false,\"columnId\":118,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"requi', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 11:06:29');
INSERT INTO `sys_oper_log` VALUES ('150', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', '0', null, '2020-10-09 11:06:56');
INSERT INTO `sys_oper_log` VALUES ('151', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', '0', null, '2020-10-09 11:07:14');
INSERT INTO `sys_oper_log` VALUES ('152', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', '0', null, '2020-10-09 11:07:29');
INSERT INTO `sys_oper_log` VALUES ('153', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', '0', null, '2020-10-09 11:07:37');
INSERT INTO `sys_oper_log` VALUES ('154', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2021', '127.0.0.1', '内网IP', '{menuId=2021}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 11:48:39');
INSERT INTO `sys_oper_log` VALUES ('155', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2022', '127.0.0.1', '内网IP', '{menuId=2022}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 11:48:43');
INSERT INTO `sys_oper_log` VALUES ('156', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2023', '127.0.0.1', '内网IP', '{menuId=2023}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 11:48:47');
INSERT INTO `sys_oper_log` VALUES ('157', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2024', '127.0.0.1', '内网IP', '{menuId=2024}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 11:48:51');
INSERT INTO `sys_oper_log` VALUES ('158', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2025', '127.0.0.1', '内网IP', '{menuId=2025}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 11:48:54');
INSERT INTO `sys_oper_log` VALUES ('159', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2020', '127.0.0.1', '内网IP', '{menuId=2020}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 11:48:57');
INSERT INTO `sys_oper_log` VALUES ('160', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2068', '127.0.0.1', '内网IP', '{menuId=2068}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}', '0', null, '2020-10-09 11:49:17');
INSERT INTO `sys_oper_log` VALUES ('161', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2069', '127.0.0.1', '内网IP', '{menuId=2069}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 11:49:20');
INSERT INTO `sys_oper_log` VALUES ('162', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2070', '127.0.0.1', '内网IP', '{menuId=2070}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 11:49:22');
INSERT INTO `sys_oper_log` VALUES ('163', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2071', '127.0.0.1', '内网IP', '{menuId=2071}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 11:49:24');
INSERT INTO `sys_oper_log` VALUES ('164', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2072', '127.0.0.1', '内网IP', '{menuId=2072}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 11:49:26');
INSERT INTO `sys_oper_log` VALUES ('165', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2073', '127.0.0.1', '内网IP', '{menuId=2073}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 11:49:29');
INSERT INTO `sys_oper_log` VALUES ('166', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2068', '127.0.0.1', '内网IP', '{menuId=2068}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 11:49:31');
INSERT INTO `sys_oper_log` VALUES ('167', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2026', '127.0.0.1', '内网IP', '{menuId=2026}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}', '0', null, '2020-10-09 11:51:24');
INSERT INTO `sys_oper_log` VALUES ('168', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2027', '127.0.0.1', '内网IP', '{menuId=2027}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 11:51:29');
INSERT INTO `sys_oper_log` VALUES ('169', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2028', '127.0.0.1', '内网IP', '{menuId=2028}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 11:51:32');
INSERT INTO `sys_oper_log` VALUES ('170', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2029', '127.0.0.1', '内网IP', '{menuId=2029}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 11:51:36');
INSERT INTO `sys_oper_log` VALUES ('171', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2030', '127.0.0.1', '内网IP', '{menuId=2030}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 11:51:40');
INSERT INTO `sys_oper_log` VALUES ('172', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2031', '127.0.0.1', '内网IP', '{menuId=2031}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 11:51:43');
INSERT INTO `sys_oper_log` VALUES ('173', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2026', '127.0.0.1', '内网IP', '{menuId=2026}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 11:51:48');
INSERT INTO `sys_oper_log` VALUES ('174', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2033', '127.0.0.1', '内网IP', '{menuId=2033}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 11:51:56');
INSERT INTO `sys_oper_log` VALUES ('175', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2034', '127.0.0.1', '内网IP', '{menuId=2034}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 11:51:59');
INSERT INTO `sys_oper_log` VALUES ('176', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2035', '127.0.0.1', '内网IP', '{menuId=2035}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 11:52:02');
INSERT INTO `sys_oper_log` VALUES ('177', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2036', '127.0.0.1', '内网IP', '{menuId=2036}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 11:52:06');
INSERT INTO `sys_oper_log` VALUES ('178', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2037', '127.0.0.1', '内网IP', '{menuId=2037}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 11:52:09');
INSERT INTO `sys_oper_log` VALUES ('179', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2032', '127.0.0.1', '内网IP', '{menuId=2032}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 11:52:12');
INSERT INTO `sys_oper_log` VALUES ('180', '代码生成', '3', 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', '1', 'admin', null, '/tool/gen/2', '127.0.0.1', '内网IP', '{tableIds=2}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 11:56:44');
INSERT INTO `sys_oper_log` VALUES ('181', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"ruoyi\",\"columns\":[{\"usableColumn\":false,\"columnId\":114,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"comId\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"isQuery\":\"1\",\"updateTime\":1602212789000,\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1602211117000,\"tableId\":12,\"pk\":true,\"columnName\":\"com_id\"},{\"usableColumn\":false,\"columnId\":115,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"userId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"isQuery\":\"1\",\"updateTime\":1602212789000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602211117000,\"isEdit\":\"1\",\"tableId\":12,\"pk\":false,\"columnName\":\"user_id\"},{\"usableColumn\":false,\"columnId\":116,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"cType\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"isQuery\":\"1\",\"updateTime\":1602212789000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(1)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602211117000,\"isEdit\":\"1\",\"tableId\":12,\"pk\":false,\"columnName\":\"c_type\"},{\"usableColumn\":false,\"columnId\":117,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"songId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"isQuery\":\"1\",\"updateTime\":1602212789000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602211117000,\"isEdit\":\"1\",\"tableId\":12,\"pk\":false,\"columnName\":\"song_id\"},{\"usableColu', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 11:57:27');
INSERT INTO `sys_oper_log` VALUES ('182', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"ruoyi\",\"columns\":[{\"usableColumn\":false,\"columnId\":108,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"stId\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"类型id\",\"isQuery\":\"1\",\"updateTime\":1602212484000,\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1602211066000,\"tableId\":11,\"pk\":true,\"columnName\":\"st_id\"},{\"usableColumn\":false,\"columnId\":109,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"stName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"类型名\",\"isQuery\":\"1\",\"updateTime\":1602212484000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602211066000,\"isEdit\":\"1\",\"tableId\":11,\"pk\":false,\"columnName\":\"st_name\"},{\"usableColumn\":false,\"columnId\":110,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":true,\"updateBy\":\"\",\"javaField\":\"createTime\",\"htmlType\":\"datetime\",\"edit\":false,\"query\":true,\"columnComment\":\"创建时间\",\"isQuery\":\"1\",\"updateTime\":1602212484000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602211066000,\"tableId\":11,\"pk\":false,\"columnName\":\"create_time\"},{\"usableColumn\":false,\"columnId\":111,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":true,\"updateBy\":\"\",\"javaField\":\"updateTime\",\"htmlType\":\"datetime\",\"edit\":false,\"query\":true,\"columnComment\":\"更新时间\",\"isQuery\":\"1\",\"updateTime\":1602212484000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":16022110660', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 11:57:57');
INSERT INTO `sys_oper_log` VALUES ('183', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"ruoyi\",\"columns\":[{\"usableColumn\":false,\"columnId\":134,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"sltId\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"isQuery\":\"1\",\"updateTime\":1602212598000,\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1602211117000,\"tableId\":14,\"pk\":true,\"columnName\":\"slt_id\"},{\"usableColumn\":false,\"columnId\":135,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sltName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"isQuery\":\"1\",\"updateTime\":1602212598000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602211117000,\"isEdit\":\"1\",\"tableId\":14,\"pk\":false,\"columnName\":\"slt_name\"},{\"usableColumn\":false,\"columnId\":136,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"delFlag\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"删除标识符\",\"updateTime\":1602212598000,\"sort\":3,\"list\":false,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(1)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602211117000,\"tableId\":14,\"pk\":false,\"columnName\":\"del_flag\"},{\"usableColumn\":false,\"columnId\":137,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":true,\"updateBy\":\"\",\"javaField\":\"createTime\",\"htmlType\":\"datetime\",\"edit\":false,\"query\":true,\"columnComment\":\"创建时间\",\"isQuery\":\"1\",\"updateTime\":1602212598000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602211117000,\"tableId\":14,\"pk\":false,\"columnName\":\"create_time\"},{\"usableColumn\":f', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 11:58:17');
INSERT INTO `sys_oper_log` VALUES ('184', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'collectiones', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 11:58:43');
INSERT INTO `sys_oper_log` VALUES ('185', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"ruoyi\",\"columns\":[{\"usableColumn\":false,\"columnId\":146,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"colId\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"收藏id\",\"isQuery\":\"1\",\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1602215923000,\"tableId\":16,\"pk\":true,\"columnName\":\"col_id\"},{\"usableColumn\":false,\"columnId\":147,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"slId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"歌单id\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602215923000,\"isEdit\":\"1\",\"tableId\":16,\"pk\":false,\"columnName\":\"sl_id\"},{\"usableColumn\":false,\"columnId\":148,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"collectBy\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"收藏者\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602215923000,\"isEdit\":\"1\",\"tableId\":16,\"pk\":false,\"columnName\":\"collect_by\"},{\"usableColumn\":false,\"columnId\":149,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":true,\"updateBy\":\"\",\"javaField\":\"createTime\",\"htmlType\":\"datetime\",\"edit\":false,\"query\":true,\"columnComment\":\"创建时间\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602215923000,\"tableId\":16,\"pk\":false,\"columnName\":\"create_time\"},{\"usableColumn\":false,\"columnId\":150,\"isInc', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 12:00:05');
INSERT INTO `sys_oper_log` VALUES ('186', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', '0', null, '2020-10-09 12:00:25');
INSERT INTO `sys_oper_log` VALUES ('187', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', '0', null, '2020-10-09 12:00:45');
INSERT INTO `sys_oper_log` VALUES ('188', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', '0', null, '2020-10-09 12:06:36');
INSERT INTO `sys_oper_log` VALUES ('189', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', '0', null, '2020-10-09 12:07:07');
INSERT INTO `sys_oper_log` VALUES ('190', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', '0', null, '2020-10-09 12:12:55');
INSERT INTO `sys_oper_log` VALUES ('191', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"ruoyi\",\"columns\":[{\"usableColumn\":false,\"columnId\":140,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"priId\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"isQuery\":\"1\",\"updateTime\":1602212698000,\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1602212092000,\"tableId\":15,\"pk\":true,\"columnName\":\"pri_id\"},{\"usableColumn\":false,\"columnId\":141,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"priName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"isQuery\":\"1\",\"updateTime\":1602212698000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602212092000,\"isEdit\":\"1\",\"tableId\":15,\"pk\":false,\"columnName\":\"pri_name\"},{\"usableColumn\":false,\"columnId\":142,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":true,\"updateBy\":\"\",\"javaField\":\"createTime\",\"htmlType\":\"datetime\",\"edit\":false,\"query\":true,\"isQuery\":\"1\",\"updateTime\":1602212698000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602212092000,\"tableId\":15,\"pk\":false,\"columnName\":\"create_time\"},{\"usableColumn\":false,\"columnId\":143,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":true,\"updateBy\":\"\",\"javaField\":\"updateTime\",\"htmlType\":\"datetime\",\"edit\":false,\"query\":true,\"isQuery\":\"1\",\"updateTime\":1602212698000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602212092000,\"tableId\":15,\"pk\":false,\"columnName\":\"update_time\"},{\"usableColumn\":false,\"columnId\":', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 12:18:56');
INSERT INTO `sys_oper_log` VALUES ('192', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', '0', null, '2020-10-09 12:30:59');
INSERT INTO `sys_oper_log` VALUES ('193', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', '0', null, '2020-10-09 12:31:43');
INSERT INTO `sys_oper_log` VALUES ('194', '代码生成', '3', 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', '1', 'admin', null, '/tool/gen/8', '127.0.0.1', '内网IP', '{tableIds=8}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 12:38:59');
INSERT INTO `sys_oper_log` VALUES ('195', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'singer', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 12:39:12');
INSERT INTO `sys_oper_log` VALUES ('196', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"ruoyi\",\"columns\":[{\"usableColumn\":false,\"columnId\":153,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"sinId\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"歌手编号\",\"isQuery\":\"1\",\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1602218352000,\"tableId\":17,\"pk\":true,\"columnName\":\"sin_id\"},{\"usableColumn\":false,\"columnId\":154,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sinName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"歌手名\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602218352000,\"isEdit\":\"1\",\"tableId\":17,\"pk\":false,\"columnName\":\"sin_name\"},{\"usableColumn\":false,\"columnId\":155,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"nickname\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"歌手昵称\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602218352000,\"isEdit\":\"1\",\"tableId\":17,\"pk\":false,\"columnName\":\"nickname\"},{\"usableColumn\":false,\"columnId\":156,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sex\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"性别\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(1)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602218352000,\"isEdit\":\"1\",\"tableId\":17,\"pk\":false,\"columnName\":\"sex\"},{\"usableColumn\"', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 12:41:39');
INSERT INTO `sys_oper_log` VALUES ('197', '代码生成', '3', 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', '1', 'admin', null, '/tool/gen/5', '127.0.0.1', '内网IP', '{tableIds=5}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 12:41:54');
INSERT INTO `sys_oper_log` VALUES ('198', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'member', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 12:42:00');
INSERT INTO `sys_oper_log` VALUES ('199', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"ruoyi\",\"columns\":[{\"usableColumn\":false,\"columnId\":173,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"mId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"会员编号\",\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1602218520000,\"tableId\":18,\"pk\":true,\"columnName\":\"m_id\"},{\"usableColumn\":false,\"columnId\":174,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"mGrade\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"等级\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(3)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602218520000,\"isEdit\":\"1\",\"tableId\":18,\"pk\":false,\"columnName\":\"m_grade\"},{\"usableColumn\":false,\"columnId\":175,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"userId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"用户编号\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602218520000,\"isEdit\":\"1\",\"tableId\":18,\"pk\":false,\"columnName\":\"user_id\"},{\"usableColumn\":false,\"columnId\":176,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":true,\"updateBy\":\"\",\"javaField\":\"createTime\",\"htmlType\":\"datetime\",\"edit\":false,\"query\":true,\"columnComment\":\"创建时间\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602218520000,\"tableId\":18,\"pk\":false,\"columnName\":\"create_time\"},{\"usableColumn\":false,\"columnId\":177,\"isIncrement\":\"0\",\"incre', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 12:43:25');
INSERT INTO `sys_oper_log` VALUES ('200', '代码生成', '3', 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', '1', 'admin', null, '/tool/gen/12', '127.0.0.1', '内网IP', '{tableIds=12}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 12:44:19');
INSERT INTO `sys_oper_log` VALUES ('201', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'comment', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 12:44:23');
INSERT INTO `sys_oper_log` VALUES ('202', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"ruoyi\",\"columns\":[{\"usableColumn\":false,\"columnId\":180,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"comId\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"评论编号\",\"isQuery\":\"1\",\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1602218663000,\"tableId\":19,\"pk\":true,\"columnName\":\"com_id\"},{\"usableColumn\":false,\"columnId\":181,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"userId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"用户id\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602218663000,\"isEdit\":\"1\",\"tableId\":19,\"pk\":false,\"columnName\":\"user_id\"},{\"usableColumn\":false,\"columnId\":182,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"cType\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"评论类型\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(1)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602218663000,\"isEdit\":\"1\",\"tableId\":19,\"pk\":false,\"columnName\":\"c_type\"},{\"usableColumn\":false,\"columnId\":183,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"songId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"歌曲编号\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602218663000,\"isEdit\":\"1\",\"tableId\":19,\"pk\":false,\"columnName\":\"song_id\"},{\"usableColumn', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 12:47:01');
INSERT INTO `sys_oper_log` VALUES ('203', '代码生成', '3', 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', '1', 'admin', null, '/tool/gen/14', '127.0.0.1', '内网IP', '{tableIds=14}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 12:47:46');
INSERT INTO `sys_oper_log` VALUES ('204', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'songlist_type', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 12:47:54');
INSERT INTO `sys_oper_log` VALUES ('205', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"ruoyi\",\"columns\":[{\"usableColumn\":false,\"columnId\":193,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"sltId\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"歌单类型编号\",\"isQuery\":\"1\",\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1602218874000,\"tableId\":20,\"pk\":true,\"columnName\":\"slt_id\"},{\"usableColumn\":false,\"columnId\":194,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sltName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"歌单名称\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602218874000,\"isEdit\":\"1\",\"tableId\":20,\"pk\":false,\"columnName\":\"slt_name\"},{\"usableColumn\":false,\"columnId\":195,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isRequired\":\"1\",\"javaField\":\"delFlag\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"删除标识符\",\"sort\":3,\"list\":false,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(1)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602218874000,\"tableId\":20,\"pk\":false,\"columnName\":\"del_flag\"},{\"usableColumn\":false,\"columnId\":196,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":true,\"updateBy\":\"\",\"javaField\":\"createTime\",\"htmlType\":\"datetime\",\"edit\":false,\"query\":true,\"columnComment\":\"创建时间\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602218874000,\"tableId\":20,\"pk\":false,\"columnName\":\"create_time\"},{\"usableColumn\":false,\"columnId\":197,\"isIncrement\":\"0\",\"incre', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 12:49:17');
INSERT INTO `sys_oper_log` VALUES ('206', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"ruoyi\",\"columns\":[{\"usableColumn\":false,\"columnId\":26,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"dlId\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"下载id\",\"isQuery\":\"1\",\"updateTime\":1602211295000,\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1602211066000,\"tableId\":3,\"pk\":true,\"columnName\":\"dl_id\"},{\"usableColumn\":false,\"columnId\":27,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"userId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"用户id\",\"isQuery\":\"1\",\"updateTime\":1602211295000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602211066000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"user_id\"},{\"usableColumn\":false,\"columnId\":28,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"songId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"歌曲id\",\"isQuery\":\"1\",\"updateTime\":1602211295000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602211066000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"song_id\"},{\"usableColumn\":false,\"columnId\":29,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"toneQuality\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"下载音质\",\"isQuery\":\"1\",\"updateTime\":1602211295000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(10)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"create', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 13:13:44');
INSERT INTO `sys_oper_log` VALUES ('207', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"ruoyi\",\"columns\":[{\"usableColumn\":false,\"columnId\":35,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"lyrId\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"歌词id\",\"isQuery\":\"1\",\"updateTime\":1602211389000,\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1602211066000,\"tableId\":4,\"pk\":true,\"columnName\":\"lyr_id\"},{\"usableColumn\":false,\"columnId\":36,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"lyrName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"歌词名\",\"isQuery\":\"1\",\"updateTime\":1602211389000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602211066000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"lyr_name\"},{\"usableColumn\":false,\"columnId\":37,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"lyrUrl\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"columnComment\":\"文件地址\",\"updateTime\":1602211389000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602211066000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"lyr_url\"},{\"usableColumn\":false,\"columnId\":38,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"issuingDate\",\"htmlType\":\"datetime\",\"edit\":true,\"query\":true,\"columnComment\":\"发行时间\",\"isQuery\":\"1\",\"updateTime\":1602211389000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"isPk\":\"0\",\"cre', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 13:14:12');
INSERT INTO `sys_oper_log` VALUES ('208', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"ruoyi\",\"columns\":[{\"usableColumn\":false,\"columnId\":55,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"recId\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"充值id\",\"isQuery\":\"1\",\"updateTime\":1602212161000,\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1602211066000,\"tableId\":7,\"pk\":true,\"columnName\":\"rec_id\"},{\"usableColumn\":false,\"columnId\":56,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"userId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"用户id\",\"isQuery\":\"1\",\"updateTime\":1602212161000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602211066000,\"isEdit\":\"1\",\"tableId\":7,\"pk\":false,\"columnName\":\"user_id\"},{\"usableColumn\":false,\"columnId\":57,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"amount\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"columnComment\":\"充值金额\",\"updateTime\":1602212161000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602211066000,\"isEdit\":\"1\",\"tableId\":7,\"pk\":false,\"columnName\":\"amount\"},{\"usableColumn\":false,\"columnId\":58,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":true,\"updateBy\":\"\",\"javaField\":\"createTime\",\"htmlType\":\"datetime\",\"edit\":false,\"query\":true,\"columnComment\":\"创建时间\",\"isQuery\":\"1\",\"updateTime\":1602212161000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602211066000,\"tableId\"', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 13:14:27');
INSERT INTO `sys_oper_log` VALUES ('209', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"ruoyi\",\"columns\":[{\"usableColumn\":false,\"columnId\":82,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"songId\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"歌曲id\",\"isQuery\":\"1\",\"updateTime\":1602212309000,\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1602211066000,\"tableId\":9,\"pk\":true,\"columnName\":\"song_id\"},{\"usableColumn\":false,\"columnId\":83,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"songName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"歌曲名\",\"isQuery\":\"1\",\"updateTime\":1602212309000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602211066000,\"isEdit\":\"1\",\"tableId\":9,\"pk\":false,\"columnName\":\"song_name\"},{\"usableColumn\":false,\"columnId\":84,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sinId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"歌手id\",\"isQuery\":\"1\",\"updateTime\":1602212309000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602211066000,\"isEdit\":\"1\",\"tableId\":9,\"pk\":false,\"columnName\":\"sin_id\"},{\"usableColumn\":false,\"columnId\":85,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"duration\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"columnComment\":\"时长\",\"updateTime\":1602212309000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":16022', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 13:15:12');
INSERT INTO `sys_oper_log` VALUES ('210', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"ruoyi\",\"columns\":[{\"usableColumn\":false,\"columnId\":108,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"stId\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"类型id\",\"isQuery\":\"1\",\"updateTime\":1602215877000,\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1602211066000,\"tableId\":11,\"pk\":true,\"columnName\":\"st_id\"},{\"usableColumn\":false,\"columnId\":109,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"stName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"类型名\",\"isQuery\":\"1\",\"updateTime\":1602215877000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602211066000,\"isEdit\":\"1\",\"tableId\":11,\"pk\":false,\"columnName\":\"st_name\"},{\"usableColumn\":false,\"columnId\":110,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":true,\"updateBy\":\"\",\"javaField\":\"createTime\",\"htmlType\":\"datetime\",\"edit\":false,\"query\":true,\"columnComment\":\"创建时间\",\"isQuery\":\"1\",\"updateTime\":1602215877000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602211066000,\"tableId\":11,\"pk\":false,\"columnName\":\"create_time\"},{\"usableColumn\":false,\"columnId\":111,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":true,\"updateBy\":\"\",\"javaField\":\"updateTime\",\"htmlType\":\"datetime\",\"edit\":false,\"query\":true,\"columnComment\":\"更新时间\",\"isQuery\":\"1\",\"updateTime\":1602215877000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":16022110660', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 13:15:26');
INSERT INTO `sys_oper_log` VALUES ('211', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"ruoyi\",\"columns\":[{\"usableColumn\":false,\"columnId\":140,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"priId\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"isQuery\":\"1\",\"updateTime\":1602217136000,\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1602212092000,\"tableId\":15,\"pk\":true,\"columnName\":\"pri_id\"},{\"usableColumn\":false,\"columnId\":141,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"priName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"isQuery\":\"1\",\"updateTime\":1602217136000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602212092000,\"isEdit\":\"1\",\"tableId\":15,\"pk\":false,\"columnName\":\"pri_name\"},{\"usableColumn\":false,\"columnId\":142,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":true,\"updateBy\":\"\",\"javaField\":\"createTime\",\"htmlType\":\"datetime\",\"edit\":false,\"query\":true,\"isQuery\":\"1\",\"updateTime\":1602217136000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602212092000,\"tableId\":15,\"pk\":false,\"columnName\":\"create_time\"},{\"usableColumn\":false,\"columnId\":143,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":true,\"updateBy\":\"\",\"javaField\":\"updateTime\",\"htmlType\":\"datetime\",\"edit\":false,\"query\":true,\"isQuery\":\"1\",\"updateTime\":1602217136000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602212092000,\"tableId\":15,\"pk\":false,\"columnName\":\"update_time\"},{\"usableColumn\":false,\"columnId\":', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 13:15:39');
INSERT INTO `sys_oper_log` VALUES ('212', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"ruoyi\",\"columns\":[{\"usableColumn\":false,\"columnId\":153,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"sinId\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"歌手编号\",\"isQuery\":\"1\",\"updateTime\":1602218499000,\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1602218352000,\"tableId\":17,\"pk\":true,\"columnName\":\"sin_id\"},{\"usableColumn\":false,\"columnId\":154,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sinName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"歌手名\",\"isQuery\":\"1\",\"updateTime\":1602218499000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602218352000,\"isEdit\":\"1\",\"tableId\":17,\"pk\":false,\"columnName\":\"sin_name\"},{\"usableColumn\":false,\"columnId\":155,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"nickname\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"歌手昵称\",\"isQuery\":\"1\",\"updateTime\":1602218499000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602218352000,\"isEdit\":\"1\",\"tableId\":17,\"pk\":false,\"columnName\":\"nickname\"},{\"usableColumn\":false,\"columnId\":156,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sex\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"性别\",\"isQuery\":\"1\",\"updateTime\":1602218499000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(1)\",\"createBy\":\"admin\",\"i', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 13:16:14');
INSERT INTO `sys_oper_log` VALUES ('213', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"ruoyi\",\"columns\":[{\"usableColumn\":false,\"columnId\":193,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"sltId\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"歌单类型编号\",\"isQuery\":\"1\",\"updateTime\":1602218957000,\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1602218874000,\"tableId\":20,\"pk\":true,\"columnName\":\"slt_id\"},{\"usableColumn\":false,\"columnId\":194,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sltName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"歌单名称\",\"isQuery\":\"1\",\"updateTime\":1602218957000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602218874000,\"isEdit\":\"1\",\"tableId\":20,\"pk\":false,\"columnName\":\"slt_name\"},{\"usableColumn\":false,\"columnId\":195,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"delFlag\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"删除标识符\",\"updateTime\":1602218957000,\"sort\":3,\"list\":false,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(1)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602218874000,\"tableId\":20,\"pk\":false,\"columnName\":\"del_flag\"},{\"usableColumn\":false,\"columnId\":196,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":true,\"updateBy\":\"\",\"javaField\":\"createTime\",\"htmlType\":\"datetime\",\"edit\":false,\"query\":true,\"columnComment\":\"创建时间\",\"isQuery\":\"1\",\"updateTime\":1602218957000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602218874000,\"tableId\":20,\"pk\":fal', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 13:16:33');
INSERT INTO `sys_oper_log` VALUES ('214', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', '0', null, '2020-10-09 13:16:56');
INSERT INTO `sys_oper_log` VALUES ('215', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', '0', null, '2020-10-09 13:29:05');
INSERT INTO `sys_oper_log` VALUES ('216', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"ruoyi\",\"columns\":[{\"usableColumn\":false,\"columnId\":193,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"sltId\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"歌单类型编号\",\"isQuery\":\"1\",\"updateTime\":1602220593000,\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1602218874000,\"tableId\":20,\"pk\":true,\"columnName\":\"slt_id\"},{\"usableColumn\":false,\"columnId\":194,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sltName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"歌单名称\",\"isQuery\":\"1\",\"updateTime\":1602220593000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602218874000,\"isEdit\":\"1\",\"tableId\":20,\"pk\":false,\"columnName\":\"slt_name\"},{\"usableColumn\":false,\"columnId\":195,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"delFlag\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"删除标识符\",\"updateTime\":1602220593000,\"sort\":3,\"list\":false,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(1)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602218874000,\"tableId\":20,\"pk\":false,\"columnName\":\"del_flag\"},{\"usableColumn\":false,\"columnId\":196,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":true,\"updateBy\":\"\",\"javaField\":\"createTime\",\"htmlType\":\"datetime\",\"edit\":false,\"query\":true,\"columnComment\":\"创建时间\",\"isQuery\":\"1\",\"updateTime\":1602220593000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602218874000,\"tableId\":20,\"pk\":fal', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 13:32:57');
INSERT INTO `sys_oper_log` VALUES ('217', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', '0', null, '2020-10-09 13:33:46');
INSERT INTO `sys_oper_log` VALUES ('218', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2099', '127.0.0.1', '内网IP', '{menuId=2099}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 13:39:26');
INSERT INTO `sys_oper_log` VALUES ('219', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2100', '127.0.0.1', '内网IP', '{menuId=2100}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 13:39:30');
INSERT INTO `sys_oper_log` VALUES ('220', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2101', '127.0.0.1', '内网IP', '{menuId=2101}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 13:39:33');
INSERT INTO `sys_oper_log` VALUES ('221', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2102', '127.0.0.1', '内网IP', '{menuId=2102}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 13:39:36');
INSERT INTO `sys_oper_log` VALUES ('222', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2103', '127.0.0.1', '内网IP', '{menuId=2103}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 13:39:39');
INSERT INTO `sys_oper_log` VALUES ('223', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2098', '127.0.0.1', '内网IP', '{menuId=2098}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 13:39:42');
INSERT INTO `sys_oper_log` VALUES ('224', '代码生成', '3', 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', '1', 'admin', null, '/tool/gen/15', '127.0.0.1', '内网IP', '{tableIds=15}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 23:36:31');
INSERT INTO `sys_oper_log` VALUES ('225', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'privilege', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 23:36:35');
INSERT INTO `sys_oper_log` VALUES ('226', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"ruoyi\",\"columns\":[{\"usableColumn\":false,\"columnId\":199,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"priId\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"特权编号\",\"isQuery\":\"1\",\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1602257795000,\"tableId\":21,\"pk\":true,\"columnName\":\"pri_id\"},{\"usableColumn\":false,\"columnId\":200,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"priName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"特权名\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602257795000,\"isEdit\":\"1\",\"tableId\":21,\"pk\":false,\"columnName\":\"pri_name\"},{\"usableColumn\":false,\"columnId\":201,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":true,\"updateBy\":\"\",\"javaField\":\"createTime\",\"htmlType\":\"datetime\",\"edit\":false,\"query\":true,\"columnComment\":\"创建时间\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602257795000,\"tableId\":21,\"pk\":false,\"columnName\":\"create_time\"},{\"usableColumn\":false,\"columnId\":202,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":true,\"updateBy\":\"\",\"javaField\":\"updateTime\",\"htmlType\":\"datetime\",\"edit\":false,\"query\":true,\"columnComment\":\"更新时间\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1602257795000,\"tableId\":21,\"pk\":false,\"columnName\":\"update_time\"},{\"usableColumn\":false,\"columnId\":203,\"isIncrement\"', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 23:37:45');
INSERT INTO `sys_oper_log` VALUES ('227', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', '0', null, '2020-10-09 23:39:24');
INSERT INTO `sys_oper_log` VALUES ('228', '角色管理', '1', 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":3,\"admin\":false,\"params\":{},\"roleSort\":\"3\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"client\",\"roleName\":\"系统客户\",\"deptIds\":[],\"menuIds\":[2007,2050,2051,2052,2053,2054,2055,2056,2057,2058,2059,2060,2061,2062,2063,2064,2065,2066,2067,2074,2075,2076,2077,2078,2079,2080,2081,2082,2083,2084,2085,2086,2087,2088,2089,2090,2091,2092,2093,2094,2095,2096,2097,2104,2105,2106,2107,2108,2109,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2038,2039,2040,2041,2042,2043,2044,2045,2046,2047,2048,2049],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 23:45:01');
INSERT INTO `sys_oper_log` VALUES ('229', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', '1', 'admin', null, '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":3,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"3\",\"deptCheckStrictly\":true,\"createTime\":1602258301000,\"menuCheckStrictly\":true,\"roleKey\":\"client\",\"roleName\":\"系统客户\",\"deptIds\":[],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 23:45:18');
INSERT INTO `sys_oper_log` VALUES ('230', '部门管理', '1', 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', '1', 'admin', null, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"多芬音乐公司\",\"leader\":\"周日月\",\"orderNum\":\"2\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"phone\":\"18307884396\",\"ancestors\":\"0,100\",\"email\":\"1742204618@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 23:47:02');
INSERT INTO `sys_oper_log` VALUES ('231', '部门管理', '2', 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"多芬音乐公司\",\"leader\":\"周日月\",\"deptId\":110,\"orderNum\":\"3\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1602258422000,\"phone\":\"18307884396\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"1742204618@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 23:47:12');
INSERT INTO `sys_oper_log` VALUES ('232', '用户管理', '1', 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"18307884396\",\"admin\":false,\"password\":\"$2a$10$oxjHJ1pVx0NKdjS1h4yua.XshBzh1njjWD7v3qdJw2/Igf2L.4j2y\",\"postIds\":[4],\"email\":\"1742204618@qq.com\",\"nickName\":\"客户\",\"sex\":\"0\",\"deptId\":110,\"params\":{},\"userName\":\"client\",\"userId\":3,\"createBy\":\"admin\",\"roleIds\":[3],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 23:47:55');
INSERT INTO `sys_oper_log` VALUES ('233', '评论管理', '5', 'com.ruoyi.web.controller.business.CommentController.export()', 'GET', '1', 'client', null, '/business/comment/export', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"bda8ed5b-b58e-4d49-a5ae-3d95276b5971_comment.xlsx\",\"code\":200}', '0', null, '2020-10-09 23:49:54');
INSERT INTO `sys_oper_log` VALUES ('234', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"会员信息管理\",\"params\":{},\"parentId\":2007,\"isCache\":\"0\",\"path\":\"member\",\"component\":\"business/member/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2050,\"menuType\":\"C\",\"perms\":\"business:member:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 23:50:40');
INSERT INTO `sys_oper_log` VALUES ('235', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"充值信息管理\",\"params\":{},\"parentId\":2007,\"isCache\":\"0\",\"path\":\"recharge\",\"component\":\"business/recharge/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2056,\"menuType\":\"C\",\"perms\":\"business:recharge:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 23:50:46');
INSERT INTO `sys_oper_log` VALUES ('236', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"歌手信息管理\",\"params\":{},\"parentId\":2007,\"isCache\":\"0\",\"path\":\"singer\",\"component\":\"business/singer/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2062,\"menuType\":\"C\",\"perms\":\"business:singer:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 23:50:52');
INSERT INTO `sys_oper_log` VALUES ('237', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"曲库管理\",\"params\":{},\"parentId\":2007,\"isCache\":\"0\",\"path\":\"song\",\"component\":\"business/song/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2074,\"menuType\":\"C\",\"perms\":\"business:song:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 23:51:02');
INSERT INTO `sys_oper_log` VALUES ('238', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"歌单管理\",\"params\":{},\"parentId\":2007,\"isCache\":\"0\",\"path\":\"songlist\",\"component\":\"business/songlist/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2008,\"menuType\":\"C\",\"perms\":\"business:songlist:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 23:51:18');
INSERT INTO `sys_oper_log` VALUES ('239', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"特权管理\",\"params\":{},\"parentId\":2007,\"isCache\":\"0\",\"path\":\"privilege\",\"component\":\"business/privilege/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2014,\"menuType\":\"C\",\"perms\":\"business:privilege:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 23:51:25');
INSERT INTO `sys_oper_log` VALUES ('240', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"歌词管理\",\"params\":{},\"parentId\":2007,\"isCache\":\"0\",\"path\":\"lyric\",\"component\":\"business/lyric/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2044,\"menuType\":\"C\",\"perms\":\"business:lyric:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 23:51:33');
INSERT INTO `sys_oper_log` VALUES ('241', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"评论管理\",\"params\":{},\"parentId\":2007,\"isCache\":\"0\",\"path\":\"comment\",\"component\":\"business/comment/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2092,\"menuType\":\"C\",\"perms\":\"business:comment:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-09 23:51:58');
INSERT INTO `sys_oper_log` VALUES ('242', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"会员信息管理\",\"params\":{},\"parentId\":2007,\"isCache\":\"0\",\"path\":\"member\",\"component\":\"business/member/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2050,\"menuType\":\"C\",\"perms\":\"business:member:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-12 15:00:58');
INSERT INTO `sys_oper_log` VALUES ('243', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"会员信息管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"member\",\"component\":\"business/member/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2050,\"menuType\":\"C\",\"perms\":\"business:member:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-12 15:01:05');
INSERT INTO `sys_oper_log` VALUES ('244', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"充值信息管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"recharge\",\"component\":\"business/recharge/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2056,\"menuType\":\"C\",\"perms\":\"business:recharge:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-12 15:01:13');
INSERT INTO `sys_oper_log` VALUES ('245', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"曲库管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"song\",\"component\":\"business/song/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2074,\"menuType\":\"C\",\"perms\":\"business:song:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-12 15:01:26');
INSERT INTO `sys_oper_log` VALUES ('246', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"歌手信息管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"singer\",\"component\":\"business/singer/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2062,\"menuType\":\"C\",\"perms\":\"business:singer:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-12 15:01:33');
INSERT INTO `sys_oper_log` VALUES ('247', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"歌单收藏\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"collectiones\",\"component\":\"business/collectiones/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2080,\"menuType\":\"C\",\"perms\":\"business:collectiones:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-12 15:01:40');
INSERT INTO `sys_oper_log` VALUES ('248', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"歌曲类型\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"songtype\",\"component\":\"business/songtype/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2086,\"menuType\":\"C\",\"perms\":\"business:songtype:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-12 15:01:46');
INSERT INTO `sys_oper_log` VALUES ('249', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"评论管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"comment\",\"component\":\"business/comment/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2092,\"menuType\":\"C\",\"perms\":\"business:comment:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-12 15:01:54');
INSERT INTO `sys_oper_log` VALUES ('250', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"歌单类型管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"songlisttype\",\"component\":\"business/songlisttype/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2104,\"menuType\":\"C\",\"perms\":\"business:songlisttype:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-12 15:02:01');
INSERT INTO `sys_oper_log` VALUES ('251', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"歌单管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"songlist\",\"component\":\"business/songlist/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2008,\"menuType\":\"C\",\"perms\":\"business:songlist:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-12 15:02:07');
INSERT INTO `sys_oper_log` VALUES ('252', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"特权管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"privilege\",\"component\":\"business/privilege/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2014,\"menuType\":\"C\",\"perms\":\"business:privilege:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-12 15:02:13');
INSERT INTO `sys_oper_log` VALUES ('253', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"下载信息\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"download\",\"component\":\"business/download/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2038,\"menuType\":\"C\",\"perms\":\"business:download:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-12 15:02:19');
INSERT INTO `sys_oper_log` VALUES ('254', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"歌词管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"lyric\",\"component\":\"business/lyric/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2044,\"menuType\":\"C\",\"perms\":\"business:lyric:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-12 15:02:24');
INSERT INTO `sys_oper_log` VALUES ('255', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2007', '127.0.0.1', '内网IP', '{menuId=2007}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', '0', null, '2020-10-12 15:02:29');
INSERT INTO `sys_oper_log` VALUES ('256', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":3,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"3\",\"deptCheckStrictly\":true,\"createTime\":1602258301000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"client\",\"roleName\":\"系统客户\",\"menuIds\":[2050,2051,2052,2053,2054,2055,2056,2057,2058,2059,2060,2061,2062,2063,2064,2065,2066,2067,2074,2075,2076,2077,2078,2079,2080,2081,2082,2083,2084,2085,2086,2087,2088,2089,2090,2091,2092,2093,2094,2095,2096,2097,2104,2105,2106,2107,2108,2109,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2038,2039,2040,2041,2042,2043,2044,2045,2046,2047,2048,2049],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-12 15:03:17');
INSERT INTO `sys_oper_log` VALUES ('257', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2007', '127.0.0.1', '内网IP', '{menuId=2007}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-12 15:03:48');
INSERT INTO `sys_oper_log` VALUES ('258', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"2\",\"menuName\":\"歌单管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"songlist\",\"component\":\"business/songlist/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2008,\"menuType\":\"C\",\"perms\":\"business:songlist:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-12 15:05:46');
INSERT INTO `sys_oper_log` VALUES ('259', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"5\",\"menuName\":\"歌单管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"songlist\",\"component\":\"business/songlist/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2008,\"menuType\":\"C\",\"perms\":\"business:songlist:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-12 15:06:35');
INSERT INTO `sys_oper_log` VALUES ('260', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"6\",\"menuName\":\"歌手信息管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"singer\",\"component\":\"business/singer/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2062,\"menuType\":\"C\",\"perms\":\"business:singer:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-12 15:06:46');
INSERT INTO `sys_oper_log` VALUES ('261', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"7\",\"menuName\":\"歌曲类型\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"songtype\",\"component\":\"business/songtype/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2086,\"menuType\":\"C\",\"perms\":\"business:songtype:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-12 15:06:57');
INSERT INTO `sys_oper_log` VALUES ('262', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"8\",\"menuName\":\"歌单收藏\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"collectiones\",\"component\":\"business/collectiones/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2080,\"menuType\":\"C\",\"perms\":\"business:collectiones:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-12 15:07:11');
INSERT INTO `sys_oper_log` VALUES ('263', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"8\",\"menuName\":\"曲库管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"song\",\"component\":\"business/song/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2074,\"menuType\":\"C\",\"perms\":\"business:song:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-12 15:07:25');
INSERT INTO `sys_oper_log` VALUES ('264', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"9\",\"menuName\":\"歌单收藏\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"collectiones\",\"component\":\"business/collectiones/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2080,\"menuType\":\"C\",\"perms\":\"business:collectiones:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-12 15:07:31');
INSERT INTO `sys_oper_log` VALUES ('265', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"10\",\"menuName\":\"歌词管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"lyric\",\"component\":\"business/lyric/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2044,\"menuType\":\"C\",\"perms\":\"business:lyric:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-12 15:07:44');
INSERT INTO `sys_oper_log` VALUES ('266', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"11\",\"menuName\":\"会员信息管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"member\",\"component\":\"business/member/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2050,\"menuType\":\"C\",\"perms\":\"business:member:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-12 15:08:10');
INSERT INTO `sys_oper_log` VALUES ('267', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"11\",\"menuName\":\"歌单类型管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"songlisttype\",\"component\":\"business/songlisttype/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2104,\"menuType\":\"C\",\"perms\":\"business:songlisttype:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-12 15:08:34');
INSERT INTO `sys_oper_log` VALUES ('268', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"12\",\"menuName\":\"评论管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"comment\",\"component\":\"business/comment/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2092,\"menuType\":\"C\",\"perms\":\"business:comment:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-12 15:08:42');
INSERT INTO `sys_oper_log` VALUES ('269', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"13\",\"menuName\":\"会员信息管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"member\",\"component\":\"business/member/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2050,\"menuType\":\"C\",\"perms\":\"business:member:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-12 15:08:55');
INSERT INTO `sys_oper_log` VALUES ('270', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"13\",\"menuName\":\"会员信息管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"member\",\"component\":\"business/member/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2050,\"menuType\":\"C\",\"perms\":\"business:member:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-12 15:08:55');
INSERT INTO `sys_oper_log` VALUES ('271', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"14\",\"menuName\":\"充值信息管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"recharge\",\"component\":\"business/recharge/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2056,\"menuType\":\"C\",\"perms\":\"business:recharge:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-12 15:09:05');
INSERT INTO `sys_oper_log` VALUES ('272', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"15\",\"menuName\":\"特权管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"privilege\",\"component\":\"business/privilege/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2014,\"menuType\":\"C\",\"perms\":\"business:privilege:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-12 15:09:12');
INSERT INTO `sys_oper_log` VALUES ('273', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"16\",\"menuName\":\"下载信息\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"download\",\"component\":\"business/download/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2038,\"menuType\":\"C\",\"perms\":\"business:download:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-12 15:09:20');
INSERT INTO `sys_oper_log` VALUES ('274', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"user\",\"orderNum\":\"5\",\"menuName\":\"歌单管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"songlist\",\"component\":\"business/songlist/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2008,\"menuType\":\"C\",\"perms\":\"business:songlist:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-12 15:09:36');
INSERT INTO `sys_oper_log` VALUES ('275', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"user\",\"orderNum\":\"6\",\"menuName\":\"歌手信息管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"singer\",\"component\":\"business/singer/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2062,\"menuType\":\"C\",\"perms\":\"business:singer:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-12 15:10:03');
INSERT INTO `sys_oper_log` VALUES ('276', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"form\",\"orderNum\":\"7\",\"menuName\":\"歌曲类型\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"songtype\",\"component\":\"business/songtype/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2086,\"menuType\":\"C\",\"perms\":\"business:songtype:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-12 15:10:38');
INSERT INTO `sys_oper_log` VALUES ('277', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"documentation\",\"orderNum\":\"8\",\"menuName\":\"曲库管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"song\",\"component\":\"business/song/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2074,\"menuType\":\"C\",\"perms\":\"business:song:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-12 15:10:48');
INSERT INTO `sys_oper_log` VALUES ('278', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"clipboard\",\"orderNum\":\"9\",\"menuName\":\"歌单收藏\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"collectiones\",\"component\":\"business/collectiones/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2080,\"menuType\":\"C\",\"perms\":\"business:collectiones:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-12 15:10:56');
INSERT INTO `sys_oper_log` VALUES ('279', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"education\",\"orderNum\":\"10\",\"menuName\":\"歌词管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"lyric\",\"component\":\"business/lyric/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2044,\"menuType\":\"C\",\"perms\":\"business:lyric:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-12 15:11:04');
INSERT INTO `sys_oper_log` VALUES ('280', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"example\",\"orderNum\":\"11\",\"menuName\":\"歌单类型管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"songlisttype\",\"component\":\"business/songlisttype/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2104,\"menuType\":\"C\",\"perms\":\"business:songlisttype:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-12 15:11:14');
INSERT INTO `sys_oper_log` VALUES ('281', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"tool\",\"orderNum\":\"12\",\"menuName\":\"评论管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"comment\",\"component\":\"business/comment/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2092,\"menuType\":\"C\",\"perms\":\"business:comment:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-12 15:11:23');
INSERT INTO `sys_oper_log` VALUES ('282', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"qq\",\"orderNum\":\"13\",\"menuName\":\"会员信息管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"member\",\"component\":\"business/member/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2050,\"menuType\":\"C\",\"perms\":\"business:member:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-12 15:11:33');
INSERT INTO `sys_oper_log` VALUES ('283', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"documentation\",\"orderNum\":\"14\",\"menuName\":\"充值信息管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"recharge\",\"component\":\"business/recharge/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2056,\"menuType\":\"C\",\"perms\":\"business:recharge:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-12 15:11:41');
INSERT INTO `sys_oper_log` VALUES ('284', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"component\",\"orderNum\":\"15\",\"menuName\":\"特权管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"privilege\",\"component\":\"business/privilege/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2014,\"menuType\":\"C\",\"perms\":\"business:privilege:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-12 15:11:50');
INSERT INTO `sys_oper_log` VALUES ('285', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"upload\",\"orderNum\":\"16\",\"menuName\":\"下载信息\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"download\",\"component\":\"business/download/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2038,\"menuType\":\"C\",\"perms\":\"business:download:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-12 15:12:01');
INSERT INTO `sys_oper_log` VALUES ('286', '歌曲类型', '1', 'com.ruoyi.web.controller.business.SongTypeController.add()', 'POST', '1', 'client', null, '/business/songtype', '127.0.0.1', '内网IP', '{\"stName\":\"中国风\",\"stId\":1,\"params\":{},\"createTime\":1602486819934}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-10-12 15:13:39');
INSERT INTO `sys_oper_log` VALUES ('287', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', '0', null, '2020-10-26 15:30:52');
INSERT INTO `sys_oper_log` VALUES ('288', '用户头像', '2', 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', '1', 'admin', null, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', 'null', '1', 'filename : [blob], extension : [], allowed extension : [[bmp, gif, jpg, jpeg, png, doc, docx, xls, xlsx, ppt, pptx, html, htm, txt, rar, zip, gz, bz2, pdf]]', '2020-10-31 18:53:29');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
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
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
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
INSERT INTO `sys_role` VALUES ('1', '超级管理员', 'admin', '1', '1', '1', '1', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '超级管理员');
INSERT INTO `sys_role` VALUES ('2', '普通角色', 'common', '2', '2', '1', '1', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '普通角色');
INSERT INTO `sys_role` VALUES ('3', '系统客户', 'client', '3', '1', '1', '1', '0', '0', 'admin', '2020-10-09 23:45:01', 'admin', '2020-10-12 15:03:17', null);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
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
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '2');
INSERT INTO `sys_role_menu` VALUES ('2', '3');
INSERT INTO `sys_role_menu` VALUES ('2', '4');
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
INSERT INTO `sys_role_menu` VALUES ('2', '113');
INSERT INTO `sys_role_menu` VALUES ('2', '114');
INSERT INTO `sys_role_menu` VALUES ('2', '115');
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
INSERT INTO `sys_role_menu` VALUES ('2', '1056');
INSERT INTO `sys_role_menu` VALUES ('2', '1057');
INSERT INTO `sys_role_menu` VALUES ('2', '1058');
INSERT INTO `sys_role_menu` VALUES ('2', '1059');
INSERT INTO `sys_role_menu` VALUES ('2', '1060');
INSERT INTO `sys_role_menu` VALUES ('3', '2008');
INSERT INTO `sys_role_menu` VALUES ('3', '2009');
INSERT INTO `sys_role_menu` VALUES ('3', '2010');
INSERT INTO `sys_role_menu` VALUES ('3', '2011');
INSERT INTO `sys_role_menu` VALUES ('3', '2012');
INSERT INTO `sys_role_menu` VALUES ('3', '2013');
INSERT INTO `sys_role_menu` VALUES ('3', '2014');
INSERT INTO `sys_role_menu` VALUES ('3', '2015');
INSERT INTO `sys_role_menu` VALUES ('3', '2016');
INSERT INTO `sys_role_menu` VALUES ('3', '2017');
INSERT INTO `sys_role_menu` VALUES ('3', '2018');
INSERT INTO `sys_role_menu` VALUES ('3', '2019');
INSERT INTO `sys_role_menu` VALUES ('3', '2038');
INSERT INTO `sys_role_menu` VALUES ('3', '2039');
INSERT INTO `sys_role_menu` VALUES ('3', '2040');
INSERT INTO `sys_role_menu` VALUES ('3', '2041');
INSERT INTO `sys_role_menu` VALUES ('3', '2042');
INSERT INTO `sys_role_menu` VALUES ('3', '2043');
INSERT INTO `sys_role_menu` VALUES ('3', '2044');
INSERT INTO `sys_role_menu` VALUES ('3', '2045');
INSERT INTO `sys_role_menu` VALUES ('3', '2046');
INSERT INTO `sys_role_menu` VALUES ('3', '2047');
INSERT INTO `sys_role_menu` VALUES ('3', '2048');
INSERT INTO `sys_role_menu` VALUES ('3', '2049');
INSERT INTO `sys_role_menu` VALUES ('3', '2050');
INSERT INTO `sys_role_menu` VALUES ('3', '2051');
INSERT INTO `sys_role_menu` VALUES ('3', '2052');
INSERT INTO `sys_role_menu` VALUES ('3', '2053');
INSERT INTO `sys_role_menu` VALUES ('3', '2054');
INSERT INTO `sys_role_menu` VALUES ('3', '2055');
INSERT INTO `sys_role_menu` VALUES ('3', '2056');
INSERT INTO `sys_role_menu` VALUES ('3', '2057');
INSERT INTO `sys_role_menu` VALUES ('3', '2058');
INSERT INTO `sys_role_menu` VALUES ('3', '2059');
INSERT INTO `sys_role_menu` VALUES ('3', '2060');
INSERT INTO `sys_role_menu` VALUES ('3', '2061');
INSERT INTO `sys_role_menu` VALUES ('3', '2062');
INSERT INTO `sys_role_menu` VALUES ('3', '2063');
INSERT INTO `sys_role_menu` VALUES ('3', '2064');
INSERT INTO `sys_role_menu` VALUES ('3', '2065');
INSERT INTO `sys_role_menu` VALUES ('3', '2066');
INSERT INTO `sys_role_menu` VALUES ('3', '2067');
INSERT INTO `sys_role_menu` VALUES ('3', '2074');
INSERT INTO `sys_role_menu` VALUES ('3', '2075');
INSERT INTO `sys_role_menu` VALUES ('3', '2076');
INSERT INTO `sys_role_menu` VALUES ('3', '2077');
INSERT INTO `sys_role_menu` VALUES ('3', '2078');
INSERT INTO `sys_role_menu` VALUES ('3', '2079');
INSERT INTO `sys_role_menu` VALUES ('3', '2080');
INSERT INTO `sys_role_menu` VALUES ('3', '2081');
INSERT INTO `sys_role_menu` VALUES ('3', '2082');
INSERT INTO `sys_role_menu` VALUES ('3', '2083');
INSERT INTO `sys_role_menu` VALUES ('3', '2084');
INSERT INTO `sys_role_menu` VALUES ('3', '2085');
INSERT INTO `sys_role_menu` VALUES ('3', '2086');
INSERT INTO `sys_role_menu` VALUES ('3', '2087');
INSERT INTO `sys_role_menu` VALUES ('3', '2088');
INSERT INTO `sys_role_menu` VALUES ('3', '2089');
INSERT INTO `sys_role_menu` VALUES ('3', '2090');
INSERT INTO `sys_role_menu` VALUES ('3', '2091');
INSERT INTO `sys_role_menu` VALUES ('3', '2092');
INSERT INTO `sys_role_menu` VALUES ('3', '2093');
INSERT INTO `sys_role_menu` VALUES ('3', '2094');
INSERT INTO `sys_role_menu` VALUES ('3', '2095');
INSERT INTO `sys_role_menu` VALUES ('3', '2096');
INSERT INTO `sys_role_menu` VALUES ('3', '2097');
INSERT INTO `sys_role_menu` VALUES ('3', '2104');
INSERT INTO `sys_role_menu` VALUES ('3', '2105');
INSERT INTO `sys_role_menu` VALUES ('3', '2106');
INSERT INTO `sys_role_menu` VALUES ('3', '2107');
INSERT INTO `sys_role_menu` VALUES ('3', '2108');
INSERT INTO `sys_role_menu` VALUES ('3', '2109');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '103', 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '/static/images/zhoushen.jpg', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_user` VALUES ('2', '105', 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '测试员');
INSERT INTO `sys_user` VALUES ('3', '110', 'client', '客户', '00', '1742204618@qq.com', '18307884396', '0', '/static/images/zhoushen.jpg', '$2a$10$oxjHJ1pVx0NKdjS1h4yua.XshBzh1njjWD7v3qdJw2/Igf2L.4j2y', '0', '0', '', null, 'admin', '2020-10-09 23:47:55', '', null, null);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('1', '1');
INSERT INTO `sys_user_post` VALUES ('2', '2');
INSERT INTO `sys_user_post` VALUES ('3', '4');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('2', '2');
INSERT INTO `sys_user_role` VALUES ('3', '3');

-- ----------------------------
-- Table structure for type_operate
-- ----------------------------
DROP TABLE IF EXISTS `type_operate`;
CREATE TABLE `type_operate` (
  `t_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of type_operate
-- ----------------------------
INSERT INTO `type_operate` VALUES ('1', '1', '1');
INSERT INTO `type_operate` VALUES ('2', '1', '2');
INSERT INTO `type_operate` VALUES ('3', '1', '4');
INSERT INTO `type_operate` VALUES ('4', '1', '5');
INSERT INTO `type_operate` VALUES ('5', '2', '1');
INSERT INTO `type_operate` VALUES ('6', '2', '2');
INSERT INTO `type_operate` VALUES ('7', '2', '3');
INSERT INTO `type_operate` VALUES ('8', '2', '4');
INSERT INTO `type_operate` VALUES ('9', '2', '5');

-- ----------------------------
-- Table structure for user_detail
-- ----------------------------
DROP TABLE IF EXISTS `user_detail`;
CREATE TABLE `user_detail` (
  `user_id` int(11) NOT NULL COMMENT '用户编号',
  `detail` varchar(255) DEFAULT NULL COMMENT '个人详情',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `address` varchar(255) DEFAULT NULL COMMENT '住址',
  `per_bg` varchar(255) DEFAULT NULL COMMENT '背景图片',
  `is_member` int(1) NOT NULL DEFAULT '0' COMMENT '0:非会员 1:会员',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_detail
-- ----------------------------
INSERT INTO `user_detail` VALUES ('3', '大牛', '2020-02-01 18:23:51', '广西   梧州市', '/static/images/youth.jpg', '0');
