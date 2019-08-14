/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3306
 Source Schema         : movies

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 14/08/2019 18:07:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cinema
-- ----------------------------
DROP TABLE IF EXISTS `cinema`;
CREATE TABLE `cinema`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '影院名称',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '影院地址',
  `phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `picture` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '影院照片（最多五张,json）',
  `open_begin_time` time(0) NULL DEFAULT NULL COMMENT '营业时间',
  `open_end_time` time(0) NULL DEFAULT NULL COMMENT '结束时间',
  `introduce` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '影院介绍',
  `longitude` double(10, 6) NULL DEFAULT NULL COMMENT '经度',
  `latitude` double(10, 6) NULL DEFAULT NULL COMMENT '维度',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `delete_flag` tinyint(1) NULL DEFAULT 0 COMMENT '删除标志（0-否；1-是）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '影院(引入地图)' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cinema_order
-- ----------------------------
DROP TABLE IF EXISTS `cinema_order`;
CREATE TABLE `cinema_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_number` bigint(20) NULL DEFAULT NULL COMMENT '订单编号',
  `cinema_id` int(11) NULL DEFAULT NULL COMMENT '影院id',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `phone` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系手机号',
  `ticket_price` int(11) NULL DEFAULT NULL COMMENT '票价（单位：分）',
  `discount` int(11) NULL DEFAULT NULL COMMENT '折扣（计算除100）',
  `actual_payment` int(11) NULL DEFAULT NULL COMMENT '实付款（单位：分）',
  `seat_id` int(11) NULL DEFAULT NULL COMMENT '座位id',
  `shows_no` datetime(0) NULL DEFAULT NULL COMMENT '场次',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '状态（1-已付款；2-未付款；3-已取消；4-订单超时）',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `delete_flag` tinyint(1) NULL DEFAULT 0 COMMENT '删除标志（0-否；1-是）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '影院订单(选座下单，涉及并发问题)' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cinema_seat
-- ----------------------------
DROP TABLE IF EXISTS `cinema_seat`;
CREATE TABLE `cinema_seat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cinema_id` int(11) NULL DEFAULT NULL COMMENT '影院id',
  `video_hall` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '放映厅（比如1号厅）',
  `row_no` int(11) NULL DEFAULT NULL COMMENT '第几排',
  `seat_no` int(11) NULL DEFAULT NULL COMMENT '第几座（如果是过道，座位号是0）',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `delete_flag` tinyint(1) NULL DEFAULT 0 COMMENT '删除标志（0-否；1-是）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '影院座位' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cinema_shows_no
-- ----------------------------
DROP TABLE IF EXISTS `cinema_shows_no`;
CREATE TABLE `cinema_shows_no`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cinema_id` int(11) NULL DEFAULT NULL COMMENT '影院id',
  `movie_id` int(11) NULL DEFAULT NULL COMMENT '电影id',
  `shows_no` datetime(0) NULL DEFAULT NULL COMMENT '场次',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `delete_flag` tinyint(1) NULL DEFAULT 0 COMMENT '删除标志（0-否；1-是）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '影院-电影-场次' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `collect_id` int(11) NULL DEFAULT NULL COMMENT '收藏的目标id',
  `collect_type` int(11) NULL DEFAULT NULL COMMENT '类型（1-影评，2-话题，...）',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_flag` tinyint(1) NULL DEFAULT 0 COMMENT '删除标志（0-否；1-是）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户收藏' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NULL DEFAULT NULL COMMENT '评论类型（1-影评评论；2-群组）',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评论内容',
  `target_id` int(11) NULL DEFAULT NULL COMMENT '评论目标id',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `delete_flag` tinyint(1) NULL DEFAULT 0 COMMENT '删除标志（0-否；1-是）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '评论(影评后面的评论+群组话题后面的评论)' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for exp_log
-- ----------------------------
DROP TABLE IF EXISTS `exp_log`;
CREATE TABLE `exp_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exp` int(11) NULL DEFAULT NULL COMMENT '经验值',
  `exp_source` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经验值来源',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户经验日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for film_stars
-- ----------------------------
DROP TABLE IF EXISTS `film_stars`;
CREATE TABLE `film_stars`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '影人名字',
  `en_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '影人英文名字',
  `photo` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '影人照片',
  `introduce` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '影人介绍',
  `profession` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '职业（多个用 | 分隔）',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `region_id` int(11) NULL DEFAULT NULL COMMENT '出生地',
  `height` int(11) NULL DEFAULT NULL COMMENT '身高（厘米）',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `delete_flag` tinyint(1) NULL DEFAULT 0 COMMENT '删除标志（0-否；1-是）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '影视明星' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for film_types_regions
-- ----------------------------
DROP TABLE IF EXISTS `film_types_regions`;
CREATE TABLE `film_types_regions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `type` tinyint(4) NULL DEFAULT NULL COMMENT '类型（1-影片类型；2-国家地区）',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `delete_flag` tinyint(1) NULL DEFAULT 0 COMMENT '删除标志（0-否；1-是）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '影片类型&国家地区' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for groups
-- ----------------------------
DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '群组名称',
  `classify_id` int(11) NULL DEFAULT NULL COMMENT '群组分类',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `delete_flag` tinyint(1) NULL DEFAULT 0 COMMENT '删除标志（0-否；1-是）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '群组' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for groups_classify
-- ----------------------------
DROP TABLE IF EXISTS `groups_classify`;
CREATE TABLE `groups_classify`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类名',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '如果当前为子级分类，这个字段为父级分类的id',
  `type` tinyint(4) NULL DEFAULT NULL COMMENT '类型（1-父级分类；2-子级分类）',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `delete_flag` tinyint(1) NULL DEFAULT 0 COMMENT '删除标志（0-否；1-是）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '群组分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for groups_member
-- ----------------------------
DROP TABLE IF EXISTS `groups_member`;
CREATE TABLE `groups_member`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NULL DEFAULT NULL COMMENT '群组id',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '成员id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `delete_flag` tinyint(1) NULL DEFAULT 0 COMMENT '删除标志（0-否；1-是）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '群组-成员' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for groups_topic
-- ----------------------------
DROP TABLE IF EXISTS `groups_topic`;
CREATE TABLE `groups_topic`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `front_content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '前台展示内容',
  `source_content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '源代码内容，用来读取修改',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户',
  `group_id` int(11) NULL DEFAULT NULL COMMENT '群组id',
  `page_view` int(11) NULL DEFAULT NULL COMMENT '浏览量',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `delete_flag` tinyint(1) NULL DEFAULT 0 COMMENT '删除标志（0-否；1-是）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '群组话题' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for letter
-- ----------------------------
DROP TABLE IF EXISTS `letter`;
CREATE TABLE `letter`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '私信内容',
  `from_user_id` int(11) NULL DEFAULT NULL COMMENT '发送者',
  `to_user_id` int(11) NULL DEFAULT NULL COMMENT '接收者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `delete_flag` tinyint(1) NULL DEFAULT 0 COMMENT '删除标志（0-否；1-是）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '私信表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for movie
-- ----------------------------
DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电影名',
  `region_id` int(11) NULL DEFAULT NULL COMMENT '地区',
  `plot` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '剧情',
  `running_time` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '片长',
  `cover` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '封面',
  `release_time` date NULL DEFAULT NULL COMMENT '发行日期',
  `box_office` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '累计票房收入',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `delete_flag` tinyint(1) NULL DEFAULT 0 COMMENT '删除标志（0-否；1-是）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '电影表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for movie_actor
-- ----------------------------
DROP TABLE IF EXISTS `movie_actor`;
CREATE TABLE `movie_actor`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) NULL DEFAULT NULL COMMENT '电影id',
  `star_id` int(11) NULL DEFAULT NULL COMMENT '影人id',
  `type` tinyint(4) NULL DEFAULT NULL COMMENT '类型（1-导演；2-编剧；3-制片；4-主演）',
  `character` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '饰演的角色',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `delete_flag` tinyint(1) NULL DEFAULT 0 COMMENT '删除标志（0-否；1-是）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '电影-相关人员' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for movie_company
-- ----------------------------
DROP TABLE IF EXISTS `movie_company`;
CREATE TABLE `movie_company`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) NULL DEFAULT NULL COMMENT '电影id',
  `company_id` int(11) NULL DEFAULT NULL COMMENT '公司id',
  `type` tinyint(4) NULL DEFAULT NULL COMMENT '类型（1-制作公司；2-发行公司）',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `delete_flag` tinyint(1) NULL DEFAULT 0 COMMENT '删除标志（0-否；1-是）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '电影-制作公司' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for movie_critics
-- ----------------------------
DROP TABLE IF EXISTS `movie_critics`;
CREATE TABLE `movie_critics`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) NULL DEFAULT NULL COMMENT '电影id',
  `title` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `front_content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '长影评内容',
  `source_content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '源代码内容',
  `short_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '短影评内容',
  `type` tinyint(4) NULL DEFAULT NULL COMMENT '类型（1-长影评；2-短影评）',
  `support` int(11) NULL DEFAULT NULL COMMENT '赞',
  `digest` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '摘要',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '状态（1-发布；2-草稿）',
  `allow_comment` tinyint(1) NULL DEFAULT 1 COMMENT '允许评论（0-否；1-是）',
  `page_view` int(11) NULL DEFAULT NULL COMMENT '浏览量',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `delete_flag` tinyint(1) NULL DEFAULT 0 COMMENT '删除标志（0-否；1-是）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '影评' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for movie_score
-- ----------------------------
DROP TABLE IF EXISTS `movie_score`;
CREATE TABLE `movie_score`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `movie_id` int(11) NULL DEFAULT NULL COMMENT '电影id',
  `score` int(2) NULL DEFAULT NULL COMMENT '分数',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `delete_flag` tinyint(1) NULL DEFAULT 0 COMMENT '删除标志（0-否；1-是）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '电影-评分' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for movie_ticket_price
-- ----------------------------
DROP TABLE IF EXISTS `movie_ticket_price`;
CREATE TABLE `movie_ticket_price`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cinema_id` int(11) NULL DEFAULT NULL COMMENT '影院id',
  `movie_id` int(11) NULL DEFAULT NULL COMMENT '电影id',
  `ticket_price` int(11) NULL DEFAULT NULL COMMENT '票价（单位：分）',
  `discount` int(11) NULL DEFAULT NULL COMMENT '折扣（计算的时候除100）',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `delete_flag` tinyint(1) NULL DEFAULT 0 COMMENT '删除标志（0-否；1-是）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '电影票价' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for movie_type
-- ----------------------------
DROP TABLE IF EXISTS `movie_type`;
CREATE TABLE `movie_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) NULL DEFAULT NULL COMMENT '电影id',
  `type_id` int(11) NULL DEFAULT NULL COMMENT '电影类型id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `delete_flag` tinyint(1) NULL DEFAULT 0 COMMENT '删除标志（0-否；1-是）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '电影-类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '新闻标题',
  `front_content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '新闻内容',
  `source_content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '源代码内容',
  `movie_id` int(11) NULL DEFAULT NULL COMMENT '新闻关联的电影',
  `star_id` int(11) NULL DEFAULT NULL COMMENT '新闻关联的明星',
  `digest` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '摘要',
  `allow_comment` tinyint(1) NULL DEFAULT 1 COMMENT '允许评论（0-否；1-是）',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '状态（1-发布；2-草稿）',
  `page_view` int(11) NULL DEFAULT NULL COMMENT '浏览量',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `delete_flag` tinyint(1) NULL DEFAULT 0 COMMENT '删除标志（0-否；1-是）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '新闻' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for news_actor
-- ----------------------------
DROP TABLE IF EXISTS `news_actor`;
CREATE TABLE `news_actor`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `news_id` int(11) NULL DEFAULT NULL COMMENT '新闻id',
  `star_id` int(11) NULL DEFAULT NULL COMMENT '明星id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `delete_flag` tinyint(1) NULL DEFAULT 0 COMMENT '删除标志（0-否；1-是）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '新闻-相关人员' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通知内容',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统通知' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for production_company
-- ----------------------------
DROP TABLE IF EXISTS `production_company`;
CREATE TABLE `production_company`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '制作公司',
  `region_id` int(11) NULL DEFAULT NULL COMMENT '国家地区',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `delete_flag` tinyint(1) NULL DEFAULT 0 COMMENT '删除标志（0-否；1-是）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '制作公司' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for province
-- ----------------------------
DROP TABLE IF EXISTS `province`;
CREATE TABLE `province`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `level` tinyint(4) NULL DEFAULT NULL COMMENT '级别（1-省；2-市；3-区）',
  `province` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省编号',
  `city` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市编号',
  `county` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区编号',
  `letter_sort` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'A-Z排序（仅限市级字母开头）',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `delete_flag` tinyint(1) NULL DEFAULT 0 COMMENT '删除标志（0-否；1-是）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3229 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '省市区' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of province
-- ----------------------------
INSERT INTO `province` VALUES (1, '北京市', 1, '11', '00', '00', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2, '北京市', 2, '11', '01', '00', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3, '东城区', 3, '11', '01', '01', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (4, '西城区', 3, '11', '01', '02', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (5, '朝阳区', 3, '11', '01', '05', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (6, '丰台区', 3, '11', '01', '06', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (7, '石景山区', 3, '11', '01', '07', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (8, '海淀区', 3, '11', '01', '08', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (9, '门头沟区', 3, '11', '01', '09', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (10, '房山区', 3, '11', '01', '11', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (11, '通州区', 3, '11', '01', '12', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (12, '顺义区', 3, '11', '01', '13', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (13, '昌平区', 3, '11', '01', '14', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (14, '大兴区', 3, '11', '01', '15', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (15, '怀柔区', 3, '11', '01', '16', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (16, '平谷区', 3, '11', '01', '17', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (17, '密云区', 3, '11', '01', '18', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (18, '延庆区', 3, '11', '01', '19', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (19, '天津市', 1, '12', '00', '00', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (20, '天津市', 2, '12', '01', '00', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (21, '和平区', 3, '12', '01', '01', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (22, '河东区', 3, '12', '01', '02', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (23, '河西区', 3, '12', '01', '03', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (24, '南开区', 3, '12', '01', '04', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (25, '河北区', 3, '12', '01', '05', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (26, '红桥区', 3, '12', '01', '06', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (27, '东丽区', 3, '12', '01', '10', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (28, '西青区', 3, '12', '01', '11', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (29, '津南区', 3, '12', '01', '12', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (30, '北辰区', 3, '12', '01', '13', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (31, '武清区', 3, '12', '01', '14', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (32, '宝坻区', 3, '12', '01', '15', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (33, '滨海新区', 3, '12', '01', '16', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (34, '宁河区', 3, '12', '01', '17', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (35, '静海区', 3, '12', '01', '18', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (36, '蓟州区', 3, '12', '01', '19', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (37, '河北省', 1, '13', '00', '00', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (38, '石家庄市', 2, '13', '01', '00', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (39, '长安区', 3, '13', '01', '02', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (40, '桥西区', 3, '13', '01', '04', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (41, '新华区', 3, '13', '01', '05', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (42, '井陉矿区', 3, '13', '01', '07', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (43, '裕华区', 3, '13', '01', '08', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (44, '藁城区', 3, '13', '01', '09', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (45, '鹿泉区', 3, '13', '01', '10', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (46, '栾城区', 3, '13', '01', '11', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (47, '井陉县', 3, '13', '01', '21', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (48, '正定县', 3, '13', '01', '23', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (49, '行唐县', 3, '13', '01', '25', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (50, '灵寿县', 3, '13', '01', '26', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (51, '高邑县', 3, '13', '01', '27', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (52, '深泽县', 3, '13', '01', '28', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (53, '赞皇县', 3, '13', '01', '29', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (54, '无极县', 3, '13', '01', '30', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (55, '平山县', 3, '13', '01', '31', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (56, '元氏县', 3, '13', '01', '32', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (57, '赵县', 3, '13', '01', '33', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (58, '辛集市', 3, '13', '01', '81', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (59, '晋州市', 3, '13', '01', '83', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (60, '新乐市', 3, '13', '01', '84', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (61, '唐山市', 2, '13', '02', '00', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (62, '路南区', 3, '13', '02', '02', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (63, '路北区', 3, '13', '02', '03', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (64, '古冶区', 3, '13', '02', '04', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (65, '开平区', 3, '13', '02', '05', 'K', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (66, '丰南区', 3, '13', '02', '07', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (67, '丰润区', 3, '13', '02', '08', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (68, '曹妃甸区', 3, '13', '02', '09', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (69, '滦县', 3, '13', '02', '23', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (70, '滦南县', 3, '13', '02', '24', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (71, '乐亭县', 3, '13', '02', '25', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (72, '迁西县', 3, '13', '02', '27', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (73, '玉田县', 3, '13', '02', '29', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (74, '遵化市', 3, '13', '02', '81', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (75, '迁安市', 3, '13', '02', '83', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (76, '秦皇岛市', 2, '13', '03', '00', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (77, '海港区', 3, '13', '03', '02', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (78, '山海关区', 3, '13', '03', '03', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (79, '北戴河区', 3, '13', '03', '04', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (80, '青龙满族自治县', 3, '13', '03', '21', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (81, '昌黎县', 3, '13', '03', '22', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (82, '抚宁县', 3, '13', '03', '23', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (83, '卢龙县', 3, '13', '03', '24', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (84, '邯郸市', 2, '13', '04', '00', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (85, '邯山区', 3, '13', '04', '02', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (86, '丛台区', 3, '13', '04', '03', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (87, '复兴区', 3, '13', '04', '04', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (88, '峰峰矿区', 3, '13', '04', '06', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (89, '邯郸县', 3, '13', '04', '21', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (90, '临漳县', 3, '13', '04', '23', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (91, '成安县', 3, '13', '04', '24', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (92, '大名县', 3, '13', '04', '25', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (93, '涉县', 3, '13', '04', '26', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (94, '磁县', 3, '13', '04', '27', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (95, '肥乡县', 3, '13', '04', '28', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (96, '永年县', 3, '13', '04', '29', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (97, '邱县', 3, '13', '04', '30', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (98, '鸡泽县', 3, '13', '04', '31', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (99, '广平县', 3, '13', '04', '32', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (100, '馆陶县', 3, '13', '04', '33', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (101, '魏县', 3, '13', '04', '34', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (102, '曲周县', 3, '13', '04', '35', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (103, '武安市', 3, '13', '04', '81', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (104, '邢台市', 2, '13', '05', '00', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (105, '桥东区', 3, '13', '05', '02', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (106, '桥西区', 3, '13', '05', '03', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (107, '邢台县', 3, '13', '05', '21', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (108, '临城县', 3, '13', '05', '22', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (109, '内丘县', 3, '13', '05', '23', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (110, '柏乡县', 3, '13', '05', '24', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (111, '隆尧县', 3, '13', '05', '25', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (112, '任县', 3, '13', '05', '26', 'R', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (113, '南和县', 3, '13', '05', '27', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (114, '宁晋县', 3, '13', '05', '28', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (115, '巨鹿县', 3, '13', '05', '29', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (116, '新河县', 3, '13', '05', '30', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (117, '广宗县', 3, '13', '05', '31', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (118, '平乡县', 3, '13', '05', '32', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (119, '威县', 3, '13', '05', '33', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (120, '清河县', 3, '13', '05', '34', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (121, '临西县', 3, '13', '05', '35', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (122, '南宫市', 3, '13', '05', '81', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (123, '沙河市', 3, '13', '05', '82', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (124, '保定市', 2, '13', '06', '00', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (125, '新市区', 3, '13', '06', '02', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (126, '北市区', 3, '13', '06', '03', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (127, '南市区', 3, '13', '06', '04', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (128, '满城县', 3, '13', '06', '21', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (129, '清苑县', 3, '13', '06', '22', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (130, '涞水县', 3, '13', '06', '23', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (131, '阜平县', 3, '13', '06', '24', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (132, '徐水县', 3, '13', '06', '25', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (133, '定兴县', 3, '13', '06', '26', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (134, '唐县', 3, '13', '06', '27', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (135, '高阳县', 3, '13', '06', '28', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (136, '容城县', 3, '13', '06', '29', 'R', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (137, '涞源县', 3, '13', '06', '30', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (138, '望都县', 3, '13', '06', '31', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (139, '安新县', 3, '13', '06', '32', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (140, '易县', 3, '13', '06', '33', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (141, '曲阳县', 3, '13', '06', '34', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (142, '蠡县', 3, '13', '06', '35', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (143, '顺平县', 3, '13', '06', '36', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (144, '博野县', 3, '13', '06', '37', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (145, '雄县', 3, '13', '06', '38', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (146, '涿州市', 3, '13', '06', '81', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (147, '定州市', 3, '13', '06', '82', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (148, '安国市', 3, '13', '06', '83', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (149, '高碑店市', 3, '13', '06', '84', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (150, '张家口市', 2, '13', '07', '00', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (151, '桥东区', 3, '13', '07', '02', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (152, '桥西区', 3, '13', '07', '03', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (153, '宣化区', 3, '13', '07', '05', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (154, '下花园区', 3, '13', '07', '06', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (155, '宣化县', 3, '13', '07', '21', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (156, '张北县', 3, '13', '07', '22', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (157, '康保县', 3, '13', '07', '23', 'K', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (158, '沽源县', 3, '13', '07', '24', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (159, '尚义县', 3, '13', '07', '25', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (160, '蔚县', 3, '13', '07', '26', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (161, '阳原县', 3, '13', '07', '27', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (162, '怀安县', 3, '13', '07', '28', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (163, '万全县', 3, '13', '07', '29', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (164, '怀来县', 3, '13', '07', '30', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (165, '涿鹿县', 3, '13', '07', '31', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (166, '赤城县', 3, '13', '07', '32', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (167, '崇礼县', 3, '13', '07', '33', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (168, '承德市', 2, '13', '08', '00', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (169, '双桥区', 3, '13', '08', '02', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (170, '双滦区', 3, '13', '08', '03', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (171, '鹰手营子矿区', 3, '13', '08', '04', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (172, '承德县', 3, '13', '08', '21', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (173, '兴隆县', 3, '13', '08', '22', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (174, '平泉县', 3, '13', '08', '23', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (175, '滦平县', 3, '13', '08', '24', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (176, '隆化县', 3, '13', '08', '25', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (177, '丰宁满族自治县', 3, '13', '08', '26', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (178, '宽城满族自治县', 3, '13', '08', '27', 'K', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (179, '围场满族蒙古族自治县', 3, '13', '08', '28', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (180, '沧州市', 2, '13', '09', '00', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (181, '新华区', 3, '13', '09', '02', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (182, '运河区', 3, '13', '09', '03', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (183, '沧县', 3, '13', '09', '21', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (184, '青县', 3, '13', '09', '22', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (185, '东光县', 3, '13', '09', '23', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (186, '海兴县', 3, '13', '09', '24', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (187, '盐山县', 3, '13', '09', '25', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (188, '肃宁县', 3, '13', '09', '26', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (189, '南皮县', 3, '13', '09', '27', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (190, '吴桥县', 3, '13', '09', '28', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (191, '献县', 3, '13', '09', '29', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (192, '孟村回族自治县', 3, '13', '09', '30', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (193, '泊头市', 3, '13', '09', '81', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (194, '任丘市', 3, '13', '09', '82', 'R', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (195, '黄骅市', 3, '13', '09', '83', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (196, '河间市', 3, '13', '09', '84', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (197, '廊坊市', 2, '13', '10', '00', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (198, '安次区', 3, '13', '10', '02', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (199, '广阳区', 3, '13', '10', '03', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (200, '固安县', 3, '13', '10', '22', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (201, '永清县', 3, '13', '10', '23', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (202, '香河县', 3, '13', '10', '24', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (203, '大城县', 3, '13', '10', '25', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (204, '文安县', 3, '13', '10', '26', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (205, '大厂回族自治县', 3, '13', '10', '28', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (206, '霸州市', 3, '13', '10', '81', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (207, '三河市', 3, '13', '10', '82', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (208, '衡水市', 2, '13', '11', '00', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (209, '桃城区', 3, '13', '11', '02', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (210, '枣强县', 3, '13', '11', '21', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (211, '武邑县', 3, '13', '11', '22', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (212, '武强县', 3, '13', '11', '23', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (213, '饶阳县', 3, '13', '11', '24', 'R', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (214, '安平县', 3, '13', '11', '25', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (215, '故城县', 3, '13', '11', '26', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (216, '景县', 3, '13', '11', '27', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (217, '阜城县', 3, '13', '11', '28', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (218, '冀州市', 3, '13', '11', '81', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (219, '深州市', 3, '13', '11', '82', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (220, '山西省', 1, '14', '00', '00', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (221, '太原市', 2, '14', '01', '00', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (222, '小店区', 3, '14', '01', '05', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (223, '迎泽区', 3, '14', '01', '06', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (224, '杏花岭区', 3, '14', '01', '07', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (225, '尖草坪区', 3, '14', '01', '08', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (226, '万柏林区', 3, '14', '01', '09', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (227, '晋源区', 3, '14', '01', '10', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (228, '清徐县', 3, '14', '01', '21', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (229, '阳曲县', 3, '14', '01', '22', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (230, '娄烦县', 3, '14', '01', '23', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (231, '古交市', 3, '14', '01', '81', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (232, '大同市', 2, '14', '02', '00', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (233, '城区', 3, '14', '02', '02', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (234, '矿区', 3, '14', '02', '03', 'K', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (235, '南郊区', 3, '14', '02', '11', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (236, '新荣区', 3, '14', '02', '12', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (237, '阳高县', 3, '14', '02', '21', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (238, '天镇县', 3, '14', '02', '22', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (239, '广灵县', 3, '14', '02', '23', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (240, '灵丘县', 3, '14', '02', '24', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (241, '浑源县', 3, '14', '02', '25', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (242, '左云县', 3, '14', '02', '26', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (243, '大同县', 3, '14', '02', '27', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (244, '阳泉市', 2, '14', '03', '00', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (245, '城区', 3, '14', '03', '02', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (246, '矿区', 3, '14', '03', '03', 'K', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (247, '郊区', 3, '14', '03', '11', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (248, '平定县', 3, '14', '03', '21', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (249, '盂县', 3, '14', '03', '22', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (250, '长治市', 2, '14', '04', '00', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (251, '城区', 3, '14', '04', '02', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (252, '郊区', 3, '14', '04', '11', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (253, '长治县', 3, '14', '04', '21', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (254, '襄垣县', 3, '14', '04', '23', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (255, '屯留县', 3, '14', '04', '24', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (256, '平顺县', 3, '14', '04', '25', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (257, '黎城县', 3, '14', '04', '26', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (258, '壶关县', 3, '14', '04', '27', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (259, '长子县', 3, '14', '04', '28', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (260, '武乡县', 3, '14', '04', '29', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (261, '沁县', 3, '14', '04', '30', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (262, '沁源县', 3, '14', '04', '31', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (263, '潞城市', 3, '14', '04', '81', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (264, '晋城市', 2, '14', '05', '00', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (265, '城区', 3, '14', '05', '02', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (266, '沁水县', 3, '14', '05', '21', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (267, '阳城县', 3, '14', '05', '22', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (268, '陵川县', 3, '14', '05', '24', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (269, '泽州县', 3, '14', '05', '25', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (270, '高平市', 3, '14', '05', '81', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (271, '朔州市', 2, '14', '06', '00', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (272, '朔城区', 3, '14', '06', '02', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (273, '平鲁区', 3, '14', '06', '03', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (274, '山阴县', 3, '14', '06', '21', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (275, '应县', 3, '14', '06', '22', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (276, '右玉县', 3, '14', '06', '23', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (277, '怀仁县', 3, '14', '06', '24', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (278, '晋中市', 2, '14', '07', '00', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (279, '榆次区', 3, '14', '07', '02', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (280, '榆社县', 3, '14', '07', '21', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (281, '左权县', 3, '14', '07', '22', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (282, '和顺县', 3, '14', '07', '23', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (283, '昔阳县', 3, '14', '07', '24', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (284, '寿阳县', 3, '14', '07', '25', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (285, '太谷县', 3, '14', '07', '26', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (286, '祁县', 3, '14', '07', '27', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (287, '平遥县', 3, '14', '07', '28', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (288, '灵石县', 3, '14', '07', '29', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (289, '介休市', 3, '14', '07', '81', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (290, '运城市', 2, '14', '08', '00', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (291, '盐湖区', 3, '14', '08', '02', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (292, '临猗县', 3, '14', '08', '21', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (293, '万荣县', 3, '14', '08', '22', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (294, '闻喜县', 3, '14', '08', '23', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (295, '稷山县', 3, '14', '08', '24', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (296, '新绛县', 3, '14', '08', '25', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (297, '绛县', 3, '14', '08', '26', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (298, '垣曲县', 3, '14', '08', '27', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (299, '夏县', 3, '14', '08', '28', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (300, '平陆县', 3, '14', '08', '29', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (301, '芮城县', 3, '14', '08', '30', 'R', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (302, '永济市', 3, '14', '08', '81', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (303, '河津市', 3, '14', '08', '82', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (304, '忻州市', 2, '14', '09', '00', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (305, '忻府区', 3, '14', '09', '02', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (306, '定襄县', 3, '14', '09', '21', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (307, '五台县', 3, '14', '09', '22', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (308, '代县', 3, '14', '09', '23', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (309, '繁峙县', 3, '14', '09', '24', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (310, '宁武县', 3, '14', '09', '25', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (311, '静乐县', 3, '14', '09', '26', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (312, '神池县', 3, '14', '09', '27', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (313, '五寨县', 3, '14', '09', '28', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (314, '岢岚县', 3, '14', '09', '29', 'K', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (315, '河曲县', 3, '14', '09', '30', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (316, '保德县', 3, '14', '09', '31', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (317, '偏关县', 3, '14', '09', '32', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (318, '原平市', 3, '14', '09', '81', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (319, '临汾市', 2, '14', '10', '00', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (320, '尧都区', 3, '14', '10', '02', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (321, '曲沃县', 3, '14', '10', '21', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (322, '翼城县', 3, '14', '10', '22', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (323, '襄汾县', 3, '14', '10', '23', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (324, '洪洞县', 3, '14', '10', '24', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (325, '古县', 3, '14', '10', '25', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (326, '安泽县', 3, '14', '10', '26', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (327, '浮山县', 3, '14', '10', '27', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (328, '吉县', 3, '14', '10', '28', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (329, '乡宁县', 3, '14', '10', '29', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (330, '大宁县', 3, '14', '10', '30', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (331, '隰县', 3, '14', '10', '31', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (332, '永和县', 3, '14', '10', '32', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (333, '蒲县', 3, '14', '10', '33', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (334, '汾西县', 3, '14', '10', '34', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (335, '侯马市', 3, '14', '10', '81', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (336, '霍州市', 3, '14', '10', '82', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (337, '吕梁市', 2, '14', '11', '00', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (338, '离石区', 3, '14', '11', '02', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (339, '文水县', 3, '14', '11', '21', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (340, '交城县', 3, '14', '11', '22', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (341, '兴县', 3, '14', '11', '23', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (342, '临县', 3, '14', '11', '24', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (343, '柳林县', 3, '14', '11', '25', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (344, '石楼县', 3, '14', '11', '26', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (345, '岚县', 3, '14', '11', '27', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (346, '方山县', 3, '14', '11', '28', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (347, '中阳县', 3, '14', '11', '29', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (348, '交口县', 3, '14', '11', '30', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (349, '孝义市', 3, '14', '11', '81', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (350, '汾阳市', 3, '14', '11', '82', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (351, '内蒙古自治区', 1, '15', '00', '00', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (352, '呼和浩特市', 2, '15', '01', '00', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (353, '新城区', 3, '15', '01', '02', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (354, '回民区', 3, '15', '01', '03', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (355, '玉泉区', 3, '15', '01', '04', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (356, '赛罕区', 3, '15', '01', '05', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (357, '土默特左旗', 3, '15', '01', '21', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (358, '托克托县', 3, '15', '01', '22', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (359, '和林格尔县', 3, '15', '01', '23', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (360, '清水河县', 3, '15', '01', '24', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (361, '武川县', 3, '15', '01', '25', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (362, '包头市', 2, '15', '02', '00', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (363, '东河区', 3, '15', '02', '02', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (364, '昆都仑区', 3, '15', '02', '03', 'K', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (365, '青山区', 3, '15', '02', '04', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (366, '石拐区', 3, '15', '02', '05', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (367, '白云鄂博矿区', 3, '15', '02', '06', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (368, '九原区', 3, '15', '02', '07', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (369, '土默特右旗', 3, '15', '02', '21', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (370, '固阳县', 3, '15', '02', '22', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (371, '达尔罕茂明安联合旗', 3, '15', '02', '23', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (372, '乌海市', 2, '15', '03', '00', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (373, '海勃湾区', 3, '15', '03', '02', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (374, '海南区', 3, '15', '03', '03', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (375, '乌达区', 3, '15', '03', '04', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (376, '赤峰市', 2, '15', '04', '00', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (377, '红山区', 3, '15', '04', '02', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (378, '元宝山区', 3, '15', '04', '03', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (379, '松山区', 3, '15', '04', '04', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (380, '阿鲁科尔沁旗', 3, '15', '04', '21', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (381, '巴林左旗', 3, '15', '04', '22', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (382, '巴林右旗', 3, '15', '04', '23', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (383, '林西县', 3, '15', '04', '24', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (384, '克什克腾旗', 3, '15', '04', '25', 'K', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (385, '翁牛特旗', 3, '15', '04', '26', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (386, '喀喇沁旗', 3, '15', '04', '28', 'K', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (387, '宁城县', 3, '15', '04', '29', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (388, '敖汉旗', 3, '15', '04', '30', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (389, '通辽市', 2, '15', '05', '00', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (390, '科尔沁区', 3, '15', '05', '02', 'K', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (391, '科尔沁左翼中旗', 3, '15', '05', '21', 'K', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (392, '科尔沁左翼后旗', 3, '15', '05', '22', 'K', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (393, '开鲁县', 3, '15', '05', '23', 'K', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (394, '库伦旗', 3, '15', '05', '24', 'K', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (395, '奈曼旗', 3, '15', '05', '25', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (396, '扎鲁特旗', 3, '15', '05', '26', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (397, '霍林郭勒市', 3, '15', '05', '81', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (398, '鄂尔多斯市', 2, '15', '06', '00', 'E', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (399, '东胜区', 3, '15', '06', '02', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (400, '达拉特旗', 3, '15', '06', '21', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (401, '准格尔旗', 3, '15', '06', '22', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (402, '鄂托克前旗', 3, '15', '06', '23', 'E', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (403, '鄂托克旗', 3, '15', '06', '24', 'E', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (404, '杭锦旗', 3, '15', '06', '25', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (405, '乌审旗', 3, '15', '06', '26', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (406, '伊金霍洛旗', 3, '15', '06', '27', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (407, '呼伦贝尔市', 2, '15', '07', '00', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (408, '海拉尔区', 3, '15', '07', '02', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (409, '扎赉诺尔区', 3, '15', '07', '03', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (410, '阿荣旗', 3, '15', '07', '21', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (411, '莫力达瓦达斡尔族自治旗', 3, '15', '07', '22', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (412, '鄂伦春自治旗', 3, '15', '07', '23', 'E', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (413, '鄂温克族自治旗', 3, '15', '07', '24', 'E', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (414, '陈巴尔虎旗', 3, '15', '07', '25', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (415, '新巴尔虎左旗', 3, '15', '07', '26', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (416, '新巴尔虎右旗', 3, '15', '07', '27', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (417, '满洲里市', 3, '15', '07', '81', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (418, '牙克石市', 3, '15', '07', '82', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (419, '扎兰屯市', 3, '15', '07', '83', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (420, '额尔古纳市', 3, '15', '07', '84', 'E', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (421, '根河市', 3, '15', '07', '85', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (422, '巴彦淖尔市', 2, '15', '08', '00', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (423, '临河区', 3, '15', '08', '02', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (424, '五原县', 3, '15', '08', '21', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (425, '磴口县', 3, '15', '08', '22', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (426, '乌拉特前旗', 3, '15', '08', '23', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (427, '乌拉特中旗', 3, '15', '08', '24', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (428, '乌拉特后旗', 3, '15', '08', '25', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (429, '杭锦后旗', 3, '15', '08', '26', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (430, '乌兰察布市', 2, '15', '09', '00', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (431, '集宁区', 3, '15', '09', '02', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (432, '卓资县', 3, '15', '09', '21', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (433, '化德县', 3, '15', '09', '22', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (434, '商都县', 3, '15', '09', '23', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (435, '兴和县', 3, '15', '09', '24', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (436, '凉城县', 3, '15', '09', '25', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (437, '察哈尔右翼前旗', 3, '15', '09', '26', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (438, '察哈尔右翼中旗', 3, '15', '09', '27', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (439, '察哈尔右翼后旗', 3, '15', '09', '28', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (440, '四子王旗', 3, '15', '09', '29', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (441, '丰镇市', 3, '15', '09', '81', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (442, '兴安盟', 2, '15', '22', '00', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (443, '乌兰浩特市', 3, '15', '22', '01', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (444, '阿尔山市', 3, '15', '22', '02', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (445, '科尔沁右翼前旗', 3, '15', '22', '21', 'K', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (446, '科尔沁右翼中旗', 3, '15', '22', '22', 'K', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (447, '扎赉特旗', 3, '15', '22', '23', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (448, '突泉县', 3, '15', '22', '24', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (449, '锡林郭勒盟', 2, '15', '25', '00', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (450, '二连浩特市', 3, '15', '25', '01', 'E', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (451, '锡林浩特市', 3, '15', '25', '02', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (452, '阿巴嘎旗', 3, '15', '25', '22', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (453, '苏尼特左旗', 3, '15', '25', '23', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (454, '苏尼特右旗', 3, '15', '25', '24', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (455, '东乌珠穆沁旗', 3, '15', '25', '25', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (456, '西乌珠穆沁旗', 3, '15', '25', '26', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (457, '太仆寺旗', 3, '15', '25', '27', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (458, '镶黄旗', 3, '15', '25', '28', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (459, '正镶白旗', 3, '15', '25', '29', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (460, '正蓝旗', 3, '15', '25', '30', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (461, '多伦县', 3, '15', '25', '31', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (462, '阿拉善盟', 2, '15', '29', '00', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (463, '阿拉善左旗', 3, '15', '29', '21', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (464, '阿拉善右旗', 3, '15', '29', '22', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (465, '额济纳旗', 3, '15', '29', '23', 'E', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (466, '辽宁省', 1, '21', '00', '00', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (467, '沈阳市', 2, '21', '01', '00', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (468, '和平区', 3, '21', '01', '02', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (469, '沈河区', 3, '21', '01', '03', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (470, '大东区', 3, '21', '01', '04', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (471, '皇姑区', 3, '21', '01', '05', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (472, '铁西区', 3, '21', '01', '06', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (473, '苏家屯区', 3, '21', '01', '11', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (474, '浑南区', 3, '21', '01', '12', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (475, '沈北新区', 3, '21', '01', '13', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (476, '于洪区', 3, '21', '01', '14', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (477, '辽中县', 3, '21', '01', '22', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (478, '康平县', 3, '21', '01', '23', 'K', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (479, '法库县', 3, '21', '01', '24', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (480, '新民市', 3, '21', '01', '81', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (481, '大连市', 2, '21', '02', '00', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (482, '中山区', 3, '21', '02', '02', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (483, '西岗区', 3, '21', '02', '03', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (484, '沙河口区', 3, '21', '02', '04', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (485, '甘井子区', 3, '21', '02', '11', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (486, '旅顺口区', 3, '21', '02', '12', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (487, '金州区', 3, '21', '02', '13', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (488, '长海县', 3, '21', '02', '24', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (489, '瓦房店市', 3, '21', '02', '81', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (490, '普兰店市', 3, '21', '02', '82', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (491, '庄河市', 3, '21', '02', '83', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (492, '鞍山市', 2, '21', '03', '00', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (493, '铁东区', 3, '21', '03', '02', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (494, '铁西区', 3, '21', '03', '03', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (495, '立山区', 3, '21', '03', '04', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (496, '千山区', 3, '21', '03', '11', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (497, '台安县', 3, '21', '03', '21', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (498, '岫岩满族自治县', 3, '21', '03', '23', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (499, '海城市', 3, '21', '03', '81', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (500, '抚顺市', 2, '21', '04', '00', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (501, '新抚区', 3, '21', '04', '02', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (502, '东洲区', 3, '21', '04', '03', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (503, '望花区', 3, '21', '04', '04', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (504, '顺城区', 3, '21', '04', '11', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (505, '抚顺县', 3, '21', '04', '21', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (506, '新宾满族自治县', 3, '21', '04', '22', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (507, '清原满族自治县', 3, '21', '04', '23', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (508, '本溪市', 2, '21', '05', '00', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (509, '平山区', 3, '21', '05', '02', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (510, '溪湖区', 3, '21', '05', '03', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (511, '明山区', 3, '21', '05', '04', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (512, '南芬区', 3, '21', '05', '05', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (513, '本溪满族自治县', 3, '21', '05', '21', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (514, '桓仁满族自治县', 3, '21', '05', '22', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (515, '丹东市', 2, '21', '06', '00', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (516, '元宝区', 3, '21', '06', '02', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (517, '振兴区', 3, '21', '06', '03', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (518, '振安区', 3, '21', '06', '04', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (519, '宽甸满族自治县', 3, '21', '06', '24', 'K', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (520, '东港市', 3, '21', '06', '81', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (521, '凤城市', 3, '21', '06', '82', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (522, '锦州市', 2, '21', '07', '00', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (523, '古塔区', 3, '21', '07', '02', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (524, '凌河区', 3, '21', '07', '03', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (525, '太和区', 3, '21', '07', '11', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (526, '黑山县', 3, '21', '07', '26', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (527, '义县', 3, '21', '07', '27', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (528, '凌海市', 3, '21', '07', '81', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (529, '北镇市', 3, '21', '07', '82', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (530, '营口市', 2, '21', '08', '00', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (531, '站前区', 3, '21', '08', '02', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (532, '西市区', 3, '21', '08', '03', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (533, '鲅鱼圈区', 3, '21', '08', '04', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (534, '老边区', 3, '21', '08', '11', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (535, '盖州市', 3, '21', '08', '81', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (536, '大石桥市', 3, '21', '08', '82', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (537, '阜新市', 2, '21', '09', '00', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (538, '海州区', 3, '21', '09', '02', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (539, '新邱区', 3, '21', '09', '03', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (540, '太平区', 3, '21', '09', '04', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (541, '清河门区', 3, '21', '09', '05', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (542, '细河区', 3, '21', '09', '11', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (543, '阜新蒙古族自治县', 3, '21', '09', '21', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (544, '彰武县', 3, '21', '09', '22', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (545, '辽阳市', 2, '21', '10', '00', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (546, '白塔区', 3, '21', '10', '02', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (547, '文圣区', 3, '21', '10', '03', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (548, '宏伟区', 3, '21', '10', '04', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (549, '弓长岭区', 3, '21', '10', '05', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (550, '太子河区', 3, '21', '10', '11', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (551, '辽阳县', 3, '21', '10', '21', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (552, '灯塔市', 3, '21', '10', '81', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (553, '盘锦市', 2, '21', '11', '00', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (554, '双台子区', 3, '21', '11', '02', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (555, '兴隆台区', 3, '21', '11', '03', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (556, '大洼县', 3, '21', '11', '21', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (557, '盘山县', 3, '21', '11', '22', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (558, '铁岭市', 2, '21', '12', '00', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (559, '银州区', 3, '21', '12', '02', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (560, '清河区', 3, '21', '12', '04', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (561, '铁岭县', 3, '21', '12', '21', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (562, '西丰县', 3, '21', '12', '23', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (563, '昌图县', 3, '21', '12', '24', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (564, '调兵山市', 3, '21', '12', '81', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (565, '开原市', 3, '21', '12', '82', 'K', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (566, '朝阳市', 2, '21', '13', '00', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (567, '双塔区', 3, '21', '13', '02', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (568, '龙城区', 3, '21', '13', '03', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (569, '朝阳县', 3, '21', '13', '21', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (570, '建平县', 3, '21', '13', '22', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (571, '喀喇沁左翼蒙古族自治县', 3, '21', '13', '24', 'K', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (572, '北票市', 3, '21', '13', '81', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (573, '凌源市', 3, '21', '13', '82', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (574, '葫芦岛市', 2, '21', '14', '00', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (575, '连山区', 3, '21', '14', '02', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (576, '龙港区', 3, '21', '14', '03', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (577, '南票区', 3, '21', '14', '04', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (578, '绥中县', 3, '21', '14', '21', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (579, '建昌县', 3, '21', '14', '22', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (580, '兴城市', 3, '21', '14', '81', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (581, '吉林省', 1, '22', '00', '00', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (582, '长春市', 2, '22', '01', '00', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (583, '南关区', 3, '22', '01', '02', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (584, '宽城区', 3, '22', '01', '03', 'K', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (585, '朝阳区', 3, '22', '01', '04', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (586, '二道区', 3, '22', '01', '05', 'E', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (587, '绿园区', 3, '22', '01', '06', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (588, '双阳区', 3, '22', '01', '12', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (589, '九台区', 3, '22', '01', '13', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (590, '农安县', 3, '22', '01', '22', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (591, '榆树市', 3, '22', '01', '82', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (592, '德惠市', 3, '22', '01', '83', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (593, '吉林市', 2, '22', '02', '00', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (594, '昌邑区', 3, '22', '02', '02', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (595, '龙潭区', 3, '22', '02', '03', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (596, '船营区', 3, '22', '02', '04', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (597, '丰满区', 3, '22', '02', '11', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (598, '永吉县', 3, '22', '02', '21', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (599, '蛟河市', 3, '22', '02', '81', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (600, '桦甸市', 3, '22', '02', '82', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (601, '舒兰市', 3, '22', '02', '83', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (602, '磐石市', 3, '22', '02', '84', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (603, '四平市', 2, '22', '03', '00', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (604, '铁西区', 3, '22', '03', '02', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (605, '铁东区', 3, '22', '03', '03', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (606, '梨树县', 3, '22', '03', '22', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (607, '伊通满族自治县', 3, '22', '03', '23', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (608, '公主岭市', 3, '22', '03', '81', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (609, '双辽市', 3, '22', '03', '82', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (610, '辽源市', 2, '22', '04', '00', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (611, '龙山区', 3, '22', '04', '02', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (612, '西安区', 3, '22', '04', '03', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (613, '东丰县', 3, '22', '04', '21', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (614, '东辽县', 3, '22', '04', '22', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (615, '通化市', 2, '22', '05', '00', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (616, '东昌区', 3, '22', '05', '02', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (617, '二道江区', 3, '22', '05', '03', 'E', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (618, '通化县', 3, '22', '05', '21', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (619, '辉南县', 3, '22', '05', '23', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (620, '柳河县', 3, '22', '05', '24', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (621, '梅河口市', 3, '22', '05', '81', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (622, '集安市', 3, '22', '05', '82', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (623, '白山市', 2, '22', '06', '00', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (624, '浑江区', 3, '22', '06', '02', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (625, '江源区', 3, '22', '06', '05', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (626, '抚松县', 3, '22', '06', '21', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (627, '靖宇县', 3, '22', '06', '22', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (628, '长白朝鲜族自治县', 3, '22', '06', '23', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (629, '临江市', 3, '22', '06', '81', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (630, '松原市', 2, '22', '07', '00', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (631, '宁江区', 3, '22', '07', '02', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (632, '前郭尔罗斯蒙古族自治县', 3, '22', '07', '21', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (633, '长岭县', 3, '22', '07', '22', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (634, '乾安县', 3, '22', '07', '23', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (635, '扶余市', 3, '22', '07', '81', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (636, '白城市', 2, '22', '08', '00', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (637, '洮北区', 3, '22', '08', '02', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (638, '镇赉县', 3, '22', '08', '21', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (639, '通榆县', 3, '22', '08', '22', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (640, '洮南市', 3, '22', '08', '81', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (641, '大安市', 3, '22', '08', '82', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (642, '延边朝鲜族自治州', 2, '22', '24', '00', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (643, '延吉市', 3, '22', '24', '01', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (644, '图们市', 3, '22', '24', '02', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (645, '敦化市', 3, '22', '24', '03', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (646, '珲春市', 3, '22', '24', '04', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (647, '龙井市', 3, '22', '24', '05', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (648, '和龙市', 3, '22', '24', '06', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (649, '汪清县', 3, '22', '24', '24', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (650, '安图县', 3, '22', '24', '26', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (651, '黑龙江省', 1, '23', '00', '00', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (652, '哈尔滨市', 2, '23', '01', '00', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (653, '道里区', 3, '23', '01', '02', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (654, '南岗区', 3, '23', '01', '03', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (655, '道外区', 3, '23', '01', '04', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (656, '平房区', 3, '23', '01', '08', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (657, '松北区', 3, '23', '01', '09', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (658, '香坊区', 3, '23', '01', '10', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (659, '呼兰区', 3, '23', '01', '11', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (660, '阿城区', 3, '23', '01', '12', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (661, '依兰县', 3, '23', '01', '23', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (662, '方正县', 3, '23', '01', '24', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (663, '宾县', 3, '23', '01', '25', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (664, '巴彦县', 3, '23', '01', '26', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (665, '木兰县', 3, '23', '01', '27', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (666, '通河县', 3, '23', '01', '28', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (667, '延寿县', 3, '23', '01', '29', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (668, '双城市', 3, '23', '01', '82', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (669, '尚志市', 3, '23', '01', '83', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (670, '五常市', 3, '23', '01', '84', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (671, '齐齐哈尔市', 2, '23', '02', '00', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (672, '龙沙区', 3, '23', '02', '02', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (673, '建华区', 3, '23', '02', '03', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (674, '铁锋区', 3, '23', '02', '04', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (675, '昂昂溪区', 3, '23', '02', '05', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (676, '富拉尔基区', 3, '23', '02', '06', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (677, '碾子山区', 3, '23', '02', '07', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (678, '梅里斯达斡尔族区', 3, '23', '02', '08', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (679, '龙江县', 3, '23', '02', '21', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (680, '依安县', 3, '23', '02', '23', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (681, '泰来县', 3, '23', '02', '24', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (682, '甘南县', 3, '23', '02', '25', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (683, '富裕县', 3, '23', '02', '27', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (684, '克山县', 3, '23', '02', '29', 'K', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (685, '克东县', 3, '23', '02', '30', 'K', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (686, '拜泉县', 3, '23', '02', '31', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (687, '讷河市', 3, '23', '02', '81', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (688, '鸡西市', 2, '23', '03', '00', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (689, '鸡冠区', 3, '23', '03', '02', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (690, '恒山区', 3, '23', '03', '03', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (691, '滴道区', 3, '23', '03', '04', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (692, '梨树区', 3, '23', '03', '05', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (693, '城子河区', 3, '23', '03', '06', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (694, '麻山区', 3, '23', '03', '07', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (695, '鸡东县', 3, '23', '03', '21', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (696, '虎林市', 3, '23', '03', '81', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (697, '密山市', 3, '23', '03', '82', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (698, '鹤岗市', 2, '23', '04', '00', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (699, '向阳区', 3, '23', '04', '02', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (700, '工农区', 3, '23', '04', '03', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (701, '南山区', 3, '23', '04', '04', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (702, '兴安区', 3, '23', '04', '05', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (703, '东山区', 3, '23', '04', '06', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (704, '兴山区', 3, '23', '04', '07', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (705, '萝北县', 3, '23', '04', '21', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (706, '绥滨县', 3, '23', '04', '22', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (707, '双鸭山市', 2, '23', '05', '00', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (708, '尖山区', 3, '23', '05', '02', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (709, '岭东区', 3, '23', '05', '03', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (710, '四方台区', 3, '23', '05', '05', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (711, '宝山区', 3, '23', '05', '06', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (712, '集贤县', 3, '23', '05', '21', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (713, '友谊县', 3, '23', '05', '22', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (714, '宝清县', 3, '23', '05', '23', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (715, '饶河县', 3, '23', '05', '24', 'R', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (716, '大庆市', 2, '23', '06', '00', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (717, '萨尔图区', 3, '23', '06', '02', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (718, '龙凤区', 3, '23', '06', '03', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (719, '让胡路区', 3, '23', '06', '04', 'R', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (720, '红岗区', 3, '23', '06', '05', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (721, '大同区', 3, '23', '06', '06', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (722, '肇州县', 3, '23', '06', '21', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (723, '肇源县', 3, '23', '06', '22', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (724, '林甸县', 3, '23', '06', '23', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (725, '杜尔伯特蒙古族自治县', 3, '23', '06', '24', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (726, '伊春市', 2, '23', '07', '00', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (727, '伊春区', 3, '23', '07', '02', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (728, '南岔区', 3, '23', '07', '03', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (729, '友好区', 3, '23', '07', '04', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (730, '西林区', 3, '23', '07', '05', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (731, '翠峦区', 3, '23', '07', '06', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (732, '新青区', 3, '23', '07', '07', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (733, '美溪区', 3, '23', '07', '08', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (734, '金山屯区', 3, '23', '07', '09', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (735, '五营区', 3, '23', '07', '10', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (736, '乌马河区', 3, '23', '07', '11', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (737, '汤旺河区', 3, '23', '07', '12', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (738, '带岭区', 3, '23', '07', '13', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (739, '乌伊岭区', 3, '23', '07', '14', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (740, '红星区', 3, '23', '07', '15', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (741, '上甘岭区', 3, '23', '07', '16', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (742, '嘉荫县', 3, '23', '07', '22', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (743, '铁力市', 3, '23', '07', '81', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (744, '佳木斯市', 2, '23', '08', '00', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (745, '向阳区', 3, '23', '08', '03', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (746, '前进区', 3, '23', '08', '04', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (747, '东风区', 3, '23', '08', '05', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (748, '郊区', 3, '23', '08', '11', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (749, '桦南县', 3, '23', '08', '22', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (750, '桦川县', 3, '23', '08', '26', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (751, '汤原县', 3, '23', '08', '28', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (752, '抚远县', 3, '23', '08', '33', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (753, '同江市', 3, '23', '08', '81', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (754, '富锦市', 3, '23', '08', '82', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (755, '七台河市', 2, '23', '09', '00', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (756, '新兴区', 3, '23', '09', '02', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (757, '桃山区', 3, '23', '09', '03', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (758, '茄子河区', 3, '23', '09', '04', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (759, '勃利县', 3, '23', '09', '21', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (760, '牡丹江市', 2, '23', '10', '00', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (761, '东安区', 3, '23', '10', '02', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (762, '阳明区', 3, '23', '10', '03', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (763, '爱民区', 3, '23', '10', '04', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (764, '西安区', 3, '23', '10', '05', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (765, '东宁县', 3, '23', '10', '24', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (766, '林口县', 3, '23', '10', '25', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (767, '绥芬河市', 3, '23', '10', '81', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (768, '海林市', 3, '23', '10', '83', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (769, '宁安市', 3, '23', '10', '84', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (770, '穆棱市', 3, '23', '10', '85', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (771, '黑河市', 2, '23', '11', '00', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (772, '爱辉区', 3, '23', '11', '02', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (773, '嫩江县', 3, '23', '11', '21', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (774, '逊克县', 3, '23', '11', '23', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (775, '孙吴县', 3, '23', '11', '24', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (776, '北安市', 3, '23', '11', '81', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (777, '五大连池市', 3, '23', '11', '82', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (778, '绥化市', 2, '23', '12', '00', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (779, '北林区', 3, '23', '12', '02', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (780, '望奎县', 3, '23', '12', '21', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (781, '兰西县', 3, '23', '12', '22', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (782, '青冈县', 3, '23', '12', '23', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (783, '庆安县', 3, '23', '12', '24', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (784, '明水县', 3, '23', '12', '25', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (785, '绥棱县', 3, '23', '12', '26', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (786, '安达市', 3, '23', '12', '81', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (787, '肇东市', 3, '23', '12', '82', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (788, '海伦市', 3, '23', '12', '83', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (789, '大兴安岭地区', 2, '23', '27', '00', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (790, '呼玛县', 3, '23', '27', '21', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (791, '塔河县', 3, '23', '27', '22', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (792, '漠河县', 3, '23', '27', '23', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (793, '上海市', 1, '31', '00', '00', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (794, '上海市', 2, '31', '01', '00', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (795, '黄浦区', 3, '31', '01', '01', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (796, '徐汇区', 3, '31', '01', '04', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (797, '长宁区', 3, '31', '01', '05', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (798, '静安区', 3, '31', '01', '06', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (799, '普陀区', 3, '31', '01', '07', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (800, '闸北区', 3, '31', '01', '08', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (801, '虹口区', 3, '31', '01', '09', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (802, '杨浦区', 3, '31', '01', '10', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (803, '闵行区', 3, '31', '01', '12', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (804, '宝山区', 3, '31', '01', '13', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (805, '嘉定区', 3, '31', '01', '14', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (806, '浦东新区', 3, '31', '01', '15', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (807, '金山区', 3, '31', '01', '16', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (808, '松江区', 3, '31', '01', '17', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (809, '青浦区', 3, '31', '01', '18', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (810, '奉贤区', 3, '31', '01', '20', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (811, '县', 2, '31', '02', '00', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (812, '崇明县', 3, '31', '02', '30', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (813, '江苏省', 1, '32', '00', '00', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (814, '南京市', 2, '32', '01', '00', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (815, '玄武区', 3, '32', '01', '02', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (816, '秦淮区', 3, '32', '01', '04', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (817, '建邺区', 3, '32', '01', '05', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (818, '鼓楼区', 3, '32', '01', '06', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (819, '浦口区', 3, '32', '01', '11', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (820, '栖霞区', 3, '32', '01', '13', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (821, '雨花台区', 3, '32', '01', '14', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (822, '江宁区', 3, '32', '01', '15', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (823, '六合区', 3, '32', '01', '16', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (824, '溧水区', 3, '32', '01', '17', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (825, '高淳区', 3, '32', '01', '18', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (826, '无锡市', 2, '32', '02', '00', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (827, '崇安区', 3, '32', '02', '02', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (828, '南长区', 3, '32', '02', '03', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (829, '北塘区', 3, '32', '02', '04', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (830, '锡山区', 3, '32', '02', '05', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (831, '惠山区', 3, '32', '02', '06', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (832, '滨湖区', 3, '32', '02', '11', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (833, '江阴市', 3, '32', '02', '81', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (834, '宜兴市', 3, '32', '02', '82', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (835, '徐州市', 2, '32', '03', '00', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (836, '鼓楼区', 3, '32', '03', '02', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (837, '云龙区', 3, '32', '03', '03', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (838, '贾汪区', 3, '32', '03', '05', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (839, '泉山区', 3, '32', '03', '11', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (840, '铜山区', 3, '32', '03', '12', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (841, '丰县', 3, '32', '03', '21', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (842, '沛县', 3, '32', '03', '22', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (843, '睢宁县', 3, '32', '03', '24', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (844, '新沂市', 3, '32', '03', '81', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (845, '邳州市', 3, '32', '03', '82', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (846, '常州市', 2, '32', '04', '00', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (847, '天宁区', 3, '32', '04', '02', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (848, '钟楼区', 3, '32', '04', '04', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (849, '戚墅堰区', 3, '32', '04', '05', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (850, '新北区', 3, '32', '04', '11', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (851, '武进区', 3, '32', '04', '12', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (852, '溧阳市', 3, '32', '04', '81', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (853, '金坛市', 3, '32', '04', '82', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (854, '苏州市', 2, '32', '05', '00', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (855, '虎丘区', 3, '32', '05', '05', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (856, '吴中区', 3, '32', '05', '06', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (857, '相城区', 3, '32', '05', '07', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (858, '姑苏区', 3, '32', '05', '08', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (859, '吴江区', 3, '32', '05', '09', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (860, '常熟市', 3, '32', '05', '81', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (861, '张家港市', 3, '32', '05', '82', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (862, '昆山市', 3, '32', '05', '83', 'K', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (863, '太仓市', 3, '32', '05', '85', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (864, '南通市', 2, '32', '06', '00', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (865, '崇川区', 3, '32', '06', '02', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (866, '港闸区', 3, '32', '06', '11', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (867, '通州区', 3, '32', '06', '12', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (868, '海安县', 3, '32', '06', '21', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (869, '如东县', 3, '32', '06', '23', 'R', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (870, '启东市', 3, '32', '06', '81', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (871, '如皋市', 3, '32', '06', '82', 'R', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (872, '海门市', 3, '32', '06', '84', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (873, '连云港市', 2, '32', '07', '00', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (874, '连云区', 3, '32', '07', '03', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (875, '海州区', 3, '32', '07', '06', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (876, '赣榆区', 3, '32', '07', '07', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (877, '东海县', 3, '32', '07', '22', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (878, '灌云县', 3, '32', '07', '23', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (879, '灌南县', 3, '32', '07', '24', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (880, '淮安市', 2, '32', '08', '00', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (881, '清河区', 3, '32', '08', '02', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (882, '淮安区', 3, '32', '08', '03', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (883, '淮阴区', 3, '32', '08', '04', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (884, '清浦区', 3, '32', '08', '11', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (885, '涟水县', 3, '32', '08', '26', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (886, '洪泽县', 3, '32', '08', '29', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (887, '盱眙县', 3, '32', '08', '30', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (888, '金湖县', 3, '32', '08', '31', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (889, '盐城市', 2, '32', '09', '00', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (890, '亭湖区', 3, '32', '09', '02', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (891, '盐都区', 3, '32', '09', '03', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (892, '响水县', 3, '32', '09', '21', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (893, '滨海县', 3, '32', '09', '22', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (894, '阜宁县', 3, '32', '09', '23', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (895, '射阳县', 3, '32', '09', '24', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (896, '建湖县', 3, '32', '09', '25', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (897, '东台市', 3, '32', '09', '81', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (898, '大丰市', 3, '32', '09', '82', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (899, '扬州市', 2, '32', '10', '00', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (900, '广陵区', 3, '32', '10', '02', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (901, '邗江区', 3, '32', '10', '03', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (902, '江都区', 3, '32', '10', '12', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (903, '宝应县', 3, '32', '10', '23', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (904, '仪征市', 3, '32', '10', '81', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (905, '高邮市', 3, '32', '10', '84', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (906, '镇江市', 2, '32', '11', '00', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (907, '京口区', 3, '32', '11', '02', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (908, '润州区', 3, '32', '11', '11', 'R', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (909, '丹徒区', 3, '32', '11', '12', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (910, '丹阳市', 3, '32', '11', '81', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (911, '扬中市', 3, '32', '11', '82', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (912, '句容市', 3, '32', '11', '83', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (913, '泰州市', 2, '32', '12', '00', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (914, '海陵区', 3, '32', '12', '02', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (915, '高港区', 3, '32', '12', '03', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (916, '姜堰区', 3, '32', '12', '04', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (917, '兴化市', 3, '32', '12', '81', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (918, '靖江市', 3, '32', '12', '82', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (919, '泰兴市', 3, '32', '12', '83', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (920, '宿迁市', 2, '32', '13', '00', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (921, '宿城区', 3, '32', '13', '02', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (922, '宿豫区', 3, '32', '13', '11', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (923, '沭阳县', 3, '32', '13', '22', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (924, '泗阳县', 3, '32', '13', '23', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (925, '泗洪县', 3, '32', '13', '24', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (926, '浙江省', 1, '33', '00', '00', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (927, '杭州市', 2, '33', '01', '00', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (928, '上城区', 3, '33', '01', '02', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (929, '下城区', 3, '33', '01', '03', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (930, '江干区', 3, '33', '01', '04', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (931, '拱墅区', 3, '33', '01', '05', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (932, '西湖区', 3, '33', '01', '06', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (933, '滨江区', 3, '33', '01', '08', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (934, '萧山区', 3, '33', '01', '09', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (935, '余杭区', 3, '33', '01', '10', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (936, '桐庐县', 3, '33', '01', '22', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (937, '淳安县', 3, '33', '01', '27', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (938, '建德市', 3, '33', '01', '82', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (939, '富阳市', 3, '33', '01', '83', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (940, '临安市', 3, '33', '01', '85', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (941, '宁波市', 2, '33', '02', '00', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (942, '海曙区', 3, '33', '02', '03', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (943, '江东区', 3, '33', '02', '04', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (944, '江北区', 3, '33', '02', '05', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (945, '北仑区', 3, '33', '02', '06', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (946, '镇海区', 3, '33', '02', '11', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (947, '鄞州区', 3, '33', '02', '12', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (948, '象山县', 3, '33', '02', '25', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (949, '宁海县', 3, '33', '02', '26', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (950, '余姚市', 3, '33', '02', '81', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (951, '慈溪市', 3, '33', '02', '82', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (952, '奉化市', 3, '33', '02', '83', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (953, '温州市', 2, '33', '03', '00', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (954, '鹿城区', 3, '33', '03', '02', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (955, '龙湾区', 3, '33', '03', '03', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (956, '瓯海区', 3, '33', '03', '04', 'O', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (957, '洞头县', 3, '33', '03', '22', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (958, '永嘉县', 3, '33', '03', '24', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (959, '平阳县', 3, '33', '03', '26', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (960, '苍南县', 3, '33', '03', '27', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (961, '文成县', 3, '33', '03', '28', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (962, '泰顺县', 3, '33', '03', '29', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (963, '瑞安市', 3, '33', '03', '81', 'R', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (964, '乐清市', 3, '33', '03', '82', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (965, '嘉兴市', 2, '33', '04', '00', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (966, '南湖区', 3, '33', '04', '02', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (967, '秀洲区', 3, '33', '04', '11', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (968, '嘉善县', 3, '33', '04', '21', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (969, '海盐县', 3, '33', '04', '24', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (970, '海宁市', 3, '33', '04', '81', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (971, '平湖市', 3, '33', '04', '82', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (972, '桐乡市', 3, '33', '04', '83', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (973, '湖州市', 2, '33', '05', '00', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (974, '吴兴区', 3, '33', '05', '02', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (975, '南浔区', 3, '33', '05', '03', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (976, '德清县', 3, '33', '05', '21', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (977, '长兴县', 3, '33', '05', '22', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (978, '安吉县', 3, '33', '05', '23', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (979, '绍兴市', 2, '33', '06', '00', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (980, '越城区', 3, '33', '06', '02', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (981, '柯桥区', 3, '33', '06', '03', 'K', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (982, '上虞区', 3, '33', '06', '04', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (983, '新昌县', 3, '33', '06', '24', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (984, '诸暨市', 3, '33', '06', '81', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (985, '嵊州市', 3, '33', '06', '83', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (986, '金华市', 2, '33', '07', '00', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (987, '婺城区', 3, '33', '07', '02', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (988, '金东区', 3, '33', '07', '03', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (989, '武义县', 3, '33', '07', '23', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (990, '浦江县', 3, '33', '07', '26', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (991, '磐安县', 3, '33', '07', '27', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (992, '兰溪市', 3, '33', '07', '81', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (993, '义乌市', 3, '33', '07', '82', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (994, '东阳市', 3, '33', '07', '83', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (995, '永康市', 3, '33', '07', '84', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (996, '衢州市', 2, '33', '08', '00', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (997, '柯城区', 3, '33', '08', '02', 'K', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (998, '衢江区', 3, '33', '08', '03', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (999, '常山县', 3, '33', '08', '22', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1000, '开化县', 3, '33', '08', '24', 'K', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1001, '龙游县', 3, '33', '08', '25', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1002, '江山市', 3, '33', '08', '81', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1003, '舟山市', 2, '33', '09', '00', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1004, '定海区', 3, '33', '09', '02', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1005, '普陀区', 3, '33', '09', '03', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1006, '岱山县', 3, '33', '09', '21', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1007, '嵊泗县', 3, '33', '09', '22', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1008, '台州市', 2, '33', '10', '00', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1009, '椒江区', 3, '33', '10', '02', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1010, '黄岩区', 3, '33', '10', '03', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1011, '路桥区', 3, '33', '10', '04', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1012, '玉环县', 3, '33', '10', '21', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1013, '三门县', 3, '33', '10', '22', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1014, '天台县', 3, '33', '10', '23', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1015, '仙居县', 3, '33', '10', '24', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1016, '温岭市', 3, '33', '10', '81', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1017, '临海市', 3, '33', '10', '82', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1018, '丽水市', 2, '33', '11', '00', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1019, '莲都区', 3, '33', '11', '02', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1020, '青田县', 3, '33', '11', '21', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1021, '缙云县', 3, '33', '11', '22', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1022, '遂昌县', 3, '33', '11', '23', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1023, '松阳县', 3, '33', '11', '24', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1024, '云和县', 3, '33', '11', '25', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1025, '庆元县', 3, '33', '11', '26', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1026, '景宁畲族自治县', 3, '33', '11', '27', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1027, '龙泉市', 3, '33', '11', '81', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1028, '安徽省', 1, '34', '00', '00', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1029, '合肥市', 2, '34', '01', '00', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1030, '瑶海区', 3, '34', '01', '02', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1031, '庐阳区', 3, '34', '01', '03', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1032, '蜀山区', 3, '34', '01', '04', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1033, '包河区', 3, '34', '01', '11', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1034, '长丰县', 3, '34', '01', '21', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1035, '肥东县', 3, '34', '01', '22', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1036, '肥西县', 3, '34', '01', '23', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1037, '庐江县', 3, '34', '01', '24', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1038, '巢湖市', 3, '34', '01', '81', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1039, '芜湖市', 2, '34', '02', '00', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1040, '镜湖区', 3, '34', '02', '02', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1041, '弋江区', 3, '34', '02', '03', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1042, '鸠江区', 3, '34', '02', '07', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1043, '三山区', 3, '34', '02', '08', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1044, '芜湖县', 3, '34', '02', '21', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1045, '繁昌县', 3, '34', '02', '22', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1046, '南陵县', 3, '34', '02', '23', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1047, '无为县', 3, '34', '02', '25', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1048, '蚌埠市', 2, '34', '03', '00', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1049, '龙子湖区', 3, '34', '03', '02', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1050, '蚌山区', 3, '34', '03', '03', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1051, '禹会区', 3, '34', '03', '04', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1052, '淮上区', 3, '34', '03', '11', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1053, '怀远县', 3, '34', '03', '21', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1054, '五河县', 3, '34', '03', '22', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1055, '固镇县', 3, '34', '03', '23', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1056, '淮南市', 2, '34', '04', '00', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1057, '大通区', 3, '34', '04', '02', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1058, '田家庵区', 3, '34', '04', '03', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1059, '谢家集区', 3, '34', '04', '04', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1060, '八公山区', 3, '34', '04', '05', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1061, '潘集区', 3, '34', '04', '06', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1062, '凤台县', 3, '34', '04', '21', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1063, '马鞍山市', 2, '34', '05', '00', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1064, '花山区', 3, '34', '05', '03', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1065, '雨山区', 3, '34', '05', '04', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1066, '博望区', 3, '34', '05', '06', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1067, '当涂县', 3, '34', '05', '21', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1068, '含山县', 3, '34', '05', '22', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1069, '和县', 3, '34', '05', '23', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1070, '淮北市', 2, '34', '06', '00', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1071, '杜集区', 3, '34', '06', '02', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1072, '相山区', 3, '34', '06', '03', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1073, '烈山区', 3, '34', '06', '04', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1074, '濉溪县', 3, '34', '06', '21', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1075, '铜陵市', 2, '34', '07', '00', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1076, '铜官山区', 3, '34', '07', '02', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1077, '狮子山区', 3, '34', '07', '03', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1078, '郊区', 3, '34', '07', '11', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1079, '铜陵县', 3, '34', '07', '21', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1080, '安庆市', 2, '34', '08', '00', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1081, '迎江区', 3, '34', '08', '02', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1082, '大观区', 3, '34', '08', '03', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1083, '宜秀区', 3, '34', '08', '11', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1084, '怀宁县', 3, '34', '08', '22', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1085, '枞阳县', 3, '34', '08', '23', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1086, '潜山县', 3, '34', '08', '24', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1087, '太湖县', 3, '34', '08', '25', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1088, '宿松县', 3, '34', '08', '26', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1089, '望江县', 3, '34', '08', '27', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1090, '岳西县', 3, '34', '08', '28', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1091, '桐城市', 3, '34', '08', '81', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1092, '黄山市', 2, '34', '10', '00', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1093, '屯溪区', 3, '34', '10', '02', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1094, '黄山区', 3, '34', '10', '03', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1095, '徽州区', 3, '34', '10', '04', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1096, '歙县', 3, '34', '10', '21', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1097, '休宁县', 3, '34', '10', '22', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1098, '黟县', 3, '34', '10', '23', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1099, '祁门县', 3, '34', '10', '24', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1100, '滁州市', 2, '34', '11', '00', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1101, '琅琊区', 3, '34', '11', '02', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1102, '南谯区', 3, '34', '11', '03', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1103, '来安县', 3, '34', '11', '22', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1104, '全椒县', 3, '34', '11', '24', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1105, '定远县', 3, '34', '11', '25', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1106, '凤阳县', 3, '34', '11', '26', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1107, '天长市', 3, '34', '11', '81', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1108, '明光市', 3, '34', '11', '82', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1109, '阜阳市', 2, '34', '12', '00', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1110, '颍州区', 3, '34', '12', '02', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1111, '颍东区', 3, '34', '12', '03', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1112, '颍泉区', 3, '34', '12', '04', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1113, '临泉县', 3, '34', '12', '21', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1114, '太和县', 3, '34', '12', '22', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1115, '阜南县', 3, '34', '12', '25', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1116, '颍上县', 3, '34', '12', '26', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1117, '界首市', 3, '34', '12', '82', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1118, '宿州市', 2, '34', '13', '00', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1119, '埇桥区', 3, '34', '13', '02', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1120, '砀山县', 3, '34', '13', '21', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1121, '萧县', 3, '34', '13', '22', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1122, '灵璧县', 3, '34', '13', '23', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1123, '泗县', 3, '34', '13', '24', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1124, '六安市', 2, '34', '15', '00', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1125, '金安区', 3, '34', '15', '02', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1126, '裕安区', 3, '34', '15', '03', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1127, '寿县', 3, '34', '15', '21', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1128, '霍邱县', 3, '34', '15', '22', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1129, '舒城县', 3, '34', '15', '23', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1130, '金寨县', 3, '34', '15', '24', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1131, '霍山县', 3, '34', '15', '25', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1132, '亳州市', 2, '34', '16', '00', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1133, '谯城区', 3, '34', '16', '02', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1134, '涡阳县', 3, '34', '16', '21', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1135, '蒙城县', 3, '34', '16', '22', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1136, '利辛县', 3, '34', '16', '23', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1137, '池州市', 2, '34', '17', '00', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1138, '贵池区', 3, '34', '17', '02', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1139, '东至县', 3, '34', '17', '21', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1140, '石台县', 3, '34', '17', '22', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1141, '青阳县', 3, '34', '17', '23', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1142, '宣城市', 2, '34', '18', '00', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1143, '宣州区', 3, '34', '18', '02', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1144, '郎溪县', 3, '34', '18', '21', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1145, '广德县', 3, '34', '18', '22', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1146, '泾县', 3, '34', '18', '23', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1147, '绩溪县', 3, '34', '18', '24', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1148, '旌德县', 3, '34', '18', '25', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1149, '宁国市', 3, '34', '18', '81', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1150, '福建省', 1, '35', '00', '00', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1151, '福州市', 2, '35', '01', '00', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1152, '鼓楼区', 3, '35', '01', '02', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1153, '台江区', 3, '35', '01', '03', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1154, '仓山区', 3, '35', '01', '04', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1155, '马尾区', 3, '35', '01', '05', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1156, '晋安区', 3, '35', '01', '11', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1157, '闽侯县', 3, '35', '01', '21', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1158, '连江县', 3, '35', '01', '22', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1159, '罗源县', 3, '35', '01', '23', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1160, '闽清县', 3, '35', '01', '24', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1161, '永泰县', 3, '35', '01', '25', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1162, '平潭县', 3, '35', '01', '28', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1163, '福清市', 3, '35', '01', '81', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1164, '长乐市', 3, '35', '01', '82', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1165, '厦门市', 2, '35', '02', '00', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1166, '思明区', 3, '35', '02', '03', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1167, '海沧区', 3, '35', '02', '05', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1168, '湖里区', 3, '35', '02', '06', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1169, '集美区', 3, '35', '02', '11', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1170, '同安区', 3, '35', '02', '12', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1171, '翔安区', 3, '35', '02', '13', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1172, '莆田市', 2, '35', '03', '00', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1173, '城厢区', 3, '35', '03', '02', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1174, '涵江区', 3, '35', '03', '03', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1175, '荔城区', 3, '35', '03', '04', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1176, '秀屿区', 3, '35', '03', '05', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1177, '仙游县', 3, '35', '03', '22', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1178, '三明市', 2, '35', '04', '00', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1179, '梅列区', 3, '35', '04', '02', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1180, '三元区', 3, '35', '04', '03', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1181, '明溪县', 3, '35', '04', '21', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1182, '清流县', 3, '35', '04', '23', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1183, '宁化县', 3, '35', '04', '24', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1184, '大田县', 3, '35', '04', '25', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1185, '尤溪县', 3, '35', '04', '26', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1186, '沙县', 3, '35', '04', '27', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1187, '将乐县', 3, '35', '04', '28', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1188, '泰宁县', 3, '35', '04', '29', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1189, '建宁县', 3, '35', '04', '30', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1190, '永安市', 3, '35', '04', '81', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1191, '泉州市', 2, '35', '05', '00', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1192, '鲤城区', 3, '35', '05', '02', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1193, '丰泽区', 3, '35', '05', '03', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1194, '洛江区', 3, '35', '05', '04', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1195, '泉港区', 3, '35', '05', '05', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1196, '惠安县', 3, '35', '05', '21', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1197, '安溪县', 3, '35', '05', '24', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1198, '永春县', 3, '35', '05', '25', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1199, '德化县', 3, '35', '05', '26', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1200, '金门县', 3, '35', '05', '27', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1201, '石狮市', 3, '35', '05', '81', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1202, '晋江市', 3, '35', '05', '82', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1203, '南安市', 3, '35', '05', '83', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1204, '漳州市', 2, '35', '06', '00', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1205, '芗城区', 3, '35', '06', '02', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1206, '龙文区', 3, '35', '06', '03', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1207, '云霄县', 3, '35', '06', '22', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1208, '漳浦县', 3, '35', '06', '23', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1209, '诏安县', 3, '35', '06', '24', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1210, '长泰县', 3, '35', '06', '25', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1211, '东山县', 3, '35', '06', '26', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1212, '南靖县', 3, '35', '06', '27', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1213, '平和县', 3, '35', '06', '28', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1214, '华安县', 3, '35', '06', '29', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1215, '龙海市', 3, '35', '06', '81', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1216, '南平市', 2, '35', '07', '00', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1217, '延平区', 3, '35', '07', '02', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1218, '顺昌县', 3, '35', '07', '21', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1219, '浦城县', 3, '35', '07', '22', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1220, '光泽县', 3, '35', '07', '23', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1221, '松溪县', 3, '35', '07', '24', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1222, '政和县', 3, '35', '07', '25', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1223, '邵武市', 3, '35', '07', '81', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1224, '武夷山市', 3, '35', '07', '82', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1225, '建瓯市', 3, '35', '07', '83', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1226, '建阳市', 3, '35', '07', '84', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1227, '龙岩市', 2, '35', '08', '00', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1228, '新罗区', 3, '35', '08', '02', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1229, '长汀县', 3, '35', '08', '21', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1230, '永定县', 3, '35', '08', '22', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1231, '上杭县', 3, '35', '08', '23', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1232, '武平县', 3, '35', '08', '24', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1233, '连城县', 3, '35', '08', '25', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1234, '漳平市', 3, '35', '08', '81', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1235, '宁德市', 2, '35', '09', '00', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1236, '蕉城区', 3, '35', '09', '02', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1237, '霞浦县', 3, '35', '09', '21', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1238, '古田县', 3, '35', '09', '22', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1239, '屏南县', 3, '35', '09', '23', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1240, '寿宁县', 3, '35', '09', '24', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1241, '周宁县', 3, '35', '09', '25', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1242, '柘荣县', 3, '35', '09', '26', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1243, '福安市', 3, '35', '09', '81', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1244, '福鼎市', 3, '35', '09', '82', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1245, '江西省', 1, '36', '00', '00', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1246, '南昌市', 2, '36', '01', '00', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1247, '东湖区', 3, '36', '01', '02', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1248, '西湖区', 3, '36', '01', '03', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1249, '青云谱区', 3, '36', '01', '04', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1250, '湾里区', 3, '36', '01', '05', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1251, '青山湖区', 3, '36', '01', '11', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1252, '南昌县', 3, '36', '01', '21', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1253, '新建县', 3, '36', '01', '22', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1254, '安义县', 3, '36', '01', '23', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1255, '进贤县', 3, '36', '01', '24', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1256, '景德镇市', 2, '36', '02', '00', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1257, '昌江区', 3, '36', '02', '02', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1258, '珠山区', 3, '36', '02', '03', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1259, '浮梁县', 3, '36', '02', '22', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1260, '乐平市', 3, '36', '02', '81', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1261, '萍乡市', 2, '36', '03', '00', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1262, '安源区', 3, '36', '03', '02', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1263, '湘东区', 3, '36', '03', '13', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1264, '莲花县', 3, '36', '03', '21', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1265, '上栗县', 3, '36', '03', '22', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1266, '芦溪县', 3, '36', '03', '23', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1267, '九江市', 2, '36', '04', '00', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1268, '庐山区', 3, '36', '04', '02', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1269, '浔阳区', 3, '36', '04', '03', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1270, '九江县', 3, '36', '04', '21', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1271, '武宁县', 3, '36', '04', '23', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1272, '修水县', 3, '36', '04', '24', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1273, '永修县', 3, '36', '04', '25', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1274, '德安县', 3, '36', '04', '26', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1275, '星子县', 3, '36', '04', '27', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1276, '都昌县', 3, '36', '04', '28', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1277, '湖口县', 3, '36', '04', '29', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1278, '彭泽县', 3, '36', '04', '30', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1279, '瑞昌市', 3, '36', '04', '81', 'R', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1280, '共青城市', 3, '36', '04', '82', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1281, '新余市', 2, '36', '05', '00', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1282, '渝水区', 3, '36', '05', '02', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1283, '分宜县', 3, '36', '05', '21', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1284, '鹰潭市', 2, '36', '06', '00', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1285, '月湖区', 3, '36', '06', '02', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1286, '余江县', 3, '36', '06', '22', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1287, '贵溪市', 3, '36', '06', '81', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1288, '赣州市', 2, '36', '07', '00', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1289, '章贡区', 3, '36', '07', '02', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1290, '南康区', 3, '36', '07', '03', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1291, '赣县', 3, '36', '07', '21', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1292, '信丰县', 3, '36', '07', '22', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1293, '大余县', 3, '36', '07', '23', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1294, '上犹县', 3, '36', '07', '24', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1295, '崇义县', 3, '36', '07', '25', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1296, '安远县', 3, '36', '07', '26', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1297, '龙南县', 3, '36', '07', '27', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1298, '定南县', 3, '36', '07', '28', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1299, '全南县', 3, '36', '07', '29', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1300, '宁都县', 3, '36', '07', '30', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1301, '于都县', 3, '36', '07', '31', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1302, '兴国县', 3, '36', '07', '32', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1303, '会昌县', 3, '36', '07', '33', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1304, '寻乌县', 3, '36', '07', '34', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1305, '石城县', 3, '36', '07', '35', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1306, '瑞金市', 3, '36', '07', '81', 'R', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1307, '吉安市', 2, '36', '08', '00', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1308, '吉州区', 3, '36', '08', '02', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1309, '青原区', 3, '36', '08', '03', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1310, '吉安县', 3, '36', '08', '21', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1311, '吉水县', 3, '36', '08', '22', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1312, '峡江县', 3, '36', '08', '23', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1313, '新干县', 3, '36', '08', '24', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1314, '永丰县', 3, '36', '08', '25', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1315, '泰和县', 3, '36', '08', '26', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1316, '遂川县', 3, '36', '08', '27', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1317, '万安县', 3, '36', '08', '28', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1318, '安福县', 3, '36', '08', '29', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1319, '永新县', 3, '36', '08', '30', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1320, '井冈山市', 3, '36', '08', '81', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1321, '宜春市', 2, '36', '09', '00', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1322, '袁州区', 3, '36', '09', '02', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1323, '奉新县', 3, '36', '09', '21', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1324, '万载县', 3, '36', '09', '22', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1325, '上高县', 3, '36', '09', '23', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1326, '宜丰县', 3, '36', '09', '24', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1327, '靖安县', 3, '36', '09', '25', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1328, '铜鼓县', 3, '36', '09', '26', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1329, '丰城市', 3, '36', '09', '81', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1330, '樟树市', 3, '36', '09', '82', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1331, '高安市', 3, '36', '09', '83', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1332, '抚州市', 2, '36', '10', '00', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1333, '临川区', 3, '36', '10', '02', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1334, '南城县', 3, '36', '10', '21', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1335, '黎川县', 3, '36', '10', '22', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1336, '南丰县', 3, '36', '10', '23', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1337, '崇仁县', 3, '36', '10', '24', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1338, '乐安县', 3, '36', '10', '25', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1339, '宜黄县', 3, '36', '10', '26', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1340, '金溪县', 3, '36', '10', '27', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1341, '资溪县', 3, '36', '10', '28', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1342, '东乡县', 3, '36', '10', '29', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1343, '广昌县', 3, '36', '10', '30', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1344, '上饶市', 2, '36', '11', '00', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1345, '信州区', 3, '36', '11', '02', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1346, '上饶县', 3, '36', '11', '21', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1347, '广丰县', 3, '36', '11', '22', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1348, '玉山县', 3, '36', '11', '23', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1349, '铅山县', 3, '36', '11', '24', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1350, '横峰县', 3, '36', '11', '25', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1351, '弋阳县', 3, '36', '11', '26', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1352, '余干县', 3, '36', '11', '27', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1353, '鄱阳县', 3, '36', '11', '28', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1354, '万年县', 3, '36', '11', '29', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1355, '婺源县', 3, '36', '11', '30', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1356, '德兴市', 3, '36', '11', '81', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1357, '山东省', 1, '37', '00', '00', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1358, '济南市', 2, '37', '01', '00', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1359, '历下区', 3, '37', '01', '02', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1360, '市中区', 3, '37', '01', '03', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1361, '槐荫区', 3, '37', '01', '04', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1362, '天桥区', 3, '37', '01', '05', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1363, '历城区', 3, '37', '01', '12', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1364, '长清区', 3, '37', '01', '13', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1365, '平阴县', 3, '37', '01', '24', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1366, '济阳县', 3, '37', '01', '25', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1367, '商河县', 3, '37', '01', '26', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1368, '章丘市', 3, '37', '01', '81', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1369, '青岛市', 2, '37', '02', '00', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1370, '市南区', 3, '37', '02', '02', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1371, '市北区', 3, '37', '02', '03', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1372, '黄岛区', 3, '37', '02', '11', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1373, '崂山区', 3, '37', '02', '12', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1374, '李沧区', 3, '37', '02', '13', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1375, '城阳区', 3, '37', '02', '14', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1376, '胶州市', 3, '37', '02', '81', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1377, '即墨市', 3, '37', '02', '82', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1378, '平度市', 3, '37', '02', '83', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1379, '莱西市', 3, '37', '02', '85', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1380, '淄博市', 2, '37', '03', '00', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1381, '淄川区', 3, '37', '03', '02', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1382, '张店区', 3, '37', '03', '03', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1383, '博山区', 3, '37', '03', '04', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1384, '临淄区', 3, '37', '03', '05', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1385, '周村区', 3, '37', '03', '06', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1386, '桓台县', 3, '37', '03', '21', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1387, '高青县', 3, '37', '03', '22', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1388, '沂源县', 3, '37', '03', '23', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1389, '枣庄市', 2, '37', '04', '00', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1390, '市中区', 3, '37', '04', '02', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1391, '薛城区', 3, '37', '04', '03', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1392, '峄城区', 3, '37', '04', '04', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1393, '台儿庄区', 3, '37', '04', '05', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1394, '山亭区', 3, '37', '04', '06', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1395, '滕州市', 3, '37', '04', '81', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1396, '东营市', 2, '37', '05', '00', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1397, '东营区', 3, '37', '05', '02', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1398, '河口区', 3, '37', '05', '03', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1399, '垦利县', 3, '37', '05', '21', 'K', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1400, '利津县', 3, '37', '05', '22', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1401, '广饶县', 3, '37', '05', '23', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1402, '烟台市', 2, '37', '06', '00', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1403, '芝罘区', 3, '37', '06', '02', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1404, '福山区', 3, '37', '06', '11', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1405, '牟平区', 3, '37', '06', '12', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1406, '莱山区', 3, '37', '06', '13', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1407, '长岛县', 3, '37', '06', '34', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1408, '龙口市', 3, '37', '06', '81', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1409, '莱阳市', 3, '37', '06', '82', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1410, '莱州市', 3, '37', '06', '83', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1411, '蓬莱市', 3, '37', '06', '84', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1412, '招远市', 3, '37', '06', '85', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1413, '栖霞市', 3, '37', '06', '86', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1414, '海阳市', 3, '37', '06', '87', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1415, '潍坊市', 2, '37', '07', '00', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1416, '潍城区', 3, '37', '07', '02', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1417, '寒亭区', 3, '37', '07', '03', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1418, '坊子区', 3, '37', '07', '04', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1419, '奎文区', 3, '37', '07', '05', 'K', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1420, '临朐县', 3, '37', '07', '24', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1421, '昌乐县', 3, '37', '07', '25', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1422, '青州市', 3, '37', '07', '81', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1423, '诸城市', 3, '37', '07', '82', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1424, '寿光市', 3, '37', '07', '83', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1425, '安丘市', 3, '37', '07', '84', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1426, '高密市', 3, '37', '07', '85', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1427, '昌邑市', 3, '37', '07', '86', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1428, '济宁市', 2, '37', '08', '00', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1429, '任城区', 3, '37', '08', '11', 'R', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1430, '兖州区', 3, '37', '08', '12', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1431, '微山县', 3, '37', '08', '26', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1432, '鱼台县', 3, '37', '08', '27', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1433, '金乡县', 3, '37', '08', '28', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1434, '嘉祥县', 3, '37', '08', '29', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1435, '汶上县', 3, '37', '08', '30', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1436, '泗水县', 3, '37', '08', '31', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1437, '梁山县', 3, '37', '08', '32', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1438, '曲阜市', 3, '37', '08', '81', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1439, '邹城市', 3, '37', '08', '83', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1440, '泰安市', 2, '37', '09', '00', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1441, '泰山区', 3, '37', '09', '02', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1442, '岱岳区', 3, '37', '09', '11', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1443, '宁阳县', 3, '37', '09', '21', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1444, '东平县', 3, '37', '09', '23', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1445, '新泰市', 3, '37', '09', '82', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1446, '肥城市', 3, '37', '09', '83', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1447, '威海市', 2, '37', '10', '00', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1448, '环翠区', 3, '37', '10', '02', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1449, '文登区', 3, '37', '10', '03', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1450, '荣成市', 3, '37', '10', '82', 'R', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1451, '乳山市', 3, '37', '10', '83', 'R', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1452, '日照市', 2, '37', '11', '00', 'R', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1453, '东港区', 3, '37', '11', '02', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1454, '岚山区', 3, '37', '11', '03', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1455, '五莲县', 3, '37', '11', '21', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1456, '莒县', 3, '37', '11', '22', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1457, '莱芜市', 2, '37', '12', '00', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1458, '莱城区', 3, '37', '12', '02', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1459, '钢城区', 3, '37', '12', '03', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1460, '临沂市', 2, '37', '13', '00', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1461, '兰山区', 3, '37', '13', '02', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1462, '罗庄区', 3, '37', '13', '11', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1463, '河东区', 3, '37', '13', '12', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1464, '沂南县', 3, '37', '13', '21', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1465, '郯城县', 3, '37', '13', '22', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1466, '沂水县', 3, '37', '13', '23', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1467, '兰陵县', 3, '37', '13', '24', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1468, '费县', 3, '37', '13', '25', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1469, '平邑县', 3, '37', '13', '26', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1470, '莒南县', 3, '37', '13', '27', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1471, '蒙阴县', 3, '37', '13', '28', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1472, '临沭县', 3, '37', '13', '29', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1473, '德州市', 2, '37', '14', '00', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1474, '德城区', 3, '37', '14', '02', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1475, '陵城区', 3, '37', '14', '03', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1476, '宁津县', 3, '37', '14', '22', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1477, '庆云县', 3, '37', '14', '23', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1478, '临邑县', 3, '37', '14', '24', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1479, '齐河县', 3, '37', '14', '25', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1480, '平原县', 3, '37', '14', '26', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1481, '夏津县', 3, '37', '14', '27', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1482, '武城县', 3, '37', '14', '28', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1483, '乐陵市', 3, '37', '14', '81', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1484, '禹城市', 3, '37', '14', '82', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1485, '聊城市', 2, '37', '15', '00', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1486, '东昌府区', 3, '37', '15', '02', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1487, '阳谷县', 3, '37', '15', '21', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1488, '莘县', 3, '37', '15', '22', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1489, '茌平县', 3, '37', '15', '23', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1490, '东阿县', 3, '37', '15', '24', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1491, '冠县', 3, '37', '15', '25', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1492, '高唐县', 3, '37', '15', '26', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1493, '临清市', 3, '37', '15', '81', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1494, '滨州市', 2, '37', '16', '00', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1495, '滨城区', 3, '37', '16', '02', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1496, '沾化区', 3, '37', '16', '03', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1497, '惠民县', 3, '37', '16', '21', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1498, '阳信县', 3, '37', '16', '22', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1499, '无棣县', 3, '37', '16', '23', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1500, '博兴县', 3, '37', '16', '25', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1501, '邹平县', 3, '37', '16', '26', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1502, '菏泽市', 2, '37', '17', '00', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1503, '牡丹区', 3, '37', '17', '02', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1504, '曹县', 3, '37', '17', '21', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1505, '单县', 3, '37', '17', '22', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1506, '成武县', 3, '37', '17', '23', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1507, '巨野县', 3, '37', '17', '24', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1508, '郓城县', 3, '37', '17', '25', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1509, '鄄城县', 3, '37', '17', '26', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1510, '定陶县', 3, '37', '17', '27', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1511, '东明县', 3, '37', '17', '28', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1512, '河南省', 1, '41', '00', '00', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1513, '郑州市', 2, '41', '01', '00', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1514, '中原区', 3, '41', '01', '02', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1515, '二七区', 3, '41', '01', '03', 'E', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1516, '管城回族区', 3, '41', '01', '04', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1517, '金水区', 3, '41', '01', '05', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1518, '上街区', 3, '41', '01', '06', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1519, '惠济区', 3, '41', '01', '08', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1520, '中牟县', 3, '41', '01', '22', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1521, '巩义市', 3, '41', '01', '81', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1522, '荥阳市', 3, '41', '01', '82', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1523, '新密市', 3, '41', '01', '83', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1524, '新郑市', 3, '41', '01', '84', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1525, '登封市', 3, '41', '01', '85', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1526, '开封市', 2, '41', '02', '00', 'K', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1527, '龙亭区', 3, '41', '02', '02', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1528, '顺河回族区', 3, '41', '02', '03', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1529, '鼓楼区', 3, '41', '02', '04', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1530, '禹王台区', 3, '41', '02', '05', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1531, '金明区', 3, '41', '02', '11', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1532, '杞县', 3, '41', '02', '21', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1533, '通许县', 3, '41', '02', '22', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1534, '尉氏县', 3, '41', '02', '23', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1535, '开封县', 3, '41', '02', '24', 'K', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1536, '兰考县', 3, '41', '02', '25', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1537, '洛阳市', 2, '41', '03', '00', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1538, '老城区', 3, '41', '03', '02', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1539, '西工区', 3, '41', '03', '03', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1540, '瀍河回族区', 3, '41', '03', '04', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1541, '涧西区', 3, '41', '03', '05', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1542, '吉利区', 3, '41', '03', '06', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1543, '洛龙区', 3, '41', '03', '11', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1544, '孟津县', 3, '41', '03', '22', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1545, '新安县', 3, '41', '03', '23', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1546, '栾川县', 3, '41', '03', '24', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1547, '嵩县', 3, '41', '03', '25', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1548, '汝阳县', 3, '41', '03', '26', 'R', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1549, '宜阳县', 3, '41', '03', '27', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1550, '洛宁县', 3, '41', '03', '28', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1551, '伊川县', 3, '41', '03', '29', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1552, '偃师市', 3, '41', '03', '81', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1553, '平顶山市', 2, '41', '04', '00', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1554, '新华区', 3, '41', '04', '02', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1555, '卫东区', 3, '41', '04', '03', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1556, '石龙区', 3, '41', '04', '04', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1557, '湛河区', 3, '41', '04', '11', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1558, '宝丰县', 3, '41', '04', '21', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1559, '叶县', 3, '41', '04', '22', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1560, '鲁山县', 3, '41', '04', '23', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1561, '郏县', 3, '41', '04', '25', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1562, '舞钢市', 3, '41', '04', '81', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1563, '汝州市', 3, '41', '04', '82', 'R', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1564, '安阳市', 2, '41', '05', '00', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1565, '文峰区', 3, '41', '05', '02', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1566, '北关区', 3, '41', '05', '03', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1567, '殷都区', 3, '41', '05', '05', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1568, '龙安区', 3, '41', '05', '06', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1569, '安阳县', 3, '41', '05', '22', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1570, '汤阴县', 3, '41', '05', '23', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1571, '滑县', 3, '41', '05', '26', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1572, '内黄县', 3, '41', '05', '27', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1573, '林州市', 3, '41', '05', '81', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1574, '鹤壁市', 2, '41', '06', '00', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1575, '鹤山区', 3, '41', '06', '02', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1576, '山城区', 3, '41', '06', '03', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1577, '淇滨区', 3, '41', '06', '11', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1578, '浚县', 3, '41', '06', '21', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1579, '淇县', 3, '41', '06', '22', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1580, '新乡市', 2, '41', '07', '00', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1581, '红旗区', 3, '41', '07', '02', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1582, '卫滨区', 3, '41', '07', '03', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1583, '凤泉区', 3, '41', '07', '04', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1584, '牧野区', 3, '41', '07', '11', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1585, '新乡县', 3, '41', '07', '21', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1586, '获嘉县', 3, '41', '07', '24', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1587, '原阳县', 3, '41', '07', '25', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1588, '延津县', 3, '41', '07', '26', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1589, '封丘县', 3, '41', '07', '27', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1590, '长垣县', 3, '41', '07', '28', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1591, '卫辉市', 3, '41', '07', '81', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1592, '辉县市', 3, '41', '07', '82', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1593, '焦作市', 2, '41', '08', '00', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1594, '解放区', 3, '41', '08', '02', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1595, '中站区', 3, '41', '08', '03', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1596, '马村区', 3, '41', '08', '04', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1597, '山阳区', 3, '41', '08', '11', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1598, '修武县', 3, '41', '08', '21', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1599, '博爱县', 3, '41', '08', '22', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1600, '武陟县', 3, '41', '08', '23', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1601, '温县', 3, '41', '08', '25', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1602, '沁阳市', 3, '41', '08', '82', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1603, '孟州市', 3, '41', '08', '83', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1604, '濮阳市', 2, '41', '09', '00', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1605, '华龙区', 3, '41', '09', '02', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1606, '清丰县', 3, '41', '09', '22', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1607, '南乐县', 3, '41', '09', '23', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1608, '范县', 3, '41', '09', '26', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1609, '台前县', 3, '41', '09', '27', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1610, '濮阳县', 3, '41', '09', '28', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1611, '许昌市', 2, '41', '10', '00', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1612, '魏都区', 3, '41', '10', '02', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1613, '许昌县', 3, '41', '10', '23', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1614, '鄢陵县', 3, '41', '10', '24', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1615, '襄城县', 3, '41', '10', '25', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1616, '禹州市', 3, '41', '10', '81', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1617, '长葛市', 3, '41', '10', '82', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1618, '漯河市', 2, '41', '11', '00', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1619, '源汇区', 3, '41', '11', '02', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1620, '郾城区', 3, '41', '11', '03', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1621, '召陵区', 3, '41', '11', '04', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1622, '舞阳县', 3, '41', '11', '21', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1623, '临颍县', 3, '41', '11', '22', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1624, '三门峡市', 2, '41', '12', '00', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1625, '湖滨区', 3, '41', '12', '02', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1626, '渑池县', 3, '41', '12', '21', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1627, '陕县', 3, '41', '12', '22', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1628, '卢氏县', 3, '41', '12', '24', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1629, '义马市', 3, '41', '12', '81', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1630, '灵宝市', 3, '41', '12', '82', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1631, '南阳市', 2, '41', '13', '00', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1632, '宛城区', 3, '41', '13', '02', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1633, '卧龙区', 3, '41', '13', '03', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1634, '南召县', 3, '41', '13', '21', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1635, '方城县', 3, '41', '13', '22', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1636, '西峡县', 3, '41', '13', '23', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1637, '镇平县', 3, '41', '13', '24', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1638, '内乡县', 3, '41', '13', '25', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1639, '淅川县', 3, '41', '13', '26', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1640, '社旗县', 3, '41', '13', '27', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1641, '唐河县', 3, '41', '13', '28', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1642, '新野县', 3, '41', '13', '29', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1643, '桐柏县', 3, '41', '13', '30', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1644, '邓州市', 3, '41', '13', '81', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1645, '商丘市', 2, '41', '14', '00', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1646, '梁园区', 3, '41', '14', '02', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1647, '睢阳区', 3, '41', '14', '03', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1648, '民权县', 3, '41', '14', '21', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1649, '睢县', 3, '41', '14', '22', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1650, '宁陵县', 3, '41', '14', '23', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1651, '柘城县', 3, '41', '14', '24', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1652, '虞城县', 3, '41', '14', '25', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1653, '夏邑县', 3, '41', '14', '26', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1654, '永城市', 3, '41', '14', '81', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1655, '信阳市', 2, '41', '15', '00', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1656, '浉河区', 3, '41', '15', '02', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1657, '平桥区', 3, '41', '15', '03', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1658, '罗山县', 3, '41', '15', '21', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1659, '光山县', 3, '41', '15', '22', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1660, '新县', 3, '41', '15', '23', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1661, '商城县', 3, '41', '15', '24', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1662, '固始县', 3, '41', '15', '25', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1663, '潢川县', 3, '41', '15', '26', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1664, '淮滨县', 3, '41', '15', '27', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1665, '息县', 3, '41', '15', '28', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1666, '周口市', 2, '41', '16', '00', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1667, '川汇区', 3, '41', '16', '02', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1668, '扶沟县', 3, '41', '16', '21', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1669, '西华县', 3, '41', '16', '22', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1670, '商水县', 3, '41', '16', '23', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1671, '沈丘县', 3, '41', '16', '24', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1672, '郸城县', 3, '41', '16', '25', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1673, '淮阳县', 3, '41', '16', '26', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1674, '太康县', 3, '41', '16', '27', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1675, '鹿邑县', 3, '41', '16', '28', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1676, '项城市', 3, '41', '16', '81', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1677, '驻马店市', 2, '41', '17', '00', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1678, '驿城区', 3, '41', '17', '02', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1679, '西平县', 3, '41', '17', '21', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1680, '上蔡县', 3, '41', '17', '22', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1681, '平舆县', 3, '41', '17', '23', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1682, '正阳县', 3, '41', '17', '24', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1683, '确山县', 3, '41', '17', '25', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1684, '泌阳县', 3, '41', '17', '26', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1685, '汝南县', 3, '41', '17', '27', 'R', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1686, '遂平县', 3, '41', '17', '28', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1687, '新蔡县', 3, '41', '17', '29', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1688, '省直辖县级行政区划', 2, '41', '90', '00', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1689, '济源市', 3, '41', '90', '01', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1690, '湖北省', 1, '42', '00', '00', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1691, '武汉市', 2, '42', '01', '00', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1692, '江岸区', 3, '42', '01', '02', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1693, '江汉区', 3, '42', '01', '03', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1694, '硚口区', 3, '42', '01', '04', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1695, '汉阳区', 3, '42', '01', '05', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1696, '武昌区', 3, '42', '01', '06', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1697, '青山区', 3, '42', '01', '07', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1698, '洪山区', 3, '42', '01', '11', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1699, '东西湖区', 3, '42', '01', '12', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1700, '汉南区', 3, '42', '01', '13', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1701, '蔡甸区', 3, '42', '01', '14', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1702, '江夏区', 3, '42', '01', '15', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1703, '黄陂区', 3, '42', '01', '16', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1704, '新洲区', 3, '42', '01', '17', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1705, '黄石市', 2, '42', '02', '00', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1706, '黄石港区', 3, '42', '02', '02', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1707, '西塞山区', 3, '42', '02', '03', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1708, '下陆区', 3, '42', '02', '04', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1709, '铁山区', 3, '42', '02', '05', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1710, '阳新县', 3, '42', '02', '22', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1711, '大冶市', 3, '42', '02', '81', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1712, '十堰市', 2, '42', '03', '00', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1713, '茅箭区', 3, '42', '03', '02', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1714, '张湾区', 3, '42', '03', '03', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1715, '郧阳区', 3, '42', '03', '04', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1716, '郧西县', 3, '42', '03', '22', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1717, '竹山县', 3, '42', '03', '23', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1718, '竹溪县', 3, '42', '03', '24', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1719, '房县', 3, '42', '03', '25', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1720, '丹江口市', 3, '42', '03', '81', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1721, '宜昌市', 2, '42', '05', '00', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1722, '西陵区', 3, '42', '05', '02', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1723, '伍家岗区', 3, '42', '05', '03', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1724, '点军区', 3, '42', '05', '04', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1725, '猇亭区', 3, '42', '05', '05', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1726, '夷陵区', 3, '42', '05', '06', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1727, '远安县', 3, '42', '05', '25', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1728, '兴山县', 3, '42', '05', '26', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1729, '秭归县', 3, '42', '05', '27', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1730, '长阳土家族自治县', 3, '42', '05', '28', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1731, '五峰土家族自治县', 3, '42', '05', '29', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1732, '宜都市', 3, '42', '05', '81', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1733, '当阳市', 3, '42', '05', '82', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1734, '枝江市', 3, '42', '05', '83', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1735, '襄阳市', 2, '42', '06', '00', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1736, '襄城区', 3, '42', '06', '02', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1737, '樊城区', 3, '42', '06', '06', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1738, '襄州区', 3, '42', '06', '07', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1739, '南漳县', 3, '42', '06', '24', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1740, '谷城县', 3, '42', '06', '25', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1741, '保康县', 3, '42', '06', '26', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1742, '老河口市', 3, '42', '06', '82', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1743, '枣阳市', 3, '42', '06', '83', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1744, '宜城市', 3, '42', '06', '84', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1745, '鄂州市', 2, '42', '07', '00', 'E', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1746, '梁子湖区', 3, '42', '07', '02', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1747, '华容区', 3, '42', '07', '03', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1748, '鄂城区', 3, '42', '07', '04', 'E', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1749, '荆门市', 2, '42', '08', '00', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1750, '东宝区', 3, '42', '08', '02', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1751, '掇刀区', 3, '42', '08', '04', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1752, '京山县', 3, '42', '08', '21', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1753, '沙洋县', 3, '42', '08', '22', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1754, '钟祥市', 3, '42', '08', '81', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1755, '孝感市', 2, '42', '09', '00', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1756, '孝南区', 3, '42', '09', '02', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1757, '孝昌县', 3, '42', '09', '21', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1758, '大悟县', 3, '42', '09', '22', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1759, '云梦县', 3, '42', '09', '23', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1760, '应城市', 3, '42', '09', '81', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1761, '安陆市', 3, '42', '09', '82', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1762, '汉川市', 3, '42', '09', '84', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1763, '荆州市', 2, '42', '10', '00', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1764, '沙市区', 3, '42', '10', '02', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1765, '荆州区', 3, '42', '10', '03', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1766, '公安县', 3, '42', '10', '22', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1767, '监利县', 3, '42', '10', '23', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1768, '江陵县', 3, '42', '10', '24', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1769, '石首市', 3, '42', '10', '81', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1770, '洪湖市', 3, '42', '10', '83', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1771, '松滋市', 3, '42', '10', '87', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1772, '黄冈市', 2, '42', '11', '00', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1773, '黄州区', 3, '42', '11', '02', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1774, '团风县', 3, '42', '11', '21', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1775, '红安县', 3, '42', '11', '22', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1776, '罗田县', 3, '42', '11', '23', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1777, '英山县', 3, '42', '11', '24', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1778, '浠水县', 3, '42', '11', '25', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1779, '蕲春县', 3, '42', '11', '26', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1780, '黄梅县', 3, '42', '11', '27', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1781, '麻城市', 3, '42', '11', '81', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1782, '武穴市', 3, '42', '11', '82', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1783, '咸宁市', 2, '42', '12', '00', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1784, '咸安区', 3, '42', '12', '02', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1785, '嘉鱼县', 3, '42', '12', '21', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1786, '通城县', 3, '42', '12', '22', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1787, '崇阳县', 3, '42', '12', '23', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1788, '通山县', 3, '42', '12', '24', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1789, '赤壁市', 3, '42', '12', '81', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1790, '随州市', 2, '42', '13', '00', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1791, '曾都区', 3, '42', '13', '03', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1792, '随县', 3, '42', '13', '21', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1793, '广水市', 3, '42', '13', '81', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1794, '恩施土家族苗族自治州', 2, '42', '28', '00', 'E', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1795, '恩施市', 3, '42', '28', '01', 'E', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1796, '利川市', 3, '42', '28', '02', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1797, '建始县', 3, '42', '28', '22', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1798, '巴东县', 3, '42', '28', '23', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1799, '宣恩县', 3, '42', '28', '25', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1800, '咸丰县', 3, '42', '28', '26', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1801, '来凤县', 3, '42', '28', '27', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1802, '鹤峰县', 3, '42', '28', '28', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1803, '省直辖县级行政区划', 2, '42', '90', '00', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1804, '仙桃市', 3, '42', '90', '04', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1805, '潜江市', 3, '42', '90', '05', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1806, '天门市', 3, '42', '90', '06', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1807, '神农架林区', 3, '42', '90', '21', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1808, '湖南省', 1, '43', '00', '00', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1809, '长沙市', 2, '43', '01', '00', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1810, '芙蓉区', 3, '43', '01', '02', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1811, '天心区', 3, '43', '01', '03', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1812, '岳麓区', 3, '43', '01', '04', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1813, '开福区', 3, '43', '01', '05', 'K', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1814, '雨花区', 3, '43', '01', '11', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1815, '望城区', 3, '43', '01', '12', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1816, '长沙县', 3, '43', '01', '21', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1817, '宁乡县', 3, '43', '01', '24', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1818, '浏阳市', 3, '43', '01', '81', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1819, '株洲市', 2, '43', '02', '00', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1820, '荷塘区', 3, '43', '02', '02', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1821, '芦淞区', 3, '43', '02', '03', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1822, '石峰区', 3, '43', '02', '04', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1823, '天元区', 3, '43', '02', '11', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1824, '株洲县', 3, '43', '02', '21', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1825, '攸县', 3, '43', '02', '23', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1826, '茶陵县', 3, '43', '02', '24', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1827, '炎陵县', 3, '43', '02', '25', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1828, '醴陵市', 3, '43', '02', '81', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1829, '湘潭市', 2, '43', '03', '00', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1830, '雨湖区', 3, '43', '03', '02', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1831, '岳塘区', 3, '43', '03', '04', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1832, '湘潭县', 3, '43', '03', '21', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1833, '湘乡市', 3, '43', '03', '81', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1834, '韶山市', 3, '43', '03', '82', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1835, '衡阳市', 2, '43', '04', '00', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1836, '珠晖区', 3, '43', '04', '05', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1837, '雁峰区', 3, '43', '04', '06', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1838, '石鼓区', 3, '43', '04', '07', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1839, '蒸湘区', 3, '43', '04', '08', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1840, '南岳区', 3, '43', '04', '12', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1841, '衡阳县', 3, '43', '04', '21', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1842, '衡南县', 3, '43', '04', '22', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1843, '衡山县', 3, '43', '04', '23', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1844, '衡东县', 3, '43', '04', '24', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1845, '祁东县', 3, '43', '04', '26', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1846, '耒阳市', 3, '43', '04', '81', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1847, '常宁市', 3, '43', '04', '82', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1848, '邵阳市', 2, '43', '05', '00', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1849, '双清区', 3, '43', '05', '02', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1850, '大祥区', 3, '43', '05', '03', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1851, '北塔区', 3, '43', '05', '11', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1852, '邵东县', 3, '43', '05', '21', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1853, '新邵县', 3, '43', '05', '22', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1854, '邵阳县', 3, '43', '05', '23', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1855, '隆回县', 3, '43', '05', '24', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1856, '洞口县', 3, '43', '05', '25', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1857, '绥宁县', 3, '43', '05', '27', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1858, '新宁县', 3, '43', '05', '28', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1859, '城步苗族自治县', 3, '43', '05', '29', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1860, '武冈市', 3, '43', '05', '81', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1861, '岳阳市', 2, '43', '06', '00', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1862, '岳阳楼区', 3, '43', '06', '02', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1863, '云溪区', 3, '43', '06', '03', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1864, '君山区', 3, '43', '06', '11', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1865, '岳阳县', 3, '43', '06', '21', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1866, '华容县', 3, '43', '06', '23', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1867, '湘阴县', 3, '43', '06', '24', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1868, '平江县', 3, '43', '06', '26', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1869, '汨罗市', 3, '43', '06', '81', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1870, '临湘市', 3, '43', '06', '82', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1871, '常德市', 2, '43', '07', '00', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1872, '武陵区', 3, '43', '07', '02', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1873, '鼎城区', 3, '43', '07', '03', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1874, '安乡县', 3, '43', '07', '21', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1875, '汉寿县', 3, '43', '07', '22', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1876, '澧县', 3, '43', '07', '23', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1877, '临澧县', 3, '43', '07', '24', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1878, '桃源县', 3, '43', '07', '25', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1879, '石门县', 3, '43', '07', '26', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1880, '津市市', 3, '43', '07', '81', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1881, '张家界市', 2, '43', '08', '00', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1882, '永定区', 3, '43', '08', '02', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1883, '武陵源区', 3, '43', '08', '11', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1884, '慈利县', 3, '43', '08', '21', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1885, '桑植县', 3, '43', '08', '22', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1886, '益阳市', 2, '43', '09', '00', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1887, '资阳区', 3, '43', '09', '02', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1888, '赫山区', 3, '43', '09', '03', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1889, '南县', 3, '43', '09', '21', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1890, '桃江县', 3, '43', '09', '22', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1891, '安化县', 3, '43', '09', '23', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1892, '沅江市', 3, '43', '09', '81', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1893, '郴州市', 2, '43', '10', '00', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1894, '北湖区', 3, '43', '10', '02', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1895, '苏仙区', 3, '43', '10', '03', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1896, '桂阳县', 3, '43', '10', '21', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1897, '宜章县', 3, '43', '10', '22', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1898, '永兴县', 3, '43', '10', '23', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1899, '嘉禾县', 3, '43', '10', '24', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1900, '临武县', 3, '43', '10', '25', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1901, '汝城县', 3, '43', '10', '26', 'R', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1902, '桂东县', 3, '43', '10', '27', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1903, '安仁县', 3, '43', '10', '28', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1904, '资兴市', 3, '43', '10', '81', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1905, '永州市', 2, '43', '11', '00', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1906, '零陵区', 3, '43', '11', '02', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1907, '冷水滩区', 3, '43', '11', '03', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1908, '祁阳县', 3, '43', '11', '21', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1909, '东安县', 3, '43', '11', '22', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1910, '双牌县', 3, '43', '11', '23', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1911, '道县', 3, '43', '11', '24', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1912, '江永县', 3, '43', '11', '25', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1913, '宁远县', 3, '43', '11', '26', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1914, '蓝山县', 3, '43', '11', '27', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1915, '新田县', 3, '43', '11', '28', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1916, '江华瑶族自治县', 3, '43', '11', '29', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1917, '怀化市', 2, '43', '12', '00', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1918, '鹤城区', 3, '43', '12', '02', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1919, '中方县', 3, '43', '12', '21', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1920, '沅陵县', 3, '43', '12', '22', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1921, '辰溪县', 3, '43', '12', '23', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1922, '溆浦县', 3, '43', '12', '24', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1923, '会同县', 3, '43', '12', '25', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1924, '麻阳苗族自治县', 3, '43', '12', '26', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1925, '新晃侗族自治县', 3, '43', '12', '27', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1926, '芷江侗族自治县', 3, '43', '12', '28', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1927, '靖州苗族侗族自治县', 3, '43', '12', '29', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1928, '通道侗族自治县', 3, '43', '12', '30', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1929, '洪江市', 3, '43', '12', '81', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1930, '娄底市', 2, '43', '13', '00', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1931, '娄星区', 3, '43', '13', '02', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1932, '双峰县', 3, '43', '13', '21', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1933, '新化县', 3, '43', '13', '22', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1934, '冷水江市', 3, '43', '13', '81', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1935, '涟源市', 3, '43', '13', '82', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1936, '湘西土家族苗族自治州', 2, '43', '31', '00', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1937, '吉首市', 3, '43', '31', '01', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1938, '泸溪县', 3, '43', '31', '22', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1939, '凤凰县', 3, '43', '31', '23', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1940, '花垣县', 3, '43', '31', '24', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1941, '保靖县', 3, '43', '31', '25', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1942, '古丈县', 3, '43', '31', '26', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1943, '永顺县', 3, '43', '31', '27', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1944, '龙山县', 3, '43', '31', '30', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1945, '广东省', 1, '44', '00', '00', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1946, '广州市', 2, '44', '01', '00', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1947, '荔湾区', 3, '44', '01', '03', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1948, '越秀区', 3, '44', '01', '04', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1949, '海珠区', 3, '44', '01', '05', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1950, '天河区', 3, '44', '01', '06', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1951, '白云区', 3, '44', '01', '11', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1952, '黄埔区', 3, '44', '01', '12', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1953, '番禺区', 3, '44', '01', '13', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1954, '花都区', 3, '44', '01', '14', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1955, '南沙区', 3, '44', '01', '15', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1956, '萝岗区', 3, '44', '01', '16', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1957, '从化区', 3, '44', '01', '17', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1958, '增城区', 3, '44', '01', '18', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1959, '韶关市', 2, '44', '02', '00', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1960, '武江区', 3, '44', '02', '03', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1961, '浈江区', 3, '44', '02', '04', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1962, '曲江区', 3, '44', '02', '05', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1963, '始兴县', 3, '44', '02', '22', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1964, '仁化县', 3, '44', '02', '24', 'R', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1965, '翁源县', 3, '44', '02', '29', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1966, '乳源瑶族自治县', 3, '44', '02', '32', 'R', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1967, '新丰县', 3, '44', '02', '33', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1968, '乐昌市', 3, '44', '02', '81', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1969, '南雄市', 3, '44', '02', '82', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1970, '深圳市', 2, '44', '03', '00', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1971, '罗湖区', 3, '44', '03', '03', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1972, '福田区', 3, '44', '03', '04', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1973, '南山区', 3, '44', '03', '05', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1974, '宝安区', 3, '44', '03', '06', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1975, '龙岗区', 3, '44', '03', '07', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1976, '盐田区', 3, '44', '03', '08', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1977, '珠海市', 2, '44', '04', '00', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1978, '香洲区', 3, '44', '04', '02', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1979, '斗门区', 3, '44', '04', '03', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1980, '金湾区', 3, '44', '04', '04', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1981, '汕头市', 2, '44', '05', '00', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1982, '龙湖区', 3, '44', '05', '07', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1983, '金平区', 3, '44', '05', '11', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1984, '濠江区', 3, '44', '05', '12', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1985, '潮阳区', 3, '44', '05', '13', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1986, '潮南区', 3, '44', '05', '14', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1987, '澄海区', 3, '44', '05', '15', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1988, '南澳县', 3, '44', '05', '23', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1989, '佛山市', 2, '44', '06', '00', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1990, '禅城区', 3, '44', '06', '04', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1991, '南海区', 3, '44', '06', '05', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1992, '顺德区', 3, '44', '06', '06', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1993, '三水区', 3, '44', '06', '07', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1994, '高明区', 3, '44', '06', '08', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1995, '江门市', 2, '44', '07', '00', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1996, '蓬江区', 3, '44', '07', '03', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1997, '江海区', 3, '44', '07', '04', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1998, '新会区', 3, '44', '07', '05', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (1999, '台山市', 3, '44', '07', '81', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2000, '开平市', 3, '44', '07', '83', 'K', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2001, '鹤山市', 3, '44', '07', '84', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2002, '恩平市', 3, '44', '07', '85', 'E', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2003, '湛江市', 2, '44', '08', '00', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2004, '赤坎区', 3, '44', '08', '02', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2005, '霞山区', 3, '44', '08', '03', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2006, '坡头区', 3, '44', '08', '04', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2007, '麻章区', 3, '44', '08', '11', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2008, '遂溪县', 3, '44', '08', '23', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2009, '徐闻县', 3, '44', '08', '25', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2010, '廉江市', 3, '44', '08', '81', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2011, '雷州市', 3, '44', '08', '82', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2012, '吴川市', 3, '44', '08', '83', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2013, '茂名市', 2, '44', '09', '00', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2014, '茂南区', 3, '44', '09', '02', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2015, '电白区', 3, '44', '09', '04', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2016, '高州市', 3, '44', '09', '81', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2017, '化州市', 3, '44', '09', '82', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2018, '信宜市', 3, '44', '09', '83', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2019, '肇庆市', 2, '44', '12', '00', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2020, '端州区', 3, '44', '12', '02', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2021, '鼎湖区', 3, '44', '12', '03', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2022, '广宁县', 3, '44', '12', '23', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2023, '怀集县', 3, '44', '12', '24', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2024, '封开县', 3, '44', '12', '25', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2025, '德庆县', 3, '44', '12', '26', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2026, '高要市', 3, '44', '12', '83', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2027, '四会市', 3, '44', '12', '84', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2028, '惠州市', 2, '44', '13', '00', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2029, '惠城区', 3, '44', '13', '02', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2030, '惠阳区', 3, '44', '13', '03', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2031, '博罗县', 3, '44', '13', '22', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2032, '惠东县', 3, '44', '13', '23', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2033, '龙门县', 3, '44', '13', '24', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2034, '梅州市', 2, '44', '14', '00', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2035, '梅江区', 3, '44', '14', '02', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2036, '梅县区', 3, '44', '14', '03', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2037, '大埔县', 3, '44', '14', '22', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2038, '丰顺县', 3, '44', '14', '23', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2039, '五华县', 3, '44', '14', '24', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2040, '平远县', 3, '44', '14', '26', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2041, '蕉岭县', 3, '44', '14', '27', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2042, '兴宁市', 3, '44', '14', '81', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2043, '汕尾市', 2, '44', '15', '00', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2044, '城区', 3, '44', '15', '02', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2045, '海丰县', 3, '44', '15', '21', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2046, '陆河县', 3, '44', '15', '23', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2047, '陆丰市', 3, '44', '15', '81', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2048, '河源市', 2, '44', '16', '00', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2049, '源城区', 3, '44', '16', '02', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2050, '紫金县', 3, '44', '16', '21', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2051, '龙川县', 3, '44', '16', '22', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2052, '连平县', 3, '44', '16', '23', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2053, '和平县', 3, '44', '16', '24', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2054, '东源县', 3, '44', '16', '25', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2055, '阳江市', 2, '44', '17', '00', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2056, '江城区', 3, '44', '17', '02', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2057, '阳西县', 3, '44', '17', '21', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2058, '阳东县', 3, '44', '17', '23', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2059, '阳春市', 3, '44', '17', '81', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2060, '清远市', 2, '44', '18', '00', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2061, '清城区', 3, '44', '18', '02', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2062, '清新区', 3, '44', '18', '03', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2063, '佛冈县', 3, '44', '18', '21', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2064, '阳山县', 3, '44', '18', '23', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2065, '连山壮族瑶族自治县', 3, '44', '18', '25', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2066, '连南瑶族自治县', 3, '44', '18', '26', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2067, '英德市', 3, '44', '18', '81', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2068, '连州市', 3, '44', '18', '82', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2069, '东莞市', 2, '44', '19', '00', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2070, '中山市', 2, '44', '20', '00', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2071, '潮州市', 2, '44', '51', '00', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2072, '湘桥区', 3, '44', '51', '02', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2073, '潮安区', 3, '44', '51', '03', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2074, '饶平县', 3, '44', '51', '22', 'R', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2075, '揭阳市', 2, '44', '52', '00', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2076, '榕城区', 3, '44', '52', '02', 'R', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2077, '揭东区', 3, '44', '52', '03', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2078, '揭西县', 3, '44', '52', '22', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2079, '惠来县', 3, '44', '52', '24', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2080, '普宁市', 3, '44', '52', '81', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2081, '云浮市', 2, '44', '53', '00', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2082, '云城区', 3, '44', '53', '02', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2083, '云安区', 3, '44', '53', '03', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2084, '新兴县', 3, '44', '53', '21', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2085, '郁南县', 3, '44', '53', '22', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2086, '罗定市', 3, '44', '53', '81', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2087, '广西壮族自治区', 1, '45', '00', '00', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2088, '南宁市', 2, '45', '01', '00', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2089, '兴宁区', 3, '45', '01', '02', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2090, '青秀区', 3, '45', '01', '03', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2091, '江南区', 3, '45', '01', '05', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2092, '西乡塘区', 3, '45', '01', '07', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2093, '良庆区', 3, '45', '01', '08', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2094, '邕宁区', 3, '45', '01', '09', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2095, '武鸣县', 3, '45', '01', '22', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2096, '隆安县', 3, '45', '01', '23', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2097, '马山县', 3, '45', '01', '24', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2098, '上林县', 3, '45', '01', '25', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2099, '宾阳县', 3, '45', '01', '26', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2100, '横县', 3, '45', '01', '27', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2101, '柳州市', 2, '45', '02', '00', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2102, '城中区', 3, '45', '02', '02', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2103, '鱼峰区', 3, '45', '02', '03', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2104, '柳南区', 3, '45', '02', '04', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2105, '柳北区', 3, '45', '02', '05', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2106, '柳江县', 3, '45', '02', '21', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2107, '柳城县', 3, '45', '02', '22', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2108, '鹿寨县', 3, '45', '02', '23', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2109, '融安县', 3, '45', '02', '24', 'R', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2110, '融水苗族自治县', 3, '45', '02', '25', 'R', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2111, '三江侗族自治县', 3, '45', '02', '26', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2112, '桂林市', 2, '45', '03', '00', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2113, '秀峰区', 3, '45', '03', '02', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2114, '叠彩区', 3, '45', '03', '03', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2115, '象山区', 3, '45', '03', '04', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2116, '七星区', 3, '45', '03', '05', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2117, '雁山区', 3, '45', '03', '11', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2118, '临桂区', 3, '45', '03', '12', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2119, '阳朔县', 3, '45', '03', '21', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2120, '灵川县', 3, '45', '03', '23', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2121, '全州县', 3, '45', '03', '24', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2122, '兴安县', 3, '45', '03', '25', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2123, '永福县', 3, '45', '03', '26', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2124, '灌阳县', 3, '45', '03', '27', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2125, '龙胜各族自治县', 3, '45', '03', '28', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2126, '资源县', 3, '45', '03', '29', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2127, '平乐县', 3, '45', '03', '30', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2128, '荔浦县', 3, '45', '03', '31', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2129, '恭城瑶族自治县', 3, '45', '03', '32', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2130, '梧州市', 2, '45', '04', '00', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2131, '万秀区', 3, '45', '04', '03', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2132, '长洲区', 3, '45', '04', '05', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2133, '龙圩区', 3, '45', '04', '06', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2134, '苍梧县', 3, '45', '04', '21', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2135, '藤县', 3, '45', '04', '22', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2136, '蒙山县', 3, '45', '04', '23', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2137, '岑溪市', 3, '45', '04', '81', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2138, '北海市', 2, '45', '05', '00', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2139, '海城区', 3, '45', '05', '02', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2140, '银海区', 3, '45', '05', '03', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2141, '铁山港区', 3, '45', '05', '12', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2142, '合浦县', 3, '45', '05', '21', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2143, '防城港市', 2, '45', '06', '00', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2144, '港口区', 3, '45', '06', '02', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2145, '防城区', 3, '45', '06', '03', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2146, '上思县', 3, '45', '06', '21', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2147, '东兴市', 3, '45', '06', '81', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2148, '钦州市', 2, '45', '07', '00', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2149, '钦南区', 3, '45', '07', '02', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2150, '钦北区', 3, '45', '07', '03', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2151, '灵山县', 3, '45', '07', '21', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2152, '浦北县', 3, '45', '07', '22', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2153, '贵港市', 2, '45', '08', '00', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2154, '港北区', 3, '45', '08', '02', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2155, '港南区', 3, '45', '08', '03', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2156, '覃塘区', 3, '45', '08', '04', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2157, '平南县', 3, '45', '08', '21', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2158, '桂平市', 3, '45', '08', '81', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2159, '玉林市', 2, '45', '09', '00', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2160, '玉州区', 3, '45', '09', '02', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2161, '福绵区', 3, '45', '09', '03', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2162, '容县', 3, '45', '09', '21', 'R', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2163, '陆川县', 3, '45', '09', '22', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2164, '博白县', 3, '45', '09', '23', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2165, '兴业县', 3, '45', '09', '24', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2166, '北流市', 3, '45', '09', '81', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2167, '百色市', 2, '45', '10', '00', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2168, '右江区', 3, '45', '10', '02', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2169, '田阳县', 3, '45', '10', '21', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2170, '田东县', 3, '45', '10', '22', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2171, '平果县', 3, '45', '10', '23', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2172, '德保县', 3, '45', '10', '24', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2173, '靖西县', 3, '45', '10', '25', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2174, '那坡县', 3, '45', '10', '26', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2175, '凌云县', 3, '45', '10', '27', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2176, '乐业县', 3, '45', '10', '28', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2177, '田林县', 3, '45', '10', '29', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2178, '西林县', 3, '45', '10', '30', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2179, '隆林各族自治县', 3, '45', '10', '31', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2180, '贺州市', 2, '45', '11', '00', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2181, '八步区', 3, '45', '11', '02', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2182, '昭平县', 3, '45', '11', '21', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2183, '钟山县', 3, '45', '11', '22', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2184, '富川瑶族自治县', 3, '45', '11', '23', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2185, '河池市', 2, '45', '12', '00', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2186, '金城江区', 3, '45', '12', '02', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2187, '南丹县', 3, '45', '12', '21', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2188, '天峨县', 3, '45', '12', '22', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2189, '凤山县', 3, '45', '12', '23', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2190, '东兰县', 3, '45', '12', '24', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2191, '罗城仫佬族自治县', 3, '45', '12', '25', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2192, '环江毛南族自治县', 3, '45', '12', '26', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2193, '巴马瑶族自治县', 3, '45', '12', '27', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2194, '都安瑶族自治县', 3, '45', '12', '28', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2195, '大化瑶族自治县', 3, '45', '12', '29', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2196, '宜州市', 3, '45', '12', '81', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2197, '来宾市', 2, '45', '13', '00', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2198, '兴宾区', 3, '45', '13', '02', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2199, '忻城县', 3, '45', '13', '21', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2200, '象州县', 3, '45', '13', '22', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2201, '武宣县', 3, '45', '13', '23', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2202, '金秀瑶族自治县', 3, '45', '13', '24', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2203, '合山市', 3, '45', '13', '81', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2204, '崇左市', 2, '45', '14', '00', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2205, '江州区', 3, '45', '14', '02', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2206, '扶绥县', 3, '45', '14', '21', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2207, '宁明县', 3, '45', '14', '22', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2208, '龙州县', 3, '45', '14', '23', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2209, '大新县', 3, '45', '14', '24', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2210, '天等县', 3, '45', '14', '25', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2211, '凭祥市', 3, '45', '14', '81', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2212, '海南省', 1, '46', '00', '00', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2213, '海口市', 2, '46', '01', '00', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2214, '秀英区', 3, '46', '01', '05', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2215, '龙华区', 3, '46', '01', '06', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2216, '琼山区', 3, '46', '01', '07', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2217, '美兰区', 3, '46', '01', '08', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2218, '三亚市', 2, '46', '02', '00', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2219, '海棠区', 3, '46', '02', '02', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2220, '吉阳区', 3, '46', '02', '03', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2221, '天涯区', 3, '46', '02', '04', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2222, '崖州区', 3, '46', '02', '05', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2223, '三沙市', 2, '46', '03', '00', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2224, '省直辖县级行政区划', 2, '46', '90', '00', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2225, '五指山市', 3, '46', '90', '01', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2226, '琼海市', 3, '46', '90', '02', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2227, '儋州市', 3, '46', '90', '03', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2228, '文昌市', 3, '46', '90', '05', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2229, '万宁市', 3, '46', '90', '06', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2230, '东方市', 3, '46', '90', '07', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2231, '定安县', 3, '46', '90', '21', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2232, '屯昌县', 3, '46', '90', '22', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2233, '澄迈县', 3, '46', '90', '23', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2234, '临高县', 3, '46', '90', '24', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2235, '白沙黎族自治县', 3, '46', '90', '25', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2236, '昌江黎族自治县', 3, '46', '90', '26', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2237, '乐东黎族自治县', 3, '46', '90', '27', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2238, '陵水黎族自治县', 3, '46', '90', '28', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2239, '保亭黎族苗族自治县', 3, '46', '90', '29', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2240, '琼中黎族苗族自治县', 3, '46', '90', '30', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2241, '重庆市', 1, '50', '00', '00', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2242, '万州区', 3, '50', '01', '01', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2243, '涪陵区', 3, '50', '01', '02', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2244, '渝中区', 3, '50', '01', '03', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2245, '大渡口区', 3, '50', '01', '04', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2246, '江北区', 3, '50', '01', '05', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2247, '沙坪坝区', 3, '50', '01', '06', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2248, '九龙坡区', 3, '50', '01', '07', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2249, '南岸区', 3, '50', '01', '08', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2250, '北碚区', 3, '50', '01', '09', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2251, '綦江区', 3, '50', '01', '10', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2252, '大足区', 3, '50', '01', '11', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2253, '渝北区', 3, '50', '01', '12', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2254, '巴南区', 3, '50', '01', '13', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2255, '黔江区', 3, '50', '01', '14', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2256, '长寿区', 3, '50', '01', '15', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2257, '江津区', 3, '50', '01', '16', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2258, '合川区', 3, '50', '01', '17', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2259, '永川区', 3, '50', '01', '18', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2260, '南川区', 3, '50', '01', '19', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2261, '璧山区', 3, '50', '01', '20', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2262, '铜梁区', 3, '50', '01', '51', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2263, '县', 2, '50', '02', '00', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2264, '潼南县', 3, '50', '02', '23', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2265, '荣昌县', 3, '50', '02', '26', 'R', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2266, '梁平县', 3, '50', '02', '28', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2267, '城口县', 3, '50', '02', '29', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2268, '丰都县', 3, '50', '02', '30', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2269, '垫江县', 3, '50', '02', '31', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2270, '武隆县', 3, '50', '02', '32', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2271, '忠县', 3, '50', '02', '33', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2272, '开县', 3, '50', '02', '34', 'K', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2273, '云阳县', 3, '50', '02', '35', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2274, '奉节县', 3, '50', '02', '36', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2275, '巫山县', 3, '50', '02', '37', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2276, '巫溪县', 3, '50', '02', '38', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2277, '石柱土家族自治县', 3, '50', '02', '40', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2278, '秀山土家族苗族自治县', 3, '50', '02', '41', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2279, '酉阳土家族苗族自治县', 3, '50', '02', '42', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2280, '彭水苗族土家族自治县', 3, '50', '02', '43', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2281, '四川省', 1, '51', '00', '00', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2282, '成都市', 2, '51', '01', '00', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2283, '锦江区', 3, '51', '01', '04', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2284, '青羊区', 3, '51', '01', '05', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2285, '金牛区', 3, '51', '01', '06', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2286, '武侯区', 3, '51', '01', '07', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2287, '成华区', 3, '51', '01', '08', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2288, '龙泉驿区', 3, '51', '01', '12', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2289, '青白江区', 3, '51', '01', '13', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2290, '新都区', 3, '51', '01', '14', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2291, '温江区', 3, '51', '01', '15', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2292, '金堂县', 3, '51', '01', '21', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2293, '双流县', 3, '51', '01', '22', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2294, '郫县', 3, '51', '01', '24', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2295, '大邑县', 3, '51', '01', '29', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2296, '蒲江县', 3, '51', '01', '31', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2297, '新津县', 3, '51', '01', '32', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2298, '都江堰市', 3, '51', '01', '81', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2299, '彭州市', 3, '51', '01', '82', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2300, '邛崃市', 3, '51', '01', '83', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2301, '崇州市', 3, '51', '01', '84', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2302, '自贡市', 2, '51', '03', '00', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2303, '自流井区', 3, '51', '03', '02', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2304, '贡井区', 3, '51', '03', '03', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2305, '大安区', 3, '51', '03', '04', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2306, '沿滩区', 3, '51', '03', '11', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2307, '荣县', 3, '51', '03', '21', 'R', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2308, '富顺县', 3, '51', '03', '22', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2309, '攀枝花市', 2, '51', '04', '00', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2310, '东区', 3, '51', '04', '02', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2311, '西区', 3, '51', '04', '03', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2312, '仁和区', 3, '51', '04', '11', 'R', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2313, '米易县', 3, '51', '04', '21', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2314, '盐边县', 3, '51', '04', '22', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2315, '泸州市', 2, '51', '05', '00', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2316, '江阳区', 3, '51', '05', '02', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2317, '纳溪区', 3, '51', '05', '03', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2318, '龙马潭区', 3, '51', '05', '04', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2319, '泸县', 3, '51', '05', '21', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2320, '合江县', 3, '51', '05', '22', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2321, '叙永县', 3, '51', '05', '24', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2322, '古蔺县', 3, '51', '05', '25', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2323, '德阳市', 2, '51', '06', '00', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2324, '旌阳区', 3, '51', '06', '03', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2325, '中江县', 3, '51', '06', '23', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2326, '罗江县', 3, '51', '06', '26', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2327, '广汉市', 3, '51', '06', '81', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2328, '什邡市', 3, '51', '06', '82', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2329, '绵竹市', 3, '51', '06', '83', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2330, '绵阳市', 2, '51', '07', '00', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2331, '涪城区', 3, '51', '07', '03', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2332, '游仙区', 3, '51', '07', '04', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2333, '三台县', 3, '51', '07', '22', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2334, '盐亭县', 3, '51', '07', '23', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2335, '安县', 3, '51', '07', '24', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2336, '梓潼县', 3, '51', '07', '25', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2337, '北川羌族自治县', 3, '51', '07', '26', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2338, '平武县', 3, '51', '07', '27', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2339, '江油市', 3, '51', '07', '81', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2340, '广元市', 2, '51', '08', '00', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2341, '利州区', 3, '51', '08', '02', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2342, '昭化区', 3, '51', '08', '11', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2343, '朝天区', 3, '51', '08', '12', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2344, '旺苍县', 3, '51', '08', '21', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2345, '青川县', 3, '51', '08', '22', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2346, '剑阁县', 3, '51', '08', '23', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2347, '苍溪县', 3, '51', '08', '24', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2348, '遂宁市', 2, '51', '09', '00', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2349, '船山区', 3, '51', '09', '03', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2350, '安居区', 3, '51', '09', '04', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2351, '蓬溪县', 3, '51', '09', '21', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2352, '射洪县', 3, '51', '09', '22', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2353, '大英县', 3, '51', '09', '23', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2354, '内江市', 2, '51', '10', '00', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2355, '市中区', 3, '51', '10', '02', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2356, '东兴区', 3, '51', '10', '11', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2357, '威远县', 3, '51', '10', '24', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2358, '资中县', 3, '51', '10', '25', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2359, '隆昌县', 3, '51', '10', '28', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2360, '乐山市', 2, '51', '11', '00', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2361, '市中区', 3, '51', '11', '02', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2362, '沙湾区', 3, '51', '11', '11', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2363, '五通桥区', 3, '51', '11', '12', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2364, '金口河区', 3, '51', '11', '13', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2365, '犍为县', 3, '51', '11', '23', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2366, '井研县', 3, '51', '11', '24', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2367, '夹江县', 3, '51', '11', '26', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2368, '沐川县', 3, '51', '11', '29', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2369, '峨边彝族自治县', 3, '51', '11', '32', 'E', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2370, '马边彝族自治县', 3, '51', '11', '33', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2371, '峨眉山市', 3, '51', '11', '81', 'E', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2372, '南充市', 2, '51', '13', '00', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2373, '顺庆区', 3, '51', '13', '02', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2374, '高坪区', 3, '51', '13', '03', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2375, '嘉陵区', 3, '51', '13', '04', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2376, '南部县', 3, '51', '13', '21', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2377, '营山县', 3, '51', '13', '22', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2378, '蓬安县', 3, '51', '13', '23', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2379, '仪陇县', 3, '51', '13', '24', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2380, '西充县', 3, '51', '13', '25', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2381, '阆中市', 3, '51', '13', '81', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2382, '眉山市', 2, '51', '14', '00', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2383, '东坡区', 3, '51', '14', '02', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2384, '仁寿县', 3, '51', '14', '21', 'R', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2385, '彭山县', 3, '51', '14', '22', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2386, '洪雅县', 3, '51', '14', '23', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2387, '丹棱县', 3, '51', '14', '24', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2388, '青神县', 3, '51', '14', '25', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2389, '宜宾市', 2, '51', '15', '00', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2390, '翠屏区', 3, '51', '15', '02', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2391, '南溪区', 3, '51', '15', '03', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2392, '宜宾县', 3, '51', '15', '21', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2393, '江安县', 3, '51', '15', '23', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2394, '长宁县', 3, '51', '15', '24', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2395, '高县', 3, '51', '15', '25', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2396, '珙县', 3, '51', '15', '26', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2397, '筠连县', 3, '51', '15', '27', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2398, '兴文县', 3, '51', '15', '28', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2399, '屏山县', 3, '51', '15', '29', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2400, '广安市', 2, '51', '16', '00', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2401, '广安区', 3, '51', '16', '02', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2402, '前锋区', 3, '51', '16', '03', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2403, '岳池县', 3, '51', '16', '21', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2404, '武胜县', 3, '51', '16', '22', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2405, '邻水县', 3, '51', '16', '23', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2406, '华蓥市', 3, '51', '16', '81', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2407, '达州市', 2, '51', '17', '00', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2408, '通川区', 3, '51', '17', '02', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2409, '达川区', 3, '51', '17', '03', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2410, '宣汉县', 3, '51', '17', '22', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2411, '开江县', 3, '51', '17', '23', 'K', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2412, '大竹县', 3, '51', '17', '24', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2413, '渠县', 3, '51', '17', '25', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2414, '万源市', 3, '51', '17', '81', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2415, '雅安市', 2, '51', '18', '00', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2416, '雨城区', 3, '51', '18', '02', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2417, '名山区', 3, '51', '18', '03', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2418, '荥经县', 3, '51', '18', '22', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2419, '汉源县', 3, '51', '18', '23', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2420, '石棉县', 3, '51', '18', '24', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2421, '天全县', 3, '51', '18', '25', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2422, '芦山县', 3, '51', '18', '26', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2423, '宝兴县', 3, '51', '18', '27', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2424, '巴中市', 2, '51', '19', '00', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2425, '巴州区', 3, '51', '19', '02', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2426, '恩阳区', 3, '51', '19', '03', 'E', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2427, '通江县', 3, '51', '19', '21', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2428, '南江县', 3, '51', '19', '22', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2429, '平昌县', 3, '51', '19', '23', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2430, '资阳市', 2, '51', '20', '00', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2431, '雁江区', 3, '51', '20', '02', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2432, '安岳县', 3, '51', '20', '21', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2433, '乐至县', 3, '51', '20', '22', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2434, '简阳市', 3, '51', '20', '81', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2435, '阿坝藏族羌族自治州', 2, '51', '32', '00', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2436, '汶川县', 3, '51', '32', '21', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2437, '理县', 3, '51', '32', '22', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2438, '茂县', 3, '51', '32', '23', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2439, '松潘县', 3, '51', '32', '24', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2440, '九寨沟县', 3, '51', '32', '25', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2441, '金川县', 3, '51', '32', '26', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2442, '小金县', 3, '51', '32', '27', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2443, '黑水县', 3, '51', '32', '28', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2444, '马尔康县', 3, '51', '32', '29', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2445, '壤塘县', 3, '51', '32', '30', 'R', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2446, '阿坝县', 3, '51', '32', '31', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2447, '若尔盖县', 3, '51', '32', '32', 'R', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2448, '红原县', 3, '51', '32', '33', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2449, '甘孜藏族自治州', 2, '51', '33', '00', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2450, '康定县', 3, '51', '33', '21', 'K', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2451, '泸定县', 3, '51', '33', '22', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2452, '丹巴县', 3, '51', '33', '23', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2453, '九龙县', 3, '51', '33', '24', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2454, '雅江县', 3, '51', '33', '25', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2455, '道孚县', 3, '51', '33', '26', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2456, '炉霍县', 3, '51', '33', '27', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2457, '甘孜县', 3, '51', '33', '28', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2458, '新龙县', 3, '51', '33', '29', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2459, '德格县', 3, '51', '33', '30', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2460, '白玉县', 3, '51', '33', '31', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2461, '石渠县', 3, '51', '33', '32', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2462, '色达县', 3, '51', '33', '33', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2463, '理塘县', 3, '51', '33', '34', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2464, '巴塘县', 3, '51', '33', '35', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2465, '乡城县', 3, '51', '33', '36', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2466, '稻城县', 3, '51', '33', '37', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2467, '得荣县', 3, '51', '33', '38', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2468, '凉山彝族自治州', 2, '51', '34', '00', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2469, '西昌市', 3, '51', '34', '01', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2470, '木里藏族自治县', 3, '51', '34', '22', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2471, '盐源县', 3, '51', '34', '23', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2472, '德昌县', 3, '51', '34', '24', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2473, '会理县', 3, '51', '34', '25', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2474, '会东县', 3, '51', '34', '26', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2475, '宁南县', 3, '51', '34', '27', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2476, '普格县', 3, '51', '34', '28', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2477, '布拖县', 3, '51', '34', '29', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2478, '金阳县', 3, '51', '34', '30', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2479, '昭觉县', 3, '51', '34', '31', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2480, '喜德县', 3, '51', '34', '32', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2481, '冕宁县', 3, '51', '34', '33', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2482, '越西县', 3, '51', '34', '34', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2483, '甘洛县', 3, '51', '34', '35', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2484, '美姑县', 3, '51', '34', '36', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2485, '雷波县', 3, '51', '34', '37', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2486, '贵州省', 1, '52', '00', '00', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2487, '贵阳市', 2, '52', '01', '00', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2488, '南明区', 3, '52', '01', '02', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2489, '云岩区', 3, '52', '01', '03', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2490, '花溪区', 3, '52', '01', '11', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2491, '乌当区', 3, '52', '01', '12', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2492, '白云区', 3, '52', '01', '13', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2493, '观山湖区', 3, '52', '01', '15', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2494, '开阳县', 3, '52', '01', '21', 'K', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2495, '息烽县', 3, '52', '01', '22', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2496, '修文县', 3, '52', '01', '23', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2497, '清镇市', 3, '52', '01', '81', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2498, '六盘水市', 2, '52', '02', '00', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2499, '钟山区', 3, '52', '02', '01', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2500, '六枝特区', 3, '52', '02', '03', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2501, '水城县', 3, '52', '02', '21', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2502, '盘县', 3, '52', '02', '22', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2503, '遵义市', 2, '52', '03', '00', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2504, '红花岗区', 3, '52', '03', '02', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2505, '汇川区', 3, '52', '03', '03', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2506, '遵义县', 3, '52', '03', '21', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2507, '桐梓县', 3, '52', '03', '22', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2508, '绥阳县', 3, '52', '03', '23', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2509, '正安县', 3, '52', '03', '24', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2510, '道真仡佬族苗族自治县', 3, '52', '03', '25', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2511, '务川仡佬族苗族自治县', 3, '52', '03', '26', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2512, '凤冈县', 3, '52', '03', '27', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2513, '湄潭县', 3, '52', '03', '28', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2514, '余庆县', 3, '52', '03', '29', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2515, '习水县', 3, '52', '03', '30', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2516, '赤水市', 3, '52', '03', '81', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2517, '仁怀市', 3, '52', '03', '82', 'R', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2518, '安顺市', 2, '52', '04', '00', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2519, '西秀区', 3, '52', '04', '02', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2520, '平坝县', 3, '52', '04', '21', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2521, '普定县', 3, '52', '04', '22', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2522, '镇宁布依族苗族自治县', 3, '52', '04', '23', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2523, '关岭布依族苗族自治县', 3, '52', '04', '24', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2524, '紫云苗族布依族自治县', 3, '52', '04', '25', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2525, '毕节市', 2, '52', '05', '00', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2526, '七星关区', 3, '52', '05', '02', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2527, '大方县', 3, '52', '05', '21', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2528, '黔西县', 3, '52', '05', '22', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2529, '金沙县', 3, '52', '05', '23', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2530, '织金县', 3, '52', '05', '24', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2531, '纳雍县', 3, '52', '05', '25', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2532, '威宁彝族回族苗族自治县', 3, '52', '05', '26', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2533, '赫章县', 3, '52', '05', '27', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2534, '铜仁市', 2, '52', '06', '00', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2535, '碧江区', 3, '52', '06', '02', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2536, '万山区', 3, '52', '06', '03', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2537, '江口县', 3, '52', '06', '21', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2538, '玉屏侗族自治县', 3, '52', '06', '22', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2539, '石阡县', 3, '52', '06', '23', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2540, '思南县', 3, '52', '06', '24', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2541, '印江土家族苗族自治县', 3, '52', '06', '25', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2542, '德江县', 3, '52', '06', '26', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2543, '沿河土家族自治县', 3, '52', '06', '27', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2544, '松桃苗族自治县', 3, '52', '06', '28', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2545, '黔西南布依族苗族自治州', 2, '52', '23', '00', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2546, '兴义市', 3, '52', '23', '01', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2547, '兴仁县', 3, '52', '23', '22', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2548, '普安县', 3, '52', '23', '23', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2549, '晴隆县', 3, '52', '23', '24', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2550, '贞丰县', 3, '52', '23', '25', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2551, '望谟县', 3, '52', '23', '26', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2552, '册亨县', 3, '52', '23', '27', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2553, '安龙县', 3, '52', '23', '28', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2554, '黔东南苗族侗族自治州', 2, '52', '26', '00', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2555, '凯里市', 3, '52', '26', '01', 'K', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2556, '黄平县', 3, '52', '26', '22', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2557, '施秉县', 3, '52', '26', '23', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2558, '三穗县', 3, '52', '26', '24', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2559, '镇远县', 3, '52', '26', '25', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2560, '岑巩县', 3, '52', '26', '26', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2561, '天柱县', 3, '52', '26', '27', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2562, '锦屏县', 3, '52', '26', '28', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2563, '剑河县', 3, '52', '26', '29', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2564, '台江县', 3, '52', '26', '30', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2565, '黎平县', 3, '52', '26', '31', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2566, '榕江县', 3, '52', '26', '32', 'R', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2567, '从江县', 3, '52', '26', '33', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2568, '雷山县', 3, '52', '26', '34', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2569, '麻江县', 3, '52', '26', '35', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2570, '丹寨县', 3, '52', '26', '36', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2571, '黔南布依族苗族自治州', 2, '52', '27', '00', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2572, '都匀市', 3, '52', '27', '01', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2573, '福泉市', 3, '52', '27', '02', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2574, '荔波县', 3, '52', '27', '22', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2575, '贵定县', 3, '52', '27', '23', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2576, '瓮安县', 3, '52', '27', '25', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2577, '独山县', 3, '52', '27', '26', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2578, '平塘县', 3, '52', '27', '27', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2579, '罗甸县', 3, '52', '27', '28', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2580, '长顺县', 3, '52', '27', '29', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2581, '龙里县', 3, '52', '27', '30', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2582, '惠水县', 3, '52', '27', '31', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2583, '三都水族自治县', 3, '52', '27', '32', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2584, '云南省', 1, '53', '00', '00', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2585, '昆明市', 2, '53', '01', '00', 'K', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2586, '五华区', 3, '53', '01', '02', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2587, '盘龙区', 3, '53', '01', '03', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2588, '官渡区', 3, '53', '01', '11', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2589, '西山区', 3, '53', '01', '12', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2590, '东川区', 3, '53', '01', '13', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2591, '呈贡区', 3, '53', '01', '14', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2592, '晋宁县', 3, '53', '01', '22', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2593, '富民县', 3, '53', '01', '24', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2594, '宜良县', 3, '53', '01', '25', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2595, '石林彝族自治县', 3, '53', '01', '26', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2596, '嵩明县', 3, '53', '01', '27', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2597, '禄劝彝族苗族自治县', 3, '53', '01', '28', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2598, '寻甸回族彝族自治县', 3, '53', '01', '29', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2599, '安宁市', 3, '53', '01', '81', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2600, '曲靖市', 2, '53', '03', '00', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2601, '麒麟区', 3, '53', '03', '02', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2602, '马龙县', 3, '53', '03', '21', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2603, '陆良县', 3, '53', '03', '22', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2604, '师宗县', 3, '53', '03', '23', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2605, '罗平县', 3, '53', '03', '24', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2606, '富源县', 3, '53', '03', '25', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2607, '会泽县', 3, '53', '03', '26', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2608, '沾益县', 3, '53', '03', '28', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2609, '宣威市', 3, '53', '03', '81', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2610, '玉溪市', 2, '53', '04', '00', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2611, '红塔区', 3, '53', '04', '02', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2612, '江川县', 3, '53', '04', '21', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2613, '澄江县', 3, '53', '04', '22', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2614, '通海县', 3, '53', '04', '23', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2615, '华宁县', 3, '53', '04', '24', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2616, '易门县', 3, '53', '04', '25', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2617, '峨山彝族自治县', 3, '53', '04', '26', 'E', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2618, '新平彝族傣族自治县', 3, '53', '04', '27', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2619, '元江哈尼族彝族傣族自治县', 3, '53', '04', '28', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2620, '保山市', 2, '53', '05', '00', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2621, '隆阳区', 3, '53', '05', '02', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2622, '施甸县', 3, '53', '05', '21', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2623, '腾冲县', 3, '53', '05', '22', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2624, '龙陵县', 3, '53', '05', '23', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2625, '昌宁县', 3, '53', '05', '24', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2626, '昭通市', 2, '53', '06', '00', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2627, '昭阳区', 3, '53', '06', '02', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2628, '鲁甸县', 3, '53', '06', '21', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2629, '巧家县', 3, '53', '06', '22', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2630, '盐津县', 3, '53', '06', '23', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2631, '大关县', 3, '53', '06', '24', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2632, '永善县', 3, '53', '06', '25', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2633, '绥江县', 3, '53', '06', '26', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2634, '镇雄县', 3, '53', '06', '27', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2635, '彝良县', 3, '53', '06', '28', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2636, '威信县', 3, '53', '06', '29', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2637, '水富县', 3, '53', '06', '30', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2638, '丽江市', 2, '53', '07', '00', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2639, '古城区', 3, '53', '07', '02', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2640, '玉龙纳西族自治县', 3, '53', '07', '21', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2641, '永胜县', 3, '53', '07', '22', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2642, '华坪县', 3, '53', '07', '23', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2643, '宁蒗彝族自治县', 3, '53', '07', '24', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2644, '普洱市', 2, '53', '08', '00', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2645, '思茅区', 3, '53', '08', '02', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2646, '宁洱哈尼族彝族自治县', 3, '53', '08', '21', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2647, '墨江哈尼族自治县', 3, '53', '08', '22', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2648, '景东彝族自治县', 3, '53', '08', '23', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2649, '景谷傣族彝族自治县', 3, '53', '08', '24', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2650, '镇沅彝族哈尼族拉祜族自治县', 3, '53', '08', '25', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2651, '江城哈尼族彝族自治县', 3, '53', '08', '26', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2652, '孟连傣族拉祜族佤族自治县', 3, '53', '08', '27', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2653, '澜沧拉祜族自治县', 3, '53', '08', '28', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2654, '西盟佤族自治县', 3, '53', '08', '29', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2655, '临沧市', 2, '53', '09', '00', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2656, '临翔区', 3, '53', '09', '02', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2657, '凤庆县', 3, '53', '09', '21', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2658, '云县', 3, '53', '09', '22', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2659, '永德县', 3, '53', '09', '23', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2660, '镇康县', 3, '53', '09', '24', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2661, '双江拉祜族佤族布朗族傣族自治县', 3, '53', '09', '25', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2662, '耿马傣族佤族自治县', 3, '53', '09', '26', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2663, '沧源佤族自治县', 3, '53', '09', '27', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2664, '楚雄彝族自治州', 2, '53', '23', '00', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2665, '楚雄市', 3, '53', '23', '01', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2666, '双柏县', 3, '53', '23', '22', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2667, '牟定县', 3, '53', '23', '23', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2668, '南华县', 3, '53', '23', '24', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2669, '姚安县', 3, '53', '23', '25', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2670, '大姚县', 3, '53', '23', '26', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2671, '永仁县', 3, '53', '23', '27', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2672, '元谋县', 3, '53', '23', '28', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2673, '武定县', 3, '53', '23', '29', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2674, '禄丰县', 3, '53', '23', '31', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2675, '红河哈尼族彝族自治州', 2, '53', '25', '00', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2676, '个旧市', 3, '53', '25', '01', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2677, '开远市', 3, '53', '25', '02', 'K', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2678, '蒙自市', 3, '53', '25', '03', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2679, '弥勒市', 3, '53', '25', '04', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2680, '屏边苗族自治县', 3, '53', '25', '23', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2681, '建水县', 3, '53', '25', '24', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2682, '石屏县', 3, '53', '25', '25', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2683, '泸西县', 3, '53', '25', '27', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2684, '元阳县', 3, '53', '25', '28', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2685, '红河县', 3, '53', '25', '29', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2686, '金平苗族瑶族傣族自治县', 3, '53', '25', '30', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2687, '绿春县', 3, '53', '25', '31', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2688, '河口瑶族自治县', 3, '53', '25', '32', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2689, '文山壮族苗族自治州', 2, '53', '26', '00', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2690, '文山市', 3, '53', '26', '01', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2691, '砚山县', 3, '53', '26', '22', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2692, '西畴县', 3, '53', '26', '23', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2693, '麻栗坡县', 3, '53', '26', '24', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2694, '马关县', 3, '53', '26', '25', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2695, '丘北县', 3, '53', '26', '26', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2696, '广南县', 3, '53', '26', '27', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2697, '富宁县', 3, '53', '26', '28', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2698, '西双版纳傣族自治州', 2, '53', '28', '00', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2699, '景洪市', 3, '53', '28', '01', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2700, '勐海县', 3, '53', '28', '22', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2701, '勐腊县', 3, '53', '28', '23', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2702, '大理白族自治州', 2, '53', '29', '00', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2703, '大理市', 3, '53', '29', '01', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2704, '漾濞彝族自治县', 3, '53', '29', '22', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2705, '祥云县', 3, '53', '29', '23', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2706, '宾川县', 3, '53', '29', '24', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2707, '弥渡县', 3, '53', '29', '25', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2708, '南涧彝族自治县', 3, '53', '29', '26', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2709, '巍山彝族回族自治县', 3, '53', '29', '27', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2710, '永平县', 3, '53', '29', '28', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2711, '云龙县', 3, '53', '29', '29', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2712, '洱源县', 3, '53', '29', '30', 'E', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2713, '剑川县', 3, '53', '29', '31', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2714, '鹤庆县', 3, '53', '29', '32', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2715, '德宏傣族景颇族自治州', 2, '53', '31', '00', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2716, '瑞丽市', 3, '53', '31', '02', 'R', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2717, '芒市', 3, '53', '31', '03', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2718, '梁河县', 3, '53', '31', '22', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2719, '盈江县', 3, '53', '31', '23', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2720, '陇川县', 3, '53', '31', '24', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2721, '怒江傈僳族自治州', 2, '53', '33', '00', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2722, '泸水县', 3, '53', '33', '21', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2723, '福贡县', 3, '53', '33', '23', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2724, '贡山独龙族怒族自治县', 3, '53', '33', '24', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2725, '兰坪白族普米族自治县', 3, '53', '33', '25', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2726, '迪庆藏族自治州', 2, '53', '34', '00', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2727, '香格里拉县', 3, '53', '34', '21', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2728, '德钦县', 3, '53', '34', '22', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2729, '维西傈僳族自治县', 3, '53', '34', '23', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2730, '西藏自治区', 1, '54', '00', '00', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2731, '拉萨市', 2, '54', '01', '00', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2732, '城关区', 3, '54', '01', '02', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2733, '林周县', 3, '54', '01', '21', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2734, '当雄县', 3, '54', '01', '22', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2735, '尼木县', 3, '54', '01', '23', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2736, '曲水县', 3, '54', '01', '24', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2737, '堆龙德庆县', 3, '54', '01', '25', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2738, '达孜县', 3, '54', '01', '26', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2739, '墨竹工卡县', 3, '54', '01', '27', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2740, '日喀则市', 2, '54', '02', '00', 'R', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2741, '桑珠孜区', 3, '54', '02', '02', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2742, '南木林县', 3, '54', '02', '21', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2743, '江孜县', 3, '54', '02', '22', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2744, '定日县', 3, '54', '02', '23', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2745, '萨迦县', 3, '54', '02', '24', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2746, '拉孜县', 3, '54', '02', '25', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2747, '昂仁县', 3, '54', '02', '26', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2748, '谢通门县', 3, '54', '02', '27', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2749, '白朗县', 3, '54', '02', '28', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2750, '仁布县', 3, '54', '02', '29', 'R', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2751, '康马县', 3, '54', '02', '30', 'K', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2752, '定结县', 3, '54', '02', '31', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2753, '仲巴县', 3, '54', '02', '32', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2754, '亚东县', 3, '54', '02', '33', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2755, '吉隆县', 3, '54', '02', '34', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2756, '聂拉木县', 3, '54', '02', '35', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2757, '萨嘎县', 3, '54', '02', '36', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2758, '岗巴县', 3, '54', '02', '37', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2759, '昌都地区', 2, '54', '21', '00', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2760, '昌都县', 3, '54', '21', '21', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2761, '江达县', 3, '54', '21', '22', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2762, '贡觉县', 3, '54', '21', '23', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2763, '类乌齐县', 3, '54', '21', '24', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2764, '丁青县', 3, '54', '21', '25', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2765, '察雅县', 3, '54', '21', '26', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2766, '八宿县', 3, '54', '21', '27', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2767, '左贡县', 3, '54', '21', '28', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2768, '芒康县', 3, '54', '21', '29', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2769, '洛隆县', 3, '54', '21', '32', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2770, '边坝县', 3, '54', '21', '33', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2771, '山南地区', 2, '54', '22', '00', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2772, '乃东县', 3, '54', '22', '21', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2773, '扎囊县', 3, '54', '22', '22', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2774, '贡嘎县', 3, '54', '22', '23', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2775, '桑日县', 3, '54', '22', '24', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2776, '琼结县', 3, '54', '22', '25', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2777, '曲松县', 3, '54', '22', '26', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2778, '措美县', 3, '54', '22', '27', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2779, '洛扎县', 3, '54', '22', '28', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2780, '加查县', 3, '54', '22', '29', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2781, '隆子县', 3, '54', '22', '31', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2782, '错那县', 3, '54', '22', '32', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2783, '浪卡子县', 3, '54', '22', '33', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2784, '那曲地区', 2, '54', '24', '00', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2785, '那曲县', 3, '54', '24', '21', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2786, '嘉黎县', 3, '54', '24', '22', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2787, '比如县', 3, '54', '24', '23', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2788, '聂荣县', 3, '54', '24', '24', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2789, '安多县', 3, '54', '24', '25', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2790, '申扎县', 3, '54', '24', '26', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2791, '索县', 3, '54', '24', '27', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2792, '班戈县', 3, '54', '24', '28', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2793, '巴青县', 3, '54', '24', '29', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2794, '尼玛县', 3, '54', '24', '30', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2795, '双湖县', 3, '54', '24', '31', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2796, '阿里地区', 2, '54', '25', '00', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2797, '普兰县', 3, '54', '25', '21', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2798, '札达县', 3, '54', '25', '22', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2799, '噶尔县', 3, '54', '25', '23', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2800, '日土县', 3, '54', '25', '24', 'R', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2801, '革吉县', 3, '54', '25', '25', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2802, '改则县', 3, '54', '25', '26', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2803, '措勤县', 3, '54', '25', '27', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2804, '林芝地区', 2, '54', '26', '00', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2805, '林芝县', 3, '54', '26', '21', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2806, '工布江达县', 3, '54', '26', '22', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2807, '米林县', 3, '54', '26', '23', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2808, '墨脱县', 3, '54', '26', '24', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2809, '波密县', 3, '54', '26', '25', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2810, '察隅县', 3, '54', '26', '26', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2811, '朗县', 3, '54', '26', '27', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2812, '陕西省', 1, '61', '00', '00', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2813, '西安市', 2, '61', '01', '00', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2814, '新城区', 3, '61', '01', '02', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2815, '碑林区', 3, '61', '01', '03', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2816, '莲湖区', 3, '61', '01', '04', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2817, '灞桥区', 3, '61', '01', '11', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2818, '未央区', 3, '61', '01', '12', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2819, '雁塔区', 3, '61', '01', '13', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2820, '阎良区', 3, '61', '01', '14', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2821, '临潼区', 3, '61', '01', '15', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2822, '长安区', 3, '61', '01', '16', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2823, '蓝田县', 3, '61', '01', '22', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2824, '周至县', 3, '61', '01', '24', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2825, '户县', 3, '61', '01', '25', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2826, '高陵县', 3, '61', '01', '26', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2827, '铜川市', 2, '61', '02', '00', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2828, '王益区', 3, '61', '02', '02', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2829, '印台区', 3, '61', '02', '03', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2830, '耀州区', 3, '61', '02', '04', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2831, '宜君县', 3, '61', '02', '22', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2832, '宝鸡市', 2, '61', '03', '00', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2833, '渭滨区', 3, '61', '03', '02', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2834, '金台区', 3, '61', '03', '03', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2835, '陈仓区', 3, '61', '03', '04', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2836, '凤翔县', 3, '61', '03', '22', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2837, '岐山县', 3, '61', '03', '23', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2838, '扶风县', 3, '61', '03', '24', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2839, '眉县', 3, '61', '03', '26', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2840, '陇县', 3, '61', '03', '27', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2841, '千阳县', 3, '61', '03', '28', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2842, '麟游县', 3, '61', '03', '29', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2843, '凤县', 3, '61', '03', '30', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2844, '太白县', 3, '61', '03', '31', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2845, '咸阳市', 2, '61', '04', '00', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2846, '秦都区', 3, '61', '04', '02', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2847, '杨陵区', 3, '61', '04', '03', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2848, '渭城区', 3, '61', '04', '04', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2849, '三原县', 3, '61', '04', '22', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2850, '泾阳县', 3, '61', '04', '23', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2851, '乾县', 3, '61', '04', '24', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2852, '礼泉县', 3, '61', '04', '25', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2853, '永寿县', 3, '61', '04', '26', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2854, '彬县', 3, '61', '04', '27', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2855, '长武县', 3, '61', '04', '28', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2856, '旬邑县', 3, '61', '04', '29', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2857, '淳化县', 3, '61', '04', '30', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2858, '武功县', 3, '61', '04', '31', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2859, '兴平市', 3, '61', '04', '81', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2860, '渭南市', 2, '61', '05', '00', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2861, '临渭区', 3, '61', '05', '02', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2862, '华县', 3, '61', '05', '21', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2863, '潼关县', 3, '61', '05', '22', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2864, '大荔县', 3, '61', '05', '23', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2865, '合阳县', 3, '61', '05', '24', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2866, '澄城县', 3, '61', '05', '25', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2867, '蒲城县', 3, '61', '05', '26', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2868, '白水县', 3, '61', '05', '27', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2869, '富平县', 3, '61', '05', '28', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2870, '韩城市', 3, '61', '05', '81', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2871, '华阴市', 3, '61', '05', '82', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2872, '延安市', 2, '61', '06', '00', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2873, '宝塔区', 3, '61', '06', '02', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2874, '延长县', 3, '61', '06', '21', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2875, '延川县', 3, '61', '06', '22', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2876, '子长县', 3, '61', '06', '23', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2877, '安塞县', 3, '61', '06', '24', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2878, '志丹县', 3, '61', '06', '25', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2879, '吴起县', 3, '61', '06', '26', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2880, '甘泉县', 3, '61', '06', '27', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2881, '富县', 3, '61', '06', '28', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2882, '洛川县', 3, '61', '06', '29', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2883, '宜川县', 3, '61', '06', '30', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2884, '黄龙县', 3, '61', '06', '31', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2885, '黄陵县', 3, '61', '06', '32', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2886, '汉中市', 2, '61', '07', '00', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2887, '汉台区', 3, '61', '07', '02', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2888, '南郑县', 3, '61', '07', '21', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2889, '城固县', 3, '61', '07', '22', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2890, '洋县', 3, '61', '07', '23', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2891, '西乡县', 3, '61', '07', '24', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2892, '勉县', 3, '61', '07', '25', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2893, '宁强县', 3, '61', '07', '26', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2894, '略阳县', 3, '61', '07', '27', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2895, '镇巴县', 3, '61', '07', '28', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2896, '留坝县', 3, '61', '07', '29', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2897, '佛坪县', 3, '61', '07', '30', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2898, '榆林市', 2, '61', '08', '00', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2899, '榆阳区', 3, '61', '08', '02', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2900, '神木县', 3, '61', '08', '21', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2901, '府谷县', 3, '61', '08', '22', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2902, '横山县', 3, '61', '08', '23', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2903, '靖边县', 3, '61', '08', '24', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2904, '定边县', 3, '61', '08', '25', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2905, '绥德县', 3, '61', '08', '26', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2906, '米脂县', 3, '61', '08', '27', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2907, '佳县', 3, '61', '08', '28', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2908, '吴堡县', 3, '61', '08', '29', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2909, '清涧县', 3, '61', '08', '30', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2910, '子洲县', 3, '61', '08', '31', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2911, '安康市', 2, '61', '09', '00', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2912, '汉滨区', 3, '61', '09', '02', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2913, '汉阴县', 3, '61', '09', '21', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2914, '石泉县', 3, '61', '09', '22', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2915, '宁陕县', 3, '61', '09', '23', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2916, '紫阳县', 3, '61', '09', '24', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2917, '岚皋县', 3, '61', '09', '25', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2918, '平利县', 3, '61', '09', '26', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2919, '镇坪县', 3, '61', '09', '27', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2920, '旬阳县', 3, '61', '09', '28', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2921, '白河县', 3, '61', '09', '29', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2922, '商洛市', 2, '61', '10', '00', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2923, '商州区', 3, '61', '10', '02', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2924, '洛南县', 3, '61', '10', '21', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2925, '丹凤县', 3, '61', '10', '22', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2926, '商南县', 3, '61', '10', '23', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2927, '山阳县', 3, '61', '10', '24', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2928, '镇安县', 3, '61', '10', '25', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2929, '柞水县', 3, '61', '10', '26', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2930, '甘肃省', 1, '62', '00', '00', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2931, '兰州市', 2, '62', '01', '00', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2932, '城关区', 3, '62', '01', '02', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2933, '七里河区', 3, '62', '01', '03', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2934, '西固区', 3, '62', '01', '04', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2935, '安宁区', 3, '62', '01', '05', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2936, '红古区', 3, '62', '01', '11', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2937, '永登县', 3, '62', '01', '21', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2938, '皋兰县', 3, '62', '01', '22', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2939, '榆中县', 3, '62', '01', '23', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2940, '嘉峪关市', 2, '62', '02', '00', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2941, '金昌市', 2, '62', '03', '00', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2942, '金川区', 3, '62', '03', '02', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2943, '永昌县', 3, '62', '03', '21', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2944, '白银市', 2, '62', '04', '00', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2945, '白银区', 3, '62', '04', '02', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2946, '平川区', 3, '62', '04', '03', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2947, '靖远县', 3, '62', '04', '21', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2948, '会宁县', 3, '62', '04', '22', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2949, '景泰县', 3, '62', '04', '23', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2950, '天水市', 2, '62', '05', '00', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2951, '秦州区', 3, '62', '05', '02', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2952, '麦积区', 3, '62', '05', '03', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2953, '清水县', 3, '62', '05', '21', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2954, '秦安县', 3, '62', '05', '22', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2955, '甘谷县', 3, '62', '05', '23', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2956, '武山县', 3, '62', '05', '24', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2957, '张家川回族自治县', 3, '62', '05', '25', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2958, '武威市', 2, '62', '06', '00', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2959, '凉州区', 3, '62', '06', '02', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2960, '民勤县', 3, '62', '06', '21', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2961, '古浪县', 3, '62', '06', '22', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2962, '天祝藏族自治县', 3, '62', '06', '23', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2963, '张掖市', 2, '62', '07', '00', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2964, '甘州区', 3, '62', '07', '02', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2965, '肃南裕固族自治县', 3, '62', '07', '21', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2966, '民乐县', 3, '62', '07', '22', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2967, '临泽县', 3, '62', '07', '23', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2968, '高台县', 3, '62', '07', '24', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2969, '山丹县', 3, '62', '07', '25', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2970, '平凉市', 2, '62', '08', '00', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2971, '崆峒区', 3, '62', '08', '02', 'K', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2972, '泾川县', 3, '62', '08', '21', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2973, '灵台县', 3, '62', '08', '22', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2974, '崇信县', 3, '62', '08', '23', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2975, '华亭县', 3, '62', '08', '24', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2976, '庄浪县', 3, '62', '08', '25', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2977, '静宁县', 3, '62', '08', '26', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2978, '酒泉市', 2, '62', '09', '00', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2979, '肃州区', 3, '62', '09', '02', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2980, '金塔县', 3, '62', '09', '21', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2981, '瓜州县', 3, '62', '09', '22', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2982, '肃北蒙古族自治县', 3, '62', '09', '23', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2983, '阿克塞哈萨克族自治县', 3, '62', '09', '24', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2984, '玉门市', 3, '62', '09', '81', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2985, '敦煌市', 3, '62', '09', '82', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2986, '庆阳市', 2, '62', '10', '00', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2987, '西峰区', 3, '62', '10', '02', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2988, '庆城县', 3, '62', '10', '21', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2989, '环县', 3, '62', '10', '22', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2990, '华池县', 3, '62', '10', '23', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2991, '合水县', 3, '62', '10', '24', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2992, '正宁县', 3, '62', '10', '25', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2993, '宁县', 3, '62', '10', '26', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2994, '镇原县', 3, '62', '10', '27', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2995, '定西市', 2, '62', '11', '00', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2996, '安定区', 3, '62', '11', '02', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2997, '通渭县', 3, '62', '11', '21', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2998, '陇西县', 3, '62', '11', '22', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (2999, '渭源县', 3, '62', '11', '23', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3000, '临洮县', 3, '62', '11', '24', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3001, '漳县', 3, '62', '11', '25', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3002, '岷县', 3, '62', '11', '26', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3003, '陇南市', 2, '62', '12', '00', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3004, '武都区', 3, '62', '12', '02', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3005, '成县', 3, '62', '12', '21', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3006, '文县', 3, '62', '12', '22', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3007, '宕昌县', 3, '62', '12', '23', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3008, '康县', 3, '62', '12', '24', 'K', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3009, '西和县', 3, '62', '12', '25', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3010, '礼县', 3, '62', '12', '26', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3011, '徽县', 3, '62', '12', '27', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3012, '两当县', 3, '62', '12', '28', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3013, '临夏回族自治州', 2, '62', '29', '00', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3014, '临夏市', 3, '62', '29', '01', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3015, '临夏县', 3, '62', '29', '21', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3016, '康乐县', 3, '62', '29', '22', 'K', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3017, '永靖县', 3, '62', '29', '23', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3018, '广河县', 3, '62', '29', '24', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3019, '和政县', 3, '62', '29', '25', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3020, '东乡族自治县', 3, '62', '29', '26', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3021, '积石山保安族东乡族撒拉族自治县', 3, '62', '29', '27', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3022, '甘南藏族自治州', 2, '62', '30', '00', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3023, '合作市', 3, '62', '30', '01', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3024, '临潭县', 3, '62', '30', '21', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3025, '卓尼县', 3, '62', '30', '22', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3026, '舟曲县', 3, '62', '30', '23', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3027, '迭部县', 3, '62', '30', '24', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3028, '玛曲县', 3, '62', '30', '25', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3029, '碌曲县', 3, '62', '30', '26', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3030, '夏河县', 3, '62', '30', '27', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3031, '青海省', 1, '63', '00', '00', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3032, '西宁市', 2, '63', '01', '00', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3033, '城东区', 3, '63', '01', '02', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3034, '城中区', 3, '63', '01', '03', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3035, '城西区', 3, '63', '01', '04', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3036, '城北区', 3, '63', '01', '05', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3037, '大通回族土族自治县', 3, '63', '01', '21', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3038, '湟中县', 3, '63', '01', '22', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3039, '湟源县', 3, '63', '01', '23', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3040, '海东市', 2, '63', '02', '00', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3041, '乐都区', 3, '63', '02', '02', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3042, '平安县', 3, '63', '02', '21', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3043, '民和回族土族自治县', 3, '63', '02', '22', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3044, '互助土族自治县', 3, '63', '02', '23', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3045, '化隆回族自治县', 3, '63', '02', '24', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3046, '循化撒拉族自治县', 3, '63', '02', '25', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3047, '海北藏族自治州', 2, '63', '22', '00', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3048, '门源回族自治县', 3, '63', '22', '21', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3049, '祁连县', 3, '63', '22', '22', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3050, '海晏县', 3, '63', '22', '23', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3051, '刚察县', 3, '63', '22', '24', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3052, '黄南藏族自治州', 2, '63', '23', '00', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3053, '同仁县', 3, '63', '23', '21', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3054, '尖扎县', 3, '63', '23', '22', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3055, '泽库县', 3, '63', '23', '23', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3056, '河南蒙古族自治县', 3, '63', '23', '24', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3057, '海南藏族自治州', 2, '63', '25', '00', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3058, '共和县', 3, '63', '25', '21', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3059, '同德县', 3, '63', '25', '22', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3060, '贵德县', 3, '63', '25', '23', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3061, '兴海县', 3, '63', '25', '24', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3062, '贵南县', 3, '63', '25', '25', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3063, '果洛藏族自治州', 2, '63', '26', '00', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3064, '玛沁县', 3, '63', '26', '21', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3065, '班玛县', 3, '63', '26', '22', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3066, '甘德县', 3, '63', '26', '23', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3067, '达日县', 3, '63', '26', '24', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3068, '久治县', 3, '63', '26', '25', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3069, '玛多县', 3, '63', '26', '26', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3070, '玉树藏族自治州', 2, '63', '27', '00', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3071, '玉树市', 3, '63', '27', '01', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3072, '杂多县', 3, '63', '27', '22', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3073, '称多县', 3, '63', '27', '23', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3074, '治多县', 3, '63', '27', '24', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3075, '囊谦县', 3, '63', '27', '25', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3076, '曲麻莱县', 3, '63', '27', '26', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3077, '海西蒙古族藏族自治州', 2, '63', '28', '00', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3078, '格尔木市', 3, '63', '28', '01', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3079, '德令哈市', 3, '63', '28', '02', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3080, '乌兰县', 3, '63', '28', '21', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3081, '都兰县', 3, '63', '28', '22', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3082, '天峻县', 3, '63', '28', '23', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3083, '宁夏回族自治区', 1, '64', '00', '00', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3084, '银川市', 2, '64', '01', '00', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3085, '兴庆区', 3, '64', '01', '04', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3086, '西夏区', 3, '64', '01', '05', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3087, '金凤区', 3, '64', '01', '06', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3088, '永宁县', 3, '64', '01', '21', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3089, '贺兰县', 3, '64', '01', '22', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3090, '灵武市', 3, '64', '01', '81', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3091, '石嘴山市', 2, '64', '02', '00', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3092, '大武口区', 3, '64', '02', '02', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3093, '惠农区', 3, '64', '02', '05', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3094, '平罗县', 3, '64', '02', '21', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3095, '吴忠市', 2, '64', '03', '00', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3096, '利通区', 3, '64', '03', '02', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3097, '红寺堡区', 3, '64', '03', '03', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3098, '盐池县', 3, '64', '03', '23', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3099, '同心县', 3, '64', '03', '24', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3100, '青铜峡市', 3, '64', '03', '81', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3101, '固原市', 2, '64', '04', '00', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3102, '原州区', 3, '64', '04', '02', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3103, '西吉县', 3, '64', '04', '22', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3104, '隆德县', 3, '64', '04', '23', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3105, '泾源县', 3, '64', '04', '24', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3106, '彭阳县', 3, '64', '04', '25', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3107, '中卫市', 2, '64', '05', '00', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3108, '沙坡头区', 3, '64', '05', '02', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3109, '中宁县', 3, '64', '05', '21', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3110, '海原县', 3, '64', '05', '22', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3111, '新疆维吾尔自治区', 1, '65', '00', '00', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3112, '乌鲁木齐市', 2, '65', '01', '00', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3113, '天山区', 3, '65', '01', '02', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3114, '沙依巴克区', 3, '65', '01', '03', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3115, '新市区', 3, '65', '01', '04', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3116, '水磨沟区', 3, '65', '01', '05', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3117, '头屯河区', 3, '65', '01', '06', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3118, '达坂城区', 3, '65', '01', '07', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3119, '米东区', 3, '65', '01', '09', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3120, '乌鲁木齐县', 3, '65', '01', '21', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3121, '克拉玛依市', 2, '65', '02', '00', 'K', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3122, '独山子区', 3, '65', '02', '02', 'D', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3123, '克拉玛依区', 3, '65', '02', '03', 'K', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3124, '白碱滩区', 3, '65', '02', '04', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3125, '乌尔禾区', 3, '65', '02', '05', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3126, '吐鲁番地区', 2, '65', '21', '00', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3127, '吐鲁番市', 3, '65', '21', '01', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3128, '鄯善县', 3, '65', '21', '22', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3129, '托克逊县', 3, '65', '21', '23', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3130, '哈密地区', 2, '65', '22', '00', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3131, '哈密市', 3, '65', '22', '01', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3132, '巴里坤哈萨克自治县', 3, '65', '22', '22', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3133, '伊吾县', 3, '65', '22', '23', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3134, '昌吉回族自治州', 2, '65', '23', '00', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3135, '昌吉市', 3, '65', '23', '01', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3136, '阜康市', 3, '65', '23', '02', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3137, '呼图壁县', 3, '65', '23', '23', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3138, '玛纳斯县', 3, '65', '23', '24', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3139, '奇台县', 3, '65', '23', '25', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3140, '吉木萨尔县', 3, '65', '23', '27', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3141, '木垒哈萨克自治县', 3, '65', '23', '28', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3142, '博尔塔拉蒙古自治州', 2, '65', '27', '00', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3143, '博乐市', 3, '65', '27', '01', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3144, '阿拉山口市', 3, '65', '27', '02', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3145, '精河县', 3, '65', '27', '22', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3146, '温泉县', 3, '65', '27', '23', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3147, '巴音郭楞蒙古自治州', 2, '65', '28', '00', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3148, '库尔勒市', 3, '65', '28', '01', 'K', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3149, '轮台县', 3, '65', '28', '22', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3150, '尉犁县', 3, '65', '28', '23', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3151, '若羌县', 3, '65', '28', '24', 'R', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3152, '且末县', 3, '65', '28', '25', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3153, '焉耆回族自治县', 3, '65', '28', '26', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3154, '和静县', 3, '65', '28', '27', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3155, '和硕县', 3, '65', '28', '28', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3156, '博湖县', 3, '65', '28', '29', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3157, '阿克苏地区', 2, '65', '29', '00', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3158, '阿克苏市', 3, '65', '29', '01', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3159, '温宿县', 3, '65', '29', '22', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3160, '库车县', 3, '65', '29', '23', 'K', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3161, '沙雅县', 3, '65', '29', '24', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3162, '新和县', 3, '65', '29', '25', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3163, '拜城县', 3, '65', '29', '26', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3164, '乌什县', 3, '65', '29', '27', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3165, '阿瓦提县', 3, '65', '29', '28', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3166, '柯坪县', 3, '65', '29', '29', 'K', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3167, '克孜勒苏柯尔克孜自治州', 2, '65', '30', '00', 'K', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3168, '阿图什市', 3, '65', '30', '01', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3169, '阿克陶县', 3, '65', '30', '22', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3170, '阿合奇县', 3, '65', '30', '23', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3171, '乌恰县', 3, '65', '30', '24', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3172, '喀什地区', 2, '65', '31', '00', 'K', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3173, '喀什市', 3, '65', '31', '01', 'K', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3174, '疏附县', 3, '65', '31', '21', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3175, '疏勒县', 3, '65', '31', '22', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3176, '英吉沙县', 3, '65', '31', '23', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3177, '泽普县', 3, '65', '31', '24', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3178, '莎车县', 3, '65', '31', '25', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3179, '叶城县', 3, '65', '31', '26', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3180, '麦盖提县', 3, '65', '31', '27', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3181, '岳普湖县', 3, '65', '31', '28', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3182, '伽师县', 3, '65', '31', '29', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3183, '巴楚县', 3, '65', '31', '30', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3184, '塔什库尔干塔吉克自治县', 3, '65', '31', '31', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3185, '和田地区', 2, '65', '32', '00', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3186, '和田市', 3, '65', '32', '01', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3187, '和田县', 3, '65', '32', '21', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3188, '墨玉县', 3, '65', '32', '22', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3189, '皮山县', 3, '65', '32', '23', 'P', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3190, '洛浦县', 3, '65', '32', '24', 'L', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3191, '策勒县', 3, '65', '32', '25', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3192, '于田县', 3, '65', '32', '26', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3193, '民丰县', 3, '65', '32', '27', 'M', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3194, '伊犁哈萨克自治州', 2, '65', '40', '00', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3195, '伊宁市', 3, '65', '40', '02', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3196, '奎屯市', 3, '65', '40', '03', 'K', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3197, '伊宁县', 3, '65', '40', '21', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3198, '察布查尔锡伯自治县', 3, '65', '40', '22', 'C', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3199, '霍城县', 3, '65', '40', '23', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3200, '巩留县', 3, '65', '40', '24', 'G', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3201, '新源县', 3, '65', '40', '25', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3202, '昭苏县', 3, '65', '40', '26', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3203, '特克斯县', 3, '65', '40', '27', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3204, '尼勒克县', 3, '65', '40', '28', 'N', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3205, '塔城地区', 2, '65', '42', '00', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3206, '塔城市', 3, '65', '42', '01', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3207, '乌苏市', 3, '65', '42', '02', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3208, '额敏县', 3, '65', '42', '21', 'E', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3209, '沙湾县', 3, '65', '42', '23', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3210, '托里县', 3, '65', '42', '24', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3211, '裕民县', 3, '65', '42', '25', 'Y', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3212, '和布克赛尔蒙古自治县', 3, '65', '42', '26', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3213, '阿勒泰地区', 2, '65', '43', '00', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3214, '阿勒泰市', 3, '65', '43', '01', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3215, '布尔津县', 3, '65', '43', '21', 'B', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3216, '富蕴县', 3, '65', '43', '22', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3217, '福海县', 3, '65', '43', '23', 'F', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3218, '哈巴河县', 3, '65', '43', '24', 'H', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3219, '青河县', 3, '65', '43', '25', 'Q', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3220, '吉木乃县', 3, '65', '43', '26', 'J', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3221, '自治区直辖县级行政区划', 2, '65', '90', '00', 'Z', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3222, '石河子市', 3, '65', '90', '01', 'S', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3223, '阿拉尔市', 3, '65', '90', '02', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3224, '图木舒克市', 3, '65', '90', '03', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3225, '五家渠市', 3, '65', '90', '04', 'W', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3226, '台湾省', 1, '71', '00', '00', 'T', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3227, '香港特别行政区', 1, '81', '00', '00', 'X', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);
INSERT INTO `province` VALUES (3228, '澳门特别行政区', 1, '82', '00', '00', 'A', '2019-08-14 16:51:54', 'system', '2019-08-14 16:51:54', 'system', 0);

-- ----------------------------
-- Table structure for replies
-- ----------------------------
DROP TABLE IF EXISTS `replies`;
CREATE TABLE `replies`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) NULL DEFAULT NULL COMMENT '评论id',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `target_user_id` int(11) NULL DEFAULT NULL COMMENT '目标id',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '回复内容',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `delete_flag` tinyint(1) NULL DEFAULT 0 COMMENT '删除标志（0-否；1-是）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '回复表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for report
-- ----------------------------
DROP TABLE IF EXISTS `report`;
CREATE TABLE `report`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NULL DEFAULT NULL COMMENT '举报类型（1-购票问题；2-信息勘误；3-其它问题）',
  `describe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '问题描述',
  `deal_result` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理结果',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `delete_flag` tinyint(1) NULL DEFAULT 0 COMMENT '删除标志（0-否；1-是）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '举报' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '测试表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES (1, 'A');
INSERT INTO `test` VALUES (2, 'B');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名（创建后不能修改）',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `signature` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '签名（在评论回复中显示）',
  `role` tinyint(4) NULL DEFAULT NULL COMMENT '角色（1-管理员；2-用户）',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `delete_flag` tinyint(1) NULL DEFAULT 0 COMMENT '删除标志（0-否；1-是）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_fans
-- ----------------------------
DROP TABLE IF EXISTS `user_fans`;
CREATE TABLE `user_fans`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户',
  `fans_id` int(11) NULL DEFAULT NULL COMMENT '粉丝',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_flag` tinyint(1) NULL DEFAULT 0 COMMENT '删除标志（0-否；1-是）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '粉丝表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
