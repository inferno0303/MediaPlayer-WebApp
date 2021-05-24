/*
 Navicat Premium Data Transfer

 Source Server         : 阿里云MySQL@3306
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : aly1.imyx.top:3306
 Source Schema         : media_player

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 14/06/2020 18:19:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for media_library
-- ----------------------------
DROP TABLE IF EXISTS `media_library`;
CREATE TABLE `media_library`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `file_md5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `media_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `artist` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `style` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 227 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of media_library
-- ----------------------------
INSERT INTO `media_library` VALUES (1, '12306的数据泄漏意味着什么？密码是如何在服务器上存储的？哈希算法有什么用？缓存是如何实现的？.mp4', 'D:\\media_src\\12306的数据泄漏意味着什么？密码是如何在服务器上存储的？哈希算法有什么用？缓存是如何实现的？.mp4', '57d3e039ca285ec23645d34bc0b80c6f', '12306的数据泄漏意味着什么？密码是如何在服务器上存储的？哈希算法有什么用？缓存是如何实现的？', '视频mp4', '初心不忘誓言封存', '学习', '2020-06-03 16:16:01');
INSERT INTO `media_library` VALUES (2, '不要再使用Session了！简单的问卷调查可能有什么坑？LocalStorage和Cookie如何选择？Session的安全问题是什么？.mp4', 'D:\\media_src\\不要再使用Session了！简单的问卷调查可能有什么坑？LocalStorage和Cookie如何选择？Session的安全问题是什么？.mp4', '46ae8de10e3118d75e587e60b2aaa879', '不要再使用Session了！简单的问卷调查可能有什么坑？LocalStorage和Cookie如何选择？Session的安全问题是什么？', '视频mp4', ' 初心不忘誓言封存', '学习', '2020-06-03 16:16:01');
INSERT INTO `media_library` VALUES (3, '云计算是啥？近年来云发展了什么？云计算简史！.mp4', 'D:\\media_src\\云计算是啥？近年来云发展了什么？云计算简史！.mp4', '7e16965e5addfcca6229970d6ac05844', '云计算是啥？近年来云发展了什么？云计算简史！', '视频mp4', '初心不忘誓言封存', '学习', '2020-06-03 16:16:02');
INSERT INTO `media_library` VALUES (4, '如何进行业务横向扩展？负载均衡是什么？代理和反向代理是什么？.mp4', 'D:\\media_src\\如何进行业务横向扩展？负载均衡是什么？代理和反向代理是什么？.mp4', 'efe999e174d4c3666e10f6e4721d0c40', '如何进行业务横向扩展？负载均衡是什么？代理和反向代理是什么？', '视频mp4', '初心不忘誓言封存', '学习', '2020-06-03 16:16:02');
INSERT INTO `media_library` VALUES (5, '推送通知是如何做到的？手机耗电的技术背景是怎么回事儿？详解推送技术架构之坑.mp4', 'D:\\media_src\\推送通知是如何做到的？手机耗电的技术背景是怎么回事儿？详解推送技术架构之坑.mp4', '3cce77fdf7b41fbc8eb1ef99865d72cc', '推送通知是如何做到的？手机耗电的技术背景是怎么回事儿？详解推送技术架构之坑', '视频mp4', '初心不忘誓言封存', '学习', '2020-06-03 16:16:02');
INSERT INTO `media_library` VALUES (6, '架构设计之登录注册开发起来坑这么多？账号是怎么被盗的？无状态的认证系统原理到底是什么？到底怎么做用户账户控制系统？.mp4', 'D:\\media_src\\架构设计之登录注册开发起来坑这么多？账号是怎么被盗的？无状态的认证系统原理到底是什么？到底怎么做用户账户控制系统？.mp4', 'fa5e6b92b38c5c6dd0f6d8724f2d2745', '架构设计之登录注册开发起来坑这么多？账号是怎么被盗的？无状态的认证系统原理到底是什么？到底怎么做用户账户控制系统？', '视频mp4', '初心不忘誓言封存', '学习', '2020-06-03 16:16:02');
INSERT INTO `media_library` VALUES (7, '白话架构设计，做个投票系统咋就这么难？Cookie的认证状态保持是如何实现的？.mp4', 'D:\\media_src\\白话架构设计，做个投票系统咋就这么难？Cookie的认证状态保持是如何实现的？.mp4', '8c7e963b53641e5c6d2e60d7e40bf710', '白话架构设计，做个投票系统咋就这么难？Cookie的认证状态保持是如何实现的？', '视频mp4', '初心不忘誓言封存', '学习', '2020-06-03 16:16:02');
INSERT INTO `media_library` VALUES (8, '软件是如何做到更新如此频繁？快速讲解DevOps理念是如何改变现代软件的.mp4', 'D:\\media_src\\软件是如何做到更新如此频繁？快速讲解DevOps理念是如何改变现代软件的.mp4', 'b5d68ad697c4226e744869f69cb56e17', '软件是如何做到更新如此频繁？快速讲解DevOps理念是如何改变现代软件的', '视频mp4', '初心不忘誓言封存', '学习', '2020-06-03 16:16:02');
INSERT INTO `media_library` VALUES (9, '软件架构师是什么样的职位？晋升架构师就轻松了吗？程序员如何转变为架构师？.mp4', 'D:\\media_src\\软件架构师是什么样的职位？晋升架构师就轻松了吗？程序员如何转变为架构师？.mp4', 'a7b53caa9b9686e365d5b5ba4bf2a9db', '软件架构师是什么样的职位？晋升架构师就轻松了吗？程序员如何转变为架构师？', '视频mp4', '初心不忘誓言封存', '学习', '2020-06-03 16:16:03');
INSERT INTO `media_library` VALUES (11, '01 - 可爱女人.mp3', 'D:\\media_src\\周杰伦-专辑\\jay\\01 - 可爱女人.mp3', '3284b3449ee0344734bece2d7a18983d', '可爱女人', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:03');
INSERT INTO `media_library` VALUES (13, '03 - 星晴.mp3', 'D:\\media_src\\周杰伦-专辑\\jay\\03 - 星晴.mp3', '790f33e4d30b44de87da05277e97a941', '星晴', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:03');
INSERT INTO `media_library` VALUES (14, '04 - 娘子.mp3', 'D:\\media_src\\周杰伦-专辑\\jay\\04 - 娘子.mp3', '987eb324638318ba7a047a55ae5c6821', '娘子', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:03');
INSERT INTO `media_library` VALUES (15, '05 - 斗牛.mp3', 'D:\\media_src\\周杰伦-专辑\\jay\\05 - 斗牛.mp3', '90d143a5bba4aa2e846742f46c98a92c', '斗牛', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:03');
INSERT INTO `media_library` VALUES (16, '06 - 黑色幽默.mp3', 'D:\\media_src\\周杰伦-专辑\\jay\\06 - 黑色幽默.mp3', '97ff06d6251b8a4e219292b272616b1d', '黑色幽默', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:03');
INSERT INTO `media_library` VALUES (17, '07 - 伊斯坦堡.mp3', 'D:\\media_src\\周杰伦-专辑\\jay\\07 - 伊斯坦堡.mp3', '52f0da781ccc2ec7b7fc67c14118c745', '伊斯坦堡', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:04');
INSERT INTO `media_library` VALUES (18, '08 - 印第安老斑鸠.mp3', 'D:\\media_src\\周杰伦-专辑\\jay\\08 - 印第安老斑鸠.mp3', '5089a09572013e24d89f398f03dae39f', '印第安老斑鸠', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:04');
INSERT INTO `media_library` VALUES (19, '09 - 龙卷风.mp3', 'D:\\media_src\\周杰伦-专辑\\jay\\09 - 龙卷风.mp3', '108b1303e796d2684746c592f704c463', '龙卷风', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:04');
INSERT INTO `media_library` VALUES (20, '10 - 反方向的钟.mp3', 'D:\\media_src\\周杰伦-专辑\\jay\\10 - 反方向的钟.mp3', '2b917c394592d16879b90b262fc594a2', '反方向的钟', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:04');
INSERT INTO `media_library` VALUES (21, '01 - 我的地盘.mp3', 'D:\\media_src\\周杰伦-专辑\\七里香\\01 - 我的地盘.mp3', '225e0d6ffaf3f8d9bcb4786d14188725', '我的地盘', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:04');
INSERT INTO `media_library` VALUES (22, '02 - 七里香 微信公众号，凯子影视站.mp3', 'D:\\media_src\\周杰伦-专辑\\七里香\\02 - 七里香 微信公众号，凯子影视站.mp3', '638f6146645d1343346c6d324f11dd2e', '七里香-周杰伦', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:04');
INSERT INTO `media_library` VALUES (23, '03 - 借口.mp3', 'D:\\media_src\\周杰伦-专辑\\七里香\\03 - 借口.mp3', '156ff5976815e7e267503a699b14e32e', '借口', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:04');
INSERT INTO `media_library` VALUES (24, '04 - 外婆.mp3', 'D:\\media_src\\周杰伦-专辑\\七里香\\04 - 外婆.mp3', '8ba2f74b1bf13d5fdfd038cc0e59cba7', '外婆', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:04');
INSERT INTO `media_library` VALUES (25, '05 - 将军.mp3', 'D:\\media_src\\周杰伦-专辑\\七里香\\05 - 将军.mp3', '86e7c898ed6a0929f9c6324d50de19ac', '将军', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:04');
INSERT INTO `media_library` VALUES (26, '06 - 搁浅.mp3', 'D:\\media_src\\周杰伦-专辑\\七里香\\06 - 搁浅.mp3', '512b428f4c26ba3842bd9f8570c201f4', '搁浅', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:04');
INSERT INTO `media_library` VALUES (27, '07 - 乱舞春秋.mp3', 'D:\\media_src\\周杰伦-专辑\\七里香\\07 - 乱舞春秋.mp3', '6efc2f87d46bf30d69f0d744868d5daa', '乱舞春秋', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:04');
INSERT INTO `media_library` VALUES (28, '08 - 困兽之斗.mp3', 'D:\\media_src\\周杰伦-专辑\\七里香\\08 - 困兽之斗.mp3', 'c9084947c5d28508a90a37152238c14a', '困兽之斗', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:04');
INSERT INTO `media_library` VALUES (29, '09 - 园游会.mp3', 'D:\\media_src\\周杰伦-专辑\\七里香\\09 - 园游会.mp3', 'b11eaf844e2073c2eb1d3b9fba5ed12c', '园游会', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:04');
INSERT INTO `media_library` VALUES (30, '10 - 止战之殇.mp3', 'D:\\media_src\\周杰伦-专辑\\七里香\\10 - 止战之殇.mp3', '840112b20e70b656326666f38f4a2d3d', '止战之殇', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:04');
INSERT INTO `media_library` VALUES (31, '01 - 夜的第七章.mp3', 'D:\\media_src\\周杰伦-专辑\\依然范特西\\01 - 夜的第七章.mp3', '4ee753729a62117eefcf96aa1fcfda13', '夜的第七章', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:04');
INSERT INTO `media_library` VALUES (32, '02 - 听妈妈的话.mp3', 'D:\\media_src\\周杰伦-专辑\\依然范特西\\02 - 听妈妈的话.mp3', '9cc7d079aaeb09916e4020d97ee31c35', '听妈妈的话', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:04');
INSERT INTO `media_library` VALUES (33, '03 - 千里之外.mp3', 'D:\\media_src\\周杰伦-专辑\\依然范特西\\03 - 千里之外.mp3', '9d7bee176016abfbf46d1a9a27a3d189', '千里之外', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:04');
INSERT INTO `media_library` VALUES (34, '04 - 本草纲目.mp3', 'D:\\media_src\\周杰伦-专辑\\依然范特西\\04 - 本草纲目.mp3', '7695ea5b269216a4343885f86a0cae82', '本草纲目', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:04');
INSERT INTO `media_library` VALUES (35, '05 - 退后.mp3', 'D:\\media_src\\周杰伦-专辑\\依然范特西\\05 - 退后.mp3', 'aa3dc15f09ffe1df05c36e84b7b83d0d', '退后', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:04');
INSERT INTO `media_library` VALUES (36, '06 - 红模仿.mp3', 'D:\\media_src\\周杰伦-专辑\\依然范特西\\06 - 红模仿.mp3', 'adecc4f73871e14170976ef6165de9d0', '红模仿', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:05');
INSERT INTO `media_library` VALUES (37, '07 - 心雨.mp3', 'D:\\media_src\\周杰伦-专辑\\依然范特西\\07 - 心雨.mp3', '5bbfc33a9070d829aea039694970e30f', '心雨', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:05');
INSERT INTO `media_library` VALUES (38, '08 - 白色风车.mp3', 'D:\\media_src\\周杰伦-专辑\\依然范特西\\08 - 白色风车.mp3', '55ff7f57634b7d7580d806b7bc7c0c3f', '白色风车', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:05');
INSERT INTO `media_library` VALUES (39, '09 - 迷迭香.mp3', 'D:\\media_src\\周杰伦-专辑\\依然范特西\\09 - 迷迭香.mp3', '702c2727e8f8c595801bd234c62a116b', '迷迭香', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:05');
INSERT INTO `media_library` VALUES (40, '10 - 菊花台.mp3', 'D:\\media_src\\周杰伦-专辑\\依然范特西\\10 - 菊花台.mp3', 'd2a9ce5674317b55008e1610f4ef356e', '菊花台', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:05');
INSERT INTO `media_library` VALUES (41, '01 - 半兽人.mp3', 'D:\\media_src\\周杰伦-专辑\\八度空间\\01 - 半兽人.mp3', '72eb46f619a9e0a139bb645157632aae', '半兽人', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:05');
INSERT INTO `media_library` VALUES (42, '02 - 半岛铁盒.mp3', 'D:\\media_src\\周杰伦-专辑\\八度空间\\02 - 半岛铁盒.mp3', 'd47c482cd589eb4fddc0b9cbc2bab79e', '半岛铁盒', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:05');
INSERT INTO `media_library` VALUES (43, '03 - 暗号.mp3', 'D:\\media_src\\周杰伦-专辑\\八度空间\\03 - 暗号.mp3', '87f689830c3b17386c62ce98845da4b0', '暗号', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:05');
INSERT INTO `media_library` VALUES (44, '04 - 龙拳.mp3', 'D:\\media_src\\周杰伦-专辑\\八度空间\\04 - 龙拳.mp3', '303c7998dfc621dce8621c618c727fbc', '龙拳', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:05');
INSERT INTO `media_library` VALUES (45, '05 - 火车叨位去.mp3', 'D:\\media_src\\周杰伦-专辑\\八度空间\\05 - 火车叨位去.mp3', 'fb6c631c4d3a09984d6f0e4677ba4164', '火车叨位去', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:05');
INSERT INTO `media_library` VALUES (46, '06 - 分裂(离开).mp3', 'D:\\media_src\\周杰伦-专辑\\八度空间\\06 - 分裂(离开).mp3', '5749dbafed7fe0bceb96a23baaa10803', '分裂(离开)', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:05');
INSERT INTO `media_library` VALUES (47, '07 - 爷爷泡的茶.mp3', 'D:\\media_src\\周杰伦-专辑\\八度空间\\07 - 爷爷泡的茶.mp3', '2da51852a10251612b2bcd56d6a51548', '爷爷泡的茶', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:05');
INSERT INTO `media_library` VALUES (48, '08 - 回到过去.mp3', 'D:\\media_src\\周杰伦-专辑\\八度空间\\08 - 回到过去.mp3', '2eb0db22f20d3268d06a0d9f524791ae', ' 回到过去', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:05');
INSERT INTO `media_library` VALUES (49, '09 - 米兰的小铁匠.mp3', 'D:\\media_src\\周杰伦-专辑\\八度空间\\09 - 米兰的小铁匠.mp3', '60c3dda5faa23c131da99522f24f296a', '米兰的小铁匠', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:05');
INSERT INTO `media_library` VALUES (50, '10 - 最后的战役.mp3', 'D:\\media_src\\周杰伦-专辑\\八度空间\\10 - 最后的战役.mp3', '6e2f55e65ab644234495d961c2cffac1', '最后的战役', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:05');
INSERT INTO `media_library` VALUES (51, '01 - 夜曲.mp3', 'D:\\media_src\\周杰伦-专辑\\十一月的萧邦\\01 - 夜曲.mp3', 'e182ad739ce3c9c4159194ab645f0a6a', '夜曲', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:05');
INSERT INTO `media_library` VALUES (52, '02 - 蓝色风暴.mp3', 'D:\\media_src\\周杰伦-专辑\\十一月的萧邦\\02 - 蓝色风暴.mp3', '8ea6f2635de315d71594727186fe56d7', '蓝色风暴', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:05');
INSERT INTO `media_library` VALUES (53, '03 - 发如雪.mp3', 'D:\\media_src\\周杰伦-专辑\\十一月的萧邦\\03 - 发如雪.mp3', '4e83404d6e8c12b49d63e35db490095f', ' 发如雪', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:05');
INSERT INTO `media_library` VALUES (54, '04 - 黑色毛衣.mp3', 'D:\\media_src\\周杰伦-专辑\\十一月的萧邦\\04 - 黑色毛衣.mp3', '3cbd491d6b7ee46f3625035e287da3d1', '黑色毛衣', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:06');
INSERT INTO `media_library` VALUES (55, '05 - 四面楚歌.mp3', 'D:\\media_src\\周杰伦-专辑\\十一月的萧邦\\05 - 四面楚歌.mp3', 'c27c4c39a314487968c21f6bcbeae2b0', '四面楚歌', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:06');
INSERT INTO `media_library` VALUES (56, '06 - 枫.mp3', 'D:\\media_src\\周杰伦-专辑\\十一月的萧邦\\06 - 枫.mp3', '543dd8de224963ccc3e59c0b59eae3f6', '枫', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:06');
INSERT INTO `media_library` VALUES (57, '07 - 浪漫手机.mp3', 'D:\\media_src\\周杰伦-专辑\\十一月的萧邦\\07 - 浪漫手机.mp3', 'c9d4e3da0f92a375c0cf59c3b5c3884', '浪漫手机', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:06');
INSERT INTO `media_library` VALUES (58, '08 - 逆鳞.mp3', 'D:\\media_src\\周杰伦-专辑\\十一月的萧邦\\08 - 逆鳞.mp3', '38008091021a12a3f88eb0dd6f676018', '逆鳞', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:06');
INSERT INTO `media_library` VALUES (59, '09 - 麦芽糖.mp3', 'D:\\media_src\\周杰伦-专辑\\十一月的萧邦\\09 - 麦芽糖.mp3', '7faef8f5f8b1ca335849c0b0ae0f9b5f', '麦芽糖', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:06');
INSERT INTO `media_library` VALUES (60, '10 - 珊瑚海，微信公众号，凯子影视站.mp3', 'D:\\media_src\\周杰伦-专辑\\十一月的萧邦\\10 - 珊瑚海，微信公众号，凯子影视站.mp3', 'b50aab76e1d906aec49e85fcf1fdceb5', '珊瑚海', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:06');
INSERT INTO `media_library` VALUES (61, '11 - 飘移.mp3', 'D:\\media_src\\周杰伦-专辑\\十一月的萧邦\\11 - 飘移.mp3', '3a3bb75b89999fd91328ed460d9623d7', '飘移', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:06');
INSERT INTO `media_library` VALUES (62, '12 - 一路向北.mp3', 'D:\\media_src\\周杰伦-专辑\\十一月的萧邦\\12 - 一路向北.mp3', '91f34b3fe077fa6a4fff1f3c452335e4', ' 一路向北', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:06');
INSERT INTO `media_library` VALUES (63, '01 - 四季列车.mp3', 'D:\\media_src\\周杰伦-专辑\\十二新作\\01 - 四季列车.mp3', 'fe15e34a9889336f8455242a1304dc', ' 四季列车', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:06');
INSERT INTO `media_library` VALUES (64, '02 - 手语.mp3', 'D:\\media_src\\周杰伦-专辑\\十二新作\\02 - 手语.mp3', '1e6fc1cd515fc6f6f1d081b781d96fd6', '手语', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:06');
INSERT INTO `media_library` VALUES (65, '03 - 公公偏头痛.mp3', 'D:\\media_src\\周杰伦-专辑\\十二新作\\03 - 公公偏头痛.mp3', '849317f535041eda6995429d40dad483', '公公偏头痛', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:06');
INSERT INTO `media_library` VALUES (66, '04 - 明明就.mp3', 'D:\\media_src\\周杰伦-专辑\\十二新作\\04 - 明明就.mp3', 'fec1e6d2f1398d49b0ab4c443a645f39', '明明就', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:06');
INSERT INTO `media_library` VALUES (67, '05 - 傻笑.mp3', 'D:\\media_src\\周杰伦-专辑\\十二新作\\05 - 傻笑.mp3', '891c20e135a20185436f356bf255c09b', '傻笑', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:06');
INSERT INTO `media_library` VALUES (68, '06 - 比较大的大提琴.mp3', 'D:\\media_src\\周杰伦-专辑\\十二新作\\06 - 比较大的大提琴.mp3', '319fa183969d8831d66b344dd4a49cfe', '比较大的大提琴', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:06');
INSERT INTO `media_library` VALUES (69, '07 - 爱你没差.mp3', 'D:\\media_src\\周杰伦-专辑\\十二新作\\07 - 爱你没差.mp3', '71193238ccb7c2c7a86ecf05f80797fc', '爱你没差', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:06');
INSERT INTO `media_library` VALUES (70, '08 - 红尘客栈.mp3', 'D:\\media_src\\周杰伦-专辑\\十二新作\\08 - 红尘客栈.mp3', '3f7e0678e30fe9f01cc3c4cd4eb354ec', '红尘客栈', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:06');
INSERT INTO `media_library` VALUES (71, '09 - 梦想启动.mp3', 'D:\\media_src\\周杰伦-专辑\\十二新作\\09 - 梦想启动.mp3', 'cd7b656764a23afd145b2387227f0560', '梦想启动', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:06');
INSERT INTO `media_library` VALUES (72, '10 - 大笨钟.mp3', 'D:\\media_src\\周杰伦-专辑\\十二新作\\10 - 大笨钟.mp3', 'ef7840a45ec5ced72d4aed57d030614f', '大笨钟', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:07');
INSERT INTO `media_library` VALUES (73, '11 - 哪里都是你.mp3', 'D:\\media_src\\周杰伦-专辑\\十二新作\\11 - 哪里都是你.mp3', '3eefb95165a0abdfccc5f91da617e1bb', '哪里都是你', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:07');
INSERT INTO `media_library` VALUES (74, '12 - 乌克丽丽.mp3', 'D:\\media_src\\周杰伦-专辑\\十二新作\\12 - 乌克丽丽.mp3', '17260cd3214309ba5531db058cf26175', '乌克丽丽', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:07');
INSERT INTO `media_library` VALUES (75, '01 - 以父之名.mp3', 'D:\\media_src\\周杰伦-专辑\\叶惠美\\01 - 以父之名.mp3', '36e6aaeb5b3fd1295911ea3f351e3216', '以父之名', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:07');
INSERT INTO `media_library` VALUES (76, '02 - 懦夫.mp3', 'D:\\media_src\\周杰伦-专辑\\叶惠美\\02 - 懦夫.mp3', '97f64afe9131af7c1882bdfb51bf82aa', '懦夫', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:07');
INSERT INTO `media_library` VALUES (77, '03 - 晴天.mp3', 'D:\\media_src\\周杰伦-专辑\\叶惠美\\03 - 晴天.mp3', '756a2260341937a5b3bf2b68eed0a979', '晴天', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:07');
INSERT INTO `media_library` VALUES (78, '04 - 三年二班.mp3', 'D:\\media_src\\周杰伦-专辑\\叶惠美\\04 - 三年二班.mp3', '3c6487c3324c2d24752207a4a7cf237', '三年二班', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:07');
INSERT INTO `media_library` VALUES (79, '05 - 东风破.mp3', 'D:\\media_src\\周杰伦-专辑\\叶惠美\\05 - 东风破.mp3', '89eceab5d5e1c6beae2977bcf1242c3c', '东风破', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:07');
INSERT INTO `media_library` VALUES (80, '06 - 你听得到.mp3', 'D:\\media_src\\周杰伦-专辑\\叶惠美\\06 - 你听得到.mp3', '79d645f2a70cdb7e935e8d0830045ede', '你听得到', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:07');
INSERT INTO `media_library` VALUES (81, '07 - 同一种调调.mp3', 'D:\\media_src\\周杰伦-专辑\\叶惠美\\07 - 同一种调调.mp3', '19aaf9c27a56a19b3b6a3dc288c03abd', '同一种调调', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:07');
INSERT INTO `media_library` VALUES (82, '08 - 她的睫毛.mp3', 'D:\\media_src\\周杰伦-专辑\\叶惠美\\08 - 她的睫毛.mp3', '940a6aae03dc802b62c03352e5d64983', '她的睫毛', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:07');
INSERT INTO `media_library` VALUES (83, '09 - 爱情悬崖.mp3', 'D:\\media_src\\周杰伦-专辑\\叶惠美\\09 - 爱情悬崖.mp3', '9c5854a5e097a72ee906ab7e8ddc6464', '爱情悬崖', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:07');
INSERT INTO `media_library` VALUES (84, '10 - 梯田.mp3', 'D:\\media_src\\周杰伦-专辑\\叶惠美\\10 - 梯田.mp3', '1c85cebcac65800b4fc2eb15c69efe23', '梯田', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:07');
INSERT INTO `media_library` VALUES (85, '11 - 双刀.mp3', 'D:\\media_src\\周杰伦-专辑\\叶惠美\\11 - 双刀.mp3', '299a3b1480e04d0a4b02594888b7051d', '双刀', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:07');
INSERT INTO `media_library` VALUES (86, '周杰伦-Now You See Me(《惊天魔盗团2》电影全球主题曲).mp3', 'D:\\media_src\\周杰伦-专辑\\周杰伦新专辑床边故事\\周杰伦-Now You See Me(《惊天魔盗团2》电影全球主题曲).mp3', '85c25a2636919704f0274297193b3569', 'Now You See Me(《惊天魔盗团2》电影全球主题曲)', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:07');
INSERT INTO `media_library` VALUES (87, '周杰伦-一点点.mp3', 'D:\\media_src\\周杰伦-专辑\\周杰伦新专辑床边故事\\周杰伦-一点点.mp3', '41ace61c8fcba60213d05ebda8193365', '一点点', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:07');
INSERT INTO `media_library` VALUES (88, '周杰伦-不该.mp3', 'D:\\media_src\\周杰伦-专辑\\周杰伦新专辑床边故事\\周杰伦-不该.mp3', 'c5462653dd3f2ac70db10c5002f60ab3', '不该', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:07');
INSERT INTO `media_library` VALUES (89, '周杰伦-前世情人.mp3', 'D:\\media_src\\周杰伦-专辑\\周杰伦新专辑床边故事\\周杰伦-前世情人.mp3', '4dbab8c855f28a6645fe7eb2707d06ff', '前世情人', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:07');
INSERT INTO `media_library` VALUES (90, '周杰伦-告白气球.mp3', 'D:\\media_src\\周杰伦-专辑\\周杰伦新专辑床边故事\\周杰伦-告白气球.mp3', '49cdce03a8239e5a4ee0c87bbc6a4b0a', '告白气球', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:07');
INSERT INTO `media_library` VALUES (91, '周杰伦-土耳其冰淇淋.mp3', 'D:\\media_src\\周杰伦-专辑\\周杰伦新专辑床边故事\\周杰伦-土耳其冰淇淋.mp3', '9d240d02d188b1dd3581d7d0a0009462', '土耳其冰淇淋', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:07');
INSERT INTO `media_library` VALUES (92, '周杰伦-床边故事.mp3', 'D:\\media_src\\周杰伦-专辑\\周杰伦新专辑床边故事\\周杰伦-床边故事.mp3', 'aa1a8cf83efd2861f0729cd5cb417c7e', '床边故事', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:08');
INSERT INTO `media_library` VALUES (93, '周杰伦-爱情废柴.mp3', 'D:\\media_src\\周杰伦-专辑\\周杰伦新专辑床边故事\\周杰伦-爱情废柴.mp3', 'd8077f39eb1de0db265b9810a3d3e39d', '爱情废柴', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:08');
INSERT INTO `media_library` VALUES (94, '周杰伦-英雄(《英雄联盟》中国品牌主题曲).mp3', 'D:\\media_src\\周杰伦-专辑\\周杰伦新专辑床边故事\\周杰伦-英雄(《英雄联盟》中国品牌主题曲).mp3', '6ef801c025b6aca870b1e392fbfbc6c1', '英雄(《英雄联盟》中国品牌主题曲)', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:08');
INSERT INTO `media_library` VALUES (95, '周杰伦-说走就走.mp3', 'D:\\media_src\\周杰伦-专辑\\周杰伦新专辑床边故事\\周杰伦-说走就走.mp3', 'ee15ea8d15d0fd20c344de01cbbc7f94', '说走就走', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:08');
INSERT INTO `media_library` VALUES (96, '01 - 阳明山.mp3', 'D:\\media_src\\周杰伦-专辑\\哎呦，不错哦\\01 - 阳明山.mp3', '80c90871bddb14d9d397242c92dfe59b', '阳明山', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:08');
INSERT INTO `media_library` VALUES (97, '02 - 窃爱.mp3', 'D:\\media_src\\周杰伦-专辑\\哎呦，不错哦\\02 - 窃爱.mp3', '7f78344b37261142a19770487a26feea', '窃爱', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:08');
INSERT INTO `media_library` VALUES (98, '03 - 算什么男人.mp3', 'D:\\media_src\\周杰伦-专辑\\哎呦，不错哦\\03 - 算什么男人.mp3', 'ad5555888fa5afc0a9faab558fa4ed1c', '算什么男人', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:08');
INSERT INTO `media_library` VALUES (99, '04 - 天涯过客.mp3', 'D:\\media_src\\周杰伦-专辑\\哎呦，不错哦\\04 - 天涯过客.mp3', '4fd8c7d90466cfd21fb4013e2be28e4', '天涯过客', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:08');
INSERT INTO `media_library` VALUES (100, '05 - 怎么了.mp3', 'D:\\media_src\\周杰伦-专辑\\哎呦，不错哦\\05 - 怎么了.mp3', 'd0e8cc039e7e587153b7b9c27cf982f6', '怎么了', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:08');
INSERT INTO `media_library` VALUES (101, '06 - 一口气全念对.mp3', 'D:\\media_src\\周杰伦-专辑\\哎呦，不错哦\\06 - 一口气全念对.mp3', '5a970e52adbbf5261114b06039a5299d', ' 一口气全念对', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:08');
INSERT INTO `media_library` VALUES (102, '07 - 我要夏天.mp3', 'D:\\media_src\\周杰伦-专辑\\哎呦，不错哦\\07 - 我要夏天.mp3', 'eb7cae7f51bf7148f12fd843efc7f5c0', '我要夏天', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:08');
INSERT INTO `media_library` VALUES (103, '08 - 手写的从前.mp3', 'D:\\media_src\\周杰伦-专辑\\哎呦，不错哦\\08 - 手写的从前.mp3', 'c663b240b8c200da3e2dcd41e799c5c6', '手写的从前', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:08');
INSERT INTO `media_library` VALUES (104, '09 - 鞋子特大号.mp3', 'D:\\media_src\\周杰伦-专辑\\哎呦，不错哦\\09 - 鞋子特大号.mp3', '4648884149f0b7d03f3c68229a97ff21', '鞋子特大号', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:08');
INSERT INTO `media_library` VALUES (105, '10 - 听爸爸的话.mp3', 'D:\\media_src\\周杰伦-专辑\\哎呦，不错哦\\10 - 听爸爸的话.mp3', '264adab0c0dd3bee30b51402c11eb49a', '听爸爸的话', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:08');
INSERT INTO `media_library` VALUES (106, '11 - 美人鱼.mp3', 'D:\\media_src\\周杰伦-专辑\\哎呦，不错哦\\11 - 美人鱼.mp3', '27a7ad05cd7322083c99558d3bb8052a', '美人鱼', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:08');
INSERT INTO `media_library` VALUES (107, '12 - 听见下雨的声音.mp3', 'D:\\media_src\\周杰伦-专辑\\哎呦，不错哦\\12 - 听见下雨的声音.mp3', 'a9ed05320c090968ce11cabb27db37e6', '听见下雨的声音', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:08');
INSERT INTO `media_library` VALUES (108, '01 - 轨迹.mp3', 'D:\\media_src\\周杰伦-专辑\\寻找周杰伦\\01 - 轨迹.mp3', '1eb53c123eb89a381a19f9784b03fae7', '轨迹', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:08');
INSERT INTO `media_library` VALUES (109, '02 - 断了的弦.mp3', 'D:\\media_src\\周杰伦-专辑\\寻找周杰伦\\02 - 断了的弦.mp3', '98e2b617f3afbe24df72a831ad42c6c0', '断了的弦', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:08');
INSERT INTO `media_library` VALUES (110, '周杰伦 - Mine Mine.mp3', 'D:\\media_src\\周杰伦-专辑\\惊叹号\\周杰伦 - Mine Mine.mp3', '9569da860ba30bff80cb62ce34a428d4', 'Mine Mine', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:08');
INSERT INTO `media_library` VALUES (111, '周杰伦 - 世界未末日.mp3', 'D:\\media_src\\周杰伦-专辑\\惊叹号\\周杰伦 - 世界未末日.mp3', 'd8759d5dc31731ac285baa05aef11292', '世界未末日', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:08');
INSERT INTO `media_library` VALUES (112, '周杰伦 - 你好吗.mp3', 'D:\\media_src\\周杰伦-专辑\\惊叹号\\周杰伦 - 你好吗.mp3', '26153c7dae6ec838e499f55fb3a5ab5a', '你好吗', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:08');
INSERT INTO `media_library` VALUES (113, '周杰伦 - 公主病.mp3', 'D:\\media_src\\周杰伦-专辑\\惊叹号\\周杰伦 - 公主病.mp3', '5b69cee6e58ce4ef65c217c3684f7fc2', '公主病', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:08');
INSERT INTO `media_library` VALUES (114, '周杰伦 - 惊叹号.mp3', 'D:\\media_src\\周杰伦-专辑\\惊叹号\\周杰伦 - 惊叹号.mp3', '7872870cc9c90d036ede4fb4bee5afa9', '惊叹号', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:08');
INSERT INTO `media_library` VALUES (115, '周杰伦 - 水手怕水.mp3', 'D:\\media_src\\周杰伦-专辑\\惊叹号\\周杰伦 - 水手怕水.mp3', 'ff971fb25f667a6e9d4fb3928822a2ed', '水手怕水', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:08');
INSERT INTO `media_library` VALUES (116, '周杰伦 - 琴伤.mp3', 'D:\\media_src\\周杰伦-专辑\\惊叹号\\周杰伦 - 琴伤.mp3', '9233642615ce7a58862c073dcf02ccba', '琴伤', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:09');
INSERT INTO `media_library` VALUES (117, '周杰伦 - 疗伤烧肉粽.mp3', 'D:\\media_src\\周杰伦-专辑\\惊叹号\\周杰伦 - 疗伤烧肉粽.mp3', '6ae0650d08db2363a44043adb5dc38f6', '疗伤烧肉粽', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:09');
INSERT INTO `media_library` VALUES (118, '周杰伦 - 皮影戏.mp3', 'D:\\media_src\\周杰伦-专辑\\惊叹号\\周杰伦 - 皮影戏.mp3', '8863b88fcac5093080aa4e49ab34ccb', '皮影戏', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:09');
INSERT INTO `media_library` VALUES (119, '周杰伦 - 超跑女神.mp3', 'D:\\media_src\\周杰伦-专辑\\惊叹号\\周杰伦 - 超跑女神.mp3', 'a2e3065408da2deeb8e002b03df23702', '超跑女神', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:09');
INSERT INTO `media_library` VALUES (120, '周杰伦 - 迷魂曲.mp3', 'D:\\media_src\\周杰伦-专辑\\惊叹号\\周杰伦 - 迷魂曲.mp3', 'f1123c56b2d2de11626a0eaa5f2ba35d', '迷魂曲', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:09');
INSERT INTO `media_library` VALUES (121, '01 - 牛仔很忙.mp3', 'D:\\media_src\\周杰伦-专辑\\我很忙\\01 - 牛仔很忙.mp3', '8b600f35978d7a5702e9d8add1a6725e', '牛仔很忙', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:09');
INSERT INTO `media_library` VALUES (122, '02 - 彩虹.mp3', 'D:\\media_src\\周杰伦-专辑\\我很忙\\02 - 彩虹.mp3', '98a60c0c5a5aae0f047ccef4adbfab1e', '彩虹', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:09');
INSERT INTO `media_library` VALUES (123, '03 - 青花瓷.mp3', 'D:\\media_src\\周杰伦-专辑\\我很忙\\03 - 青花瓷.mp3', '18585ffe7f80f8844177fe4d2ca0d1a1', '青花瓷', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:09');
INSERT INTO `media_library` VALUES (124, '04 - 阳光宅男.mp3', 'D:\\media_src\\周杰伦-专辑\\我很忙\\04 - 阳光宅男.mp3', 'f9d49c8eee665db01c92f2add688ff5c', '阳光宅男', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:09');
INSERT INTO `media_library` VALUES (125, '05 - 蒲公英的约定.mp3', 'D:\\media_src\\周杰伦-专辑\\我很忙\\05 - 蒲公英的约定.mp3', 'd22cc0aae6e458dbd831b726018280b5', '蒲公英的约定', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:09');
INSERT INTO `media_library` VALUES (126, '06 - 无双.mp3', 'D:\\media_src\\周杰伦-专辑\\我很忙\\06 - 无双.mp3', 'ef680c87b60e67eb8292885d80344399', '无双', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:09');
INSERT INTO `media_library` VALUES (127, '08 - 扯.mp3', 'D:\\media_src\\周杰伦-专辑\\我很忙\\08 - 扯.mp3', '8a86f8f2e83008bca271bc3c2852dde8', '扯', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:09');
INSERT INTO `media_library` VALUES (128, '09 - 甜甜的.mp3', 'D:\\media_src\\周杰伦-专辑\\我很忙\\09 - 甜甜的.mp3', '7274ba0bb71aee628d129b6ec0637d55', '甜甜的', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:09');
INSERT INTO `media_library` VALUES (129, '10 - 最长的电影.mp3', 'D:\\media_src\\周杰伦-专辑\\我很忙\\10 - 最长的电影.mp3', 'c181213ea73069dc21b3091988722614', '最长的电影', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:09');
INSERT INTO `media_library` VALUES (130, '周杰伦 - 我不配.mp3', 'D:\\media_src\\周杰伦-专辑\\我很忙\\周杰伦 - 我不配.mp3', 'caa921fd5b30feefbb7d782dfc88cada', '我不配', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:09');
INSERT INTO `media_library` VALUES (131, '01 - 爱在西元前.mp3', 'D:\\media_src\\周杰伦-专辑\\范特西\\01 - 爱在西元前.mp3', '7b975bca216f3f55dd7ab2e6bedbc0b0', '爱在西元前', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:09');
INSERT INTO `media_library` VALUES (132, '02 - 爸我回来了.mp3', 'D:\\media_src\\周杰伦-专辑\\范特西\\02 - 爸我回来了.mp3', '1a15baa0b12b8179960ad8286c884b41', '爸我回来了', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:09');
INSERT INTO `media_library` VALUES (133, '03 - 简单爱.mp3', 'D:\\media_src\\周杰伦-专辑\\范特西\\03 - 简单爱.mp3', 'd24ee54688714898addee815af5e1a86', '简单爱', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:09');
INSERT INTO `media_library` VALUES (134, '04 - 忍者.mp3', 'D:\\media_src\\周杰伦-专辑\\范特西\\04 - 忍者.mp3', '443eb0623f16d996046a9a39c2fb3932', '忍者', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:09');
INSERT INTO `media_library` VALUES (135, '05 - 开不了口.mp3', 'D:\\media_src\\周杰伦-专辑\\范特西\\05 - 开不了口.mp3', '22e4146f6170a0c18511c3d9b3650314', '开不了口', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:09');
INSERT INTO `media_library` VALUES (136, '06 - 上海一九四三.mp3', 'D:\\media_src\\周杰伦-专辑\\范特西\\06 - 上海一九四三.mp3', 'aa41e84ef12ab9b69b252167b41bf619', '上海一九四三', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:09');
INSERT INTO `media_library` VALUES (137, '07 - 对不起.mp3', 'D:\\media_src\\周杰伦-专辑\\范特西\\07 - 对不起.mp3', 'aa4e6cf0bc4443b9e7be0222096465cd', '对不起', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:09');
INSERT INTO `media_library` VALUES (138, '08 - 威廉古堡.mp3', 'D:\\media_src\\周杰伦-专辑\\范特西\\08 - 威廉古堡.mp3', '978f896fe4b9f454c8bb675171197abe', '威廉古堡', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:09');
INSERT INTO `media_library` VALUES (139, '09 - 双截棍，微信公众号，凯子影视站.mp3', 'D:\\media_src\\周杰伦-专辑\\范特西\\09 - 双截棍，微信公众号，凯子影视站.mp3', 'cd09daaf072724d703b4be6cae86f998', '双截棍', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:09');
INSERT INTO `media_library` VALUES (140, '10 - 安静.mp3', 'D:\\media_src\\周杰伦-专辑\\范特西\\10 - 安静.mp3', 'ff0f96fc7c8650393111ad48c488d86c', '安静', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:10');
INSERT INTO `media_library` VALUES (141, '01 - 蜗牛.mp3', 'D:\\media_src\\周杰伦-专辑\\范特西Plus\\01 - 蜗牛.mp3', '2312461a474795b8ca9fe4b2ad5dd31e', '蜗牛', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:10');
INSERT INTO `media_library` VALUES (142, '02 - 你比从前快乐.mp3', 'D:\\media_src\\周杰伦-专辑\\范特西Plus\\02 - 你比从前快乐.mp3', '6942d779f1290d484acb0b0a326444cc', '你比从前快乐', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:10');
INSERT INTO `media_library` VALUES (143, '03 - 世界末日.mp3', 'D:\\media_src\\周杰伦-专辑\\范特西Plus\\03 - 世界末日.mp3', 'f193abb24772bb5ea47d622602639c72', '世界末日', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:10');
INSERT INTO `media_library` VALUES (144, '01 - 跨时代.mp3', 'D:\\media_src\\周杰伦-专辑\\跨时代\\01 - 跨时代.mp3', '2dbba4de77a9ff44b9fd63e16df03151', '跨时代', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:10');
INSERT INTO `media_library` VALUES (145, '02 - 说了再见.mp3', 'D:\\media_src\\周杰伦-专辑\\跨时代\\02 - 说了再见.mp3', '81f89444a215a3497a363f8a60bf4b14', '说了再见', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:10');
INSERT INTO `media_library` VALUES (146, '03 - 烟花易冷.mp3', 'D:\\media_src\\周杰伦-专辑\\跨时代\\03 - 烟花易冷.mp3', 'f8116ec841b8375ef4eefed94977cc40', '烟花易冷', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:10');
INSERT INTO `media_library` VALUES (147, '05 - 免费教学录像带 - （内地版）.mp3', 'D:\\media_src\\周杰伦-专辑\\跨时代\\05 - 免费教学录像带 - （内地版）.mp3', 'a2db4918e5360d8b0c909c7e55d7162a', '免费教学录像带 - （内地版）', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:10');
INSERT INTO `media_library` VALUES (148, '06 - 好久不见.mp3', 'D:\\media_src\\周杰伦-专辑\\跨时代\\06 - 好久不见.mp3', '6e5c298f33d5f9bc64bf22347495ef5d', '好久不见', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:10');
INSERT INTO `media_library` VALUES (149, '07 - 雨下一整晚.mp3', 'D:\\media_src\\周杰伦-专辑\\跨时代\\07 - 雨下一整晚.mp3', '418577153bb5525d18c7fc78ee08b0d0', '雨下一整晚', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:10');
INSERT INTO `media_library` VALUES (150, '08 - 嘻哈空姐.mp3', 'D:\\media_src\\周杰伦-专辑\\跨时代\\08 - 嘻哈空姐.mp3', '9e5865992879b6ec906b31905df3527f', '嘻哈空姐', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:10');
INSERT INTO `media_library` VALUES (151, '09 - 我落泪 情绪零碎.mp3', 'D:\\media_src\\周杰伦-专辑\\跨时代\\09 - 我落泪 情绪零碎.mp3', '3e2bbbcd785280ca0724a30d5c2afa59', '我落泪 情绪零碎', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:10');
INSERT INTO `media_library` VALUES (152, '10 - 爱的飞行日记.mp3', 'D:\\media_src\\周杰伦-专辑\\跨时代\\10 - 爱的飞行日记.mp3', '99b127f00d341105d4a14c4b1ec4f426', '爱的飞行日记', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:10');
INSERT INTO `media_library` VALUES (153, '11 - 自导自演.mp3', 'D:\\media_src\\周杰伦-专辑\\跨时代\\11 - 自导自演.mp3', '4c1d9cdbf7719638a9f713a137f609d5', '自导自演', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:10');
INSERT INTO `media_library` VALUES (154, '13 - 超人不会飞 - (内地版).mp3', 'D:\\media_src\\周杰伦-专辑\\跨时代\\13 - 超人不会飞 - (内地版).mp3', '19507d2b94a5f2306414eca0b9e0214b', '超人不会飞 - (内地版)', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:10');
INSERT INTO `media_library` VALUES (155, '周杰伦 - 献世 (Live).mp3', 'D:\\media_src\\周杰伦-专辑\\霍元甲\\周杰伦 - 献世 (Live).mp3', '11dbfa82ac5293c5e4e1c8abd5ff24bb', '献世 (Live)', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:10');
INSERT INTO `media_library` VALUES (156, '周杰伦 - 霍元甲 (《霍元甲》电影主题曲).mp3', 'D:\\media_src\\周杰伦-专辑\\霍元甲\\周杰伦 - 霍元甲 (《霍元甲》电影主题曲).mp3', 'f5c8a729371091040f59f520f8e07c51', '霍元甲 (《霍元甲》电影主题曲)', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:10');
INSERT INTO `media_library` VALUES (157, '01 - 龙战骑士.mp3', 'D:\\media_src\\周杰伦-专辑\\魔杰座\\01 - 龙战骑士.mp3', '9374e19ba395804f84a121b72ce78c7f', '龙战骑士', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:10');
INSERT INTO `media_library` VALUES (158, '02 - 给我一首歌的时间.mp3', 'D:\\media_src\\周杰伦-专辑\\魔杰座\\02 - 给我一首歌的时间.mp3', 'ee50f8a069d4a3b65358ed782501ea99', '给我一首歌的时间', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:10');
INSERT INTO `media_library` VALUES (159, '03 - 蛇舞.mp3', 'D:\\media_src\\周杰伦-专辑\\魔杰座\\03 - 蛇舞.mp3', '177b4356d7a51bcc6385ab3cefc7f4ab', '蛇舞', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:10');
INSERT INTO `media_library` VALUES (160, '04 - 花海.mp3', 'D:\\media_src\\周杰伦-专辑\\魔杰座\\04 - 花海.mp3', '1a31eecc6935c4f3003c0fafb1fd2806', '花海', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:10');
INSERT INTO `media_library` VALUES (161, '05 - 魔术先生.mp3', 'D:\\media_src\\周杰伦-专辑\\魔杰座\\05 - 魔术先生.mp3', 'f30d24a0cf1951e5c017ce2529ae0e99', '魔术先生', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:11');
INSERT INTO `media_library` VALUES (162, '07 - 兰亭序.mp3', 'D:\\media_src\\周杰伦-专辑\\魔杰座\\07 - 兰亭序.mp3', '564b33877695f47e4b8c8db596d225ac', '兰亭序', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:11');
INSERT INTO `media_library` VALUES (163, '08 - 流浪诗人.mp3', 'D:\\media_src\\周杰伦-专辑\\魔杰座\\08 - 流浪诗人.mp3', 'cd0cec5485c85bbee25ac1c907f06d55', '流浪诗人', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:11');
INSERT INTO `media_library` VALUES (164, '09 - 时光机.mp3', 'D:\\media_src\\周杰伦-专辑\\魔杰座\\09 - 时光机.mp3', 'c1b4bd2d1b762f13dbb19e37bb218de8', '时光机', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:11');
INSERT INTO `media_library` VALUES (165, '10 - 乔克叔叔.mp3', 'D:\\media_src\\周杰伦-专辑\\魔杰座\\10 - 乔克叔叔.mp3', 'ae4343c78807e4ad27f3a78ec94f50fc', '乔克叔叔', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:11');
INSERT INTO `media_library` VALUES (166, '11 - 稻香.mp3', 'D:\\media_src\\周杰伦-专辑\\魔杰座\\11 - 稻香.mp3', 'ef1d0bfd144ae6c0e71ee0a3f42de556', '稻香', '音频mp3', '周杰伦', '蓝调', '2020-06-03 16:16:11');
INSERT INTO `media_library` VALUES (167, '周杰伦 - 说好的幸福呢.mp3', 'D:\\media_src\\周杰伦-专辑\\魔杰座\\周杰伦 - 说好的幸福呢.mp3', '8fa4526e785ba4c5c754cbb9fdd68cf3', '说好的幸福呢', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:11');
INSERT INTO `media_library` VALUES (168, '周杰伦 - 菊花台 (杰伦钢琴演奏版).mp3', 'D:\\media_src\\周杰伦-专辑\\黄金甲\\周杰伦 - 菊花台 (杰伦钢琴演奏版).mp3', 'c96a43a6732274b045b77eb1033a7674', '菊花台 (杰伦钢琴演奏版)', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:11');
INSERT INTO `media_library` VALUES (169, '周杰伦 - 黄金甲.mp3', 'D:\\media_src\\周杰伦-专辑\\黄金甲\\周杰伦 - 黄金甲.mp3', '6632ee99f808330c3ab624c5455cb549', '黄金甲', '音频mp3', '周杰伦', '流行', '2020-06-03 16:16:11');
INSERT INTO `media_library` VALUES (179, '金玟岐 - 岁月神偷.mp3', 'D:\\media_src\\金玟岐 - 岁月神偷.mp3', '334bfb94a170da927349ea0ab94d1162', ' 岁月神偷', '音频mp3', '金玟岐', '流行', '2020-06-08 23:22:39');
INSERT INTO `media_library` VALUES (181, 'Akie秋绘 - 心拍数♯0822.mp3', 'D:\\media_src\\Akie秋绘 - 心拍数♯0822.mp3', 'cb09a667e9be5ac157795ac698ab5729', ' 心拍数♯0822', '音频mp3', 'Akie秋绘', '流行', '2020-06-08 23:45:43');
INSERT INTO `media_library` VALUES (182, 'Approaching Nirvana - You.mp3', 'D:\\media_src\\Approaching Nirvana - You.mp3', 'f40bf7c8bce2fac2c3e3ccf925b4c6bf', 'You', '音频mp3', '未知艺术家', '电子', '2020-06-08 23:45:44');
INSERT INTO `media_library` VALUES (183, 'DAOKO,米津玄師 - 打上花火.mp3', 'D:\\media_src\\DAOKO,米津玄師 - 打上花火.mp3', '6616b54f5e4bd9e115aef50ba0710c64', '打上花火', '音频mp3', 'DAOKO', '流行', '2020-06-08 23:45:44');
INSERT INTO `media_library` VALUES (184, '薛之谦 - 像风一样.mp3', 'D:\\media_src\\薛之谦 - 像风一样.mp3', '8726b0fdd3b721f94e255db3cb23465e', ' 像风一样', '音频mp3', '薛之谦', '流行', '2020-06-09 11:31:35');
INSERT INTO `media_library` VALUES (190, '小猪佩奇片头.mp4', 'D:\\media_src\\小猪佩奇片头.mp4', 'a44296f7693c4f48abd35005ca2d22e8', '小猪佩奇片头', '视频mp4', '阿斯特利', '儿童', '2020-06-10 00:34:03');
INSERT INTO `media_library` VALUES (192, '咏春MV-武侠.mp4', 'D:\\media_src\\咏春MV-武侠.mp4', 'f177961094c49051e84ca9fcd4b53272', '咏春MV', '视频mp4', '叶伟信', '电影', '2020-06-10 18:48:43');
INSERT INTO `media_library` VALUES (193, '影-武侠.mp4', 'D:\\media_src\\影-武侠.mp4', 'f24943ee1de0b26c92a4ecf5eb163a', '影', '视频mp4', '张艺谋', '电影', '2020-06-10 18:48:45');
INSERT INTO `media_library` VALUES (194, '战狼2-战争.mp4', 'D:\\media_src\\战狼2-战争.mp4', 'e74b9148724ba8760faea984bc55e288', '战狼2', '视频mp4', '吴京', '电影', '2020-06-10 18:48:47');
INSERT INTO `media_library` VALUES (195, '拯救大兵瑞恩-战争.mp4', 'D:\\media_src\\拯救大兵瑞恩-战争.mp4', '840e8cd82d46524c8fadf6af0c3009a9', '拯救大兵瑞恩', '视频mp4', '史蒂文·斯皮尔伯格', '电影', '2020-06-10 18:48:47');
INSERT INTO `media_library` VALUES (196, '红海行动.mp4', 'D:\\media_src\\红海行动.mp4', 'b54c6d70a632ee883030489f644a5da4', '红海行动', '视频mp4', '林超贤', '电影', '2020-06-10 18:48:50');
INSERT INTO `media_library` VALUES (197, '绣春刀-武侠.mp4', 'D:\\media_src\\绣春刀-武侠.mp4', '66f80cba32b8a90143c18e59e9c5477c', '绣春刀', '视频mp4', '路阳', '电影', '2020-06-10 18:48:51');
INSERT INTO `media_library` VALUES (198, '血战钢锯岭-战争.mp4', 'D:\\media_src\\血战钢锯岭-战争.mp4', '498d5b6d698ce7b655ee07f1d1415261', '血战钢锯岭', '视频mp4', '梅尔·吉布森', '电影', '2020-06-10 18:48:52');
INSERT INTO `media_library` VALUES (199, '训鹰者的崛起-战争.mp4', 'D:\\media_src\\训鹰者的崛起-战争.mp4', '71ab1abe1c99271ce230c7132b2ad607', '训鹰者的崛起', '视频mp4', ' 阿希姆特·塞塔布拉耶夫', '电影', '2020-06-10 18:48:55');
INSERT INTO `media_library` VALUES (200, '超级飞侠（英文版）s1-01 [1080P].mp4', 'D:\\media_src\\超级飞侠（英文版）s1-01 [1080P].mp4', '97894990d3a00c33245aca3d9da0807a', '超级飞侠（英文版）', '视频mp4', '李哲航', '儿童', '2020-06-10 18:48:56');
INSERT INTO `media_library` VALUES (201, '追龙-犯罪 .mp4', 'D:\\media_src\\追龙-犯罪 .mp4', 'a8911148044abae235d0fd6c5b1c5975', '追龙', '视频mp4', '关智耀、王晶', '电影', '2020-06-10 18:48:59');
INSERT INTO `media_library` VALUES (202, '黑客能否盗取微信和QQ中的消息？安全的给小姐姐写信的姿势是什么？HTTPS是怎么回事儿？Anduin讲解信息安全之内容传输安全.mp4', 'D:\\media_src\\黑客能否盗取微信和QQ中的消息？安全的给小姐姐写信的姿势是什么？HTTPS是怎么回事儿？Anduin讲解信息安全之内容传输安全.mp4', 'f16674c2f7ae2654485839b522eeee0d', '黑客能否盗取微信和QQ中的消息？安全的给小姐姐写信的姿势是什么？HTTPS是怎么回事儿？Anduin讲解信息安全之内容传输安全', '视频mp4', '初心不忘誓言封存', '学习', '2020-06-10 18:49:00');
INSERT INTO `media_library` VALUES (203, '你的姑娘.mp3', 'D:\\media_src\\你的姑娘.mp3', '4eeba3ec67139de17412186b850c3a70', '你的姑娘', '音频mp3', '隔壁老樊', '民谣', '2020-06-10 23:24:28');
INSERT INTO `media_library` VALUES (204, '四块五 .mp3', 'D:\\media_src\\四块五 .mp3', 'd370955f4e849960557700479ce0b834', '四块五', '音频mp3', '隔壁老樊', '民谣', '2020-06-10 23:24:29');
INSERT INTO `media_library` VALUES (205, '多想在平庸的生活拥抱你 - 隔壁老樊.mp3', 'D:\\media_src\\多想在平庸的生活拥抱你 - 隔壁老樊.mp3', '22d7d76c923b1caaca6e30ca47d0f69', '多想在平庸的生活拥抱你', '音频mp3', '隔壁老樊', '民谣', '2020-06-10 23:24:29');
INSERT INTO `media_library` VALUES (206, '我曾 .mp3', 'D:\\media_src\\我曾 .mp3', 'e7403c0f89ca574eea7dfea2ac7601f5', '我曾', '音频mp3', '隔壁老樊', '民谣', '2020-06-10 23:24:31');
INSERT INTO `media_library` VALUES (207, '这一生关于你的风景 - 隔壁老樊.mp3', 'D:\\media_src\\这一生关于你的风景 - 隔壁老樊.mp3', '8302f4e1f04f8d7d162f1c3db87fd0e7', '这一生关于你的风景', '音频mp3', '隔壁老樊', '民谣', '2020-06-10 23:24:50');
INSERT INTO `media_library` VALUES (208, 'Bloom of Youth - 清水準一.mp3', 'D:\\media_src\\Bloom of Youth - 清水準一.mp3', 'dce22aac17ebf605b2a027d61cb6352b', 'Bloom of Youth', '音频mp3', '清水準', '轻音乐', '2020-06-10 23:32:58');
INSERT INTO `media_library` VALUES (209, 'The truth that you leave - Pianoboy高至豪.mp3', 'D:\\media_src\\The truth that you leave - Pianoboy高至豪.mp3', '57439e13c71a01774fc1dba9ff7be0f0', 'The truth that you leave ', '音频mp3', 'Pianoboy高至豪', '轻音乐', '2020-06-10 23:32:59');
INSERT INTO `media_library` VALUES (210, 'いのちの名前 - 広橋真紀子.mp3', 'D:\\media_src\\いのちの名前 - 広橋真紀子.mp3', '985dd32dd00aebe5badd220a479a94a7', 'いのちの名前', '音频mp3', '広橋真紀子', '轻音乐', '2020-06-10 23:32:59');
INSERT INTO `media_library` VALUES (211, '城南花已开 - 三亩地.mp3', 'D:\\media_src\\城南花已开 - 三亩地.mp3', 'dba327776596fa419e3c8fa6d4c4de43', '城南花已开', '音频mp3', '三亩地', '轻音乐', '2020-06-10 23:33:01');
INSERT INTO `media_library` VALUES (212, '安静的午后 - Pianoboy高至豪.mp3', 'D:\\media_src\\安静的午后 - Pianoboy高至豪.mp3', 'fee298cc681b0fbe7713acc9a4299e93', '安静的午后 ', '音频mp3', 'Pianoboy高至豪', '轻音乐', '2020-06-10 23:33:02');
INSERT INTO `media_library` VALUES (213, '所念皆星河 - CMJ.mp3', 'D:\\media_src\\所念皆星河 - CMJ.mp3', '5fcded78c7a8df3f91e404ddbdaf226b', '所念皆星河', '音频mp3', 'CMJ', '轻音乐', '2020-06-10 23:33:06');
INSERT INTO `media_library` VALUES (214, '風の住む街 - 磯村由紀子.mp3', 'D:\\media_src\\風の住む街 - 磯村由紀子.mp3', '72427d02036b0e2bd7c329ee0bb9eacd', '風の住む街', '音频mp3', '磯村由紀子', '轻音乐', '2020-06-10 23:33:23');
INSERT INTO `media_library` VALUES (215, 'Summer - 久石譲.mp3', 'D:\\media_src\\Summer - 久石譲.mp3', 'b9b0e836b6550b7573bcf7f7d2b8e236', 'Summer ', '音频mp3', '久石譲', '古典', '2020-06-10 23:58:50');
INSERT INTO `media_library` VALUES (216, '买5斤猪板油炒1斤辣椒，大sao做下饭菜，一油两吃，主食太香了.mp4', 'D:\\media_src\\买5斤猪板油炒1斤辣椒，大sao做下饭菜，一油两吃，主食太香了.mp4', 'd7a29238108d73cfb34b1cf89a2eee3', '买5斤猪板油炒1斤辣椒，大sao做下饭菜，一油两吃，主食太香了', '视频mp4', '徐大sao', '生活', '2020-06-10 23:58:52');
INSERT INTO `media_library` VALUES (217, '卡农 - 贵族乐团.mp3', 'D:\\media_src\\卡农 - 贵族乐团.mp3', 'b510a7d9627e7fee7e9dbad85dfebf5b', '卡农 ', '音频mp3', '贵族乐团', '古典', '2020-06-10 23:58:53');
INSERT INTO `media_library` VALUES (218, '巴赫之G大调小步舞曲 - 古典天团.mp3', 'D:\\media_src\\巴赫之G大调小步舞曲 - 古典天团.mp3', '3c2419841a71083c8c0310c1c7cec13e', '巴赫之G大调小步舞曲', '音频mp3', '古典天团', '古典', '2020-06-10 23:58:56');
INSERT INTO `media_library` VALUES (219, '春江花月夜 - 中国国家交响乐团.mp3', 'D:\\media_src\\春江花月夜 - 中国国家交响乐团.mp3', 'a39b254cdc011e23cecb9b43da9fd487', '春江花月夜 ', '音频mp3', '中国国家交响乐团', '古典', '2020-06-10 23:59:00');
INSERT INTO `media_library` VALUES (220, '活动作品一天一夜成就四斤无骨凤爪，大sao做菜做到自闭，小肥羊却爆发了.mp4', 'D:\\media_src\\活动作品一天一夜成就四斤无骨凤爪，大sao做菜做到自闭，小肥羊却爆发了.mp4', '79bb64f116b5d3003a48f074900db74e', '活动作品一天一夜成就四斤无骨凤爪，大sao做菜做到自闭，小肥羊却爆发了', '视频mp4', '徐大sao', '生活', '2020-06-10 23:59:03');
INSERT INTO `media_library` VALUES (221, '活动作品大sao下馆子吃烤肉，炸酱面先开胃，168元四人餐铺一桌，吃过瘾.mp4', 'D:\\media_src\\活动作品大sao下馆子吃烤肉，炸酱面先开胃，168元四人餐铺一桌，吃过瘾.mp4', '3af66f620f694f59d26ab71307cecb', '活动作品大sao下馆子吃烤肉，炸酱面先开胃，168元四人餐铺一桌，吃过瘾', '视频mp4', '徐大sao', '生活', '2020-06-10 23:59:04');
INSERT INTO `media_library` VALUES (222, '活动作品蹭饭土菜馆，200元四个菜，大sao被一碗面条折服，让朋友破费了.mp4', 'D:\\media_src\\活动作品蹭饭土菜馆，200元四个菜，大sao被一碗面条折服，让朋友破费了.mp4', 'feba323c4d56146a2bf82ca73b667bb7', '活动作品蹭饭土菜馆，200元四个菜，大sao被一碗面条折服，让朋友破费了', '视频mp4', '徐大sao', '生活', '2020-06-10 23:59:06');
INSERT INTO `media_library` VALUES (223, '蓝色多瑙河圆舞曲 - Johann Strauss II.mp3', 'D:\\media_src\\蓝色多瑙河圆舞曲 - Johann Strauss II.mp3', 'c61685834d553f619f9679bac76ac1e4', '蓝色多瑙河圆舞曲', '音频mp3', 'Johann Strauss II', '古典', '2020-06-10 23:59:11');
INSERT INTO `media_library` VALUES (224, '贝多芬之欢乐颂 - 古典天团.mp3', 'D:\\media_src\\贝多芬之欢乐颂 - 古典天团.mp3', 'efbdf3fae844ab87f352e757769074ce', '贝多芬之欢乐颂', '音频mp3', ' 古典天团', '古典', '2020-06-10 23:59:16');
INSERT INTO `media_library` VALUES (225, '魔鬼椒腌肉，辣椒粉做底，四斤鸭翅做一大盆麻辣鸭，大sao吃爽了.mp4', 'D:\\media_src\\魔鬼椒腌肉，辣椒粉做底，四斤鸭翅做一大盆麻辣鸭，大sao吃爽了.mp4', 'f2b4708a9fa6607ea4e3d1de34d5438f', '魔鬼椒腌肉，辣椒粉做底，四斤鸭翅做一大盆麻辣鸭，大sao吃爽了', '视频mp4', '徐大sao', '生活', '2020-06-10 23:59:25');

-- ----------------------------
-- Table structure for my_favorite
-- ----------------------------
DROP TABLE IF EXISTS `my_favorite`;
CREATE TABLE `my_favorite`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_md5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `media_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of my_favorite
-- ----------------------------
INSERT INTO `my_favorite` VALUES (18, 'd47c482cd589eb4fddc0b9cbc2bab79e', '半岛铁盒', '02 - 半岛铁盒.mp3', '音频mp3', '2020-06-08 03:26:56', 'admin');
INSERT INTO `my_favorite` VALUES (19, '638f6146645d1343346c6d324f11dd2e', '02 - 七里香', '02 - 七里香 微信公众号，凯子影视站.mp3', '音频mp3', '2020-06-08 23:09:33', 'test');
INSERT INTO `my_favorite` VALUES (22, '7e16965e5addfcca6229970d6ac05844', '云计算是啥？近年来云发展了什么？云计算简史！', '云计算是啥？近年来云发展了什么？云计算简史！.mp4', '视频mp4', '2020-06-08 23:21:15', 'admin');
INSERT INTO `my_favorite` VALUES (24, '3284b3449ee0344734bece2d7a18983d', '01 - 可爱女人.mp3', '01 - 可爱女人.mp3', '音频mp3', '2020-06-09 11:25:47', 'test');
INSERT INTO `my_favorite` VALUES (25, '90d143a5bba4aa2e846742f46c98a92c', '05 - 斗牛.mp3', '05 - 斗牛.mp3', '音频mp3', '2020-06-09 11:26:09', 'test');
INSERT INTO `my_favorite` VALUES (27, '97894990d3a00c33245aca3d9da0807a', '超级飞侠（英文版）', '超级飞侠（英文版）s1-01 [1080P].mp4', '视频mp4', '2020-06-10 22:23:39', 'admin');
INSERT INTO `my_favorite` VALUES (28, 'e74b9148724ba8760faea984bc55e288', '战狼2', '战狼2-战争.mp4', '视频mp4', '2020-06-10 22:23:56', 'admin');
INSERT INTO `my_favorite` VALUES (29, '334bfb94a170da927349ea0ab94d1162', ' 岁月神偷', '金玟岐 - 岁月神偷.mp3', '音频mp3', '2020-06-10 22:24:29', 'admin');
INSERT INTO `my_favorite` VALUES (30, 'cb09a667e9be5ac157795ac698ab5729', ' 心拍数♯0822', 'Akie秋绘 - 心拍数♯0822.mp3', '音频mp3', '2020-06-10 22:24:33', 'admin');
INSERT INTO `my_favorite` VALUES (31, 'f40bf7c8bce2fac2c3e3ccf925b4c6bf', 'You', 'Approaching Nirvana - You.mp3', '音频mp3', '2020-06-10 22:24:37', 'admin');
INSERT INTO `my_favorite` VALUES (32, '6616b54f5e4bd9e115aef50ba0710c64', '打上花火', 'DAOKO,米津玄師 - 打上花火.mp3', '音频mp3', '2020-06-10 22:24:42', 'admin');
INSERT INTO `my_favorite` VALUES (33, '8726b0fdd3b721f94e255db3cb23465e', ' 像风一样', '薛之谦 - 像风一样.mp3', '音频mp3', '2020-06-10 22:24:46', 'admin');
INSERT INTO `my_favorite` VALUES (34, '3284b3449ee0344734bece2d7a18983d', '可爱女人', '01 - 可爱女人.mp3', '音频mp3', '2020-06-10 23:10:59', 'user01');
INSERT INTO `my_favorite` VALUES (35, '90d143a5bba4aa2e846742f46c98a92c', '斗牛', '05 - 斗牛.mp3', '音频mp3', '2020-06-10 23:11:02', 'user01');
INSERT INTO `my_favorite` VALUES (36, '108b1303e796d2684746c592f704c463', '龙卷风', '09 - 龙卷风.mp3', '音频mp3', '2020-06-10 23:11:06', 'user01');
INSERT INTO `my_favorite` VALUES (37, 'adecc4f73871e14170976ef6165de9d0', '红模仿', '06 - 红模仿.mp3', '音频mp3', '2020-06-10 23:11:10', 'user01');
INSERT INTO `my_favorite` VALUES (38, '334bfb94a170da927349ea0ab94d1162', ' 岁月神偷', '金玟岐 - 岁月神偷.mp3', '音频mp3', '2020-06-10 23:11:23', 'user01');
INSERT INTO `my_favorite` VALUES (39, '66f80cba32b8a90143c18e59e9c5477c', '绣春刀', '绣春刀-武侠.mp4', '视频mp4', '2020-06-10 23:11:35', 'user01');
INSERT INTO `my_favorite` VALUES (40, '97894990d3a00c33245aca3d9da0807a', '超级飞侠（英文版）', '超级飞侠（英文版）s1-01 [1080P].mp4', '视频mp4', '2020-06-10 23:11:41', 'user01');
INSERT INTO `my_favorite` VALUES (41, 'f177961094c49051e84ca9fcd4b53272', '咏春MV', '咏春MV-武侠.mp4', '视频mp4', '2020-06-10 23:11:46', 'user01');
INSERT INTO `my_favorite` VALUES (42, 'a44296f7693c4f48abd35005ca2d22e8', '小猪佩奇片头', '小猪佩奇片头.mp4', '视频mp4', '2020-06-10 23:11:49', 'user01');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `last_login` datetime(6) NOT NULL,
  PRIMARY KEY (`id`, `last_login`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'user01', '123', 'user', '2020-06-12 08:46:49.485000');
INSERT INTO `user` VALUES (2, 'admin', '123456', 'admin', '2020-06-14 18:14:26.334000');
INSERT INTO `user` VALUES (26, 'user02', '123456', 'user', '2020-06-08 21:25:27.000000');
INSERT INTO `user` VALUES (28, 'user03', '123', 'user', '2020-06-08 21:35:59.644000');
INSERT INTO `user` VALUES (30, 'test', '123', 'user', '2020-06-09 11:23:00.940000');
INSERT INTO `user` VALUES (33, 'user05', '123', 'user', '2020-06-11 23:15:23.281000');
INSERT INTO `user` VALUES (38, 'user06', '12345', 'user', '2020-06-12 00:06:17.309000');

SET FOREIGN_KEY_CHECKS = 1;
