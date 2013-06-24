/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50530
Source Host           : localhost:3306
Source Database       : app_rayzy1991

Target Server Type    : MYSQL
Target Server Version : 50530
File Encoding         : 65001

Date: 2013-06-24 23:54:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_group_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_425ae3c4` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`),
  CONSTRAINT `group_id_refs_id_3cea63fe` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_5886d21f` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_permission`
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_1bb8f392` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_728de91f` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add permission', '1', 'add_permission');
INSERT INTO `auth_permission` VALUES ('2', 'Can change permission', '1', 'change_permission');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete permission', '1', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('4', 'Can add group', '2', 'add_group');
INSERT INTO `auth_permission` VALUES ('5', 'Can change group', '2', 'change_group');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete group', '2', 'delete_group');
INSERT INTO `auth_permission` VALUES ('7', 'Can add user', '3', 'add_user');
INSERT INTO `auth_permission` VALUES ('8', 'Can change user', '3', 'change_user');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete user', '3', 'delete_user');
INSERT INTO `auth_permission` VALUES ('10', 'Can add content type', '4', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('11', 'Can change content type', '4', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete content type', '4', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('13', 'Can add session', '5', 'add_session');
INSERT INTO `auth_permission` VALUES ('14', 'Can change session', '5', 'change_session');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete session', '5', 'delete_session');
INSERT INTO `auth_permission` VALUES ('16', 'Can add log entry', '6', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('17', 'Can change log entry', '6', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete log entry', '6', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('19', 'Can add tag', '7', 'add_tag');
INSERT INTO `auth_permission` VALUES ('20', 'Can change tag', '7', 'change_tag');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete tag', '7', 'delete_tag');
INSERT INTO `auth_permission` VALUES ('22', 'Can add article', '8', 'add_article');
INSERT INTO `auth_permission` VALUES ('23', 'Can change article', '8', 'change_article');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete article', '8', 'delete_article');
INSERT INTO `auth_permission` VALUES ('25', 'Can add comment', '9', 'add_comment');
INSERT INTO `auth_permission` VALUES ('26', 'Can change comment', '9', 'change_comment');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete comment', '9', 'delete_comment');
INSERT INTO `auth_permission` VALUES ('28', 'Can add trend', '10', 'add_trend');
INSERT INTO `auth_permission` VALUES ('29', 'Can change trend', '10', 'change_trend');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete trend', '10', 'delete_trend');

-- ----------------------------
-- Table structure for `auth_user`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'ray', '', '', 'rayzy1991@163.com', 'pbkdf2_sha256$10000$cLqO4Vm2RyGn$jqNraFl1cFZAAxzVwDyMpjgFrYUoytZmVzPLcXVFbcU=', '1', '1', '1', '2013-06-24 15:53:24', '2013-06-24 15:53:24');

-- ----------------------------
-- Table structure for `auth_user_groups`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_403f60f` (`user_id`),
  KEY `auth_user_groups_425ae3c4` (`group_id`),
  CONSTRAINT `user_id_refs_id_7ceef80f` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `group_id_refs_id_f116770` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_user_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_403f60f` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`),
  CONSTRAINT `user_id_refs_id_dfbab7d` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `permission_id_refs_id_67e79cb` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `django_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_403f60f` (`user_id`),
  KEY `django_admin_log_1bb8f392` (`content_type_id`),
  CONSTRAINT `user_id_refs_id_c8665aa` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `content_type_id_refs_id_288599e6` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'permission', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('2', 'group', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('3', 'user', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('4', 'content type', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('5', 'session', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('6', 'log entry', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('7', 'tag', 'article', 'tag');
INSERT INTO `django_content_type` VALUES ('8', 'article', 'article', 'article');
INSERT INTO `django_content_type` VALUES ('9', 'comment', 'article', 'comment');
INSERT INTO `django_content_type` VALUES ('10', 'trend', 'trend', 'trend');

-- ----------------------------
-- Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_3da3d3d8` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of django_session
-- ----------------------------

-- ----------------------------
-- Table structure for `ms_articles`
-- ----------------------------
DROP TABLE IF EXISTS `ms_articles`;
CREATE TABLE `ms_articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `desc` varchar(256) DEFAULT NULL,
  `create_at` datetime NOT NULL,
  `last_at` datetime NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `content` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ms_articles_403f60f` (`user_id`),
  CONSTRAINT `user_id_refs_id_2986dbd1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of ms_articles
-- ----------------------------

-- ----------------------------
-- Table structure for `ms_articles_tags`
-- ----------------------------
DROP TABLE IF EXISTS `ms_articles_tags`;
CREATE TABLE `ms_articles_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `article_id` (`article_id`,`tag_id`),
  KEY `ms_articles_tags_30525a19` (`article_id`),
  KEY `ms_articles_tags_3747b463` (`tag_id`),
  CONSTRAINT `article_id_refs_id_43331332` FOREIGN KEY (`article_id`) REFERENCES `ms_articles` (`id`),
  CONSTRAINT `tag_id_refs_id_198faa48` FOREIGN KEY (`tag_id`) REFERENCES `ms_tags` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of ms_articles_tags
-- ----------------------------

-- ----------------------------
-- Table structure for `ms_comments`
-- ----------------------------
DROP TABLE IF EXISTS `ms_comments`;
CREATE TABLE `ms_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `desc` varchar(256) DEFAULT NULL,
  `create_at` datetime NOT NULL,
  `last_at` datetime NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `content` longtext NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `komment_id` int(11) DEFAULT NULL,
  `root_komment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ms_comments_403f60f` (`user_id`),
  KEY `ms_comments_30525a19` (`article_id`),
  KEY `ms_comments_3685aac4` (`komment_id`),
  KEY `ms_comments_660555d6` (`root_komment_id`),
  CONSTRAINT `user_id_refs_id_1de7bc2a` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `article_id_refs_id_1f97a6a6` FOREIGN KEY (`article_id`) REFERENCES `ms_articles` (`id`),
  CONSTRAINT `komment_id_refs_id_6d42e7c9` FOREIGN KEY (`komment_id`) REFERENCES `ms_comments` (`id`),
  CONSTRAINT `root_komment_id_refs_id_6d42e7c9` FOREIGN KEY (`root_komment_id`) REFERENCES `ms_comments` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of ms_comments
-- ----------------------------

-- ----------------------------
-- Table structure for `ms_tags`
-- ----------------------------
DROP TABLE IF EXISTS `ms_tags`;
CREATE TABLE `ms_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `desc` varchar(256) DEFAULT NULL,
  `create_at` datetime NOT NULL,
  `last_at` datetime NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of ms_tags
-- ----------------------------

-- ----------------------------
-- Table structure for `ms_trends`
-- ----------------------------
DROP TABLE IF EXISTS `ms_trends`;
CREATE TABLE `ms_trends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `desc` varchar(256) DEFAULT NULL,
  `create_at` datetime NOT NULL,
  `last_at` datetime NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `path` varchar(200) DEFAULT NULL,
  `target` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of ms_trends
-- ----------------------------
