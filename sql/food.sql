/*
 Navicat Premium Data Transfer

 Source Server         : 美食网站
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : food

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 17/02/2025 20:21:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ingredient
-- ----------------------------
DROP TABLE IF EXISTS `ingredient`;
CREATE TABLE `ingredient`  (
  `ingredient_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '食材id',
  `recipe_id` bigint(20) NOT NULL COMMENT '食谱id',
  `ingredient_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '存储食材的名称',
  `ingredient_quantity` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '记录食材的用量',
  PRIMARY KEY (`ingredient_id`) USING BTREE,
  INDEX `recipe_id`(`recipe_id` ASC) USING BTREE,
  CONSTRAINT `recipe_id` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 118 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '食材表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ingredient
-- ----------------------------
INSERT INTO `ingredient` VALUES (9, 39, '年糕', '200克');
INSERT INTO `ingredient` VALUES (10, 39, '午餐肉', '120克');
INSERT INTO `ingredient` VALUES (11, 39, '绿豆芽', '100克');
INSERT INTO `ingredient` VALUES (12, 39, '上海青', '200克');
INSERT INTO `ingredient` VALUES (13, 39, '鸡蛋', '2颗');
INSERT INTO `ingredient` VALUES (14, 39, '生抽', '1勺');
INSERT INTO `ingredient` VALUES (15, 39, '老抽', '半勺');
INSERT INTO `ingredient` VALUES (16, 39, '白糖', '1小勺');
INSERT INTO `ingredient` VALUES (17, 39, '辣椒油', '2勺');
INSERT INTO `ingredient` VALUES (18, 44, '梅花肉', '500g');
INSERT INTO `ingredient` VALUES (19, 44, '生抽', '1大勺');
INSERT INTO `ingredient` VALUES (20, 44, '料酒', '1大勺');
INSERT INTO `ingredient` VALUES (21, 44, '陈醋', '1大勺');
INSERT INTO `ingredient` VALUES (22, 44, '细砂糖', '1小勺');
INSERT INTO `ingredient` VALUES (23, 44, '鸡蛋液', '2大勺');
INSERT INTO `ingredient` VALUES (24, 44, '五香粉', '1/2小勺');
INSERT INTO `ingredient` VALUES (25, 44, '胡椒粉', '1/2小勺');
INSERT INTO `ingredient` VALUES (26, 44, '盐', '1/2小勺');
INSERT INTO `ingredient` VALUES (27, 44, '地瓜粉', '60g');
INSERT INTO `ingredient` VALUES (28, 44, '姜蒜', '少许');
INSERT INTO `ingredient` VALUES (29, 45, '西红柿', '2个');
INSERT INTO `ingredient` VALUES (30, 45, '鸡蛋', '2个');
INSERT INTO `ingredient` VALUES (31, 45, '小葱', '2根');
INSERT INTO `ingredient` VALUES (32, 45, '盐', '3克');
INSERT INTO `ingredient` VALUES (33, 45, '白糖', '2克	');
INSERT INTO `ingredient` VALUES (34, 45, '鸡精', '2克	');
INSERT INTO `ingredient` VALUES (35, 45, '料酒', '5克');
INSERT INTO `ingredient` VALUES (36, 45, '食用油', '适量');
INSERT INTO `ingredient` VALUES (37, 46, '鸡翅', '十只');
INSERT INTO `ingredient` VALUES (38, 46, '可乐', '300ml');
INSERT INTO `ingredient` VALUES (39, 46, '姜', '一小块');
INSERT INTO `ingredient` VALUES (40, 46, '盐', '3克');
INSERT INTO `ingredient` VALUES (41, 46, '酱油', '5ml	');
INSERT INTO `ingredient` VALUES (42, 46, '八角', '2个');
INSERT INTO `ingredient` VALUES (43, 47, '虾仁，鸡蛋', '220克');
INSERT INTO `ingredient` VALUES (44, 47, '食用油，盐，淀粉', '适量');
INSERT INTO `ingredient` VALUES (45, 47, '白胡椒，料酒，牛奶', '适量');
INSERT INTO `ingredient` VALUES (49, 51, '北豆腐', '1块');
INSERT INTO `ingredient` VALUES (50, 51, '木耳', '适量');
INSERT INTO `ingredient` VALUES (51, 51, '猪肉', '适量');
INSERT INTO `ingredient` VALUES (52, 51, '青尖椒', '1个');
INSERT INTO `ingredient` VALUES (53, 51, '胡萝卜', '1小段	');
INSERT INTO `ingredient` VALUES (54, 51, '葱花', '少量');
INSERT INTO `ingredient` VALUES (55, 51, '蒜', '2瓣');
INSERT INTO `ingredient` VALUES (56, 51, '食用油', '适量');
INSERT INTO `ingredient` VALUES (57, 51, '生抽', '1大匙	');
INSERT INTO `ingredient` VALUES (58, 51, '	老抽', '小半匙');
INSERT INTO `ingredient` VALUES (59, 51, '蚝油', '半匙');
INSERT INTO `ingredient` VALUES (60, 51, '淀粉', '适量');
INSERT INTO `ingredient` VALUES (61, 51, '鸡精', '适量');
INSERT INTO `ingredient` VALUES (62, 51, '清水', '小半碗');
INSERT INTO `ingredient` VALUES (81, 99, '面线', '1捆半');
INSERT INTO `ingredient` VALUES (82, 99, '蛋皮', '1张');
INSERT INTO `ingredient` VALUES (83, 99, '炒虾仁', '1盘');
INSERT INTO `ingredient` VALUES (84, 99, '醋肉', '1碟');
INSERT INTO `ingredient` VALUES (85, 99, '卤蛋', '8个');
INSERT INTO `ingredient` VALUES (86, 99, '小肠', '2条');
INSERT INTO `ingredient` VALUES (87, 99, '肥肠', '1条');
INSERT INTO `ingredient` VALUES (88, 99, '套肠', '4个');
INSERT INTO `ingredient` VALUES (89, 99, '香碎', '半小碗');
INSERT INTO `ingredient` VALUES (90, 99, '当归', '1小片');
INSERT INTO `ingredient` VALUES (91, 99, '桂枝', '2根');
INSERT INTO `ingredient` VALUES (92, 99, '香叶', '3片');
INSERT INTO `ingredient` VALUES (93, 99, '酱油', '3匙');
INSERT INTO `ingredient` VALUES (94, 99, '味精', '2小匙');
INSERT INTO `ingredient` VALUES (95, 99, '盐', '半小匙');
INSERT INTO `ingredient` VALUES (96, 99, '高汤块', '2个');
INSERT INTO `ingredient` VALUES (97, 99, '鸡精', '1小匙');
INSERT INTO `ingredient` VALUES (98, 99, '白胡椒粉', '3转');
INSERT INTO `ingredient` VALUES (99, 99, '水淀粉', '半碗');
INSERT INTO `ingredient` VALUES (100, 99, '油条', '4条');
INSERT INTO `ingredient` VALUES (101, 100, '琵笆腿', '1000克	');
INSERT INTO `ingredient` VALUES (102, 100, '葱姜', '适量');
INSERT INTO `ingredient` VALUES (103, 100, '蚝油', '3.5泵');
INSERT INTO `ingredient` VALUES (104, 100, '姜粉', '适量');
INSERT INTO `ingredient` VALUES (105, 100, '花椒', '几粒	');
INSERT INTO `ingredient` VALUES (106, 100, '大料', '1个');
INSERT INTO `ingredient` VALUES (107, 100, '生抽', '适量');
INSERT INTO `ingredient` VALUES (108, 100, '白糖', '2勺');
INSERT INTO `ingredient` VALUES (109, 100, '油', '适量');
INSERT INTO `ingredient` VALUES (110, 100, '黄酒', '2勺');
INSERT INTO `ingredient` VALUES (111, 100, '辣椒', '2个');
INSERT INTO `ingredient` VALUES (112, 101, '狭鳕鱼柳', '1条');
INSERT INTO `ingredient` VALUES (113, 101, '鸡蛋', '2个');
INSERT INTO `ingredient` VALUES (114, 101, '水', '160克');
INSERT INTO `ingredient` VALUES (115, 101, '盐', '2克');
INSERT INTO `ingredient` VALUES (116, 101, '小葱', '2根');
INSERT INTO `ingredient` VALUES (117, 101, '香油', '1勺');
INSERT INTO `ingredient` VALUES (118, 103, '芒果(基底)', '0.5个');
INSERT INTO `ingredient` VALUES (119, 103, '香蕉(基底)', '1根');
INSERT INTO `ingredient` VALUES (120, 103, '白梨(基底)', '1个');
INSERT INTO `ingredient` VALUES (121, 103, '安佳牛奶(基底)', '10ml');
INSERT INTO `ingredient` VALUES (122, 103, '安佳淡奶油(图案)', '30ml');
INSERT INTO `ingredient` VALUES (123, 103, '红曲粉(图案)', '3g');
INSERT INTO `ingredient` VALUES (124, 103, '姜黄粉(图案)', '3g');
INSERT INTO `ingredient` VALUES (125, 103, '竹炭粉(图案)', '3g');
INSERT INTO `ingredient` VALUES (126, 103, '糖珠(装饰)', '15颗');

-- ----------------------------
-- Table structure for likes
-- ----------------------------
DROP TABLE IF EXISTS `likes`;
CREATE TABLE `likes`  (
  `like_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '点赞id',
  `recipe_id` bigint(20) NOT NULL COMMENT '食谱id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`like_id`) USING BTREE,
  INDEX `recipe_id`(`recipe_id` ASC) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 171 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '点赞表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of likes
-- ----------------------------
INSERT INTO `likes` VALUES (122, 39, 1, '2025-01-15 16:50:24');
INSERT INTO `likes` VALUES (127, 44, 2, '2025-01-18 17:24:36');
INSERT INTO `likes` VALUES (128, 44, 100, '2025-01-18 17:24:52');
INSERT INTO `likes` VALUES (129, 44, 101, '2025-01-18 17:25:08');
INSERT INTO `likes` VALUES (138, 45, 108, '2025-01-19 17:18:38');
INSERT INTO `likes` VALUES (150, 44, 108, '2025-01-24 21:16:09');
INSERT INTO `likes` VALUES (152, 46, 108, '2025-01-24 21:39:29');
INSERT INTO `likes` VALUES (153, 51, 108, '2025-01-24 21:39:32');
INSERT INTO `likes` VALUES (154, 47, 108, '2025-01-24 21:39:34');
INSERT INTO `likes` VALUES (158, 39, 108, '2025-01-25 16:15:37');
INSERT INTO `likes` VALUES (159, 44, 1, '2025-01-26 15:28:57');
INSERT INTO `likes` VALUES (160, 51, 1, '2025-01-26 15:34:58');
INSERT INTO `likes` VALUES (161, 51, 109, '2025-01-26 20:06:57');
INSERT INTO `likes` VALUES (162, 44, 109, '2025-01-26 20:07:03');
INSERT INTO `likes` VALUES (163, 44, 110, '2025-02-13 19:40:14');
INSERT INTO `likes` VALUES (164, 46, 1, '2025-02-13 20:25:58');
INSERT INTO `likes` VALUES (165, 47, 1, '2025-02-13 20:26:01');
INSERT INTO `likes` VALUES (166, 45, 1, '2025-02-13 20:27:04');
INSERT INTO `likes` VALUES (167, 99, 110, '2025-02-13 22:53:18');
INSERT INTO `likes` VALUES (168, 46, 112, '2025-02-16 13:22:27');
INSERT INTO `likes` VALUES (169, 100, 112, '2025-02-16 13:55:20');
INSERT INTO `likes` VALUES (170, 101, 111, '2025-02-16 14:09:41');
INSERT INTO `likes` VALUES (171, 101, 1, '2025-02-17 16:43:59');
INSERT INTO `likes` VALUES (172, 99, 114, '2025-02-17 19:10:47');
INSERT INTO `likes` VALUES (173, 103, 114, '2025-02-17 19:27:22');

-- ----------------------------
-- Table structure for recipe
-- ----------------------------
DROP TABLE IF EXISTS `recipe`;
CREATE TABLE `recipe`  (
  `recipe_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '食谱id',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `recipe_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '存储食谱的名称',
  `recipe_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '食谱简介，用于描述食谱的一些基本信息，如口味、适合人群等',
  `recipe_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '成品图片',
  `state` int(11) NULL DEFAULT NULL COMMENT '审核状态，0为未审核，1为审核通过，2为审核未通过，食谱创建默认为0。',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `variety` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜系',
  `likes` int(11) NULL DEFAULT NULL COMMENT '点赞数',
  `review` int(11) NULL DEFAULT NULL COMMENT '评论数',
  PRIMARY KEY (`recipe_id`) USING BTREE,
  INDEX `recipe_ibfk_1`(`user_id` ASC) USING BTREE,
  CONSTRAINT `recipe_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '食谱表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of recipe
-- ----------------------------
INSERT INTO `recipe` VALUES (39, 1, '热辣炒年糕', '花样主食 热辣炒年糕吃出幸福感', '/profile/upload/2025/01/14/960_3733996944a5340a0accc724bf227fe0_20250114004335A001.jpg', 1, '2025-01-14 00:48:39', '2025-01-22 19:08:10', '2', 2, 1);
INSERT INTO `recipe` VALUES (44, 1, '泉州炸醋肉', '炸醋肉是泉州一道独具特色的地道闽南小吃，顾名思义,之所以叫醋肉,其主要的调料,当然少不了醋,它外表金黄，吃起来外酥里嫩，带着淡淡的醋香，既可当零食解馋，也是面线糊等美食的配料。在泉州，不管是五星级酒店，抑或是街边的面线糊店，或者是在普通市民家中的餐桌上，你都可以见到它的身影。', '/profile/upload/2025/01/15/960_33b96ad776efe297847e34ea00ec54cf_20250115145748A001.jpg', 1, '2025-01-15 15:04:02', NULL, '0', 7, 16);
INSERT INTO `recipe` VALUES (45, 1, '西红柿炒鸡蛋', '西红柿炒鸡蛋', '/profile/upload/2025/01/15/960_f4226c5caa3aa04a73905fd0949c586b_20250115162808A010.jpg', 1, '2025-01-15 16:34:06', NULL, '2', 2, 1);
INSERT INTO `recipe` VALUES (46, 1, '可乐鸡翅', '这道菜做法简单、味道鲜美、色泽艳丽、咸甜适中、入口嫩滑，既保留了可乐的香气又让鸡翅裹上了诱人焦糖色，深爱大家喜欢。尤其是年轻人，更喜欢做给心爱的人吃。', '/profile/upload/2025/01/17/960_88abe3bcf16331749877132629ad3970_20250117213619A001.jpg', 1, '2025-01-17 21:39:10', NULL, '2', 3, 1);
INSERT INTO `recipe` VALUES (47, 1, '滑蛋虾仁', '滑蛋虾仁，省传统的特色名菜，属于粤菜系。 主要体现在滑字上，所以如果没有点小方法，就变成鸡蛋炒虾仁了。', '/profile/upload/2025/01/17/960_4f160193689ab79b3299f6481e364a88_20250117214932A009.jpg', 1, '2025-01-17 21:52:25', NULL, '1', 2, 1);
INSERT INTO `recipe` VALUES (51, 108, '家常豆腐', '豆腐是东北家常菜，吃法很多，家常豆腐就是其中之一，外脆里软，咸鲜微辣，下饭菜。', '/profile/upload/2025/01/22/960_60cc868c10ffd94a24a0cb110c8d984d_20250122143727A002.jpg', 1, '2025-01-22 14:43:15', '2025-01-25 16:44:37', '2', 3, 0);
INSERT INTO `recipe` VALUES (99, 110, '泉州面线糊', '今天要分享给大家的美食是泉州的地方特色小吃之一“面线糊”，如果说什么美食最出名。我想应该就是它了，它不仅是早餐也是夜宵。  之所以能得到大家的欢迎，主要是它的搭配众多口感顺滑好吃。与其说吃面线糊，不如说是吃料。当你光临早餐摊可以根据个人的喜好去选择搭配，如果想自己煮也是能轻松做到。根据粉丝的要求，我给出了一个居家的做法教程。看似麻烦的背后，实际上很简单。只要食材准备好就能轻松制作，话不多说。详细教程用两分钟看看吧！', '/profile/upload/2025/02/13/960_43099e8327a3d0096439038ab04d6e21_20250213224451A002.jpg', 1, '2025-02-13 22:51:54', NULL, '0', 2, 2);
INSERT INTO `recipe` VALUES (100, 112, '空气炸锅香烤大鸡腿', '非常好吃哦，还很容易脱骨', '/profile/upload/2025/02/16/960_7af30a45aa9639ce083f8481e80584df_20250216135233A001.jpg', 1, '2025-02-16 13:55:13', '2025-02-16 13:56:58', '2', 1, 1);
INSERT INTO `recipe` VALUES (101, 1, '狭鳕鱼柳蛋羹', '阿拉斯加狭鳕鱼柳肉质很细嫩，无刺，蒸煮炒都好吃，特别适合小朋友们吃，配上蒸蛋营养丰富又好吃', '/profile/upload/2025/02/16/960_6208487328c5862ef73c467946a974b0_20250216140344A006.jpeg', 1, '2025-02-16 14:06:32', NULL, '7', 2, 1);
INSERT INTO `recipe` VALUES (103, 114, '思慕雪之小哪吒', '思慕雪是风靡全世界健康料理，缤纷的色彩都是由天然的蔬果萃取，而作为其中重要成分的安佳牛奶，是来自新西兰纯净新鲜、安全优质的乳品，自2013年正式登陆中国市场以来，安佳已经成为线上线下销量第一的进口常温奶品牌。  安佳也是中国家庭烘焙料理大赛的唯一指定使用乳制品；  甘甜营养的芒果、香蕉、白梨与奶香浓郁的安佳牛奶混合，打造出了这款即梦幻又好味的思慕雪小哪吒。', '/profile/upload/2025/02/17/960_debde068939599d41df257463f9ebc19_20250217192228A003.jpg', 1, '2025-02-17 19:26:25', '2025-02-17 19:27:04', '6', 1, 2);

-- ----------------------------
-- Table structure for review
-- ----------------------------
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review`  (
  `review_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `recipe_id` bigint(20) NOT NULL COMMENT '食谱id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `nick_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户名称',
  `review` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '评论',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `p_id` bigint(20) NULL DEFAULT NULL COMMENT '父级id',
  `target` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '回复对象',
  `recipe_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '食谱名称',
  PRIMARY KEY (`review_id`) USING BTREE,
  INDEX `recipe_id`(`recipe_id` ASC) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of review
-- ----------------------------
INSERT INTO `review` VALUES (16, 39, 1, '雷总', '非常棒', '2025-02-13 16:50:21', NULL, NULL, '热辣炒年糕');
INSERT INTO `review` VALUES (17, 44, 1, '雷总', '我的最爱', '2025-02-13 16:50:41', NULL, NULL, '泉州炸醋肉');
INSERT INTO `review` VALUES (18, 44, 110, 'hhhhh', '很好吃', '2025-02-13 19:40:42', NULL, NULL, '泉州炸醋肉');
INSERT INTO `review` VALUES (19, 44, 110, 'hhhhh', '123', '2025-02-13 20:08:16', NULL, NULL, '泉州炸醋肉');
INSERT INTO `review` VALUES (20, 44, 110, 'hhhhh', '1', '2025-02-13 20:12:18', NULL, '雷总', '泉州炸醋肉');
INSERT INTO `review` VALUES (21, 44, 110, 'hhhhh', '1', '2025-02-13 20:22:56', 17, '雷总', '泉州炸醋肉');
INSERT INTO `review` VALUES (22, 44, 1, '雷总', '很好', '2025-02-13 23:26:24', 17, '雷总', '泉州炸醋肉');
INSERT INTO `review` VALUES (23, 44, 110, '小黄', '1', '2025-02-13 23:36:54', 17, 'hhhhh', '泉州炸醋肉');
INSERT INTO `review` VALUES (24, 44, 110, '小黄', '1', '2025-02-13 23:37:25', 17, '雷总', '泉州炸醋肉');
INSERT INTO `review` VALUES (25, 44, 110, '小黄', '1', '2025-02-13 23:37:55', NULL, NULL, '泉州炸醋肉');
INSERT INTO `review` VALUES (26, 44, 1, '雷总', '1', '2025-02-13 23:38:10', 25, '小黄', '泉州炸醋肉');
INSERT INTO `review` VALUES (27, 44, 110, '小黄', '2', '2025-02-13 23:42:19', 25, '雷总', '泉州炸醋肉');
INSERT INTO `review` VALUES (29, 44, 1, '雷总', '666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666', '2025-02-14 00:01:10', 25, '小黄', '泉州炸醋肉');
INSERT INTO `review` VALUES (31, 44, 110, '小黄', '1', '2025-02-14 14:23:46', 30, '雷总', '泉州炸醋肉');
INSERT INTO `review` VALUES (32, 44, 110, '小黄', '11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111', '2025-02-14 14:40:03', NULL, NULL, '泉州炸醋肉');
INSERT INTO `review` VALUES (33, 44, 110, '小黄', '111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111', '2025-02-14 15:01:39', 25, '雷总', '泉州炸醋肉');
INSERT INTO `review` VALUES (34, 44, 110, '小黄', '8', '2025-02-14 15:05:53', NULL, NULL, '泉州炸醋肉');
INSERT INTO `review` VALUES (35, 45, 1, '雷总', '非常棒！！！', '2025-02-14 16:34:32', NULL, NULL, '西红柿炒鸡蛋');
INSERT INTO `review` VALUES (37, 46, 112, '赵六', '第一次做的一道菜，很nice！！！', '2025-02-16 13:21:35', NULL, NULL, '可乐鸡翅');
INSERT INTO `review` VALUES (38, 100, 1, '雷总', '不错不错', '2025-02-16 13:57:43', NULL, NULL, '空气炸锅香烤大鸡腿');
INSERT INTO `review` VALUES (39, 101, 111, '刘六', '孩子非常爱吃1', '2025-02-16 14:09:57', NULL, NULL, '狭鳕鱼柳蛋羹');
INSERT INTO `review` VALUES (40, 47, 111, '刘六', '简单易懂', '2025-02-16 14:10:54', NULL, NULL, '滑蛋虾仁');
INSERT INTO `review` VALUES (41, 99, 111, '刘六', '跟我在泉州吃的一模一样，很棒！！！', '2025-02-16 14:11:31', NULL, NULL, '泉州面线糊');
INSERT INTO `review` VALUES (43, 99, 114, '哪吒', '很喜欢', '2025-02-17 19:17:04', NULL, NULL, '泉州面线糊');
INSERT INTO `review` VALUES (44, 103, 114, '哪吒', '哈哈哈哈哈，魔童来也！！！', '2025-02-17 19:27:43', NULL, NULL, '思慕雪之小哪吒');
INSERT INTO `review` VALUES (45, 103, 1, '雷总', '若前方无路，我便踏出一条路！\n\n若天地不容，我便扭转这乾坤！', '2025-02-17 19:29:35', NULL, NULL, '思慕雪之小哪吒');

-- ----------------------------
-- Table structure for step
-- ----------------------------
DROP TABLE IF EXISTS `step`;
CREATE TABLE `step`  (
  `step_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '步骤id',
  `recipe_id` bigint(20) NOT NULL COMMENT '食谱id',
  `step_number` int(11) NULL DEFAULT NULL COMMENT '记录步骤的顺序',
  `step_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '详细描述该步骤的操作内容',
  `step_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '步骤图片',
  PRIMARY KEY (`step_id`) USING BTREE,
  INDEX `recipe_id`(`recipe_id` ASC) USING BTREE,
  CONSTRAINT `step_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 138 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '步骤表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of step
-- ----------------------------
INSERT INTO `step` VALUES (42, 39, 1, '食材处理如图： 鸡蛋，加几颗盐打散。 调料，混合。 上海青，洗净切段。 午餐肉，切成块状。', '/profile/upload/2025/01/14/800_9c7ab7ca6d5905ce480f345675cefa23_20250114004609A002.jpg');
INSERT INTO `step` VALUES (43, 39, 2, '年糕冷水下锅，煮到断生。', '/profile/upload/2025/01/14/800_6ac11134210b693479166bd806c49560_20250114004624A003.jpg');
INSERT INTO `step` VALUES (44, 39, 3, '锅中不放油，绿豆芽炒出香味捞出。', '/profile/upload/2025/01/14/800_79827570c0312e88e53fbaf3db6b6bb4_20250114004637A004.jpg');
INSERT INTO `step` VALUES (45, 39, 4, '热锅冷油，下鸡蛋滑熟捞出。', '/profile/upload/2025/01/14/800_bc31be4bae70f93e561f4cbc5599d17b_20250114004653A005.jpg');
INSERT INTO `step` VALUES (46, 39, 5, '下餐肉煎至微黄。', '/profile/upload/2025/01/14/800_23e9fabbf635476e069e0ffab9bdc3d8_20250114004705A006.jpg');
INSERT INTO `step` VALUES (47, 39, 6, '下上海青，翻炒几下。', '/profile/upload/2025/01/14/800_113672f13947d4300a3b2e28778286d7_20250114004724A007.jpg');
INSERT INTO `step` VALUES (48, 39, 7, '下年糕。', '/profile/upload/2025/01/14/800_321f46330bed785c9617088f044d5e08_20250114004746A008.jpg');
INSERT INTO `step` VALUES (49, 39, 8, '下绿豆芽、鸡蛋。', '/profile/upload/2025/01/14/800_71a668a31a5d4eb9c363c16c544b494f_20250114004806A009.jpg');
INSERT INTO `step` VALUES (50, 39, 9, '加入酱汁翻匀起锅。', '/profile/upload/2025/01/14/800_4d1979aab9de1cab67226d46b798906a_20250114004829A010.jpg');
INSERT INTO `step` VALUES (54, 44, 1, '梅花肉是猪的上肩肉，也叫胛心肉，就是长在猪的肩胛部位的肉,以瘦肉为主，约占90%左右，瘦肉之间夹杂着数条细细的肥肉丝，且肥肉丝纵横交错，所以被人们称之梅花肉。这部份肉肥瘦相间,且肥肉的比例特别的合适，不管是用什么烹制方法来做，都有口感油润滑嫩，肉质鲜香的特点,地道的泉州炸醋肉用的就是这部份肉。 调料用的勺子是厨房用量勺 1大勺等于15ml 1小勺等5ml', '/profile/upload/2025/01/15/800_5dc719e5d70c24ef01ac8698f6e075aa_20250115150146A002.jpg');
INSERT INTO `step` VALUES (55, 44, 2, '将猪肉洗净切片;', '/profile/upload/2025/01/15/800_af947e55ca4dd5096923721a37a0ea9b_20250115150159A003.jpg');
INSERT INTO `step` VALUES (56, 44, 3, '加入生抽、醋、料酒、盐、糖、胡椒粉、五香粉和蛋液,拌均匀,再切些姜片蒜片放进去一起腌制;', '/profile/upload/2025/01/15/800_316421c86c0a8c340bb0226985b375dc_20250115150216A004.jpg');
INSERT INTO `step` VALUES (57, 44, 4, '盖上保鲜膜,放入冰箱腌制两小时以上,腌制越久越入味;', '/profile/upload/2025/01/15/800_b591cbe6b33d6a0bf94cf772301f7d98_20250115150233A005.jpg');
INSERT INTO `step` VALUES (58, 44, 5, '将腌制好的肉片从冰箱取出,拣出里面的姜蒜片不要,再倒入地瓜粉(我当地叫番薯粉);', '/profile/upload/2025/01/15/800_020a5c9fd2b8532b584d3220efb8616f_20250115150259A006.jpg');
INSERT INTO `step` VALUES (59, 44, 6, '将肉片和地瓜粉搅拌均匀;', '/profile/upload/2025/01/15/800_d2433644f859409c14dc452fee29791d_20250115150326A007.jpg');
INSERT INTO `step` VALUES (60, 44, 7, '锅中倒入较多的油烧热,下入肉片开始炸,一次不要放入太多,我分两次炸;', '/profile/upload/2025/01/15/800_51fba4032b95931c4238214cd204ad76_20250115150345A008.jpg');
INSERT INTO `step` VALUES (61, 44, 8, '炸到肉片呈金黄色,就可以捞出了,不要炸太久哦,否则干巴巴。', '/profile/upload/2025/01/15/800_0d2cff7b68fb7f76c4a95ae9c5ce0d4e_20250115150400A009.jpg');
INSERT INTO `step` VALUES (62, 45, 1, '准备食材。', '/profile/upload/2025/01/15/800_668efc65fb55f8a720ecb5a8edc0ed00_20250115163022A011.jpg');
INSERT INTO `step` VALUES (63, 45, 2, '西红柿洗净去蒂切滚刀块。', '/profile/upload/2025/01/15/800_94ff9793fab45cc6036634fed9ee79aa_20250115163035A012.jpg');
INSERT INTO `step` VALUES (64, 45, 3, '葱洗净切葱花。', '/profile/upload/2025/01/15/800_e7a67d6f69233fe3d62defbcd4f35c53_20250115163126A013.jpg');
INSERT INTO `step` VALUES (65, 45, 4, '鸡蛋磕入碗中，加一点料酒和盐。', '/profile/upload/2025/01/15/800_9c01e9b70148709d3596a9f5cd4d5e17_20250115163139A014.jpg');
INSERT INTO `step` VALUES (66, 45, 5, '打散成蛋液。', '/profile/upload/2025/01/15/800_efbf29dd63379c65b24c40d4129a916e_20250115163152A015.jpg');
INSERT INTO `step` VALUES (67, 45, 6, '锅中适量油烧至8成热，倒入蛋液后关火。', '/profile/upload/2025/01/15/800_fd58bf1730be8a0aa7e61bdc0c79c28d_20250115163157A016.jpg');
INSERT INTO `step` VALUES (68, 45, 7, '用油的余温迅速将蛋液划散后盛出备用。', '/profile/upload/2025/01/15/800_222b8631a3a1dfdf3b96035a4f117d8a_20250115163213A017.jpg');
INSERT INTO `step` VALUES (69, 45, 8, '锅中留底油，下葱花爆香。', '/profile/upload/2025/01/15/800_971c80a04f59ca912a199de68854b179_20250115163222A018.jpg');
INSERT INTO `step` VALUES (70, 45, 9, '下入西红柿。', '/profile/upload/2025/01/15/800_9899d35510d5a5b6a29ed949971f6e76_20250115163245A020.jpg');
INSERT INTO `step` VALUES (71, 45, 10, '翻炒出汁。', '/profile/upload/2025/01/15/800_63f5ba2e6f9cf33d13eb077a7236a736_20250115163251A021.jpg');
INSERT INTO `step` VALUES (72, 45, 11, '倒入炒好的鸡蛋。', '/profile/upload/2025/01/15/800_0f07599f164a5dc10fb82ea6bac88eee_20250115163302A022.jpg');
INSERT INTO `step` VALUES (73, 45, 12, '翻炒均匀后加一点白糖提鲜。', '/profile/upload/2025/01/15/800_3d0a9597b4b2d64126b0adf068752c01_20250115163312A023.jpg');
INSERT INTO `step` VALUES (74, 45, 13, '最后再加适量的鸡精和少量的盐。', '/profile/upload/2025/01/15/800_b30f8edaa66171a079269eaf10143ab8_20250115163327A024.jpg');
INSERT INTO `step` VALUES (75, 45, 14, '翻炒均匀即可。', '/profile/upload/2025/01/15/800_0f07599f164a5dc10fb82ea6bac88eee_20250115163337A025.jpg');
INSERT INTO `step` VALUES (76, 45, 15, '出锅装盘后趁热撒上葱绿。', '/profile/upload/2025/01/15/800_c6b16525db2b4746dd81ae92c72edd26_20250115163357A026.jpg');
INSERT INTO `step` VALUES (77, 46, 1, '准备食材。', '/profile/upload/2025/01/17/800_7d3afaa33e4588433a1d618a263f82b7_20250117213733A002.jpg');
INSERT INTO `step` VALUES (78, 46, 2, '将鸡翅放到水中焯一下捞出备用。', '/profile/upload/2025/01/17/800_889dee3dca2ee1b1c5601becc37d31b1_20250117213744A003.jpg');
INSERT INTO `step` VALUES (79, 46, 3, '锅中少放一点点油，然后将鸡翅放锅中，小火煎至表面金黄。', '/profile/upload/2025/01/17/800_87b54737e619f48c4087e162eb6386e7_20250117213821A004.jpg');
INSERT INTO `step` VALUES (80, 46, 4, '把姜片、八角放入锅中，煸炒出香味。然后把可乐倒入锅中，再加少许酱油、盐提味，大火烧开后转小火炖15分钟。', '/profile/upload/2025/01/17/800_210375ba918d71279846e81cf772ea8f_20250117213833A005.jpg');
INSERT INTO `step` VALUES (81, 46, 5, '转大火收汁。收汁的时候要不停的用铲子翻动，直至鸡翅表面裹上焦糖色，锅中有明油渗出即可。', '/profile/upload/2025/01/17/800_ec4c78b9d55ca9eb711ce8eaee29eb7c_20250117213857A006.jpg');
INSERT INTO `step` VALUES (82, 46, 6, '装盘上桌即可。', '/profile/upload/2025/01/17/960_88abe3bcf16331749877132629ad3970_20250117213907A007.jpg');
INSERT INTO `step` VALUES (83, 47, 1, '虾仁加淀粉半勺，料酒半勺，白胡椒，盐和糖各一丢丢，拌均匀腌制半小时', '/profile/upload/2025/01/17/800_abd7b9355da0b13f4aba4e0aca1e7f36_20250117215022A010.jpg');
INSERT INTO `step` VALUES (84, 47, 2, '少许底油炒熟，出锅备用', '/profile/upload/2025/01/17/800_f20412366503f42e2231a29bd1e2710a_20250117215101A011.jpg');
INSERT INTO `step` VALUES (85, 47, 3, '鸡蛋放入葱花，盐，白胡椒，淀粉水', '/profile/upload/2025/01/17/800_2299ebb19d2e86e6686240848e1db966_20250117215122A012.jpg');
INSERT INTO `step` VALUES (86, 47, 4, '鸡蛋打成蛋液放入虾仁', '/profile/upload/2025/01/17/800_d2742b18a82f9cda78be28c324ea66ad_20250117215158A013.jpg');
INSERT INTO `step` VALUES (87, 47, 5, '放入油，油温升起倒入食材', '/profile/upload/2025/01/17/800_06a5c57b217067c4c41bec620c385225_20250117215208A014.jpg');
INSERT INTO `step` VALUES (88, 47, 6, '出锅，拌面也好，配菜也好，清清淡淡', '/profile/upload/2025/01/17/960_4f160193689ab79b3299f6481e364a88_20250117215222A015.jpg');
INSERT INTO `step` VALUES (108, 51, 1, '豆腐切1厘米左右厚的方形厚片，放入平底锅煎。', '/profile/upload/2025/01/25/800_d709043cec07ee9fdc80e9b5906e8982_20250125164141A002.jpg');
INSERT INTO `step` VALUES (109, 51, 2, '锅内油多些，煎至一面金黄翻面再煎。', '/profile/upload/2025/01/25/800_aaef6c3ff3dd5bdc4f47dccabc53f7de_20250125164157A003.jpg');
INSERT INTO `step` VALUES (110, 51, 3, '煎至两面金黄取出对角线切开呈三角形。', '/profile/upload/2025/01/25/800_7485c4fd737c7164b1065646c8f72ee7_20250125164211A004.jpg');
INSERT INTO `step` VALUES (111, 51, 4, '煎豆腐同时准备配菜，青椒切滚刀块，肉，胡萝卜，蒜切片，葱切末，泡发木耳洗净。', '/profile/upload/2025/01/25/800_06811b926fe1514cb0cebec67ba5ec6a_20250125164224A005.jpg');
INSERT INTO `step` VALUES (112, 51, 5, '锅内油烧热下肉片炒至变色放葱花，撒点胡椒面翻炒。', '/profile/upload/2025/01/25/800_06866dd622b8f4fb246c1d72948fff9c_20250125164311A008.jpg');
INSERT INTO `step` VALUES (113, 51, 6, '加胡萝卜，木耳翻炒。', '/profile/upload/2025/01/25/800_978dd329570ba4f2a82161d5e27453d9_20250125164301A007.jpg');
INSERT INTO `step` VALUES (114, 51, 7, '放辣椒翻炒。', '/profile/upload/2025/01/25/800_81a0224f6bd860c1d23e4fc7ac9cf6ab_20250125164321A009.jpg');
INSERT INTO `step` VALUES (115, 51, 8, '倒入用生抽，老抽，耗油，淀粉，鸡精，水调的碗汁快速炒匀。', '/profile/upload/2025/01/25/800_00a0402ca493633973207824d24472c5_20250125164340A010.jpg');
INSERT INTO `step` VALUES (116, 51, 9, '倒入豆腐翻炒均匀挂汁。', '/profile/upload/2025/01/25/800_c66a37ef80706d2aebc67266cea730bc_20250125164411A011.jpg');
INSERT INTO `step` VALUES (117, 51, 10, '出锅。', '/profile/upload/2025/01/25/960_60cc868c10ffd94a24a0cb110c8d984d_20250125164422A012.jpg');
INSERT INTO `step` VALUES (119, 99, 1, '虽然分享的是家庭式做法，但也尽量往小吃式的做法靠近。在烹煮面线糊之前，建议准备好一锅卤料用于搭配。 卤水 食材有水煮蛋、肥肠、小肠再加几个套肠，锅热少许油炒出糖色，加入多点的水然后加入少许老抽、酱油再放入当归一片、桂枝两根、香叶三片。大火煮开之后转小火卤煮大致一个小时，切记小火卤制不要大火收汁。', '/profile/upload/2025/02/13/800_f076acf8f9bc13f1184ea93c9499d7dd_20250213224927A003.jpg');
INSERT INTO `step` VALUES (120, 99, 2, '卤料准备好之后，根据个人的喜好准备好一些配料以我个人的喜好推荐大家几种。 蛋丝 锅里刷上一层薄薄的油，待油温升高至五成热时泼入蛋液。转动锅具让蛋液流动形成一个“大圆饼”继续转动锅具烘干蛋皮，然后拿出来等待冷却后切成蛋丝备用。', '/profile/upload/2025/02/13/800_39330fb79e36705e68a744c5f49e7b04_20250213224938A004.jpg');
INSERT INTO `step` VALUES (121, 99, 3, '虾仁炒蛋 虾仁的“沙线”要去除干净，这样才会卫生。锅热适量的油待油温升高之后放入姜丝煸香、煸干，待闻到姜油味时倒入虾仁进行翻炒。翻炒片刻之后加入味精、盐、胡椒粉作为调味，然后泼入一个蛋液炒匀后盛出备用。', '/profile/upload/2025/02/13/800_dbec04aa6208f06954a92e0f53fd92a0_20250213224949A005.jpg');
INSERT INTO `step` VALUES (122, 99, 4, '醋肉 醋肉是泉州非常广泛的美食之一，它不仅能干吃还能搭配烹饪成各种菜肴。其制作其实不难，只需把买回的肉切成小条然后用少许细砂糖、老陈醋、细盐、一小匙的酱油抓匀腌制数小时。然后加入多点的红薯淀粉抓匀，形成一个粘稠粉质覆盖住肉条的状态。待油温6成热时放入锅中油炸，炸熟后捞出复炸一遍口感会更好。如果你不想麻烦，那就买现成的吧。', '/profile/upload/2025/02/13/800_540e4b28a6d193b51e0d50d3fc6089f7_20250213225005A006.jpg');
INSERT INTO `step` VALUES (123, 99, 5, '香碎 香碎是闽南小吃中的一个天花板，一般用于点缀各种特色小吃。除了具备润色增加食欲感之外，还能提升美食的味道。它是又小葱、细芹、红葱酥三种的组合，只需切碎搅拌均匀候用。', '/profile/upload/2025/02/13/800_74cfad9acdea1d0c42757f97afcf7ea9_20250213225017A007.jpg');
INSERT INTO `step` VALUES (124, 99, 6, '面线糊 面线糊选用的原料是细的“面线”也就是闽南人生日吃的“长寿面”，可别买错了哦。把面线用手稍微捏碎，自己吃的话个人不建议捏的太细碎。烹煮时如果有高汤那味道会更好，如果没有建议放两个高汤块。根据要食用的人数倒入水量并加入高汤块，水开后放入捏碎的面线进行烹煮。煮到七成熟时，分两次用水淀粉勾芡搅匀。形成微微粘稠的面线糊，如果你喜欢小吃般的稀释感记得少放点面线。', '/profile/upload/2025/02/13/800_41739d9ec09accae8623121d64ac5dbd_20250213225031A008.jpg');
INSERT INTO `step` VALUES (125, 99, 7, '油条 与面线糊搭配食用的首选油条，然后是“菜粿”和“海蛎饼”这三种美食搭配面线糊绝对是美味。大部分人喜欢蘸面线糊吃，但其实应该是浇淋一点点酱油搭配吃会更有味道。', '/profile/upload/2025/02/13/800_53c89f091fd735928ee136006fddb77c_20250213225041A009.jpg');
INSERT INTO `step` VALUES (126, 99, 8, '根据喜欢的料剪一点在碗中，然后勺入两勺面线糊。接着必须浇入一匙卤水作为提味，再来就是香碎点缀提味。当你在早餐店吃的时候还能发现桌子上有一瓶酒和胡椒粉，每样加入一点点搅拌均匀就是完美的面线糊了。 推荐一下我个人最喜欢的搭配，醋肉、卤蛋、肥肠再来一点点榨菜。', '/profile/upload/2025/02/13/800_878a3b0d87ce4f6b2559e4afd54256dd_20250213225057A010.jpg');
INSERT INTO `step` VALUES (127, 100, 1, '鸡腿扎洞，放上调料抓匀，按摩5分钟。', '/profile/upload/2025/02/16/800_72ae3ee1fdf54214a21ffdb117808808_20250216135429A002.jpg');
INSERT INTO `step` VALUES (128, 100, 2, '腌制2小时以上，可以冷藏过夜，也可以密封冷冻以后吃。', '/profile/upload/2025/02/16/800_62f2aef34db0bd7aed4ac5b76a40814e_20250216135443A003.jpg');
INSERT INTO `step` VALUES (129, 100, 3, '空气炸锅200℃，20分钟，翻面10分钟，如果出汤了要倒掉。', '/profile/upload/2025/02/16/800_43295383dd11626c3fd57ed45d951098_20250216135458A004.jpg');
INSERT INTO `step` VALUES (130, 100, 4, '成品。', '/profile/upload/2025/02/16/800_a61475e4960bdd4870c551c56c98c7fa_20250216135509A005.jpg');
INSERT INTO `step` VALUES (131, 101, 1, '准备食材，狭鳕鱼提前解冻', '/profile/upload/2025/02/16/800_2a1095b7d9e8e7f1d1537342bbbcad53_20250216140524A007.jpeg');
INSERT INTO `step` VALUES (132, 101, 2, '鸡蛋打散，加盐搅拌均匀', '/profile/upload/2025/02/16/800_405905a6771cd568042820fa0be030c1_20250216140533A008.jpeg');
INSERT INTO `step` VALUES (133, 101, 3, '蛋液里加入1.5倍温水搅拌均匀', '/profile/upload/2025/02/16/800_e10ec3e02c3e38cb9814672b425d6bc2_20250216140544A009.jpeg');
INSERT INTO `step` VALUES (134, 101, 4, '搅拌均匀的蛋液过滤到盘子里，上锅蒸6分钟', '/profile/upload/2025/02/16/800_4008e3bea608916f17083140cb4afeef_20250216140558A010.jpeg');
INSERT INTO `step` VALUES (135, 101, 5, '狭鳕鱼柳切小块，加适量盐，胡椒粉拌匀', '/profile/upload/2025/02/16/800_59a5ec2367363fc89aa1cc94ab10a5be_20250216140607A011.jpeg');
INSERT INTO `step` VALUES (136, 101, 6, '把狭鳕鱼柳放入蛋羹上继续蒸5分钟左右', '/profile/upload/2025/02/16/800_a15b10fbf8a183d9a7383cb0a838da2c_20250216140615A012.jpeg');
INSERT INTO `step` VALUES (137, 101, 7, '出锅淋上香油，撒上葱花即可', '/profile/upload/2025/02/16/800_6979bf253458096ffddb109bdb22b6d1_20250216140624A013.jpeg');
INSERT INTO `step` VALUES (138, 103, 1, '如图备料； 红心火龙果是和红曲粉替换的，制作时使用红曲粉更方便；', '/profile/upload/2025/02/17/800_a1c10264af327bf903d80d45e52b732d_20250217192410A004.jpg');
INSERT INTO `step` VALUES (139, 103, 2, '芒果、香蕉、白梨切成小块如图；', '/profile/upload/2025/02/17/800_8d63113ff2a7cec8027127f4ae389971_20250217192424A005.jpg');
INSERT INTO `step` VALUES (140, 103, 3, '果肉放在搅拌机里，注意水分多的水果放在最下面容易搅打；', '/profile/upload/2025/02/17/800_57cf5d444aadf01a084a948a55c81ae2_20250217192434A006.jpg');
INSERT INTO `step` VALUES (141, 103, 4, '加入10ml牛奶，不仅方便搅打，而且有奶香味；', '/profile/upload/2025/02/17/800_5dc2ea6c8cfe5c8ac4629a24a80a9cd8_20250217192447A007.jpg');
INSERT INTO `step` VALUES (142, 103, 5, '思慕雪基底就做好了，如图；', '/profile/upload/2025/02/17/800_d0137f429e09214f53bdca1a8e43182a_20250217192458A008.jpg');
INSERT INTO `step` VALUES (143, 103, 6, '如果使用红心火龙果作为红色填充，火龙果也需要搅拌机打一下，这步不用加牛奶；', '/profile/upload/2025/02/17/800_d6992628977ea25d8f50518e5b2b9a6c_20250217192506A009.jpg');
INSERT INTO `step` VALUES (144, 103, 7, '开始打发淡奶油，实际用量其实只用了10ml左右，不过太少不易打发；取30ml淡奶油，打发前冷冻5分钟，打至6-7分发泡即可，比较稳定不流动的状态即可；', '/profile/upload/2025/02/17/800_c39e46d85b317cf00c90ef8a67d262b8_20250217192519A010.jpg');
INSERT INTO `step` VALUES (145, 103, 8, '打发后的状态如图；', '/profile/upload/2025/02/17/800_5024c216bd62f4c2cc77cba076c55a5f_20250217192528A011.jpg');
INSERT INTO `step` VALUES (146, 103, 9, '祭出我的调色盘和工具； 红色是红曲粉+牛奶，黄色是姜黄粉+牛奶，黑色是竹炭粉+牛奶；', '/profile/upload/2025/02/17/800_119c0a661cee2b60a10a3565f80068b3_20250217192539A012.jpg');
INSERT INTO `step` VALUES (147, 103, 10, '根据选定的图案大致勾边(竹炭粉牛奶)，全部填充白色奶油；', '/profile/upload/2025/02/17/800_a26414665ccd4e05c67b4b230b21ac42_20250217192546A013.jpg');
INSERT INTO `step` VALUES (148, 103, 11, '再把细节勾勒出来，深色的头发可以立即填充，浅色的部分先保留白色； 肤色使用姜黄粉牛奶+红曲粉牛奶+白色奶油少量调出来的；', '/profile/upload/2025/02/17/800_724714ef0963b563b94857a584f11111_20250217192555A014.jpg');
INSERT INTO `step` VALUES (149, 103, 12, '肤色填充后再用竹炭粉牛奶把细节勾勒清楚；', '/profile/upload/2025/02/17/800_ba96ac0848354cf026be70522d616855_20250217192604A015.jpg');
INSERT INTO `step` VALUES (150, 103, 13, '最后填充上发带(红曲粉牛奶)和金项圈(姜黄粉牛奶)等色块，就完成啦。', '/profile/upload/2025/02/17/960_debde068939599d41df257463f9ebc19_20250217192619A016.jpg');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2025-01-02 21:17:34', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '12345', 'Y', 'admin', '2025-01-02 21:17:34', 'admin', '2025-02-17 15:09:14', '初始化密码 12345');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-light', 'Y', 'admin', '2025-01-02 21:17:34', 'admin', '2025-01-06 14:23:28', '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2025-01-02 21:17:34', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'true', 'Y', 'admin', '2025-01-02 21:17:34', 'admin', '2025-01-02 22:32:36', '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '1', 'N', 'admin', '2025-01-02 21:17:34', 'admin', '2025-01-06 14:24:05', '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2025-01-02 21:17:34', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-01-02 21:17:34', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-01-02 21:17:34', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2025-01-02 21:17:34', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2025-01-02 21:17:34', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2025-01-02 21:17:34', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2025-01-02 21:17:34', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2025-01-02 21:17:34', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2025-01-02 21:17:34', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-01-02 21:17:34', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-01-02 21:17:34', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-01-02 21:17:34', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-01-02 21:17:34', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2025-01-02 21:17:34', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-01-02 21:17:34', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-01-02 21:17:34', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-01-02 21:17:34', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-01-02 21:17:34', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-01-02 21:17:34', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2025-01-02 21:17:34', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2025-01-02 21:17:34', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (101, 1, '审核通过', '1', 'recipe_state', NULL, 'default', 'N', '0', 'admin', '2025-01-05 15:20:58', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (102, 2, '审核未通过', '2', 'recipe_state', NULL, 'default', 'N', '0', 'admin', '2025-01-05 15:21:27', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (103, 0, '闽系', '0', 'variety', NULL, 'default', 'N', '0', 'admin', '2025-01-06 13:23:04', 'admin', '2025-01-06 13:23:15', NULL);
INSERT INTO `sys_dict_data` VALUES (104, 1, '粤系', '1', 'variety', NULL, 'default', 'N', '0', 'admin', '2025-01-06 13:23:32', 'admin', '2025-01-06 13:23:39', NULL);
INSERT INTO `sys_dict_data` VALUES (105, 6, '其他', '6', 'variety', NULL, 'default', 'N', '0', 'admin', '2025-01-06 13:23:59', 'admin', '2025-01-17 20:06:05', NULL);
INSERT INTO `sys_dict_data` VALUES (107, 0, '未审核', '0', 'recipe_state', NULL, 'default', 'N', '0', 'admin', '2025-01-06 15:04:58', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (108, 2, '家常菜', '2', 'variety', NULL, 'default', 'N', '0', 'admin', '2025-01-17 20:03:23', 'admin', '2025-01-17 20:03:57', NULL);
INSERT INTO `sys_dict_data` VALUES (109, 3, '川菜', '3', 'variety', NULL, 'default', 'N', '0', 'admin', '2025-01-17 20:05:04', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (110, 4, '东北菜', '4', 'variety', '', 'default', 'N', '0', 'admin', '2025-01-17 20:05:28', 'admin', '2025-01-17 20:05:38', NULL);
INSERT INTO `sys_dict_data` VALUES (111, 5, '主食', '5', 'variety', NULL, 'default', 'N', '0', 'admin', '2025-01-17 20:05:56', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (112, 7, '早餐', '7', 'variety', NULL, 'default', 'N', '0', 'admin', '2025-02-16 14:00:13', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2025-01-02 21:17:34', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2025-01-02 21:17:34', 'admin', '2025-02-17 20:02:48', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2025-01-02 21:17:34', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2025-01-02 21:17:34', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2025-01-02 21:17:34', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2025-01-02 21:17:34', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '审核状态', 'recipe_state', '0', 'admin', '2025-01-05 15:17:28', 'admin', '2025-02-17 15:32:15', '食谱审核状态');
INSERT INTO `sys_dict_type` VALUES (101, '菜系', 'variety', '0', 'admin', '2025-01-06 13:22:04', 'admin', '2025-02-17 20:03:11', '食谱类别');

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 470 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-01-02 21:53:22');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-02 21:53:29');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-02 22:32:07');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-02 22:34:00');
INSERT INTO `sys_logininfor` VALUES (104, 'hxg', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '注册成功', '2025-01-02 22:34:46');
INSERT INTO `sys_logininfor` VALUES (105, 'hxg', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2025-01-02 22:34:58');
INSERT INTO `sys_logininfor` VALUES (106, 'hxg', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-02 22:35:30');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-01-02 23:00:54');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-02 23:01:02');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-03 11:47:51');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-03 12:03:17');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-03 15:42:17');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-03 15:56:07');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-03 16:30:10');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-04 13:59:16');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码已失效', '2025-01-04 14:55:53');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-04 14:56:00');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-04 16:01:46');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-04 16:23:34');
INSERT INTO `sys_logininfor` VALUES (119, 'hhh', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '注册成功', '2025-01-04 16:37:01');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-04 17:49:23');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-04 19:02:24');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-04 19:34:22');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-04 19:38:39');
INSERT INTO `sys_logininfor` VALUES (124, 'asd', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '注册成功', '2025-01-04 19:57:47');
INSERT INTO `sys_logininfor` VALUES (125, 'asda', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '注册成功', '2025-01-04 20:22:40');
INSERT INTO `sys_logininfor` VALUES (126, 'aa', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '注册成功', '2025-01-04 20:23:21');
INSERT INTO `sys_logininfor` VALUES (127, 'aa', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '注册成功', '2025-01-04 20:24:21');
INSERT INTO `sys_logininfor` VALUES (128, 'aa', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-04 20:25:22');
INSERT INTO `sys_logininfor` VALUES (129, 'aa', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-04 20:25:35');
INSERT INTO `sys_logininfor` VALUES (130, 'lisi', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '注册成功', '2025-01-04 20:26:09');
INSERT INTO `sys_logininfor` VALUES (131, 'lisi', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-04 20:26:45');
INSERT INTO `sys_logininfor` VALUES (132, 'lisi', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-04 20:26:57');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码已失效', '2025-01-05 15:14:58');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-05 15:15:01');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-01-05 17:41:36');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-05 17:41:41');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-05 18:40:45');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-05 19:21:52');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-05 19:22:38');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-05 19:26:54');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-05 19:31:12');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-05 19:51:38');
INSERT INTO `sys_logininfor` VALUES (143, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '注册成功', '2025-01-05 21:09:32');
INSERT INTO `sys_logininfor` VALUES (144, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-05 21:09:44');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-06 13:20:45');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-06 13:51:03');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-06 14:40:52');
INSERT INTO `sys_logininfor` VALUES (148, 'hxg', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-06 14:41:04');
INSERT INTO `sys_logininfor` VALUES (149, 'hxg', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-06 15:03:52');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-06 15:03:58');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-06 17:16:19');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-06 18:44:11');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-01-06 19:27:11');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-06 19:27:14');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-06 19:28:43');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-06 19:58:34');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-06 20:01:24');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-08 20:36:03');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-01-08 20:53:51');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-08 20:53:57');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2025-01-08 20:54:32');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-08 21:52:13');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-08 21:59:48');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-01-08 22:02:07');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-08 22:02:13');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-08 22:04:27');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-08 22:07:50');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-08 22:43:23');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-01-08 22:43:27');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-08 22:43:31');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-10 13:59:06');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-10 16:35:06');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-10 16:50:42');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-10 17:59:23');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码已失效', '2025-01-11 12:50:49');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-11 12:50:53');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-11 13:50:07');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-11 15:15:49');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-11 15:52:40');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-01-11 16:05:32');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-11 16:05:37');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-11 16:15:39');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2025-01-11 18:55:09');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-11 19:32:04');
INSERT INTO `sys_logininfor` VALUES (185, 'hxg', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-11 19:32:15');
INSERT INTO `sys_logininfor` VALUES (186, 'hxg', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-11 19:32:46');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-11 19:32:49');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-11 19:33:25');
INSERT INTO `sys_logininfor` VALUES (189, 'hxg', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2025-01-11 19:33:35');
INSERT INTO `sys_logininfor` VALUES (190, 'hxg', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2025-01-11 19:33:38');
INSERT INTO `sys_logininfor` VALUES (191, 'hxg', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-11 19:33:45');
INSERT INTO `sys_logininfor` VALUES (192, 'hxg', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-11 19:34:21');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-11 19:34:24');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-11 19:39:51');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-11 19:40:18');
INSERT INTO `sys_logininfor` VALUES (196, 'hxg', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-01-11 19:40:27');
INSERT INTO `sys_logininfor` VALUES (197, 'hxg', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-11 19:40:36');
INSERT INTO `sys_logininfor` VALUES (198, 'hxg', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-11 19:49:34');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-01-12 14:27:52');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-12 14:27:56');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-12 15:28:07');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-13 14:23:02');
INSERT INTO `sys_logininfor` VALUES (203, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-13 15:22:01');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-13 17:32:57');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-13 22:37:09');
INSERT INTO `sys_logininfor` VALUES (206, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-01-14 14:16:11');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-14 14:16:14');
INSERT INTO `sys_logininfor` VALUES (208, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-14 14:44:41');
INSERT INTO `sys_logininfor` VALUES (209, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-14 14:45:00');
INSERT INTO `sys_logininfor` VALUES (210, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-14 14:45:46');
INSERT INTO `sys_logininfor` VALUES (211, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-14 14:45:50');
INSERT INTO `sys_logininfor` VALUES (212, 'lll', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2025-01-14 14:46:20');
INSERT INTO `sys_logininfor` VALUES (213, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2025-01-14 14:54:30');
INSERT INTO `sys_logininfor` VALUES (214, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-14 14:54:36');
INSERT INTO `sys_logininfor` VALUES (215, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-14 14:54:46');
INSERT INTO `sys_logininfor` VALUES (216, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-14 15:09:47');
INSERT INTO `sys_logininfor` VALUES (217, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-14 15:09:50');
INSERT INTO `sys_logininfor` VALUES (218, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-14 15:26:23');
INSERT INTO `sys_logininfor` VALUES (219, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-14 15:26:31');
INSERT INTO `sys_logininfor` VALUES (220, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-14 15:26:42');
INSERT INTO `sys_logininfor` VALUES (221, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2025-01-14 15:26:47');
INSERT INTO `sys_logininfor` VALUES (222, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-14 15:29:10');
INSERT INTO `sys_logininfor` VALUES (223, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2025-01-14 15:29:25');
INSERT INTO `sys_logininfor` VALUES (224, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-14 15:40:21');
INSERT INTO `sys_logininfor` VALUES (225, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-14 15:40:25');
INSERT INTO `sys_logininfor` VALUES (226, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-14 15:40:37');
INSERT INTO `sys_logininfor` VALUES (227, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-14 15:40:52');
INSERT INTO `sys_logininfor` VALUES (228, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-14 15:46:08');
INSERT INTO `sys_logininfor` VALUES (229, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2025-01-14 15:46:29');
INSERT INTO `sys_logininfor` VALUES (230, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2025-01-14 15:47:45');
INSERT INTO `sys_logininfor` VALUES (231, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '退出成功', '2025-01-14 15:58:02');
INSERT INTO `sys_logininfor` VALUES (232, 'lll', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2025-01-14 15:58:16');
INSERT INTO `sys_logininfor` VALUES (233, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-14 16:05:53');
INSERT INTO `sys_logininfor` VALUES (234, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-14 16:06:03');
INSERT INTO `sys_logininfor` VALUES (235, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-14 16:07:14');
INSERT INTO `sys_logininfor` VALUES (236, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-14 16:07:18');
INSERT INTO `sys_logininfor` VALUES (237, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-14 16:29:29');
INSERT INTO `sys_logininfor` VALUES (238, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-14 17:15:14');
INSERT INTO `sys_logininfor` VALUES (239, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-14 17:15:18');
INSERT INTO `sys_logininfor` VALUES (240, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-14 17:47:58');
INSERT INTO `sys_logininfor` VALUES (241, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-14 17:48:07');
INSERT INTO `sys_logininfor` VALUES (242, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-15 13:07:05');
INSERT INTO `sys_logininfor` VALUES (243, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-15 16:18:52');
INSERT INTO `sys_logininfor` VALUES (244, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '退出成功', '2025-01-15 16:36:14');
INSERT INTO `sys_logininfor` VALUES (245, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2025-01-15 16:36:19');
INSERT INTO `sys_logininfor` VALUES (246, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-15 17:32:06');
INSERT INTO `sys_logininfor` VALUES (247, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-15 19:16:32');
INSERT INTO `sys_logininfor` VALUES (248, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-15 20:38:59');
INSERT INTO `sys_logininfor` VALUES (249, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2025-01-15 21:01:51');
INSERT INTO `sys_logininfor` VALUES (250, 'hxg', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2025-01-15 21:02:07');
INSERT INTO `sys_logininfor` VALUES (251, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-15 21:02:16');
INSERT INTO `sys_logininfor` VALUES (252, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-15 21:03:18');
INSERT INTO `sys_logininfor` VALUES (253, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-15 21:03:28');
INSERT INTO `sys_logininfor` VALUES (254, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-15 21:03:35');
INSERT INTO `sys_logininfor` VALUES (255, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码已失效', '2025-01-15 21:26:45');
INSERT INTO `sys_logininfor` VALUES (256, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-15 21:26:49');
INSERT INTO `sys_logininfor` VALUES (257, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-15 21:27:43');
INSERT INTO `sys_logininfor` VALUES (258, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-15 21:27:52');
INSERT INTO `sys_logininfor` VALUES (259, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-15 21:28:49');
INSERT INTO `sys_logininfor` VALUES (260, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-15 21:28:53');
INSERT INTO `sys_logininfor` VALUES (261, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-16 15:16:35');
INSERT INTO `sys_logininfor` VALUES (262, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-16 15:37:45');
INSERT INTO `sys_logininfor` VALUES (263, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-01-16 15:37:55');
INSERT INTO `sys_logininfor` VALUES (264, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-16 15:37:59');
INSERT INTO `sys_logininfor` VALUES (265, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-16 15:58:31');
INSERT INTO `sys_logininfor` VALUES (266, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-16 15:58:41');
INSERT INTO `sys_logininfor` VALUES (267, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-16 15:58:59');
INSERT INTO `sys_logininfor` VALUES (268, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-16 16:04:01');
INSERT INTO `sys_logininfor` VALUES (269, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-16 16:04:08');
INSERT INTO `sys_logininfor` VALUES (270, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-16 16:04:16');
INSERT INTO `sys_logininfor` VALUES (271, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-16 16:04:50');
INSERT INTO `sys_logininfor` VALUES (272, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-16 16:04:59');
INSERT INTO `sys_logininfor` VALUES (273, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-16 16:05:03');
INSERT INTO `sys_logininfor` VALUES (274, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-16 16:05:06');
INSERT INTO `sys_logininfor` VALUES (275, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-16 16:06:42');
INSERT INTO `sys_logininfor` VALUES (276, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-16 16:06:51');
INSERT INTO `sys_logininfor` VALUES (277, 'lll', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '退出成功', '2025-01-16 16:20:09');
INSERT INTO `sys_logininfor` VALUES (278, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-01-16 16:20:16');
INSERT INTO `sys_logininfor` VALUES (279, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-01-16 16:20:23');
INSERT INTO `sys_logininfor` VALUES (280, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-16 16:20:25');
INSERT INTO `sys_logininfor` VALUES (281, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-16 16:49:20');
INSERT INTO `sys_logininfor` VALUES (282, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-16 16:49:28');
INSERT INTO `sys_logininfor` VALUES (283, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-16 16:50:03');
INSERT INTO `sys_logininfor` VALUES (284, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-16 16:50:06');
INSERT INTO `sys_logininfor` VALUES (285, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-16 16:56:28');
INSERT INTO `sys_logininfor` VALUES (286, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-16 17:00:27');
INSERT INTO `sys_logininfor` VALUES (287, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-16 17:01:10');
INSERT INTO `sys_logininfor` VALUES (288, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-16 17:01:20');
INSERT INTO `sys_logininfor` VALUES (289, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-16 17:02:27');
INSERT INTO `sys_logininfor` VALUES (290, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-16 17:02:35');
INSERT INTO `sys_logininfor` VALUES (291, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-16 17:02:43');
INSERT INTO `sys_logininfor` VALUES (292, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-16 17:02:48');
INSERT INTO `sys_logininfor` VALUES (293, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-16 17:03:07');
INSERT INTO `sys_logininfor` VALUES (294, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-16 17:03:11');
INSERT INTO `sys_logininfor` VALUES (295, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-16 17:03:26');
INSERT INTO `sys_logininfor` VALUES (296, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-16 17:03:35');
INSERT INTO `sys_logininfor` VALUES (297, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码已失效', '2025-01-16 20:59:48');
INSERT INTO `sys_logininfor` VALUES (298, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-16 20:59:53');
INSERT INTO `sys_logininfor` VALUES (299, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-16 22:10:19');
INSERT INTO `sys_logininfor` VALUES (300, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-17 14:50:47');
INSERT INTO `sys_logininfor` VALUES (301, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-17 14:55:21');
INSERT INTO `sys_logininfor` VALUES (302, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码已失效', '2025-01-17 14:57:25');
INSERT INTO `sys_logininfor` VALUES (303, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-17 14:57:28');
INSERT INTO `sys_logininfor` VALUES (304, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-17 16:47:34');
INSERT INTO `sys_logininfor` VALUES (305, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-17 16:47:37');
INSERT INTO `sys_logininfor` VALUES (306, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-17 16:48:11');
INSERT INTO `sys_logininfor` VALUES (307, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-17 16:48:18');
INSERT INTO `sys_logininfor` VALUES (308, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-17 16:49:52');
INSERT INTO `sys_logininfor` VALUES (309, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-17 16:50:17');
INSERT INTO `sys_logininfor` VALUES (310, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-17 20:01:30');
INSERT INTO `sys_logininfor` VALUES (311, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-17 21:34:07');
INSERT INTO `sys_logininfor` VALUES (312, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-18 14:12:06');
INSERT INTO `sys_logininfor` VALUES (313, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-18 15:53:10');
INSERT INTO `sys_logininfor` VALUES (314, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-18 15:53:16');
INSERT INTO `sys_logininfor` VALUES (315, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-18 15:53:42');
INSERT INTO `sys_logininfor` VALUES (316, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-18 19:14:55');
INSERT INTO `sys_logininfor` VALUES (317, 'lll', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '退出成功', '2025-01-18 21:22:37');
INSERT INTO `sys_logininfor` VALUES (318, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-18 21:22:51');
INSERT INTO `sys_logininfor` VALUES (319, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-18 21:45:21');
INSERT INTO `sys_logininfor` VALUES (320, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-18 21:45:24');
INSERT INTO `sys_logininfor` VALUES (321, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-18 21:45:33');
INSERT INTO `sys_logininfor` VALUES (322, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-18 21:45:41');
INSERT INTO `sys_logininfor` VALUES (323, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-19 09:29:35');
INSERT INTO `sys_logininfor` VALUES (324, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '退出成功', '2025-01-19 11:23:03');
INSERT INTO `sys_logininfor` VALUES (325, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2025-01-19 11:23:07');
INSERT INTO `sys_logininfor` VALUES (326, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-01-19 14:57:27');
INSERT INTO `sys_logininfor` VALUES (327, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-19 14:57:31');
INSERT INTO `sys_logininfor` VALUES (328, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-19 17:18:10');
INSERT INTO `sys_logininfor` VALUES (329, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2025-01-19 17:18:18');
INSERT INTO `sys_logininfor` VALUES (330, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2025-01-19 17:18:22');
INSERT INTO `sys_logininfor` VALUES (331, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-19 17:18:34');
INSERT INTO `sys_logininfor` VALUES (332, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-19 17:19:49');
INSERT INTO `sys_logininfor` VALUES (333, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-19 17:19:52');
INSERT INTO `sys_logininfor` VALUES (334, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-19 17:32:29');
INSERT INTO `sys_logininfor` VALUES (335, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-19 20:21:03');
INSERT INTO `sys_logininfor` VALUES (336, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-21 14:14:22');
INSERT INTO `sys_logininfor` VALUES (337, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-01-21 19:55:16');
INSERT INTO `sys_logininfor` VALUES (338, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-21 19:55:21');
INSERT INTO `sys_logininfor` VALUES (339, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-21 20:17:36');
INSERT INTO `sys_logininfor` VALUES (340, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-21 21:06:41');
INSERT INTO `sys_logininfor` VALUES (341, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-21 21:12:08');
INSERT INTO `sys_logininfor` VALUES (342, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-21 21:12:15');
INSERT INTO `sys_logininfor` VALUES (343, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-22 13:37:25');
INSERT INTO `sys_logininfor` VALUES (344, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-22 14:26:54');
INSERT INTO `sys_logininfor` VALUES (345, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-22 14:32:46');
INSERT INTO `sys_logininfor` VALUES (346, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-22 14:32:53');
INSERT INTO `sys_logininfor` VALUES (347, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-22 14:33:02');
INSERT INTO `sys_logininfor` VALUES (348, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-22 15:08:00');
INSERT INTO `sys_logininfor` VALUES (349, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-22 15:19:14');
INSERT INTO `sys_logininfor` VALUES (350, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-22 15:51:08');
INSERT INTO `sys_logininfor` VALUES (351, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-22 15:51:23');
INSERT INTO `sys_logininfor` VALUES (352, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-22 16:25:13');
INSERT INTO `sys_logininfor` VALUES (353, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-22 16:28:35');
INSERT INTO `sys_logininfor` VALUES (354, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-22 16:33:47');
INSERT INTO `sys_logininfor` VALUES (355, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-22 16:41:14');
INSERT INTO `sys_logininfor` VALUES (356, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-22 17:13:47');
INSERT INTO `sys_logininfor` VALUES (357, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-22 17:56:15');
INSERT INTO `sys_logininfor` VALUES (358, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-22 17:58:31');
INSERT INTO `sys_logininfor` VALUES (359, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-22 18:57:51');
INSERT INTO `sys_logininfor` VALUES (360, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-22 18:58:00');
INSERT INTO `sys_logininfor` VALUES (361, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-22 18:58:09');
INSERT INTO `sys_logininfor` VALUES (362, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-22 19:07:13');
INSERT INTO `sys_logininfor` VALUES (363, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-22 19:42:43');
INSERT INTO `sys_logininfor` VALUES (364, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-22 19:44:47');
INSERT INTO `sys_logininfor` VALUES (365, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-22 19:59:50');
INSERT INTO `sys_logininfor` VALUES (366, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-24 14:18:45');
INSERT INTO `sys_logininfor` VALUES (367, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-24 14:34:56');
INSERT INTO `sys_logininfor` VALUES (368, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-24 14:35:48');
INSERT INTO `sys_logininfor` VALUES (369, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-24 17:38:53');
INSERT INTO `sys_logininfor` VALUES (370, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-24 17:40:54');
INSERT INTO `sys_logininfor` VALUES (371, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-24 17:41:02');
INSERT INTO `sys_logininfor` VALUES (372, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-24 17:51:02');
INSERT INTO `sys_logininfor` VALUES (373, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-24 17:51:05');
INSERT INTO `sys_logininfor` VALUES (374, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-24 17:51:31');
INSERT INTO `sys_logininfor` VALUES (375, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-24 17:51:39');
INSERT INTO `sys_logininfor` VALUES (376, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-24 18:34:53');
INSERT INTO `sys_logininfor` VALUES (377, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-24 18:34:57');
INSERT INTO `sys_logininfor` VALUES (378, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-24 18:35:31');
INSERT INTO `sys_logininfor` VALUES (379, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-24 18:35:43');
INSERT INTO `sys_logininfor` VALUES (380, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-24 19:24:06');
INSERT INTO `sys_logininfor` VALUES (381, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-24 21:17:37');
INSERT INTO `sys_logininfor` VALUES (382, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-24 21:17:40');
INSERT INTO `sys_logininfor` VALUES (383, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-24 21:18:27');
INSERT INTO `sys_logininfor` VALUES (384, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-24 21:18:35');
INSERT INTO `sys_logininfor` VALUES (385, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-24 21:18:55');
INSERT INTO `sys_logininfor` VALUES (386, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-24 21:19:01');
INSERT INTO `sys_logininfor` VALUES (387, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-24 21:19:36');
INSERT INTO `sys_logininfor` VALUES (388, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-24 21:19:44');
INSERT INTO `sys_logininfor` VALUES (389, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-24 21:40:36');
INSERT INTO `sys_logininfor` VALUES (390, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-24 21:40:39');
INSERT INTO `sys_logininfor` VALUES (391, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-24 21:42:44');
INSERT INTO `sys_logininfor` VALUES (392, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-24 21:42:53');
INSERT INTO `sys_logininfor` VALUES (393, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-25 16:15:12');
INSERT INTO `sys_logininfor` VALUES (394, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-25 16:44:47');
INSERT INTO `sys_logininfor` VALUES (395, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-25 16:44:49');
INSERT INTO `sys_logininfor` VALUES (396, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-26 00:09:40');
INSERT INTO `sys_logininfor` VALUES (397, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-26 14:40:32');
INSERT INTO `sys_logininfor` VALUES (398, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-26 15:24:46');
INSERT INTO `sys_logininfor` VALUES (399, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-01-26 15:24:58');
INSERT INTO `sys_logininfor` VALUES (400, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-26 15:25:02');
INSERT INTO `sys_logininfor` VALUES (401, 'lll', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-26 15:25:40');
INSERT INTO `sys_logininfor` VALUES (402, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-26 15:25:46');
INSERT INTO `sys_logininfor` VALUES (403, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-26 15:27:29');
INSERT INTO `sys_logininfor` VALUES (404, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-26 16:18:38');
INSERT INTO `sys_logininfor` VALUES (405, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-26 18:45:59');
INSERT INTO `sys_logininfor` VALUES (406, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-26 20:05:59');
INSERT INTO `sys_logininfor` VALUES (407, 'wangwu', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '注册成功', '2025-01-26 20:06:32');
INSERT INTO `sys_logininfor` VALUES (408, 'wangwu', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-26 20:06:46');
INSERT INTO `sys_logininfor` VALUES (409, 'wangwu', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-26 20:07:16');
INSERT INTO `sys_logininfor` VALUES (410, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-26 20:07:21');
INSERT INTO `sys_logininfor` VALUES (411, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-01-26 21:04:34');
INSERT INTO `sys_logininfor` VALUES (412, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-01-26 21:05:10');
INSERT INTO `sys_logininfor` VALUES (413, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-13 15:17:30');
INSERT INTO `sys_logininfor` VALUES (414, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-13 16:17:15');
INSERT INTO `sys_logininfor` VALUES (415, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-13 17:52:45');
INSERT INTO `sys_logininfor` VALUES (416, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-13 17:54:24');
INSERT INTO `sys_logininfor` VALUES (417, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-13 17:57:03');
INSERT INTO `sys_logininfor` VALUES (418, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-13 18:46:13');
INSERT INTO `sys_logininfor` VALUES (419, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-02-13 19:38:15');
INSERT INTO `sys_logininfor` VALUES (420, 'hhh', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2025-02-13 19:38:31');
INSERT INTO `sys_logininfor` VALUES (421, 'hhh', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2025-02-13 19:39:04');
INSERT INTO `sys_logininfor` VALUES (422, 'hhh', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2025-02-13 19:39:11');
INSERT INTO `sys_logininfor` VALUES (423, 'hhhhh', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '注册成功', '2025-02-13 19:39:54');
INSERT INTO `sys_logininfor` VALUES (424, 'hhhhh', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-02-13 19:40:05');
INSERT INTO `sys_logininfor` VALUES (425, 'hhhhh', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-13 19:40:08');
INSERT INTO `sys_logininfor` VALUES (426, 'hhhhh', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-13 19:50:07');
INSERT INTO `sys_logininfor` VALUES (427, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-13 19:59:30');
INSERT INTO `sys_logininfor` VALUES (428, 'hhhhh', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-13 22:34:31');
INSERT INTO `sys_logininfor` VALUES (429, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-13 22:52:05');
INSERT INTO `sys_logininfor` VALUES (430, 'hhhhh', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-13 23:36:30');
INSERT INTO `sys_logininfor` VALUES (431, 'hhhhh', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-02-13 23:37:11');
INSERT INTO `sys_logininfor` VALUES (432, 'hhhhh', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-13 23:37:17');
INSERT INTO `sys_logininfor` VALUES (433, 'hhhhh', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-14 14:13:12');
INSERT INTO `sys_logininfor` VALUES (434, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2025-02-14 16:32:59');
INSERT INTO `sys_logininfor` VALUES (435, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-14 16:33:09');
INSERT INTO `sys_logininfor` VALUES (436, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-02-14 17:43:36');
INSERT INTO `sys_logininfor` VALUES (437, 'liuliu', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '注册成功', '2025-02-14 17:44:25');
INSERT INTO `sys_logininfor` VALUES (438, 'zhaoliu', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '注册成功', '2025-02-14 17:45:49');
INSERT INTO `sys_logininfor` VALUES (439, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-14 17:45:55');
INSERT INTO `sys_logininfor` VALUES (440, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2025-02-16 13:18:30');
INSERT INTO `sys_logininfor` VALUES (441, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2025-02-16 13:18:46');
INSERT INTO `sys_logininfor` VALUES (442, 'zhaoliu', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-16 13:19:13');
INSERT INTO `sys_logininfor` VALUES (443, 'zhaoliu', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-02-16 13:55:40');
INSERT INTO `sys_logininfor` VALUES (444, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-16 13:55:43');
INSERT INTO `sys_logininfor` VALUES (445, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-02-16 13:56:06');
INSERT INTO `sys_logininfor` VALUES (446, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2025-02-16 13:56:21');
INSERT INTO `sys_logininfor` VALUES (447, 'zhaoliu', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-16 13:56:35');
INSERT INTO `sys_logininfor` VALUES (448, 'zhaoliu', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-02-16 13:57:02');
INSERT INTO `sys_logininfor` VALUES (449, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-16 13:57:07');
INSERT INTO `sys_logininfor` VALUES (450, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-02-16 14:06:58');
INSERT INTO `sys_logininfor` VALUES (451, 'liuliu', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-16 14:07:12');
INSERT INTO `sys_logininfor` VALUES (452, 'liuliu', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-02-16 14:12:10');
INSERT INTO `sys_logininfor` VALUES (453, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-16 14:12:17');
INSERT INTO `sys_logininfor` VALUES (454, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-02-16 14:22:33');
INSERT INTO `sys_logininfor` VALUES (455, 'zhaoliu', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-16 14:22:44');
INSERT INTO `sys_logininfor` VALUES (456, 'zhaoliu', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-02-16 14:29:44');
INSERT INTO `sys_logininfor` VALUES (457, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-16 14:29:48');
INSERT INTO `sys_logininfor` VALUES (458, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-02-16 14:29:57');
INSERT INTO `sys_logininfor` VALUES (459, 'liuliu', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-16 14:30:07');
INSERT INTO `sys_logininfor` VALUES (460, 'liuliu', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-02-16 14:32:20');
INSERT INTO `sys_logininfor` VALUES (461, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-16 14:32:23');
INSERT INTO `sys_logininfor` VALUES (462, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-02-16 15:59:39');
INSERT INTO `sys_logininfor` VALUES (463, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-02-16 15:59:42');
INSERT INTO `sys_logininfor` VALUES (464, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-02-16 15:59:44');
INSERT INTO `sys_logininfor` VALUES (465, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-16 15:59:47');
INSERT INTO `sys_logininfor` VALUES (466, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-02-17 15:05:18');
INSERT INTO `sys_logininfor` VALUES (467, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-17 15:05:24');
INSERT INTO `sys_logininfor` VALUES (468, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-17 15:30:45');
INSERT INTO `sys_logininfor` VALUES (469, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-17 16:01:47');
INSERT INTO `sys_logininfor` VALUES (470, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-17 16:43:23');
INSERT INTO `sys_logininfor` VALUES (471, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-02-17 17:09:31');
INSERT INTO `sys_logininfor` VALUES (472, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-17 17:20:05');
INSERT INTO `sys_logininfor` VALUES (473, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-17 18:56:59');
INSERT INTO `sys_logininfor` VALUES (474, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-02-17 19:09:41');
INSERT INTO `sys_logininfor` VALUES (475, 'nezha', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '注册成功', '2025-02-17 19:10:22');
INSERT INTO `sys_logininfor` VALUES (476, 'nezha', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-17 19:10:35');
INSERT INTO `sys_logininfor` VALUES (477, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-17 19:17:30');
INSERT INTO `sys_logininfor` VALUES (478, 'nezha', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-02-17 19:55:02');
INSERT INTO `sys_logininfor` VALUES (479, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-02-17 19:55:06');
INSERT INTO `sys_logininfor` VALUES (480, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-02-17 19:55:09');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由名称',
  `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2042 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2025-01-02 21:17:34', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2025-01-02 21:17:34', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2025-01-02 21:17:34', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2025-01-02 21:17:34', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2025-01-02 21:17:34', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2025-01-02 21:17:34', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2025-01-02 21:17:34', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2025-01-02 21:17:34', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2025-01-02 21:17:34', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2025-01-02 21:17:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2025-01-02 21:17:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2025-01-02 21:17:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2025-01-02 21:17:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2025-01-02 21:17:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2025-01-02 21:17:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2025-01-02 21:17:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2025-01-02 21:17:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2025-01-02 21:17:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2025-01-02 21:17:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2025-01-02 21:17:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2025-01-02 21:17:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2025-01-02 21:17:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2025-01-02 21:17:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2025-01-02 21:17:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2025-01-02 21:17:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2025-01-02 21:17:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2025-01-02 21:17:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2025-01-02 21:17:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2025-01-02 21:17:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2025-01-02 21:17:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2025-01-02 21:17:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2025-01-02 21:17:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2025-01-02 21:17:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2025-01-02 21:17:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2025-01-02 21:17:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2025-01-02 21:17:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2025-01-02 21:17:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2025-01-02 21:17:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2025-01-02 21:17:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2025-01-02 21:17:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2025-01-02 21:17:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2025-01-02 21:17:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '食谱管理', 0, 1, 'recipe', 'recipe/recipe/index', NULL, '', 1, 0, 'C', '0', '0', 'recipe:recipe:list', 'recipe', 'admin', '2025-01-05 15:43:42', 'admin', '2025-01-15 13:08:22', '食谱菜单');
INSERT INTO `sys_menu` VALUES (2001, '食谱查询', 2000, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'recipe:recipe:query', '#', 'admin', '2025-01-05 15:43:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2002, '食谱新增', 2000, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'recipe:recipe:add', '#', 'admin', '2025-01-05 15:43:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '食谱修改', 2000, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'recipe:recipe:edit', '#', 'admin', '2025-01-05 15:43:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '食谱删除', 2000, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'recipe:recipe:remove', '#', 'admin', '2025-01-05 15:43:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '食谱导出', 2000, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'recipe:recipe:export', '#', 'admin', '2025-01-05 15:43:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, '收藏', 0, 1, 'likes', 'recipe/likes/index', NULL, '', 1, 0, 'C', '0', '0', 'recipe:likes:list', 'star', 'admin', '2025-01-10 17:23:58', 'admin', '2025-01-19 17:27:58', '点赞菜单');
INSERT INTO `sys_menu` VALUES (2031, '点赞查询', 2030, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'recipe:likes:query', '#', 'admin', '2025-01-10 17:23:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2032, '点赞新增', 2030, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'recipe:likes:add', '#', 'admin', '2025-01-10 17:23:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, '点赞修改', 2030, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'recipe:likes:edit', '#', 'admin', '2025-01-10 17:23:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2034, '点赞删除', 2030, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'recipe:likes:remove', '#', 'admin', '2025-01-10 17:23:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2035, '点赞导出', 2030, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'recipe:likes:export', '#', 'admin', '2025-01-10 17:23:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2036, '评论', 0, 1, 'review', 'recipe/review/index', NULL, '', 1, 0, 'C', '0', '0', 'recipe:review:list', 'review', 'admin', '2025-01-19 17:31:30', 'admin', '2025-01-19 17:36:48', '评论菜单');
INSERT INTO `sys_menu` VALUES (2037, '评论查询', 2036, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'recipe:review:query', '#', 'admin', '2025-01-19 17:31:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2038, '评论新增', 2036, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'recipe:review:add', '#', 'admin', '2025-01-19 17:31:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2039, '评论修改', 2036, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'recipe:review:edit', '#', 'admin', '2025-01-19 17:31:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2040, '评论删除', 2036, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'recipe:review:remove', '#', 'admin', '2025-01-19 17:31:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2041, '评论导出', 2036, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'recipe:review:export', '#', 'admin', '2025-01-19 17:31:30', '', NULL, '');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20) NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1, '操作日志', 9, 'com.food.web.controller.monitor.SysOperlogController.clean()', 'DELETE', 1, 'admin', '研发部门', '/monitor/operlog/clean', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-16 14:57:17', 71);
INSERT INTO `sys_oper_log` VALUES (2, '点赞', 5, 'com.food.recipe.controller.LikesController.export()', 'POST', 1, 'admin', '研发部门', '/recipe/likes/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-02-16 15:39:45', 660);
INSERT INTO `sys_oper_log` VALUES (3, '点赞', 5, 'com.food.recipe.controller.LikesController.export()', 'POST', 1, 'admin', '研发部门', '/recipe/likes/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-02-16 15:42:12', 36);
INSERT INTO `sys_oper_log` VALUES (4, '食谱', 5, 'com.food.recipe.controller.RecipeController.export()', 'POST', 1, 'admin', '研发部门', '/recipe/recipe/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"15\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-02-16 15:42:39', 31);
INSERT INTO `sys_oper_log` VALUES (5, '评论', 5, 'com.food.recipe.controller.ReviewController.export()', 'POST', 1, 'admin', '研发部门', '/recipe/review/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-02-16 15:43:18', 27);
INSERT INTO `sys_oper_log` VALUES (6, '点赞', 5, 'com.food.recipe.controller.LikesController.export()', 'POST', 1, 'admin', '研发部门', '/recipe/likes/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-02-16 15:49:39', 2794);
INSERT INTO `sys_oper_log` VALUES (7, '点赞', 5, 'com.food.recipe.controller.LikesController.export()', 'POST', 1, 'admin', '研发部门', '/recipe/likes/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-02-16 15:49:39', 98244);
INSERT INTO `sys_oper_log` VALUES (8, '点赞', 5, 'com.food.recipe.controller.LikesController.export()', 'POST', 1, 'admin', '研发部门', '/recipe/likes/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-02-16 15:55:17', 576);
INSERT INTO `sys_oper_log` VALUES (9, '食谱', 5, 'com.food.recipe.controller.RecipeController.export()', 'POST', 1, 'admin', '研发部门', '/recipe/recipe/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"15\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-02-16 15:58:14', 41);
INSERT INTO `sys_oper_log` VALUES (10, '食谱', 5, 'com.food.recipe.controller.RecipeController.export()', 'POST', 1, 'admin', '研发部门', '/recipe/recipe/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"15\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-02-16 15:59:03', 63);
INSERT INTO `sys_oper_log` VALUES (11, '食谱', 5, 'com.food.recipe.controller.RecipeController.export()', 'POST', 1, 'admin', '研发部门', '/recipe/recipe/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"15\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-02-16 15:59:51', 27);
INSERT INTO `sys_oper_log` VALUES (12, '食谱', 5, 'com.food.recipe.controller.RecipeController.export()', 'POST', 1, 'admin', '研发部门', '/recipe/recipe/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"15\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-02-16 16:04:23', 24);
INSERT INTO `sys_oper_log` VALUES (13, '评论', 5, 'com.food.recipe.controller.ReviewController.export()', 'POST', 1, 'admin', '研发部门', '/recipe/review/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-02-16 16:04:49', 31);
INSERT INTO `sys_oper_log` VALUES (14, '字典类型', 3, 'com.food.web.controller.system.SysDictTypeController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dict/type/7', '127.0.0.1', '内网IP', '[7]', NULL, 1, '通知类型已分配,不能删除', '2025-02-17 15:06:15', 7);
INSERT INTO `sys_oper_log` VALUES (15, '字典类型', 3, 'com.food.web.controller.system.SysDictDataController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dict/data/14', '127.0.0.1', '内网IP', '[14]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 15:06:28', 11);
INSERT INTO `sys_oper_log` VALUES (16, '字典类型', 3, 'com.food.web.controller.system.SysDictDataController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dict/data/15', '127.0.0.1', '内网IP', '[15]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 15:06:30', 10);
INSERT INTO `sys_oper_log` VALUES (17, '字典类型', 3, 'com.food.web.controller.system.SysDictTypeController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dict/type/7', '127.0.0.1', '内网IP', '[7]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 15:06:49', 10);
INSERT INTO `sys_oper_log` VALUES (28, '操作日志', 3, 'com.food.web.controller.monitor.SysOperlogController.remove()', 'DELETE', 1, 'admin', '研发部门', '/monitor/operlog/27,26,25,24,23,22,21,20,19,18', '127.0.0.1', '内网IP', '[27,26,25,24,23,22,21,20,19,18]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 15:09:53', 12);
INSERT INTO `sys_oper_log` VALUES (29, '食谱', 5, 'com.food.recipe.controller.RecipeController.export()', 'POST', 1, 'admin', '研发部门', '/recipe/recipe/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"15\",\"state\":\"1\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-02-17 15:11:14', 529);
INSERT INTO `sys_oper_log` VALUES (30, '点赞', 5, 'com.food.recipe.controller.LikesController.export()', 'POST', 1, 'admin', '研发部门', '/recipe/likes/export', '127.0.0.1', '内网IP', '{\"nickName\":\"雷总\",\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-02-17 15:13:55', 574);
INSERT INTO `sys_oper_log` VALUES (31, '字典类型', 9, 'com.food.web.controller.system.SysDictTypeController.refreshCache()', 'DELETE', 1, 'admin', '研发部门', '/system/dict/type/refreshCache', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 15:25:56', 18);
INSERT INTO `sys_oper_log` VALUES (32, '评论', 5, 'com.food.recipe.controller.ReviewController.export()', 'POST', 1, 'admin', '研发部门', '/recipe/review/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-02-17 15:27:52', 583);
INSERT INTO `sys_oper_log` VALUES (33, '食谱', 5, 'com.food.recipe.controller.RecipeController.export()', 'POST', 1, 'admin', '研发部门', '/recipe/recipe/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"15\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-02-17 15:30:13', 34);
INSERT INTO `sys_oper_log` VALUES (34, '字典类型', 2, 'com.food.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-01-05 15:17:28\",\"dictId\":100,\"dictName\":\"审核状态\",\"dictType\":\"recipe_state\",\"params\":{},\"remark\":\"食谱审核状态\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 15:32:15', 25);
INSERT INTO `sys_oper_log` VALUES (35, '字典类型', 2, 'com.food.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-01-06 13:22:04\",\"dictId\":101,\"dictName\":\"菜系\",\"dictType\":\"variety\",\"params\":{},\"remark\":\"食谱类别\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 15:32:28', 12);
INSERT INTO `sys_oper_log` VALUES (36, '字典类型', 9, 'com.food.web.controller.system.SysDictTypeController.refreshCache()', 'DELETE', 1, 'admin', '研发部门', '/system/dict/type/refreshCache', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 15:32:37', 7);
INSERT INTO `sys_oper_log` VALUES (37, '字典类型', 5, 'com.food.web.controller.system.SysDictTypeController.export()', 'POST', 1, 'admin', '研发部门', '/system/dict/type/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-02-17 15:32:37', 23);
INSERT INTO `sys_oper_log` VALUES (38, '食谱', 5, 'com.food.recipe.controller.RecipeController.export()', 'POST', 1, 'admin', '研发部门', '/recipe/recipe/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"15\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-02-17 15:33:09', 25);
INSERT INTO `sys_oper_log` VALUES (39, '评论', 5, 'com.food.recipe.controller.ReviewController.export()', 'POST', 1, 'admin', '研发部门', '/recipe/review/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-02-17 15:35:02', 25);
INSERT INTO `sys_oper_log` VALUES (40, '食谱', 5, 'com.food.recipe.controller.RecipeController.export()', 'POST', 1, 'admin', '研发部门', '/recipe/recipe/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"15\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-02-17 15:43:25', 394193);
INSERT INTO `sys_oper_log` VALUES (41, '食谱', 5, 'com.food.recipe.controller.RecipeController.export()', 'POST', 1, 'admin', '研发部门', '/recipe/recipe/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"15\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-02-17 16:02:01', 508);
INSERT INTO `sys_oper_log` VALUES (42, '食谱', 5, 'com.food.recipe.controller.RecipeController.export()', 'POST', 1, 'admin', '研发部门', '/recipe/recipe/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"15\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-02-17 16:04:33', 546);
INSERT INTO `sys_oper_log` VALUES (43, '食谱', 5, 'com.food.recipe.controller.RecipeController.export()', 'POST', 1, 'admin', '研发部门', '/recipe/recipe/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"15\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-02-17 16:16:44', 533);
INSERT INTO `sys_oper_log` VALUES (44, '食谱', 5, 'com.food.recipe.controller.RecipeController.export()', 'POST', 1, 'admin', '研发部门', '/recipe/recipe/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"15\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-02-17 16:20:00', 534);
INSERT INTO `sys_oper_log` VALUES (45, '食谱', 5, 'com.food.recipe.controller.RecipeController.export()', 'POST', 1, 'admin', '研发部门', '/recipe/recipe/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"15\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-02-17 16:21:24', 558);
INSERT INTO `sys_oper_log` VALUES (46, '食谱', 5, 'com.food.recipe.controller.RecipeController.export()', 'POST', 1, 'admin', '研发部门', '/recipe/recipe/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"15\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-02-17 16:24:49', 529);
INSERT INTO `sys_oper_log` VALUES (47, '食谱', 5, 'com.food.recipe.controller.RecipeController.export()', 'POST', 1, 'admin', '研发部门', '/recipe/recipe/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"15\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-02-17 16:30:26', 561);
INSERT INTO `sys_oper_log` VALUES (48, '点赞', 5, 'com.food.recipe.controller.LikesController.export()', 'POST', 1, 'admin', '研发部门', '/recipe/likes/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-02-17 16:34:55', 517);
INSERT INTO `sys_oper_log` VALUES (49, '评论', 5, 'com.food.recipe.controller.ReviewController.export()', 'POST', 1, 'admin', '研发部门', '/recipe/review/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-02-17 16:36:56', 515);
INSERT INTO `sys_oper_log` VALUES (50, '点赞', 5, 'com.food.recipe.controller.LikesController.export()', 'POST', 1, 'admin', '研发部门', '/recipe/likes/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-02-17 16:36:59', 28);
INSERT INTO `sys_oper_log` VALUES (51, '食谱', 2, 'com.food.recipe.controller.RecipeController.editState()', 'PUT', 1, 'admin', '研发部门', '/recipe/recipe/state', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-01-14 00:48:39\",\"ingredientList\":[{\"ingredientId\":9,\"ingredientName\":\"年糕\",\"ingredientQuantity\":\"200克\",\"params\":{},\"recipeId\":39},{\"ingredientId\":10,\"ingredientName\":\"午餐肉\",\"ingredientQuantity\":\"120克\",\"params\":{},\"recipeId\":39},{\"ingredientId\":11,\"ingredientName\":\"绿豆芽\",\"ingredientQuantity\":\"100克\",\"params\":{},\"recipeId\":39},{\"ingredientId\":12,\"ingredientName\":\"上海青\",\"ingredientQuantity\":\"200克\",\"params\":{},\"recipeId\":39},{\"ingredientId\":13,\"ingredientName\":\"鸡蛋\",\"ingredientQuantity\":\"2颗\",\"params\":{},\"recipeId\":39},{\"ingredientId\":14,\"ingredientName\":\"生抽\",\"ingredientQuantity\":\"1勺\",\"params\":{},\"recipeId\":39},{\"ingredientId\":15,\"ingredientName\":\"老抽\",\"ingredientQuantity\":\"半勺\",\"params\":{},\"recipeId\":39},{\"ingredientId\":16,\"ingredientName\":\"白糖\",\"ingredientQuantity\":\"1小勺\",\"params\":{},\"recipeId\":39},{\"ingredientId\":17,\"ingredientName\":\"辣椒油\",\"ingredientQuantity\":\"2勺\",\"params\":{},\"recipeId\":39}],\"likes\":2,\"params\":{},\"recipeDescription\":\"花样主食 热辣炒年糕吃出幸福感\",\"recipeId\":39,\"recipeImage\":\"/profile/upload/2025/01/14/960_3733996944a5340a0accc724bf227fe0_20250114004335A001.jpg\",\"recipeName\":\"热辣炒年糕\",\"review\":1,\"state\":2,\"stepList\":[{\"params\":{},\"recipeId\":39,\"stepDescription\":\"食材处理如图： 鸡蛋，加几颗盐打散。 调料，混合。 上海青，洗净切段。 午餐肉，切成块状。\",\"stepId\":42,\"stepImage\":\"/profile/upload/2025/01/14/800_9c7ab7ca6d5905ce480f345675cefa23_20250114004609A002.jpg\",\"stepNumber\":1},{\"params\":{},\"recipeId\":39,\"stepDescription\":\"年糕冷水下锅，煮到断生。\",\"stepId\":43,\"stepImage\":\"/profile/upload/2025/01/14/800_6ac11134210b693479166bd806c49560_20250114004624A003.jpg\",\"stepNumber\":2},{\"params\":{},\"recipeId\":39,\"stepDescription\":\"锅中不放油，绿豆芽炒出香味捞出。\",\"stepId\":44,\"stepImage\":\"/profile/upload/2025/01/14/800_79827570c0312e88e53fbaf3db6b6bb4_20250114004637A004.jpg\",\"stepNumber\":3},{\"params\":{},\"recipeId\":39,\"stepDescription\":\"热锅冷油，下鸡蛋滑熟捞出。\",\"stepId\":45,\"stepImage\":\"/profile/upload/2025/01/14/800_bc31be4bae70f93e561f4cbc5599d17b_20250114004653A005.jpg\",\"stepNumber\":4},{\"params\":{},\"recipeId\":39,\"stepDescription\":\"下餐肉煎至微黄。\",\"stepI', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 16:43:45', 42);
INSERT INTO `sys_oper_log` VALUES (52, '点赞', 1, 'com.food.recipe.controller.LikesController.add()', 'POST', 1, 'admin', '研发部门', '/recipe/likes', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-02-17 16:43:59\",\"params\":{},\"recipeId\":101,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 16:43:59', 10);
INSERT INTO `sys_oper_log` VALUES (53, '食谱', 2, 'com.food.recipe.controller.RecipeController.editState()', 'PUT', 1, 'admin', '研发部门', '/recipe/recipe/state', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-01-14 00:48:39\",\"ingredientList\":[{\"ingredientId\":9,\"ingredientName\":\"年糕\",\"ingredientQuantity\":\"200克\",\"params\":{},\"recipeId\":39},{\"ingredientId\":10,\"ingredientName\":\"午餐肉\",\"ingredientQuantity\":\"120克\",\"params\":{},\"recipeId\":39},{\"ingredientId\":11,\"ingredientName\":\"绿豆芽\",\"ingredientQuantity\":\"100克\",\"params\":{},\"recipeId\":39},{\"ingredientId\":12,\"ingredientName\":\"上海青\",\"ingredientQuantity\":\"200克\",\"params\":{},\"recipeId\":39},{\"ingredientId\":13,\"ingredientName\":\"鸡蛋\",\"ingredientQuantity\":\"2颗\",\"params\":{},\"recipeId\":39},{\"ingredientId\":14,\"ingredientName\":\"生抽\",\"ingredientQuantity\":\"1勺\",\"params\":{},\"recipeId\":39},{\"ingredientId\":15,\"ingredientName\":\"老抽\",\"ingredientQuantity\":\"半勺\",\"params\":{},\"recipeId\":39},{\"ingredientId\":16,\"ingredientName\":\"白糖\",\"ingredientQuantity\":\"1小勺\",\"params\":{},\"recipeId\":39},{\"ingredientId\":17,\"ingredientName\":\"辣椒油\",\"ingredientQuantity\":\"2勺\",\"params\":{},\"recipeId\":39}],\"likes\":2,\"params\":{},\"recipeDescription\":\"花样主食 热辣炒年糕吃出幸福感\",\"recipeId\":39,\"recipeImage\":\"/profile/upload/2025/01/14/960_3733996944a5340a0accc724bf227fe0_20250114004335A001.jpg\",\"recipeName\":\"热辣炒年糕\",\"review\":1,\"state\":1,\"stepList\":[{\"params\":{},\"recipeId\":39,\"stepDescription\":\"食材处理如图： 鸡蛋，加几颗盐打散。 调料，混合。 上海青，洗净切段。 午餐肉，切成块状。\",\"stepId\":42,\"stepImage\":\"/profile/upload/2025/01/14/800_9c7ab7ca6d5905ce480f345675cefa23_20250114004609A002.jpg\",\"stepNumber\":1},{\"params\":{},\"recipeId\":39,\"stepDescription\":\"年糕冷水下锅，煮到断生。\",\"stepId\":43,\"stepImage\":\"/profile/upload/2025/01/14/800_6ac11134210b693479166bd806c49560_20250114004624A003.jpg\",\"stepNumber\":2},{\"params\":{},\"recipeId\":39,\"stepDescription\":\"锅中不放油，绿豆芽炒出香味捞出。\",\"stepId\":44,\"stepImage\":\"/profile/upload/2025/01/14/800_79827570c0312e88e53fbaf3db6b6bb4_20250114004637A004.jpg\",\"stepNumber\":3},{\"params\":{},\"recipeId\":39,\"stepDescription\":\"热锅冷油，下鸡蛋滑熟捞出。\",\"stepId\":45,\"stepImage\":\"/profile/upload/2025/01/14/800_bc31be4bae70f93e561f4cbc5599d17b_20250114004653A005.jpg\",\"stepNumber\":4},{\"params\":{},\"recipeId\":39,\"stepDescription\":\"下餐肉煎至微黄。\",\"stepI', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 16:44:10', 14);
INSERT INTO `sys_oper_log` VALUES (54, '食谱', 1, 'com.food.recipe.controller.RecipeController.add()', 'POST', 1, 'admin', '研发部门', '/recipe/recipe', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-02-17 16:45:51\",\"ingredientList\":[],\"likes\":0,\"params\":{},\"recipeDescription\":\"1\",\"recipeId\":102,\"recipeName\":\"1\",\"review\":0,\"state\":1,\"stepList\":[],\"userId\":1,\"variety\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 16:45:51', 8);
INSERT INTO `sys_oper_log` VALUES (55, '食谱', 3, 'com.food.recipe.controller.RecipeController.remove()', 'DELETE', 1, 'admin', '研发部门', '/recipe/recipe/102', '127.0.0.1', '内网IP', '[102]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 16:45:55', 7);
INSERT INTO `sys_oper_log` VALUES (56, '用户管理', 5, 'com.food.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', NULL, '/system/user/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-02-17 17:33:10', 825);
INSERT INTO `sys_oper_log` VALUES (57, '用户管理', 5, 'com.food.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', NULL, '/system/user/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-02-17 17:40:14', 30);
INSERT INTO `sys_oper_log` VALUES (58, '用户管理', 5, 'com.food.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', NULL, '/system/user/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-02-17 17:41:53', 536);
INSERT INTO `sys_oper_log` VALUES (59, '用户管理', 5, 'com.food.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', NULL, '/system/user/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-02-17 17:43:57', 516);
INSERT INTO `sys_oper_log` VALUES (60, '角色管理', 5, 'com.food.web.controller.system.SysRoleController.export()', 'POST', 1, 'admin', NULL, '/system/role/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-02-17 17:44:18', 25);
INSERT INTO `sys_oper_log` VALUES (61, '用户管理', 2, 'com.food.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"1\",\"updateBy\":\"admin\",\"userId\":108}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 18:00:08', 14);
INSERT INTO `sys_oper_log` VALUES (62, '字典类型', 9, 'com.food.web.controller.system.SysDictTypeController.refreshCache()', 'DELETE', 1, 'admin', NULL, '/system/dict/type/refreshCache', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 18:00:38', 14);
INSERT INTO `sys_oper_log` VALUES (63, '用户管理', 2, 'com.food.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', NULL, '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 18:57:17', 69);
INSERT INTO `sys_oper_log` VALUES (64, '角色管理', 2, 'com.food.web.controller.system.SysRoleController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/role/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"status\":\"1\",\"updateBy\":\"admin\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'dept_check_strictly\' in \'field list\'\r\n### The error may exist in file [E:\\毕设\\food\\food-system\\target\\classes\\mapper\\system\\SysRoleMapper.xml]\r\n### The error may involve com.food.system.mapper.SysRoleMapper.updateRole-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_role     SET menu_check_strictly = ?,     dept_check_strictly = ?,     status = ?,          update_by = ?,     update_time = sysdate()     where role_id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'dept_check_strictly\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'dept_check_strictly\' in \'field list\'', '2025-02-17 18:57:25', 37);
INSERT INTO `sys_oper_log` VALUES (65, '角色管理', 2, 'com.food.web.controller.system.SysRoleController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/role/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 18:59:12', 16);
INSERT INTO `sys_oper_log` VALUES (66, '角色管理', 2, 'com.food.web.controller.system.SysRoleController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/role/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 18:59:16', 5);
INSERT INTO `sys_oper_log` VALUES (67, '角色管理', 2, 'com.food.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-01-02 21:17:34\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"menuIds\":[2000,2001,2002,2003,2004,2005,2030,2031,2032,2033,2034,2035,2038,2039,2040,2041],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 18:59:24', 23);
INSERT INTO `sys_oper_log` VALUES (68, '角色管理', 2, 'com.food.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-01-02 21:17:34\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"menuIds\":[2000,2001,2002,2003,2004,2005,2030,2031,2032,2033,2034,2035,2036,2038,2039,2040,2041],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 18:59:27', 12);
INSERT INTO `sys_oper_log` VALUES (69, '角色管理', 2, 'com.food.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-01-02 21:17:34\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"menuIds\":[2000,2001,2002,2003,2004,2005,2030,2031,2032,2033,2034,2035,2036,2037,2038,2039,2040,2041],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 18:59:39', 11);
INSERT INTO `sys_oper_log` VALUES (70, '用户管理', 3, 'com.food.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/101', '127.0.0.1', '内网IP', '[101]', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Table \'food.sys_user_post\' doesn\'t exist\r\n### The error may exist in file [E:\\毕设\\food\\food-system\\target\\classes\\mapper\\system\\SysUserPostMapper.xml]\r\n### The error may involve com.food.system.mapper.SysUserPostMapper.deleteUserPost-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from sys_user_post where user_id in     (       ?          )\r\n### Cause: java.sql.SQLSyntaxErrorException: Table \'food.sys_user_post\' doesn\'t exist\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Table \'food.sys_user_post\' doesn\'t exist', '2025-02-17 18:59:53', 44);
INSERT INTO `sys_oper_log` VALUES (71, '用户管理', 3, 'com.food.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/101', '127.0.0.1', '内网IP', '[101]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 19:04:52', 24);
INSERT INTO `sys_oper_log` VALUES (72, '用户管理', 1, 'com.food.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"1\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":113,\"userName\":\"11\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 19:05:42', 87);
INSERT INTO `sys_oper_log` VALUES (73, '用户管理', 2, 'com.food.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-02-17 19:05:41\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"1\",\"params\":{},\"phonenumber\":\"18555555555\",\"roleIds\":[],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":113,\"userName\":\"11\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 19:05:59', 15);
INSERT INTO `sys_oper_log` VALUES (74, '用户管理', 2, 'com.food.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', NULL, '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":113}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 19:06:08', 65);
INSERT INTO `sys_oper_log` VALUES (75, '用户管理', 4, 'com.food.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', NULL, '/system/user/authRole', '127.0.0.1', '内网IP', '{\"roleIds\":\"2\",\"userId\":\"113\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 19:06:13', 7);
INSERT INTO `sys_oper_log` VALUES (76, '用户管理', 3, 'com.food.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/113', '127.0.0.1', '内网IP', '[113]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 19:06:17', 7);
INSERT INTO `sys_oper_log` VALUES (77, '点赞', 1, 'com.food.recipe.controller.LikesController.add()', 'POST', 1, 'nezha', NULL, '/recipe/likes', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-02-17 19:10:47\",\"params\":{},\"recipeId\":99,\"userId\":114}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 19:10:47', 10);
INSERT INTO `sys_oper_log` VALUES (78, '评论', 1, 'com.food.recipe.controller.ReviewController.add()', 'POST', 1, 'nezha', NULL, '/recipe/review', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-02-17 19:11:24\",\"nickName\":\"nezha\",\"params\":{},\"recipeId\":99,\"recipeName\":\"泉州面线糊\",\"review\":\"很喜欢！\",\"userId\":114}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 19:11:24', 13);
INSERT INTO `sys_oper_log` VALUES (79, '用户头像', 2, 'com.food.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'nezha', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', NULL, 1, '文件[u=1157571229,2891195927&fm=253&fmt=auto&app=120&f=JPEG.webp]后缀[webp]不正确，请上传[bmp, gif, jpg, jpeg, png]格式', '2025-02-17 19:12:48', 7);
INSERT INTO `sys_oper_log` VALUES (80, '用户头像', 2, 'com.food.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'nezha', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'avatar\' at row 16\r\n### The error may exist in file [E:\\毕设\\food\\food-system\\target\\classes\\mapper\\system\\SysUserMapper.xml]\r\n### The error may involve com.food.system.mapper.SysUserMapper.updateUserAvatar-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_user set avatar = ? where user_name = ?\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'avatar\' at row 16\n; Data truncation: Data too long for column \'avatar\' at row 16; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'avatar\' at row 16', '2025-02-17 19:14:33', 86);
INSERT INTO `sys_oper_log` VALUES (81, '用户头像', 2, 'com.food.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'nezha', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2025/02/17/nezha_20250217191605A002.jpg\",\"code\":200}', 0, NULL, '2025-02-17 19:16:05', 8);
INSERT INTO `sys_oper_log` VALUES (82, '个人信息', 2, 'com.food.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'nezha', NULL, '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"nezha@163.com\",\"nickName\":\"哪吒\",\"params\":{},\"phonenumber\":\"19888888888\",\"sex\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 19:16:45', 8);
INSERT INTO `sys_oper_log` VALUES (83, '评论', 3, 'com.food.recipe.controller.ReviewController.remove()', 'DELETE', 1, 'nezha', NULL, '/recipe/review/42', '127.0.0.1', '内网IP', '[42]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 19:16:55', 7);
INSERT INTO `sys_oper_log` VALUES (84, '评论', 1, 'com.food.recipe.controller.ReviewController.add()', 'POST', 1, 'nezha', NULL, '/recipe/review', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-02-17 19:17:03\",\"nickName\":\"哪吒\",\"params\":{},\"recipeId\":99,\"recipeName\":\"泉州面线糊\",\"review\":\"很喜欢\",\"userId\":114}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 19:17:03', 10);
INSERT INTO `sys_oper_log` VALUES (85, '食谱', 1, 'com.food.recipe.controller.RecipeController.add()', 'POST', 1, 'nezha', NULL, '/recipe/recipe', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-02-17 19:26:25\",\"ingredientList\":[{\"ingredientName\":\"芒果(基底)\",\"ingredientQuantity\":\"0.5个\",\"params\":{},\"recipeId\":103},{\"ingredientName\":\"香蕉(基底)\",\"ingredientQuantity\":\"1根\",\"params\":{},\"recipeId\":103},{\"ingredientName\":\"白梨(基底)\",\"ingredientQuantity\":\"1个\",\"params\":{},\"recipeId\":103},{\"ingredientName\":\"安佳牛奶(基底)\",\"ingredientQuantity\":\"10ml\",\"params\":{},\"recipeId\":103},{\"ingredientName\":\"安佳淡奶油(图案)\",\"ingredientQuantity\":\"30ml\",\"params\":{},\"recipeId\":103},{\"ingredientName\":\"红曲粉(图案)\",\"ingredientQuantity\":\"3g\",\"params\":{},\"recipeId\":103},{\"ingredientName\":\"姜黄粉(图案)\",\"ingredientQuantity\":\"3g\",\"params\":{},\"recipeId\":103},{\"ingredientName\":\"竹炭粉(图案)\",\"ingredientQuantity\":\"3g\",\"params\":{},\"recipeId\":103},{\"ingredientName\":\"糖珠(装饰)\",\"ingredientQuantity\":\"15颗\",\"params\":{},\"recipeId\":103}],\"likes\":0,\"params\":{},\"recipeDescription\":\"思慕雪是风靡全世界健康料理，缤纷的色彩都是由天然的蔬果萃取，而作为其中重要成分的安佳牛奶，是来自新西兰纯净新鲜、安全优质的乳品，自2013年正式登陆中国市场以来，安佳已经成为线上线下销量第一的进口常温奶品牌。  安佳也是中国家庭烘焙料理大赛的唯一指定使用乳制品；  甘甜营养的芒果、香蕉、白梨与奶香浓郁的安佳牛奶混合，打造出了这款即梦幻又好味的思慕雪小哪吒。\",\"recipeId\":103,\"recipeImage\":\"/profile/upload/2025/02/17/960_debde068939599d41df257463f9ebc19_20250217192228A003.jpg\",\"recipeName\":\"思慕雪之小哪吒\",\"review\":0,\"state\":0,\"stepList\":[{\"params\":{},\"recipeId\":103,\"stepDescription\":\"如图备料； 红心火龙果是和红曲粉替换的，制作时使用红曲粉更方便；\",\"stepImage\":\"/profile/upload/2025/02/17/800_a1c10264af327bf903d80d45e52b732d_20250217192410A004.jpg\",\"stepNumber\":1},{\"params\":{},\"recipeId\":103,\"stepDescription\":\"芒果、香蕉、白梨切成小块如图；\",\"stepImage\":\"/profile/upload/2025/02/17/800_8d63113ff2a7cec8027127f4ae389971_20250217192424A005.jpg\",\"stepNumber\":2},{\"params\":{},\"recipeId\":103,\"stepDescription\":\"果肉放在搅拌机里，注意水分多的水果放在最下面容易搅打；\",\"stepImage\":\"/profile/upload/2025/02/17/800_57cf5d444aadf01a084a948a55c81ae2_20250217192434A006.jpg\",\"stepNumber\":3},{\"params\":{},\"recipeId\":103,\"stepDescription\":\"加入10ml牛奶，不仅方便搅打，而且有奶香味；\",\"stepImage\":\"/profile/upload/2025/02/17/800_5dc2ea6c8cfe5c8ac4629a24a80a9cd8_20250217192447A007.jpg\",\"stepNumber\":4},{\"params\":{},\"recipeId\":103,\"stepDescripti', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 19:26:25', 16);
INSERT INTO `sys_oper_log` VALUES (86, '食谱', 2, 'com.food.recipe.controller.RecipeController.editState()', 'PUT', 1, 'admin', NULL, '/recipe/recipe/state', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-02-17 19:26:25\",\"ingredientList\":[{\"ingredientId\":118,\"ingredientName\":\"芒果(基底)\",\"ingredientQuantity\":\"0.5个\",\"params\":{},\"recipeId\":103},{\"ingredientId\":119,\"ingredientName\":\"香蕉(基底)\",\"ingredientQuantity\":\"1根\",\"params\":{},\"recipeId\":103},{\"ingredientId\":120,\"ingredientName\":\"白梨(基底)\",\"ingredientQuantity\":\"1个\",\"params\":{},\"recipeId\":103},{\"ingredientId\":121,\"ingredientName\":\"安佳牛奶(基底)\",\"ingredientQuantity\":\"10ml\",\"params\":{},\"recipeId\":103},{\"ingredientId\":122,\"ingredientName\":\"安佳淡奶油(图案)\",\"ingredientQuantity\":\"30ml\",\"params\":{},\"recipeId\":103},{\"ingredientId\":123,\"ingredientName\":\"红曲粉(图案)\",\"ingredientQuantity\":\"3g\",\"params\":{},\"recipeId\":103},{\"ingredientId\":124,\"ingredientName\":\"姜黄粉(图案)\",\"ingredientQuantity\":\"3g\",\"params\":{},\"recipeId\":103},{\"ingredientId\":125,\"ingredientName\":\"竹炭粉(图案)\",\"ingredientQuantity\":\"3g\",\"params\":{},\"recipeId\":103},{\"ingredientId\":126,\"ingredientName\":\"糖珠(装饰)\",\"ingredientQuantity\":\"15颗\",\"params\":{},\"recipeId\":103}],\"likes\":0,\"params\":{},\"recipeDescription\":\"思慕雪是风靡全世界健康料理，缤纷的色彩都是由天然的蔬果萃取，而作为其中重要成分的安佳牛奶，是来自新西兰纯净新鲜、安全优质的乳品，自2013年正式登陆中国市场以来，安佳已经成为线上线下销量第一的进口常温奶品牌。  安佳也是中国家庭烘焙料理大赛的唯一指定使用乳制品；  甘甜营养的芒果、香蕉、白梨与奶香浓郁的安佳牛奶混合，打造出了这款即梦幻又好味的思慕雪小哪吒。\",\"recipeId\":103,\"recipeImage\":\"/profile/upload/2025/02/17/960_debde068939599d41df257463f9ebc19_20250217192228A003.jpg\",\"recipeName\":\"思慕雪之小哪吒\",\"review\":0,\"state\":2,\"stepList\":[{\"params\":{},\"recipeId\":103,\"stepDescription\":\"如图备料； 红心火龙果是和红曲粉替换的，制作时使用红曲粉更方便；\",\"stepId\":138,\"stepImage\":\"/profile/upload/2025/02/17/800_a1c10264af327bf903d80d45e52b732d_20250217192410A004.jpg\",\"stepNumber\":1},{\"params\":{},\"recipeId\":103,\"stepDescription\":\"芒果、香蕉、白梨切成小块如图；\",\"stepId\":139,\"stepImage\":\"/profile/upload/2025/02/17/800_8d63113ff2a7cec8027127f4ae389971_20250217192424A005.jpg\",\"stepNumber\":2},{\"params\":{},\"recipeId\":103,\"stepDescription\":\"果肉放在搅拌机里，注意水分多的水果放在最下面容易搅打；\",\"stepId\":140,\"stepImage\":\"/profile/upload/2025/02/17/800_57cf5d444aadf01a084a948a55c81ae2_20250217192434A006.jpg\",\"stepNumber\":3},{\"params\":{},\"recipeI', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 19:26:54', 10);
INSERT INTO `sys_oper_log` VALUES (87, '食谱', 2, 'com.food.recipe.controller.RecipeController.edit()', 'PUT', 1, 'nezha', NULL, '/recipe/recipe', '127.0.0.1', '内网IP', '{\"ingredientList\":[{\"ingredientId\":118,\"ingredientName\":\"芒果(基底)\",\"ingredientQuantity\":\"0.5个\",\"params\":{},\"recipeId\":103},{\"ingredientId\":119,\"ingredientName\":\"香蕉(基底)\",\"ingredientQuantity\":\"1根\",\"params\":{},\"recipeId\":103},{\"ingredientId\":120,\"ingredientName\":\"白梨(基底)\",\"ingredientQuantity\":\"1个\",\"params\":{},\"recipeId\":103},{\"ingredientId\":121,\"ingredientName\":\"安佳牛奶(基底)\",\"ingredientQuantity\":\"10ml\",\"params\":{},\"recipeId\":103},{\"ingredientId\":122,\"ingredientName\":\"安佳淡奶油(图案)\",\"ingredientQuantity\":\"30ml\",\"params\":{},\"recipeId\":103},{\"ingredientId\":123,\"ingredientName\":\"红曲粉(图案)\",\"ingredientQuantity\":\"3g\",\"params\":{},\"recipeId\":103},{\"ingredientId\":124,\"ingredientName\":\"姜黄粉(图案)\",\"ingredientQuantity\":\"3g\",\"params\":{},\"recipeId\":103},{\"ingredientId\":125,\"ingredientName\":\"竹炭粉(图案)\",\"ingredientQuantity\":\"3g\",\"params\":{},\"recipeId\":103},{\"ingredientId\":126,\"ingredientName\":\"糖珠(装饰)\",\"ingredientQuantity\":\"15颗\",\"params\":{},\"recipeId\":103}],\"params\":{},\"recipeDescription\":\"思慕雪是风靡全世界健康料理，缤纷的色彩都是由天然的蔬果萃取，而作为其中重要成分的安佳牛奶，是来自新西兰纯净新鲜、安全优质的乳品，自2013年正式登陆中国市场以来，安佳已经成为线上线下销量第一的进口常温奶品牌。  安佳也是中国家庭烘焙料理大赛的唯一指定使用乳制品；  甘甜营养的芒果、香蕉、白梨与奶香浓郁的安佳牛奶混合，打造出了这款即梦幻又好味的思慕雪小哪吒。\",\"recipeId\":103,\"recipeImage\":\"/profile/upload/2025/02/17/960_debde068939599d41df257463f9ebc19_20250217192228A003.jpg\",\"recipeName\":\"思慕雪之小哪吒\",\"state\":0,\"stepList\":[{\"params\":{},\"recipeId\":103,\"stepDescription\":\"如图备料； 红心火龙果是和红曲粉替换的，制作时使用红曲粉更方便；\",\"stepId\":138,\"stepImage\":\"/profile/upload/2025/02/17/800_a1c10264af327bf903d80d45e52b732d_20250217192410A004.jpg\",\"stepNumber\":1},{\"params\":{},\"recipeId\":103,\"stepDescription\":\"芒果、香蕉、白梨切成小块如图；\",\"stepId\":139,\"stepImage\":\"/profile/upload/2025/02/17/800_8d63113ff2a7cec8027127f4ae389971_20250217192424A005.jpg\",\"stepNumber\":2},{\"params\":{},\"recipeId\":103,\"stepDescription\":\"果肉放在搅拌机里，注意水分多的水果放在最下面容易搅打；\",\"stepId\":140,\"stepImage\":\"/profile/upload/2025/02/17/800_57cf5d444aadf01a084a948a55c81ae2_20250217192434A006.jpg\",\"stepNumber\":3},{\"params\":{},\"recipeId\":103,\"stepDescription\":\"加入10ml牛奶，不仅方便搅打，而且有奶香味；\",\"step', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 19:27:03', 9);
INSERT INTO `sys_oper_log` VALUES (88, '食谱', 2, 'com.food.recipe.controller.RecipeController.editState()', 'PUT', 1, 'admin', NULL, '/recipe/recipe/state', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-02-17 19:26:25\",\"ingredientList\":[{\"ingredientId\":118,\"ingredientName\":\"芒果(基底)\",\"ingredientQuantity\":\"0.5个\",\"params\":{},\"recipeId\":103},{\"ingredientId\":119,\"ingredientName\":\"香蕉(基底)\",\"ingredientQuantity\":\"1根\",\"params\":{},\"recipeId\":103},{\"ingredientId\":120,\"ingredientName\":\"白梨(基底)\",\"ingredientQuantity\":\"1个\",\"params\":{},\"recipeId\":103},{\"ingredientId\":121,\"ingredientName\":\"安佳牛奶(基底)\",\"ingredientQuantity\":\"10ml\",\"params\":{},\"recipeId\":103},{\"ingredientId\":122,\"ingredientName\":\"安佳淡奶油(图案)\",\"ingredientQuantity\":\"30ml\",\"params\":{},\"recipeId\":103},{\"ingredientId\":123,\"ingredientName\":\"红曲粉(图案)\",\"ingredientQuantity\":\"3g\",\"params\":{},\"recipeId\":103},{\"ingredientId\":124,\"ingredientName\":\"姜黄粉(图案)\",\"ingredientQuantity\":\"3g\",\"params\":{},\"recipeId\":103},{\"ingredientId\":125,\"ingredientName\":\"竹炭粉(图案)\",\"ingredientQuantity\":\"3g\",\"params\":{},\"recipeId\":103},{\"ingredientId\":126,\"ingredientName\":\"糖珠(装饰)\",\"ingredientQuantity\":\"15颗\",\"params\":{},\"recipeId\":103}],\"likes\":0,\"params\":{},\"recipeDescription\":\"思慕雪是风靡全世界健康料理，缤纷的色彩都是由天然的蔬果萃取，而作为其中重要成分的安佳牛奶，是来自新西兰纯净新鲜、安全优质的乳品，自2013年正式登陆中国市场以来，安佳已经成为线上线下销量第一的进口常温奶品牌。  安佳也是中国家庭烘焙料理大赛的唯一指定使用乳制品；  甘甜营养的芒果、香蕉、白梨与奶香浓郁的安佳牛奶混合，打造出了这款即梦幻又好味的思慕雪小哪吒。\",\"recipeId\":103,\"recipeImage\":\"/profile/upload/2025/02/17/960_debde068939599d41df257463f9ebc19_20250217192228A003.jpg\",\"recipeName\":\"思慕雪之小哪吒\",\"review\":0,\"state\":1,\"stepList\":[{\"params\":{},\"recipeId\":103,\"stepDescription\":\"如图备料； 红心火龙果是和红曲粉替换的，制作时使用红曲粉更方便；\",\"stepId\":138,\"stepImage\":\"/profile/upload/2025/02/17/800_a1c10264af327bf903d80d45e52b732d_20250217192410A004.jpg\",\"stepNumber\":1},{\"params\":{},\"recipeId\":103,\"stepDescription\":\"芒果、香蕉、白梨切成小块如图；\",\"stepId\":139,\"stepImage\":\"/profile/upload/2025/02/17/800_8d63113ff2a7cec8027127f4ae389971_20250217192424A005.jpg\",\"stepNumber\":2},{\"params\":{},\"recipeId\":103,\"stepDescription\":\"果肉放在搅拌机里，注意水分多的水果放在最下面容易搅打；\",\"stepId\":140,\"stepImage\":\"/profile/upload/2025/02/17/800_57cf5d444aadf01a084a948a55c81ae2_20250217192434A006.jpg\",\"stepNumber\":3},{\"params\":{},\"recipeI', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 19:27:13', 12);
INSERT INTO `sys_oper_log` VALUES (89, '点赞', 1, 'com.food.recipe.controller.LikesController.add()', 'POST', 1, 'nezha', NULL, '/recipe/likes', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-02-17 19:27:22\",\"params\":{},\"recipeId\":103,\"userId\":114}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 19:27:22', 11);
INSERT INTO `sys_oper_log` VALUES (90, '评论', 1, 'com.food.recipe.controller.ReviewController.add()', 'POST', 1, 'nezha', NULL, '/recipe/review', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-02-17 19:27:42\",\"nickName\":\"哪吒\",\"params\":{},\"recipeId\":103,\"recipeName\":\"思慕雪之小哪吒\",\"review\":\"哈哈哈哈哈，魔童来也！！！\",\"userId\":114}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 19:27:42', 7);
INSERT INTO `sys_oper_log` VALUES (91, '评论', 1, 'com.food.recipe.controller.ReviewController.add()', 'POST', 1, 'admin', NULL, '/recipe/review', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-02-17 19:29:35\",\"nickName\":\"雷总\",\"params\":{},\"recipeId\":103,\"recipeName\":\"思慕雪之小哪吒\",\"review\":\"若前方无路，我便踏出一条路！\\n\\n若天地不容，我便扭转这乾坤！\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 19:29:35', 8);
INSERT INTO `sys_oper_log` VALUES (92, '评论', 1, 'com.food.recipe.controller.ReviewController.add()', 'POST', 1, 'admin', NULL, '/recipe/review', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-02-17 19:30:41\",\"nickName\":\"雷总\",\"params\":{},\"recipeId\":103,\"recipeName\":\"思慕雪之小哪吒\",\"review\":\"3\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 19:30:41', 13);
INSERT INTO `sys_oper_log` VALUES (93, '评论', 3, 'com.food.recipe.controller.ReviewController.remove()', 'DELETE', 1, 'admin', NULL, '/recipe/review/46', '127.0.0.1', '内网IP', '[46]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 19:30:44', 6);
INSERT INTO `sys_oper_log` VALUES (94, '用户管理', 1, 'com.food.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"q\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":115,\"userName\":\"123\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 19:31:14', 78);
INSERT INTO `sys_oper_log` VALUES (95, '用户管理', 2, 'com.food.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":108}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 19:31:17', 4);
INSERT INTO `sys_oper_log` VALUES (96, '用户管理', 2, 'com.food.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', NULL, '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":115}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 19:31:26', 63);
INSERT INTO `sys_oper_log` VALUES (97, '用户管理', 3, 'com.food.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/115', '127.0.0.1', '内网IP', '[115]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 19:31:31', 4);
INSERT INTO `sys_oper_log` VALUES (98, '角色管理', 2, 'com.food.web.controller.system.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL, '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-01-04 16:02:58\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":false,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"roleId\":100,\"roleKey\":\"admins\",\"roleName\":\"管理员\",\"roleSort\":2,\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Table \'food.sys_role_dept\' doesn\'t exist\r\n### The error may exist in file [E:\\毕设\\food\\food-system\\target\\classes\\mapper\\system\\SysRoleDeptMapper.xml]\r\n### The error may involve com.food.system.mapper.SysRoleDeptMapper.deleteRoleDeptByRoleId-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from sys_role_dept where role_id=?\r\n### Cause: java.sql.SQLSyntaxErrorException: Table \'food.sys_role_dept\' doesn\'t exist\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Table \'food.sys_role_dept\' doesn\'t exist', '2025-02-17 19:31:46', 9);
INSERT INTO `sys_oper_log` VALUES (99, '角色管理', 2, 'com.food.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-01-04 16:02:58\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,108,500,1039,1040,1041,501,1042,1043,1044,1045,2000,2001,2002,2003,2004,2005,2030,2031,2032,2033,2034,2035,2036,2037,2038,2039,2040,2041],\"params\":{},\"roleId\":100,\"roleKey\":\"admins\",\"roleName\":\"管理员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 19:34:03', 115);
INSERT INTO `sys_oper_log` VALUES (100, '角色管理', 2, 'com.food.web.controller.system.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL, '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-01-04 16:02:58\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":false,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"roleId\":100,\"roleKey\":\"admins\",\"roleName\":\"管理员\",\"roleSort\":2,\"status\":\"0\"}', NULL, 1, 'Invalid bound statement (not found): com.food.system.mapper.SysRoleDeptMapper.deleteRoleDeptByRoleId', '2025-02-17 19:34:14', 10);
INSERT INTO `sys_oper_log` VALUES (101, '角色管理', 1, 'com.food.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2036,2037,2038,2039,2040,2041],\"params\":{},\"remark\":\"6\",\"roleKey\":\"666\",\"roleName\":\"6\",\"roleSort\":6,\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\r\n### The error may exist in file [E:\\毕设\\food\\food-system\\target\\classes\\mapper\\system\\SysRoleMapper.xml]\r\n### The error may involve com.food.system.mapper.SysRoleMapper.insertRole-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_role(            role_name,       role_key,       role_sort,             menu_check_strictly,       status,       remark,       create_by,      create_time    )values(            ?,       ?,       ?,             ?,       ?,       ?,       ?,       ?,      sysdate()    )\r\n### Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\n; bad SQL grammar []; nested exception is java.sql.SQLException: Column count doesn\'t match value count at row 1', '2025-02-17 19:39:21', 126);
INSERT INTO `sys_oper_log` VALUES (102, '角色管理', 1, 'com.food.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2036,2037,2038,2039,2040,2041],\"params\":{},\"remark\":\"6\",\"roleKey\":\"666\",\"roleName\":\"6\",\"roleSort\":6,\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\r\n### The error may exist in file [E:\\毕设\\food\\food-system\\target\\classes\\mapper\\system\\SysRoleMapper.xml]\r\n### The error may involve com.food.system.mapper.SysRoleMapper.insertRole-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_role(            role_name,       role_key,       role_sort,             menu_check_strictly,       status,       remark,       create_by,      create_time    )values(            ?,       ?,       ?,             ?,       ?,       ?,       ?,       ?,      sysdate()    )\r\n### Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\n; bad SQL grammar []; nested exception is java.sql.SQLException: Column count doesn\'t match value count at row 1', '2025-02-17 19:42:01', 13);
INSERT INTO `sys_oper_log` VALUES (103, '角色管理', 1, 'com.food.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2036,2037,2038,2039,2040,2041],\"params\":{},\"roleId\":101,\"roleKey\":\"555\",\"roleName\":\"555\",\"roleSort\":555,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 19:45:01', 109);
INSERT INTO `sys_oper_log` VALUES (104, '角色管理', 2, 'com.food.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-02-17 19:45:01\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2030,2031,2032,2033,2034,2035,2036,2037,2038,2039,2040,2041],\"params\":{},\"roleId\":101,\"roleKey\":\"555\",\"roleName\":\"555\",\"roleSort\":555,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 19:45:07', 18);
INSERT INTO `sys_oper_log` VALUES (105, '角色管理', 4, 'com.food.web.controller.system.SysRoleController.selectAuthUserAll()', 'PUT', 1, 'admin', NULL, '/system/role/authUser/selectAll', '127.0.0.1', '内网IP', '{\"roleId\":\"101\",\"userIds\":\"103\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 19:45:19', 4);
INSERT INTO `sys_oper_log` VALUES (106, '角色管理', 4, 'com.food.web.controller.system.SysRoleController.cancelAuthUser()', 'PUT', 1, 'admin', NULL, '/system/role/authUser/cancel', '127.0.0.1', '内网IP', '{\"roleId\":101,\"userId\":103}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 19:45:23', 5);
INSERT INTO `sys_oper_log` VALUES (107, '角色管理', 2, 'com.food.web.controller.system.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL, '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-02-17 19:45:01\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"roleId\":101,\"roleKey\":\"555\",\"roleName\":\"555\",\"roleSort\":555,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 19:45:50', 6);
INSERT INTO `sys_oper_log` VALUES (108, '角色管理', 2, 'com.food.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-02-17 19:45:01\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2030,2031,2032,2033,2034,2035,2036,2037,2038,2039,2040,2041],\"params\":{},\"roleId\":101,\"roleKey\":\"555a\",\"roleName\":\"555\",\"roleSort\":555,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 19:55:22', 14);
INSERT INTO `sys_oper_log` VALUES (109, '角色管理', 4, 'com.food.web.controller.system.SysRoleController.selectAuthUserAll()', 'PUT', 1, 'admin', NULL, '/system/role/authUser/selectAll', '127.0.0.1', '内网IP', '{\"roleId\":\"101\",\"userIds\":\"103\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 19:55:28', 5);
INSERT INTO `sys_oper_log` VALUES (110, '角色管理', 4, 'com.food.web.controller.system.SysRoleController.cancelAuthUser()', 'PUT', 1, 'admin', NULL, '/system/role/authUser/cancel', '127.0.0.1', '内网IP', '{\"roleId\":101,\"userId\":103}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 19:55:30', 4);
INSERT INTO `sys_oper_log` VALUES (111, '角色管理', 2, 'com.food.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-02-17 19:45:01\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2036,2037,2038,2039,2040,2041],\"params\":{},\"roleId\":101,\"roleKey\":\"555a\",\"roleName\":\"555\",\"roleSort\":555,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 20:01:53', 9);
INSERT INTO `sys_oper_log` VALUES (112, '菜单管理', 1, 'com.food.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"9\",\"menuType\":\"M\",\"orderNum\":9,\"params\":{},\"parentId\":0,\"path\":\"9\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 20:02:11', 13);
INSERT INTO `sys_oper_log` VALUES (113, '菜单管理', 2, 'com.food.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-02-17 20:02:11\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2042,\"menuName\":\"9\",\"menuType\":\"M\",\"orderNum\":9,\"params\":{},\"parentId\":0,\"path\":\"9\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 20:02:15', 6);
INSERT INTO `sys_oper_log` VALUES (114, '菜单管理', 3, 'com.food.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2042', '127.0.0.1', '内网IP', '2042', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 20:02:17', 8);
INSERT INTO `sys_oper_log` VALUES (115, '字典类型', 2, 'com.food.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-01-02 21:17:34\",\"dictId\":2,\"dictName\":\"菜单状态\",\"dictType\":\"sys_show_hide\",\"params\":{},\"remark\":\"菜单状态列表\",\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 20:02:43', 13);
INSERT INTO `sys_oper_log` VALUES (116, '字典类型', 2, 'com.food.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-01-02 21:17:34\",\"dictId\":2,\"dictName\":\"菜单状态\",\"dictType\":\"sys_show_hide\",\"params\":{},\"remark\":\"菜单状态列表\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 20:02:48', 11);
INSERT INTO `sys_oper_log` VALUES (117, '字典类型', 2, 'com.food.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-01-06 13:22:04\",\"dictId\":101,\"dictName\":\"菜系\",\"dictType\":\"variety\",\"params\":{},\"remark\":\"食谱类别\",\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 20:02:55', 11);
INSERT INTO `sys_oper_log` VALUES (118, '字典类型', 2, 'com.food.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-01-06 13:22:04\",\"dictId\":101,\"dictName\":\"菜系\",\"dictType\":\"variety\",\"params\":{},\"remark\":\"食谱类别\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 20:03:11', 12);
INSERT INTO `sys_oper_log` VALUES (119, '食谱', 2, 'com.food.recipe.controller.RecipeController.editState()', 'PUT', 1, 'admin', NULL, '/recipe/recipe/state', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-02-17 19:26:25\",\"ingredientList\":[{\"ingredientId\":118,\"ingredientName\":\"芒果(基底)\",\"ingredientQuantity\":\"0.5个\",\"params\":{},\"recipeId\":103},{\"ingredientId\":119,\"ingredientName\":\"香蕉(基底)\",\"ingredientQuantity\":\"1根\",\"params\":{},\"recipeId\":103},{\"ingredientId\":120,\"ingredientName\":\"白梨(基底)\",\"ingredientQuantity\":\"1个\",\"params\":{},\"recipeId\":103},{\"ingredientId\":121,\"ingredientName\":\"安佳牛奶(基底)\",\"ingredientQuantity\":\"10ml\",\"params\":{},\"recipeId\":103},{\"ingredientId\":122,\"ingredientName\":\"安佳淡奶油(图案)\",\"ingredientQuantity\":\"30ml\",\"params\":{},\"recipeId\":103},{\"ingredientId\":123,\"ingredientName\":\"红曲粉(图案)\",\"ingredientQuantity\":\"3g\",\"params\":{},\"recipeId\":103},{\"ingredientId\":124,\"ingredientName\":\"姜黄粉(图案)\",\"ingredientQuantity\":\"3g\",\"params\":{},\"recipeId\":103},{\"ingredientId\":125,\"ingredientName\":\"竹炭粉(图案)\",\"ingredientQuantity\":\"3g\",\"params\":{},\"recipeId\":103},{\"ingredientId\":126,\"ingredientName\":\"糖珠(装饰)\",\"ingredientQuantity\":\"15颗\",\"params\":{},\"recipeId\":103}],\"likes\":1,\"params\":{},\"recipeDescription\":\"思慕雪是风靡全世界健康料理，缤纷的色彩都是由天然的蔬果萃取，而作为其中重要成分的安佳牛奶，是来自新西兰纯净新鲜、安全优质的乳品，自2013年正式登陆中国市场以来，安佳已经成为线上线下销量第一的进口常温奶品牌。  安佳也是中国家庭烘焙料理大赛的唯一指定使用乳制品；  甘甜营养的芒果、香蕉、白梨与奶香浓郁的安佳牛奶混合，打造出了这款即梦幻又好味的思慕雪小哪吒。\",\"recipeId\":103,\"recipeImage\":\"/profile/upload/2025/02/17/960_debde068939599d41df257463f9ebc19_20250217192228A003.jpg\",\"recipeName\":\"思慕雪之小哪吒\",\"review\":2,\"state\":1,\"stepList\":[{\"params\":{},\"recipeId\":103,\"stepDescription\":\"如图备料； 红心火龙果是和红曲粉替换的，制作时使用红曲粉更方便；\",\"stepId\":138,\"stepImage\":\"/profile/upload/2025/02/17/800_a1c10264af327bf903d80d45e52b732d_20250217192410A004.jpg\",\"stepNumber\":1},{\"params\":{},\"recipeId\":103,\"stepDescription\":\"芒果、香蕉、白梨切成小块如图；\",\"stepId\":139,\"stepImage\":\"/profile/upload/2025/02/17/800_8d63113ff2a7cec8027127f4ae389971_20250217192424A005.jpg\",\"stepNumber\":2},{\"params\":{},\"recipeId\":103,\"stepDescription\":\"果肉放在搅拌机里，注意水分多的水果放在最下面容易搅打；\",\"stepId\":140,\"stepImage\":\"/profile/upload/2025/02/17/800_57cf5d444aadf01a084a948a55c81ae2_20250217192434A006.jpg\",\"stepNumber\":3},{\"params\":{},\"recipeI', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-02-17 20:18:18', 128);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, '0', '0', 'admin', '2025-01-02 21:17:34', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 3, '2', 0, '0', '0', 'admin', '2025-01-02 21:17:34', 'admin', '2025-02-17 18:59:39', '普通角色');
INSERT INTO `sys_role` VALUES (100, '管理员', 'admins', 2, '1', 1, '0', '0', 'admin', '2025-01-04 16:02:58', 'admin', '2025-02-17 19:34:03', NULL);
INSERT INTO `sys_role` VALUES (101, '555', '555a', 555, '2', 1, '0', '0', 'admin', '2025-02-17 19:45:01', 'admin', '2025-02-17 20:01:53', NULL);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 2000);
INSERT INTO `sys_role_menu` VALUES (2, 2001);
INSERT INTO `sys_role_menu` VALUES (2, 2002);
INSERT INTO `sys_role_menu` VALUES (2, 2003);
INSERT INTO `sys_role_menu` VALUES (2, 2004);
INSERT INTO `sys_role_menu` VALUES (2, 2005);
INSERT INTO `sys_role_menu` VALUES (2, 2030);
INSERT INTO `sys_role_menu` VALUES (2, 2031);
INSERT INTO `sys_role_menu` VALUES (2, 2032);
INSERT INTO `sys_role_menu` VALUES (2, 2033);
INSERT INTO `sys_role_menu` VALUES (2, 2034);
INSERT INTO `sys_role_menu` VALUES (2, 2035);
INSERT INTO `sys_role_menu` VALUES (2, 2036);
INSERT INTO `sys_role_menu` VALUES (2, 2037);
INSERT INTO `sys_role_menu` VALUES (2, 2038);
INSERT INTO `sys_role_menu` VALUES (2, 2039);
INSERT INTO `sys_role_menu` VALUES (2, 2040);
INSERT INTO `sys_role_menu` VALUES (2, 2041);
INSERT INTO `sys_role_menu` VALUES (100, 1);
INSERT INTO `sys_role_menu` VALUES (100, 100);
INSERT INTO `sys_role_menu` VALUES (100, 101);
INSERT INTO `sys_role_menu` VALUES (100, 102);
INSERT INTO `sys_role_menu` VALUES (100, 105);
INSERT INTO `sys_role_menu` VALUES (100, 106);
INSERT INTO `sys_role_menu` VALUES (100, 108);
INSERT INTO `sys_role_menu` VALUES (100, 500);
INSERT INTO `sys_role_menu` VALUES (100, 501);
INSERT INTO `sys_role_menu` VALUES (100, 1000);
INSERT INTO `sys_role_menu` VALUES (100, 1001);
INSERT INTO `sys_role_menu` VALUES (100, 1002);
INSERT INTO `sys_role_menu` VALUES (100, 1003);
INSERT INTO `sys_role_menu` VALUES (100, 1004);
INSERT INTO `sys_role_menu` VALUES (100, 1005);
INSERT INTO `sys_role_menu` VALUES (100, 1006);
INSERT INTO `sys_role_menu` VALUES (100, 1007);
INSERT INTO `sys_role_menu` VALUES (100, 1008);
INSERT INTO `sys_role_menu` VALUES (100, 1009);
INSERT INTO `sys_role_menu` VALUES (100, 1010);
INSERT INTO `sys_role_menu` VALUES (100, 1011);
INSERT INTO `sys_role_menu` VALUES (100, 1012);
INSERT INTO `sys_role_menu` VALUES (100, 1013);
INSERT INTO `sys_role_menu` VALUES (100, 1014);
INSERT INTO `sys_role_menu` VALUES (100, 1015);
INSERT INTO `sys_role_menu` VALUES (100, 1025);
INSERT INTO `sys_role_menu` VALUES (100, 1026);
INSERT INTO `sys_role_menu` VALUES (100, 1027);
INSERT INTO `sys_role_menu` VALUES (100, 1028);
INSERT INTO `sys_role_menu` VALUES (100, 1029);
INSERT INTO `sys_role_menu` VALUES (100, 1030);
INSERT INTO `sys_role_menu` VALUES (100, 1031);
INSERT INTO `sys_role_menu` VALUES (100, 1032);
INSERT INTO `sys_role_menu` VALUES (100, 1033);
INSERT INTO `sys_role_menu` VALUES (100, 1034);
INSERT INTO `sys_role_menu` VALUES (100, 1039);
INSERT INTO `sys_role_menu` VALUES (100, 1040);
INSERT INTO `sys_role_menu` VALUES (100, 1041);
INSERT INTO `sys_role_menu` VALUES (100, 1042);
INSERT INTO `sys_role_menu` VALUES (100, 1043);
INSERT INTO `sys_role_menu` VALUES (100, 1044);
INSERT INTO `sys_role_menu` VALUES (100, 1045);
INSERT INTO `sys_role_menu` VALUES (100, 2000);
INSERT INTO `sys_role_menu` VALUES (100, 2001);
INSERT INTO `sys_role_menu` VALUES (100, 2002);
INSERT INTO `sys_role_menu` VALUES (100, 2003);
INSERT INTO `sys_role_menu` VALUES (100, 2004);
INSERT INTO `sys_role_menu` VALUES (100, 2005);
INSERT INTO `sys_role_menu` VALUES (100, 2030);
INSERT INTO `sys_role_menu` VALUES (100, 2031);
INSERT INTO `sys_role_menu` VALUES (100, 2032);
INSERT INTO `sys_role_menu` VALUES (100, 2033);
INSERT INTO `sys_role_menu` VALUES (100, 2034);
INSERT INTO `sys_role_menu` VALUES (100, 2035);
INSERT INTO `sys_role_menu` VALUES (100, 2036);
INSERT INTO `sys_role_menu` VALUES (100, 2037);
INSERT INTO `sys_role_menu` VALUES (100, 2038);
INSERT INTO `sys_role_menu` VALUES (100, 2039);
INSERT INTO `sys_role_menu` VALUES (100, 2040);
INSERT INTO `sys_role_menu` VALUES (100, 2041);
INSERT INTO `sys_role_menu` VALUES (101, 2036);
INSERT INTO `sys_role_menu` VALUES (101, 2037);
INSERT INTO `sys_role_menu` VALUES (101, 2038);
INSERT INTO `sys_role_menu` VALUES (101, 2039);
INSERT INTO `sys_role_menu` VALUES (101, 2040);
INSERT INTO `sys_role_menu` VALUES (101, 2041);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '雷总', '00', '10086@163.com', '18888888888', '0', '/profile/avatar/2025/01/04/203202570_20250104152733A001.jpg', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-02-17 19:55:10', 'admin', '2025-01-02 21:17:34', '', '2025-02-17 19:55:09', '董事长');
INSERT INTO `sys_user` VALUES (2, 'ry', '张三', '00', 'zs@qq.com', '15267866666', '0', '', '$2a$10$riIpWGKX7sVywgZ9ruruKOAGUXFKXXG4ldLMa1E2VoPF8s8zyqZNm', '0', '0', '127.0.0.1', '2025-01-02 21:17:34', 'admin', '2025-01-02 21:17:34', 'admin', '2025-02-17 18:57:17', '测试员');
INSERT INTO `sys_user` VALUES (100, 'hxg', 'hxg', '00', '', '', '0', '', '$2a$10$fANbRQ8tFD8jr9zsmoCk7unqd.33wi/UZSnMvX4OYEDp4z1oQgPxm', '0', '0', '127.0.0.1', '2025-01-11 19:49:34', '', '2025-01-02 22:34:46', 'admin', '2025-02-16 14:37:04', NULL);
INSERT INTO `sys_user` VALUES (101, '11', '1', '00', '', '16121111112', '2', '', '$2a$10$jbE7hc9YOM/IYZUQ53pqFuHuCoDatnd3XqvAkL3AUX/xKQDqBeGd2', '0', '2', '', NULL, 'admin', '2025-01-04 15:23:29', 'admin', '2025-02-16 14:37:08', NULL);
INSERT INTO `sys_user` VALUES (102, 'hhh', 'hhh', '00', '', '', '0', '', '$2a$10$IN32qdqZQhgcEJ7p2yl22eh8jXYidtRezNvtUHdqZyqkMkcyxVT56', '0', '0', '', NULL, '', '2025-01-04 16:33:19', 'admin', '2025-02-16 14:37:12', NULL);
INSERT INTO `sys_user` VALUES (103, 'asd', 'asd', '00', '', '', '0', '', '$2a$10$jptOT/1r1wUmRhN1rwyKS.FlPAAdzVslFKvokNn4vfpXT3Jp4.fXq', '0', '0', '', NULL, '', '2025-01-04 19:54:50', 'admin', '2025-02-16 14:37:15', NULL);
INSERT INTO `sys_user` VALUES (104, 'asda', 'asda', '00', '', '', '0', '', '$2a$10$cWPnyXhTgpyRKBEBtY9yOO.MCq2saXnIxKqFNP7Co0uLUkIeb8yxy', '0', '0', '', NULL, '', '2025-01-04 20:21:26', 'admin', '2025-02-16 14:37:18', NULL);
INSERT INTO `sys_user` VALUES (106, 'aa', 'aa', '00', '', '', '0', '', '$2a$10$d/N3sSQgvmNQMoSenn0Ureca3rS9PiUnuKYd0NwI0P6EvXAPs1nuC', '0', '0', '127.0.0.1', '2025-01-04 20:25:22', '', '2025-01-04 20:23:54', 'admin', '2025-02-16 14:37:21', NULL);
INSERT INTO `sys_user` VALUES (107, 'lisi', 'lisi', '00', '', '', '0', '', '$2a$10$clXTgwQNG3p81Mx7j1xrHO6I.7GQ6AZv2/4zy1ZRfbqzuQMmfqRTO', '0', '0', '127.0.0.1', '2025-01-04 20:26:45', '', '2025-01-04 20:26:01', 'admin', '2025-02-16 14:37:24', NULL);
INSERT INTO `sys_user` VALUES (108, 'lll', '小雷', '00', 'lw@qq.com', '16666666666', '0', '/profile/avatar/2025/01/21/78795_20250121211108A004.jpg', '$2a$10$yrZusmLfPTBYeLOSeO4vnuaYmEP6PThFobAtYQUyKlNy0jZEyQgka', '0', '0', '127.0.0.1', '2025-01-26 15:25:02', '', '2025-01-05 21:09:32', 'admin', '2025-02-17 19:31:17', NULL);
INSERT INTO `sys_user` VALUES (109, 'wangwu', 'wangwu', '00', '', '', '0', '', '$2a$10$FnE9zRXgQeIkTJIqnHGveuBiFF8W790ZqRCmTePdbzw9xKnOgB74O', '0', '0', '127.0.0.1', '2025-01-26 20:06:46', '', '2025-01-26 20:06:32', 'admin', '2025-02-16 14:37:33', NULL);
INSERT INTO `sys_user` VALUES (110, 'hhhhh', '小黄', '00', '666@qq.com', '16688888888', '0', '/profile/avatar/2025/02/13/05c93b144febfe8bc3b4cc8f07a091dd_20250213223928A001.png', '$2a$10$RfzZB6DrwBUSO/shrb4ozOve6rgjrzOT8ELfoKKDz3RhS2xl/asiO', '0', '0', '127.0.0.1', '2025-02-14 14:13:12', '', '2025-02-13 19:39:54', 'admin', '2025-02-16 14:37:36', NULL);
INSERT INTO `sys_user` VALUES (111, 'liuliu', '刘六', '00', '123@qq.com', '19566666666', '0', '/profile/avatar/2025/02/16/d884de664794c44b22b6ec1d4906abac_20250216140857A014.jpeg', '$2a$10$NlqR/CjwD5U4OFMI/.UWv.QwVOxuMjz3wx9Bu4KniM0GP9Qw/EiVG', '0', '0', '127.0.0.1', '2025-02-16 14:30:08', '', '2025-02-14 17:44:25', 'admin', '2025-02-16 14:37:39', NULL);
INSERT INTO `sys_user` VALUES (112, 'zhaoliu', '赵六', '00', '345@qq.com', '18666666666', '1', '/profile/avatar/2025/02/16/6ecb88e9a6b477c164e08ab513b90b69_20250216132211A001.jpg', '$2a$10$tXk26tcruRVpvzlmYzfCSudItjo3qYwdLZm6EnBTkqnYFGcnm7JXi', '0', '0', '127.0.0.1', '2025-02-16 14:22:45', '', '2025-02-14 17:45:49', 'admin', '2025-02-16 14:37:41', NULL);
INSERT INTO `sys_user` VALUES (113, '11', '1', '00', '', '18555555555', '0', '', '$2a$10$M9rOxOEacsWCgu.ekPPQH.x9MqSggp3oJnmzxN0d3DKubYLQI2tty', '0', '2', '', NULL, 'admin', '2025-02-17 19:05:41', 'admin', '2025-02-17 19:06:08', NULL);
INSERT INTO `sys_user` VALUES (114, 'nezha', '哪吒', '00', 'nezha@163.com', '19888888888', '0', '/profile/avatar/2025/02/17/nezha_20250217191605A002.jpg', '$2a$10$HXRy6Zh6rXgmi/LPWFr7ku3C9COTXMfghF3qYv3fHwjp/s9J0Mv2K', '0', '0', '127.0.0.1', '2025-02-17 19:10:36', '', '2025-02-17 19:10:22', '', '2025-02-17 19:16:45', NULL);
INSERT INTO `sys_user` VALUES (115, '123', 'q', '00', '', '', '0', '', '$2a$10$OP7/Afwe9YKZZzMp2btSCueYkGc5uygMcXEa3lki7hymH48ZQNAAu', '0', '2', '', NULL, 'admin', '2025-02-17 19:31:14', 'admin', '2025-02-17 19:31:26', NULL);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (100, 100);
INSERT INTO `sys_user_role` VALUES (105, 2);
INSERT INTO `sys_user_role` VALUES (106, 2);
INSERT INTO `sys_user_role` VALUES (107, 2);
INSERT INTO `sys_user_role` VALUES (108, 2);
INSERT INTO `sys_user_role` VALUES (109, 2);
INSERT INTO `sys_user_role` VALUES (110, 2);
INSERT INTO `sys_user_role` VALUES (111, 2);
INSERT INTO `sys_user_role` VALUES (112, 2);
INSERT INTO `sys_user_role` VALUES (114, 2);

SET FOREIGN_KEY_CHECKS = 1;
