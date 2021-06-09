/*
 Navicat Premium Data Transfer
 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : guli
 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001
 Date: 23/08/2020 18:31:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for acl_permission
-- ----------------------------
DROP TABLE IF EXISTS `acl_permission`;
CREATE TABLE `acl_permission`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '编号',
  `pid` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '所属上级',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '名称',
  `type` tinyint(0) NOT NULL DEFAULT 0 COMMENT '类型(1:菜单,2:按钮)',
  `permission_value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限值',
  `path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '访问路径',
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图标',
  `status` tinyint(0) NULL DEFAULT NULL COMMENT '状态(0:禁止,1:正常)',
  `is_deleted` tinyint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_pid`(`pid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '权限' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acl_permission
-- ----------------------------
INSERT INTO `acl_permission` VALUES ('1', '0', '全部数据', 0, NULL, NULL, NULL, NULL, NULL, 0, '2019-11-15 17:13:06', '2019-11-15 17:13:06');
INSERT INTO `acl_permission` VALUES ('1195268474480156673', '1', '权限管理', 1, NULL, '/acl', 'Layout', NULL, NULL, 0, '2019-11-15 17:13:06', '2019-11-18 13:54:25');
INSERT INTO `acl_permission` VALUES ('1195268616021139457', '1195268474480156673', '用户管理', 1, NULL, 'user/list', '/acl/user/list', NULL, NULL, 0, '2019-11-15 17:13:40', '2019-11-18 13:53:12');
INSERT INTO `acl_permission` VALUES ('1195268788138598401', '1195268474480156673', '角色管理', 1, NULL, 'role/list', '/acl/role/list', NULL, NULL, 0, '2019-11-15 17:14:21', '2019-11-15 17:14:21');
INSERT INTO `acl_permission` VALUES ('1195268893830864898', '1195268474480156673', '菜单管理', 1, NULL, 'menu/list', '/acl/menu/list', NULL, NULL, 0, '2019-11-15 17:14:46', '2019-11-15 17:14:46');
INSERT INTO `acl_permission` VALUES ('1195269143060602882', '1195268616021139457', '查看', 2, 'user.list', '', '', NULL, NULL, 0, '2019-11-15 17:15:45', '2019-11-17 21:57:16');
INSERT INTO `acl_permission` VALUES ('1195269295926206466', '1195268616021139457', '添加', 2, 'user.add', 'user/add', '/acl/user/form', NULL, NULL, 0, '2019-11-15 17:16:22', '2019-11-15 17:16:22');
INSERT INTO `acl_permission` VALUES ('1195269473479483394', '1195268616021139457', '修改', 2, 'user.update', 'user/update/:id', '/acl/user/form', NULL, NULL, 0, '2019-11-15 17:17:04', '2019-11-15 17:17:04');
INSERT INTO `acl_permission` VALUES ('1195269547269873666', '1195268616021139457', '删除', 2, 'user.remove', '', '', NULL, NULL, 0, '2019-11-15 17:17:22', '2019-11-15 17:17:22');
INSERT INTO `acl_permission` VALUES ('1195269821262782465', '1195268788138598401', '修改', 2, 'role.update', 'role/update/:id', '/acl/role/form', NULL, NULL, 0, '2019-11-15 17:18:27', '2019-11-15 17:19:53');
INSERT INTO `acl_permission` VALUES ('1195269903542444034', '1195268788138598401', '查看', 2, 'role.list', '', '', NULL, NULL, 0, '2019-11-15 17:18:47', '2019-11-15 17:18:47');
INSERT INTO `acl_permission` VALUES ('1195270037005197313', '1195268788138598401', '添加', 2, 'role.add', 'role/add', '/acl/role/form', NULL, NULL, 0, '2019-11-15 17:19:19', '2019-11-18 11:05:42');
INSERT INTO `acl_permission` VALUES ('1195270442602782721', '1195268788138598401', '删除', 2, 'role.remove', '', '', NULL, NULL, 0, '2019-11-15 17:20:55', '2019-11-15 17:20:55');
INSERT INTO `acl_permission` VALUES ('1195270621548568578', '1195268788138598401', '角色权限', 2, 'role.acl', 'role/distribution/:id', '/acl/role/roleForm', NULL, NULL, 0, '2019-11-15 17:21:38', '2019-11-15 17:21:38');
INSERT INTO `acl_permission` VALUES ('1195270744097742849', '1195268893830864898', '查看', 2, 'permission.list', '', '', NULL, NULL, 0, '2019-11-15 17:22:07', '2019-11-15 17:22:07');
INSERT INTO `acl_permission` VALUES ('1195270810560684034', '1195268893830864898', '添加', 2, 'permission.add', '', '', NULL, NULL, 0, '2019-11-15 17:22:23', '2019-11-15 17:22:23');
INSERT INTO `acl_permission` VALUES ('1195270862100291586', '1195268893830864898', '修改', 2, 'permission.update', '', '', NULL, NULL, 0, '2019-11-15 17:22:35', '2019-11-15 17:22:35');
INSERT INTO `acl_permission` VALUES ('1195270887933009922', '1195268893830864898', '删除', 2, 'permission.remove', '', '', NULL, NULL, 0, '2019-11-15 17:22:41', '2019-11-15 17:22:41');
INSERT INTO `acl_permission` VALUES ('1195349439240048642', '1', '讲师管理', 1, NULL, '/edu/teacher', 'Layout', NULL, NULL, 0, '2019-11-15 22:34:49', '2019-11-15 22:34:49');
INSERT INTO `acl_permission` VALUES ('1195349699995734017', '1195349439240048642', '讲师列表', 1, NULL, 'list', '/edu/teacher/list', NULL, NULL, 0, '2019-11-15 22:35:52', '2019-11-15 22:35:52');
INSERT INTO `acl_permission` VALUES ('1195349810561781761', '1195349439240048642', '添加讲师', 1, NULL, 'create', '/edu/teacher/form', NULL, NULL, 0, '2019-11-15 22:36:18', '2019-11-15 22:36:18');
INSERT INTO `acl_permission` VALUES ('1195349876252971010', '1195349810561781761', '添加', 2, 'teacher.add', '', '', NULL, NULL, 0, '2019-11-15 22:36:34', '2019-11-15 22:36:34');
INSERT INTO `acl_permission` VALUES ('1195349979797753857', '1195349699995734017', '查看', 2, 'teacher.list', '', '', NULL, NULL, 0, '2019-11-15 22:36:58', '2019-11-15 22:36:58');
INSERT INTO `acl_permission` VALUES ('1195350117270261762', '1195349699995734017', '修改', 2, 'teacher.update', 'edit/:id', '/edu/teacher/form', NULL, NULL, 0, '2019-11-15 22:37:31', '2019-11-15 22:37:31');
INSERT INTO `acl_permission` VALUES ('1195350188359520258', '1195349699995734017', '删除', 2, 'teacher.remove', '', '', NULL, NULL, 0, '2019-11-15 22:37:48', '2019-11-15 22:37:48');
INSERT INTO `acl_permission` VALUES ('1195350299365969922', '1', '课程分类', 1, NULL, '/edu/subject', 'Layout', NULL, NULL, 0, '2019-11-15 22:38:15', '2019-11-15 22:38:15');
INSERT INTO `acl_permission` VALUES ('1195350397751758850', '1195350299365969922', '课程分类列表', 1, NULL, 'list', '/edu/subject/list', NULL, NULL, 0, '2019-11-15 22:38:38', '2019-11-15 22:38:38');
INSERT INTO `acl_permission` VALUES ('1195350500512206850', '1195350299365969922', '导入课程分类', 1, NULL, 'import', '/edu/subject/import', NULL, NULL, 0, '2019-11-15 22:39:03', '2019-11-15 22:39:03');
INSERT INTO `acl_permission` VALUES ('1195350612172967938', '1195350397751758850', '查看', 2, 'subject.list', '', '', NULL, NULL, 0, '2019-11-15 22:39:29', '2019-11-15 22:39:29');
INSERT INTO `acl_permission` VALUES ('1195350687590748161', '1195350500512206850', '导入', 2, 'subject.import', '', '', NULL, NULL, 0, '2019-11-15 22:39:47', '2019-11-15 22:39:47');
INSERT INTO `acl_permission` VALUES ('1195350831744782337', '1', '课程管理', 1, NULL, '/edu/course', 'Layout', NULL, NULL, 0, '2019-11-15 22:40:21', '2019-11-15 22:40:21');
INSERT INTO `acl_permission` VALUES ('1195350919074385921', '1195350831744782337', '课程列表', 1, NULL, 'list', '/edu/course/list', NULL, NULL, 0, '2019-11-15 22:40:42', '2019-11-15 22:40:42');
INSERT INTO `acl_permission` VALUES ('1195351020463296513', '1195350831744782337', '发布课程', 1, NULL, 'info', '/edu/course/info', NULL, NULL, 0, '2019-11-15 22:41:06', '2019-11-15 22:41:06');
INSERT INTO `acl_permission` VALUES ('1195351159672246274', '1195350919074385921', '完成发布', 2, 'course.publish', 'publish/:id', '/edu/course/publish', NULL, NULL, 0, '2019-11-15 22:41:40', '2019-11-15 22:44:01');
INSERT INTO `acl_permission` VALUES ('1195351326706208770', '1195350919074385921', '编辑课程', 2, 'course.update', 'info/:id', '/edu/course/info', NULL, NULL, 0, '2019-11-15 22:42:19', '2019-11-15 22:42:19');
INSERT INTO `acl_permission` VALUES ('1195351566221938690', '1195350919074385921', '编辑课程大纲', 2, 'chapter.update', 'chapter/:id', '/edu/course/chapter', NULL, NULL, 0, '2019-11-15 22:43:17', '2019-11-15 22:43:17');
INSERT INTO `acl_permission` VALUES ('1195351862889254913', '1', '统计分析', 1, NULL, '/statistics/daily', 'Layout', NULL, NULL, 0, '2019-11-15 22:44:27', '2019-11-15 22:44:27');
INSERT INTO `acl_permission` VALUES ('1195351968841568257', '1195351862889254913', '生成统计', 1, NULL, 'create', '/statistics/daily/create', NULL, NULL, 0, '2019-11-15 22:44:53', '2019-11-15 22:44:53');
INSERT INTO `acl_permission` VALUES ('1195352054917074946', '1195351862889254913', '统计图表', 1, NULL, 'chart', '/statistics/daily/chart', NULL, NULL, 0, '2019-11-15 22:45:13', '2019-11-15 22:45:13');
INSERT INTO `acl_permission` VALUES ('1195352127734386690', '1195352054917074946', '查看', 2, 'daily.list', '', '', NULL, NULL, 0, '2019-11-15 22:45:30', '2019-11-15 22:45:30');
INSERT INTO `acl_permission` VALUES ('1195352215768633346', '1195351968841568257', '生成', 2, 'daily.add', '', '', NULL, NULL, 0, '2019-11-15 22:45:51', '2019-11-15 22:45:51');
INSERT INTO `acl_permission` VALUES ('1195352547621965825', '1', 'CMS管理', 1, NULL, '/cms', 'Layout', NULL, NULL, 0, '2019-11-15 22:47:11', '2019-11-18 10:51:46');
INSERT INTO `acl_permission` VALUES ('1195352856645701633', '1195353513549205505', '查看', 2, 'banner.list', '', NULL, NULL, NULL, 0, '2019-11-15 22:48:24', '2019-11-15 22:48:24');
INSERT INTO `acl_permission` VALUES ('1195352909401657346', '1195353513549205505', '添加', 2, 'banner.add', 'banner/add', '/cms/banner/form', NULL, NULL, 0, '2019-11-15 22:48:37', '2019-11-18 10:52:10');
INSERT INTO `acl_permission` VALUES ('1195353051395624961', '1195353513549205505', '修改', 2, 'banner.update', 'banner/update/:id', '/cms/banner/form', NULL, NULL, 0, '2019-11-15 22:49:11', '2019-11-18 10:52:05');
INSERT INTO `acl_permission` VALUES ('1195353513549205505', '1195352547621965825', 'Bander列表', 1, NULL, 'banner/list', '/cms/banner/list', NULL, NULL, 0, '2019-11-15 22:51:01', '2019-11-18 10:51:29');
INSERT INTO `acl_permission` VALUES ('1195353672110673921', '1195353513549205505', '删除', 2, 'banner.remove', '', '', NULL, NULL, 0, '2019-11-15 22:51:39', '2019-11-15 22:51:39');
INSERT INTO `acl_permission` VALUES ('1195354076890370050', '1', '订单管理', 1, NULL, '/order', 'Layout', NULL, NULL, 0, '2019-11-15 22:53:15', '2019-11-15 22:53:15');
INSERT INTO `acl_permission` VALUES ('1195354153482555393', '1195354076890370050', '订单列表', 1, NULL, 'list', '/order/list', NULL, NULL, 0, '2019-11-15 22:53:33', '2019-11-15 22:53:58');
INSERT INTO `acl_permission` VALUES ('1195354315093282817', '1195354153482555393', '查看', 2, 'order.list', '', '', NULL, NULL, 0, '2019-11-15 22:54:12', '2019-11-15 22:54:12');
INSERT INTO `acl_permission` VALUES ('1196301740985311234', '1195268616021139457', '分配角色', 2, 'user.assgin', 'user/role/:id', '/acl/user/roleForm', NULL, NULL, 0, '2019-11-18 13:38:56', '2019-11-18 13:38:56');

-- ----------------------------
-- Table structure for acl_role
-- ----------------------------
DROP TABLE IF EXISTS `acl_role`;
CREATE TABLE `acl_role`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色id',
  `role_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `role_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色编码',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_deleted` tinyint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acl_role
-- ----------------------------
INSERT INTO `acl_role` VALUES ('1', '普通管理员', NULL, NULL, 0, '2019-11-11 13:09:32', '2019-11-18 10:27:18');
INSERT INTO `acl_role` VALUES ('1193757683205607426', '课程管理员', NULL, NULL, 0, '2019-11-11 13:09:45', '2019-11-18 10:25:44');
INSERT INTO `acl_role` VALUES ('1196300996034977794', 'test', NULL, NULL, 0, '2019-11-18 13:35:58', '2019-11-18 13:35:58');

-- ----------------------------
-- Table structure for acl_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `acl_role_permission`;
CREATE TABLE `acl_role_permission`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `role_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `permission_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `is_deleted` tinyint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_id`(`role_id`) USING BTREE,
  INDEX `idx_permission_id`(`permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色权限' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acl_role_permission
-- ----------------------------
INSERT INTO `acl_role_permission` VALUES ('1277589774760189953', '1', '1', 0, '2020-06-29 21:08:33', '2020-06-29 21:08:33');
INSERT INTO `acl_role_permission` VALUES ('1277589774898601986', '1', '1195268474480156673', 0, '2020-06-29 21:08:33', '2020-06-29 21:08:33');
INSERT INTO `acl_role_permission` VALUES ('1277589774898601987', '1', '1195268616021139457', 0, '2020-06-29 21:08:33', '2020-06-29 21:08:33');

-- ----------------------------
-- Table structure for acl_user
-- ----------------------------
DROP TABLE IF EXISTS `acl_user`;
CREATE TABLE `acl_user`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '会员id',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '微信openid',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '密码',
  `nick_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '昵称',
  `salt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户头像',
  `token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户签名',
  `is_deleted` tinyint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_username`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acl_user
-- ----------------------------
INSERT INTO `acl_user` VALUES ('1', 'admin', '96e79218965eb72c92a549dd5a330112', 'admin', '', NULL, 0, '2019-11-01 10:39:47', '2019-11-01 10:39:47');
INSERT INTO `acl_user` VALUES ('2', 'test', '96e79218965eb72c92a549dd5a330112', 'test', NULL, NULL, 0, '2019-11-01 16:36:07', '2019-11-01 16:40:08');

-- ----------------------------
-- Table structure for acl_user_role
-- ----------------------------
DROP TABLE IF EXISTS `acl_user_role`;
CREATE TABLE `acl_user_role`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '主键id',
  `role_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '角色id',
  `user_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '用户id',
  `is_deleted` tinyint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_id`(`role_id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acl_user_role
-- ----------------------------
INSERT INTO `acl_user_role` VALUES ('1', '1', '2', 0, '2019-11-11 13:09:53', '2019-11-11 13:09:53');

-- ----------------------------
-- Table structure for crm_banner
-- ----------------------------
DROP TABLE IF EXISTS `crm_banner`;
CREATE TABLE `crm_banner`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT 'ID',
  `title` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '标题',
  `image_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '图片地址',
  `link_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '链接地址',
  `sort` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `is_deleted` tinyint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`title`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '首页banner表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of crm_banner
-- ----------------------------
INSERT INTO `crm_banner` VALUES ('1194556896025845762', 'test1', 'https://online-edu-zy1024.oss-cn-beijing.aliyuncs.com/2020/1.jpg', '/course', 1, 0, '2019-11-13 18:05:32', '2019-11-18 10:28:22');
INSERT INTO `crm_banner` VALUES ('1194607458461216769', 'test2', 'https://online-edu-zy1024.oss-cn-beijing.aliyuncs.com/2020/2.jpg', '/teacher', 2, 0, '2019-11-13 21:26:27', '2019-11-14 09:12:15');

-- ----------------------------
-- Table structure for edu_chapter
-- ----------------------------
DROP TABLE IF EXISTS `edu_chapter`;
CREATE TABLE `edu_chapter`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '章节ID',
  `course_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '章节名称',
  `sort` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '显示排序',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_course_id`(`course_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of edu_chapter
-- ----------------------------
INSERT INTO `edu_chapter` VALUES ('1192252428399751169', '18', '第二章：类的定义', 0, '2019-01-01 12:27:40', '2019-01-01 12:27:40');
INSERT INTO `edu_chapter` VALUES ('1262372239521648641', '1192252213659774977', '第二章：容器', 0, '2020-05-18 21:19:30', '2020-05-18 21:19:30');
INSERT INTO `edu_chapter` VALUES ('1264209576568397825', '1264209500466946050', 'java学习', 0, '2020-05-23 23:00:26', '2020-05-23 23:00:26');
INSERT INTO `edu_chapter` VALUES ('1267005638999838722', '1267005604992421890', 't', 0, '2020-05-31 16:10:59', '2020-05-31 16:10:59');
INSERT INTO `edu_chapter` VALUES ('1269129747686752257', '1269129602995847170', '第一章：Oracle入门', 0, '2020-06-06 12:51:26', '2020-06-06 12:51:26');
INSERT INTO `edu_chapter` VALUES ('1269130876118106114', '1269130800289284097', '第一章：mysql了解', 0, '2020-06-06 12:55:55', '2020-06-06 12:55:55');
INSERT INTO `edu_chapter` VALUES ('1269131327861424129', '1269131226069860353', '第一章：vue入门', 0, '2020-06-06 12:57:43', '2020-06-06 12:57:43');
INSERT INTO `edu_chapter` VALUES ('1272187617990987777', '1272187481592221697', '第一章：c++入门', 0, '2020-06-14 23:22:19', '2020-06-14 23:22:19');
INSERT INTO `edu_chapter` VALUES ('1272188591769964545', '1272188519200116737', '第一章：html5介绍', 0, '2020-06-14 23:26:11', '2020-06-14 23:26:11');
INSERT INTO `edu_chapter` VALUES ('1272189970525769729', '1272189831400706050', '第一章：spring优点', 0, '2020-06-14 23:31:40', '2020-06-14 23:31:40');
INSERT INTO `edu_chapter` VALUES ('1272190199891283970', '1272189831400706050', '第二章：spring进阶', 1, '2020-06-14 23:32:34', '2020-06-14 23:32:34');
INSERT INTO `edu_chapter` VALUES ('1272190423951003649', '1272189831400706050', '第三章：spring精通', 2, '2020-06-14 23:33:28', '2020-06-14 23:33:28');
INSERT INTO `edu_chapter` VALUES ('15', '18', '第一章：Java入门', 0, '2019-01-01 12:27:40', '2020-05-17 23:35:57');
INSERT INTO `edu_chapter` VALUES ('64', '1192252213659774977', '第一章：框架', 61, '2019-01-01 12:27:40', '2019-10-09 08:32:47');

-- ----------------------------
-- Table structure for edu_comment
-- ----------------------------
DROP TABLE IF EXISTS `edu_comment`;
CREATE TABLE `edu_comment`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '讲师ID',
  `course_id` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '课程id',
  `teacher_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '讲师id',
  `member_id` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '会员id',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员头像',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '评论内容',
  `is_deleted` tinyint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_course_id`(`course_id`) USING BTREE,
  INDEX `idx_teacher_id`(`teacher_id`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '评论' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_comment
-- ----------------------------
INSERT INTO `edu_comment` VALUES ('1194499162790211585', '1192252213659774977', '1189389726308478977', '1', '小三123', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132', '课程很好', 0, '2019-11-13 14:16:08', '2019-11-13 14:16:08');
INSERT INTO `edu_comment` VALUES ('1194898406466420738', '1192252213659774977', '1189389726308478977', '1', '小三123', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132', '11', 0, '2019-11-14 16:42:35', '2019-11-14 16:42:35');
INSERT INTO `edu_comment` VALUES ('1194898484388200450', '1192252213659774977', '1189389726308478977', '1', '小三123', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132', '111', 0, '2019-11-14 16:42:53', '2019-11-14 16:42:53');
INSERT INTO `edu_comment` VALUES ('1195251020861317122', '1192252213659774977', '1189389726308478977', '1', NULL, NULL, '2233', 0, '2019-11-15 16:03:45', '2019-11-15 16:03:45');
INSERT INTO `edu_comment` VALUES ('1195251382720700418', '1192252213659774977', '1189389726308478977', '1', NULL, NULL, '4455', 0, '2019-11-15 16:05:11', '2019-11-15 16:05:11');
INSERT INTO `edu_comment` VALUES ('1195252819177570306', '1192252213659774977', '1189389726308478977', '1', '小三1231', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132', '55', 0, '2019-11-15 16:10:53', '2019-11-15 16:10:53');
INSERT INTO `edu_comment` VALUES ('1195252899448160258', '1192252213659774977', '1189389726308478977', '1', '小三1231', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132', '55', 0, '2019-11-15 16:11:13', '2019-11-15 16:11:13');
INSERT INTO `edu_comment` VALUES ('1195252920587452417', '1192252213659774977', '1189389726308478977', '1', '小三1231', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132', '223344', 0, '2019-11-15 16:11:18', '2019-11-15 16:11:18');
INSERT INTO `edu_comment` VALUES ('1195262128095559681', '14', '1189389726308478977', '1', '小三1231', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132', '11', 0, '2019-11-15 16:47:53', '2019-11-15 16:47:53');
INSERT INTO `edu_comment` VALUES ('1196264505170767874', '1192252213659774977', '1189389726308478977', '1', '小三1231', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132', '666666', 0, '2019-11-18 11:10:58', '2019-11-18 11:10:58');

-- ----------------------------
-- Table structure for edu_course
-- ----------------------------
DROP TABLE IF EXISTS `edu_course`;
CREATE TABLE `edu_course`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程ID',
  `teacher_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程讲师ID',
  `subject_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程专业ID',
  `subject_parent_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程专业父级ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程标题',
  `price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '课程销售价格，设置为0则可免费观看',
  `lesson_num` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '总课时',
  `cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程封面图片路径',
  `buy_count` bigint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '销售数量',
  `view_count` bigint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '浏览数量',
  `version` bigint(0) UNSIGNED NOT NULL DEFAULT 1 COMMENT '乐观锁',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'Draft' COMMENT '课程状态 Draft未发布  Normal已发布',
  `is_deleted` tinyint(0) NULL DEFAULT NULL COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_title`(`title`) USING BTREE,
  INDEX `idx_subject_id`(`subject_id`) USING BTREE,
  INDEX `idx_teacher_id`(`teacher_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of edu_course
-- ----------------------------
INSERT INTO `edu_course` VALUES ('1260488592178814977', '1', '1259475490889039874', '1259475490679324673', 'java基础', 0.00, 110, 'https://online-edu-zy1024.oss-cn-beijing.aliyuncs.com/2020/05/13/7977da8dcca4445da521a1c420e49bf8java.jpg', 55, 0, 1, 'Draft', NULL, '2020-05-13 16:34:34', '2020-05-13 16:34:34');
INSERT INTO `edu_course` VALUES ('1264209500466946049', '3', '1259475490889039874', '1259475490679324673', 'Java', 0.01, 22, 'https://online-edu-zy1024.oss-cn-beijing.aliyuncs.com/2020/05/13/7977da8dcca4445da521a1c420e49bf8java.jpg', 69, 0, 1, 'Normal', NULL, '2020-05-23 23:00:07', '2020-05-23 23:35:15');
INSERT INTO `edu_course` VALUES ('1265143811223330817', '1258599526025945089', '1259475491866312706', '1259475491631431681', 'mysql数据库学习', 0.01, 23, 'https://online-edu-zy1024.oss-cn-beijing.aliyuncs.com/2020/05/13/7977da8dcca4445da521a1c420e49bf8java.jpg', 100, 0, 1, 'Draft', NULL, '2020-05-26 12:52:44', '2020-05-26 12:52:44');
INSERT INTO `edu_course` VALUES ('1267005592992518145', '1', '1259475489517502465', '1259475489341341697', 'C++', 0.01, 10, 'https://online-edu-zy1024.oss-cn-beijing.aliyuncs.com/2020/05/13/7977da8dcca4445da521a1c420e49bf8java.jpg', 99, 0, 1, 'Draft', NULL, '2020-05-31 16:10:48', '2020-05-31 16:10:48');
INSERT INTO `edu_course` VALUES ('1267005604992421890', '1', '1259475489517502465', '1259475489341341697', 'SSM框架学习', 0.00, 10, 'https://online-edu-zy1024.oss-cn-beijing.aliyuncs.com/2020/05/13/7977da8dcca4445da521a1c420e49bf8java.jpg', 0, 0, 1, 'Draft', NULL, '2020-05-31 16:10:51', '2020-05-31 16:10:51');
INSERT INTO `edu_course` VALUES ('1269129602995847170', '1258577137720373250', '1259475492080222209', '1259475491631431681', 'Oracle精通', 0.01, 100, 'https://online-edu-zy1024.oss-cn-beijing.aliyuncs.com/2020/05/13/7977da8dcca4445da521a1c420e49bf8java.jpg', 5, 0, 1, 'Normal', NULL, '2020-06-06 12:50:51', '2020-06-06 12:54:28');
INSERT INTO `edu_course` VALUES ('1269130800289284097', '1258958805958406145', '1259475491866312706', '1259475491631431681', 'mysql数据库优化', 0.01, 99, 'https://online-edu-zy1024.oss-cn-beijing.aliyuncs.com/2020/05/13/7977da8dcca4445da521a1c420e49bf8java.jpg', 1000, 0, 1, 'Normal', NULL, '2020-06-06 12:55:37', '2020-06-06 12:56:23');
INSERT INTO `edu_course` VALUES ('1269131226069860353', '1258599526025945089', '1259475489517502465', '1259475489341341697', 'vue框架', 0.00, 120, 'https://online-edu-zy1024.oss-cn-beijing.aliyuncs.com/2020/05/13/7977da8dcca4445da521a1c420e49bf8java.jpg', 200, 0, 1, 'Normal', NULL, '2020-06-06 12:57:18', '2020-06-06 12:58:22');
INSERT INTO `edu_course` VALUES ('1272187481592221697', '1258599526025945089', '1259475491178446849', '1259475490679324673', 'c++深入', 0.01, 66, 'https://online-edu-zy1024.oss-cn-beijing.aliyuncs.com/2020/05/13/7977da8dcca4445da521a1c420e49bf8java.jpg', 300, 0, 1, 'Normal', NULL, '2020-06-14 23:21:46', '2020-06-14 23:23:34');
INSERT INTO `edu_course` VALUES ('1272188519200116737', '5', '1259475490436055042', '1259475489341341697', 'html5', 0.01, 1000, 'https://online-edu-zy1024.oss-cn-beijing.aliyuncs.com/2020/06/14/1055e6ce19c64608a42ba4a8f7bae9a1html.jpg', 9, 0, 1, 'Normal', NULL, '2020-06-14 23:25:54', '2020-06-14 23:27:05');
INSERT INTO `edu_course` VALUES ('1272189831400706050', '1192327476087115778', '1259475490889039874', '1259475490679324673', 'spring精通', 0.01, 98, 'https://online-edu-zy1024.oss-cn-beijing.aliyuncs.com/2020/06/14/bbb1839b3f604ca18bb3db21528f6a19springboot.jpg', 88, 0, 1, 'Normal', NULL, '2020-06-14 23:31:07', '2020-06-14 23:34:40');

-- ----------------------------
-- Table structure for edu_course_collect
-- ----------------------------
DROP TABLE IF EXISTS `edu_course_collect`;
CREATE TABLE `edu_course_collect`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '收藏ID',
  `course_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程讲师ID',
  `member_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '课程专业ID',
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程收藏' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of edu_course_collect
-- ----------------------------
INSERT INTO `edu_course_collect` VALUES ('1196269345666019330', '1192252213659774977', '1', 1, '2019-11-18 11:30:12', '2019-11-18 11:30:12');

-- ----------------------------
-- Table structure for edu_course_description
-- ----------------------------
DROP TABLE IF EXISTS `edu_course_description`;
CREATE TABLE `edu_course_description`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程ID',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '课程简介',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程简介' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_course_description
-- ----------------------------
INSERT INTO `edu_course_description` VALUES ('1260488592178814977', '11111111111111111', '2020-05-13 16:34:34', '2020-05-13 16:34:34');
INSERT INTO `edu_course_description` VALUES ('1261946810981683201', '<p>0000</p>', '2020-05-17 17:09:00', '2020-05-17 17:26:40');
INSERT INTO `edu_course_description` VALUES ('1264209500466946049', '<p>Java学习</p>', '2020-05-23 23:00:09', '2020-05-23 23:00:09');
INSERT INTO `edu_course_description` VALUES ('1264209500466946050', '<p>Java学习</p>', '2020-05-23 23:00:09', '2020-05-23 23:00:09');
INSERT INTO `edu_course_description` VALUES ('1265143811223330817', '<p>6666</p>', '2020-05-26 12:52:45', '2020-05-26 12:52:45');
INSERT INTO `edu_course_description` VALUES ('1267005592992518145', '<p>1</p>', '2020-05-31 16:10:51', '2020-05-31 16:10:51');
INSERT INTO `edu_course_description` VALUES ('1267005604992421890', '<p>1</p>', '2020-05-31 16:10:51', '2020-05-31 16:10:51');
INSERT INTO `edu_course_description` VALUES ('1269129602995847170', '<p>数据库设计</p>', '2020-06-06 12:50:51', '2020-06-06 12:50:51');
INSERT INTO `edu_course_description` VALUES ('1269130800289284097', '<p>mysql优化，精通</p>', '2020-06-06 12:55:37', '2020-06-06 12:55:37');
INSERT INTO `edu_course_description` VALUES ('1269131226069860353', '<p>前段优秀框架</p>', '2020-06-06 12:57:18', '2020-06-06 12:57:18');
INSERT INTO `edu_course_description` VALUES ('1272187481592221697', '<p>c++</p>', '2020-06-14 23:21:48', '2020-06-14 23:21:48');
INSERT INTO `edu_course_description` VALUES ('1272188519200116737', '<p>前面页面架构</p>', '2020-06-14 23:25:54', '2020-06-14 23:25:54');
INSERT INTO `edu_course_description` VALUES ('1272189831400706050', '<p>spring框架</p>', '2020-06-14 23:31:07', '2020-06-14 23:31:07');

-- ----------------------------
-- Table structure for edu_subject
-- ----------------------------
DROP TABLE IF EXISTS `edu_subject`;
CREATE TABLE `edu_subject`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程类别ID',
  `title` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '类别名称',
  `parent_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '父ID',
  `sort` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序字段',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_parent_id`(`parent_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程科目' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of edu_subject
-- ----------------------------
INSERT INTO `edu_subject` VALUES ('1259475489341341697', '前端开发', '0', 0, '2020-05-10 21:28:51', '2020-05-10 21:28:51');
INSERT INTO `edu_subject` VALUES ('1259475489517502465', 'vue', '1259475489341341697', 0, '2020-05-10 21:28:51', '2020-05-10 21:28:51');
INSERT INTO `edu_subject` VALUES ('1259475489777549313', 'js', '1259475489341341697', 0, '2020-05-10 21:28:51', '2020-05-10 21:28:51');
INSERT INTO `edu_subject` VALUES ('1259475490180202497', 'jquery', '1259475489341341697', 0, '2020-05-10 21:28:51', '2020-05-10 21:28:51');
INSERT INTO `edu_subject` VALUES ('1259475490436055042', 'html', '1259475489341341697', 0, '2020-05-10 21:28:52', '2020-05-10 21:28:52');
INSERT INTO `edu_subject` VALUES ('1259475490679324673', '后端开发', '0', 0, '2020-05-10 21:28:52', '2020-05-10 21:28:52');
INSERT INTO `edu_subject` VALUES ('1259475490889039874', 'java', '1259475490679324673', 0, '2020-05-10 21:28:52', '2020-05-10 21:28:52');
INSERT INTO `edu_subject` VALUES ('1259475491178446849', 'C++', '1259475490679324673', 0, '2020-05-10 21:28:52', '2020-05-10 21:28:52');
INSERT INTO `edu_subject` VALUES ('1259475491459465218', 'Python', '1259475490679324673', 0, '2020-05-10 21:28:52', '2020-05-10 21:28:52');
INSERT INTO `edu_subject` VALUES ('1259475491631431681', '数据库', '0', 0, '2020-05-10 21:28:52', '2020-05-10 21:28:52');
INSERT INTO `edu_subject` VALUES ('1259475491866312706', 'mysql', '1259475491631431681', 0, '2020-05-10 21:28:52', '2020-05-10 21:28:52');
INSERT INTO `edu_subject` VALUES ('1259475492080222209', 'oracle', '1259475491631431681', 0, '2020-05-10 21:28:52', '2020-05-10 21:28:52');

-- ----------------------------
-- Table structure for edu_teacher
-- ----------------------------
DROP TABLE IF EXISTS `edu_teacher`;
CREATE TABLE `edu_teacher`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '讲师ID',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '讲师姓名',
  `intro` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '讲师简介',
  `career` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '讲师资历,一句话说明讲师',
  `level` int(0) UNSIGNED NOT NULL COMMENT '头衔 1高级讲师 2首席讲师',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '讲师头像',
  `sort` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `is_deleted` tinyint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '讲师' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_teacher
-- ----------------------------
INSERT INTO `edu_teacher` VALUES ('1', '张三', '近年主持国家自然科学基金（6项）、江苏省重大科技成果转化项目（5项）、江苏省产学研前瞻性联合研究项目（3项）、省工业科技支撑、省高技术、省自然科学基金等省部级及其企业的主要科研项目40多个，多个项目在企业成功转化，产生了较好的经济、社会和环境效益。积极开展产学研科技合作，并与省内16家企业建立了江苏省研究生工作站，其中6家为江苏省优秀研究生工作站', '高级', 1, 'https://guli-file-190513.oss-cn-beijing.aliyuncs.com/avatar/default.jpg', 0, 0, '2019-10-30 14:18:46', '2019-11-12 13:36:36');
INSERT INTO `edu_teacher` VALUES ('1189389726308478977', '晴天', '高级讲师简介', '高级讲师资历', 2, 'https://online-teach-file.oss-cn-beijing.aliyuncs.com/teacher/2019/10/30/de47ee9b-7fec-43c5-8173-13c5f7f689b2.png', 1, 0, '2019-10-30 11:53:03', '2019-10-30 11:53:03');
INSERT INTO `edu_teacher` VALUES ('1189390295668469762', '李刚', '高级讲师简介', '高级讲师', 2, 'https://online-teach-file.oss-cn-beijing.aliyuncs.com/teacher/2019/10/30/b8aa36a2-db50-4eca-a6e3-cc6e608355e0.png', 2, 0, '2019-10-30 11:55:19', '2019-11-12 13:37:52');
INSERT INTO `edu_teacher` VALUES ('1189426437876985857', '王二', '高级讲师简介', '高级讲师', 1, 'https://online-teach-file.oss-cn-beijing.aliyuncs.com/teacher/2019/11/08/e44a2e92-2421-4ea3-bb49-46f2ec96ef88.png', 0, 0, '2019-10-30 14:18:56', '2019-11-12 13:37:35');
INSERT INTO `edu_teacher` VALUES ('1189426464967995393', '王五', '高级讲师简介', '高级讲师', 2, 'https://online-teach-file.oss-cn-beijing.aliyuncs.com/teacher/2019/10/30/65423f14-49a9-4092-baf5-6d0ef9686a85.png', 0, 0, '2019-10-30 14:19:02', '2019-11-12 13:37:18');
INSERT INTO `edu_teacher` VALUES ('1192249914833055746', '李四', '高级讲师简介', '高级讲师', 1, 'https://online-teach-file.oss-cn-beijing.aliyuncs.com/teacher/2019/11/07/91871e25-fd83-4af6-845f-ea8d471d825d.png', 0, 0, '2019-11-07 09:18:25', '2019-11-12 13:37:01');
INSERT INTO `edu_teacher` VALUES ('1192327476087115778', '李想', '博士后', '11', 1, 'https://online-edu-zy1024.oss-cn-beijing.aliyuncs.com/2020/05/13/481fc8c1cd884cb49afa6c31948e6aca01.jpeg', 0, 0, '2019-11-07 14:26:37', '2019-11-11 16:26:26');
INSERT INTO `edu_teacher` VALUES ('1257583567089725441', '张天天', '高级讲师介绍', '高级', 2, 'https://guli-file-190513.oss-cn-beijing.aliyuncs.com/avatar/default.jpg', 0, 0, '2020-05-05 16:11:02', '2020-05-05 16:11:02');
INSERT INTO `edu_teacher` VALUES ('1258569399477022722', '李明', '高级讲师', '高级讲师', 1, 'https://guli-file-190513.oss-cn-beijing.aliyuncs.com/avatar/default.jpg', 1, 0, '2020-05-08 09:28:23', '2020-05-08 09:28:23');
INSERT INTO `edu_teacher` VALUES ('1258577137720373250', '唐三藏', '博士后', '教授', 2, 'https://guli-file-190513.oss-cn-beijing.aliyuncs.com/avatar/default.jpg', 1, 0, '2020-05-08 09:59:08', '2020-05-08 11:21:25');
INSERT INTO `edu_teacher` VALUES ('1258599526025945089', '孙悟空', '中南大学研究生', '研究生', 2, 'https://guli-file-190513.oss-cn-beijing.aliyuncs.com/avatar/default.jpg', 1, 0, '2020-05-08 11:28:05', '2020-05-08 11:28:05');
INSERT INTO `edu_teacher` VALUES ('1258958805958406145', '猪八戒', '副教授头衔', '副教授', 2, 'https://online-edu-zy1024.oss-cn-beijing.aliyuncs.com/2020/05/13/481fc8c1cd884cb49afa6c31948e6aca01.jpeg', 1, 0, '2020-05-09 11:15:44', '2020-05-09 11:15:44');
INSERT INTO `edu_teacher` VALUES ('1260430712637509634', '张天志', '博士后', '教授', 2, 'https://guli-file-190513.oss-cn-beijing.aliyuncs.com/avatar/default.jpg', 1, 0, '2020-05-13 12:44:34', '2020-05-13 12:44:34');
INSERT INTO `edu_teacher` VALUES ('2', '李涛', '博士后', '专家', 0, 'https://guli-file-190513.oss-cn-beijing.aliyuncs.com/avatar/default.jpg', 0, 1, '2019-11-15 21:47:12', '2020-05-05 16:50:09');
INSERT INTO `edu_teacher` VALUES ('3', '王某', '首席讲师', '首席讲师', 1, 'https://guli-file-190513.oss-cn-beijing.aliyuncs.com/avatar/default.jpg', 0, 0, '2020-05-07 22:41:06', '2020-05-07 22:41:10');
INSERT INTO `edu_teacher` VALUES ('4', '李希', '首席讲师', '首席讲师', 2, 'https://guli-file-190513.oss-cn-beijing.aliyuncs.com/avatar/default.jpg', 0, 0, '2018-12-01 22:42:12', '2020-05-07 22:42:15');
INSERT INTO `edu_teacher` VALUES ('5', '杨过', '首席讲师', '首席讲师', 2, 'https://guli-file-190513.oss-cn-beijing.aliyuncs.com/avatar/default.jpg', 0, 0, '2018-07-01 22:43:52', '2019-12-01 22:43:44');

-- ----------------------------
-- Table structure for edu_video
-- ----------------------------
DROP TABLE IF EXISTS `edu_video`;
CREATE TABLE `edu_video`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '视频ID',
  `course_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程ID',
  `chapter_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '章节ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '节点名称',
  `video_source_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '云端视频资源',
  `video_original_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '原始文件名称',
  `sort` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序字段',
  `play_count` bigint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '播放次数',
  `is_free` tinyint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否可以试听：0收费 1免费',
  `duration` float NOT NULL DEFAULT 0 COMMENT '视频时长（秒）',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'Empty' COMMENT 'Empty未上传 Transcoding转码中  Normal正常',
  `size` bigint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '视频源文件大小（字节）',
  `version` bigint(0) UNSIGNED NOT NULL DEFAULT 1 COMMENT '乐观锁',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_course_id`(`course_id`) USING BTREE,
  INDEX `idx_chapter_id`(`chapter_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程视频' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of edu_video
-- ----------------------------
INSERT INTO `edu_video` VALUES ('1262369728098242562', '18', '1192252428399751169', '第一课时：方法', '', NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-05-18 21:09:32', '2020-05-18 21:09:32');
INSERT INTO `edu_video` VALUES ('1262371523495235586', '1192252213659774977', '64', 'SSM', '', NULL, 1, 0, 0, 0, 'Empty', 0, 1, '2020-05-18 21:16:40', '2020-05-18 21:16:40');
INSERT INTO `edu_video` VALUES ('1262371619825815553', '1192252213659774977', '64', 'Springboot', '', NULL, 2, 0, 0, 0, 'Empty', 0, 1, '2020-05-18 21:17:03', '2020-05-18 21:17:03');
INSERT INTO `edu_video` VALUES ('1262372026102878210', '1192252213659774977', '64', 'SSH', '', NULL, 3, 0, 0, 0, 'Empty', 0, 1, '2020-05-18 21:18:39', '2020-05-18 21:18:39');
INSERT INTO `edu_video` VALUES ('1262372464151793666', '1192252213659774977', '1262372239521648641', 'Docker容器', '', '6 - What If I Want to Move Faster.mp4', 4, 0, 0, 0, 'Empty', 0, 1, '2020-05-18 21:20:24', '2020-05-18 21:20:24');
INSERT INTO `edu_video` VALUES ('1264209655282900994', '1264209500466946050', '1264209576568397825', '简单算法', '', '6 - What If I Want to Move Faster.mp4', 0, 0, 0, 0, 'Empty', 0, 1, '2020-05-23 23:00:44', '2020-05-23 23:00:44');
INSERT INTO `edu_video` VALUES ('1265205763240914946', '18', '1192252428399751169', '第二课时：静态方法', 'a3059b616ffd46ed9cdd6bf54cae00da', '6 - What If I Want to Move Faster.mp4', 0, 0, 0, 0, 'Empty', 0, 1, '2020-05-26 16:58:55', '2020-05-26 16:58:55');
INSERT INTO `edu_video` VALUES ('1269130324453883906', '1269129602995847170', '1269129747686752257', '第1节：orcle发展了解', 'a3059b616ffd46ed9cdd6bf54cae00da', '6 - What If I Want to Move Faster.mp4', 0, 0, 0, 0, 'Empty', 0, 1, '2020-06-06 12:53:43', '2020-06-06 12:53:43');
INSERT INTO `edu_video` VALUES ('1269130482440732673', '1269129602995847170', '1269129747686752257', '第2节：数据库系统', 'a3059b616ffd46ed9cdd6bf54cae00da', '6 - What If I Want to Move Faster.mp4', 0, 0, 0, 0, 'Empty', 0, 1, '2020-06-06 12:54:21', '2020-06-06 12:54:21');
INSERT INTO `edu_video` VALUES ('1269130974348705794', '1269130800289284097', '1269130876118106114', '第1节：sql语句学习', 'a3059b616ffd46ed9cdd6bf54cae00da', '6 - What If I Want to Move Faster.mp4', 0, 0, 0, 0, 'Empty', 0, 1, '2020-06-06 12:56:18', '2020-06-06 12:56:18');
INSERT INTO `edu_video` VALUES ('1269131474846613505', '1269131226069860353', '1269131327861424129', '第1节：helloworld', 'a3059b616ffd46ed9cdd6bf54cae00da', '6 - What If I Want to Move Faster.mp4', 0, 0, 0, 0, 'Empty', 0, 1, '2020-06-06 12:58:18', '2020-06-06 12:58:18');
INSERT INTO `edu_video` VALUES ('1272187739210567681', '1272187481592221697', '1272187617990987777', '第一课时：hellworld', 'a3059b616ffd46ed9cdd6bf54cae00da', '6 - What If I Want to Move Faster.mp4', 0, 0, 0, 0, 'Empty', 0, 1, '2020-06-14 23:22:48', '2020-06-14 23:22:48');
INSERT INTO `edu_video` VALUES ('1272187900926152705', '1272187481592221697', '1272187617990987777', '第二课时：简单算法', 'a3059b616ffd46ed9cdd6bf54cae00da', '6 - What If I Want to Move Faster.mp4', 1, 0, 0, 0, 'Empty', 0, 1, '2020-06-14 23:23:26', '2020-06-14 23:23:26');
INSERT INTO `edu_video` VALUES ('1272188779712532481', '1272188519200116737', '1272188591769964545', '第一课时：简单标签', 'a3059b616ffd46ed9cdd6bf54cae00da', '6 - What If I Want to Move Faster.mp4', 0, 0, 0, 0, 'Empty', 0, 1, '2020-06-14 23:26:56', '2020-06-14 23:26:56');
INSERT INTO `edu_video` VALUES ('1272190070845132801', '1272189831400706050', '1272189970525769729', '第一课时：ssm框架介绍', 'a3059b616ffd46ed9cdd6bf54cae00da', '6 - What If I Want to Move Faster.mp4', 0, 0, 0, 0, 'Empty', 0, 1, '2020-06-14 23:32:04', '2020-06-14 23:32:04');
INSERT INTO `edu_video` VALUES ('1272190269017608193', '1272189831400706050', '1272190199891283970', '第一课时：ioc', 'a3059b616ffd46ed9cdd6bf54cae00da', '6 - What If I Want to Move Faster.mp4', 0, 0, 0, 0, 'Empty', 0, 1, '2020-06-14 23:32:51', '2020-06-14 23:32:51');
INSERT INTO `edu_video` VALUES ('1272190350370328578', '1272189831400706050', '1272190199891283970', '第二课时：DI', 'a3059b616ffd46ed9cdd6bf54cae00da', '6 - What If I Want to Move Faster.mp4', 0, 0, 0, 0, 'Empty', 0, 1, '2020-06-14 23:33:10', '2020-06-14 23:33:10');
INSERT INTO `edu_video` VALUES ('1272190641576660993', '1272189831400706050', '1272190423951003649', '第一课时：', 'a3059b616ffd46ed9cdd6bf54cae00da', '6 - What If I Want to Move Faster.mp4', 5, 0, 0, 0, 'Empty', 0, 1, '2020-06-14 23:34:20', '2020-06-14 23:34:20');
INSERT INTO `edu_video` VALUES ('17', '18', '15', '第一节：Java简介', 'a3059b616ffd46ed9cdd6bf54cae00da', '6 - What If I Want to Move Faster.mp4', 1, 1000, 1, 100, 'Draft', 0, 1, '2019-01-01 13:08:57', '2019-10-11 11:26:39');
INSERT INTO `edu_video` VALUES ('18', '18', '15', '第二节：表达式和赋值语句', 'a3059b616ffd46ed9cdd6bf54cae00da', '7 - How Do I Find Time for My ', 2, 999, 1, 100, 'Draft', 0, 1, '2019-01-01 13:09:02', '2019-03-08 03:30:27');
INSERT INTO `edu_video` VALUES ('19', '18', '15', '第三节：String类', 'a3059b616ffd46ed9cdd6bf54cae00da', 'eae2b847ef8503b81f5d5593d769dde2.mp4', 3, 888, 0, 100, 'Draft', 0, 1, '2019-01-01 13:09:05', '2019-11-12 12:50:45');

-- ----------------------------
-- Table structure for members
-- ----------------------------
DROP TABLE IF EXISTS `members`;
CREATE TABLE `members`  (
  `id` int(0) NOT NULL,
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `age` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for statistics_daily
-- ----------------------------
DROP TABLE IF EXISTS `statistics_daily`;
CREATE TABLE `statistics_daily`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `date_calculated` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '统计日期',
  `register_num` int(0) NOT NULL DEFAULT 0 COMMENT '注册人数',
  `login_num` int(0) NOT NULL DEFAULT 0 COMMENT '登录人数',
  `video_view_num` int(0) NOT NULL DEFAULT 0 COMMENT '每日播放视频数',
  `course_num` int(0) NOT NULL DEFAULT 0 COMMENT '每日新增课程数',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `statistics_day`(`date_calculated`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '网站统计日数据' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of statistics_daily
-- ----------------------------
INSERT INTO `statistics_daily` VALUES ('1276409810606215169', '2019-01-19', 3, 120, 156, 192, '2020-06-26 14:59:48', '2020-06-26 14:59:48');
INSERT INTO `statistics_daily` VALUES ('1276413540441378817', '2019-11-05', 2, 174, 143, 160, '2020-06-26 15:14:37', '2020-06-26 15:14:37');
INSERT INTO `statistics_daily` VALUES ('1276419794274471937', '2020-06-20', 1, 114, 165, 163, '2020-06-26 15:39:28', '2020-06-26 15:39:28');
INSERT INTO `statistics_daily` VALUES ('1276443575055343617', '2020-06-13', 1, 151, 105, 120, '2020-06-26 17:13:58', '2020-06-26 17:13:58');
INSERT INTO `statistics_daily` VALUES ('1297404784336183298', '2020-08-23', 0, 165, 147, 152, '2020-08-23 13:26:20', '2020-08-23 13:26:20');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `order_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '订单号',
  `course_id` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '课程id',
  `course_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '课程名称',
  `course_cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '课程封面',
  `teacher_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '讲师名称',
  `member_id` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '会员id',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员昵称',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员手机',
  `total_fee` decimal(10, 2) NULL DEFAULT 0.01 COMMENT '订单金额（分）',
  `pay_type` tinyint(0) NULL DEFAULT NULL COMMENT '支付类型（1：微信 2：支付宝）',
  `status` tinyint(0) NULL DEFAULT NULL COMMENT '订单状态（0：未支付 1：已支付）',
  `is_deleted` tinyint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ux_order_no`(`order_no`) USING BTREE,
  INDEX `idx_course_id`(`course_id`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '订单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('1195693605513891841', '1195693605555834880', '18', 'Java精品课程', 'http://guli-file.oss-cn-beijing.aliyuncs.com/cover/2019/03/06/866e9aca-b530-4f71-a690-72d4a4bfd1e7.jpg', '晴天', '1', '小三1231', '13700000001', 1.00, NULL, 0, 0, '2019-11-16 21:22:25', '2019-11-16 21:22:25');
INSERT INTO `t_order` VALUES ('1195694200178118657', '1195694200186507264', '18', 'Java精品课程', 'http://guli-file.oss-cn-beijing.aliyuncs.com/cover/2019/03/06/866e9aca-b530-4f71-a690-72d4a4bfd1e7.jpg', '晴天', '1', '小三1231', '13700000001', 1.00, NULL, 0, 0, '2019-11-16 21:24:47', '2019-11-16 21:24:47');
INSERT INTO `t_order` VALUES ('1196264007411744769', '1196264005255872512', '1192252213659774977', 'java基础课程：test', 'https://guli-file-190513.oss-cn-beijing.aliyuncs.com/cover/default.gif', '晴天', '1', '小三1231', '13700000001', 1.00, NULL, 1, 0, '2019-11-18 11:09:00', '2019-11-18 11:10:14');
INSERT INTO `t_order` VALUES ('1196265495278174209', '1196265495273979904', '18', 'Java精品课程', 'http://guli-file.oss-cn-beijing.aliyuncs.com/cover/2019/03/06/866e9aca-b530-4f71-a690-72d4a4bfd1e7.jpg', '晴天', '1', '小三1231', '13700000001', 1.00, NULL, 0, 0, '2019-11-18 11:14:54', '2019-11-18 11:14:54');
INSERT INTO `t_order` VALUES ('1274625214784860161', '20200621164826775', '1260488592178814977', 'java基础', 'https://online-edu-zy1024.oss-cn-beijing.aliyuncs.com/2020/05/13/7977da8dcca4445da521a1c420e49bf8java.jpg', '张三', '1274251730602696705', 'jk', '15717347348', 0.00, 1, 0, 0, '2020-06-21 16:48:27', '2020-06-21 16:48:27');
INSERT INTO `t_order` VALUES ('1274625379113496578', '20200621164906192', '1272189831400706050', 'spring精通', 'https://online-edu-zy1024.oss-cn-beijing.aliyuncs.com/2020/06/14/bbb1839b3f604ca18bb3db21528f6a19springboot.jpg', '李想', '1274251730602696705', 'jk', '15717347348', 198.00, 1, 0, 0, '2020-06-21 16:49:06', '2020-06-21 16:49:06');
INSERT INTO `t_order` VALUES ('1276092681541513218', '20200625175938612', '1269130800289284097', 'mysql数据库优化', 'https://online-edu-zy1024.oss-cn-beijing.aliyuncs.com/2020/05/13/7977da8dcca4445da521a1c420e49bf8java.jpg', '猪八戒', '1274251730602696705', 'jk', '15717347348', 0.01, 1, 1, 0, '2020-06-25 17:59:39', '2020-06-25 18:01:40');
INSERT INTO `t_order` VALUES ('1276096448433352706', '20200625181436466', '1269131226069860353', 'vue框架', 'https://online-edu-zy1024.oss-cn-beijing.aliyuncs.com/2020/05/13/7977da8dcca4445da521a1c420e49bf8java.jpg', '孙悟空', '1274251730602696705', 'jk', '15717347348', 0.00, 1, 0, 0, '2020-06-25 18:14:37', '2020-06-25 18:14:37');
INSERT INTO `t_order` VALUES ('1276096696056569858', '20200625181535936', '1269131226069860353', 'vue框架', 'https://online-edu-zy1024.oss-cn-beijing.aliyuncs.com/2020/05/13/7977da8dcca4445da521a1c420e49bf8java.jpg', '孙悟空', '1274251730602696705', 'jk', '15717347348', 0.00, 1, 0, 0, '2020-06-25 18:15:36', '2020-06-25 18:15:36');
INSERT INTO `t_order` VALUES ('1276097018170830850', '20200625181652096', '1260488592178814977', 'java基础', 'https://online-edu-zy1024.oss-cn-beijing.aliyuncs.com/2020/05/13/7977da8dcca4445da521a1c420e49bf8java.jpg', '张三', '1274251730602696705', 'jk', '15717347348', 0.01, 1, 0, 0, '2020-06-25 18:16:53', '2020-06-25 18:16:53');
INSERT INTO `t_order` VALUES ('1276097204934799362', '20200625181737926', '1269131226069860353', 'vue框架', 'https://online-edu-zy1024.oss-cn-beijing.aliyuncs.com/2020/05/13/7977da8dcca4445da521a1c420e49bf8java.jpg', '孙悟空', '1274251730602696705', 'jk', '15717347348', 0.00, 1, 0, 0, '2020-06-25 18:17:37', '2020-06-25 18:17:37');
INSERT INTO `t_order` VALUES ('1276120367311630338', '20200625194939888', '1265143811223330817', 'mysql数据库学习', 'https://online-edu-zy1024.oss-cn-beijing.aliyuncs.com/2020/05/13/7977da8dcca4445da521a1c420e49bf8java.jpg', '孙悟空', '1274251730602696705', 'jk', '15717347348', 0.01, 1, 1, 0, '2020-06-25 19:49:39', '2020-06-25 19:51:15');
INSERT INTO `t_order` VALUES ('1279318901242564610', '20200704153928747', '1264209500466946049', 'Java', 'https://online-edu-zy1024.oss-cn-beijing.aliyuncs.com/2020/05/13/7977da8dcca4445da521a1c420e49bf8java.jpg', '王某', '1274251730602696705', 'jk', '15717347348', 0.01, 1, 0, 0, '2020-07-04 15:39:29', '2020-07-04 15:39:29');
INSERT INTO `t_order` VALUES ('1279318908494516226', '20200704153931110', '1264209500466946049', 'Java', 'https://online-edu-zy1024.oss-cn-beijing.aliyuncs.com/2020/05/13/7977da8dcca4445da521a1c420e49bf8java.jpg', '王某', '1274251730602696705', 'jk', '15717347348', 0.01, 1, 0, 0, '2020-07-04 15:39:31', '2020-07-04 15:39:31');
INSERT INTO `t_order` VALUES ('1297402081795198978', '20200823131534504', '1264209500466946049', 'Java', 'https://online-edu-zy1024.oss-cn-beijing.aliyuncs.com/2020/05/13/7977da8dcca4445da521a1c420e49bf8java.jpg', '王某', '1271680624217849857', 'Just be you', '', 0.01, 1, 0, 0, '2020-08-23 13:15:36', '2020-08-23 13:15:36');

-- ----------------------------
-- Table structure for t_pay_log
-- ----------------------------
DROP TABLE IF EXISTS `t_pay_log`;
CREATE TABLE `t_pay_log`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `order_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '订单号',
  `pay_time` datetime(0) NULL DEFAULT NULL COMMENT '支付完成时间',
  `total_fee` decimal(10, 2) NULL DEFAULT 0.01 COMMENT '支付金额（分）',
  `transaction_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '交易流水号',
  `trade_state` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '交易状态',
  `pay_type` tinyint(0) NOT NULL DEFAULT 0 COMMENT '支付类型（1：微信 2：支付宝）',
  `attr` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '其他属性',
  `is_deleted` tinyint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_order_no`(`order_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '支付日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_pay_log
-- ----------------------------
INSERT INTO `t_pay_log` VALUES ('1194498446013001730', '1194498300579704832', '2019-11-13 14:13:17', 1.00, '4200000469201911130676624386', 'SUCCESS', 1, '{\"transaction_id\":\"4200000469201911130676624386\",\"nonce_str\":\"2Lc23ILl231It53M\",\"trade_state\":\"SUCCESS\",\"bank_type\":\"CFT\",\"openid\":\"oNpSGwR-QGG5DaZtDkh2UZlsFDQE\",\"sign\":\"5404850AA3ED0E844DE104651477F07A\",\"return_msg\":\"OK\",\"fee_type\":\"CNY\",\"mch_id\":\"1473426802\",\"cash_fee\":\"1\",\"out_trade_no\":\"1194498300579704832\",\"cash_fee_type\":\"CNY\",\"appid\":\"wx8397f8696b538317\",\"total_fee\":\"1\",\"trade_state_desc\":\"支付成功\",\"trade_type\":\"NATIVE\",\"result_code\":\"SUCCESS\",\"attach\":\"\",\"time_end\":\"20191113141314\",\"is_subscribe\":\"N\",\"return_code\":\"SUCCESS\"}', 0, '2019-11-13 14:13:17', '2019-11-13 14:13:17');
INSERT INTO `t_pay_log` VALUES ('1195253787449430017', '1195253049260314624', '2019-11-15 16:14:44', 1.00, '4200000454201911150981874895', 'SUCCESS', 1, '{\"transaction_id\":\"4200000454201911150981874895\",\"nonce_str\":\"MAM5UM4Xhv1lItvO\",\"trade_state\":\"SUCCESS\",\"bank_type\":\"CFT\",\"openid\":\"oNpSGwR-QGG5DaZtDkh2UZlsFDQE\",\"sign\":\"7DBDCAF4A078B30BB3EF073E6A238C20\",\"return_msg\":\"OK\",\"fee_type\":\"CNY\",\"mch_id\":\"1473426802\",\"cash_fee\":\"1\",\"out_trade_no\":\"1195253049260314624\",\"cash_fee_type\":\"CNY\",\"appid\":\"wx8397f8696b538317\",\"total_fee\":\"1\",\"trade_state_desc\":\"支付成功\",\"trade_type\":\"NATIVE\",\"result_code\":\"SUCCESS\",\"attach\":\"\",\"time_end\":\"20191115161440\",\"is_subscribe\":\"N\",\"return_code\":\"SUCCESS\"}', 0, '2019-11-15 16:14:44', '2019-11-15 16:14:44');
INSERT INTO `t_pay_log` VALUES ('1196264321397342210', '20200623232120098', '2019-11-18 11:10:14', 1.00, '4200000453201911184025781554', 'SUCCESS', 1, '{\"transaction_id\":\"4200000453201911184025781554\",\"nonce_str\":\"D1dHexCLIFIxAAg2\",\"trade_state\":\"SUCCESS\",\"bank_type\":\"CFT\",\"openid\":\"oNpSGwR-QGG5DaZtDkh2UZlsFDQE\",\"sign\":\"C9F5CA1EE49EA7891736D73BEB423962\",\"return_msg\":\"OK\",\"fee_type\":\"CNY\",\"mch_id\":\"1473426802\",\"cash_fee\":\"1\",\"out_trade_no\":\"1196264005255872512\",\"cash_fee_type\":\"CNY\",\"appid\":\"wx8397f8696b538317\",\"total_fee\":\"1\",\"trade_state_desc\":\"支付成功\",\"trade_type\":\"NATIVE\",\"result_code\":\"SUCCESS\",\"attach\":\"\",\"time_end\":\"20191118111011\",\"is_subscribe\":\"N\",\"return_code\":\"SUCCESS\"}', 0, '2019-11-18 11:10:14', '2019-11-18 11:10:14');
INSERT INTO `t_pay_log` VALUES ('1276120766844252161', '20200625194939888', '2020-06-25 19:51:15', 0.01, '4200000620202006252967477630', 'SUCCESS', 1, '{\"transaction_id\":\"4200000620202006252967477630\",\"nonce_str\":\"3hUZ2SGlAUXYcmXz\",\"trade_state\":\"SUCCESS\",\"bank_type\":\"OTHERS\",\"openid\":\"oHwsHuCVpHiORgLSdRkMZWNpvPyg\",\"sign\":\"4D17A2D71071099860F4358C2F7A4E7F\",\"return_msg\":\"OK\",\"fee_type\":\"CNY\",\"mch_id\":\"1558950191\",\"cash_fee\":\"1\",\"out_trade_no\":\"20200625194939888\",\"cash_fee_type\":\"CNY\",\"appid\":\"wx74862e0dfcf69954\",\"total_fee\":\"1\",\"trade_state_desc\":\"支付成功\",\"trade_type\":\"NATIVE\",\"result_code\":\"SUCCESS\",\"attach\":\"\",\"time_end\":\"20200625195114\",\"is_subscribe\":\"N\",\"return_code\":\"SUCCESS\"}', 0, '2020-06-25 19:51:15', '2020-06-25 19:51:15');

-- ----------------------------
-- Table structure for ucenter_member
-- ----------------------------
DROP TABLE IF EXISTS `edu_ucenter`;
CREATE TABLE `edu_ucenter`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '会员id',
  `openid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '微信openid',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '昵称',
  `sex` tinyint(0) UNSIGNED NULL DEFAULT NULL COMMENT '性别 1 女，2 男',
  `age` tinyint(0) UNSIGNED NULL DEFAULT NULL COMMENT '年龄',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户头像',
  `sign` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户签名',
  `is_disabled` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否禁用 1（true）已禁用，  0（false）未禁用',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '会员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ucenter_member
-- ----------------------------
INSERT INTO `edu_ucenter` VALUES ('1086387099608825858', NULL, '13520191381', '96e79218965eb72c92a549dd5a330112', '用户EoyWUVXQoP', 1, 18, 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132', NULL, 0, 0, '2019-01-19 06:17:23', '2019-01-19 06:17:23');

SET FOREIGN_KEY_CHECKS = 1;