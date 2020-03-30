/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : localhost:3306
 Source Schema         : blog

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 30/03/2020 11:59:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account_emailaddress
-- ----------------------------
DROP TABLE IF EXISTS `account_emailaddress`;
CREATE TABLE `account_emailaddress`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE,
  INDEX `account_emailaddress_user_id_2c513194_fk_oauth_ouser_id`(`user_id`) USING BTREE,
  CONSTRAINT `account_emailaddress_user_id_2c513194_fk_oauth_ouser_id` FOREIGN KEY (`user_id`) REFERENCES `oauth_ouser` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for account_emailconfirmation
-- ----------------------------
DROP TABLE IF EXISTS `account_emailconfirmation`;
CREATE TABLE `account_emailconfirmation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(0) NULL,
  `sent` datetime(0) NULL DEFAULT NULL,
  `key` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email_address_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `key`(`key`) USING BTREE,
  INDEX `account_emailconfirmation_email_address_id_5b7f8c58_fk`(`email_address_id`) USING BTREE,
  CONSTRAINT `account_emailconfirmation_email_address_id_5b7f8c58_fk` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 79 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (5, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (8, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (9, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (10, 'Can add content type', 4, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (11, 'Can change content type', 4, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (12, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (13, 'Can add session', 5, 'add_session');
INSERT INTO `auth_permission` VALUES (14, 'Can change session', 5, 'change_session');
INSERT INTO `auth_permission` VALUES (15, 'Can delete session', 5, 'delete_session');
INSERT INTO `auth_permission` VALUES (16, 'Can add 文章', 6, 'add_article');
INSERT INTO `auth_permission` VALUES (17, 'Can change 文章', 6, 'change_article');
INSERT INTO `auth_permission` VALUES (18, 'Can delete 文章', 6, 'delete_article');
INSERT INTO `auth_permission` VALUES (19, 'Can add 图片轮播', 7, 'add_carousel');
INSERT INTO `auth_permission` VALUES (20, 'Can change 图片轮播', 7, 'change_carousel');
INSERT INTO `auth_permission` VALUES (21, 'Can delete 图片轮播', 7, 'delete_carousel');
INSERT INTO `auth_permission` VALUES (22, 'Can add 分类', 8, 'add_category');
INSERT INTO `auth_permission` VALUES (23, 'Can change 分类', 8, 'change_category');
INSERT INTO `auth_permission` VALUES (24, 'Can delete 分类', 8, 'delete_category');
INSERT INTO `auth_permission` VALUES (25, 'Can add 友情链接', 9, 'add_friendlink');
INSERT INTO `auth_permission` VALUES (26, 'Can change 友情链接', 9, 'change_friendlink');
INSERT INTO `auth_permission` VALUES (27, 'Can delete 友情链接', 9, 'delete_friendlink');
INSERT INTO `auth_permission` VALUES (28, 'Can add 关键词', 10, 'add_keyword');
INSERT INTO `auth_permission` VALUES (29, 'Can change 关键词', 10, 'change_keyword');
INSERT INTO `auth_permission` VALUES (30, 'Can delete 关键词', 10, 'delete_keyword');
INSERT INTO `auth_permission` VALUES (31, 'Can add 死链', 11, 'add_silian');
INSERT INTO `auth_permission` VALUES (32, 'Can change 死链', 11, 'change_silian');
INSERT INTO `auth_permission` VALUES (33, 'Can delete 死链', 11, 'delete_silian');
INSERT INTO `auth_permission` VALUES (34, 'Can add 标签', 12, 'add_tag');
INSERT INTO `auth_permission` VALUES (35, 'Can change 标签', 12, 'change_tag');
INSERT INTO `auth_permission` VALUES (36, 'Can delete 标签', 12, 'delete_tag');
INSERT INTO `auth_permission` VALUES (37, 'Can add 时间线', 13, 'add_timeline');
INSERT INTO `auth_permission` VALUES (38, 'Can change 时间线', 13, 'change_timeline');
INSERT INTO `auth_permission` VALUES (39, 'Can delete 时间线', 13, 'delete_timeline');
INSERT INTO `auth_permission` VALUES (40, 'Can add 大分类', 14, 'add_bigcategory');
INSERT INTO `auth_permission` VALUES (41, 'Can change 大分类', 14, 'change_bigcategory');
INSERT INTO `auth_permission` VALUES (42, 'Can delete 大分类', 14, 'delete_bigcategory');
INSERT INTO `auth_permission` VALUES (43, 'Can add 用户', 15, 'add_ouser');
INSERT INTO `auth_permission` VALUES (44, 'Can change 用户', 15, 'change_ouser');
INSERT INTO `auth_permission` VALUES (45, 'Can delete 用户', 15, 'delete_ouser');
INSERT INTO `auth_permission` VALUES (46, 'Can add 关于自己评论', 16, 'add_aboutcomment');
INSERT INTO `auth_permission` VALUES (47, 'Can change 关于自己评论', 16, 'change_aboutcomment');
INSERT INTO `auth_permission` VALUES (48, 'Can delete 关于自己评论', 16, 'delete_aboutcomment');
INSERT INTO `auth_permission` VALUES (49, 'Can add 文章评论', 17, 'add_articlecomment');
INSERT INTO `auth_permission` VALUES (50, 'Can change 文章评论', 17, 'change_articlecomment');
INSERT INTO `auth_permission` VALUES (51, 'Can delete 文章评论', 17, 'delete_articlecomment');
INSERT INTO `auth_permission` VALUES (52, 'Can add comment user', 18, 'add_commentuser');
INSERT INTO `auth_permission` VALUES (53, 'Can change comment user', 18, 'change_commentuser');
INSERT INTO `auth_permission` VALUES (54, 'Can delete comment user', 18, 'delete_commentuser');
INSERT INTO `auth_permission` VALUES (55, 'Can add 给我留言', 19, 'add_messagecomment');
INSERT INTO `auth_permission` VALUES (56, 'Can change 给我留言', 19, 'change_messagecomment');
INSERT INTO `auth_permission` VALUES (57, 'Can delete 给我留言', 19, 'delete_messagecomment');
INSERT INTO `auth_permission` VALUES (58, 'Can add site', 20, 'add_site');
INSERT INTO `auth_permission` VALUES (59, 'Can change site', 20, 'change_site');
INSERT INTO `auth_permission` VALUES (60, 'Can delete site', 20, 'delete_site');
INSERT INTO `auth_permission` VALUES (61, 'Can add email address', 21, 'add_emailaddress');
INSERT INTO `auth_permission` VALUES (62, 'Can change email address', 21, 'change_emailaddress');
INSERT INTO `auth_permission` VALUES (63, 'Can delete email address', 21, 'delete_emailaddress');
INSERT INTO `auth_permission` VALUES (64, 'Can add email confirmation', 22, 'add_emailconfirmation');
INSERT INTO `auth_permission` VALUES (65, 'Can change email confirmation', 22, 'change_emailconfirmation');
INSERT INTO `auth_permission` VALUES (66, 'Can delete email confirmation', 22, 'delete_emailconfirmation');
INSERT INTO `auth_permission` VALUES (67, 'Can add social account', 23, 'add_socialaccount');
INSERT INTO `auth_permission` VALUES (68, 'Can change social account', 23, 'change_socialaccount');
INSERT INTO `auth_permission` VALUES (69, 'Can delete social account', 23, 'delete_socialaccount');
INSERT INTO `auth_permission` VALUES (70, 'Can add social application', 24, 'add_socialapp');
INSERT INTO `auth_permission` VALUES (71, 'Can change social application', 24, 'change_socialapp');
INSERT INTO `auth_permission` VALUES (72, 'Can delete social application', 24, 'delete_socialapp');
INSERT INTO `auth_permission` VALUES (73, 'Can add social application token', 25, 'add_socialtoken');
INSERT INTO `auth_permission` VALUES (74, 'Can change social application token', 25, 'change_socialtoken');
INSERT INTO `auth_permission` VALUES (75, 'Can delete social application token', 25, 'delete_socialtoken');
INSERT INTO `auth_permission` VALUES (76, 'Can add 公告', 26, 'add_activate');
INSERT INTO `auth_permission` VALUES (77, 'Can change 公告', 26, 'change_activate');
INSERT INTO `auth_permission` VALUES (78, 'Can delete 公告', 26, 'delete_activate');

-- ----------------------------
-- Table structure for comment_aboutcomment
-- ----------------------------
DROP TABLE IF EXISTS `comment_aboutcomment`;
CREATE TABLE `comment_aboutcomment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_date` datetime(0) NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `author_id` int(11) NOT NULL,
  `parent_id` int(11) NULL DEFAULT NULL,
  `rep_to_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `comment_aboutcomment_author_id_d11e841e_fk_comment_c`(`author_id`) USING BTREE,
  INDEX `comment_aboutcomment_parent_id_a12294ac_fk_comment_a`(`parent_id`) USING BTREE,
  INDEX `comment_aboutcomment_rep_to_id_e44ab5ad_fk_comment_a`(`rep_to_id`) USING BTREE,
  CONSTRAINT `comment_aboutcomment_author_id_d11e841e_fk_comment_c` FOREIGN KEY (`author_id`) REFERENCES `comment_commentuser` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comment_aboutcomment_parent_id_a12294ac_fk_comment_a` FOREIGN KEY (`parent_id`) REFERENCES `comment_aboutcomment` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comment_aboutcomment_rep_to_id_e44ab5ad_fk_comment_a` FOREIGN KEY (`rep_to_id`) REFERENCES `comment_aboutcomment` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment_aboutcomment
-- ----------------------------
INSERT INTO `comment_aboutcomment` VALUES (1, '2019-03-02 23:40:04', 'dfdf ', 12, NULL, NULL);
INSERT INTO `comment_aboutcomment` VALUES (2, '2019-03-02 23:45:45', 'efefe', 23, NULL, NULL);

-- ----------------------------
-- Table structure for comment_articlecomment
-- ----------------------------
DROP TABLE IF EXISTS `comment_articlecomment`;
CREATE TABLE `comment_articlecomment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_date` datetime(0) NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `author_id` int(11) NOT NULL,
  `belong_id` int(11) NOT NULL,
  `parent_id` int(11) NULL DEFAULT NULL,
  `rep_to_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `comment_articlecomme_author_id_46e6fdb8_fk_comment_c`(`author_id`) USING BTREE,
  INDEX `comment_articlecomment_belong_id_58e0232c_fk_storm_article_id`(`belong_id`) USING BTREE,
  INDEX `comment_articlecomme_parent_id_f0ab594d_fk_comment_a`(`parent_id`) USING BTREE,
  INDEX `comment_articlecomme_rep_to_id_84dab3d5_fk_comment_a`(`rep_to_id`) USING BTREE,
  CONSTRAINT `comment_articlecomme_author_id_46e6fdb8_fk_comment_c` FOREIGN KEY (`author_id`) REFERENCES `comment_commentuser` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comment_articlecomme_parent_id_f0ab594d_fk_comment_a` FOREIGN KEY (`parent_id`) REFERENCES `comment_articlecomment` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comment_articlecomme_rep_to_id_84dab3d5_fk_comment_a` FOREIGN KEY (`rep_to_id`) REFERENCES `comment_articlecomment` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comment_articlecomment_belong_id_58e0232c_fk_storm_article_id` FOREIGN KEY (`belong_id`) REFERENCES `storm_article` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment_articlecomment
-- ----------------------------
INSERT INTO `comment_articlecomment` VALUES (1, '2019-03-02 17:21:14', '气味芬芳', 12, 1, NULL, NULL);
INSERT INTO `comment_articlecomment` VALUES (2, '2019-03-02 17:26:46', '肥肥的', 13, 1, NULL, NULL);
INSERT INTO `comment_articlecomment` VALUES (3, '2019-03-02 17:27:05', '的方式发送', 13, 1, 1, NULL);
INSERT INTO `comment_articlecomment` VALUES (4, '2019-03-02 17:27:43', '放热峰', 13, 1, 3, NULL);
INSERT INTO `comment_articlecomment` VALUES (5, '2019-03-02 17:28:07', '粉色分', 13, 1, 3, NULL);
INSERT INTO `comment_articlecomment` VALUES (6, '2019-03-02 17:28:45', '发射点发生', 12, 1, 4, NULL);
INSERT INTO `comment_articlecomment` VALUES (7, '2019-03-02 17:33:51', '放松放松v发', 14, 1, NULL, NULL);
INSERT INTO `comment_articlecomment` VALUES (8, '2019-03-02 17:48:12', '分分分', 12, 1, NULL, NULL);
INSERT INTO `comment_articlecomment` VALUES (9, '2019-03-02 17:49:50', '分分', 12, 1, 3, NULL);
INSERT INTO `comment_articlecomment` VALUES (10, '2019-03-02 17:50:10', '为非人防', 12, 1, NULL, NULL);
INSERT INTO `comment_articlecomment` VALUES (11, '2019-03-02 17:51:08', '哥特人感染', 12, 1, NULL, NULL);
INSERT INTO `comment_articlecomment` VALUES (12, '2019-03-02 18:00:07', '哈哈哈哈哈', 12, 1, NULL, NULL);
INSERT INTO `comment_articlecomment` VALUES (13, '2019-03-02 18:00:26', '就哈哈哈哈哈', 12, 1, 3, NULL);
INSERT INTO `comment_articlecomment` VALUES (14, '2019-03-02 18:06:10', '江河湖海你就回家', 18, 1, NULL, NULL);
INSERT INTO `comment_articlecomment` VALUES (15, '2019-03-02 18:09:49', '德尔福', 19, 1, NULL, NULL);
INSERT INTO `comment_articlecomment` VALUES (16, '2019-03-02 18:10:25', '的额', 12, 1, NULL, NULL);
INSERT INTO `comment_articlecomment` VALUES (17, '2019-03-02 18:18:14', 'de\'d', 21, 1, NULL, NULL);
INSERT INTO `comment_articlecomment` VALUES (18, '2019-03-02 18:20:19', '放热峰乳房', 22, 1, NULL, NULL);
INSERT INTO `comment_articlecomment` VALUES (19, '2019-03-02 18:20:37', '沟通', 22, 1, NULL, NULL);

-- ----------------------------
-- Table structure for comment_commentuser
-- ----------------------------
DROP TABLE IF EXISTS `comment_commentuser`;
CREATE TABLE `comment_commentuser`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment_commentuser
-- ----------------------------
INSERT INTO `comment_commentuser` VALUES (1, 'stor', '1414749109@qq.com', '');
INSERT INTO `comment_commentuser` VALUES (3, '的', '1414749109@qq.com', '');
INSERT INTO `comment_commentuser` VALUES (4, '打算', '1414749109@qq.com', '');
INSERT INTO `comment_commentuser` VALUES (5, '额为全额', '1414749109@qq.com', '');
INSERT INTO `comment_commentuser` VALUES (6, '热热给', '1414749109@qq.com', '');
INSERT INTO `comment_commentuser` VALUES (7, '对的', '1414749109@qq.com', '');
INSERT INTO `comment_commentuser` VALUES (8, 'ff', '1414749109@qq.com', '');
INSERT INTO `comment_commentuser` VALUES (9, 'fref', '1414749109@qq.com', '');
INSERT INTO `comment_commentuser` VALUES (10, '得分', '1414749109@qq.com', '');
INSERT INTO `comment_commentuser` VALUES (11, '威威', '1414749109@qq.com', '');
INSERT INTO `comment_commentuser` VALUES (12, 'createsuperuser', '1414749109@qq.com', '');
INSERT INTO `comment_commentuser` VALUES (13, 'stor的', '1414749109@qq.com', '');
INSERT INTO `comment_commentuser` VALUES (14, '		方法					', '1414749109@qq.com', 'http://127.0.0.1:8080/article/123/');
INSERT INTO `comment_commentuser` VALUES (18, 'hhhh', '1414749109@qq.com', '');
INSERT INTO `comment_commentuser` VALUES (19, 'h\'h\'h', '1414749109@qq.com', '');
INSERT INTO `comment_commentuser` VALUES (20, '', '', '');
INSERT INTO `comment_commentuser` VALUES (21, '3e\'d', '1414749109@qq.com', '');
INSERT INTO `comment_commentuser` VALUES (22, 'de\'f', '1414749109@qq.com', '');
INSERT INTO `comment_commentuser` VALUES (23, 'creat', '1414749109@qq.com', '');
INSERT INTO `comment_commentuser` VALUES (24, 'admin', '100@163.com', '');

-- ----------------------------
-- Table structure for comment_messagecomment
-- ----------------------------
DROP TABLE IF EXISTS `comment_messagecomment`;
CREATE TABLE `comment_messagecomment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_date` datetime(0) NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `author_id` int(11) NOT NULL,
  `parent_id` int(11) NULL DEFAULT NULL,
  `rep_to_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `comment_messagecomme_author_id_0bb97e6c_fk_comment_c`(`author_id`) USING BTREE,
  INDEX `comment_messagecomme_parent_id_d4633983_fk_comment_m`(`parent_id`) USING BTREE,
  INDEX `comment_messagecomme_rep_to_id_029597ed_fk_comment_m`(`rep_to_id`) USING BTREE,
  CONSTRAINT `comment_messagecomme_author_id_0bb97e6c_fk_comment_c` FOREIGN KEY (`author_id`) REFERENCES `comment_commentuser` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comment_messagecomme_parent_id_d4633983_fk_comment_m` FOREIGN KEY (`parent_id`) REFERENCES `comment_messagecomment` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comment_messagecomme_rep_to_id_029597ed_fk_comment_m` FOREIGN KEY (`rep_to_id`) REFERENCES `comment_messagecomment` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment_messagecomment
-- ----------------------------
INSERT INTO `comment_messagecomment` VALUES (1, '2019-02-27 23:57:34', '顶顶顶顶', 1, NULL, NULL);
INSERT INTO `comment_messagecomment` VALUES (2, '2019-02-28 00:02:50', '低端市场', 3, NULL, NULL);
INSERT INTO `comment_messagecomment` VALUES (3, '2019-02-28 00:05:37', '第三党', 4, NULL, NULL);
INSERT INTO `comment_messagecomment` VALUES (4, '2019-02-28 00:06:10', 'e二五v', 4, NULL, NULL);
INSERT INTO `comment_messagecomment` VALUES (5, '2019-02-28 00:07:13', '而维持', 5, NULL, NULL);
INSERT INTO `comment_messagecomment` VALUES (6, '2019-02-28 00:11:39', '割让给外人', 5, NULL, NULL);
INSERT INTO `comment_messagecomment` VALUES (7, '2019-02-28 00:11:58', '非人非如果', 5, NULL, NULL);
INSERT INTO `comment_messagecomment` VALUES (8, '2019-02-28 00:12:26', '微微发热', 6, NULL, NULL);
INSERT INTO `comment_messagecomment` VALUES (9, '2019-02-28 00:13:38', '的的额斐然斐然斐然', 7, NULL, NULL);
INSERT INTO `comment_messagecomment` VALUES (10, '2019-02-28 00:14:03', '四点三十大风车是的', 7, NULL, NULL);
INSERT INTO `comment_messagecomment` VALUES (11, '2019-02-28 00:27:54', 'fds ', 8, NULL, NULL);
INSERT INTO `comment_messagecomment` VALUES (12, '2019-02-28 00:31:25', 'defef', 9, NULL, NULL);
INSERT INTO `comment_messagecomment` VALUES (13, '2019-02-28 00:36:57', '的vv发v旅人', 10, NULL, NULL);
INSERT INTO `comment_messagecomment` VALUES (14, '2019-02-28 00:37:26', '二点五v威威v', 10, NULL, NULL);
INSERT INTO `comment_messagecomment` VALUES (15, '2019-02-28 00:37:57', '热热范围', 11, NULL, NULL);

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(0) NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_oauth_ouser_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_oauth_ouser_id` FOREIGN KEY (`user_id`) REFERENCES `oauth_ouser` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (1, '2019-03-02 14:12:49', '1', 'python', 1, '[{\"added\": {}}]', 8, 4);
INSERT INTO `django_admin_log` VALUES (2, '2019-03-02 14:16:02', '1', 'python', 1, '[{\"added\": {}}]', 12, 4);
INSERT INTO `django_admin_log` VALUES (3, '2019-03-02 14:17:30', '1', 'python', 1, '[{\"added\": {}}]', 10, 4);
INSERT INTO `django_admin_log` VALUES (4, '2019-03-02 14:18:07', '1', '创建Python虚拟环境——下', 1, '[{\"added\": {}}]', 6, 4);
INSERT INTO `django_admin_log` VALUES (5, '2019-03-02 15:21:45', '1', 'Python爬虫学习系列教程', 1, '[{\"added\": {}}]', 7, 4);
INSERT INTO `django_admin_log` VALUES (6, '2019-03-02 15:22:49', '2', '小白学爬虫系列教程', 1, '[{\"added\": {}}]', 7, 4);
INSERT INTO `django_admin_log` VALUES (7, '2019-03-02 15:50:00', '1', 'Python爬虫学习系列教程', 2, '[{\"changed\": {\"fields\": [\"number\"]}}]', 7, 4);
INSERT INTO `django_admin_log` VALUES (8, '2019-03-02 15:50:17', '2', '小白学爬虫系列教程', 2, '[{\"changed\": {\"fields\": [\"number\"]}}]', 7, 4);
INSERT INTO `django_admin_log` VALUES (9, '2020-03-26 18:00:42', '12', '这是第一个文章', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (10, '2020-03-26 23:21:20', '13', 'Pycharm编译器使用小技巧（不定期更', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (11, '2020-03-26 23:22:21', '12', '这是第一个文章', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (12, '2020-03-26 23:40:10', '14', 'Django Restfarmwork ', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (13, '2020-03-26 23:41:22', '14', 'Django Restfarmwork ', 2, '[{\"changed\": {\"fields\": [\"img_link\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (14, '2020-03-26 23:44:56', '14', 'Django Restfarmwork ', 2, '[{\"changed\": {\"fields\": [\"img_link\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (15, '2020-03-26 23:45:42', '14', 'Django Restfarmwork ', 2, '[{\"changed\": {\"fields\": [\"img_link\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (16, '2020-03-27 00:01:36', '8', 'lufei', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (17, '2020-03-27 00:02:31', '3', '小白学爬虫系列教程', 3, '', 7, 1);
INSERT INTO `django_admin_log` VALUES (18, '2020-03-27 00:02:55', '8', 'lufei', 3, '', 7, 1);
INSERT INTO `django_admin_log` VALUES (19, '2020-03-27 22:34:56', '2', 'MySQL', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (20, '2020-03-27 22:36:12', '2', 'MySQL', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (21, '2020-03-27 22:36:59', '2', 'MySQL', 2, '[{\"changed\": {\"fields\": [\"slug\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (22, '2020-03-27 22:37:13', '1', 'Python', 2, '[{\"changed\": {\"fields\": [\"name\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (23, '2020-03-28 23:28:39', '3', 'Linux', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (24, '2020-03-28 23:29:07', '15', 'Ubuntu 常用解压与压缩命令', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (25, '2020-03-28 23:29:40', '14', 'Django Restfarmwork ', 2, '[{\"changed\": {\"fields\": [\"img_link\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (26, '2020-03-28 23:31:05', '11', '创建Python虚拟环境——下', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (27, '2020-03-28 23:31:05', '10', '创建Python虚拟环境——下', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (28, '2020-03-28 23:31:05', '9', '创建Python虚拟环境——下', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (29, '2020-03-28 23:31:05', '8', '创建Python虚拟环境——下', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (30, '2020-03-28 23:31:05', '7', '创建Python虚拟环境——下', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (31, '2020-03-28 23:31:05', '6', '创建Python虚拟环境——下', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (32, '2020-03-28 23:31:05', '5', '创建Python虚拟环境——下', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (33, '2020-03-28 23:31:05', '4', '创建Python虚拟环境——下', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (34, '2020-03-28 23:31:05', '3', '创建Python虚拟环境——下', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (35, '2020-03-28 23:31:05', '2', '创建Python虚拟环境——下', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (36, '2020-03-28 23:32:33', '3', 'Linux', 2, '[{\"changed\": {\"fields\": [\"slug\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (37, '2020-03-29 22:25:44', '16', 'ubuntu安装python3.7，并更', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (38, '2020-03-29 22:29:07', '17', '如何将本地文件通过终端上传到linux服', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (39, '2020-03-29 22:32:27', '17', '如何将本地文件通过终端上传到linux服', 2, '[{\"changed\": {\"fields\": [\"body\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (40, '2020-03-29 22:33:20', '17', '如何将本地文件通过终端上传到linux服', 2, '[{\"changed\": {\"fields\": [\"body\"]}}]', 6, 1);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (21, 'account', 'emailaddress');
INSERT INTO `django_content_type` VALUES (22, 'account', 'emailconfirmation');
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (16, 'comment', 'aboutcomment');
INSERT INTO `django_content_type` VALUES (17, 'comment', 'articlecomment');
INSERT INTO `django_content_type` VALUES (18, 'comment', 'commentuser');
INSERT INTO `django_content_type` VALUES (19, 'comment', 'messagecomment');
INSERT INTO `django_content_type` VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (15, 'oauth', 'ouser');
INSERT INTO `django_content_type` VALUES (5, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (20, 'sites', 'site');
INSERT INTO `django_content_type` VALUES (23, 'socialaccount', 'socialaccount');
INSERT INTO `django_content_type` VALUES (24, 'socialaccount', 'socialapp');
INSERT INTO `django_content_type` VALUES (25, 'socialaccount', 'socialtoken');
INSERT INTO `django_content_type` VALUES (26, 'storm', 'activate');
INSERT INTO `django_content_type` VALUES (6, 'storm', 'article');
INSERT INTO `django_content_type` VALUES (14, 'storm', 'bigcategory');
INSERT INTO `django_content_type` VALUES (7, 'storm', 'carousel');
INSERT INTO `django_content_type` VALUES (8, 'storm', 'category');
INSERT INTO `django_content_type` VALUES (9, 'storm', 'friendlink');
INSERT INTO `django_content_type` VALUES (10, 'storm', 'keyword');
INSERT INTO `django_content_type` VALUES (11, 'storm', 'silian');
INSERT INTO `django_content_type` VALUES (12, 'storm', 'tag');
INSERT INTO `django_content_type` VALUES (13, 'storm', 'timeline');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(0) NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2019-02-27 23:56:14');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2019-02-27 23:56:15');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2019-02-27 23:56:16');
INSERT INTO `django_migrations` VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2019-02-27 23:56:16');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0003_alter_user_email_max_length', '2019-02-27 23:56:16');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0004_alter_user_username_opts', '2019-02-27 23:56:16');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0005_alter_user_last_login_null', '2019-02-27 23:56:16');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0006_require_contenttypes_0002', '2019-02-27 23:56:16');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2019-02-27 23:56:16');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0008_alter_user_username_max_length', '2019-02-27 23:56:16');
INSERT INTO `django_migrations` VALUES (11, 'oauth', '0001_initial', '2019-02-27 23:56:18');
INSERT INTO `django_migrations` VALUES (12, 'account', '0001_initial', '2019-02-27 23:56:18');
INSERT INTO `django_migrations` VALUES (13, 'account', '0002_email_max_length', '2019-02-27 23:56:19');
INSERT INTO `django_migrations` VALUES (14, 'admin', '0001_initial', '2019-02-27 23:56:19');
INSERT INTO `django_migrations` VALUES (15, 'admin', '0002_logentry_remove_auto_add', '2019-02-27 23:56:19');
INSERT INTO `django_migrations` VALUES (16, 'storm', '0001_initial', '2019-02-27 23:56:22');
INSERT INTO `django_migrations` VALUES (17, 'storm', '0002_islove', '2019-02-27 23:56:22');
INSERT INTO `django_migrations` VALUES (18, 'storm', '0003_auto_20190224_1541', '2019-02-27 23:56:23');
INSERT INTO `django_migrations` VALUES (19, 'storm', '0004_auto_20190224_1931', '2019-02-27 23:56:23');
INSERT INTO `django_migrations` VALUES (20, 'storm', '0005_auto_20190225_2105', '2019-02-27 23:56:23');
INSERT INTO `django_migrations` VALUES (21, 'storm', '0006_auto_20190225_2108', '2019-02-27 23:56:24');
INSERT INTO `django_migrations` VALUES (22, 'storm', '0007_auto_20190225_2117', '2019-02-27 23:56:25');
INSERT INTO `django_migrations` VALUES (23, 'storm', '0008_auto_20190225_2118', '2019-02-27 23:56:25');
INSERT INTO `django_migrations` VALUES (24, 'storm', '0009_auto_20190225_2123', '2019-02-27 23:56:26');
INSERT INTO `django_migrations` VALUES (25, 'comment', '0001_initial', '2019-02-27 23:56:30');
INSERT INTO `django_migrations` VALUES (26, 'sessions', '0001_initial', '2019-02-27 23:56:30');
INSERT INTO `django_migrations` VALUES (27, 'sites', '0001_initial', '2019-02-27 23:56:30');
INSERT INTO `django_migrations` VALUES (28, 'sites', '0002_alter_domain_unique', '2019-02-27 23:56:30');
INSERT INTO `django_migrations` VALUES (29, 'socialaccount', '0001_initial', '2019-02-27 23:56:32');
INSERT INTO `django_migrations` VALUES (30, 'socialaccount', '0002_token_max_lengths', '2019-02-27 23:56:33');
INSERT INTO `django_migrations` VALUES (31, 'socialaccount', '0003_extra_data_default_dict', '2019-02-27 23:56:33');
INSERT INTO `django_migrations` VALUES (32, 'storm', '0010_activate', '2019-03-01 00:52:42');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(0) NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('3wsc6krx3rz7ilxy1xvfqec717dqvtj0', 'YWYxZDA1YzFiMjllOTYwOGU2ZDYwOGUyMzI1NTI3MGI5YTYxZTFjYjp7InVzZXJuYW1lIjoiYXNkZmdoIiwiX2F1dGhfdXNlcl9pZCI6IjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjVjNWM5MDgwNTEyNjFiMmRkMGY0ZmJjOTczMTBiZTU1NzU2MDViNWIifQ==', '2019-03-16 00:26:58');
INSERT INTO `django_session` VALUES ('b78k09ji2epez6puu791krmla2djzecn', 'MGJjOWFhNmNmMDFiZjY3ZmNjNjdjM2JkMzg2MDE0OWZjY2Y5ZTIzNjp7ImlzX3JlYWRfMSI6MTU1MTU5ODI4MC43MjYxOTI1LCJfYXV0aF91c2VyX2lkIjoiNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDUzMzc5ZTU2OWZkNzZmNWI0MTA5YzZiMGRiYjU4OGFiNzEyYzRiMSIsIm5pY2siOiJjcmVhdCIsInRpZCI6MjN9', '2019-03-17 15:31:20');
INSERT INTO `django_session` VALUES ('oaua1waqtm0mgimsp3s80chnxy3w4rck', 'MDczYTkyZDg4OWRjNWM5NzhhZjI3YTJjOTFlNmZmOTk4NDkxMjQxYzp7ImlzX3JlYWRfMSI6MTU1MTUzMDY4Ni44MzMwNTl9', '2019-03-16 20:44:47');
INSERT INTO `django_session` VALUES ('oq8oj0rh7tw4cakb8ctzdhq4uck1mkwy', 'MWQ5YTRjNTRlM2UwZDE3ZDcyMWNjN2YyMDYzNDVhODM0NTI0NTk4ZTp7ImlzX3JlYWRfMSI6MTU1MTYxNjEwMC40MzQ1MDgsImlzX3JlYWRfNiI6MTU1MTYxNjEyMC43NDYxNzIyLCJpc19yZWFkXzMiOjE1NTE2MTgyNDIuMzU5NDg5NywibmljayI6Ilx1NWY5N1x1NTIwNiIsInRpZCI6MTB9', '2019-03-17 21:04:02');
INSERT INTO `django_session` VALUES ('qw2y9tgt61k93fpvwx7zqj69yhg2wec1', 'NmZkNDE0YmVlMDk5NWI0MWE1MDYxNGYxNGQ0ODI1ZDBhZjkwOWMzYTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkNTMzNzllNTY5ZmQ3NmY1YjQxMDljNmIwZGJiNTg4YWI3MTJjNGIxIiwidXNlcm5hbWUiOiJjcmVhdGVzdXBlcnVzZXIiLCJ1aWQiOjQsIm5pY2siOm51bGwsInRpZCI6bnVsbCwiaXNfcmVhZF8xIjoxNTUxNjk0OTU0LjIxMDk3MDJ9', '2019-03-18 18:22:34');
INSERT INTO `django_session` VALUES ('t4d2m6tfq5soo4si2din95s5iqhn90ys', 'YWI2NTUzNDhhZTgwYmEwODE0N2YzZWM2N2QyNDUyYjYzMDdmM2M1NTp7ImlzX3JlYWRfMSI6MTU1MTYxNTc1My4wNjE0NTE3LCJpc19yZWFkXzQiOjE1NTE2MTU3NjMuNzE3NDgxMSwiaXNfcmVhZF82IjoxNTUxNjE1ODM1LjI2Mzk5Nzh9', '2019-03-17 20:23:55');
INSERT INTO `django_session` VALUES ('uvmoj2y29brddcp6xt2vieh781a27om6', 'NWRjMzZjZTNmY2M3M2FmMzFiYWYwODhlNzUzMmU2MGQwZWM2NTRhMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlNGJjNjhiOTZkMDQ0YzBkZGE1MmIwMGY1MWFkYzUwOWE4NWVmNzE3IiwiaXNfcmVhZF8xMyI6MTU4NTIzNjA5Ny42MzcyOSwiaXNfcmVhZF8xNCI6MTU4NTI4NDk2My42NjQyOTc4LCJpc19yZWFkXzE2IjoxNTg1NDkxOTY1LjM4MTA3NywiaXNfcmVhZF8xNyI6MTU4NTQ5MjE1Ni40MDU5MjEyfQ==', '2020-04-12 22:29:16');
INSERT INTO `django_session` VALUES ('uw0xjg2rhi2flcvaw1ntkwtmgosqthbk', 'Y2ViZDNhMWVmNmMyMWM2NGVlZGNlZGM5YjVkNzVjZTE3ODdhY2JmOTp7ImlzX3JlYWRfMSI6MTU1MTUyNDA2Ny41OTIxNTc4LCJuaWNrIjpudWxsLCJ0aWQiOm51bGwsIl9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkNTMzNzllNTY5ZmQ3NmY1YjQxMDljNmIwZGJiNTg4YWI3MTJjNGIxIiwidXNlcm5hbWUiOiJjcmVhdGVzdXBlcnVzZXIiLCJ1aWQiOjR9', '2019-03-16 18:55:27');

-- ----------------------------
-- Table structure for django_site
-- ----------------------------
DROP TABLE IF EXISTS `django_site`;
CREATE TABLE `django_site`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_site_domain_a2e37b91_uniq`(`domain`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_site
-- ----------------------------
INSERT INTO `django_site` VALUES (1, 'example.com', 'example.com');

-- ----------------------------
-- Table structure for oauth_ouser
-- ----------------------------
DROP TABLE IF EXISTS `oauth_ouser`;
CREATE TABLE `oauth_ouser`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(0) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(0) NULL,
  `link` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_ouser
-- ----------------------------
INSERT INTO `oauth_ouser` VALUES (1, 'pbkdf2_sha256$36000$P2Mt91Hx3fg2$c0VBYH+zIB2shdRrNT3OidoluZgta/2uTFjAZPfBVIU=', '2019-03-02 00:16:48', 0, 'stormsha', '', '', '1414749109@qq.com', 0, 1, '2019-03-02 00:16:47', '', 'avatar/default.png');
INSERT INTO `oauth_ouser` VALUES (2, 'pbkdf2_sha256$36000$ZZmzUMz2lTpm$0xadcPRoeFUHZWxNkvh18mklwhjizMAQbhlsUAx0tJ8=', '2019-03-02 00:26:14', 0, 'storm', '', '', '1414749110@qq.com', 0, 1, '2019-03-02 00:22:46', '', 'avatar/default.png');
INSERT INTO `oauth_ouser` VALUES (3, 'pbkdf2_sha256$36000$O8WvIJBxZqOR$0KbWOH6FUiwk8kFjQ/sGye2riwYi3nJEpXT3VWcGe+8=', '2019-03-02 13:55:17', 0, 'asdfgh', '', '', 'stormsha6@gmail.com', 0, 1, '2019-03-02 00:26:58', '', 'avatar/default.png');
INSERT INTO `oauth_ouser` VALUES (4, 'pbkdf2_sha256$36000$zNEBARjVIhN3$BXXLsLtWIxfhmEyvOnTmtWFbiQeCnrtW0Jy02Try2jU=', '2019-03-04 15:52:55', 1, 'createsuperuser', '', '', '1414749109@qq.com', 1, 1, '2019-03-02 14:08:45', '', 'avatar/2019/03/02/微信图片_20190301204333.jpg');

-- ----------------------------
-- Table structure for oauth_ouser_groups
-- ----------------------------
DROP TABLE IF EXISTS `oauth_ouser_groups`;
CREATE TABLE `oauth_ouser_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ouser_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `oauth_ouser_groups_ouser_id_group_id_4a9e5409_uniq`(`ouser_id`, `group_id`) USING BTREE,
  INDEX `oauth_ouser_groups_group_id_ee861e08_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `oauth_ouser_groups_group_id_ee861e08_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `oauth_ouser_groups_ouser_id_c543bcdc_fk_oauth_ouser_id` FOREIGN KEY (`ouser_id`) REFERENCES `oauth_ouser` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oauth_ouser_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `oauth_ouser_user_permissions`;
CREATE TABLE `oauth_ouser_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ouser_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `oauth_ouser_user_permiss_ouser_id_permission_id_ab6b2ccc_uniq`(`ouser_id`, `permission_id`) USING BTREE,
  INDEX `oauth_ouser_user_per_permission_id_2b5b927f_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `oauth_ouser_user_per_permission_id_2b5b927f_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `oauth_ouser_user_permissions_ouser_id_12e23549_fk_oauth_ouser_id` FOREIGN KEY (`ouser_id`) REFERENCES `oauth_ouser` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for socialaccount_socialaccount
-- ----------------------------
DROP TABLE IF EXISTS `socialaccount_socialaccount`;
CREATE TABLE `socialaccount_socialaccount`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uid` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(0) NULL,
  `date_joined` datetime(0) NULL,
  `extra_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `socialaccount_socialaccount_provider_uid_fc810c6e_uniq`(`provider`, `uid`) USING BTREE,
  INDEX `socialaccount_socialaccount_user_id_8146e70c_fk_oauth_ouser_id`(`user_id`) USING BTREE,
  CONSTRAINT `socialaccount_socialaccount_user_id_8146e70c_fk_oauth_ouser_id` FOREIGN KEY (`user_id`) REFERENCES `oauth_ouser` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for socialaccount_socialapp
-- ----------------------------
DROP TABLE IF EXISTS `socialaccount_socialapp`;
CREATE TABLE `socialaccount_socialapp`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `client_id` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `secret` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `key` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for socialaccount_socialapp_sites
-- ----------------------------
DROP TABLE IF EXISTS `socialaccount_socialapp_sites`;
CREATE TABLE `socialaccount_socialapp_sites`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `socialapp_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `socialaccount_socialapp_sites_socialapp_id_site_id_71a9a768_uniq`(`socialapp_id`, `site_id`) USING BTREE,
  INDEX `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id`(`site_id`) USING BTREE,
  CONSTRAINT `socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc` FOREIGN KEY (`socialapp_id`) REFERENCES `socialaccount_socialapp` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for socialaccount_socialtoken
-- ----------------------------
DROP TABLE IF EXISTS `socialaccount_socialtoken`;
CREATE TABLE `socialaccount_socialtoken`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `token_secret` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expires_at` datetime(0) NULL DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq`(`app_id`, `account_id`) USING BTREE,
  INDEX `socialaccount_social_account_id_951f210e_fk_socialacc`(`account_id`) USING BTREE,
  CONSTRAINT `socialaccount_social_account_id_951f210e_fk_socialacc` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `socialaccount_social_app_id_636a42d7_fk_socialacc` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for storm_activate
-- ----------------------------
DROP TABLE IF EXISTS `storm_activate`;
CREATE TABLE `storm_activate`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `is_active` tinyint(1) NOT NULL,
  `add_date` datetime(0) NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of storm_activate
-- ----------------------------
INSERT INTO `storm_activate` VALUES (1, '本站源码已经共享在 <a href=\"https://github.com/stormsha\" target=\"_blank\">Github</a> 欢迎 Fork、Star、提建议、发现Bug', 1, '2019-03-06 00:53:46');

-- ----------------------------
-- Table structure for storm_article
-- ----------------------------
DROP TABLE IF EXISTS `storm_article`;
CREATE TABLE `storm_article`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `summary` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `body` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `img_link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_date` datetime(0) NULL,
  `update_date` datetime(0) NULL,
  `views` int(11) NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `loves` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `slug`(`slug`) USING BTREE,
  INDEX `storm_article_author_id_113892f7_fk_oauth_ouser_id`(`author_id`) USING BTREE,
  INDEX `storm_article_category_id_c56e32c4_fk_storm_category_id`(`category_id`) USING BTREE,
  CONSTRAINT `storm_article_author_id_113892f7_fk_oauth_ouser_id` FOREIGN KEY (`author_id`) REFERENCES `oauth_ouser` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `storm_article_category_id_c56e32c4_fk_storm_category_id` FOREIGN KEY (`category_id`) REFERENCES `storm_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of storm_article
-- ----------------------------
INSERT INTO `storm_article` VALUES (1, '创建Python虚拟环境——下', 'Python应用程序开发中，如果系统只安装了Python3.6.6。Python的优势之一是有众多的开源包，但是这也成为了Python的一大诟病。当开发者使用pip安装第三方包时，所安装的包会进入Python安装目录下的site-packages目录中。', '##Python应用程序开发中，如果系统只安装了Python3.6.6。Python的优势之一是有众多的开源包，但是这也成为了Python的一大诟病。当开发者使用pip安装第三方包时，所安装的包会进入Python安装目录下的site-packages目录中。\r\n假如需要同时开发多个应用程序，这些应用程序将会共用一个Python环境，就是安装在系统的Python 3.6.6。如果应用A需要django==1.8.2，应用B需要django==2.0怎么办？\r\n这种情况下，每个应用需要各有一个“独立”的Python运行环境。virtualenv就是用来为一个应用创建一套“隔离”的Python运行环境。\r\n\r\n1、	python虚拟环境—virtualenv\r\nvirtualenv 是一个创建隔离Python开发环境的工具。virtualenv创建一个包含所有必要的可执行文件的文件夹，用来使用Python工程所需要的依赖包。\r\n安装virtualenv\r\npip install virtualenv\r\n	 \r\n	安装完成后输入virtualenv按下回车，了解virtualenv的基本功能选项\r\n基本使用：\r\n虚拟 环境是可以随处放置的，进入需要放置的文件夹，点击右键选择“在此处打开shell窗口” 或者 打开cmd 通过cd 进入需要放置的文件夹\r\n$ virtualenv venv    # venv  虚拟环境名称，名称自定义，默认创建一个干净的环境\r\n \r\n$ virtualenv --system-site-packages venv  # 创建一个包含本地已经安装的依赖包的虚拟环境\r\n\r\n\r\n \r\nvirtualenv -p E:\\Python36\\python.exe venv\r\n\r\n查看本地已经安装的python环境\r\n \r\n\r\n \r\n\r\n退出虚拟环境\r\n\r\n2、	安装virtualenvwrapper对虚拟环境集中管理\r\n\r\npip install virtualenvwrapper-win\r\n\r\n	配置环境变量\r\n\r\n	打开环境变量，在系统环境变量中点击新建\r\n \r\n\r\n创建虚拟环境\r\nmkvirtualenv venv　\r\n\r\n查看已经创建过的虚拟环境\r\nworkon\r\n\r\n启动虚拟环境\r\nworkon venv\r\n\r\n退出虚拟环境\r\nDeactivate\r\n\r\n删除虚拟环境\r\nrmvirtualenv venv', '/static/images/summary.jpg', '2019-03-02 14:18:07', '2019-03-04 18:22:44', 23, '123', 1, 1, 4);
INSERT INTO `storm_article` VALUES (13, 'Pycharm编译器使用小技巧（不定期更新）', 'Pycharm编译器使用小技巧', '### 1.不区分大小写模糊提示\r\n**2018.2版本以前使用的方法：**\r\n![在这里插入图片描述](https://img-blog.csdn.net/20180903184316890?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1B5dGhvbl9OdW1iZXI=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)\r\n\r\n**2018.2版之后发现布局发生变化**\r\n![](https://img-blog.csdn.net/20180915204102872?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1B5dGhvbl9OdW1iZXI=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)\r\n### 2.代码模板\r\nPycharm 提供的这个代码模板，可以说是相当实用的一个功能了。它可以在你新建一个文件时，按照你预设的模板给你生成一段内容，比如解释器路径，编码方法，作者详细信息等\r\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20200321214325962.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0hvbmdmZWlfbWE=,size_16,color_FFFFFF,t_70)\r\n按照上图模板，生成的效果如下\r\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20200321214408449.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0hvbmdmZWlfbWE=,size_16,color_FFFFFF,t_70)\r\n模板变量：\r\n\r\n```python\r\n${PROJECT_NAME} - 当前Project名称;\r\n${NAME} - 在创建文件的对话框中指定的文件名;\r\n${USER} - 当前用户名;\r\n${DATE} - 当前系统日期;\r\n${TIME} - 当前系统时间;\r\n${YEAR} - 年;\r\n${MONTH} - 月;\r\n${DAY} - 日;\r\n${HOUR} - 小时;\r\n${MINUTE} - 分钟；\r\n${PRODUCT_NAME} - 创建文件的IDE名称;\r\n${MONTH_NAME_SHORT} - 英文月份缩写, 如: Jan, Feb, etc;\r\n${MONTH_NAME_FULL} - 英文月份全称, 如: January, February, etc；\r\n```\r\n### 3.设置一个tab键为4个空格\r\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20200321213334427.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0hvbmdmZWlfbWE=,size_16,color_FFFFFF,t_70)\r\n### 4.设置背景图片\r\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20200321215149554.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0hvbmdmZWlfbWE=,size_16,color_FFFFFF,t_70)\r\n效果：\r\n![在这里插入图片描述](https://img-blog.csdnimg.cn/202003212152357.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0hvbmdmZWlfbWE=,size_16,color_FFFFFF,t_70)', '/static/images/summary.jpg', '2020-03-26 23:21:20', '2020-03-26 23:21:20', 1, 'aaa', 2, 1, 6);
INSERT INTO `storm_article` VALUES (14, 'Django Restfarmwork 查询接口优化', '文章摘要等同于网页description内容，请务必填写...', '#### 1.尽量避免在for循环中进行数据库查询操作\r\n相关代码示例:\r\n```python\r\n# 优化前写法:\r\nstudents = get_training_team_student_info(data.get(\'resource_id\'))\r\n\r\nfor student in students:\r\n    student_name = student.get(\'user_name\')\r\n    # 获取参训人员分数\r\n    student_score_obj = get_training_team_score_first(\r\n            training_team=data.get(\'resource_id\'), \r\n            user=student.get(\'user_id\')\r\n            )\r\n    if not student_score_obj:\r\n        student_score = 0\r\n    else:\r\n        student_score = student_score_obj\r\n\r\n# 优化后写法:\r\nstudents = get_training_team_student_info(data.get(\'resource_id\'))\r\n# 查出所有学员成绩数据\r\nstudent_score_lists = get_training_team_score(training_team=data[\'resource_id\'])\r\nstudent_score_dict = {}\r\nfor student_score in student_score_lists:\r\n    student_score_dict[student_score.user_id] = student_score.final_score\r\n\r\nfor student in students:\r\n    student_name = student.get(\'user_name\')\r\n    # 获取参训人员分数\r\n    student_score_obj = student_score_dict.get(student.get(\'user_id\'))\r\n\r\n    if not student_score_obj:\r\n        student_score = 0\r\n    else:\r\n        student_score = student_score_obj\r\n```\r\n描述: 根据实际情况先查出所有数据组成映射关系,在for循环中进行取值操作\r\n\r\n#### 2.对于使用 values_list,获取一个字段结果的查询方法,使用列表推导式生成一个字段的列表\r\n相关代码示例:\r\n```python\r\n# 优化前相关代码:\r\n# 获取角色下已下发的任务hash列表\r\nsend_missions = model_api.get_training_team_mission(\r\n    training_team=training_team_hash,\r\n    training_role=training_role.resource_id\r\n).values_list(\'mission_resource_id\', flat=True)\r\n\r\n\"\"\"优化前SQL执行\r\n此sql对应上面代码的 send_missions = model_api.get_training_team_mission(training_team=training_team_hash,training_role=training_role.resource_id)\r\nSELECT `ce_training_team_trainingteammission`.`id`, `ce_training_team_trainingteammission`.`resource_id`, `ce_training_team_trainingteammission`.`training_team`, `ce_training_team_trainingteammission`.`training_role`, `ce_training_team_trainingteammission`.`mission_resource_id`, `ce_training_team_trainingteammission`.`user_id`, `ce_training_team_trainingteammission`.`mission_status`, `ce_training_team_trainingteammission`.`user_answer`, `ce_training_team_trainingteammission`.`release_time`, `ce_training_team_trainingteammission`.`reporting_time`, `ce_training_team_trainingteammission`.`start_mission_time`, `ce_training_team_trainingteammission`.`status` FROM `ce_training_team_trainingteammission` WHERE (NOT (`ce_training_team_trainingteammission`.`status` = 0) AND `ce_training_team_trainingteammission`.`training_role` = \'ce66d38a3b0784ddd9074cecbc9bc288\' AND `ce_training_team_trainingteammission`.`training_team` = \'ceb99b9d1677016bd09b38295422ee89\'); args=(0, \'ce66d38a3b0784ddd9074cecbc9bc288\', \'ceb99b9d1677016bd09b38295422ee89\')\r\n\r\n此sql对应上面代码的.values_list(\'mission_resource_id\', flat=True)\r\nSELECT `ce_training_team_trainingteammission`.`mission_resource_id` FROM `ce_training_team_trainingteammission` WHERE (NOT (`ce_training_team_trainingteammission`.`status` = 0) AND `ce_training_team_trainingteammission`.`training_role` = \'ce66d38a3b0784ddd9074cecbc9bc288\' AND `ce_training_team_trainingteammission`.`training_team` = \'ceb99b9d1677016bd09b38295422ee89\')  LIMIT 21; args=(0, \'ce66d38a3b0784ddd9074cecbc9bc288\', \'ceb99b9d1677016bd09b38295422ee89\')\r\n\r\n执行get_training_team_mission()函数时会进行一次数据库查询,执行.values_list时会再一次进行数据库查询\r\n\"\"\"\r\n# 优化后相关代码:\r\nsend_missions = model_api.get_training_team_mission(\r\n    training_team=training_team_hash,\r\n    training_role=training_role.resource_id\r\n)\r\nmission_resource_id_list = [mission.mission_resource_id for mission in send_missions]\r\n\"\"\"优化前SQL执行\r\nSELECT `ce_training_team_trainingteammission`.`id`, `ce_training_team_trainingteammission`.`resource_id`, `ce_training_team_trainingteammission`.`training_team`, `ce_training_team_trainingteammission`.`training_role`, `ce_training_team_trainingteammission`.`mission_resource_id`, `ce_training_team_trainingteammission`.`user_id`, `ce_training_team_trainingteammission`.`mission_status`, `ce_training_team_trainingteammission`.`user_answer`, `ce_training_team_trainingteammission`.`release_time`, `ce_training_team_trainingteammission`.`reporting_time`, `ce_training_team_trainingteammission`.`start_mission_time`, `ce_training_team_trainingteammission`.`status` FROM `ce_training_team_trainingteammission` WHERE (NOT (`ce_training_team_trainingteammission`.`status` = 0) AND `ce_training_team_trainingteammission`.`training_role` = \'ce66d38a3b0784ddd9074cecbc9bc288\' AND `ce_training_team_trainingteammission`.`training_team` = \'ceb99b9d1677016bd09b38295422ee89\'); args=(0, \'ce66d38a3b0784ddd9074cecbc9bc288\', \'ceb99b9d1677016bd09b38295422ee89\')\r\n 只会在执行get_training_team_mission()函数时时进行一次数据库查询\r\n\"\"\"\r\n```\r\n\r\n#### 3.在列表页数据的获取接口中,只返回列表页需要数据,减少不必要数据的查询\r\n相关代码示例:\r\n```python\r\n# 优化前返回字段:\r\nfields = (\"resource_id\", \"name\", \"description\", \"category\", \"pre_skill\", \"train_skill\", \"start_time\", \"end_time\",\r\n            \"template\", \"scene\", \"difficult\", \"scene_config_data\", \"training_role_data\", \"duration_time\",\r\n            \"scene_config\", \"scene_start_time\", \"scene_end_time\", \"training_status\", \"scene_data\", \"roles_data\")\r\n\r\n# 优化后针对列表页接口返回指定字段\r\ndef get_serializer(self, *args, **kwargs):\r\n    \"\"\"\r\n    获取序列化器\r\n\r\n    :param args: 位置参数\r\n    :param kwargs: 不定长字典参数\r\n    :return: 序列化器\r\n    \"\"\"\r\n    if self.action == \'list\':\r\n        kwargs[\'fields\'] = (\r\n            \"resource_id\", \"name\", \"description\", \"category\", \"pre_skill\", \"train_skill\", \"start_time\", \"end_time\",\r\n            \"template\", \"difficult\", \"scene_config\", \"training_role_data\", \"duration_time\",\r\n            \"scene_start_time\", \"scene_end_time\", \"training_status\"\r\n        )\r\n    return super().get_serializer(*args, **kwargs)\r\n```\r\n\r\n#### 4.对于多对多的关联查询,使用 prefetch_related 进行预加载\r\n相关代码示例:\r\n```python\r\n# 优化前相关代码:\r\nrole_list = get_training_role(\r\n        training_team=data[\'resource_id\']\r\n    ).exclude(users__id=user_id)\r\n\r\nfor role in role_list:\r\n    role_name = role.name\r\n    users = role.users.all()\r\n    user_names = [user.username for user in users]\r\n    role_info_list.append({\r\n        \'role_name\': role_name,\r\n        \'users\': user_names\r\n    })\r\n\"\"\"优化前执行sql\r\n此sql对应上面代码的 role_list = get_training_role(training_team=data[\'resource_id\'])\r\nSELECT `ce_training_team_trainingrole`.`id`, `ce_training_team_trainingrole`.`resource_id`, `ce_training_team_trainingrole`.`training_team`, `ce_training_team_trainingrole`.`name`, `ce_training_team_trainingrole`.`description`, `ce_training_team_trainingrole`.`role_group`, `ce_training_team_trainingrole`.`missions_scheme`, `ce_training_team_trainingrole`.`nodes` FROM `ce_training_team_trainingrole` WHERE `ce_training_team_trainingrole`.`training_team` = \'a0b8cda8d219f5a4af005e73c542ef54\'; args=(\'a0b8cda8d219f5a4af005e73c542ef54\',)\r\n\r\n此sql对应上面代码的 .exclude(users__id=user_id)\r\nSELECT `ce_training_team_trainingrole`.`id`, `ce_training_team_trainingrole`.`resource_id`, `ce_training_team_trainingrole`.`training_team`, `ce_training_team_trainingrole`.`name`, `ce_training_team_trainingrole`.`description`, `ce_training_team_trainingrole`.`role_group`, `ce_training_team_trainingrole`.`missions_scheme`, `ce_training_team_trainingrole`.`nodes` FROM `ce_training_team_trainingrole` WHERE (`ce_training_team_trainingrole`.`training_team` = \'a0b8cda8d219f5a4af005e73c542ef54\' AND NOT (`ce_training_team_trainingrole`.`id` IN (SELECT U1.`trainingrole_id` FROM `ce_training_team_trainingrole_users` U1 WHERE U1.`user_id` = 7))); args=(\'a0b8cda8d219f5a4af005e73c542ef54\', 7)\r\n\r\n此sql对应上面代码的 users = role.users.all()\r\nSELECT `sv_auth_user`.`id`, `sv_auth_user`.`password`, `sv_auth_user`.`last_login`, `sv_auth_user`.`is_superuser`, `sv_auth_user`.`username`, `sv_auth_user`.`first_name`, `sv_auth_user`.`last_name`, `sv_auth_user`.`email`, `sv_auth_user`.`is_staff`, `sv_auth_user`.`is_active`, `sv_auth_user`.`date_joined`, `sv_auth_user`.`resource_id`, `sv_auth_user`.`logo`, `sv_auth_user`.`nickname`, `sv_auth_user`.`name`, `sv_auth_user`.`organization_id`, `sv_auth_user`.`status` FROM `sv_auth_user` INNER JOIN `ce_training_team_trainingrole_users` ON (`sv_auth_user`.`id` = `ce_training_team_trainingrole_users`.`user_id`) WHERE `ce_training_team_trainingrole_users`.`trainingrole_id` = 235; args=(235,)\r\nSELECT `sv_auth_user`.`id`, `sv_auth_user`.`password`, `sv_auth_user`.`last_login`, `sv_auth_user`.`is_superuser`, `sv_auth_user`.`username`, `sv_auth_user`.`first_name`, `sv_auth_user`.`last_name`, `sv_auth_user`.`email`, `sv_auth_user`.`is_staff`, `sv_auth_user`.`is_active`, `sv_auth_user`.`date_joined`, `sv_auth_user`.`resource_id`, `sv_auth_user`.`logo`, `sv_auth_user`.`nickname`, `sv_auth_user`.`name`, `sv_auth_user`.`organization_id`, `sv_auth_user`.`status` FROM `sv_auth_user` INNER JOIN `ce_training_team_trainingrole_users` ON (`sv_auth_user`.`id` = `ce_training_team_trainingrole_users`.`user_id`) WHERE `ce_training_team_trainingrole_users`.`trainingrole_id` = 236; args=(236,)\r\nSELECT `sv_auth_user`.`id`, `sv_auth_user`.`password`, `sv_auth_user`.`last_login`, `sv_auth_user`.`is_superuser`, `sv_auth_user`.`username`, `sv_auth_user`.`first_name`, `sv_auth_user`.`last_name`, `sv_auth_user`.`email`, `sv_auth_user`.`is_staff`, `sv_auth_user`.`is_active`, `sv_auth_user`.`date_joined`, `sv_auth_user`.`resource_id`, `sv_auth_user`.`logo`, `sv_auth_user`.`nickname`, `sv_auth_user`.`name`, `sv_auth_user`.`organization_id`, `sv_auth_user`.`status` FROM `sv_auth_user` INNER JOIN `ce_training_team_trainingrole_users` ON (`sv_auth_user`.`id` = `ce_training_team_trainingrole_users`.`user_id`) WHERE `ce_training_team_trainingrole_users`.`trainingrole_id` = 237; args\r\n\"\"\"\r\n\r\n# 优化后相关代码\r\nrole_list = model_api.get_training_role(\r\n        training_team=data[\'resource_id\']\r\n    ).exclude(users__id=user_id).prefetch_related(\'users\')\r\n\r\nfor role in role_list:\r\n    role_name = role.name\r\n    users = role.users.all()\r\n    user_names = [user.username for user in users]\r\n    role_info_list.append({\r\n        \'role_name\': role_name,\r\n        \'users\': user_names\r\n    })\r\n\r\n\"\"\"优化后执行sql\r\n此sql对应上面代码的 role_list = get_training_role(training_team=data[\'resource_id\'])\r\nSELECT `ce_training_team_trainingrole`.`id`, `ce_training_team_trainingrole`.`resource_id`, `ce_training_team_trainingrole`.`training_team`, `ce_training_team_trainingrole`.`name`, `ce_training_team_trainingrole`.`description`, `ce_training_team_trainingrole`.`role_group`, `ce_training_team_trainingrole`.`missions_scheme`, `ce_training_team_trainingrole`.`nodes` FROM `ce_training_team_trainingrole` WHERE `ce_training_team_trainingrole`.`training_team` = \'a0b8cda8d219f5a4af005e73c542ef54\'; args=(\'a0b8cda8d219f5a4af005e73c542ef54\',)\r\n\r\n此sql对应上面代码的 .exclude(users__id=user_id)\r\nSELECT `ce_training_team_trainingrole`.`id`, `ce_training_team_trainingrole`.`resource_id`, `ce_training_team_trainingrole`.`training_team`, `ce_training_team_trainingrole`.`name`, `ce_training_team_trainingrole`.`description`, `ce_training_team_trainingrole`.`role_group`, `ce_training_team_trainingrole`.`missions_scheme`, `ce_training_team_trainingrole`.`nodes` FROM `ce_training_team_trainingrole` WHERE (`ce_training_team_trainingrole`.`training_team` = \'a0b8cda8d219f5a4af005e73c542ef54\' AND NOT (`ce_training_team_trainingrole`.`id` IN (SELECT U1.`trainingrole_id` FROM `ce_training_team_trainingrole_users` U1 WHERE U1.`user_id` = 7))); args=(\'a0b8cda8d219f5a4af005e73c542ef54\', 7)\r\n\r\n此sql对应上面代码的 .prefetch_related(\'users\')\r\nSELECT (`ce_training_team_trainingrole_users`.`trainingrole_id`) AS `_prefetch_related_val_trainingrole_id`, `sv_auth_user`.`id`, `sv_auth_user`.`password`, `sv_auth_user`.`last_login`, `sv_auth_user`.`is_superuser`, `sv_auth_user`.`username`, `sv_auth_user`.`first_name`, `sv_auth_user`.`last_name`, `sv_auth_user`.`email`, `sv_auth_user`.`is_staff`, `sv_auth_user`.`is_active`, `sv_auth_user`.`date_joined`, `sv_auth_user`.`resource_id`, `sv_auth_user`.`logo`, `sv_auth_user`.`nickname`, `sv_auth_user`.`name`, `sv_auth_user`.`organization_id`, `sv_auth_user`.`status` FROM `sv_auth_user` INNER JOIN `ce_training_team_trainingrole_users` ON (`sv_auth_user`.`id` = `ce_training_team_trainingrole_users`.`user_id`) WHERE `ce_training_team_trainingrole_users`.`trainingrole_id` IN (235, 236, 237); args=(235, 236, 237)\r\n\r\n相对来说此例子只是少了一个sql,但是如果这个角色下的人员有很多的话,每一个人都会进行一次sql查询,\r\n而优化后不管有多少人,只是进行了一次sql查询\r\n\"\"\"\r\n```\r\n拓展: 相关select_related()和prefetch_related()的操作可参考:[https://www.cnblogs.com/tuifeideyouran/p/4232028.html](https://www.cnblogs.com/tuifeideyouran/p/4232028.html)\r\n\r\n#### 5.尽可能少的在缓存函数后面添加其他操作,例如.first(),.exclude(),.values_list(),.values()等相关操作\r\n相关代码示例:\r\n```python\r\n# 优化后相关代码\r\n@func_cache(ce_training_team_teacher_cache)\r\ndef get_training_role(**kwargs):\r\n    \"\"\"\r\n    获取团队训练实战角色\r\n    :param kwargs:参数\r\n    :return: 团队训练实战角色obj\r\n    \"\"\"\r\n    return TrainingRole.objects.filter(**kwargs)\r\n\r\n\r\n@func_cache(ce_training_team_teacher_cache)\r\ndef get_training_role_first(**kwargs):\r\n    \"\"\"\r\n    获取团队训练实战角色\r\n    :param kwargs:参数\r\n    :return: 团队训练实战角色obj\r\n    \"\"\"\r\n    return TrainingRole.objects.filter(**kwargs).first()\r\n\r\n\r\n@func_cache(ce_training_team_teacher_cache)\r\ndef get_training_role_prefetch(**kwargs):\r\n    \"\"\"\r\n    获取团队训练实战角色预加载角色信息\r\n    :param kwargs: 参数\r\n    :return: 团队训练实战角色obj\r\n    \"\"\"\r\n    return TrainingRole.objects.filter(**kwargs).prefetch_related(\'users\')\r\n```\r\n尽可能通过python的逻辑关系在查询数据库之前排除不必要的条件,例如之前的values_list()获取单个字段数据时,可使用for循环代替.\r\n对于使用较多的情况,可针对条件设置单个缓存函数,例如上面的get_training_role_prefetch()函数.\r\n每添加一个额外操作都会增加一次sql查询,针对这个特性,具体要根据实际的代码进行调整', '/static/images/summary.jpg', '2020-03-26 23:40:10', '2020-03-28 23:29:39', 2, 'bbb', 2, 1, 10);
INSERT INTO `storm_article` VALUES (15, 'Ubuntu 常用解压与压缩命令', '文章摘要等同于网页description内容，请务必填写...', '### .tar 文件\r\n\r\n```python\r\n# 仅打包，并非压缩\r\ntar -xvf FileName.tar         # 解包\r\ntar -cvf FileName.tar DirName # 将DirName和其下所有文件（夹）打包\r\n```\r\n### .gz文件\r\n\r\n```python\r\n# .gz\r\ngunzip FileName.gz  # 解压1\r\ngzip -d FileName.gz # 解压2\r\ngzip FileName       # 压缩，只能压缩文件\r\n```\r\n### .tar.gz文件、 .tgz文件\r\n\r\n```python\r\n# .tar.gz 和 .tgz\r\ntar -zxvf FileName.tar.gz               # 解压\r\ntar -zcvf FileName.tar.gz DirName       # 将DirName和其下所有文件（夹）压缩\r\ntar -C DesDirName -zxvf FileName.tar.gz # 解压到目标路径\r\n```\r\n### .zip文件\r\n\r\n```python\r\n# 感觉.zip占用空间比.tar.gz大\r\nunzip FileName.zip          # 解压\r\nzip FileName.zip DirName    # 将DirName本身压缩\r\nzip -r FileName.zip DirName # 压缩，递归处理，将指定目录下的所有文件和子目录一并压缩\r\n```\r\n### .rar文件\r\n\r\n```python\r\n# mac和linux并没有自带rar，需要去下载\r\nrar x FileName.rar      # 解压\r\nrar a FileName.rar DirName # 压缩\r\n```\r\n.tar是打包，.tar.gz才是压缩过的文件，.tar.gz常见于unix系统，在ubuntu或macos可以直接解压，而.zip常见于windows系统\r\n\r\n**zip**流行于windows系统上的压缩文件（其他系统也可以打开）。zip格式开放而且免费。zip支持分卷压缩，128/256-bit AES加密算法等功能。zip的含义是速度，其目标就是为顶替ARC而诞生的“职业”压缩软件。\r\n**tar**是“tape archive”(磁带存档)的简称，它出现在还没有软盘驱动器、硬盘和\r\n光盘驱动器的计算机早期阶段，随着时间的推移， tar命令逐渐变为一个将很多文件进行存档的工具，目前许多用于Linux操作系统的程序就是打包为tar档案文件的形式。 在Linux里面，tar一般和其他没有文件管理的压缩算法文件结合使用，用tar打包整个文件目录结构成一个文件，再用gz，bzip等压缩算法压缩成一次。也是Linux常见的压缩归档的处理方法。', '/static/images/summary.jpg', '2020-03-28 23:29:06', '2020-03-28 23:29:06', 0, 'slug', 2, 3, 0);
INSERT INTO `storm_article` VALUES (16, 'ubuntu安装python3.7，并更新python默认指向为python3.7', 'ubuntu安装python3.7，并更新python默认指向为python3.7', '<div id=\"article_content\" class=\"article_content clearfix\">\r\n            <link rel=\"stylesheet\" href=\"https://csdnimg.cn/release/phoenix/template/css/ck_htmledit_views-833878f763.css\">\r\n                            <link rel=\"stylesheet\" href=\"https://csdnimg.cn/release/phoenix/template/css/ck_htmledit_views-833878f763.css\">\r\n                <div class=\"htmledit_views\" id=\"content_views\">\r\n                                            <p>ubuntu默认带着的python版本不是最新版，因此需要手动安装最新版。</p>\r\n\r\n<p><strong>查看python的指向</strong>。</p>\r\n\r\n<pre class=\"has\" name=\"code\"><code class=\"hljs perl\">ls -l /usr/bin | <span class=\"hljs-keyword\">grep</span> python</code><div class=\"hljs-button {2}\" data-title=\"复制\" onclick=\"hljs.copyCode(event)\"></div></pre>\r\n\r\n<p>可以看到，此时python指向的是python3.4。</p>\r\n\r\n<p><img alt=\"\" class=\"has\" src=\"https://img-blog.csdnimg.cn/20181224150645935.PNG?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3UwMTQ3NzU3MjM=,size_16,color_FFFFFF,t_70\"></p>\r\n\r\n<h1><a name=\"t0\"></a><a name=\"t0\"></a>第一部分：安装python3.7</h1>\r\n\r\n<h2><a name=\"t1\"></a><a name=\"t1\"></a><strong>1.直接使用apt-get安装python3.7失败：</strong></h2>\r\n\r\n<pre class=\"has\" name=\"code\"><code class=\"hljs css\"><span class=\"hljs-selector-tag\">apt-get</span> <span class=\"hljs-selector-tag\">install</span> <span class=\"hljs-selector-tag\">python3</span><span class=\"hljs-selector-class\">.7</span></code><div class=\"hljs-button {2}\" data-title=\"复制\" onclick=\"hljs.copyCode(event)\"></div></pre>\r\n\r\n<p><img alt=\"\" class=\"has\" height=\"100\" src=\"https://img-blog.csdnimg.cn/20181223172003334.PNG\" width=\"424\"></p>\r\n\r\n<h2><a name=\"t2\"></a><a name=\"t2\"></a><strong>2.改为手动安装</strong></h2>\r\n\r\n<p><strong>步骤1：在python官网找到python-3.7.1.tgz的地址</strong>：https://www.python.org/ftp/python/3.7.1/Python-3.7.1.tgz</p>\r\n\r\n<p><strong>步骤2：下载安装包</strong></p>\r\n\r\n<pre class=\"has\" name=\"code\"><code class=\"hljs ruby\">wget&nbsp;<span class=\"hljs-symbol\">https:</span>/<span class=\"hljs-regexp\">/www.python.org/ftp</span><span class=\"hljs-regexp\">/python/</span><span class=\"hljs-number\">3.7</span>.<span class=\"hljs-number\">1</span>/Python-<span class=\"hljs-number\">3.7</span>.<span class=\"hljs-number\">1</span>.tgz</code><div class=\"hljs-button {2}\" data-title=\"复制\" onclick=\"hljs.copyCode(event)\"></div></pre>\r\n\r\n<p><img alt=\"\" class=\"has\" height=\"121\" src=\"https://img-blog.csdnimg.cn/20181224160121321.PNG\" width=\"660\"></p>\r\n\r\n<p><strong>步骤3：解压安装包</strong></p>\r\n\r\n<pre class=\"has\" name=\"code\"><code class=\"hljs css\"><span class=\"hljs-selector-tag\">tar</span> <span class=\"hljs-selector-tag\">-zxvf</span>&nbsp;<span class=\"hljs-selector-tag\">Python-3</span><span class=\"hljs-selector-class\">.7</span><span class=\"hljs-selector-class\">.1</span><span class=\"hljs-selector-class\">.tgz</span></code><div class=\"hljs-button {2}\" data-title=\"复制\" onclick=\"hljs.copyCode(event)\"></div></pre>\r\n\r\n<p><img alt=\"\" class=\"has\" src=\"https://img-blog.csdnimg.cn/20181224161011152.PNG?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3UwMTQ3NzU3MjM=,size_16,color_FFFFFF,t_70\"></p>\r\n\r\n<p><strong>步骤4：切换到解压后的目录下</strong></p>\r\n\r\n<pre class=\"has\" name=\"code\"><code class=\"hljs css\"><span class=\"hljs-selector-tag\">cd</span>&nbsp;<span class=\"hljs-selector-tag\">Python-3</span><span class=\"hljs-selector-class\">.7</span><span class=\"hljs-selector-class\">.1</span></code><div class=\"hljs-button {2}\" data-title=\"复制\" onclick=\"hljs.copyCode(event)\"></div></pre>\r\n\r\n<p><strong>步骤5：./configure（也可以./configure&nbsp;--prefix=/usr/local/python3.7.1）</strong></p>\r\n\r\n<pre class=\"has\" name=\"code\"><code class=\"hljs bash\"><ol class=\"hljs-ln\"><li><div class=\"hljs-ln-numbers\"><div class=\"hljs-ln-line hljs-ln-n\" data-line-number=\"1\"></div></div><div class=\"hljs-ln-code\"><div class=\"hljs-ln-line\">./configure</div></div></li><li><div class=\"hljs-ln-numbers\"><div class=\"hljs-ln-line hljs-ln-n\" data-line-number=\"2\"></div></div><div class=\"hljs-ln-code\"><div class=\"hljs-ln-line\"><span class=\"hljs-comment\"># 或者</span></div></div></li><li><div class=\"hljs-ln-numbers\"><div class=\"hljs-ln-line hljs-ln-n\" data-line-number=\"3\"></div></div><div class=\"hljs-ln-code\"><div class=\"hljs-ln-line\">./configure&nbsp;--prefix=/usr/<span class=\"hljs-built_in\">local</span>/python3.7.1</div></div></li></ol></code><div class=\"hljs-button {2}\" data-title=\"复制\" onclick=\"hljs.copyCode(event)\"></div></pre>\r\n\r\n<p><img alt=\"\" class=\"has\" height=\"45\" src=\"https://img-blog.csdnimg.cn/20181224161128201.PNG\" width=\"334\"></p>\r\n\r\n<p><strong>步骤6：编译make（没有安装make的安装一下）</strong></p>\r\n\r\n<pre class=\"has\" name=\"code\"><code class=\"hljs go\"><span class=\"hljs-built_in\">make</span>\r\n</code><div class=\"hljs-button {2}\" data-title=\"复制\" onclick=\"hljs.copyCode(event)\"></div></pre>\r\n\r\n<p><strong>步骤7：测试make test</strong></p>\r\n\r\n<pre class=\"has\" name=\"code\"><code class=\"hljs go\"><span class=\"hljs-built_in\">make</span> test</code><div class=\"hljs-button {2}\" data-title=\"复制\" onclick=\"hljs.copyCode(event)\"></div></pre>\r\n\r\n<p>关于make test命令出现ModuleNotFoundError: No module named ‘_ctypes’&nbsp;错误，请移步我的另外一篇博文<a href=\"https://blog.csdn.net/u014775723/article/details/85224447\">https://blog.csdn.net/u014775723/article/details/85224447</a></p>\r\n\r\n<p><strong>步骤8：安装sudo make install</strong></p>\r\n\r\n<pre class=\"has\" name=\"code\"><code class=\"hljs go\">sudo <span class=\"hljs-built_in\">make</span> install</code><div class=\"hljs-button {2}\" data-title=\"复制\" onclick=\"hljs.copyCode(event)\"></div></pre>\r\n\r\n<p>若步骤5执行的是 ./configure，则安装后可执行文件默认放在/usr /local/bin，库文件默认放在/usr/local/lib，配置文件默认放在/usr/local/include，其它的资源文件放在/usr /local/share。</p>\r\n\r\n<p>若步骤5执行的是./configure&nbsp;--prefix=/usr/local/python3.7.1，则可执行文件放在/usr /local/python3.7.1/bin，库文件放在/usr/local/python3.7.1/lib，配置文件放在/usr/local/python3.7.1/include，其它的资源文件放在/usr /local/python3.7.1/share</p>\r\n\r\n<p><strong>步骤9：若步骤5执行./configure&nbsp;--prefix=/usr/local/python3.7.1，则需要添加环境变量。步骤5是./configure的跳过此步骤</strong></p>\r\n\r\n<p>添加环境变量</p>\r\n\r\n<pre class=\"has\" name=\"code\"><code class=\"hljs bash\">PATH=<span class=\"hljs-variable\">$PATH</span>:<span class=\"hljs-variable\">$HOME</span>/bin:/usr/<span class=\"hljs-built_in\">local</span>/python3.7.1/bin</code><div class=\"hljs-button {2}\" data-title=\"复制\" onclick=\"hljs.copyCode(event)\"></div></pre>\r\n\r\n<p>查看环境变量</p>\r\n\r\n<pre class=\"has\" name=\"code\"><code class=\"hljs php\"><span class=\"hljs-keyword\">echo</span> $PATH</code><div class=\"hljs-button {2}\" data-title=\"复制\" onclick=\"hljs.copyCode(event)\"></div></pre>\r\n\r\n<p><strong>步骤10：查看安装目录</strong></p>\r\n\r\n<p>可以看到此时python3.7安装到了/usr/local/lib/（若步骤5执行./configure&nbsp;--prefix=/usr/local/python3.7.1，python3.7安装到了/usr/local/python3.7.1/lib/）</p>\r\n\r\n<p><img alt=\"\" class=\"has\" height=\"161\" src=\"https://img-blog.csdnimg.cn/20181224173500124.PNG\" width=\"533\"></p>\r\n\r\n<p><strong>步骤11：测试，输入python3.7</strong></p>\r\n\r\n<p><img alt=\"\" class=\"has\" height=\"70\" src=\"https://img-blog.csdnimg.cn/2018122217464648.PNG\" width=\"564\"></p>\r\n\r\n<h1><a name=\"t3\"></a><a name=\"t3\"></a><strong>第二部分：更新python默认指向为python3.7</strong></h1>\r\n\r\n<p><strong>步骤1：查看python命令指向</strong></p>\r\n\r\n<pre class=\"has\" name=\"code\"><code class=\"hljs perl\">ls -l /usr/bin | <span class=\"hljs-keyword\">grep</span> python</code><div class=\"hljs-button {2}\" data-title=\"复制\" onclick=\"hljs.copyCode(event)\"></div></pre>\r\n\r\n<p><img alt=\"\" class=\"has\" src=\"https://img-blog.csdnimg.cn/20181224173920609.PNG?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3UwMTQ3NzU3MjM=,size_16,color_FFFFFF,t_70\"></p>\r\n\r\n<p><strong>步骤2：若如步骤1的图，若要安装python3.4则，由于python3.4为系统自带的，直接使用以下命令并跳过步骤3：</strong></p>\r\n\r\n<p>删除原有链接</p>\r\n\r\n<pre class=\"has\" name=\"code\"><code class=\"hljs\">rm /usr/bin/python </code><div class=\"hljs-button {2}\" data-title=\"复制\" onclick=\"hljs.copyCode(event)\"></div></pre>\r\n\r\n<p>建立新链接</p>\r\n\r\n<pre class=\"has\" name=\"code\"><code class=\"hljs\">ln -s /usr/bin/python3.4 /usr/bin/python</code><div class=\"hljs-button {2}\" data-title=\"复制\" onclick=\"hljs.copyCode(event)\"></div></pre>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>步</strong>骤3：由于python3.7是自己安装的，不在/usr/bin下，而在usr/local/bin或者/usr/local/python3.7.1/bin下（取决于前面执行的./configure还是./configure&nbsp;--prefix=/usr/local/python3.7.1。因此需要先加一条软链接并且把之前的python命令改为python.bak，同时pip也需要更改。依次执行以下命令</p>\r\n\r\n<p><img alt=\"\" class=\"has\" height=\"134\" src=\"https://img-blog.csdnimg.cn/20181224174631859.PNG\" width=\"726\"></p>\r\n\r\n<p>若python3.7安装时，执行的是./configure，则：</p>\r\n\r\n<pre class=\"has\" name=\"code\"><code class=\"hljs delphi\"><ol class=\"hljs-ln\"><li><div class=\"hljs-ln-numbers\"><div class=\"hljs-ln-line hljs-ln-n\" data-line-number=\"1\"></div></div><div class=\"hljs-ln-code\"><div class=\"hljs-ln-line\">mv /usr/bin/python /usr/bin/python.bak</div></div></li><li><div class=\"hljs-ln-numbers\"><div class=\"hljs-ln-line hljs-ln-n\" data-line-number=\"2\"></div></div><div class=\"hljs-ln-code\"><div class=\"hljs-ln-line\">ln -s /usr/<span class=\"hljs-keyword\">local</span>/bin/python3 /usr/bin/python</div></div></li><li><div class=\"hljs-ln-numbers\"><div class=\"hljs-ln-line hljs-ln-n\" data-line-number=\"3\"></div></div><div class=\"hljs-ln-code\"><div class=\"hljs-ln-line\">mv /usr/bin/pip /usr/bin/pip.bak</div></div></li><li><div class=\"hljs-ln-numbers\"><div class=\"hljs-ln-line hljs-ln-n\" data-line-number=\"4\"></div></div><div class=\"hljs-ln-code\"><div class=\"hljs-ln-line\">ln -s /usr/<span class=\"hljs-keyword\">local</span>/bin/pip3 /usr/bin/pip</div></div></li></ol></code><div class=\"hljs-button {2}\" data-title=\"复制\" onclick=\"hljs.copyCode(event)\"></div></pre>\r\n\r\n<p>若python3.7安装时，执行的是./configure&nbsp;--prefix=/usr/local/python3.7.1，则为：</p>\r\n\r\n<pre class=\"has\" name=\"code\"><code class=\"hljs delphi\"><ol class=\"hljs-ln\"><li><div class=\"hljs-ln-numbers\"><div class=\"hljs-ln-line hljs-ln-n\" data-line-number=\"1\"></div></div><div class=\"hljs-ln-code\"><div class=\"hljs-ln-line\">mv /usr/bin/python /usr/bin/python.bak</div></div></li><li><div class=\"hljs-ln-numbers\"><div class=\"hljs-ln-line hljs-ln-n\" data-line-number=\"2\"></div></div><div class=\"hljs-ln-code\"><div class=\"hljs-ln-line\">ln -s /usr/<span class=\"hljs-keyword\">local</span>/python3.<span class=\"hljs-number\">7.1</span>/bin/python3.<span class=\"hljs-number\">7</span> /usr/bin/python</div></div></li><li><div class=\"hljs-ln-numbers\"><div class=\"hljs-ln-line hljs-ln-n\" data-line-number=\"3\"></div></div><div class=\"hljs-ln-code\"><div class=\"hljs-ln-line\">mv /usr/bin/pip /usr/bin/pip.bak</div></div></li><li><div class=\"hljs-ln-numbers\"><div class=\"hljs-ln-line hljs-ln-n\" data-line-number=\"4\"></div></div><div class=\"hljs-ln-code\"><div class=\"hljs-ln-line\">ln -s /usr/<span class=\"hljs-keyword\">local</span>/python3.<span class=\"hljs-number\">7.1</span>/bin/pip3 /usr/bin/pip</div></div></li></ol></code><div class=\"hljs-button {2}\" data-title=\"复制\" onclick=\"hljs.copyCode(event)\"></div></pre>\r\n\r\n<p><br>\r\n&nbsp;步骤4：此时输入python验证</p>\r\n\r\n<p><img alt=\"\" class=\"has\" height=\"68\" src=\"https://img-blog.csdnimg.cn/20181224175202190.PNG\" width=\"585\"></p>\r\n\r\n<p>参考：</p>\r\n\r\n<p><a href=\"https://blog.csdn.net/u013214212/article/details/81540840\">https://blog.csdn.net/u013214212/article/details/81540840</a></p>\r\n\r\n<p><a href=\"https://www.jianshu.com/p/2a5cd519e583\" rel=\"nofollow\">https://www.jianshu.com/p/2a5cd519e583</a></p>\r\n\r\n<p><a href=\"https://www.cnblogs.com/yhongji/p/9383857.html\" rel=\"nofollow\">https://www.cnblogs.com/yhongji/p/9383857.html</a></p>', '/static/images/summary.jpg', '2020-03-29 22:25:43', '2020-03-29 22:25:43', 1, 'python37', 2, 3, 3);
INSERT INTO `storm_article` VALUES (17, '如何将本地文件通过终端上传到linux服务器 /服务器/阿里云', '如何将本地文件通过终端上传到linux服务器 /服务器/阿里云', '<p>scp -P 端口 c://xxxx.txt user@ip:/home/root</p>\r\n\r\n<p>注意：</p>\r\n\r\n<p>-P 大写</p>\r\n\r\n<p>-i 公钥</p>\r\n\r\n<p>（我是将文件上传到阿里云）</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>（１）在本地的终端下，而不是在服务器上。在本地的终端上才能将本地的文件拷入服务器。<br>\r\n（２）<br><code>scp -r localfile.txt username@192.168.0.1:/home/username/</code><br>\r\n其中，<br>\r\n１）scp是命令，-r是参数<br>\r\n２）localfile.txt 是文件的路径和文件名<br>\r\n３）username是服务器账号<br>\r\n４）192.168.0.1是要上传的服务器ip地址<br>\r\n５）/home/username/是要拷入的文件夹路径</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h1 id=\"如何连接一个linux服务器\"><a name=\"t0\"></a><a name=\"t0\"></a>如何连接一个Linux服务器</h1>\r\n\r\n<h2 id=\"linux服务器端准备工作\"><a name=\"t1\"></a><a name=\"t1\"></a>Linux服务器端准备工作</h2>\r\n\r\n<ul><li>\r\n	<p>首先需要在Linux服务器上安装<code>openssh-server</code>，打开Linux服务器命令行终端，键入下面命令</p>\r\n\r\n	<pre class=\"has\" name=\"code\"><code class=\"hljs vbscript\">sudo apt-<span class=\"hljs-keyword\">get</span> install openssh-<span class=\"hljs-built_in\">server</span></code><div class=\"hljs-button {2}\" data-title=\"复制\" onclick=\"hljs.copyCode(event)\"></div></pre>\r\n\r\n	<ul><li>1</li>\r\n	</ul></li>\r\n	<li>\r\n	<p>修改Linux服务器的<code>ssh</code>配置文件</p>\r\n	</li>\r\n</ul><pre class=\"has\" name=\"code\"><code class=\"hljs\">sudo gedit /etc/ssh/sshd_config</code><div class=\"hljs-button {2}\" data-title=\"复制\" onclick=\"hljs.copyCode(event)\"></div></pre>\r\n\r\n<ul><li>1</li>\r\n</ul><ul><li>先使用”#”注释掉<code>PermitRootLogin without-password</code></li>\r\n	<li>添加一行 <code>PermitRootLogin yes</code></li>\r\n	<li>\r\n	<p>然后开启<code>ssh</code>服务</p>\r\n\r\n	<pre class=\"has\" name=\"code\"><code class=\"hljs perl\">ps -e | <span class=\"hljs-keyword\">grep</span> ssh</code><div class=\"hljs-button {2}\" data-title=\"复制\" onclick=\"hljs.copyCode(event)\"></div></pre>\r\n\r\n	<ul><li>1</li>\r\n	</ul></li>\r\n</ul><hr><h2 id=\"客户端准备工作\"><a name=\"t2\"></a><a name=\"t2\"></a><a name=\"t2\"></a>客户端准备工作</h2>\r\n\r\n<p>客户端既可以是Windows系统用户，也可以是Linux系统用户，下面我们就分别介绍这两种系统如何来连接Linux服务器</p>\r\n\r\n<h3 id=\"ubuntu系统\"><a name=\"t3\"></a><a name=\"t3\"></a><a name=\"t3\"></a>Ubuntu系统</h3>\r\n\r\n<ul><li>一般情况下，Ubuntu系统都是自带了<code>openssh-client</code>，如果没有安装，在命令行键入下面</li>\r\n</ul><pre class=\"has\" name=\"code\"><code class=\"hljs sql\">sudo apt-get <span class=\"hljs-keyword\">install</span> openssh-<span class=\"hljs-keyword\">client</span></code><div class=\"hljs-button {2}\" data-title=\"复制\" onclick=\"hljs.copyCode(event)\"></div></pre>\r\n\r\n<ul><li>1</li>\r\n</ul><ul><li>如果已经安装好了<code>openssh-client</code>，那么可以使用下面的命令连接服务器</li>\r\n	<li>ssh username@ip&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 在命令行下输入，然后就可以连接到服务器了</li>\r\n</ul><pre class=\"has\" name=\"code\"><code class=\"hljs java\">ssh username<span class=\"hljs-meta\">@IP</span></code><div class=\"hljs-button {2}\" data-title=\"复制\" onclick=\"hljs.copyCode(event)\"></div></pre>\r\n\r\n<ul><li>1</li>\r\n</ul><ul><li>这里的<code>username</code>是服务器的一个用户账号，<code>IP</code>也是服务器的IP地址</li>\r\n</ul><h3 id=\"windows系统\"><a name=\"t4\"></a><a name=\"t4\"></a><a name=\"t4\"></a>Windows系统</h3>\r\n\r\n<ul><li>\r\n	<p>Windows平台下有许多提供<code>ssh</code>服务的软件，我们在这里使用<code>Xshell 5</code>软件</p>\r\n	</li>\r\n	<li>\r\n	<p>打开<code>Xshell 5</code>软件，点击左上角的<strong>新建</strong></p>\r\n	</li>\r\n	<li>\r\n	<p>在<strong>主机</strong>处输入Linux服务器的IP地址，<strong>协议</strong>选择为<code>ssh</code>，<strong>端口号</strong>为<code>22</code></p>\r\n	</li>\r\n	<li>\r\n	<p>点击<strong>确定</strong>按钮，再点击<strong>连接</strong>，此时会弹出一个交互窗口，输入服务器的一个账户和密码</p>\r\n	</li>\r\n</ul><p><img alt=\"这里写图片描述\" class=\"has\" src=\"https://img-blog.csdn.net/20171212152138597?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMzI1OTk0Nzk=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast\"></p>\r\n\r\n<p><img alt=\"这里写图片描述\" class=\"has\" src=\"https://img-blog.csdn.net/20171212152800023?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMzI1OTk0Nzk=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast\"></p>\r\n\r\n<p><img alt=\"这里写图片描述\" class=\"has\" src=\"https://img-blog.csdn.net/20171212152817941?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMzI1OTk0Nzk=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast\"></p>\r\n\r\n<p><img alt=\"这里写图片描述\" class=\"has\" src=\"https://img-blog.csdn.net/20171212152837012?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMzI1OTk0Nzk=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast\"></p>\r\n\r\n<p><img alt=\"这里写图片描述\" class=\"has\" src=\"https://img-blog.csdn.net/20171212152900046?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMzI1OTk0Nzk=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast\"></p>\r\n\r\n<p><img alt=\"这里写图片描述\" class=\"has\" src=\"https://img-blog.csdn.net/20171212152911367?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMzI1OTk0Nzk=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast\"></p>\r\n\r\n<hr><h2 id=\"数据传输\"><a name=\"t5\"></a><a name=\"t5\"></a><a name=\"t5\"></a>数据传输</h2>\r\n\r\n<p>下面我们就分别介绍Windows和Linux两种系统如何与Linux服务器进行数据传输</p>\r\n\r\n<h3 id=\"ubuntu系统-1\"><a name=\"t6\"></a><a name=\"t6\"></a><a name=\"t6\"></a>Ubuntu系统</h3>\r\n\r\n<ul><li>在于服务器连接正常后，再次打开一个命令行终端，键入以下命令，就可以将客户端数据传入服务器</li>\r\n</ul><pre class=\"has\" name=\"code\"><code class=\"hljs ruby\">scp ./filename username@IP<span class=\"hljs-symbol\">:/home/bio321/Desktop</span></code><div class=\"hljs-button {2}\" data-title=\"复制\" onclick=\"hljs.copyCode(event)\"></div></pre>\r\n\r\n<ul><li>1</li>\r\n</ul><ul><li>也可以将服务器端的数据传入到客户端，键入以下命令</li>\r\n</ul><pre class=\"has\" name=\"code\"><code class=\"hljs ruby\">scp username@IP<span class=\"hljs-symbol\">:/home/bio321/Desktop/filename</span> ./data </code><div class=\"hljs-button {2}\" data-title=\"复制\" onclick=\"hljs.copyCode(event)\"></div></pre>\r\n\r\n<ul><li>1</li>\r\n</ul><h3 id=\"windows系统-1\"><a name=\"t7\"></a><a name=\"t7\"></a><a name=\"t7\"></a>Windows系统</h3>\r\n\r\n<ul><li>在Linux服务器安装<code>lrzsz</code>，服务器端打开命令行，键入以下命令安装</li>\r\n</ul><pre class=\"has\" name=\"code\"><code class=\"hljs vbscript\">sudo apt-<span class=\"hljs-keyword\">get</span> install lrzsz</code><div class=\"hljs-button {2}\" data-title=\"复制\" onclick=\"hljs.copyCode(event)\"></div></pre>\r\n\r\n<ul><li>1</li>\r\n</ul><ul><li>\r\n	<p>将客户端数据传入服务端，服务端打开命令行，键入命令<code>rz</code></p>\r\n	</li>\r\n	<li>\r\n	<p>将服务端数据传入客户端，服务端打开命令行，键入命令<code>sz</code></p>\r\n	</li>\r\n</ul><p>&nbsp;</p>\r\n\r\n<p>1、从服务器上下载文件<br>\r\nscp username@servername:/path/filename&nbsp;/var/www/local_dir（本地目录）</p>\r\n\r\n<p>&nbsp;例如scp root@192.168.0.101:/var/www/test.txt&nbsp; 把192.168.0.101上的/var/www/test.txt&nbsp;的文件下载到/var/www/local_dir（本地目录）<br>\r\n&nbsp;</p>\r\n\r\n<p>2、上传本地文件到服务器<br>\r\nscp /path/filename username@servername:/path&nbsp;&nbsp;&nbsp;</p>\r\n\r\n<p>例如scp /var/www/test.php&nbsp; root@192.168.0.101:/var/www/&nbsp; 把本机/var/www/目录下的test.php文件上传到192.168.0.101这台服务器上的/var/www/目录中</p>\r\n\r\n<p>（之后会提醒输入登陆服务器的密码）</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>3、从服务器下载整个目录<br>\r\nscp -r username@servername:/var/www/remote_dir/（远程目录） /var/www/local_dir（本地目录）</p>\r\n\r\n<p>例如:scp -r root@192.168.0.101:/var/www/test&nbsp; /var/www/ &nbsp;</p>\r\n\r\n<p>4、上传目录到服务器<br>\r\nscp&nbsp; -r local_dir username@servername:remote_dir<br>\r\n例如：scp -r test &nbsp;root@192.168.0.101:/var/www/&nbsp;&nbsp; 把当前目录下的test目录上传到服务器的/var/www/ 目录</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>tar zxvf zhcon-0.2.5.tar.gz</p>\r\n\r\n<pre class=\"has\" id=\"best-content-974661411\" name=\"code\"><code class=\"language-html hljs xml\"><ol class=\"hljs-ln\"><li><div class=\"hljs-ln-numbers\"><div class=\"hljs-ln-line hljs-ln-n\" data-line-number=\"1\"></div></div><div class=\"hljs-ln-code\"><div class=\"hljs-ln-line\">分别是四个参数</div></div></li><li><div class=\"hljs-ln-numbers\"><div class=\"hljs-ln-line hljs-ln-n\" data-line-number=\"2\"></div></div><div class=\"hljs-ln-code\"><div class=\"hljs-ln-line\">x : 从 tar 包中把文件提取出来 &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;x：解压缩。c是压缩。</div></div></li><li><div class=\"hljs-ln-numbers\"><div class=\"hljs-ln-line hljs-ln-n\" data-line-number=\"3\"></div></div><div class=\"hljs-ln-code\"><div class=\"hljs-ln-line\">z : 表示 tar 包是被 gzip 压缩过的，所以解压时需要用 gunzip 解压</div></div></li><li><div class=\"hljs-ln-numbers\"><div class=\"hljs-ln-line hljs-ln-n\" data-line-number=\"4\"></div></div><div class=\"hljs-ln-code\"><div class=\"hljs-ln-line\">v : 显示详细信息</div></div></li><li><div class=\"hljs-ln-numbers\"><div class=\"hljs-ln-line hljs-ln-n\" data-line-number=\"5\"></div></div><div class=\"hljs-ln-code\"><div class=\"hljs-ln-line\">f xxx.tar.gz :  指定被处理的文件是 xxx.tar.gz</div></div></li></ol></code><div class=\"hljs-button {2}\" data-title=\"复制\" onclick=\"hljs.copyCode(event)\"></div></pre>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Linux 下的解压命令</p>\r\n\r\n<p><strong>注：1、c-创建-create</strong></p>\r\n\r\n<p><strong>　　</strong><strong>2、v-复杂输出</strong></p>\r\n\r\n<p><strong>&nbsp;　 &nbsp;3、f-文件-file</strong></p>\r\n\r\n<p><strong>&nbsp; &nbsp; &nbsp; 4、x-解压-extract</strong></p>\r\n\r\n<p><strong>&nbsp; &nbsp; &nbsp; 5、z-gz格式</strong></p>\r\n\r\n<p><strong>　　66666、真不会用语法的就使用man...例如 &nbsp;man tar &nbsp;他就会给你现实tar的一些参数操作</strong></p>\r\n\r\n<p><strong>&nbsp; &nbsp; &nbsp;&nbsp;</strong></p>\r\n\r\n<p><strong>.tar</strong></p>\r\n\r\n<p>打包语法：tar cvf newFileName.tar fileName || dirName&nbsp;</p>\r\n\r\n<p>解包语法：tar xvf newFileName.tar fileName（-C dirName）</p>\r\n\r\n<p>解释：1、这个是文件打包（跟压缩没有关系）</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; 2、后面如果加-C dirName的话就代表解包(下面关于tar的都累死)后放到dirName这个路径的文件夹下面</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; 3、newFileName是指打包后文件的文件名 &nbsp; fileName是指文件名、如果有多个文件的话可以并列写、并且用\" \"空格隔开； 如果用dirName的话，那就打包那个文件夹(附带里面的文件)</p>\r\n\r\n<p>截图：<img alt=\"\" class=\"has\" src=\"https://imgconvert.csdnimg.cn/aHR0cHM6Ly9pbWFnZXMwLmNuYmxvZ3MuY29tL2Jsb2cvNTIzMTUxLzIwMTMwNi8yMTIyMjQxNy05MDc4N2M4YjdmM2Y0MjE0OWM0ZTgyODgwY2U0Y2JmOC5wbmc?x-oss-process=image/format,png\"></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>&nbsp;.tar.gz</strong></p>\r\n\r\n<p>&nbsp;压缩：</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp;方法1 &nbsp; &nbsp;tar czvf newfileName.tar.gz fileName || dirName</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp;方法2 &nbsp; &nbsp;tar cvf tmpfileName.tar fileName || dirName (就是想打包成.tar); &nbsp; &nbsp; gzip -v tmpfileName.tar (删除源文件、变成了tmpfileName.tar.gz、并且显示压缩比---如果-v写成-q的话就不显示压缩比);</p>\r\n\r\n<p>解压： &nbsp;</p>\r\n\r\n<p>　　1、tar zxvf fileName</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; 2、tar xvf fileName(亲测也可以)</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; 3、gzip -d fileName.tar.gz ; &nbsp;tar xvf fileName</p>\r\n\r\n<p>解释：压缩的时候两种方式、其实第一种够用了、第二种就是分步进行的、先把打包成tar、然后用gzip压缩成.tar.gz格式、推荐第一种。解压正好相反</p>\r\n\r\n<p>截图：</p>\r\n\r\n<p><img alt=\"\" class=\"has\" src=\"https://imgconvert.csdnimg.cn/aHR0cHM6Ly9pbWFnZXMwLmNuYmxvZ3MuY29tL2Jsb2cvNTIzMTUxLzIwMTMwNi8yMjAwNTQ0OS03ZjU0NjA1NGE4MDg0NjBjOTA2Y2QxMDNmM2E0ZmE2MC5wbmc?x-oss-process=image/format,png\"></p>\r\n\r\n<p><img alt=\"\" class=\"has\" src=\"https://imgconvert.csdnimg.cn/aHR0cHM6Ly9pbWFnZXMwLmNuYmxvZ3MuY29tL2Jsb2cvNTIzMTUxLzIwMTMwNi8yMjAwNTUwOS1iZDg2MjcwMDFkM2U0NWUxOWM4Y2Y4MDZmM2NmMTZjMy5wbmc?x-oss-process=image/format,png\"></p>\r\n\r\n<p>不显示压缩比的gzip</p>\r\n\r\n<p><img alt=\"\" class=\"has\" src=\"https://imgconvert.csdnimg.cn/aHR0cHM6Ly9pbWFnZXMwLmNuYmxvZ3MuY29tL2Jsb2cvNTIzMTUxLzIwMTMwNi8yMjAwNTgyNC1mNWQ4NDZhYTExNjc0MTg0OGFiZmZkM2ZhNWFjODIzMC5wbmc?x-oss-process=image/format,png\"></p>\r\n\r\n<p>这个是吧a.php压缩成.tar.gz</p>\r\n\r\n<p><img alt=\"\" class=\"has\" src=\"https://imgconvert.csdnimg.cn/aHR0cHM6Ly9pbWFnZXMwLmNuYmxvZ3MuY29tL2Jsb2cvNTIzMTUxLzIwMTMwNi8yMjAwNTg0NC04MzQwMjJmMDY0MTY0MTcwODRhM2ExMjJmZDFjZWZlOC5wbmc?x-oss-process=image/format,png\"></p>\r\n\r\n<p>直接解压 &nbsp; 显示了a.php</p>\r\n\r\n<p><img alt=\"\" class=\"has\" src=\"https://imgconvert.csdnimg.cn/aHR0cHM6Ly9pbWFnZXMwLmNuYmxvZ3MuY29tL2Jsb2cvNTIzMTUxLzIwMTMwNi8yMjAwNTg1OC1jYTI4OTAzMTM0YjU0YzM4ODk1Mzk3ZDFiZDVjNzI0NC5wbmc?x-oss-process=image/format,png\">&nbsp; &nbsp;</p>\r\n\r\n<p>这个显示了压缩比</p>\r\n\r\n<p><img alt=\"\" class=\"has\" src=\"https://imgconvert.csdnimg.cn/aHR0cHM6Ly9pbWFnZXMwLmNuYmxvZ3MuY29tL2Jsb2cvNTIzMTUxLzIwMTMwNi8yMjAxMDExOS01NGM4NzRmNDRmMzg0NmRkYWRlMDE2YTkyMzQ2YjhmOC5wbmc?x-oss-process=image/format,png\"></p>\r\n\r\n<p>解压e.tar.gz&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>.bz2</strong></p>\r\n\r\n<p>压缩：</p>\r\n\r\n<p>　　方法1、 &nbsp;tar jcvf fileName.tar.bz2 fileName</p>\r\n\r\n<p>　　方法2、 &nbsp;bzip2 -z fileName.tar.bz2 fileName.tar</p>\r\n\r\n<p>解压缩：</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; 方法1、 tar jxvf fileName.tar.bz2</p>\r\n\r\n<p>　　方法2、 bzip2 -d fileName.tar.bz2; &nbsp;tar xvf fileName.tar</p>\r\n\r\n<p>注释：电脑里面简单的测试通过了...如果有错误请指正</p>\r\n\r\n<p>截图：</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"\" class=\"has\" src=\"https://imgconvert.csdnimg.cn/aHR0cHM6Ly9pbWFnZXMwLmNuYmxvZ3MuY29tL2Jsb2cvNTIzMTUxLzIwMTMwNi8yMjAxMTQyOC1hY2M4NWJkYmFhOGM0NWIwOTU2YTM4ODU2NWJkNmNkZS5wbmc?x-oss-process=image/format,png\"></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>.zip</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>压缩： tar xvf fileName.zip fileName</p>\r\n\r\n<p>解压：upzip fileName.zip</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>.rpm</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>解压：rpm2cpio fileName.rpm | cpio &nbsp;-div &nbsp;&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>&nbsp;.rar</strong></p>\r\n\r\n<p>今天不小心下载了一个rar的文件= =</p>\r\n\r\n<p>因为linux自带没有解压rar的方法、所以得下载一个http://down.itlearner.com/soft/2412.shtml</p>\r\n\r\n<p>make 安装好以后</p>\r\n\r\n<p>压缩： rar a fileName</p>\r\n\r\n<p>解压： rar x fileName.rar</p>\r\n\r\n<p><img alt=\"\" class=\"has\" src=\"https://imgconvert.csdnimg.cn/aHR0cHM6Ly9pbWFnZXMwLmNuYmxvZ3MuY29tL2Jsb2cvNTIzMTUxLzIwMTMwNi8yMjE3MzUwNy00M2JmNDE3N2U0YjQ0ZGE4OWI3YjY4YWQzNGI0NjM3YS5wbmc?x-oss-process=image/format,png\"></p>', '/static/images/summary.jpg', '2020-03-29 22:29:06', '2020-03-29 22:33:20', 1, 'linux', 2, 3, 0);

-- ----------------------------
-- Table structure for storm_article_keywords
-- ----------------------------
DROP TABLE IF EXISTS `storm_article_keywords`;
CREATE TABLE `storm_article_keywords`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `keyword_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `storm_article_keywords_article_id_keyword_id_7510b8d6_uniq`(`article_id`, `keyword_id`) USING BTREE,
  INDEX `storm_article_keywords_keyword_id_a563777a_fk_storm_keyword_id`(`keyword_id`) USING BTREE,
  CONSTRAINT `storm_article_keywords_article_id_5df25258_fk_storm_article_id` FOREIGN KEY (`article_id`) REFERENCES `storm_article` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `storm_article_keywords_keyword_id_a563777a_fk_storm_keyword_id` FOREIGN KEY (`keyword_id`) REFERENCES `storm_keyword` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of storm_article_keywords
-- ----------------------------
INSERT INTO `storm_article_keywords` VALUES (1, 1, 1);
INSERT INTO `storm_article_keywords` VALUES (3, 13, 1);
INSERT INTO `storm_article_keywords` VALUES (4, 14, 1);
INSERT INTO `storm_article_keywords` VALUES (5, 15, 1);
INSERT INTO `storm_article_keywords` VALUES (6, 16, 1);
INSERT INTO `storm_article_keywords` VALUES (7, 17, 1);

-- ----------------------------
-- Table structure for storm_article_tags
-- ----------------------------
DROP TABLE IF EXISTS `storm_article_tags`;
CREATE TABLE `storm_article_tags`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `storm_article_tags_article_id_tag_id_c71bf3b2_uniq`(`article_id`, `tag_id`) USING BTREE,
  INDEX `storm_article_tags_tag_id_e8380d38_fk_storm_tag_id`(`tag_id`) USING BTREE,
  CONSTRAINT `storm_article_tags_article_id_15b9f147_fk_storm_article_id` FOREIGN KEY (`article_id`) REFERENCES `storm_article` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `storm_article_tags_tag_id_e8380d38_fk_storm_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `storm_tag` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of storm_article_tags
-- ----------------------------
INSERT INTO `storm_article_tags` VALUES (1, 1, 1);
INSERT INTO `storm_article_tags` VALUES (7, 13, 1);
INSERT INTO `storm_article_tags` VALUES (8, 14, 1);
INSERT INTO `storm_article_tags` VALUES (9, 15, 1);
INSERT INTO `storm_article_tags` VALUES (10, 16, 1);
INSERT INTO `storm_article_tags` VALUES (11, 17, 1);

-- ----------------------------
-- Table structure for storm_bigcategory
-- ----------------------------
DROP TABLE IF EXISTS `storm_bigcategory`;
CREATE TABLE `storm_bigcategory`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'StormSha,静觅,网络,IT,技术,博客,Python',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `slug`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of storm_bigcategory
-- ----------------------------
INSERT INTO `storm_bigcategory` VALUES (1, '生活笔记', 'life', '生活笔记', 'StormSha,静觅,网络,IT,技术,博客,Python');
INSERT INTO `storm_bigcategory` VALUES (2, '技术杂谈', 'technique', '技术杂谈', 'StormSha,静觅,网络,IT,技术,博客,Python');
INSERT INTO `storm_bigcategory` VALUES (3, '福利专区', 'resources', '福利专区', 'StormSha,静觅,网络,IT,技术,博客,Python');
INSERT INTO `storm_bigcategory` VALUES (4, '关于自己', 'about', '关于自己', 'StormSha,静觅,网络,IT,技术,博客,Python');
INSERT INTO `storm_bigcategory` VALUES (5, '给我留言', 'message', '给我留言', 'StormSha,静觅,网络,IT,技术,博客,Python');
INSERT INTO `storm_bigcategory` VALUES (6, '赞助作者', 'donate', '赞助作者', 'StormSha,静觅,网络,IT,技术,博客,Python');
INSERT INTO `storm_bigcategory` VALUES (7, '技术交流', 'exchange', '技术交流', 'StormSha,静觅,网络,IT,技术,博客,Python');
INSERT INTO `storm_bigcategory` VALUES (8, '提问交流', 'question', '提问交流', 'StormSha,静觅,网络,IT,技术,博客,Python');
INSERT INTO `storm_bigcategory` VALUES (9, '项目合作', 'project', '项目合作', 'StormSha,静觅,网络,IT,技术,博客,Python');

-- ----------------------------
-- Table structure for storm_carousel
-- ----------------------------
DROP TABLE IF EXISTS `storm_carousel`;
CREATE TABLE `storm_carousel`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `img_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of storm_carousel
-- ----------------------------
INSERT INTO `storm_carousel` VALUES (1, 6, 'Python爬虫学习系列教程', 'Python爬虫学习系列教程', '/static/images/right1.jpg', 'http://127.0.0.1:8000/article/123/');
INSERT INTO `storm_carousel` VALUES (2, 7, '小白学爬虫系列教程', '小白学爬虫系列教程', '/static/images/right2.jpg', 'http://127.0.0.1:8000/article/123/');
INSERT INTO `storm_carousel` VALUES (4, 2, '小白学爬虫系列教程', '小白学爬虫系列教程', '/static/images/python-django-logo.jpg', 'http://127.0.0.1:8000/article/123/');
INSERT INTO `storm_carousel` VALUES (5, 3, '小白学爬虫系列教程', '小白学爬虫系列教程', '/static/images/bsblog.png', 'http://127.0.0.1:8000/article/123/');
INSERT INTO `storm_carousel` VALUES (6, 4, '小白学爬虫系列教程', '小白学爬虫系列教程', '/static/images/right3.jpg', 'http://127.0.0.1:8000/article/123/');
INSERT INTO `storm_carousel` VALUES (7, 5, '小白学爬虫系列教程', '小白学爬虫系列教程', '/static/images/right4.jpg', 'http://127.0.0.1:8000/article/123/');

-- ----------------------------
-- Table structure for storm_category
-- ----------------------------
DROP TABLE IF EXISTS `storm_category`;
CREATE TABLE `storm_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bigcategory_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `slug`(`slug`) USING BTREE,
  INDEX `storm_category_bigcategory_id_aa573836_fk_storm_bigcategory_id`(`bigcategory_id`) USING BTREE,
  CONSTRAINT `storm_category_bigcategory_id_aa573836_fk_storm_bigcategory_id` FOREIGN KEY (`bigcategory_id`) REFERENCES `storm_bigcategory` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of storm_category
-- ----------------------------
INSERT INTO `storm_category` VALUES (1, 'Python', 'python', 'StormSha的个人网站，记录生活的瞬间，分享学习的心得，感悟生活，留住感动，静静寻觅生活的美好', 2);
INSERT INTO `storm_category` VALUES (2, 'MySQL', 'mysql', 'Alittlecode的个人网站，记录生活的瞬间，分享学习的心得，感悟生活，留住感动，静静寻觅生活的美好', 2);
INSERT INTO `storm_category` VALUES (3, 'Linux', 'linux', 'StormSha的个人网站，记录生活的瞬间，分享学习的心得，感悟生活，留住感动，静静寻觅生活的美好', 2);

-- ----------------------------
-- Table structure for storm_friendlink
-- ----------------------------
DROP TABLE IF EXISTS `storm_friendlink`;
CREATE TABLE `storm_friendlink`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `link` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `logo` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_date` datetime(0) NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_show` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for storm_keyword
-- ----------------------------
DROP TABLE IF EXISTS `storm_keyword`;
CREATE TABLE `storm_keyword`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of storm_keyword
-- ----------------------------
INSERT INTO `storm_keyword` VALUES (1, 'python');
INSERT INTO `storm_keyword` VALUES (2, 'MySQL');

-- ----------------------------
-- Table structure for storm_silian
-- ----------------------------
DROP TABLE IF EXISTS `storm_silian`;
CREATE TABLE `storm_silian`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `badurl` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `add_date` datetime(0) NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for storm_tag
-- ----------------------------
DROP TABLE IF EXISTS `storm_tag`;
CREATE TABLE `storm_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `slug`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of storm_tag
-- ----------------------------
INSERT INTO `storm_tag` VALUES (1, 'python', 'python', 'StormSha的个人网站，记录生活的瞬间，分享学习的心得，感悟生活，留住感动，静静寻觅生活的美好');

-- ----------------------------
-- Table structure for storm_timeline
-- ----------------------------
DROP TABLE IF EXISTS `storm_timeline`;
CREATE TABLE `storm_timeline`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `side` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `star_num` int(11) NOT NULL,
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `icon_color` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_date` datetime(0) NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_ouser
-- ----------------------------
DROP TABLE IF EXISTS `user_ouser`;
CREATE TABLE `user_ouser`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NULL,
  `link` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_ouser
-- ----------------------------
INSERT INTO `user_ouser` VALUES (1, 'pbkdf2_sha256$36000$8uMF8ucJrwny$DFAOPG1oFnyuelRt+bHgrn8WYPltkG8292pFnlmJ+7k=', '2020-03-26 18:36:47.097840', 1, 'admin', '', '', '100@163.com', 1, 1, '2020-03-26 17:15:11.538323', '', 'avatar/default.png');
INSERT INTO `user_ouser` VALUES (2, 'pbkdf2_sha256$36000$LFs6GIilq3gP$b6V9l8m6pqlVSa5vFx2hQyAiFyLbKjOIgG7PhujPb9I=', '2020-03-26 18:05:37.920177', 0, 'hongfei_ma', '', '', 'mahongfei_mhf@163.com', 0, 1, '2020-03-26 18:05:37.591457', '', 'avatar/default.png');

-- ----------------------------
-- Table structure for user_ouser_groups
-- ----------------------------
DROP TABLE IF EXISTS `user_ouser_groups`;
CREATE TABLE `user_ouser_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ouser_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_ouser_groups_ouser_id_group_id_03bce0cb_uniq`(`ouser_id`, `group_id`) USING BTREE,
  INDEX `user_ouser_groups_group_id_12001949_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `user_ouser_groups_group_id_12001949_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_ouser_groups_ouser_id_ad1b57d3_fk_user_ouser_id` FOREIGN KEY (`ouser_id`) REFERENCES `user_ouser` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_ouser_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `user_ouser_user_permissions`;
CREATE TABLE `user_ouser_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ouser_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_ouser_user_permissions_ouser_id_permission_id_ef5c908e_uniq`(`ouser_id`, `permission_id`) USING BTREE,
  INDEX `user_ouser_user_perm_permission_id_da78e996_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `user_ouser_user_perm_permission_id_da78e996_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_ouser_user_permissions_ouser_id_a820347f_fk_user_ouser_id` FOREIGN KEY (`ouser_id`) REFERENCES `user_ouser` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
