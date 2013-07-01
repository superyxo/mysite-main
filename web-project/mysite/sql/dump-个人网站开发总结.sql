-- phpMyAdmin SQL Dump
-- version 3.3.8.1
-- http://www.phpmyadmin.net
--
-- 主机: w.rdc.sae.sina.com.cn:3307
-- 生成日期: 2013 年 07 月 01 日 11:01
-- 服务器版本: 5.5.23
-- PHP 版本: 5.3.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `app_rayzy1991`
--

-- --------------------------------------------------------

--
-- 表的结构 `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `auth_group`
--


-- --------------------------------------------------------

--
-- 表的结构 `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_425ae3c4` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `auth_group_permissions`
--


-- --------------------------------------------------------

--
-- 表的结构 `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_1bb8f392` (`content_type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;

--
-- 转存表中的数据 `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add permission', 1, 'add_permission'),
(2, 'Can change permission', 1, 'change_permission'),
(3, 'Can delete permission', 1, 'delete_permission'),
(4, 'Can add group', 2, 'add_group'),
(5, 'Can change group', 2, 'change_group'),
(6, 'Can delete group', 2, 'delete_group'),
(7, 'Can add user', 3, 'add_user'),
(8, 'Can change user', 3, 'change_user'),
(9, 'Can delete user', 3, 'delete_user'),
(10, 'Can add content type', 4, 'add_contenttype'),
(11, 'Can change content type', 4, 'change_contenttype'),
(12, 'Can delete content type', 4, 'delete_contenttype'),
(13, 'Can add session', 5, 'add_session'),
(14, 'Can change session', 5, 'change_session'),
(15, 'Can delete session', 5, 'delete_session'),
(16, 'Can add log entry', 6, 'add_logentry'),
(17, 'Can change log entry', 6, 'change_logentry'),
(18, 'Can delete log entry', 6, 'delete_logentry'),
(19, 'Can add image', 7, 'add_image'),
(20, 'Can change image', 7, 'change_image'),
(21, 'Can delete image', 7, 'delete_image'),
(22, 'Can add tag', 8, 'add_tag'),
(23, 'Can change tag', 8, 'change_tag'),
(24, 'Can delete tag', 8, 'delete_tag'),
(25, 'Can add article', 9, 'add_article'),
(26, 'Can change article', 9, 'change_article'),
(27, 'Can delete article', 9, 'delete_article'),
(28, 'Can add comment', 10, 'add_comment'),
(29, 'Can change comment', 10, 'change_comment'),
(30, 'Can delete comment', 10, 'delete_comment'),
(31, 'Can add trend', 11, 'add_trend'),
(32, 'Can change trend', 11, 'change_trend'),
(33, 'Can delete trend', 11, 'delete_trend');

-- --------------------------------------------------------

--
-- 表的结构 `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `auth_user`
--

INSERT INTO `auth_user` (`id`, `username`, `first_name`, `last_name`, `email`, `password`, `is_staff`, `is_active`, `is_superuser`, `last_login`, `date_joined`) VALUES
(1, 'ray', '', '', 'rayzy1991@163.com', 'pbkdf2_sha256$10000$wXNaYTPF62qp$nbLmzUFCwFHnEMJdEVx8bnazRIlC+v+nynye1EHAnoc=', 1, 1, 1, '2013-06-27 12:56:29', '2013-06-27 12:56:29'),
(2, '', 'test', '', 'rayzy1991@gmail.com', '123456', 0, 1, 0, '2013-06-28 01:55:54', '2013-06-28 01:55:54');

-- --------------------------------------------------------

--
-- 表的结构 `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_403f60f` (`user_id`),
  KEY `auth_user_groups_425ae3c4` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `auth_user_groups`
--


-- --------------------------------------------------------

--
-- 表的结构 `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_403f60f` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `auth_user_user_permissions`
--


-- --------------------------------------------------------

--
-- 表的结构 `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
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
  KEY `django_admin_log_1bb8f392` (`content_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `django_admin_log`
--


-- --------------------------------------------------------

--
-- 表的结构 `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `name`, `app_label`, `model`) VALUES
(1, 'permission', 'auth', 'permission'),
(2, 'group', 'auth', 'group'),
(3, 'user', 'auth', 'user'),
(4, 'content type', 'contenttypes', 'contenttype'),
(5, 'session', 'sessions', 'session'),
(6, 'log entry', 'admin', 'logentry'),
(7, 'image', 'image', 'image'),
(8, 'tag', 'article', 'tag'),
(9, 'article', 'article', 'article'),
(10, 'comment', 'article', 'comment'),
(11, 'trend', 'trend', 'trend');

-- --------------------------------------------------------

--
-- 表的结构 `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_3da3d3d8` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `django_session`
--


-- --------------------------------------------------------

--
-- 表的结构 `ms_articles`
--

CREATE TABLE IF NOT EXISTS `ms_articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `desc` varchar(256) DEFAULT NULL,
  `create_at` datetime NOT NULL,
  `last_at` datetime NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `content` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ms_articles_403f60f` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `ms_articles`
--

INSERT INTO `ms_articles` (`id`, `name`, `desc`, `create_at`, `last_at`, `enabled`, `user_id`, `content`) VALUES
(0, '关于我', '关于我', '2013-06-27 12:57:59', '2013-06-28 01:46:39', 1, 1, '<p>我是张杨，91年1月生，江苏徐州人，2012年6月大学毕业，学得嵌入式专业，可是大学光玩了，也没学好。</p><p>2011年底，大学没有学到实在的技能，<span style="line-height: 1.6em;">直接走向社会等于自取灭亡</span><span style="line-height: 1.6em;">，所以我去参加了一个JavaEE开发的培训，当时没想别的，就是掌握一个技术，以后不至于在社会上混不下去。就这样，我也算是误打误撞进入了IT行业。</span></p><p>在培训期间，我无时不刻都在挖掘自身的潜力，由于花了大量的学费，再加上紧迫与使命感，我对软件技术的热情以及自身的技能在不断增长着，就这样，我也算是圆满的完成了培训的课程，毕业时基本掌握了基于Spring的WEB技术体系。</p><p>2012年3月在天津，加入了一个创业互联网公司（canditu.com），做JavaWEB开发，当时包揽了该网站所有的技术工作。创业互联网公司，每天都需要研究各种新技术，尝试各种新鲜玩意，而且还需要自己参加产品设计，包括UI和交互。在同年，我通过各种渠道接触了“前端工程师”这一职业定义，由于自身有美术功底，加上特别钟爱设计，结合自身的职业特点，我确定，“前端”这个职业是我所爱的。</p><p>现在，我在南京做WEB前端工程师，负责前端开发和UX设计。</p><p>我使用Java和Python两种后端语言，致力于前端开发，专攻HTML5与JavaScript。我主要使用Spring和django两个WEB框架。我是一个以产品为导向的人，任何技术与设计的价值在我的概念里都体现在解决市场需求。我反对沉溺于技术，我觉得那是不实际的做法，但我不会丢掉技术情怀，因为技术始终是我的立身之本，经过了两年的锤炼，现在的我技术功底很扎实，与传统的软件工程师比起来，我对自己的评价更是“产品工程师”。</p>'),
(7, '个人网站开发总结', '现在你正在浏览的网站，不是用wordpress，不是用什么cms搭建的，它是基于django框架、前端使用bootstrap、less ，如果你对python、django、bootstrap有兴趣，或者对如何使用新浪云服务器，又或者你是一个想了解web工程是如何被开发出来的技术菜鸟，那么你需要读这篇文章，顺便说一下，不要忘了给我反馈。', '2013-07-01 02:40:36', '2013-07-01 02:45:45', 1, NULL, '<p><b><font face="Arial Black">项目背景</font></b></p><p>很多搞IT的都会有个人网站，用来收藏自己的心得、分享知识、晒作品等。同时，个人网站对我们技术人员来讲已然有了脸面作用，技术人员的招聘中很常见会有这么一条「有个人技术博客加分」。我呢，为了提升自己的竞争力，增大自身市场价值，同时也想要把自己写的东西分享给每一个人，得到最直接的评价、讨论、学习，所以，很简单，我也需要有一个个人网站。其实原来也设计过好几个版本，只不过是停留在设计阶段。现在我需要开始编码而不能只是简单的设计原型了，就像scrum说的，我需要一个可以运行的个人网站，而不是一票原型PSD或者几个静态html。</p><p><img src="http://rayzy1991-media.stor.sinaapp.com/mysite_end_1.png" data-pinit="registered"></p><p><img src="http://rayzy1991-media.stor.sinaapp.com/mysite_end_2.png" data-pinit="registered"></p><p><img src="http://rayzy1991-media.stor.sinaapp.com/mysite_end_3.png" data-pinit="registered"></p><p><b>确定需求</b></p><p>软件，首先要确定的事情当然就是要解决什么问题，客户需要什么。我个人就是客户，我很清楚我想要什么，而且大致上跟普通的个人博客没什么区别，所以这个过程我很快就完成了，基本上没用几个小时，用xmind画了一个需求概要图，就算是确定我的需求了，实际上在开发过程中我也加了不少新的功能。</p><p><img src="http://rayzy1991-media.stor.sinaapp.com/mysite_end_4.jpg" data-pinit="registered"></p><p><b>技术选型</b></p><p>确定了需求，就是准备技术选型了。我没钱，买不了服务器，只能用免费的虚拟空间。我选择了新浪云，它不会被墙，对开发者免费，支持php, java , python这三种语言，php我不会，而且从一开始就没打算用现成的cms构建博客；java看了一下sae文档，挺复杂的，也抛弃；尝试了一下python，由于我有过django的开发经验而sae对django1.4的支持也相当出色，那么很显然，我的技术选型已经确定了三分之二了——服务器、数据库、web框架；剩下的就是前端，bootstrap——我钟爱的前端利器，已经足够多的css组件与jq插件，而且支持less高度定制，那么ok，整个的技术体系也就确立了，开发工具选择了web开发利器，Aptana Studio 3，直接集成了less，pydev简直就是给bootstrap + django量身打造的。</p><p>剩下的就是代码的版本控制，放到了我的github上。 原型界面，less，python源码都在上面，想要clone看一下吗？（<a href="https://github.com/lpgray/mysite-main"><u>https://github.com/lpgray/mysite-main</u></a>）</p><p><b>原型和UI设计</b></p><p>ok，基本的都确定了。接下来就是一个文艺青年最爱的工作，用户体验设计（交互、原型、视觉），这个过程就不多赘述了，基本过程 —— 页面信息架构，线框图，UI设计。</p><p><img src="http://rayzy1991-media.stor.sinaapp.com/mysite_end_5.png" data-pinit="registered"></p><p><img src="http://rayzy1991-media.stor.sinaapp.com/mysite_end_6.png" data-pinit="registered"></p><p><br></p><p><b>开发过程</b></p><p>技术选型确定，UI设计稿、视觉规范确定。接下来就进入了开发期，算了一下，前面的一些个工作共消耗了我3天的零碎时间。往往我喜欢从前往后开发，因为一个一个页面、一个一个功能是最直观的，不过这样有一个坏处，就是一些通用的后端调用不便于提前发现。不过这样也有一个好处，在实体确定之前搞定前端界面开发，一些测试假数据能够很好的验证需求，从而让你的数据库实体设计更加的灵活、可扩展，抽象的需求描述中很难确定一个系统有多少实体。</p><p><b>前端开发：</b>我设计的个人网站并不是复杂的单页应用，所以JS的架构就不需要大搞了，基本的jquery写一些简单的交互和逻辑就ok了，不过特别介绍款插件给大家，validationEngine，表单的前端校验是制作web应用必需要做的，validationEngine很简单轻松高效。另外还要分享一些前端开发心得，在我的开发工作中，总结了前后端基本数据交互形态：页面跳转、ajax请求数据显示在特定区域、ajax删除、操作以后的tip提示、表单提交、表单ajax提交，说白了就只有这些，我找到了这些形态的共性，总结出了自己的一套js工具代码，果真是一劳永逸。所以建议各位在日常工作中，无论是编程也好还是做业务也好，要善于总结并制定精准的进击策略，有时候真觉得编程跟生活有异曲同工的地方，这也是编程对我的吸引点之一。废话了啊，不好意思，说起前端开发，就不得不提bootstrap如何能使用的更灵活，在这里就直接传授实打实的经验给大家，用bootstrap却不使用它的less就是浪费，less是很好的东西，我的页面基本0重写，完全是扩充bootstrap的less得到的效果，是不是很不错哦？</p><p><b>实体设计：</b>完成了页面制作，接下来我比较习惯做数据库设计，通过页面可以很轻松的总结出包含的基本数据，从而能把数据归纳成若干实体，就这样，经过分析，简单的几张表就构成了我网站的数据库。在这里传授一个经验，数据库实体之间的关系，尽量多用中间表去维护，避免直接建立外键联系，因为这样的话实体会很难扩展，等系统复杂起来各实体之间的关系会相当难维护。</p><p><b>后端开发：</b>后端主要是基于django的设计原则进行开发，即MTV（Model Template View）实际上View就是django中写主要的业务逻辑的地方，同时它还起着控制器的角色，不过值得一提的是，django的view是默认的事务层，也就是说一个view的执行过程就是一个数据库事务的开始和结束，这与java的Spring是不一样的，Spring的事务控制一般是在Service层做，django的view是集合了Controller和Service的双重职能，但Model也集合了Service的职能，Model是做持久层映射同时还可以做自身以及从属实体的增删改查，实际上调用django本身自带的很多Model相关的方法已经可以完成绝大多数业务逻辑了，Template指的是django强大的页面模板，它可以继承、可以包含而且内置了很多强大的标签，我感觉很多成熟的java模板也难以相比，毕竟python是动态语言，java是静态的。</p><p><b>单元测试和其他组件：</b>至于单元测试，django已经内置了，只需要简单的继承django.test.TestCase，run as Python unittest 然后以「test_」开头的方法都会自动运行，自动化测试。django已经自带了很多web工程需要的各种组件——缓存、事务、权限、日志、消息等，现在还支持了空间数据类型，相当厉害，与百花齐放的Java/Spring相比，Python/django的体系更加统一、学习成本低，而且据说性能上后者也丝毫不会输给前者。</p><p><b>django开发技巧总结：</b>在我后端的开发过程中，总共进行了两次重构，在这里总结一下。</p><p>第一次是发现很多实体存在相同的属性，比如创建时间、最后修改时间、是否可用、名称、描述、id，这些都是通用的，而我在实体类代码里全部都写了N遍，这很不方便管理，于是我编写出了一个BaseModel，在django框架中声明为abstract，这样django在自动生成数据库时就不会将它映射成表了，其他实体皆继承自它。</p><p>第二次是我在写根据条件查询的功能时候发现，django本身自带了非常强大的条件查询参数，我可以不用经过后台的任何转换，直接从前端传递django可以识别的参数进行查询，后端的工作成本就基本接近0，于是我写出了一个通用的query方法，任何实体，想查询什么只要直接在页面中写django识别的关键字，就可以了。比如我想要查询标签有「html」的文章，我只需要传参&nbsp;<span style="line-height: 1.6em;">?tags__name=html ，直接在后台根据这个条件查询就可以，不用任何转换。</span></p><p><b>项目总结</b></p><p>个人网站这个小项目，实践了一个web工程从无到有的过程：需求——（选型——原型）——界面——开发——测试——运行，括号中的过程有待考虑到底哪个在前面会更好。不过，这个小项目还是太小了，可以算一个教程案例吧，不过也积累了无论是技术上还是产品设计上的不少经验，如果朋友们想细致研究一下web开发，非常欢迎与我交流、无论你对python、java还是前端开发，都可以。</p>');

-- --------------------------------------------------------

--
-- 表的结构 `ms_articles_imgs`
--

CREATE TABLE IF NOT EXISTS `ms_articles_imgs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `article_id` (`article_id`,`image_id`),
  KEY `ms_articles_imgs_30525a19` (`article_id`),
  KEY `ms_articles_imgs_6682136` (`image_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `ms_articles_imgs`
--

INSERT INTO `ms_articles_imgs` (`id`, `article_id`, `image_id`) VALUES
(2, 7, 2),
(3, 7, 3),
(4, 7, 4),
(5, 7, 5),
(6, 7, 6),
(7, 7, 7);

-- --------------------------------------------------------

--
-- 表的结构 `ms_articles_tags`
--

CREATE TABLE IF NOT EXISTS `ms_articles_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `article_id` (`article_id`,`tag_id`),
  KEY `ms_articles_tags_30525a19` (`article_id`),
  KEY `ms_articles_tags_3747b463` (`tag_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

--
-- 转存表中的数据 `ms_articles_tags`
--

INSERT INTO `ms_articles_tags` (`id`, `article_id`, `tag_id`) VALUES
(38, 7, 7),
(37, 7, 10),
(36, 7, 9),
(35, 7, 8);

-- --------------------------------------------------------

--
-- 表的结构 `ms_comments`
--

CREATE TABLE IF NOT EXISTS `ms_comments` (
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
  KEY `ms_comments_660555d6` (`root_komment_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `ms_comments`
--


-- --------------------------------------------------------

--
-- 表的结构 `ms_images`
--

CREATE TABLE IF NOT EXISTS `ms_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `desc` varchar(256) DEFAULT NULL,
  `create_at` datetime NOT NULL,
  `last_at` datetime NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `path` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `ms_images`
--

INSERT INTO `ms_images` (`id`, `name`, `desc`, `create_at`, `last_at`, `enabled`, `path`) VALUES
(2, NULL, NULL, '2013-07-01 02:40:36', '2013-07-01 02:40:36', 1, 'mysite_end_6.png'),
(3, NULL, NULL, '2013-07-01 02:42:03', '2013-07-01 02:42:03', 1, 'mysite_end_3.png'),
(4, NULL, NULL, '2013-07-01 02:43:08', '2013-07-01 02:43:08', 1, 'mysite_end_1.png'),
(5, NULL, NULL, '2013-07-01 02:43:40', '2013-07-01 02:43:40', 1, 'mysite_end_4.jpg'),
(6, NULL, NULL, '2013-07-01 02:44:24', '2013-07-01 02:44:24', 1, 'mysite_end_2.png'),
(7, NULL, NULL, '2013-07-01 02:45:09', '2013-07-01 02:45:09', 1, 'mysite_end_5.png');

-- --------------------------------------------------------

--
-- 表的结构 `ms_tags`
--

CREATE TABLE IF NOT EXISTS `ms_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `desc` varchar(256) DEFAULT NULL,
  `create_at` datetime NOT NULL,
  `last_at` datetime NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `ms_tags`
--

INSERT INTO `ms_tags` (`id`, `name`, `desc`, `create_at`, `last_at`, `enabled`) VALUES
(7, 'django', NULL, '2013-07-01 02:40:24', '2013-07-01 02:40:24', 1),
(8, 'bootstrap', NULL, '2013-07-01 02:40:24', '2013-07-01 02:40:24', 1),
(9, '前端开发', NULL, '2013-07-01 02:40:28', '2013-07-01 02:40:28', 1),
(10, 'web开发', NULL, '2013-07-01 02:40:28', '2013-07-01 02:40:28', 1);

-- --------------------------------------------------------

--
-- 表的结构 `ms_trends`
--

CREATE TABLE IF NOT EXISTS `ms_trends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `desc` varchar(256) DEFAULT NULL,
  `create_at` datetime NOT NULL,
  `last_at` datetime NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `path` varchar(200) DEFAULT NULL,
  `content` longtext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `ms_trends`
--

INSERT INTO `ms_trends` (`id`, `name`, `desc`, `create_at`, `last_at`, `enabled`, `path`, `content`) VALUES
(6, 'article created', '它属于  <a href="/article/query?tags__name=django">django</a>， <a href="/article/query?tags__name=bootstrap">bootstrap</a>， <a href="/article/query?tags__name=前端开发">前端开发</a>， <a href="/article/query?tags__name=web开发">web开发</a> 之类的。', '2013-07-01 02:40:36', '2013-07-01 02:40:36', 1, 'mysite_end_6.png', '<strong>我</strong> 创建了一篇文章 <a href="/article/7">个人网站开发总结</a>。');
