/*
 Navicat Premium Data Transfer

 Source Server         : shishi
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : eleme

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 25/02/2019 09:48:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

create database if not exists eleme;
use eleme;
-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `consumerNO` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '买家编号',
  `province` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '省份',
  `city` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '市区',
  `district` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区域',
  `street` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '街道',
  `streetNumber` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门牌号',
  `comment` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `checked` int(11) NOT NULL COMMENT '默认地址标记',
  `business` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pointLng` double NOT NULL,
  `pointLat` double NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phoneNum` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for consumer
-- ----------------------------
DROP TABLE IF EXISTS `consumer`;
CREATE TABLE `consumer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `consumerNo` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '买家编号9位数字',
  `consumerPhoneNum` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '买家手机号码',
  `consumerNickName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '买家昵称',
  `consumerLoginPsw` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录密码',
  `consumerMail` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱，仅支持163',
  `consumerStatus` int(11) NOT NULL COMMENT '买家协议，1/0 确认/否',
  `consumerWechar` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信账号',
  `consumerVIP` int(11) NOT NULL COMMENT '非会员/会员 0/1 ',
  `consumerPortraitURL` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '买家头像URL',
  `consumerBalance` double NOT NULL COMMENT '买家余额',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `consumer_consumerPhoneNum_uindex`(`consumerPhoneNum`) USING BTREE,
  UNIQUE INDEX `consumer_consumerNo_uindex`(`consumerNo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of consumer
-- ----------------------------
INSERT INTO `consumer` VALUES (1, '274860695', '18359100900', '测试1', 'zhj123', '123@163.com', 1, '暂未开发', 0, '', 0);

-- ----------------------------
-- Table structure for foods
-- ----------------------------
DROP TABLE IF EXISTS `foods`;
CREATE TABLE `foods`  (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `restaurantNo` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '店铺唯一编号',
  `foodsNo` int(9) NOT NULL COMMENT '商品唯一编号',
  `foodsName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品名称',
  `foodsPrice` double(4, 2) NOT NULL COMMENT '商品价格',
  `foodsPictureURL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品图片地址',
  `foodsSynopsis` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品简介',
  `foodsScore` double(4, 1) UNSIGNED ZEROFILL NOT NULL COMMENT '商品评分',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `foods_foodsNo_uindex`(`foodsNo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of foods
-- ----------------------------
INSERT INTO `foods` VALUES (1, '111111111', 111111111, '小炒肉', 15.00, '1', '农家小炒肉', 09.6);
INSERT INTO `foods` VALUES (2, '111111111', 111111112, '小鸡炖蘑菇', 34.00, '2', '蘑菇蘑菇', 08.4);
INSERT INTO `foods` VALUES (3, '211111111', 211111111, '鱼香肉丝', 18.00, '3', '肉丝', 07.6);
INSERT INTO `foods` VALUES (4, '211111111', 211111112, '辣椒炒辣椒', 17.00, '4', '辣', 08.8);
INSERT INTO `foods` VALUES (5, '311111111', 311111111, '烧仙草', 15.00, '5', '烧仙草', 08.2);
INSERT INTO `foods` VALUES (6, '311111111', 311111112, '布丁', 18.00, '6', '布丁', 09.9);
INSERT INTO `foods` VALUES (7, '411111111', 411111111, '兰州拉面', 10.00, '7', '拉面', 07.2);
INSERT INTO `foods` VALUES (8, '411111111', 411111112, '刀削面', 12.00, '8', '刀削面', 07.6);
INSERT INTO `foods` VALUES (9, '511111111', 511111111, '肥宅快乐水', 3.00, '9', '快乐快乐', 10.0);
INSERT INTO `foods` VALUES (10, '511111111', 511111112, '雪碧', 3.00, '10', '雪碧', 09.9);

-- ----------------------------
-- Table structure for restaurant
-- ----------------------------
DROP TABLE IF EXISTS `restaurant`;
CREATE TABLE `restaurant`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `restaurantNo` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '店铺唯一编号',
  `restaurantAddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '店铺地址',
  `restaurantName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '店铺名称',
  `restaurantPhone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '店铺电话',
  `restaurantPortraitURL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '店铺头像',
  `restaurantNotice` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '店铺公告',
  `restaurantTypeNo` int(10) NOT NULL COMMENT '1.小吃夜宵 2.营养早餐 3.快餐便当 4.汉堡饮品 5.商店超市',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `restaurant_restaurantNo_uindex`(`restaurantNo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of restaurant
-- ----------------------------
INSERT INTO `restaurant` VALUES (1, '111111111', '东二门', '美味小炒', '15638756928', 'picture/rest4.png', '美味小炒', 1);
INSERT INTO `restaurant` VALUES (2, '211111111', '上湖', '清真早餐厦门店', '13896475866', 'picture/rest3.png', '清真早餐', 2);
INSERT INTO `restaurant` VALUES (3, '311111111', '软件园东门店', '奶茶（东门店）', '16954785232', 'picture/rest2.png', '奶茶汉堡', 4);
INSERT INTO `restaurant` VALUES (4, '411111111', '厦门软件园二期', '拉面馆', '14698753621', 'picture/rest5.png', '拉面便当', 3);
INSERT INTO `restaurant` VALUES (5, '511111111', '西门外', '便利超市', '16587953421', 'picture/rest1.png', '便利超市', 5);

-- ----------------------------
-- Table structure for restaurant_type
-- ----------------------------
DROP TABLE IF EXISTS `restaurant_type`;
CREATE TABLE `restaurant_type`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '类型编号',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '饭店种类',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of restaurant_type
-- ----------------------------
INSERT INTO `restaurant_type` VALUES (1, '小吃夜宵');
INSERT INTO `restaurant_type` VALUES (2, '营养快餐');
INSERT INTO `restaurant_type` VALUES (3, '快餐便当');
INSERT INTO `restaurant_type` VALUES (4, '汉堡超市');
INSERT INTO `restaurant_type` VALUES (5, '商店超市');

SET FOREIGN_KEY_CHECKS = 1;
