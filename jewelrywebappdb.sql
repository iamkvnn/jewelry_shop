SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

CREATE DATABASE IF NOT EXISTS jewelrywebapp;
USE jewelrywebapp;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `is_default` bit(1) NOT NULL,
  `customer_id` bigint NULL DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `district` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `recipient_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `recipient_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `village` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK93c3js0e22ll1xlu21nvrhqgg`(`customer_id` ASC) USING BTREE,
  CONSTRAINT `FK93c3js0e22ll1xlu21nvrhqgg` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of address
-- ----------------------------

-- ----------------------------
-- Table structure for attribute
-- ----------------------------
DROP TABLE IF EXISTS `attribute`;
CREATE TABLE `attribute`  (
  `created_at` datetime(6) NULL DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `updated_at` datetime(6) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of attribute
-- ----------------------------
INSERT INTO `attribute` VALUES ('2025-05-02 20:43:23.000000', 1, NULL, 'Trọng lượng tham khảo');
INSERT INTO `attribute` VALUES ('2025-05-02 20:43:23.000000', 2, NULL, 'Loại đá chính');
INSERT INTO `attribute` VALUES ('2025-05-02 20:43:23.000000', 3, NULL, 'Loại đá phụ');
INSERT INTO `attribute` VALUES ('2025-05-02 20:43:23.000000', 4, NULL, 'Số viên đá chính');
INSERT INTO `attribute` VALUES ('2025-05-02 20:43:23.000000', 5, NULL, 'Giới tính');
INSERT INTO `attribute` VALUES ('2025-05-02 20:43:23.000000', 6, NULL, 'Thương hiệu');
INSERT INTO `attribute` VALUES ('2025-05-02 20:43:23.000000', 7, NULL, 'Kích thước đá chính (tham khảo)');
INSERT INTO `attribute` VALUES ('2025-05-02 20:43:23.000000', 8, NULL, 'Hàm lượng chất liệu');
INSERT INTO `attribute` VALUES ('2025-05-02 20:43:23.000000', 9, NULL, 'Số viên đá phụ');
INSERT INTO `attribute` VALUES ('2025-05-02 20:43:23.000000', 10, NULL, 'Màu đá chính');
INSERT INTO `attribute` VALUES ('2025-05-02 20:43:24.000000', 11, NULL, 'Color (Màu sắc/ Nước kim cương)');
INSERT INTO `attribute` VALUES ('2025-05-02 20:43:24.000000', 12, NULL, 'Clarity (Độ tinh khiết)');
INSERT INTO `attribute` VALUES ('2025-05-02 20:43:24.000000', 13, NULL, 'Màu đá phụ');
INSERT INTO `attribute` VALUES ('2025-05-02 20:43:24.000000', 14, NULL, 'Bộ sưu tập');
INSERT INTO `attribute` VALUES ('2025-05-02 20:43:24.000000', 15, NULL, 'Ổ hột');
INSERT INTO `attribute` VALUES ('2025-05-02 20:43:24.000000', 16, NULL, 'Hình dạng đá');
INSERT INTO `attribute` VALUES ('2025-05-02 20:43:26.000000', 17, NULL, 'Loại charm');
INSERT INTO `attribute` VALUES ('2025-05-02 20:43:30.000000', 18, NULL, 'Phong cách');
INSERT INTO `attribute` VALUES ('2025-05-02 20:43:30.000000', 19, NULL, 'Loại ngọc trai');
INSERT INTO `attribute` VALUES ('2025-05-02 20:43:31.000000', 20, NULL, 'Cut (Giác cắt/ Hình dạng kim cương)');
INSERT INTO `attribute` VALUES ('2025-05-02 20:43:32.000000', 21, NULL, 'Giấy kiểm định');

-- ----------------------------
-- Table structure for attribute_value
-- ----------------------------
DROP TABLE IF EXISTS `attribute_value`;
CREATE TABLE `attribute_value`  (
  `attribute_id` bigint NULL DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint NULL DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK59xqw12tl928rqcdu2h9o6mau`(`attribute_id` ASC) USING BTREE,
  INDEX `FKgrt71k3avcxqkvylxnskv2rd`(`product_id` ASC) USING BTREE,
  CONSTRAINT `FK59xqw12tl928rqcdu2h9o6mau` FOREIGN KEY (`attribute_id`) REFERENCES `attribute` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKgrt71k3avcxqkvylxnskv2rd` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5137 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of attribute_value
-- ----------------------------
INSERT INTO `attribute_value` VALUES (1, 402, 61, '8.40142 phân');
INSERT INTO `attribute_value` VALUES (8, 403, 61, '5850');
INSERT INTO `attribute_value` VALUES (2, 404, 61, 'Kim cương');
INSERT INTO `attribute_value` VALUES (3, 405, 61, 'Kim cương');
INSERT INTO `attribute_value` VALUES (5, 406, 61, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 407, 61, 'Disney|PNJ');
INSERT INTO `attribute_value` VALUES (1, 408, 62, '9.03845 phân');
INSERT INTO `attribute_value` VALUES (8, 409, 62, '5850');
INSERT INTO `attribute_value` VALUES (2, 410, 62, 'Kim cương');
INSERT INTO `attribute_value` VALUES (7, 411, 62, '2.5');
INSERT INTO `attribute_value` VALUES (10, 412, 62, 'Trắng');
INSERT INTO `attribute_value` VALUES (16, 413, 62, 'Tròn');
INSERT INTO `attribute_value` VALUES (3, 414, 62, 'Kim cương');
INSERT INTO `attribute_value` VALUES (13, 415, 62, 'Trắng');
INSERT INTO `attribute_value` VALUES (4, 416, 62, '2');
INSERT INTO `attribute_value` VALUES (5, 417, 62, 'Nữ');
INSERT INTO `attribute_value` VALUES (9, 418, 62, '66');
INSERT INTO `attribute_value` VALUES (6, 419, 62, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 420, 63, '6.94174 phân');
INSERT INTO `attribute_value` VALUES (8, 421, 63, '5850');
INSERT INTO `attribute_value` VALUES (2, 422, 63, 'Kim cương');
INSERT INTO `attribute_value` VALUES (7, 423, 63, '2');
INSERT INTO `attribute_value` VALUES (10, 424, 63, 'Trắng');
INSERT INTO `attribute_value` VALUES (3, 425, 63, 'Kim cương');
INSERT INTO `attribute_value` VALUES (13, 426, 63, 'Trắng');
INSERT INTO `attribute_value` VALUES (4, 427, 63, '2');
INSERT INTO `attribute_value` VALUES (5, 428, 63, 'Nữ');
INSERT INTO `attribute_value` VALUES (9, 429, 63, '32');
INSERT INTO `attribute_value` VALUES (6, 430, 63, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 431, 64, '5.93373 phân');
INSERT INTO `attribute_value` VALUES (8, 432, 64, '5850');
INSERT INTO `attribute_value` VALUES (2, 433, 64, 'Kim cương');
INSERT INTO `attribute_value` VALUES (3, 434, 64, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (4, 435, 64, '2');
INSERT INTO `attribute_value` VALUES (5, 436, 64, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 437, 64, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 438, 65, '3.23483 phân');
INSERT INTO `attribute_value` VALUES (8, 439, 65, '5850');
INSERT INTO `attribute_value` VALUES (2, 440, 65, 'Kim cương');
INSERT INTO `attribute_value` VALUES (3, 441, 65, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (4, 442, 65, '2');
INSERT INTO `attribute_value` VALUES (5, 443, 65, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 444, 65, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 445, 66, '2.60507 phân');
INSERT INTO `attribute_value` VALUES (8, 446, 66, '5850');
INSERT INTO `attribute_value` VALUES (2, 447, 66, 'Kim cương');
INSERT INTO `attribute_value` VALUES (7, 448, 66, '2.7');
INSERT INTO `attribute_value` VALUES (3, 449, 66, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (4, 450, 66, '2');
INSERT INTO `attribute_value` VALUES (5, 451, 66, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 452, 66, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 453, 67, '2.70135 phân');
INSERT INTO `attribute_value` VALUES (8, 454, 67, '5850');
INSERT INTO `attribute_value` VALUES (2, 455, 67, 'Kim cương');
INSERT INTO `attribute_value` VALUES (3, 456, 67, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (4, 457, 67, '2');
INSERT INTO `attribute_value` VALUES (5, 458, 67, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 459, 67, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 460, 68, '4.00027 phân');
INSERT INTO `attribute_value` VALUES (8, 461, 68, '5850');
INSERT INTO `attribute_value` VALUES (2, 462, 68, 'Kim cương');
INSERT INTO `attribute_value` VALUES (7, 463, 68, '2.7');
INSERT INTO `attribute_value` VALUES (3, 464, 68, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (4, 465, 68, '2');
INSERT INTO `attribute_value` VALUES (5, 466, 68, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 467, 68, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 468, 69, '6.28 phân');
INSERT INTO `attribute_value` VALUES (8, 469, 69, '7500');
INSERT INTO `attribute_value` VALUES (15, 470, 69, '4.0');
INSERT INTO `attribute_value` VALUES (2, 471, 69, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (3, 472, 69, 'Kim cương');
INSERT INTO `attribute_value` VALUES (5, 473, 69, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 474, 69, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 475, 70, '4.00924 phân');
INSERT INTO `attribute_value` VALUES (8, 476, 70, '5850');
INSERT INTO `attribute_value` VALUES (2, 477, 70, 'Kim cương');
INSERT INTO `attribute_value` VALUES (3, 478, 70, 'Kim cương');
INSERT INTO `attribute_value` VALUES (5, 479, 70, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 480, 70, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 481, 71, '2.68782 phân');
INSERT INTO `attribute_value` VALUES (8, 482, 71, '5850');
INSERT INTO `attribute_value` VALUES (2, 483, 71, 'Kim cương');
INSERT INTO `attribute_value` VALUES (7, 484, 71, '2.2');
INSERT INTO `attribute_value` VALUES (3, 485, 71, 'Kim cương');
INSERT INTO `attribute_value` VALUES (5, 486, 71, 'Nam');
INSERT INTO `attribute_value` VALUES (6, 487, 71, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 488, 72, '2.55371 phân');
INSERT INTO `attribute_value` VALUES (8, 489, 72, '5850');
INSERT INTO `attribute_value` VALUES (2, 490, 72, 'Kim cương');
INSERT INTO `attribute_value` VALUES (7, 491, 72, '1.5');
INSERT INTO `attribute_value` VALUES (3, 492, 72, 'Diamond');
INSERT INTO `attribute_value` VALUES (5, 493, 72, 'Nam');
INSERT INTO `attribute_value` VALUES (6, 494, 72, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 812, 122, '3.7069 phân');
INSERT INTO `attribute_value` VALUES (8, 813, 122, '9300');
INSERT INTO `attribute_value` VALUES (2, 814, 122, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (7, 815, 122, '3.0');
INSERT INTO `attribute_value` VALUES (3, 816, 122, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (4, 817, 122, '4');
INSERT INTO `attribute_value` VALUES (5, 818, 122, 'Nữ');
INSERT INTO `attribute_value` VALUES (9, 819, 122, '18');
INSERT INTO `attribute_value` VALUES (6, 820, 122, 'STYLE BY PNJ');
INSERT INTO `attribute_value` VALUES (1, 821, 123, '3.77228 phân');
INSERT INTO `attribute_value` VALUES (8, 822, 123, '9300');
INSERT INTO `attribute_value` VALUES (2, 823, 123, 'Synthetic');
INSERT INTO `attribute_value` VALUES (3, 824, 123, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (4, 825, 123, '2');
INSERT INTO `attribute_value` VALUES (5, 826, 123, 'Nữ');
INSERT INTO `attribute_value` VALUES (9, 827, 123, '38');
INSERT INTO `attribute_value` VALUES (6, 828, 123, 'STYLE BY PNJ');
INSERT INTO `attribute_value` VALUES (1, 829, 124, '6.019 phân');
INSERT INTO `attribute_value` VALUES (2, 830, 124, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (7, 831, 124, '1.5');
INSERT INTO `attribute_value` VALUES (3, 832, 124, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (4, 833, 124, '2');
INSERT INTO `attribute_value` VALUES (5, 834, 124, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 835, 124, 'PNJSilver');
INSERT INTO `attribute_value` VALUES (1, 836, 125, '6.72909 phân');
INSERT INTO `attribute_value` VALUES (2, 837, 125, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (7, 838, 125, '1.5');
INSERT INTO `attribute_value` VALUES (3, 839, 125, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (4, 840, 125, '2');
INSERT INTO `attribute_value` VALUES (5, 841, 125, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 842, 125, 'PNJSilver');
INSERT INTO `attribute_value` VALUES (1, 843, 126, '4.98308 phân');
INSERT INTO `attribute_value` VALUES (2, 844, 126, 'Sythentic');
INSERT INTO `attribute_value` VALUES (7, 845, 126, '3.0 x 5.0');
INSERT INTO `attribute_value` VALUES (3, 846, 126, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (4, 847, 126, '2');
INSERT INTO `attribute_value` VALUES (5, 848, 126, 'Nữ');
INSERT INTO `attribute_value` VALUES (9, 849, 126, '2');
INSERT INTO `attribute_value` VALUES (6, 850, 126, 'STYLE BY PNJ');
INSERT INTO `attribute_value` VALUES (1, 851, 127, '3.874 phân');
INSERT INTO `attribute_value` VALUES (2, 852, 127, 'Synthetic');
INSERT INTO `attribute_value` VALUES (3, 853, 127, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (4, 854, 127, '2');
INSERT INTO `attribute_value` VALUES (5, 855, 127, 'Nữ');
INSERT INTO `attribute_value` VALUES (9, 856, 127, '2');
INSERT INTO `attribute_value` VALUES (6, 857, 127, 'STYLE BY PNJ');
INSERT INTO `attribute_value` VALUES (1, 858, 128, '8.922 phân');
INSERT INTO `attribute_value` VALUES (2, 859, 128, 'Synthetic');
INSERT INTO `attribute_value` VALUES (7, 860, 128, '3 x 5');
INSERT INTO `attribute_value` VALUES (3, 861, 128, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (5, 862, 128, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 863, 128, 'STYLE BY PNJ');
INSERT INTO `attribute_value` VALUES (1, 864, 129, '4.976 phân');
INSERT INTO `attribute_value` VALUES (2, 865, 129, 'Synthetic');
INSERT INTO `attribute_value` VALUES (7, 866, 129, '3.0 x 5.0');
INSERT INTO `attribute_value` VALUES (3, 867, 129, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (4, 868, 129, '2');
INSERT INTO `attribute_value` VALUES (5, 869, 129, 'Nữ');
INSERT INTO `attribute_value` VALUES (9, 870, 129, '42');
INSERT INTO `attribute_value` VALUES (6, 871, 129, 'STYLE BY PNJ');
INSERT INTO `attribute_value` VALUES (1, 872, 130, '3.3215 phân');
INSERT INTO `attribute_value` VALUES (2, 873, 130, 'Synthetic');
INSERT INTO `attribute_value` VALUES (7, 874, 130, '4.0 x 6.0');
INSERT INTO `attribute_value` VALUES (3, 875, 130, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (4, 876, 130, '2');
INSERT INTO `attribute_value` VALUES (5, 877, 130, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 878, 130, 'STYLE BY PNJ');
INSERT INTO `attribute_value` VALUES (1, 879, 131, '7.2131 phân');
INSERT INTO `attribute_value` VALUES (2, 880, 131, 'Synthetic');
INSERT INTO `attribute_value` VALUES (7, 881, 131, '3.0 x 5.0');
INSERT INTO `attribute_value` VALUES (3, 882, 131, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (4, 883, 131, '2');
INSERT INTO `attribute_value` VALUES (5, 884, 131, 'Nữ');
INSERT INTO `attribute_value` VALUES (9, 885, 131, '44');
INSERT INTO `attribute_value` VALUES (6, 886, 131, 'STYLE BY PNJ');
INSERT INTO `attribute_value` VALUES (1, 887, 132, '4.372 phân');
INSERT INTO `attribute_value` VALUES (2, 888, 132, 'Synthetic');
INSERT INTO `attribute_value` VALUES (7, 889, 132, '3 x 5');
INSERT INTO `attribute_value` VALUES (10, 890, 132, 'Đỏ');
INSERT INTO `attribute_value` VALUES (3, 891, 132, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (4, 892, 132, '2');
INSERT INTO `attribute_value` VALUES (5, 893, 132, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 894, 132, 'STYLE BY PNJ');
INSERT INTO `attribute_value` VALUES (1, 895, 133, '9.384 phân');
INSERT INTO `attribute_value` VALUES (2, 896, 133, 'Synthetic');
INSERT INTO `attribute_value` VALUES (7, 897, 133, '3.0 x 5.0');
INSERT INTO `attribute_value` VALUES (3, 898, 133, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (4, 899, 133, '2');
INSERT INTO `attribute_value` VALUES (5, 900, 133, 'Nữ');
INSERT INTO `attribute_value` VALUES (9, 901, 133, '16');
INSERT INTO `attribute_value` VALUES (6, 902, 133, 'STYLE BY PNJ');
INSERT INTO `attribute_value` VALUES (1, 1135, 168, '4.18 phân');
INSERT INTO `attribute_value` VALUES (8, 1136, 168, '9250');
INSERT INTO `attribute_value` VALUES (2, 1137, 168, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (3, 1138, 168, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (5, 1139, 168, 'Nữ');
INSERT INTO `attribute_value` VALUES (17, 1140, 168, 'Charm xỏ');
INSERT INTO `attribute_value` VALUES (6, 1141, 168, 'STYLE BY PNJ');
INSERT INTO `attribute_value` VALUES (1, 1142, 169, '4.346 phân');
INSERT INTO `attribute_value` VALUES (8, 1143, 169, '9300');
INSERT INTO `attribute_value` VALUES (2, 1144, 169, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (7, 1145, 169, '1.0');
INSERT INTO `attribute_value` VALUES (3, 1146, 169, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (4, 1147, 169, '54');
INSERT INTO `attribute_value` VALUES (5, 1148, 169, 'Nữ');
INSERT INTO `attribute_value` VALUES (17, 1149, 169, 'Charm xỏ');
INSERT INTO `attribute_value` VALUES (6, 1150, 169, 'STYLE BY PNJ');
INSERT INTO `attribute_value` VALUES (1, 1151, 170, '4.247 phân');
INSERT INTO `attribute_value` VALUES (8, 1152, 170, '9300');
INSERT INTO `attribute_value` VALUES (2, 1153, 170, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (7, 1154, 170, '3.0');
INSERT INTO `attribute_value` VALUES (3, 1155, 170, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (4, 1156, 170, '2');
INSERT INTO `attribute_value` VALUES (5, 1157, 170, 'Nữ');
INSERT INTO `attribute_value` VALUES (9, 1158, 170, '6');
INSERT INTO `attribute_value` VALUES (17, 1159, 170, 'Charm xỏ');
INSERT INTO `attribute_value` VALUES (6, 1160, 170, 'STYLE BY PNJ');
INSERT INTO `attribute_value` VALUES (1, 1161, 171, '1.006 phân');
INSERT INTO `attribute_value` VALUES (8, 1162, 171, '9300');
INSERT INTO `attribute_value` VALUES (2, 1163, 171, 'Synthetic');
INSERT INTO `attribute_value` VALUES (7, 1164, 171, '3.0 x 5.0');
INSERT INTO `attribute_value` VALUES (3, 1165, 171, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (4, 1166, 171, '1');
INSERT INTO `attribute_value` VALUES (5, 1167, 171, 'Nữ');
INSERT INTO `attribute_value` VALUES (9, 1168, 171, '17');
INSERT INTO `attribute_value` VALUES (17, 1169, 171, 'Charm treo');
INSERT INTO `attribute_value` VALUES (6, 1170, 171, 'STYLE BY PNJ');
INSERT INTO `attribute_value` VALUES (1, 1171, 172, '5.51033 phân');
INSERT INTO `attribute_value` VALUES (2, 1172, 172, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (3, 1173, 172, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (5, 1174, 172, 'Unisex');
INSERT INTO `attribute_value` VALUES (17, 1175, 172, 'Charm treo');
INSERT INTO `attribute_value` VALUES (6, 1176, 172, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 1177, 173, '5.47187 phân');
INSERT INTO `attribute_value` VALUES (2, 1178, 173, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (3, 1179, 173, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (5, 1180, 173, 'Unisex');
INSERT INTO `attribute_value` VALUES (17, 1181, 173, 'Charm treo');
INSERT INTO `attribute_value` VALUES (6, 1182, 173, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 1183, 174, '5.50827 phân');
INSERT INTO `attribute_value` VALUES (2, 1184, 174, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (3, 1185, 174, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (5, 1186, 174, 'Unisex');
INSERT INTO `attribute_value` VALUES (17, 1187, 174, 'Charm treo');
INSERT INTO `attribute_value` VALUES (6, 1188, 174, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 1189, 175, '5.48985 phân');
INSERT INTO `attribute_value` VALUES (2, 1190, 175, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (3, 1191, 175, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (5, 1192, 175, 'Unisex');
INSERT INTO `attribute_value` VALUES (17, 1193, 175, 'Charm treo');
INSERT INTO `attribute_value` VALUES (6, 1194, 175, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 1195, 176, '5.47895 phân');
INSERT INTO `attribute_value` VALUES (2, 1196, 176, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (3, 1197, 176, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (5, 1198, 176, 'Unisex');
INSERT INTO `attribute_value` VALUES (17, 1199, 176, 'Charm treo');
INSERT INTO `attribute_value` VALUES (6, 1200, 176, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 1201, 177, '5.43546 phân');
INSERT INTO `attribute_value` VALUES (2, 1202, 177, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (3, 1203, 177, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (5, 1204, 177, 'Unisex');
INSERT INTO `attribute_value` VALUES (17, 1205, 177, 'Charm treo');
INSERT INTO `attribute_value` VALUES (6, 1206, 177, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 1229, 181, '13.82764 phân');
INSERT INTO `attribute_value` VALUES (8, 1230, 181, '9900');
INSERT INTO `attribute_value` VALUES (2, 1231, 181, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (3, 1232, 181, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (5, 1233, 181, 'Nữ');
INSERT INTO `attribute_value` VALUES (17, 1234, 181, 'Charm xỏ');
INSERT INTO `attribute_value` VALUES (6, 1235, 181, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 1404, 216, '4.89147 phân');
INSERT INTO `attribute_value` VALUES (8, 1405, 216, '7500');
INSERT INTO `attribute_value` VALUES (2, 1406, 216, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (3, 1407, 216, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (5, 1408, 216, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 1409, 216, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 1410, 217, '12.41662 phân');
INSERT INTO `attribute_value` VALUES (8, 1411, 217, '7500');
INSERT INTO `attribute_value` VALUES (2, 1412, 217, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (3, 1413, 217, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (5, 1414, 217, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 1415, 217, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 1416, 218, '15.3479 phân');
INSERT INTO `attribute_value` VALUES (8, 1417, 218, '7500');
INSERT INTO `attribute_value` VALUES (2, 1418, 218, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (3, 1419, 218, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (5, 1420, 218, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 1421, 218, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 1422, 219, '8.20509 phân');
INSERT INTO `attribute_value` VALUES (8, 1423, 219, '7500');
INSERT INTO `attribute_value` VALUES (2, 1424, 219, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (3, 1425, 219, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (5, 1426, 219, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 1427, 219, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 1428, 220, '6.24693 phân');
INSERT INTO `attribute_value` VALUES (8, 1429, 220, '7500');
INSERT INTO `attribute_value` VALUES (2, 1430, 220, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (3, 1431, 220, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (5, 1432, 220, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 1433, 220, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 1434, 221, '5.8946 phân');
INSERT INTO `attribute_value` VALUES (8, 1435, 221, '7500');
INSERT INTO `attribute_value` VALUES (2, 1436, 221, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (3, 1437, 221, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (5, 1438, 221, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 1439, 221, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 1440, 222, '15.44272 phân');
INSERT INTO `attribute_value` VALUES (8, 1441, 222, '7500');
INSERT INTO `attribute_value` VALUES (2, 1442, 222, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (3, 1443, 222, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (5, 1444, 222, 'Unisex');
INSERT INTO `attribute_value` VALUES (6, 1445, 222, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 1446, 223, '15.79641 phân');
INSERT INTO `attribute_value` VALUES (8, 1447, 223, '7500');
INSERT INTO `attribute_value` VALUES (2, 1448, 223, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (3, 1449, 223, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (5, 1450, 223, 'Unisex');
INSERT INTO `attribute_value` VALUES (6, 1451, 223, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 1452, 224, '6.32884 phân');
INSERT INTO `attribute_value` VALUES (8, 1453, 224, '7500');
INSERT INTO `attribute_value` VALUES (2, 1454, 224, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (3, 1455, 224, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (5, 1456, 224, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 1457, 224, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 1486, 248, '6.007 phân');
INSERT INTO `attribute_value` VALUES (8, 1487, 248, '9250');
INSERT INTO `attribute_value` VALUES (2, 1488, 248, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (3, 1489, 248, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (5, 1490, 248, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 1491, 248, 'PNJSilver');
INSERT INTO `attribute_value` VALUES (1, 1492, 249, '5.954 phân');
INSERT INTO `attribute_value` VALUES (2, 1493, 249, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (3, 1494, 249, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (5, 1495, 249, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 1496, 249, 'PNJSilver');
INSERT INTO `attribute_value` VALUES (1, 1497, 250, '6.865 phân');
INSERT INTO `attribute_value` VALUES (2, 1498, 250, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (3, 1499, 250, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (5, 1500, 250, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 1501, 250, 'PNJSilver');
INSERT INTO `attribute_value` VALUES (1, 1573, 261, '96.632 phân');
INSERT INTO `attribute_value` VALUES (8, 1574, 261, '7500');
INSERT INTO `attribute_value` VALUES (2, 1575, 261, 'Kim cương');
INSERT INTO `attribute_value` VALUES (7, 1576, 261, '2.0 x 3.0');
INSERT INTO `attribute_value` VALUES (3, 1577, 261, 'Diamond');
INSERT INTO `attribute_value` VALUES (4, 1578, 261, '60');
INSERT INTO `attribute_value` VALUES (5, 1579, 261, 'Nữ');
INSERT INTO `attribute_value` VALUES (9, 1580, 261, '240');
INSERT INTO `attribute_value` VALUES (6, 1581, 261, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 1582, 262, '6.81382 phân');
INSERT INTO `attribute_value` VALUES (2, 1583, 262, 'Synthetic');
INSERT INTO `attribute_value` VALUES (7, 1584, 262, '4 x 6');
INSERT INTO `attribute_value` VALUES (3, 1585, 262, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (4, 1586, 262, '1');
INSERT INTO `attribute_value` VALUES (5, 1587, 262, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 1588, 262, 'STYLE BY PNJ');
INSERT INTO `attribute_value` VALUES (1, 1609, 266, '9.94932 phân');
INSERT INTO `attribute_value` VALUES (8, 1610, 266, '5850');
INSERT INTO `attribute_value` VALUES (2, 1611, 266, 'Kim cương');
INSERT INTO `attribute_value` VALUES (7, 1612, 266, '4.0');
INSERT INTO `attribute_value` VALUES (3, 1613, 266, 'Kim cương');
INSERT INTO `attribute_value` VALUES (5, 1614, 266, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 1615, 266, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 1616, 267, '9.38881 phân');
INSERT INTO `attribute_value` VALUES (2, 1617, 267, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (7, 1618, 267, '2.4');
INSERT INTO `attribute_value` VALUES (3, 1619, 267, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (4, 1620, 267, '4');
INSERT INTO `attribute_value` VALUES (5, 1621, 267, 'Nữ');
INSERT INTO `attribute_value` VALUES (9, 1622, 267, '32');
INSERT INTO `attribute_value` VALUES (6, 1623, 267, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 1796, 296, '30 phân');
INSERT INTO `attribute_value` VALUES (2, 1797, 296, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (3, 1798, 296, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (5, 1799, 296, 'Nữ');
INSERT INTO `attribute_value` VALUES (14, 1800, 296, 'Hạnh phúc vàng');
INSERT INTO `attribute_value` VALUES (6, 1801, 296, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 1802, 297, '30 phân');
INSERT INTO `attribute_value` VALUES (2, 1803, 297, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (3, 1804, 297, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (5, 1805, 297, 'Nữ');
INSERT INTO `attribute_value` VALUES (14, 1806, 297, 'Hạnh phúc vàng');
INSERT INTO `attribute_value` VALUES (6, 1807, 297, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 1808, 298, '30 phân');
INSERT INTO `attribute_value` VALUES (8, 1809, 298, '9900');
INSERT INTO `attribute_value` VALUES (2, 1810, 298, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (3, 1811, 298, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (5, 1812, 298, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 1813, 298, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 1814, 299, '32.1973 phân');
INSERT INTO `attribute_value` VALUES (8, 1815, 299, '9250');
INSERT INTO `attribute_value` VALUES (2, 1816, 299, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (3, 1817, 299, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (13, 1818, 299, 'Trắng');
INSERT INTO `attribute_value` VALUES (5, 1819, 299, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 1820, 299, 'PNJSilver');
INSERT INTO `attribute_value` VALUES (1, 1909, 313, '38.689 phân');
INSERT INTO `attribute_value` VALUES (2, 1910, 313, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (3, 1911, 313, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (6, 1912, 313, 'STYLE BY PNJ');
INSERT INTO `attribute_value` VALUES (1, 1913, 314, '33.87428 phân');
INSERT INTO `attribute_value` VALUES (8, 1914, 314, '9250');
INSERT INTO `attribute_value` VALUES (2, 1915, 314, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (3, 1916, 314, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (5, 1917, 314, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 1918, 314, 'PNJSilver');
INSERT INTO `attribute_value` VALUES (1, 1919, 315, '33.67885 phân');
INSERT INTO `attribute_value` VALUES (8, 1920, 315, '9250');
INSERT INTO `attribute_value` VALUES (2, 1921, 315, 'Sythentic');
INSERT INTO `attribute_value` VALUES (3, 1922, 315, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (5, 1923, 315, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 1924, 315, 'PNJSilver');
INSERT INTO `attribute_value` VALUES (1, 1925, 316, '9.62462 phân');
INSERT INTO `attribute_value` VALUES (8, 1926, 316, '9900');
INSERT INTO `attribute_value` VALUES (2, 1927, 316, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (3, 1928, 316, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (5, 1929, 316, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 1930, 316, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 1931, 317, '10.09307 phân');
INSERT INTO `attribute_value` VALUES (8, 1932, 317, '9900');
INSERT INTO `attribute_value` VALUES (2, 1933, 317, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (3, 1934, 317, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (5, 1935, 317, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 1936, 317, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 1943, 319, '4.719 phân');
INSERT INTO `attribute_value` VALUES (2, 1944, 319, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (3, 1945, 319, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (5, 1946, 319, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 1947, 319, 'PNJSilver');
INSERT INTO `attribute_value` VALUES (1, 1948, 320, '3.821 phân');
INSERT INTO `attribute_value` VALUES (2, 1949, 320, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (3, 1950, 320, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (5, 1951, 320, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 1952, 320, 'PNJSilver');
INSERT INTO `attribute_value` VALUES (1, 2004, 329, '6.20387 phân');
INSERT INTO `attribute_value` VALUES (8, 2005, 329, '4160');
INSERT INTO `attribute_value` VALUES (2, 2006, 329, 'Synthetic');
INSERT INTO `attribute_value` VALUES (7, 2007, 329, '3.0 x 5.0');
INSERT INTO `attribute_value` VALUES (3, 2008, 329, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (4, 2009, 329, '1');
INSERT INTO `attribute_value` VALUES (5, 2010, 329, 'Nữ');
INSERT INTO `attribute_value` VALUES (9, 2011, 329, '2');
INSERT INTO `attribute_value` VALUES (6, 2012, 329, 'STYLE BY PNJ');
INSERT INTO `attribute_value` VALUES (1, 2030, 332, '10.30685 phân');
INSERT INTO `attribute_value` VALUES (8, 2031, 332, '5850');
INSERT INTO `attribute_value` VALUES (2, 2032, 332, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (3, 2033, 332, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (5, 2034, 332, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 2035, 332, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 2044, 334, '5.09226 phân');
INSERT INTO `attribute_value` VALUES (2, 2045, 334, 'Synthetic');
INSERT INTO `attribute_value` VALUES (7, 2046, 334, '4 x 6');
INSERT INTO `attribute_value` VALUES (3, 2047, 334, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (4, 2048, 334, '1');
INSERT INTO `attribute_value` VALUES (5, 2049, 334, 'Nữ');
INSERT INTO `attribute_value` VALUES (9, 2050, 334, '4');
INSERT INTO `attribute_value` VALUES (6, 2051, 334, 'STYLE BY PNJ');
INSERT INTO `attribute_value` VALUES (1, 2074, 338, '14.83059 phân');
INSERT INTO `attribute_value` VALUES (8, 2075, 338, '7500');
INSERT INTO `attribute_value` VALUES (2, 2076, 338, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (3, 2077, 338, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (5, 2078, 338, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 2079, 338, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 2097, 341, '17.56687 phân');
INSERT INTO `attribute_value` VALUES (8, 2098, 341, '7500');
INSERT INTO `attribute_value` VALUES (2, 2099, 341, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (3, 2100, 341, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (5, 2101, 341, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 2102, 341, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 2772, 437, '3.1885 phân');
INSERT INTO `attribute_value` VALUES (2, 2773, 437, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (3, 2774, 437, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (5, 2775, 437, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 2776, 437, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 3109, 485, '1.34868 phân');
INSERT INTO `attribute_value` VALUES (8, 3110, 485, '9300');
INSERT INTO `attribute_value` VALUES (2, 3111, 485, 'CZ');
INSERT INTO `attribute_value` VALUES (10, 3112, 485, 'Trắng');
INSERT INTO `attribute_value` VALUES (20, 3113, 485, 'Facet');
INSERT INTO `attribute_value` VALUES (16, 3114, 485, 'Tròn');
INSERT INTO `attribute_value` VALUES (3, 3115, 485, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (4, 3116, 485, '19');
INSERT INTO `attribute_value` VALUES (18, 3117, 485, 'Cảm xúc');
INSERT INTO `attribute_value` VALUES (6, 3118, 485, 'PNJSilver');
INSERT INTO `attribute_value` VALUES (1, 3119, 486, '1.44478 phân');
INSERT INTO `attribute_value` VALUES (2, 3120, 486, 'CZ');
INSERT INTO `attribute_value` VALUES (10, 3121, 486, 'Trắng');
INSERT INTO `attribute_value` VALUES (20, 3122, 486, 'Facet');
INSERT INTO `attribute_value` VALUES (16, 3123, 486, 'Tròn');
INSERT INTO `attribute_value` VALUES (3, 3124, 486, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (4, 3125, 486, '1');
INSERT INTO `attribute_value` VALUES (5, 3126, 486, 'Nữ');
INSERT INTO `attribute_value` VALUES (9, 3127, 486, '6');
INSERT INTO `attribute_value` VALUES (6, 3128, 486, 'PNJSilver');
INSERT INTO `attribute_value` VALUES (1, 3397, 521, '5.22761 phân');
INSERT INTO `attribute_value` VALUES (8, 3398, 521, '9250');
INSERT INTO `attribute_value` VALUES (2, 3399, 521, 'Synthetic');
INSERT INTO `attribute_value` VALUES (3, 3400, 521, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (5, 3401, 521, 'Nữ');
INSERT INTO `attribute_value` VALUES (14, 3402, 521, 'Inside out 2');
INSERT INTO `attribute_value` VALUES (6, 3403, 521, 'Disney|PNJ');
INSERT INTO `attribute_value` VALUES (1, 3404, 522, '2.839 phân');
INSERT INTO `attribute_value` VALUES (8, 3405, 522, '9300');
INSERT INTO `attribute_value` VALUES (2, 3406, 522, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (3, 3407, 522, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (4, 3408, 522, '4');
INSERT INTO `attribute_value` VALUES (5, 3409, 522, 'Nữ');
INSERT INTO `attribute_value` VALUES (9, 3410, 522, '16');
INSERT INTO `attribute_value` VALUES (6, 3411, 522, 'Disney|PNJ');
INSERT INTO `attribute_value` VALUES (1, 3486, 546, '3.20202 phân');
INSERT INTO `attribute_value` VALUES (8, 3487, 546, '5850');
INSERT INTO `attribute_value` VALUES (2, 3488, 546, 'Kim cương');
INSERT INTO `attribute_value` VALUES (3, 3489, 546, 'Kim cương');
INSERT INTO `attribute_value` VALUES (5, 3490, 546, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 3491, 546, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 3492, 547, '3.4285 phân');
INSERT INTO `attribute_value` VALUES (8, 3493, 547, '5850');
INSERT INTO `attribute_value` VALUES (2, 3494, 547, 'Kim cương');
INSERT INTO `attribute_value` VALUES (11, 3495, 547, 'G');
INSERT INTO `attribute_value` VALUES (12, 3496, 547, 'SI1');
INSERT INTO `attribute_value` VALUES (3, 3497, 547, 'Kim cương');
INSERT INTO `attribute_value` VALUES (4, 3498, 547, '1');
INSERT INTO `attribute_value` VALUES (5, 3499, 547, 'Nữ');
INSERT INTO `attribute_value` VALUES (9, 3500, 547, '26');
INSERT INTO `attribute_value` VALUES (6, 3501, 547, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 3502, 548, '1.82557 phân');
INSERT INTO `attribute_value` VALUES (8, 3503, 548, '5850');
INSERT INTO `attribute_value` VALUES (2, 3504, 548, 'Kim cương');
INSERT INTO `attribute_value` VALUES (3, 3505, 548, 'Kim cương');
INSERT INTO `attribute_value` VALUES (4, 3506, 548, '1');
INSERT INTO `attribute_value` VALUES (5, 3507, 548, 'Nữ');
INSERT INTO `attribute_value` VALUES (9, 3508, 548, '10');
INSERT INTO `attribute_value` VALUES (6, 3509, 548, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 3510, 549, '5.47075 phân');
INSERT INTO `attribute_value` VALUES (2, 3511, 549, 'Kim cương');
INSERT INTO `attribute_value` VALUES (7, 3512, 549, '3.6');
INSERT INTO `attribute_value` VALUES (11, 3513, 549, 'E');
INSERT INTO `attribute_value` VALUES (12, 3514, 549, 'SI1');
INSERT INTO `attribute_value` VALUES (3, 3515, 549, 'Kim cương');
INSERT INTO `attribute_value` VALUES (5, 3516, 549, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 3517, 549, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 3518, 550, '5.70659 phân');
INSERT INTO `attribute_value` VALUES (2, 3519, 550, 'Kim cương');
INSERT INTO `attribute_value` VALUES (3, 3520, 550, 'Kim cương');
INSERT INTO `attribute_value` VALUES (6, 3521, 550, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 3522, 551, '1.48752 phân');
INSERT INTO `attribute_value` VALUES (8, 3523, 551, '5850');
INSERT INTO `attribute_value` VALUES (2, 3524, 551, 'Kim cương');
INSERT INTO `attribute_value` VALUES (3, 3525, 551, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (5, 3526, 551, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 3527, 551, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 3528, 552, '1.48736 phân');
INSERT INTO `attribute_value` VALUES (2, 3529, 552, 'Kim cương');
INSERT INTO `attribute_value` VALUES (3, 3530, 552, 'Kim cương');
INSERT INTO `attribute_value` VALUES (5, 3531, 552, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 3532, 552, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 3533, 553, '2.2484 phân');
INSERT INTO `attribute_value` VALUES (8, 3534, 553, '5850');
INSERT INTO `attribute_value` VALUES (2, 3535, 553, 'Kim cương');
INSERT INTO `attribute_value` VALUES (3, 3536, 553, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (5, 3537, 553, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 3538, 553, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 3539, 554, '25.74029 phân');
INSERT INTO `attribute_value` VALUES (7, 3540, 554, '1.5');
INSERT INTO `attribute_value` VALUES (3, 3541, 554, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (4, 3542, 554, '64');
INSERT INTO `attribute_value` VALUES (5, 3543, 554, 'Nam');
INSERT INTO `attribute_value` VALUES (6, 3544, 554, 'MANCODE by PNJ');
INSERT INTO `attribute_value` VALUES (1, 3545, 555, '4.9905 phân');
INSERT INTO `attribute_value` VALUES (2, 3546, 555, 'Kim cương');
INSERT INTO `attribute_value` VALUES (7, 3547, 555, '2.3');
INSERT INTO `attribute_value` VALUES (10, 3548, 555, 'Trắng');
INSERT INTO `attribute_value` VALUES (16, 3549, 555, 'Tròn');
INSERT INTO `attribute_value` VALUES (3, 3550, 555, 'Kim cương');
INSERT INTO `attribute_value` VALUES (13, 3551, 555, 'Trắng');
INSERT INTO `attribute_value` VALUES (4, 3552, 555, '1');
INSERT INTO `attribute_value` VALUES (9, 3553, 555, '42');
INSERT INTO `attribute_value` VALUES (6, 3554, 555, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 3555, 556, '4.48822 phân');
INSERT INTO `attribute_value` VALUES (2, 3556, 556, 'Kim cương');
INSERT INTO `attribute_value` VALUES (7, 3557, 556, '2.3');
INSERT INTO `attribute_value` VALUES (10, 3558, 556, 'Trắng');
INSERT INTO `attribute_value` VALUES (16, 3559, 556, 'Tròn');
INSERT INTO `attribute_value` VALUES (3, 3560, 556, 'Kim cương');
INSERT INTO `attribute_value` VALUES (13, 3561, 556, 'Trắng');
INSERT INTO `attribute_value` VALUES (4, 3562, 556, '1');
INSERT INTO `attribute_value` VALUES (9, 3563, 556, '28');
INSERT INTO `attribute_value` VALUES (6, 3564, 556, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 3565, 557, '2.90722 phân');
INSERT INTO `attribute_value` VALUES (2, 3566, 557, 'Kim cương');
INSERT INTO `attribute_value` VALUES (7, 3567, 557, '3.6');
INSERT INTO `attribute_value` VALUES (10, 3568, 557, 'Trắng');
INSERT INTO `attribute_value` VALUES (16, 3569, 557, 'Tròn');
INSERT INTO `attribute_value` VALUES (3, 3570, 557, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (4, 3571, 557, '1');
INSERT INTO `attribute_value` VALUES (6, 3572, 557, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 3573, 558, '1.05143 phân');
INSERT INTO `attribute_value` VALUES (2, 3574, 558, 'Kim cương');
INSERT INTO `attribute_value` VALUES (3, 3575, 558, 'Kim cương');
INSERT INTO `attribute_value` VALUES (6, 3576, 558, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 3577, 559, '3.15748 phân');
INSERT INTO `attribute_value` VALUES (2, 3578, 559, 'Kim cương');
INSERT INTO `attribute_value` VALUES (3, 3579, 559, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (6, 3580, 559, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 3581, 560, '2.19824 phân');
INSERT INTO `attribute_value` VALUES (2, 3582, 560, 'Kim cương');
INSERT INTO `attribute_value` VALUES (3, 3583, 560, 'Kim cương');
INSERT INTO `attribute_value` VALUES (6, 3584, 560, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 3585, 561, '1.61607 phân');
INSERT INTO `attribute_value` VALUES (2, 3586, 561, 'Kim cương');
INSERT INTO `attribute_value` VALUES (3, 3587, 561, 'Kim cương');
INSERT INTO `attribute_value` VALUES (6, 3588, 561, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 3589, 562, '2.41731 phân');
INSERT INTO `attribute_value` VALUES (8, 3590, 562, '5850');
INSERT INTO `attribute_value` VALUES (2, 3591, 562, 'Kim cương');
INSERT INTO `attribute_value` VALUES (3, 3592, 562, 'Kim cương');
INSERT INTO `attribute_value` VALUES (5, 3593, 562, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 3594, 562, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 3595, 563, '1.75322 phân');
INSERT INTO `attribute_value` VALUES (2, 3596, 563, 'Kim cương');
INSERT INTO `attribute_value` VALUES (3, 3597, 563, 'Kim cương');
INSERT INTO `attribute_value` VALUES (6, 3598, 563, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 3599, 564, '16.83093 phân');
INSERT INTO `attribute_value` VALUES (2, 3600, 564, 'Kim cương');
INSERT INTO `attribute_value` VALUES (7, 3601, 564, '2.0');
INSERT INTO `attribute_value` VALUES (4, 3602, 564, '24');
INSERT INTO `attribute_value` VALUES (5, 3603, 564, 'Nam');
INSERT INTO `attribute_value` VALUES (6, 3604, 564, 'MANCODE by PNJ');
INSERT INTO `attribute_value` VALUES (1, 3605, 565, '1.03997 phân');
INSERT INTO `attribute_value` VALUES (8, 3606, 565, '5850');
INSERT INTO `attribute_value` VALUES (7, 3607, 565, '1.0');
INSERT INTO `attribute_value` VALUES (3, 3608, 565, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (4, 3609, 565, '12');
INSERT INTO `attribute_value` VALUES (5, 3610, 565, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 3611, 565, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 3612, 566, '14.66083 phân');
INSERT INTO `attribute_value` VALUES (2, 3613, 566, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (7, 3614, 566, '3.5');
INSERT INTO `attribute_value` VALUES (3, 3615, 566, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (4, 3616, 566, '2');
INSERT INTO `attribute_value` VALUES (5, 3617, 566, 'Nữ');
INSERT INTO `attribute_value` VALUES (9, 3618, 566, '28');
INSERT INTO `attribute_value` VALUES (6, 3619, 566, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 3930, 610, '7.30736 phân');
INSERT INTO `attribute_value` VALUES (2, 3931, 610, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (3, 3932, 610, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (5, 3933, 610, 'Nam');
INSERT INTO `attribute_value` VALUES (6, 3934, 610, 'PNJSilver');
INSERT INTO `attribute_value` VALUES (1, 4157, 646, '7.278 phân');
INSERT INTO `attribute_value` VALUES (2, 4158, 646, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (3, 4159, 646, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (5, 4160, 646, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 4161, 646, 'STYLE BY PNJ');
INSERT INTO `attribute_value` VALUES (1, 4162, 647, '6.717 phân');
INSERT INTO `attribute_value` VALUES (2, 4163, 647, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (3, 4164, 647, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (5, 4165, 647, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 4166, 647, 'STYLE BY PNJ');
INSERT INTO `attribute_value` VALUES (1, 4167, 648, '2.86 phân');
INSERT INTO `attribute_value` VALUES (2, 4168, 648, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (3, 4169, 648, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (5, 4170, 648, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 4171, 648, 'STYLE BY PNJ');
INSERT INTO `attribute_value` VALUES (1, 4172, 649, '3.417 phân');
INSERT INTO `attribute_value` VALUES (2, 4173, 649, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (3, 4174, 649, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (5, 4175, 649, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 4176, 649, 'STYLE BY PNJ');
INSERT INTO `attribute_value` VALUES (1, 4177, 650, '3.391 phân');
INSERT INTO `attribute_value` VALUES (2, 4178, 650, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (3, 4179, 650, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (5, 4180, 650, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 4181, 650, 'STYLE BY PNJ');
INSERT INTO `attribute_value` VALUES (1, 4182, 651, '3.671 phân');
INSERT INTO `attribute_value` VALUES (8, 4183, 651, '9250');
INSERT INTO `attribute_value` VALUES (2, 4184, 651, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (3, 4185, 651, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (5, 4186, 651, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 4187, 651, 'STYLE BY PNJ');
INSERT INTO `attribute_value` VALUES (1, 4188, 652, '3.974 phân');
INSERT INTO `attribute_value` VALUES (8, 4189, 652, '9300');
INSERT INTO `attribute_value` VALUES (2, 4190, 652, 'Synthetic');
INSERT INTO `attribute_value` VALUES (7, 4191, 652, '3.0 x 5.0');
INSERT INTO `attribute_value` VALUES (3, 4192, 652, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (4, 4193, 652, '1');
INSERT INTO `attribute_value` VALUES (5, 4194, 652, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 4195, 652, 'STYLE BY PNJ');
INSERT INTO `attribute_value` VALUES (1, 4196, 653, '3.346 phân');
INSERT INTO `attribute_value` VALUES (8, 4197, 653, '9300');
INSERT INTO `attribute_value` VALUES (2, 4198, 653, 'Synthetic');
INSERT INTO `attribute_value` VALUES (7, 4199, 653, '3.0 x 5.0');
INSERT INTO `attribute_value` VALUES (3, 4200, 653, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (4, 4201, 653, '1');
INSERT INTO `attribute_value` VALUES (5, 4202, 653, 'Nữ');
INSERT INTO `attribute_value` VALUES (9, 4203, 653, '10');
INSERT INTO `attribute_value` VALUES (6, 4204, 653, 'STYLE BY PNJ');
INSERT INTO `attribute_value` VALUES (1, 4205, 654, '5.337 phân');
INSERT INTO `attribute_value` VALUES (8, 4206, 654, '9300');
INSERT INTO `attribute_value` VALUES (2, 4207, 654, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (7, 4208, 654, '3.0');
INSERT INTO `attribute_value` VALUES (3, 4209, 654, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (4, 4210, 654, '2');
INSERT INTO `attribute_value` VALUES (5, 4211, 654, 'Nữ');
INSERT INTO `attribute_value` VALUES (9, 4212, 654, '1');
INSERT INTO `attribute_value` VALUES (6, 4213, 654, 'STYLE BY PNJ');
INSERT INTO `attribute_value` VALUES (1, 4214, 655, '3.60653 phân');
INSERT INTO `attribute_value` VALUES (8, 4215, 655, '9300');
INSERT INTO `attribute_value` VALUES (2, 4216, 655, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (7, 4217, 655, '1.0');
INSERT INTO `attribute_value` VALUES (3, 4218, 655, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (4, 4219, 655, '6');
INSERT INTO `attribute_value` VALUES (5, 4220, 655, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 4221, 655, 'STYLE BY PNJ');
INSERT INTO `attribute_value` VALUES (1, 4222, 656, '3.56903 phân');
INSERT INTO `attribute_value` VALUES (2, 4223, 656, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (7, 4224, 656, '5.0');
INSERT INTO `attribute_value` VALUES (3, 4225, 656, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (4, 4226, 656, '1');
INSERT INTO `attribute_value` VALUES (5, 4227, 656, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 4228, 656, 'STYLE BY PNJ');
INSERT INTO `attribute_value` VALUES (1, 4229, 657, '4.368 phân');
INSERT INTO `attribute_value` VALUES (2, 4230, 657, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (7, 4231, 657, '3.0');
INSERT INTO `attribute_value` VALUES (3, 4232, 657, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (4, 4233, 657, '1');
INSERT INTO `attribute_value` VALUES (5, 4234, 657, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 4235, 657, 'STYLE BY PNJ');
INSERT INTO `attribute_value` VALUES (1, 4386, 681, '10.444 phân');
INSERT INTO `attribute_value` VALUES (2, 4387, 681, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (7, 4388, 681, '6.0');
INSERT INTO `attribute_value` VALUES (3, 4389, 681, 'Kim cương');
INSERT INTO `attribute_value` VALUES (4, 4390, 681, '1');
INSERT INTO `attribute_value` VALUES (5, 4391, 681, 'Nữ');
INSERT INTO `attribute_value` VALUES (9, 4392, 681, '46');
INSERT INTO `attribute_value` VALUES (6, 4393, 681, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 4394, 682, '9.19118 phân');
INSERT INTO `attribute_value` VALUES (2, 4395, 682, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (7, 4396, 682, '6.0');
INSERT INTO `attribute_value` VALUES (3, 4397, 682, 'Kim cương');
INSERT INTO `attribute_value` VALUES (4, 4398, 682, '1');
INSERT INTO `attribute_value` VALUES (5, 4399, 682, 'Nữ');
INSERT INTO `attribute_value` VALUES (9, 4400, 682, '18');
INSERT INTO `attribute_value` VALUES (6, 4401, 682, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 4402, 683, '11.32853 phân');
INSERT INTO `attribute_value` VALUES (2, 4403, 683, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (7, 4404, 683, '5.4');
INSERT INTO `attribute_value` VALUES (3, 4405, 683, 'Kim cương');
INSERT INTO `attribute_value` VALUES (4, 4406, 683, '1');
INSERT INTO `attribute_value` VALUES (5, 4407, 683, 'Nữ');
INSERT INTO `attribute_value` VALUES (9, 4408, 683, '60');
INSERT INTO `attribute_value` VALUES (6, 4409, 683, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 4410, 684, '10.2356 phân');
INSERT INTO `attribute_value` VALUES (2, 4411, 684, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (7, 4412, 684, '5.4');
INSERT INTO `attribute_value` VALUES (3, 4413, 684, 'Kim cương');
INSERT INTO `attribute_value` VALUES (4, 4414, 684, '1');
INSERT INTO `attribute_value` VALUES (5, 4415, 684, 'Nữ');
INSERT INTO `attribute_value` VALUES (9, 4416, 684, '42');
INSERT INTO `attribute_value` VALUES (6, 4417, 684, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 4418, 685, '10.27816 phân');
INSERT INTO `attribute_value` VALUES (2, 4419, 685, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (7, 4420, 685, '5.4');
INSERT INTO `attribute_value` VALUES (3, 4421, 685, 'Kim cương');
INSERT INTO `attribute_value` VALUES (4, 4422, 685, '1');
INSERT INTO `attribute_value` VALUES (5, 4423, 685, 'Nữ');
INSERT INTO `attribute_value` VALUES (9, 4424, 685, '43');
INSERT INTO `attribute_value` VALUES (6, 4425, 685, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 4426, 686, '27.3218 phân');
INSERT INTO `attribute_value` VALUES (2, 4427, 686, 'Kim cương');
INSERT INTO `attribute_value` VALUES (7, 4428, 686, '5.2');
INSERT INTO `attribute_value` VALUES (11, 4429, 686, 'D');
INSERT INTO `attribute_value` VALUES (12, 4430, 686, 'SI1');
INSERT INTO `attribute_value` VALUES (21, 4431, 686, 'Có');
INSERT INTO `attribute_value` VALUES (3, 4432, 686, 'Kim cương');
INSERT INTO `attribute_value` VALUES (4, 4433, 686, '1');
INSERT INTO `attribute_value` VALUES (5, 4434, 686, 'Nam');
INSERT INTO `attribute_value` VALUES (9, 4435, 686, '18');
INSERT INTO `attribute_value` VALUES (6, 4436, 686, 'MANCODE by PNJ');
INSERT INTO `attribute_value` VALUES (1, 4437, 687, '16.079 phân');
INSERT INTO `attribute_value` VALUES (2, 4438, 687, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (7, 4439, 687, '6.7');
INSERT INTO `attribute_value` VALUES (3, 4440, 687, 'Kim cương');
INSERT INTO `attribute_value` VALUES (5, 4441, 687, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 4442, 687, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 4443, 688, '21.787 phân');
INSERT INTO `attribute_value` VALUES (7, 4444, 688, '5.0');
INSERT INTO `attribute_value` VALUES (12, 4445, 688, 'SI1');
INSERT INTO `attribute_value` VALUES (4, 4446, 688, '1');
INSERT INTO `attribute_value` VALUES (5, 4447, 688, 'Nam');
INSERT INTO `attribute_value` VALUES (9, 4448, 688, '30');
INSERT INTO `attribute_value` VALUES (6, 4449, 688, 'MANCODE by PNJ');
INSERT INTO `attribute_value` VALUES (1, 4450, 689, '9.72582 phân');
INSERT INTO `attribute_value` VALUES (15, 4451, 689, '5.4');
INSERT INTO `attribute_value` VALUES (2, 4452, 689, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (3, 4453, 689, 'Kim cương');
INSERT INTO `attribute_value` VALUES (9, 4454, 689, '30');
INSERT INTO `attribute_value` VALUES (6, 4455, 689, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 4456, 690, '12.13496 phân');
INSERT INTO `attribute_value` VALUES (15, 4457, 690, '5.4');
INSERT INTO `attribute_value` VALUES (2, 4458, 690, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (3, 4459, 690, 'Kim cương');
INSERT INTO `attribute_value` VALUES (5, 4460, 690, 'Nữ');
INSERT INTO `attribute_value` VALUES (9, 4461, 690, '88');
INSERT INTO `attribute_value` VALUES (6, 4462, 690, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 4463, 691, '6.23634 phân');
INSERT INTO `attribute_value` VALUES (2, 4464, 691, 'Kim cương');
INSERT INTO `attribute_value` VALUES (7, 4465, 691, '1.8 x 2.4');
INSERT INTO `attribute_value` VALUES (3, 4466, 691, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (4, 4467, 691, '11');
INSERT INTO `attribute_value` VALUES (5, 4468, 691, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 4469, 691, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 4470, 692, '3.67906 phân');
INSERT INTO `attribute_value` VALUES (2, 4471, 692, 'Kim cương');
INSERT INTO `attribute_value` VALUES (7, 4472, 692, '1.6');
INSERT INTO `attribute_value` VALUES (3, 4473, 692, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (5, 4474, 692, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 4475, 692, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 4476, 693, '5.9939 phân');
INSERT INTO `attribute_value` VALUES (2, 4477, 693, 'Kim cương');
INSERT INTO `attribute_value` VALUES (3, 4478, 693, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (5, 4479, 693, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 4480, 693, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 4481, 694, '7.70184 phân');
INSERT INTO `attribute_value` VALUES (2, 4482, 694, 'Kim cương');
INSERT INTO `attribute_value` VALUES (7, 4483, 694, '5.4');
INSERT INTO `attribute_value` VALUES (3, 4484, 694, 'Kim cương');
INSERT INTO `attribute_value` VALUES (4, 4485, 694, '1');
INSERT INTO `attribute_value` VALUES (9, 4486, 694, '14');
INSERT INTO `attribute_value` VALUES (6, 4487, 694, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 4488, 695, '7.67717 phân');
INSERT INTO `attribute_value` VALUES (8, 4489, 695, '5850');
INSERT INTO `attribute_value` VALUES (2, 4490, 695, 'Kim cương');
INSERT INTO `attribute_value` VALUES (7, 4491, 695, '4.0');
INSERT INTO `attribute_value` VALUES (3, 4492, 695, 'Kim cương');
INSERT INTO `attribute_value` VALUES (5, 4493, 695, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 4494, 695, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 4495, 696, '10.2822 phân');
INSERT INTO `attribute_value` VALUES (8, 4496, 696, '7500');
INSERT INTO `attribute_value` VALUES (15, 4497, 696, '5.4');
INSERT INTO `attribute_value` VALUES (2, 4498, 696, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (7, 4499, 696, '5.4');
INSERT INTO `attribute_value` VALUES (3, 4500, 696, 'Kim cương');
INSERT INTO `attribute_value` VALUES (5, 4501, 696, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 4502, 696, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 4503, 697, '14.98014 phân');
INSERT INTO `attribute_value` VALUES (8, 4504, 697, '7500');
INSERT INTO `attribute_value` VALUES (15, 4505, 697, '5.4');
INSERT INTO `attribute_value` VALUES (2, 4506, 697, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (7, 4507, 697, '5.4');
INSERT INTO `attribute_value` VALUES (3, 4508, 697, 'Kim cương');
INSERT INTO `attribute_value` VALUES (5, 4509, 697, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 4510, 697, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 4511, 698, '11.44382 phân');
INSERT INTO `attribute_value` VALUES (8, 4512, 698, '7500');
INSERT INTO `attribute_value` VALUES (15, 4513, 698, '5.4');
INSERT INTO `attribute_value` VALUES (2, 4514, 698, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (7, 4515, 698, '5.4');
INSERT INTO `attribute_value` VALUES (3, 4516, 698, 'Diamond');
INSERT INTO `attribute_value` VALUES (5, 4517, 698, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 4518, 698, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 4519, 699, '9.77987 phân');
INSERT INTO `attribute_value` VALUES (8, 4520, 699, '5850');
INSERT INTO `attribute_value` VALUES (2, 4521, 699, 'Kim cương');
INSERT INTO `attribute_value` VALUES (7, 4522, 699, '3.5');
INSERT INTO `attribute_value` VALUES (11, 4523, 699, 'F');
INSERT INTO `attribute_value` VALUES (12, 4524, 699, 'SI1');
INSERT INTO `attribute_value` VALUES (3, 4525, 699, 'Kim cương');
INSERT INTO `attribute_value` VALUES (4, 4526, 699, '1');
INSERT INTO `attribute_value` VALUES (5, 4527, 699, 'Nữ');
INSERT INTO `attribute_value` VALUES (9, 4528, 699, '32');
INSERT INTO `attribute_value` VALUES (6, 4529, 699, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 4530, 700, '8.68026 phân');
INSERT INTO `attribute_value` VALUES (2, 4531, 700, 'Kim cương');
INSERT INTO `attribute_value` VALUES (7, 4532, 700, '2.0');
INSERT INTO `attribute_value` VALUES (3, 4533, 700, 'Kim cương');
INSERT INTO `attribute_value` VALUES (4, 4534, 700, '1');
INSERT INTO `attribute_value` VALUES (5, 4535, 700, 'Nữ');
INSERT INTO `attribute_value` VALUES (9, 4536, 700, '31');
INSERT INTO `attribute_value` VALUES (6, 4537, 700, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 4538, 701, '13.46088 phân');
INSERT INTO `attribute_value` VALUES (8, 4539, 701, '9000');
INSERT INTO `attribute_value` VALUES (2, 4540, 701, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (7, 4541, 701, '1.1');
INSERT INTO `attribute_value` VALUES (3, 4542, 701, 'Kim cương');
INSERT INTO `attribute_value` VALUES (5, 4543, 701, 'Nữ');
INSERT INTO `attribute_value` VALUES (9, 4544, 701, '1');
INSERT INTO `attribute_value` VALUES (6, 4545, 701, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 4763, 726, '13.34092 phân');
INSERT INTO `attribute_value` VALUES (8, 4764, 726, '9000');
INSERT INTO `attribute_value` VALUES (2, 4765, 726, 'Kim cương');
INSERT INTO `attribute_value` VALUES (7, 4766, 726, '2.5');
INSERT INTO `attribute_value` VALUES (20, 4767, 726, 'Facet');
INSERT INTO `attribute_value` VALUES (16, 4768, 726, 'Tròn');
INSERT INTO `attribute_value` VALUES (3, 4769, 726, 'Kim cương');
INSERT INTO `attribute_value` VALUES (13, 4770, 726, 'Trắng');
INSERT INTO `attribute_value` VALUES (4, 4771, 726, '1');
INSERT INTO `attribute_value` VALUES (5, 4772, 726, 'Nam');
INSERT INTO `attribute_value` VALUES (9, 4773, 726, '1');
INSERT INTO `attribute_value` VALUES (6, 4774, 726, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 4775, 727, '19.35427 phân');
INSERT INTO `attribute_value` VALUES (2, 4776, 727, 'Kim cương');
INSERT INTO `attribute_value` VALUES (20, 4777, 727, 'Facet');
INSERT INTO `attribute_value` VALUES (16, 4778, 727, 'Tròn');
INSERT INTO `attribute_value` VALUES (4, 4779, 727, '1');
INSERT INTO `attribute_value` VALUES (6, 4780, 727, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 4781, 728, '17.191 phân');
INSERT INTO `attribute_value` VALUES (2, 4782, 728, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (3, 4783, 728, 'Kim cương');
INSERT INTO `attribute_value` VALUES (5, 4784, 728, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 4785, 728, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 4786, 729, '15.1494 phân');
INSERT INTO `attribute_value` VALUES (2, 4787, 729, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (3, 4788, 729, 'Kim cương');
INSERT INTO `attribute_value` VALUES (5, 4789, 729, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 4790, 729, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 4791, 730, '18.88811 phân');
INSERT INTO `attribute_value` VALUES (2, 4792, 730, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (3, 4793, 730, 'Kim cương');
INSERT INTO `attribute_value` VALUES (5, 4794, 730, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 4795, 730, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 4796, 731, '21.97967 phân');
INSERT INTO `attribute_value` VALUES (15, 4797, 731, '6.3');
INSERT INTO `attribute_value` VALUES (2, 4798, 731, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (3, 4799, 731, 'Kim cương');
INSERT INTO `attribute_value` VALUES (5, 4800, 731, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 4801, 731, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 4802, 732, '16.93606 phân');
INSERT INTO `attribute_value` VALUES (2, 4803, 732, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (3, 4804, 732, 'Kim cương');
INSERT INTO `attribute_value` VALUES (5, 4805, 732, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 4806, 732, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 4807, 733, '16.5455 phân');
INSERT INTO `attribute_value` VALUES (2, 4808, 733, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (3, 4809, 733, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (5, 4810, 733, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 4811, 733, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 4812, 734, '18.56473 phân');
INSERT INTO `attribute_value` VALUES (2, 4813, 734, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (3, 4814, 734, 'Kim cương');
INSERT INTO `attribute_value` VALUES (6, 4815, 734, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 4816, 735, '19.27 phân');
INSERT INTO `attribute_value` VALUES (8, 4817, 735, '9000');
INSERT INTO `attribute_value` VALUES (2, 4818, 735, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (3, 4819, 735, 'Kim cương');
INSERT INTO `attribute_value` VALUES (5, 4820, 735, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 4821, 735, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 4822, 736, '18.27467 phân');
INSERT INTO `attribute_value` VALUES (2, 4823, 736, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (3, 4824, 736, 'Kim cương');
INSERT INTO `attribute_value` VALUES (6, 4825, 736, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 4826, 737, '16.533 phân');
INSERT INTO `attribute_value` VALUES (2, 4827, 737, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (3, 4828, 737, 'Kim cương');
INSERT INTO `attribute_value` VALUES (5, 4829, 737, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 4830, 737, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 4831, 738, '16.90157 phân');
INSERT INTO `attribute_value` VALUES (8, 4832, 738, '9000');
INSERT INTO `attribute_value` VALUES (15, 4833, 738, '6.0');
INSERT INTO `attribute_value` VALUES (2, 4834, 738, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (3, 4835, 738, 'Kim cương');
INSERT INTO `attribute_value` VALUES (5, 4836, 738, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 4837, 738, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 4838, 739, '20.92 phân');
INSERT INTO `attribute_value` VALUES (8, 4839, 739, '9000');
INSERT INTO `attribute_value` VALUES (2, 4840, 739, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (3, 4841, 739, 'Kim cương');
INSERT INTO `attribute_value` VALUES (5, 4842, 739, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 4843, 739, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 4844, 740, '30.16108 phân');
INSERT INTO `attribute_value` VALUES (8, 4845, 740, '4160');
INSERT INTO `attribute_value` VALUES (2, 4846, 740, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (3, 4847, 740, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (4, 4848, 740, '73');
INSERT INTO `attribute_value` VALUES (5, 4849, 740, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 4850, 740, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 4891, 747, '9.20051 phân');
INSERT INTO `attribute_value` VALUES (2, 4892, 747, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (3, 4893, 747, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (5, 4894, 747, 'Trẻ em');
INSERT INTO `attribute_value` VALUES (6, 4895, 747, 'SANRIO');
INSERT INTO `attribute_value` VALUES (1, 4903, 749, '20.73846 phân');
INSERT INTO `attribute_value` VALUES (2, 4904, 749, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (3, 4905, 749, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (5, 4906, 749, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 4907, 749, 'SANRIO');
INSERT INTO `attribute_value` VALUES (1, 5054, 777, '34.04864 phân');
INSERT INTO `attribute_value` VALUES (8, 5055, 777, '9250');
INSERT INTO `attribute_value` VALUES (2, 5056, 777, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (3, 5057, 777, 'Sythentic');
INSERT INTO `attribute_value` VALUES (5, 5058, 777, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 5059, 777, 'PNJSilver');
INSERT INTO `attribute_value` VALUES (1, 5060, 778, '10.05552 phân');
INSERT INTO `attribute_value` VALUES (8, 5061, 778, '9300');
INSERT INTO `attribute_value` VALUES (2, 5062, 778, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (3, 5063, 778, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (5, 5064, 778, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 5065, 778, 'PNJSilver');
INSERT INTO `attribute_value` VALUES (1, 5066, 779, '30.94356 phân');
INSERT INTO `attribute_value` VALUES (8, 5067, 779, '7500');
INSERT INTO `attribute_value` VALUES (2, 5068, 779, 'Southsea Pearl');
INSERT INTO `attribute_value` VALUES (7, 5069, 779, '10.0');
INSERT INTO `attribute_value` VALUES (3, 5070, 779, 'Diamond');
INSERT INTO `attribute_value` VALUES (4, 5071, 779, '1');
INSERT INTO `attribute_value` VALUES (5, 5072, 779, 'Nữ');
INSERT INTO `attribute_value` VALUES (9, 5073, 779, '18');
INSERT INTO `attribute_value` VALUES (19, 5074, 779, 'South Sea');
INSERT INTO `attribute_value` VALUES (6, 5075, 779, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 5076, 780, '32.9191 phân');
INSERT INTO `attribute_value` VALUES (8, 5077, 780, '7500');
INSERT INTO `attribute_value` VALUES (2, 5078, 780, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (3, 5079, 780, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (5, 5080, 780, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 5081, 780, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 5082, 781, '27.35921 phân');
INSERT INTO `attribute_value` VALUES (8, 5083, 781, '7500');
INSERT INTO `attribute_value` VALUES (2, 5084, 781, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (3, 5085, 781, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (5, 5086, 781, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 5087, 781, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 5088, 782, '17.97911 phân');
INSERT INTO `attribute_value` VALUES (8, 5089, 782, '5850');
INSERT INTO `attribute_value` VALUES (2, 5090, 782, 'Kim cương');
INSERT INTO `attribute_value` VALUES (7, 5091, 782, '3.0');
INSERT INTO `attribute_value` VALUES (3, 5092, 782, 'Kim cương');
INSERT INTO `attribute_value` VALUES (5, 5093, 782, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 5094, 782, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 5095, 783, '27.88756 phân');
INSERT INTO `attribute_value` VALUES (8, 5096, 783, '5850');
INSERT INTO `attribute_value` VALUES (2, 5097, 783, 'Sapphire');
INSERT INTO `attribute_value` VALUES (3, 5098, 783, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (5, 5099, 783, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 5100, 783, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 5101, 784, '32.0617 phân');
INSERT INTO `attribute_value` VALUES (2, 5102, 784, 'Kim cương');
INSERT INTO `attribute_value` VALUES (7, 5103, 784, '2.4');
INSERT INTO `attribute_value` VALUES (3, 5104, 784, 'Kim cương');
INSERT INTO `attribute_value` VALUES (5, 5105, 784, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 5106, 784, 'PNJ');
INSERT INTO `attribute_value` VALUES (2, 5107, 785, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (7, 5108, 785, '3.5');
INSERT INTO `attribute_value` VALUES (3, 5109, 785, 'Xoàn mỹ');
INSERT INTO `attribute_value` VALUES (4, 5110, 785, '1');
INSERT INTO `attribute_value` VALUES (5, 5111, 785, 'Nữ');
INSERT INTO `attribute_value` VALUES (9, 5112, 785, '35');
INSERT INTO `attribute_value` VALUES (6, 5113, 785, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 5114, 786, '23.44579 phân');
INSERT INTO `attribute_value` VALUES (8, 5115, 786, '7500');
INSERT INTO `attribute_value` VALUES (2, 5116, 786, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (3, 5117, 786, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (5, 5118, 786, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 5119, 786, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 5120, 787, '27.244 phân');
INSERT INTO `attribute_value` VALUES (8, 5121, 787, '7500');
INSERT INTO `attribute_value` VALUES (15, 5122, 787, '4.7');
INSERT INTO `attribute_value` VALUES (2, 5123, 787, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (7, 5124, 787, '4.7');
INSERT INTO `attribute_value` VALUES (3, 5125, 787, 'Diamond');
INSERT INTO `attribute_value` VALUES (4, 5126, 787, '1');
INSERT INTO `attribute_value` VALUES (5, 5127, 787, 'Nữ');
INSERT INTO `attribute_value` VALUES (9, 5128, 787, '138');
INSERT INTO `attribute_value` VALUES (6, 5129, 787, 'PNJ');
INSERT INTO `attribute_value` VALUES (1, 5130, 788, '18.694 phân');
INSERT INTO `attribute_value` VALUES (8, 5131, 788, '9500');
INSERT INTO `attribute_value` VALUES (2, 5132, 788, 'Kim cương');
INSERT INTO `attribute_value` VALUES (10, 5133, 788, 'Trắng');
INSERT INTO `attribute_value` VALUES (3, 5134, 788, 'Không gắn đá');
INSERT INTO `attribute_value` VALUES (5, 5135, 788, 'Nữ');
INSERT INTO `attribute_value` VALUES (6, 5136, 788, 'PNJ');

-- ----------------------------
-- Table structure for banner_image
-- ----------------------------
DROP TABLE IF EXISTS `banner_image`;
CREATE TABLE `banner_image`  (
  `created_at` datetime(6) NULL DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `updated_at` datetime(6) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of banner_image
-- ----------------------------

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `customer_id` bigint NULL DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK867x3yysb1f3jk41cv3vsoejj`(`customer_id` ASC) USING BTREE,
  CONSTRAINT `FKdebwvad6pp1ekiqy5jtixqbaj` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cart
-- ----------------------------

-- ----------------------------
-- Table structure for cart_item
-- ----------------------------
DROP TABLE IF EXISTS `cart_item`;
CREATE TABLE `cart_item`  (
  `added_at` datetime(6) NULL DEFAULT NULL,
  `cart_id` bigint NULL DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint NULL DEFAULT NULL,
  `product_size_id` bigint NULL DEFAULT NULL,
  `quantity` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK1uobyhgl1wvgt1jpccia8xxs3`(`cart_id` ASC) USING BTREE,
  INDEX `FKjcyd5wv4igqnw413rgxbfu4nv`(`product_id` ASC) USING BTREE,
  INDEX `FK7efcv6f1jpjksufhxm6klklr5`(`product_size_id` ASC) USING BTREE,
  CONSTRAINT `FK1uobyhgl1wvgt1jpccia8xxs3` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK7efcv6f1jpjksufhxm6klklr5` FOREIGN KEY (`product_size_id`) REFERENCES `product_size` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKjcyd5wv4igqnw413rgxbfu4nv` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cart_item
-- ----------------------------

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `created_at` datetime(6) NULL DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint NULL DEFAULT NULL,
  `updated_at` datetime(6) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK2y94svpmqttx80mshyny85wqr`(`parent_id` ASC) USING BTREE,
  CONSTRAINT `FK2y94svpmqttx80mshyny85wqr` FOREIGN KEY (`parent_id`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('2025-03-19 00:40:02.649226', 1, NULL, NULL, 'Nhẫn');
INSERT INTO `category` VALUES ('2025-03-19 00:40:11.035267', 2, NULL, NULL, 'Vòng');
INSERT INTO `category` VALUES ('2025-03-19 00:40:18.032422', 3, NULL, NULL, 'Dây chuyền');
INSERT INTO `category` VALUES ('2025-03-19 00:40:25.007716', 4, NULL, NULL, 'Mặt dây chuyền');
INSERT INTO `category` VALUES ('2025-03-19 00:40:31.086911', 5, NULL, NULL, 'Bông tai');
INSERT INTO `category` VALUES ('2025-03-19 00:40:37.222658', 6, NULL, NULL, 'Lắc');
INSERT INTO `category` VALUES ('2025-03-19 00:40:43.932609', 7, NULL, NULL, 'Dây cổ');
INSERT INTO `category` VALUES ('2025-03-19 00:40:50.214390', 8, NULL, NULL, 'Kiềng');
INSERT INTO `category` VALUES ('2025-03-19 00:40:57.260566', 9, NULL, NULL, 'Charm');
INSERT INTO `category` VALUES ('2025-03-19 00:41:43.439132', 10, 5, NULL, 'Bông tai vàng');
INSERT INTO `category` VALUES ('2025-03-19 00:41:59.032971', 11, 5, NULL, 'Bông tai bạc');
INSERT INTO `category` VALUES ('2025-03-19 00:42:17.643266', 12, 9, NULL, 'Charm bạc');
INSERT INTO `category` VALUES ('2025-03-19 00:42:25.862535', 13, 9, NULL, 'Charm vàng');
INSERT INTO `category` VALUES ('2025-03-19 00:43:16.250639', 14, 3, NULL, 'Dây chuyền vàng');
INSERT INTO `category` VALUES ('2025-03-19 00:43:24.612664', 15, 3, NULL, 'Dây chuyền bạc');
INSERT INTO `category` VALUES ('2025-03-19 00:43:28.830568', 16, 3, NULL, 'Dây chuyền bạch kim');
INSERT INTO `category` VALUES ('2025-03-19 00:43:46.515920', 17, 7, NULL, 'Dây cổ bạc');
INSERT INTO `category` VALUES ('2025-03-19 00:43:53.454938', 18, 7, NULL, 'Dây cổ vàng');
INSERT INTO `category` VALUES ('2025-03-19 00:44:13.392513', 19, 8, NULL, 'Kiềng vàng');
INSERT INTO `category` VALUES ('2025-03-19 00:44:16.948382', 20, 8, NULL, 'Kiềng bạc');
INSERT INTO `category` VALUES ('2025-03-19 00:44:35.461597', 21, 6, NULL, 'Lắc bạc');
INSERT INTO `category` VALUES ('2025-03-19 00:44:39.423219', 22, 6, NULL, 'Lắc vàng');
INSERT INTO `category` VALUES ('2025-03-19 00:45:00.818703', 23, 4, NULL, 'Mặt dây chuyền vàng');
INSERT INTO `category` VALUES ('2025-03-19 00:45:04.992723', 24, 4, NULL, 'Mặt dây chuyền bạc');
INSERT INTO `category` VALUES ('2025-03-19 00:45:24.730419', 25, 1, NULL, 'Nhẫn vàng');
INSERT INTO `category` VALUES ('2025-03-19 00:45:28.009704', 26, 1, NULL, 'Nhẫn bạc');
INSERT INTO `category` VALUES ('2025-03-19 00:45:34.327949', 27, 1, NULL, 'Nhẫn bạch kim');
INSERT INTO `category` VALUES ('2025-03-19 00:45:53.865207', 28, 2, NULL, 'Vòng vàng');
INSERT INTO `category` VALUES ('2025-03-19 00:45:56.952679', 29, 2, NULL, 'Vòng bạc');
INSERT INTO `category` VALUES ('2025-03-19 00:46:01.016234', 30, 2, NULL, 'Vòng bạch kim');

-- ----------------------------
-- Table structure for codpayment
-- ----------------------------
DROP TABLE IF EXISTS `codpayment`;
CREATE TABLE `codpayment`  (
  `status` enum('PROCESSING','PAID','REFUNDED') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `amount` bigint NULL DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `payment_date` datetime(6) NULL DEFAULT NULL,
  `order_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `payment_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `payment_message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK1k25ut9vl1fn8ppnj7drcmrvt`(`order_id` ASC) USING BTREE,
  CONSTRAINT `FKodtcf7kllgfdjshb893wb6nat` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `codpayment_chk_1` CHECK (`status` between 0 and 2)
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of codpayment
-- ----------------------------

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection`  (
  `created_at` datetime(6) NULL DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `updated_at` datetime(6) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of collection
-- ----------------------------

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `dob` date NULL DEFAULT NULL,
  `is_subscribed_for_news` bit(1) NULL DEFAULT NULL,
  `backup_token_expire_at` datetime(6) NULL DEFAULT NULL,
  `delete_account_token_expiration` datetime(6) NULL DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `join_at` datetime(6) NULL DEFAULT NULL,
  `total_spent` bigint NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `backup_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `delete_account_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `gender` enum('FEMALE','MALE','OTHER') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `membership_rank` enum('DIAMOND','GOLD','MEMBER','PLATINUM','SILVER') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `role` enum('CUSTOMER','MANAGER','STAFF') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` enum('ACTIVE','BANNED','REMOVED') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of customer
-- ----------------------------

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager`  (
  `dob` date NULL DEFAULT NULL,
  `backup_token_expire_at` datetime(6) NULL DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `join_at` datetime(6) NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `backup_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `gender` enum('FEMALE','MALE','OTHER') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `role` enum('CUSTOMER','MANAGER','STAFF') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` enum('ACTIVE','BANNED','REMOVED') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES (NULL, NULL, 1, '2025-05-02 20:42:46.716415', NULL, NULL, '23110119@student.hcmute.edu.vn', 'Manager', '$2a$10$AfXZM.A8BdhIv/zIUizhv.lMWdveOGwk7uzzKs9Q9XNXizzc0ge7C', NULL, 'manager', NULL, 'MANAGER', 'ACTIVE');

-- ----------------------------
-- Table structure for momo_payment
-- ----------------------------
DROP TABLE IF EXISTS `momo_payment`;
CREATE TABLE `momo_payment`  (
  `result_code` int NOT NULL,
  `status` enum('PROCESSING','PAID','REFUNDED') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `amount` bigint NULL DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `payment_date` datetime(6) NULL DEFAULT NULL,
  `transaction_id` bigint NULL DEFAULT NULL,
  `order_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `payment_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `payment_message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `request_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UKs1th0h1ff376rb0ib795d4qyf`(`order_id` ASC) USING BTREE,
  CONSTRAINT `FK6v6upyx7ilesigxew5qb1wclf` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `momo_payment_chk_1` CHECK (`status` between 0 and 2)
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of momo_payment
-- ----------------------------

-- ----------------------------
-- Table structure for notification
-- ----------------------------
DROP TABLE IF EXISTS `notification`;
CREATE TABLE `notification`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sent_at` datetime(6) NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of notification
-- ----------------------------

-- ----------------------------
-- Table structure for order_item
-- ----------------------------
DROP TABLE IF EXISTS `order_item`;
CREATE TABLE `order_item`  (
  `discount_price` bigint NULL DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `price` bigint NULL DEFAULT NULL,
  `product_id` bigint NULL DEFAULT NULL,
  `product_size_id` bigint NULL DEFAULT NULL,
  `quantity` bigint NULL DEFAULT NULL,
  `total_price` bigint NULL DEFAULT NULL,
  `order_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKt4dc2r9nbvbujrljv3e23iibt`(`order_id` ASC) USING BTREE,
  INDEX `FK551losx9j75ss5d6bfsqvijna`(`product_id` ASC) USING BTREE,
  INDEX `FKhhtfmjxqj7awt1qmiydpp4n9e`(`product_size_id` ASC) USING BTREE,
  CONSTRAINT `FK551losx9j75ss5d6bfsqvijna` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKhhtfmjxqj7awt1qmiydpp4n9e` FOREIGN KEY (`product_size_id`) REFERENCES `product_size` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKt4dc2r9nbvbujrljv3e23iibt` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_item
-- ----------------------------

-- ----------------------------
-- Table structure for order_voucher
-- ----------------------------
DROP TABLE IF EXISTS `order_voucher`;
CREATE TABLE `order_voucher`  (
  `customer_id` bigint NULL DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `voucher_id` bigint NULL DEFAULT NULL,
  `order_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKsrhuwor1f2tjthp6k4tmuwrqa`(`order_id` ASC) USING BTREE,
  INDEX `FKsvm2d55bceb27bgd3t27co8ge`(`voucher_id` ASC) USING BTREE,
  CONSTRAINT `FKsrhuwor1f2tjthp6k4tmuwrqa` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKsvm2d55bceb27bgd3t27co8ge` FOREIGN KEY (`voucher_id`) REFERENCES `voucher` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_voucher
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `is_reviewed` bit(1) NOT NULL,
  `address_id` bigint NULL DEFAULT NULL,
  `customer_id` bigint NULL DEFAULT NULL,
  `free_ship_discount` bigint NULL DEFAULT NULL,
  `order_date` datetime(6) NULL DEFAULT NULL,
  `promotion_discount` bigint NULL DEFAULT NULL,
  `shipping_fee` bigint NULL DEFAULT NULL,
  `total_price` bigint NULL DEFAULT NULL,
  `total_product_price` bigint NULL DEFAULT NULL,
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `payment_method` enum('COD','MOMO','VN_PAY') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `shipping_method` enum('EXPRESS','STANDARD') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` enum('CANCELLED','COMPLETED','CONFIRMED','DELIVERED','PENDING','RETURNED','RETURN_REJECTED','RETURN_REQUESTED','SHIPPING') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK624gtjin3po807j3vix093tlf`(`customer_id` ASC) USING BTREE,
  INDEX `FKf5464gxwc32ongdvka2rtvw96`(`address_id` ASC) USING BTREE,
  CONSTRAINT `FK624gtjin3po807j3vix093tlf` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKf5464gxwc32ongdvka2rtvw96` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for privacy_and_term
-- ----------------------------
DROP TABLE IF EXISTS `privacy_and_term`;
CREATE TABLE `privacy_and_term`  (
  `created_at` datetime(6) NULL DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `updated_at` datetime(6) NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of privacy_and_term
-- ----------------------------

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `category_id` bigint NULL DEFAULT NULL,
  `collection_id` bigint NULL DEFAULT NULL,
  `created_at` datetime(6) NULL DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `updated_at` datetime(6) NULL DEFAULT NULL,
  `material` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `status` enum('IN_STOCK','NOT_AVAILABLE','OUT_OF_STOCK') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK1mtsbur82frn64de7balymq9s`(`category_id` ASC) USING BTREE,
  INDEX `FK1m7avyryg7yow6ytttlt7qcun`(`collection_id` ASC) USING BTREE,
  CONSTRAINT `FK1m7avyryg7yow6ytttlt7qcun` FOREIGN KEY (`collection_id`) REFERENCES `collection` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK1mtsbur82frn64de7balymq9s` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 789 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (10, NULL, '2025-05-02 20:43:23.000000', 61, NULL, 'Vàng 14K', 'Bông tai Kim cương Vàng 14K Disney|Jasmine DDDDC000222', 'Đôi bông tai được chế tác từ vàng 14K và sở hữu kiểu dáng nhỏ xinh, phù hợp với những quý cô ưa chuộng phong cách sang trọng. Đặc biệt hơn nữa, đôi bông tai sở hữu điểm nhấn Kim cương tạo nên vẻ đẹp tinh tế, tôn lên vẻ đẹp dịu dàng, quý phái cho người đeo.\nKim cương được xem là biểu tượng của sự quyền lực, giàu sang và quý phái, do đó nó được sử dụng để tạo nên các tuyệt tác trang sức kim cương tinh tế. Sự sáng tạo mạnh mẽ của các nhà thiết kế của Disney|được phô diễn thông qua đôi bông tai với vẻ đẹp đẳng cấp và thời thượng.', 'IN_STOCK');
INSERT INTO `product` VALUES (10, NULL, '2025-05-02 20:43:23.000000', 62, NULL, 'Vàng trắng', 'Bông tai Kim cương Vàng Trắng 14K My First Diamond DDDDW004377', 'Đôi bông tai được chế tác từ vàng 14K và sở hữu kiểu dáng nhỏ xinh, phù hợp với những quý cô ưa chuộng phong cách sang trọng. Đặc biệt hơn nữa, đôi bông tai sở hữu điểm nhấn Kim cương tạo nên vẻ đẹp tinh tế, tôn lên vẻ đẹp dịu dàng, quý phái cho người đeo.\nKim cương được xem là biểu tượng của sự quyền lực, giàu sang và quý phái, do đó nó được sử dụng để tạo nên các tuyệt tác trang sức kim cương tinh tế. Sự sáng tạo mạnh mẽ của các nhà thiết kế của được phô diễn thông qua đôi bông tai với vẻ đẹp đẳng cấp và thời thượng.', 'IN_STOCK');
INSERT INTO `product` VALUES (10, NULL, '2025-05-02 20:43:23.000000', 63, NULL, 'Vàng trắng', 'Bông tai Kim cương Vàng Trắng 14K My First Diamond DDDDW004383', 'Đôi bông tai được chế tác từ vàng 14K và sở hữu kiểu dáng nhỏ xinh, phù hợp với những quý cô ưa chuộng phong cách sang trọng. Đặc biệt hơn nữa, đôi bông tai sở hữu điểm nhấn Kim cương tạo nên vẻ đẹp tinh tế, tôn lên vẻ đẹp dịu dàng, quý phái cho người đeo.\nKim cương được xem là biểu tượng của sự quyền lực, giàu sang và quý phái, do đó nó được sử dụng để tạo nên các tuyệt tác trang sức kim cương tinh tế. Sự sáng tạo mạnh mẽ của các nhà thiết kế của được phô diễn thông qua đôi bông tai với vẻ đẹp đẳng cấp và thời thượng.', 'IN_STOCK');
INSERT INTO `product` VALUES (10, NULL, '2025-05-02 20:43:23.000000', 64, NULL, 'Vàng trắng', 'Bông tai Kim cương Vàng trắng 14K My First Diamond DD00W001963', 'Đôi bông tai được chế tác từ vàng 14K và sở hữu kiểu dáng nhỏ xinh, phù hợp với những quý cô ưa chuộng phong cách sang trọng. Đặc biệt hơn nữa, đôi bông tai sở hữu điểm nhấn Kim cương tạo nên vẻ đẹp tinh tế, tôn lên vẻ đẹp dịu dàng, quý phái cho người đeo.\nKim cương được xem là biểu tượng của sự quyền lực, giàu sang và quý phái, do đó nó được sử dụng để tạo nên các tuyệt tác trang sức kim cương tinh tế. Sự sáng tạo mạnh mẽ của các nhà thiết kế của được phô diễn thông qua đôi bông tai với vẻ đẹp đẳng cấp và thời thượng.', 'IN_STOCK');
INSERT INTO `product` VALUES (10, NULL, '2025-05-02 20:43:23.000000', 65, NULL, 'Vàng trắng', 'Bông tai Kim cương Vàng trắng 14K DD00W060191', 'Đôi bông tai được chế tác từ vàng 14K và sở hữu kiểu dáng nhỏ xinh, phù hợp với những quý cô ưa chuộng phong cách sang trọng. Đặc biệt hơn nữa, đôi bông tai sở hữu điểm nhấn Kim cương tạo nên vẻ đẹp tinh tế, tôn lên vẻ đẹp dịu dàng, quý phái cho người đeo.\nKim cương được xem là biểu tượng của sự quyền lực, giàu sang và quý phái, do đó nó được sử dụng để tạo nên các tuyệt tác trang sức kim cương tinh tế. Sự sáng tạo mạnh mẽ của các nhà thiết kế của được phô diễn thông qua đôi bông tai với vẻ đẹp đẳng cấp và thời thượng.', 'IN_STOCK');
INSERT INTO `product` VALUES (10, NULL, '2025-05-02 20:43:23.000000', 66, NULL, 'Vàng trắng', 'Bông tai Kim cương Vàng trắng 14K DD00W060192', 'Đôi bông tai được chế tác từ vàng 14K và sở hữu kiểu dáng nhỏ xinh, phù hợp với những quý cô ưa chuộng phong cách sang trọng. Đặc biệt hơn nữa, đôi bông tai sở hữu điểm nhấn Kim cương tạo nên vẻ đẹp tinh tế, tôn lên vẻ đẹp dịu dàng, quý phái cho người đeo.\nKim cương được xem là biểu tượng của sự quyền lực, giàu sang và quý phái, do đó nó được sử dụng để tạo nên các tuyệt tác trang sức kim cương tinh tế. Sự sáng tạo mạnh mẽ của các nhà thiết kế của được phô diễn thông qua đôi bông tai với vẻ đẹp đẳng cấp và thời thượng.', 'IN_STOCK');
INSERT INTO `product` VALUES (10, NULL, '2025-05-02 20:43:23.000000', 67, NULL, 'Vàng trắng', 'Bông tai Kim cương Vàng trắng 14K hình cỏ bốn lá DD00W060193', 'Đôi bông tai được chế tác từ vàng 14K và sở hữu kiểu dáng nhỏ xinh, phù hợp với những quý cô ưa chuộng phong cách sang trọng. Đặc biệt hơn nữa, đôi bông tai sở hữu điểm nhấn Kim cương tạo nên vẻ đẹp tinh tế, tôn lên vẻ đẹp dịu dàng, quý phái cho người đeo.\nKim cương được xem là biểu tượng của sự quyền lực, giàu sang và quý phái, do đó nó được sử dụng để tạo nên các tuyệt tác trang sức kim cương tinh tế. Sự sáng tạo mạnh mẽ của các nhà thiết kế của được phô diễn thông qua đôi bông tai với vẻ đẹp đẳng cấp và thời thượng.', 'IN_STOCK');
INSERT INTO `product` VALUES (10, NULL, '2025-05-02 20:43:23.000000', 68, NULL, 'Vàng trắng', 'Bông tai Kim cương Vàng trắng 14K DD00W060194', 'Đôi bông tai được chế tác từ vàng 14K và sở hữu kiểu dáng nhỏ xinh, phù hợp với những quý cô ưa chuộng phong cách sang trọng. Đặc biệt hơn nữa, đôi bông tai sở hữu điểm nhấn Kim cương tạo nên vẻ đẹp tinh tế, tôn lên vẻ đẹp dịu dàng, quý phái cho người đeo.\nKim cương được xem là biểu tượng của sự quyền lực, giàu sang và quý phái, do đó nó được sử dụng để tạo nên các tuyệt tác trang sức kim cương tinh tế. Sự sáng tạo mạnh mẽ của các nhà thiết kế của được phô diễn thông qua đôi bông tai với vẻ đẹp đẳng cấp và thời thượng.', 'IN_STOCK');
INSERT INTO `product` VALUES (10, NULL, '2025-05-02 20:43:23.000000', 69, NULL, 'Vàng trắng', 'Vỏ bông tai Kim cương Vàng Trắng 18K 00DDW061426', 'Đôi bông tai là dòng trang sức với sự kết hợp độc đáo giữa vàng trắng 18K và những viên kim cương đạt tiêu chuẩn cao nhất về chất lượng cùng độ chính xác trong từng giác cắt. Màu sắc yêu kiều, thiết kế tinh xảo khi kết hợp cùng viên chủ Kim cương, chắc chắn đôi bông tai vàng 18K sẽ trở thành điểm nhấn nâng niu vẻ đẹp của nàng một cách khéo léo.\nNhấn nhá một chút sắc trắng từ bông tai cho phong thái thêm ấn tượng, nàng bừng sáng cùng chất riêng đầy kiêu hãnh. Và với nàng, dường như mọi sự khoa trương đều được tiết chế, mọi sự mềm mại đều bộc phát thành ánh sắc riêng rạng ngời.', 'IN_STOCK');
INSERT INTO `product` VALUES (10, NULL, '2025-05-02 20:43:23.000000', 70, NULL, 'Vàng trắng', 'Bông tai Kim cương Vàng Trắng 14K DDDDW060403', 'Đôi bông tai được chế tác từ vàng 14K và sở hữu kiểu dáng nhỏ xinh, phù hợp với những quý cô ưa chuộng phong cách sang trọng. Đặc biệt hơn nữa, đôi bông tai sở hữu điểm nhấn Kim cương tạo nên vẻ đẹp tinh tế, tôn lên vẻ đẹp dịu dàng, quý phái cho người đeo.\nKim cương được xem là biểu tượng của sự quyền lực, giàu sang và quý phái, do đó nó được sử dụng để tạo nên các tuyệt tác trang sức kim cương tinh tế. Sự sáng tạo mạnh mẽ của các nhà thiết kế của được phô diễn thông qua đôi bông tai với vẻ đẹp đẳng cấp và thời thượng.', 'IN_STOCK');
INSERT INTO `product` VALUES (10, NULL, '2025-05-02 20:43:23.000000', 71, NULL, 'Vàng trắng', 'Bông tai nam Kim cương Vàng Trắng 14K DDDDW060404', 'Với thiết kế nam tính, bông tai nam không chỉ là món trang sức mà còn là biểu tượng của phong cách thời thượng, mạnh mẽ. Chất liệu vàng 14K đảm bảo độ bền và sáng bóng theo thời gian, tôn lên vẻ đẹp nam tính của phái mạnh kết hợp kim cương - biểu tượng của sự sang trọng và hiện đại.\nKhẳng định phong cách thời trang và thể hiện cá tính riêng với bông tai nam này. Đây không chỉ là món trang sức mà còn là biểu tượng của sự thành công và đẳng cấp.', 'IN_STOCK');
INSERT INTO `product` VALUES (10, NULL, '2025-05-02 20:43:23.000000', 72, NULL, 'Vàng trắng', 'Bông tai nam Kim cương Vàng Trắng 14K DDDDW060405', 'Với thiết kế nam tính, bông tai nam không chỉ là món trang sức mà còn là biểu tượng của phong cách thời thượng, mạnh mẽ. Chất liệu vàng 14K đảm bảo độ bền và sáng bóng theo thời gian, tôn lên vẻ đẹp nam tính của phái mạnh kết hợp kim cương - biểu tượng của sự sang trọng và hiện đại.\nKhẳng định phong cách thời trang và thể hiện cá tính riêng với bông tai nam này. Đây không chỉ là món trang sức mà còn là biểu tượng của sự thành công và đẳng cấp.', 'IN_STOCK');
INSERT INTO `product` VALUES (11, NULL, '2025-05-02 20:43:23.000000', 122, NULL, 'Bạc', 'Bông tai Bạc đính đá STYLE By XMXMW000095', 'Bông tai bạc từ STYLE By được thiết kế kiểu dáng cá tính ,tinh tế với điểm nhấn đính đá trên chất liệu bạc 92.5, sáng lấp lánh làm nền tạo điểm nhấn giúp tôn lên vẻ đẹp của nàng xinh, gây ấn tượng với nhiều người xung quanh.\nDù là cuộc gặp mặt cuối năm nhẹ nhàng hay những bữa tiệc sôi động, nàng hãy luôn toát lên vẻ thanh lịch nổi bật cá tính với sự kết hợp hoàn hảo của một chiếc váy đen sang trọng cùng đôi bông tai phong cách từ Style by PNJ.', 'IN_STOCK');
INSERT INTO `product` VALUES (11, NULL, '2025-05-02 20:43:23.000000', 123, NULL, 'Bạc', 'Bông tai Bạc đính đá STYLE By Bisous ZTXMW000039', 'Bông tai Bạc đính đá STYLE By thuộc BST Bisous là một sản phẩm đầy lôi cuốn và trẻ trung, lấy cảm hứng từ biểu tượng \"Bisous\" (nụ hôn) trong tiếng Pháp, với ý nghĩa “1000 nụ hôn” – biểu trưng cho tình yêu ngọt ngào và mãnh liệt. Kết hợp cùng hình ảnh trái tim vĩnh cửu, sản phẩm không chỉ tôn vinh sự ngọt ngào của tình yêu mà còn khuyến khích bạn sống thật với những cảm xúc của mình.\nMỗi thiết kế trong bộ sưu tập Bisous đều mang thông điệp sâu sắc: yêu là trao đi, yêu là nhận lại và yêu là sống trọn vẹn từng khoảnh khắc. Bông tai Bạc STYLE By PNJ, với chất liệu bạc tinh xảo và đá lấp lánh, là lựa chọn hoàn hảo để bạn thể hiện tình cảm trong những dịp đặc biệt.', 'IN_STOCK');
INSERT INTO `product` VALUES (11, NULL, '2025-05-02 20:43:23.000000', 124, NULL, 'Bạc', 'Bông tai trẻ em Bạc đính đá PNJSilver XM00W000065', 'Đôi bông tai PNJSilver sở hữu một thiết kế trẻ trung, thể hiện vẻ đẹp đáng yêu của những nàng công chúa nhỏ của ba mẹ. Sự đính kết và sắp xếp những điểm nhấn một cách hoàn hảo mang đến vẻ đẹp của sự phá cách, cá tính và thời thượng cho đôi bông tai.\nĐặc biệt hơn, đôi bông tai sẽ trở nên ý nghĩa hơn khi trở thành món quà ghi dấu yêu thương vào những dịp quan trọng. Đây chắc chắn sẽ là thứ giúp bạn gắn kết những khoảnh khắc đáng nhớ với mình hoặc người thương.', 'IN_STOCK');
INSERT INTO `product` VALUES (11, NULL, '2025-05-02 20:43:23.000000', 125, NULL, 'Bạc', 'Bông tai trẻ em Bạc đính đá PNJSilver XM00W000063', 'Đôi bông tai PNJSilver sở hữu một thiết kế trẻ trung, thể hiện vẻ đẹp đáng yêu của những nàng công chúa nhỏ của ba mẹ. Sự đính kết và sắp xếp những điểm nhấn một cách hoàn hảo mang đến vẻ đẹp của sự phá cách, cá tính và thời thượng cho đôi bông tai.\nĐặc biệt hơn, đôi bông tai sẽ trở nên ý nghĩa hơn khi trở thành món quà ghi dấu yêu thương vào những dịp quan trọng. Đây chắc chắn sẽ là thứ giúp bạn gắn kết những khoảnh khắc đáng nhớ với mình hoặc người thương.', 'IN_STOCK');
INSERT INTO `product` VALUES (11, NULL, '2025-05-02 20:43:23.000000', 126, NULL, 'Bạc', 'Bông tai Bạc đính đá STYLE By Bisous ZTXMW000040', 'Bông tai Bạc đính đá STYLE By thuộc BST Bisous là một sản phẩm đầy lôi cuốn và trẻ trung, lấy cảm hứng từ biểu tượng \"Bisous\" (nụ hôn) trong tiếng Pháp, với ý nghĩa “1000 nụ hôn” – biểu trưng cho tình yêu ngọt ngào và mãnh liệt. Kết hợp cùng hình ảnh trái tim vĩnh cửu, sản phẩm không chỉ tôn vinh sự ngọt ngào của tình yêu mà còn khuyến khích bạn sống thật với những cảm xúc của mình.\nMỗi thiết kế trong bộ sưu tập Bisous đều mang thông điệp sâu sắc: yêu là trao đi, yêu là nhận lại và yêu là sống trọn vẹn từng khoảnh khắc. Bông tai Bạc STYLE By PNJ, với chất liệu bạc tinh xảo và đá lấp lánh, là lựa chọn hoàn hảo để bạn thể hiện tình cảm trong những dịp đặc biệt.', 'IN_STOCK');
INSERT INTO `product` VALUES (11, NULL, '2025-05-02 20:43:23.000000', 127, NULL, 'Bạc', 'Bông tai Bạc đính đá STYLE By Bisous ZTXMY000009', 'Bông tai Bạc đính đá STYLE By thuộc BST Bisous là một sản phẩm đầy lôi cuốn và trẻ trung, lấy cảm hứng từ biểu tượng \"Bisous\" (nụ hôn) trong tiếng Pháp, với ý nghĩa “1000 nụ hôn” – biểu trưng cho tình yêu ngọt ngào và mãnh liệt. Kết hợp cùng hình ảnh trái tim vĩnh cửu, sản phẩm không chỉ tôn vinh sự ngọt ngào của tình yêu mà còn khuyến khích bạn sống thật với những cảm xúc của mình.\nMỗi thiết kế trong bộ sưu tập Bisous đều mang thông điệp sâu sắc: yêu là trao đi, yêu là nhận lại và yêu là sống trọn vẹn từng khoảnh khắc. Bông tai Bạc STYLE By PNJ, với chất liệu bạc tinh xảo và đá lấp lánh, là lựa chọn hoàn hảo để bạn thể hiện tình cảm trong những dịp đặc biệt.', 'IN_STOCK');
INSERT INTO `product` VALUES (11, NULL, '2025-05-02 20:43:23.000000', 128, NULL, 'Bạc', 'Bông tai Bạc đính đá STYLE By Bisous ZTXMY000010', 'Bông tai Bạc đính đá STYLE By thuộc BST Bisous là một sản phẩm đầy lôi cuốn và trẻ trung, lấy cảm hứng từ biểu tượng \"Bisous\" (nụ hôn) trong tiếng Pháp, với ý nghĩa “1000 nụ hôn” – biểu trưng cho tình yêu ngọt ngào và mãnh liệt. Kết hợp cùng hình ảnh trái tim vĩnh cửu, sản phẩm không chỉ tôn vinh sự ngọt ngào của tình yêu mà còn khuyến khích bạn sống thật với những cảm xúc của mình.\nMỗi thiết kế trong bộ sưu tập Bisous đều mang thông điệp sâu sắc: yêu là trao đi, yêu là nhận lại và yêu là sống trọn vẹn từng khoảnh khắc. Bông tai Bạc STYLE By PNJ, với chất liệu bạc tinh xảo và đá lấp lánh, là lựa chọn hoàn hảo để bạn thể hiện tình cảm trong những dịp đặc biệt.', 'IN_STOCK');
INSERT INTO `product` VALUES (11, NULL, '2025-05-02 20:43:23.000000', 129, NULL, 'Bạc', 'Bông tai Bạc đính đá STYLE By Bisous ZTXMW000036', 'Bông tai Bạc đính đá STYLE By thuộc BST Bisous là một sản phẩm đầy lôi cuốn và trẻ trung, lấy cảm hứng từ biểu tượng \"Bisous\" (nụ hôn) trong tiếng Pháp, với ý nghĩa “1000 nụ hôn” – biểu trưng cho tình yêu ngọt ngào và mãnh liệt. Kết hợp cùng hình ảnh trái tim vĩnh cửu, sản phẩm không chỉ tôn vinh sự ngọt ngào của tình yêu mà còn khuyến khích bạn sống thật với những cảm xúc của mình.\nMỗi thiết kế trong bộ sưu tập Bisous đều mang thông điệp sâu sắc: yêu là trao đi, yêu là nhận lại và yêu là sống trọn vẹn từng khoảnh khắc. Bông tai Bạc STYLE By PNJ, với chất liệu bạc tinh xảo và đá lấp lánh, là lựa chọn hoàn hảo để bạn thể hiện tình cảm trong những dịp đặc biệt.', 'IN_STOCK');
INSERT INTO `product` VALUES (11, NULL, '2025-05-02 20:43:23.000000', 130, NULL, 'Bạc', 'Bông tai Bạc đính đá STYLE By Bisous ZT00W000034', 'Bông tai Bạc đính đá STYLE By thuộc BST Bisous là một sản phẩm đầy lôi cuốn và trẻ trung, lấy cảm hứng từ biểu tượng \"Bisous\" (nụ hôn) trong tiếng Pháp, với ý nghĩa “1000 nụ hôn” – biểu trưng cho tình yêu ngọt ngào và mãnh liệt. Kết hợp cùng hình ảnh trái tim vĩnh cửu, sản phẩm không chỉ tôn vinh sự ngọt ngào của tình yêu mà còn khuyến khích bạn sống thật với những cảm xúc của mình.\nMỗi thiết kế trong bộ sưu tập Bisous đều mang thông điệp sâu sắc: yêu là trao đi, yêu là nhận lại và yêu là sống trọn vẹn từng khoảnh khắc. Bông tai Bạc STYLE By PNJ, với chất liệu bạc tinh xảo và đá lấp lánh, là lựa chọn hoàn hảo để bạn thể hiện tình cảm trong những dịp đặc biệt.', 'IN_STOCK');
INSERT INTO `product` VALUES (11, NULL, '2025-05-02 20:43:23.000000', 131, NULL, 'Bạc', 'Bông tai Bạc đính đá STYLE By Bisous ZTXMW000037', 'Bông tai Bạc đính đá STYLE By thuộc BST Bisous là một sản phẩm đầy lôi cuốn và trẻ trung, lấy cảm hứng từ biểu tượng \"Bisous\" (nụ hôn) trong tiếng Pháp, với ý nghĩa “1000 nụ hôn” – biểu trưng cho tình yêu ngọt ngào và mãnh liệt. Kết hợp cùng hình ảnh trái tim vĩnh cửu, sản phẩm không chỉ tôn vinh sự ngọt ngào của tình yêu mà còn khuyến khích bạn sống thật với những cảm xúc của mình.\nMỗi thiết kế trong bộ sưu tập Bisous đều mang thông điệp sâu sắc: yêu là trao đi, yêu là nhận lại và yêu là sống trọn vẹn từng khoảnh khắc. Bông tai Bạc STYLE By PNJ, với chất liệu bạc tinh xảo và đá lấp lánh, là lựa chọn hoàn hảo để bạn thể hiện tình cảm trong những dịp đặc biệt.', 'IN_STOCK');
INSERT INTO `product` VALUES (11, NULL, '2025-05-02 20:43:23.000000', 132, NULL, 'Bạc', 'Bông tai Bạc đính đá STYLE By Bisous ZT00H000007', 'Bông tai Bạc đính đá STYLE By thuộc BST Bisous là một sản phẩm đầy lôi cuốn và trẻ trung, lấy cảm hứng từ biểu tượng \"Bisous\" (nụ hôn) trong tiếng Pháp, với ý nghĩa “1000 nụ hôn” – biểu trưng cho tình yêu ngọt ngào và mãnh liệt. Kết hợp cùng hình ảnh trái tim vĩnh cửu, sản phẩm không chỉ tôn vinh sự ngọt ngào của tình yêu mà còn khuyến khích bạn sống thật với những cảm xúc của mình.\nMỗi thiết kế trong bộ sưu tập Bisous đều mang thông điệp sâu sắc: yêu là trao đi, yêu là nhận lại và yêu là sống trọn vẹn từng khoảnh khắc. Bông tai Bạc STYLE By PNJ, với chất liệu bạc tinh xảo và đá lấp lánh, là lựa chọn hoàn hảo để bạn thể hiện tình cảm trong những dịp đặc biệt.', 'IN_STOCK');
INSERT INTO `product` VALUES (11, NULL, '2025-05-02 20:43:23.000000', 133, NULL, 'Bạc', 'Bông tai Bạc đính đá STYLE By Bisous ZTXMH000016', 'Bông tai Bạc đính đá STYLE By thuộc BST Bisous là một sản phẩm đầy lôi cuốn và trẻ trung, lấy cảm hứng từ biểu tượng \"Bisous\" (nụ hôn) trong tiếng Pháp, với ý nghĩa “1000 nụ hôn” – biểu trưng cho tình yêu ngọt ngào và mãnh liệt. Kết hợp cùng hình ảnh trái tim vĩnh cửu, sản phẩm không chỉ tôn vinh sự ngọt ngào của tình yêu mà còn khuyến khích bạn sống thật với những cảm xúc của mình.\nMỗi thiết kế trong bộ sưu tập Bisous đều mang thông điệp sâu sắc: yêu là trao đi, yêu là nhận lại và yêu là sống trọn vẹn từng khoảnh khắc. Bông tai Bạc STYLE By PNJ, với chất liệu bạc tinh xảo và đá lấp lánh, là lựa chọn hoàn hảo để bạn thể hiện tình cảm trong những dịp đặc biệt.', 'IN_STOCK');
INSERT INTO `product` VALUES (12, NULL, '2025-05-02 20:43:26.000000', 168, NULL, 'Bạc', 'Hạt Charm Bạc STYLE By 0000Y060029', 'Xu hướng charm hiện nay vẫn được các cô gái ưa chuộng, thể hiện được cá tính của mỗi người và Charm STYLE By vẫn đề cao tính sáng tạo theo xu hướng này trong phong cách của các cô nàng.\nĐược chế tác từ chất liệu bạc cao cấp 92.5 cùng thiết kế phá cách, những hạt charm khi kết hợp với nhau tạo thành vòng tay charm hoàn chỉnh thể hiện cá tính của riêng mỗi người. Những sản phẩm thời trang STYLE By PNJ sẽ giúp nàng tự hào về bản thân hơn và còn góp phần làm sinh động thêm phong cách của mình.', 'IN_STOCK');
INSERT INTO `product` VALUES (12, NULL, '2025-05-02 20:43:26.000000', 169, NULL, 'Bạc', 'Hạt Charm Bạc đính đá STYLE By Bisous XM00W000076', 'Hạt Charm Bạc đính đá STYLE By là một món trang sức tinh tế thuộc Bộ sưu tập Bisous, mang đến vẻ đẹp lãng mạn và đầy cảm xúc. Lấy cảm hứng từ biểu tượng \"Bisous\" (nụ hôn) trong tiếng Pháp, với ý nghĩa “1000 nụ hôn” – biểu trưng cho tình yêu ngọt ngào và mãnh liệt, kết hợp với hình ảnh trái tim vĩnh cửu, đây không chỉ là món quà tuyệt vời cho những ai yêu thích sự tinh tế mà còn là lời nhắn nhủ về tình yêu đích thực.\nHạt Charm Bạc đính đá STYLE By là món quà tuyệt vời để gửi gắm những cảm xúc chân thành, đặc biệt trong những dịp ý nghĩa như Valentine. Hãy để \"Bisous và Trái Tim\" trở thành cầu nối để bạn tạo nên những kỷ niệm ngọt ngào và khó quên bên người mình yêu.', 'IN_STOCK');
INSERT INTO `product` VALUES (12, NULL, '2025-05-02 20:43:26.000000', 170, NULL, 'Bạc', 'Hạt Charm Bạc đính đá STYLE By Bisous XMXMW000058', 'Hạt Charm Bạc đính đá STYLE By là một món trang sức tinh tế thuộc Bộ sưu tập Bisous, mang đến vẻ đẹp lãng mạn và đầy cảm xúc. Lấy cảm hứng từ biểu tượng \"Bisous\" (nụ hôn) trong tiếng Pháp, với ý nghĩa “1000 nụ hôn” – biểu trưng cho tình yêu ngọt ngào và mãnh liệt, kết hợp với hình ảnh trái tim vĩnh cửu, đây không chỉ là món quà tuyệt vời cho những ai yêu thích sự tinh tế mà còn là lời nhắn nhủ về tình yêu đích thực.\nHạt Charm Bạc đính đá STYLE By là món quà tuyệt vời để gửi gắm những cảm xúc chân thành, đặc biệt trong những dịp ý nghĩa như Valentine. Hãy để \"Bisous và Trái Tim\" trở thành cầu nối để bạn tạo nên những kỷ niệm ngọt ngào và khó quên bên người mình yêu.', 'IN_STOCK');
INSERT INTO `product` VALUES (12, NULL, '2025-05-02 20:43:26.000000', 171, NULL, 'Bạc', 'Hạt Charm Bạc đính đá STYLE By Bisous ZTXMX000005', 'Hạt Charm Bạc đính đá STYLE By là một món trang sức tinh tế thuộc Bộ sưu tập Bisous, mang đến vẻ đẹp lãng mạn và đầy cảm xúc. Lấy cảm hứng từ biểu tượng \"Bisous\" (nụ hôn) trong tiếng Pháp, với ý nghĩa “1000 nụ hôn” – biểu trưng cho tình yêu ngọt ngào và mãnh liệt, kết hợp với hình ảnh trái tim vĩnh cửu, đây không chỉ là món quà tuyệt vời cho những ai yêu thích sự tinh tế mà còn là lời nhắn nhủ về tình yêu đích thực.\nHạt Charm Bạc đính đá STYLE By là món quà tuyệt vời để gửi gắm những cảm xúc chân thành, đặc biệt trong những dịp ý nghĩa như Valentine. Hãy để \"Bisous và Trái Tim\" trở thành cầu nối để bạn tạo nên những kỷ niệm ngọt ngào và khó quên bên người mình yêu.', 'IN_STOCK');
INSERT INTO `product` VALUES (13, NULL, '2025-05-02 20:43:26.000000', 172, NULL, 'Vàng 24K', 'Hạt Charm Vàng 24K 12 con giáp 0000Y060355', 'Hạt charm vàng 24K là món trang sức độc đáo, tinh xảo, mang đậm vẻ đẹp của sự sang trọng và may mắn. Được chế tác từ vàng 24K, không chỉ đảm bảo độ bền bỉ mà còn tỏa sáng với màu vàng rực rỡ, thu hút mọi ánh nhìn.\nHạt charm sở hữu thiết kế hình chuột lại mang ý nghĩa về sự thông minh, nhanh nhẹn và tài lộc, là biểu tượng của sự may mắn và thành công trong công việc. Hạt charm này có thể kết hợp với dây chuyền, vòng tay hay các món trang sức khác để tạo nên một bộ trang sức hoàn hảo, vừa tinh tế, vừa mang đậm ý nghĩa may mắn, thịnh vượng.', 'IN_STOCK');
INSERT INTO `product` VALUES (13, NULL, '2025-05-02 20:43:26.000000', 173, NULL, 'Vàng 24K', 'Hạt Charm Vàng 24K 12 con giáp 0000Y060356', 'Hạt charm vàng 24K là món trang sức độc đáo, tinh xảo, mang đậm vẻ đẹp của sự sang trọng và may mắn. Được chế tác từ vàng 24K, không chỉ đảm bảo độ bền bỉ mà còn tỏa sáng với màu vàng rực rỡ, thu hút mọi ánh nhìn.\nHạt charm sở hữu thiết kế hình tuổi sửu là biểu tượng của sự cần cù, chăm chỉ và kiên nhẫn, giúp gia chủ đạt được thành công qua sự nỗ lực không ngừng nghỉ. Hạt charm này có thể kết hợp với dây chuyền, vòng tay hay các món trang sức khác để tạo nên một bộ trang sức hoàn hảo, vừa tinh tế, vừa mang đậm ý nghĩa may mắn, thịnh vượng.', 'IN_STOCK');
INSERT INTO `product` VALUES (13, NULL, '2025-05-02 20:43:26.000000', 174, NULL, 'Vàng 24K', 'Hạt Charm Vàng 24K 12 con giáp 0000Y060357', 'Hạt charm vàng 24K là món trang sức độc đáo, tinh xảo, mang đậm vẻ đẹp của sự sang trọng và may mắn. Được chế tác từ vàng 24K, không chỉ đảm bảo độ bền bỉ mà còn tỏa sáng với màu vàng rực rỡ, thu hút mọi ánh nhìn.\nHạt charm sở hữu thiết kế hình hổ là biểu tượng của sức mạnh, dũng cảm và quyền lực, phù hợp cho những ai muốn tìm kiếm sự tự tin và mạnh mẽ trong cuộc sống.. Hạt charm này có thể kết hợp với dây chuyền, vòng tay hay các món trang sức khác để tạo nên một bộ trang sức hoàn hảo, vừa tinh tế, vừa mang đậm ý nghĩa may mắn, thịnh vượng.', 'IN_STOCK');
INSERT INTO `product` VALUES (13, NULL, '2025-05-02 20:43:26.000000', 175, NULL, 'Vàng 24K', 'Hạt Charm Vàng 24K 12 con giáp 0000Y060358', 'Hạt charm vàng 24K là món trang sức độc đáo, tinh xảo, mang đậm vẻ đẹp của sự sang trọng và may mắn. Được chế tác từ vàng 24K, không chỉ đảm bảo độ bền bỉ mà còn tỏa sáng với màu vàng rực rỡ, thu hút mọi ánh nhìn.\nHạt charm sở hữu thiết kế hình mèo mang đến sự dễ thương, may mắn và bảo vệ, với hình ảnh con mèo luôn gắn liền với sự duyên dáng và thần thái tựa như biểu tượng của sự giàu có và phú quý. Hạt charm này có thể kết hợp với dây chuyền, vòng tay hay các món trang sức khác để tạo nên một bộ trang sức hoàn hảo, vừa tinh tế, vừa mang đậm ý nghĩa may mắn, thịnh vượng.', 'IN_STOCK');
INSERT INTO `product` VALUES (13, NULL, '2025-05-02 20:43:26.000000', 176, NULL, 'Vàng 24K', 'Hạt Charm Vàng 24K 12 con giáp 0000Y060359', 'Hạt charm vàng 24K là món trang sức độc đáo, tinh xảo, mang đậm vẻ đẹp của sự sang trọng và may mắn. Được chế tác từ vàng 24K, không chỉ đảm bảo độ bền bỉ mà còn tỏa sáng với màu vàng rực rỡ, thu hút mọi ánh nhìn.\nVới thiết kế hình con rồng, biểu tượng của sức mạnh, quyền lực và sự may mắn trong văn hóa phương Đông, sản phẩm này không chỉ mang đến vẻ đẹp sang trọng mà còn thể hiện sự uy nghi, quyền quý của người sở hữu. Charm vàng như một phụ kiện trang sức cho vòng tay, dây chuyền hay bất kỳ món đồ trang sức nào, tạo nên điểm nhấn ấn tượng cho phong cách cá nhân.', 'IN_STOCK');
INSERT INTO `product` VALUES (13, NULL, '2025-05-02 20:43:26.000000', 177, NULL, 'Vàng 24K', 'Hạt Charm Vàng 24K 12 con giáp 0000Y060360', 'Hạt charm vàng 24K là món trang sức độc đáo, tinh xảo, mang đậm vẻ đẹp của sự sang trọng và may mắn. Được chế tác từ vàng 24K, không chỉ đảm bảo độ bền bỉ mà còn tỏa sáng với màu vàng rực rỡ, thu hút mọi ánh nhìn.\nThiết kế hình con rắn mang ý nghĩa biểu trưng cho sự tái sinh, sức mạnh và trí tuệ. Hạt charm này có thể được sử dụng để kết hợp với dây chuyền, vòng tay, hoặc các trang sức khác, tạo nên một bộ trang sức cá tính và độc đáo, phù hợp với nhiều phong cách khác nhau.', 'IN_STOCK');
INSERT INTO `product` VALUES (13, NULL, '2025-05-02 20:43:26.000000', 181, NULL, 'Vàng 24K', 'Hạt Charm Vàng 24K Turning Gold 0000Y000608', 'Xu hướng charm hiện nay vẫn được các cô gái ưa chuộng để thể hiện cá tính của bản thân. Trang sức Charm vẫn đề cao tính sáng tạo cũng như vẻ sang trọng trong phong cách từ chế tác vàng 24K.\nVới hạt charm trẻ trung và thời thượng, ngoài vòng tay, nàng còn có thể kết hợp với dây chuyền để tạo nên bộ đôi trang sức thời trang và phong cách. Bộ đôi này sẽ giúp nàng tự hào về bản thân hơn và còn góp phần làm sinh động thêm phong cách của mình.', 'IN_STOCK');
INSERT INTO `product` VALUES (14, NULL, '2025-05-02 20:43:27.000000', 216, NULL, 'Vàng trắng', 'Dây chuyền Vàng trắng Ý 18K 0000W061325', 'Bằng việc kết hợp chất liệu vàng 18K cùng thiết kế tinh tế, sợi dây chuyền chính là điểm nhấn nổi bật, tô điểm thêm vẻ đẹp thanh lịch và duyên dáng cho nàng. Dây đeo mảnh thích hợp với những bộ trang phục có nhiều họa tiết, đồng thời tạo điểm nhìn cân bằng với các phụ kiện to bản khác.\nDù diện lên bộ cánh dạ tiệc hay đơn giản là oufit thường ngày, chiếc dây chuyền sẽ tạo điểm nhấn tuyệt đối xung quanh xương quai xanh và khơi gợi ánh nhìn xung quanh.', 'IN_STOCK');
INSERT INTO `product` VALUES (14, NULL, '2025-05-02 20:43:27.000000', 217, NULL, 'Vàng trắng', 'Dây chuyền Vàng trắng Ý 18K 0000W061328', 'Bằng việc kết hợp chất liệu vàng 18K cùng thiết kế tinh tế, sợi dây chuyền chính là điểm nhấn nổi bật, tô điểm thêm vẻ đẹp thanh lịch và duyên dáng cho nàng. Dây đeo mảnh thích hợp với những bộ trang phục có nhiều họa tiết, đồng thời tạo điểm nhìn cân bằng với các phụ kiện to bản khác.\nDù diện lên bộ cánh dạ tiệc hay đơn giản là oufit thường ngày, chiếc dây chuyền sẽ tạo điểm nhấn tuyệt đối xung quanh xương quai xanh và khơi gợi ánh nhìn xung quanh.', 'IN_STOCK');
INSERT INTO `product` VALUES (14, NULL, '2025-05-02 20:43:27.000000', 218, NULL, 'Vàng trắng', 'Dây chuyền Vàng trắng Ý 18K 0000W061331', 'Bằng việc kết hợp chất liệu vàng 18K cùng thiết kế tinh tế, sợi dây chuyền chính là điểm nhấn nổi bật, tô điểm thêm vẻ đẹp thanh lịch và duyên dáng cho nàng. Dây đeo mảnh thích hợp với những bộ trang phục có nhiều họa tiết, đồng thời tạo điểm nhìn cân bằng với các phụ kiện to bản khác.\nDù diện lên bộ cánh dạ tiệc hay đơn giản là oufit thường ngày, chiếc dây chuyền sẽ tạo điểm nhấn tuyệt đối xung quanh xương quai xanh và khơi gợi ánh nhìn xung quanh.', 'IN_STOCK');
INSERT INTO `product` VALUES (14, NULL, '2025-05-02 20:43:27.000000', 219, NULL, 'Vàng trắng', 'Dây chuyền Vàng trắng Ý 18K 0000W061333', 'Bằng việc kết hợp chất liệu vàng 18K cùng thiết kế tinh tế, sợi dây chuyền chính là điểm nhấn nổi bật, tô điểm thêm vẻ đẹp thanh lịch và duyên dáng cho nàng. Dây đeo mảnh thích hợp với những bộ trang phục có nhiều họa tiết, đồng thời tạo điểm nhìn cân bằng với các phụ kiện to bản khác.\nDù diện lên bộ cánh dạ tiệc hay đơn giản là oufit thường ngày, chiếc dây chuyền sẽ tạo điểm nhấn tuyệt đối xung quanh xương quai xanh và khơi gợi ánh nhìn xung quanh.', 'IN_STOCK');
INSERT INTO `product` VALUES (14, NULL, '2025-05-02 20:43:27.000000', 220, NULL, 'Vàng trắng', 'Dây chuyền Vàng trắng Ý 18K 0000W061330', 'Bằng việc kết hợp chất liệu vàng 18K cùng thiết kế tinh tế, sợi dây chuyền chính là điểm nhấn nổi bật, tô điểm thêm vẻ đẹp thanh lịch và duyên dáng cho nàng. Dây đeo mảnh thích hợp với những bộ trang phục có nhiều họa tiết, đồng thời tạo điểm nhìn cân bằng với các phụ kiện to bản khác.\nDù diện lên bộ cánh dạ tiệc hay đơn giản là oufit thường ngày, chiếc dây chuyền sẽ tạo điểm nhấn tuyệt đối xung quanh xương quai xanh và khơi gợi ánh nhìn xung quanh.', 'IN_STOCK');
INSERT INTO `product` VALUES (14, NULL, '2025-05-02 20:43:27.000000', 221, NULL, 'Vàng trắng', 'Dây chuyền Vàng trắng Ý 18K 0000W061332', 'Bằng việc kết hợp chất liệu vàng 18K cùng thiết kế tinh tế, sợi dây chuyền chính là điểm nhấn nổi bật, tô điểm thêm vẻ đẹp thanh lịch và duyên dáng cho nàng. Dây đeo mảnh thích hợp với những bộ trang phục có nhiều họa tiết, đồng thời tạo điểm nhìn cân bằng với các phụ kiện to bản khác.\nDù diện lên bộ cánh dạ tiệc hay đơn giản là oufit thường ngày, chiếc dây chuyền sẽ tạo điểm nhấn tuyệt đối xung quanh xương quai xanh và khơi gợi ánh nhìn xung quanh.', 'IN_STOCK');
INSERT INTO `product` VALUES (14, NULL, '2025-05-02 20:43:27.000000', 222, NULL, 'Vàng trắng', 'Dây chuyền Vàng trắng Ý 18K 0000W001418', 'Bằng việc kết hợp chất liệu vàng 18K cùng thiết kế tinh tế, sợi dây chuyền chính là điểm nhấn nổi bật, tô điểm thêm vẻ đẹp thanh lịch và duyên dáng cho nàng. Dây đeo mảnh thích hợp với những bộ trang phục có nhiều họa tiết, đồng thời tạo điểm nhìn cân bằng với các phụ kiện to bản khác.\nDù diện lên bộ cánh dạ tiệc hay đơn giản là oufit thường ngày, chiếc dây chuyền sẽ tạo điểm nhấn tuyệt đối xung quanh xương quai xanh và khơi gợi ánh nhìn xung quanh.', 'IN_STOCK');
INSERT INTO `product` VALUES (14, NULL, '2025-05-02 20:43:27.000000', 223, NULL, 'Vàng trắng', 'Dây chuyền Vàng trắng Ý 18K 0000W001419', 'Bằng việc kết hợp chất liệu vàng 18K cùng thiết kế tinh tế, sợi dây chuyền chính là điểm nhấn nổi bật, tô điểm thêm vẻ đẹp thanh lịch và duyên dáng cho nàng. Dây đeo mảnh thích hợp với những bộ trang phục có nhiều họa tiết, đồng thời tạo điểm nhìn cân bằng với các phụ kiện to bản khác.\nDù diện lên bộ cánh dạ tiệc hay đơn giản là oufit thường ngày, chiếc dây chuyền sẽ tạo điểm nhấn tuyệt đối xung quanh xương quai xanh và khơi gợi ánh nhìn xung quanh.', 'IN_STOCK');
INSERT INTO `product` VALUES (14, NULL, '2025-05-02 20:43:27.000000', 224, NULL, 'Vàng trắng', 'Dây chuyền Vàng trắng Ý 18K 0000W061327', 'Bằng việc kết hợp chất liệu vàng 18K cùng thiết kế tinh tế, sợi dây chuyền chính là điểm nhấn nổi bật, tô điểm thêm vẻ đẹp thanh lịch và duyên dáng cho nàng. Dây đeo mảnh thích hợp với những bộ trang phục có nhiều họa tiết, đồng thời tạo điểm nhìn cân bằng với các phụ kiện to bản khác.\nDù diện lên bộ cánh dạ tiệc hay đơn giản là oufit thường ngày, chiếc dây chuyền sẽ tạo điểm nhấn tuyệt đối xung quanh xương quai xanh và khơi gợi ánh nhìn xung quanh.', 'IN_STOCK');
INSERT INTO `product` VALUES (15, NULL, '2025-05-02 20:43:27.000000', 230, NULL, 'Bạc', 'Dây chuyền bạc PNJSilver 0000W060003', 'Trọng lượng tham khảo:  49.92933 phân\nHàm lượng chất liệu:  9250\nLoại đá chính:  Không gắn đá\nLoại đá phụ:  Không gắn đá\nGiới tính:  Nữ\nThương hiệu:  PNJSilver', 'IN_STOCK');
INSERT INTO `product` VALUES (15, NULL, '2025-05-02 20:43:27.000000', 231, NULL, 'Bạc', 'Dây chuyền Bạc Ý PNJSilver 0000W060009', 'Trọng lượng tham khảo:  52.12 phân\nHàm lượng chất liệu:  9250\nLoại đá chính:  Không gắn đá\nLoại đá phụ:  Không gắn đá\nThương hiệu:  PNJSilver', 'IN_STOCK');
INSERT INTO `product` VALUES (16, NULL, '2025-05-02 20:43:27.000000', 240, NULL, 'Bạch kim', 'Dây chuyền Bạch kim 0000W060020', 'Trọng lượng tham khảo:  7.99314 phân\nHàm lượng chất liệu:  9500\nLoại đá chính:  Không gắn đá\nLoại đá phụ:  Không gắn đá\nGiới tính:  Nữ\nThương hiệu:  PNJ', 'IN_STOCK');
INSERT INTO `product` VALUES (16, NULL, '2025-05-02 20:43:27.000000', 241, NULL, 'Bạch kim', 'Dây chuyền Bạch kim 0000W060021', 'Trọng lượng tham khảo:  6.69484 phân\nHàm lượng chất liệu:  9500\nLoại đá chính:  Không gắn đá\nLoại đá phụ:  Không gắn đá\nGiới tính:  Nữ\nThương hiệu:  PNJ', 'IN_STOCK');
INSERT INTO `product` VALUES (16, NULL, '2025-05-02 20:43:27.000000', 242, NULL, 'Bạch kim', 'Dây chuyền Bạch kim 0000W060022', 'Trọng lượng tham khảo:  10.28404 phân\nHàm lượng chất liệu:  9500\nLoại đá chính:  Không gắn đá\nLoại đá phụ:  Không gắn đá\nGiới tính:  Nữ\nThương hiệu:  PNJ', 'IN_STOCK');
INSERT INTO `product` VALUES (16, NULL, '2025-05-02 20:43:27.000000', 243, NULL, 'Bạch kim', 'Dây chuyền Bạch kim 0000W060023', 'Trọng lượng tham khảo:  7.26348 phân\nHàm lượng chất liệu:  9500\nLoại đá chính:  Không gắn đá\nLoại đá phụ:  Không gắn đá\nGiới tính:  Nữ\nThương hiệu:  PNJ', 'IN_STOCK');
INSERT INTO `product` VALUES (16, NULL, '2025-05-02 20:43:27.000000', 244, NULL, 'Bạch kim', 'Dây chuyền Bạch kim 0000W060007', 'Trọng lượng tham khảo:  6.06179 phân\nHàm lượng chất liệu:  9500\nLoại đá chính:  Không gắn đá\nLoại đá phụ:  Không gắn đá\nGiới tính:  Nữ\nThương hiệu:  PNJ', 'IN_STOCK');
INSERT INTO `product` VALUES (17, NULL, '2025-05-02 20:43:28.000000', 248, NULL, 'Bạc', 'Dây cổ Bạc đính đá PNJSilver XMXMW060176', 'PNJSilver xin giới thiệu đến bạn phiên bản trang sức đặc sắc với một chế tác từ chất liệu bạc 92.5, điểm xuyến bởi viên đá thời trang và đầy tính sáng tạo. Sự sắp xếp các viên đá trên chiếc dây cổ tựa như những nốt nhạc tạo nên bản hợp xướng êm dịu và bay bổng.\nĐặc biệt hơn, chiếc dây cổ sẽ trở nên ý nghĩa hơn khi trở thành món quà ghi dấu yêu thương vào những dịp quan trọng. Đây chắc chắn sẽ là thứ giúp bạn gắn kết những khoảnh khắc đáng nhớ với mình hoặc người thương.', 'IN_STOCK');
INSERT INTO `product` VALUES (17, NULL, '2025-05-02 20:43:28.000000', 249, NULL, 'Bạc', 'Dây cổ Bạc đính đá PNJSilver hình trái tim XMXMW060177', 'PNJSilver xin giới thiệu đến bạn phiên bản trang sức đặc sắc với một chế tác từ chất liệu bạc 92.5, điểm xuyến bởi viên đá thời trang và đầy tính sáng tạo. Sự sắp xếp các viên đá trên chiếc dây cổ tựa như những nốt nhạc tạo nên bản hợp xướng êm dịu và bay bổng.\nĐặc biệt hơn, chiếc dây cổ sẽ trở nên ý nghĩa hơn khi trở thành món quà ghi dấu yêu thương vào những dịp quan trọng. Đây chắc chắn sẽ là thứ giúp bạn gắn kết những khoảnh khắc đáng nhớ với mình hoặc người thương.', 'IN_STOCK');
INSERT INTO `product` VALUES (17, NULL, '2025-05-02 20:43:28.000000', 250, NULL, 'Bạc', 'Dây cổ Bạc đính đá PNJSilver hình trái tim XMXMW060178', 'PNJSilver xin giới thiệu đến bạn phiên bản trang sức đặc sắc với một chế tác từ chất liệu bạc 92.5, điểm xuyến bởi viên đá thời trang và đầy tính sáng tạo. Sự sắp xếp các viên đá trên chiếc dây cổ tựa như những nốt nhạc tạo nên bản hợp xướng êm dịu và bay bổng.\nĐặc biệt hơn, chiếc dây cổ sẽ trở nên ý nghĩa hơn khi trở thành món quà ghi dấu yêu thương vào những dịp quan trọng. Đây chắc chắn sẽ là thứ giúp bạn gắn kết những khoảnh khắc đáng nhớ với mình hoặc người thương.', 'IN_STOCK');
INSERT INTO `product` VALUES (18, NULL, '2025-05-02 20:43:28.000000', 261, NULL, 'Vàng trắng', 'Dây cổ Kim cương Vàng trắng 18K DDDDW060185', 'Hãy để các chất liệu kết hợp cùng nhau trong mùa thời trang mới này. Nàng có thể chọn cho mình chiếc dây cổ được chế tác từ vàng 18K và ghi điểm với điểm nhấn kim cương đính một cách tinh xảo. Và chắc chắn rằng, chiếc dây cổ sẽ làm nổi bật vẻ đẹp kiêu sa của nàng.\nSức hút riêng của thiết kế được kết tạo từ điểm nhấn kim cương cực kì đẳng cấp với 57 giác cắt chuẩn xác, tạo nên sự tán sắc độc đáo, lấp lánh chinh phục mọi ánh nhìn. tự hào mang đến những mẫu trang sức đính đá tinh tế, giúp bạn có nhiều sự lựa chọn cho phong cách của mình.', 'IN_STOCK');
INSERT INTO `product` VALUES (18, NULL, '2025-05-02 20:43:28.000000', 262, NULL, 'Vàng 10K', 'Dây cổ Vàng 10K Đính đá Synthetic STYLE By Bisous ZTXMY000114', 'Tôn vinh vẻ đẹp kiêu sa của quý cô, chiếc dây cổ vàng 10K chắc chắn sẽ là điểm nhấn cho cả outfit. Sức hút riêng của thiết kế được kết tạo từ thiết kế cực kì duyên dáng với điểm nhấn cách điệu tinh xảo, tạo nên sản phẩm tinh tế chinh phục mọi ánh nhìn.\nSTYLE By tự hào mang đến những mẫu trang sức tinh tế, giúp bạn có nhiều sự lựa chọn cho phong cách của mình. Bằng tất thảy sự trân trọng và cảm xúc dành riêng cho phái đẹp, từng chi tiết đều được các nghệ nhân STYLE By nâng niu và cẩn trọng, đặt trọn vào những thiết kế trang sức xứng tầm.', 'IN_STOCK');
INSERT INTO `product` VALUES (18, NULL, '2025-05-02 20:43:28.000000', 266, NULL, 'Vàng trắng', 'Dây cổ Kim cương Vàng trắng 14K DDDDW000787', 'Hãy để các chất liệu kết hợp cùng nhau trong mùa thời trang mới này. Nàng có thể chọn cho mình chiếc dây cổ được chế tác từ vàng 14K và ghi điểm với điểm nhấn kim cương đính một cách tinh xảo. Và chắc chắn rằng, chiếc dây cổ sẽ làm nổi bật vẻ đẹp kiêu sa của nàng.\nSức hút riêng của thiết kế được kết tạo từ điểm nhấn kim cương cực kì đẳng cấp với 57 giác cắt chuẩn xác, tạo nên sự tán sắc độc đáo, lấp lánh chinh phục mọi ánh nhìn. tự hào mang đến những mẫu trang sức đính đá tinh tế, giúp bạn có nhiều sự lựa chọn cho phong cách của mình.', 'IN_STOCK');
INSERT INTO `product` VALUES (18, NULL, '2025-05-02 20:43:28.000000', 267, NULL, 'Vàng trắng', 'Dây cổ Vàng trắng 14K đính đá ECZ XMXMW000501', 'Không phải ngẫu nhiên mà trang sức vàng 14K được nhiều người ưa chuộng. Chiếc dây cổ vàng được chế tác từ vàng 14K và ghi điểm với sự lộng lẫy của những viên đá ECZ, sẽ cùng nàng kiêu hãnh tỏa sáng trên mọi bước đường. Sở hữu kiểu dáng mảnh mai, sản phẩm sẽ làm nổi bật vẻ đẹp kiêu sa của nàng.\nVới sự bứt phá mới mẻ cùng sự sáng tạo trong thiết kế, chiếc dây cổ này sẽ thổi làn gió thời trang đa dạng cho quý cô dễ dàng phối chọn cùng những mẫu trang sức khác, từ đó khẳng định phong cách của chính mình.', 'IN_STOCK');
INSERT INTO `product` VALUES (19, NULL, '2025-05-02 20:43:29.000000', 296, NULL, 'Vàng 24K', 'Kiềng cưới Vàng 24K 0000Y060000', 'Chiếc kiềng cưới sở hữu sự cứng cáp của vàng 24K được chế tác tinh xảo, kết hợp các chi tiết chạm khắc tinh tế, tạo nên sự sáng bóng và sang trọng. Với một mặt có họa tiết và một mặt trơn, các nàng dâu có thể đeo theo 2 kiểu khác nhau phù hợp với trang phục trong ngày cưới.\nĐể tăng thêm lựa chọn trang sức, mang đến các mẫu kiềng mang kiểu dáng thanh lịch và mang tính ứng dụng cao, do đó ngoài việc dùng cho ngày cưới, nàng còn có thể đeo hàng ngày, phối hợp với nhiều trang phục khác nhau.', 'IN_STOCK');
INSERT INTO `product` VALUES (19, NULL, '2025-05-02 20:43:29.000000', 297, NULL, 'Vàng 24K', 'Kiềng cưới Vàng 24K 0000Y060001', '', 'IN_STOCK');
INSERT INTO `product` VALUES (19, NULL, '2025-05-02 20:43:29.000000', 298, NULL, 'Vàng 24K', 'Kiềng cưới Vàng 24K 0000Y060009', '', 'IN_STOCK');
INSERT INTO `product` VALUES (20, NULL, '2025-05-02 20:43:29.000000', 299, NULL, 'Bạc', 'Kiềng bạc Ý PNJSilver kiểu đai xoắn tròn 0000W060015', 'Kiềng bạc sở hữu thiết kế độc đáo, được hiện đại hóa và khoác lên mình tính thời trang, phóng khoáng. Chế tác từ chất liệu bạc Ý, chiếc kiềng PNJSilver sở hữu vẻ đẹp của sự trẻ trung phù hợp với phong cách của những modern girl.\nChiếc kiềng bạc Ý từ trước đến nay vẫn luôn được ưa chuộng với gam màu sáng nổi bật, dễ dàng kết hợp với các bộ trang phục khác nhau. Hơn nữa, với rất nhiều các mẫu mã kiểu dáng thiết kế đẹp mắt, các cô gái ngày nay đã có thể tự sáng tạo nên một phong cách cho riêng mình.', 'IN_STOCK');
INSERT INTO `product` VALUES (21, NULL, '2025-05-02 20:43:30.000000', 313, NULL, 'Bạc', 'Lắc tay Bạc đính đá STYLE By XMXMW060262', 'Chiếc lắc tay từ STYLE By được chế tác từ bạc mang tính ứng dụng cao kết hợp kiểu dáng phá cách. Điều này giúp sản phẩm thổi màu thời thượng và cá tính vào phong cách của các bạn trẻ. Cũng vì tính ứng dụng cao mà hiện nay, bạc đang được đông đảo chị em ưa chuộng.\nMột chiếc vòng tay hay chiếc lắc bạc nhỏ xinh sẽ là những phụ kiện ưu tiên hàng đầu của các nàng. Sở hữu thiết kế đính đính đá khi kết hợp cùng những bộ cánh dạo phố hay tiệc tùng, STYLE By tin chắc rằng, nàng sẽ trông thật sự nổi bật và thu hút sự chú ý xung quanh.', 'IN_STOCK');
INSERT INTO `product` VALUES (21, NULL, '2025-05-02 20:43:30.000000', 314, NULL, 'Bạc', 'Lắc tay Bạc đính đá PNJSilver XMXMW060215', 'Sở hữu kiểu dáng không quá xa lạ nhưng lại cực kỳ độc đáo, chiếc lắc tay PNJSilver được chế tác từ chất liệu bạc 92.5 khoác lên mình vẻ ngoài trẻ trung, phá cách và “high fashion”.\nĐiểm tô cho cổ tay nàng với chiếc lắc bạc xinh xắn, đây chắc chắn sẽ là một nét chấm phá tinh tế tô điểm thêm nét cá tính, năng động và trẻ trung cho các cô gái. Tuy chỉ sở hữu thiết kế đơn giản với điểm nhấn đính đá nho nhỏ, nhưng nó lại là phụ kiện giúp các cô nàng có vẻ ngoài thanh lịch, nữ tính và trở nên nổi bật hơn bao giờ hết.', 'IN_STOCK');
INSERT INTO `product` VALUES (21, NULL, '2025-05-02 20:43:30.000000', 315, NULL, 'Bạc', 'Lắc tay charm Bạc đính đá PNJSilver ZTXMW060004', 'Sở hữu kiểu dáng không quá xa lạ nhưng lại cực kỳ độc đáo, chiếc lắc tay PNJSilver được chế tác từ chất liệu bạc 92.5 khoác lên mình vẻ ngoài trẻ trung, phá cách và “high fashion”.\nĐiểm tô cho cổ tay nàng với chiếc lắc bạc xinh xắn, đây chắc chắn sẽ là một nét chấm phá tinh tế tô điểm thêm nét cá tính, năng động và trẻ trung cho các cô gái. Tuy chỉ sở hữu thiết kế đơn giản với điểm nhấn đính đá nho nhỏ, nhưng nó lại là phụ kiện giúp các cô nàng có vẻ ngoài thanh lịch, nữ tính và trở nên nổi bật hơn bao giờ hết.', 'IN_STOCK');
INSERT INTO `product` VALUES (22, NULL, '2025-05-02 20:43:30.000000', 316, NULL, 'Vàng 24K', 'Lắc tay Vàng 24K Turning Gold 0000Y004354', 'Vừa mang nét cổ điển nhưng lại có một chút sự hiện đại bởi sự rành mạch trong đường nét, lại giữ được sự mềm mại và ngẫu hứng giữa vàng 24K cùng thiết kế độc đáo - chiếc lắc tay khoác lên sự thanh lịch và gây ấn tượng như người phụ nữ trưởng thành với phong cách tao nhã.\nThêm vào đó, với thiết kế hình bướm, chiếc lắc tay còn là món quà dành tặng cho các cô gái. Với các điểm nhấn trên sản phẩm, tin rằng nàng sẽ trở nên thật sự tỏa sáng và nổi bật khi trưng diện chúng.', 'IN_STOCK');
INSERT INTO `product` VALUES (22, NULL, '2025-05-02 20:43:30.000000', 317, NULL, 'Vàng 24K', 'Lắc tay Vàng 24K Turning Gold 0000Y004358', 'Vừa mang nét cổ điển nhưng lại có một chút sự hiện đại bởi sự rành mạch trong đường nét, lại giữ được sự mềm mại và ngẫu hứng giữa vàng 24K cùng thiết kế độc đáo - chiếc lắc tay khoác lên sự thanh lịch và gây ấn tượng như người phụ nữ trưởng thành với phong cách tao nhã.\nThêm vào đó, với thiết kế cổ điển, chiếc lắc tay còn là món quà dành tặng cho các cô gái. Bên cạnh đó, đây không chỉ là trang sức mà còn là vật phẩm tích lũy cho tương lai.', 'IN_STOCK');
INSERT INTO `product` VALUES (21, NULL, '2025-05-02 20:43:30.000000', 319, NULL, 'Bạc', 'Lắc tay Bạc đính đá PNJSilver hình chiếc nơ XMXMW060241', 'Sở hữu kiểu dáng không quá xa lạ nhưng lại cực kỳ độc đáo, chiếc lắc tay PNJSilver được chế tác từ chất liệu bạc 92.5 khoác lên mình vẻ ngoài trẻ trung, phá cách và “high fashion”.\nĐiểm tô cho cổ tay nàng với chiếc lắc bạc xinh xắn, đây chắc chắn sẽ là một nét chấm phá tinh tế tô điểm thêm nét cá tính, năng động và trẻ trung cho các cô gái. Tuy chỉ sở hữu thiết kế đơn giản với điểm nhấn đính đá nho nhỏ, nhưng nó lại là phụ kiện giúp các cô nàng có vẻ ngoài thanh lịch, nữ tính và trở nên nổi bật hơn bao giờ hết.', 'IN_STOCK');
INSERT INTO `product` VALUES (21, NULL, '2025-05-02 20:43:30.000000', 320, NULL, 'Bạc', 'Lắc tay Bạc đính đá PNJSilver hình trái tim XMXMW060242', 'Sở hữu kiểu dáng không quá xa lạ nhưng lại cực kỳ độc đáo, chiếc lắc tay PNJSilver được chế tác từ chất liệu bạc 92.5 khoác lên mình vẻ ngoài trẻ trung, phá cách và “high fashion”.\nĐiểm tô cho cổ tay nàng với chiếc lắc bạc xinh xắn, đây chắc chắn sẽ là một nét chấm phá tinh tế tô điểm thêm nét cá tính, năng động và trẻ trung cho các cô gái. Tuy chỉ sở hữu thiết kế đơn giản với điểm nhấn đính đá nho nhỏ, nhưng nó lại là phụ kiện giúp các cô nàng có vẻ ngoài thanh lịch, nữ tính và trở nên nổi bật hơn bao giờ hết.', 'IN_STOCK');
INSERT INTO `product` VALUES (22, NULL, '2025-05-02 20:43:30.000000', 329, NULL, 'Vàng 10K', 'Lắc tay Vàng 10K đính đá Synthetic STYLE By Bisous ZTXMH000026', 'Lắc tay Vàng 10K Đính đá Synthetic STYLE By là món trang sức tinh tế, mang đến vẻ đẹp sang trọng và đầy lãng mạn. Chiếc lắc tay thuộc BST Bisous, lấy cảm hứng từ biểu tượng Bisous (nụ hôn) trong tiếng Pháp, với ý nghĩa “1000 nụ hôn” – biểu tượng của tình yêu mãnh liệt và đầy ngọt ngào.\nĐược chế tác từ chất liệu vàng 10K kết hợp sắc đá yêu kiều của Synthetic, chiếc lắc tay STYLE By không chỉ đơn giản là món trang sức mà còn là món quà yêu thương dành tặng cho người phụ nữ bạn yêu.', 'IN_STOCK');
INSERT INTO `product` VALUES (22, NULL, '2025-05-02 20:43:30.000000', 332, NULL, 'Vàng 14K', 'Lắc tay Vàng 14K 0000Y060888', 'Chiếc lắc tay sở hữu sự cứng cáp của vàng 14K được chế tác tinh xảo, kết hợp các chi tiết chạm khắc tinh xảo, tạo nên sự sáng bóng và sang trọng. Với thiết kế độc lạ cùng ánh kim sắc sảo, sản phẩm sẽ tôn lên vẻ đẹp của các quý cô.\nThêm vào đó, với thiết kế tinh xảo, nàng sẽ bất ngờ khi phối với các bộ trang phục như suit công sở hay những chiếc đầm dạo phố. Với các điểm nhấn trên sản phẩm, tin rằng nàng sẽ trở nên thật sự tỏa sáng và nổi bật khi trưng diện chúng.', 'IN_STOCK');
INSERT INTO `product` VALUES (22, NULL, '2025-05-02 20:43:30.000000', 334, NULL, 'Vàng 10K', 'Lắc tay Vàng 10K Đính đá Synthetic STYLE By Bisous ZTXMY000144', 'Lắc tay Vàng 10K Đính đá Synthetic STYLE By là món trang sức tinh tế, mang đến vẻ đẹp sang trọng và đầy lãng mạn. Chiếc lắc tay thuộc BST Bisous, lấy cảm hứng từ biểu tượng Bisous (nụ hôn) trong tiếng Pháp, với ý nghĩa “1000 nụ hôn” – biểu tượng của tình yêu mãnh liệt và đầy ngọt ngào.\nĐược chế tác từ chất liệu vàng 10K kết hợp sắc đá yêu kiều của Synthetic, chiếc lắc tay STYLE By không chỉ đơn giản là món trang sức mà còn là món quà yêu thương dành tặng cho người phụ nữ bạn yêu.', 'IN_STOCK');
INSERT INTO `product` VALUES (22, NULL, '2025-05-02 20:43:30.000000', 338, NULL, 'Vàng trắng', 'Lắc tay Vàng trắng Ý 18K 0000W061038', 'Chiếc lắc tay sở hữu sự cứng cáp của vàng Ý 18K được chế tác tinh xảo, kết hợp các chi tiết đúc, châu và khắc theo công nghệ trang sức Ý, tạo nên sự sáng bóng và sang trọng. Với thiết kế độc lạ cùng ánh kim sắc sảo, sản phẩm sẽ tôn lên vẻ đẹp của các quý cô.\nThêm vào đó, với thiết kế tinh xảo, nàng sẽ bất ngờ khi phối với các bộ trang phục như suit công sở hay những chiếc đầm dạo phố. Với các điểm nhấn trên sản phẩm, tin rằng nàng sẽ trở nên thật sự tỏa sáng và nổi bật khi trưng diện chúng.', 'IN_STOCK');
INSERT INTO `product` VALUES (22, NULL, '2025-05-02 20:43:30.000000', 341, NULL, 'Vàng Ý', 'Lắc tay Vàng Ý 18K 0000C060145', 'Chiếc lắc tay sở hữu sự cứng cáp của vàng Ý 18K được chế tác tinh xảo, kết hợp các chi tiết đúc, châu và khắc theo công nghệ trang sức Ý, tạo nên sự sáng bóng và sang trọng. Với thiết kế độc lạ cùng ánh kim sắc sảo, sản phẩm sẽ tôn lên vẻ đẹp của các quý cô.\nThêm vào đó, với thiết kế tinh xảo, nàng sẽ bất ngờ khi phối với các bộ trang phục như suit công sở hay những chiếc đầm dạo phố. Với các điểm nhấn trên sản phẩm, tin rằng nàng sẽ trở nên thật sự tỏa sáng và nổi bật khi trưng diện chúng.', 'IN_STOCK');
INSERT INTO `product` VALUES (23, NULL, '2025-05-02 20:43:33.000000', 437, NULL, 'Vàng 10K', 'Mặt dây chuyền Vàng 10K Kim Bảo Như Ý 0000Y001683', 'Mô phỏng nét tin yêu cùng vẻ đẹp tinh tế, thanh tú của nàng, mang đến hơi thở mới mẻ từ những chi tiết giản đơn cho thiết kế trang sức mới của mình. Chiếc mặt dây chuyền được chế tác từ sắc vàng 10K trên thiết kế đậm chất phóng khoáng và hiện đại.\nSản phẩm chính là sự hội tụ của phong cách thiết kế hiện đại kết hợp đỉnh cao của trình độ chế tác và sẽ trở thành xu hướng trang sức mới, mang đến cho phái đẹp thêm nhiều sự lựa chọn cho bộ sưu tập của mình.', 'IN_STOCK');
INSERT INTO `product` VALUES (24, NULL, '2025-05-02 20:43:33.000000', 485, NULL, 'Bạc', 'Mặt dây chuyền bạc đính đá PNJSilver XM00K000044', 'Mặt dây chyền bạc sở hữu thiết kế có kiểu dáng hình thánh giá kết hợp những viên đá trắng đính một cách tỉ mỉ mang đến vẻ đẹp trang trọng và tinh tế. Đặc biệt, chiếc mề đay có biểu tượng hình thánh giá mang trong mình rất nhiều ý nghĩa thiêng liêng, đem đến sự bình an và may mắn cho người đeo cũng như nhắc nhở luôn bình tĩnh trước mọi sự việc xảy ra trong cuộc sống.\nPNJSilver luôn tự hào khi mang đến những món trang sức có thiết kế sáng tạo và độc đáo. Ngoài ra, với nữ trang bạc này còn cho phép bạn tự do thiết kế cho mình những phiên bản trang sức khác, mang đậm dấu ấn của chính mình.', 'IN_STOCK');
INSERT INTO `product` VALUES (24, NULL, '2025-05-02 20:43:33.000000', 486, NULL, 'Bạc', 'Mặt dây chuyền bạc đính đá PNJSilver XMXMK000048', '', 'IN_STOCK');
INSERT INTO `product` VALUES (24, NULL, '2025-05-02 20:43:33.000000', 521, NULL, 'Bạc', 'Mặt dây chuyền Bạc đính đá Disney|INSIDE OUT 2 ZT00W060001', 'Được hoàn thiện vẻ đẹp duy mỹ bởi những viên đá lấp lánh đính thủ công lên từng mảnh trang sức, chiếc mặt dây chuyền trong BST Inside Out 2 được chế tác từ chất liệu bạc cao cấp 92.5 kết hợp cùng sự lấp lánh của những viên đá màu trắng, tựa như đóa hoa bừng nở trên bề mặt một cách mỹ miều và tinh tế.\nTôn vinh nét đẹp thanh tú của nàng xinh với chiếc mặt dây chuyền lấp lánh sắc bạc ánh kim cổ điển cùng sắc trắng của viên đá đính kèm, Disney|chắc chắn đây sẽ là những gì các nàng cần để luôn tỏa sáng và thu hút mọi ánh nhìn.', 'IN_STOCK');
INSERT INTO `product` VALUES (24, NULL, '2025-05-02 20:43:33.000000', 522, NULL, 'Bạc', 'Mặt dây chuyền Bạc đính đá Disney|Jasmine XMXMY000010', 'Được hoàn thiện vẻ đẹp duy mỹ bởi những viên đá lấp lánh đính thủ công lên từng mảnh trang sức, chiếc mặt dây chuyền trong BST Jasmine được chế tác từ chất liệu bạc cao cấp 92.5 kết hợp cùng sự lấp lánh của những viên đá màu trắng, tựa như đóa hoa bừng nở trên bề mặt một cách mỹ miều và tinh tế.\nTôn vinh nét đẹp thanh tú của nàng xinh với chiếc mặt dây chuyền Disney|lấp lánh sắc bạc ánh kim cổ điển cùng sắc trắng của viên đá đính kèm, chắc chắn đây sẽ là những gì các nàng cần để luôn tỏa sáng và thu hút mọi ánh nhìn.', 'IN_STOCK');
INSERT INTO `product` VALUES (23, NULL, '2025-05-02 20:43:33.000000', 545, NULL, 'Vàng trắng', 'Mặt dây chuyền Kim cương Vàng Trắng 14K chữ U DDDDW002578', '', 'IN_STOCK');
INSERT INTO `product` VALUES (23, NULL, '2025-05-02 20:43:33.000000', 546, NULL, 'Vàng 14K', 'Mặt dây chuyền Kim cương Vàng 14K DDDDC000145', 'xin giới thiệu một món trang sức đặc biệt, giúp nàng thu hút mọi sự chú ý xung quanh với chiếc mặt dây chuyền vàng 14K sở hữu chi tiết Kim cương đính một cách tỉ mỉ trên chất liệu vàng 14K.\nKhông chỉ sang trọng, kim cương còn là loại đá cứng cỏi, bền bỉ bậc nhất hiện nay, giúp cho món trang sức của bạn trường tồn giữa dòng thời gian. Với sự kết hợp đồng điệu giữa vàng 14K và kim cương, chiếc mặt dây chuyền sở hữu một vẻ đẹp vừa trẻ trung, vừa toát lên khí chất của người phụ nữ quyền lực.', 'IN_STOCK');
INSERT INTO `product` VALUES (23, NULL, '2025-05-02 20:43:33.000000', 547, NULL, 'Vàng trắng', 'Mặt dây chuyền Kim cương Vàng trắng 14K DDDDW002602', 'xin giới thiệu một món trang sức đặc biệt, giúp nàng thu hút mọi sự chú ý xung quanh với chiếc mặt dây chuyền vàng 18K sở hữu chi tiết Kim cương đính một cách tỉ mỉ trên chất liệu vàng 14K.\nKhông chỉ sang trọng, kim cương còn là loại đá cứng cỏi, bền bỉ bậc nhất hiện nay, giúp cho món trang sức của bạn trường tồn giữa dòng thời gian. Với sự kết hợp đồng điệu giữa vàng 18K và kim cương, chiếc mặt dây chuyền sở hữu một vẻ đẹp vừa trẻ trung, vừa toát lên khí chất của người phụ nữ quyền lực.', 'IN_STOCK');
INSERT INTO `product` VALUES (23, NULL, '2025-05-02 20:43:33.000000', 548, NULL, 'Vàng trắng', 'Mặt dây chuyền Kim cương Vàng trắng 14K DDDDW002699', 'xin giới thiệu một món trang sức đặc biệt, giúp nàng thu hút mọi sự chú ý xung quanh với chiếc mặt dây chuyền vàng 14K sở hữu chi tiết Kim cương đính một cách tỉ mỉ trên chất liệu vàng 14K.\nKhông chỉ sang trọng, kim cương còn là loại đá cứng cỏi, bền bỉ bậc nhất hiện nay, giúp cho món trang sức của bạn trường tồn giữa dòng thời gian. Với sự kết hợp đồng điệu giữa vàng 14K và kim cương, chiếc mặt dây chuyền sở hữu một vẻ đẹp vừa trẻ trung, vừa toát lên khí chất của người phụ nữ quyền lực.', 'IN_STOCK');
INSERT INTO `product` VALUES (23, NULL, '2025-05-02 20:43:33.000000', 549, NULL, 'Vàng trắng', 'Mặt dây chuyền Kim cương Vàng trắng 14K DDDDW002605', 'xin giới thiệu một món trang sức đặc biệt, giúp nàng thu hút mọi sự chú ý xung quanh với chiếc mặt dây chuyền vàng 14K sở hữu chi tiết Kim cương đính một cách tỉ mỉ trên chất liệu vàng 14K.\nKhông chỉ sang trọng, kim cương còn là loại đá cứng cỏi, bền bỉ bậc nhất hiện nay, giúp cho món trang sức của bạn trường tồn giữa dòng thời gian. Với sự kết hợp đồng điệu giữa vàng 14K và kim cương, chiếc mặt dây chuyền sở hữu một vẻ đẹp vừa trẻ trung, vừa toát lên khí chất của người phụ nữ quyền lực.', 'IN_STOCK');
INSERT INTO `product` VALUES (23, NULL, '2025-05-02 20:43:33.000000', 550, NULL, 'Vàng trắng', 'Mặt dây chuyền Kim cương Vàng trắng 14K DDDDW002680', 'xin giới thiệu một món trang sức đặc biệt, giúp nàng thu hút mọi sự chú ý xung quanh với chiếc mặt dây chuyền vàng 14K sở hữu chi tiết Kim cương đính một cách tỉ mỉ trên chất liệu vàng 14K.\nKhông chỉ sang trọng, kim cương còn là loại đá cứng cỏi, bền bỉ bậc nhất hiện nay, giúp cho món trang sức của bạn trường tồn giữa dòng thời gian. Với sự kết hợp đồng điệu giữa vàng 14K và kim cương, chiếc mặt dây chuyền sở hữu một vẻ đẹp vừa trẻ trung, vừa toát lên khí chất của người phụ nữ quyền lực.', 'IN_STOCK');
INSERT INTO `product` VALUES (23, NULL, '2025-05-02 20:43:33.000000', 551, NULL, 'Vàng trắng', 'Mặt dây chuyền Kim cương Vàng Trắng 14K DD00W060073', 'xin giới thiệu một món trang sức đặc biệt, giúp nàng thu hút mọi sự chú ý xung quanh với chiếc mặt dây chuyền vàng 14K sở hữu chi tiết Kim cương đính một cách tỉ mỉ trên chất liệu vàng 14K.\nKhông chỉ sang trọng, kim cương còn là loại đá cứng cỏi, bền bỉ bậc nhất hiện nay, giúp cho món trang sức của bạn trường tồn giữa dòng thời gian. Với sự kết hợp đồng điệu giữa vàng 14K và kim cương, chiếc mặt dây chuyền sở hữu một vẻ đẹp vừa trẻ trung, vừa toát lên khí chất của người phụ nữ quyền lực.', 'IN_STOCK');
INSERT INTO `product` VALUES (23, NULL, '2025-05-02 20:43:33.000000', 552, NULL, 'Vàng trắng', 'Mặt dây chuyền Kim cương Vàng trắng 14K DDDDW060401', 'xin giới thiệu một món trang sức đặc biệt, giúp nàng thu hút mọi sự chú ý xung quanh với chiếc mặt dây chuyền vàng 14K sở hữu chi tiết Kim cương đính một cách tỉ mỉ trên chất liệu vàng 14K.\nKhông chỉ sang trọng, kim cương còn là loại đá cứng cỏi, bền bỉ bậc nhất hiện nay, giúp cho món trang sức của bạn trường tồn giữa dòng thời gian. Với sự kết hợp đồng điệu giữa vàng 14K và kim cương, chiếc mặt dây chuyền sở hữu một vẻ đẹp vừa trẻ trung, vừa toát lên khí chất của người phụ nữ quyền lực.', 'IN_STOCK');
INSERT INTO `product` VALUES (23, NULL, '2025-05-02 20:43:33.000000', 553, NULL, 'Vàng trắng', 'Mặt dây chuyền Kim cương Vàng Trắng 14K DD00W060074', 'xin giới thiệu một món trang sức đặc biệt, giúp nàng thu hút mọi sự chú ý xung quanh với chiếc mặt dây chuyền vàng 14K sở hữu chi tiết Kim cương đính một cách tỉ mỉ trên chất liệu vàng 14K.\nKhông chỉ sang trọng, kim cương còn là loại đá cứng cỏi, bền bỉ bậc nhất hiện nay, giúp cho món trang sức của bạn trường tồn giữa dòng thời gian. Với sự kết hợp đồng điệu giữa vàng 14K và kim cương, chiếc mặt dây chuyền sở hữu một vẻ đẹp vừa trẻ trung, vừa toát lên khí chất của người phụ nữ quyền lực.', 'IN_STOCK');
INSERT INTO `product` VALUES (23, NULL, '2025-05-02 20:43:33.000000', 554, NULL, 'Vàng trắng', 'Mặt dây chuyền nam Kim cương Vàng trắng 14K MANCODE by | BST Mancode DD00W000678', 'MANCODE by xin giới thiệu một món trang sức đặc biệt, giúp người đeo thu hút mọi sự chú ý xung quanh với chiếc mặt dây chuyền vàng 14K sở hữu chi tiết Kim cương đính một cách tỉ mỉ trên chất liệu vàng 14K.\nKhông chỉ sang trọng, kim cương còn là loại đá cứng cỏi, bền bỉ bậc nhất hiện nay, giúp cho món trang sức của bạn trường tồn giữa dòng thời gian. Với sự kết hợp đồng điệu giữa vàng 14K và kim cương, chiếc mặt dây chuyền MANCODE by sở hữu một vẻ đẹp vừa trẻ trung, vừa toát lên khí chất của quý ông quyền lực.', 'IN_STOCK');
INSERT INTO `product` VALUES (23, NULL, '2025-05-02 20:43:33.000000', 555, NULL, 'Vàng trắng', 'Mặt dây chuyền Kim cương Vàng Trắng 14K My First Diamond DDDDW002726', 'xin giới thiệu một món trang sức đặc biệt, giúp nàng thu hút mọi sự chú ý xung quanh với chiếc mặt dây chuyền vàng 14K sở hữu chi tiết Kim cương đính một cách tỉ mỉ trên chất liệu vàng 14K.\nKhông chỉ sang trọng, kim cương còn là loại đá cứng cỏi, bền bỉ bậc nhất hiện nay, giúp cho món trang sức của bạn trường tồn giữa dòng thời gian. Với sự kết hợp đồng điệu giữa vàng 14K và kim cương, chiếc mặt dây chuyền sở hữu một vẻ đẹp vừa trẻ trung, vừa toát lên khí chất của người phụ nữ quyền lực.', 'IN_STOCK');
INSERT INTO `product` VALUES (23, NULL, '2025-05-02 20:43:33.000000', 556, NULL, 'Vàng trắng', 'Mặt dây chuyền Kim cương Vàng Trắng 14K My First Diamond DDDDW002737', 'xin giới thiệu một món trang sức đặc biệt, giúp nàng thu hút mọi sự chú ý xung quanh với chiếc mặt dây chuyền vàng 14K sở hữu chi tiết Kim cương đính một cách tỉ mỉ trên chất liệu vàng 14K.\nKhông chỉ sang trọng, kim cương còn là loại đá cứng cỏi, bền bỉ bậc nhất hiện nay, giúp cho món trang sức của bạn trường tồn giữa dòng thời gian. Với sự kết hợp đồng điệu giữa vàng 14K và kim cương, chiếc mặt dây chuyền sở hữu một vẻ đẹp vừa trẻ trung, vừa toát lên khí chất của người phụ nữ quyền lực.', 'IN_STOCK');
INSERT INTO `product` VALUES (23, NULL, '2025-05-02 20:43:33.000000', 557, NULL, 'Vàng trắng', 'Mặt dây chuyền Kim cương Vàng Trắng 14K My First Diamond DD00W000687', 'xin giới thiệu một món trang sức đặc biệt, giúp nàng thu hút mọi sự chú ý xung quanh với chiếc mặt dây chuyền vàng 14K sở hữu chi tiết Kim cương đính một cách tỉ mỉ trên chất liệu vàng 14K.\nKhông chỉ sang trọng, kim cương còn là loại đá cứng cỏi, bền bỉ bậc nhất hiện nay, giúp cho món trang sức của bạn trường tồn giữa dòng thời gian. Với sự kết hợp đồng điệu giữa vàng 14K và kim cương, chiếc mặt dây chuyền sở hữu một vẻ đẹp vừa trẻ trung, vừa toát lên khí chất của người phụ nữ quyền lực.', 'IN_STOCK');
INSERT INTO `product` VALUES (23, NULL, '2025-05-02 20:43:33.000000', 558, NULL, 'Vàng trắng', 'Mặt dây chuyền Kim cương Vàng Trắng 14K DDDDW060415', 'xin giới thiệu một món trang sức đặc biệt, giúp nàng thu hút mọi sự chú ý xung quanh với chiếc mặt dây chuyền vàng 14K sở hữu chi tiết Kim cương đính một cách tỉ mỉ trên chất liệu vàng 14K.\nKhông chỉ sang trọng, kim cương còn là loại đá cứng cỏi, bền bỉ bậc nhất hiện nay, giúp cho món trang sức của bạn trường tồn giữa dòng thời gian. Với sự kết hợp đồng điệu giữa vàng 14K và kim cương, chiếc mặt dây chuyền sở hữu một vẻ đẹp vừa trẻ trung, vừa toát lên khí chất của người phụ nữ quyền lực.', 'IN_STOCK');
INSERT INTO `product` VALUES (23, NULL, '2025-05-02 20:43:33.000000', 559, NULL, 'Vàng trắng', 'Mặt dây chuyền Kim cương Vàng Trắng 14K DD00W060075', 'xin giới thiệu một món trang sức đặc biệt, giúp nàng thu hút mọi sự chú ý xung quanh với chiếc mặt dây chuyền vàng 14K sở hữu chi tiết Kim cương đính một cách tỉ mỉ trên chất liệu vàng 14K.\nKhông chỉ sang trọng, kim cương còn là loại đá cứng cỏi, bền bỉ bậc nhất hiện nay, giúp cho món trang sức của bạn trường tồn giữa dòng thời gian. Với sự kết hợp đồng điệu giữa vàng 14K và kim cương, chiếc mặt dây chuyền sở hữu một vẻ đẹp vừa trẻ trung, vừa toát lên khí chất của người phụ nữ quyền lực.', 'IN_STOCK');
INSERT INTO `product` VALUES (23, NULL, '2025-05-02 20:43:33.000000', 560, NULL, 'Vàng trắng', 'Mặt dây chuyền Kim cương Vàng Trắng 14K DDDDW060398', 'xin giới thiệu một món trang sức đặc biệt, giúp nàng thu hút mọi sự chú ý xung quanh với chiếc mặt dây chuyền vàng 14K sở hữu chi tiết Kim cương đính một cách tỉ mỉ trên chất liệu vàng 14K.\nKhông chỉ sang trọng, kim cương còn là loại đá cứng cỏi, bền bỉ bậc nhất hiện nay, giúp cho món trang sức của bạn trường tồn giữa dòng thời gian. Với sự kết hợp đồng điệu giữa vàng 14K và kim cương, chiếc mặt dây chuyền sở hữu một vẻ đẹp vừa trẻ trung, vừa toát lên khí chất của người phụ nữ quyền lực.', 'IN_STOCK');
INSERT INTO `product` VALUES (23, NULL, '2025-05-02 20:43:33.000000', 561, NULL, 'Vàng trắng', 'Mặt dây chuyền Kim cương Vàng Trắng 14K DDDDW060400', 'xin giới thiệu một món trang sức đặc biệt, giúp nàng thu hút mọi sự chú ý xung quanh với chiếc mặt dây chuyền vàng 14K sở hữu chi tiết Kim cương đính một cách tỉ mỉ trên chất liệu vàng 14K.\nKhông chỉ sang trọng, kim cương còn là loại đá cứng cỏi, bền bỉ bậc nhất hiện nay, giúp cho món trang sức của bạn trường tồn giữa dòng thời gian. Với sự kết hợp đồng điệu giữa vàng 14K và kim cương, chiếc mặt dây chuyền sở hữu một vẻ đẹp vừa trẻ trung, vừa toát lên khí chất của người phụ nữ quyền lực.', 'IN_STOCK');
INSERT INTO `product` VALUES (23, NULL, '2025-05-02 20:43:33.000000', 562, NULL, 'Vàng trắng', 'Mặt dây chuyền Kim cương Vàng Trắng 14K DDDDW060397', 'xin giới thiệu một món trang sức đặc biệt, giúp nàng thu hút mọi sự chú ý xung quanh với chiếc mặt dây chuyền vàng 14K sở hữu chi tiết Kim cương đính một cách tỉ mỉ trên chất liệu vàng 14K.\nKhông chỉ sang trọng, kim cương còn là loại đá cứng cỏi, bền bỉ bậc nhất hiện nay, giúp cho món trang sức của bạn trường tồn giữa dòng thời gian. Với sự kết hợp đồng điệu giữa vàng 14K và kim cương, chiếc mặt dây chuyền sở hữu một vẻ đẹp vừa trẻ trung, vừa toát lên khí chất của người phụ nữ quyền lực.', 'IN_STOCK');
INSERT INTO `product` VALUES (23, NULL, '2025-05-02 20:43:33.000000', 563, NULL, 'Vàng trắng', 'Mặt dây chuyền Kim cương Vàng Trắng 14K DDDDW060399', 'xin giới thiệu một món trang sức đặc biệt, giúp nàng thu hút mọi sự chú ý xung quanh với chiếc mặt dây chuyền vàng 14K sở hữu chi tiết Kim cương đính một cách tỉ mỉ trên chất liệu vàng 14K.\nKhông chỉ sang trọng, kim cương còn là loại đá cứng cỏi, bền bỉ bậc nhất hiện nay, giúp cho món trang sức của bạn trường tồn giữa dòng thời gian. Với sự kết hợp đồng điệu giữa vàng 14K và kim cương, chiếc mặt dây chuyền sở hữu một vẻ đẹp vừa trẻ trung, vừa toát lên khí chất của người phụ nữ quyền lực.', 'IN_STOCK');
INSERT INTO `product` VALUES (23, NULL, '2025-05-02 20:43:33.000000', 564, NULL, 'Vàng trắng', 'Mặt dây chuyền nam Kim cương Vàng trắng 14K MANCODE by DD00W000680', 'MANCODE by xin giới thiệu một món trang sức đặc biệt, giúp người đeo thu hút mọi sự chú ý xung quanh với chiếc mặt dây chuyền vàng 14K sở hữu chi tiết Kim cương đính một cách tỉ mỉ trên chất liệu vàng 14K.\nKhông chỉ sang trọng, kim cương còn là loại đá cứng cỏi, bền bỉ bậc nhất hiện nay, giúp cho món trang sức của bạn trường tồn giữa dòng thời gian. Với sự kết hợp đồng điệu giữa vàng 14K và kim cương, chiếc mặt dây chuyền MANCODE by sở hữu một vẻ đẹp vừa trẻ trung, vừa toát lên khí chất của quý ông quyền lực.', 'IN_STOCK');
INSERT INTO `product` VALUES (23, NULL, '2025-05-02 20:43:33.000000', 565, NULL, 'Vàng trắng', 'Mặt dây chuyền Kim cương Vàng trắng 14K DD00W060081', 'xin giới thiệu một món trang sức đặc biệt, giúp nàng thu hút mọi sự chú ý xung quanh với chiếc mặt dây chuyền vàng 14K sở hữu chi tiết Kim cương đính một cách tỉ mỉ trên chất liệu vàng 14K.\nKhông chỉ sang trọng, kim cương còn là loại đá cứng cỏi, bền bỉ bậc nhất hiện nay, giúp cho món trang sức của bạn trường tồn giữa dòng thời gian. Với sự kết hợp đồng điệu giữa vàng 14K và kim cương, chiếc mặt dây chuyền sở hữu một vẻ đẹp vừa trẻ trung, vừa toát lên khí chất của người phụ nữ quyền lực.', 'IN_STOCK');
INSERT INTO `product` VALUES (25, NULL, '2025-05-02 20:43:36.000000', 566, NULL, 'Vàng trắng', 'Nhẫn Vàng trắng 14K đính đá ECZ Audax Rosa XMXMW005914', 'Dù ở lứa tuổi nào, theo phong cách cổ điển hay hiện đại thì sắc màu của những viên đá ECZ màu trắng vẫn luôn biết chiều lòng các tín đồ thời trang. Mô phỏng nét kiêu sa của nàng, chiếc nhẫn vàng mới của trong BST Audax Rosa nhẹ nhàng kết đính những viên đá trắng tròn trịa trên chất vàng 14K, mang đến sản phẩm đầy tinh tế, tôn lên nhan sắc của phái đẹp.\nCó thể nói, sản phẩm này như là lời ví von xinh đẹp mà gửi tặng đến các giai nhân. Vì nàng luôn biết cách rực rỡ theo sắc màu riêng, như cầu vồng tản ánh sắc không bao giờ trùng lắp.', 'IN_STOCK');
INSERT INTO `product` VALUES (26, NULL, '2025-05-02 20:43:36.000000', 610, NULL, 'Bạc', 'Nhẫn nam Bạc đính đá PNJSilver XM00W060016', 'Một lựa chọn tối giản, rất phù hợp cho những ai muốn sử dụng phụ kiện mà không sợ bị chê là đỏm dáng. Chiếc nhẫn bạcPNJSilver với nhiều thiết kế phá cách sẽ là item giúp cho bạn thể hiện sự mạnh mẽ cũng như cá tính của mình.\nNhẫn vốn là món trang sức không chỉ thể hiện lòng chung thủy và sự gắn kết mà còn là điểm nhấn cho trang phục tối giản, toát lên gu thẩm mỹ cũng như phong cách cách riêng của mỗi người. Lựa chọn phụ kiện đúng đắn sẽ giúp bạn thêm nổi bật và khiến người khác phải ngoái nhìn.', 'IN_STOCK');
INSERT INTO `product` VALUES (26, NULL, '2025-05-02 20:43:37.000000', 646, NULL, 'Bạc', 'Nhẫn Bạc đính đá STYLE By XMXMW060208', 'Hãy khám phá và để những thiết kế rực rỡ đầy màu sắc của truyền cảm hứng cho bạn kể câu chuyện mang đậm chất riêng của mình một cách đầy thú vị. Sở hữu thiết kế độc đáo với những điểm nhấn đá đầy màu sắc lấp lánh, chiếc nhẫn bạc STYLE By sẽ tôn lên vẻ đẹp cá tính và tinh tế của nàng xinh.\nVới sản phẩm này, nàng có thể kết hợp với nhiều món trang sức hoặc phụ kiện khác nhau như dây cổ, lắc, vòng để tạo nên một phong cách thời trang của riêng mình hoặc tặng cho những người mà mình yêu thương.', 'IN_STOCK');
INSERT INTO `product` VALUES (26, NULL, '2025-05-02 20:43:37.000000', 647, NULL, 'Bạc', 'Nhẫn Bạc đính đá STYLE By XMXMW060209', 'Hãy khám phá và để những thiết kế rực rỡ đầy màu sắc của truyền cảm hứng cho bạn kể câu chuyện mang đậm chất riêng của mình một cách đầy thú vị. Sở hữu thiết kế độc đáo với những điểm nhấn đá đầy màu sắc lấp lánh, chiếc nhẫn bạc STYLE By sẽ tôn lên vẻ đẹp cá tính và tinh tế của nàng xinh.\nVới sản phẩm này, nàng có thể kết hợp với nhiều món trang sức hoặc phụ kiện khác nhau như dây cổ, lắc, vòng để tạo nên một phong cách thời trang của riêng mình hoặc tặng cho những người mà mình yêu thương.', 'IN_STOCK');
INSERT INTO `product` VALUES (26, NULL, '2025-05-02 20:43:37.000000', 648, NULL, 'Bạc', 'Nhẫn Bạc đính đá STYLE By XM00W060023', 'Hãy khám phá và để những thiết kế rực rỡ đầy màu sắc của truyền cảm hứng cho bạn kể câu chuyện mang đậm chất riêng của mình một cách đầy thú vị. Sở hữu thiết kế độc đáo với những điểm nhấn đá đầy màu sắc lấp lánh, chiếc nhẫn bạc STYLE By sẽ tôn lên vẻ đẹp cá tính và tinh tế của nàng xinh.\nVới sản phẩm này, nàng có thể kết hợp với nhiều món trang sức hoặc phụ kiện khác nhau như dây cổ, lắc, vòng để tạo nên một phong cách thời trang của riêng mình hoặc tặng cho những người mà mình yêu thương.', 'IN_STOCK');
INSERT INTO `product` VALUES (26, NULL, '2025-05-02 20:43:37.000000', 649, NULL, 'Bạc', 'Nhẫn Bạc đính đá STYLE By XMXMW060210', 'Hãy khám phá và để những thiết kế rực rỡ đầy màu sắc của truyền cảm hứng cho bạn kể câu chuyện mang đậm chất riêng của mình một cách đầy thú vị. Sở hữu thiết kế độc đáo với những điểm nhấn đá đầy màu sắc lấp lánh, chiếc nhẫn bạc STYLE By sẽ tôn lên vẻ đẹp cá tính và tinh tế của nàng xinh.\nVới sản phẩm này, nàng có thể kết hợp với nhiều món trang sức hoặc phụ kiện khác nhau như dây cổ, lắc, vòng để tạo nên một phong cách thời trang của riêng mình hoặc tặng cho những người mà mình yêu thương.', 'IN_STOCK');
INSERT INTO `product` VALUES (26, NULL, '2025-05-02 20:43:37.000000', 650, NULL, 'Bạc', 'Nhẫn Bạc đính đá STYLE By XM00W060024', 'Hãy khám phá và để những thiết kế rực rỡ đầy màu sắc của truyền cảm hứng cho bạn kể câu chuyện mang đậm chất riêng của mình một cách đầy thú vị. Sở hữu thiết kế độc đáo với những điểm nhấn đá đầy màu sắc lấp lánh, chiếc nhẫn bạc STYLE By sẽ tôn lên vẻ đẹp cá tính và tinh tế của nàng xinh.\nVới sản phẩm này, nàng có thể kết hợp với nhiều món trang sức hoặc phụ kiện khác nhau như dây cổ, lắc, vòng để tạo nên một phong cách thời trang của riêng mình hoặc tặng cho những người mà mình yêu thương.', 'IN_STOCK');
INSERT INTO `product` VALUES (26, NULL, '2025-05-02 20:43:37.000000', 651, NULL, 'Bạc', 'Nhẫn Bạc đính đá STYLE By XMXMY060022', 'Hãy khám phá và để những thiết kế rực rỡ đầy màu sắc của truyền cảm hứng cho bạn kể câu chuyện mang đậm chất riêng của mình một cách đầy thú vị. Sở hữu thiết kế độc đáo với những điểm nhấn đá đầy màu sắc lấp lánh, chiếc nhẫn bạc STYLE By sẽ tôn lên vẻ đẹp cá tính và tinh tế của nàng xinh.\nVới sản phẩm này, nàng có thể kết hợp với nhiều món trang sức hoặc phụ kiện khác nhau như dây cổ, lắc, vòng để tạo nên một phong cách thời trang của riêng mình hoặc tặng cho những người mà mình yêu thương.', 'IN_STOCK');
INSERT INTO `product` VALUES (26, NULL, '2025-05-02 20:43:37.000000', 652, NULL, 'Bạc', 'Nhẫn Bạc đính đá STYLE By Bisous ZT00H000007', 'Nhẫn Bạc đính đá STYLE By thuộc BST Bisous là một sản phẩm đầy lôi cuốn và trẻ trung, lấy cảm hứng từ biểu tượng \"Bisous\" (nụ hôn) trong tiếng Pháp, với ý nghĩa “1000 nụ hôn” – biểu trưng cho tình yêu ngọt ngào và mãnh liệt. Kết hợp cùng hình ảnh trái tim vĩnh cửu, sản phẩm không chỉ tôn vinh sự ngọt ngào của tình yêu mà còn khuyến khích bạn sống thật với những cảm xúc của mình.\nMỗi thiết kế trong bộ sưu tập Bisous đều mang thông điệp sâu sắc: yêu là trao đi, yêu là nhận lại và yêu là sống trọn vẹn từng khoảnh khắc. Nhẫn Bạc STYLE By PNJ, với chất liệu bạc tinh xảo và đá lấp lánh, là lựa chọn hoàn hảo để bạn thể hiện tình cảm trong những dịp đặc biệt.', 'IN_STOCK');
INSERT INTO `product` VALUES (26, NULL, '2025-05-02 20:43:37.000000', 653, NULL, 'Bạc', 'Nhẫn Bạc đính đá STYLE By Bisous ZTXMH000015', 'Nhẫn Bạc đính đá STYLE By thuộc BST Bisous là một sản phẩm đầy lôi cuốn và trẻ trung, lấy cảm hứng từ biểu tượng \"Bisous\" (nụ hôn) trong tiếng Pháp, với ý nghĩa “1000 nụ hôn” – biểu trưng cho tình yêu ngọt ngào và mãnh liệt. Kết hợp cùng hình ảnh trái tim vĩnh cửu, sản phẩm không chỉ tôn vinh sự ngọt ngào của tình yêu mà còn khuyến khích bạn sống thật với những cảm xúc của mình.\nMỗi thiết kế trong bộ sưu tập Bisous đều mang thông điệp sâu sắc: yêu là trao đi, yêu là nhận lại và yêu là sống trọn vẹn từng khoảnh khắc. Nhẫn Bạc STYLE By PNJ, với chất liệu bạc tinh xảo và đá lấp lánh, là lựa chọn hoàn hảo để bạn thể hiện tình cảm trong những dịp đặc biệt.', 'IN_STOCK');
INSERT INTO `product` VALUES (26, NULL, '2025-05-02 20:43:37.000000', 654, NULL, 'Bạc', 'Nhẫn Bạc đính đá STYLE By XMXMC000029', 'Hãy khám phá và để những thiết kế rực rỡ đầy màu sắc của truyền cảm hứng cho bạn kể câu chuyện mang đậm chất riêng của mình một cách đầy thú vị. Sở hữu thiết kế độc đáo với những điểm nhấn đá đầy màu sắc lấp lánh, chiếc nhẫn bạc STYLE By sẽ tôn lên vẻ đẹp cá tính và tinh tế của nàng xinh.\nVới sản phẩm này, nàng có thể kết hợp với nhiều món trang sức hoặc phụ kiện khác nhau như dây cổ, lắc, vòng để tạo nên một phong cách thời trang của riêng mình hoặc tặng cho những người mà mình yêu thương.', 'IN_STOCK');
INSERT INTO `product` VALUES (26, NULL, '2025-05-02 20:43:37.000000', 655, NULL, 'Bạc', 'Nhẫn Bạc đính đá STYLE By XM00W000101', 'Hãy khám phá và để những thiết kế rực rỡ đầy màu sắc của truyền cảm hứng cho bạn kể câu chuyện mang đậm chất riêng của mình một cách đầy thú vị. Sở hữu thiết kế độc đáo với những điểm nhấn đá đầy màu sắc lấp lánh, chiếc nhẫn bạc STYLE By sẽ tôn lên vẻ đẹp cá tính và tinh tế của nàng xinh.\nVới sản phẩm này, nàng có thể kết hợp với nhiều món trang sức hoặc phụ kiện khác nhau như dây cổ, lắc, vòng để tạo nên một phong cách thời trang của riêng mình hoặc tặng cho những người mà mình yêu thương.', 'IN_STOCK');
INSERT INTO `product` VALUES (26, NULL, '2025-05-02 20:43:37.000000', 656, NULL, 'Bạc', 'Nhẫn Bạc đính đá STYLE By XM00W000103', 'Hãy khám phá và để những thiết kế rực rỡ đầy màu sắc của truyền cảm hứng cho bạn kể câu chuyện mang đậm chất riêng của mình một cách đầy thú vị. Sở hữu thiết kế độc đáo với những điểm nhấn đá đầy màu sắc lấp lánh, chiếc nhẫn bạc STYLE By sẽ tôn lên vẻ đẹp cá tính và tinh tế của nàng xinh.\nVới sản phẩm này, nàng có thể kết hợp với nhiều món trang sức hoặc phụ kiện khác nhau như dây cổ, lắc, vòng để tạo nên một phong cách thời trang của riêng mình hoặc tặng cho những người mà mình yêu thương.', 'IN_STOCK');
INSERT INTO `product` VALUES (26, NULL, '2025-05-02 20:43:37.000000', 657, NULL, 'Bạc', 'Nhẫn Bạc đính đá STYLE By XM00C000042', 'Hãy khám phá và để những thiết kế rực rỡ đầy màu sắc của truyền cảm hứng cho bạn kể câu chuyện mang đậm chất riêng của mình một cách đầy thú vị. Sở hữu thiết kế độc đáo với những điểm nhấn đá đầy màu sắc lấp lánh, chiếc nhẫn bạc STYLE By sẽ tôn lên vẻ đẹp cá tính và tinh tế của nàng xinh.\nVới sản phẩm này, nàng có thể kết hợp với nhiều món trang sức hoặc phụ kiện khác nhau như dây cổ, lắc, vòng để tạo nên một phong cách thời trang của riêng mình hoặc tặng cho những người mà mình yêu thương.', 'IN_STOCK');
INSERT INTO `product` VALUES (25, NULL, '2025-05-02 20:43:37.000000', 681, NULL, 'Vàng trắng', 'Vỏ nhẫn Kim cương Vàng trắng 18K 00DDW007296', 'Để tôn vinh vẻ đẹp sang trọng và mạnh mẽ của nàng, cho ra đời những thiết kế tinh tế với sự phối trộn hài hoà giữa kim cương và chất liệu vàng 18K tinh xảo. Và để mang đến nhiều sự lựa chọn về viên đá chủ, mang đến mẫu vỏ nhẫn Kim cương sang trọng và tinh tế.\nTin rằng, trang sức kim cương nói chung và chiếc nhẫn nói riêng sẽ luôn là sự lựa chọn hoàn hảo cho phái đẹp để hoàn thiện vẻ ngoài duy mỹ mang nét cá tính độc đáo. tự hào mang đến những mẫu trang sức đính đá tinh tế, giúp bạn có nhiều sự lựa chọn cho phong cách của mình.', 'IN_STOCK');
INSERT INTO `product` VALUES (25, NULL, '2025-05-02 20:43:37.000000', 682, NULL, 'Vàng trắng', 'Vỏ nhẫn Kim cương Vàng trắng 18K 00DDW007297', 'Để tôn vinh vẻ đẹp sang trọng và mạnh mẽ của nàng, cho ra đời những thiết kế tinh tế với sự phối trộn hài hoà giữa kim cương và chất liệu vàng 18K tinh xảo. Và để mang đến nhiều sự lựa chọn về viên đá chủ, mang đến mẫu vỏ nhẫn Kim cương sang trọng và tinh tế.\nTin rằng, trang sức kim cương nói chung và chiếc nhẫn nói riêng sẽ luôn là sự lựa chọn hoàn hảo cho phái đẹp để hoàn thiện vẻ ngoài duy mỹ mang nét cá tính độc đáo. tự hào mang đến những mẫu trang sức đính đá tinh tế, giúp bạn có nhiều sự lựa chọn cho phong cách của mình.', 'IN_STOCK');
INSERT INTO `product` VALUES (25, NULL, '2025-05-02 20:43:37.000000', 683, NULL, 'Vàng trắng', 'Vỏ nhẫn Kim cương Vàng trắng 18K 00DDW007313', 'Để tôn vinh vẻ đẹp sang trọng và mạnh mẽ của nàng, cho ra đời những thiết kế tinh tế với sự phối trộn hài hoà giữa kim cương và chất liệu vàng 18K tinh xảo. Và để mang đến nhiều sự lựa chọn về viên đá chủ, mang đến mẫu vỏ nhẫn Kim cương sang trọng và tinh tế.\nTin rằng, trang sức kim cương nói chung và chiếc nhẫn nói riêng sẽ luôn là sự lựa chọn hoàn hảo cho phái đẹp để hoàn thiện vẻ ngoài duy mỹ mang nét cá tính độc đáo. tự hào mang đến những mẫu trang sức đính đá tinh tế, giúp bạn có nhiều sự lựa chọn cho phong cách của mình.', 'IN_STOCK');
INSERT INTO `product` VALUES (25, NULL, '2025-05-02 20:43:37.000000', 684, NULL, 'Vàng trắng', 'Vỏ nhẫn Kim cương Vàng trắng 18K 00DDW007324', 'Để tôn vinh vẻ đẹp sang trọng và mạnh mẽ của nàng, cho ra đời những thiết kế tinh tế với sự phối trộn hài hoà giữa kim cương và chất liệu vàng 18K tinh xảo. Và để mang đến nhiều sự lựa chọn về viên đá chủ, mang đến mẫu vỏ nhẫn Kim cương sang trọng và tinh tế.\nTin rằng, trang sức kim cương nói chung và chiếc nhẫn nói riêng sẽ luôn là sự lựa chọn hoàn hảo cho phái đẹp để hoàn thiện vẻ ngoài duy mỹ mang nét cá tính độc đáo. tự hào mang đến những mẫu trang sức đính đá tinh tế, giúp bạn có nhiều sự lựa chọn cho phong cách của mình.', 'IN_STOCK');
INSERT INTO `product` VALUES (25, NULL, '2025-05-02 20:43:37.000000', 685, NULL, 'Vàng trắng', 'Vỏ nhẫn Kim cương Vàng trắng 18K 00DDW007314', 'Để tôn vinh vẻ đẹp sang trọng và mạnh mẽ của nàng, cho ra đời những thiết kế tinh tế với sự phối trộn hài hoà giữa kim cương và chất liệu vàng 18K tinh xảo. Và để mang đến nhiều sự lựa chọn về viên đá chủ, mang đến mẫu vỏ nhẫn Kim cương sang trọng và tinh tế.\nTin rằng, trang sức kim cương nói chung và chiếc nhẫn nói riêng sẽ luôn là sự lựa chọn hoàn hảo cho phái đẹp để hoàn thiện vẻ ngoài duy mỹ mang nét cá tính độc đáo. tự hào mang đến những mẫu trang sức đính đá tinh tế, giúp bạn có nhiều sự lựa chọn cho phong cách của mình.', 'IN_STOCK');
INSERT INTO `product` VALUES (25, NULL, '2025-05-02 20:43:37.000000', 686, NULL, 'Vàng trắng', 'Nhẫn nam Kim cương Vàng trắng 14K MANCODE by DDDDW013416', 'Kim cương vốn là món trang sức mang đến niềm kiêu hãnh và cảm hứng thời trang bất tận. Sở hữu riêng cho mình món trang sức kim cương chính là điều mà ai cũng mong muốn. Chiếc nhẫn MANCODE by được chế tác từ vàng 14K cùng điểm nhấn kim cương với 57 giác cắt chuẩn xác, tạo nên món trang sức đầy sự sang trọng và đẳng cấp.\nKim cương đã đẹp, trang sức kim cương lại càng mang sức hấp dẫn khó cưỡng. Sự kết hợp mới mẻ này chắc chắn sẽ tạo nên dấu ấn thời trang hiện đại và giúp quý cô trở nên nổi bật, tự tin và thu hút sự ngưỡng mộ của mọi người.', 'IN_STOCK');
INSERT INTO `product` VALUES (25, NULL, '2025-05-02 20:43:37.000000', 687, NULL, 'Vàng trắng', 'Vỏ nhẫn Kim cương Vàng trắng 18K 00DDW063733', 'Để tôn vinh vẻ đẹp sang trọng và mạnh mẽ của nàng, cho ra đời những thiết kế tinh tế với sự phối trộn hài hoà giữa kim cương và chất liệu vàng 18K tinh xảo. Và để mang đến nhiều sự lựa chọn về viên đá chủ, mang đến mẫu vỏ nhẫn Kim cương sang trọng và tinh tế.\nTin rằng, trang sức kim cương nói chung và chiếc nhẫn nói riêng sẽ luôn là sự lựa chọn hoàn hảo cho phái đẹp để hoàn thiện vẻ ngoài duy mỹ mang nét cá tính độc đáo. tự hào mang đến những mẫu trang sức đính đá tinh tế, giúp bạn có nhiều sự lựa chọn cho phong cách của mình.', 'IN_STOCK');
INSERT INTO `product` VALUES (25, NULL, '2025-05-02 20:43:37.000000', 688, NULL, 'Vàng trắng', 'Nhẫn nam Kim cương Vàng trắng 14K MANCODE by DDDDW013497', 'Kim cương vốn là món trang sức mang đến niềm kiêu hãnh và cảm hứng thời trang bất tận. Sở hữu riêng cho mình món trang sức kim cương chính là điều mà ai cũng mong muốn. Chiếc nhẫn MANCODE by được chế tác từ vàng 14K cùng điểm nhấn kim cương với 57 giác cắt chuẩn xác, tạo nên món trang sức đầy sự sang trọng và đẳng cấp.\nKim cương đã đẹp, trang sức kim cương lại càng mang sức hấp dẫn khó cưỡng. Sự kết hợp mới mẻ này chắc chắn sẽ tạo nên dấu ấn thời trang hiện đại và giúp quý cô trở nên nổi bật, tự tin và thu hút sự ngưỡng mộ của mọi người.', 'IN_STOCK');
INSERT INTO `product` VALUES (25, NULL, '2025-05-02 20:43:37.000000', 689, NULL, 'Vàng trắng', 'Vỏ nhẫn Kim cương Vàng Trắng 18K 00DDW007287', 'Để tôn vinh vẻ đẹp sang trọng và mạnh mẽ của nàng, cho ra đời những thiết kế tinh tế với sự phối trộn hài hoà giữa kim cương và chất liệu vàng 18K tinh xảo. Và để mang đến nhiều sự lựa chọn về viên đá chủ, mang đến mẫu vỏ nhẫn Kim cương sang trọng và tinh tế.\nTin rằng, trang sức kim cương nói chung và chiếc nhẫn nói riêng sẽ luôn là sự lựa chọn hoàn hảo cho phái đẹp để hoàn thiện vẻ ngoài duy mỹ mang nét cá tính độc đáo. tự hào mang đến những mẫu trang sức đính đá tinh tế, giúp bạn có nhiều sự lựa chọn cho phong cách của mình.', 'IN_STOCK');
INSERT INTO `product` VALUES (25, NULL, '2025-05-02 20:43:37.000000', 690, NULL, 'Vàng trắng', 'Vỏ nhẫn Kim cương Vàng trắng 18K 00DDW007288', 'Để tôn vinh vẻ đẹp sang trọng và mạnh mẽ của nàng, cho ra đời những thiết kế tinh tế với sự phối trộn hài hoà giữa kim cương và chất liệu vàng 18K tinh xảo. Và để mang đến nhiều sự lựa chọn về viên đá chủ, mang đến mẫu vỏ nhẫn Kim cương sang trọng và tinh tế.\nTin rằng, trang sức kim cương nói chung và chiếc nhẫn nói riêng sẽ luôn là sự lựa chọn hoàn hảo cho phái đẹp để hoàn thiện vẻ ngoài duy mỹ mang nét cá tính độc đáo. tự hào mang đến những mẫu trang sức đính đá tinh tế, giúp bạn có nhiều sự lựa chọn cho phong cách của mình.', 'IN_STOCK');
INSERT INTO `product` VALUES (25, NULL, '2025-05-02 20:43:37.000000', 691, NULL, 'Vàng trắng', 'Nhẫn Kim cương Vàng trắng 14K DD00W060464', 'Kim cương vốn là món trang sức mang đến niềm kiêu hãnh và cảm hứng thời trang bất tận. Sở hữu riêng cho mình món trang sức kim cương chính là điều mà ai cũng mong muốn. Chiếc nhẫn được chế tác từ vàng 14K cùng điểm nhấn kim cương với 57 giác cắt chuẩn xác, tạo nên món trang sức đầy sự sang trọng và đẳng cấp.\nKim cương đã đẹp, trang sức kim cương lại càng mang sức hấp dẫn khó cưỡng. Sự kết hợp mới mẻ này chắc chắn sẽ tạo nên dấu ấn thời trang hiện đại và giúp quý cô trở nên nổi bật, tự tin và thu hút sự ngưỡng mộ của mọi người.', 'IN_STOCK');
INSERT INTO `product` VALUES (25, NULL, '2025-05-02 20:43:37.000000', 692, NULL, 'Vàng trắng', 'Nhẫn Kim cương Vàng trắng 14K DD00W060466', 'Kim cương vốn là món trang sức mang đến niềm kiêu hãnh và cảm hứng thời trang bất tận. Sở hữu riêng cho mình món trang sức kim cương chính là điều mà ai cũng mong muốn. Chiếc nhẫn được chế tác từ vàng 14K cùng điểm nhấn kim cương với 57 giác cắt chuẩn xác, tạo nên món trang sức đầy sự sang trọng và đẳng cấp.\nKim cương đã đẹp, trang sức kim cương lại càng mang sức hấp dẫn khó cưỡng. Sự kết hợp mới mẻ này chắc chắn sẽ tạo nên dấu ấn thời trang hiện đại và giúp quý cô trở nên nổi bật, tự tin và thu hút sự ngưỡng mộ của mọi người.', 'IN_STOCK');
INSERT INTO `product` VALUES (25, NULL, '2025-05-02 20:43:37.000000', 693, NULL, 'Vàng trắng', 'Nhẫn Kim cương Vàng trắng 14K DD00W060465', 'Kim cương vốn là món trang sức mang đến niềm kiêu hãnh và cảm hứng thời trang bất tận. Sở hữu riêng cho mình món trang sức kim cương chính là điều mà ai cũng mong muốn. Chiếc nhẫn được chế tác từ vàng 14K cùng điểm nhấn kim cương với 57 giác cắt chuẩn xác, tạo nên món trang sức đầy sự sang trọng và đẳng cấp.\nKim cương đã đẹp, trang sức kim cương lại càng mang sức hấp dẫn khó cưỡng. Sự kết hợp mới mẻ này chắc chắn sẽ tạo nên dấu ấn thời trang hiện đại và giúp quý cô trở nên nổi bật, tự tin và thu hút sự ngưỡng mộ của mọi người.', 'IN_STOCK');
INSERT INTO `product` VALUES (25, NULL, '2025-05-02 20:43:37.000000', 694, NULL, 'Vàng trắng', 'Nhẫn Kim cương Vàng Trắng 14K Nhẫn cầu hôn Only You DDDDW014518', 'Nhẫn Kim cương Vàng Trắng 14K thuộc Bộ sưu tập Nhẫn cầu hôn Only You – Vì em là duy nhất là một tác phẩm nghệ thuật tinh tế, được thiết kế để ghi dấu khoảnh khắc quan trọng nhất trong đời. Được chế tác tỉ mỉ từ kim cương và vàng trắng 14K, mang đến vẻ đẹp lấp lánh, tinh tế, biểu tượng cho tình cảm sắt son và sự vĩnh cửu.\nBộ sưu tập Only You với hình ảnh chữ \"O\" và \"U\" lồng ghép khéo léo theo đường xoắn, tạo nên một biểu tượng độc đáo, thể hiện sự liên kết bền chặt và tình yêu đích thực. Chiếc nhẫn cầu hôn này chỉ được mua một lần trong đời, nhắc nhở bạn rằng người bạn chọn sẽ là duy nhất, cùng nhau xây dựng tương lai phía trước.', 'IN_STOCK');
INSERT INTO `product` VALUES (25, NULL, '2025-05-02 20:43:37.000000', 695, NULL, 'Vàng trắng', 'Nhẫn Kim cương Vàng trắng 14K DDDDW013481', 'Kim cương vốn là món trang sức mang đến niềm kiêu hãnh và cảm hứng thời trang bất tận. Sở hữu riêng cho mình món trang sức kim cương chính là điều mà ai cũng mong muốn. Chiếc nhẫn được chế tác từ vàng 14K cùng điểm nhấn kim cương với 57 giác cắt chuẩn xác, tạo nên món trang sức đầy sự sang trọng và đẳng cấp.\nKim cương đã đẹp, trang sức kim cương lại càng mang sức hấp dẫn khó cưỡng. Sự kết hợp mới mẻ này chắc chắn sẽ tạo nên dấu ấn thời trang hiện đại và giúp quý cô trở nên nổi bật, tự tin và thu hút sự ngưỡng mộ của mọi người.', 'IN_STOCK');
INSERT INTO `product` VALUES (25, NULL, '2025-05-02 20:43:37.000000', 696, NULL, 'Vàng trắng', 'Vỏ nhẫn Kim cương Vàng trắng 18K 00DDW063959', 'Để tôn vinh vẻ đẹp sang trọng và mạnh mẽ của nàng, cho ra đời những thiết kế tinh tế với sự phối trộn hài hoà giữa kim cương và chất liệu vàng 18K tinh xảo. Và để mang đến nhiều sự lựa chọn về viên đá chủ, mang đến mẫu vỏ nhẫn Kim cương sang trọng và tinh tế.\nTin rằng, trang sức kim cương nói chung và chiếc nhẫn nói riêng sẽ luôn là sự lựa chọn hoàn hảo cho phái đẹp để hoàn thiện vẻ ngoài duy mỹ mang nét cá tính độc đáo. tự hào mang đến những mẫu trang sức đính đá tinh tế, giúp bạn có nhiều sự lựa chọn cho phong cách của mình.', 'IN_STOCK');
INSERT INTO `product` VALUES (25, NULL, '2025-05-02 20:43:37.000000', 697, NULL, 'Vàng trắng', 'Vỏ nhẫn Kim cương Vàng trắng 18K 00DDW063960', 'Để tôn vinh vẻ đẹp sang trọng và mạnh mẽ của nàng, cho ra đời những thiết kế tinh tế với sự phối trộn hài hoà giữa kim cương và chất liệu vàng 18K tinh xảo. Và để mang đến nhiều sự lựa chọn về viên đá chủ, mang đến mẫu vỏ nhẫn Kim cương sang trọng và tinh tế.\nTin rằng, trang sức kim cương nói chung và chiếc nhẫn nói riêng sẽ luôn là sự lựa chọn hoàn hảo cho phái đẹp để hoàn thiện vẻ ngoài duy mỹ mang nét cá tính độc đáo. tự hào mang đến những mẫu trang sức đính đá tinh tế, giúp bạn có nhiều sự lựa chọn cho phong cách của mình.', 'IN_STOCK');
INSERT INTO `product` VALUES (25, NULL, '2025-05-02 20:43:37.000000', 698, NULL, 'Vàng trắng', 'Vỏ nhẫn Kim cương Vàng trắng 18K 00DDW063962', 'Để tôn vinh vẻ đẹp sang trọng và mạnh mẽ của nàng, cho ra đời những thiết kế tinh tế với sự phối trộn hài hoà giữa kim cương và chất liệu vàng 18K tinh xảo. Và để mang đến nhiều sự lựa chọn về viên đá chủ, mang đến mẫu vỏ nhẫn Kim cương sang trọng và tinh tế.\nTin rằng, trang sức kim cương nói chung và chiếc nhẫn nói riêng sẽ luôn là sự lựa chọn hoàn hảo cho phái đẹp để hoàn thiện vẻ ngoài duy mỹ mang nét cá tính độc đáo. tự hào mang đến những mẫu trang sức đính đá tinh tế, giúp bạn có nhiều sự lựa chọn cho phong cách của mình.', 'IN_STOCK');
INSERT INTO `product` VALUES (25, NULL, '2025-05-02 20:43:37.000000', 699, NULL, 'Vàng trắng', 'Nhẫn Kim cương Vàng trắng 14K Audax Rosa DDDDW013992', 'Lấy cảm hứng từ những câu chuyện của những người phụ nữ, những hành trình người thật việc thật về sự cố gắng, mang đến BST Audax Rosa với những món trang sức biểu tượng cho sự mạnh mẽ và luôn tỏa sáng của các quý cô. Chiếc nhẫn vàng 14K đính kim cương sở hữu thiết kế với hình ảnh ngọn sóng mềm mại len lỏi và ôm trọn bông hoa hồng, tạo nên vẻ đẹp đầy sang trọng và mỹ quyền.\nĐoá hoa hồng tượng trưng cho nét đẹp của những người phụ nữ phi thường dù trải qua bao nhiêu thăng trầm của cuộc đời, họ vẫn sẽ nở rộ, đẹp tuyệt vời như một đoá hoa.', 'IN_STOCK');
INSERT INTO `product` VALUES (25, NULL, '2025-05-02 20:43:37.000000', 700, NULL, 'Vàng trắng', 'Nhẫn Kim cương Vàng trắng 14K Audax Rosa DDDDW013993', 'Lấy cảm hứng từ những câu chuyện của những người phụ nữ, những hành trình người thật việc thật về sự cố gắng, mang đến BST Audax Rosa với những món trang sức biểu tượng cho sự mạnh mẽ và luôn tỏa sáng của các quý cô. Chiếc nhẫn vàng 14K đính kim cương sở hữu thiết kế với hình ảnh ngọn sóng mềm mại len lỏi và ôm trọn bông hoa hồng, tạo nên vẻ đẹp đầy sang trọng và mỹ quyền.\nĐoá hoa hồng tượng trưng cho nét đẹp của những người phụ nữ phi thường dù trải qua bao nhiêu thăng trầm của cuộc đời, họ vẫn sẽ nở rộ, đẹp tuyệt vời như một đoá hoa.', 'IN_STOCK');
INSERT INTO `product` VALUES (27, NULL, '2025-05-02 20:43:37.000000', 701, NULL, 'Bạch kim', 'Vỏ nhẫn Bạch kim đính Kim cương 00DDW000016', 'Để tôn vinh vẻ đẹp sang trọng và mạnh mẽ của nàng, cho ra đời những thiết kế tinh tế với sự phối trộn hài hoà giữa kim cương và chất liệu bạch kim tinh xảo. Và để mang đến nhiều sự lựa chọn về viên đá chủ, mang đến mẫu vỏ nhẫn Kim cương sang trọng và tinh tế.\nTin rằng, trang sức kim cương nói chung và chiếc nhẫn nói riêng sẽ luôn là sự lựa chọn hoàn hảo cho phái đẹp để hoàn thiện vẻ ngoài duy mỹ mang nét cá tính độc đáo. tự hào mang đến những mẫu trang sức đính đá tinh tế, giúp bạn có nhiều sự lựa chọn cho phong cách của mình.', 'IN_STOCK');
INSERT INTO `product` VALUES (27, NULL, '2025-05-02 20:43:37.000000', 726, NULL, 'Bạch kim', 'Nhẫn cưới nam Bạch kim đính Kim cương DDDDC000006', '', 'IN_STOCK');
INSERT INTO `product` VALUES (27, NULL, '2025-05-02 20:43:37.000000', 727, NULL, 'Bạch kim', 'Nhẫn cưới nam Bạch Kim đính Kim cương DD00W000382', 'Kim cương vốn là món trang sức mang đến niềm kiêu hãnh và cảm hứng thời trang bất tận. Sở hữu riêng cho mình món trang sức kim cương chính là điều mà ai cũng mong muốn. Chiếc nhẫn được chế tác từ bạch kim cùng điểm nhấn kim cương với 57 giác cắt chuẩn xác, tạo nên món trang sức đầy sự sang trọng và đẳng cấp.\nKim cương đã đẹp, trang sức kim cương lại càng mang sức hấp dẫn khó cưỡng. Sự kết hợp mới mẻ này chắc chắn sẽ tạo nên dấu ấn thời trang hiện đại và giúp quý cô trở nên nổi bật, tự tin và thu hút sự ngưỡng mộ của mọi người.', 'IN_STOCK');
INSERT INTO `product` VALUES (27, NULL, '2025-05-02 20:43:37.000000', 728, NULL, 'Bạch kim', 'Vỏ Nhẫn Bạch kim đính Kim cương 00DDW060060', 'Để tôn vinh vẻ đẹp sang trọng và mạnh mẽ của nàng, cho ra đời những thiết kế tinh tế với sự phối trộn hài hoà giữa kim cương và chất liệu bạch kim tinh xảo. Và để mang đến nhiều sự lựa chọn về viên đá chủ, mang đến mẫu vỏ nhẫn Kim cương sang trọng và tinh tế.\nTin rằng, trang sức kim cương nói chung và chiếc nhẫn nói riêng sẽ luôn là sự lựa chọn hoàn hảo cho phái đẹp để hoàn thiện vẻ ngoài duy mỹ mang nét cá tính độc đáo. tự hào mang đến những mẫu trang sức đính đá tinh tế, giúp bạn có nhiều sự lựa chọn cho phong cách của mình.', 'IN_STOCK');
INSERT INTO `product` VALUES (27, NULL, '2025-05-02 20:43:37.000000', 729, NULL, 'Bạch kim', 'Vỏ nhẫn Bạch kim đính Kim cương 00DDW060061', 'Để tôn vinh vẻ đẹp sang trọng và mạnh mẽ của nàng, cho ra đời những thiết kế tinh tế với sự phối trộn hài hoà giữa kim cương và chất liệu bạch kim tinh xảo. Và để mang đến nhiều sự lựa chọn về viên đá chủ, mang đến mẫu vỏ nhẫn Kim cương sang trọng và tinh tế.\nTin rằng, trang sức kim cương nói chung và chiếc nhẫn nói riêng sẽ luôn là sự lựa chọn hoàn hảo cho phái đẹp để hoàn thiện vẻ ngoài duy mỹ mang nét cá tính độc đáo. tự hào mang đến những mẫu trang sức đính đá tinh tế, giúp bạn có nhiều sự lựa chọn cho phong cách của mình.', 'IN_STOCK');
INSERT INTO `product` VALUES (27, NULL, '2025-05-02 20:43:37.000000', 730, NULL, 'Bạch kim', 'Vỏ nhẫn Bạch kim đính Kim cương 00DDW060062', 'Để tôn vinh vẻ đẹp sang trọng và mạnh mẽ của nàng, cho ra đời những thiết kế tinh tế với sự phối trộn hài hoà giữa kim cương và chất liệu bạch kim tinh xảo. Và để mang đến nhiều sự lựa chọn về viên đá chủ, mang đến mẫu vỏ nhẫn Kim cương sang trọng và tinh tế.\nTin rằng, trang sức kim cương nói chung và chiếc nhẫn nói riêng sẽ luôn là sự lựa chọn hoàn hảo cho phái đẹp để hoàn thiện vẻ ngoài duy mỹ mang nét cá tính độc đáo. tự hào mang đến những mẫu trang sức đính đá tinh tế, giúp bạn có nhiều sự lựa chọn cho phong cách của mình.', 'IN_STOCK');
INSERT INTO `product` VALUES (27, NULL, '2025-05-02 20:43:37.000000', 731, NULL, 'Bạch kim', 'Vỏ nhẫn Bạch kim đính Kim cương 00DDW060064', 'Để tôn vinh vẻ đẹp sang trọng và mạnh mẽ của nàng, cho ra đời những thiết kế tinh tế với sự phối trộn hài hoà giữa kim cương và chất liệu bạch kim tinh xảo. Và để mang đến nhiều sự lựa chọn về viên đá chủ, mang đến mẫu vỏ nhẫn Kim cương sang trọng và tinh tế.\nTin rằng, trang sức kim cương nói chung và chiếc nhẫn nói riêng sẽ luôn là sự lựa chọn hoàn hảo cho phái đẹp để hoàn thiện vẻ ngoài duy mỹ mang nét cá tính độc đáo. tự hào mang đến những mẫu trang sức đính đá tinh tế, giúp bạn có nhiều sự lựa chọn cho phong cách của mình.', 'IN_STOCK');
INSERT INTO `product` VALUES (27, NULL, '2025-05-02 20:43:37.000000', 732, NULL, 'Bạch kim', 'Vỏ nhẫn Bạch kim đính Kim cương 00DDW060063', 'Để tôn vinh vẻ đẹp sang trọng và mạnh mẽ của nàng, cho ra đời những thiết kế tinh tế với sự phối trộn hài hoà giữa kim cương và chất liệu bạch kim tinh xảo. Và để mang đến nhiều sự lựa chọn về viên đá chủ, mang đến mẫu vỏ nhẫn Kim cương sang trọng và tinh tế.\nTin rằng, trang sức kim cương nói chung và chiếc nhẫn nói riêng sẽ luôn là sự lựa chọn hoàn hảo cho phái đẹp để hoàn thiện vẻ ngoài duy mỹ mang nét cá tính độc đáo. tự hào mang đến những mẫu trang sức đính đá tinh tế, giúp bạn có nhiều sự lựa chọn cho phong cách của mình.', 'IN_STOCK');
INSERT INTO `product` VALUES (27, NULL, '2025-05-02 20:43:37.000000', 733, NULL, 'Bạch kim', 'Vỏ nhẫn Bạch kim 0000W060015', 'Để tôn vinh vẻ đẹp sang trọng và mạnh mẽ của nàng, cho ra đời những thiết kế tinh tế với sự phối trộn hài hoà giữa thiết kế tinh tế và chất liệu bạch kim tinh xảo. Và để mang đến nhiều sự lựa chọn về viên đá chủ, mang đến mẫu vỏ nhẫn sang trọng và tinh tế.\nTin rằng, trang sức nói chung và chiếc nhẫn nói riêng sẽ luôn là sự lựa chọn hoàn hảo cho phái đẹp để hoàn thiện vẻ ngoài duy mỹ mang nét cá tính độc đáo. tự hào mang đến những mẫu trang sức đính đá tinh tế, giúp bạn có nhiều sự lựa chọn cho phong cách của mình.', 'IN_STOCK');
INSERT INTO `product` VALUES (27, NULL, '2025-05-02 20:43:37.000000', 734, NULL, 'Bạch kim', 'Vỏ Nhẫn Bạch kim đính Kim cương 00DDW060052', 'Để tôn vinh vẻ đẹp sang trọng và mạnh mẽ của nàng, cho ra đời những thiết kế tinh tế với sự phối trộn hài hoà giữa kim cương và chất liệu bạch kim tinh xảo. Và để mang đến nhiều sự lựa chọn về viên đá chủ, mang đến mẫu vỏ nhẫn Kim cương sang trọng và tinh tế.\nTin rằng, trang sức kim cương nói chung và chiếc nhẫn nói riêng sẽ luôn là sự lựa chọn hoàn hảo cho phái đẹp để hoàn thiện vẻ ngoài duy mỹ mang nét cá tính độc đáo. tự hào mang đến những mẫu trang sức đính đá tinh tế, giúp bạn có nhiều sự lựa chọn cho phong cách của mình.', 'IN_STOCK');
INSERT INTO `product` VALUES (27, NULL, '2025-05-02 20:43:37.000000', 735, NULL, 'Bạch kim', 'Vỏ nhẫn Bạch kim đính kim cương 00DDW060056', 'Để tôn vinh vẻ đẹp sang trọng và mạnh mẽ của nàng, cho ra đời những thiết kế tinh tế với sự phối trộn hài hoà giữa kim cương và chất liệu bạch kim tinh xảo. Và để mang đến nhiều sự lựa chọn về viên đá chủ, mang đến mẫu vỏ nhẫn Kim cương sang trọng và tinh tế.\nTin rằng, trang sức kim cương nói chung và chiếc nhẫn nói riêng sẽ luôn là sự lựa chọn hoàn hảo cho phái đẹp để hoàn thiện vẻ ngoài duy mỹ mang nét cá tính độc đáo. tự hào mang đến những mẫu trang sức đính đá tinh tế, giúp bạn có nhiều sự lựa chọn cho phong cách của mình.', 'IN_STOCK');
INSERT INTO `product` VALUES (27, NULL, '2025-05-02 20:43:37.000000', 736, NULL, 'Bạch kim', 'Vỏ Nhẫn Bạch kim đính Kim cương 00DDW060051', 'Để tôn vinh vẻ đẹp sang trọng và mạnh mẽ của nàng, cho ra đời những thiết kế tinh tế với sự phối trộn hài hoà giữa kim cương và chất liệu bạch kim tinh xảo. Và để mang đến nhiều sự lựa chọn về viên đá chủ, mang đến mẫu vỏ nhẫn Kim cương sang trọng và tinh tế.\nTin rằng, trang sức kim cương nói chung và chiếc nhẫn nói riêng sẽ luôn là sự lựa chọn hoàn hảo cho phái đẹp để hoàn thiện vẻ ngoài duy mỹ mang nét cá tính độc đáo. tự hào mang đến những mẫu trang sức đính đá tinh tế, giúp bạn có nhiều sự lựa chọn cho phong cách của mình.', 'IN_STOCK');
INSERT INTO `product` VALUES (27, NULL, '2025-05-02 20:43:37.000000', 737, NULL, 'Bạch kim', 'Vỏ Nhẫn Bạch kim đính Kim cương 00DDW060054', 'Để tôn vinh vẻ đẹp sang trọng và mạnh mẽ của nàng, cho ra đời những thiết kế tinh tế với sự phối trộn hài hoà giữa kim cương và chất liệu bạch kim tinh xảo. Và để mang đến nhiều sự lựa chọn về viên đá chủ, mang đến mẫu vỏ nhẫn Kim cương sang trọng và tinh tế.\nTin rằng, trang sức kim cương nói chung và chiếc nhẫn nói riêng sẽ luôn là sự lựa chọn hoàn hảo cho phái đẹp để hoàn thiện vẻ ngoài duy mỹ mang nét cá tính độc đáo. tự hào mang đến những mẫu trang sức đính đá tinh tế, giúp bạn có nhiều sự lựa chọn cho phong cách của mình.', 'IN_STOCK');
INSERT INTO `product` VALUES (27, NULL, '2025-05-02 20:43:37.000000', 738, NULL, 'Bạch kim', 'Vỏ Nhẫn Bạch kim đính Kim cương 00DDW060053', 'Để tôn vinh vẻ đẹp sang trọng và mạnh mẽ của nàng, cho ra đời những thiết kế tinh tế với sự phối trộn hài hoà giữa kim cương và chất liệu bạch kim tinh xảo. Và để mang đến nhiều sự lựa chọn về viên đá chủ, mang đến mẫu vỏ nhẫn Kim cương sang trọng và tinh tế.\nTin rằng, trang sức kim cương nói chung và chiếc nhẫn nói riêng sẽ luôn là sự lựa chọn hoàn hảo cho phái đẹp để hoàn thiện vẻ ngoài duy mỹ mang nét cá tính độc đáo. tự hào mang đến những mẫu trang sức đính đá tinh tế, giúp bạn có nhiều sự lựa chọn cho phong cách của mình.', 'IN_STOCK');
INSERT INTO `product` VALUES (27, NULL, '2025-05-02 20:43:37.000000', 739, NULL, 'Bạch kim', 'Vỏ Nhẫn Bạch kim đính Kim cương 00DDW060055', 'Để tôn vinh vẻ đẹp sang trọng và mạnh mẽ của nàng, cho ra đời những thiết kế tinh tế với sự phối trộn hài hoà giữa kim cương và chất liệu bạch kim tinh xảo. Và để mang đến nhiều sự lựa chọn về viên đá chủ, mang đến mẫu vỏ nhẫn Kim cương sang trọng và tinh tế.\nTin rằng, trang sức kim cương nói chung và chiếc nhẫn nói riêng sẽ luôn là sự lựa chọn hoàn hảo cho phái đẹp để hoàn thiện vẻ ngoài duy mỹ mang nét cá tính độc đáo. tự hào mang đến những mẫu trang sức đính đá tinh tế, giúp bạn có nhiều sự lựa chọn cho phong cách của mình.', 'IN_STOCK');
INSERT INTO `product` VALUES (28, NULL, '2025-05-02 20:43:43.000000', 740, NULL, 'Vàng trắng', 'Vòng tay Vàng trắng 10K đính đá ECZ XM00W000382', 'Nàng tinh tế tựa như đóa hoa nhỏ xinh, thoáng nhìn là chẳng thể nào quên với thiết kế vòng tay PNJ. Chất liệu vàng 10K cá tính, đá ECZ trắng hiện đại kết hợp với những đường cong duyên dáng tạo nên một tổng thể sản phẩm sắc sảo mà mềm mại.\nThanh thoát trong chiếc đầm ôm nhẹ tôn dáng, yêu kiều quyến rũ cùng trang sức ECZ bắt mắt, nàng sẽ thu hút tất cả ánh nhìn. Với vẻ đẹp của sự tự tin ấy, nguồn năng lượng tích cực đầy tin yêu của nàng sẽ được lan toả ở bất cứ nơi nào nàng đến.', 'IN_STOCK');
INSERT INTO `product` VALUES (29, NULL, '2025-05-02 20:43:43.000000', 747, NULL, 'Bạc', 'Vòng tay trẻ em Bạc ❤️ HELLO KITTY 0000W000069', 'Với sự kết hợp giữa thiết kế dễ thương, ❤️ HELLO KITTY mang đến cho các nàng công chúa nhỏ chiếc vòng tay xinh xắn và đáng yêu.\nThêm một chút ngọt ngào và thanh lịch của chất liệu bạc Sterling 92.5 tô điểm vào vẻ đáng yêu của bé với vòng tay này, mẹ có thể tự do phối cùng những bộ trang phục khác nhau tùy theo sở thích của bé. ❤️ HELLO KITTY sẽ giúp bé trở thành nàng công chúa nhỏ xinh.', 'IN_STOCK');
INSERT INTO `product` VALUES (29, NULL, '2025-05-02 20:43:43.000000', 749, NULL, 'Bạc', 'Vòng tay Bạc ❤️ HELLO KITTY 0000W000074', 'Phơi mình trong vẻ đẹp tinh khôi của chiếc vòng tay sở hữu thiết kế trẻ trung cùng ánh kim rực rỡ của bạc cao cấp 92.5, ❤️ HELLO KITTY tin rằng, nàng sẽ trở nên thật tỏa sáng khi sở hữu cho mình chiếc vòng tay bạc này.\nVới thiết kế đơn giản, chiếc vòng tay luôn mang lại sự hài hòa và tinh tế. Đồng thời để khơi gợi sự chú ý, nàng hãy mix&match với các items khác để không chỉ nổi bật mà còn là tâm điểm của những bữa tiệc nhẹ cuối tuần.', 'IN_STOCK');
INSERT INTO `product` VALUES (29, NULL, '2025-05-02 20:43:43.000000', 777, NULL, 'Bạc', 'Vòng tay Bạc đính đá PNJSilver XMZTW060000', 'Phơi mình trong vẻ đẹp tinh khôi của chiếc vòng tay khi kết hợp giữa thiết kế trẻ trung cùng ánh kim rực rỡ của bạc cao cấp 92.5; và tô thêm chút thời thượng với sự lấp lánh của những viên đá tinh tế, PNJSilver tin rằng, nàng sẽ trở nên thật tỏa sáng khi sở hữu cho mình chiếc vòng tay bạc này.\nVới sự sắp xếp đồng điệu của những viên đá, chiếc vòng tay luôn mang lại sự hài hòa và tinh tế. Đồng thời để khơi gợi sự chú ý, nàng hãy mix&match với các items khác để không chỉ nổi bật mà còn là tâm điểm của những bữa tiệc nhẹ cuối tuần.', 'IN_STOCK');
INSERT INTO `product` VALUES (29, NULL, '2025-05-02 20:43:43.000000', 778, NULL, 'Bạc', 'Vòng tay trẻ em Bạc PNJSilver 0000W000073', 'Với sự kết hợp giữa thiết kế dễ thương, PNJSilver mang đến cho các nàng công chúa nhỏ chiếc vòng tay xinh xắn và đáng yêu.\nThêm một chút ngọt ngào và thanh lịch của chất liệu bạc Sterling 92.5 tô điểm vào vẻ đáng yêu của bé với vòng tay này, mẹ có thể tự do phối cùng những bộ trang phục khác nhau tùy theo sở thích của bé. PNJSilver sẽ giúp bé trở thành nàng công chúa nhỏ xinh.', 'IN_STOCK');
INSERT INTO `product` VALUES (28, NULL, '2025-05-02 20:43:43.000000', 779, NULL, 'Vàng 18K', 'Vòng tay Vàng 18K đính Ngọc trai Southsea PSDDC060002', 'Chiếc vòng tay thu hút với những đường cong mềm mại, giúp cổ tay bạn gái thêm phần thanh thoát. Bên cạnh đó, sắc vàng 18K óng ánh càng làm cho sản phẩm trở nên thời thượng và kiêu sa. Với sự sáng tạo đến từ gu thẩm mĩ của đội ngũ thiết kế, mang đến vòng tay đính ngọc trai Southsea tuyệt đẹp.\nMang đến màu sắc yêu kiều cho phái đẹp, những điểm nhấn ngọc trai trên trang sức sẽ nâng niu cổ tay nàng một cách khéo léo. Hơn mọi sự thể hiện sặc sỡ, trang sức ngọc trai chính là hiện thân của sự kiêu hãnh và cùng nàng chinh phục mọi ánh nhìn.', 'IN_STOCK');
INSERT INTO `product` VALUES (28, NULL, '2025-05-02 20:43:43.000000', 780, NULL, 'Vàng trắng', 'Vòng tay Vàng trắng Ý 18K 0000W060442', 'Chiếc vòng tay sở hữu sự cứng cáp của vàng Ý 18K được chế tác tinh xảo, kết hợp các chi tiết đúc, châu và khắc theo công nghệ trang sức Ý, tạo nên sự sáng bóng và sang trọng. Với thiết kế độc lạ cùng ánh kim sắc sảo, sản phẩm sẽ tôn lên vẻ đẹp của các quý cô.\nThêm vào đó, với thiết kế tinh xảo của vòng tay, nàng sẽ bất ngờ khi phối với các bộ trang phục như suit công sở hay những chiếc đầm dạo phố. Với các điểm nhấn trên sản phẩm, tin rằng nàng sẽ trở nên thật sự tỏa sáng và nổi bật khi trưng diện chúng.', 'IN_STOCK');
INSERT INTO `product` VALUES (28, NULL, '2025-05-02 20:43:43.000000', 781, NULL, 'Vàng trắng', 'Vòng tay Vàng trắng Ý 18K 0000W060440', 'Chiếc vòng tay sở hữu sự cứng cáp của vàng Ý 18K được chế tác tinh xảo, kết hợp các chi tiết đúc, châu và khắc theo công nghệ trang sức Ý, tạo nên sự sáng bóng và sang trọng. Với thiết kế độc lạ cùng ánh kim sắc sảo, sản phẩm sẽ tôn lên vẻ đẹp của các quý cô.\nThêm vào đó, với thiết kế tinh xảo của vòng tay, nàng sẽ bất ngờ khi phối với các bộ trang phục như suit công sở hay những chiếc đầm dạo phố. Với các điểm nhấn trên sản phẩm, tin rằng nàng sẽ trở nên thật sự tỏa sáng và nổi bật khi trưng diện chúng.', 'IN_STOCK');
INSERT INTO `product` VALUES (28, NULL, '2025-05-02 20:43:43.000000', 782, NULL, 'Vàng trắng', 'Vòng tay Kim cương Vàng trắng 14K Audax Rosa DDDDW001129', 'Vòng tay Kim cương Vàng Trắng 14K thuộc Bộ sưu tập Audax Rosa là món trang sức đầy sang trọng và quyến rũ, được thiết kế lấy cảm hứng từ loài hoa hồng – biểu tượng của vẻ đẹp mạnh mẽ và kiên cường. Với chất liệu vàng trắng 14K kết hợp những viên kim cương lấp lánh, dây cổ này không chỉ mang đến sự tỏa sáng cho người phụ nữ, mà còn thể hiện sự tinh tế và quý phái.\nVới thiết kế thanh thoát và tinh xảo, sản phẩm này không chỉ là một món trang sức thời thượng mà còn là lời khẳng định về vẻ đẹp và sự mạnh mẽ của người phụ nữ hiện đại. Vòng tay Kim cương Vàng Trắng 14K chính là lựa chọn hoàn hảo để tôn vinh phong cách và cá tính của những người phụ nữ đầy khát vọng và tự tin.', 'IN_STOCK');
INSERT INTO `product` VALUES (28, NULL, '2025-05-02 20:43:43.000000', 783, NULL, 'Vàng 14K', 'Vòng tay Vàng 14K Đính đá Sapphire SP00X000007', 'Dành riêng cho những cô nàng ưa chuộng trang sức đá màu, đá Sapphire mang sắc xanh quý phái chắc chắn sẽ là mẫu trang sức không thể bỏ qua. Chiếc vòng tay sở hữu thiết kế độc đáo, thời trang. Viên đá chủ Sapphire được cắt mài tỉ mỉ, cẩn trọng nhằm tôn lên màu sắc đặc trưng của đá cùng chất liệu vàng 14K, khiến sản phẩm chinh phục cả những cô gái cá tính và khó tính nhất.\nChiếc vòng tay đã sẵn sàng để nàng sở hữu. Những chi tiết đính đá lấp lánh dịu dàng cùng sắc vàng trẻ trung hợp mắt là lựa chọn phù hợp cho nhiều biến tấu của nàng.', 'IN_STOCK');
INSERT INTO `product` VALUES (28, NULL, '2025-05-02 20:43:43.000000', 784, NULL, 'Vàng trắng', 'Vòng tay Kim cương Vàng trắng 14K Audax Rosa DDDDW001128', 'Vòng tay Kim cương Vàng Trắng 14K thuộc Bộ sưu tập Audax Rosa là món trang sức đầy sang trọng và quyến rũ, được thiết kế lấy cảm hứng từ loài hoa hồng – biểu tượng của vẻ đẹp mạnh mẽ và kiên cường. Với chất liệu vàng trắng 14K kết hợp những viên kim cương lấp lánh, dây cổ này không chỉ mang đến sự tỏa sáng cho người phụ nữ, mà còn thể hiện sự tinh tế và quý phái.\nVới thiết kế thanh thoát và tinh xảo, sản phẩm này không chỉ là một món trang sức thời thượng mà còn là lời khẳng định về vẻ đẹp và sự mạnh mẽ của người phụ nữ hiện đại. Vòng tay Kim cương Vàng Trắng 14K chính là lựa chọn hoàn hảo để tôn vinh phong cách và cá tính của những người phụ nữ đầy khát vọng và tự tin.', 'IN_STOCK');
INSERT INTO `product` VALUES (28, NULL, '2025-05-02 20:43:43.000000', 785, NULL, 'Vàng trắng', 'Vòng tay Vàng trắng 14K đính đá ECZ Audax Rosa XMXMW001361', 'Nàng tinh tế tựa như đóa hoa nhỏ xinh, thoáng nhìn là chẳng thể nào quên với thiết kế vòng tay PNJ. Chất liệu vàng 14K cá tính, đá ECZ trắng hiện đại kết hợp với những đường cong duyên dáng tạo nên một tổng thể sản phẩm sắc sảo mà mềm mại.\nThanh thoát trong chiếc đầm ôm nhẹ tôn dáng, yêu kiều quyến rũ cùng trang sức ECZ bắt mắt, nàng sẽ thu hút tất cả ánh nhìn. Với vẻ đẹp của sự tự tin ấy, nguồn năng lượng tích cực đầy tin yêu của nàng sẽ được lan toả ở bất cứ nơi nào nàng đến.', 'IN_STOCK');
INSERT INTO `product` VALUES (28, NULL, '2025-05-02 20:43:43.000000', 786, NULL, 'Vàng trắng', 'Vòng tay Vàng trắng Ý 18K 0000W060441', 'Chiếc vòng tay sở hữu sự cứng cáp của vàng Ý 18K được chế tác tinh xảo, kết hợp các chi tiết đúc, châu và khắc theo công nghệ trang sức Ý, tạo nên sự sáng bóng và sang trọng. Với thiết kế độc lạ cùng ánh kim sắc sảo, sản phẩm sẽ tôn lên vẻ đẹp của các quý cô.\nThêm vào đó, với thiết kế tinh xảo của vòng tay, nàng sẽ bất ngờ khi phối với các bộ trang phục như suit công sở hay những chiếc đầm dạo phố. Với các điểm nhấn trên sản phẩm, tin rằng nàng sẽ trở nên thật sự tỏa sáng và nổi bật khi trưng diện chúng.', 'IN_STOCK');
INSERT INTO `product` VALUES (28, NULL, '2025-05-02 20:43:43.000000', 787, NULL, 'Vàng trắng', 'Vỏ vòng tay Kim cương Vàng trắng 18K 00DDW060341', 'Được thiết kế theo phong cách hiện đại kết hợp những chi tiết đính kim cương sang trọng, tạo nên vẻ đẹp hoàn hảo cho sản phẩm vòng tay vàng 18K PNJ. Không chỉ sang trọng, kim cương còn là loại đá cứng cỏi, bền bỉ bậc nhất hiện nay, giúp cho món trang sức của bạn trường tồn giữa dòng thời gian.\nVới sự kết hợp đồng điệu giữa vàng 18K và kim cương, chiếc vòng tay sở hữu một vẻ đẹp vừa trẻ trung, vừa toát lên khí chất của người phụ nữ quyền lực. Với các điểm nhấn trên sản phẩm, tin rằng nàng sẽ trở nên thật sự tỏa sáng và nổi bật khi trưng diện.', 'IN_STOCK');
INSERT INTO `product` VALUES (30, NULL, '2025-05-02 20:43:43.000000', 788, NULL, 'Bạch kim', 'Vòng tay Bạch kim đính Kim cương DD00W060000', '', 'IN_STOCK');

-- ----------------------------
-- Table structure for product_image
-- ----------------------------
DROP TABLE IF EXISTS `product_image`;
CREATE TABLE `product_image`  (
  `created_at` datetime(6) NULL DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint NOT NULL,
  `updated_at` datetime(6) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK6oo0cvcdtb6qmwsga468uuukk`(`product_id` ASC) USING BTREE,
  CONSTRAINT `FK6oo0cvcdtb6qmwsga468uuukk` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4295 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_image
-- ----------------------------
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:45.000000', 304, 61, NULL, 'sp-gbddddc000222-bong-tai-kim-cuong-vang-14k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/223/sp-gbddddc000222-bong-tai-kim-cuong-vang-14k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:45.000000', 305, 61, NULL, 'sp-gbddddc000222-bong-tai-kim-cuong-vang-14k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/223/sp-gbddddc000222-bong-tai-kim-cuong-vang-14k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:45.000000', 306, 61, NULL, 'on-gbddddc000222-bong-tai-kim-cuong-vang-14k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/223/on-gbddddc000222-bong-tai-kim-cuong-vang-14k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:45.000000', 307, 61, NULL, 'on-gbddddc000222-bong-tai-kim-cuong-vang-14k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/223/on-gbddddc000222-bong-tai-kim-cuong-vang-14k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:45.000000', 308, 61, NULL, 'on-gbddddc000222-bong-tai-kim-cuong-vang-14k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/223/on-gbddddc000222-bong-tai-kim-cuong-vang-14k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:45.000000', 309, 62, NULL, 'sp-gbddddw004377-bong-tai-kim-cuong-vang-trang-14k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/223/sp-gbddddw004377-bong-tai-kim-cuong-vang-trang-14k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:45.000000', 310, 62, NULL, 'sp-gbddddw004377-bong-tai-kim-cuong-vang-trang-14k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/223/sp-gbddddw004377-bong-tai-kim-cuong-vang-trang-14k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:45.000000', 311, 62, NULL, 'on-gbddddw004377-bong-tai-kim-cuong-vang-trang-14k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/223/on-gbddddw004377-bong-tai-kim-cuong-vang-trang-14k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:45.000000', 312, 62, NULL, 'on-gbddddw004377-bong-tai-kim-cuong-vang-trang-14k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/223/on-gbddddw004377-bong-tai-kim-cuong-vang-trang-14k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:45.000000', 313, 62, NULL, 'on-gbddddw004377-bong-tai-kim-cuong-vang-trang-14k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/223/on-gbddddw004377-bong-tai-kim-cuong-vang-trang-14k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:45.000000', 314, 63, NULL, 'sp-gbddddw004383-bong-tai-kim-cuong-vang-trang-14k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/223/sp-gbddddw004383-bong-tai-kim-cuong-vang-trang-14k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:45.000000', 315, 63, NULL, 'sp-gbddddw004383-bong-tai-kim-cuong-vang-trang-14k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/223/sp-gbddddw004383-bong-tai-kim-cuong-vang-trang-14k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:45.000000', 316, 63, NULL, 'on-gbddddw004383-bong-tai-kim-cuong-vang-trang-14k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/223/on-gbddddw004383-bong-tai-kim-cuong-vang-trang-14k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:45.000000', 317, 63, NULL, 'on-gbddddw004383-bong-tai-kim-cuong-vang-trang-14k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/223/on-gbddddw004383-bong-tai-kim-cuong-vang-trang-14k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:45.000000', 318, 63, NULL, 'on-gbddddw004383-bong-tai-kim-cuong-vang-trang-14k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/223/on-gbddddw004383-bong-tai-kim-cuong-vang-trang-14k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:45.000000', 319, 64, NULL, 'sp-gbdd00w001963-bong-tai-kim-cuong-vang-trang-14k-pnj-my-first-diamond-1.png', 'https://cdn.pnj.io/images/detailed/225/sp-gbdd00w001963-bong-tai-kim-cuong-vang-trang-14k-pnj-my-first-diamond-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:45.000000', 320, 64, NULL, 'sp-gbdd00w001963-bong-tai-kim-cuong-vang-trang-14k-pnj-my-first-diamond-2.png', 'https://cdn.pnj.io/images/detailed/225/sp-gbdd00w001963-bong-tai-kim-cuong-vang-trang-14k-pnj-my-first-diamond-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:45.000000', 321, 64, NULL, 'on-gbdd00w001963-bong-tai-kim-cuong-vang-trang-14k-pnj-my-first-diamond-1.jpg', 'https://cdn.pnj.io/images/detailed/225/on-gbdd00w001963-bong-tai-kim-cuong-vang-trang-14k-pnj-my-first-diamond-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:45.000000', 322, 64, NULL, 'on-gbdd00w001963-bong-tai-kim-cuong-vang-trang-14k-pnj-my-first-diamond-2.jpg', 'https://cdn.pnj.io/images/detailed/225/on-gbdd00w001963-bong-tai-kim-cuong-vang-trang-14k-pnj-my-first-diamond-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:45.000000', 323, 64, NULL, 'on-gbdd00w001963-bong-tai-kim-cuong-vang-trang-14k-pnj-my-first-diamond-3.jpg', 'https://cdn.pnj.io/images/detailed/225/on-gbdd00w001963-bong-tai-kim-cuong-vang-trang-14k-pnj-my-first-diamond-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:45.000000', 324, 65, NULL, 'sp-gbdd00w060191-bong-tai-kim-cuong-vang-trang-14k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/224/sp-gbdd00w060191-bong-tai-kim-cuong-vang-trang-14k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:45.000000', 325, 65, NULL, 'sp-gbdd00w060191-bong-tai-kim-cuong-vang-trang-14k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/224/sp-gbdd00w060191-bong-tai-kim-cuong-vang-trang-14k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:45.000000', 326, 65, NULL, 'on-gbdd00w060191-bong-tai-kim-cuong-vang-trang-14k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/224/on-gbdd00w060191-bong-tai-kim-cuong-vang-trang-14k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:45.000000', 327, 65, NULL, 'on-gbdd00w060191-bong-tai-kim-cuong-vang-trang-14k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/224/on-gbdd00w060191-bong-tai-kim-cuong-vang-trang-14k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:45.000000', 328, 65, NULL, 'on-gbdd00w060191-bong-tai-kim-cuong-vang-trang-14k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/224/on-gbdd00w060191-bong-tai-kim-cuong-vang-trang-14k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:45.000000', 329, 66, NULL, 'sp-gbdd00w060192-bong-tai-kim-cuong-vang-trang-14k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/231/sp-gbdd00w060192-bong-tai-kim-cuong-vang-trang-14k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:45.000000', 330, 66, NULL, 'sp-gbdd00w060192-bong-tai-kim-cuong-vang-trang-14k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/231/sp-gbdd00w060192-bong-tai-kim-cuong-vang-trang-14k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:45.000000', 331, 66, NULL, 'on-gbdd00w060192-bong-tai-kim-cuong-vang-trang-14k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/231/on-gbdd00w060192-bong-tai-kim-cuong-vang-trang-14k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:45.000000', 332, 66, NULL, 'on-gbdd00w060192-bong-tai-kim-cuong-vang-trang-14k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/231/on-gbdd00w060192-bong-tai-kim-cuong-vang-trang-14k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:45.000000', 333, 66, NULL, 'on-gbdd00w060192-bong-tai-kim-cuong-vang-trang-14k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/231/on-gbdd00w060192-bong-tai-kim-cuong-vang-trang-14k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:45.000000', 334, 67, NULL, 'sp-gbdd00w060193-bong-tai-kim-cuong-vang-trang-14k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/224/sp-gbdd00w060193-bong-tai-kim-cuong-vang-trang-14k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:45.000000', 335, 67, NULL, 'sp-gbdd00w060193-bong-tai-kim-cuong-vang-trang-14k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/224/sp-gbdd00w060193-bong-tai-kim-cuong-vang-trang-14k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:45.000000', 336, 67, NULL, 'on-gbdd00w060193-bong-tai-kim-cuong-vang-trang-14k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/224/on-gbdd00w060193-bong-tai-kim-cuong-vang-trang-14k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:45.000000', 337, 67, NULL, 'on-gbdd00w060193-bong-tai-kim-cuong-vang-trang-14k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/224/on-gbdd00w060193-bong-tai-kim-cuong-vang-trang-14k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:45.000000', 338, 67, NULL, 'on-gbdd00w060193-bong-tai-kim-cuong-vang-trang-14k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/224/on-gbdd00w060193-bong-tai-kim-cuong-vang-trang-14k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:45.000000', 339, 68, NULL, 'sp-gbdd00w060194-bong-tai-kim-cuong-vang-trang-14k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/231/sp-gbdd00w060194-bong-tai-kim-cuong-vang-trang-14k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:45.000000', 340, 68, NULL, 'sp-gbdd00w060194-bong-tai-kim-cuong-vang-trang-14k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/231/sp-gbdd00w060194-bong-tai-kim-cuong-vang-trang-14k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:45.000000', 341, 68, NULL, 'on-gbdd00w060194-bong-tai-kim-cuong-vang-trang-14k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/231/on-gbdd00w060194-bong-tai-kim-cuong-vang-trang-14k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:45.000000', 342, 68, NULL, 'on-gbdd00w060194-bong-tai-kim-cuong-vang-trang-14k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/231/on-gbdd00w060194-bong-tai-kim-cuong-vang-trang-14k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:45.000000', 343, 68, NULL, 'on-gbdd00w060194-bong-tai-kim-cuong-vang-trang-14k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/231/on-gbdd00w060194-bong-tai-kim-cuong-vang-trang-14k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:45.000000', 344, 69, NULL, 'sp-gb00ddw061426-bong-tai-kim-cuong-vang-trang-18k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/228/sp-gb00ddw061426-bong-tai-kim-cuong-vang-trang-18k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:45.000000', 345, 69, NULL, 'sp-gb00ddw061426-bong-tai-kim-cuong-vang-trang-18k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/228/sp-gb00ddw061426-bong-tai-kim-cuong-vang-trang-18k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:45.000000', 346, 69, NULL, 'on-gb00ddw061426-bong-tai-kim-cuong-vang-trang-18k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/228/on-gb00ddw061426-bong-tai-kim-cuong-vang-trang-18k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:45.000000', 347, 69, NULL, 'on-gb00ddw061426-bong-tai-kim-cuong-vang-trang-18k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/228/on-gb00ddw061426-bong-tai-kim-cuong-vang-trang-18k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:45.000000', 348, 69, NULL, 'on-gb00ddw061426-bong-tai-kim-cuong-vang-trang-18k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/228/on-gb00ddw061426-bong-tai-kim-cuong-vang-trang-18k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:45.000000', 349, 70, NULL, 'sp-gbddddw060403-bong-tai-kim-cuong-vang-trang-14k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/228/sp-gbddddw060403-bong-tai-kim-cuong-vang-trang-14k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:45.000000', 350, 70, NULL, 'sp-gbddddw060403-bong-tai-kim-cuong-vang-trang-14k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/228/sp-gbddddw060403-bong-tai-kim-cuong-vang-trang-14k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:45.000000', 351, 70, NULL, 'on-gbddddw060403-bong-tai-kim-cuong-vang-trang-14k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/228/on-gbddddw060403-bong-tai-kim-cuong-vang-trang-14k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:45.000000', 352, 70, NULL, 'on-gbddddw060403-bong-tai-kim-cuong-vang-trang-14k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/228/on-gbddddw060403-bong-tai-kim-cuong-vang-trang-14k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:45.000000', 353, 70, NULL, 'on-gbddddw060403-bong-tai-kim-cuong-vang-trang-14k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/228/on-gbddddw060403-bong-tai-kim-cuong-vang-trang-14k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:45.000000', 354, 71, NULL, 'sp-gbddddw060404-bong-tai-kim-cuong-vang-trang-14k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/228/sp-gbddddw060404-bong-tai-kim-cuong-vang-trang-14k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:45.000000', 355, 71, NULL, 'sp-gbddddw060404-bong-tai-kim-cuong-vang-trang-14k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/228/sp-gbddddw060404-bong-tai-kim-cuong-vang-trang-14k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:45.000000', 356, 71, NULL, 'sp-gbddddw060404-bong-tai-kim-cuong-vang-trang-14k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/228/sp-gbddddw060404-bong-tai-kim-cuong-vang-trang-14k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:45.000000', 357, 72, NULL, 'sp-gbddddw060405-bong-tai-kim-cuong-vang-trang-14k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/228/sp-gbddddw060405-bong-tai-kim-cuong-vang-trang-14k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:45.000000', 358, 72, NULL, 'sp-gbddddw060405-bong-tai-kim-cuong-vang-trang-14k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/228/sp-gbddddw060405-bong-tai-kim-cuong-vang-trang-14k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:45.000000', 359, 72, NULL, 'sp-gbddddw060405-bong-tai-kim-cuong-vang-trang-14k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/228/sp-gbddddw060405-bong-tai-kim-cuong-vang-trang-14k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:46.000000', 603, 122, NULL, 'sp-sbxmxmw000095-bong-tai-bac-dinh-da-pnjsilver-01.png', 'https://cdn.pnj.io/images/detailed/239/sp-sbxmxmw000095-bong-tai-bac-dinh-da-pnjsilver-01.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:46.000000', 604, 123, NULL, 'sp-sbztxmw000039-bong-tai-bac-dinh-da-style-by-pnj-bisou-1.png', 'https://cdn.pnj.io/images/detailed/237/sp-sbztxmw000039-bong-tai-bac-dinh-da-style-by-pnj-bisou-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:46.000000', 605, 123, NULL, 'sp-sbztxmw000039-bong-tai-bac-dinh-da-style-by-pnj-bisou-2.png', 'https://cdn.pnj.io/images/detailed/237/sp-sbztxmw000039-bong-tai-bac-dinh-da-style-by-pnj-bisou-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:46.000000', 606, 123, NULL, 'on-sbztxmw000039-bong-tai-bac-dinh-da-style-by-pnj-bisou-1.jpg', 'https://cdn.pnj.io/images/detailed/238/on-sbztxmw000039-bong-tai-bac-dinh-da-style-by-pnj-bisou-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:46.000000', 607, 123, NULL, 'on-sbztxmw000039-bong-tai-bac-dinh-da-style-by-pnj-bisou-2.jpg', 'https://cdn.pnj.io/images/detailed/238/on-sbztxmw000039-bong-tai-bac-dinh-da-style-by-pnj-bisou-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:46.000000', 608, 123, NULL, 'on-sbztxmw000039-bong-tai-bac-dinh-da-style-by-pnj-bisou-3.jpg', 'https://cdn.pnj.io/images/detailed/238/on-sbztxmw000039-bong-tai-bac-dinh-da-style-by-pnj-bisou-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:46.000000', 609, 124, NULL, 'sp-sbxm00w000065-bong-tai-tre-em-bac-dinh-da-pnjsilver-1.png', 'https://cdn.pnj.io/images/detailed/234/sp-sbxm00w000065-bong-tai-tre-em-bac-dinh-da-pnjsilver-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:46.000000', 610, 124, NULL, 'sp-sbxm00w000065-bong-tai-tre-em-bac-dinh-da-pnjsilver-2.png', 'https://cdn.pnj.io/images/detailed/234/sp-sbxm00w000065-bong-tai-tre-em-bac-dinh-da-pnjsilver-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:46.000000', 611, 125, NULL, 'sp-sbxm00w000063-bong-tai-tre-em-bac-dinh-da-pnjsilver-1.png', 'https://cdn.pnj.io/images/detailed/235/sp-sbxm00w000063-bong-tai-tre-em-bac-dinh-da-pnjsilver-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:46.000000', 612, 125, NULL, 'sp-sbxm00w000063-bong-tai-tre-em-bac-dinh-da-pnjsilver-2.png', 'https://cdn.pnj.io/images/detailed/235/sp-sbxm00w000063-bong-tai-tre-em-bac-dinh-da-pnjsilver-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:46.000000', 613, 126, NULL, 'sp-sbztxmw000040-bong-tai-bac-dinh-da-style-by-pnj-bisou-1.png', 'https://cdn.pnj.io/images/detailed/237/sp-sbztxmw000040-bong-tai-bac-dinh-da-style-by-pnj-bisou-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:46.000000', 614, 126, NULL, 'sp-sbztxmw000040-bong-tai-bac-dinh-da-style-by-pnj-bisou-2.png', 'https://cdn.pnj.io/images/detailed/237/sp-sbztxmw000040-bong-tai-bac-dinh-da-style-by-pnj-bisou-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:46.000000', 615, 126, NULL, 'on-sbztxmw000040-bong-tai-bac-dinh-da-style-by-pnj-bisou-1.jpg', 'https://cdn.pnj.io/images/detailed/238/on-sbztxmw000040-bong-tai-bac-dinh-da-style-by-pnj-bisou-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:46.000000', 616, 126, NULL, 'on-sbztxmw000040-bong-tai-bac-dinh-da-style-by-pnj-bisou-2.jpg', 'https://cdn.pnj.io/images/detailed/238/on-sbztxmw000040-bong-tai-bac-dinh-da-style-by-pnj-bisou-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:46.000000', 617, 126, NULL, 'on-sbztxmw000040-bong-tai-bac-dinh-da-style-by-pnj-bisou-3.jpg', 'https://cdn.pnj.io/images/detailed/238/on-sbztxmw000040-bong-tai-bac-dinh-da-style-by-pnj-bisou-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:46.000000', 618, 126, NULL, 'on-sbztxmw000040-bong-tai-bac-dinh-da-style-by-pnj-bisou-4.jpg', 'https://cdn.pnj.io/images/detailed/240/on-sbztxmw000040-bong-tai-bac-dinh-da-style-by-pnj-bisou-4.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:46.000000', 619, 126, NULL, 'on-sbztxmw000040-bong-tai-bac-dinh-da-style-by-pnj-bisou-5.jpg', 'https://cdn.pnj.io/images/detailed/240/on-sbztxmw000040-bong-tai-bac-dinh-da-style-by-pnj-bisou-5.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:46.000000', 620, 127, NULL, 'sp-sbztxmy000009-bong-tai-bac-dinh-da-style-by-pnj-bisous-1.png', 'https://cdn.pnj.io/images/detailed/239/sp-sbztxmy000009-bong-tai-bac-dinh-da-style-by-pnj-bisous-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:46.000000', 621, 127, NULL, 'sp-sbztxmy000009-bong-tai-bac-dinh-da-style-by-pnj-bisous-2.png', 'https://cdn.pnj.io/images/detailed/239/sp-sbztxmy000009-bong-tai-bac-dinh-da-style-by-pnj-bisous-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:46.000000', 622, 127, NULL, 'sp-sbztxmy000009-bong-tai-bac-dinh-da-style-by-pnj-bisous-3.png', 'https://cdn.pnj.io/images/detailed/239/sp-sbztxmy000009-bong-tai-bac-dinh-da-style-by-pnj-bisous-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:46.000000', 623, 127, NULL, 'on-sbztxmy000009-bong-tai-bac-dinh-da-style-by-pnj-bisous-1.jpg', 'https://cdn.pnj.io/images/detailed/239/on-sbztxmy000009-bong-tai-bac-dinh-da-style-by-pnj-bisous-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:46.000000', 624, 127, NULL, 'on-sbztxmy000009-bong-tai-bac-dinh-da-style-by-pnj-bisous-2.jpg', 'https://cdn.pnj.io/images/detailed/239/on-sbztxmy000009-bong-tai-bac-dinh-da-style-by-pnj-bisous-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:46.000000', 625, 127, NULL, 'on-sbztxmy000009-bong-tai-bac-dinh-da-style-by-pnj-bisous-3.jpg', 'https://cdn.pnj.io/images/detailed/239/on-sbztxmy000009-bong-tai-bac-dinh-da-style-by-pnj-bisous-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:46.000000', 626, 127, NULL, 'on-sbztxmy000009-bong-tai-bac-dinh-da-style-by-pnj-bisous-4.jpg', 'https://cdn.pnj.io/images/detailed/239/on-sbztxmy000009-bong-tai-bac-dinh-da-style-by-pnj-bisous-4.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:46.000000', 627, 128, NULL, 'sp-sbztxmy000010-bong-tai-bac-dinh-da-pnjsilver-1.png', 'https://cdn.pnj.io/images/detailed/237/sp-sbztxmy000010-bong-tai-bac-dinh-da-pnjsilver-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:46.000000', 628, 128, NULL, 'sp-sbztxmy000010-bong-tai-bac-dinh-da-pnjsilver-2.png', 'https://cdn.pnj.io/images/detailed/237/sp-sbztxmy000010-bong-tai-bac-dinh-da-pnjsilver-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:46.000000', 629, 129, NULL, 'sp-sbztxmw000036-bong-tai-bac-dinh-da-style-by-pnj-bisou-1.png', 'https://cdn.pnj.io/images/detailed/237/sp-sbztxmw000036-bong-tai-bac-dinh-da-style-by-pnj-bisou-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:46.000000', 630, 129, NULL, 'sp-sbztxmw000036-bong-tai-bac-dinh-da-style-by-pnj-bisou-002.png', 'https://cdn.pnj.io/images/detailed/238/sp-sbztxmw000036-bong-tai-bac-dinh-da-style-by-pnj-bisou-002.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:46.000000', 631, 129, NULL, 'sp-sbztxmw000036-bong-tai-bac-dinh-da-style-by-pnj-bisou-2.png', 'https://cdn.pnj.io/images/detailed/237/sp-sbztxmw000036-bong-tai-bac-dinh-da-style-by-pnj-bisou-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:46.000000', 632, 129, NULL, 'on-sbztxmw000036-bong-tai-bac-dinh-da-style-by-pnj-bisou-1.jpg', 'https://cdn.pnj.io/images/detailed/238/on-sbztxmw000036-bong-tai-bac-dinh-da-style-by-pnj-bisou-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:46.000000', 633, 129, NULL, 'on-sbztxmw000036-bong-tai-bac-dinh-da-style-by-pnj-bisou-2.jpg', 'https://cdn.pnj.io/images/detailed/238/on-sbztxmw000036-bong-tai-bac-dinh-da-style-by-pnj-bisou-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:46.000000', 634, 129, NULL, 'on-sbztxmw000036-bong-tai-bac-dinh-da-style-by-pnj-bisou-3.jpg', 'https://cdn.pnj.io/images/detailed/238/on-sbztxmw000036-bong-tai-bac-dinh-da-style-by-pnj-bisou-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:46.000000', 635, 129, NULL, 'on-sbztxmw000036-bong-tai-bac-dinh-da-style-by-pnj-bisou-4.jpg', 'https://cdn.pnj.io/images/detailed/240/on-sbztxmw000036-bong-tai-bac-dinh-da-style-by-pnj-bisou-4.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:46.000000', 636, 130, NULL, 'sp-sbzt00w000034-bong-tai-bac-dinh-da-style-by-pnj-bisou-1.png', 'https://cdn.pnj.io/images/detailed/237/sp-sbzt00w000034-bong-tai-bac-dinh-da-style-by-pnj-bisou-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:46.000000', 637, 130, NULL, 'sp-sbzt00w000034-bong-tai-bac-dinh-da-style-by-pnj-bisou-2.png', 'https://cdn.pnj.io/images/detailed/237/sp-sbzt00w000034-bong-tai-bac-dinh-da-style-by-pnj-bisou-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:46.000000', 638, 130, NULL, 'on-sbzt00w000034-bong-tai-bac-dinh-da-style-by-pnj-bisou-1.jpg', 'https://cdn.pnj.io/images/detailed/237/on-sbzt00w000034-bong-tai-bac-dinh-da-style-by-pnj-bisou-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:46.000000', 639, 130, NULL, 'on-sbzt00w000034-bong-tai-bac-dinh-da-style-by-pnj-bisou-2.jpg', 'https://cdn.pnj.io/images/detailed/238/on-sbzt00w000034-bong-tai-bac-dinh-da-style-by-pnj-bisou-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:46.000000', 640, 130, NULL, 'on-sbzt00w000034-bong-tai-bac-dinh-da-style-by-pnj-bisou-3.jpg', 'https://cdn.pnj.io/images/detailed/238/on-sbzt00w000034-bong-tai-bac-dinh-da-style-by-pnj-bisou-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:46.000000', 641, 131, NULL, 'SP-bong-tai-bac-dinh-da-style-by-pnj-bisou-ztxmw000037-1.png', 'https://cdn.pnj.io/images/detailed/238/SP-bong-tai-bac-dinh-da-style-by-pnj-bisou-ztxmw000037-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:46.000000', 642, 131, NULL, 'sp-sbztxmw000037-bong-tai-bac-dinh-da-style-by-pnj-bisou-2.png', 'https://cdn.pnj.io/images/detailed/237/sp-sbztxmw000037-bong-tai-bac-dinh-da-style-by-pnj-bisou-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:46.000000', 643, 131, NULL, 'on-sbztxmw000037-bong-tai-bac-dinh-da-style-by-pnj-bisou-1.jpg', 'https://cdn.pnj.io/images/detailed/238/on-sbztxmw000037-bong-tai-bac-dinh-da-style-by-pnj-bisou-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:46.000000', 644, 131, NULL, 'on-sbztxmw000037-bong-tai-bac-dinh-da-style-by-pnj-bisou-2.jpg', 'https://cdn.pnj.io/images/detailed/238/on-sbztxmw000037-bong-tai-bac-dinh-da-style-by-pnj-bisou-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:46.000000', 645, 131, NULL, 'on-sbztxmw000037-bong-tai-bac-dinh-da-style-by-pnj-bisou-3.jpg', 'https://cdn.pnj.io/images/detailed/238/on-sbztxmw000037-bong-tai-bac-dinh-da-style-by-pnj-bisou-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:46.000000', 646, 131, NULL, 'on-sbztxmw000037-bong-tai-bac-dinh-da-style-by-pnj-bisou-4.jpg', 'https://cdn.pnj.io/images/detailed/240/on-sbztxmw000037-bong-tai-bac-dinh-da-style-by-pnj-bisou-4.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:46.000000', 647, 132, NULL, 'sp-sbzt00h000007-bong-tai-bac-dinh-da-pnjsilver-1.png', 'https://cdn.pnj.io/images/detailed/237/sp-sbzt00h000007-bong-tai-bac-dinh-da-pnjsilver-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:46.000000', 648, 132, NULL, 'sp-sbzt00h000007-bong-tai-bac-dinh-da-pnjsilver-2.png', 'https://cdn.pnj.io/images/detailed/237/sp-sbzt00h000007-bong-tai-bac-dinh-da-pnjsilver-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:46.000000', 649, 133, NULL, 'sp-sbztxmh000016-bong-tai-bac-dinh-da-style-by-pnj-bisou-1.png', 'https://cdn.pnj.io/images/detailed/237/sp-sbztxmh000016-bong-tai-bac-dinh-da-style-by-pnj-bisou-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:46.000000', 650, 133, NULL, 'sp-sbztxmh000016-bong-tai-bac-dinh-da-style-by-pnj-bisou-2.png', 'https://cdn.pnj.io/images/detailed/237/sp-sbztxmh000016-bong-tai-bac-dinh-da-style-by-pnj-bisou-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:46.000000', 651, 133, NULL, 'on-sbztxmh000016-bong-tai-bac-dinh-da-style-by-pnj-bisou-1.jpg', 'https://cdn.pnj.io/images/detailed/238/on-sbztxmh000016-bong-tai-bac-dinh-da-style-by-pnj-bisou-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:46.000000', 652, 133, NULL, 'on-sbztxmh000016-bong-tai-bac-dinh-da-style-by-pnj-bisou-2.jpg', 'https://cdn.pnj.io/images/detailed/238/on-sbztxmh000016-bong-tai-bac-dinh-da-style-by-pnj-bisou-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:46.000000', 653, 133, NULL, 'on-sbztxmh000016-bong-tai-bac-dinh-da-style-by-pnj-bisou-3.jpg', 'https://cdn.pnj.io/images/detailed/238/on-sbztxmh000016-bong-tai-bac-dinh-da-style-by-pnj-bisou-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 858, 168, NULL, 'sp-si0000y060029-hat-charm-bac-dinh-da-pnjsilver-1.png', 'https://cdn.pnj.io/images/detailed/236/sp-si0000y060029-hat-charm-bac-dinh-da-pnjsilver-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 859, 168, NULL, 'sp-si0000y060029-hat-charm-bac-dinh-da-pnjsilver-2.png', 'https://cdn.pnj.io/images/detailed/236/sp-si0000y060029-hat-charm-bac-dinh-da-pnjsilver-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 860, 168, NULL, 'sp-si0000y060029-hat-charm-bac-dinh-da-pnjsilver-3.png', 'https://cdn.pnj.io/images/detailed/236/sp-si0000y060029-hat-charm-bac-dinh-da-pnjsilver-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 861, 168, NULL, 'on-si0000y060029-hat-charm-bac-dinh-da-pnjsilver-1.jpg', 'https://cdn.pnj.io/images/detailed/236/on-si0000y060029-hat-charm-bac-dinh-da-pnjsilver-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 862, 168, NULL, 'on-si0000y060029-hat-charm-bac-dinh-da-pnjsilver-2.jpg', 'https://cdn.pnj.io/images/detailed/236/on-si0000y060029-hat-charm-bac-dinh-da-pnjsilver-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 863, 168, NULL, 'on-si0000y060029-hat-charm-bac-dinh-da-pnjsilver-3.jpg', 'https://cdn.pnj.io/images/detailed/236/on-si0000y060029-hat-charm-bac-dinh-da-pnjsilver-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 864, 169, NULL, 'sp-sixm00w000076-hat-charm-bac-dinh-da-pnjsilver-1.png', 'https://cdn.pnj.io/images/detailed/237/sp-sixm00w000076-hat-charm-bac-dinh-da-pnjsilver-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 865, 169, NULL, 'sp-sixm00w000076-hat-charm-bac-dinh-da-pnjsilver-2.png', 'https://cdn.pnj.io/images/detailed/237/sp-sixm00w000076-hat-charm-bac-dinh-da-pnjsilver-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 866, 169, NULL, 'sp-sixm00w000076-hat-charm-bac-dinh-da-pnjsilver-3.png', 'https://cdn.pnj.io/images/detailed/237/sp-sixm00w000076-hat-charm-bac-dinh-da-pnjsilver-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 867, 169, NULL, 'on-sixm00w000076-hat-charm-bac-dinh-da-pnjsilver-1.jpg', 'https://cdn.pnj.io/images/detailed/237/on-sixm00w000076-hat-charm-bac-dinh-da-pnjsilver-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 868, 169, NULL, 'on-sixm00w000076-hat-charm-bac-dinh-da-pnjsilver-2.jpg', 'https://cdn.pnj.io/images/detailed/237/on-sixm00w000076-hat-charm-bac-dinh-da-pnjsilver-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 869, 169, NULL, 'on-sixm00w000076-hat-charm-bac-dinh-da-pnjsilver-3.jpg', 'https://cdn.pnj.io/images/detailed/237/on-sixm00w000076-hat-charm-bac-dinh-da-pnjsilver-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 870, 170, NULL, 'sp-sixmxmw000058-hat-charm-bac-dinh-da-pnjsilver-1.png', 'https://cdn.pnj.io/images/detailed/237/sp-sixmxmw000058-hat-charm-bac-dinh-da-pnjsilver-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 871, 170, NULL, 'sp-sixmxmw000058-hat-charm-bac-dinh-da-pnjsilver-2.png', 'https://cdn.pnj.io/images/detailed/237/sp-sixmxmw000058-hat-charm-bac-dinh-da-pnjsilver-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 872, 170, NULL, 'sp-sixmxmw000058-hat-charm-bac-dinh-da-pnjsilver-3.png', 'https://cdn.pnj.io/images/detailed/237/sp-sixmxmw000058-hat-charm-bac-dinh-da-pnjsilver-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 873, 170, NULL, 'on-sixmxmw000058-hat-charm-bac-dinh-da-pnjsilver-1.jpg', 'https://cdn.pnj.io/images/detailed/237/on-sixmxmw000058-hat-charm-bac-dinh-da-pnjsilver-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 874, 170, NULL, 'on-sixmxmw000058-hat-charm-bac-dinh-da-pnjsilver-2.jpg', 'https://cdn.pnj.io/images/detailed/237/on-sixmxmw000058-hat-charm-bac-dinh-da-pnjsilver-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 875, 170, NULL, 'on-sixmxmw000058-hat-charm-bac-dinh-da-pnjsilver-3.jpg', 'https://cdn.pnj.io/images/detailed/237/on-sixmxmw000058-hat-charm-bac-dinh-da-pnjsilver-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 876, 171, NULL, 'sp-siztxmx000005-hat-charm-bac-dinh-da-pnjsilver-1.png', 'https://cdn.pnj.io/images/detailed/237/sp-siztxmx000005-hat-charm-bac-dinh-da-pnjsilver-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 877, 171, NULL, 'sp-siztxmx000005-hat-charm-bac-dinh-da-pnjsilver-2.png', 'https://cdn.pnj.io/images/detailed/237/sp-siztxmx000005-hat-charm-bac-dinh-da-pnjsilver-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 878, 171, NULL, 'sp-siztxmx000005-hat-charm-bac-dinh-da-pnjsilver-3.png', 'https://cdn.pnj.io/images/detailed/237/sp-siztxmx000005-hat-charm-bac-dinh-da-pnjsilver-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 879, 171, NULL, 'on-siztxmx000005-hat-charm-bac-dinh-da-pnjsilver-1.jpg', 'https://cdn.pnj.io/images/detailed/237/on-siztxmx000005-hat-charm-bac-dinh-da-pnjsilver-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 880, 171, NULL, 'on-siztxmx000005-hat-charm-bac-dinh-da-pnjsilver-2.jpg', 'https://cdn.pnj.io/images/detailed/237/on-siztxmx000005-hat-charm-bac-dinh-da-pnjsilver-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 881, 171, NULL, 'on-siztxmx000005-hat-charm-bac-dinh-da-pnjsilver-3.jpg', 'https://cdn.pnj.io/images/detailed/237/on-siztxmx000005-hat-charm-bac-dinh-da-pnjsilver-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 882, 172, NULL, 'sp-gi0000y060355-hat-charm-vang-24k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/238/sp-gi0000y060355-hat-charm-vang-24k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 883, 172, NULL, 'sp-gi0000y060355-hat-charm-vang-24k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/238/sp-gi0000y060355-hat-charm-vang-24k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 884, 172, NULL, 'sp-gi0000y060355-hat-charm-vang-24k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/238/sp-gi0000y060355-hat-charm-vang-24k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 885, 172, NULL, 'on-gi0000y060355-hat-charm-vang-24k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/238/on-gi0000y060355-hat-charm-vang-24k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 886, 172, NULL, 'on-gi0000y060355-hat-charm-vang-24k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/238/on-gi0000y060355-hat-charm-vang-24k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 887, 172, NULL, 'on-gi0000y060355-hat-charm-vang-24k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/238/on-gi0000y060355-hat-charm-vang-24k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 888, 173, NULL, 'sp-gi0000y060356-hat-charm-vang-24k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/238/sp-gi0000y060356-hat-charm-vang-24k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 889, 173, NULL, 'sp-gi0000y060356-hat-charm-vang-24k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/238/sp-gi0000y060356-hat-charm-vang-24k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 890, 173, NULL, 'sp-gi0000y060356-hat-charm-vang-24k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/238/sp-gi0000y060356-hat-charm-vang-24k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 891, 173, NULL, 'on-gi0000y060356-hat-charm-vang-24k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/238/on-gi0000y060356-hat-charm-vang-24k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 892, 173, NULL, 'on-gi0000y060356-hat-charm-vang-24k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/238/on-gi0000y060356-hat-charm-vang-24k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 893, 173, NULL, 'on-gi0000y060356-hat-charm-vang-24k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/238/on-gi0000y060356-hat-charm-vang-24k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 894, 174, NULL, 'sp-gi0000y060357-hat-charm-vang-24k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/238/sp-gi0000y060357-hat-charm-vang-24k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 895, 174, NULL, 'sp-gi0000y060357-hat-charm-vang-24k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/238/sp-gi0000y060357-hat-charm-vang-24k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 896, 174, NULL, 'sp-gi0000y060357-hat-charm-vang-24k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/238/sp-gi0000y060357-hat-charm-vang-24k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 897, 174, NULL, 'on-gi0000y060357-hat-charm-vang-24k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/238/on-gi0000y060357-hat-charm-vang-24k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 898, 174, NULL, 'on-gi0000y060357-hat-charm-vang-24k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/238/on-gi0000y060357-hat-charm-vang-24k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 899, 174, NULL, 'on-gi0000y060357-hat-charm-vang-24k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/238/on-gi0000y060357-hat-charm-vang-24k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 900, 175, NULL, 'sp-gi0000y060358-hat-charm-vang-24k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/238/sp-gi0000y060358-hat-charm-vang-24k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 901, 175, NULL, 'sp-gi0000y060358-hat-charm-vang-24k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/238/sp-gi0000y060358-hat-charm-vang-24k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 902, 175, NULL, 'sp-gi0000y060358-hat-charm-vang-24k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/238/sp-gi0000y060358-hat-charm-vang-24k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 903, 175, NULL, 'on-gi0000y060358-hat-charm-vang-24k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/238/on-gi0000y060358-hat-charm-vang-24k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 904, 175, NULL, 'on-gi0000y060358-hat-charm-vang-24k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/238/on-gi0000y060358-hat-charm-vang-24k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 905, 175, NULL, 'on-gi0000y060358-hat-charm-vang-24k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/238/on-gi0000y060358-hat-charm-vang-24k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 906, 176, NULL, 'sp-gi0000y060359-hat-charm-vang-24k-pnj-01.png', 'https://cdn.pnj.io/images/detailed/236/sp-gi0000y060359-hat-charm-vang-24k-pnj-01.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 907, 176, NULL, 'sp-gi0000y060359-hat-charm-vang-24k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/238/sp-gi0000y060359-hat-charm-vang-24k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 908, 176, NULL, 'sp-gi0000y060359-hat-charm-vang-24k-pnj-02.png', 'https://cdn.pnj.io/images/detailed/236/sp-gi0000y060359-hat-charm-vang-24k-pnj-02.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 909, 176, NULL, 'sp-gi0000y060359-hat-charm-vang-24k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/238/sp-gi0000y060359-hat-charm-vang-24k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 910, 176, NULL, 'sp-gi0000y060359-hat-charm-vang-24k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/238/sp-gi0000y060359-hat-charm-vang-24k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 911, 176, NULL, 'on-gi0000y060359-hat-charm-vang-24k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/238/on-gi0000y060359-hat-charm-vang-24k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 912, 176, NULL, 'on-gi0000y060359-hat-charm-vang-24k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/238/on-gi0000y060359-hat-charm-vang-24k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 913, 176, NULL, 'on-gi0000y060359-hat-charm-vang-24k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/238/on-gi0000y060359-hat-charm-vang-24k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 914, 177, NULL, 'sp-gi0000y060360-hat-charm-vang-24k-pnj-01.png', 'https://cdn.pnj.io/images/detailed/236/sp-gi0000y060360-hat-charm-vang-24k-pnj-01.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 915, 177, NULL, 'sp-gi0000y060360-hat-charm-vang-24k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/238/sp-gi0000y060360-hat-charm-vang-24k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 916, 177, NULL, 'sp-gi0000y060360-hat-charm-vang-24k-pnj-02.png', 'https://cdn.pnj.io/images/detailed/236/sp-gi0000y060360-hat-charm-vang-24k-pnj-02.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 917, 177, NULL, 'sp-gi0000y060360-hat-charm-vang-24k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/238/sp-gi0000y060360-hat-charm-vang-24k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 918, 177, NULL, 'sp-gi0000y060360-hat-charm-vang-24k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/238/sp-gi0000y060360-hat-charm-vang-24k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 919, 177, NULL, 'on-gi0000y060360-hat-charm-vang-24k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/238/on-gi0000y060360-hat-charm-vang-24k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 920, 177, NULL, 'on-gi0000y060360-hat-charm-vang-24k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/238/on-gi0000y060360-hat-charm-vang-24k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 921, 177, NULL, 'on-gi0000y060360-hat-charm-vang-24k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/238/on-gi0000y060360-hat-charm-vang-24k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 941, 181, NULL, 'sp-gi0000y000608-hat-charm-vang-24k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/234/sp-gi0000y000608-hat-charm-vang-24k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 942, 181, NULL, 'sp-gi0000y000608-hat-charm-vang-24k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/234/sp-gi0000y000608-hat-charm-vang-24k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 943, 181, NULL, 'sp-gi0000y000608-hat-charm-vang-24k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/234/sp-gi0000y000608-hat-charm-vang-24k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 944, 181, NULL, 'on-gi0000y000608-hat-charm-vang-24k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/234/on-gi0000y000608-hat-charm-vang-24k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 945, 181, NULL, 'on-gi0000y000608-hat-charm-vang-24k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/234/on-gi0000y000608-hat-charm-vang-24k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:47.000000', 946, 181, NULL, 'on-gi0000y000608-hat-charm-vang-24k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/234/on-gi0000y000608-hat-charm-vang-24k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:48.000000', 1157, 216, NULL, 'sp-gd0000w061325-day-chuyen-vang-trang-y-18k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/236/sp-gd0000w061325-day-chuyen-vang-trang-y-18k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:48.000000', 1158, 216, NULL, 'sp-gd0000w061325-day-chuyen-vang-trang-y-18k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/236/sp-gd0000w061325-day-chuyen-vang-trang-y-18k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:48.000000', 1159, 216, NULL, 'sp-gd0000w061325-day-chuyen-vang-trang-y-18k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/236/sp-gd0000w061325-day-chuyen-vang-trang-y-18k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:48.000000', 1160, 216, NULL, 'ON-day-chuyen-vang-trang-y-18k-pnj-0000w061325-1.jpg', 'https://cdn.pnj.io/images/detailed/236/ON-day-chuyen-vang-trang-y-18k-pnj-0000w061325-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:48.000000', 1161, 216, NULL, 'ON-day-chuyen-vang-trang-y-18k-pnj-0000w061325-2.jpg', 'https://cdn.pnj.io/images/detailed/236/ON-day-chuyen-vang-trang-y-18k-pnj-0000w061325-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:48.000000', 1162, 216, NULL, 'ON-day-chuyen-vang-trang-y-18k-pnj-0000w061325-3.jpg', 'https://cdn.pnj.io/images/detailed/236/ON-day-chuyen-vang-trang-y-18k-pnj-0000w061325-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:48.000000', 1163, 217, NULL, 'sp-gd0000w061328-day-chuyen-vang-trang-y-18k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/236/sp-gd0000w061328-day-chuyen-vang-trang-y-18k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:48.000000', 1164, 217, NULL, 'sp-gd0000w061328-day-chuyen-vang-trang-y-18k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/236/sp-gd0000w061328-day-chuyen-vang-trang-y-18k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:48.000000', 1165, 217, NULL, 'sp-gd0000w061328-day-chuyen-vang-trang-y-18k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/236/sp-gd0000w061328-day-chuyen-vang-trang-y-18k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:48.000000', 1166, 217, NULL, 'on-gd0000w061328-day-chuyen-vang-trang-y-18k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/236/on-gd0000w061328-day-chuyen-vang-trang-y-18k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:48.000000', 1167, 217, NULL, 'on-gd0000w061328-day-chuyen-vang-trang-y-18k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/236/on-gd0000w061328-day-chuyen-vang-trang-y-18k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:48.000000', 1168, 217, NULL, 'on-gd0000w061328-day-chuyen-vang-trang-y-18k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/236/on-gd0000w061328-day-chuyen-vang-trang-y-18k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:48.000000', 1169, 218, NULL, 'sp-gd0000w061331-day-chuyen-vang-trang-y-18k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/235/sp-gd0000w061331-day-chuyen-vang-trang-y-18k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:48.000000', 1170, 218, NULL, 'sp-gd0000w061331-day-chuyen-vang-trang-y-18k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/235/sp-gd0000w061331-day-chuyen-vang-trang-y-18k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:48.000000', 1171, 218, NULL, 'sp-gd0000w061331-day-chuyen-vang-trang-y-18k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/235/sp-gd0000w061331-day-chuyen-vang-trang-y-18k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:48.000000', 1172, 218, NULL, 'on-gd0000w061331-day-chuyen-vang-trang-y-18k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/235/on-gd0000w061331-day-chuyen-vang-trang-y-18k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:48.000000', 1173, 218, NULL, 'on-gd0000w061331-day-chuyen-vang-trang-y-18k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/235/on-gd0000w061331-day-chuyen-vang-trang-y-18k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:48.000000', 1174, 218, NULL, 'on-gd0000w061331-day-chuyen-vang-trang-y-18k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/235/on-gd0000w061331-day-chuyen-vang-trang-y-18k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:48.000000', 1175, 219, NULL, 'sp-gd0000w061333-day-chuyen-vang-trang-y-18k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/236/sp-gd0000w061333-day-chuyen-vang-trang-y-18k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:48.000000', 1176, 219, NULL, 'sp-gd0000w061333-day-chuyen-vang-trang-y-18k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/236/sp-gd0000w061333-day-chuyen-vang-trang-y-18k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:48.000000', 1177, 219, NULL, 'sp-gd0000w061333-day-chuyen-vang-trang-y-18k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/236/sp-gd0000w061333-day-chuyen-vang-trang-y-18k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:48.000000', 1178, 219, NULL, 'on-gd0000w061333-day-chuyen-vang-trang-y-18k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/236/on-gd0000w061333-day-chuyen-vang-trang-y-18k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:48.000000', 1179, 219, NULL, 'on-gd0000w061333-day-chuyen-vang-trang-y-18k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/236/on-gd0000w061333-day-chuyen-vang-trang-y-18k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:48.000000', 1180, 219, NULL, 'on-gd0000w061333-day-chuyen-vang-trang-y-18k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/236/on-gd0000w061333-day-chuyen-vang-trang-y-18k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:48.000000', 1181, 220, NULL, 'sp-gd0000w061330-day-chuyen-vang-trang-y-18k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/237/sp-gd0000w061330-day-chuyen-vang-trang-y-18k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:48.000000', 1182, 220, NULL, 'sp-gd0000w061330-day-chuyen-vang-trang-y-18k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/237/sp-gd0000w061330-day-chuyen-vang-trang-y-18k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:48.000000', 1183, 220, NULL, 'sp-gd0000w061330-day-chuyen-vang-trang-y-18k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/237/sp-gd0000w061330-day-chuyen-vang-trang-y-18k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:48.000000', 1184, 220, NULL, 'on-gd0000w061330-day-chuyen-vang-trang-y-18k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/237/on-gd0000w061330-day-chuyen-vang-trang-y-18k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:48.000000', 1185, 220, NULL, 'on-gd0000w061330-day-chuyen-vang-trang-y-18k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/237/on-gd0000w061330-day-chuyen-vang-trang-y-18k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:48.000000', 1186, 220, NULL, 'on-gd0000w061330-day-chuyen-vang-trang-y-18k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/237/on-gd0000w061330-day-chuyen-vang-trang-y-18k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:48.000000', 1187, 221, NULL, 'sp-gd0000w061332-day-chuyen-vang-trang-y-18k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/237/sp-gd0000w061332-day-chuyen-vang-trang-y-18k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:48.000000', 1188, 221, NULL, 'sp-gd0000w061332-day-chuyen-vang-trang-y-18k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/237/sp-gd0000w061332-day-chuyen-vang-trang-y-18k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:48.000000', 1189, 221, NULL, 'sp-gd0000w061332-day-chuyen-vang-trang-y-18k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/237/sp-gd0000w061332-day-chuyen-vang-trang-y-18k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:48.000000', 1190, 221, NULL, 'on-gd0000w061332-day-chuyen-vang-trang-y-18k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/237/on-gd0000w061332-day-chuyen-vang-trang-y-18k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:48.000000', 1191, 221, NULL, 'on-gd0000w061332-day-chuyen-vang-trang-y-18k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/237/on-gd0000w061332-day-chuyen-vang-trang-y-18k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:48.000000', 1192, 221, NULL, 'on-gd0000w061332-day-chuyen-vang-trang-y-18k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/237/on-gd0000w061332-day-chuyen-vang-trang-y-18k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:48.000000', 1193, 222, NULL, 'sp-gd0000w001418-day-chuyen-vang-trang-y-18k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/237/sp-gd0000w001418-day-chuyen-vang-trang-y-18k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:48.000000', 1194, 222, NULL, 'sp-gd0000w001418-day-chuyen-vang-trang-y-18k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/237/sp-gd0000w001418-day-chuyen-vang-trang-y-18k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:48.000000', 1195, 222, NULL, 'sp-gd0000w001418-day-chuyen-vang-trang-y-18k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/237/sp-gd0000w001418-day-chuyen-vang-trang-y-18k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:48.000000', 1196, 222, NULL, 'on-gd0000w001418-day-chuyen-vang-trang-y-18k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/237/on-gd0000w001418-day-chuyen-vang-trang-y-18k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:48.000000', 1197, 222, NULL, 'on-gd0000w001418-day-chuyen-vang-trang-y-18k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/237/on-gd0000w001418-day-chuyen-vang-trang-y-18k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:48.000000', 1198, 222, NULL, 'on-gd0000w001418-day-chuyen-vang-trang-y-18k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/237/on-gd0000w001418-day-chuyen-vang-trang-y-18k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:48.000000', 1199, 223, NULL, 'sp-gd0000w001419-day-chuyen-vang-trang-y-18k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/237/sp-gd0000w001419-day-chuyen-vang-trang-y-18k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:48.000000', 1200, 223, NULL, 'sp-gd0000w001419-day-chuyen-vang-trang-y-18k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/237/sp-gd0000w001419-day-chuyen-vang-trang-y-18k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:48.000000', 1201, 223, NULL, 'sp-gd0000w001419-day-chuyen-vang-trang-y-18k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/237/sp-gd0000w001419-day-chuyen-vang-trang-y-18k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:48.000000', 1202, 223, NULL, 'on-gd0000w001419-day-chuyen-vang-trang-y-18k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/237/on-gd0000w001419-day-chuyen-vang-trang-y-18k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:48.000000', 1203, 223, NULL, 'on-gd0000w001419-day-chuyen-vang-trang-y-18k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/237/on-gd0000w001419-day-chuyen-vang-trang-y-18k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:48.000000', 1204, 223, NULL, 'on-gd0000w001419-day-chuyen-vang-trang-y-18k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/237/on-gd0000w001419-day-chuyen-vang-trang-y-18k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:48.000000', 1205, 224, NULL, 'sp-gd0000w061327-day-chuyen-vang-trang-y-18k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/237/sp-gd0000w061327-day-chuyen-vang-trang-y-18k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:48.000000', 1206, 224, NULL, 'sp-gd0000w061327-day-chuyen-vang-trang-y-18k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/237/sp-gd0000w061327-day-chuyen-vang-trang-y-18k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:48.000000', 1207, 224, NULL, 'sp-gd0000w061327-day-chuyen-vang-trang-y-18k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/237/sp-gd0000w061327-day-chuyen-vang-trang-y-18k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:48.000000', 1208, 224, NULL, 'on-gd0000w061327-day-chuyen-vang-trang-y-18k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/237/on-gd0000w061327-day-chuyen-vang-trang-y-18k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1209, 224, NULL, 'on-gd0000w061327-day-chuyen-vang-trang-y-18k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/237/on-gd0000w061327-day-chuyen-vang-trang-y-18k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1210, 224, NULL, 'on-gd0000w061327-day-chuyen-vang-trang-y-18k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/237/on-gd0000w061327-day-chuyen-vang-trang-y-18k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1241, 230, NULL, 'sp-sd0000w060003-day-chuyen-bac-pnjsilver-kieu-dai-ret.png', 'https://cdn.pnj.io/images/detailed/228/sp-sd0000w060003-day-chuyen-bac-pnjsilver-kieu-dai-ret.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1242, 230, NULL, 'gd0000w060003-day-chuyen-bac-pnjsilver-kieu-dai-ret-01.png', 'https://cdn.pnj.io/images/detailed/98/gd0000w060003-day-chuyen-bac-pnjsilver-kieu-dai-ret-01.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1243, 230, NULL, 'gd0000w060003-day-chuyen-bac-pnjsilver-kieu-dai-ret-02.png', 'https://cdn.pnj.io/images/detailed/98/gd0000w060003-day-chuyen-bac-pnjsilver-kieu-dai-ret-02.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1244, 230, NULL, 'gd0000w060003-day-chuyen-bac-pnjsilver-kieu-dai-ret-03.jpg', 'https://cdn.pnj.io/images/detailed/98/gd0000w060003-day-chuyen-bac-pnjsilver-kieu-dai-ret-03.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1245, 231, NULL, 'sd0000w060009-day-chuyen-bac-y-pnjsilver.png', 'https://cdn.pnj.io/images/detailed/82/sd0000w060009-day-chuyen-bac-y-pnjsilver.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1246, 231, NULL, 'sd0000w060009-day-chuyen-bac-y-pnjsilver-1.png', 'https://cdn.pnj.io/images/detailed/82/sd0000w060009-day-chuyen-bac-y-pnjsilver-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1247, 231, NULL, 'sd0000w060009-day-chuyen-bac-y-pnjsilver-2.png', 'https://cdn.pnj.io/images/detailed/82/sd0000w060009-day-chuyen-bac-y-pnjsilver-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1248, 231, NULL, 'sd0000w060009-day-chuyen-bac-y-pnjsilver-3.jpg', 'https://cdn.pnj.io/images/detailed/82/sd0000w060009-day-chuyen-bac-y-pnjsilver-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1291, 240, NULL, 'sp-pd0000w060020-day-chuyen-bach-kim-dinh-kim-cuong-pnj-1.png', 'https://cdn.pnj.io/images/detailed/240/sp-pd0000w060020-day-chuyen-bach-kim-dinh-kim-cuong-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1292, 240, NULL, 'sp-pd0000w060020-day-chuyen-bach-kim-dinh-kim-cuong-pnj-2.png', 'https://cdn.pnj.io/images/detailed/240/sp-pd0000w060020-day-chuyen-bach-kim-dinh-kim-cuong-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1293, 240, NULL, 'sp-pd0000w060020-day-chuyen-bach-kim-dinh-kim-cuong-pnj-3.png', 'https://cdn.pnj.io/images/detailed/240/sp-pd0000w060020-day-chuyen-bach-kim-dinh-kim-cuong-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1294, 240, NULL, 'on-pd0000w060020-day-chuyen-bach-kim-dinh-kim-cuong-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/240/on-pd0000w060020-day-chuyen-bach-kim-dinh-kim-cuong-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1295, 240, NULL, 'on-pd0000w060020-day-chuyen-bach-kim-dinh-kim-cuong-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/240/on-pd0000w060020-day-chuyen-bach-kim-dinh-kim-cuong-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1296, 240, NULL, 'on-pd0000w060020-day-chuyen-bach-kim-dinh-kim-cuong-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/240/on-pd0000w060020-day-chuyen-bach-kim-dinh-kim-cuong-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1297, 241, NULL, 'sp-pd0000w060021-day-chuyen-bach-kim-dinh-kim-cuong-pnj-1.png', 'https://cdn.pnj.io/images/detailed/240/sp-pd0000w060021-day-chuyen-bach-kim-dinh-kim-cuong-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1298, 241, NULL, 'sp-pd0000w060021-day-chuyen-bach-kim-dinh-kim-cuong-pnj-2.png', 'https://cdn.pnj.io/images/detailed/240/sp-pd0000w060021-day-chuyen-bach-kim-dinh-kim-cuong-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1299, 241, NULL, 'sp-pd0000w060021-day-chuyen-bach-kim-dinh-kim-cuong-pnj-3.png', 'https://cdn.pnj.io/images/detailed/240/sp-pd0000w060021-day-chuyen-bach-kim-dinh-kim-cuong-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1300, 241, NULL, 'on-pd0000w060021-day-chuyen-bach-kim-dinh-kim-cuong-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/240/on-pd0000w060021-day-chuyen-bach-kim-dinh-kim-cuong-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1301, 241, NULL, 'on-pd0000w060021-day-chuyen-bach-kim-dinh-kim-cuong-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/240/on-pd0000w060021-day-chuyen-bach-kim-dinh-kim-cuong-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1302, 241, NULL, 'on-pd0000w060021-day-chuyen-bach-kim-dinh-kim-cuong-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/240/on-pd0000w060021-day-chuyen-bach-kim-dinh-kim-cuong-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1303, 242, NULL, 'sp-pd0000w060022-day-chuyen-bach-kim-dinh-kim-cuong-pnj-1.png', 'https://cdn.pnj.io/images/detailed/240/sp-pd0000w060022-day-chuyen-bach-kim-dinh-kim-cuong-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1304, 242, NULL, 'sp-pd0000w060022-day-chuyen-bach-kim-dinh-kim-cuong-pnj-2.png', 'https://cdn.pnj.io/images/detailed/240/sp-pd0000w060022-day-chuyen-bach-kim-dinh-kim-cuong-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1305, 242, NULL, 'sp-pd0000w060022-day-chuyen-bach-kim-dinh-kim-cuong-pnj-3.png', 'https://cdn.pnj.io/images/detailed/240/sp-pd0000w060022-day-chuyen-bach-kim-dinh-kim-cuong-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1306, 242, NULL, 'on-pd0000w060022-day-chuyen-bach-kim-dinh-kim-cuong-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/240/on-pd0000w060022-day-chuyen-bach-kim-dinh-kim-cuong-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1307, 242, NULL, 'on-pd0000w060022-day-chuyen-bach-kim-dinh-kim-cuong-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/240/on-pd0000w060022-day-chuyen-bach-kim-dinh-kim-cuong-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1308, 242, NULL, 'on-pd0000w060022-day-chuyen-bach-kim-dinh-kim-cuong-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/240/on-pd0000w060022-day-chuyen-bach-kim-dinh-kim-cuong-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1309, 243, NULL, 'sp-pd0000w060023-day-chuyen-bach-kim-dinh-kim-cuong-pnj-1.png', 'https://cdn.pnj.io/images/detailed/240/sp-pd0000w060023-day-chuyen-bach-kim-dinh-kim-cuong-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1310, 243, NULL, 'sp-pd0000w060023-day-chuyen-bach-kim-dinh-kim-cuong-pnj-2.png', 'https://cdn.pnj.io/images/detailed/240/sp-pd0000w060023-day-chuyen-bach-kim-dinh-kim-cuong-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1311, 243, NULL, 'sp-pd0000w060023-day-chuyen-bach-kim-dinh-kim-cuong-pnj-3.png', 'https://cdn.pnj.io/images/detailed/240/sp-pd0000w060023-day-chuyen-bach-kim-dinh-kim-cuong-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1312, 243, NULL, 'on-pd0000w060023-day-chuyen-bach-kim-dinh-kim-cuong-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/240/on-pd0000w060023-day-chuyen-bach-kim-dinh-kim-cuong-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1313, 243, NULL, 'on-pd0000w060023-day-chuyen-bach-kim-dinh-kim-cuong-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/240/on-pd0000w060023-day-chuyen-bach-kim-dinh-kim-cuong-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1314, 243, NULL, 'on-pd0000w060023-day-chuyen-bach-kim-dinh-kim-cuong-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/240/on-pd0000w060023-day-chuyen-bach-kim-dinh-kim-cuong-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1315, 244, NULL, 'pd0000w060007-day-chuyen-bach-kim-pnj-001.png', 'https://cdn.pnj.io/images/detailed/101/pd0000w060007-day-chuyen-bach-kim-pnj-001.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1316, 244, NULL, 'pd0000w060007-day-chuyen-bach-kim-pnj-1.png', 'https://cdn.pnj.io/images/detailed/100/pd0000w060007-day-chuyen-bach-kim-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1317, 244, NULL, 'pd0000w060007-day-chuyen-bach-kim-pnj-2.png', 'https://cdn.pnj.io/images/detailed/100/pd0000w060007-day-chuyen-bach-kim-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1318, 244, NULL, 'pd0000w060007-day-chuyen-bach-kim-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/100/pd0000w060007-day-chuyen-bach-kim-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1334, 248, NULL, 'sp-scxmxmw060176-day-co-bac-dinh-da-pnjsilver-1.png', 'https://cdn.pnj.io/images/detailed/234/sp-scxmxmw060176-day-co-bac-dinh-da-pnjsilver-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1335, 248, NULL, 'sp-scxmxmw060176-day-co-bac-dinh-da-pnjsilver-2.png', 'https://cdn.pnj.io/images/detailed/234/sp-scxmxmw060176-day-co-bac-dinh-da-pnjsilver-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1336, 248, NULL, 'sp-scxmxmw060176-day-co-bac-dinh-da-pnjsilver-3.png', 'https://cdn.pnj.io/images/detailed/234/sp-scxmxmw060176-day-co-bac-dinh-da-pnjsilver-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1337, 248, NULL, 'on-scxmxmw060176-day-co-bac-dinh-da-pnjsilver-1.jpg', 'https://cdn.pnj.io/images/detailed/234/on-scxmxmw060176-day-co-bac-dinh-da-pnjsilver-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1338, 248, NULL, 'on-scxmxmw060176-day-co-bac-dinh-da-pnjsilver-2.jpg', 'https://cdn.pnj.io/images/detailed/234/on-scxmxmw060176-day-co-bac-dinh-da-pnjsilver-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1339, 248, NULL, 'on-scxmxmw060176-day-co-bac-dinh-da-pnjsilver-3.jpg', 'https://cdn.pnj.io/images/detailed/234/on-scxmxmw060176-day-co-bac-dinh-da-pnjsilver-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1340, 249, NULL, 'sp-scxmxmw060177-day-co-bac-dinh-da-pnjsilver-1.png', 'https://cdn.pnj.io/images/detailed/237/sp-scxmxmw060177-day-co-bac-dinh-da-pnjsilver-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1341, 249, NULL, 'sp-scxmxmw060177-day-co-bac-dinh-da-pnjsilver-2.png', 'https://cdn.pnj.io/images/detailed/237/sp-scxmxmw060177-day-co-bac-dinh-da-pnjsilver-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1342, 249, NULL, 'sp-scxmxmw060177-day-co-bac-dinh-da-pnjsilver-3.png', 'https://cdn.pnj.io/images/detailed/237/sp-scxmxmw060177-day-co-bac-dinh-da-pnjsilver-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1343, 249, NULL, 'on-scxmxmw060177-day-co-bac-dinh-da-pnjsilver-1.jpg', 'https://cdn.pnj.io/images/detailed/237/on-scxmxmw060177-day-co-bac-dinh-da-pnjsilver-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1344, 249, NULL, 'on-scxmxmw060177-day-co-bac-dinh-da-pnjsilver-2.jpg', 'https://cdn.pnj.io/images/detailed/237/on-scxmxmw060177-day-co-bac-dinh-da-pnjsilver-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1345, 249, NULL, 'on-scxmxmw060177-day-co-bac-dinh-da-pnjsilver-3.jpg', 'https://cdn.pnj.io/images/detailed/237/on-scxmxmw060177-day-co-bac-dinh-da-pnjsilver-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1346, 250, NULL, 'sp-scxmxmw060178-day-co-bac-dinh-da-pnjsilver-1.png', 'https://cdn.pnj.io/images/detailed/237/sp-scxmxmw060178-day-co-bac-dinh-da-pnjsilver-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1347, 250, NULL, 'sp-scxmxmw060178-day-co-bac-dinh-da-pnjsilver-2.png', 'https://cdn.pnj.io/images/detailed/237/sp-scxmxmw060178-day-co-bac-dinh-da-pnjsilver-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1348, 250, NULL, 'sp-scxmxmw060178-day-co-bac-dinh-da-pnjsilver-3.png', 'https://cdn.pnj.io/images/detailed/237/sp-scxmxmw060178-day-co-bac-dinh-da-pnjsilver-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1349, 250, NULL, 'on-scxmxmw060178-day-co-bac-dinh-da-pnjsilver-1.jpg', 'https://cdn.pnj.io/images/detailed/237/on-scxmxmw060178-day-co-bac-dinh-da-pnjsilver-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1350, 250, NULL, 'on-scxmxmw060178-day-co-bac-dinh-da-pnjsilver-2.jpg', 'https://cdn.pnj.io/images/detailed/237/on-scxmxmw060178-day-co-bac-dinh-da-pnjsilver-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1351, 250, NULL, 'on-scxmxmw060178-day-co-bac-dinh-da-pnjsilver-3.jpg', 'https://cdn.pnj.io/images/detailed/237/on-scxmxmw060178-day-co-bac-dinh-da-pnjsilver-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1400, 261, NULL, 'sp-gcddddw060185-day-co-kim-cuong-vang-trang-18k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/235/sp-gcddddw060185-day-co-kim-cuong-vang-trang-18k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1401, 261, NULL, 'sp-gcddddw060185-day-co-kim-cuong-vang-trang-18k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/235/sp-gcddddw060185-day-co-kim-cuong-vang-trang-18k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1402, 261, NULL, 'sp-gcddddw060185-day-co-kim-cuong-vang-trang-18k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/235/sp-gcddddw060185-day-co-kim-cuong-vang-trang-18k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1403, 261, NULL, 'on-gcddddw060185-day-co-kim-cuong-vang-trang-18k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/235/on-gcddddw060185-day-co-kim-cuong-vang-trang-18k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1404, 261, NULL, 'on-gcddddw060185-day-co-kim-cuong-vang-trang-18k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/235/on-gcddddw060185-day-co-kim-cuong-vang-trang-18k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1405, 261, NULL, 'on-gcddddw060185-day-co-kim-cuong-vang-trang-18k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/235/on-gcddddw060185-day-co-kim-cuong-vang-trang-18k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1406, 262, NULL, 'sp-gcztxmy000114-day-co-vang-10k-dinh-da-synthetic-pnj-01.png', 'https://cdn.pnj.io/images/detailed/237/sp-gcztxmy000114-day-co-vang-10k-dinh-da-synthetic-pnj-01.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1407, 262, NULL, 'sp-gcztxmy000114-day-co-vang-10k-dinh-da-synthetic-pnj-02.png', 'https://cdn.pnj.io/images/detailed/237/sp-gcztxmy000114-day-co-vang-10k-dinh-da-synthetic-pnj-02.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1420, 266, NULL, 'sp-gcddddw000787-day-co-kim-cuong-vang-trang-14k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/239/sp-gcddddw000787-day-co-kim-cuong-vang-trang-14k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1421, 266, NULL, 'sp-gcddddw000787-day-co-kim-cuong-vang-trang-14k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/239/sp-gcddddw000787-day-co-kim-cuong-vang-trang-14k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1422, 266, NULL, 'sp-gcddddw000787-day-co-kim-cuong-vang-trang-14k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/239/sp-gcddddw000787-day-co-kim-cuong-vang-trang-14k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1423, 266, NULL, 'on-gcddddw000787-day-co-kim-cuong-vang-trang-14k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/239/on-gcddddw000787-day-co-kim-cuong-vang-trang-14k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1424, 266, NULL, 'on-gcddddw000787-day-co-kim-cuong-vang-trang-14k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/239/on-gcddddw000787-day-co-kim-cuong-vang-trang-14k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1425, 266, NULL, 'on-gcddddw000787-day-co-kim-cuong-vang-trang-14k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/239/on-gcddddw000787-day-co-kim-cuong-vang-trang-14k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1426, 267, NULL, 'sp-gcxmxmw000501-day-co-vang-dinh-da-ecz-pnj-1.png', 'https://cdn.pnj.io/images/detailed/239/sp-gcxmxmw000501-day-co-vang-dinh-da-ecz-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1427, 267, NULL, 'sp-gcxmxmw000501-day-co-vang-dinh-da-ecz-pnj-2.png', 'https://cdn.pnj.io/images/detailed/239/sp-gcxmxmw000501-day-co-vang-dinh-da-ecz-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1428, 267, NULL, 'sp-gcxmxmw000501-day-co-vang-dinh-da-ecz-pnj-3.png', 'https://cdn.pnj.io/images/detailed/239/sp-gcxmxmw000501-day-co-vang-dinh-da-ecz-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1429, 267, NULL, 'on-gcxmxmw000501-day-co-vang-dinh-da-ecz-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/239/on-gcxmxmw000501-day-co-vang-dinh-da-ecz-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1430, 267, NULL, 'on-gcxmxmw000501-day-co-vang-dinh-da-ecz-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/239/on-gcxmxmw000501-day-co-vang-dinh-da-ecz-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:49.000000', 1431, 267, NULL, 'ON-day-co-vang-trang-14k-dinh-da-ecz-pnj-xmxmw000501-1.jpg', 'https://cdn.pnj.io/images/detailed/239/ON-day-co-vang-trang-14k-dinh-da-ecz-pnj-xmxmw000501-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1605, 296, NULL, 'sp-gh0000y060000-kieng-cuoi-vang-24k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/215/sp-gh0000y060000-kieng-cuoi-vang-24k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1606, 296, NULL, 'sp-gh0000y060000-kieng-cuoi-vang-24k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/215/sp-gh0000y060000-kieng-cuoi-vang-24k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1607, 296, NULL, 'sp-gh0000y060000-kieng-cuoi-vang-24k-pnj-4.png', 'https://cdn.pnj.io/images/detailed/215/sp-gh0000y060000-kieng-cuoi-vang-24k-pnj-4.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1608, 296, NULL, 'gh0000y060000-kieng-cuoi-vang-24k-pnj-01.png', 'https://cdn.pnj.io/images/detailed/98/gh0000y060000-kieng-cuoi-vang-24k-pnj-01.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1609, 296, NULL, 'on-gh0000y060000-kieng-cuoi-vang-24k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/215/on-gh0000y060000-kieng-cuoi-vang-24k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1610, 296, NULL, 'on-gh0000y060000-kieng-cuoi-vang-24k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/215/on-gh0000y060000-kieng-cuoi-vang-24k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1611, 296, NULL, 'on-gh0000y060000-kieng-cuoi-vang-24k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/215/on-gh0000y060000-kieng-cuoi-vang-24k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1612, 297, NULL, 'sp-gh0000y060001-kieng-cuoi-vang-24k-pnj.png', 'https://cdn.pnj.io/images/detailed/229/sp-gh0000y060001-kieng-cuoi-vang-24k-pnj.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1613, 297, NULL, 'sp-gh0000y060001-kieng-cuoi-vang-24k-pnj-01.png', 'https://cdn.pnj.io/images/detailed/229/sp-gh0000y060001-kieng-cuoi-vang-24k-pnj-01.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1614, 297, NULL, 'sp-gh0000y060001-kieng-cuoi-vang-24k-pnj-02.png', 'https://cdn.pnj.io/images/detailed/229/sp-gh0000y060001-kieng-cuoi-vang-24k-pnj-02.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1615, 297, NULL, 'sp-gh0000y060001-kieng-cuoi-vang-24k-pnj-03.png', 'https://cdn.pnj.io/images/detailed/229/sp-gh0000y060001-kieng-cuoi-vang-24k-pnj-03.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1616, 297, NULL, 'on-gh0000y060001-kieng-cuoi-vang-24k-pnj.jpg', 'https://cdn.pnj.io/images/detailed/229/on-gh0000y060001-kieng-cuoi-vang-24k-pnj.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1617, 297, NULL, 'on-gh0000y060001-kieng-cuoi-vang-24k-pnj-01.jpg', 'https://cdn.pnj.io/images/detailed/229/on-gh0000y060001-kieng-cuoi-vang-24k-pnj-01.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1618, 297, NULL, 'on-gh0000y060001-kieng-cuoi-vang-24k-pnj-02.jpg', 'https://cdn.pnj.io/images/detailed/229/on-gh0000y060001-kieng-cuoi-vang-24k-pnj-02.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1619, 298, NULL, 'sp-gh0000y060009-kieng-cuoi-vang-24k-pnj.png', 'https://cdn.pnj.io/images/detailed/229/sp-gh0000y060009-kieng-cuoi-vang-24k-pnj.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1620, 298, NULL, 'sp-gh0000y060009-kieng-cuoi-vang-24k-pnj-01.png', 'https://cdn.pnj.io/images/detailed/229/sp-gh0000y060009-kieng-cuoi-vang-24k-pnj-01.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1621, 298, NULL, 'sp-gh0000y060009-kieng-cuoi-vang-24k-pnj-02.png', 'https://cdn.pnj.io/images/detailed/229/sp-gh0000y060009-kieng-cuoi-vang-24k-pnj-02.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1622, 298, NULL, 'sp-gh0000y060009-kieng-cuoi-vang-24k-pnj-03.png', 'https://cdn.pnj.io/images/detailed/229/sp-gh0000y060009-kieng-cuoi-vang-24k-pnj-03.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1623, 298, NULL, 'on-gh0000y060009-kieng-cuoi-vang-24k-pn-01.jpg', 'https://cdn.pnj.io/images/detailed/229/on-gh0000y060009-kieng-cuoi-vang-24k-pn-01.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1624, 298, NULL, 'on-gh0000y060009-kieng-cuoi-vang-24k-pn-02.jpg', 'https://cdn.pnj.io/images/detailed/229/on-gh0000y060009-kieng-cuoi-vang-24k-pn-02.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1625, 298, NULL, 'on-gh0000y060009-kieng-cuoi-vang-24k-pnj.jpg', 'https://cdn.pnj.io/images/detailed/229/on-gh0000y060009-kieng-cuoi-vang-24k-pnj.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1626, 299, NULL, 'sp-sh0000w060015-kieng-bac-y-pnjsilver-kieu-dai-xoan-tron-1.png', 'https://cdn.pnj.io/images/detailed/217/sp-sh0000w060015-kieng-bac-y-pnjsilver-kieu-dai-xoan-tron-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1627, 299, NULL, 'sp-sh0000w060015-kieng-bac-y-pnjsilver-kieu-dai-xoan-tron-2.png', 'https://cdn.pnj.io/images/detailed/217/sp-sh0000w060015-kieng-bac-y-pnjsilver-kieu-dai-xoan-tron-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1628, 299, NULL, 'sp-sh0000w060015-kieng-bac-y-pnjsilver-kieu-dai-xoan-tron-3.png', 'https://cdn.pnj.io/images/detailed/217/sp-sh0000w060015-kieng-bac-y-pnjsilver-kieu-dai-xoan-tron-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1629, 299, NULL, 'on-sh0000w060015-kieng-bac-y-pnjsilver-kieu-dai-xoan-tron-1.jpg', 'https://cdn.pnj.io/images/detailed/217/on-sh0000w060015-kieng-bac-y-pnjsilver-kieu-dai-xoan-tron-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1630, 299, NULL, 'on-sh0000w060015-kieng-bac-y-pnjsilver-kieu-dai-xoan-tron-2.jpg', 'https://cdn.pnj.io/images/detailed/217/on-sh0000w060015-kieng-bac-y-pnjsilver-kieu-dai-xoan-tron-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1631, 299, NULL, 'on-sh0000w060015-kieng-bac-y-pnjsilver-kieu-dai-xoan-tron-3.jpg', 'https://cdn.pnj.io/images/detailed/217/on-sh0000w060015-kieng-bac-y-pnjsilver-kieu-dai-xoan-tron-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1697, 313, NULL, 'sp-slxmxmw060262-lac-tay-bac-dinh-da-pnjsilver-1.png', 'https://cdn.pnj.io/images/detailed/239/sp-slxmxmw060262-lac-tay-bac-dinh-da-pnjsilver-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1698, 313, NULL, 'sp-slxmxmw060262-lac-tay-bac-dinh-da-pnjsilver-2.png', 'https://cdn.pnj.io/images/detailed/239/sp-slxmxmw060262-lac-tay-bac-dinh-da-pnjsilver-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1699, 313, NULL, 'on-slxmxmw060262-lac-tay-bac-dinh-da-pnjsilver-1.jpg', 'https://cdn.pnj.io/images/detailed/239/on-slxmxmw060262-lac-tay-bac-dinh-da-pnjsilver-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1700, 313, NULL, 'on-slxmxmw060262-lac-tay-bac-dinh-da-pnjsilver-2.jpg', 'https://cdn.pnj.io/images/detailed/239/on-slxmxmw060262-lac-tay-bac-dinh-da-pnjsilver-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1701, 313, NULL, 'on-slxmxmw060262-lac-tay-bac-dinh-da-pnjsilver-3.jpg', 'https://cdn.pnj.io/images/detailed/239/on-slxmxmw060262-lac-tay-bac-dinh-da-pnjsilver-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1702, 314, NULL, 'sp-slxmxmw060215-lac-tay-bac-dinh-da-pnjsilver-1.png', 'https://cdn.pnj.io/images/detailed/234/sp-slxmxmw060215-lac-tay-bac-dinh-da-pnjsilver-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1703, 314, NULL, 'sp-slxmxmw060215-lac-tay-bac-dinh-da-pnjsilver-2.png', 'https://cdn.pnj.io/images/detailed/234/sp-slxmxmw060215-lac-tay-bac-dinh-da-pnjsilver-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1704, 314, NULL, 'sp-slxmxmw060215-lac-tay-bac-dinh-da-pnjsilver-3.png', 'https://cdn.pnj.io/images/detailed/234/sp-slxmxmw060215-lac-tay-bac-dinh-da-pnjsilver-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1705, 314, NULL, 'on-slxmxmw060215-lac-tay-bac-dinh-da-pnjsilver-1.jpg', 'https://cdn.pnj.io/images/detailed/234/on-slxmxmw060215-lac-tay-bac-dinh-da-pnjsilver-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1706, 314, NULL, 'on-slxmxmw060215-lac-tay-bac-dinh-da-pnjsilver-2.jpg', 'https://cdn.pnj.io/images/detailed/234/on-slxmxmw060215-lac-tay-bac-dinh-da-pnjsilver-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1707, 314, NULL, 'on-slxmxmw060215-lac-tay-bac-dinh-da-pnjsilver-3.jpg', 'https://cdn.pnj.io/images/detailed/234/on-slxmxmw060215-lac-tay-bac-dinh-da-pnjsilver-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1708, 315, NULL, 'SP-lac-tay-charm-bac-dinh-da-pnjsilver-ztxmw060004-1.png', 'https://cdn.pnj.io/images/detailed/235/SP-lac-tay-charm-bac-dinh-da-pnjsilver-ztxmw060004-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1709, 315, NULL, 'SP-lac-tay-charm-bac-dinh-da-pnjsilver-ztxmw060004-2.png', 'https://cdn.pnj.io/images/detailed/235/SP-lac-tay-charm-bac-dinh-da-pnjsilver-ztxmw060004-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1710, 315, NULL, 'SP-lac-tay-charm-bac-dinh-da-pnjsilver-ztxmw060004-3.png', 'https://cdn.pnj.io/images/detailed/235/SP-lac-tay-charm-bac-dinh-da-pnjsilver-ztxmw060004-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1711, 315, NULL, 'ON-lac-tay-charm-bac-dinh-da-pnjsilver-ztxmw060004-1.jpg', 'https://cdn.pnj.io/images/detailed/235/ON-lac-tay-charm-bac-dinh-da-pnjsilver-ztxmw060004-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1712, 315, NULL, 'ON-lac-tay-charm-bac-dinh-da-pnjsilver-ztxmw060004-2.jpg', 'https://cdn.pnj.io/images/detailed/235/ON-lac-tay-charm-bac-dinh-da-pnjsilver-ztxmw060004-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1713, 315, NULL, 'ON-lac-tay-charm-bac-dinh-da-pnjsilver-ztxmw060004-3.jpg', 'https://cdn.pnj.io/images/detailed/235/ON-lac-tay-charm-bac-dinh-da-pnjsilver-ztxmw060004-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1714, 316, NULL, 'sp-gl0000y004354-lac-tay-vang-24k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/234/sp-gl0000y004354-lac-tay-vang-24k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1715, 316, NULL, 'sp-gl0000y004354-lac-tay-vang-24k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/234/sp-gl0000y004354-lac-tay-vang-24k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1716, 316, NULL, 'on-gl0000y004354-lac-tay-vang-24k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/234/on-gl0000y004354-lac-tay-vang-24k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1717, 316, NULL, 'on-gl0000y004354-lac-tay-vang-24k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/234/on-gl0000y004354-lac-tay-vang-24k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1718, 316, NULL, 'on-gl0000y004354-lac-tay-vang-24k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/234/on-gl0000y004354-lac-tay-vang-24k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1719, 317, NULL, 'sp-gl0000y004358-lac-tay-vang-24k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/234/sp-gl0000y004358-lac-tay-vang-24k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1720, 317, NULL, 'sp-gl0000y004358-lac-tay-vang-24k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/234/sp-gl0000y004358-lac-tay-vang-24k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1721, 317, NULL, 'on-gl0000y004358-lac-tay-vang-24k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/234/on-gl0000y004358-lac-tay-vang-24k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1722, 317, NULL, 'on-gl0000y004358-lac-tay-vang-24k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/234/on-gl0000y004358-lac-tay-vang-24k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1723, 317, NULL, 'on-gl0000y004358-lac-tay-vang-24k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/234/on-gl0000y004358-lac-tay-vang-24k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1730, 319, NULL, 'sp-slxmxmw060241-lac-tay-bac-dinh-da-pnjsilver-1.png', 'https://cdn.pnj.io/images/detailed/237/sp-slxmxmw060241-lac-tay-bac-dinh-da-pnjsilver-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1731, 319, NULL, 'sp-slxmxmw060241-lac-tay-bac-dinh-da-pnjsilver-2.png', 'https://cdn.pnj.io/images/detailed/237/sp-slxmxmw060241-lac-tay-bac-dinh-da-pnjsilver-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1732, 319, NULL, 'sp-slxmxmw060241-lac-tay-bac-dinh-da-pnjsilver-3.png', 'https://cdn.pnj.io/images/detailed/237/sp-slxmxmw060241-lac-tay-bac-dinh-da-pnjsilver-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1733, 319, NULL, 'on-slxmxmw060241-lac-tay-bac-dinh-da-pnjsilver-1.jpg', 'https://cdn.pnj.io/images/detailed/237/on-slxmxmw060241-lac-tay-bac-dinh-da-pnjsilver-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1734, 319, NULL, 'on-slxmxmw060241-lac-tay-bac-dinh-da-pnjsilver-2.jpg', 'https://cdn.pnj.io/images/detailed/237/on-slxmxmw060241-lac-tay-bac-dinh-da-pnjsilver-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1735, 319, NULL, 'on-slxmxmw060241-lac-tay-bac-dinh-da-pnjsilver-3.jpg', 'https://cdn.pnj.io/images/detailed/237/on-slxmxmw060241-lac-tay-bac-dinh-da-pnjsilver-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1736, 320, NULL, 'sp-slxmxmw060242-lac-tay-bac-dinh-da-pnjsilver-1.png', 'https://cdn.pnj.io/images/detailed/237/sp-slxmxmw060242-lac-tay-bac-dinh-da-pnjsilver-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1737, 320, NULL, 'sp-slxmxmw060242-lac-tay-bac-dinh-da-pnjsilver-2.png', 'https://cdn.pnj.io/images/detailed/237/sp-slxmxmw060242-lac-tay-bac-dinh-da-pnjsilver-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1738, 320, NULL, 'sp-slxmxmw060242-lac-tay-bac-dinh-da-pnjsilver-3.png', 'https://cdn.pnj.io/images/detailed/237/sp-slxmxmw060242-lac-tay-bac-dinh-da-pnjsilver-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1739, 320, NULL, 'on-slxmxmw060242-lac-tay-bac-dinh-da-pnjsilver-1.jpg', 'https://cdn.pnj.io/images/detailed/237/on-slxmxmw060242-lac-tay-bac-dinh-da-pnjsilver-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1740, 320, NULL, 'on-slxmxmw060242-lac-tay-bac-dinh-da-pnjsilver-2.jpg', 'https://cdn.pnj.io/images/detailed/237/on-slxmxmw060242-lac-tay-bac-dinh-da-pnjsilver-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1741, 320, NULL, 'on-slxmxmw060242-lac-tay-bac-dinh-da-pnjsilver-3.jpg', 'https://cdn.pnj.io/images/detailed/237/on-slxmxmw060242-lac-tay-bac-dinh-da-pnjsilver-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1780, 329, NULL, 'sp-glztxmh000026-lac-tay-vang-10k-dinh-da-synthetic-pnj-1.png', 'https://cdn.pnj.io/images/detailed/237/sp-glztxmh000026-lac-tay-vang-10k-dinh-da-synthetic-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1781, 329, NULL, 'sp-glztxmh000026-lac-tay-vang-10k-dinh-da-synthetic-pnj-2.png', 'https://cdn.pnj.io/images/detailed/237/sp-glztxmh000026-lac-tay-vang-10k-dinh-da-synthetic-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1782, 329, NULL, 'sp-glztxmh000026-lac-tay-vang-10k-dinh-da-synthetic-pnj-3.png', 'https://cdn.pnj.io/images/detailed/237/sp-glztxmh000026-lac-tay-vang-10k-dinh-da-synthetic-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1783, 329, NULL, 'on-glztxmh000026-lac-tay-vang-10k-dinh-da-synthetic-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/237/on-glztxmh000026-lac-tay-vang-10k-dinh-da-synthetic-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1784, 329, NULL, 'on-glztxmh000026-lac-tay-vang-10k-dinh-da-synthetic-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/237/on-glztxmh000026-lac-tay-vang-10k-dinh-da-synthetic-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1785, 329, NULL, 'on-glztxmh000026-lac-tay-vang-10k-dinh-da-synthetic-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/237/on-glztxmh000026-lac-tay-vang-10k-dinh-da-synthetic-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1796, 332, NULL, 'sp-gl0000y060888-lac-tay-vang-14k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/239/sp-gl0000y060888-lac-tay-vang-14k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1797, 332, NULL, 'sp-gl0000y060888-lac-tay-vang-14k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/239/sp-gl0000y060888-lac-tay-vang-14k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1798, 332, NULL, 'on-gl0000y060888-lac-tay-vang-14k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/239/on-gl0000y060888-lac-tay-vang-14k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1799, 332, NULL, 'on-gl0000y060888-lac-tay-vang-14k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/239/on-gl0000y060888-lac-tay-vang-14k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1800, 332, NULL, 'on-gl0000y060888-lac-tay-vang-14k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/239/on-gl0000y060888-lac-tay-vang-14k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1807, 334, NULL, 'sp-glztxmy000144-lac-tay-vang-10k-dinh-da-synthetic-pnj-01.png', 'https://cdn.pnj.io/images/detailed/237/sp-glztxmy000144-lac-tay-vang-10k-dinh-da-synthetic-pnj-01.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1808, 334, NULL, 'sp-glztxmy000144-lac-tay-vang-10k-dinh-da-synthetic-pnj-02.png', 'https://cdn.pnj.io/images/detailed/237/sp-glztxmy000144-lac-tay-vang-10k-dinh-da-synthetic-pnj-02.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1826, 338, NULL, 'sp-gl0000w061038-lac-tay-vang-trang-y-18k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/237/sp-gl0000w061038-lac-tay-vang-trang-y-18k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1827, 338, NULL, 'sp-gl0000w061038-lac-tay-vang-trang-y-18k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/237/sp-gl0000w061038-lac-tay-vang-trang-y-18k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1828, 338, NULL, 'on-gl0000w061038-lac-tay-vang-trang-y-18k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/237/on-gl0000w061038-lac-tay-vang-trang-y-18k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1829, 338, NULL, 'on-gl0000w061038-lac-tay-vang-trang-y-18k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/237/on-gl0000w061038-lac-tay-vang-trang-y-18k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1830, 338, NULL, 'on-gl0000w061038-lac-tay-vang-trang-y-18k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/237/on-gl0000w061038-lac-tay-vang-trang-y-18k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1834, 341, NULL, 'sp-gl0000c060145-lac-tay-vang-y-18k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/238/sp-gl0000c060145-lac-tay-vang-y-18k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1835, 341, NULL, 'sp-gl0000c060145-lac-tay-vang-y-18k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/238/sp-gl0000c060145-lac-tay-vang-y-18k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1836, 341, NULL, 'on-gl0000c060145-lac-tay-vang-y-18k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/238/on-gl0000c060145-lac-tay-vang-y-18k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1837, 341, NULL, 'on-gl0000c060145-lac-tay-vang-y-18k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/238/on-gl0000c060145-lac-tay-vang-y-18k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:50.000000', 1838, 341, NULL, 'on-gl0000c060145-lac-tay-vang-y-18k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/238/on-gl0000c060145-lac-tay-vang-y-18k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:52.000000', 2362, 437, NULL, 'sp-gm0000y001683-mat-day-chuyen-vang-10k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/228/sp-gm0000y001683-mat-day-chuyen-vang-10k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:52.000000', 2363, 437, NULL, 'sp-gm0000y001683-mat-day-chuyen-vang-10k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/228/sp-gm0000y001683-mat-day-chuyen-vang-10k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:52.000000', 2364, 437, NULL, 'sp-gm0000y001683-mat-day-chuyen-vang-10k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/228/sp-gm0000y001683-mat-day-chuyen-vang-10k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:52.000000', 2365, 437, NULL, 'on-gm0000y001683-mat-day-chuyen-vang-10k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/228/on-gm0000y001683-mat-day-chuyen-vang-10k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:52.000000', 2366, 437, NULL, 'on-gm0000y001683-mat-day-chuyen-vang-10k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/228/on-gm0000y001683-mat-day-chuyen-vang-10k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:52.000000', 2367, 437, NULL, 'on-gm0000y001683-mat-day-chuyen-vang-10k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/228/on-gm0000y001683-mat-day-chuyen-vang-10k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:53.000000', 2650, 485, NULL, 'smxm00k000044-mat-day-chuyen-bac-dinh-da-pnjsilver-1.png', 'https://cdn.pnj.io/images/detailed/126/smxm00k000044-mat-day-chuyen-bac-dinh-da-pnjsilver-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:53.000000', 2651, 485, NULL, 'smxm00k000044-mat-day-chuyen-bac-dinh-da-pnjsilver-2.png', 'https://cdn.pnj.io/images/detailed/126/smxm00k000044-mat-day-chuyen-bac-dinh-da-pnjsilver-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:53.000000', 2652, 485, NULL, 'smxm00k000044-mat-day-chuyen-bac-dinh-da-pnjsilver-3.png', 'https://cdn.pnj.io/images/detailed/126/smxm00k000044-mat-day-chuyen-bac-dinh-da-pnjsilver-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:53.000000', 2653, 485, NULL, 'smxm00k000044-mat-day-chuyen-bac-dinh-da-pnjsilver-4.jpg', 'https://cdn.pnj.io/images/detailed/132/smxm00k000044-mat-day-chuyen-bac-dinh-da-pnjsilver-4.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:53.000000', 2654, 485, NULL, 'smxm00k000044-mat-day-chuyen-bac-dinh-da-pnjsilver-5.jpg', 'https://cdn.pnj.io/images/detailed/132/smxm00k000044-mat-day-chuyen-bac-dinh-da-pnjsilver-5.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:53.000000', 2655, 485, NULL, 'smxm00k000044-mat-day-chuyen-bac-dinh-da-pnjsilver-6.jpg', 'https://cdn.pnj.io/images/detailed/132/smxm00k000044-mat-day-chuyen-bac-dinh-da-pnjsilver-6.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:53.000000', 2656, 486, NULL, 'smxmxmk000048-mat-day-chuyen-bac-dinh-da-pnjsilver.png', 'https://cdn.pnj.io/images/detailed/101/smxmxmk000048-mat-day-chuyen-bac-dinh-da-pnjsilver.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:53.000000', 2657, 486, NULL, 'smxmxmk000048-mat-day-chuyen-bac-dinh-da-pnjsilver-1.png', 'https://cdn.pnj.io/images/detailed/101/smxmxmk000048-mat-day-chuyen-bac-dinh-da-pnjsilver-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:53.000000', 2658, 486, NULL, 'smxmxmk000048-mat-day-chuyen-bac-dinh-da-pnjsilver-2.png', 'https://cdn.pnj.io/images/detailed/101/smxmxmk000048-mat-day-chuyen-bac-dinh-da-pnjsilver-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:53.000000', 2659, 486, NULL, 'smxmxmk000048-mat-day-chuyen-bac-dinh-da-pnjsilver-3.jpg', 'https://cdn.pnj.io/images/detailed/101/smxmxmk000048-mat-day-chuyen-bac-dinh-da-pnjsilver-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:53.000000', 2847, 521, NULL, 'sp-smzt00w060001-mat-day-chuyen-bac-dinh-da-disneypnj-inside-out-2.png', 'https://cdn.pnj.io/images/detailed/214/sp-smzt00w060001-mat-day-chuyen-bac-dinh-da-disneypnj-inside-out-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:53.000000', 2848, 521, NULL, 'sp-smzt00w060001-mat-day-chuyen-bac-dinh-da-disneypnj-inside-out-2-01.png', 'https://cdn.pnj.io/images/detailed/214/sp-smzt00w060001-mat-day-chuyen-bac-dinh-da-disneypnj-inside-out-2-01.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:53.000000', 2849, 521, NULL, 'sp-smzt00w060001-mat-day-chuyen-bac-dinh-da-disneypnj-inside-out-2-02.png', 'https://cdn.pnj.io/images/detailed/214/sp-smzt00w060001-mat-day-chuyen-bac-dinh-da-disneypnj-inside-out-2-02.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:53.000000', 2850, 521, NULL, 'on-smzt00w060001-mat-day-chuyen-bac-dinh-da-disneypnj-inside-out-2.jpg', 'https://cdn.pnj.io/images/detailed/214/on-smzt00w060001-mat-day-chuyen-bac-dinh-da-disneypnj-inside-out-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:53.000000', 2851, 521, NULL, 'on-smzt00w060001-mat-day-chuyen-bac-dinh-da-disneypnj-inside-out-2-01.jpg', 'https://cdn.pnj.io/images/detailed/214/on-smzt00w060001-mat-day-chuyen-bac-dinh-da-disneypnj-inside-out-2-01.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:53.000000', 2852, 521, NULL, 'on-smzt00w060001-mat-day-chuyen-bac-dinh-da-disneypnj-inside-out-2-02.jpg', 'https://cdn.pnj.io/images/detailed/214/on-smzt00w060001-mat-day-chuyen-bac-dinh-da-disneypnj-inside-out-2-02.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:53.000000', 2853, 522, NULL, 'sp-smxmxmy000010-mat-day-chuyen-bac-dinh-da-disney-pnj-jasmine-1.png', 'https://cdn.pnj.io/images/detailed/221/sp-smxmxmy000010-mat-day-chuyen-bac-dinh-da-disney-pnj-jasmine-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:53.000000', 2854, 522, NULL, 'sp-smxmxmy000010-mat-day-chuyen-bac-dinh-da-disney-pnj-jasmine-2.png', 'https://cdn.pnj.io/images/detailed/221/sp-smxmxmy000010-mat-day-chuyen-bac-dinh-da-disney-pnj-jasmine-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:53.000000', 2855, 522, NULL, 'sp-smxmxmy000010-mat-day-chuyen-bac-dinh-da-disney-pnj-jasmine-3.png', 'https://cdn.pnj.io/images/detailed/222/sp-smxmxmy000010-mat-day-chuyen-bac-dinh-da-disney-pnj-jasmine-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:53.000000', 2856, 522, NULL, 'on-smxmxmy000010-mat-day-chuyen-bac-dinh-da-disney-pnj-jasmine-1.jpg', 'https://cdn.pnj.io/images/detailed/222/on-smxmxmy000010-mat-day-chuyen-bac-dinh-da-disney-pnj-jasmine-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:53.000000', 2857, 522, NULL, 'on-smxmxmy000010-mat-day-chuyen-bac-dinh-da-disney-pnj-jasmine-2.jpg', 'https://cdn.pnj.io/images/detailed/222/on-smxmxmy000010-mat-day-chuyen-bac-dinh-da-disney-pnj-jasmine-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:53.000000', 2858, 522, NULL, 'on-smxmxmy000010-mat-day-chuyen-bac-dinh-da-disney-pnj-jasmine-3.jpg', 'https://cdn.pnj.io/images/detailed/222/on-smxmxmy000010-mat-day-chuyen-bac-dinh-da-disney-pnj-jasmine-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2929, 546, NULL, 'sp-gmddddc000145-mat-day-chuyen-kim-cuong-vang-14k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/200/sp-gmddddc000145-mat-day-chuyen-kim-cuong-vang-14k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2930, 546, NULL, 'sp-gmddddc000145-mat-day-chuyen-kim-cuong-vang-14k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/200/sp-gmddddc000145-mat-day-chuyen-kim-cuong-vang-14k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2931, 546, NULL, 'sp-gmddddc000145-mat-day-chuyen-kim-cuong-vang-14k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/200/sp-gmddddc000145-mat-day-chuyen-kim-cuong-vang-14k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2932, 546, NULL, 'on-gmddddc000145-mat-day-chuyen-kim-cuong-vang-14k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/200/on-gmddddc000145-mat-day-chuyen-kim-cuong-vang-14k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2933, 546, NULL, 'on-gmddddc000145-mat-day-chuyen-kim-cuong-vang-14k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/200/on-gmddddc000145-mat-day-chuyen-kim-cuong-vang-14k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2934, 546, NULL, 'on-gmddddc000145-mat-day-chuyen-kim-cuong-vang-14k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/200/on-gmddddc000145-mat-day-chuyen-kim-cuong-vang-14k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2935, 547, NULL, 'sp-gmddddw002602-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/204/sp-gmddddw002602-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2936, 547, NULL, 'sp-gmddddw002602-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/204/sp-gmddddw002602-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2937, 547, NULL, 'sp-gmddddw002602-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/204/sp-gmddddw002602-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2938, 547, NULL, 'on-gmddddw002602-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/204/on-gmddddw002602-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2939, 547, NULL, 'on-gmddddw002602-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/204/on-gmddddw002602-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2940, 547, NULL, 'on-gmddddw002602-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/204/on-gmddddw002602-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2941, 548, NULL, 'sp-ddddw002699-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/218/sp-ddddw002699-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2942, 548, NULL, 'sp-ddddw002699-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/218/sp-ddddw002699-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2943, 548, NULL, 'sp-ddddw002699-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/218/sp-ddddw002699-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2944, 548, NULL, 'on-ddddw002699-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/218/on-ddddw002699-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2945, 548, NULL, 'on-ddddw002699-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/218/on-ddddw002699-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2946, 548, NULL, 'on-ddddw002699-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/218/on-ddddw002699-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2947, 549, NULL, 'sp-gmddddw002605-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/221/sp-gmddddw002605-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2948, 549, NULL, 'sp-gmddddw002605-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/221/sp-gmddddw002605-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2949, 549, NULL, 'sp-gmddddw002605-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/221/sp-gmddddw002605-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2950, 549, NULL, 'on-gmddddw002605-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/221/on-gmddddw002605-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2951, 549, NULL, 'on-gmddddw002605-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/221/on-gmddddw002605-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2952, 549, NULL, 'on-gmddddw002605-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/221/on-gmddddw002605-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2953, 550, NULL, 'sp-gmddddw002680-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/219/sp-gmddddw002680-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2954, 550, NULL, 'sp-gmddddw002680-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/219/sp-gmddddw002680-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2955, 550, NULL, 'sp-gmddddw002680-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/219/sp-gmddddw002680-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2956, 550, NULL, 'on-gmddddw002680-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-01.jpg', 'https://cdn.pnj.io/images/detailed/224/on-gmddddw002680-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-01.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2957, 550, NULL, 'on-gmddddw002680-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-02.jpg', 'https://cdn.pnj.io/images/detailed/224/on-gmddddw002680-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-02.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2958, 550, NULL, 'on-gmddddw002680-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-03.jpg', 'https://cdn.pnj.io/images/detailed/224/on-gmddddw002680-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-03.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2959, 551, NULL, 'sp-gmdd00w060073-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/215/sp-gmdd00w060073-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2960, 551, NULL, 'icon-play-video80.png', 'https://www.pnj.com.vn/images/videos/icon-play-video80.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2961, 551, NULL, 'sp-gmdd00w060073-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/215/sp-gmdd00w060073-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2962, 551, NULL, 'sp-gmdd00w060073-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/215/sp-gmdd00w060073-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2963, 551, NULL, 'on-gmdd00w060073-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/215/on-gmdd00w060073-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2964, 551, NULL, 'on-gmdd00w060073-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/215/on-gmdd00w060073-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2965, 551, NULL, 'on-gmdd00w060073-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/215/on-gmdd00w060073-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2966, 552, NULL, 'sp-gmddddw060401-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/220/sp-gmddddw060401-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2967, 552, NULL, 'sp-gmddddw060401-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/220/sp-gmddddw060401-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2968, 552, NULL, 'sp-gmddddw060401-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/220/sp-gmddddw060401-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2969, 552, NULL, 'on-gmddddw060401-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/221/on-gmddddw060401-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2970, 552, NULL, 'on-gmddddw060401-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/221/on-gmddddw060401-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2971, 552, NULL, 'on-gmddddw060401-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/221/on-gmddddw060401-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2972, 553, NULL, 'sp-gmdd00w060074-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/220/sp-gmdd00w060074-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2973, 553, NULL, 'sp-gmdd00w060074-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/220/sp-gmdd00w060074-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2974, 553, NULL, 'sp-gmdd00w060074-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/220/sp-gmdd00w060074-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2975, 553, NULL, 'on-gmdd00w060074-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/220/on-gmdd00w060074-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2976, 553, NULL, 'on-gmdd00w060074-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/220/on-gmdd00w060074-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2977, 553, NULL, 'on-gmdd00w060074-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/220/on-gmdd00w060074-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2978, 554, NULL, 'sp-gmdd00w000678-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/215/sp-gmdd00w000678-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2979, 554, NULL, 'sp-gmdd00w000678-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/215/sp-gmdd00w000678-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2980, 554, NULL, 'sp-gmdd00w000678-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/215/sp-gmdd00w000678-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2981, 554, NULL, 'on-gmdd00w000678-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/216/on-gmdd00w000678-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2982, 554, NULL, 'on-gmdd00w000678-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/216/on-gmdd00w000678-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2983, 554, NULL, 'on-gmdd00w000678-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/216/on-gmdd00w000678-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2984, 555, NULL, 'sp-gmddddw002726-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/223/sp-gmddddw002726-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2985, 555, NULL, 'sp-gmddddw002726-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/223/sp-gmddddw002726-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2986, 555, NULL, 'sp-gmddddw002726-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/223/sp-gmddddw002726-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2987, 555, NULL, 'on-gmddddw002726-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/223/on-gmddddw002726-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2988, 555, NULL, 'on-gmddddw002726-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/223/on-gmddddw002726-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2989, 555, NULL, 'on-gmddddw002726-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/223/on-gmddddw002726-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2990, 556, NULL, 'sp-gmddddw002737-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/225/sp-gmddddw002737-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2991, 556, NULL, 'sp-gmddddw002737-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/225/sp-gmddddw002737-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2992, 556, NULL, 'sp-gmddddw002737-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/225/sp-gmddddw002737-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2993, 556, NULL, 'on-gmddddw002737-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/225/on-gmddddw002737-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2994, 556, NULL, 'on-gmddddw002737-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/225/on-gmddddw002737-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2995, 556, NULL, 'on-gmddddw002737-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/225/on-gmddddw002737-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2996, 557, NULL, 'sp-gmdd00w000687-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/223/sp-gmdd00w000687-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2997, 557, NULL, 'sp-gmdd00w000687-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/223/sp-gmdd00w000687-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2998, 557, NULL, 'sp-gmdd00w000687-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/223/sp-gmdd00w000687-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 2999, 557, NULL, 'on-gmdd00w000687-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/223/on-gmdd00w000687-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3000, 557, NULL, 'on-gmdd00w000687-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/223/on-gmdd00w000687-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3001, 557, NULL, 'on-gmdd00w000687-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/223/on-gmdd00w000687-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3002, 558, NULL, 'sp-gmddddw060415-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/226/sp-gmddddw060415-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3003, 558, NULL, 'sp-gmddddw060415-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/226/sp-gmddddw060415-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3004, 558, NULL, 'sp-gmddddw060415-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/226/sp-gmddddw060415-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3005, 558, NULL, 'on-gmddddw060415-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/226/on-gmddddw060415-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3006, 558, NULL, 'on-gmddddw060415-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/226/on-gmddddw060415-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3007, 558, NULL, 'on-gmddddw060415-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/226/on-gmddddw060415-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3008, 559, NULL, 'sp-gmdd00w060075-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/224/sp-gmdd00w060075-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3009, 559, NULL, 'sp-gmdd00w060075-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/224/sp-gmdd00w060075-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3010, 559, NULL, 'sp-gmdd00w060075-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/224/sp-gmdd00w060075-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3011, 559, NULL, 'sp-gmdd00w060075-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-4.png', 'https://cdn.pnj.io/images/detailed/224/sp-gmdd00w060075-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-4.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3012, 559, NULL, 'sp-gmdd00w060075-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-5.png', 'https://cdn.pnj.io/images/detailed/224/sp-gmdd00w060075-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-5.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3013, 559, NULL, 'sp-gmdd00w060075-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-6.png', 'https://cdn.pnj.io/images/detailed/224/sp-gmdd00w060075-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-6.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3014, 559, NULL, 'on-gmdd00w060075-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/224/on-gmdd00w060075-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3015, 559, NULL, 'on-gmdd00w060075-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/224/on-gmdd00w060075-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3016, 559, NULL, 'on-gmdd00w060075-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/224/on-gmdd00w060075-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3017, 560, NULL, 'sp-gmddddw060398-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/223/sp-gmddddw060398-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3018, 560, NULL, 'sp-gmddddw060398-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/223/sp-gmddddw060398-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3019, 560, NULL, 'sp-gmddddw060398-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/223/sp-gmddddw060398-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3020, 560, NULL, 'on-gmddddw060398-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/223/on-gmddddw060398-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3021, 560, NULL, 'on-gmddddw060398-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/223/on-gmddddw060398-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3022, 560, NULL, 'on-gmddddw060398-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/223/on-gmddddw060398-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3023, 561, NULL, 'sp-gmddddw060400-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/223/sp-gmddddw060400-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3024, 561, NULL, 'sp-gmddddw060400-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/223/sp-gmddddw060400-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3025, 561, NULL, 'sp-gmddddw060400-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/223/sp-gmddddw060400-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3026, 561, NULL, 'on-gmddddw060400-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/223/on-gmddddw060400-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3027, 561, NULL, 'on-gmddddw060400-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/223/on-gmddddw060400-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3028, 561, NULL, 'on-gmddddw060400-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/223/on-gmddddw060400-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3029, 562, NULL, 'sp-gmddddw060397-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/223/sp-gmddddw060397-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3030, 562, NULL, 'sp-gmddddw060397-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/223/sp-gmddddw060397-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3031, 562, NULL, 'sp-gmddddw060397-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/223/sp-gmddddw060397-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3032, 562, NULL, 'on-gmddddw060397-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/223/on-gmddddw060397-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3033, 562, NULL, 'on-gmddddw060397-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/223/on-gmddddw060397-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3034, 562, NULL, 'on-gmddddw060397-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/223/on-gmddddw060397-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3035, 563, NULL, 'sp-gmddddw060399-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/223/sp-gmddddw060399-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3036, 563, NULL, 'sp-gmddddw060399-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/223/sp-gmddddw060399-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3037, 563, NULL, 'sp-gmddddw060399-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/223/sp-gmddddw060399-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3038, 563, NULL, 'on-gmddddw060399-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/223/on-gmddddw060399-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3039, 563, NULL, 'on-gmddddw060399-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/223/on-gmddddw060399-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3040, 563, NULL, 'on-gmddddw060399-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/223/on-gmddddw060399-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3041, 564, NULL, 'sp-gmdd00w000680-mat-day-chuyen-kim-cuong-vang-trang-14k-mancode-by-pnj-1.png', 'https://cdn.pnj.io/images/detailed/227/sp-gmdd00w000680-mat-day-chuyen-kim-cuong-vang-trang-14k-mancode-by-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3042, 564, NULL, 'sp-gmdd00w000680-mat-day-chuyen-kim-cuong-vang-trang-14k-mancode-by-pnj-2.png', 'https://cdn.pnj.io/images/detailed/227/sp-gmdd00w000680-mat-day-chuyen-kim-cuong-vang-trang-14k-mancode-by-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3043, 564, NULL, 'sp-gmdd00w000680-mat-day-chuyen-kim-cuong-vang-trang-14k-mancode-by-pnj-3.png', 'https://cdn.pnj.io/images/detailed/227/sp-gmdd00w000680-mat-day-chuyen-kim-cuong-vang-trang-14k-mancode-by-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3044, 564, NULL, 'on-gmdd00w000680-mat-day-chuyen-kim-cuong-vang-trang-14k-mancode-by-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/227/on-gmdd00w000680-mat-day-chuyen-kim-cuong-vang-trang-14k-mancode-by-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3045, 564, NULL, 'on-gmdd00w000680-mat-day-chuyen-kim-cuong-vang-trang-14k-mancode-by-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/227/on-gmdd00w000680-mat-day-chuyen-kim-cuong-vang-trang-14k-mancode-by-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3046, 564, NULL, 'on-gmdd00w000680-mat-day-chuyen-kim-cuong-vang-trang-14k-mancode-by-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/227/on-gmdd00w000680-mat-day-chuyen-kim-cuong-vang-trang-14k-mancode-by-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3047, 565, NULL, 'sp-gmdd00w060081-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/226/sp-gmdd00w060081-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3048, 565, NULL, 'sp-gmdd00w060081-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/226/sp-gmdd00w060081-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3049, 565, NULL, 'sp-gmdd00w060081-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/226/sp-gmdd00w060081-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3050, 565, NULL, 'on-gmdd00w060081-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/226/on-gmdd00w060081-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3051, 565, NULL, 'on-gmdd00w060081-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/226/on-gmdd00w060081-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3052, 565, NULL, 'on-gmdd00w060081-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/226/on-gmdd00w060081-mat-day-chuyen-kim-cuong-vang-trang-14k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3053, 566, NULL, 'sp-gnxmxmw005914-nhan-vang-trang-14k-dinh-da-ecz-pnj-1.png', 'https://cdn.pnj.io/images/detailed/237/sp-gnxmxmw005914-nhan-vang-trang-14k-dinh-da-ecz-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3054, 566, NULL, 'sp-gnxmxmw005914-nhan-vang-trang-14k-dinh-da-ecz-pnj-2.png', 'https://cdn.pnj.io/images/detailed/237/sp-gnxmxmw005914-nhan-vang-trang-14k-dinh-da-ecz-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3055, 566, NULL, 'sp-gnxmxmw005914-nhan-vang-trang-14k-dinh-da-ecz-pnj-3.png', 'https://cdn.pnj.io/images/detailed/237/sp-gnxmxmw005914-nhan-vang-trang-14k-dinh-da-ecz-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3056, 566, NULL, 'sp-gnxmxmw005914-nhan-vang-trang-14k-dinh-da-ecz-pnj-4.png', 'https://cdn.pnj.io/images/detailed/237/sp-gnxmxmw005914-nhan-vang-trang-14k-dinh-da-ecz-pnj-4.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3057, 566, NULL, 'sp-gnxmxmw005914-nhan-vang-trang-14k-dinh-da-ecz-pnj-5.png', 'https://cdn.pnj.io/images/detailed/237/sp-gnxmxmw005914-nhan-vang-trang-14k-dinh-da-ecz-pnj-5.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3058, 566, NULL, 'sp-gnxmxmw005914-nhan-vang-trang-14k-dinh-da-ecz-pnj-6.png', 'https://cdn.pnj.io/images/detailed/237/sp-gnxmxmw005914-nhan-vang-trang-14k-dinh-da-ecz-pnj-6.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3059, 566, NULL, 'sp-gnxmxmw005914-nhan-vang-trang-14k-dinh-da-ecz-pnj-7.png', 'https://cdn.pnj.io/images/detailed/237/sp-gnxmxmw005914-nhan-vang-trang-14k-dinh-da-ecz-pnj-7.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3060, 566, NULL, 'on-gnxmxmw005914-nhan-vang-trang-14k-dinh-da-ecz-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/237/on-gnxmxmw005914-nhan-vang-trang-14k-dinh-da-ecz-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3061, 566, NULL, 'on-gnxmxmw005914-nhan-vang-trang-14k-dinh-da-ecz-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/237/on-gnxmxmw005914-nhan-vang-trang-14k-dinh-da-ecz-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3062, 566, NULL, 'on-gnxmxmw005914-nhan-vang-trang-14k-dinh-da-ecz-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/237/on-gnxmxmw005914-nhan-vang-trang-14k-dinh-da-ecz-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:54.000000', 3063, 566, NULL, 'on-gnxmxmw005914-nhan-vang-trang-14k-dinh-da-ecz-pnj-4.jpg', 'https://cdn.pnj.io/images/detailed/237/on-gnxmxmw005914-nhan-vang-trang-14k-dinh-da-ecz-pnj-4.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:55.000000', 3315, 610, NULL, 'sp-snxm00w060016-nhan-nam-bac-dinh-da-pnjsilver-1.png', 'https://cdn.pnj.io/images/detailed/226/sp-snxm00w060016-nhan-nam-bac-dinh-da-pnjsilver-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:55.000000', 3316, 610, NULL, 'sp-snxm00w060016-nhan-nam-bac-dinh-da-pnjsilver-2.png', 'https://cdn.pnj.io/images/detailed/226/sp-snxm00w060016-nhan-nam-bac-dinh-da-pnjsilver-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:55.000000', 3317, 610, NULL, 'sp-snxm00w060016-nhan-nam-bac-dinh-da-pnjsilver-3.png', 'https://cdn.pnj.io/images/detailed/226/sp-snxm00w060016-nhan-nam-bac-dinh-da-pnjsilver-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:55.000000', 3318, 610, NULL, 'on-snxm00w060016-nhan-nam-bac-dinh-da-pnjsilver-1.jpg', 'https://cdn.pnj.io/images/detailed/227/on-snxm00w060016-nhan-nam-bac-dinh-da-pnjsilver-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:55.000000', 3319, 610, NULL, 'on-snxm00w060016-nhan-nam-bac-dinh-da-pnjsilver-2.jpg', 'https://cdn.pnj.io/images/detailed/227/on-snxm00w060016-nhan-nam-bac-dinh-da-pnjsilver-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:55.000000', 3320, 610, NULL, 'on-snxm00w060016-nhan-nam-bac-dinh-da-pnjsilver-3.jpg', 'https://cdn.pnj.io/images/detailed/227/on-snxm00w060016-nhan-nam-bac-dinh-da-pnjsilver-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:55.000000', 3531, 646, NULL, 'sp-snxmxmw060208-nhan-bac-dinh-da-pnjsilver-1.png', 'https://cdn.pnj.io/images/detailed/239/sp-snxmxmw060208-nhan-bac-dinh-da-pnjsilver-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:55.000000', 3532, 646, NULL, 'sp-snxmxmw060208-nhan-bac-dinh-da-pnjsilver-2.png', 'https://cdn.pnj.io/images/detailed/239/sp-snxmxmw060208-nhan-bac-dinh-da-pnjsilver-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:55.000000', 3533, 646, NULL, 'sp-snxmxmw060208-nhan-bac-dinh-da-pnjsilver-3.png', 'https://cdn.pnj.io/images/detailed/239/sp-snxmxmw060208-nhan-bac-dinh-da-pnjsilver-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:55.000000', 3534, 646, NULL, 'on-snxmxmw060208-nhan-bac-dinh-da-pnjsilver-1.jpg', 'https://cdn.pnj.io/images/detailed/240/on-snxmxmw060208-nhan-bac-dinh-da-pnjsilver-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:55.000000', 3535, 646, NULL, 'on-snxmxmw060208-nhan-bac-dinh-da-pnjsilver-2.jpg', 'https://cdn.pnj.io/images/detailed/240/on-snxmxmw060208-nhan-bac-dinh-da-pnjsilver-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:55.000000', 3536, 646, NULL, 'on-snxmxmw060208-nhan-bac-dinh-da-pnjsilver-3.jpg', 'https://cdn.pnj.io/images/detailed/240/on-snxmxmw060208-nhan-bac-dinh-da-pnjsilver-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:55.000000', 3537, 647, NULL, 'sp-snxmxmw060209-nhan-bac-dinh-da-pnjsilver-1.png', 'https://cdn.pnj.io/images/detailed/239/sp-snxmxmw060209-nhan-bac-dinh-da-pnjsilver-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:55.000000', 3538, 647, NULL, 'sp-snxmxmw060209-nhan-bac-dinh-da-pnjsilver-2.png', 'https://cdn.pnj.io/images/detailed/239/sp-snxmxmw060209-nhan-bac-dinh-da-pnjsilver-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:55.000000', 3539, 647, NULL, 'sp-snxmxmw060209-nhan-bac-dinh-da-pnjsilver-3.png', 'https://cdn.pnj.io/images/detailed/239/sp-snxmxmw060209-nhan-bac-dinh-da-pnjsilver-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:55.000000', 3540, 647, NULL, 'on-snxmxmw060209-nhan-bac-dinh-da-pnjsilver-1.jpg', 'https://cdn.pnj.io/images/detailed/240/on-snxmxmw060209-nhan-bac-dinh-da-pnjsilver-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:55.000000', 3541, 647, NULL, 'on-snxmxmw060209-nhan-bac-dinh-da-pnjsilver-2.jpg', 'https://cdn.pnj.io/images/detailed/240/on-snxmxmw060209-nhan-bac-dinh-da-pnjsilver-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:55.000000', 3542, 647, NULL, 'on-snxmxmw060209-nhan-bac-dinh-da-pnjsilver-3.jpg', 'https://cdn.pnj.io/images/detailed/240/on-snxmxmw060209-nhan-bac-dinh-da-pnjsilver-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:55.000000', 3543, 648, NULL, 'sp-snxm00w060023-nhan-bac-dinh-da-pnjsilver-1.png', 'https://cdn.pnj.io/images/detailed/239/sp-snxm00w060023-nhan-bac-dinh-da-pnjsilver-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3544, 648, NULL, 'sp-snxm00w060023-nhan-bac-dinh-da-pnjsilver-2.png', 'https://cdn.pnj.io/images/detailed/239/sp-snxm00w060023-nhan-bac-dinh-da-pnjsilver-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3545, 648, NULL, 'sp-snxm00w060023-nhan-bac-dinh-da-pnjsilver-3.png', 'https://cdn.pnj.io/images/detailed/239/sp-snxm00w060023-nhan-bac-dinh-da-pnjsilver-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3546, 648, NULL, 'on-snxm00w060023-nhan-bac-dinh-da-pnjsilver-1.jpg', 'https://cdn.pnj.io/images/detailed/240/on-snxm00w060023-nhan-bac-dinh-da-pnjsilver-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3547, 648, NULL, 'on-snxm00w060023-nhan-bac-dinh-da-pnjsilver-2.jpg', 'https://cdn.pnj.io/images/detailed/240/on-snxm00w060023-nhan-bac-dinh-da-pnjsilver-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3548, 648, NULL, 'on-snxm00w060023-nhan-bac-dinh-da-pnjsilver-3.jpg', 'https://cdn.pnj.io/images/detailed/240/on-snxm00w060023-nhan-bac-dinh-da-pnjsilver-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3549, 649, NULL, 'sp-snxmxmw060210-nhan-bac-dinh-da-pnjsilver-1.png', 'https://cdn.pnj.io/images/detailed/239/sp-snxmxmw060210-nhan-bac-dinh-da-pnjsilver-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3550, 649, NULL, 'sp-snxmxmw060210-nhan-bac-dinh-da-pnjsilver-2.png', 'https://cdn.pnj.io/images/detailed/239/sp-snxmxmw060210-nhan-bac-dinh-da-pnjsilver-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3551, 649, NULL, 'sp-snxmxmw060210-nhan-bac-dinh-da-pnjsilver-3.png', 'https://cdn.pnj.io/images/detailed/239/sp-snxmxmw060210-nhan-bac-dinh-da-pnjsilver-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3552, 649, NULL, 'on-snxmxmw060210-nhan-bac-dinh-da-pnjsilver-1.jpg', 'https://cdn.pnj.io/images/detailed/240/on-snxmxmw060210-nhan-bac-dinh-da-pnjsilver-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3553, 649, NULL, 'on-snxmxmw060210-nhan-bac-dinh-da-pnjsilver-2.jpg', 'https://cdn.pnj.io/images/detailed/240/on-snxmxmw060210-nhan-bac-dinh-da-pnjsilver-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3554, 649, NULL, 'on-snxmxmw060210-nhan-bac-dinh-da-pnjsilver-3.jpg', 'https://cdn.pnj.io/images/detailed/240/on-snxmxmw060210-nhan-bac-dinh-da-pnjsilver-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3555, 650, NULL, 'sp-snxm00w060024-nhan-bac-dinh-da-pnjsilver-1.png', 'https://cdn.pnj.io/images/detailed/239/sp-snxm00w060024-nhan-bac-dinh-da-pnjsilver-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3556, 650, NULL, 'sp-snxm00w060024-nhan-bac-dinh-da-pnjsilver-2.png', 'https://cdn.pnj.io/images/detailed/239/sp-snxm00w060024-nhan-bac-dinh-da-pnjsilver-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3557, 650, NULL, 'sp-snxm00w060024-nhan-bac-dinh-da-pnjsilver-3.png', 'https://cdn.pnj.io/images/detailed/239/sp-snxm00w060024-nhan-bac-dinh-da-pnjsilver-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3558, 650, NULL, 'on-snxm00w060024-nhan-bac-dinh-da-pnjsilver-1.jpg', 'https://cdn.pnj.io/images/detailed/240/on-snxm00w060024-nhan-bac-dinh-da-pnjsilver-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3559, 650, NULL, 'on-snxm00w060024-nhan-bac-dinh-da-pnjsilver-2.jpg', 'https://cdn.pnj.io/images/detailed/240/on-snxm00w060024-nhan-bac-dinh-da-pnjsilver-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3560, 650, NULL, 'on-snxm00w060024-nhan-bac-dinh-da-pnjsilver-3.jpg', 'https://cdn.pnj.io/images/detailed/240/on-snxm00w060024-nhan-bac-dinh-da-pnjsilver-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3561, 651, NULL, 'sp-snxmxmy060022-nhan-bac-dinh-da-pnjsilver-1.png', 'https://cdn.pnj.io/images/detailed/236/sp-snxmxmy060022-nhan-bac-dinh-da-pnjsilver-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3562, 651, NULL, 'sp-snxmxmy060022-nhan-bac-dinh-da-pnjsilver-2.png', 'https://cdn.pnj.io/images/detailed/236/sp-snxmxmy060022-nhan-bac-dinh-da-pnjsilver-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3563, 651, NULL, 'sp-snxmxmy060022-nhan-bac-dinh-da-pnjsilver-3.png', 'https://cdn.pnj.io/images/detailed/236/sp-snxmxmy060022-nhan-bac-dinh-da-pnjsilver-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3564, 651, NULL, 'on-snxmxmy060022-nhan-bac-dinh-da-pnjsilver-1.jpg', 'https://cdn.pnj.io/images/detailed/236/on-snxmxmy060022-nhan-bac-dinh-da-pnjsilver-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3565, 651, NULL, 'on-snxmxmy060022-nhan-bac-dinh-da-pnjsilver-2.jpg', 'https://cdn.pnj.io/images/detailed/236/on-snxmxmy060022-nhan-bac-dinh-da-pnjsilver-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3566, 651, NULL, 'on-snxmxmy060022-nhan-bac-dinh-da-pnjsilver-3.jpg', 'https://cdn.pnj.io/images/detailed/236/on-snxmxmy060022-nhan-bac-dinh-da-pnjsilver-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3567, 652, NULL, 'sp-snzt00h000007-nhan-bac-dinh-da-style-by-pnj-bisou-1.png', 'https://cdn.pnj.io/images/detailed/237/sp-snzt00h000007-nhan-bac-dinh-da-style-by-pnj-bisou-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3568, 652, NULL, 'sp-snzt00h000007-nhan-bac-dinh-da-style-by-pnj-bisou-2.png', 'https://cdn.pnj.io/images/detailed/237/sp-snzt00h000007-nhan-bac-dinh-da-style-by-pnj-bisou-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3569, 652, NULL, 'sp-snzt00h000007-nhan-bac-dinh-da-style-by-pnj-bisou-3.png', 'https://cdn.pnj.io/images/detailed/237/sp-snzt00h000007-nhan-bac-dinh-da-style-by-pnj-bisou-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3570, 652, NULL, 'on-snzt00h000007-nhan-bac-dinh-da-style-by-pnj-bisou-1.jpg', 'https://cdn.pnj.io/images/detailed/238/on-snzt00h000007-nhan-bac-dinh-da-style-by-pnj-bisou-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3571, 652, NULL, 'on-snzt00h000007-nhan-bac-dinh-da-style-by-pnj-bisou-2.jpg', 'https://cdn.pnj.io/images/detailed/238/on-snzt00h000007-nhan-bac-dinh-da-style-by-pnj-bisou-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3572, 652, NULL, 'on-snzt00h000007-nhan-bac-dinh-da-style-by-pnj-bisou-3.jpg', 'https://cdn.pnj.io/images/detailed/238/on-snzt00h000007-nhan-bac-dinh-da-style-by-pnj-bisou-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3573, 652, NULL, 'on-snzt00h000007-nhan-bac-dinh-da-style-by-pnj-bisou-4.jpg', 'https://cdn.pnj.io/images/detailed/240/on-snzt00h000007-nhan-bac-dinh-da-style-by-pnj-bisou-4.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3574, 652, NULL, 'on-snzt00h000007-nhan-bac-dinh-da-style-by-pnj-bisou-5.jpg', 'https://cdn.pnj.io/images/detailed/240/on-snzt00h000007-nhan-bac-dinh-da-style-by-pnj-bisou-5.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3575, 653, NULL, 'sp-snztxmh000015-nhan-bac-dinh-da-style-by-pnj-bisou-1.png', 'https://cdn.pnj.io/images/detailed/237/sp-snztxmh000015-nhan-bac-dinh-da-style-by-pnj-bisou-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3576, 653, NULL, 'sp-snztxmh000015-nhan-bac-dinh-da-style-by-pnj-bisou-2.png', 'https://cdn.pnj.io/images/detailed/237/sp-snztxmh000015-nhan-bac-dinh-da-style-by-pnj-bisou-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3577, 653, NULL, 'sp-snztxmh000015-nhan-bac-dinh-da-style-by-pnj-bisou-3.png', 'https://cdn.pnj.io/images/detailed/237/sp-snztxmh000015-nhan-bac-dinh-da-style-by-pnj-bisou-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3578, 653, NULL, 'on-snztxmh000015-nhan-bac-dinh-da-style-by-pnj-bisou-1.jpg', 'https://cdn.pnj.io/images/detailed/238/on-snztxmh000015-nhan-bac-dinh-da-style-by-pnj-bisou-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3579, 653, NULL, 'on-snztxmh000015-nhan-bac-dinh-da-style-by-pnj-bisou-2.jpg', 'https://cdn.pnj.io/images/detailed/238/on-snztxmh000015-nhan-bac-dinh-da-style-by-pnj-bisou-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3580, 653, NULL, 'on-snztxmh000015-nhan-bac-dinh-da-style-by-pnj-bisou-3.jpg', 'https://cdn.pnj.io/images/detailed/238/on-snztxmh000015-nhan-bac-dinh-da-style-by-pnj-bisou-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3581, 653, NULL, 'on-snztxmh000015-nhan-bac-dinh-da-style-by-pnj-bisou-5.jpg', 'https://cdn.pnj.io/images/detailed/240/on-snztxmh000015-nhan-bac-dinh-da-style-by-pnj-bisou-5.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3582, 653, NULL, 'on-snztxmh000015-nhan-bac-dinh-da-style-by-pnj-bisou-4.jpg', 'https://cdn.pnj.io/images/detailed/240/on-snztxmh000015-nhan-bac-dinh-da-style-by-pnj-bisou-4.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3583, 654, NULL, 'sp-snxmxmc000029-nhan-bac-dinh-da-style-by-pnj-01.png', 'https://cdn.pnj.io/images/detailed/239/sp-snxmxmc000029-nhan-bac-dinh-da-style-by-pnj-01.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3584, 654, NULL, 'sp-snxmxmc000029-nhan-bac-dinh-da-style-by-pnj-02.png', 'https://cdn.pnj.io/images/detailed/239/sp-snxmxmc000029-nhan-bac-dinh-da-style-by-pnj-02.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3585, 655, NULL, 'sp-snxm00w000101-nhan-bac-dinh-da-style-by-pnj-01.png', 'https://cdn.pnj.io/images/detailed/239/sp-snxm00w000101-nhan-bac-dinh-da-style-by-pnj-01.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3586, 656, NULL, 'sp-snxm00w000103-nhan-bac-dinh-da-style-by-pnj-1.png', 'https://cdn.pnj.io/images/detailed/239/sp-snxm00w000103-nhan-bac-dinh-da-style-by-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3587, 656, NULL, 'sp-snxm00w000103-nhan-bac-dinh-da-style-by-pnj-2.png', 'https://cdn.pnj.io/images/detailed/239/sp-snxm00w000103-nhan-bac-dinh-da-style-by-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3588, 657, NULL, 'sp-snxm00c000042-nhan-bac-dinh-da-style-by-pnj-1.png', 'https://cdn.pnj.io/images/detailed/239/sp-snxm00c000042-nhan-bac-dinh-da-style-by-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3589, 657, NULL, 'sp-snxm00c000042-nhan-bac-dinh-da-style-by-pnj-2.png', 'https://cdn.pnj.io/images/detailed/239/sp-snxm00c000042-nhan-bac-dinh-da-style-by-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3590, 657, NULL, 'sp-snxm00c000042-nhan-bac-dinh-da-style-by-pnj-3.png', 'https://cdn.pnj.io/images/detailed/239/sp-snxm00c000042-nhan-bac-dinh-da-style-by-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3729, 681, NULL, 'sp-gn00ddw007296-nhan-kim-cuong-vang-trang-18k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/233/sp-gn00ddw007296-nhan-kim-cuong-vang-trang-18k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3730, 681, NULL, 'sp-gn00ddw007296-nhan-kim-cuong-vang-trang-18k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/233/sp-gn00ddw007296-nhan-kim-cuong-vang-trang-18k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3731, 681, NULL, 'sp-gn00ddw007296-nhan-kim-cuong-vang-trang-18k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/233/sp-gn00ddw007296-nhan-kim-cuong-vang-trang-18k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3732, 681, NULL, 'on-gn00ddw007296-nhan-kim-cuong-vang-trang-18k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/233/on-gn00ddw007296-nhan-kim-cuong-vang-trang-18k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3733, 681, NULL, 'on-gn00ddw007296-nhan-kim-cuong-vang-trang-18k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/233/on-gn00ddw007296-nhan-kim-cuong-vang-trang-18k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3734, 681, NULL, 'on-gn00ddw007296-nhan-kim-cuong-vang-trang-18k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/233/on-gn00ddw007296-nhan-kim-cuong-vang-trang-18k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3735, 682, NULL, 'sp-gn00ddw007297-nhan-kim-cuong-vang-trang-18k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/233/sp-gn00ddw007297-nhan-kim-cuong-vang-trang-18k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3736, 682, NULL, 'sp-gn00ddw007297-nhan-kim-cuong-vang-trang-18k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/233/sp-gn00ddw007297-nhan-kim-cuong-vang-trang-18k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3737, 682, NULL, 'sp-gn00ddw007297-nhan-kim-cuong-vang-trang-18k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/233/sp-gn00ddw007297-nhan-kim-cuong-vang-trang-18k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3738, 682, NULL, 'on-gn00ddw007297-nhan-kim-cuong-vang-trang-18k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/233/on-gn00ddw007297-nhan-kim-cuong-vang-trang-18k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3739, 682, NULL, 'on-gn00ddw007297-nhan-kim-cuong-vang-trang-18k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/233/on-gn00ddw007297-nhan-kim-cuong-vang-trang-18k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3740, 682, NULL, 'on-gn00ddw007297-nhan-kim-cuong-vang-trang-18k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/233/on-gn00ddw007297-nhan-kim-cuong-vang-trang-18k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3741, 683, NULL, 'sp-gn00ddw007313-nhan-kim-cuong-vang-trang-18k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/233/sp-gn00ddw007313-nhan-kim-cuong-vang-trang-18k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3742, 683, NULL, 'sp-gn00ddw007313-nhan-kim-cuong-vang-trang-18k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/233/sp-gn00ddw007313-nhan-kim-cuong-vang-trang-18k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3743, 683, NULL, 'sp-gn00ddw007313-nhan-kim-cuong-vang-trang-18k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/233/sp-gn00ddw007313-nhan-kim-cuong-vang-trang-18k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3744, 683, NULL, 'on-gn00ddw007313-nhan-kim-cuong-vang-trang-18k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/233/on-gn00ddw007313-nhan-kim-cuong-vang-trang-18k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3745, 683, NULL, 'on-gn00ddw007313-nhan-kim-cuong-vang-trang-18k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/233/on-gn00ddw007313-nhan-kim-cuong-vang-trang-18k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3746, 683, NULL, 'on-gn00ddw007313-nhan-kim-cuong-vang-trang-18k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/233/on-gn00ddw007313-nhan-kim-cuong-vang-trang-18k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3747, 684, NULL, 'sp-gn00ddw007324-nhan-kim-cuong-vang-trang-18k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/233/sp-gn00ddw007324-nhan-kim-cuong-vang-trang-18k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3748, 684, NULL, 'sp-gn00ddw007324-nhan-kim-cuong-vang-trang-18k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/233/sp-gn00ddw007324-nhan-kim-cuong-vang-trang-18k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3749, 684, NULL, 'sp-gn00ddw007324-nhan-kim-cuong-vang-trang-18k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/233/sp-gn00ddw007324-nhan-kim-cuong-vang-trang-18k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3750, 684, NULL, 'on-gn00ddw007324-nhan-kim-cuong-vang-trang-18k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/233/on-gn00ddw007324-nhan-kim-cuong-vang-trang-18k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3751, 684, NULL, 'on-gn00ddw007324-nhan-kim-cuong-vang-trang-18k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/233/on-gn00ddw007324-nhan-kim-cuong-vang-trang-18k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3752, 684, NULL, 'on-gn00ddw007324-nhan-kim-cuong-vang-trang-18k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/233/on-gn00ddw007324-nhan-kim-cuong-vang-trang-18k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3753, 685, NULL, 'sp-gn00ddw007314-nhan-kim-cuong-vang-trang-18k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/233/sp-gn00ddw007314-nhan-kim-cuong-vang-trang-18k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3754, 685, NULL, 'sp-gn00ddw007314-nhan-kim-cuong-vang-trang-18k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/233/sp-gn00ddw007314-nhan-kim-cuong-vang-trang-18k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3755, 685, NULL, 'sp-gn00ddw007314-nhan-kim-cuong-vang-trang-18k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/233/sp-gn00ddw007314-nhan-kim-cuong-vang-trang-18k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3756, 685, NULL, 'on-gn00ddw007314-nhan-kim-cuong-vang-trang-18k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/233/on-gn00ddw007314-nhan-kim-cuong-vang-trang-18k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3757, 685, NULL, 'on-gn00ddw007314-nhan-kim-cuong-vang-trang-18k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/233/on-gn00ddw007314-nhan-kim-cuong-vang-trang-18k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3758, 685, NULL, 'on-gn00ddw007314-nhan-kim-cuong-vang-trang-18k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/233/on-gn00ddw007314-nhan-kim-cuong-vang-trang-18k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3759, 686, NULL, 'sp-gnddddw013416-nhan-kim-cuong-vang-trang-14k-mancode-by-pnj-1.png', 'https://cdn.pnj.io/images/detailed/237/sp-gnddddw013416-nhan-kim-cuong-vang-trang-14k-mancode-by-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3760, 686, NULL, 'sp-gnddddw013416-nhan-kim-cuong-vang-trang-14k-mancode-by-pnj-2.png', 'https://cdn.pnj.io/images/detailed/237/sp-gnddddw013416-nhan-kim-cuong-vang-trang-14k-mancode-by-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3761, 686, NULL, 'sp-gnddddw013416-nhan-kim-cuong-vang-trang-14k-mancode-by-pnj-3.png', 'https://cdn.pnj.io/images/detailed/237/sp-gnddddw013416-nhan-kim-cuong-vang-trang-14k-mancode-by-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3762, 686, NULL, 'on-gnddddw013416-nhan-kim-cuong-vang-trang-14k-mancode-by-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/237/on-gnddddw013416-nhan-kim-cuong-vang-trang-14k-mancode-by-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3763, 686, NULL, 'on-gnddddw013416-nhan-kim-cuong-vang-trang-14k-mancode-by-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/237/on-gnddddw013416-nhan-kim-cuong-vang-trang-14k-mancode-by-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3764, 686, NULL, 'on-gnddddw013416-nhan-kim-cuong-vang-trang-14k-mancode-by-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/237/on-gnddddw013416-nhan-kim-cuong-vang-trang-14k-mancode-by-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3765, 687, NULL, 'sp-gn00ddw063733-nhan-kim-cuong-vang-trang-18k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/238/sp-gn00ddw063733-nhan-kim-cuong-vang-trang-18k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3766, 687, NULL, 'sp-gn00ddw063733-nhan-kim-cuong-vang-trang-18k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/238/sp-gn00ddw063733-nhan-kim-cuong-vang-trang-18k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3767, 687, NULL, 'sp-gn00ddw063733-nhan-kim-cuong-vang-trang-18k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/238/sp-gn00ddw063733-nhan-kim-cuong-vang-trang-18k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3768, 687, NULL, 'on-gn00ddw063733-nhan-kim-cuong-vang-trang-18k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/238/on-gn00ddw063733-nhan-kim-cuong-vang-trang-18k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3769, 687, NULL, 'on-gn00ddw063733-nhan-kim-cuong-vang-trang-18k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/238/on-gn00ddw063733-nhan-kim-cuong-vang-trang-18k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3770, 687, NULL, 'on-gn00ddw063733-nhan-kim-cuong-vang-trang-18k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/238/on-gn00ddw063733-nhan-kim-cuong-vang-trang-18k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3771, 688, NULL, 'sp-gnddddw013497-nhan-kim-cuong-vang-trang-14k-mancode-by-pnj-1.png', 'https://cdn.pnj.io/images/detailed/237/sp-gnddddw013497-nhan-kim-cuong-vang-trang-14k-mancode-by-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3772, 688, NULL, 'sp-gnddddw013497-nhan-kim-cuong-vang-trang-14k-mancode-by-pnj-2.png', 'https://cdn.pnj.io/images/detailed/237/sp-gnddddw013497-nhan-kim-cuong-vang-trang-14k-mancode-by-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3773, 688, NULL, 'sp-gnddddw013497-nhan-kim-cuong-vang-trang-14k-mancode-by-pnj-3.png', 'https://cdn.pnj.io/images/detailed/237/sp-gnddddw013497-nhan-kim-cuong-vang-trang-14k-mancode-by-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3774, 688, NULL, 'on-gnddddw013497-nhan-kim-cuong-vang-trang-14k-mancode-by-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/237/on-gnddddw013497-nhan-kim-cuong-vang-trang-14k-mancode-by-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3775, 688, NULL, 'on-gnddddw013497-nhan-kim-cuong-vang-trang-14k-mancode-by-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/237/on-gnddddw013497-nhan-kim-cuong-vang-trang-14k-mancode-by-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3776, 688, NULL, 'on-gnddddw013497-nhan-kim-cuong-vang-trang-14k-mancode-by-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/237/on-gnddddw013497-nhan-kim-cuong-vang-trang-14k-mancode-by-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3777, 689, NULL, 'sp-gn00ddw007287-nhan-kim-cuong-vang-trang-18k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/237/sp-gn00ddw007287-nhan-kim-cuong-vang-trang-18k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3778, 689, NULL, 'sp-gn00ddw007287-nhan-kim-cuong-vang-trang-18k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/237/sp-gn00ddw007287-nhan-kim-cuong-vang-trang-18k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3779, 689, NULL, 'sp-gn00ddw007287-nhan-kim-cuong-vang-trang-18k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/237/sp-gn00ddw007287-nhan-kim-cuong-vang-trang-18k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3780, 689, NULL, 'on-gn00ddw007287-nhan-kim-cuong-vang-trang-18k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/237/on-gn00ddw007287-nhan-kim-cuong-vang-trang-18k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3781, 689, NULL, 'on-gn00ddw007287-nhan-kim-cuong-vang-trang-18k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/237/on-gn00ddw007287-nhan-kim-cuong-vang-trang-18k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3782, 689, NULL, 'on-gn00ddw007287-nhan-kim-cuong-vang-trang-18k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/237/on-gn00ddw007287-nhan-kim-cuong-vang-trang-18k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3783, 690, NULL, 'sp-gn00ddw007288-nhan-kim-cuong-vang-trang-18k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/233/sp-gn00ddw007288-nhan-kim-cuong-vang-trang-18k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3784, 690, NULL, 'icon-play-video80.png', 'https://www.pnj.com.vn/images/videos/icon-play-video80.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3785, 690, NULL, 'sp-gn00ddw007288-nhan-kim-cuong-vang-trang-18k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/233/sp-gn00ddw007288-nhan-kim-cuong-vang-trang-18k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3786, 690, NULL, 'sp-gn00ddw007288-nhan-kim-cuong-vang-trang-18k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/233/sp-gn00ddw007288-nhan-kim-cuong-vang-trang-18k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3787, 690, NULL, 'on-gn00ddw007288-nhan-kim-cuong-vang-trang-18k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/233/on-gn00ddw007288-nhan-kim-cuong-vang-trang-18k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3788, 690, NULL, 'on-gn00ddw007288-nhan-kim-cuong-vang-trang-18k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/233/on-gn00ddw007288-nhan-kim-cuong-vang-trang-18k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3789, 690, NULL, 'on-gn00ddw007288-nhan-kim-cuong-vang-trang-18k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/233/on-gn00ddw007288-nhan-kim-cuong-vang-trang-18k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3790, 691, NULL, 'sp-gndd00w060464-nhan-kim-cuong-vang-trang-14k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/237/sp-gndd00w060464-nhan-kim-cuong-vang-trang-14k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3791, 691, NULL, 'sp-gndd00w060464-nhan-kim-cuong-vang-trang-14k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/237/sp-gndd00w060464-nhan-kim-cuong-vang-trang-14k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3792, 691, NULL, 'sp-gndd00w060464-nhan-kim-cuong-vang-trang-14k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/237/sp-gndd00w060464-nhan-kim-cuong-vang-trang-14k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3793, 692, NULL, 'sp-gndd00w060466-nhan-kim-cuong-vang-trang-14k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/235/sp-gndd00w060466-nhan-kim-cuong-vang-trang-14k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3794, 692, NULL, 'sp-gndd00w060466-nhan-kim-cuong-vang-trang-14k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/235/sp-gndd00w060466-nhan-kim-cuong-vang-trang-14k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3795, 692, NULL, 'sp-gndd00w060466-nhan-kim-cuong-vang-trang-14k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/235/sp-gndd00w060466-nhan-kim-cuong-vang-trang-14k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3796, 692, NULL, 'on-gndd00w060466-nhan-kim-cuong-vang-trang-14k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/235/on-gndd00w060466-nhan-kim-cuong-vang-trang-14k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3797, 692, NULL, 'on-gndd00w060466-nhan-kim-cuong-vang-trang-14k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/235/on-gndd00w060466-nhan-kim-cuong-vang-trang-14k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3798, 692, NULL, 'on-gndd00w060466-nhan-kim-cuong-vang-trang-14k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/235/on-gndd00w060466-nhan-kim-cuong-vang-trang-14k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3799, 693, NULL, 'sp-gndd00w060465-nhan-kim-cuong-vang-trang-14k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/235/sp-gndd00w060465-nhan-kim-cuong-vang-trang-14k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3800, 693, NULL, 'sp-gndd00w060465-nhan-kim-cuong-vang-trang-14k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/235/sp-gndd00w060465-nhan-kim-cuong-vang-trang-14k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3801, 693, NULL, 'sp-gndd00w060465-nhan-kim-cuong-vang-trang-14k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/235/sp-gndd00w060465-nhan-kim-cuong-vang-trang-14k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3802, 693, NULL, 'on-gndd00w060465-nhan-kim-cuong-vang-trang-14k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/235/on-gndd00w060465-nhan-kim-cuong-vang-trang-14k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3803, 693, NULL, 'on-gndd00w060465-nhan-kim-cuong-vang-trang-14k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/235/on-gndd00w060465-nhan-kim-cuong-vang-trang-14k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3804, 693, NULL, 'on-gndd00w060465-nhan-kim-cuong-vang-trang-14k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/235/on-gndd00w060465-nhan-kim-cuong-vang-trang-14k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3805, 694, NULL, 'sp-gnddddw014518-nhan-kim-cuong-vang-trang-14k-pnj.png', 'https://cdn.pnj.io/images/detailed/238/sp-gnddddw014518-nhan-kim-cuong-vang-trang-14k-pnj.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3806, 694, NULL, 'sp-gnddddw014518-nhan-kim-cuong-vang-trang-14k-pnj-02.png', 'https://cdn.pnj.io/images/detailed/238/sp-gnddddw014518-nhan-kim-cuong-vang-trang-14k-pnj-02.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3807, 694, NULL, 'sp-gnddddw014518-nhan-kim-cuong-vang-trang-14k-pnj-03.png', 'https://cdn.pnj.io/images/detailed/238/sp-gnddddw014518-nhan-kim-cuong-vang-trang-14k-pnj-03.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3808, 695, NULL, 'sp-gnddddw013481-nhan-kim-cuong-vang-trang-14k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/239/sp-gnddddw013481-nhan-kim-cuong-vang-trang-14k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3809, 695, NULL, 'sp-gnddddw013481-nhan-kim-cuong-vang-trang-14k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/239/sp-gnddddw013481-nhan-kim-cuong-vang-trang-14k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3810, 695, NULL, 'sp-gnddddw013481-nhan-kim-cuong-vang-trang-14k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/239/sp-gnddddw013481-nhan-kim-cuong-vang-trang-14k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3811, 695, NULL, 'on-gnddddw013481-nhan-kim-cuong-vang-trang-14k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/239/on-gnddddw013481-nhan-kim-cuong-vang-trang-14k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3812, 695, NULL, 'on-gnddddw013481-nhan-kim-cuong-vang-trang-14k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/239/on-gnddddw013481-nhan-kim-cuong-vang-trang-14k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3813, 695, NULL, 'on-gnddddw013481-nhan-kim-cuong-vang-trang-14k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/239/on-gnddddw013481-nhan-kim-cuong-vang-trang-14k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3814, 696, NULL, 'sp-gn00ddw063959-nhan-kim-cuong-vang-trang-18k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/237/sp-gn00ddw063959-nhan-kim-cuong-vang-trang-18k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3815, 696, NULL, 'sp-gn00ddw063959-nhan-kim-cuong-vang-trang-18k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/237/sp-gn00ddw063959-nhan-kim-cuong-vang-trang-18k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3816, 696, NULL, 'sp-gn00ddw063959-nhan-kim-cuong-vang-trang-18k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/237/sp-gn00ddw063959-nhan-kim-cuong-vang-trang-18k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3817, 696, NULL, 'on-gn00ddw063959-nhan-kim-cuong-vang-trang-18k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/237/on-gn00ddw063959-nhan-kim-cuong-vang-trang-18k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3818, 696, NULL, 'on-gn00ddw063959-nhan-kim-cuong-vang-trang-18k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/237/on-gn00ddw063959-nhan-kim-cuong-vang-trang-18k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3819, 696, NULL, 'on-gn00ddw063959-nhan-kim-cuong-vang-trang-18k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/237/on-gn00ddw063959-nhan-kim-cuong-vang-trang-18k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3820, 697, NULL, 'sp-gn00ddw063960-nhan-kim-cuong-vang-trang-18k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/237/sp-gn00ddw063960-nhan-kim-cuong-vang-trang-18k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3821, 697, NULL, 'sp-gn00ddw063960-nhan-kim-cuong-vang-trang-18k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/237/sp-gn00ddw063960-nhan-kim-cuong-vang-trang-18k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3822, 697, NULL, 'sp-gn00ddw063960-nhan-kim-cuong-vang-trang-18k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/237/sp-gn00ddw063960-nhan-kim-cuong-vang-trang-18k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3823, 697, NULL, 'on-gn00ddw063960-nhan-kim-cuong-vang-trang-18k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/237/on-gn00ddw063960-nhan-kim-cuong-vang-trang-18k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3824, 697, NULL, 'on-gn00ddw063960-nhan-kim-cuong-vang-trang-18k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/237/on-gn00ddw063960-nhan-kim-cuong-vang-trang-18k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3825, 697, NULL, 'on-gn00ddw063960-nhan-kim-cuong-vang-trang-18k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/237/on-gn00ddw063960-nhan-kim-cuong-vang-trang-18k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3826, 698, NULL, 'sp-gn00ddw063962-nhan-kim-cuong-vang-trang-18k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/237/sp-gn00ddw063962-nhan-kim-cuong-vang-trang-18k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3827, 698, NULL, 'sp-gn00ddw063962-nhan-kim-cuong-vang-trang-18k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/237/sp-gn00ddw063962-nhan-kim-cuong-vang-trang-18k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3828, 698, NULL, 'sp-gn00ddw063962-nhan-kim-cuong-vang-trang-18k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/237/sp-gn00ddw063962-nhan-kim-cuong-vang-trang-18k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3829, 698, NULL, 'on-gn00ddw063962-nhan-kim-cuong-vang-trang-18k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/237/on-gn00ddw063962-nhan-kim-cuong-vang-trang-18k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3830, 698, NULL, 'on-gn00ddw063962-nhan-kim-cuong-vang-trang-18k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/237/on-gn00ddw063962-nhan-kim-cuong-vang-trang-18k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3831, 698, NULL, 'on-gn00ddw063962-nhan-kim-cuong-vang-trang-18k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/237/on-gn00ddw063962-nhan-kim-cuong-vang-trang-18k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3832, 699, NULL, 'sp-gnddddw013992-nhan-kim-cuong-vang-trang-14k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/238/sp-gnddddw013992-nhan-kim-cuong-vang-trang-14k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3833, 699, NULL, 'sp-gnddddw013992-nhan-kim-cuong-vang-trang-14k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/238/sp-gnddddw013992-nhan-kim-cuong-vang-trang-14k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3834, 699, NULL, 'sp-gnddddw013992-nhan-kim-cuong-vang-trang-14k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/238/sp-gnddddw013992-nhan-kim-cuong-vang-trang-14k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3835, 699, NULL, 'on-gnddddw013992-nhan-kim-cuong-vang-trang-14k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/238/on-gnddddw013992-nhan-kim-cuong-vang-trang-14k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3836, 699, NULL, 'on-gnddddw013992-nhan-kim-cuong-vang-trang-14k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/238/on-gnddddw013992-nhan-kim-cuong-vang-trang-14k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3837, 699, NULL, 'on-gnddddw013992-nhan-kim-cuong-vang-trang-14k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/238/on-gnddddw013992-nhan-kim-cuong-vang-trang-14k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3838, 700, NULL, 'sp-gnddddw013993-nhan-kim-cuong-vang-trang-14k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/238/sp-gnddddw013993-nhan-kim-cuong-vang-trang-14k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3839, 700, NULL, 'sp-gnddddw013993-nhan-kim-cuong-vang-trang-14k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/238/sp-gnddddw013993-nhan-kim-cuong-vang-trang-14k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3840, 700, NULL, 'sp-gnddddw013993-nhan-kim-cuong-vang-trang-14k-pnj-3.png', 'https://cdn.pnj.io/images/detailed/238/sp-gnddddw013993-nhan-kim-cuong-vang-trang-14k-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3841, 700, NULL, 'on-gnddddw013993-nhan-kim-cuong-vang-trang-14k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/238/on-gnddddw013993-nhan-kim-cuong-vang-trang-14k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3842, 700, NULL, 'on-gnddddw013993-nhan-kim-cuong-vang-trang-14k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/238/on-gnddddw013993-nhan-kim-cuong-vang-trang-14k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3843, 700, NULL, 'on-gnddddw013993-nhan-kim-cuong-vang-trang-14k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/238/on-gnddddw013993-nhan-kim-cuong-vang-trang-14k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3844, 701, NULL, 'sp-pn00ddw000016-vo-nhan-bach-kim-dinh-kim-cuong-pnj-1.png', 'https://cdn.pnj.io/images/detailed/163/sp-pn00ddw000016-vo-nhan-bach-kim-dinh-kim-cuong-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3845, 701, NULL, 'sp-pn00ddw000016-vo-nhan-bach-kim-dinh-kim-cuong-pnj-2.png', 'https://cdn.pnj.io/images/detailed/163/sp-pn00ddw000016-vo-nhan-bach-kim-dinh-kim-cuong-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3846, 701, NULL, 'sp-pn00ddw000016-vo-nhan-bach-kim-dinh-kim-cuong-pnj-3.png', 'https://cdn.pnj.io/images/detailed/163/sp-pn00ddw000016-vo-nhan-bach-kim-dinh-kim-cuong-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3847, 701, NULL, 'on-pn00ddw000016-vo-nhan-bach-kim-dinh-kim-cuong-pnj-4.jpg', 'https://cdn.pnj.io/images/detailed/163/on-pn00ddw000016-vo-nhan-bach-kim-dinh-kim-cuong-pnj-4.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3848, 701, NULL, 'on-pn00ddw000016-vo-nhan-bach-kim-dinh-kim-cuong-pnj-5.jpg', 'https://cdn.pnj.io/images/detailed/163/on-pn00ddw000016-vo-nhan-bach-kim-dinh-kim-cuong-pnj-5.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:56.000000', 3849, 701, NULL, 'on-pn00ddw000016-vo-nhan-bach-kim-dinh-kim-cuong-pnj-6.jpg', 'https://cdn.pnj.io/images/detailed/163/on-pn00ddw000016-vo-nhan-bach-kim-dinh-kim-cuong-pnj-6.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 3973, 726, NULL, 'sp-pnddddc000006-nhan-cuoi-nam-bach-kim-dinh-kim-cuong-pnj-1.png', 'https://cdn.pnj.io/images/detailed/184/sp-pnddddc000006-nhan-cuoi-nam-bach-kim-dinh-kim-cuong-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 3974, 726, NULL, 'sp-pnddddc000006-nhan-cuoi-nam-bach-kim-dinh-kim-cuong-pnj-2.png', 'https://cdn.pnj.io/images/detailed/184/sp-pnddddc000006-nhan-cuoi-nam-bach-kim-dinh-kim-cuong-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 3975, 726, NULL, 'sp-pnddddc000006-nhan-cuoi-nam-bach-kim-dinh-kim-cuong-pnj-3.png', 'https://cdn.pnj.io/images/detailed/184/sp-pnddddc000006-nhan-cuoi-nam-bach-kim-dinh-kim-cuong-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 3976, 726, NULL, 'on-pnddddc000006-nhan-cuoi-nam-bach-kim-dinh-kim-cuong-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/184/on-pnddddc000006-nhan-cuoi-nam-bach-kim-dinh-kim-cuong-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 3977, 726, NULL, 'on-pnddddc000006-nhan-cuoi-nam-bach-kim-dinh-kim-cuong-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/184/on-pnddddc000006-nhan-cuoi-nam-bach-kim-dinh-kim-cuong-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 3978, 726, NULL, 'on-pnddddc000006-nhan-cuoi-nam-bach-kim-dinh-kim-cuong-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/184/on-pnddddc000006-nhan-cuoi-nam-bach-kim-dinh-kim-cuong-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 3979, 727, NULL, 'sp-pndd00w000382-nhan-bach-kim-kim-cuong-pnj-1.png', 'https://cdn.pnj.io/images/detailed/196/sp-pndd00w000382-nhan-bach-kim-kim-cuong-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 3980, 727, NULL, 'sp-pndd00w000382-nhan-bach-kim-kim-cuong-pnj-2.png', 'https://cdn.pnj.io/images/detailed/196/sp-pndd00w000382-nhan-bach-kim-kim-cuong-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 3981, 727, NULL, 'sp-pndd00w000382-nhan-bach-kim-kim-cuong-pnj-3.png', 'https://cdn.pnj.io/images/detailed/196/sp-pndd00w000382-nhan-bach-kim-kim-cuong-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 3982, 727, NULL, 'on-pndd00w000382-nhan-bach-kim-kim-cuong-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/197/on-pndd00w000382-nhan-bach-kim-kim-cuong-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 3983, 728, NULL, 'sp-PN00DDW060060-vo-nhan-bach-kim-dinh-pnj-1.png', 'https://cdn.pnj.io/images/detailed/182/sp-PN00DDW060060-vo-nhan-bach-kim-dinh-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 3984, 728, NULL, 'sp-PN00DDW060060-vo-nhan-bach-kim-dinh-pnj-2.png', 'https://cdn.pnj.io/images/detailed/182/sp-PN00DDW060060-vo-nhan-bach-kim-dinh-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 3985, 728, NULL, 'sp-PN00DDW060060-vo-nhan-bach-kim-dinh-pnj-3.png', 'https://cdn.pnj.io/images/detailed/182/sp-PN00DDW060060-vo-nhan-bach-kim-dinh-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 3986, 728, NULL, 'on-PN00DDW060060-vo-nhan-bach-kim-dinh-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/182/on-PN00DDW060060-vo-nhan-bach-kim-dinh-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 3987, 728, NULL, 'on-PN00DDW060060-vo-nhan-bach-kim-dinh-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/182/on-PN00DDW060060-vo-nhan-bach-kim-dinh-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 3988, 728, NULL, 'on-PN00DDW060060-vo-nhan-bach-kim-dinh-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/182/on-PN00DDW060060-vo-nhan-bach-kim-dinh-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 3989, 729, NULL, 'sp-pn00ddw060061-nhan-kim-cuong-bach-kim-trang-pnj-1.png', 'https://cdn.pnj.io/images/detailed/216/sp-pn00ddw060061-nhan-kim-cuong-bach-kim-trang-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 3990, 729, NULL, 'sp-pn00ddw060061-nhan-kim-cuong-bach-kim-trang-pnj-2.png', 'https://cdn.pnj.io/images/detailed/216/sp-pn00ddw060061-nhan-kim-cuong-bach-kim-trang-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 3991, 729, NULL, 'sp-pn00ddw060061-nhan-kim-cuong-bach-kim-trang-pnj-3.png', 'https://cdn.pnj.io/images/detailed/216/sp-pn00ddw060061-nhan-kim-cuong-bach-kim-trang-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 3992, 729, NULL, 'on-pn00ddw060061-nhan-kim-cuong-bach-kim-trang-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/216/on-pn00ddw060061-nhan-kim-cuong-bach-kim-trang-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 3993, 729, NULL, 'on-pn00ddw060061-nhan-kim-cuong-bach-kim-trang-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/216/on-pn00ddw060061-nhan-kim-cuong-bach-kim-trang-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 3994, 729, NULL, 'on-pn00ddw060061-nhan-kim-cuong-bach-kim-trang-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/216/on-pn00ddw060061-nhan-kim-cuong-bach-kim-trang-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 3995, 730, NULL, 'sp-pn00ddw060062-nhan-kim-cuong-bach-kim-trang-pnj-1.png', 'https://cdn.pnj.io/images/detailed/216/sp-pn00ddw060062-nhan-kim-cuong-bach-kim-trang-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 3996, 730, NULL, 'sp-pn00ddw060062-nhan-kim-cuong-bach-kim-trang-pnj-2.png', 'https://cdn.pnj.io/images/detailed/216/sp-pn00ddw060062-nhan-kim-cuong-bach-kim-trang-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 3997, 730, NULL, 'sp-pn00ddw060062-nhan-kim-cuong-bach-kim-trang-pnj-3.png', 'https://cdn.pnj.io/images/detailed/216/sp-pn00ddw060062-nhan-kim-cuong-bach-kim-trang-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 3998, 730, NULL, 'on-pn00ddw060062-nhan-kim-cuong-bach-kim-trang-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/216/on-pn00ddw060062-nhan-kim-cuong-bach-kim-trang-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 3999, 730, NULL, 'on-pn00ddw060062-nhan-kim-cuong-bach-kim-trang-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/216/on-pn00ddw060062-nhan-kim-cuong-bach-kim-trang-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4000, 730, NULL, 'on-pn00ddw060062-nhan-kim-cuong-bach-kim-trang-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/216/on-pn00ddw060062-nhan-kim-cuong-bach-kim-trang-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4001, 731, NULL, 'sp-pn00ddw060064-nhan-kim-cuong-bach-kim-trang-pnj-1.png', 'https://cdn.pnj.io/images/detailed/216/sp-pn00ddw060064-nhan-kim-cuong-bach-kim-trang-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4002, 731, NULL, 'sp-pn00ddw060064-nhan-kim-cuong-bach-kim-trang-pnj-2.png', 'https://cdn.pnj.io/images/detailed/216/sp-pn00ddw060064-nhan-kim-cuong-bach-kim-trang-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4003, 731, NULL, 'sp-pn00ddw060064-nhan-kim-cuong-bach-kim-trang-pnj-3.png', 'https://cdn.pnj.io/images/detailed/216/sp-pn00ddw060064-nhan-kim-cuong-bach-kim-trang-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4004, 731, NULL, 'on-pn00ddw060064-nhan-kim-cuong-bach-kim-trang-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/216/on-pn00ddw060064-nhan-kim-cuong-bach-kim-trang-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4005, 731, NULL, 'on-pn00ddw060064-nhan-kim-cuong-bach-kim-trang-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/216/on-pn00ddw060064-nhan-kim-cuong-bach-kim-trang-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4006, 731, NULL, 'on-pn00ddw060064-nhan-kim-cuong-bach-kim-trang-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/216/on-pn00ddw060064-nhan-kim-cuong-bach-kim-trang-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4007, 732, NULL, 'sp-pn00ddw060063-nhan-kim-cuong-bach-kim-trang-pnj-1.png', 'https://cdn.pnj.io/images/detailed/216/sp-pn00ddw060063-nhan-kim-cuong-bach-kim-trang-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4008, 732, NULL, 'sp-pn00ddw060063-nhan-kim-cuong-bach-kim-trang-pnj-2.png', 'https://cdn.pnj.io/images/detailed/216/sp-pn00ddw060063-nhan-kim-cuong-bach-kim-trang-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4009, 732, NULL, 'sp-pn00ddw060063-nhan-kim-cuong-bach-kim-trang-pnj-3.png', 'https://cdn.pnj.io/images/detailed/216/sp-pn00ddw060063-nhan-kim-cuong-bach-kim-trang-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4010, 732, NULL, 'on-pn00ddw060063-nhan-kim-cuong-bach-kim-trang-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/216/on-pn00ddw060063-nhan-kim-cuong-bach-kim-trang-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4011, 732, NULL, 'on-pn00ddw060063-nhan-kim-cuong-bach-kim-trang-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/216/on-pn00ddw060063-nhan-kim-cuong-bach-kim-trang-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4012, 732, NULL, 'on-pn00ddw060063-nhan-kim-cuong-bach-kim-trang-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/216/on-pn00ddw060063-nhan-kim-cuong-bach-kim-trang-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4013, 733, NULL, 'sp-pn0000w060015-vo-nhan-bach-kim-dinh-pnj-1.png', 'https://cdn.pnj.io/images/detailed/216/sp-pn0000w060015-vo-nhan-bach-kim-dinh-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4014, 733, NULL, 'sp-pn0000w060015-vo-nhan-bach-kim-dinh-pnj-2.png', 'https://cdn.pnj.io/images/detailed/216/sp-pn0000w060015-vo-nhan-bach-kim-dinh-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4015, 733, NULL, 'sp-pn0000w060015-vo-nhan-bach-kim-dinh-pnj-3.png', 'https://cdn.pnj.io/images/detailed/216/sp-pn0000w060015-vo-nhan-bach-kim-dinh-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4016, 733, NULL, 'on-pn0000w060015-vo-nhan-bach-kim-dinh-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/216/on-pn0000w060015-vo-nhan-bach-kim-dinh-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4017, 733, NULL, 'on-pn0000w060015-vo-nhan-bach-kim-dinh-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/216/on-pn0000w060015-vo-nhan-bach-kim-dinh-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4018, 733, NULL, 'on-pn0000w060015-vo-nhan-bach-kim-dinh-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/216/on-pn0000w060015-vo-nhan-bach-kim-dinh-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4019, 734, NULL, 'sp-pn00ddw060052-vo-nhan-bach-kim-pnj-1.png', 'https://cdn.pnj.io/images/detailed/218/sp-pn00ddw060052-vo-nhan-bach-kim-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4020, 734, NULL, 'sp-pn00ddw060052-vo-nhan-bach-kim-pnj-2.png', 'https://cdn.pnj.io/images/detailed/218/sp-pn00ddw060052-vo-nhan-bach-kim-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4021, 734, NULL, 'sp-pn00ddw060052-vo-nhan-bach-kim-pnj-3.png', 'https://cdn.pnj.io/images/detailed/218/sp-pn00ddw060052-vo-nhan-bach-kim-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4022, 734, NULL, 'on-pn00ddw060052-vo-nhan-bach-kim-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/218/on-pn00ddw060052-vo-nhan-bach-kim-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4023, 734, NULL, 'on-pn00ddw060052-vo-nhan-bach-kim-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/218/on-pn00ddw060052-vo-nhan-bach-kim-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4024, 734, NULL, 'on-pn00ddw060052-vo-nhan-bach-kim-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/218/on-pn00ddw060052-vo-nhan-bach-kim-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4025, 735, NULL, 'sp-pn00ddw060056-vo-nhan-bach-kim-dinh-kim-cuong-pnj-1.png', 'https://cdn.pnj.io/images/detailed/218/sp-pn00ddw060056-vo-nhan-bach-kim-dinh-kim-cuong-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4026, 735, NULL, 'sp-pn00ddw060056-vo-nhan-bach-kim-dinh-kim-cuong-pnj-2.png', 'https://cdn.pnj.io/images/detailed/218/sp-pn00ddw060056-vo-nhan-bach-kim-dinh-kim-cuong-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4027, 735, NULL, 'sp-pn00ddw060056-vo-nhan-bach-kim-dinh-kim-cuong-pnj-3.png', 'https://cdn.pnj.io/images/detailed/218/sp-pn00ddw060056-vo-nhan-bach-kim-dinh-kim-cuong-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4028, 735, NULL, 'on-pn00ddw060056-vo-nhan-bach-kim-dinh-kim-cuong-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/218/on-pn00ddw060056-vo-nhan-bach-kim-dinh-kim-cuong-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4029, 735, NULL, 'on-pn00ddw060056-vo-nhan-bach-kim-dinh-kim-cuong-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/218/on-pn00ddw060056-vo-nhan-bach-kim-dinh-kim-cuong-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4030, 735, NULL, 'on-pn00ddw060056-vo-nhan-bach-kim-dinh-kim-cuong-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/218/on-pn00ddw060056-vo-nhan-bach-kim-dinh-kim-cuong-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4031, 736, NULL, 'sp-pn00ddw060051-vo-nhan-bach-kim-pnj-1.png', 'https://cdn.pnj.io/images/detailed/218/sp-pn00ddw060051-vo-nhan-bach-kim-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4032, 736, NULL, 'sp-pn00ddw060051-vo-nhan-bach-kim-pnj-2.png', 'https://cdn.pnj.io/images/detailed/218/sp-pn00ddw060051-vo-nhan-bach-kim-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4033, 736, NULL, 'sp-pn00ddw060051-vo-nhan-bach-kim-pnj-3.png', 'https://cdn.pnj.io/images/detailed/218/sp-pn00ddw060051-vo-nhan-bach-kim-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4034, 736, NULL, 'on-pn00ddw060051-vo-nhan-bach-kim-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/218/on-pn00ddw060051-vo-nhan-bach-kim-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4035, 736, NULL, 'on-pn00ddw060051-vo-nhan-bach-kim-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/218/on-pn00ddw060051-vo-nhan-bach-kim-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4036, 736, NULL, 'on-pn00ddw060051-vo-nhan-bach-kim-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/218/on-pn00ddw060051-vo-nhan-bach-kim-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4037, 737, NULL, 'sp-pn00ddw060054-vo-nhan-bach-kim-dinh-pnj-1.png', 'https://cdn.pnj.io/images/detailed/218/sp-pn00ddw060054-vo-nhan-bach-kim-dinh-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4038, 737, NULL, 'sp-pn00ddw060054-vo-nhan-bach-kim-dinh-pnj-2.png', 'https://cdn.pnj.io/images/detailed/218/sp-pn00ddw060054-vo-nhan-bach-kim-dinh-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4039, 737, NULL, 'sp-pn00ddw060054-vo-nhan-bach-kim-dinh-pnj-3.png', 'https://cdn.pnj.io/images/detailed/218/sp-pn00ddw060054-vo-nhan-bach-kim-dinh-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4040, 737, NULL, 'on-pn00ddw060054-vo-nhan-bach-kim-dinh-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/218/on-pn00ddw060054-vo-nhan-bach-kim-dinh-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4041, 737, NULL, 'on-pn00ddw060054-vo-nhan-bach-kim-dinh-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/218/on-pn00ddw060054-vo-nhan-bach-kim-dinh-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4042, 737, NULL, 'on-pn00ddw060054-vo-nhan-bach-kim-dinh-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/218/on-pn00ddw060054-vo-nhan-bach-kim-dinh-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4043, 738, NULL, 'sp-pn00ddw060053-vo-nhan-bach-kim-pnj-1.png', 'https://cdn.pnj.io/images/detailed/218/sp-pn00ddw060053-vo-nhan-bach-kim-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4044, 738, NULL, 'sp-pn00ddw060053-vo-nhan-bach-kim-pnj-2.png', 'https://cdn.pnj.io/images/detailed/218/sp-pn00ddw060053-vo-nhan-bach-kim-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4045, 738, NULL, 'sp-pn00ddw060053-vo-nhan-bach-kim-pnj-3.png', 'https://cdn.pnj.io/images/detailed/218/sp-pn00ddw060053-vo-nhan-bach-kim-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4046, 738, NULL, 'on-pn00ddw060053-vo-nhan-bach-kim-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/218/on-pn00ddw060053-vo-nhan-bach-kim-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4047, 738, NULL, 'on-pn00ddw060053-vo-nhan-bach-kim-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/218/on-pn00ddw060053-vo-nhan-bach-kim-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4048, 738, NULL, 'on-pn00ddw060053-vo-nhan-bach-kim-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/218/on-pn00ddw060053-vo-nhan-bach-kim-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4049, 739, NULL, 'sp-pn00ddw060055-vo-nhan-bach-kim-pnj-1.png', 'https://cdn.pnj.io/images/detailed/218/sp-pn00ddw060055-vo-nhan-bach-kim-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4050, 739, NULL, 'sp-pn00ddw060055-vo-nhan-bach-kim-pnj-2.png', 'https://cdn.pnj.io/images/detailed/218/sp-pn00ddw060055-vo-nhan-bach-kim-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4051, 739, NULL, 'sp-pn00ddw060055-vo-nhan-bach-kim-pnj-3.png', 'https://cdn.pnj.io/images/detailed/218/sp-pn00ddw060055-vo-nhan-bach-kim-pnj-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4052, 739, NULL, 'on-pn00ddw060055-vo-nhan-bach-kim-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/218/on-pn00ddw060055-vo-nhan-bach-kim-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4053, 739, NULL, 'on-pn00ddw060055-vo-nhan-bach-kim-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/218/on-pn00ddw060055-vo-nhan-bach-kim-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4054, 739, NULL, 'on-pn00ddw060055-vo-nhan-bach-kim-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/218/on-pn00ddw060055-vo-nhan-bach-kim-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4055, 740, NULL, 'sp-gvxm00w000382-vong-tay-vang-10k-dinh-da-ecz-pnj-1.png', 'https://cdn.pnj.io/images/detailed/225/sp-gvxm00w000382-vong-tay-vang-10k-dinh-da-ecz-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4056, 740, NULL, 'sp-gvxm00w000382-vong-tay-vang-10k-dinh-da-ecz-pnj-2.png', 'https://cdn.pnj.io/images/detailed/225/sp-gvxm00w000382-vong-tay-vang-10k-dinh-da-ecz-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4057, 740, NULL, 'on-gvxm00w000382-vong-tay-vang-10k-dinh-da-ecz-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/225/on-gvxm00w000382-vong-tay-vang-10k-dinh-da-ecz-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4058, 740, NULL, 'on-gvxm00w000382-vong-tay-vang-10k-dinh-da-ecz-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/225/on-gvxm00w000382-vong-tay-vang-10k-dinh-da-ecz-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4059, 740, NULL, 'on-gvxm00w000382-vong-tay-vang-10k-dinh-da-ecz-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/225/on-gvxm00w000382-vong-tay-vang-10k-dinh-da-ecz-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4090, 747, NULL, 'sp-sv0000w000069-vong-tay-tre-em-bac-pnjsilver-1.png', 'https://cdn.pnj.io/images/detailed/230/sp-sv0000w000069-vong-tay-tre-em-bac-pnjsilver-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4091, 747, NULL, 'sp-sv0000w000069-vong-tay-tre-em-bac-pnjsilver-2.png', 'https://cdn.pnj.io/images/detailed/230/sp-sv0000w000069-vong-tay-tre-em-bac-pnjsilver-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4097, 749, NULL, 'sp-sv0000w000074-vong-tay-bac-dinh-da-pnjsilver-1.png', 'https://cdn.pnj.io/images/detailed/229/sp-sv0000w000074-vong-tay-bac-dinh-da-pnjsilver-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4098, 749, NULL, 'sp-sv0000w000074-vong-tay-bac-dinh-da-pnjsilver-2.png', 'https://cdn.pnj.io/images/detailed/229/sp-sv0000w000074-vong-tay-bac-dinh-da-pnjsilver-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4099, 749, NULL, 'on-sv0000w000074-vong-tay-bac-dinh-da-pnjsilver-1.jpg', 'https://cdn.pnj.io/images/detailed/229/on-sv0000w000074-vong-tay-bac-dinh-da-pnjsilver-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4100, 749, NULL, 'on-sv0000w000074-vong-tay-bac-dinh-da-pnjsilver-2.jpg', 'https://cdn.pnj.io/images/detailed/229/on-sv0000w000074-vong-tay-bac-dinh-da-pnjsilver-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:57.000000', 4101, 749, NULL, 'on-sv0000w000074-vong-tay-bac-dinh-da-pnjsilver-3.jpg', 'https://cdn.pnj.io/images/detailed/229/on-sv0000w000074-vong-tay-bac-dinh-da-pnjsilver-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4236, 777, NULL, 'sp-svxmztw060000-vong-tay-bac-dinh-da-pnjsilver-1.png', 'https://cdn.pnj.io/images/detailed/234/sp-svxmztw060000-vong-tay-bac-dinh-da-pnjsilver-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4237, 777, NULL, 'sp-svxmztw060000-vong-tay-bac-dinh-da-pnjsilver-2.png', 'https://cdn.pnj.io/images/detailed/234/sp-svxmztw060000-vong-tay-bac-dinh-da-pnjsilver-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4238, 777, NULL, 'on-svxmztw060000-vong-tay-bac-dinh-da-pnjsilver-1.jpg', 'https://cdn.pnj.io/images/detailed/234/on-svxmztw060000-vong-tay-bac-dinh-da-pnjsilver-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4239, 777, NULL, 'on-svxmztw060000-vong-tay-bac-dinh-da-pnjsilver-2.jpg', 'https://cdn.pnj.io/images/detailed/234/on-svxmztw060000-vong-tay-bac-dinh-da-pnjsilver-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4240, 777, NULL, 'on-svxmztw060000-vong-tay-bac-dinh-da-pnjsilver-3.jpg', 'https://cdn.pnj.io/images/detailed/234/on-svxmztw060000-vong-tay-bac-dinh-da-pnjsilver-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4241, 778, NULL, 'sp-sv0000w000073-vong-tay-tre-em-bac-dinh-da-pnjsilver-3.png', 'https://cdn.pnj.io/images/detailed/235/sp-sv0000w000073-vong-tay-tre-em-bac-dinh-da-pnjsilver-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4242, 778, NULL, 'sp-sv0000w000073-vong-tay-tre-em-bac-dinh-da-pnjsilver-1.png', 'https://cdn.pnj.io/images/detailed/235/sp-sv0000w000073-vong-tay-tre-em-bac-dinh-da-pnjsilver-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4243, 778, NULL, 'sp-sv0000w000073-vong-tay-tre-em-bac-dinh-da-pnjsilver-2.png', 'https://cdn.pnj.io/images/detailed/235/sp-sv0000w000073-vong-tay-tre-em-bac-dinh-da-pnjsilver-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4244, 779, NULL, 'sp-gvpsddc060002-vong-tay-vang-18k-dinh-ngoc-trai-southsea-pnj-1.png', 'https://cdn.pnj.io/images/detailed/236/sp-gvpsddc060002-vong-tay-vang-18k-dinh-ngoc-trai-southsea-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4245, 779, NULL, 'sp-gvpsddc060002-vong-tay-vang-18k-dinh-ngoc-trai-southsea-pnj-2.png', 'https://cdn.pnj.io/images/detailed/236/sp-gvpsddc060002-vong-tay-vang-18k-dinh-ngoc-trai-southsea-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4246, 779, NULL, 'on-gvpsddc060002-vong-tay-vang-18k-dinh-ngoc-trai-southsea-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/236/on-gvpsddc060002-vong-tay-vang-18k-dinh-ngoc-trai-southsea-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4247, 779, NULL, 'on-gvpsddc060002-vong-tay-vang-18k-dinh-ngoc-trai-southsea-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/236/on-gvpsddc060002-vong-tay-vang-18k-dinh-ngoc-trai-southsea-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4248, 779, NULL, 'on-gvpsddc060002-vong-tay-vang-18k-dinh-ngoc-trai-southsea-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/236/on-gvpsddc060002-vong-tay-vang-18k-dinh-ngoc-trai-southsea-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4249, 780, NULL, 'sp-gv0000w060442-vong-tay-vang-trang-y-18k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/238/sp-gv0000w060442-vong-tay-vang-trang-y-18k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4250, 780, NULL, 'sp-gv0000w060442-vong-tay-vang-trang-y-18k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/238/sp-gv0000w060442-vong-tay-vang-trang-y-18k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4251, 780, NULL, 'on-gv0000w060442-vong-tay-vang-trang-y-18k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/238/on-gv0000w060442-vong-tay-vang-trang-y-18k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4252, 780, NULL, 'on-gv0000w060442-vong-tay-vang-trang-y-18k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/238/on-gv0000w060442-vong-tay-vang-trang-y-18k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4253, 780, NULL, 'on-gv0000w060442-vong-tay-vang-trang-y-18k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/238/on-gv0000w060442-vong-tay-vang-trang-y-18k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4254, 781, NULL, 'sp-gv0000w060440-vong-tay-vang-trang-y-18k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/238/sp-gv0000w060440-vong-tay-vang-trang-y-18k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4255, 781, NULL, 'sp-gv0000w060440-vong-tay-vang-trang-y-18k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/238/sp-gv0000w060440-vong-tay-vang-trang-y-18k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4256, 781, NULL, 'on-gv0000w060440-vong-tay-vang-trang-y-18k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/238/on-gv0000w060440-vong-tay-vang-trang-y-18k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4257, 781, NULL, 'on-gv0000w060440-vong-tay-vang-trang-y-18k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/238/on-gv0000w060440-vong-tay-vang-trang-y-18k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4258, 781, NULL, 'on-gv0000w060440-vong-tay-vang-trang-y-18k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/238/on-gv0000w060440-vong-tay-vang-trang-y-18k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4259, 782, NULL, 'sp-gvddddw001129-vong-tay-kim-cuong-vang-trang-14k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/238/sp-gvddddw001129-vong-tay-kim-cuong-vang-trang-14k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4260, 782, NULL, 'sp-gvddddw001129-vong-tay-kim-cuong-vang-trang-14k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/238/sp-gvddddw001129-vong-tay-kim-cuong-vang-trang-14k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4261, 782, NULL, 'on-gvddddw001129-vong-tay-kim-cuong-vang-trang-14k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/238/on-gvddddw001129-vong-tay-kim-cuong-vang-trang-14k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4262, 782, NULL, 'on-gvddddw001129-vong-tay-kim-cuong-vang-trang-14k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/238/on-gvddddw001129-vong-tay-kim-cuong-vang-trang-14k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4263, 782, NULL, 'on-gvddddw001129-vong-tay-kim-cuong-vang-trang-14k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/238/on-gvddddw001129-vong-tay-kim-cuong-vang-trang-14k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4264, 783, NULL, 'sp-gvsp00x000007-nhan-vang-14k-dinh-da-sapphire-pnj-1.png', 'https://cdn.pnj.io/images/detailed/240/sp-gvsp00x000007-nhan-vang-14k-dinh-da-sapphire-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4265, 783, NULL, 'sp-gvsp00x000007-nhan-vang-14k-dinh-da-sapphire-pnj-2.png', 'https://cdn.pnj.io/images/detailed/240/sp-gvsp00x000007-nhan-vang-14k-dinh-da-sapphire-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4266, 783, NULL, 'on-gvsp00x000007-nhan-vang-14k-dinh-da-sapphire-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/240/on-gvsp00x000007-nhan-vang-14k-dinh-da-sapphire-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4267, 783, NULL, 'on-gvsp00x000007-nhan-vang-14k-dinh-da-sapphire-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/240/on-gvsp00x000007-nhan-vang-14k-dinh-da-sapphire-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4268, 783, NULL, 'on-gvsp00x000007-nhan-vang-14k-dinh-da-sapphire-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/240/on-gvsp00x000007-nhan-vang-14k-dinh-da-sapphire-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4269, 784, NULL, 'sp-gvddddw001128-vong-tay-kim-cuong-vang-trang-14k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/238/sp-gvddddw001128-vong-tay-kim-cuong-vang-trang-14k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4270, 784, NULL, 'sp-gvddddw001128-vong-tay-kim-cuong-vang-trang-14k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/238/sp-gvddddw001128-vong-tay-kim-cuong-vang-trang-14k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4271, 784, NULL, 'on-gvddddw001128-vong-tay-kim-cuong-vang-trang-14k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/238/on-gvddddw001128-vong-tay-kim-cuong-vang-trang-14k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4272, 784, NULL, 'on-gvddddw001128-vong-tay-kim-cuong-vang-trang-14k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/238/on-gvddddw001128-vong-tay-kim-cuong-vang-trang-14k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4273, 784, NULL, 'on-gvddddw001128-vong-tay-kim-cuong-vang-trang-14k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/238/on-gvddddw001128-vong-tay-kim-cuong-vang-trang-14k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4274, 785, NULL, 'sp-gvxmxmw001361-vong-tay-vang-trang-14k-dinh-da-ecz-pnj-1.png', 'https://cdn.pnj.io/images/detailed/238/sp-gvxmxmw001361-vong-tay-vang-trang-14k-dinh-da-ecz-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4275, 785, NULL, 'sp-gvxmxmw001361-vong-tay-vang-trang-14k-dinh-da-ecz-pnj-2.png', 'https://cdn.pnj.io/images/detailed/238/sp-gvxmxmw001361-vong-tay-vang-trang-14k-dinh-da-ecz-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4276, 785, NULL, 'on-gvxmxmw001361-vong-tay-vang-trang-14k-dinh-da-ecz-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/238/on-gvxmxmw001361-vong-tay-vang-trang-14k-dinh-da-ecz-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4277, 785, NULL, 'on-gvxmxmw001361-vong-tay-vang-trang-14k-dinh-da-ecz-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/238/on-gvxmxmw001361-vong-tay-vang-trang-14k-dinh-da-ecz-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4278, 785, NULL, 'on-gvxmxmw001361-vong-tay-vang-trang-14k-dinh-da-ecz-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/238/on-gvxmxmw001361-vong-tay-vang-trang-14k-dinh-da-ecz-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4279, 786, NULL, 'sp-gv0000w060441-vong-tay-vang-trang-y-18k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/239/sp-gv0000w060441-vong-tay-vang-trang-y-18k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4280, 786, NULL, 'sp-gv0000w060441-vong-tay-vang-trang-y-18k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/239/sp-gv0000w060441-vong-tay-vang-trang-y-18k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4281, 786, NULL, 'on-gv0000w060441-vong-tay-vang-trang-y-18k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/240/on-gv0000w060441-vong-tay-vang-trang-y-18k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4282, 786, NULL, 'on-gv0000w060441-vong-tay-vang-trang-y-18k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/240/on-gv0000w060441-vong-tay-vang-trang-y-18k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4283, 786, NULL, 'on-gv0000w060441-vong-tay-vang-trang-y-18k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/240/on-gv0000w060441-vong-tay-vang-trang-y-18k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4284, 787, NULL, 'sp-gv00ddw060341-vo-vong-tay-kim-cuong-vang-trang-18k-pnj-1.png', 'https://cdn.pnj.io/images/detailed/240/sp-gv00ddw060341-vo-vong-tay-kim-cuong-vang-trang-18k-pnj-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4285, 787, NULL, 'sp-gv00ddw060341-vo-vong-tay-kim-cuong-vang-trang-18k-pnj-2.png', 'https://cdn.pnj.io/images/detailed/240/sp-gv00ddw060341-vo-vong-tay-kim-cuong-vang-trang-18k-pnj-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4286, 787, NULL, 'on-gv00ddw060341-vo-vong-tay-kim-cuong-vang-trang-18k-pnj-1.jpg', 'https://cdn.pnj.io/images/detailed/240/on-gv00ddw060341-vo-vong-tay-kim-cuong-vang-trang-18k-pnj-1.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4287, 787, NULL, 'on-gv00ddw060341-vo-vong-tay-kim-cuong-vang-trang-18k-pnj-2.jpg', 'https://cdn.pnj.io/images/detailed/240/on-gv00ddw060341-vo-vong-tay-kim-cuong-vang-trang-18k-pnj-2.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4288, 787, NULL, 'on-gv00ddw060341-vo-vong-tay-kim-cuong-vang-trang-18k-pnj-3.jpg', 'https://cdn.pnj.io/images/detailed/240/on-gv00ddw060341-vo-vong-tay-kim-cuong-vang-trang-18k-pnj-3.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4289, 788, NULL, 'PVDD00W060000-Vong-tay-Bach-kim-Trang-dinh-Kim-cuong-PNJ-1.png', 'https://cdn.pnj.io/images/detailed/147/PVDD00W060000-Vong-tay-Bach-kim-Trang-dinh-Kim-cuong-PNJ-1.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4290, 788, NULL, 'PVDD00W060000-Vong-tay-Bach-kim-Trang-dinh-Kim-cuong-PNJ-2.png', 'https://cdn.pnj.io/images/detailed/147/PVDD00W060000-Vong-tay-Bach-kim-Trang-dinh-Kim-cuong-PNJ-2.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4291, 788, NULL, 'PVDD00W060000-Vong-tay-Bach-kim-Trang-dinh-Kim-cuong-PNJ-3.png', 'https://cdn.pnj.io/images/detailed/147/PVDD00W060000-Vong-tay-Bach-kim-Trang-dinh-Kim-cuong-PNJ-3.png');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4292, 788, NULL, 'PVDD00W060000-Vong-tay-Bach-kim-Trang-dinh-Kim-cuong-PNJ-4.jpg', 'https://cdn.pnj.io/images/detailed/147/PVDD00W060000-Vong-tay-Bach-kim-Trang-dinh-Kim-cuong-PNJ-4.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4293, 788, NULL, 'PVDD00W060000-Vong-tay-Bach-kim-Trang-dinh-Kim-cuong-PNJ-5.jpg', 'https://cdn.pnj.io/images/detailed/147/PVDD00W060000-Vong-tay-Bach-kim-Trang-dinh-Kim-cuong-PNJ-5.jpg');
INSERT INTO `product_image` VALUES ('2025-05-02 20:45:58.000000', 4294, 788, NULL, 'PVDD00W060000-Vong-tay-Bach-kim-Trang-dinh-Kim-cuong-PNJ-6.jpg', 'https://cdn.pnj.io/images/detailed/147/PVDD00W060000-Vong-tay-Bach-kim-Trang-dinh-Kim-cuong-PNJ-6.jpg');

-- ----------------------------
-- Table structure for product_size
-- ----------------------------
DROP TABLE IF EXISTS `product_size`;
CREATE TABLE `product_size`  (
  `is_deleted` bit(1) NOT NULL,
  `discount_price` bigint NULL DEFAULT NULL,
  `discount_rate` bigint NULL DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `price` bigint NULL DEFAULT NULL,
  `product_id` bigint NULL DEFAULT NULL,
  `sold` bigint NULL DEFAULT NULL,
  `stock` bigint NULL DEFAULT NULL,
  `size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK8i3jm2ctt0lsyeik2wt76yvv0`(`product_id` ASC) USING BTREE,
  CONSTRAINT `FK8i3jm2ctt0lsyeik2wt76yvv0` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1351 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_size
-- ----------------------------
INSERT INTO `product_size` VALUES (b'0', 19133100, 0, 61, 19133100, 61, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 38252000, 0, 62, 38252000, 62, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 23735000, 0, 63, 23735000, 63, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 13225000, 0, 64, 13225000, 64, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 16100000, 0, 65, 16100000, 65, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 16100000, 0, 66, 16100000, 66, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 17900000, 0, 67, 17900000, 67, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 19400000, 0, 68, 19400000, 68, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 30700000, 0, 69, 30700000, 69, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 21500000, 0, 70, 21500000, 70, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 10700000, 0, 71, 10700000, 71, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 7500000, 0, 72, 7500000, 72, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 895000, 0, 122, 895000, 122, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 755000, 0, 123, 755000, 123, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 495000, 0, 124, 495000, 124, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 495000, 0, 125, 495000, 125, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 895000, 0, 126, 895000, 126, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 795000, 0, 127, 795000, 127, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 1295000, 0, 128, 1295000, 128, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 955000, 0, 129, 955000, 129, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 695000, 0, 130, 695000, 130, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 1055000, 0, 131, 1055000, 131, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 855000, 0, 132, 855000, 132, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 955000, 0, 133, 955000, 133, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 455000, 0, 168, 455000, 168, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 655000, 0, 169, 655000, 169, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 555000, 0, 170, 555000, 170, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 495000, 0, 171, 495000, 171, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 6491000, 0, 172, 6491000, 172, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 6434000, 0, 173, 6434000, 173, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 6473000, 0, 174, 6473000, 174, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 6402000, 0, 175, 6402000, 175, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 6403000, 0, 176, 6403000, 176, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 6553000, 0, 177, 6553000, 177, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 14248000, 0, 181, 14248000, 181, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 5280000, 0, 242, 5280000, 216, 0, 10, '42');
INSERT INTO `product_size` VALUES (b'0', 5280000, 0, 243, 5280000, 216, 0, 10, '45');
INSERT INTO `product_size` VALUES (b'0', 12860000, 0, 244, 12860000, 217, 0, 10, '45');
INSERT INTO `product_size` VALUES (b'0', 16050000, 0, 245, 16050000, 218, 0, 10, '45');
INSERT INTO `product_size` VALUES (b'0', 8840000, 0, 246, 8840000, 219, 0, 10, '42');
INSERT INTO `product_size` VALUES (b'0', 8840000, 0, 247, 8840000, 219, 0, 10, '45');
INSERT INTO `product_size` VALUES (b'0', 6990000, 0, 248, 6990000, 220, 0, 10, '45');
INSERT INTO `product_size` VALUES (b'0', 6490000, 0, 249, 6490000, 221, 0, 10, '45');
INSERT INTO `product_size` VALUES (b'0', 14825000, 0, 250, 14825000, 222, 0, 10, '42');
INSERT INTO `product_size` VALUES (b'0', 14825000, 0, 251, 14825000, 222, 0, 10, '45');
INSERT INTO `product_size` VALUES (b'0', 15165000, 0, 252, 15165000, 223, 0, 10, '42');
INSERT INTO `product_size` VALUES (b'0', 15165000, 0, 253, 15165000, 223, 0, 10, '45');
INSERT INTO `product_size` VALUES (b'0', 6990000, 0, 254, 6990000, 224, 0, 10, '45');
INSERT INTO `product_size` VALUES (b'0', 1795000, 0, 266, 1795000, 230, 0, 10, '55');
INSERT INTO `product_size` VALUES (b'0', 2145000, 0, 267, 2145000, 231, 0, 10, '42');
INSERT INTO `product_size` VALUES (b'0', 4990000, 0, 283, 4990000, 240, 0, 10, '45');
INSERT INTO `product_size` VALUES (b'0', 4290000, 0, 284, 4290000, 241, 0, 10, '45');
INSERT INTO `product_size` VALUES (b'0', 6390000, 0, 285, 6390000, 242, 0, 10, '45');
INSERT INTO `product_size` VALUES (b'0', 4690000, 0, 286, 4690000, 243, 0, 10, '45');
INSERT INTO `product_size` VALUES (b'0', 3549000, 0, 287, 3549000, 244, 0, 10, '45');
INSERT INTO `product_size` VALUES (b'0', 3549000, 0, 288, 3549000, 244, 0, 10, '50');
INSERT INTO `product_size` VALUES (b'0', 655000, 0, 294, 655000, 248, 0, 10, '42');
INSERT INTO `product_size` VALUES (b'0', 655000, 0, 295, 655000, 249, 0, 10, '42');
INSERT INTO `product_size` VALUES (b'0', 595000, 0, 296, 595000, 250, 0, 10, '42');
INSERT INTO `product_size` VALUES (b'0', 586000000, 0, 307, 586000000, 261, 0, 10, '42');
INSERT INTO `product_size` VALUES (b'0', 5225000, 0, 308, 5225000, 262, 0, 10, '42');
INSERT INTO `product_size` VALUES (b'0', 36396000, 0, 312, 36396000, 266, 0, 10, '42');
INSERT INTO `product_size` VALUES (b'0', 8513000, 0, 313, 8513000, 267, 0, 10, '40');
INSERT INTO `product_size` VALUES (b'0', 31397000, 0, 356, 31397000, 296, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 29942000, 0, 357, 29942000, 297, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 30199000, 0, 358, 30199000, 298, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 1058250, 0, 359, 1058250, 299, 0, 10, '42');
INSERT INTO `product_size` VALUES (b'0', 1655000, 0, 374, 1655000, 313, 0, 10, '17');
INSERT INTO `product_size` VALUES (b'0', 1355000, 0, 375, 1355000, 314, 0, 10, '16');
INSERT INTO `product_size` VALUES (b'0', 1355000, 0, 376, 1355000, 314, 0, 10, '17');
INSERT INTO `product_size` VALUES (b'0', 1355000, 0, 377, 1355000, 314, 0, 10, '18');
INSERT INTO `product_size` VALUES (b'0', 1355000, 0, 378, 1355000, 315, 0, 10, '16');
INSERT INTO `product_size` VALUES (b'0', 1355000, 0, 379, 1355000, 315, 0, 10, '17');
INSERT INTO `product_size` VALUES (b'0', 1355000, 0, 380, 1355000, 315, 0, 10, '18');
INSERT INTO `product_size` VALUES (b'0', 10841000, 0, 381, 10841000, 316, 0, 10, '16');
INSERT INTO `product_size` VALUES (b'0', 10841000, 0, 382, 10841000, 316, 0, 10, '17');
INSERT INTO `product_size` VALUES (b'0', 10841000, 0, 383, 10841000, 316, 0, 10, '18');
INSERT INTO `product_size` VALUES (b'0', 11403000, 0, 384, 11403000, 317, 0, 10, '16');
INSERT INTO `product_size` VALUES (b'0', 11403000, 0, 385, 11403000, 317, 0, 10, '17');
INSERT INTO `product_size` VALUES (b'0', 11403000, 0, 386, 11403000, 317, 0, 10, '18');
INSERT INTO `product_size` VALUES (b'0', 655000, 0, 388, 655000, 319, 0, 10, '16');
INSERT INTO `product_size` VALUES (b'0', 595000, 0, 389, 595000, 320, 0, 10, '16');
INSERT INTO `product_size` VALUES (b'0', 4571000, 0, 398, 4571000, 329, 0, 10, '16');
INSERT INTO `product_size` VALUES (b'0', 8960000, 0, 401, 8960000, 332, 0, 10, '17');
INSERT INTO `product_size` VALUES (b'0', 4079000, 0, 403, 4079000, 334, 0, 10, '16');
INSERT INTO `product_size` VALUES (b'0', 15590000, 0, 407, 15590000, 338, 0, 10, '16');
INSERT INTO `product_size` VALUES (b'0', 18590000, 0, 410, 18590000, 341, 0, 10, '16');
INSERT INTO `product_size` VALUES (b'0', 18590000, 0, 411, 18590000, 341, 0, 10, '17');
INSERT INTO `product_size` VALUES (b'0', 18590000, 0, 412, 18590000, 341, 0, 10, '18');
INSERT INTO `product_size` VALUES (b'0', 2057000, 0, 575, 2057000, 437, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 290000, 0, 623, 290000, 485, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 302000, 0, 624, 302000, 486, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 386750, 0, 659, 386750, 521, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 455000, 0, 660, 455000, 522, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 0, 0, 683, 0, 545, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 47530000, 0, 684, 47530000, 546, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 24055000, 0, 685, 24055000, 547, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 16462000, 0, 686, 16462000, 548, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 57075000, 0, 687, 57075000, 549, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 56696000, 0, 688, 56696000, 550, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 22800000, 0, 689, 22800000, 551, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 5990000, 0, 690, 5990000, 552, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 14350000, 0, 691, 14350000, 553, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 53776000, 0, 692, 53776000, 554, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 25066000, 0, 693, 25066000, 555, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 23913000, 0, 694, 23913000, 556, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 13956000, 0, 695, 13956000, 557, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 8100000, 0, 696, 8100000, 558, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 17900000, 0, 697, 17900000, 559, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 13290000, 0, 698, 13290000, 560, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 9650000, 0, 699, 9650000, 561, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 18580000, 0, 700, 18580000, 562, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 14110000, 0, 701, 14110000, 563, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 43389000, 0, 702, 43389000, 564, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 4580000, 0, 703, 4580000, 565, 0, 10, 'No size');
INSERT INTO `product_size` VALUES (b'0', 14407000, 0, 704, 14407000, 566, 0, 10, '11');
INSERT INTO `product_size` VALUES (b'0', 14407000, 0, 705, 14407000, 566, 0, 10, '12');
INSERT INTO `product_size` VALUES (b'0', 14407000, 0, 706, 14407000, 566, 0, 10, '13');
INSERT INTO `product_size` VALUES (b'0', 495000, 0, 860, 495000, 610, 0, 10, '17');
INSERT INTO `product_size` VALUES (b'0', 495000, 0, 861, 495000, 610, 0, 10, '18');
INSERT INTO `product_size` VALUES (b'0', 495000, 0, 862, 495000, 610, 0, 10, '19');
INSERT INTO `product_size` VALUES (b'0', 655000, 0, 932, 655000, 646, 0, 10, '11');
INSERT INTO `product_size` VALUES (b'0', 695000, 0, 933, 695000, 647, 0, 10, '11');
INSERT INTO `product_size` VALUES (b'0', 455000, 0, 934, 455000, 648, 0, 10, '11');
INSERT INTO `product_size` VALUES (b'0', 455000, 0, 935, 455000, 649, 0, 10, '11');
INSERT INTO `product_size` VALUES (b'0', 555000, 0, 936, 555000, 650, 0, 10, '11');
INSERT INTO `product_size` VALUES (b'0', 455000, 0, 937, 455000, 651, 0, 10, '11');
INSERT INTO `product_size` VALUES (b'0', 595000, 0, 938, 595000, 652, 0, 10, '12');
INSERT INTO `product_size` VALUES (b'0', 655000, 0, 939, 655000, 653, 0, 10, '12');
INSERT INTO `product_size` VALUES (b'0', 795000, 0, 940, 795000, 654, 0, 10, '12');
INSERT INTO `product_size` VALUES (b'0', 555000, 0, 941, 555000, 655, 0, 10, '12');
INSERT INTO `product_size` VALUES (b'0', 655000, 0, 942, 655000, 656, 0, 10, '12');
INSERT INTO `product_size` VALUES (b'0', 655000, 0, 943, 655000, 657, 0, 10, '12');
INSERT INTO `product_size` VALUES (b'0', 42621000, 0, 1016, 42621000, 681, 0, 10, '11');
INSERT INTO `product_size` VALUES (b'0', 42621000, 0, 1017, 42621000, 681, 0, 10, '12');
INSERT INTO `product_size` VALUES (b'0', 42621000, 0, 1018, 42621000, 681, 0, 10, '13');
INSERT INTO `product_size` VALUES (b'0', 31508000, 0, 1019, 31508000, 682, 0, 10, '9');
INSERT INTO `product_size` VALUES (b'0', 31508000, 0, 1020, 31508000, 682, 0, 10, '11');
INSERT INTO `product_size` VALUES (b'0', 31508000, 0, 1021, 31508000, 682, 0, 10, '13');
INSERT INTO `product_size` VALUES (b'0', 38383000, 0, 1022, 38383000, 683, 0, 10, '11');
INSERT INTO `product_size` VALUES (b'0', 38383000, 0, 1023, 38383000, 683, 0, 10, '12');
INSERT INTO `product_size` VALUES (b'0', 38383000, 0, 1024, 38383000, 683, 0, 10, '13');
INSERT INTO `product_size` VALUES (b'0', 30487000, 0, 1025, 30487000, 684, 0, 10, '11');
INSERT INTO `product_size` VALUES (b'0', 30487000, 0, 1026, 30487000, 684, 0, 10, '12');
INSERT INTO `product_size` VALUES (b'0', 36353000, 0, 1027, 36353000, 685, 0, 10, '11');
INSERT INTO `product_size` VALUES (b'0', 36353000, 0, 1028, 36353000, 685, 0, 10, '13');
INSERT INTO `product_size` VALUES (b'0', 126073000, 0, 1029, 126073000, 686, 0, 10, '17');
INSERT INTO `product_size` VALUES (b'0', 126073000, 0, 1030, 126073000, 686, 0, 10, '20');
INSERT INTO `product_size` VALUES (b'0', 126073000, 0, 1031, 126073000, 686, 0, 10, '21');
INSERT INTO `product_size` VALUES (b'0', 126073000, 0, 1032, 126073000, 686, 0, 10, '22');
INSERT INTO `product_size` VALUES (b'0', 115200000, 0, 1033, 115200000, 687, 0, 10, '14');
INSERT INTO `product_size` VALUES (b'0', 85669000, 0, 1034, 85669000, 688, 0, 10, '18');
INSERT INTO `product_size` VALUES (b'0', 85669000, 0, 1035, 85669000, 688, 0, 10, '19');
INSERT INTO `product_size` VALUES (b'0', 85669000, 0, 1036, 85669000, 688, 0, 10, '20');
INSERT INTO `product_size` VALUES (b'0', 85669000, 0, 1037, 85669000, 688, 0, 10, '21');
INSERT INTO `product_size` VALUES (b'0', 27201000, 0, 1038, 27201000, 689, 0, 10, '11');
INSERT INTO `product_size` VALUES (b'0', 27201000, 0, 1039, 27201000, 689, 0, 10, '12');
INSERT INTO `product_size` VALUES (b'0', 27201000, 0, 1040, 27201000, 689, 0, 10, '13');
INSERT INTO `product_size` VALUES (b'0', 27201000, 0, 1041, 27201000, 689, 0, 10, '14');
INSERT INTO `product_size` VALUES (b'0', 37102000, 0, 1042, 37102000, 690, 0, 10, '11');
INSERT INTO `product_size` VALUES (b'0', 37102000, 0, 1043, 37102000, 690, 0, 10, '12');
INSERT INTO `product_size` VALUES (b'0', 37102000, 0, 1044, 37102000, 690, 0, 10, '13');
INSERT INTO `product_size` VALUES (b'0', 37102000, 0, 1045, 37102000, 690, 0, 10, '19');
INSERT INTO `product_size` VALUES (b'0', 29900000, 0, 1046, 29900000, 691, 0, 10, '10');
INSERT INTO `product_size` VALUES (b'0', 29900000, 0, 1047, 29900000, 691, 0, 10, '11');
INSERT INTO `product_size` VALUES (b'0', 29900000, 0, 1048, 29900000, 691, 0, 10, '12');
INSERT INTO `product_size` VALUES (b'0', 29900000, 0, 1049, 29900000, 691, 0, 10, '14');
INSERT INTO `product_size` VALUES (b'0', 10900000, 0, 1050, 10900000, 692, 0, 10, '10');
INSERT INTO `product_size` VALUES (b'0', 10900000, 0, 1051, 10900000, 692, 0, 10, '11');
INSERT INTO `product_size` VALUES (b'0', 10900000, 0, 1052, 10900000, 692, 0, 10, '12');
INSERT INTO `product_size` VALUES (b'0', 12500000, 0, 1053, 12500000, 693, 0, 10, '10');
INSERT INTO `product_size` VALUES (b'0', 12500000, 0, 1054, 12500000, 693, 0, 10, '11');
INSERT INTO `product_size` VALUES (b'0', 12500000, 0, 1055, 12500000, 693, 0, 10, '12');
INSERT INTO `product_size` VALUES (b'0', 12500000, 0, 1056, 12500000, 693, 0, 10, '13');
INSERT INTO `product_size` VALUES (b'0', 102000000, 0, 1057, 102000000, 694, 0, 10, '12');
INSERT INTO `product_size` VALUES (b'0', 102000000, 0, 1058, 102000000, 694, 0, 10, '13');
INSERT INTO `product_size` VALUES (b'0', 54696000, 0, 1059, 54696000, 695, 0, 10, '11');
INSERT INTO `product_size` VALUES (b'0', 54696000, 0, 1060, 54696000, 695, 0, 10, '12');
INSERT INTO `product_size` VALUES (b'0', 28500000, 0, 1061, 28500000, 696, 0, 10, '11');
INSERT INTO `product_size` VALUES (b'0', 28500000, 0, 1062, 28500000, 696, 0, 10, '12');
INSERT INTO `product_size` VALUES (b'0', 28500000, 0, 1063, 28500000, 696, 0, 10, '13');
INSERT INTO `product_size` VALUES (b'0', 31500000, 0, 1064, 31500000, 697, 0, 10, '11');
INSERT INTO `product_size` VALUES (b'0', 31500000, 0, 1065, 31500000, 697, 0, 10, '12');
INSERT INTO `product_size` VALUES (b'0', 31500000, 0, 1066, 31500000, 697, 0, 10, '13');
INSERT INTO `product_size` VALUES (b'0', 23900000, 0, 1067, 23900000, 698, 0, 10, '13');
INSERT INTO `product_size` VALUES (b'0', 34908000, 0, 1068, 34908000, 699, 0, 10, '11');
INSERT INTO `product_size` VALUES (b'0', 34908000, 0, 1069, 34908000, 699, 0, 10, '12');
INSERT INTO `product_size` VALUES (b'0', 34908000, 0, 1070, 34908000, 699, 0, 10, '13');
INSERT INTO `product_size` VALUES (b'0', 24732000, 0, 1071, 24732000, 700, 0, 10, '11');
INSERT INTO `product_size` VALUES (b'0', 24732000, 0, 1072, 24732000, 700, 0, 10, '12');
INSERT INTO `product_size` VALUES (b'0', 24732000, 0, 1073, 24732000, 700, 0, 10, '13');
INSERT INTO `product_size` VALUES (b'0', 13312000, 0, 1074, 13312000, 701, 0, 10, '8');
INSERT INTO `product_size` VALUES (b'0', 13312000, 0, 1075, 13312000, 701, 0, 10, '9');
INSERT INTO `product_size` VALUES (b'0', 13312000, 0, 1076, 13312000, 701, 0, 10, '10');
INSERT INTO `product_size` VALUES (b'0', 13312000, 0, 1077, 13312000, 701, 0, 10, '11');
INSERT INTO `product_size` VALUES (b'0', 13312000, 0, 1078, 13312000, 701, 0, 10, '12');
INSERT INTO `product_size` VALUES (b'0', 13312000, 0, 1079, 13312000, 701, 0, 10, '13');
INSERT INTO `product_size` VALUES (b'0', 12796000, 0, 1215, 12796000, 726, 0, 10, '14');
INSERT INTO `product_size` VALUES (b'0', 12796000, 0, 1216, 12796000, 726, 0, 10, '15');
INSERT INTO `product_size` VALUES (b'0', 12796000, 0, 1217, 12796000, 726, 0, 10, '16');
INSERT INTO `product_size` VALUES (b'0', 12796000, 0, 1218, 12796000, 726, 0, 10, '17');
INSERT INTO `product_size` VALUES (b'0', 12796000, 0, 1219, 12796000, 726, 0, 10, '18');
INSERT INTO `product_size` VALUES (b'0', 12796000, 0, 1220, 12796000, 726, 0, 10, '19');
INSERT INTO `product_size` VALUES (b'0', 12796000, 0, 1221, 12796000, 726, 0, 10, '20');
INSERT INTO `product_size` VALUES (b'0', 20125000, 0, 1222, 20125000, 727, 0, 10, '16');
INSERT INTO `product_size` VALUES (b'0', 20125000, 0, 1223, 20125000, 727, 0, 10, '17');
INSERT INTO `product_size` VALUES (b'0', 20125000, 0, 1224, 20125000, 727, 0, 10, '18');
INSERT INTO `product_size` VALUES (b'0', 20125000, 0, 1225, 20125000, 727, 0, 10, '19');
INSERT INTO `product_size` VALUES (b'0', 20125000, 0, 1226, 20125000, 727, 0, 10, '20');
INSERT INTO `product_size` VALUES (b'0', 20125000, 0, 1227, 20125000, 727, 0, 10, '21');
INSERT INTO `product_size` VALUES (b'0', 48400000, 0, 1228, 48400000, 728, 0, 10, '12');
INSERT INTO `product_size` VALUES (b'0', 47405000, 0, 1229, 47405000, 729, 0, 10, '11');
INSERT INTO `product_size` VALUES (b'0', 47405000, 0, 1230, 47405000, 729, 0, 10, '12');
INSERT INTO `product_size` VALUES (b'0', 36955000, 0, 1231, 36955000, 730, 0, 10, '10');
INSERT INTO `product_size` VALUES (b'0', 36955000, 0, 1232, 36955000, 730, 0, 10, '11');
INSERT INTO `product_size` VALUES (b'0', 36955000, 0, 1233, 36955000, 730, 0, 10, '12');
INSERT INTO `product_size` VALUES (b'0', 47405000, 0, 1234, 47405000, 731, 0, 10, '11');
INSERT INTO `product_size` VALUES (b'0', 24225000, 0, 1235, 24225000, 732, 0, 10, '10');
INSERT INTO `product_size` VALUES (b'0', 24225000, 0, 1236, 24225000, 732, 0, 10, '11');
INSERT INTO `product_size` VALUES (b'0', 24225000, 0, 1237, 24225000, 732, 0, 10, '13');
INSERT INTO `product_size` VALUES (b'0', 18905000, 0, 1238, 18905000, 733, 0, 10, '11');
INSERT INTO `product_size` VALUES (b'0', 18905000, 0, 1239, 18905000, 733, 0, 10, '12');
INSERT INTO `product_size` VALUES (b'0', 18905000, 0, 1240, 18905000, 733, 0, 10, '13');
INSERT INTO `product_size` VALUES (b'0', 32775000, 0, 1241, 32775000, 734, 0, 10, '11');
INSERT INTO `product_size` VALUES (b'0', 32775000, 0, 1242, 32775000, 734, 0, 10, '12');
INSERT INTO `product_size` VALUES (b'0', 58805000, 0, 1243, 58805000, 735, 0, 10, '12');
INSERT INTO `product_size` VALUES (b'0', 31825000, 0, 1244, 31825000, 736, 0, 10, '11');
INSERT INTO `product_size` VALUES (b'0', 31825000, 0, 1245, 31825000, 736, 0, 10, '12');
INSERT INTO `product_size` VALUES (b'0', 41705000, 0, 1246, 41705000, 737, 0, 10, '11');
INSERT INTO `product_size` VALUES (b'0', 41705000, 0, 1247, 41705000, 737, 0, 10, '12');
INSERT INTO `product_size` VALUES (b'0', 40755000, 0, 1248, 40755000, 738, 0, 10, '11');
INSERT INTO `product_size` VALUES (b'0', 40755000, 0, 1249, 40755000, 738, 0, 10, '12');
INSERT INTO `product_size` VALUES (b'0', 52725000, 0, 1250, 52725000, 739, 0, 10, '10');
INSERT INTO `product_size` VALUES (b'0', 52725000, 0, 1251, 52725000, 739, 0, 10, '12');
INSERT INTO `product_size` VALUES (b'0', 15766200, 0, 1252, 15766200, 740, 0, 10, '51');
INSERT INTO `product_size` VALUES (b'0', 15766200, 0, 1253, 15766200, 740, 0, 10, '53');
INSERT INTO `product_size` VALUES (b'0', 995000, 0, 1262, 995000, 747, 0, 10, '40');
INSERT INTO `product_size` VALUES (b'0', 995000, 0, 1263, 995000, 747, 0, 10, '42');
INSERT INTO `product_size` VALUES (b'0', 1395000, 0, 1267, 1395000, 749, 0, 10, '52');
INSERT INTO `product_size` VALUES (b'0', 1395000, 0, 1268, 1395000, 749, 0, 10, '54');
INSERT INTO `product_size` VALUES (b'0', 1995000, 0, 1323, 1995000, 777, 0, 10, '52');
INSERT INTO `product_size` VALUES (b'0', 1995000, 0, 1324, 1995000, 777, 0, 10, '53');
INSERT INTO `product_size` VALUES (b'0', 895000, 0, 1325, 895000, 778, 0, 10, '40');
INSERT INTO `product_size` VALUES (b'0', 895000, 0, 1326, 895000, 778, 0, 10, '42');
INSERT INTO `product_size` VALUES (b'0', 895000, 0, 1327, 895000, 778, 0, 10, '44');
INSERT INTO `product_size` VALUES (b'0', 895000, 0, 1328, 895000, 778, 0, 10, '46');
INSERT INTO `product_size` VALUES (b'0', 53900000, 0, 1329, 53900000, 779, 0, 10, '51');
INSERT INTO `product_size` VALUES (b'0', 53900000, 0, 1330, 53900000, 779, 0, 10, '53');
INSERT INTO `product_size` VALUES (b'0', 34900000, 0, 1331, 34900000, 780, 0, 10, '52');
INSERT INTO `product_size` VALUES (b'0', 34900000, 0, 1332, 34900000, 780, 0, 10, '54');
INSERT INTO `product_size` VALUES (b'0', 29790000, 0, 1333, 29790000, 781, 0, 10, '53');
INSERT INTO `product_size` VALUES (b'0', 40047000, 0, 1334, 40047000, 782, 0, 10, '50');
INSERT INTO `product_size` VALUES (b'0', 40047000, 0, 1335, 40047000, 782, 0, 10, '51');
INSERT INTO `product_size` VALUES (b'0', 40047000, 0, 1336, 40047000, 782, 0, 10, '52');
INSERT INTO `product_size` VALUES (b'0', 40047000, 0, 1337, 40047000, 782, 0, 10, '53');
INSERT INTO `product_size` VALUES (b'0', 28430000, 0, 1338, 28430000, 783, 0, 10, '50');
INSERT INTO `product_size` VALUES (b'0', 28430000, 0, 1339, 28430000, 783, 0, 10, '51');
INSERT INTO `product_size` VALUES (b'0', 28430000, 0, 1340, 28430000, 783, 0, 10, '52');
INSERT INTO `product_size` VALUES (b'0', 28430000, 0, 1341, 28430000, 783, 0, 10, '53');
INSERT INTO `product_size` VALUES (b'0', 55453000, 0, 1342, 55453000, 784, 0, 10, '50');
INSERT INTO `product_size` VALUES (b'0', 55453000, 0, 1343, 55453000, 784, 0, 10, '51');
INSERT INTO `product_size` VALUES (b'0', 55453000, 0, 1344, 55453000, 784, 0, 10, '52');
INSERT INTO `product_size` VALUES (b'0', 55453000, 0, 1345, 55453000, 784, 0, 10, '53');
INSERT INTO `product_size` VALUES (b'0', 31202000, 0, 1346, 31202000, 785, 0, 10, '50');
INSERT INTO `product_size` VALUES (b'0', 23900000, 0, 1347, 23900000, 786, 0, 10, '52');
INSERT INTO `product_size` VALUES (b'0', 23900000, 0, 1348, 23900000, 786, 0, 10, '54');
INSERT INTO `product_size` VALUES (b'0', 75900000, 0, 1349, 75900000, 787, 0, 10, '53');
INSERT INTO `product_size` VALUES (b'0', 31255000, 0, 1350, 31255000, 788, 0, 10, '53');

-- ----------------------------
-- Table structure for proof_image
-- ----------------------------
DROP TABLE IF EXISTS `proof_image`;
CREATE TABLE `proof_image`  (
  `created_at` datetime(6) NULL DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `return_item_id` bigint NOT NULL,
  `updated_at` datetime(6) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK6bf0f0jajmo9tpabqtdcbqlpi`(`return_item_id` ASC) USING BTREE,
  CONSTRAINT `FK6bf0f0jajmo9tpabqtdcbqlpi` FOREIGN KEY (`return_item_id`) REFERENCES `return_item` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proof_image
-- ----------------------------

-- ----------------------------
-- Table structure for return_item
-- ----------------------------
DROP TABLE IF EXISTS `return_item`;
CREATE TABLE `return_item`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_item_id` bigint NOT NULL,
  `quantity` bigint NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `reason` enum('BROKEN','NOT_AS_DESCRIBED','SIZE_PROBLEM') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UKt2r8immf53th5gm7nq9pov7sh`(`order_item_id` ASC) USING BTREE,
  CONSTRAINT `FKdjgjmybfbl1frdi2s3i8qx6i9` FOREIGN KEY (`order_item_id`) REFERENCES `order_item` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of return_item
-- ----------------------------

-- ----------------------------
-- Table structure for review
-- ----------------------------
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review`  (
  `is_responded` bit(1) NOT NULL,
  `created_at` datetime(6) NULL DEFAULT NULL,
  `customer_id` bigint NULL DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint NULL DEFAULT NULL,
  `rating` bigint NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKiyof1sindb9qiqr9o8npj8klt`(`product_id` ASC) USING BTREE,
  INDEX `FKgce54o0p6uugoc2tev4awewly`(`customer_id` ASC) USING BTREE,
  CONSTRAINT `FKgce54o0p6uugoc2tev4awewly` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKiyof1sindb9qiqr9o8npj8klt` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of review
-- ----------------------------

-- ----------------------------
-- Table structure for review_reply
-- ----------------------------
DROP TABLE IF EXISTS `review_reply`;
CREATE TABLE `review_reply`  (
  `created_at` datetime(6) NULL DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `review_id` bigint NULL DEFAULT NULL,
  `staff_id` bigint NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK4i2wqc6vs38qe09e5bx51t4py`(`review_id` ASC) USING BTREE,
  INDEX `FKsbpplvhiccnj7tl709kp490sd`(`staff_id` ASC) USING BTREE,
  CONSTRAINT `FK3mfomicwiqwm49ahq8yevep7x` FOREIGN KEY (`review_id`) REFERENCES `review` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKsbpplvhiccnj7tl709kp490sd` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of review_reply
-- ----------------------------

-- ----------------------------
-- Table structure for staff
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff`  (
  `dob` date NULL DEFAULT NULL,
  `backup_token_expire_at` datetime(6) NULL DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `join_at` datetime(6) NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `backup_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `gender` enum('FEMALE','MALE','OTHER') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `role` enum('CUSTOMER','MANAGER','STAFF') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` enum('ACTIVE','BANNED','REMOVED') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of staff
-- ----------------------------

-- ----------------------------
-- Table structure for user_notification
-- ----------------------------
DROP TABLE IF EXISTS `user_notification`;
CREATE TABLE `user_notification`  (
  `customer_id` bigint NULL DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `manager_id` bigint NULL DEFAULT NULL,
  `notification_id` bigint NULL DEFAULT NULL,
  `staff_id` bigint NULL DEFAULT NULL,
  `status` enum('READ','UNREAD') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKolx8n8lde2gtxdst1a6ymhesy`(`customer_id` ASC) USING BTREE,
  INDEX `FKfdt0108nh9knq9avm9olvpoce`(`manager_id` ASC) USING BTREE,
  INDEX `FKi5naecliicmigrk01qx5me5sp`(`notification_id` ASC) USING BTREE,
  INDEX `FK2lig1dxdlif2vkqcexw9vpasf`(`staff_id` ASC) USING BTREE,
  CONSTRAINT `FK2lig1dxdlif2vkqcexw9vpasf` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKfdt0108nh9knq9avm9olvpoce` FOREIGN KEY (`manager_id`) REFERENCES `manager` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKi5naecliicmigrk01qx5me5sp` FOREIGN KEY (`notification_id`) REFERENCES `notification` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKolx8n8lde2gtxdst1a6ymhesy` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_notification
-- ----------------------------

-- ----------------------------
-- Table structure for vnpay_payment
-- ----------------------------
DROP TABLE IF EXISTS `vnpay_payment`;
CREATE TABLE `vnpay_payment`  (
  `status` enum('PROCESSING','PAID','REFUNDED') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `amount` bigint NULL DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `payment_date` datetime(6) NULL DEFAULT NULL,
  `bank` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `order_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `payment_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `payment_message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `transaction_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `vn_pay_response_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UKnctt857c1r38c472uv1vsr9r6`(`order_id` ASC) USING BTREE,
  CONSTRAINT `FKdgqv46u3u2pcimdayqni7i597` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `vnpay_payment_chk_1` CHECK (`status` between 0 and 2)
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of vnpay_payment
-- ----------------------------

-- ----------------------------
-- Table structure for voucher
-- ----------------------------
DROP TABLE IF EXISTS `voucher`;
CREATE TABLE `voucher`  (
  `apply_limit` bigint NULL DEFAULT NULL,
  `discount_rate` bigint NULL DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `limit_use_per_customer` bigint NULL DEFAULT NULL,
  `minimum_to_apply` bigint NULL DEFAULT NULL,
  `quantity` bigint NULL DEFAULT NULL,
  `valid_from` datetime(6) NULL DEFAULT NULL,
  `valid_to` datetime(6) NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `type` enum('FREESHIP','PROMOTION') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of voucher
-- ----------------------------

-- ----------------------------
-- Table structure for voucher_applicability
-- ----------------------------
DROP TABLE IF EXISTS `voucher_applicability`;
CREATE TABLE `voucher_applicability`  (
  `applicable_object_id` bigint NULL DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `voucher_id` bigint NULL DEFAULT NULL,
  `type` enum('ALL','CATEGORY','COLLECTION','CUSTOMER','PRODUCT') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK8yn2um4aby4xklkp9mry728wi`(`voucher_id` ASC) USING BTREE,
  CONSTRAINT `FK8yn2um4aby4xklkp9mry728wi` FOREIGN KEY (`voucher_id`) REFERENCES `voucher` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of voucher_applicability
-- ----------------------------

-- ----------------------------
-- Table structure for wishlist_item
-- ----------------------------
DROP TABLE IF EXISTS `wishlist_item`;
CREATE TABLE `wishlist_item`  (
  `added_at` datetime(6) NULL DEFAULT NULL,
  `customer_id` bigint NULL DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKhlayjwpqqq6md817g2xhnreyp`(`customer_id` ASC) USING BTREE,
  INDEX `FK5s5jxai41c8tqklyy111ngqh7`(`product_id` ASC) USING BTREE,
  CONSTRAINT `FK5s5jxai41c8tqklyy111ngqh7` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKhlayjwpqqq6md817g2xhnreyp` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wishlist_item
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
