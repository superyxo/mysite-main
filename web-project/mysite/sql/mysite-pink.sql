-- phpMyAdmin SQL Dump
-- version 3.3.8.1
-- http://www.phpmyadmin.net
--
-- 主机: w.rdc.sae.sina.com.cn:3307
-- 生成日期: 2013 年 06 月 21 日 20:30
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
-- 表的结构 `ms_articles`
--

CREATE TABLE IF NOT EXISTS `ms_articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `desc` varchar(32) DEFAULT NULL,
  `createAt` datetime NOT NULL,
  `lastModifiedAt` datetime NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `content` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ms_articles_403f60f` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=19 ;

--
-- 转存表中的数据 `ms_articles`
--

INSERT INTO `ms_articles` (`id`, `name`, `desc`, `createAt`, `lastModifiedAt`, `enabled`, `user_id`, `content`) VALUES
(3, '个人博客开发记录', NULL, '2013-04-09 14:59:06', '2013-03-25 13:43:08', 1, 1, '经历了大概半个月吧，磨磨蹭蹭，终于把博客的文章模块部分写完了，现在记录一下开发的几个历程吧。\r\n<strong>1.需求先行</strong><br />\r\n我想要有自己的博客，可以写点文章传点图片什么的，了解过wordpress，实在不想用它，觉得不得劲，还是自己写比较好，能练练手。对Python很感兴趣，于是就决定用Django去做，django不是号称时间节点完美主义者首选框架么，我就试试他有多么完美（事实证明的确很好用(*^__^*) 嘻嘻……）。\r\n需求其实很简单，就是发布文章，别人可以评论，文章需要有标签，可以通过标签搜索文章，就是这么简单的需求，后期会加一些图片模块，静态作品展示模块等，这些都跟标签有关系，所以对标签部分的数据库设计要有良好的扩展性。<br />\r\n<strong>2.UI与交互设计</strong><br />\r\n选择了自己最爱的玫红色，稍微设计了一下logo，主要风格模仿了豆瓣，就是感觉没有模仿到点子上，搞得现在不伦不类的......还有人说像不良小站<br />\r\n<strong>3.实体设计（数据库设计）</strong><br />\r\n上文说了，第一阶段主要做文章和标签，所以简单的设计了3张表，实体就两个，用中间表控制关系，再扩展就加中间表就好了（嗯，你用wordpress数据库好扩展么？我觉得数据库很不容易扩展）。至于创建文章还有评论的权限部分就很方便啦，直接用的Django内置的模块，相当方便。<br />\r\nTable:ms_articles<br />\r\nTable:ms_tags<br />\r\nTable:ms_ms_articles_ms_tags (Relationship)<br />\r\n<strong>4.模块设计</strong><br />\r\n目前就搞了一个文章模块，在django中，它是一个独立的app。在该模块中主要与两个子模块有关联（标签模块、评论模块）。所以在做程序的时候模块之间的耦合度降到最低。\r\n<strong>5.搭框架，写代码</strong><br />\r\n这个过程没什么记录的，写代码一定要美，必须要美。Python，本来就很美...<br />\r\n<strong>6.细节记录</strong><br />\r\n整理了一个Error List贴一下吧，为以后的开发提醒.<br />\r\n<pre class="prettyprint">\r\n====== UnSolve ======\r\n1. @request_POST\r\n5. Reverse showArticle \r\n6. Transaction in view level\r\n7. auth_user password\r\n8. I want to show sql in console\r\n9. Template URL''s definition in a template file. \r\n\r\n====== Solved ======\r\n2. 1366, "Incorrect string value: ''\\\\xE5\\\\xAF\\\\xB9\\\\xE8\\\\xB1\\\\xA1'' for column ''article_name'' at row 1"\r\n	-- local MySql gb2312\r\n3. redirect\r\n	-- return redirect(...)\r\n4. {{ csrf_token }} isn''t displayed in the template after the view that returns with the ''render_to_response(''view_name.htm'', locals())''\r\n	-- locals().update(csrf(request))  first, when u can call the locals() function\r\n</pre>\r\n<strong>未完待续......</strong>'),
(10, '前端代码命名规范 v 0.1', NULL, '2013-04-21 02:49:17', '2013-04-09 09:21:16', 1, 1, '<div>\r\n<div style="word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space;"><span style="font-size: 19px;">1. HTML 页面中 id 与 class 命名规范<br></span><div><span style="font-size: 16px;"><br></span></div><div><span style="font-size: 16px;">1.1. js 操作的 dom 部分 id 与 class 命名规范?</span><font color="#EB0073">‘<b>#J_*</b></font>’,?<font color="#EB0073">‘<b>.j_*</b></font>’\r\n<ul><li>JavaScript操作的DOM的id命名：以‘#J_’开头， 全部大写，下划线命名法，如?J_NAV_LIST_CTN，表示JavaScript操作的一个导航列表容器</li><li>JavaScript操作的DOM的class命名：以‘.j_’开头，全部小写，下划线命名法，如?j_nav_item，表示JavaScript操作的一个导航选项</li><li>这里联系一个传统原则，表现与逻辑分离，以上两点也是表现逻辑分离的体现</li></ul><div style="font-size: 16px;">1.2. css 布局的 dom 部分 id 与 class?命名规范 ''<b><font color="#EB0073">.*-*-*</font></b>'' ''<b><font color="#EB0073">#xxXxXx</font></b>''( 不推荐用 id 关联展现 )</div></div><div><ul><li>展现类 css class一律用减号''-'' 分割关键字 如: .nav-list-ctn , 表示导航列表容器</li><li>展现不建议使用 id 方式绑定 css。一般 id 都是用在 js 操作 dom 上，如非得要绑定就用骆驼吧 : #navListCtn</li><li>抽象UI组件 class 名称定义：''.ui-'' 开头，如 ''.ui-nav''，如果使用 bootstrap 就先忽略这点</li></ul><div>1.3. 语义化与数据类标签的布局?''<b><font color="#EB0073">.*-*-wrap</font></b>''</div></div><div><ul><li>语义化网上资料多的是，大概的传统的 h1-h6, 后来html5又加入了更多语义化标签的支持，header, footer, acticle, aside, nav, section, hgroup, address 好像 b, i 也被赋予了语义的角色, 语义化的标签大部分可以认为是数据展示类标签。</li><li>什么时候用数据类标签，例子: 展示一个商品列表，大部分是用 ul, o, dl dt dd, 或 table , p , pre, code等, 说白了就是为展示数据而存在的标签，极其不推荐对数据展示类标签赋予任何布局类属性(margin, padding, content:'''', float, position, border等)。总之，div就是为了布局存在的，数据展示类标签就是为了展示数据存在的，这是完全不同的职能。</li><li>如何为数据布局，推荐在布局类标签外套 div. 基本命名规范如 ''.nav-list-wrap'' 这个 ''-wrap'' 是关键，说明了他是一个数据的外部环绕层: &lt;div class=&quot;article-wrap&quot;&gt; &lt;p&gt;这是一篇文章&lt;/p&gt; &lt;/div&gt;，通常的布局，全部通过 article-wrap来做.所以对一切数据展示类标签的外层都推荐套一个用于对其布局的&lt;div&gt;</li></ul><div>1.4. 关于状态展示的 class 名称定义 ''<b><font color="#EB0073">.active</font></b>'', ''<b><font color="#EB0073">.disabled</font></b>''</div><div><ul><li>一般情况下页面中的元素会有自己的状态，比如被选中的，活动的，禁用的等</li><li>被选中, 激活中的全部推荐在 class 名称下追加 ''.active'' 类名，不可用的，尚未激活的推荐追加 ''.disabled''</li></ul></div><div><br></div><div><span style="font-size: 19px;">2. JS 源码中命名规范</span></div></div><div>2.1. js库依赖的css命名规范.&quot;<font color="#EB0073"><b>#_UI_NAV</b></font>&quot; &quot;<font color="#EB0073"><b>._ui_nav_list</b></font>&quot; 下划线开头，表达私有的含义</div></div>\r\n</div>'),
(11, 'Modernizr - HTML5与CSS3的特性检测库', NULL, '2013-04-16 02:55:22', '2013-04-16 02:50:33', 1, 1, 'Modernizr是一个开源的js库，它可以帮web设计者更轻松的根据不同的浏览器特性去实现不同层级的体验。它可以帮助设计者充分使用所有的HTML5与CSS3特性，当然只要对方浏览器支持，这会带来一个好处，不会因为跨浏览器开发而牺牲用户体验。<br />\r\n<br />\r\n当你使用Modernizr库的时候，它会检测是否当前的浏览器支持诸如@font-face, border-radius, border-image, box-shdow, rgba() 等所有的CSS3特性，以及HTML5特性，如autio, video, localStorage 及新的&lt;input&gt;标签类型和属性。<br />\r\n<br />\r\n通过这些了解，你肯定可以利用浏览器的对这些特性的原生实现去设计或者决定是用JS补充或者优雅降级在低端浏览器忽略这些特性。此外，Modernizr可以在帮助IE浏览器中用样式表美化HTML5新元素，所以现在你立刻就可以使用它们的语义特性。<br />\r\n<br />\r\nModernize是依照渐进增强（Progressive Enhancement）原则创建的。即使你喜欢用手写，或者JS库去生成前端代码，它都支持。<br />\r\n<br />\r\n<h5>开始使用Modernizr</h5><br />\r\n你必须将Modernizr脚本放到head部(如果你的网站不需要支持IE8或者不用担心FOCU(css闪光))<br />\r\n给html添加 ''no-js'' class<br />\r\nModernizr会自动查带有''js''class的元素<br />\r\nModernizr也会创建一个js对象-‘Modernizr’, 该对象可以检测特性是否支持，比如Modernizr.cavans可以返回一个boolean值，来表示浏览器是否支持canvas特性。此外还有一些更加详细的特性信息，比如Modernizr.video.h264将会让你知道是否浏览器支持特定的codec. Modernizr.inputtypes.search会告诉你是否浏览器支持input[type=''search'']。<br />\r\n剩下的就是你的工作了，你可以用诸如：<br />\r\n.borderradius div{ border-radius: 5px } 在支持圆角的浏览器中去使用圆角<br />\r\n<br />\r\n<h5>Polyfills（填充物，替代器）and Modernizr</h5><br />\r\nModernizr实际上是一个是我们开发过程得到解放的类库，它是一个可以让你在IE浏览器下使用新html5新标签元素的库，但不能支持其他的一些特性。实际上Modernizr也会在浏览器原生脚本支持不好的时候支持一些特性，这些脚本被称为Polyfills(填充物)。<br />\r\n<br />\r\n\r\n"polyfill(n):" 一个js夹子，它可以为老旧的浏览器复制新的标准特性。<br />\r\n<br />\r\n\r\n\r\n比如一个 WebSocket 填充物可以创建一个 window.WebSocket 全局对象，它包含着跟标准WebSocket同样的方法和属性。这个特性意味着你可以为将来编程，你可以用真正的API编程，只需要加载兼容填充物在那些老旧的浏览器上。Modernizr提供了一个包含几乎所有的HTML5及CSS3的Polyfills, 就在它的GitHub上(<a href="https://github.com/Modernizr/Modernizr/wiki/HTML5-Cross-Browser-Polyfills">https://github.com/Modernizr/Modernizr/wiki/HTML5-Cross-Browser-Polyfills</a>)。当然在老旧的浏览器上你可以使用填充物，但你要为性能和体验考虑。<br />\r\n'),
(18, '利用gruntjs自动化压缩js', NULL, '2013-05-22 06:51:34', '2013-05-24 09:06:20', 1, 1, '<div>\r\n<div style="word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space;"><div style="font-size: 15px;"><b>搭建环境</b></div><div style="font-size: 15px;"><ol><li>首先安装 npm&nbsp;<a href="https://npmjs.org/">https://npmjs.org/</a></li><li><b><font color="#FF4635">npm install -g grunt-cli</font></b>(<span style="background-color: rgb(255, 255, 255); color: rgb(111, 90, 64); font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 25.59375px;">command line interface</span>)</li><li><b><font color="#FF4635">npm install -g grunt-init</font></b></li></ol></div><div style="font-size: 15px;"><b><br></b></div><div style="font-size: 15px;"><b>创建Grunt项目</b></div><div style="font-size: 15px;"><ol><li>去github上克隆一个模板</li><li>将模板保存在 ~/.grunt-init/template下，文件夹名即模板名</li><li>去你想创建项目的文件夹下，例如 <b><font color="#FF4635">grunt-init jquery</font></b> 创建一个基于jquery插件模板的工程，grunt会自动问你一些问题，你就可以成功的以jquery模板创建一个项目。</li><li>如何自定义模板，参见官方网站&nbsp;<a href="http://gruntjs.com/project-scaffolding">http://gruntjs.com/project-scaffolding</a></li></ol></div><div style="font-size: 15px;"><br></div><div style="font-size: 15px;"><b>运行grunt自动化工具</b></div><div style="font-size: 15px;"><ol><li>配置完毕你的GruntFile</li><li>在项目root文件夹执行?<b><font color="#FF4635">npm install&nbsp;</font></b>运行完成后将会下载各种依赖</li><li>运行 <b><font color="#FF4635">grunt</font></b> 命令，ok，你的目的达到了。</li></ol></div><div style="font-size: 15px;"><br></div><div style="font-size: 15px;"><b>项目文件结构说明</b></div><div><ul><li><span style="font-size: 15px;">GruntFile.js &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span><span style="font-size: 15px;">#grunt的主要配置文件</span></li><li><span style="font-size: 15px;">package.json &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;#项目声明文件，依赖grunt插件也声明在这里</span></li><li><span style="font-size: 15px;">[项目名].[模板名].js</span><span style="font-size: 15px;">&nbsp; &nbsp; #项目属性信息声明</span></li></ul></div><div><span style="font-size: 15px;"><br></span></div><div><span style="font-size: 15px;"><b>Gruntjs示例-压缩JavaScript</b></span></div><div><span style="font-size: 15px;">我做了一个测试，利用gruntjs来自动化运行压缩js的任务，主要操作步骤参见创建“Grunt项目”, “运行grunt自动化工具”两节，</span><span style="font-size: 15px;">其实grunt的主要操作步骤还是集中在GruntFile.js这个文件的配置，以下是我这个示例的GruntFile的代码。</span></div><div align="left"><font color="#8F9D6A" face="Courier New"><span style="background-color: rgb(20, 20, 20);"><u><br></u></span></font></div><div align="left"><div align="left"><font color="#005C00" face="Courier New" size="1"><span style="font-size:9pt"><u>''</u></span><span style="font-size:9pt">use strict''</span></font> <font color="#5C5C5C" face="Courier New" size="1"><span style="font-size:9pt">;</span></font></div><div align="left"><font color="#010101" face="Courier New" size="1"><span style="font-size:9pt"><br></span></font></div><div align="left"><font face="Courier New" size="1"><span style="font-size:9pt"><u>m</u></span><span style="font-size:9pt">odule.</span></font> <font color="#A31515" face="Courier New" size="1"><span style="font-size:9pt">exports</span></font> <font color="#5C5C5C" face="Courier New" size="1"><span style="font-size:9pt">=</span></font> <font color="#0000C0" face="Courier New" size="1"><span style="font-size:9pt"><b>function</b></span></font> <font face="Courier New" size="1"><span style="font-size:9pt"><b>(</b></span><span style="font-size:9pt">grunt</span><span style="font-size:9pt"><b>)</b></span> <span style="font-size:9pt">{</span></font></div><div align="left"><font color="#010101" face="Courier New" size="1"><span style="font-size:9pt"><br></span></font></div><div align="left"><font face="Courier New" size="1"><span style="font-size:9pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></font> <font color="#008000" face="Courier New" size="1"><span style="font-size:9pt">// Project configuration.</span></font></div><div align="left"><font face="Courier New" size="1"><span style="font-size:9pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;grunt.initConfig({</span></font></div><div align="left"><font face="Courier New" size="1"><span style="font-size:9pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></font> <font color="#008000" face="Courier New" size="1"><span style="font-size:9pt">// Metadata.</span></font></div><div align="left"><font face="Courier New" size="1"><span style="font-size:9pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;pkg : grunt.file.readJSON(</span></font> <font color="#005C00" face="Courier New" size="1"><span style="font-size:9pt">''GruntDemo.jquery.json''</span></font><font face="Courier New" size="1"><span style="font-size:9pt">),</span></font></div><div align="left"><font face="Courier New" size="1"><span style="font-size:9pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;banner :</span></font> <font color="#005C00" face="Courier New" size="1"><span style="font-size:9pt">''/*! &lt;%= pkg.title || pkg.name %&gt; - v&lt;%= pkg.version %&gt; - ''</span></font> <font color="#5C5C5C" face="Courier New" size="1"><span style="font-size:9pt">+</span></font></div><div align="left"><font color="#5C5C5C" face="Courier New" size="1"><span style="font-size:9pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></font> <font color="#005C00" face="Courier New" size="1"><span style="font-size:9pt">''&lt;%= grunt.template.today(&quot;yyyy-mm-dd&quot;) %&gt;\\n''</span></font> <font color="#5C5C5C" face="Courier New" size="1"><span style="font-size:9pt">+</span></font></div><div align="left"><font color="#5C5C5C" face="Courier New" size="1"><span style="font-size:9pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></font> <font color="#005C00" face="Courier New" size="1"><span style="font-size:9pt">''&lt;%= pkg.homepage ? &quot;* &quot; + pkg.homepage + &quot;\\\\n&quot; : &quot;&quot; %&gt;''</span></font> <font color="#5C5C5C" face="Courier New" size="1"><span style="font-size:9pt">+</span></font></div><div align="left"><font color="#5C5C5C" face="Courier New" size="1"><span style="font-size:9pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></font> <font color="#005C00" face="Courier New" size="1"><span style="font-size:9pt">''* Copyright (c) &lt;%= grunt.template.today(&quot;yyyy&quot;) %&gt; &lt;%= pkg.author.name %&gt;;''</span></font> <font color="#5C5C5C" face="Courier New" size="1"><span style="font-size:9pt">+</span></font></div><div align="left"><font color="#5C5C5C" face="Courier New" size="1"><span style="font-size:9pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></font> <font color="#005C00" face="Courier New" size="1"><span style="font-size:9pt">'' Licensed &lt;%= _.pluck(pkg.licenses, &quot;type&quot;).join(&quot;, &quot;) %&gt; */\\n''</span></font> <font face="Courier New" size="1"><span style="font-size:9pt">,</span></font></div><div align="left"><font face="Courier New" size="1"><span style="font-size:9pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></font> <font color="#008000" face="Courier New" size="1"><span style="font-size:9pt">// Task configuration.</span></font></div><div align="left"><font face="Courier New" size="1"><span style="font-size:9pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;concat : {</span></font></div><div align="left"><font face="Courier New" size="1"><span style="font-size:9pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;options : {</span></font></div><div align="left"><font face="Courier New" size="1"><span style="font-size:9pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;banner :</span></font> <font color="#005C00" face="Courier New" size="1"><span style="font-size:9pt">''&lt;%= banner %&gt;''</span></font><font face="Courier New" size="1"><span style="font-size:9pt">,</span></font></div><div align="left"><font face="Courier New" size="1"><span style="font-size:9pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;stripBanners :</span></font> <font color="#800040" face="Courier New" size="1"><span style="font-size:9pt">true</span></font></div><div align="left"><font color="#800040" face="Courier New" size="1"><span style="font-size:9pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></font> <font face="Courier New" size="1"><span style="font-size:9pt">},</span></font></div><div align="left"><font face="Courier New" size="1"><span style="font-size:9pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dist : {</span></font></div><div align="left"><font face="Courier New" size="1"><span style="font-size:9pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;src : [</span></font> <font color="#005C00" face="Courier New" size="1"><span style="font-size:9pt">''src/&lt;%= pkg.name %&gt;.js''</span></font><font face="Courier New" size="1"><span style="font-size:9pt">,</span></font> <font color="#005C00" face="Courier New" size="1"><span style="font-size:9pt">''test/&lt;%= pkg.name %&gt;_test.js''</span></font><font face="Courier New" size="1"><span style="font-size:9pt">],</span></font> <font color="#008000" face="Courier New" size="1"><span style="font-size:9pt">// 合并 src下的GruntDemo.js与test下的GruntDemo_test.js</span></font></div><div align="left"><font face="Courier New" size="1"><span style="font-size:9pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dest :</span></font> <font color="#005C00" face="Courier New" size="1"><span style="font-size:9pt">''dest/&lt;%= pkg.name %&gt;.js''</span></font><font color="#008000" face="Courier New" size="1"><span style="font-size:9pt">// 合并成dest下的GruntDemo.js</span></font></div><div align="left"><font face="Courier New" size="1"><span style="font-size:9pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}</span></font></div><div align="left"><font face="Courier New" size="1"><span style="font-size:9pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></font> <font color="#008000" face="Courier New" size="1"><span style="font-size:9pt">//</span></font></div><div align="left"><font face="Courier New" size="1"><span style="font-size:9pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uglify : {</span></font></div><div align="left"><font face="Courier New" size="1"><span style="font-size:9pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;options : {</span></font></div><div align="left"><font face="Courier New" size="1"><span style="font-size:9pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;banner :</span></font> <font color="#005C00" face="Courier New" size="1"><span style="font-size:9pt">''/*! &lt;%= pkg.name %&gt; &lt;%= grunt.template.today(&quot;yyyy-mm-dd&quot;) %&gt; */\\n''</span></font> <font color="#008000" face="Courier New" size="1"><span style="font-size:9pt">// 压缩后的文件声明</span></font></div><div align="left"><font face="Courier New" size="1"><span style="font-size:9pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},</span></font></div><div align="left"><font face="Courier New" size="1"><span style="font-size:9pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;build : {</span></font></div><div align="left"><font face="Courier New" size="1"><span style="font-size:9pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;src :</span></font> <font color="#005C00" face="Courier New" size="1"><span style="font-size:9pt">''src/&lt;%= pkg.name %&gt;.js''</span></font><font face="Courier New" size="1"><span style="font-size:9pt">,</span></font></div><div align="left"><font face="Courier New" size="1"><span style="font-size:9pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dest :</span></font> <font color="#005C00" face="Courier New" size="1"><span style="font-size:9pt">''dest/&lt;%= pkg.name %&gt;.min.js''</span></font><font color="#008000" face="Courier New" size="1"><span style="font-size:9pt">// 压缩后的文件</span></font></div><div align="left"><font face="Courier New" size="1"><span style="font-size:9pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}</span></font></div><div align="left"><font face="Courier New" size="1"><span style="font-size:9pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}</span></font></div><div align="left"><font face="Courier New" size="1"><span style="font-size:9pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})</span></font> <font color="#5C5C5C" face="Courier New" size="1"><span style="font-size:9pt">;</span></font></div><div align="left"><font color="#010101" face="Courier New" size="1"><span style="font-size:9pt"><br></span></font></div><div align="left"><font color="#5C5C5C" face="Courier New" size="1"><span style="font-size:9pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></font> <font color="#008000" face="Courier New" size="1"><span style="font-size:9pt">// These plugins provide necessary tasks.</span></font></div><div align="left"><font face="Courier New" size="1"><span style="font-size:9pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;grunt.loadNpmTasks(</span></font> <font color="#005C00" face="Courier New" size="1"><span style="font-size:9pt">''grunt-contrib-concat''</span></font><font face="Courier New" size="1"><span style="font-size:9pt">)</span></font><font color="#5C5C5C" face="Courier New" size="1"><span style="font-size:9pt">;</span></font></div><div align="left"><font color="#5C5C5C" face="Courier New" size="1"><span style="font-size:9pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></font> <font face="Courier New" size="1"><span style="font-size:9pt">grunt.loadNpmTasks(</span></font><font color="#005C00" face="Courier New" size="1"><span style="font-size:9pt">''grunt-contrib-uglify''</span></font><font face="Courier New" size="1"><span style="font-size:9pt">)</span></font> <font color="#5C5C5C" face="Courier New" size="1"><span style="font-size:9pt">;</span></font></div><div align="left"><font color="#5C5C5C" face="Courier New" size="1"><span style="font-size:9pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></font></div><div align="left"><font face="Courier New" size="1"><span style="font-size:9pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></font> <font color="#008000" face="Courier New" size="1"><span style="font-size:9pt">// Default task.</span></font></div><div align="left"><font face="Courier New" size="1"><span style="font-size:9pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;grunt.registerTask(</span></font> <font color="#005C00" face="Courier New" size="1"><span style="font-size:9pt">''default''</span></font><font face="Courier New" size="1"><span style="font-size:9pt">, [</span></font><font color="#005C00" face="Courier New" size="1"><span style="font-size:9pt">''concat''</span></font> <font face="Courier New" size="1"><span style="font-size:9pt">,</span></font><font color="#005C00" face="Courier New" size="1"><span style="font-size:9pt">''uglify''</span></font> <font face="Courier New" size="1"><span style="font-size:9pt">])</span></font><font color="#5C5C5C" face="Courier New" size="1"><span style="font-size:9pt">;</span></font></div><div align="left"><font color="#010101" face="Courier New" size="1"><span style="font-size:9pt"><br></span></font></div><div align="left"><font face="Courier New" size="1"><span style="font-size:9pt">}</span></font><font color="#5C5C5C" face="Courier New" size="1"><span style="font-size:9pt">;</span></font></div></div></div>\r\n</div>');
INSERT INTO `ms_articles` (`id`, `name`, `desc`, `createAt`, `lastModifiedAt`, `enabled`, `user_id`, `content`) VALUES
(16, 'Android开发第一课', NULL, '2013-04-21 03:03:04', '2013-04-21 01:45:32', 1, 1, '<div>\r\n<div style="word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space;"><div style="font-size: 15px;">其实这篇笔记适用于那些Java基础较好，而且对Eclipse这款IDE非常熟悉的程序员，如果你能达到这两点，基本上不超过10分钟你就可以构建出你的第一个Android应用。对于Android开发包的一些组件，Activity，Intent神马的，在这篇文章里不多赘述，越说越糊涂，还不如不说呢......</div><div style="font-size: 15px;"><br></div><div style="font-size: 15px;">此教程是本人自己在Google官网学习的Android的第一课的总结，所以会删繁就简，如果觉得不够全面可以移步这里(<a href="http://developer.android.com/training/basics/firstapp/index.html">http://developer.android.com/training/basics/firstapp/index.html</a>)学习英文版官方教程。</div><div style="font-size: 15px;"><br></div><div style="font-size: 15px;">首先介绍一下第一课的学习路线:</div><div><ol><li style="font-size: 15px;">Google的ADT工具包下载：<a href="http://developer.android.com/sdk/index.html">http://developer.android.com/sdk/index.html</a></li><li style="font-size: 15px;">用ADT的Eclipse构建第一个Android应用</li><li style="font-size: 15px;">学习默认的工程结构</li><li style="font-size: 15px;">第一次为应用布局</li><li style="font-size: 15px;">第一次做事件响应</li><li style="font-size: 15px;">手动添加一个Activity</li><li style="font-size: 15px;">梳理Android App的组件交互流程</li></ol></div><div><b style="font-size: 15px;"><font color="#1C3387">构建应用</font></b></div><div><span style="font-size: 15px;">使用Google配置好的Eclipse基本上跟构建普通Java项目差不多，你只需要下一步下一步就OK了，里面的设置暂时都用默认的，基本不会出错，第一个应用就建好了，我的项目名称是Helloworld。</span></div><div><span style="font-size: 15px;"><b><font color="#1C3387"><br></font></b></span></div><div><span style="font-size: 15px;"><b><font color="#1C3387">工程结构</font></b></span></div><div><span style="font-size: 15px;">顺利建完工程，你会得到一个项目结构：</span></div><div><span style="font-size: 15px;"><font color="#EB0073">AndroidManifest.xml</font></span><span style="background-color: rgb(249, 249, 249); color: rgb(34, 34, 34); font-size: 14px; line-height: 19px;">&nbsp;</span></div><div><font color="#222222"><span style="font-size: 14px; line-height: 19px;">这个文件主要声明了应用的一些基本组件，如Activity。<br></span></font><div><br></div><div style="font-size: 15px;">最重要的事情之一就是需要包含<font color="#EB0073">&lt;uses-sdk&gt;</font>. 这个声明了应用对不同安卓版本的兼容性，基本上有最低版本到最高版本，你的第一个安卓应用的manifest应该会是这个样子：</div><pre style="font-size: 13px; margin-top: 10px; color: rgb(0, 102, 0); line-height: 19px; padding: 1em; overflow: auto; border: 1px solid rgb(221, 221, 221); background-color: rgb(247, 247, 247);"><span style="color: rgb(0, 0, 136);">&lt;manifest</span><span style="color: rgb(0, 0, 0);"> </span><span style="color: rgb(136, 34, 136);">xmlns:android</span><span style="color: rgb(102, 102, 0);">=</span><span style="color: rgb(0, 136, 0);">&quot;http://schemas.android.com/apk/res/android&quot;</span><span style="color: rgb(0, 0, 0);"> ... </span><span style="color: rgb(0, 0, 136);">&gt;</span><span style="color: rgb(0, 0, 0);"><br>    </span><span style="color: rgb(0, 0, 136);">&lt;uses-sdk</span><span style="color: rgb(0, 0, 0);"> </span><span style="color: rgb(136, 34, 136);">android:minSdkVersion</span><span style="color: rgb(102, 102, 0);">=</span><span style="color: rgb(0, 136, 0);">&quot;8&quot;</span><span style="color: rgb(0, 0, 0);"> </span><span style="color: rgb(136, 34, 136);">android:targetSdkVersion</span><span style="color: rgb(102, 102, 0);">=</span><span style="color: rgb(0, 136, 0);">&quot;17&quot;</span><span style="color: rgb(0, 0, 0);"> </span><span style="color: rgb(0, 0, 136);">/&gt;</span><span style="color: rgb(0, 0, 0);"><br>    ...<br></span><span style="color: rgb(0, 0, 136);">&lt;/manifest&gt;</span></pre><p style="margin: 10px 0px 15px; color: rgb(34, 34, 34); font-family: Roboto, sans-serif; font-size: 14px; line-height: 19px; background-color: rgb(249, 249, 249);"><span style="font-size: 15px;">你将会经常去改变你的</span><font color="#EB0073" style="font-size: 15px;">android:targetSdkVersion</font><span style="font-size: 15px;">的版本号，让他尽可能的高，这样就可以测试你的应用针对不同版本的适应程度。</span></p></div><div><span style="font-size: 15px;"><font color="#EB0073">src/</font></span></div><div><span style="font-size: 15px;">主要的源代码包，默认情况，他会包含一个<font color="#EB0073">Activity类</font>，这个类可以在你的app加载的时候自动运行，然后使用app的icon</span></div><div><span style="font-size: 15px;"><font color="#EB0073">res/</font></span></div><div><span style="font-size: 15px;">app资源文件包，一下只是罗列出几个相对重要的文件夹</span></div><div>&nbsp; &nbsp; &nbsp;<font color="#EB0073">drawable-hdpi/</font></div><div>&nbsp; &nbsp; &nbsp;<span style="background-color: rgb(249, 249, 249); color: rgb(34, 34, 34); font-family: Roboto, sans-serif; font-size: 14px; line-height: 19px;">Directory for drawable objects (such as bitmaps) that are designed for high-density (hdpi) screens. Other drawable&nbsp;</span>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<span style="background-color: rgb(249, 249, 249); color: rgb(34, 34, 34); font-family: Roboto, sans-serif; font-size: 14px; line-height: 19px;">directories contain assets designed for other screen densities.</span></div><div><font color="#EB0073">&nbsp; &nbsp; &nbsp;layout/</font></div><div>&nbsp; &nbsp; &nbsp;<span style="color: rgb(34, 34, 34); font-family: Roboto, sans-serif; font-size: 14px; line-height: 19px; background-color: rgb(249, 249, 249);">Directory for files that define your app''s user interface.</span></div><div><font color="#EB0073">&nbsp; &nbsp; &nbsp;values/</font></div><div>&nbsp; &nbsp; &nbsp;<span style="background-color: rgb(249, 249, 249); color: rgb(34, 34, 34); font-family: Roboto, sans-serif; font-size: 14px; line-height: 19px;">Directory for other various XML files that contain a collection of resources, such as string and color definitions.</span></div><div><span style="background-color: rgb(249, 249, 249); color: rgb(34, 34, 34); font-family: Roboto, sans-serif; font-size: 14px; line-height: 19px;"><br></span></div><div><span style="font-size: 15px;"><b><font color="#1C3387">流式布局</font></b></span></div><div><span style="font-size: 15px;">在了解完工程结构，我们开始搞一个布局吧，也就是给第一个App做一下UI。</span><span style="font-size: 15px;">其实Android的视图层部分有两种概念View和ViewGroup。View是管理基本控件的，比如按钮，文本框等，而ViewGroup是管理布局的比如流式布局等。在这一步骤中权且跟着做，不要管那些概念以后你会慢慢理解的。</span></div><div><span style="font-size: 15px;"><br></span></div><div><span style="font-size: 15px;">在res/layout/文件夹下修改activity_main.xml，修改以后是这个样子:</span></div><div><pre style="font-size: 13px; margin-top: 0px; color: rgb(0, 102, 0); line-height: 19px; padding: 1em; overflow: auto; border: 1px solid rgb(221, 221, 221); background-color: rgb(247, 247, 247);"><span style="color: rgb(102, 102, 0);">&lt;?</span><span style="color: rgb(0, 0, 0);">xml version</span><span style="color: rgb(102, 102, 0);">=</span><span style="color: rgb(0, 136, 0);">&quot;1.0&quot;</span><span style="color: rgb(0, 0, 0);"> encoding</span><span style="color: rgb(102, 102, 0);">=</span><span style="color: rgb(0, 136, 0);">&quot;utf-8&quot;</span><span style="color: rgb(102, 102, 0);">?&gt;</span><span style="color: rgb(0, 0, 0);"><br></span><span style="color: rgb(0, 0, 136);">&lt;LinearLayout</span><span style="color: rgb(0, 0, 0);"> </span><span style="color: rgb(136, 34, 136);">xmlns:android</span><span style="color: rgb(102, 102, 0);">=</span><span style="color: rgb(0, 136, 0);">&quot;http://schemas.android.com/apk/res/android&quot;</span><span style="color: rgb(0, 0, 0);"><br>    </span><span style="color: rgb(136, 34, 136);">xmlns:tools</span><span style="color: rgb(102, 102, 0);">=</span><span style="color: rgb(0, 136, 0);">&quot;http://schemas.android.com/tools&quot;</span><span style="color: rgb(0, 0, 0);"><br>    </span><span style="color: rgb(136, 34, 136);">android:layout_width</span><span style="color: rgb(102, 102, 0);">=</span><span style="color: rgb(0, 136, 0);">&quot;match_parent&quot;</span><span style="color: rgb(0, 0, 0);"><br>    </span><span style="color: rgb(136, 34, 136);">android:layout_height</span><span style="color: rgb(102, 102, 0);">=</span><span style="color: rgb(0, 136, 0);">&quot;match_parent&quot;</span><span style="color: rgb(0, 0, 0);"><br>    </span><span style="color: rgb(136, 34, 136);">android:orientation</span><span style="color: rgb(102, 102, 0);">=</span><span style="color: rgb(0, 136, 0);">&quot;horizontal&quot;</span><span style="color: rgb(0, 0, 136);">&gt;</span><span style="color: rgb(0, 0, 0);"><br>    </span><span style="color: rgb(0, 0, 136);">&lt;EditText</span><span style="color: rgb(0, 0, 0);"> </span><span style="color: rgb(136, 34, 136);">android:id</span><span style="color: rgb(102, 102, 0);">=</span><span style="color: rgb(0, 136, 0);">&quot;@+id/edit_message&quot;</span><span style="color: rgb(0, 0, 0);"><br>        </span><span style="color: rgb(136, 34, 136);">android:layout_weight</span><span style="color: rgb(102, 102, 0);">=</span><span style="color: rgb(0, 136, 0);">&quot;1&quot;</span><span style="color: rgb(0, 0, 0);"><br>        </span><span style="color: rgb(136, 34, 136);">android:layout_width</span><span style="color: rgb(102, 102, 0);">=</span><span style="color: rgb(0, 136, 0);">&quot;0dp&quot;</span><span style="color: rgb(0, 0, 0);"><br>        </span><span style="color: rgb(136, 34, 136);">android:layout_height</span><span style="color: rgb(102, 102, 0);">=</span><span style="color: rgb(0, 136, 0);">&quot;wrap_content&quot;</span><span style="color: rgb(0, 0, 0);"><br>        </span><span style="color: rgb(136, 34, 136);">android:hint</span><span style="color: rgb(102, 102, 0);">=</span><span style="color: rgb(0, 136, 0);">&quot;@string/edit_message&quot;</span><span style="color: rgb(0, 0, 0);"> </span><span style="color: rgb(0, 0, 136);">/&gt;</span><span style="color: rgb(0, 0, 0);"><br>    </span><span style="color: rgb(0, 0, 136);">&lt;Button</span><span style="color: rgb(0, 0, 0);"><br>        </span><span style="color: rgb(136, 34, 136);">android:layout_width</span><span style="color: rgb(102, 102, 0);">=</span><span style="color: rgb(0, 136, 0);">&quot;wrap_content&quot;</span><span style="color: rgb(0, 0, 0);"><br>        </span><span style="color: rgb(136, 34, 136);">android:layout_height</span><span style="color: rgb(102, 102, 0);">=</span><span style="color: rgb(0, 136, 0);">&quot;wrap_content&quot;</span><span style="color: rgb(0, 0, 0);"><br>        </span><span style="color: rgb(136, 34, 136);">android:text</span><span style="color: rgb(102, 102, 0);">=</span><span style="color: rgb(0, 136, 0);">&quot;@string/button_send&quot;</span><span style="color: rgb(0, 0, 0);"> </span><span style="color: rgb(0, 0, 136);">/&gt;</span><span style="color: rgb(0, 0, 0);"><br></span><span style="color: rgb(0, 0, 136);">&lt;/LinearLayout&gt;</span></pre></div><div><span style="font-size: 15px;">修改 res/values/下的 strings.xml</span></div><div><pre style="font-size: 13px; margin-top: 0px; color: rgb(0, 102, 0); line-height: 19px; padding: 1em; overflow: auto; border: 1px solid rgb(221, 221, 221); background-color: rgb(247, 247, 247);"><span style="color: rgb(102, 102, 0);">&lt;?</span><span style="color: rgb(0, 0, 0);">xml version</span><span style="color: rgb(102, 102, 0);">=</span><span style="color: rgb(0, 136, 0);">&quot;1.0&quot;</span><span style="color: rgb(0, 0, 0);"> encoding</span><span style="color: rgb(102, 102, 0);">=</span><span style="color: rgb(0, 136, 0);">&quot;utf-8&quot;</span><span style="color: rgb(102, 102, 0);">?&gt;</span><span style="color: rgb(0, 0, 0);"><br></span><span style="color: rgb(0, 0, 136);">&lt;resources&gt;</span><span style="color: rgb(0, 0, 0);"><br>    </span><span style="color: rgb(0, 0, 136);">&lt;string</span><span style="color: rgb(0, 0, 0);"> </span><span style="color: rgb(136, 34, 136);">name</span><span style="color: rgb(102, 102, 0);">=</span><span style="color: rgb(0, 136, 0);">&quot;app_name&quot;</span><span style="color: rgb(0, 0, 136);">&gt;</span><span style="color: rgb(0, 0, 0);">My First App</span><span style="color: rgb(0, 0, 136);">&lt;/string&gt;</span><span style="color: rgb(0, 0, 0);"><br>    </span><span style="color: rgb(0, 0, 136);">&lt;string</span><span style="color: rgb(0, 0, 0);"> </span><span style="color: rgb(136, 34, 136);">name</span><span style="color: rgb(102, 102, 0);">=</span><span style="color: rgb(0, 136, 0);">&quot;edit_message&quot;</span><span style="color: rgb(0, 0, 136);">&gt;</span><span style="color: rgb(0, 0, 0);">Enter a message</span><span style="color: rgb(0, 0, 136);">&lt;/string&gt;</span><span style="color: rgb(0, 0, 0);"><br>    </span><span style="color: rgb(0, 0, 136);">&lt;string</span><span style="color: rgb(0, 0, 0);"> </span><span style="color: rgb(136, 34, 136);">name</span><span style="color: rgb(102, 102, 0);">=</span><span style="color: rgb(0, 136, 0);">&quot;button_send&quot;</span><span style="color: rgb(0, 0, 136);">&gt;</span><span style="color: rgb(0, 0, 0);">Send</span><span style="color: rgb(0, 0, 136);">&lt;/string&gt;</span><span style="color: rgb(0, 0, 0);"><br>    </span><span style="color: rgb(0, 0, 136);">&lt;string</span><span style="color: rgb(0, 0, 0);"> </span><span style="color: rgb(136, 34, 136);">name</span><span style="color: rgb(102, 102, 0);">=</span><span style="color: rgb(0, 136, 0);">&quot;action_settings&quot;</span><span style="color: rgb(0, 0, 136);">&gt;</span><span style="color: rgb(0, 0, 0);">Settings</span><span style="color: rgb(0, 0, 136);">&lt;/string&gt;</span><span style="color: rgb(0, 0, 0);"><br>    </span><span style="color: rgb(0, 0, 136);">&lt;string</span><span style="color: rgb(0, 0, 0);"> </span><span style="color: rgb(136, 34, 136);">name</span><span style="color: rgb(102, 102, 0);">=</span><span style="color: rgb(0, 136, 0);">&quot;title_activity_main&quot;</span><span style="color: rgb(0, 0, 136);">&gt;</span><span style="color: rgb(0, 0, 0);">MainActivity</span><span style="color: rgb(0, 0, 136);">&lt;/string&gt;</span><span style="color: rgb(0, 0, 0);"><br></span><span style="color: rgb(0, 0, 136);">&lt;/resources&gt;</span></pre></div><div><span style="font-size: 15px;">差不多了，现在点击RUN，跑一下你的项目吧，应该有一个RUN AS Android Application，按这个要求去改，你的程序肯定能跑起来，至于怎么跑，你可以连一个手机在电脑上，或者运行起来一个虚拟机，我倾向于外置设备，因为很快。</span></div><div><span style="font-size: 15px;"><br></span></div><div><span style="font-size: 15px;"><b><font color="#1C3387">事件响应</font></b></span></div><div><span style="font-size: 15px;">要响应事件，首先你要给控件注册事件监听，怎么注册呢？</span></div><div><span style="font-size: 15px;">给上一步添加的Button添加一个click事件，在activity_main.xml的Button节点下这么改</span></div><div><pre style="font-size: 13px; margin-top: 0px; color: rgb(0, 102, 0); line-height: 19px; padding: 1em; overflow: auto; border: 1px solid rgb(221, 221, 221); background-color: rgb(247, 247, 247);"><span style="color: rgb(0, 0, 136);">&lt;Button</span><span style="color: rgb(0, 0, 0);"><br>    </span><span style="color: rgb(136, 34, 136);">android:layout_width</span><span style="color: rgb(102, 102, 0);">=</span><span style="color: rgb(0, 136, 0);">&quot;wrap_content&quot;</span><span style="color: rgb(0, 0, 0);"><br>    </span><span style="color: rgb(136, 34, 136);">android:layout_height</span><span style="color: rgb(102, 102, 0);">=</span><span style="color: rgb(0, 136, 0);">&quot;wrap_content&quot;</span><span style="color: rgb(0, 0, 0);"><br>    </span><span style="color: rgb(136, 34, 136);">android:text</span><span style="color: rgb(102, 102, 0);">=</span><span style="color: rgb(0, 136, 0);">&quot;@string/button_send&quot;</span><span style="color: rgb(0, 0, 0);"><br>    </span><span style="color: rgb(136, 34, 136);">android:onClick</span><span style="color: rgb(102, 102, 0);">=</span><span style="color: rgb(0, 136, 0);">&quot;sendMessage&quot;</span><span style="color: rgb(0, 0, 0);"> </span><span style="color: rgb(0, 0, 136);">/&gt;</span></pre></div><div><span style="font-size: 15px;">sendMessage实际上是MainActivity的一个方法，你改完xml文件，然后去MainActivity中添加方法就可以了，这样就成功得注册了事件，完了我的MainActivity就是这样的。</span></div><div><span style="font-size: 15px;"><br></span></div><div align="left"><div align="left"><font color="#7F0055" face="Consolas" size="2"><span style="font-size:10pt"><b>import</b></span></font> <font face="Consolas" size="2"><span style="font-size:10pt">android.app.Activity;</span></font></div><div align="left"><font color="#7F0055" face="Consolas" size="2"><span style="font-size:10pt"><b>import</b></span></font> <font face="Consolas" size="2"><span style="font-size:10pt">android.content.Intent;</span></font></div><div align="left"><font color="#7F0055" face="Consolas" size="2"><span style="font-size:10pt"><b>import</b></span></font> <font face="Consolas" size="2"><span style="font-size:10pt">android.os.Bundle;</span></font></div><div align="left"><font color="#7F0055" face="Consolas" size="2"><span style="font-size:10pt"><b>import</b></span></font> <font face="Consolas" size="2"><span style="font-size:10pt">android.view.Menu;</span></font></div><div align="left"><font color="#7F0055" face="Consolas" size="2"><span style="font-size:10pt"><b>import</b></span></font> <font face="Consolas" size="2"><span style="font-size:10pt">android.view.View;</span></font></div><div align="left"><font color="#7F0055" face="Consolas" size="2"><span style="font-size:10pt"><b>import</b></span></font> <font face="Consolas" size="2"><span style="font-size:10pt">android.widget.EditText;</span></font></div><div align="left"><font color="#010101" face="Consolas" size="2"><span style="font-size:10pt"><br></span></font></div><div align="left"><font color="#7F0055" face="Consolas" size="2"><span style="font-size:10pt"><b>public</b></span></font> <font color="#7F0055" face="Consolas" size="2"><span style="font-size:10pt"><b>class</b></span></font> <font face="Consolas" size="2"><span style="font-size:10pt">MainActivity</span></font> <font color="#7F0055" face="Consolas" size="2"><span style="font-size:10pt"><b>extends</b></span></font> <font face="Consolas" size="2"><span style="font-size:10pt">Activity {</span></font></div><div align="left"><font face="Consolas" size="2"><span style="font-size:10pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></font></div><div align="left"><font face="Consolas" size="2"><span style="font-size:10pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></font> <font color="#7F0055" face="Consolas" size="2"><span style="font-size:10pt"><b>public</b></span></font> <font color="#7F0055" face="Consolas" size="2"><span style="font-size:10pt"><b>final</b></span></font> <font color="#7F0055" face="Consolas" size="2"><span style="font-size:10pt"><b>static</b></span></font> <font face="Consolas" size="2"><span style="font-size:10pt">String</span> <span style="font-size:10pt"><i><u>EXTRA_MESSAGE</u></i></span> <span style="font-size:10pt">=</span></font> <font color="#2A00FF" face="Consolas" size="2"><span style="font-size:10pt">&quot;com.example.myfirstapp.MESSAGE&quot;</span></font> <font face="Consolas" size="2"><span style="font-size:10pt">;</span></font></div><div align="left"><font face="Consolas" size="2"><span style="font-size:10pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></font></div><div align="left"><font face="Consolas" size="2"><span style="font-size:10pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></font> <font color="#646464" face="Consolas" size="2"><span style="font-size:10pt">@Override</span></font></div><div align="left"><font face="Consolas" size="2"><span style="font-size:10pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></font> <font color="#7F0055" face="Consolas" size="2"><span style="font-size:10pt"><b>protected</b></span></font> <font color="#7F0055" face="Consolas" size="2"><span style="font-size:10pt"><b>void</b></span></font> <font face="Consolas" size="2"><span style="font-size:10pt">onCreate(Bundle savedInstanceState) {</span></font></div><div align="left"><font face="Consolas" size="2"><span style="font-size:10pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></font> <font color="#7F0055" face="Consolas" size="2"><span style="font-size:10pt"><b>super</b></span></font><font face="Consolas" size="2"><span style="font-size:10pt">.onCreate(savedInstanceState);</span></font></div><div align="left"><font face="Consolas" size="2"><span style="font-size:10pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;setContentView(R.layout.</span></font> <font color="#0000C0" face="Consolas" size="2"><span style="font-size:10pt"><i>activity_main</i></span></font><font face="Consolas" size="2"><span style="font-size:10pt">);</span></font></div><div align="left"><font face="Consolas" size="2"><span style="font-size:10pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}</span></font></div><div align="left"><font color="#010101" face="Consolas" size="2"><span style="font-size:10pt"><br></span></font></div><div align="left"><font face="Consolas" size="2"><span style="font-size:10pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></font> <font color="#646464" face="Consolas" size="2"><span style="font-size:10pt">@Override</span></font></div><div align="left"><font face="Consolas" size="2"><span style="font-size:10pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></font> <font color="#7F0055" face="Consolas" size="2"><span style="font-size:10pt"><b>public</b></span></font> <font color="#7F0055" face="Consolas" size="2"><span style="font-size:10pt"><b>boolean</b></span></font> <font face="Consolas" size="2"><span style="font-size:10pt">onCreateOptionsMenu(Menu menu) {</span></font></div><div align="left"><font face="Consolas" size="2"><span style="font-size:10pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></font> <font color="#3F7F5F" face="Consolas" size="2"><span style="font-size:10pt">// Inflate the menu; this adds items to the action bar if it is present.</span></font></div><div align="left"><font face="Consolas" size="2"><span style="font-size:10pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;getMenuInflater().inflate(R.menu.</span></font> <font color="#0000C0" face="Consolas" size="2"><span style="font-size:10pt"><i>main</i></span></font><font face="Consolas" size="2"><span style="font-size:10pt">, menu);</span></font></div><div align="left"><font face="Consolas" size="2"><span style="font-size:10pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></font> <font color="#7F0055" face="Consolas" size="2"><span style="font-size:10pt"><b>return</b></span></font> <font color="#7F0055" face="Consolas" size="2"><span style="font-size:10pt"><b>true</b></span></font> <font face="Consolas" size="2"><span style="font-size:10pt">;</span></font></div><div align="left"><font face="Consolas" size="2"><span style="font-size:10pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}</span></font></div><div align="left"><font face="Consolas" size="2"><span style="font-size:10pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></font></div><div align="left"><font face="Consolas" size="2"><span style="font-size:10pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></font> <font color="#3F5FBF" face="Consolas" size="2"><span style="font-size:10pt">/** Called when the user clicks the Send button */</span></font></div><div align="left"><font face="Consolas" size="2"><span style="font-size:10pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></font> <font color="#7F0055" face="Consolas" size="2"><span style="font-size:10pt"><b>public</b></span></font> <font color="#7F0055" face="Consolas" size="2"><span style="font-size:10pt"><b>void</b></span></font> <font face="Consolas" size="2"><span style="font-size:10pt">sendMessage(View view) {</span></font></div><div align="left"><font face="Consolas" size="2"><span style="font-size:10pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></font> <font color="#3F7F5F" face="Consolas" size="2"><span style="font-size:10pt">// Do something in response to button</span></font></div><div align="left"><font face="Consolas" size="2"><span style="font-size:10pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Intent intent =</span></font> <font color="#7F0055" face="Consolas" size="2"><span style="font-size:10pt"><b>new</b></span></font> <font face="Consolas" size="2"><span style="font-size:10pt">Intent(</span></font><font color="#7F0055" face="Consolas" size="2"><span style="font-size:10pt"><b>this</b></span></font> <font face="Consolas" size="2"><span style="font-size:10pt">, DisplayMSGActivity.</span></font><font color="#7F0055" face="Consolas" size="2"><span style="font-size:10pt"><b>class</b></span></font><font face="Consolas" size="2"><span style="font-size:10pt">);</span></font></div><div align="left"><font face="Consolas" size="2"><span style="font-size:10pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;EditText editText = (EditText) findViewById(R.id.</span></font> <font color="#0000C0" face="Consolas" size="2"><span style="font-size:10pt"><i>edit_message</i></span></font><font face="Consolas" size="2"><span style="font-size:10pt">);</span></font></div><div align="left"><font face="Consolas" size="2"><span style="font-size:10pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;String message = editText.getText().toString();</span></font></div><div align="left"><font face="Consolas" size="2"><span style="font-size:10pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;intent.putExtra(</span></font> <font color="#0000C0" face="Consolas" size="2"><span style="font-size:10pt"><i>EXTRA_MESSAGE</i></span></font><font face="Consolas" size="2"><span style="font-size:10pt">, message);</span></font> <font color="#3F7F5F" face="Consolas" size="2"><span style="font-size:10pt">// put a key-value message, intent is like a map object</span></font></div><div align="left"><font face="Consolas" size="2"><span style="font-size:10pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;startActivity(intent);</span></font></div><div align="left"><font face="Consolas" size="2"><span style="font-size:10pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}</span></font></div><div align="left"><font color="#010101" face="Consolas" size="2"><span style="font-size:10pt"><br></span></font></div><div align="left"><font face="Consolas" size="2"><span style="font-size:10pt">}</span></font></div></div><div align="left"><font face="Consolas"><br></font></div><div align="left" style="font-size: 16px;">关于事件处理方法有几个注意事项，我贴一下:</div><div align="left" style="font-size: 16px;"><br></div><div align="left"><ul style="margin: 0px 0px 15px 18px; padding: 0px; color: rgb(34, 34, 34); font-family: Roboto, sans-serif; font-size: 14px; line-height: 19px; text-align: start; background-color: rgb(249, 249, 249);"><li style="margin: 0px 0px 5px;">Be public</li><li style="margin: 0px 0px 5px;">Have a void return value</li><li style="margin: 0px 0px 5px;">Have a&nbsp;<code style="font-size: 13px; color: rgb(0, 102, 0); line-height: 14px;"><a href="http://developer.android.com/reference/android/view/View.html" style="color: rgb(37, 138, 175); text-decoration: none;">View</a></code>&nbsp;as the only parameter (this will be the&nbsp;<code style="font-size: 13px; color: rgb(0, 102, 0); line-height: 14px;"><a href="http://developer.android.com/reference/android/view/View.html" style="color: rgb(37, 138, 175); text-decoration: none;">View</a></code>&nbsp;that was clicked)</li></ul></div><div align="left" style="text-align: -webkit-auto;"><span style="font-size: 15px;">好了，关于我的sendMessage方法中的一些实现，你先不用管是什么东西，Intent就相当于一个消息，构成你就可以认为是一个key-value形式的Map。它会在不同的Activity中传递。</span><span style="font-family: Consolas; font-size: 13px; text-align: -webkit-left;">DisplayMSGActivity</span> <span style="text-align: -webkit-left; font-size: 16px;">这个Activity现在就会创建。</span></div><div align="left" style="text-align: -webkit-auto;"><span style="text-align: -webkit-left; font-size: 16px;"><br></span></div><div align="left" style="text-align: -webkit-left;"><b style="font-size: 15px; color: rgb(28, 51, 135);">手动添加一个Activity</b></div><div><span style="font-size: 15px;">你可以点击Eclipse左上角的new那个图标，会有一个Android Activity这么一个东西，你创建完以后，一切的依赖xml都会自动帮你搞定，很方便。</span></div><div><span style="font-size: 15px;"><br></span></div><div><span style="font-size: 15px;">这是我的第二个Activity:</span></div><div align="left"><font color="#7F0055" face="Consolas" size="2"><span style="font-size:10pt"><b>import</b></span></font> <font face="Consolas" size="2"><span style="font-size:10pt">android.app.Activity;</span></font></div><div align="left"><font color="#7F0055" face="Consolas" size="2"><span style="font-size:10pt"><b>import</b></span></font> <font face="Consolas" size="2"><span style="font-size:10pt">android.content.Intent;</span></font></div><div align="left"><font color="#7F0055" face="Consolas" size="2"><span style="font-size:10pt"><b>import</b></span></font> <font face="Consolas" size="2"><span style="font-size:10pt">android.os.Bundle;</span></font></div><div align="left"><font color="#7F0055" face="Consolas" size="2"><span style="font-size:10pt"><b>import</b></span></font> <font face="Consolas" size="2"><span style="font-size:10pt">android.support.v4.app.NavUtils;</span></font></div><div align="left"><font color="#7F0055" face="Consolas" size="2"><span style="font-size:10pt"><b>import</b></span></font> <font face="Consolas" size="2"><span style="font-size:10pt">android.view.MenuItem;</span></font></div><div align="left"><font color="#7F0055" face="Consolas" size="2"><span style="font-size:10pt"><b>import</b></span></font> <font face="Consolas" size="2"><span style="font-size:10pt">android.widget.TextView;</span></font></div><div align="left"><font color="#010101" face="Consolas" size="2"><span style="font-size:10pt"><br></span></font></div><div align="left"><font color="#7F0055" face="Consolas" size="2"><span style="font-size:10pt"><b>public</b></span></font> <font color="#7F0055" face="Consolas" size="2"><span style="font-size:10pt"><b>class</b></span></font> <font face="Consolas" size="2"><span style="font-size:10pt">DisplayMSGActivity</span></font> <font color="#7F0055" face="Consolas" size="2"><span style="font-size:10pt"><b>extends</b></span></font> <font face="Consolas" size="2"><span style="font-size:10pt">Activity {</span></font></div><div align="left"><font face="Consolas" size="2"><span style="font-size:10pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></font></div><div align="left"><font face="Consolas" size="2"><span style="font-size:10pt">&nbsp;&nbsp;&nbsp;</span></font> <font color="#646464" face="Consolas" size="2"><span style="font-size:10pt">@Override</span></font></div><div align="left"><font face="Consolas" size="2"><span style="font-size:10pt">&nbsp;&nbsp;&nbsp;</span></font> <font color="#7F0055" face="Consolas" size="2"><span style="font-size:10pt"><b>protected</b></span></font> <font color="#7F0055" face="Consolas" size="2"><span style="font-size:10pt"><b>void</b></span></font> <font face="Consolas" size="2"><span style="font-size:10pt">onCreate(Bundle savedInstanceState) {</span></font></div><div align="left"><font face="Consolas" size="2"><span style="font-size:10pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></font> <font color="#7F0055" face="Consolas" size="2"><span style="font-size:10pt"><b>super</b></span></font><font face="Consolas" size="2"><span style="font-size:10pt">.onCreate(savedInstanceState);</span></font></div><div align="left"><font face="Consolas" size="2"><span style="font-size:10pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; setContentView(R.layout.</span></font> <font color="#0000C0" face="Consolas" size="2"><span style="font-size:10pt"><i>activity_display_msg</i></span></font><font face="Consolas" size="2"><span style="font-size:10pt">);</span></font></div><div align="left"><font color="#010101" face="Consolas" size="2"><span style="font-size:10pt"><br></span></font></div><div align="left"><font face="Consolas" size="2"><span style="font-size:10pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></font> <font color="#3F7F5F" face="Consolas" size="2"><span style="font-size:10pt">// Get the message from the intent</span></font></div><div align="left"><font face="Consolas" size="2"><span style="font-size:10pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Intent intent = getIntent();</span></font></div><div align="left"><font face="Consolas" size="2"><span style="font-size:10pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; String message = intent.getStringExtra(MainActivity.</span></font> <font color="#0000C0" face="Consolas" size="2"><span style="font-size:10pt"><i>EXTRA_MESSAGE</i></span></font><font face="Consolas" size="2"><span style="font-size:10pt">);</span></font></div><div align="left"><font color="#010101" face="Consolas" size="2"><span style="font-size:10pt"><br></span></font></div><div align="left"><font face="Consolas" size="2"><span style="font-size:10pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></font> <font color="#3F7F5F" face="Consolas" size="2"><span style="font-size:10pt">// Create the text view</span></font></div><div align="left"><font face="Consolas" size="2"><span style="font-size:10pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TextView textView =</span></font> <font color="#7F0055" face="Consolas" size="2"><span style="font-size:10pt"><b>new</b></span></font> <font face="Consolas" size="2"><span style="font-size:10pt">TextView(</span></font><font color="#7F0055" face="Consolas" size="2"><span style="font-size:10pt"><b>this</b></span></font><font face="Consolas" size="2"><span style="font-size:10pt">);</span></font></div><div align="left"><font face="Consolas" size="2"><span style="font-size:10pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; textView.setTextSize(40);</span></font></div><div align="left"><font face="Consolas" size="2"><span style="font-size:10pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; textView.setText(message);</span></font></div><div align="left"><font color="#010101" face="Consolas" size="2"><span style="font-size:10pt"><br></span></font></div><div align="left"><font face="Consolas" size="2"><span style="font-size:10pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></font> <font color="#3F7F5F" face="Consolas" size="2"><span style="font-size:10pt">// Set the text view as the activity layout</span></font></div><div align="left"><font face="Consolas" size="2"><span style="font-size:10pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; setContentView(textView);</span></font></div><div align="left"><font face="Consolas" size="2"><span style="font-size:10pt">&nbsp;&nbsp;&nbsp; }</span></font></div><div align="left"><font color="#010101" face="Consolas" size="2"><span style="font-size:10pt"><br></span></font></div><div align="left"><font face="Consolas" size="2"><span style="font-size:10pt">&nbsp;&nbsp;&nbsp;</span></font> <font color="#646464" face="Consolas" size="2"><span style="font-size:10pt">@Override</span></font></div><div align="left"><font face="Consolas" size="2"><span style="font-size:10pt">&nbsp;&nbsp;&nbsp;</span></font> <font color="#7F0055" face="Consolas" size="2"><span style="font-size:10pt"><b>public</b></span></font> <font color="#7F0055" face="Consolas" size="2"><span style="font-size:10pt"><b>boolean</b></span></font> <font face="Consolas" size="2"><span style="font-size:10pt">onOptionsItemSelected(MenuItem item) {</span></font></div><div align="left"><font face="Consolas" size="2"><span style="font-size:10pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></font> <font color="#7F0055" face="Consolas" size="2"><span style="font-size:10pt"><b>switch</b></span></font> <font face="Consolas" size="2"><span style="font-size:10pt">(item.getItemId()) {</span></font></div><div align="left"><font face="Consolas" size="2"><span style="font-size:10pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></font> <font color="#7F0055" face="Consolas" size="2"><span style="font-size:10pt"><b>case</b></span></font> <font face="Consolas" size="2"><span style="font-size:10pt">android.R.id.</span></font><font color="#0000C0" face="Consolas" size="2"><span style="font-size:10pt"><i>home</i></span></font><font face="Consolas" size="2"><span style="font-size:10pt">:</span></font></div><div align="left"><font face="Consolas" size="2"><span style="font-size:10pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NavUtils.</span> <span style="font-size:10pt"><i>navigateUpFromSameTask</i></span><span style="font-size:10pt">(</span></font><font color="#7F0055" face="Consolas" size="2"><span style="font-size:10pt"><b>this</b></span></font><font face="Consolas" size="2"><span style="font-size:10pt">);</span></font></div><div align="left"><font face="Consolas" size="2"><span style="font-size:10pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></font> <font color="#7F0055" face="Consolas" size="2"><span style="font-size:10pt"><b>return</b></span></font> <font color="#7F0055" face="Consolas" size="2"><span style="font-size:10pt"><b>true</b></span></font> <font face="Consolas" size="2"><span style="font-size:10pt">;</span></font></div><div align="left"><font face="Consolas" size="2"><span style="font-size:10pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</span></font></div><div align="left"><font face="Consolas" size="2"><span style="font-size:10pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></font> <font color="#7F0055" face="Consolas" size="2"><span style="font-size:10pt"><b>return</b></span></font> <font color="#7F0055" face="Consolas" size="2"><span style="font-size:10pt"><b>super</b></span></font> <font face="Consolas" size="2"><span style="font-size:10pt">.onOptionsItemSelected(item);</span></font></div><div align="left"><font face="Consolas" size="2"><span style="font-size:10pt">&nbsp;&nbsp;&nbsp; }</span></font></div><div align="left"><font color="#010101" face="Consolas" size="2"><span style="font-size:10pt"><br></span></font></div><div align="left"><font face="Consolas" size="2"><span style="font-size:10pt">}</span></font></div><div align="left"><font face="Consolas" size="2"><span style="font-size:10pt"><br></span></font></div><div align="left"><div style="text-align: -webkit-auto;"><span style="font-size: 15px;">如果你用ADT的Eclipse基本不会有什么特别情况，其实到这里我们就是实现了一个功能，在第一个Activity的文本框里输一行字符串，然后点击按钮，在第二个Activity中显示。</span></div></div><div style="text-align: -webkit-left;"><font><br></font></div><div><span style="font-size: 15px;"><b><font color="#1C3387">梳理Android组件交互流程</font></b></span></div><div><span style="font-size: 15px;">总结一下，咱们第一个App主要用到的技术点：</span></div><div><ol><li><span style="font-size: 15px;">Activity &nbsp;<b>#主要交互入口，主要事件处理函数在这里</b></span></li><li><span style="font-size: 15px;">AndroidManifest.xml &nbsp;<b>#activity声明xml文件，事件绑定在这里</b></span></li><li><span style="font-size: 15px;">res/layout/activity_****.xml &nbsp;<b>#activity布局文件</b></span></li><li><span style="font-size: 15px;">res/layout/strings.xml &nbsp;<b>#activity中控件相关属性的声明</b></span></li><li><span style="font-size: 15px;">Intent &nbsp;<b>#activity之间传递的消息</b></span></li></ol><div><span style="font-size: 15px;">通俗的语言来概括，Activity是入口，它会加载视图和事件绑定，用户的操作会被res/layout/activity_****.xml捕获，然后声明在Activity中的事件处理函数处理，两个Activity之间通信是基于Intent实例的。差不多就这些。</span></div></div><div style="font-size: 15px;"><br></div><div style="font-size: 15px;">我们需要思考的问题：</div><div><ol><li style="font-size: 15px;">Activity与xml的怎么关联到一起的？</li><li style="font-size: 15px;">如果不用Eclipse我会不会走很多弯路呢？</li></ol><div><span style="font-size: 15px;">大概的问题，就自己去思考找答案吧！</span></div></div><div><span style="font-size: 15px;"><b><font color="#1C3387"><br></font></b></span></div><div><span style="font-size: 15px;"><b><font color="#1C3387"><br></font></b></span></div></div>\r\n</div>');

-- --------------------------------------------------------

--
-- 表的结构 `ms_ms_articles_ms_tags`
--

CREATE TABLE IF NOT EXISTS `ms_ms_articles_ms_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `article_id` (`article_id`,`tag_id`),
  KEY `ms_ms_articles_ms_tags_30525a19` (`article_id`),
  KEY `ms_ms_articles_ms_tags_3747b463` (`tag_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=80 ;

--
-- 转存表中的数据 `ms_ms_articles_ms_tags`
--

INSERT INTO `ms_ms_articles_ms_tags` (`id`, `article_id`, `tag_id`) VALUES
(64, 11, 14),
(63, 11, 13),
(74, 10, 11),
(73, 10, 10),
(72, 10, 9),
(39, 3, 8),
(40, 3, 7),
(62, 11, 12),
(75, 16, 15),
(79, 18, 16);

-- --------------------------------------------------------

--
-- 表的结构 `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk AUTO_INCREMENT=1 ;

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
) ENGINE=MyISAM DEFAULT CHARSET=gbk AUTO_INCREMENT=1 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=28 ;

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
(19, 'Can add tag', 7, 'add_tag'),
(20, 'Can change tag', 7, 'change_tag'),
(21, 'Can delete tag', 7, 'delete_tag'),
(22, 'Can add article', 8, 'add_article'),
(23, 'Can change article', 8, 'change_article'),
(24, 'Can delete article', 8, 'delete_article'),
(25, 'Can add comment', 9, 'add_comment'),
(26, 'Can change comment', 9, 'change_comment'),
(27, 'Can delete comment', 9, 'delete_comment');

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
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `auth_user`
--

INSERT INTO `auth_user` (`id`, `username`, `first_name`, `last_name`, `email`, `password`, `is_staff`, `is_active`, `is_superuser`, `last_login`, `date_joined`) VALUES
(1, 'ray', '', '', 'rayzy1991@163.com', 'pbkdf2_sha256$10000$Bl6mDLj7kaFW$POwjwkA/3RFMBbjts6i6B151w2p/2CZRPIdZt9WtSwE=', 1, 1, 1, '2013-05-31 15:42:44', '2013-04-05 05:16:37'),
(2, 'Tom', '', '', 'tom@gmail.com', '123456', 0, 1, 0, '2013-04-05 05:18:19', '2013-04-05 05:18:19'),
(3, 'lee', '', '', 'lee@gmail.com', '123456', 0, 1, 0, '2013-04-05 05:19:13', '2013-04-05 05:19:13'),
(4, '李磊', '', '', 'lilei@gmail.com', '123456', 0, 1, 0, '2013-04-13 15:49:05', '2013-04-13 15:49:05'),
(5, '123', '', '', '123@123.com', '123456', 0, 1, 0, '2013-04-15 15:28:17', '2013-04-15 15:28:17'),
(6, '小张杨可爱多', '', '', '524893421@qq.com', '123456', 0, 1, 0, '2013-04-16 03:08:33', '2013-04-16 03:08:33'),
(7, 'spino', '', '', 'descartesdeng@163.com', '123456', 0, 1, 0, '2013-04-22 03:35:28', '2013-04-22 03:35:28'),
(8, '', '', '', '', '123456', 0, 1, 0, '2013-05-25 03:15:55', '2013-05-25 03:15:55'),
(9, 'id=10000000000000000“', '', '', 'as@a.com', '123456', 0, 1, 0, '2013-05-27 01:27:31', '2013-05-27 01:27:31');

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
) ENGINE=MyISAM DEFAULT CHARSET=gbk AUTO_INCREMENT=1 ;

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
) ENGINE=MyISAM DEFAULT CHARSET=gbk AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `auth_user_user_permissions`
--


-- --------------------------------------------------------

--
-- 表的结构 `ms_comments`
--

CREATE TABLE IF NOT EXISTS `ms_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `desc` varchar(32) DEFAULT NULL,
  `createAt` datetime NOT NULL,
  `lastModifiedAt` datetime NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `content` longtext NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `komment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `komment_id` (`komment_id`),
  KEY `ms_comments_403f60f` (`user_id`),
  KEY `ms_comments_30525a19` (`article_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=132 ;

--
-- 转存表中的数据 `ms_comments`
--

INSERT INTO `ms_comments` (`id`, `name`, `desc`, `createAt`, `lastModifiedAt`, `enabled`, `content`, `user_id`, `article_id`, `komment_id`) VALUES
(6, NULL, NULL, '2013-04-13 15:48:37', '2013-04-13 15:48:37', 1, '怎么木人回复......', 1, 10, NULL),
(5, NULL, NULL, '2013-04-08 08:03:20', '2013-04-08 08:03:20', 1, '测试回复', 1, 3, NULL),
(7, NULL, NULL, '2013-04-13 15:49:05', '2013-04-13 15:49:05', 1, 'Hello, my name is Li Lei......', 4, 10, NULL),
(8, NULL, NULL, '2013-04-15 15:28:17', '2013-04-15 15:28:17', 1, '测试回复', 5, 3, NULL),
(9, NULL, NULL, '2013-04-16 03:08:33', '2013-04-16 03:08:33', 1, '这个库我也在了解，很多大牛公司在用，应该值得学习，值得应用。', 6, 11, NULL),
(10, NULL, NULL, '2013-04-22 03:35:28', '2013-04-22 03:35:28', 1, '赞一下', 7, 16, NULL),
(11, NULL, NULL, '2013-05-25 03:15:55', '2013-05-25 03:15:55', 1, '', 8, 11, NULL),
(12, NULL, NULL, '2013-05-25 03:15:57', '2013-05-25 03:15:57', 1, '', 8, 11, NULL),
(13, NULL, NULL, '2013-05-25 03:16:00', '2013-05-25 03:16:00', 1, '', 8, 11, NULL),
(14, NULL, NULL, '2013-05-25 03:16:00', '2013-05-25 03:16:00', 1, '', 8, 11, NULL),
(15, NULL, NULL, '2013-05-25 03:16:00', '2013-05-25 03:16:00', 1, '', 8, 11, NULL),
(16, NULL, NULL, '2013-05-25 03:16:00', '2013-05-25 03:16:00', 1, '', 8, 11, NULL),
(17, NULL, NULL, '2013-05-25 03:16:00', '2013-05-25 03:16:00', 1, '', 8, 11, NULL),
(18, NULL, NULL, '2013-05-25 03:16:00', '2013-05-25 03:16:00', 1, '', 8, 11, NULL),
(19, NULL, NULL, '2013-05-25 03:16:01', '2013-05-25 03:16:01', 1, '', 8, 11, NULL),
(20, NULL, NULL, '2013-05-25 03:16:01', '2013-05-25 03:16:01', 1, '', 8, 11, NULL),
(21, NULL, NULL, '2013-05-25 03:16:01', '2013-05-25 03:16:01', 1, '', 8, 11, NULL),
(22, NULL, NULL, '2013-05-25 03:16:01', '2013-05-25 03:16:01', 1, '', 8, 11, NULL),
(23, NULL, NULL, '2013-05-25 03:16:01', '2013-05-25 03:16:01', 1, '', 8, 11, NULL),
(24, NULL, NULL, '2013-05-25 03:16:01', '2013-05-25 03:16:01', 1, '', 8, 11, NULL),
(25, NULL, NULL, '2013-05-25 03:16:01', '2013-05-25 03:16:01', 1, '', 8, 11, NULL),
(26, NULL, NULL, '2013-05-25 03:16:02', '2013-05-25 03:16:02', 1, '', 8, 11, NULL),
(27, NULL, NULL, '2013-05-25 03:16:02', '2013-05-25 03:16:02', 1, '', 8, 11, NULL),
(28, NULL, NULL, '2013-05-25 03:16:02', '2013-05-25 03:16:02', 1, '', 8, 11, NULL),
(29, NULL, NULL, '2013-05-25 03:16:02', '2013-05-25 03:16:02', 1, '', 8, 11, NULL),
(30, NULL, NULL, '2013-05-25 03:16:08', '2013-05-25 03:16:08', 1, '', 8, 11, NULL),
(31, NULL, NULL, '2013-05-25 03:16:08', '2013-05-25 03:16:08', 1, '', 8, 11, NULL),
(32, NULL, NULL, '2013-05-25 03:16:08', '2013-05-25 03:16:08', 1, '', 8, 11, NULL),
(33, NULL, NULL, '2013-05-25 03:16:08', '2013-05-25 03:16:08', 1, '', 8, 11, NULL),
(34, NULL, NULL, '2013-05-25 03:16:08', '2013-05-25 03:16:08', 1, '', 8, 11, NULL),
(35, NULL, NULL, '2013-05-25 03:16:08', '2013-05-25 03:16:08', 1, '', 8, 11, NULL),
(36, NULL, NULL, '2013-05-25 03:16:08', '2013-05-25 03:16:08', 1, '', 8, 11, NULL),
(37, NULL, NULL, '2013-05-25 03:16:09', '2013-05-25 03:16:09', 1, '', 8, 11, NULL),
(38, NULL, NULL, '2013-05-25 03:16:09', '2013-05-25 03:16:09', 1, '', 8, 11, NULL),
(39, NULL, NULL, '2013-05-25 03:16:09', '2013-05-25 03:16:09', 1, '', 8, 11, NULL),
(40, NULL, NULL, '2013-05-25 03:16:09', '2013-05-25 03:16:09', 1, '', 8, 11, NULL),
(41, NULL, NULL, '2013-05-25 03:16:09', '2013-05-25 03:16:09', 1, '', 8, 11, NULL),
(42, NULL, NULL, '2013-05-25 03:16:09', '2013-05-25 03:16:09', 1, '', 8, 11, NULL),
(43, NULL, NULL, '2013-05-25 03:16:10', '2013-05-25 03:16:10', 1, '', 8, 11, NULL),
(44, NULL, NULL, '2013-05-25 03:16:10', '2013-05-25 03:16:10', 1, '', 8, 11, NULL),
(45, NULL, NULL, '2013-05-25 03:16:10', '2013-05-25 03:16:10', 1, '', 8, 11, NULL),
(46, NULL, NULL, '2013-05-25 03:16:10', '2013-05-25 03:16:10', 1, '', 8, 11, NULL),
(47, NULL, NULL, '2013-05-25 03:16:10', '2013-05-25 03:16:10', 1, '', 8, 11, NULL),
(48, NULL, NULL, '2013-05-25 03:16:10', '2013-05-25 03:16:10', 1, '', 8, 11, NULL),
(49, NULL, NULL, '2013-05-25 03:16:11', '2013-05-25 03:16:11', 1, '', 8, 11, NULL),
(50, NULL, NULL, '2013-05-25 03:16:11', '2013-05-25 03:16:11', 1, '', 8, 11, NULL),
(51, NULL, NULL, '2013-05-25 03:16:11', '2013-05-25 03:16:11', 1, '', 8, 11, NULL),
(52, NULL, NULL, '2013-05-25 03:16:11', '2013-05-25 03:16:11', 1, '', 8, 11, NULL),
(53, NULL, NULL, '2013-05-25 03:16:11', '2013-05-25 03:16:11', 1, '', 8, 11, NULL),
(54, NULL, NULL, '2013-05-25 03:16:11', '2013-05-25 03:16:11', 1, '', 8, 11, NULL),
(55, NULL, NULL, '2013-05-25 03:16:11', '2013-05-25 03:16:11', 1, '', 8, 11, NULL),
(56, NULL, NULL, '2013-05-25 03:16:12', '2013-05-25 03:16:12', 1, '', 8, 11, NULL),
(57, NULL, NULL, '2013-05-25 03:16:12', '2013-05-25 03:16:12', 1, '', 8, 11, NULL),
(58, NULL, NULL, '2013-05-25 03:16:12', '2013-05-25 03:16:12', 1, '', 8, 11, NULL),
(59, NULL, NULL, '2013-05-25 03:16:12', '2013-05-25 03:16:12', 1, '', 8, 11, NULL),
(60, NULL, NULL, '2013-05-25 03:16:12', '2013-05-25 03:16:12', 1, '', 8, 11, NULL),
(61, NULL, NULL, '2013-05-25 03:16:12', '2013-05-25 03:16:12', 1, '', 8, 11, NULL),
(62, NULL, NULL, '2013-05-25 03:16:12', '2013-05-25 03:16:12', 1, '', 8, 11, NULL),
(63, NULL, NULL, '2013-05-25 03:16:13', '2013-05-25 03:16:13', 1, '', 8, 11, NULL),
(64, NULL, NULL, '2013-05-25 03:16:13', '2013-05-25 03:16:13', 1, '', 8, 11, NULL),
(65, NULL, NULL, '2013-05-25 03:16:13', '2013-05-25 03:16:13', 1, '', 8, 11, NULL),
(66, NULL, NULL, '2013-05-25 03:16:13', '2013-05-25 03:16:13', 1, '', 8, 11, NULL),
(67, NULL, NULL, '2013-05-25 03:16:13', '2013-05-25 03:16:13', 1, '', 8, 11, NULL),
(68, NULL, NULL, '2013-05-25 03:16:13', '2013-05-25 03:16:13', 1, '', 8, 11, NULL),
(69, NULL, NULL, '2013-05-25 03:16:14', '2013-05-25 03:16:14', 1, '', 8, 11, NULL),
(70, NULL, NULL, '2013-05-25 03:16:14', '2013-05-25 03:16:14', 1, '', 8, 11, NULL),
(71, NULL, NULL, '2013-05-25 03:16:14', '2013-05-25 03:16:14', 1, '', 8, 11, NULL),
(72, NULL, NULL, '2013-05-25 03:16:14', '2013-05-25 03:16:14', 1, '', 8, 11, NULL),
(73, NULL, NULL, '2013-05-25 03:16:14', '2013-05-25 03:16:14', 1, '', 8, 11, NULL),
(74, NULL, NULL, '2013-05-25 03:16:14', '2013-05-25 03:16:14', 1, '', 8, 11, NULL),
(75, NULL, NULL, '2013-05-25 03:16:15', '2013-05-25 03:16:15', 1, '', 8, 11, NULL),
(76, NULL, NULL, '2013-05-25 03:16:15', '2013-05-25 03:16:15', 1, '', 8, 11, NULL),
(77, NULL, NULL, '2013-05-25 03:16:15', '2013-05-25 03:16:15', 1, '', 8, 11, NULL),
(78, NULL, NULL, '2013-05-25 03:16:15', '2013-05-25 03:16:15', 1, '', 8, 11, NULL),
(79, NULL, NULL, '2013-05-25 03:16:15', '2013-05-25 03:16:15', 1, '', 8, 11, NULL),
(80, NULL, NULL, '2013-05-25 03:16:15', '2013-05-25 03:16:15', 1, '', 8, 11, NULL),
(81, NULL, NULL, '2013-05-25 03:16:16', '2013-05-25 03:16:16', 1, '', 8, 11, NULL),
(82, NULL, NULL, '2013-05-25 03:16:16', '2013-05-25 03:16:16', 1, '', 8, 11, NULL),
(83, NULL, NULL, '2013-05-25 03:16:16', '2013-05-25 03:16:16', 1, '', 8, 11, NULL),
(84, NULL, NULL, '2013-05-25 03:16:16', '2013-05-25 03:16:16', 1, '', 8, 11, NULL),
(85, NULL, NULL, '2013-05-25 03:16:16', '2013-05-25 03:16:16', 1, '', 8, 11, NULL),
(86, NULL, NULL, '2013-05-25 03:16:16', '2013-05-25 03:16:16', 1, '', 8, 11, NULL),
(87, NULL, NULL, '2013-05-25 03:16:17', '2013-05-25 03:16:17', 1, '', 8, 11, NULL),
(88, NULL, NULL, '2013-05-25 03:16:17', '2013-05-25 03:16:17', 1, '', 8, 11, NULL),
(89, NULL, NULL, '2013-05-25 03:16:17', '2013-05-25 03:16:17', 1, '', 8, 11, NULL),
(90, NULL, NULL, '2013-05-25 03:16:17', '2013-05-25 03:16:17', 1, '', 8, 11, NULL),
(91, NULL, NULL, '2013-05-25 03:16:17', '2013-05-25 03:16:17', 1, '', 8, 11, NULL),
(92, NULL, NULL, '2013-05-25 03:16:17', '2013-05-25 03:16:17', 1, '', 8, 11, NULL),
(93, NULL, NULL, '2013-05-25 03:16:23', '2013-05-25 03:16:23', 1, '', 8, 11, NULL),
(94, NULL, NULL, '2013-05-25 03:16:23', '2013-05-25 03:16:23', 1, '', 8, 11, NULL),
(95, NULL, NULL, '2013-05-25 03:16:23', '2013-05-25 03:16:23', 1, '', 8, 11, NULL),
(96, NULL, NULL, '2013-05-25 03:16:23', '2013-05-25 03:16:23', 1, '', 8, 11, NULL),
(97, NULL, NULL, '2013-05-25 03:16:23', '2013-05-25 03:16:23', 1, '', 8, 11, NULL),
(98, NULL, NULL, '2013-05-25 03:16:24', '2013-05-25 03:16:24', 1, '', 8, 11, NULL),
(99, NULL, NULL, '2013-05-25 03:16:24', '2013-05-25 03:16:24', 1, '', 8, 11, NULL),
(100, NULL, NULL, '2013-05-25 03:16:24', '2013-05-25 03:16:24', 1, '', 8, 11, NULL),
(101, NULL, NULL, '2013-05-25 03:16:24', '2013-05-25 03:16:24', 1, '', 8, 11, NULL),
(102, NULL, NULL, '2013-05-25 03:16:24', '2013-05-25 03:16:24', 1, '', 8, 11, NULL),
(103, NULL, NULL, '2013-05-25 03:16:25', '2013-05-25 03:16:25', 1, '', 8, 11, NULL),
(104, NULL, NULL, '2013-05-25 03:16:25', '2013-05-25 03:16:25', 1, '', 8, 11, NULL),
(105, NULL, NULL, '2013-05-25 03:16:25', '2013-05-25 03:16:25', 1, '', 8, 11, NULL),
(106, NULL, NULL, '2013-05-25 03:16:25', '2013-05-25 03:16:25', 1, '', 8, 11, NULL),
(107, NULL, NULL, '2013-05-25 03:16:25', '2013-05-25 03:16:25', 1, '', 8, 11, NULL),
(108, NULL, NULL, '2013-05-25 03:16:25', '2013-05-25 03:16:25', 1, '', 8, 11, NULL),
(109, NULL, NULL, '2013-05-25 03:16:25', '2013-05-25 03:16:25', 1, '', 8, 11, NULL),
(110, NULL, NULL, '2013-05-25 03:16:26', '2013-05-25 03:16:26', 1, '', 8, 11, NULL),
(111, NULL, NULL, '2013-05-25 03:16:26', '2013-05-25 03:16:26', 1, '', 8, 11, NULL),
(112, NULL, NULL, '2013-05-25 03:16:26', '2013-05-25 03:16:26', 1, '', 8, 11, NULL),
(113, NULL, NULL, '2013-05-25 03:16:26', '2013-05-25 03:16:26', 1, '', 8, 11, NULL),
(114, NULL, NULL, '2013-05-25 03:16:26', '2013-05-25 03:16:26', 1, '', 8, 11, NULL),
(115, NULL, NULL, '2013-05-25 03:16:26', '2013-05-25 03:16:26', 1, '', 8, 11, NULL),
(116, NULL, NULL, '2013-05-25 03:16:27', '2013-05-25 03:16:27', 1, '', 8, 11, NULL),
(117, NULL, NULL, '2013-05-25 03:16:27', '2013-05-25 03:16:27', 1, '', 8, 11, NULL),
(118, NULL, NULL, '2013-05-25 03:16:27', '2013-05-25 03:16:27', 1, '', 8, 11, NULL),
(119, NULL, NULL, '2013-05-25 03:16:27', '2013-05-25 03:16:27', 1, '', 8, 11, NULL),
(120, NULL, NULL, '2013-05-25 03:16:27', '2013-05-25 03:16:27', 1, '', 8, 11, NULL),
(121, NULL, NULL, '2013-05-25 03:16:27', '2013-05-25 03:16:27', 1, '', 8, 11, NULL),
(122, NULL, NULL, '2013-05-25 03:16:28', '2013-05-25 03:16:28', 1, '', 8, 11, NULL),
(123, NULL, NULL, '2013-05-25 03:16:28', '2013-05-25 03:16:28', 1, '', 8, 11, NULL),
(124, NULL, NULL, '2013-05-25 03:16:28', '2013-05-25 03:16:28', 1, '', 8, 11, NULL),
(125, NULL, NULL, '2013-05-25 03:16:28', '2013-05-25 03:16:28', 1, '', 8, 11, NULL),
(126, NULL, NULL, '2013-05-25 03:16:28', '2013-05-25 03:16:28', 1, '', 8, 11, NULL),
(127, NULL, NULL, '2013-05-25 03:16:29', '2013-05-25 03:16:29', 1, '', 8, 11, NULL),
(128, NULL, NULL, '2013-05-25 03:16:30', '2013-05-25 03:16:30', 1, '', 8, 11, NULL),
(129, NULL, NULL, '2013-05-25 03:16:30', '2013-05-25 03:16:30', 1, '', 8, 11, NULL),
(130, NULL, NULL, '2013-05-25 03:16:52', '2013-05-25 03:16:52', 1, '以后简单的加个空判断吧', 8, 11, NULL),
(131, NULL, NULL, '2013-05-27 01:27:31', '2013-05-27 01:27:31', 1, '<a href="http://zxdesign.zxq.net/">http://zxdesign.zxq.net/</a>', 9, 11, NULL);

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
) ENGINE=MyISAM DEFAULT CHARSET=gbk AUTO_INCREMENT=1 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=10 ;

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
(7, 'tag', 'article', 'tag'),
(8, 'article', 'article', 'article'),
(9, 'comment', 'article', 'comment');

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
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

--
-- 转存表中的数据 `django_session`
--


-- --------------------------------------------------------

--
-- 表的结构 `images`
--

CREATE TABLE IF NOT EXISTS `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `desc` varchar(32) DEFAULT NULL,
  `createAt` datetime NOT NULL,
  `lastModifiedAt` datetime NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `path` varchar(200) NOT NULL,
  `target` varchar(200) DEFAULT NULL,
  `type` varchar(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `images`
--

INSERT INTO `images` (`id`, `name`, `desc`, `createAt`, `lastModifiedAt`, `enabled`, `path`, `target`, `type`) VALUES
(2, NULL, 'Modernizr库检测HTML5特性！', '2013-04-20 05:30:31', '2013-04-20 05:30:31', 1, 'http://rayzy1991-media.stor.sinaapp.com/modernizr.png', 'article/11/', 'POST'),
(4, NULL, 'SVG仪表盘(基于jQuery)', '2013-04-20 05:36:31', '2013-04-20 05:36:31', 1, 'http://rayzy1991-media.stor.sinaapp.com/instrument.jpg', 'http://rayzy1991-demo.stor.sinaapp.com/instrument/home.html', 'DEMO'),
(5, NULL, '第一个安卓开发实践', '2013-04-21 03:27:58', '2013-04-21 03:27:58', 1, 'http://rayzy1991-media.stor.sinaapp.com/index_landing_page.png', 'article/16/', 'POST'),
(9, NULL, 'UI设计展示', '2013-05-31 15:43:42', '2013-05-31 15:43:42', 1, 'http://rayzy1991-media.stor.sinaapp.com/flat.png', 'design', 'IMG'),
(7, NULL, '使用gruntjs自动化工具', '2013-05-22 06:57:30', '2013-05-22 06:57:30', 1, 'http://rayzy1991-media.stor.sinaapp.com/gruntjs.png', 'article/18/', 'POST'),
(8, NULL, '常用交互代码片段', '2013-05-24 08:51:00', '2013-05-24 08:51:00', 1, 'http://rayzy1991-media.stor.sinaapp.com/snippet.jpg', 'http://rayzy1991-demo.stor.sinaapp.com/MyCommon/index.html', 'DEMO');

-- --------------------------------------------------------

--
-- 表的结构 `ms_tags`
--

CREATE TABLE IF NOT EXISTS `ms_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `desc` varchar(32) DEFAULT NULL,
  `createAt` datetime NOT NULL,
  `lastModifiedAt` datetime NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `bgcolor` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=18 ;

--
-- 转存表中的数据 `ms_tags`
--

INSERT INTO `ms_tags` (`id`, `name`, `desc`, `createAt`, `lastModifiedAt`, `enabled`, `bgcolor`) VALUES
(1, '测试', NULL, '2013-04-05 05:17:16', '2013-04-05 05:17:16', 1, NULL),
(2, 'Test', NULL, '2013-04-05 05:36:24', '2013-04-05 05:36:24', 1, NULL),
(3, '修改测试', NULL, '2013-04-05 06:49:24', '2013-04-05 06:49:24', 1, NULL),
(4, '嘻嘻', NULL, '2013-04-05 06:52:52', '2013-04-05 06:52:52', 1, NULL),
(5, 'ss', NULL, '2013-04-05 07:14:33', '2013-04-05 07:14:33', 1, NULL),
(6, '新增2号', NULL, '2013-04-05 07:35:29', '2013-04-05 07:35:29', 1, NULL),
(7, 'django', NULL, '2013-04-07 08:37:43', '2013-04-07 08:37:43', 1, NULL),
(8, 'python', NULL, '2013-04-07 08:37:43', '2013-04-07 08:37:43', 1, NULL),
(9, 'JavaScript', NULL, '2013-04-09 09:21:16', '2013-04-09 09:21:16', 1, NULL),
(10, 'HTML', NULL, '2013-04-09 09:21:16', '2013-04-09 09:21:16', 1, NULL),
(11, 'CSS', NULL, '2013-04-09 09:21:16', '2013-04-09 09:21:16', 1, NULL),
(12, 'html5', NULL, '2013-04-16 02:50:33', '2013-04-16 02:50:33', 1, NULL),
(13, 'css3', NULL, '2013-04-16 02:50:33', '2013-04-16 02:50:33', 1, NULL),
(14, 'modernizr', NULL, '2013-04-16 02:50:33', '2013-04-16 02:50:33', 1, NULL),
(15, 'android', NULL, '2013-04-20 11:48:01', '2013-04-20 11:48:01', 1, NULL),
(16, 'gruntjs', NULL, '2013-05-22 06:51:34', '2013-05-22 06:51:34', 1, NULL),
(17, '前端开发', NULL, '2013-05-22 06:51:34', '2013-05-22 06:51:34', 1, NULL);
