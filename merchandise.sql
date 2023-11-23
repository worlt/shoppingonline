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

 Date: 23/11/2023 21:15:53
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
  PRIMARY KEY (`mid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of merchandise
-- ----------------------------
INSERT INTO `merchandise` VALUES (1, 'HUAWEI Mate 60 Pro', 6999.00, '卫星通话，超可靠玄武架构，全焦段超清影像', '先有华为后有天，麒麟9000卖6000', 3);
INSERT INTO `merchandise` VALUES (2, '小米14', 3999.00, '徕卡光学镜头 光影猎人900 徕卡75mm浮动长焦 骁龙8Gen3', '3999交个朋友，干翻友商！', 3);
INSERT INTO `merchandise` VALUES (3, 'HUAWEI MateBook 14s', 6199.00, '13代酷睿标压处理器，2.5K高刷触控屏', '本产品全国联保，享受三包服务，质保期为：主机、主要部件、电源线自购机日起2年（含）免费保修，电池、预置windows系统、皮套键盘、扩展坞、鼠标、转接头等其他配件自购机日起1年（含）免费保修，背包不保修。', 3);
INSERT INTO `merchandise` VALUES (4, 'Vivo X100', 3999.00, '专业影像旗舰，蔡司全焦段影像系统，蓝晶 ×天玑 9300，全大核设计，蓝海续航系统，OriginOS 4.', '蔡司全焦段专业影像 方寸细节，自然真实 精度跃迁一英寸主摄 蔡司 APO 超级长焦 超视野超广角摄像头', 3);
INSERT INTO `merchandise` VALUES (5, 'iPhone 15 Pro', 7999.00, 'iPhone 15 Pro 和 iPhone 15 Pro Max 不再随附电源适配器和 EarPods。包装盒内随附一根 USB-C 充电线，可支持快速充电，并兼容 USB-C 电源适配器和电脑端口。', ' 折抵换购服务由 Apple 的折抵服务合作伙伴提供。折抵金额报价仅为预估价，实际折抵金额可能低于预估价值，具体金额取决于设备的状况、配置、推出年份，以及发售国家或地区。并非所有设备均有资格获得折抵金额。', 3);
INSERT INTO `merchandise` VALUES (6, 'HUAWEI nova 11 SE', 1999.00, '3200万高清自拍，一亿像素光影人像，HarmonyOS 4', '骁龙680，1999', 3);

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
INSERT INTO `shop` VALUES (1, 1, 1, 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'jkl', '18948655890', '123', 666.00, '广东省广州市从化区广州软件学院');

SET FOREIGN_KEY_CHECKS = 1;
