/*
Navicat MySQL Data Transfer

Source Server         : sofu
Source Server Version : 50740
Source Host           : localhost:3306
Source Database       : sofu

Target Server Type    : MYSQL
Target Server Version : 50740
File Encoding         : 65001

Date: 2025-07-24 22:00:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for answers
-- ----------------------------
DROP TABLE IF EXISTS `answers`;
CREATE TABLE `answers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `target_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `text` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `likes` int(255) DEFAULT '0' COMMENT '点赞数',
  `target_type` enum('question','answer') NOT NULL DEFAULT 'question',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of answers
-- ----------------------------
INSERT INTO `answers` VALUES ('2', '2', '4', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"可以联系辅导员确认。\", \"type\": \"text\"}]}', '2025-07-15 04:54:41', '2025-07-15 04:54:41', '0', 'question');
INSERT INTO `answers` VALUES ('3', '3', '3', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"多数情况允许，注意查看规定。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 04:54:41', '2025-07-15 04:54:41', '0', 'question');
INSERT INTO `answers` VALUES ('4', '3', '2', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"多数情况允许，注意查看规定。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 04:54:41', '2025-07-15 04:54:41', '0', 'question');
INSERT INTO `answers` VALUES ('5', '4', '3', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"需要本人携带证件去窗口办理。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 04:54:41', '2025-07-15 04:54:41', '0', 'question');
INSERT INTO `answers` VALUES ('6', '5', '4', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"具体时间以学院通知为准。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 04:54:41', '2025-07-15 04:54:41', '0', 'question');
INSERT INTO `answers` VALUES ('7', '6', '4', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"建议查看学校官网或微信公众号公告。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 04:54:41', '2025-07-15 04:54:41', '0', 'question');
INSERT INTO `answers` VALUES ('8', '6', '5', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"一般支持网上操作，无需线下提交。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 04:54:41', '2025-07-15 04:54:41', '0', 'question');
INSERT INTO `answers` VALUES ('9', '7', '1', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"多数情况允许，注意查看规定。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 04:54:41', '2025-07-15 04:54:41', '0', 'question');
INSERT INTO `answers` VALUES ('10', '7', '4', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"可以联系辅导员确认。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 04:54:41', '2025-07-15 04:54:41', '0', 'question');
INSERT INTO `answers` VALUES ('11', '8', '4', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"可在教务系统查询相关内容。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 04:54:41', '2025-07-15 04:54:41', '0', 'question');
INSERT INTO `answers` VALUES ('12', '8', '5', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"一般在学生事务中心可以办理。\", \"type\": \"text\"}]}', '2025-07-15 04:54:41', '2025-07-15 04:54:41', '0', 'question');
INSERT INTO `answers` VALUES ('13', '9', '2', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"一般在学生事务中心可以办理。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 04:54:41', '2025-07-15 04:54:41', '0', 'question');
INSERT INTO `answers` VALUES ('14', '10', '3', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"建议查看学校官网或微信公众号公告。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 04:54:41', '2025-07-15 04:54:41', '0', 'question');
INSERT INTO `answers` VALUES ('15', '10', '2', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"多数情况允许，注意查看规定。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 04:54:41', '2025-07-15 04:54:41', '0', 'question');
INSERT INTO `answers` VALUES ('16', '11', '1', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"一般在学生事务中心可以办理。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 04:54:41', '2025-07-15 04:54:41', '0', 'question');
INSERT INTO `answers` VALUES ('17', '11', '4', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"请参考学生手册的说明。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 04:54:41', '2025-07-15 04:54:41', '0', 'question');
INSERT INTO `answers` VALUES ('18', '12', '1', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"可以联系辅导员确认。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 04:56:44', '2025-07-15 04:56:44', '0', 'question');
INSERT INTO `answers` VALUES ('19', '12', '2', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"一般支持网上操作，无需线下提交。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 04:56:44', '2025-07-15 04:56:44', '0', 'question');
INSERT INTO `answers` VALUES ('20', '13', '1', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"一般支持网上操作，无需线下提交。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 04:56:44', '2025-07-15 04:56:44', '0', 'question');
INSERT INTO `answers` VALUES ('21', '13', '4', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"请参考学生手册的说明。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 04:56:44', '2025-07-15 04:56:44', '0', 'question');
INSERT INTO `answers` VALUES ('22', '14', '3', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"需提前在系统申请，等待审批。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 04:56:44', '2025-07-15 04:56:44', '0', 'question');
INSERT INTO `answers` VALUES ('23', '14', '1', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"一般在学生事务中心可以办理。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 04:56:44', '2025-07-15 04:56:44', '0', 'question');
INSERT INTO `answers` VALUES ('24', '15', '2', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"具体时间以学院通知为准。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 04:56:44', '2025-07-15 04:56:44', '0', 'question');
INSERT INTO `answers` VALUES ('25', '16', '1', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"请参考学生手册的说明。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 04:56:44', '2025-07-15 04:56:44', '0', 'question');
INSERT INTO `answers` VALUES ('26', '17', '4', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"具体时间以学院通知为准。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 04:56:44', '2025-07-15 04:56:44', '0', 'question');
INSERT INTO `answers` VALUES ('27', '17', '1', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"建议查看学校官网或微信公众号公告。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 04:56:44', '2025-07-15 04:56:44', '0', 'question');
INSERT INTO `answers` VALUES ('28', '18', '2', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"一般在学生事务中心可以办理。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 04:56:44', '2025-07-15 04:56:44', '0', 'question');
INSERT INTO `answers` VALUES ('29', '19', '5', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"请参考学生手册的说明。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 04:56:44', '2025-07-15 04:56:44', '0', 'question');
INSERT INTO `answers` VALUES ('30', '20', '4', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"建议查看学校官网或微信公众号公告。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 04:56:44', '2025-07-15 04:56:44', '0', 'question');
INSERT INTO `answers` VALUES ('31', '21', '1', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"可以联系辅导员确认。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 04:56:44', '2025-07-15 04:56:44', '0', 'question');
INSERT INTO `answers` VALUES ('32', '22', '3', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"可以联系辅导员确认。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:58:18', '2025-07-15 15:58:18', '0', 'question');
INSERT INTO `answers` VALUES ('33', '23', '3', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"需要本人携带证件去窗口办理。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:58:18', '2025-07-15 15:58:18', '0', 'question');
INSERT INTO `answers` VALUES ('34', '23', '4', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"一般支持网上操作，无需线下提交。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:58:18', '2025-07-15 15:58:18', '0', 'question');
INSERT INTO `answers` VALUES ('35', '24', '2', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"建议查看学校官网或微信公众号公告。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:58:18', '2025-07-15 15:58:18', '0', 'question');
INSERT INTO `answers` VALUES ('36', '24', '4', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"需要本人携带证件去窗口办理。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:58:18', '2025-07-15 15:58:18', '0', 'question');
INSERT INTO `answers` VALUES ('37', '25', '5', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"可以联系辅导员确认。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:58:18', '2025-07-15 15:58:18', '0', 'question');
INSERT INTO `answers` VALUES ('38', '25', '2', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"请参考学生手册的说明。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:58:18', '2025-07-15 15:58:18', '0', 'question');
INSERT INTO `answers` VALUES ('39', '26', '5', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"需要本人携带证件去窗口办理。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:58:18', '2025-07-15 15:58:18', '0', 'question');
INSERT INTO `answers` VALUES ('40', '26', '5', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"可以联系辅导员确认。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:58:18', '2025-07-15 15:58:18', '0', 'question');
INSERT INTO `answers` VALUES ('41', '27', '4', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"可在教务系统查询相关内容。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:58:18', '2025-07-15 15:58:18', '0', 'question');
INSERT INTO `answers` VALUES ('42', '27', '3', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"一般在学生事务中心可以办理。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:58:18', '2025-07-15 15:58:18', '0', 'question');
INSERT INTO `answers` VALUES ('43', '28', '3', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"建议查看学校官网或微信公众号公告。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:58:18', '2025-07-15 15:58:18', '0', 'question');
INSERT INTO `answers` VALUES ('44', '29', '1', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"一般支持网上操作，无需线下提交。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:58:18', '2025-07-15 15:58:18', '0', 'question');
INSERT INTO `answers` VALUES ('45', '30', '2', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"多数情况允许，注意查看规定。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:58:18', '2025-07-15 15:58:18', '0', 'question');
INSERT INTO `answers` VALUES ('46', '31', '1', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"一般支持网上操作，无需线下提交。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:58:18', '2025-07-15 15:58:18', '0', 'question');
INSERT INTO `answers` VALUES ('47', '31', '3', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"请参考学生手册的说明。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:58:18', '2025-07-15 15:58:18', '0', 'question');
INSERT INTO `answers` VALUES ('48', '32', '2', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"一般支持网上操作，无需线下提交。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:58:18', '2025-07-15 15:58:18', '0', 'question');
INSERT INTO `answers` VALUES ('49', '32', '1', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"可在教务系统查询相关内容。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:58:18', '2025-07-15 15:58:18', '0', 'question');
INSERT INTO `answers` VALUES ('50', '33', '1', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"需提前在系统申请，等待审批。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:58:18', '2025-07-15 15:58:18', '0', 'question');
INSERT INTO `answers` VALUES ('51', '33', '1', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"需提前在系统申请，等待审批。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:58:18', '2025-07-15 15:58:18', '0', 'question');
INSERT INTO `answers` VALUES ('52', '34', '4', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"具体时间以学院通知为准。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:58:18', '2025-07-15 15:58:18', '0', 'question');
INSERT INTO `answers` VALUES ('53', '34', '1', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"请参考学生手册的说明。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:58:18', '2025-07-15 15:58:18', '0', 'question');
INSERT INTO `answers` VALUES ('54', '35', '1', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"请参考学生手册的说明。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:58:18', '2025-07-15 15:58:18', '0', 'question');
INSERT INTO `answers` VALUES ('55', '35', '3', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"需要本人携带证件去窗口办理。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:58:18', '2025-07-15 15:58:18', '0', 'question');
INSERT INTO `answers` VALUES ('56', '36', '3', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"请参考学生手册的说明。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:58:18', '2025-07-15 15:58:18', '0', 'question');
INSERT INTO `answers` VALUES ('57', '36', '2', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"一般在学生事务中心可以办理。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:58:18', '2025-07-15 15:58:18', '0', 'question');
INSERT INTO `answers` VALUES ('58', '37', '5', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"多数情况允许，注意查看规定。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:58:18', '2025-07-15 15:58:18', '0', 'question');
INSERT INTO `answers` VALUES ('59', '38', '3', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"可以联系辅导员确认。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:58:18', '2025-07-15 15:58:18', '0', 'question');
INSERT INTO `answers` VALUES ('60', '39', '5', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"可在教务系统查询相关内容。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:58:18', '2025-07-15 15:58:18', '0', 'question');
INSERT INTO `answers` VALUES ('61', '40', '5', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"请参考学生手册的说明。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:58:18', '2025-07-15 15:58:18', '0', 'question');
INSERT INTO `answers` VALUES ('62', '40', '4', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"可在教务系统查询相关内容。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:58:18', '2025-07-15 15:58:18', '0', 'question');
INSERT INTO `answers` VALUES ('63', '41', '5', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"请参考学生手册的说明。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:58:18', '2025-07-15 15:58:18', '0', 'question');
INSERT INTO `answers` VALUES ('64', '42', '2', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"建议查看学校官网或微信公众号公告。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:59:36', '2025-07-15 15:59:36', '0', 'question');
INSERT INTO `answers` VALUES ('65', '42', '4', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"请参考学生手册的说明。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:59:36', '2025-07-15 15:59:36', '0', 'question');
INSERT INTO `answers` VALUES ('66', '43', '4', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"需要本人携带证件去窗口办理。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:59:36', '2025-07-15 15:59:36', '0', 'question');
INSERT INTO `answers` VALUES ('67', '44', '2', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"建议查看学校官网或微信公众号公告。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:59:36', '2025-07-15 15:59:36', '0', 'question');
INSERT INTO `answers` VALUES ('68', '45', '3', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"可在教务系统查询相关内容。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:59:36', '2025-07-15 15:59:36', '0', 'question');
INSERT INTO `answers` VALUES ('69', '46', '5', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"需要本人携带证件去窗口办理。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:59:36', '2025-07-15 15:59:36', '0', 'question');
INSERT INTO `answers` VALUES ('70', '47', '4', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"一般在学生事务中心可以办理。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:59:36', '2025-07-15 15:59:36', '0', 'question');
INSERT INTO `answers` VALUES ('71', '47', '4', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"可在教务系统查询相关内容。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:59:36', '2025-07-15 15:59:36', '0', 'question');
INSERT INTO `answers` VALUES ('72', '48', '5', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"需要本人携带证件去窗口办理。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:59:36', '2025-07-15 15:59:36', '0', 'question');
INSERT INTO `answers` VALUES ('73', '49', '1', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"需要本人携带证件去窗口办理。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:59:36', '2025-07-15 15:59:36', '0', 'question');
INSERT INTO `answers` VALUES ('74', '49', '5', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"一般支持网上操作，无需线下提交。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:59:36', '2025-07-15 15:59:36', '0', 'question');
INSERT INTO `answers` VALUES ('75', '50', '1', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"需要本人携带证件去窗口办理。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:59:36', '2025-07-15 15:59:36', '0', 'question');
INSERT INTO `answers` VALUES ('76', '50', '1', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"需要本人携带证件去窗口办理。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:59:36', '2025-07-15 15:59:36', '0', 'question');
INSERT INTO `answers` VALUES ('77', '51', '2', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"多数情况允许，注意查看规定。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:59:36', '2025-07-15 15:59:36', '0', 'question');
INSERT INTO `answers` VALUES ('78', '51', '1', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"建议查看学校官网或微信公众号公告。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:59:36', '2025-07-15 15:59:36', '0', 'question');
INSERT INTO `answers` VALUES ('79', '52', '5', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"多数情况允许，注意查看规定。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:59:36', '2025-07-15 15:59:36', '0', 'question');
INSERT INTO `answers` VALUES ('80', '52', '4', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"可以联系辅导员确认。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:59:36', '2025-07-15 15:59:36', '0', 'question');
INSERT INTO `answers` VALUES ('81', '53', '4', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"建议查看学校官网或微信公众号公告。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:59:36', '2025-07-15 15:59:36', '0', 'question');
INSERT INTO `answers` VALUES ('82', '53', '3', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"可以联系辅导员确认。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:59:36', '2025-07-15 15:59:36', '0', 'question');
INSERT INTO `answers` VALUES ('83', '54', '4', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"可以联系辅导员确认。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:59:36', '2025-07-15 15:59:36', '0', 'question');
INSERT INTO `answers` VALUES ('84', '54', '4', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"可在教务系统查询相关内容。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:59:36', '2025-07-15 15:59:36', '0', 'question');
INSERT INTO `answers` VALUES ('85', '55', '5', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"可以联系辅导员确认。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:59:36', '2025-07-15 15:59:36', '0', 'question');
INSERT INTO `answers` VALUES ('86', '55', '3', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"可在教务系统查询相关内容。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:59:36', '2025-07-15 15:59:36', '0', 'question');
INSERT INTO `answers` VALUES ('87', '56', '4', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"可在教务系统查询相关内容。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:59:36', '2025-07-15 15:59:36', '0', 'question');
INSERT INTO `answers` VALUES ('88', '56', '3', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"可在教务系统查询相关内容。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:59:36', '2025-07-15 15:59:36', '0', 'question');
INSERT INTO `answers` VALUES ('89', '57', '3', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"需要本人携带证件去窗口办理。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:59:36', '2025-07-15 15:59:36', '0', 'question');
INSERT INTO `answers` VALUES ('90', '57', '1', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"一般支持网上操作，无需线下提交。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:59:36', '2025-07-15 15:59:36', '0', 'question');
INSERT INTO `answers` VALUES ('91', '58', '5', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"可以联系辅导员确认。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:59:36', '2025-07-15 15:59:36', '0', 'question');
INSERT INTO `answers` VALUES ('92', '58', '2', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"建议查看学校官网或微信公众号公告。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:59:36', '2025-07-15 15:59:36', '0', 'question');
INSERT INTO `answers` VALUES ('93', '59', '1', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"多数情况允许，注意查看规定。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:59:36', '2025-07-15 15:59:36', '0', 'question');
INSERT INTO `answers` VALUES ('94', '59', '5', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"请参考学生手册的说明。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:59:36', '2025-07-15 15:59:36', '0', 'question');
INSERT INTO `answers` VALUES ('95', '60', '2', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"一般支持网上操作，无需线下提交。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:59:36', '2025-07-15 15:59:36', '0', 'question');
INSERT INTO `answers` VALUES ('96', '61', '2', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"多数情况允许，注意查看规定。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:59:36', '2025-07-15 15:59:36', '0', 'question');
INSERT INTO `answers` VALUES ('97', '61', '2', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"请参考学生手册的说明。\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-15 15:59:36', '2025-07-15 15:59:36', '0', 'question');
INSERT INTO `answers` VALUES ('102', '42', '1', '11111', '2025-07-24 19:02:49', '2025-07-24 19:02:49', '0', 'answer');
INSERT INTO `answers` VALUES ('103', '42', '1', '1111', '2025-07-24 19:03:50', '2025-07-24 19:03:50', '0', 'question');
INSERT INTO `answers` VALUES ('104', '42', '1', '222', '2025-07-24 19:05:32', '2025-07-24 19:05:32', '0', 'question');
INSERT INTO `answers` VALUES ('105', '42', '1', '333', '2025-07-24 19:07:08', '2025-07-24 19:07:08', '0', 'question');
INSERT INTO `answers` VALUES ('106', '42', '1', '333', '2025-07-24 19:09:06', '2025-07-24 19:09:06', '0', 'question');
INSERT INTO `answers` VALUES ('107', '42', '1', '444', '2025-07-24 19:10:28', '2025-07-24 19:10:28', '0', 'question');
INSERT INTO `answers` VALUES ('108', '65', '1', '{\"type\":\"richtext\",\"blocks\":[]}', '2025-07-24 19:10:51', '2025-07-24 19:10:51', '0', 'answer');

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES ('1', '生活', '2025-07-14 19:04:01', '2025-07-14 19:04:05');
INSERT INTO `categories` VALUES ('2', '学习', '2025-07-14 19:04:01', '2025-07-14 19:04:05');
INSERT INTO `categories` VALUES ('3', '娱乐', '2025-07-14 19:04:01', '2025-07-14 19:04:05');
INSERT INTO `categories` VALUES ('4', '选课', '2025-07-14 19:04:01', '2025-07-14 19:04:05');
INSERT INTO `categories` VALUES ('5', '美食', '2025-07-14 19:04:01', '2025-07-14 19:04:05');
INSERT INTO `categories` VALUES ('6', '情感', '2025-07-14 19:04:01', '2025-07-14 19:04:05');
INSERT INTO `categories` VALUES ('7', '转专业', '2025-07-14 19:04:01', '2025-07-14 19:04:05');
INSERT INTO `categories` VALUES ('8', '就业实习', '2025-07-14 19:04:01', '2025-07-14 19:04:05');
INSERT INTO `categories` VALUES ('9', '升学', '2025-07-14 19:04:01', '2025-07-14 19:04:05');
INSERT INTO `categories` VALUES ('10', '考公', '2025-07-14 19:04:01', '2025-07-14 19:04:05');
INSERT INTO `categories` VALUES ('11', '出国', '2025-07-14 19:04:01', '2025-07-14 19:04:05');
INSERT INTO `categories` VALUES ('12', '考试', '2025-07-14 19:04:01', '2025-07-14 19:04:05');
INSERT INTO `categories` VALUES ('13', '社团', '2025-07-14 19:04:01', '2025-07-14 19:04:05');
INSERT INTO `categories` VALUES ('14', '捞人', '2025-07-14 19:04:01', '2025-07-14 19:04:05');
INSERT INTO `categories` VALUES ('15', '宿舍', '2025-07-14 19:04:01', '2025-07-14 19:04:05');
INSERT INTO `categories` VALUES ('16', '铜盘', '2025-07-14 19:04:01', '2025-07-14 19:04:05');
INSERT INTO `categories` VALUES ('17', '兼职', '2025-07-14 19:04:01', '2025-07-14 19:04:05');

-- ----------------------------
-- Table structure for category_relas
-- ----------------------------
DROP TABLE IF EXISTS `category_relas`;
CREATE TABLE `category_relas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) DEFAULT NULL,
  `target_type` enum('post','question') DEFAULT NULL,
  `target_id` bigint(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category_relas
-- ----------------------------
INSERT INTO `category_relas` VALUES ('1', '3', 'post', '1', '2025-07-14 19:06:06', '2025-07-14 19:06:08');
INSERT INTO `category_relas` VALUES ('2', '2', 'post', '2', '2025-07-14 19:06:25', '2025-07-14 19:06:28');
INSERT INTO `category_relas` VALUES ('3', '7', 'post', '3', '2025-07-14 19:06:40', '2025-07-14 19:06:44');
INSERT INTO `category_relas` VALUES ('4', '3', 'post', '4', '2025-07-14 19:06:59', '2025-07-14 19:07:03');
INSERT INTO `category_relas` VALUES ('5', '10', 'post', '6', '2025-07-14 19:07:16', '2025-07-14 19:07:18');
INSERT INTO `category_relas` VALUES ('6', '12', 'post', '7', '2025-07-14 19:07:33', '2025-07-14 19:07:35');
INSERT INTO `category_relas` VALUES ('7', '8', 'post', '5', '2025-07-14 19:08:20', '2025-07-14 19:08:24');
INSERT INTO `category_relas` VALUES ('8', '6', 'post', '8', '2025-07-14 19:08:35', '2025-07-14 19:08:38');
INSERT INTO `category_relas` VALUES ('9', '15', 'post', '9', '2025-07-14 19:08:50', '2025-07-14 19:08:52');
INSERT INTO `category_relas` VALUES ('10', '13', 'post', '10', '2025-07-14 19:09:02', '2025-07-14 19:09:04');
INSERT INTO `category_relas` VALUES ('11', '12', 'question', '1', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('12', '12', 'question', '2', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('13', '3', 'question', '3', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('14', '13', 'question', '4', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('15', '4', 'question', '5', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('16', '16', 'question', '6', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('17', '16', 'question', '7', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('18', '14', 'question', '8', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('19', '6', 'question', '9', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('20', '5', 'question', '10', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('21', '5', 'question', '11', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('22', '9', 'question', '12', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('23', '11', 'question', '13', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('24', '12', 'question', '14', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('25', '11', 'question', '15', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('26', '17', 'question', '16', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('27', '3', 'question', '17', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('28', '12', 'question', '18', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('29', '16', 'question', '19', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('30', '10', 'question', '20', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('31', '1', 'question', '21', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('32', '9', 'question', '22', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('33', '6', 'question', '23', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('34', '3', 'question', '24', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('35', '16', 'question', '25', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('36', '17', 'question', '26', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('37', '2', 'question', '27', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('38', '10', 'question', '28', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('39', '11', 'question', '29', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('40', '7', 'question', '30', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('41', '17', 'question', '31', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('42', '15', 'question', '32', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('43', '6', 'question', '33', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('44', '3', 'question', '34', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('45', '11', 'question', '35', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('46', '14', 'question', '36', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('47', '1', 'question', '37', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('48', '13', 'question', '38', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('49', '13', 'question', '39', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('50', '6', 'question', '40', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('51', '8', 'question', '41', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('52', '5', 'question', '42', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('53', '2', 'question', '43', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('54', '9', 'question', '44', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('55', '4', 'question', '45', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('56', '9', 'question', '46', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('57', '1', 'question', '47', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('58', '9', 'question', '48', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('59', '7', 'question', '49', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('60', '8', 'question', '50', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('61', '4', 'question', '51', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('62', '11', 'question', '52', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('63', '9', 'question', '53', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('64', '10', 'question', '54', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('65', '6', 'question', '55', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('66', '17', 'question', '56', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('67', '13', 'question', '57', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('68', '17', 'question', '58', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('69', '9', 'question', '59', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('70', '13', 'question', '60', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('71', '3', 'question', '61', '2025-07-23 22:01:09', '2025-07-23 22:01:09');
INSERT INTO `category_relas` VALUES ('74', '6', 'question', '1', '2025-07-23 22:38:41', '2025-07-23 22:38:41');
INSERT INTO `category_relas` VALUES ('75', '15', 'question', '3', '2025-07-23 22:38:41', '2025-07-23 22:38:41');
INSERT INTO `category_relas` VALUES ('76', '12', 'question', '4', '2025-07-23 22:38:41', '2025-07-23 22:38:41');
INSERT INTO `category_relas` VALUES ('77', '6', 'question', '5', '2025-07-23 22:38:41', '2025-07-23 22:38:41');
INSERT INTO `category_relas` VALUES ('78', '2', 'question', '10', '2025-07-23 22:38:41', '2025-07-23 22:38:41');
INSERT INTO `category_relas` VALUES ('79', '13', 'question', '11', '2025-07-23 22:38:41', '2025-07-23 22:38:41');
INSERT INTO `category_relas` VALUES ('80', '7', 'question', '12', '2025-07-23 22:38:41', '2025-07-23 22:38:41');
INSERT INTO `category_relas` VALUES ('81', '15', 'question', '15', '2025-07-23 22:38:41', '2025-07-23 22:38:41');
INSERT INTO `category_relas` VALUES ('82', '16', 'question', '16', '2025-07-23 22:38:41', '2025-07-23 22:38:41');
INSERT INTO `category_relas` VALUES ('83', '5', 'question', '17', '2025-07-23 22:38:41', '2025-07-23 22:38:41');
INSERT INTO `category_relas` VALUES ('84', '17', 'question', '21', '2025-07-23 22:38:41', '2025-07-23 22:38:41');
INSERT INTO `category_relas` VALUES ('85', '4', 'question', '26', '2025-07-23 22:38:41', '2025-07-23 22:38:41');
INSERT INTO `category_relas` VALUES ('86', '10', 'question', '28', '2025-07-23 22:38:41', '2025-07-23 22:38:41');
INSERT INTO `category_relas` VALUES ('87', '1', 'question', '30', '2025-07-23 22:38:41', '2025-07-23 22:38:41');
INSERT INTO `category_relas` VALUES ('88', '7', 'question', '33', '2025-07-23 22:38:41', '2025-07-23 22:38:41');
INSERT INTO `category_relas` VALUES ('89', '8', 'question', '38', '2025-07-23 22:38:41', '2025-07-23 22:38:41');
INSERT INTO `category_relas` VALUES ('90', '7', 'question', '42', '2025-07-23 22:38:41', '2025-07-23 22:38:41');
INSERT INTO `category_relas` VALUES ('91', '14', 'question', '45', '2025-07-23 22:38:41', '2025-07-23 22:38:41');
INSERT INTO `category_relas` VALUES ('92', '7', 'question', '49', '2025-07-23 22:38:41', '2025-07-23 22:38:41');
INSERT INTO `category_relas` VALUES ('93', '9', 'question', '52', '2025-07-23 22:38:41', '2025-07-23 22:38:41');
INSERT INTO `category_relas` VALUES ('94', '10', 'question', '54', '2025-07-23 22:38:41', '2025-07-23 22:38:41');
INSERT INTO `category_relas` VALUES ('95', '17', 'question', '55', '2025-07-23 22:38:41', '2025-07-23 22:38:41');
INSERT INTO `category_relas` VALUES ('96', '15', 'question', '57', '2025-07-23 22:38:41', '2025-07-23 22:38:41');
INSERT INTO `category_relas` VALUES ('97', '9', 'question', '58', '2025-07-23 22:38:41', '2025-07-23 22:38:41');
INSERT INTO `category_relas` VALUES ('98', '7', 'question', '59', '2025-07-23 22:38:41', '2025-07-23 22:38:41');

-- ----------------------------
-- Table structure for collects
-- ----------------------------
DROP TABLE IF EXISTS `collects`;
CREATE TABLE `collects` (
  `id` bigint(20) DEFAULT NULL,
  `target_type` enum('post','question') DEFAULT NULL,
  `target_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collects
-- ----------------------------

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `text` text,
  `target_type` enum('post','comment') DEFAULT NULL,
  `target_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `likes` int(255) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES ('1', '好看', 'post', '1', '1', '2025-07-09 18:43:34', '2025-07-09 18:43:37', '0');
INSERT INTO `comments` VALUES ('2', '看起来好好吃', 'post', '2', '2', '2025-07-09 18:44:03', '2025-07-09 18:44:05', '10');
INSERT INTO `comments` VALUES ('3', '是呀是呀', 'comment', '1', '1', '2025-07-09 18:44:23', '2025-07-09 18:44:25', '30');
INSERT INTO `comments` VALUES ('4', '没错没错', 'comment', '1', '2', '2025-07-09 18:57:16', '2025-07-09 18:57:19', '24');
INSERT INTO `comments` VALUES ('5', '好看的小雏菊', 'post', '1', '1', '2025-07-09 19:46:01', '2025-07-09 19:46:04', '0');
INSERT INTO `comments` VALUES ('6', '我也有同样的问题', 'comment', '5', '2', '2025-07-10 14:13:53', '2025-07-10 14:13:53', '0');
INSERT INTO `comments` VALUES ('7', '真好看', 'post', '1', '1', '2025-07-10 15:23:09', '2025-07-10 15:23:09', '0');
INSERT INTO `comments` VALUES ('10', '好看23', 'post', '1', '1', '2025-07-10 15:30:39', '2025-07-10 15:30:39', '0');
INSERT INTO `comments` VALUES ('11', '好看插入11', 'post', '1', '1', '2025-07-10 15:32:26', '2025-07-10 15:32:26', '0');
INSERT INTO `comments` VALUES ('12', '好看344', 'post', '1', '1', '2025-07-10 15:38:21', '2025-07-10 15:38:21', '0');
INSERT INTO `comments` VALUES ('13', '好好看呀', 'post', '1', '2', '2025-07-10 16:28:08', '2025-07-10 16:28:08', '0');
INSERT INTO `comments` VALUES ('14', '真好看', 'post', '1', '2', '2025-07-10 16:29:55', '2025-07-10 16:29:55', '0');
INSERT INTO `comments` VALUES ('15', '好看', 'post', '1', '1', '2025-07-23 18:30:59', '2025-07-23 18:30:59', '0');
INSERT INTO `comments` VALUES ('16', '好看的啊啊啊啊', 'post', '1', '1', '2025-07-24 02:10:21', '2025-07-24 02:10:21', '0');
INSERT INTO `comments` VALUES ('17', '好看的啊啊啊啊', 'post', '1', '1', '2025-07-24 02:13:43', '2025-07-24 02:13:43', '0');
INSERT INTO `comments` VALUES ('18', '好看啊啊啊啊啊啊啊啊啊啊啊啊啊', 'post', '1', '1', '2025-07-24 02:14:23', '2025-07-24 02:14:23', '0');
INSERT INTO `comments` VALUES ('19', '好看啊啊啊啊啊啊啊啊啊啊啊', 'post', '1', '1', '2025-07-24 02:17:21', '2025-07-24 02:17:21', '0');
INSERT INTO `comments` VALUES ('20', '好看啊啊啊啊啊啊啊啊啊啊', 'post', '1', '1', '2025-07-24 02:18:48', '2025-07-24 02:18:48', '0');
INSERT INTO `comments` VALUES ('21', '好的', 'post', '1', '1', '2025-07-24 02:25:45', '2025-07-24 02:25:45', '0');
INSERT INTO `comments` VALUES ('22', '对的', 'post', '1', '1', '2025-07-24 15:13:55', '2025-07-24 15:13:55', '0');
INSERT INTO `comments` VALUES ('23', '的是', 'comment', '3', '1', '2025-07-24 15:25:31', '2025-07-24 15:25:31', '0');
INSERT INTO `comments` VALUES ('24', '好的', 'comment', '21', '1', '2025-07-24 15:26:22', '2025-07-24 15:26:22', '0');
INSERT INTO `comments` VALUES ('25', '对的', 'comment', '3', '1', '2025-07-24 15:26:41', '2025-07-24 15:26:41', '0');
INSERT INTO `comments` VALUES ('26', '哈ODEEDE', 'comment', '24', '1', '2025-07-24 15:26:55', '2025-07-24 15:26:55', '0');
INSERT INTO `comments` VALUES ('27', '好看的', 'comment', '3', '1', '2025-07-24 15:32:04', '2025-07-24 15:32:04', '0');
INSERT INTO `comments` VALUES ('28', '好看呢', 'comment', '3', '1', '2025-07-24 15:34:41', '2025-07-24 15:34:41', '0');
INSERT INTO `comments` VALUES ('29', '好看啊啊啊啊啊啊啊啊啊啊啊', 'comment', '3', '1', '2025-07-24 16:08:43', '2025-07-24 16:08:43', '0');
INSERT INTO `comments` VALUES ('30', '你说得对', 'comment', '4', '1', '2025-07-24 16:19:48', '2025-07-24 16:19:48', '0');
INSERT INTO `comments` VALUES ('31', '你说得对', 'comment', '6', '1', '2025-07-24 16:20:06', '2025-07-24 16:20:06', '0');
INSERT INTO `comments` VALUES ('32', '是的是的', 'comment', '6', '1', '2025-07-24 16:22:50', '2025-07-24 16:22:50', '0');
INSERT INTO `comments` VALUES ('33', '使得', 'comment', '31', '1', '2025-07-24 16:23:19', '2025-07-24 16:23:19', '0');
INSERT INTO `comments` VALUES ('34', '对的', 'comment', '6', '1', '2025-07-24 16:23:28', '2025-07-24 16:23:28', '0');
INSERT INTO `comments` VALUES ('35', '对俄', 'comment', '24', '1', '2025-07-24 16:26:43', '2025-07-24 16:26:43', '0');
INSERT INTO `comments` VALUES ('36', '嗯嗯', 'comment', '6', '1', '2025-07-24 16:27:37', '2025-07-24 16:27:37', '0');
INSERT INTO `comments` VALUES ('37', '是呀', 'comment', '2', '1', '2025-07-24 16:33:40', '2025-07-24 16:33:40', '0');
INSERT INTO `comments` VALUES ('38', '是呀', 'comment', '1', '1', '2025-07-24 16:34:09', '2025-07-24 16:34:09', '0');
INSERT INTO `comments` VALUES ('39', '好看', 'comment', '13', '1', '2025-07-24 16:40:44', '2025-07-24 16:40:44', '0');
INSERT INTO `comments` VALUES ('40', '对的', 'comment', '21', '1', '2025-07-24 17:12:43', '2025-07-24 17:12:43', '0');
INSERT INTO `comments` VALUES ('41', '真好', 'comment', '10', '1', '2025-07-24 17:12:56', '2025-07-24 17:12:56', '0');
INSERT INTO `comments` VALUES ('42', '对的 啊啊', 'comment', '5', '1', '2025-07-24 17:14:47', '2025-07-24 17:14:47', '0');
INSERT INTO `comments` VALUES ('43', '对呀', 'comment', '38', '1', '2025-07-24 17:16:42', '2025-07-24 17:16:42', '0');
INSERT INTO `comments` VALUES ('44', '对呀对呀', 'comment', '37', '1', '2025-07-24 19:47:12', '2025-07-24 19:47:12', '0');
INSERT INTO `comments` VALUES ('45', '对的吧', 'comment', '1', '1', '2025-07-24 19:49:17', '2025-07-24 19:49:17', '0');
INSERT INTO `comments` VALUES ('46', '对的', 'comment', '37', '1', '2025-07-24 19:49:58', '2025-07-24 19:49:58', '0');

-- ----------------------------
-- Table structure for likes
-- ----------------------------
DROP TABLE IF EXISTS `likes`;
CREATE TABLE `likes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `target_type` enum('post','answer','question','comment') DEFAULT NULL,
  `target_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `likes_target_type_target_id_user_id` (`target_type`,`target_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of likes
-- ----------------------------
INSERT INTO `likes` VALUES ('1', 'post', '1', '1', '2025-07-04 20:51:04', '2025-07-04 20:51:04');
INSERT INTO `likes` VALUES ('2', 'post', '2', '2', '2025-07-04 20:51:04', '2025-07-04 20:51:04');
INSERT INTO `likes` VALUES ('3', 'post', '3', '3', '2025-07-04 20:51:04', '2025-07-04 20:51:04');
INSERT INTO `likes` VALUES ('4', 'comment', '1', '1', '2025-07-09 19:29:57', '2025-07-09 19:29:59');

-- ----------------------------
-- Table structure for posts
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `content` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `likes` int(11) DEFAULT '0' COMMENT '点赞数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of posts
-- ----------------------------
INSERT INTO `posts` VALUES ('1', 'Terminatio cognatus thorax autus villa.', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"Ciminatio sodalitas crur temptatio apto conor spero cupiditas. Adipiscor defluo incidunt virga talio maxime nemo uberrime decet ea.\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"},{\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-04 21:27:04', '2025-07-04 21:27:04', '1', '10');
INSERT INTO `posts` VALUES ('2', 'Accedo surgo vix tunc auctus.', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"Adiuvo dolorum convoco. Uberrime xiphias corrupti tardus speciosus deleo ullus.\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '2025-07-04 21:27:04', '2025-07-04 21:27:04', '1', '6');
INSERT INTO `posts` VALUES ('3', 'Tutamen cuppedia spectaculum sit speciosus.', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"Confero defetiscor bene acquiro consectetur cura. Theologus assumenda ab demergo angustus carmen terga.\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/mkWf4skk/2.jpg\", \"type\": \"image\"}]}', '2025-07-04 21:27:04', '2025-07-04 21:27:04', '1', '9');
INSERT INTO `posts` VALUES ('4', 'Timor vesco aut ascit aspicio.', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"Aureus conduco sonitus caecus audio supra reprehenderit brevis totam. Deporto absque cotidie taceo tergiversatio coruscus delicate tandem.\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/L5kd6bgT/8.jpg\", \"type\": \"image\"}]}', '2025-07-04 21:27:04', '2025-07-04 21:27:04', '2', '13');
INSERT INTO `posts` VALUES ('5', 'Viscus decet velut dedecor dolor.', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"Usus provident comburo virtus desino. Damnatio et adnuo decipio.\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/jSSVtvxH/3.jpg\", \"type\": \"image\"}]}', '2025-07-04 21:27:04', '2025-07-04 21:27:04', '1', '0');
INSERT INTO `posts` VALUES ('6', 'Stella sequi clarus brevis cubitum.', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"Pecco vulgivagus carcer eius adsuesco sublime tergum depono. Annus demens aestas communis.\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/k5ZPj8dx/4.jpg\", \"type\": \"image\"}]}', '2025-07-04 21:27:04', '2025-07-04 21:27:04', '1', '14');
INSERT INTO `posts` VALUES ('7', 'Aegre vulgo asporto ambitus atrox.', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"Assumenda facere triduana natus turpis veritatis decipio atrocitas. Umbra vado commodi.\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/xjLVRcpz/5.jpg\", \"type\": \"image\"}]}', '2025-07-04 21:27:04', '2025-07-04 21:27:04', '1', '0');
INSERT INTO `posts` VALUES ('8', 'Similique terminatio termes alius in.', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"Venia aequitas suscipio deorsum arcus adimpleo pariatur. Vulnus adicio sum surculus aspicio brevis.\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/pTFb3T23/6.jpg\", \"type\": \"image\"}]}', '2025-07-04 21:27:04', '2025-07-04 21:27:04', '1', '0');
INSERT INTO `posts` VALUES ('9', 'Vulariter verto acer vesper adflicto.', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"Neque defleo consuasor. Crinis tres voluntarius commodo thymbra cinis.\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/VL1QHm2H/7.jpg\", \"type\": \"image\"}]}', '2025-07-04 21:27:04', '2025-07-04 21:27:04', '1', '0');
INSERT INTO `posts` VALUES ('10', 'Advenio deduco velut abundans voluptatibus.', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"Denuncio aestivus eum thermae amplexus cresco. Crepusculum aliquid aranea.\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/X78MRtbN/9.jpg\", \"type\": \"image\"}]}', '2025-07-04 21:27:04', '2025-07-04 21:27:04', '1', '0');

-- ----------------------------
-- Table structure for questions
-- ----------------------------
DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` text,
  `bonus` int(11) DEFAULT '0',
  `user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `same_ques` int(11) DEFAULT '0' COMMENT '点赞数',
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of questions
-- ----------------------------
INSERT INTO `questions` VALUES ('1', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"Ciminatio sodalitas crur temptatio apto conor spero cupiditas. Adipiscor defluo incidunt virga talio maxime nemo uberrime decet ea.\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"},{\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '0', '1', '2025-07-10 16:59:56', '2025-07-10 16:59:59', '0', '这是第1个问题');
INSERT INTO `questions` VALUES ('2', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"宿舍晚上几点会断电？\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '0', '1', '2025-07-15 04:54:41', '2025-07-15 04:54:41', '0', '这是第2个问题');
INSERT INTO `questions` VALUES ('3', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"教学楼周末开放时间是几点？\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '0', '2', '2025-07-15 04:54:41', '2025-07-15 04:54:41', '0', '这是第3个问题');
INSERT INTO `questions` VALUES ('4', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"请问体测不过会影响毕业吗？\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '0', '3', '2025-07-15 04:54:41', '2025-07-15 04:54:41', '0', '这是第4个问题');
INSERT INTO `questions` VALUES ('5', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"校园卡丢了怎么办，能补办吗？\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '0', '4', '2025-07-15 04:54:41', '2025-07-15 04:54:41', '0', '这是第5个问题');
INSERT INTO `questions` VALUES ('6', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"图书馆可以带食物进去吗？\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '0', '5', '2025-07-15 04:54:41', '2025-07-15 04:54:41', '0', '这是第6个问题');
INSERT INTO `questions` VALUES ('7', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"实验室使用是否需要提前预约？\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '0', '2', '2025-07-15 04:54:41', '2025-07-15 04:54:41', '0', '这是第7个问题');
INSERT INTO `questions` VALUES ('8', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"请问选修课能退选吗？\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '0', '1', '2025-07-15 04:54:41', '2025-07-15 04:54:41', '0', '这是第8个问题');
INSERT INTO `questions` VALUES ('9', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"期末考试时间什么时候公布？\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '0', '4', '2025-07-15 04:54:41', '2025-07-15 04:54:41', '0', '这是第9个问题');
INSERT INTO `questions` VALUES ('10', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"请假超过三天需要哪些手续？\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '0', '3', '2025-07-15 04:54:41', '2025-07-15 04:54:41', '0', '这是第10个问题');
INSERT INTO `questions` VALUES ('11', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"怎么查询自己的课表？\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '0', '5', '2025-07-15 04:54:41', '2025-07-15 04:54:41', '0', '这是第11个问题');
INSERT INTO `questions` VALUES ('12', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"考勤缺席三次会怎么样？\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '0', '5', '2025-07-15 04:56:44', '2025-07-15 04:56:44', '0', '这是第12个问题');
INSERT INTO `questions` VALUES ('13', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"校园里可以骑电动车吗？\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '0', '3', '2025-07-15 04:56:44', '2025-07-15 04:56:44', '0', '这是第13个问题');
INSERT INTO `questions` VALUES ('14', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"学校有无障碍通道吗？\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '0', '1', '2025-07-15 04:56:44', '2025-07-15 04:56:44', '0', '这是第14个问题');
INSERT INTO `questions` VALUES ('15', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"宿舍是否允许接热水器？\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '0', '4', '2025-07-15 04:56:44', '2025-07-15 04:56:44', '0', '这是第15个问题');
INSERT INTO `questions` VALUES ('16', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"如何申请出国交换项目？\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '0', '2', '2025-07-15 04:56:44', '2025-07-15 04:56:44', '0', '这是第16个问题');
INSERT INTO `questions` VALUES ('17', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"校医院挂号流程是怎样的？\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '0', '3', '2025-07-15 04:56:44', '2025-07-15 04:56:44', '0', '这是第17个问题');
INSERT INTO `questions` VALUES ('18', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"可以申请辅修专业吗？\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '0', '2', '2025-07-15 04:56:44', '2025-07-15 04:56:44', '0', '这是第18个问题');
INSERT INTO `questions` VALUES ('19', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"有哪些学生组织可以加入？\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '0', '1', '2025-07-15 04:56:44', '2025-07-15 04:56:44', '0', '这是第19个问题');
INSERT INTO `questions` VALUES ('20', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"四六级成绩什么时候公布？\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '0', '4', '2025-07-15 04:56:44', '2025-07-15 04:56:44', '0', '这是第20个问题');
INSERT INTO `questions` VALUES ('21', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"可以用校园卡乘公交吗？\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '0', '5', '2025-07-15 04:56:44', '2025-07-15 04:56:44', '0', '这是第21个问题');
INSERT INTO `questions` VALUES ('22', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"图书馆周末开放吗？\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '0', '1', '2025-07-15 15:58:18', '2025-07-15 15:58:18', '0', '这是第22个问题');
INSERT INTO `questions` VALUES ('23', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"体测不及格怎么办？\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '0', '2', '2025-07-15 15:58:18', '2025-07-15 15:58:18', '0', '这是第23个问题');
INSERT INTO `questions` VALUES ('24', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"校园卡丢了怎么补办？\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '0', '3', '2025-07-15 15:58:18', '2025-07-15 15:58:18', '0', '这是第24个问题');
INSERT INTO `questions` VALUES ('25', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"请假流程怎么操作？\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '0', '4', '2025-07-15 15:58:18', '2025-07-15 15:58:18', '0', '这是第25个问题');
INSERT INTO `questions` VALUES ('26', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"选修课如何退选？\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '0', '5', '2025-07-15 15:58:18', '2025-07-15 15:58:18', '0', '这是第26个问题');
INSERT INTO `questions` VALUES ('27', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"电动车可以进校园吗？\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '0', '1', '2025-07-15 15:58:18', '2025-07-15 15:58:18', '0', '这是第27个问题');
INSERT INTO `questions` VALUES ('28', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"怎么查期末考试安排？\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '0', '2', '2025-07-15 15:58:18', '2025-07-15 15:58:18', '0', '这是第28个问题');
INSERT INTO `questions` VALUES ('29', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"寝室几点断电？\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '0', '3', '2025-07-15 15:58:18', '2025-07-15 15:58:18', '0', '这是第29个问题');
INSERT INTO `questions` VALUES ('30', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"学校有心理咨询室吗？\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '0', '4', '2025-07-15 15:58:18', '2025-07-15 15:58:18', '0', '这是第30个问题');
INSERT INTO `questions` VALUES ('31', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"如何申请成绩单？\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '0', '5', '2025-07-15 15:58:18', '2025-07-15 15:58:18', '0', '这是第31个问题');
INSERT INTO `questions` VALUES ('32', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"四六级报名入口在哪？\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '0', '1', '2025-07-15 15:58:18', '2025-07-15 15:58:18', '0', '这是第32个问题');
INSERT INTO `questions` VALUES ('33', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"学校期末考核标准？\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '0', '2', '2025-07-15 15:58:18', '2025-07-15 15:58:18', '0', '这是第33个问题');
INSERT INTO `questions` VALUES ('34', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"能申请出国交换吗？\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '0', '3', '2025-07-15 15:58:18', '2025-07-15 15:58:18', '0', '这是第34个问题');
INSERT INTO `questions` VALUES ('35', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"图书馆能带饮料吗？\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '0', '4', '2025-07-15 15:58:18', '2025-07-15 15:58:18', '0', '这是第35个问题');
INSERT INTO `questions` VALUES ('36', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"晚归会扣分吗？\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '0', '5', '2025-07-15 15:58:18', '2025-07-15 15:58:18', '0', '这是第36个问题');
INSERT INTO `questions` VALUES ('37', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"在哪看课程表？\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '0', '1', '2025-07-15 15:58:18', '2025-07-15 15:58:18', '0', '这是第37个问题');
INSERT INTO `questions` VALUES ('38', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"专业能转吗？怎么申请？\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '0', '2', '2025-07-15 15:58:18', '2025-07-15 15:58:18', '0', '这是第38个问题');
INSERT INTO `questions` VALUES ('39', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"哪里打印文件方便？\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '0', '3', '2025-07-15 15:58:18', '2025-07-15 15:58:18', '0', '这是第39个问题');
INSERT INTO `questions` VALUES ('40', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"打疫苗需要预约吗？\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '0', '4', '2025-07-15 15:58:18', '2025-07-15 15:58:18', '0', '这是第40个问题');
INSERT INTO `questions` VALUES ('41', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"自习室怎么预约？\", \"type\": \"text\"}, {\"url\": \"https://i.postimg.cc/fbkhjC1z/1.jpg\", \"type\": \"image\"}, {\"url\": \"https://i.postimg.cc/L8CcXf5r/10.jpg\", \"type\": \"image\"}]}', '0', '5', '2025-07-15 15:58:18', '2025-07-15 15:58:18', '0', '这是第41个问题');
INSERT INTO `questions` VALUES ('42', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"图书馆节假日开放吗？\", \"type\": \"text\"}]}', '0', '1', '2025-07-15 15:59:36', '2025-07-15 15:59:36', '0', '这是第42个问题');
INSERT INTO `questions` VALUES ('43', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"选修课如何报名？\", \"type\": \"text\"}]}', '0', '2', '2025-07-15 15:59:36', '2025-07-15 15:59:36', '0', '这是第43个问题');
INSERT INTO `questions` VALUES ('44', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"校园卡丢了怎么补办？\", \"type\": \"text\"}]}', '0', '3', '2025-07-15 15:59:36', '2025-07-15 15:59:36', '0', '这是第44个问题');
INSERT INTO `questions` VALUES ('45', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"考试时间在哪里查看？\", \"type\": \"text\"}]}', '0', '4', '2025-07-15 15:59:36', '2025-07-15 15:59:36', '0', '这是第45个问题');
INSERT INTO `questions` VALUES ('46', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"可以申请缓考吗？\", \"type\": \"text\"}]}', '0', '5', '2025-07-15 15:59:36', '2025-07-15 15:59:36', '0', '这是第46个问题');
INSERT INTO `questions` VALUES ('47', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"寝室几点熄灯？\", \"type\": \"text\"}]}', '0', '1', '2025-07-15 15:59:36', '2025-07-15 15:59:36', '0', '这是第47个问题');
INSERT INTO `questions` VALUES ('48', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"图书馆能吃东西吗？\", \"type\": \"text\"}]}', '0', '2', '2025-07-15 15:59:36', '2025-07-15 15:59:36', '0', '这是第48个问题');
INSERT INTO `questions` VALUES ('49', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"怎么查课程表？\", \"type\": \"text\"}]}', '0', '3', '2025-07-15 15:59:36', '2025-07-15 15:59:36', '0', '这是第49个问题');
INSERT INTO `questions` VALUES ('50', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"上课可以带电脑吗？\", \"type\": \"text\"}]}', '0', '4', '2025-07-15 15:59:36', '2025-07-15 15:59:36', '0', '这是第50个问题');
INSERT INTO `questions` VALUES ('51', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"开学时间是几号？\", \"type\": \"text\"}]}', '0', '5', '2025-07-15 15:59:36', '2025-07-15 15:59:36', '0', '这是第51个问题');
INSERT INTO `questions` VALUES ('52', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"怎么申请奖学金？\", \"type\": \"text\"}]}', '0', '1', '2025-07-15 15:59:36', '2025-07-15 15:59:36', '0', '这是第52个问题');
INSERT INTO `questions` VALUES ('53', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"老师联系方式在哪看？\", \"type\": \"text\"}]}', '0', '2', '2025-07-15 15:59:36', '2025-07-15 15:59:36', '0', '这是第53个问题');
INSERT INTO `questions` VALUES ('54', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"在哪里可以打疫苗？\", \"type\": \"text\"}]}', '0', '3', '2025-07-15 15:59:36', '2025-07-15 15:59:36', '0', '这是第54个问题');
INSERT INTO `questions` VALUES ('55', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"如何使用校园打印机？\", \"type\": \"text\"}]}', '0', '4', '2025-07-15 15:59:36', '2025-07-15 15:59:36', '0', '这是第55个问题');
INSERT INTO `questions` VALUES ('56', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"能带朋友进宿舍吗？\", \"type\": \"text\"}]}', '0', '5', '2025-07-15 15:59:36', '2025-07-15 15:59:36', '0', '这是第56个问题');
INSERT INTO `questions` VALUES ('57', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"四六级报名流程？\", \"type\": \"text\"}]}', '0', '1', '2025-07-15 15:59:36', '2025-07-15 15:59:36', '0', '这是第57个问题');
INSERT INTO `questions` VALUES ('58', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"图书馆能续借几次？\", \"type\": \"text\"}]}', '0', '2', '2025-07-15 15:59:36', '2025-07-15 15:59:36', '0', '这是第58个问题');
INSERT INTO `questions` VALUES ('59', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"选修课可以退选吗？\", \"type\": \"text\"}]}', '0', '3', '2025-07-15 15:59:36', '2025-07-15 15:59:36', '0', '这是第59个问题');
INSERT INTO `questions` VALUES ('60', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"宿舍允许养宠物吗？\", \"type\": \"text\"}]}', '0', '4', '2025-07-15 15:59:36', '2025-07-15 15:59:36', '0', '这是第60个问题');
INSERT INTO `questions` VALUES ('61', '{\"type\": \"richtext\", \"blocks\": [{\"data\": \"学生证丢了怎么办？\", \"type\": \"text\"}]}', '0', '5', '2025-07-15 15:59:36', '2025-07-15 15:59:36', '0', '这是第61个问题');

-- ----------------------------
-- Table structure for same_questions
-- ----------------------------
DROP TABLE IF EXISTS `same_questions`;
CREATE TABLE `same_questions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(255) DEFAULT NULL,
  `question_id` bigint(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `same_questions_user_id_question_id` (`user_id`,`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of same_questions
-- ----------------------------
INSERT INTO `same_questions` VALUES ('1', '1', '1', '2025-07-10 17:03:46', '2025-07-10 17:03:49');
INSERT INTO `same_questions` VALUES ('2', '1', '2', '2025-07-24 19:01:25', '2025-07-24 19:01:28');
INSERT INTO `same_questions` VALUES ('3', '1', '3', '2025-07-24 19:01:43', '2025-07-24 19:01:46');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `account` varchar(255) DEFAULT NULL COMMENT '用户名',
  `mobile` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'test111111', '13913726547', '123456abc', 'https://img02.mockplus.cn/image/2022-05-11/29ca5a70-cb8c-11ec-9fcb-ede013bc170a.jpg', '2025-07-23 21:12:39.000000', '2025-07-23 21:12:41');
INSERT INTO `users` VALUES ('2', 'test222222', '18098765784', '123456abc', 'https://sns-avatar-qc.xhscdn.com/avatar/ffc1e420-a9d5-3c73-8d45-98182b8387d2?imageView2/2/w/60/format/webp|imageMogr2/strip', '2025-07-23 21:12:43.000000', '2025-07-23 21:12:46');
INSERT INTO `users` VALUES ('3', 'test333333', '13933333333', '123456abc', 'https://sns-avatar-qc.xhscdn.com/avatar/ffc1e420-a9d5-3c73-8d45-98182b8387d2?imageView2/2/w/60/format/webp|imageMogr2/strip', '2025-07-16 21:29:59.000000', '2025-07-16 21:30:02');
INSERT INTO `users` VALUES ('4', 'test444444', '13944444444', '123456abc', 'https://sns-avatar-qc.xhscdn.com/avatar/ffc1e420-a9d5-3c73-8d45-98182b8387d2?imageView2/2/w/60/format/webp|imageMogr2/strip', '2025-07-16 21:30:55.000000', '2025-07-16 21:30:58');
INSERT INTO `users` VALUES ('5', 'test555555', '13955555555', '123456abc', 'https://sns-avatar-qc.xhscdn.com/avatar/ffc1e420-a9d5-3c73-8d45-98182b8387d2?imageView2/2/w/60/format/webp|imageMogr2/strip', '2025-07-16 21:31:24.000000', '2025-07-16 21:31:26');
