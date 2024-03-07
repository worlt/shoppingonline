/*
 Navicat Premium Data Transfer

 Source Server         : JavaPT
 Source Server Type    : MySQL
 Source Server Version : 80032
 Source Host           : localhost:3306
 Source Schema         : merchandise

 Target Server Type    : MySQL
 Target Server Version : 80032
 File Encoding         : 65001

 Date: 20/12/2023 19:57:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for hotmerchandise
-- ----------------------------
DROP TABLE IF EXISTS `hotmerchandise`;
CREATE TABLE `hotmerchandise`  (
  `mid` int(0) NOT NULL,
  PRIMARY KEY (`mid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hotmerchandise
-- ----------------------------
INSERT INTO `hotmerchandise` VALUES (1);
INSERT INTO `hotmerchandise` VALUES (2);
INSERT INTO `hotmerchandise` VALUES (3);
INSERT INTO `hotmerchandise` VALUES (4);
INSERT INTO `hotmerchandise` VALUES (5);
INSERT INTO `hotmerchandise` VALUES (6);
INSERT INTO `hotmerchandise` VALUES (7);
INSERT INTO `hotmerchandise` VALUES (8);

-- ----------------------------
-- Table structure for merchandise
-- ----------------------------
DROP TABLE IF EXISTS `merchandise`;
CREATE TABLE `merchandise`  (
  `mid` int(0) NOT NULL AUTO_INCREMENT,
  `mname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `mprice` double(10, 2) NULL DEFAULT NULL,
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `tips` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `inum` int(0) NULL DEFAULT NULL,
  `stock` int(0) NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`mid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1002 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of merchandise
-- ----------------------------
INSERT INTO `merchandise` VALUES (1, 'HUAWEI Mate 60 Pro', 6999.00, '卫星通话，超可靠玄武架构，全焦段超清影像', '先有华为后有天，麒麟9000卖6000', 3, 1453, '手机');
INSERT INTO `merchandise` VALUES (2, '小米14', 3999.00, '徕卡光学镜头 光影猎人900 徕卡75mm浮动长焦 骁龙8Gen3', '3999交个朋友，干翻友商！', 3, 123123, '手机');
INSERT INTO `merchandise` VALUES (3, 'HUAWEI MateBook 14s', 6199.00, '13代酷睿标压处理器，2.5K高刷触控屏', '本产品全国联保，享受三包服务，质保期为：主机、主要部件、电源线自购机日起2年（含）免费保修，电池、预置windows系统、皮套键盘、扩展坞、鼠标、转接头等其他配件自购机日起1年（含）免费保修，背包不保修。', 3, 3464323, '笔记本');
INSERT INTO `merchandise` VALUES (4, 'Vivo X100', 3999.00, '专业影像旗舰，蔡司全焦段影像系统，蓝晶 ×天玑 9300，全大核设计，蓝海续航系统，OriginOS 4.', '蔡司全焦段专业影像 方寸细节，自然真实 精度跃迁一英寸主摄 蔡司 APO 超级长焦 超视野超广角摄像头', 3, 312432, '手机');
INSERT INTO `merchandise` VALUES (5, 'iPhone 15 Pro', 7999.00, 'iPhone 15 Pro 和 iPhone 15 Pro Max 不再随附电源适配器和 EarPods。包装盒内随附一根 USB-C 充电线，可支持快速充电，并兼容 USB-C 电源适配器和电脑端口。', ' 折抵换购服务由 Apple 的折抵服务合作伙伴提供。折抵金额报价仅为预估价，实际折抵金额可能低于预估价值，具体金额取决于设备的状况、配置、推出年份，以及发售国家或地区。并非所有设备均有资格获得折抵金额。', 3, 234256, '手机');
INSERT INTO `merchandise` VALUES (6, 'HUAWEI nova 11 SE', 1999.00, '3200万高清自拍，一亿像素光影人像，HarmonyOS 4', '骁龙680，1999', 3, 98879, '手机');
INSERT INTO `merchandise` VALUES (7, 'Redmi Note 11T Pro', 1799.00, '天玑8100，性能小钢炮', '天玑8100｜144Hz高配LCD屏幕｜6400万像素｜VC液冷散热', 3, 7634634, '手机');
INSERT INTO `merchandise` VALUES (8, 'Xiaomi MIX Fold 3', 8999.00, '小米龙骨转轴|徕卡光学全焦段四摄|小米澎湃电池|双E6旗舰屏幕|第二代骁龙8 领先版|大屏交互|智能大屏', '价值399元Xiaomi 臻享礼盒 黑色x1，赠完即止', 3, 563534, '手机');
INSERT INTO `merchandise` VALUES (9, 'iQOO 12 传奇版', 4299.00, '第三代骁龙8移动平台|自研电竞芯片Q1|万里追光影像系统|全时四区散热系统|1.5K 144Hz 全天候超感屏', '屏幕清晰流畅，机身具有美感', 3, 3434645, '手机');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `oid` int(0) NOT NULL AUTO_INCREMENT,
  `uid` int(0) NULL DEFAULT NULL,
  `mid` int(0) NULL DEFAULT NULL,
  `mname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `quantity` int(0) NULL DEFAULT NULL,
  `odate` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`oid`) USING BTREE,
  INDEX `mid`(`mid`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`mid`) REFERENCES `merchandise` (`mid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (64, 1, 1, 'HUAWEI Mate 60 Pro', 1, '2023-12-09 23:14:08');
INSERT INTO `orders` VALUES (65, 1, 3, 'HUAWEI MateBook 14s', 1, '2023-12-09 23:14:08');
INSERT INTO `orders` VALUES (66, 1, 2, '小米14', 1, '2023-12-09 23:14:08');
INSERT INTO `orders` VALUES (67, 1, 4, 'Vivo X100', 1, '2023-12-09 23:14:08');
INSERT INTO `orders` VALUES (68, 1, 1, 'HUAWEI Mate 60 Pro', 1, '2023-12-09 23:15:41');
INSERT INTO `orders` VALUES (69, 1, 3, 'HUAWEI MateBook 14s', 1, '2023-12-09 23:15:41');
INSERT INTO `orders` VALUES (70, 1, 2, '小米14', 1, '2023-12-09 23:15:41');
INSERT INTO `orders` VALUES (71, 1, 4, 'Vivo X100', 1, '2023-12-09 23:15:41');
INSERT INTO `orders` VALUES (72, 3, 1, 'HUAWEI Mate 60 Pro', 1, '2023-12-11 23:18:59');
INSERT INTO `orders` VALUES (73, 3, 3, 'HUAWEI MateBook 14s', 1, '2023-12-11 23:18:59');
INSERT INTO `orders` VALUES (74, 1, 1, 'HUAWEI Mate 60 Pro', 1, '2023-12-12 15:17:37');
INSERT INTO `orders` VALUES (75, 1, 3, 'HUAWEI MateBook 14s', 1, '2023-12-12 15:17:37');
INSERT INTO `orders` VALUES (76, 1, 2, '小米14', 1, '2023-12-12 15:17:37');
INSERT INTO `orders` VALUES (77, 1, 4, 'Vivo X100', 1, '2023-12-12 15:17:37');
INSERT INTO `orders` VALUES (78, 1, 1, 'HUAWEI Mate 60 Pro', 1, '2023-12-12 15:17:58');
INSERT INTO `orders` VALUES (79, 1, 3, 'HUAWEI MateBook 14s', 1, '2023-12-12 15:17:58');
INSERT INTO `orders` VALUES (80, 1, 2, '小米14', 1, '2023-12-12 15:17:58');
INSERT INTO `orders` VALUES (81, 1, 4, 'Vivo X100', 1, '2023-12-12 15:17:58');
INSERT INTO `orders` VALUES (82, 4, 2, '小米14', 1, '2023-12-12 15:35:20');
INSERT INTO `orders` VALUES (83, 4, 2, '小米14', 1, '2023-12-12 15:35:29');
INSERT INTO `orders` VALUES (84, 4, 2, '小米14', 1, '2023-12-12 15:35:42');
INSERT INTO `orders` VALUES (85, 4, 2, '小米14', 1, '2023-12-12 15:35:51');
INSERT INTO `orders` VALUES (86, 4, 2, '小米14', 1, '2023-12-12 15:36:50');
INSERT INTO `orders` VALUES (87, 4, 2, '小米14', 1, '2023-12-12 15:36:51');
INSERT INTO `orders` VALUES (88, 4, 2, '小米14', 1, '2023-12-12 15:36:52');
INSERT INTO `orders` VALUES (89, 4, 2, '小米14', 1, '2023-12-12 15:36:52');
INSERT INTO `orders` VALUES (90, 4, 2, '小米14', 1, '2023-12-12 15:36:52');
INSERT INTO `orders` VALUES (91, 4, 2, '小米14', 1, '2023-12-12 15:36:53');
INSERT INTO `orders` VALUES (92, 4, 2, '小米14', 1, '2023-12-12 15:36:53');
INSERT INTO `orders` VALUES (93, 8, 1, 'HUAWEI Mate 60 Pro', 1, '2023-12-12 16:21:38');
INSERT INTO `orders` VALUES (94, 8, 1, 'HUAWEI Mate 60 Pro', 1, '2023-12-12 16:26:13');
INSERT INTO `orders` VALUES (95, 8, 2, '小米14', 1, '2023-12-12 16:26:13');
INSERT INTO `orders` VALUES (96, 8, 1, 'HUAWEI Mate 60 Pro', 1, '2023-12-12 16:26:46');
INSERT INTO `orders` VALUES (97, 8, 2, '小米14', 1, '2023-12-12 16:26:46');
INSERT INTO `orders` VALUES (98, 8, 8, 'Xiaomi MIX Fold 3', 1, '2023-12-12 16:26:46');
INSERT INTO `orders` VALUES (99, 3, 1, 'HUAWEI Mate 60 Pro', 1, '2023-12-15 12:42:01');
INSERT INTO `orders` VALUES (100, 3, 3, 'HUAWEI MateBook 14s', 1, '2023-12-15 12:42:01');
INSERT INTO `orders` VALUES (101, 9, 1, 'HUAWEI Mate 60 Pro', 1, '2023-12-18 23:23:55');
INSERT INTO `orders` VALUES (102, 10, 9, 'iQOO 12 传奇版', 1, '2023-12-19 08:29:51');
INSERT INTO `orders` VALUES (103, 10, 9, 'iQOO 12 传奇版', 1, '2023-12-19 08:30:29');
INSERT INTO `orders` VALUES (104, 10, 5, 'iPhone 15 Pro', 1, '2023-12-19 08:30:29');

-- ----------------------------
-- Table structure for shop
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop`  (
  `uid` int(0) NULL DEFAULT NULL,
  `mid` int(0) NULL DEFAULT NULL,
  `isStar` tinyint(1) NULL DEFAULT NULL,
  `isCart` tinyint(1) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shop
-- ----------------------------
INSERT INTO `shop` VALUES (1, 1, 1, 0);
INSERT INTO `shop` VALUES (1, 3, 1, 0);
INSERT INTO `shop` VALUES (1, 2, 0, 0);
INSERT INTO `shop` VALUES (1, 4, 0, 1);
INSERT INTO `shop` VALUES (3, 1, 0, 1);
INSERT INTO `shop` VALUES (3, 3, 0, 0);
INSERT INTO `shop` VALUES (4, 2, 0, 0);
INSERT INTO `shop` VALUES (6, 1, 0, 1);
INSERT INTO `shop` VALUES (8, 1, 1, 0);
INSERT INTO `shop` VALUES (8, 2, 0, 0);
INSERT INTO `shop` VALUES (8, 8, 0, 0);
INSERT INTO `shop` VALUES (3, 2, 0, 1);
INSERT INTO `shop` VALUES (9, 1, 1, 0);
INSERT INTO `shop` VALUES (10, 9, 0, 0);
INSERT INTO `shop` VALUES (10, 5, 0, 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `uname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `pwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `balance` double(255, 2) NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'jkl', '18948654890', '123', 96600000.00, '广东省广州市从化区广州软件学院');
INSERT INTO `user` VALUES (3, 'a', '123', '123', 999.00, 'jkl');
INSERT INTO `user` VALUES (4, '1', '18948655890', '123', NULL, NULL);
INSERT INTO `user` VALUES (5, '6', '18904899570', '123', NULL, NULL);
INSERT INTO `user` VALUES (7, 'qq', '18903677589', '123', NULL, NULL);
INSERT INTO `user` VALUES (8, 'pp', '18967855346', '123', NULL, NULL);
INSERT INTO `user` VALUES (9, 'b', '18562355412', '123', NULL, NULL);
INSERT INTO `user` VALUES (10, '战士', '18948653211', '123', 100.00, '广州软件学院');

SET FOREIGN_KEY_CHECKS = 1;
