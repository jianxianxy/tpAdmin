/*
SQLyog Enterprise v12.08 (64 bit)
MySQL - 5.7.23 : Database - peerless
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`peerless` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `peerless`;

/*Table structure for table `peerless_member` */

DROP TABLE IF EXISTS `peerless_member`;

CREATE TABLE `peerless_member` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户登录名',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '用户登录密码',
  `mail` varchar(32) DEFAULT NULL COMMENT '联系邮箱',
  `phone` varchar(16) DEFAULT NULL COMMENT '联系手机号',
  `desc` varchar(255) DEFAULT '' COMMENT '备注说明',
  `login_num` bigint(20) unsigned DEFAULT '0' COMMENT '登录次数',
  `login_at` datetime DEFAULT NULL COMMENT '最后登录时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `points` int(11) DEFAULT '0' COMMENT '积分',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态(1:删除,0:未删)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `peerless_member` */

insert  into `peerless_member`(`id`,`username`,`password`,`mail`,`phone`,`desc`,`login_num`,`login_at`,`status`,`points`,`is_deleted`,`create_at`) values (1,'leiluo','','jianxianxy@qq.com','15600889618','',1,'2019-09-13 21:10:51',1,1,0,'2019-09-13 21:11:01'),(2,'雷洛','','387780239@qq.com','18210233312','',2,'2019-09-24 19:56:22',0,100,0,'2019-09-24 19:56:28');

/*Table structure for table `peerless_news` */

DROP TABLE IF EXISTS `peerless_news`;

CREATE TABLE `peerless_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(64) DEFAULT NULL COMMENT '标题',
  `author` int(11) DEFAULT '0' COMMENT '作者ID',
  `sort_id` int(11) DEFAULT '0' COMMENT '分类ID',
  `order` int(11) DEFAULT '1' COMMENT '排序',
  `con_1` varchar(512) DEFAULT '' COMMENT '内容',
  `con_2` varchar(512) DEFAULT '' COMMENT '内容',
  `con_3` varchar(512) DEFAULT '' COMMENT '内容',
  `good` int(11) DEFAULT '0' COMMENT '点赞数',
  `status` tinyint(4) DEFAULT '0' COMMENT '1.已发表',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `is_deleted` tinyint(4) DEFAULT '0' COMMENT '1.已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `peerless_news` */

insert  into `peerless_news`(`id`,`title`,`author`,`sort_id`,`order`,`con_1`,`con_2`,`con_3`,`good`,`status`,`created_at`,`is_deleted`) values (1,'撒地方',0,1,1,'阿斯蒂芬','阿斯蒂芬','阿斯蒂芬',0,1,'2019-09-12 22:04:49',0),(3,'阿斯蒂芬',0,1,1,'阿斯蒂芬','阿斯蒂芬','阿斯蒂芬',0,1,'2019-09-12 21:36:07',0),(4,'阿斯蒂芬',0,1,1,'阿达','阿道夫','撒地方',0,0,'2019-09-12 21:34:08',0);

/*Table structure for table `peerless_news_file` */

DROP TABLE IF EXISTS `peerless_news_file`;

CREATE TABLE `peerless_news_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `fid` int(10) unsigned NOT NULL COMMENT '来源ID',
  `file` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '图片地址',
  PRIMARY KEY (`id`),
  KEY `fid` (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `peerless_news_file` */

insert  into `peerless_news_file`(`id`,`fid`,`file`) values (3,1,'http://www.tp.com/static/upload/201909/f5fbe0d21c94d07d.png'),(4,1,'http://www.tp.com/static/upload/201909/f5fbe0d21c94d07d.png');

/*Table structure for table `peerless_point_log` */

DROP TABLE IF EXISTS `peerless_point_log`;

CREATE TABLE `peerless_point_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_ip` varchar(15) NOT NULL DEFAULT '' COMMENT 'IP地址',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `point` int(11) DEFAULT '1' COMMENT '积分',
  `tag_id` int(11) NOT NULL DEFAULT '0' COMMENT '标识ID',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='积分日志表';

/*Data for the table `peerless_point_log` */

insert  into `peerless_point_log`(`id`,`user_ip`,`user_id`,`point`,`tag_id`,`content`,`create_at`) values (1,'127.0.0.1',1,1,1,'签到送积分','2019-09-24 20:36:17'),(2,'127.0.0.2',2,2,2,'注册活动','2019-09-24 20:51:58');

/*Table structure for table `peerless_sort` */

DROP TABLE IF EXISTS `peerless_sort`;

CREATE TABLE `peerless_sort` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` int(11) DEFAULT '0' COMMENT '父ID',
  `name` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `order` smallint(6) DEFAULT '1' COMMENT '排序',
  `type` tinyint(4) DEFAULT '1' COMMENT '1.通用分类',
  `is_deleted` tinyint(4) DEFAULT '0' COMMENT '1.已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `peerless_sort` */

insert  into `peerless_sort`(`id`,`pid`,`name`,`order`,`type`,`is_deleted`) values (1,0,'财经',1,1,0),(3,0,'预测',1,1,0),(5,1,'股票',1,1,0),(6,3,'彩票',1,1,0);

/*Table structure for table `peerless_task` */

DROP TABLE IF EXISTS `peerless_task`;

CREATE TABLE `peerless_task` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(32) COLLATE utf32_bin DEFAULT NULL COMMENT '名称',
  `order` tinyint(4) DEFAULT '1' COMMENT '排序',
  `sort_id` int(11) DEFAULT NULL COMMENT '分类ID',
  `tpl_id` int(11) DEFAULT NULL COMMENT '模板ID',
  `title` varchar(1024) COLLATE utf32_bin DEFAULT NULL COMMENT '题目',
  `answer` varchar(32) COLLATE utf32_bin DEFAULT '""' COMMENT '答案',
  `score` int(11) DEFAULT '1' COMMENT '积分',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '1.已上线',
  `is_deleted` tinyint(4) DEFAULT '0' COMMENT '1.已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf32 COLLATE=utf32_bin;

/*Data for the table `peerless_task` */

insert  into `peerless_task`(`id`,`name`,`order`,`sort_id`,`tpl_id`,`title`,`answer`,`score`,`start_time`,`end_time`,`status`,`is_deleted`) values (3,'彩票预测',3,6,8,'明日双色球蓝球预测。','\"\"',3,'2019-08-23 00:00:00','2019-08-24 00:00:00',1,0),(4,'猜涨跌',1,5,1,'明日上证指数涨跌预测。','\"\"',1,'2019-09-03 00:00:00','2019-09-04 00:00:00',0,0);

/*Table structure for table `peerless_tpl` */

DROP TABLE IF EXISTS `peerless_tpl`;

CREATE TABLE `peerless_tpl` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(12) COLLATE utf8_bin DEFAULT NULL COMMENT '模板名称',
  `type` tinyint(4) DEFAULT '1' COMMENT '类型',
  `style` tinyint(4) DEFAULT '1' COMMENT '1.横排 2.竖排',
  `option` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT '选项',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `peerless_tpl` */

insert  into `peerless_tpl`(`id`,`name`,`type`,`style`,`option`) values (1,'猜涨跌',1,1,'{\"1\":\"[-3]\",\"2\":\"[-1,-3]\",\"3\":\"(0,-1]\",\"4\":\"[0,1]\",\"5\":\"[1,3]\",\"6\":\"[3]\"}'),(8,'猜·双色球篮球',3,1,'');

/*Table structure for table `system_auth` */

DROP TABLE IF EXISTS `system_auth`;

CREATE TABLE `system_auth` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL COMMENT '权限名称',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(1:禁用,2:启用)',
  `sort` smallint(6) unsigned DEFAULT '0' COMMENT '排序权重',
  `desc` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `create_by` bigint(11) unsigned DEFAULT '0' COMMENT '创建人',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_system_auth_title` (`title`) USING BTREE,
  KEY `index_system_auth_status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='系统权限表';

/*Data for the table `system_auth` */

insert  into `system_auth`(`id`,`title`,`status`,`sort`,`desc`,`create_by`,`create_at`) values (1,'管理员',1,0,'所有权限',0,'2019-08-17 11:55:33'),(2,'运营',1,0,'运营',0,'2019-08-21 18:02:30');

/*Table structure for table `system_auth_node` */

DROP TABLE IF EXISTS `system_auth_node`;

CREATE TABLE `system_auth_node` (
  `auth` bigint(20) unsigned DEFAULT NULL COMMENT '角色ID',
  `node` varchar(200) DEFAULT NULL COMMENT '节点路径',
  KEY `index_system_auth_auth` (`auth`) USING BTREE,
  KEY `index_system_auth_node` (`node`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色与节点关系表';

/*Data for the table `system_auth_node` */

insert  into `system_auth_node`(`auth`,`node`) values (1,'admin'),(1,'admin/auth'),(1,'admin/auth/index'),(1,'admin/auth/apply'),(1,'admin/auth/add'),(1,'admin/auth/edit'),(1,'admin/auth/forbid'),(1,'admin/auth/resume'),(1,'admin/auth/del'),(1,'admin/config'),(1,'admin/config/index'),(1,'admin/config/file'),(1,'admin/log'),(1,'admin/log/index'),(1,'admin/log/del'),(1,'admin/menu'),(1,'admin/menu/index'),(1,'admin/menu/add'),(1,'admin/menu/edit'),(1,'admin/menu/del'),(1,'admin/menu/forbid'),(1,'admin/menu/resume'),(1,'admin/node'),(1,'admin/node/index'),(1,'admin/node/save'),(1,'admin/user'),(1,'admin/user/index'),(1,'admin/user/auth'),(1,'admin/user/add'),(1,'admin/user/edit'),(1,'admin/user/pass'),(1,'admin/user/del'),(1,'admin/user/forbid'),(1,'admin/user/resume'),(1,'demo'),(1,'demo/plugs'),(1,'demo/plugs/file'),(1,'demo/plugs/region'),(1,'demo/plugs/editor'),(1,'wechat'),(1,'wechat/config'),(1,'wechat/config/index'),(1,'wechat/config/pay'),(1,'wechat/fans'),(1,'wechat/fans/index'),(1,'wechat/fans/back'),(1,'wechat/fans/backadd'),(1,'wechat/fans/tagset'),(1,'wechat/fans/backdel'),(1,'wechat/fans/tagadd'),(1,'wechat/fans/tagdel'),(1,'wechat/fans/sync'),(1,'wechat/keys'),(1,'wechat/keys/index'),(1,'wechat/keys/add'),(1,'wechat/keys/edit'),(1,'wechat/keys/del'),(1,'wechat/keys/forbid'),(1,'wechat/keys/resume'),(1,'wechat/keys/subscribe'),(1,'wechat/keys/defaults'),(1,'wechat/menu'),(1,'wechat/menu/index'),(1,'wechat/menu/edit'),(1,'wechat/menu/cancel'),(1,'wechat/news'),(1,'wechat/news/index'),(1,'wechat/news/select'),(1,'wechat/news/image'),(1,'wechat/news/add'),(1,'wechat/news/edit'),(1,'wechat/news/del'),(1,'wechat/news/push'),(1,'wechat/tags'),(1,'wechat/tags/index'),(1,'wechat/tags/add'),(1,'wechat/tags/edit'),(1,'wechat/tags/sync'),(2,'admin'),(2,'admin/auth'),(2,'admin/auth/index'),(2,'admin/auth/apply'),(2,'admin/auth/add'),(2,'admin/auth/edit'),(2,'admin/auth/forbid'),(2,'admin/auth/resume'),(2,'admin/auth/del'),(2,'admin/config'),(2,'admin/config/index'),(2,'admin/config/file'),(2,'admin/log'),(2,'admin/log/index'),(2,'admin/log/del'),(2,'admin/menu'),(2,'admin/menu/index'),(2,'admin/menu/add'),(2,'admin/menu/edit'),(2,'admin/menu/del'),(2,'admin/menu/forbid'),(2,'admin/menu/resume'),(2,'admin/node'),(2,'admin/node/index'),(2,'admin/node/save'),(2,'admin/task'),(2,'admin/task/index'),(2,'admin/task/edit'),(2,'admin/user'),(2,'admin/user/index'),(2,'admin/user/auth'),(2,'admin/user/add'),(2,'admin/user/edit'),(2,'admin/user/pass'),(2,'admin/user/del'),(2,'admin/user/forbid'),(2,'admin/user/resume'),(2,'wechat'),(2,'wechat/config'),(2,'wechat/config/index'),(2,'wechat/config/pay'),(2,'wechat/fans'),(2,'wechat/fans/index'),(2,'wechat/fans/back'),(2,'wechat/fans/backadd'),(2,'wechat/fans/tagset'),(2,'wechat/fans/backdel'),(2,'wechat/fans/tagadd'),(2,'wechat/fans/tagdel'),(2,'wechat/fans/sync'),(2,'wechat/keys'),(2,'wechat/keys/index'),(2,'wechat/keys/add'),(2,'wechat/keys/edit'),(2,'wechat/keys/del'),(2,'wechat/keys/forbid'),(2,'wechat/keys/resume'),(2,'wechat/keys/subscribe'),(2,'wechat/keys/defaults'),(2,'wechat/menu'),(2,'wechat/menu/index'),(2,'wechat/menu/edit'),(2,'wechat/menu/cancel'),(2,'wechat/news'),(2,'wechat/news/index'),(2,'wechat/news/select'),(2,'wechat/news/image'),(2,'wechat/news/add'),(2,'wechat/news/edit'),(2,'wechat/news/del'),(2,'wechat/news/push'),(2,'wechat/tags'),(2,'wechat/tags/index'),(2,'wechat/tags/add'),(2,'wechat/tags/edit'),(2,'wechat/tags/sync');

/*Table structure for table `system_config` */

DROP TABLE IF EXISTS `system_config`;

CREATE TABLE `system_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '配置编码',
  `value` varchar(500) DEFAULT NULL COMMENT '配置值',
  PRIMARY KEY (`id`),
  KEY `index_system_config_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统参数配置';

/*Data for the table `system_config` */

insert  into `system_config`(`id`,`name`,`value`) values (148,'site_name','无双榜'),(149,'site_copy','广州楚才信息科技有限公司 © 2014~2017'),(164,'storage_type','local'),(165,'storage_qiniu_is_https','1'),(166,'storage_qiniu_bucket','static'),(167,'storage_qiniu_domain','static.ctolog.com'),(168,'storage_qiniu_access_key','OAFHGzCgZjod2-s4xr-g5ptkXsNbxDO_t2fozIEC'),(169,'storage_qiniu_secret_key','gy0aYdSFMSayQ4kMkgUeEeJRLThVjLpUJoPFxd-Z'),(170,'storage_qiniu_region','华东'),(173,'app_name','ThinkAdmin'),(174,'app_version','2.00 dev'),(176,'browser_icon','http://www.tp.com/static/upload/99bbd79b05c2a231/38a301b638f6bee6.ico'),(184,'wechat_appid','wx60a43dd8161666d4'),(185,'wechat_appsecret','062938ddcfe0d69786e4e3d9dcbb08aa'),(186,'wechat_token','mytoken'),(187,'wechat_encodingaeskey','KHyoWLoS7oLZYkB4PokMTfA5sm6Hrqc9Tzgn9iXc0YH'),(188,'wechat_mch_id','1332187001'),(189,'wechat_partnerkey','A82DC5BD1F3359081049C568D8502BC5'),(194,'wechat_cert_key',''),(196,'wechat_cert_cert',''),(197,'tongji_baidu_key','aa2f9869e9b578122e4692de2bd9f80f'),(198,'tongji_cnzz_key','1261854404'),(199,'storage_oss_bucket','think-oss'),(200,'storage_oss_keyid','WjeX0AYSfgy5VbXQ'),(201,'storage_oss_secret','hQTENHy6MYVUTgwjcgfOCq5gckm2Lp'),(202,'storage_oss_domain','think-oss.oss-cn-shanghai.aliyuncs.com'),(203,'storage_oss_is_https','1'),(204,'storage_local_exts','png,jpg,gif,ico');

/*Table structure for table `system_log` */

DROP TABLE IF EXISTS `system_log`;

CREATE TABLE `system_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ip` char(15) NOT NULL DEFAULT '' COMMENT '操作者IP地址',
  `node` char(200) NOT NULL DEFAULT '' COMMENT '当前操作节点',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人用户名',
  `action` varchar(200) NOT NULL DEFAULT '' COMMENT '操作行为',
  `content` text NOT NULL COMMENT '操作内容描述',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COMMENT='系统操作日志表';

/*Data for the table `system_log` */

insert  into `system_log`(`id`,`ip`,`node`,`username`,`action`,`content`,`create_at`) values (23,'127.0.0.1','admin/login/index','admin','系统管理','用户登录系统成功','2019-08-22 15:00:24'),(24,'127.0.0.1','admin/login/out','admin','系统管理','用户退出系统成功','2019-08-22 18:36:57'),(25,'127.0.0.1','admin/login/index','admin','系统管理','用户登录系统成功','2019-08-22 18:37:01'),(26,'127.0.0.1','admin/login/index','admin','系统管理','用户登录系统成功','2019-08-31 20:36:59'),(27,'127.0.0.1','admin/login/index','admin','系统管理','用户登录系统成功','2019-08-31 21:05:53'),(28,'127.0.0.1','admin/login/index','admin','系统管理','用户登录系统成功','2019-09-01 19:52:26'),(29,'127.0.0.1','admin/login/index','admin','系统管理','用户登录系统成功','2019-09-02 19:14:29'),(30,'127.0.0.1','admin/login/index','admin','系统管理','用户登录系统成功','2019-09-03 19:54:22'),(31,'127.0.0.1','admin/login/index','admin','系统管理','用户登录系统成功','2019-09-03 20:53:10'),(32,'127.0.0.1','admin/login/index','admin','系统管理','用户登录系统成功','2019-09-04 20:26:09'),(33,'127.0.0.1','admin/login/index','admin','系统管理','用户登录系统成功','2019-09-05 19:42:40'),(34,'127.0.0.1','admin/config/index','admin','系统管理','系统参数配置成功','2019-09-05 19:45:58'),(35,'127.0.0.1','admin/login/out','admin','系统管理','用户退出系统成功','2019-09-05 20:04:15'),(36,'127.0.0.1','admin/login/index','admin','系统管理','用户登录系统成功','2019-09-05 20:04:19'),(37,'127.0.0.1','admin/login/index','admin','系统管理','用户登录系统成功','2019-09-05 20:06:43'),(38,'127.0.0.1','admin/login/index','admin','系统管理','用户登录系统成功','2019-09-05 21:09:15'),(39,'127.0.0.1','admin/login/index','admin','系统管理','用户登录系统成功','2019-09-05 21:10:28'),(40,'127.0.0.1','admin/login/index','admin','系统管理','用户登录系统成功','2019-09-07 17:22:31'),(41,'127.0.0.1','admin/login/index','admin','系统管理','用户登录系统成功','2019-09-07 17:47:04'),(42,'127.0.0.1','admin/login/index','admin','系统管理','用户登录系统成功','2019-09-08 15:15:37'),(43,'127.0.0.1','admin/login/index','admin','系统管理','用户登录系统成功','2019-09-09 20:49:27'),(44,'127.0.0.1','admin/login/index','admin','系统管理','用户登录系统成功','2019-09-09 20:52:11'),(45,'127.0.0.1','admin/login/index','admin','系统管理','用户登录系统成功','2019-09-12 20:59:56'),(46,'127.0.0.1','admin/login/index','admin','系统管理','用户登录系统成功','2019-09-13 14:23:29'),(47,'127.0.0.1','admin/login/index','admin','系统管理','用户登录系统成功','2019-09-13 20:10:01'),(48,'127.0.0.1','admin/login/index','admin','系统管理','用户登录系统成功','2019-09-21 12:10:04'),(49,'127.0.0.1','admin/login/index','admin','系统管理','用户登录系统成功','2019-09-24 19:37:28');

/*Table structure for table `system_menu` */

DROP TABLE IF EXISTS `system_menu`;

CREATE TABLE `system_menu` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `node` varchar(200) NOT NULL DEFAULT '' COMMENT '节点代码',
  `icon` varchar(100) NOT NULL DEFAULT '' COMMENT '菜单图标',
  `url` varchar(400) NOT NULL DEFAULT '' COMMENT '链接',
  `params` varchar(500) DEFAULT '' COMMENT '链接参数',
  `target` varchar(20) NOT NULL DEFAULT '_self' COMMENT '链接打开方式',
  `sort` int(11) unsigned DEFAULT '0' COMMENT '菜单排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `create_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `index_system_menu_node` (`node`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8 COMMENT='系统菜单表';

/*Data for the table `system_menu` */

insert  into `system_menu`(`id`,`pid`,`title`,`node`,`icon`,`url`,`params`,`target`,`sort`,`status`,`create_by`,`create_at`) values (2,0,'系统管理','','','#','','_self',1000,1,0,'2015-11-16 19:15:38'),(4,2,'系统配置','','','#','','_self',100,1,0,'2016-03-14 18:12:55'),(5,4,'网站参数','','fa fa-apple','admin/config/index','','_self',20,1,0,'2016-05-06 14:36:49'),(6,4,'文件存储','','fa fa-save','admin/config/file','','_self',30,1,0,'2016-05-06 14:39:43'),(9,20,'操作日志','','glyphicon glyphicon-console','admin/log/index','','_self',50,1,0,'2017-03-24 15:49:31'),(19,20,'权限管理','','fa fa-user-secret','admin/auth/index','','_self',10,1,0,'2015-11-17 13:18:12'),(20,2,'系统权限','','','#','','_self',200,1,0,'2016-03-14 18:11:41'),(21,20,'系统菜单','','glyphicon glyphicon-menu-hamburger','admin/menu/index','','_self',30,1,0,'2015-11-16 19:16:16'),(22,20,'节点管理','','fa fa-ellipsis-v','admin/node/index','','_self',20,1,0,'2015-11-16 19:16:16'),(29,20,'系统用户','','fa fa-users','admin/user/index','','_self',40,1,0,'2016-10-31 14:31:40'),(61,0,'微信管理','','','#','','_self',2000,1,0,'2017-03-29 11:00:21'),(62,61,'微信对接配置','','','#','','_self',100,1,0,'2017-03-29 11:03:38'),(63,62,'微信接口配置\r\n','','fa fa-usb','wechat/config/index','','_self',10,1,0,'2017-03-29 11:04:44'),(65,61,'微信粉丝管理','','','#','','_self',300,1,0,'2017-03-29 11:08:32'),(66,65,'粉丝标签','','fa fa-tags','wechat/tags/index','','_self',10,1,0,'2017-03-29 11:09:41'),(67,65,'已关注粉丝','','fa fa-wechat','wechat/fans/index','','_self',20,1,0,'2017-03-29 11:10:07'),(68,61,'微信订制','','','#','','_self',200,1,0,'2017-03-29 11:10:39'),(69,68,'微信菜单定制','','glyphicon glyphicon-phone','wechat/menu/index','','_self',40,1,0,'2017-03-29 11:11:08'),(70,68,'关键字管理','','fa fa-paw','wechat/keys/index','','_self',10,1,0,'2017-03-29 11:11:49'),(71,68,'关注自动回复','','fa fa-commenting-o','wechat/keys/subscribe','','_self',20,1,0,'2017-03-29 11:12:32'),(81,68,'无配置默认回复','','fa fa-commenting-o','wechat/keys/defaults','','_self',30,1,0,'2017-04-21 14:48:25'),(82,61,'素材资源管理','','','#','','_self',300,1,0,'2017-04-24 11:23:18'),(83,82,'添加图文','','fa fa-folder-open-o','wechat/news/add?id=1','','_self',20,1,0,'2017-04-24 11:23:40'),(85,82,'图文列表','','fa fa-file-pdf-o','wechat/news/index','','_self',10,1,0,'2017-04-24 11:25:45'),(86,65,'粉丝黑名单','','fa fa-reddit-alien','wechat/fans/back','','_self',30,1,0,'2017-05-05 16:17:03'),(87,0,'插件案例','','','#','','_self',3000,1,0,'2017-07-10 15:10:16'),(88,87,'第三方插件','','','#','','_self',0,1,0,'2017-07-10 15:10:37'),(90,88,'PCAS 省市区','','','demo/plugs/region','','_self',0,1,0,'2017-07-10 18:45:47'),(91,87,'内置插件','','','#','','_self',0,1,0,'2017-07-10 18:56:59'),(92,91,'文件上传','','','demo/plugs/file','','_self',0,1,0,'2017-07-10 18:57:22'),(93,88,'富文本编辑器','','','demo/plugs/editor','','_self',0,1,0,'2017-07-28 15:19:44'),(94,0,'后台首页','','','admin/index/main','','_self',0,1,0,'2017-08-08 11:28:43'),(95,98,'资讯管理','','','#','','_self',0,1,0,'2019-08-17 20:46:28'),(96,95,'任务列表','','fa fa-indent','/admin/task/index','','_self',1,1,0,'2019-08-17 20:53:35'),(97,95,'分类管理','','fa fa-ra','/admin/task/sort','','_self',3,1,0,'2019-08-17 20:57:54'),(98,0,'无双榜','','','#','','_self',0,1,0,'2019-08-17 21:02:52'),(99,95,'任务模板','','glyphicon glyphicon-leaf','/admin/task/tpl','','_self',2,1,0,'2019-08-22 18:25:12'),(100,98,'用户管理','','','#','','_self',0,1,0,'2019-09-05 19:50:24'),(101,95,'资讯列表','','fa fa-newspaper-o','/admin/news/index','','_self',0,1,0,'2019-09-05 19:55:36'),(102,100,'用户列表','','fa fa-user','/admin/member/index','','_self',0,1,0,'2019-09-13 20:40:39'),(103,100,'积分日志','','fa fa-usd','/admin/points/index','','_self',0,1,0,'2019-09-13 21:14:34');

/*Table structure for table `system_node` */

DROP TABLE IF EXISTS `system_node`;

CREATE TABLE `system_node` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `node` varchar(100) DEFAULT NULL COMMENT '节点代码',
  `title` varchar(500) DEFAULT NULL COMMENT '节点标题',
  `is_menu` tinyint(1) unsigned DEFAULT '0' COMMENT '是否可设置为菜单',
  `is_auth` tinyint(1) unsigned DEFAULT '1' COMMENT '是否启动RBAC权限控制',
  `is_login` tinyint(1) unsigned DEFAULT '1' COMMENT '是否启动登录控制',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `index_system_node_node` (`node`)
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统节点表';

/*Data for the table `system_node` */

insert  into `system_node`(`id`,`node`,`title`,`is_menu`,`is_auth`,`is_login`,`create_at`) values (131,'admin/auth/index','权限列表',1,1,1,'2017-08-23 15:45:42'),(132,'admin','后台管理',0,1,1,'2017-08-23 15:45:44'),(133,'admin/auth/apply','节点授权',0,1,1,'2017-08-23 16:05:18'),(134,'admin/auth/add','添加授权',0,1,1,'2017-08-23 16:05:19'),(135,'admin/auth/edit','编辑权限',0,1,1,'2017-08-23 16:05:19'),(136,'admin/auth/forbid','禁用权限',0,1,1,'2017-08-23 16:05:20'),(137,'admin/auth/resume','启用权限',0,1,1,'2017-08-23 16:05:20'),(138,'admin/auth/del','删除权限',0,1,1,'2017-08-23 16:05:21'),(139,'admin/config/index','参数配置',1,1,1,'2017-08-23 16:05:22'),(140,'admin/config/file','文件配置',1,1,1,'2017-08-23 16:05:22'),(141,'admin/log/index','日志列表',1,1,1,'2017-08-23 16:05:23'),(142,'admin/log/del','删除日志',0,1,1,'2017-08-23 16:05:24'),(143,'admin/menu/index','菜单列表',1,1,1,'2017-08-23 16:05:25'),(144,'admin/menu/add','添加菜单',0,1,1,'2017-08-23 16:05:25'),(145,'admin/menu/edit','编辑菜单',0,1,1,'2017-08-23 16:05:26'),(146,'admin/menu/del','删除菜单',0,1,1,'2017-08-23 16:05:26'),(147,'admin/menu/forbid','禁用菜单',0,1,1,'2017-08-23 16:05:27'),(148,'admin/menu/resume','启用菜单',0,1,1,'2017-08-23 16:05:28'),(149,'admin/node/index','节点列表',1,1,1,'2017-08-23 16:05:29'),(150,'admin/node/save','节点更新',0,1,1,'2017-08-23 16:05:30'),(151,'admin/user/index','用户管理',1,1,1,'2017-08-23 16:05:31'),(152,'admin/user/auth','用户授权',0,1,1,'2017-08-23 16:05:32'),(153,'admin/user/add','添加用户',0,1,1,'2017-08-23 16:05:33'),(154,'admin/user/edit','编辑用户',0,1,1,'2017-08-23 16:05:33'),(155,'admin/user/pass','用户密码',0,1,1,'2017-08-23 16:05:34'),(156,'admin/user/del','删除用户',0,1,1,'2017-08-23 16:05:34'),(157,'admin/user/forbid','禁用用户',0,1,1,'2017-08-23 16:05:34'),(158,'admin/user/resume','启用用户',0,1,1,'2017-08-23 16:05:35'),(159,'demo/plugs/file','文件上传',1,0,0,'2017-08-23 16:05:36'),(160,'demo/plugs/region','区域选择',1,0,0,'2017-08-23 16:05:36'),(161,'demo/plugs/editor','富文本器',1,0,0,'2017-08-23 16:05:37'),(162,'wechat/config/index','微信参数',1,1,1,'2017-08-23 16:05:37'),(163,'wechat/config/pay','微信支付',0,1,1,'2017-08-23 16:05:38'),(164,'wechat/fans/index','粉丝列表',1,1,1,'2017-08-23 16:05:39'),(165,'wechat/fans/back','粉丝黑名单',1,1,1,'2017-08-23 16:05:39'),(166,'wechat/fans/backadd','移入黑名单',0,1,1,'2017-08-23 16:05:40'),(167,'wechat/fans/tagset','设置标签',0,1,1,'2017-08-23 16:05:41'),(168,'wechat/fans/backdel','移出黑名单',0,1,1,'2017-08-23 16:05:41'),(169,'wechat/fans/tagadd','添加标签',0,1,1,'2017-08-23 16:05:41'),(170,'wechat/fans/tagdel','删除标签',0,1,1,'2017-08-23 16:05:42'),(171,'wechat/fans/sync','同步粉丝',0,1,1,'2017-08-23 16:05:43'),(172,'wechat/keys/index','关键字列表',1,1,1,'2017-08-23 16:05:44'),(173,'wechat/keys/add','添加关键字',0,1,1,'2017-08-23 16:05:44'),(174,'wechat/keys/edit','编辑关键字',0,1,1,'2017-08-23 16:05:45'),(175,'wechat/keys/del','删除关键字',0,1,1,'2017-08-23 16:05:45'),(176,'wechat/keys/forbid','禁用关键字',0,1,1,'2017-08-23 16:05:46'),(177,'wechat/keys/resume','启用关键字',0,1,1,'2017-08-23 16:05:46'),(178,'wechat/keys/subscribe','关注默认回复',0,1,1,'2017-08-23 16:05:48'),(179,'wechat/keys/defaults','默认响应回复',0,1,1,'2017-08-23 16:05:49'),(180,'wechat/menu/index','微信菜单',1,1,1,'2017-08-23 16:05:51'),(181,'wechat/menu/edit','发布微信菜单',0,1,1,'2017-08-23 16:05:51'),(182,'wechat/menu/cancel','取消微信菜单',0,1,1,'2017-08-23 16:05:52'),(183,'wechat/news/index','微信图文列表',1,1,1,'2017-08-23 16:05:52'),(184,'wechat/news/select','微信图文选择',0,1,1,'2017-08-23 16:05:53'),(185,'wechat/news/image','微信图片选择',0,1,1,'2017-08-23 16:05:53'),(186,'wechat/news/add','添加图文',0,1,1,'2017-08-23 16:05:54'),(187,'wechat/news/edit','编辑图文',0,1,1,'2017-08-23 16:05:56'),(188,'wechat/news/del','删除图文',0,1,1,'2017-08-23 16:05:56'),(189,'wechat/news/push','推送图文',0,1,1,'2017-08-23 16:05:56'),(190,'wechat/tags/index','微信标签列表',1,1,1,'2017-08-23 16:05:58'),(191,'wechat/tags/add','添加微信标签',0,1,1,'2017-08-23 16:05:58'),(192,'wechat/tags/edit','编辑微信标签',0,1,1,'2017-08-23 16:05:58'),(193,'wechat/tags/sync','同步微信标签',0,1,1,'2017-08-23 16:05:59'),(194,'admin/auth','权限管理',0,1,1,'2017-08-23 16:06:58'),(195,'admin/config','系统配置',0,1,1,'2017-08-23 16:07:34'),(196,'admin/log','系统日志',0,1,1,'2017-08-23 16:07:46'),(197,'admin/menu','系统菜单',0,1,1,'2017-08-23 16:08:02'),(198,'admin/node','系统节点',0,1,1,'2017-08-23 16:08:44'),(199,'admin/user','系统用户',0,1,1,'2017-08-23 16:09:43'),(200,'demo','插件案例',0,1,1,'2017-08-23 16:10:43'),(201,'demo/plugs','插件案例',0,1,1,'2017-08-23 16:10:51'),(202,'wechat','微信管理',0,1,1,'2017-08-23 16:11:13'),(203,'wechat/config','微信配置',0,1,1,'2017-08-23 16:11:19'),(204,'wechat/fans','粉丝管理',0,1,1,'2017-08-23 16:11:36'),(205,'wechat/keys','关键字管理',0,1,1,'2017-08-23 16:13:00'),(206,'wechat/menu','微信菜单管理',0,1,1,'2017-08-23 16:14:11'),(207,'wechat/news','微信图文管理',0,1,1,'2017-08-23 16:14:40'),(208,'wechat/tags','微信标签管理',0,1,1,'2017-08-23 16:15:25');

/*Table structure for table `system_sequence` */

DROP TABLE IF EXISTS `system_sequence`;

CREATE TABLE `system_sequence` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) DEFAULT NULL COMMENT '序号类型',
  `sequence` char(50) NOT NULL COMMENT '序号值',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_system_sequence_unique` (`type`,`sequence`) USING BTREE,
  KEY `index_system_sequence_type` (`type`),
  KEY `index_system_sequence_number` (`sequence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统序号表';

/*Data for the table `system_sequence` */

/*Table structure for table `system_user` */

DROP TABLE IF EXISTS `system_user`;

CREATE TABLE `system_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户登录名',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '用户登录密码',
  `qq` varchar(16) DEFAULT NULL COMMENT '联系QQ',
  `mail` varchar(32) DEFAULT NULL COMMENT '联系邮箱',
  `phone` varchar(16) DEFAULT NULL COMMENT '联系手机号',
  `desc` varchar(255) DEFAULT '' COMMENT '备注说明',
  `login_num` bigint(20) unsigned DEFAULT '0' COMMENT '登录次数',
  `login_at` datetime DEFAULT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `authorize` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态(1:删除,0:未删)',
  `create_by` bigint(20) unsigned DEFAULT NULL COMMENT '创建人',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_system_user_username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10002 DEFAULT CHARSET=utf8 COMMENT='系统用户表';

/*Data for the table `system_user` */

insert  into `system_user`(`id`,`username`,`password`,`qq`,`mail`,`phone`,`desc`,`login_num`,`login_at`,`status`,`authorize`,`is_deleted`,`create_by`,`create_at`) values (10000,'admin','21232f297a57a5a743894a0e4a801fc3','22222222','sdfsd@Qq.com1','13888888855','dfgsdfgsfd',27075,'2019-09-24 19:37:28',1,'1',0,NULL,'2015-11-13 15:14:22'),(10001,'leiluo','08fbbc6451016ca1b6a5f4ea5ed52da7',NULL,'','','',0,NULL,1,'2',0,NULL,'2019-08-21 18:00:34');

/*Table structure for table `wechat_fans` */

DROP TABLE IF EXISTS `wechat_fans`;

CREATE TABLE `wechat_fans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '粉丝表ID',
  `appid` varchar(50) DEFAULT NULL COMMENT '公众号Appid',
  `groupid` bigint(20) unsigned DEFAULT NULL COMMENT '分组ID',
  `tagid_list` varchar(100) DEFAULT '' COMMENT '标签id',
  `is_back` tinyint(1) unsigned DEFAULT '0' COMMENT '是否为黑名单用户',
  `subscribe` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '用户是否订阅该公众号，0：未关注，1：已关注',
  `openid` char(100) NOT NULL DEFAULT '' COMMENT '用户的标识，对当前公众号唯一',
  `spread_openid` char(100) DEFAULT NULL COMMENT '推荐人OPENID',
  `spread_at` datetime DEFAULT NULL,
  `nickname` varchar(100) DEFAULT NULL COMMENT '用户的昵称',
  `sex` tinyint(1) unsigned DEFAULT NULL COMMENT '用户的性别，值为1时是男性，值为2时是女性，值为0时是未知',
  `country` varchar(50) DEFAULT NULL COMMENT '用户所在国家',
  `province` varchar(50) DEFAULT NULL COMMENT '用户所在省份',
  `city` varchar(50) DEFAULT NULL COMMENT '用户所在城市',
  `language` varchar(50) DEFAULT NULL COMMENT '用户的语言，简体中文为zh_CN',
  `headimgurl` varchar(500) DEFAULT NULL COMMENT '用户头像',
  `subscribe_time` bigint(20) unsigned DEFAULT NULL COMMENT '用户关注时间',
  `subscribe_at` datetime DEFAULT NULL COMMENT '关注时间',
  `unionid` varchar(100) DEFAULT NULL COMMENT 'unionid',
  `remark` varchar(50) DEFAULT NULL COMMENT '备注',
  `expires_in` bigint(20) unsigned DEFAULT '0' COMMENT '有效时间',
  `refresh_token` varchar(200) DEFAULT NULL COMMENT '刷新token',
  `access_token` varchar(200) DEFAULT NULL COMMENT '访问token',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `index_wechat_fans_spread_openid` (`spread_openid`) USING BTREE,
  KEY `index_wechat_fans_openid` (`openid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信粉丝';

/*Data for the table `wechat_fans` */

/*Table structure for table `wechat_fans_tags` */

DROP TABLE IF EXISTS `wechat_fans_tags`;

CREATE TABLE `wechat_fans_tags` (
  `id` bigint(20) unsigned NOT NULL COMMENT '标签ID',
  `appid` char(50) DEFAULT NULL COMMENT '公众号APPID',
  `name` varchar(35) DEFAULT NULL COMMENT '标签名称',
  `count` int(11) unsigned DEFAULT NULL COMMENT '总数',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  KEY `index_wechat_fans_tags_id` (`id`) USING BTREE,
  KEY `index_wechat_fans_tags_appid` (`appid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信会员标签';

/*Data for the table `wechat_fans_tags` */

/*Table structure for table `wechat_keys` */

DROP TABLE IF EXISTS `wechat_keys`;

CREATE TABLE `wechat_keys` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `appid` char(50) DEFAULT NULL COMMENT '公众号APPID',
  `type` varchar(20) DEFAULT NULL COMMENT '类型，text 文件消息，image 图片消息，news 图文消息',
  `keys` varchar(100) DEFAULT NULL COMMENT '关键字',
  `content` text COMMENT '文本内容',
  `image_url` varchar(255) DEFAULT NULL COMMENT '图片链接',
  `voice_url` varchar(255) DEFAULT NULL COMMENT '语音链接',
  `music_title` varchar(100) DEFAULT NULL COMMENT '音乐标题',
  `music_url` varchar(255) DEFAULT NULL COMMENT '音乐链接',
  `music_image` varchar(255) DEFAULT NULL COMMENT '音乐缩略图链接',
  `music_desc` varchar(255) DEFAULT NULL COMMENT '音乐描述',
  `video_title` varchar(100) DEFAULT NULL COMMENT '视频标题',
  `video_url` varchar(255) DEFAULT NULL COMMENT '视频URL',
  `video_desc` varchar(255) DEFAULT NULL COMMENT '视频描述',
  `news_id` bigint(20) unsigned DEFAULT NULL COMMENT '图文ID',
  `sort` bigint(20) unsigned DEFAULT '0' COMMENT '排序字段',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '0 禁用，1 启用',
  `create_by` bigint(20) unsigned DEFAULT NULL COMMENT '创建人',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT=' 微信关键字';

/*Data for the table `wechat_keys` */

/*Table structure for table `wechat_menu` */

DROP TABLE IF EXISTS `wechat_menu`;

CREATE TABLE `wechat_menu` (
  `id` bigint(16) unsigned NOT NULL AUTO_INCREMENT,
  `index` bigint(20) DEFAULT NULL,
  `pindex` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `type` varchar(24) NOT NULL DEFAULT '' COMMENT '菜单类型 null主菜单 link链接 keys关键字',
  `name` varchar(256) NOT NULL DEFAULT '' COMMENT '菜单名称',
  `content` text NOT NULL COMMENT '文字内容',
  `sort` bigint(20) unsigned DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(0禁用1启用)',
  `create_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `index_wechat_menu_pindex` (`pindex`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信菜单配置';

/*Data for the table `wechat_menu` */

/*Table structure for table `wechat_news` */

DROP TABLE IF EXISTS `wechat_news`;

CREATE TABLE `wechat_news` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `media_id` varchar(100) DEFAULT NULL COMMENT '永久素材MediaID',
  `local_url` varchar(300) DEFAULT NULL COMMENT '永久素材显示URL',
  `article_id` varchar(60) DEFAULT NULL COMMENT '关联图文ID，用，号做分割',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '是否删除',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`),
  KEY `index_wechat_new_artcle_id` (`article_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信图文表';

/*Data for the table `wechat_news` */

/*Table structure for table `wechat_news_article` */

DROP TABLE IF EXISTS `wechat_news_article`;

CREATE TABLE `wechat_news_article` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL COMMENT '素材标题',
  `local_url` varchar(300) DEFAULT NULL COMMENT '永久素材显示URL',
  `show_cover_pic` tinyint(4) unsigned DEFAULT '0' COMMENT '是否显示封面 0不显示，1 显示',
  `author` varchar(20) DEFAULT NULL COMMENT '作者',
  `digest` varchar(300) DEFAULT NULL COMMENT '摘要内容',
  `content` longtext COMMENT '图文内容',
  `content_source_url` varchar(200) DEFAULT NULL COMMENT '图文消息原文地址',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信素材表';

/*Data for the table `wechat_news_article` */

/*Table structure for table `wechat_news_image` */

DROP TABLE IF EXISTS `wechat_news_image`;

CREATE TABLE `wechat_news_image` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `md5` varchar(32) DEFAULT NULL COMMENT '文件md5',
  `local_url` varchar(300) DEFAULT NULL COMMENT '本地文件链接',
  `media_url` varchar(300) DEFAULT NULL COMMENT '远程图片链接',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `index_wechat_news_image_md5` (`md5`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信服务器图片';

/*Data for the table `wechat_news_image` */

/*Table structure for table `wechat_news_media` */

DROP TABLE IF EXISTS `wechat_news_media`;

CREATE TABLE `wechat_news_media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `appid` varchar(200) DEFAULT NULL COMMENT '公众号ID',
  `md5` varchar(32) DEFAULT NULL COMMENT '文件md5',
  `type` varchar(20) DEFAULT NULL COMMENT '媒体类型',
  `media_id` varchar(100) DEFAULT NULL COMMENT '永久素材MediaID',
  `local_url` varchar(300) DEFAULT NULL COMMENT '本地文件链接',
  `media_url` varchar(300) DEFAULT NULL COMMENT '远程图片链接',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信素材表';

/*Data for the table `wechat_news_media` */

/*Table structure for table `wechat_pay_notify` */

DROP TABLE IF EXISTS `wechat_pay_notify`;

CREATE TABLE `wechat_pay_notify` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `appid` varchar(50) DEFAULT NULL COMMENT '公众号Appid',
  `bank_type` varchar(50) DEFAULT NULL COMMENT '银行类型',
  `cash_fee` bigint(20) DEFAULT NULL COMMENT '现金价',
  `fee_type` char(20) DEFAULT NULL COMMENT '币种，1人民币',
  `is_subscribe` char(1) DEFAULT 'N' COMMENT '是否关注，Y为关注，N为未关注',
  `mch_id` varchar(50) DEFAULT NULL COMMENT '商户MCH_ID',
  `nonce_str` varchar(32) DEFAULT NULL COMMENT '随机串',
  `openid` varchar(50) DEFAULT NULL COMMENT '微信用户openid',
  `out_trade_no` varchar(50) DEFAULT NULL COMMENT '支付平台退款交易号',
  `sign` varchar(100) DEFAULT NULL COMMENT '签名',
  `time_end` datetime DEFAULT NULL COMMENT '结束时间',
  `result_code` varchar(10) DEFAULT NULL,
  `return_code` varchar(10) DEFAULT NULL,
  `total_fee` varchar(11) DEFAULT NULL COMMENT '支付总金额，单位为分',
  `trade_type` varchar(20) DEFAULT NULL COMMENT '支付方式',
  `transaction_id` varchar(64) DEFAULT NULL COMMENT '订单号',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '本地系统时间',
  PRIMARY KEY (`id`),
  KEY `index_wechat_pay_notify_openid` (`openid`) USING BTREE,
  KEY `index_wechat_pay_notify_out_trade_no` (`out_trade_no`) USING BTREE,
  KEY `index_wechat_pay_notify_transaction_id` (`transaction_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='支付日志表';

/*Data for the table `wechat_pay_notify` */

/*Table structure for table `wechat_pay_prepayid` */

DROP TABLE IF EXISTS `wechat_pay_prepayid`;

CREATE TABLE `wechat_pay_prepayid` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `appid` char(50) DEFAULT NULL COMMENT '公众号APPID',
  `from` char(32) DEFAULT 'shop' COMMENT '支付来源',
  `fee` bigint(20) unsigned DEFAULT NULL COMMENT '支付费用(分)',
  `trade_type` varchar(20) DEFAULT NULL COMMENT '订单类型',
  `order_no` varchar(50) DEFAULT NULL COMMENT '内部订单号',
  `out_trade_no` varchar(50) DEFAULT NULL COMMENT '外部订单号',
  `prepayid` varchar(500) DEFAULT NULL COMMENT '预支付码',
  `expires_in` bigint(20) unsigned DEFAULT NULL COMMENT '有效时间',
  `transaction_id` varchar(64) DEFAULT NULL COMMENT '微信平台订单号',
  `is_pay` tinyint(1) unsigned DEFAULT '0' COMMENT '1已支付，0未支退款',
  `pay_at` datetime DEFAULT NULL COMMENT '支付时间',
  `is_refund` tinyint(1) unsigned DEFAULT '0' COMMENT '是否退款，退款单号(T+原来订单)',
  `refund_at` datetime DEFAULT NULL COMMENT '退款时间',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '本地系统时间',
  PRIMARY KEY (`id`),
  KEY `index_wechat_pay_prepayid_outer_no` (`out_trade_no`) USING BTREE,
  KEY `index_wechat_pay_prepayid_order_no` (`order_no`) USING BTREE,
  KEY `index_wechat_pay_is_pay` (`is_pay`) USING BTREE,
  KEY `index_wechat_pay_is_refund` (`is_refund`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='支付订单号对应表';

/*Data for the table `wechat_pay_prepayid` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
