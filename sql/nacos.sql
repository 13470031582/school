/*
 Navicat Premium Data Transfer

 Source Server         : mybase
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : localhost:3306
 Source Schema         : nacos

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 21/05/2022 19:27:53
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
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `c_use` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `effect` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `c_schema` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfo_datagrouptenant`(`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info
-- ----------------------------
INSERT INTO `config_info` VALUES (7, 'school-manage-system-dev.yml', 'dev', 'name: test', '0db3662cc8f7c2e174c41ae1436ebb9c', '2022-05-17 14:18:29', '2022-05-17 14:32:57', 'nacos', '0:0:0:0:0:0:0:1', '', '1bea58c8-8c9d-4668-82d1-a1b4ad5b3a29', '', '', '', 'yaml', '');
INSERT INTO `config_info` VALUES (8, 'application-dev.yml', 'dev', 'log4j:\r\n  rootLogger: WARN\r\nspring:\r\n  mvc:\r\n    pathmatch:\r\n      matching-strategy: ant_path_matcher #处理swagger空指针异常\r\n  data:\r\n    elasticsearch:\r\n      client:\r\n        reactive:\r\n          endpoints: localhost:9200\r\n  elasticsearch:\r\n    uris: [\"http://localhost:9200\"]\r\n  redis:\r\n    host: localhost\r\n    port: 6379\r\n    #    password: \"\"\r\n    timeout: 6000\r\n    database: 0\r\n    lettuce:\r\n      pool:\r\n        max-active: 10\r\n        max-idle: 8\r\n        max-wait: 100\r\n        min-idle: 2\r\n\r\n  datasource:\r\n    url: jdbc:mysql://localhost:3306/school?useUnicode=true&characterEncoding=utf-8&allowMultiQueries=true&useSSL=false\r\n    username: root\r\n    password: root\r\n    driver-class-name:  com.mysql.cj.jdbc.Driver\r\n    initial-size: 1\r\n    max-active: 20\r\n    min-idle: 1\r\n    max-wait: 60000\r\n    pool-prepared-statements: true\r\n    max-pool-prepared-statement-per-connection-size: 20\r\n    validation-query: SELECT \'x\'\r\n    test-on-borrow: false\r\n    test-on-return: false\r\n    test-while-idle: true\r\n    time-between-eviction-runs-millis: 60000\r\n    min-evictable-idle-time-millis: 300000\r\n    filters: stat,wall\r\n    web-stat-filter.enabled: true\r\n    web-stat-filter.url-pattern:  /*\r\n    web-stat-filter.exclusions: \"*.js , *.gif ,*.jpg ,*.png ,*.css ,*.ico , /druid/*\"\r\n    web-stat-filter.session-stat-max-count: 1000\r\n    web-stat-filter.profile-enable: true\r\n    stat-view-servlet.enabled: true\r\n    stat-view-servlet.url-pattern:  /druid/*\r\n    stat-view-servlet.reset-enable:  true\r\n    stat-view-servlet.login-username: admin\r\n    stat-view-servlet.login-password: admin\r\nname: test', '4fdcd3a534a59ec05f696bc5b5148834', '2022-05-17 14:25:47', '2022-05-17 14:25:47', NULL, '0:0:0:0:0:0:0:1', '', '1bea58c8-8c9d-4668-82d1-a1b4ad5b3a29', NULL, NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info` VALUES (10, 'common.yaml', 'DEFAULT_GROUP', 'log4j:\n  rootLogger: WARN\n\n#mybatis-plus配置，全局\nmybatis-plus:\n  global-config:\n    banner: false\n  configuration:\n    log-impl: org.apache.ibatis.logging.slf4j.Slf4jImpl\n  mapper-locations: classpath*:mapper/**/*.xml\n\nlogging:\n#  level:\n#    com.baomidou.mybatisplus: DEBUG\n#    com.sangfor.product.manage.dao: info\n#    com.sangfor.product.category.dao: info\n#    com.sangfor.product.specification: info\n#    com.sangfor: INFO\n#    com.sangfor.xaas.knowledge.mapper: debug\n#    com.github.pagehelper: DEBUG\n  config: classpath:logback-spring.xml\n#程序地址\nserver:\n  port: 8090\nspring:\n  mvc:\n    pathmatch:\n      matching-strategy: ant_path_matcher #处理swagger空指针异常\n  data:\n    elasticsearch:\n      client:\n        reactive:\n          endpoints: localhost:9200\n  elasticsearch:\n    uris: [\"http://localhost:9200\"]\n  redis:\n    host: localhost\n    port: 6379\n    #    password: \"\"\n    timeout: 6000\n    database: 0\n    lettuce:\n      pool:\n        max-active: 10\n        max-idle: 8\n        max-wait: 100\n        min-idle: 2\n\n  datasource:\n    url: jdbc:mysql://localhost:3306/school?useUnicode=true&characterEncoding=utf-8&allowMultiQueries=true&useSSL=false\n    username: root\n    password: root\n    driver-class-name:  com.mysql.cj.jdbc.Driver\n    initial-size: 1\n    max-active: 20\n    min-idle: 1\n    max-wait: 60000\n    pool-prepared-statements: true\n    max-pool-prepared-statement-per-connection-size: 20\n    validation-query: SELECT \'x\'\n    test-on-borrow: false\n    test-on-return: false\n    test-while-idle: true\n    time-between-eviction-runs-millis: 60000\n    min-evictable-idle-time-millis: 300000\n    filters: stat,wall\n    web-stat-filter.enabled: true\n    web-stat-filter.url-pattern:  /*\n    web-stat-filter.exclusions: \"*.js , *.gif ,*.jpg ,*.png ,*.css ,*.ico , /druid/*\"\n    web-stat-filter.session-stat-max-count: 1000\n    web-stat-filter.profile-enable: true\n    stat-view-servlet.enabled: true\n    stat-view-servlet.url-pattern:  /druid/*\n    stat-view-servlet.reset-enable:  true\n    stat-view-servlet.login-username: admin\n    stat-view-servlet.login-password: admin\nname: dayi', 'cb1c1389d39e5b6ab6091c6d464621c8', '2022-05-21 09:57:37', '2022-05-21 11:18:16', 'nacos', '0:0:0:0:0:0:0:1', '', '1bea58c8-8c9d-4668-82d1-a1b4ad5b3a29', '', '', '', 'yaml', '');

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
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
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
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
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
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
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
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
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
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `src_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `op_type` char(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`nid`) USING BTREE,
  INDEX `idx_gmt_create`(`gmt_create`) USING BTREE,
  INDEX `idx_gmt_modified`(`gmt_modified`) USING BTREE,
  INDEX `idx_did`(`data_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '多租户改造' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of his_config_info
-- ----------------------------
INSERT INTO `his_config_info` VALUES (0, 1, 'school-server', 'dev', '', 'log4j:\r\n  rootLogger: WARN\r\nserver:\r\n  port: 8090\r\nspring:\r\n  application:\r\n    name: school-manage-system\r\n  mvc:\r\n    pathmatch:\r\n      matching-strategy: ant_path_matcher #处理swagger空指针异常\r\n  data:\r\n    elasticsearch:\r\n      client:\r\n        reactive:\r\n          endpoints: localhost:9200\r\n  elasticsearch:\r\n    uris: [\"http://localhost:9200\"]\r\n  redis:\r\n    host: localhost\r\n    port: 6379\r\n    #    password: \"\"\r\n    timeout: 6000\r\n    database: 0\r\n    lettuce:\r\n      pool:\r\n        max-active: 10\r\n        max-idle: 8\r\n        max-wait: 100\r\n        min-idle: 2\r\n\r\n  datasource:\r\n    url: jdbc:mysql://localhost:3306/school?useUnicode=true&characterEncoding=utf-8&allowMultiQueries=true&useSSL=false\r\n    username: root\r\n    password: root\r\n    driver-class-name:  com.mysql.cj.jdbc.Driver\r\n    initial-size: 1\r\n    max-active: 20\r\n    min-idle: 1\r\n    max-wait: 60000\r\n    pool-prepared-statements: true\r\n    max-pool-prepared-statement-per-connection-size: 20\r\n    validation-query: SELECT \'x\'\r\n    test-on-borrow: false\r\n    test-on-return: false\r\n    test-while-idle: true\r\n    time-between-eviction-runs-millis: 60000\r\n    min-evictable-idle-time-millis: 300000\r\n    filters: stat,wall\r\n    web-stat-filter.enabled: true\r\n    web-stat-filter.url-pattern:  /*\r\n    web-stat-filter.exclusions: \"*.js , *.gif ,*.jpg ,*.png ,*.css ,*.ico , /druid/*\"\r\n    web-stat-filter.session-stat-max-count: 1000\r\n    web-stat-filter.profile-enable: true\r\n    stat-view-servlet.enabled: true\r\n    stat-view-servlet.url-pattern:  /druid/*\r\n    stat-view-servlet.reset-enable:  true\r\n    stat-view-servlet.login-username: admin\r\n    stat-view-servlet.login-password: admin\r\n', '11c5da61507f22a1c83bbe512b234234', '2022-05-17 17:44:54', '2022-05-17 09:44:54', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (1, 2, 'school-server', 'dev', '', 'log4j:\r\n  rootLogger: WARN\r\nserver:\r\n  port: 8090\r\nspring:\r\n  application:\r\n    name: school-manage-system\r\n  mvc:\r\n    pathmatch:\r\n      matching-strategy: ant_path_matcher #处理swagger空指针异常\r\n  data:\r\n    elasticsearch:\r\n      client:\r\n        reactive:\r\n          endpoints: localhost:9200\r\n  elasticsearch:\r\n    uris: [\"http://localhost:9200\"]\r\n  redis:\r\n    host: localhost\r\n    port: 6379\r\n    #    password: \"\"\r\n    timeout: 6000\r\n    database: 0\r\n    lettuce:\r\n      pool:\r\n        max-active: 10\r\n        max-idle: 8\r\n        max-wait: 100\r\n        min-idle: 2\r\n\r\n  datasource:\r\n    url: jdbc:mysql://localhost:3306/school?useUnicode=true&characterEncoding=utf-8&allowMultiQueries=true&useSSL=false\r\n    username: root\r\n    password: root\r\n    driver-class-name:  com.mysql.cj.jdbc.Driver\r\n    initial-size: 1\r\n    max-active: 20\r\n    min-idle: 1\r\n    max-wait: 60000\r\n    pool-prepared-statements: true\r\n    max-pool-prepared-statement-per-connection-size: 20\r\n    validation-query: SELECT \'x\'\r\n    test-on-borrow: false\r\n    test-on-return: false\r\n    test-while-idle: true\r\n    time-between-eviction-runs-millis: 60000\r\n    min-evictable-idle-time-millis: 300000\r\n    filters: stat,wall\r\n    web-stat-filter.enabled: true\r\n    web-stat-filter.url-pattern:  /*\r\n    web-stat-filter.exclusions: \"*.js , *.gif ,*.jpg ,*.png ,*.css ,*.ico , /druid/*\"\r\n    web-stat-filter.session-stat-max-count: 1000\r\n    web-stat-filter.profile-enable: true\r\n    stat-view-servlet.enabled: true\r\n    stat-view-servlet.url-pattern:  /druid/*\r\n    stat-view-servlet.reset-enable:  true\r\n    stat-view-servlet.login-username: admin\r\n    stat-view-servlet.login-password: admin\r\n', '11c5da61507f22a1c83bbe512b234234', '2022-05-17 17:52:50', '2022-05-17 09:52:51', NULL, '0:0:0:0:0:0:0:1', 'D', '');
INSERT INTO `his_config_info` VALUES (0, 3, 'school-manage-system', 'dev', '', 'log4j:\r\n  rootLogger: WARN\r\nserver:\r\n  port: 8090\r\nspring:\r\n  application:\r\n    name: school-manage-system\r\n  mvc:\r\n    pathmatch:\r\n      matching-strategy: ant_path_matcher #处理swagger空指针异常\r\n  data:\r\n    elasticsearch:\r\n      client:\r\n        reactive:\r\n          endpoints: localhost:9200\r\n  elasticsearch:\r\n    uris: [\"http://localhost:9200\"]\r\n  redis:\r\n    host: localhost\r\n    port: 6379\r\n    #    password: \"\"\r\n    timeout: 6000\r\n    database: 0\r\n    lettuce:\r\n      pool:\r\n        max-active: 10\r\n        max-idle: 8\r\n        max-wait: 100\r\n        min-idle: 2\r\n\r\n  datasource:\r\n    url: jdbc:mysql://localhost:3306/school?useUnicode=true&characterEncoding=utf-8&allowMultiQueries=true&useSSL=false\r\n    username: root\r\n    password: root\r\n    driver-class-name:  com.mysql.cj.jdbc.Driver\r\n    initial-size: 1\r\n    max-active: 20\r\n    min-idle: 1\r\n    max-wait: 60000\r\n    pool-prepared-statements: true\r\n    max-pool-prepared-statement-per-connection-size: 20\r\n    validation-query: SELECT \'x\'\r\n    test-on-borrow: false\r\n    test-on-return: false\r\n    test-while-idle: true\r\n    time-between-eviction-runs-millis: 60000\r\n    min-evictable-idle-time-millis: 300000\r\n    filters: stat,wall\r\n    web-stat-filter.enabled: true\r\n    web-stat-filter.url-pattern:  /*\r\n    web-stat-filter.exclusions: \"*.js , *.gif ,*.jpg ,*.png ,*.css ,*.ico , /druid/*\"\r\n    web-stat-filter.session-stat-max-count: 1000\r\n    web-stat-filter.profile-enable: true\r\n    stat-view-servlet.enabled: true\r\n    stat-view-servlet.url-pattern:  /druid/*\r\n    stat-view-servlet.reset-enable:  true\r\n    stat-view-servlet.login-username: admin\r\n    stat-view-servlet.login-password: admin\r\n', '11c5da61507f22a1c83bbe512b234234', '2022-05-17 19:06:01', '2022-05-17 11:06:01', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (2, 4, 'school-manage-system', 'dev', '', 'log4j:\r\n  rootLogger: WARN\r\nserver:\r\n  port: 8090\r\nspring:\r\n  application:\r\n    name: school-manage-system\r\n  mvc:\r\n    pathmatch:\r\n      matching-strategy: ant_path_matcher #处理swagger空指针异常\r\n  data:\r\n    elasticsearch:\r\n      client:\r\n        reactive:\r\n          endpoints: localhost:9200\r\n  elasticsearch:\r\n    uris: [\"http://localhost:9200\"]\r\n  redis:\r\n    host: localhost\r\n    port: 6379\r\n    #    password: \"\"\r\n    timeout: 6000\r\n    database: 0\r\n    lettuce:\r\n      pool:\r\n        max-active: 10\r\n        max-idle: 8\r\n        max-wait: 100\r\n        min-idle: 2\r\n\r\n  datasource:\r\n    url: jdbc:mysql://localhost:3306/school?useUnicode=true&characterEncoding=utf-8&allowMultiQueries=true&useSSL=false\r\n    username: root\r\n    password: root\r\n    driver-class-name:  com.mysql.cj.jdbc.Driver\r\n    initial-size: 1\r\n    max-active: 20\r\n    min-idle: 1\r\n    max-wait: 60000\r\n    pool-prepared-statements: true\r\n    max-pool-prepared-statement-per-connection-size: 20\r\n    validation-query: SELECT \'x\'\r\n    test-on-borrow: false\r\n    test-on-return: false\r\n    test-while-idle: true\r\n    time-between-eviction-runs-millis: 60000\r\n    min-evictable-idle-time-millis: 300000\r\n    filters: stat,wall\r\n    web-stat-filter.enabled: true\r\n    web-stat-filter.url-pattern:  /*\r\n    web-stat-filter.exclusions: \"*.js , *.gif ,*.jpg ,*.png ,*.css ,*.ico , /druid/*\"\r\n    web-stat-filter.session-stat-max-count: 1000\r\n    web-stat-filter.profile-enable: true\r\n    stat-view-servlet.enabled: true\r\n    stat-view-servlet.url-pattern:  /druid/*\r\n    stat-view-servlet.reset-enable:  true\r\n    stat-view-servlet.login-username: admin\r\n    stat-view-servlet.login-password: admin\r\n', '11c5da61507f22a1c83bbe512b234234', '2022-05-17 19:17:40', '2022-05-17 11:17:40', 'nacos', '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (2, 5, 'school-manage-system', 'dev', '', 'log4j:\n  rootLogger: WARN\nspring:\n  mvc:\n    pathmatch:\n      matching-strategy: ant_path_matcher #处理swagger空指针异常\n  data:\n    elasticsearch:\n      client:\n        reactive:\n          endpoints: localhost:9200\n  elasticsearch:\n    uris: [\"http://localhost:9200\"]\n  redis:\n    host: localhost\n    port: 6379\n    #    password: \"\"\n    timeout: 6000\n    database: 0\n    lettuce:\n      pool:\n        max-active: 10\n        max-idle: 8\n        max-wait: 100\n        min-idle: 2\n\n  datasource:\n    url: jdbc:mysql://localhost:3306/school?useUnicode=true&characterEncoding=utf-8&allowMultiQueries=true&useSSL=false\n    username: root\n    password: root\n    driver-class-name:  com.mysql.cj.jdbc.Driver\n    initial-size: 1\n    max-active: 20\n    min-idle: 1\n    max-wait: 60000\n    pool-prepared-statements: true\n    max-pool-prepared-statement-per-connection-size: 20\n    validation-query: SELECT \'x\'\n    test-on-borrow: false\n    test-on-return: false\n    test-while-idle: true\n    time-between-eviction-runs-millis: 60000\n    min-evictable-idle-time-millis: 300000\n    filters: stat,wall\n    web-stat-filter.enabled: true\n    web-stat-filter.url-pattern:  /*\n    web-stat-filter.exclusions: \"*.js , *.gif ,*.jpg ,*.png ,*.css ,*.ico , /druid/*\"\n    web-stat-filter.session-stat-max-count: 1000\n    web-stat-filter.profile-enable: true\n    stat-view-servlet.enabled: true\n    stat-view-servlet.url-pattern:  /druid/*\n    stat-view-servlet.reset-enable:  true\n    stat-view-servlet.login-username: admin\n    stat-view-servlet.login-password: admin\n', '2c891d12f0d9970d0627a7e90eda38c6', '2022-05-17 19:22:41', '2022-05-17 11:22:42', 'nacos', '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (0, 6, 'school-manage-system-dev.yml', 'dev', '', 'log4j:\r\n  rootLogger: WARN\r\nspring:\r\n  mvc:\r\n    pathmatch:\r\n      matching-strategy: ant_path_matcher #处理swagger空指针异常\r\n  data:\r\n    elasticsearch:\r\n      client:\r\n        reactive:\r\n          endpoints: localhost:9200\r\n  elasticsearch:\r\n    uris: [\"http://localhost:9200\"]\r\n  redis:\r\n    host: localhost\r\n    port: 6379\r\n    #    password: \"\"\r\n    timeout: 6000\r\n    database: 0\r\n    lettuce:\r\n      pool:\r\n        max-active: 10\r\n        max-idle: 8\r\n        max-wait: 100\r\n        min-idle: 2\r\n\r\n  datasource:\r\n    url: jdbc:mysql://localhost:3306/school?useUnicode=true&characterEncoding=utf-8&allowMultiQueries=true&useSSL=false\r\n    username: root\r\n    password: root\r\n    driver-class-name:  com.mysql.cj.jdbc.Driver\r\n    initial-size: 1\r\n    max-active: 20\r\n    min-idle: 1\r\n    max-wait: 60000\r\n    pool-prepared-statements: true\r\n    max-pool-prepared-statement-per-connection-size: 20\r\n    validation-query: SELECT \'x\'\r\n    test-on-borrow: false\r\n    test-on-return: false\r\n    test-while-idle: true\r\n    time-between-eviction-runs-millis: 60000\r\n    min-evictable-idle-time-millis: 300000\r\n    filters: stat,wall\r\n    web-stat-filter.enabled: true\r\n    web-stat-filter.url-pattern:  /*\r\n    web-stat-filter.exclusions: \"*.js , *.gif ,*.jpg ,*.png ,*.css ,*.ico , /druid/*\"\r\n    web-stat-filter.session-stat-max-count: 1000\r\n    web-stat-filter.profile-enable: true\r\n    stat-view-servlet.enabled: true\r\n    stat-view-servlet.url-pattern:  /druid/*\r\n    stat-view-servlet.reset-enable:  true\r\n    stat-view-servlet.login-username: admin\r\n    stat-view-servlet.login-password: admin\r\nname: test', '4fdcd3a534a59ec05f696bc5b5148834', '2022-05-17 21:45:09', '2022-05-17 13:45:09', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 7, 'application-dev.yml', 'DEFAULT_GROUP', '', 'name: 3332', 'b2836463e38168b524f3c6ccb7168225', '2022-05-17 22:15:11', '2022-05-17 14:15:11', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 8, 'school-manage-system-dev.yml', 'dev', '', 'log4j:\r\n  rootLogger: WARN\r\nspring:\r\n  mvc:\r\n    pathmatch:\r\n      matching-strategy: ant_path_matcher #处理swagger空指针异常\r\n  data:\r\n    elasticsearch:\r\n      client:\r\n        reactive:\r\n          endpoints: localhost:9200\r\n  elasticsearch:\r\n    uris: [\"http://localhost:9200\"]\r\n  redis:\r\n    host: localhost\r\n    port: 6379\r\n    #    password: \"\"\r\n    timeout: 6000\r\n    database: 0\r\n    lettuce:\r\n      pool:\r\n        max-active: 10\r\n        max-idle: 8\r\n        max-wait: 100\r\n        min-idle: 2\r\n\r\n  datasource:\r\n    url: jdbc:mysql://localhost:3306/school?useUnicode=true&characterEncoding=utf-8&allowMultiQueries=true&useSSL=false\r\n    username: root\r\n    password: root\r\n    driver-class-name:  com.mysql.cj.jdbc.Driver\r\n    initial-size: 1\r\n    max-active: 20\r\n    min-idle: 1\r\n    max-wait: 60000\r\n    pool-prepared-statements: true\r\n    max-pool-prepared-statement-per-connection-size: 20\r\n    validation-query: SELECT \'x\'\r\n    test-on-borrow: false\r\n    test-on-return: false\r\n    test-while-idle: true\r\n    time-between-eviction-runs-millis: 60000\r\n    min-evictable-idle-time-millis: 300000\r\n    filters: stat,wall\r\n    web-stat-filter.enabled: true\r\n    web-stat-filter.url-pattern:  /*\r\n    web-stat-filter.exclusions: \"*.js , *.gif ,*.jpg ,*.png ,*.css ,*.ico , /druid/*\"\r\n    web-stat-filter.session-stat-max-count: 1000\r\n    web-stat-filter.profile-enable: true\r\n    stat-view-servlet.enabled: true\r\n    stat-view-servlet.url-pattern:  /druid/*\r\n    stat-view-servlet.reset-enable:  true\r\n    stat-view-servlet.login-username: admin\r\n    stat-view-servlet.login-password: admin\r\nname: test', '4fdcd3a534a59ec05f696bc5b5148834', '2022-05-17 22:18:29', '2022-05-17 14:18:29', NULL, '0:0:0:0:0:0:0:1', 'I', '1bea58c8-8c9d-4668-82d1-a1b4ad5b3a29');
INSERT INTO `his_config_info` VALUES (0, 9, 'application-dev.yml', 'dev', '', 'log4j:\r\n  rootLogger: WARN\r\nspring:\r\n  mvc:\r\n    pathmatch:\r\n      matching-strategy: ant_path_matcher #处理swagger空指针异常\r\n  data:\r\n    elasticsearch:\r\n      client:\r\n        reactive:\r\n          endpoints: localhost:9200\r\n  elasticsearch:\r\n    uris: [\"http://localhost:9200\"]\r\n  redis:\r\n    host: localhost\r\n    port: 6379\r\n    #    password: \"\"\r\n    timeout: 6000\r\n    database: 0\r\n    lettuce:\r\n      pool:\r\n        max-active: 10\r\n        max-idle: 8\r\n        max-wait: 100\r\n        min-idle: 2\r\n\r\n  datasource:\r\n    url: jdbc:mysql://localhost:3306/school?useUnicode=true&characterEncoding=utf-8&allowMultiQueries=true&useSSL=false\r\n    username: root\r\n    password: root\r\n    driver-class-name:  com.mysql.cj.jdbc.Driver\r\n    initial-size: 1\r\n    max-active: 20\r\n    min-idle: 1\r\n    max-wait: 60000\r\n    pool-prepared-statements: true\r\n    max-pool-prepared-statement-per-connection-size: 20\r\n    validation-query: SELECT \'x\'\r\n    test-on-borrow: false\r\n    test-on-return: false\r\n    test-while-idle: true\r\n    time-between-eviction-runs-millis: 60000\r\n    min-evictable-idle-time-millis: 300000\r\n    filters: stat,wall\r\n    web-stat-filter.enabled: true\r\n    web-stat-filter.url-pattern:  /*\r\n    web-stat-filter.exclusions: \"*.js , *.gif ,*.jpg ,*.png ,*.css ,*.ico , /druid/*\"\r\n    web-stat-filter.session-stat-max-count: 1000\r\n    web-stat-filter.profile-enable: true\r\n    stat-view-servlet.enabled: true\r\n    stat-view-servlet.url-pattern:  /druid/*\r\n    stat-view-servlet.reset-enable:  true\r\n    stat-view-servlet.login-username: admin\r\n    stat-view-servlet.login-password: admin\r\nname: test', '4fdcd3a534a59ec05f696bc5b5148834', '2022-05-17 22:25:47', '2022-05-17 14:25:47', NULL, '0:0:0:0:0:0:0:1', 'I', '1bea58c8-8c9d-4668-82d1-a1b4ad5b3a29');
INSERT INTO `his_config_info` VALUES (2, 10, 'school-manage-system', 'dev', '', 'log4j:\n  rootLogger: WARN\nspring:\n  mvc:\n    pathmatch:\n      matching-strategy: ant_path_matcher #处理swagger空指针异常\n  data:\n    elasticsearch:\n      client:\n        reactive:\n          endpoints: localhost:9200\n  elasticsearch:\n    uris: [\"http://localhost:9200\"]\n  redis:\n    host: localhost\n    port: 6379\n    #    password: \"\"\n    timeout: 6000\n    database: 0\n    lettuce:\n      pool:\n        max-active: 10\n        max-idle: 8\n        max-wait: 100\n        min-idle: 2\n\n  datasource:\n    url: jdbc:mysql://localhost:3306/school?useUnicode=true&characterEncoding=utf-8&allowMultiQueries=true&useSSL=false\n    username: root\n    password: root\n    driver-class-name:  com.mysql.cj.jdbc.Driver\n    initial-size: 1\n    max-active: 20\n    min-idle: 1\n    max-wait: 60000\n    pool-prepared-statements: true\n    max-pool-prepared-statement-per-connection-size: 20\n    validation-query: SELECT \'x\'\n    test-on-borrow: false\n    test-on-return: false\n    test-while-idle: true\n    time-between-eviction-runs-millis: 60000\n    min-evictable-idle-time-millis: 300000\n    filters: stat,wall\n    web-stat-filter.enabled: true\n    web-stat-filter.url-pattern:  /*\n    web-stat-filter.exclusions: \"*.js , *.gif ,*.jpg ,*.png ,*.css ,*.ico , /druid/*\"\n    web-stat-filter.session-stat-max-count: 1000\n    web-stat-filter.profile-enable: true\n    stat-view-servlet.enabled: true\n    stat-view-servlet.url-pattern:  /druid/*\n    stat-view-servlet.reset-enable:  true\n    stat-view-servlet.login-username: admin\n    stat-view-servlet.login-password: admin\nname: test', '80cd1b81aafe67e6f5e22b67769f6c1c', '2022-05-17 22:31:43', '2022-05-17 14:31:44', NULL, '0:0:0:0:0:0:0:1', 'D', '');
INSERT INTO `his_config_info` VALUES (5, 11, 'school-manage-system-dev.yml', 'dev', '', 'log4j:\r\n  rootLogger: WARN\r\nspring:\r\n  mvc:\r\n    pathmatch:\r\n      matching-strategy: ant_path_matcher #处理swagger空指针异常\r\n  data:\r\n    elasticsearch:\r\n      client:\r\n        reactive:\r\n          endpoints: localhost:9200\r\n  elasticsearch:\r\n    uris: [\"http://localhost:9200\"]\r\n  redis:\r\n    host: localhost\r\n    port: 6379\r\n    #    password: \"\"\r\n    timeout: 6000\r\n    database: 0\r\n    lettuce:\r\n      pool:\r\n        max-active: 10\r\n        max-idle: 8\r\n        max-wait: 100\r\n        min-idle: 2\r\n\r\n  datasource:\r\n    url: jdbc:mysql://localhost:3306/school?useUnicode=true&characterEncoding=utf-8&allowMultiQueries=true&useSSL=false\r\n    username: root\r\n    password: root\r\n    driver-class-name:  com.mysql.cj.jdbc.Driver\r\n    initial-size: 1\r\n    max-active: 20\r\n    min-idle: 1\r\n    max-wait: 60000\r\n    pool-prepared-statements: true\r\n    max-pool-prepared-statement-per-connection-size: 20\r\n    validation-query: SELECT \'x\'\r\n    test-on-borrow: false\r\n    test-on-return: false\r\n    test-while-idle: true\r\n    time-between-eviction-runs-millis: 60000\r\n    min-evictable-idle-time-millis: 300000\r\n    filters: stat,wall\r\n    web-stat-filter.enabled: true\r\n    web-stat-filter.url-pattern:  /*\r\n    web-stat-filter.exclusions: \"*.js , *.gif ,*.jpg ,*.png ,*.css ,*.ico , /druid/*\"\r\n    web-stat-filter.session-stat-max-count: 1000\r\n    web-stat-filter.profile-enable: true\r\n    stat-view-servlet.enabled: true\r\n    stat-view-servlet.url-pattern:  /druid/*\r\n    stat-view-servlet.reset-enable:  true\r\n    stat-view-servlet.login-username: admin\r\n    stat-view-servlet.login-password: admin\r\nname: test', '4fdcd3a534a59ec05f696bc5b5148834', '2022-05-17 22:31:49', '2022-05-17 14:31:49', NULL, '0:0:0:0:0:0:0:1', 'D', '');
INSERT INTO `his_config_info` VALUES (6, 12, 'application-dev.yml', 'DEFAULT_GROUP', '', 'name: 3332', 'b2836463e38168b524f3c6ccb7168225', '2022-05-17 22:31:56', '2022-05-17 14:31:56', NULL, '0:0:0:0:0:0:0:1', 'D', '');
INSERT INTO `his_config_info` VALUES (7, 13, 'school-manage-system-dev.yml', 'dev', '', 'log4j:\r\n  rootLogger: WARN\r\nspring:\r\n  mvc:\r\n    pathmatch:\r\n      matching-strategy: ant_path_matcher #处理swagger空指针异常\r\n  data:\r\n    elasticsearch:\r\n      client:\r\n        reactive:\r\n          endpoints: localhost:9200\r\n  elasticsearch:\r\n    uris: [\"http://localhost:9200\"]\r\n  redis:\r\n    host: localhost\r\n    port: 6379\r\n    #    password: \"\"\r\n    timeout: 6000\r\n    database: 0\r\n    lettuce:\r\n      pool:\r\n        max-active: 10\r\n        max-idle: 8\r\n        max-wait: 100\r\n        min-idle: 2\r\n\r\n  datasource:\r\n    url: jdbc:mysql://localhost:3306/school?useUnicode=true&characterEncoding=utf-8&allowMultiQueries=true&useSSL=false\r\n    username: root\r\n    password: root\r\n    driver-class-name:  com.mysql.cj.jdbc.Driver\r\n    initial-size: 1\r\n    max-active: 20\r\n    min-idle: 1\r\n    max-wait: 60000\r\n    pool-prepared-statements: true\r\n    max-pool-prepared-statement-per-connection-size: 20\r\n    validation-query: SELECT \'x\'\r\n    test-on-borrow: false\r\n    test-on-return: false\r\n    test-while-idle: true\r\n    time-between-eviction-runs-millis: 60000\r\n    min-evictable-idle-time-millis: 300000\r\n    filters: stat,wall\r\n    web-stat-filter.enabled: true\r\n    web-stat-filter.url-pattern:  /*\r\n    web-stat-filter.exclusions: \"*.js , *.gif ,*.jpg ,*.png ,*.css ,*.ico , /druid/*\"\r\n    web-stat-filter.session-stat-max-count: 1000\r\n    web-stat-filter.profile-enable: true\r\n    stat-view-servlet.enabled: true\r\n    stat-view-servlet.url-pattern:  /druid/*\r\n    stat-view-servlet.reset-enable:  true\r\n    stat-view-servlet.login-username: admin\r\n    stat-view-servlet.login-password: admin\r\nname: test', '4fdcd3a534a59ec05f696bc5b5148834', '2022-05-17 22:32:56', '2022-05-17 14:32:57', 'nacos', '0:0:0:0:0:0:0:1', 'U', '1bea58c8-8c9d-4668-82d1-a1b4ad5b3a29');
INSERT INTO `his_config_info` VALUES (0, 14, 'common.yaml', 'DEFAULT_GROUP', '', 'name: zhangsan', 'ea223586c2e49f968650298787fceb7b', '2022-05-21 17:57:37', '2022-05-21 09:57:37', NULL, '0:0:0:0:0:0:0:1', 'I', '1bea58c8-8c9d-4668-82d1-a1b4ad5b3a29');
INSERT INTO `his_config_info` VALUES (10, 15, 'common.yaml', 'DEFAULT_GROUP', '', 'name: zhangsan', 'ea223586c2e49f968650298787fceb7b', '2022-05-21 18:24:40', '2022-05-21 10:24:40', 'nacos', '0:0:0:0:0:0:0:1', 'U', '1bea58c8-8c9d-4668-82d1-a1b4ad5b3a29');
INSERT INTO `his_config_info` VALUES (10, 16, 'common.yaml', 'DEFAULT_GROUP', '', 'log4j:\n  rootLogger: WARN\n\n#mybatis-plus配置，全局\nmybatis-plus:\n  global-config:\n    banner: false\n  configuration:\n    log-impl: org.apache.ibatis.logging.slf4j.Slf4jImpl\n  mapper-locations: classpath*:mapper/**/*.xml\n\nlogging:\n#  level:\n#    com.baomidou.mybatisplus: DEBUG\n#    com.sangfor.product.manage.dao: info\n#    com.sangfor.product.category.dao: info\n#    com.sangfor.product.specification: info\n#    com.sangfor: INFO\n#    com.sangfor.xaas.knowledge.mapper: debug\n#    com.github.pagehelper: DEBUG\n  config: classpath:logback-spring.xml\n#程序地址\nserver:\n  port: 8090\nspring:\n  mvc:\n    pathmatch:\n      matching-strategy: ant_path_matcher #处理swagger空指针异常\n  data:\n    elasticsearch:\n      client:\n        reactive:\n          endpoints: localhost:9200\n  elasticsearch:\n    uris: [\"http://localhost:9200\"]\n  redis:\n    host: localhost\n    port: 6379\n    #    password: \"\"\n    timeout: 6000\n    database: 0\n    lettuce:\n      pool:\n        max-active: 10\n        max-idle: 8\n        max-wait: 100\n        min-idle: 2\n\n  datasource:\n    url: jdbc:mysql://localhost:3306/school?useUnicode=true&characterEncoding=utf-8&allowMultiQueries=true&useSSL=false\n    username: root\n    password: root\n    driver-class-name:  com.mysql.cj.jdbc.Driver\n    initial-size: 1\n    max-active: 20\n    min-idle: 1\n    max-wait: 60000\n    pool-prepared-statements: true\n    max-pool-prepared-statement-per-connection-size: 20\n    validation-query: SELECT \'x\'\n    test-on-borrow: false\n    test-on-return: false\n    test-while-idle: true\n    time-between-eviction-runs-millis: 60000\n    min-evictable-idle-time-millis: 300000\n    filters: stat,wall\n    web-stat-filter.enabled: true\n    web-stat-filter.url-pattern:  /*\n    web-stat-filter.exclusions: \"*.js , *.gif ,*.jpg ,*.png ,*.css ,*.ico , /druid/*\"\n    web-stat-filter.session-stat-max-count: 1000\n    web-stat-filter.profile-enable: true\n    stat-view-servlet.enabled: true\n    stat-view-servlet.url-pattern:  /druid/*\n    stat-view-servlet.reset-enable:  true\n    stat-view-servlet.login-username: admin\n    stat-view-servlet.login-password: admin\n#name: zhangsan', 'fea838de229de9bbffddceba828b1369', '2022-05-21 18:24:51', '2022-05-21 10:24:52', 'nacos', '0:0:0:0:0:0:0:1', 'U', '1bea58c8-8c9d-4668-82d1-a1b4ad5b3a29');
INSERT INTO `his_config_info` VALUES (10, 17, 'common.yaml', 'DEFAULT_GROUP', '', 'log4j:\n  rootLogger: WARN\n\n#mybatis-plus配置，全局\nmybatis-plus:\n  global-config:\n    banner: false\n  configuration:\n    log-impl: org.apache.ibatis.logging.slf4j.Slf4jImpl\n  mapper-locations: classpath*:mapper/**/*.xml\n\nlogging:\n#  level:\n#    com.baomidou.mybatisplus: DEBUG\n#    com.sangfor.product.manage.dao: info\n#    com.sangfor.product.category.dao: info\n#    com.sangfor.product.specification: info\n#    com.sangfor: INFO\n#    com.sangfor.xaas.knowledge.mapper: debug\n#    com.github.pagehelper: DEBUG\n  config: classpath:logback-spring.xml\n#程序地址\nserver:\n  port: 8090\nspring:\n  mvc:\n    pathmatch:\n      matching-strategy: ant_path_matcher #处理swagger空指针异常\n  data:\n    elasticsearch:\n      client:\n        reactive:\n          endpoints: localhost:9200\n  elasticsearch:\n    uris: [\"http://localhost:9200\"]\n  redis:\n    host: localhost\n    port: 6379\n    #    password: \"\"\n    timeout: 6000\n    database: 0\n    lettuce:\n      pool:\n        max-active: 10\n        max-idle: 8\n        max-wait: 100\n        min-idle: 2\n\n  datasource:\n    url: jdbc:mysql://localhost:3306/school?useUnicode=true&characterEncoding=utf-8&allowMultiQueries=true&useSSL=false\n    username: root\n    password: root\n    driver-class-name:  com.mysql.cj.jdbc.Driver\n    initial-size: 1\n    max-active: 20\n    min-idle: 1\n    max-wait: 60000\n    pool-prepared-statements: true\n    max-pool-prepared-statement-per-connection-size: 20\n    validation-query: SELECT \'x\'\n    test-on-borrow: false\n    test-on-return: false\n    test-while-idle: true\n    time-between-eviction-runs-millis: 60000\n    min-evictable-idle-time-millis: 300000\n    filters: stat,wall\n    web-stat-filter.enabled: true\n    web-stat-filter.url-pattern:  /*\n    web-stat-filter.exclusions: \"*.js , *.gif ,*.jpg ,*.png ,*.css ,*.ico , /druid/*\"\n    web-stat-filter.session-stat-max-count: 1000\n    web-stat-filter.profile-enable: true\n    stat-view-servlet.enabled: true\n    stat-view-servlet.url-pattern:  /druid/*\n    stat-view-servlet.reset-enable:  true\n    stat-view-servlet.login-username: admin\n    stat-view-servlet.login-password: admin\nname: zhangsan', '4b33beff84d7adc9fbdf648f29132b2b', '2022-05-21 18:27:41', '2022-05-21 10:27:41', 'nacos', '0:0:0:0:0:0:0:1', 'U', '1bea58c8-8c9d-4668-82d1-a1b4ad5b3a29');
INSERT INTO `his_config_info` VALUES (10, 18, 'common.yaml', 'DEFAULT_GROUP', '', 'log4j:\n  rootLogger: WARN\n\n#mybatis-plus配置，全局\nmybatis-plus:\n  global-config:\n    banner: false\n  configuration:\n    log-impl: org.apache.ibatis.logging.slf4j.Slf4jImpl\n  mapper-locations: classpath*:mapper/**/*.xml\n\nlogging:\n#  level:\n#    com.baomidou.mybatisplus: DEBUG\n#    com.sangfor.product.manage.dao: info\n#    com.sangfor.product.category.dao: info\n#    com.sangfor.product.specification: info\n#    com.sangfor: INFO\n#    com.sangfor.xaas.knowledge.mapper: debug\n#    com.github.pagehelper: DEBUG\n  config: classpath:logback-spring.xml\n#程序地址\nserver:\n  port: 8090\nspring:\n  mvc:\n    pathmatch:\n      matching-strategy: ant_path_matcher #处理swagger空指针异常\n  data:\n    elasticsearch:\n      client:\n        reactive:\n          endpoints: localhost:9200\n  elasticsearch:\n    uris: [\"http://localhost:9200\"]\n  redis:\n    host: localhost\n    port: 6379\n    #    password: \"\"\n    timeout: 6000\n    database: 0\n    lettuce:\n      pool:\n        max-active: 10\n        max-idle: 8\n        max-wait: 100\n        min-idle: 2\n\n  datasource:\n    url: jdbc:mysql://localhost:3306/school?useUnicode=true&characterEncoding=utf-8&allowMultiQueries=true&useSSL=false\n    username: root\n    password: root\n    driver-class-name:  com.mysql.cj.jdbc.Driver\n    initial-size: 1\n    max-active: 20\n    min-idle: 1\n    max-wait: 60000\n    pool-prepared-statements: true\n    max-pool-prepared-statement-per-connection-size: 20\n    validation-query: SELECT \'x\'\n    test-on-borrow: false\n    test-on-return: false\n    test-while-idle: true\n    time-between-eviction-runs-millis: 60000\n    min-evictable-idle-time-millis: 300000\n    filters: stat,wall\n    web-stat-filter.enabled: true\n    web-stat-filter.url-pattern:  /*\n    web-stat-filter.exclusions: \"*.js , *.gif ,*.jpg ,*.png ,*.css ,*.ico , /druid/*\"\n    web-stat-filter.session-stat-max-count: 1000\n    web-stat-filter.profile-enable: true\n    stat-view-servlet.enabled: true\n    stat-view-servlet.url-pattern:  /druid/*\n    stat-view-servlet.reset-enable:  true\n    stat-view-servlet.login-username: admin\n    stat-view-servlet.login-password: admin\nname: zhangsan', '4b33beff84d7adc9fbdf648f29132b2b', '2022-05-21 18:28:19', '2022-05-21 10:28:19', 'nacos', '0:0:0:0:0:0:0:1', 'U', '1bea58c8-8c9d-4668-82d1-a1b4ad5b3a29');
INSERT INTO `his_config_info` VALUES (10, 19, 'common.yaml', 'DEFAULT_GROUP', '', 'log4j:\n  rootLogger: WARN\n\n#mybatis-plus配置，全局\nmybatis-plus:\n  global-config:\n    banner: false\n  configuration:\n    log-impl: org.apache.ibatis.logging.slf4j.Slf4jImpl\n  mapper-locations: classpath*:mapper/**/*.xml\n\nlogging:\n#  level:\n#    com.baomidou.mybatisplus: DEBUG\n#    com.sangfor.product.manage.dao: info\n#    com.sangfor.product.category.dao: info\n#    com.sangfor.product.specification: info\n#    com.sangfor: INFO\n#    com.sangfor.xaas.knowledge.mapper: debug\n#    com.github.pagehelper: DEBUG\n  config: classpath:logback-spring.xml\n#程序地址\nserver:\n  port: 8090\nspring:\n  mvc:\n    pathmatch:\n      matching-strategy: ant_path_matcher #处理swagger空指针异常\n  data:\n    elasticsearch:\n      client:\n        reactive:\n          endpoints: localhost:9200\n  elasticsearch:\n    uris: [\"http://localhost:9200\"]\n  redis:\n    host: localhost\n    port: 6379\n    #    password: \"\"\n    timeout: 6000\n    database: 0\n    lettuce:\n      pool:\n        max-active: 10\n        max-idle: 8\n        max-wait: 100\n        min-idle: 2\n\n  datasource:\n    url: jdbc:mysql://localhost:3306/school?useUnicode=true&characterEncoding=utf-8&allowMultiQueries=true&useSSL=false\n    username: root\n    password: root\n    driver-class-name:  com.mysql.cj.jdbc.Driver\n    initial-size: 1\n    max-active: 20\n    min-idle: 1\n    max-wait: 60000\n    pool-prepared-statements: true\n    max-pool-prepared-statement-per-connection-size: 20\n    validation-query: SELECT \'x\'\n    test-on-borrow: false\n    test-on-return: false\n    test-while-idle: true\n    time-between-eviction-runs-millis: 60000\n    min-evictable-idle-time-millis: 300000\n    filters: stat,wall\n    web-stat-filter.enabled: true\n    web-stat-filter.url-pattern:  /*\n    web-stat-filter.exclusions: \"*.js , *.gif ,*.jpg ,*.png ,*.css ,*.ico , /druid/*\"\n    web-stat-filter.session-stat-max-count: 1000\n    web-stat-filter.profile-enable: true\n    stat-view-servlet.enabled: true\n    stat-view-servlet.url-pattern:  /druid/*\n    stat-view-servlet.reset-enable:  true\n    stat-view-servlet.login-username: admin\n    stat-view-servlet.login-password: admin\nname: wangwu', '0036e21ef494d2a4c54d9bbe7d39756e', '2022-05-21 19:06:16', '2022-05-21 11:06:17', 'nacos', '0:0:0:0:0:0:0:1', 'U', '1bea58c8-8c9d-4668-82d1-a1b4ad5b3a29');
INSERT INTO `his_config_info` VALUES (10, 20, 'common.yaml', 'DEFAULT_GROUP', '', 'log4j:\n  rootLogger: WARN\n\n#mybatis-plus配置，全局\nmybatis-plus:\n  global-config:\n    banner: false\n  configuration:\n    log-impl: org.apache.ibatis.logging.slf4j.Slf4jImpl\n  mapper-locations: classpath*:mapper/**/*.xml\n\nlogging:\n#  level:\n#    com.baomidou.mybatisplus: DEBUG\n#    com.sangfor.product.manage.dao: info\n#    com.sangfor.product.category.dao: info\n#    com.sangfor.product.specification: info\n#    com.sangfor: INFO\n#    com.sangfor.xaas.knowledge.mapper: debug\n#    com.github.pagehelper: DEBUG\n  config: classpath:logback-spring.xml\n#程序地址\nserver:\n  port: 8090\nspring:\n  mvc:\n    pathmatch:\n      matching-strategy: ant_path_matcher #处理swagger空指针异常\n  data:\n    elasticsearch:\n      client:\n        reactive:\n          endpoints: localhost:9200\n  elasticsearch:\n    uris: [\"http://localhost:9200\"]\n  redis:\n    host: localhost\n    port: 6379\n    #    password: \"\"\n    timeout: 6000\n    database: 0\n    lettuce:\n      pool:\n        max-active: 10\n        max-idle: 8\n        max-wait: 100\n        min-idle: 2\n\n  datasource:\n    url: jdbc:mysql://localhost:3306/school?useUnicode=true&characterEncoding=utf-8&allowMultiQueries=true&useSSL=false\n    username: root\n    password: root\n    driver-class-name:  com.mysql.cj.jdbc.Driver\n    initial-size: 1\n    max-active: 20\n    min-idle: 1\n    max-wait: 60000\n    pool-prepared-statements: true\n    max-pool-prepared-statement-per-connection-size: 20\n    validation-query: SELECT \'x\'\n    test-on-borrow: false\n    test-on-return: false\n    test-while-idle: true\n    time-between-eviction-runs-millis: 60000\n    min-evictable-idle-time-millis: 300000\n    filters: stat,wall\n    web-stat-filter.enabled: true\n    web-stat-filter.url-pattern:  /*\n    web-stat-filter.exclusions: \"*.js , *.gif ,*.jpg ,*.png ,*.css ,*.ico , /druid/*\"\n    web-stat-filter.session-stat-max-count: 1000\n    web-stat-filter.profile-enable: true\n    stat-view-servlet.enabled: true\n    stat-view-servlet.url-pattern:  /druid/*\n    stat-view-servlet.reset-enable:  true\n    stat-view-servlet.login-username: admin\n    stat-view-servlet.login-password: admin\nname: zhaoliu', '3773e0f8390b5ee015c3b43925a50b1b', '2022-05-21 19:15:22', '2022-05-21 11:15:23', 'nacos', '0:0:0:0:0:0:0:1', 'U', '1bea58c8-8c9d-4668-82d1-a1b4ad5b3a29');
INSERT INTO `his_config_info` VALUES (10, 21, 'common.yaml', 'DEFAULT_GROUP', '', 'log4j:\n  rootLogger: WARN\n\n#mybatis-plus配置，全局\nmybatis-plus:\n  global-config:\n    banner: false\n  configuration:\n    log-impl: org.apache.ibatis.logging.slf4j.Slf4jImpl\n  mapper-locations: classpath*:mapper/**/*.xml\n\nlogging:\n#  level:\n#    com.baomidou.mybatisplus: DEBUG\n#    com.sangfor.product.manage.dao: info\n#    com.sangfor.product.category.dao: info\n#    com.sangfor.product.specification: info\n#    com.sangfor: INFO\n#    com.sangfor.xaas.knowledge.mapper: debug\n#    com.github.pagehelper: DEBUG\n  config: classpath:logback-spring.xml\n#程序地址\nserver:\n  port: 8090\nspring:\n  mvc:\n    pathmatch:\n      matching-strategy: ant_path_matcher #处理swagger空指针异常\n  data:\n    elasticsearch:\n      client:\n        reactive:\n          endpoints: localhost:9200\n  elasticsearch:\n    uris: [\"http://localhost:9200\"]\n  redis:\n    host: localhost\n    port: 6379\n    #    password: \"\"\n    timeout: 6000\n    database: 0\n    lettuce:\n      pool:\n        max-active: 10\n        max-idle: 8\n        max-wait: 100\n        min-idle: 2\n\n  datasource:\n    url: jdbc:mysql://localhost:3306/school?useUnicode=true&characterEncoding=utf-8&allowMultiQueries=true&useSSL=false\n    username: root\n    password: root\n    driver-class-name:  com.mysql.cj.jdbc.Driver\n    initial-size: 1\n    max-active: 20\n    min-idle: 1\n    max-wait: 60000\n    pool-prepared-statements: true\n    max-pool-prepared-statement-per-connection-size: 20\n    validation-query: SELECT \'x\'\n    test-on-borrow: false\n    test-on-return: false\n    test-while-idle: true\n    time-between-eviction-runs-millis: 60000\n    min-evictable-idle-time-millis: 300000\n    filters: stat,wall\n    web-stat-filter.enabled: true\n    web-stat-filter.url-pattern:  /*\n    web-stat-filter.exclusions: \"*.js , *.gif ,*.jpg ,*.png ,*.css ,*.ico , /druid/*\"\n    web-stat-filter.session-stat-max-count: 1000\n    web-stat-filter.profile-enable: true\n    stat-view-servlet.enabled: true\n    stat-view-servlet.url-pattern:  /druid/*\n    stat-view-servlet.reset-enable:  true\n    stat-view-servlet.login-username: admin\n    stat-view-servlet.login-password: admin\nname: wuqi', '3da13b074f26ba47d29e282fb3cba3ba', '2022-05-21 19:18:16', '2022-05-21 11:18:16', 'nacos', '0:0:0:0:0:0:0:1', 'U', '1bea58c8-8c9d-4668-82d1-a1b4ad5b3a29');

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `resource` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `action` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  UNIQUE INDEX `uk_role_permission`(`role`, `resource`, `action`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permissions
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  UNIQUE INDEX `idx_user_role`(`username`, `role`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'tenant_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tenant_info
-- ----------------------------
INSERT INTO `tenant_info` VALUES (1, '1', '077fedee-be61-4213-ab88-e113c7bd1773', 'prod', '生产环境', 'nacos', 1652780235270, 1652780235270);
INSERT INTO `tenant_info` VALUES (2, '1', 'c3e54412-20a3-4ba3-86bc-68fc3784de37', 'sit', '生产环境', 'nacos', 1652780249390, 1652780249390);
INSERT INTO `tenant_info` VALUES (3, '1', '093e9955-9a15-478d-b66c-a5dd26c3522f', 'uat', '灰度环境', 'nacos', 1652780272621, 1652780272621);
INSERT INTO `tenant_info` VALUES (4, '1', '1bea58c8-8c9d-4668-82d1-a1b4ad5b3a29', 'dev', '开发环境', 'nacos', 1652780305894, 1652780305894);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('nacos', '$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu', 1);

SET FOREIGN_KEY_CHECKS = 1;
