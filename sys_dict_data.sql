/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : ry

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 03/06/2020 13:34:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认是');
INSERT INTO `sys_dict_data` VALUES (11, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认否');
INSERT INTO `sys_dict_data` VALUES (12, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知');
INSERT INTO `sys_dict_data` VALUES (13, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '公告');
INSERT INTO `sys_dict_data` VALUES (14, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (15, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '关闭状态');
INSERT INTO `sys_dict_data` VALUES (16, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES (17, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '修改操作');
INSERT INTO `sys_dict_data` VALUES (18, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '删除操作');
INSERT INTO `sys_dict_data` VALUES (19, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '授权操作');
INSERT INTO `sys_dict_data` VALUES (20, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导出操作');
INSERT INTO `sys_dict_data` VALUES (21, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导入操作');
INSERT INTO `sys_dict_data` VALUES (22, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '强退操作');
INSERT INTO `sys_dict_data` VALUES (23, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '生成操作');
INSERT INTO `sys_dict_data` VALUES (24, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '清空操作');
INSERT INTO `sys_dict_data` VALUES (25, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (26, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 1, '是', 'Y', 'sk_hr_need_driver', NULL, 'info', 'Y', '0', 'admin', '2019-07-19 09:44:22', '', NULL, '需要司机');
INSERT INTO `sys_dict_data` VALUES (101, 2, '否', 'N', 'sk_hr_need_driver', NULL, 'warning', 'Y', '0', 'admin', '2019-07-19 09:45:12', '', NULL, '毋需司机');
INSERT INTO `sys_dict_data` VALUES (102, 1, '丰田', '0', 'sk_hr_car_brand', NULL, NULL, 'Y', '0', 'admin', '2019-07-23 09:56:11', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (103, 2, '本田', '1', 'sk_hr_car_brand', NULL, NULL, 'Y', '0', 'admin', '2019-07-23 09:56:25', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (104, 3, '别克', '2', 'sk_hr_car_brand', NULL, NULL, 'Y', '0', 'admin', '2019-07-23 09:56:40', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (105, 1, '5', '5', 'sk_hr_car_seat', '', '', 'Y', '0', 'admin', '2019-07-23 09:59:27', 'admin', '2019-07-23 10:56:35', '');
INSERT INTO `sys_dict_data` VALUES (106, 2, '7', '7', 'sk_hr_car_seat', '', '', 'Y', '0', 'admin', '2019-07-23 09:59:55', 'admin', '2019-07-23 10:56:24', '');
INSERT INTO `sys_dict_data` VALUES (107, 3, '8', '8', 'sk_hr_car_seat', '', '', 'Y', '0', 'admin', '2019-07-23 10:01:00', 'admin', '2019-07-23 10:56:16', '');
INSERT INTO `sys_dict_data` VALUES (108, 4, '12', '12', 'sk_hr_car_seat', '', '', 'Y', '0', 'admin', '2019-07-23 10:02:53', 'admin', '2019-07-23 10:55:58', '');
INSERT INTO `sys_dict_data` VALUES (109, 5, '20', '20', 'sk_hr_car_seat', '', '', 'Y', '0', 'admin', '2019-07-23 10:03:59', 'admin', '2019-07-23 10:55:51', '');
INSERT INTO `sys_dict_data` VALUES (110, 1, 'absent', 'absent', 'present_status', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:01:02', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (111, 2, 'present', 'present', 'present_status', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:01:18', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (112, 1, 'absent', 'absent', 'ChHepatitis_status', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:01:44', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (113, 2, 'active', 'active', 'ChHepatitis_status', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:02:03', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (114, 3, 'persistent', 'persistent', 'ChHepatitis_status', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:02:28', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (115, 1, 'male', 'male', 'gender', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:02:58', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (116, 2, 'female', 'female', 'gender', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:03:09', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (117, 1, '0~30', 'age0_30', 'age_status', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:04:02', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (118, 2, '31~50', 'age31_50', 'age_status', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:04:27', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (119, 3, '51~65', 'age51_65', 'age_status', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:04:51', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (120, 4, '65~100', 'age65_100', 'age_status', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:05:48', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (121, 1, 'absent', 'absent', 'cirrhosis_status', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:06:59', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (122, 2, 'decompensate', 'decompensate', 'cirrhosis_status', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:07:48', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (123, 3, 'compensate', 'compensate', 'cirrhosis_status', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:08:44', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (124, 1, 'a1_0', 'a1_0', 'triglycerides_status', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:09:48', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (125, 2, 'a3_2', 'a3_2', 'triglycerides_status', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:10:07', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (126, 3, 'a17_4', 'a17_4', 'triglycerides_status', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:10:22', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (127, 1, 'a1_0', 'a1_0', 'bilirubin_status', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:11:32', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (128, 2, 'a6_2', 'a6_2', 'bilirubin_status', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:11:46', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (129, 3, 'a19_7', 'a19_7', 'bilirubin_status', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:12:04', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (130, 4, 'a88_20', 'a88_20', 'bilirubin_status', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:12:20', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (131, 1, 'a239_0', 'a239_0', 'phosphatase_status', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:13:28', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (132, 2, 'a699_240', 'a699_240', 'phosphatase_status', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:13:54', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (133, 3, 'a4000_700', 'a4000_700', 'phosphatase_status', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:14:15', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (134, 1, 'a5_2', 'a5_2', 'proteins_status', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:15:33', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (135, 2, 'a10_6', 'a10_6', 'proteins_status', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:15:53', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (136, 1, 'a99_0', 'a99_0', 'platelet_status', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:16:45', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (137, 2, 'a149_100', 'a149_100', 'platelet_status', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:17:02', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (138, 3, 'a299_150', 'a299_150', 'platelet_status', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:17:19', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (139, 4, 'a597_300', 'a597_300', 'platelet_status', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:17:46', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (140, 1, 'a69_0', 'a69_0', 'inr_status', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:18:19', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (141, 2, 'a109_70', 'a109_70', 'inr_status', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:18:36', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (142, 3, 'a200_110', 'a200_110', 'inr_status', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:18:57', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (143, 1, 'a39_0', 'a39_0', 'urea_status', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:19:41', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (144, 2, 'a49_40', 'a49_40', 'urea_status', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:20:01', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (145, 3, 'a165_50', 'a165_50', 'urea_status', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:20:18', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (146, 1, 'a14_0', 'a14_0', 'ESR_status', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:21:03', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (147, 2, 'a49_15', 'a49_15', 'ESR_status', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:21:20', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (148, 3, 'a200_50', 'a200_50', 'ESR_status', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:21:37', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (149, 1, 'a34_0', 'a34_0', 'alt_status', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:22:30', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (150, 2, 'a99_35', 'a99_35', 'alt_status', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:22:46', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (151, 3, 'a199_100', 'a199_100', 'alt_status', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:23:03', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (152, 4, 'a850_200', 'a850_200', 'alt_status', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:23:22', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (153, 1, 'a39_0', 'a39_0', 'ast_status', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:24:15', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (154, 2, 'a149_40', 'a149_40', 'ast_status', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:24:35', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (155, 3, 'a399_150', 'a399_150', 'ast_status', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:24:57', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (156, 4, 'a700_400', 'a700_400', 'ast_status', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:25:18', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (157, 1, 'a299_0', 'a299_0', 'amylase_status', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:26:12', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (158, 2, 'a499_300', 'a499_300', 'amylase_status', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:26:29', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (159, 3, 'a1400_500', 'a1400_500', 'amylase_status', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:26:50', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (160, 1, 'a9_0', 'a9_0', 'ggtp_status', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:31:43', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (161, 2, 'a29_10', 'a29_10', 'ggtp_status', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:31:55', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (162, 3, 'a69_30', 'a69_30', 'ggtp_status', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:32:12', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (163, 4, 'a640_70', 'a640_70', 'ggtp_status', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:32:32', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (164, 1, 'a239_0', 'a239_0', 'cholesterol_status', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:33:43', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (165, 2, 'a349_240', 'a349_240', 'cholesterol_status', '', '', 'Y', '0', 'admin', '2020-05-06 17:34:05', 'admin', '2020-05-06 17:34:11', '');
INSERT INTO `sys_dict_data` VALUES (166, 3, 'a999_350', 'a999_350', 'cholesterol_status', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:34:31', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (167, 1, 'a29_0', 'a29_0', 'albumin_status', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:35:14', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (168, 2, 'a49_30', 'a49_30', 'albumin_status', '', '', 'Y', '0', 'admin', '2020-05-06 17:35:29', 'admin', '2020-05-06 17:35:35', '');
INSERT INTO `sys_dict_data` VALUES (169, 3, 'a70_50', 'a70_50', 'albumin_status', NULL, NULL, 'Y', '0', 'admin', '2020-05-06 17:36:15', '', NULL, NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
