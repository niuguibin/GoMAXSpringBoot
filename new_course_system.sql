/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80034
 Source Host           : localhost:3306
 Source Schema         : new_course_system

 Target Server Type    : MySQL
 Target Server Version : 80034
 File Encoding         : 65001

 Date: 23/05/2024 17:49:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色标识',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '管理员' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', 'admin', '管理员', 'http://localhost:9090/files/1715950388511-1712466025637.jpg', 'ADMIN', '13677889922', 'admin@xm.com');

-- ----------------------------
-- Table structure for apply
-- ----------------------------
DROP TABLE IF EXISTS `apply`;
CREATE TABLE `apply`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `student_id` int NULL DEFAULT NULL COMMENT '学生ID',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '请假说明',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '请假时间',
  `day` int NULL DEFAULT NULL COMMENT '请假天数',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '审核状态',
  `descr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '审核说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '请假信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of apply
-- ----------------------------

-- ----------------------------
-- Table structure for attendance
-- ----------------------------
DROP TABLE IF EXISTS `attendance`;
CREATE TABLE `attendance`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `student_id` int NULL DEFAULT NULL COMMENT '学生ID',
  `teacher_id` int NULL DEFAULT NULL COMMENT '教师ID',
  `course_id` int NULL DEFAULT NULL COMMENT '课程ID',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '上课时间',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '考勤状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '考勤信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of attendance
-- ----------------------------

-- ----------------------------
-- Table structure for choice
-- ----------------------------
DROP TABLE IF EXISTS `choice`;
CREATE TABLE `choice`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `teacher_id` int NULL DEFAULT NULL COMMENT '授课教师',
  `student_id` int NULL DEFAULT NULL COMMENT '学生ID',
  `course_id` int NULL DEFAULT NULL COMMENT '课程ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '选课信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of choice
-- ----------------------------
INSERT INTO `choice` VALUES (10, 7, 4, 6);
INSERT INTO `choice` VALUES (11, 5, 4, 4);

-- ----------------------------
-- Table structure for classes
-- ----------------------------
DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '班级名称',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '班级描述',
  `teacher_id` int NULL DEFAULT NULL COMMENT '教师ID',
  `speciality_id` int NULL DEFAULT NULL COMMENT '专业ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '班级信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of classes
-- ----------------------------
INSERT INTO `classes` VALUES (3, '文科一班', '文学', 5, 6);
INSERT INTO `classes` VALUES (4, '物流一班', '物流', 6, 5);
INSERT INTO `classes` VALUES (5, '文科二班', '文科', 7, 4);
INSERT INTO `classes` VALUES (6, '计科一班', '计算机', 8, 1);

-- ----------------------------
-- Table structure for college
-- ----------------------------
DROP TABLE IF EXISTS `college`;
CREATE TABLE `college`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '学院名称',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '学院介绍',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '学院信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of college
-- ----------------------------
INSERT INTO `college` VALUES (1, '信息工程学院', '大连交通大学信息工程学院');
INSERT INTO `college` VALUES (2, '软件学院', '大连交通大学软件学院');
INSERT INTO `college` VALUES (3, '外国语学院', '大连交通大学外国语学院');
INSERT INTO `college` VALUES (4, '马克思主义学院', '大连交通大学马克思主义学院');
INSERT INTO `college` VALUES (5, '物流工程学院', '大连交通大学物流工程学院');
INSERT INTO `college` VALUES (6, '文理学院', '大连交通大学文理学院');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '课程名称',
  `teacher` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '授课教师',
  `student` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '评教学生',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '评教内容',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '评教时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '评教信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '课程名称',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '课程类型',
  `teacher_id` int NULL DEFAULT NULL COMMENT '授课教师',
  `score` int NULL DEFAULT NULL COMMENT '课程学分',
  `num` int NULL DEFAULT NULL COMMENT '上课人数',
  `room` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '上课教室',
  `week` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '周几',
  `segment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '第几大节',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '上课状态',
  `type2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '类型2',
  `type3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '类型3',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `times` date NULL DEFAULT NULL COMMENT '授课开始时间',
  `timef` date NULL DEFAULT NULL COMMENT '授课结束时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '课程信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (4, '高级计算机网络', '必修', 5, 5, 40, 'A1234', '星期五', '第一大节（08:00 ~ 09:30）', '已开课', '数学', '高中', 990.00, '2024-05-11', '2024-05-18');
INSERT INTO `course` VALUES (5, '高级操作系统', '必修', 6, 4, 50, 'A1231', '星期一', '第二大节（09:40 ~ 12:00）', '已开课', '数学', '初中', 110.00, '2024-05-18', '2024-05-15');
INSERT INTO `course` VALUES (6, '数值分析', '必修', 7, 3, 50, 'A1232', '星期五', '第五大节（18:00 ~ 20:00）', '已开课', '高中', '小学', 990.00, '2024-05-03', '2024-05-11');

-- ----------------------------
-- Table structure for examplan
-- ----------------------------
DROP TABLE IF EXISTS `examplan`;
CREATE TABLE `examplan`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内容',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '考试安排表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of examplan
-- ----------------------------
INSERT INTO `examplan` VALUES (5, '数值分析考试', '带好答题卡，准备好准考证和身份证！', '2024-04-07 12:52:33');
INSERT INTO `examplan` VALUES (6, '高级计算机网络考试', '带好答题卡，准备好准考证和身份证！', '2024-04-07 12:53:10');
INSERT INTO `examplan` VALUES (7, '高级操作系统', '带好答题卡，准备好准考证和身份证！', '2024-04-07 12:53:22');
INSERT INTO `examplan` VALUES (8, '机器学习考试', '带好答题卡，准备好准考证和身份证！', '2024-04-07 12:53:41');

-- ----------------------------
-- Table structure for homework
-- ----------------------------
DROP TABLE IF EXISTS `homework`;
CREATE TABLE `homework`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '课程说明',
  `course_id` int NULL DEFAULT NULL COMMENT '课程ID',
  `student_id` int NULL DEFAULT NULL COMMENT '学生ID',
  `teacher_id` int NULL DEFAULT NULL COMMENT '教师ID',
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '作业文件',
  `score` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '打分',
  `descr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '作业信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of homework
-- ----------------------------

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内容',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建时间',
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '公告信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1, '今天系统正式上线，开始内测', '今天天气很好，很适合出去玩', '2023-09-05', 'admin');
INSERT INTO `notice` VALUES (2, '所有功能都已完成，可以正常使用', '今天天气很好，很适合出去玩', '2023-09-05', 'admin');
INSERT INTO `notice` VALUES (4, '今天系统上线了！', '今天天气很好，很适合出去玩', '2024-04-07', 'admin');

-- ----------------------------
-- Table structure for roomplan
-- ----------------------------
DROP TABLE IF EXISTS `roomplan`;
CREATE TABLE `roomplan`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '教室名称',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '教室状态',
  `num` int NULL DEFAULT NULL COMMENT '容纳人数',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '使用说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '教室安排表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roomplan
-- ----------------------------
INSERT INTO `roomplan` VALUES (4, 'A1230', '空闲', 30, '欢迎使用');
INSERT INTO `roomplan` VALUES (5, 'A1231', '空闲', 60, '欢迎使用');
INSERT INTO `roomplan` VALUES (6, 'A1232', '空闲', 45, '欢迎使用!');
INSERT INTO `roomplan` VALUES (7, 'C1231', '空闲', 90, '欢迎使用');

-- ----------------------------
-- Table structure for score
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `student_id` int NULL DEFAULT NULL COMMENT '学生ID',
  `course_id` int NULL DEFAULT NULL COMMENT '课程ID',
  `teacher_id` int NULL DEFAULT NULL COMMENT '教师ID',
  `ordinary_score` double(10, 2) NULL DEFAULT NULL COMMENT '平时分',
  `exam_score` double(10, 2) NULL DEFAULT NULL COMMENT '考试分',
  `score` double(10, 2) NULL DEFAULT NULL COMMENT '总成绩',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '成绩信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of score
-- ----------------------------

-- ----------------------------
-- Table structure for speciality
-- ----------------------------
DROP TABLE IF EXISTS `speciality`;
CREATE TABLE `speciality`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '专业名称',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '专业描述',
  `college_id` int NULL DEFAULT NULL COMMENT '所属学院',
  `score` int NULL DEFAULT NULL COMMENT '学分限定',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '专业信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of speciality
-- ----------------------------
INSERT INTO `speciality` VALUES (1, '计算机科学与技术', '工科类', 2, 4);
INSERT INTO `speciality` VALUES (2, '网络工程', '工科类', 1, 3);
INSERT INTO `speciality` VALUES (3, '电子信息', '工科类', 2, 2);
INSERT INTO `speciality` VALUES (4, '中国汉语言文学', '文学类', 6, 5);
INSERT INTO `speciality` VALUES (5, '物流管理', '理学', 5, 2);
INSERT INTO `speciality` VALUES (6, '新时代特色社会主义', '文学', 4, 5);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  `college_id` int NULL DEFAULT NULL COMMENT '学院ID',
  `speciality_id` int NULL DEFAULT NULL COMMENT '专业ID',
  `class_id` int NULL DEFAULT NULL COMMENT '班级ID',
  `score` int NULL DEFAULT 0 COMMENT '学分',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '学生信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (4, 'aaa', '123456', 'http://localhost:9090/files/1712466607450-1712466280798.jpg', 'STUDENT', 5, 5, 4, 0, '学生1号');
INSERT INTO `student` VALUES (5, 'bbb', '123456', 'http://localhost:9090/files/1712466723771-1712466291581.jpg', 'STUDENT', 1, 1, 6, 0, '学生2号');
INSERT INTO `student` VALUES (6, 'ccc', '123456', 'http://localhost:9090/files/1712466763171-1712466305873.jpg', 'STUDENT', 4, 6, 5, 0, '学生3号');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '职称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '教师信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (5, '111', '123456', '牛老师', 'http://localhost:9090/files/1712466083499-1712466025637.jpg', 'TEACHER', '123456', '123@qq.com', '教师');
INSERT INTO `teacher` VALUES (6, '222', '123456', '牛老师2号', 'http://localhost:9090/files/1712466121164-1712466039464.jpg', 'TEACHER', '123456', '123@qq.com', '教师');
INSERT INTO `teacher` VALUES (7, '333', '123456', '牛老师3号', 'http://localhost:9090/files/1712466161135-1712466051079.jpg', 'TEACHER', '123', '123@qq.com', '教师');
INSERT INTO `teacher` VALUES (8, '444', '123456', '牛老师4号', 'http://localhost:9090/files/1712466244121-1712466062598.jpg', 'TEACHER', '123', '123@qq.com', '教师');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色标识',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `attention` int NULL DEFAULT NULL COMMENT '我的关注',
  `coin` int NULL DEFAULT NULL COMMENT '我的鹅币',
  `collect` int NULL DEFAULT NULL COMMENT '我的收藏',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (4, 'aaa', '123456', '杀生丸11', 'http://localhost:9090/files/1715950388511-1712466025637.jpg', 'USER', NULL, '111', 9999, 9999, 9999);
INSERT INTO `user` VALUES (5, 'bbb', '123456', 'aaa', NULL, 'USER', NULL, NULL, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
