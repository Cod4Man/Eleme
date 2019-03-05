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

 Date: 05/03/2019 10:41:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

DROP database IF EXISTS eleme;
CREATE databse eleme; 
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
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (28, '111111111', '福建省', '厦门市', '湖里区', '软件园二期', '123', '备注', 1, '商业圈1', 118.193281, 24.489317, '张三', '12589635874', 1);
INSERT INTO `address` VALUES (29, '311111111', '福建省', '厦门市', '湖里区', '软件园二期', '123', '备注', 1, '商业圈1', 118.193281, 24.489317, '张三', '12589635874', 1);
INSERT INTO `address` VALUES (35, '211111111', '福建省', '厦门市', '湖里区', '软件园二期', '123', '备注', 1, '商业圈1', 118.193281, 24.489317, '张三', '12589635874', 1);
INSERT INTO `address` VALUES (44, '696972459', '福建省', '漳州市', '龙海市', '', '', 'yoyouyo', 0, '', 118.108221, 24.248409, 'haochima', '18359100900', 0);
INSERT INTO `address` VALUES (47, '696972459', '福建省', '泉州市', '金门县', '', '', 'change', 0, '', 118.40574, 24.512766, 'change', '18359100900', 0);
INSERT INTO `address` VALUES (48, '696972459', '福建省', '厦门市', '思明区', '观日路', '46号', '无', 0, '前埔医院', 118.193488, 24.490505, 'weekend Z', '18359100900', 0);
INSERT INTO `address` VALUES (50, '696972459', '福建省', '厦门市', '思明区', '观日路', '46号', '无', 0, '前埔医院', 118.193452, 24.490489, 'weekend Z', '18359100900', 0);
INSERT INTO `address` VALUES (55, '696972459', '福建省', '厦门市', '思明区', '会展路', '304号', '软件园二期东二门48号楼', 1, '前埔医院', 118.193672, 24.488516, '好吃吗', '18359100900', 0);
INSERT INTO `address` VALUES (56, '506478402', '福建省', '厦门市', '思明区', '会展路辅路', '', '软件园二期', 1, '前埔医院', 118.194889, 24.49358, 'weekend', '18359100900', 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of consumer
-- ----------------------------
INSERT INTO `consumer` VALUES (23, '696972459', '18359100900', '测试11', 'zhj123', '123456@163.com', 1, '暂未开发', 0, '696972459.png', 0);
INSERT INTO `consumer` VALUES (25, '422043548', '18359100912', '测试01', 'zhj123', '123456@163.com', 1, '暂未开发', 0, '422043548.png', 0);
INSERT INTO `consumer` VALUES (26, '197646697', '18359100800', '测试12', 'zhj123', '123456@163.com', 1, '暂未开发', 0, '197646697.jpg', 0);
INSERT INTO `consumer` VALUES (28, '218536860', '18359100999', '测试18', '123456', '123456@163.com', 1, '暂未开发', 0, '218536860.jpg', 0);
INSERT INTO `consumer` VALUES (31, '506478402', '18359107654', '测试19', 'zhj123', '123456@163.com', 1, '暂未开发', 0, '506478402.jpg', 0);

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
  `foodsTypeNo` int(11) NOT NULL COMMENT '商品类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `foods_foodsNo_uindex`(`foodsNo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of foods
-- ----------------------------
INSERT INTO `foods` VALUES (1, '111111111', 111111111, '小炒肉', 20.60, '1', '农家小炒肉', 09.2, 1);
INSERT INTO `foods` VALUES (2, '111111111', 111111112, '小鸡炖蘑菇', 34.00, '2', '蘑菇蘑菇', 08.4, 1);
INSERT INTO `foods` VALUES (3, '211111111', 211111111, '鱼香肉丝', 18.00, '3', '肉丝', 07.6, 1);
INSERT INTO `foods` VALUES (4, '211111111', 211111112, '辣椒炒辣椒', 17.00, '4', '辣', 08.8, 1);
INSERT INTO `foods` VALUES (5, '311111111', 311111111, '烧仙草', 15.00, '5', '烧仙草', 08.2, 2);
INSERT INTO `foods` VALUES (6, '311111111', 311111112, '布丁', 18.00, '6', '布丁', 09.9, 2);
INSERT INTO `foods` VALUES (7, '411111111', 411111111, '兰州拉面', 10.00, '7', '拉面', 07.2, 3);
INSERT INTO `foods` VALUES (8, '411111111', 411111112, '刀削面', 12.00, '8', '刀削面', 07.6, 3);
INSERT INTO `foods` VALUES (9, '511111111', 511111111, '肥宅快乐水', 3.00, '9', '快乐快乐', 10.0, 4);
INSERT INTO `foods` VALUES (10, '511111111', 511111112, '雪碧', 3.00, '10', '雪碧', 09.9, 4);

-- ----------------------------
-- Table structure for foods_type
-- ----------------------------
DROP TABLE IF EXISTS `foods_type`;
CREATE TABLE `foods_type`  (
  `id` int(3) NOT NULL AUTO_INCREMENT COMMENT '商品种类编号',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '食物种类',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of foods_type
-- ----------------------------
INSERT INTO `foods_type` VALUES (1, '实惠小炒');
INSERT INTO `foods_type` VALUES (2, '奶茶饮品');
INSERT INTO `foods_type` VALUES (3, '面食');
INSERT INTO `foods_type` VALUES (4, '饮料');

-- ----------------------------
-- Table structure for orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `orderHistoryNo` varchar(23) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单编号',
  `foodsNo` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单食品编号',
  `foodsNum` int(11) NOT NULL COMMENT '订单食品数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderdetail
-- ----------------------------
INSERT INTO `orderdetail` VALUES (13, '69697245920190304105555', '111111111', 2);
INSERT INTO `orderdetail` VALUES (14, '69697245920190304105555', '111111112', 3);
INSERT INTO `orderdetail` VALUES (15, '69697245920190304141655', '211111111', 2);
INSERT INTO `orderdetail` VALUES (16, '69697245920190304141655', '211111112', 3);
INSERT INTO `orderdetail` VALUES (17, '69697245920190304200922', '311111112', 3);
INSERT INTO `orderdetail` VALUES (18, '69697245920190304200922', '311111112', 3);

-- ----------------------------
-- Table structure for orderhistory
-- ----------------------------
DROP TABLE IF EXISTS `orderhistory`;
CREATE TABLE `orderhistory`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `consumerNo` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '买家编号',
  `restaurantNo` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '卖家编号',
  `orderDate` datetime(0) NOT NULL COMMENT '订单时间',
  `addressId` int(11) NOT NULL COMMENT '地址序号',
  `orderStatus` int(11) NOT NULL COMMENT '订单状态',
  `orderHistoryNo` varchar(23) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单编号',
  `price` double(10, 2) NOT NULL COMMENT '订单总金额',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderhistory
-- ----------------------------
INSERT INTO `orderhistory` VALUES (13, '696972459', '111111111', '2019-03-04 09:11:37', 55, 3, '69697245920190304105555', 143.20, '快一点，谢谢！');
INSERT INTO `orderhistory` VALUES (14, '696972459', '211111111', '2019-03-04 14:17:34', 55, 7, '69697245920190304141655', 87.00, '多加饭！');
INSERT INTO `orderhistory` VALUES (15, '696972459', '311111111', '2019-03-04 20:09:25', 55, 1, '69697245920190304200922', 84.00, '少放糖！快一点！');

-- ----------------------------
-- Table structure for orderstatus
-- ----------------------------
DROP TABLE IF EXISTS `orderstatus`;
CREATE TABLE `orderstatus`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderstatus
-- ----------------------------
INSERT INTO `orderstatus` VALUES (1, '未接单');
INSERT INTO `orderstatus` VALUES (2, '已接单');
INSERT INTO `orderstatus` VALUES (3, '配送中');
INSERT INTO `orderstatus` VALUES (4, '未签收');
INSERT INTO `orderstatus` VALUES (5, '已签收');
INSERT INTO `orderstatus` VALUES (6, '未评价');
INSERT INTO `orderstatus` VALUES (7, '已完成');
INSERT INTO `orderstatus` VALUES (8, '取消订单');

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

-- ----------------------------
-- Table structure for restaurantcollet
-- ----------------------------
DROP TABLE IF EXISTS `restaurantcollet`;
CREATE TABLE `restaurantcollet`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `consumerNo` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '买家唯一编号',
  `restaurantNo` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '卖家唯一编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of restaurantcollet
-- ----------------------------
INSERT INTO `restaurantcollet` VALUES (5, '696972459', '311111111');
INSERT INTO `restaurantcollet` VALUES (8, '696972459', '111111111');

SET FOREIGN_KEY_CHECKS = 1;
