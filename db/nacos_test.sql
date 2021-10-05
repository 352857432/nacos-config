/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : nacos_test

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 05/10/2021 20:55:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `c_use` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `effect` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `c_schema` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfo_datagrouptenant`(`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info
-- ----------------------------
INSERT INTO `config_info` VALUES (1, 'service1.yaml', 'TEST_GROUP', 'common:\r\n    name: 3333333333', '5e252e0470582f389039f9f8c09a2160', '2021-10-04 13:49:42', '2021-10-04 16:42:15', NULL, '127.0.0.1', '', '7b1ec964-4e8a-4dad-99e6-88abf0f7fd1f', '', '', '', 'yaml', '');
INSERT INTO `config_info` VALUES (2, 'service2.yaml', 'TEST_GROUP', 'common:\r\n    name: service2 config', '04b703d9e430528241971dc63a0e9898', '2021-10-04 13:50:11', '2021-10-04 13:50:11', NULL, '192.168.31.104', '', '7b1ec964-4e8a-4dad-99e6-88abf0f7fd1f', NULL, NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info` VALUES (5, 'ext-conﬁg-common01.properties', 'DEFAULT_GROUP', 'common.age = 121\r\ncommon.address = 陕西1', '414e15b6a92968bd2adae2285441733b', '2021-10-04 16:17:24', '2021-10-05 12:21:58', NULL, '192.168.31.104', '', '7b1ec964-4e8a-4dad-99e6-88abf0f7fd1f', '', '', '', 'properties', '');
INSERT INTO `config_info` VALUES (8, 'ext-conﬁg-common02.properties', 'GLOBALE_GROUP', 'common.birthday=1995-07-1722', 'a3aed94a446c1b8d73ecad7ad3f6e292', '2021-10-04 16:19:03', '2021-10-05 12:22:05', NULL, '192.168.31.104', '', '7b1ec964-4e8a-4dad-99e6-88abf0f7fd1f', '', '', '', 'properties', '');
INSERT INTO `config_info` VALUES (9, 'ext-conﬁg-common03.properties', 'REFRESH_GROUP', 'common.fullname = xue33', '85eb85090e299c519e8227ca451a80e4', '2021-10-05 12:11:39', '2021-10-05 12:22:12', NULL, '192.168.31.104', '', '7b1ec964-4e8a-4dad-99e6-88abf0f7fd1f', '', '', '', 'properties', '');

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'datum_id',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime(0) NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfoaggr_datagrouptenantdatum`(`data_id`, `group_id`, `tenant_id`, `datum_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '增加租户字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_aggr
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfobeta_datagrouptenant`(`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info_beta' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_beta
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfotag_datagrouptenanttag`(`data_id`, `group_id`, `tenant_id`, `tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info_tag' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_tag
-- ----------------------------

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation`  (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tag_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`) USING BTREE,
  UNIQUE INDEX `uk_configtagrelation_configidtag`(`id`, `tag_name`, `tag_type`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_tag_relation' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_tags_relation
-- ----------------------------

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_group_id`(`group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '集群、各Group容量信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of group_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info`  (
  `id` bigint(64) UNSIGNED NOT NULL,
  `nid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `gmt_create` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00',
  `gmt_modified` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `op_type` char(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`nid`) USING BTREE,
  INDEX `idx_gmt_create`(`gmt_create`) USING BTREE,
  INDEX `idx_gmt_modified`(`gmt_modified`) USING BTREE,
  INDEX `idx_did`(`data_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '多租户改造' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of his_config_info
-- ----------------------------
INSERT INTO `his_config_info` VALUES (0, 1, 'service1.yaml', 'TEST_GROUP', '', 'common:\r\n    name: service1 config', '1206349b688c0abfd83c48fd661d15b5', '2010-05-05 00:00:00', '2021-10-04 13:49:42', NULL, '192.168.31.104', 'I', '7b1ec964-4e8a-4dad-99e6-88abf0f7fd1f');
INSERT INTO `his_config_info` VALUES (0, 2, 'service2.yaml', 'TEST_GROUP', '', 'common:\r\n    name: service2 config', '04b703d9e430528241971dc63a0e9898', '2010-05-05 00:00:00', '2021-10-04 13:50:11', NULL, '192.168.31.104', 'I', '7b1ec964-4e8a-4dad-99e6-88abf0f7fd1f');
INSERT INTO `his_config_info` VALUES (1, 3, 'service1.yaml', 'TEST_GROUP', '', 'common:\r\n    name: service1 config', '1206349b688c0abfd83c48fd661d15b5', '2010-05-05 00:00:00', '2021-10-04 15:47:05', NULL, '192.168.31.104', 'U', '7b1ec964-4e8a-4dad-99e6-88abf0f7fd1f');
INSERT INTO `his_config_info` VALUES (1, 4, 'service1.yaml', 'TEST_GROUP', '', 'common:\r\n    name: service1 config1', 'b19b9152f75e021e1d9534730c2a0d5f', '2010-05-05 00:00:00', '2021-10-04 15:53:07', NULL, '192.168.31.104', 'U', '7b1ec964-4e8a-4dad-99e6-88abf0f7fd1f');
INSERT INTO `his_config_info` VALUES (0, 5, 'ext-conﬁg-common01.properties', 'DEFAULT_GROUP', '', 'common.age = 12', '3b0d97c2fd2ddb42ea356f0ddc15fbbf', '2010-05-05 00:00:00', '2021-10-04 16:17:24', NULL, '192.168.31.104', 'I', '7b1ec964-4e8a-4dad-99e6-88abf0f7fd1f');
INSERT INTO `his_config_info` VALUES (5, 6, 'ext-conﬁg-common01.properties', 'DEFAULT_GROUP', '', 'common.age = 12', '3b0d97c2fd2ddb42ea356f0ddc15fbbf', '2010-05-05 00:00:00', '2021-10-04 16:18:03', NULL, '192.168.31.104', 'U', '7b1ec964-4e8a-4dad-99e6-88abf0f7fd1f');
INSERT INTO `his_config_info` VALUES (5, 7, 'ext-conﬁg-common01.properties', 'DEFAULT_GROUP', '', 'common.age = 12\r\ncommon.address = shanxi', 'ff57c49ad9d84a5813173b5061b6e044', '2010-05-05 00:00:00', '2021-10-04 16:18:11', NULL, '192.168.31.104', 'U', '7b1ec964-4e8a-4dad-99e6-88abf0f7fd1f');
INSERT INTO `his_config_info` VALUES (0, 8, 'ext-conﬁg-common02.properties', 'GLOBALE_GROUP', '', 'common.birthday=1995-07-17', '041346e37098135f70844b27911c85f1', '2010-05-05 00:00:00', '2021-10-04 16:19:03', NULL, '192.168.31.104', 'I', '7b1ec964-4e8a-4dad-99e6-88abf0f7fd1f');
INSERT INTO `his_config_info` VALUES (0, 9, '1', 'DEFAULT_GROUP', '', 'common.fullname=薛', '26916b2c6503583f452f8fd065fde855', '2010-05-05 00:00:00', '2021-10-04 16:20:03', NULL, '192.168.31.104', 'I', '7b1ec964-4e8a-4dad-99e6-88abf0f7fd1f');
INSERT INTO `his_config_info` VALUES (9, 10, '1', 'DEFAULT_GROUP', '', 'common.fullname=薛', '26916b2c6503583f452f8fd065fde855', '2010-05-05 00:00:00', '2021-10-04 16:20:13', NULL, '192.168.31.104', 'D', '7b1ec964-4e8a-4dad-99e6-88abf0f7fd1f');
INSERT INTO `his_config_info` VALUES (1, 11, 'service1.yaml', 'TEST_GROUP', '', 'common:\r\n    name: service1 config1111', '33e98898a700e795413d3467973f070c', '2010-05-05 00:00:00', '2021-10-04 16:40:16', NULL, '127.0.0.1', 'U', '7b1ec964-4e8a-4dad-99e6-88abf0f7fd1f');
INSERT INTO `his_config_info` VALUES (1, 12, 'service1.yaml', 'TEST_GROUP', '', 'common:\r\n    name: 11111', '2809d3bb91f648bdc6a2860847c6ee7a', '2010-05-05 00:00:00', '2021-10-04 16:41:07', NULL, '127.0.0.1', 'U', '7b1ec964-4e8a-4dad-99e6-88abf0f7fd1f');
INSERT INTO `his_config_info` VALUES (1, 13, 'service1.yaml', 'TEST_GROUP', '', 'common:\r\n    name: 211111', 'ed1cc6c5456c9d32d710142916b7ba0e', '2010-05-05 00:00:00', '2021-10-04 16:42:15', NULL, '127.0.0.1', 'U', '7b1ec964-4e8a-4dad-99e6-88abf0f7fd1f');
INSERT INTO `his_config_info` VALUES (0, 14, 'ext-conﬁg-common03.properties', 'REFRESH_GROUP', '', 'common.name = 1', 'd0be12a28fd3a918e1e57de93177cdfa', '2010-05-05 00:00:00', '2021-10-05 12:11:39', NULL, '192.168.31.104', 'I', '7b1ec964-4e8a-4dad-99e6-88abf0f7fd1f');
INSERT INTO `his_config_info` VALUES (9, 15, 'ext-conﬁg-common03.properties', 'REFRESH_GROUP', '', 'common.name = 1', 'd0be12a28fd3a918e1e57de93177cdfa', '2010-05-05 00:00:00', '2021-10-05 12:12:05', NULL, '192.168.31.104', 'U', '7b1ec964-4e8a-4dad-99e6-88abf0f7fd1f');
INSERT INTO `his_config_info` VALUES (5, 16, 'ext-conﬁg-common01.properties', 'DEFAULT_GROUP', '', 'common.age = 12\r\ncommon.address = 陕西', '1eb4cb4cc5d1a9b369a2bf8dc8d8023b', '2010-05-05 00:00:00', '2021-10-05 12:21:58', NULL, '192.168.31.104', 'U', '7b1ec964-4e8a-4dad-99e6-88abf0f7fd1f');
INSERT INTO `his_config_info` VALUES (8, 17, 'ext-conﬁg-common02.properties', 'GLOBALE_GROUP', '', 'common.birthday=1995-07-17', '041346e37098135f70844b27911c85f1', '2010-05-05 00:00:00', '2021-10-05 12:22:05', NULL, '192.168.31.104', 'U', '7b1ec964-4e8a-4dad-99e6-88abf0f7fd1f');
INSERT INTO `his_config_info` VALUES (9, 18, 'ext-conﬁg-common03.properties', 'REFRESH_GROUP', '', 'common.fullname = xue', '8ed7250c1bc88cbd21d82c4dbd868c0b', '2010-05-05 00:00:00', '2021-10-05 12:22:12', NULL, '192.168.31.104', 'U', '7b1ec964-4e8a-4dad-99e6-88abf0f7fd1f');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('nacos', 'ROLE_ADMIN');

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数',
  `max_aggr_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '租户容量信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tenant_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint(20) NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint(20) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_info_kptenantid`(`kp`, `tenant_id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'tenant_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tenant_info
-- ----------------------------
INSERT INTO `tenant_info` VALUES (1, '1', '7b1ec964-4e8a-4dad-99e6-88abf0f7fd1f', 'dev', '开发环境', 'nacos', 1633355297916, 1633355297916);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('nacos', '$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu', 1);

SET FOREIGN_KEY_CHECKS = 1;
