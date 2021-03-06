USE [master]
GO
/****** Object:  Database [ITweb]    Script Date: 2022/5/20 16:27:44 ******/
CREATE DATABASE [ITweb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ITweb', FILENAME = N'E:\软件\数据库软件\MSSQL14.SQLEXPRESS\MSSQL\DATA\ITweb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ITweb_log', FILENAME = N'E:\软件\数据库软件\MSSQL14.SQLEXPRESS\MSSQL\DATA\ITweb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ITweb] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ITweb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ITweb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ITweb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ITweb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ITweb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ITweb] SET ARITHABORT OFF 
GO
ALTER DATABASE [ITweb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ITweb] SET AUTO_SHRINK ON 
GO
ALTER DATABASE [ITweb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ITweb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ITweb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ITweb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ITweb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ITweb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ITweb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ITweb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ITweb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ITweb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ITweb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ITweb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ITweb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ITweb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ITweb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ITweb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ITweb] SET  MULTI_USER 
GO
ALTER DATABASE [ITweb] SET PAGE_VERIFY NONE  
GO
ALTER DATABASE [ITweb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ITweb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ITweb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ITweb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ITweb] SET QUERY_STORE = OFF
GO
USE [ITweb]
GO
/****** Object:  Table [dbo].[leibie]    Script Date: 2022/5/20 16:27:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[leibie](
	[Classid] [int] IDENTITY(1,1) NOT NULL,
	[Classname] [nvarchar](50) NULL,
 CONSTRAINT [PK_leibie] PRIMARY KEY CLUSTERED 
(
	[Classid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[leibiex]    Script Date: 2022/5/20 16:27:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[leibiex](
	[Classxid] [int] IDENTITY(1,1) NOT NULL,
	[Classid] [int] NULL,
	[Classxname] [nvarchar](50) NULL,
 CONSTRAINT [PK_leibiex] PRIMARY KEY CLUSTERED 
(
	[Classxid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_leibie]    Script Date: 2022/5/20 16:27:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_leibie]
AS
SELECT dbo.leibiex.Classxid, dbo.leibiex.Classid, dbo.leibiex.Classxname, 
      dbo.leibie.Classname
FROM dbo.leibiex INNER JOIN
      dbo.leibie ON dbo.leibiex.Classid = dbo.leibie.Classid
GO
/****** Object:  Table [dbo].[product]    Script Date: 2022/5/20 16:27:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[pid] [int] IDENTITY(1,1) NOT NULL,
	[classid] [int] NULL,
	[classxid] [int] NULL,
	[productname] [nvarchar](50) NULL,
	[productintroduce] [text] NULL,
	[productchu] [nvarchar](200) NULL,
	[productimage] [nvarchar](50) NULL,
	[masterprice] [decimal](10, 2) NULL,
	[hotprice] [decimal](10, 2) NULL,
	[newproduct] [int] NULL,
	[guige] [nvarchar](50) NULL,
	[productguanjian] [nvarchar](200) NULL,
	[adddate] [datetime] NULL,
	[pkc] [int] NULL,
	[sl] [int] NULL,
	[hittimes] [int] NULL,
	[jifen] [int] NULL,
	[zenpin] [nvarchar](50) NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_Product]    Script Date: 2022/5/20 16:27:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_Product]
AS
SELECT dbo.product.*, dbo.leibie.Classname AS Classname, 
      dbo.leibiex.Classxname AS Classxname
FROM dbo.product INNER JOIN
      dbo.leibie ON dbo.product.classid = dbo.leibie.Classid INNER JOIN
      dbo.leibiex ON dbo.product.classxid = dbo.leibiex.Classxid
GO
/****** Object:  Table [dbo].[admin]    Script Date: 2022/5/20 16:27:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[admin] [varchar](50) NULL,
	[password] [varchar](50) NULL,
 CONSTRAINT [PK_admin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[city_table]    Script Date: 2022/5/20 16:27:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[city_table](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[oneid] [int] NULL,
	[twoid] [int] NULL,
	[three] [int] NULL,
	[name] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[d_users]    Script Date: 2022/5/20 16:27:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[d_users](
	[uid] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[truename] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[question] [nvarchar](50) NULL,
	[answer] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[sex] [nvarchar](50) NULL,
	[regdate] [datetime] NULL,
	[lastloginip] [nvarchar](50) NULL,
	[logintimes] [int] NULL,
	[userjifen] [int] NULL,
	[QQ] [nvarchar](50) NULL,
	[lastlogintime] [datetime] NULL,
	[IDCARD] [nvarchar](50) NULL,
	[Address] [nvarchar](200) NULL,
	[Telephone] [nvarchar](50) NULL,
	[Postcode] [nvarchar](50) NULL,
	[Usertype] [int] NULL,
 CONSTRAINT [PK_d_users] PRIMARY KEY CLUSTERED 
(
	[uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[gonggao]    Script Date: 2022/5/20 16:27:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gonggao](
	[gid] [int] IDENTITY(1,1) NOT NULL,
	[gtitle] [varchar](50) NULL,
	[gcontent] [text] NULL,
	[gdate] [datetime] NULL,
	[gfeel] [int] NULL,
 CONSTRAINT [PK_gonggao] PRIMARY KEY CLUSTERED 
(
	[gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[help1]    Script Date: 2022/5/20 16:27:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[help1](
	[hid] [int] IDENTITY(1,1) NOT NULL,
	[hename] [varchar](200) NULL,
 CONSTRAINT [PK_help1] PRIMARY KEY CLUSTERED 
(
	[hid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[help2]    Script Date: 2022/5/20 16:27:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[help2](
	[hhid] [int] IDENTITY(1,1) NOT NULL,
	[hid] [int] NULL,
	[helpname] [varchar](200) NULL,
	[helpdetail] [ntext] NULL,
 CONSTRAINT [PK_help2] PRIMARY KEY CLUSTERED 
(
	[hhid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[newcenter]    Script Date: 2022/5/20 16:27:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[newcenter](
	[nid] [int] IDENTITY(1,1) NOT NULL,
	[newtitle] [varchar](50) NULL,
	[newcontact] [text] NULL,
	[newshijian] [datetime] NULL,
	[hittime] [int] NULL,
 CONSTRAINT [PK_newcenter] PRIMARY KEY CLUSTERED 
(
	[nid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderdetail]    Script Date: 2022/5/20 16:27:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderdetail](
	[detailid] [int] IDENTITY(1,1) NOT NULL,
	[pid] [int] NULL,
	[shuliang] [int] NULL,
	[orderid] [varchar](50) NULL,
	[producttotail] [decimal](18, 2) NULL,
 CONSTRAINT [PK_orderdetail] PRIMARY KEY CLUSTERED 
(
	[detailid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 2022/5/20 16:27:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[oid] [int] IDENTITY(1,1) NOT NULL,
	[orderid] [varchar](50) NULL,
	[username] [varchar](50) NULL,
	[userid] [int] NULL,
	[shouhuoname] [varchar](50) NULL,
	[address] [nvarchar](200) NULL,
	[postcode] [nvarchar](50) NULL,
	[telephone] [nvarchar](50) NULL,
	[songhuofs] [nvarchar](50) NULL,
	[fukuanfs] [nvarchar](50) NULL,
	[dingdanfeel] [int] NULL,
	[dingdanshijian] [datetime] NULL,
	[dingdantotal] [decimal](18, 2) NULL,
	[beizhu] [varchar](50) NULL,
	[djifen] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productliuyan]    Script Date: 2022/5/20 16:27:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productliuyan](
	[lid] [int] IDENTITY(1,1) NOT NULL,
	[pid] [int] NULL,
	[liuname] [varchar](50) NULL,
	[liutime] [datetime] NULL,
	[liuzhu] [nvarchar](1000) NULL,
	[liuhui] [nvarchar](1000) NULL,
	[huifutime] [varchar](50) NULL,
 CONSTRAINT [PK_productliuyan] PRIMARY KEY CLUSTERED 
(
	[lid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pxiaoxi]    Script Date: 2022/5/20 16:27:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pxiaoxi](
	[pid] [int] IDENTITY(1,1) NOT NULL,
	[pcontent] [text] NULL,
	[pfeel] [varchar](50) NULL,
	[userid] [varchar](50) NULL,
 CONSTRAINT [PK_pxiaoxi] PRIMARY KEY CLUSTERED 
(
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shoucang]    Script Date: 2022/5/20 16:27:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shoucang](
	[sid] [int] IDENTITY(1,1) NOT NULL,
	[pid] [int] NULL,
	[username] [varchar](50) NULL,
	[shoutime] [datetime] NULL,
 CONSTRAINT [PK_shoucang] PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[admin] ON 

INSERT [dbo].[admin] ([id], [admin], [password]) VALUES (2, N'admin', N'admin')
SET IDENTITY_INSERT [dbo].[admin] OFF
SET IDENTITY_INSERT [dbo].[city_table] ON 

INSERT [dbo].[city_table] ([id], [oneid], [twoid], [three], [name]) VALUES (1, 1, 0, 0, N'广东省')
INSERT [dbo].[city_table] ([id], [oneid], [twoid], [three], [name]) VALUES (2, 2, 0, 0, N'湖南省')
INSERT [dbo].[city_table] ([id], [oneid], [twoid], [three], [name]) VALUES (3, 3, 0, 0, N'广西省')
INSERT [dbo].[city_table] ([id], [oneid], [twoid], [three], [name]) VALUES (4, 4, 0, 0, N'江苏省')
INSERT [dbo].[city_table] ([id], [oneid], [twoid], [three], [name]) VALUES (5, 5, 2, 0, N'四川省')
INSERT [dbo].[city_table] ([id], [oneid], [twoid], [three], [name]) VALUES (6, 6, 0, 0, N'云南省')
INSERT [dbo].[city_table] ([id], [oneid], [twoid], [three], [name]) VALUES (7, 7, 0, 0, N'江西省')
INSERT [dbo].[city_table] ([id], [oneid], [twoid], [three], [name]) VALUES (8, 8, 0, 0, N'湖北省')
INSERT [dbo].[city_table] ([id], [oneid], [twoid], [three], [name]) VALUES (9, 1, 1, 0, N'二级')
INSERT [dbo].[city_table] ([id], [oneid], [twoid], [three], [name]) VALUES (10, 1, 1, 0, N'二级')
INSERT [dbo].[city_table] ([id], [oneid], [twoid], [three], [name]) VALUES (11, 1, 1, 0, N'二级')
INSERT [dbo].[city_table] ([id], [oneid], [twoid], [three], [name]) VALUES (12, 1, 1, 0, N'二级')
INSERT [dbo].[city_table] ([id], [oneid], [twoid], [three], [name]) VALUES (13, 1, 1, 0, N'二级')
INSERT [dbo].[city_table] ([id], [oneid], [twoid], [three], [name]) VALUES (14, 1, 1, 0, N'二级')
INSERT [dbo].[city_table] ([id], [oneid], [twoid], [three], [name]) VALUES (15, 1, 1, 0, N'二级')
INSERT [dbo].[city_table] ([id], [oneid], [twoid], [three], [name]) VALUES (16, 1, 1, 0, N'二级')
INSERT [dbo].[city_table] ([id], [oneid], [twoid], [three], [name]) VALUES (17, 1, 1, 1, N'三级')
INSERT [dbo].[city_table] ([id], [oneid], [twoid], [three], [name]) VALUES (18, 1, 1, 1, N'三级')
INSERT [dbo].[city_table] ([id], [oneid], [twoid], [three], [name]) VALUES (19, 1, 1, 1, N'三级')
INSERT [dbo].[city_table] ([id], [oneid], [twoid], [three], [name]) VALUES (20, 1, 1, 1, N'三级')
INSERT [dbo].[city_table] ([id], [oneid], [twoid], [three], [name]) VALUES (21, 1, 1, 1, N'三级')
INSERT [dbo].[city_table] ([id], [oneid], [twoid], [three], [name]) VALUES (22, 1, 1, 1, N'三级')
SET IDENTITY_INSERT [dbo].[city_table] OFF
SET IDENTITY_INSERT [dbo].[d_users] ON 

INSERT [dbo].[d_users] ([uid], [username], [truename], [password], [question], [answer], [email], [sex], [regdate], [lastloginip], [logintimes], [userjifen], [QQ], [lastlogintime], [IDCARD], [Address], [Telephone], [Postcode], [Usertype]) VALUES (16, N'1104217060', NULL, NULL, N'你的出生地在哪？', N'吉林省长春市', N'1104217060@qq.com', NULL, CAST(N'2022-04-16T13:50:59.000' AS DateTime), NULL, NULL, NULL, N'', NULL, NULL, N'', N'', N'', NULL)
INSERT [dbo].[d_users] ([uid], [username], [truename], [password], [question], [answer], [email], [sex], [regdate], [lastloginip], [logintimes], [userjifen], [QQ], [lastlogintime], [IDCARD], [Address], [Telephone], [Postcode], [Usertype]) VALUES (1016, N'3458881753', NULL, N'3458881753', N'你的爱好是什么？', N'美食', N'3458881753@qq.com', NULL, CAST(N'2022-05-17T14:23:37.403' AS DateTime), N'::1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[d_users] ([uid], [username], [truename], [password], [question], [answer], [email], [sex], [regdate], [lastloginip], [logintimes], [userjifen], [QQ], [lastlogintime], [IDCARD], [Address], [Telephone], [Postcode], [Usertype]) VALUES (1017, N'2607724910', NULL, N'000000', N'你的爱好是什么？', N'美食', N'2607724910@qq.com', NULL, CAST(N'2022-05-17T14:27:28.907' AS DateTime), N'::1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[d_users] ([uid], [username], [truename], [password], [question], [answer], [email], [sex], [regdate], [lastloginip], [logintimes], [userjifen], [QQ], [lastlogintime], [IDCARD], [Address], [Telephone], [Postcode], [Usertype]) VALUES (1018, N'1648785032', NULL, N'1648785032', N'你的爱好是什么？', N'美食', N'1648785032@qq.com', NULL, CAST(N'2022-05-17T14:32:23.783' AS DateTime), N'::1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[d_users] ([uid], [username], [truename], [password], [question], [answer], [email], [sex], [regdate], [lastloginip], [logintimes], [userjifen], [QQ], [lastlogintime], [IDCARD], [Address], [Telephone], [Postcode], [Usertype]) VALUES (1019, N'15776556799', NULL, N'000000', N'你最想去旅游的地方？', N'大庆', N'yzh2607724910@126.com', NULL, CAST(N'2022-05-19T18:46:17.463' AS DateTime), N'::1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[d_users] OFF
SET IDENTITY_INSERT [dbo].[help1] ON 

INSERT [dbo].[help1] ([hid], [hename]) VALUES (1, N'新手上路')
INSERT [dbo].[help1] ([hid], [hename]) VALUES (2, N'支付方式')
INSERT [dbo].[help1] ([hid], [hename]) VALUES (3, N'配送服务')
INSERT [dbo].[help1] ([hid], [hename]) VALUES (4, N'售后服务')
SET IDENTITY_INSERT [dbo].[help1] OFF
SET IDENTITY_INSERT [dbo].[help2] ON 

INSERT [dbo].[help2] ([hhid], [hid], [helpname], [helpdetail]) VALUES (1, 1, N'新用户注册', N'<P>1、进入主页后，点击首页左上角的“免费注册”</P>
<P>&nbsp;</P>
<P>&nbsp;</P>
<P>2、进入注册页面，填写注册信息 <BR>&nbsp;</P>
<P>&nbsp;</P>
<P>EMAIL地址:请输入您常用的Email地址，以方便您登录购物、接收验证邮件、找回密码；注册成功后</P>
<P>设置昵称：昵称可由大小写英文字母、汉字、数字组成，长度4-20个字符(1个汉字为2个字符)</P>
<P>设定密码：密码可由大小写英文字母或数字组成，长度6-20个字符</P>
<P>验证码：填写验证码不区分大小写，请确保输入法在英文半角状态。如看不到验证码，点此查看解决方法</P>
<P>信息填写完成后，阅读《交易条款》和《用户使用条款》，点击“提交注册”按钮</P>
<P>温馨提示：注册成功后，您可以登陆“我的当当”修改佻的注册EMAIL地址、昵称、密码</P>
<P>&nbsp;</P>
<P>3、点击“提交注册”后，会提示您前往邮箱完成验证</P>
<P>&nbsp;</P>
<P><BR>如长时间未收到邮件，请尝试： </P>
<P>（1）查看邮箱的垃圾箱或广告箱，邮件有可能被误放入</P>
<P>（2）如确认无法找到验证邮件，可点此重新发送 </P>
<P>（3）也可点此更换其他邮箱，再收验证邮件 </P>
<P>&nbsp;</P>
<P>4、进入邮箱完成验证</P>
<P>&nbsp;</P>
<P>5、完成验证，注册成功！<BR></P>')
INSERT [dbo].[help2] ([hhid], [hid], [helpname], [helpdetail]) VALUES (2, 1, N'怎样下订单', N'<P>搜索商品：&nbsp;<BR>&nbsp;为您提供了方便快捷的商品搜索功能 <BR>（1）您可以通过在首页输入关键字的方法来搜索您想要购买的商品。 <BR>（2）您还可以通过当当的分类导航栏来找到您想要购买的商品分类，根据分类找到您的商品。 <BR>（3）观看搜索商品演示。 <BR>2、放入购物车： <BR>&nbsp;在您想要购买的商品的详情页点击“购买”，商品会添加到您的购物车中；您还可以继续挑选商品放入购物车，一起结算。 <BR>（1）在购物车中，每件商品的订购数量默认为一件，如果您想购买多件商品，可修改购买数量。<BR>&nbsp;<BR>（2）如果您在购物车中删除了某件商品，该商品会暂时放在下面；想重新购买这件商品，点击“恢复”，就可以将它重新放入购物车了。<BR>&nbsp;<BR>（3）购物车页面上方的商品是当当网根据您订购的商品为您作出的推荐，如果有您喜爱的商品，您可以直接点击“购买”。<BR>&nbsp;<BR>3、登陆注册： <BR>&nbsp;老顾客，请输入您的E-mail地址或昵称、密码、验证码，点击“登录”；新顾客，请点击“还没有注册”，按提示完成注册。&nbsp; <BR>4、选择订单：<BR>&nbsp;<BR>&nbsp;如果购物车中有两个以上（含两个）的商家的商品，您需要分别提交每个商家的订单。 <BR>5、填写收货人信息选择送货方式选择付款方式：<BR>&nbsp;<BR>（1）请您填写真实的收货人姓名、所在地区、详细的收货地址、邮编和联系电话。<BR>&nbsp;<BR>（2）提供的送货方式有普通快递送货上门、加急快递送货上门、普通邮递、特快专递；查看快递的送货范围、时间及费用。 <BR>（3）当当网为您提供了网上支付、货到付款、邮局汇款、银行转账等多种支付方式。<BR>&nbsp;<BR>6、订单确认：<BR>&nbsp;<BR>&nbsp;填写完以上信息之后，请仔细核对；确认无误后，请点击“提交订单”按钮提交订单。生成订单号后，表明您已经成功提交了订单。 <BR>&nbsp; <BR>温馨提示：<BR>&nbsp;<BR>1、您一旦选择使用礼券并点击“确定使用”后，将无法取消使用礼券，如果您取消了该订单，礼券无法恢复。<BR>&nbsp;<BR>2、如果您将商品放入购物车但尚未提交订单，购物车中商品的价格、优惠政策、配送时间等信息可能发生变化。因此，您保留在 <BR>购物车中的商品最终成交信息将以您成功提交订单时当当网公布的信息为准。<BR>&nbsp;</P>
<P><BR>&nbsp;</P>')
INSERT [dbo].[help2] ([hhid], [hid], [helpname], [helpdetail]) VALUES (3, 2, N'在线支付', N'城支持绝大多数银行借记卡及信用卡，即时到帐，准确快捷，推荐您在支付货款时使用！')
INSERT [dbo].[help2] ([hhid], [hid], [helpname], [helpdetail]) VALUES (4, 3, N'配送时间', N'4')
INSERT [dbo].[help2] ([hhid], [hid], [helpname], [helpdetail]) VALUES (5, 4, N'服务保障承诺', N'4. 送货<BR>将会把产品送到您所指定的送货地址。所有在当当网站上列出的送货时间为参考时间，参考时间的计算是根据库存状况、正常的处理过程和送货时间、送货地点的基础上估计得出的。参考时间不代表等同于到货时间。
<P>5.退款政策</P>
<P>退货或换货商品缺货时产生的现金款项，退回方式视支付方式的不同而不同：</P>
<P>1） 网上支付的订单，退款退回至原支付卡；</P>
<P>2） 银行转帐或邮局汇款支付的订单，退款退回至下订单账户的账户余额中。</P>
<P>6. 条款的修正 <BR>这些交易条件的条款适用于当当网为您提供的产品销售服务。这些条款将有可能不时的被修正。任何修正条款的发生，当当网都将会及时公布。<BR>7. 条款的可执行性<BR>如果出于任何原因，这些条款及其条件的部分不能得以执行，其他条款及其条件的有效性将不受影响。<BR>8. 适用的法律和管辖权<BR>您和当当网之间的契约将适用中华人民共和国的法律，所有的争端将诉诸于当当网所在地的人民法院。<BR>9、会员制计划（VIP计划）协议的变更/终止/责任限制<BR>当当网的会员制计划（VIP计划），本计划由北京当当网信息技术有限公司/或其关联企业提供。以上计划条款和条件，连同计划有关的任何促销内容的相应条款和条件，构成本计划会员与当当之间关于制度的完整协议。如果您参加计划，您就接受了这些条款、条件、限制和要求。请注意，您对当当网站的使用以及您的会员资格还受制于当当网站上时常更新的所有条款、条件、限制和要求，请仔细阅读这些条款和条件。<BR>协议的变更<BR>可以在没有特殊通知的情况下自行变更本条款、当当网的任何其它条款和条件、或您的计划会员资格的任何方面。 对这些条款的任何修改将被包含在当当网的更新的条款中。如果任何变更被认定为无效、废止或因任何原因不可执行，则该变更是可分割的，且不影响其它变更或条</P>')
INSERT [dbo].[help2] ([hhid], [hid], [helpname], [helpdetail]) VALUES (6, 2, N'货到付款', N'货到付款运费及送货范围：支持货到付款地区： 北京 上海 广州 广东 天津 苏州 杭州 无锡 山东 南京 厦门 武汉 成都 深圳 西安 宁波 东莞 沈阳 福州 重庆 温州 长沙 哈尔滨 宿迁 佛山 郑州 嘉兴 廊坊 绍兴 金华 珠海 太原 大连 长春 南昌 南通 合肥 常州 昆明 石家庄&nbsp; <BR>查看详细地图北京市： <BR>运&nbsp;&nbsp;&nbsp; 费：一律收取固定运费 5 元，钻石会员购物金额满50元（含）以上免运费，金牌会员购物金额满 200 元（含）以上免运费，银牌（含）以下级别的会员购物满400 元（含）以上免运费。 <BR>送货范围：北京全境十八区县无缝隙覆盖 <BR>支付形式：现金（五环内、上地、西三旗、回龙观、天通苑、管庄&lt;仅朝阳路沿线&gt;、亦庄、古城地铁沿线&lt;2公里内&gt;、大兴西红门、通州城区同时支持支票和POS机刷卡）&nbsp; <BR>查看详细地图上海市： <BR>运&nbsp;&nbsp;&nbsp; 费：一律收取固定运费 5 元，钻石会员购物金额满50元（含）以上免运费，金牌会员购物金额满 200 元（含）以上免运费，银牌（含）以下级别的会员购物满400 元（含）以上免运费。<BR>送货范围：除横沙岛、长兴岛以外的地区均可送达<BR>支付形式：现金、支票和POS机刷卡&nbsp; <BR>查看详细地图广州市： <BR>运&nbsp;&nbsp;&nbsp; 费：一律收取固定运费 5 元，钻石会员购物金额满50元（含）以上免运费，金牌会员购物金额满 200 元（含）以上免运费，银牌（含）以下级别的会员购物满400 元（含）以上免运费。 <BR>送货范围：广州市区、花都、番禺（不含大学城）。<BR>支付形式：广州市区支持现金、支票和POS机刷卡；花都、番禺（不含大学城）支持现金支付&nbsp; <BR>查看详细地图广东省(除广州市区、深圳、花都、番禺)： <BR>运&nbsp;&nbsp;&nbsp; 费：一律收取固定运费 6 元外加货款 1% 的运输附加费，钻石会员购物金额满100元（含）以上，金牌会员购物金额满 200 元（含）以上，银牌（含）以下级别的会员购物满400 元（含）以上，免固定运费 6 元，不免运输附加费。 <BR>送货范围：广东省除广州市区、花都、番禺（不含大学城）以外的地区。<BR>支付形式：现金&nbsp; <BR>查看详细地图天津市： <BR>运&nbsp;&nbsp;&nbsp; 费：一律收取固定运费 6 元，钻石会员购物金额满100元（含）以上免运费，金牌会员购物金额满 200 元（含）以上免运费，银牌（含）以下级别的会员购物满400 元（含）以上免运费。 <BR>送货范围：和平区、河西区、南开区、河东区、河北区、红桥区、东丽区（外环内）<BR>支付形式：现金和POS机刷卡&nbsp; <BR>查看详细地图苏州市： <BR>运&nbsp;&nbsp;&nbsp; 费：一律收取固定运费 6 元，钻石会员购物金额满100元（含）以上免运费，金牌会员购物金额满 200 元（含）以上免运费，银牌（含）以下级别的会员购物满400 元（含）以上免运费。<BR>送货范围：金阊区、沧浪区、平江区、虎丘区、工业园区、高新区、吴中区（不含东山，西山）、相城区、太仓市区、昆山市（不含巴城、周庄、锦溪、淀山湖）、吴江（市区、经济开发区、同里镇）、常熟市<BR>支付形式：现金和POS机刷卡&nbsp; <BR>查看详细地图杭州市： <BR>运&nbsp;&nbsp;&nbsp; 费：一律收取固定运费 6 元，钻石会员购物金额满100元（含）以上免运费，金牌会员购物金额满 200 元（含）以上免运费，银牌（含）以下级别的会员购物满400 元（含）以上免运费。<BR>送货范围：上城区、下城区、拱墅区、下沙区、西湖区、江干区、滨江区、萧山区、良渚镇、乔司镇全境，临平镇（临平大道以南 许村大道以西配送）、瓶窑镇（西溪街以东 祥彭线以南 城区配送）、余杭镇（15省道以东 G104以南 城区以东全部配送）、闲林镇（闲祝线以东 G320以北 城区以东全部配送）<BR>支付形式：现金和POS机刷卡&nbsp; <BR>查看详细地图无锡市： <BR>运&nbsp;&nbsp;&nbsp; 费：一律收取固定运费 6 元，钻石会员购物金额满100元（含）以上免运费，金牌会员购物金额满 200 元（含）以上免运费，银牌（含）以下级别的会员购物满400 元（含）以上免运费。<BR>送货范围：新区（除鸿声镇外）、锡山区（锡东大道以西、锡港路以南）、崇安区、北塘区、南长区、滨湖区（除马山镇、胡埭镇外） <BR>支付形式：现金和POS机刷卡 。&nbsp; <BR>查看详细地图山东省： <BR>运&nbsp;&nbsp;&nbsp; 费：一律收取固定运费 6 元，钻石会员购物金额满100元（含）以上免运费，金牌会员购物金额满 200 元（含）以上免运费，银牌（含）以下级别的会员购物满400 元（含）以上免运费。<BR>送货范围：青岛市、烟台市、威海市、济南市、泰安市、德州市、东营市、聊城市<BR>支付形式：现金（青岛市南区、市北区、四方区和济南市区二环路以内同时支持POS机刷卡）&nbsp; <BR>查看详细地图南京市： <BR>运&nbsp;&nbsp;&nbsp; 费：一律收取固定运费 6 元，钻石会员购物金额满100元（含）以上免运费，金牌会员购物金额满 200 元（含）以上免运费，银牌（含）以下级别的会员购物满400 元（含）以上免运费。<BR>送货范围：鼓楼区、白下区、玄武区、建邺区、秦淮区、雨花台区、下关区、栖霞区（九乡河以西）、江宁城区（宁杭高速以西，南广学院、东南大学以北）浦口区（宁连高速以内，老山以东）；六合区（大厂）<BR>支付形式：现金和POS机，不支持支票&nbsp; <BR>查看详细地图厦门市： <BR>运&nbsp;&nbsp;&nbsp; 费：一律收取固定运费 6 元，钻石会员购物金额满100元（含）以上免运费，金牌会员购物金额满 200 元（含）以上免运费，银牌（含）以下级别的会员购物满400 元（含）以上免运费。<BR>送货范围：思明区和湖里区 <BR>支付形式：现金和POS机刷卡 。&nbsp; <BR>查看详细地图武汉市： <BR>运&nbsp;&nbsp;&nbsp; 费：一律收取固定运费 6 元，钻石会员购物金额满100元（含）以上免运费，金牌会员购物金额满 200 元（含）以上免运费，银牌（含）以下级别的会员购物满400 元（含）以上免运费。<BR>送货范围：武昌区、江汉区、洪山区 <BR>支付形式：现金和POS机刷卡&nbsp; <BR>查看详细地图成都市： <BR>运&nbsp;&nbsp;&nbsp; 费：一律收取固定运费 5 元，钻石会员购物金额满50元（含）以上免运费，金牌会员购物金额满 200 元（含）以上免运费，银牌（含）以下级别的会员购物满400 元（含）以上免运费。<BR>送货范围：成都市三环以里 <BR>支付形式：现金和POS机&nbsp; <BR>查看详细地图深圳市： <BR>运&nbsp;&nbsp;&nbsp; 费：一律收取固定运费 5 元，钻石会员购物金额满50元（含）以上免运费，金牌会员购物金额满 200 元（含）以上免运费，银牌（含）以下级别的会员购物满400 元（含）以上免运费<BR>送货范围：福田区，罗湖区：洪湖西路—人民北路—人民南路—春风高架—沿河南路—沿河北路—布心路—园圈以内，南山区：侨城东路以西、北环大道以南—月亮湾大道以东—东滨路以北—南水路以北—后海滨路以西—滨海大道以北 <BR>支付形式：现金和POS机&nbsp; <BR>查看详细地图西安市： <BR>运&nbsp;&nbsp;&nbsp; 费：一律收取固定运费 6 元，钻石会员购物金额满100元（含）以上免运费，金牌会员购物金额满 200 元（含）以上免运费，银牌（含）以下级别的会员购物满400 元（含）以上免运费。<BR>送货范围：高新区，碑林区，新城区，莲湖区三环以内，雁塔区长安路以西，雁塔区长安路以东，灞桥区三环以内，未央区三环以内，长安区大学城以内（最远至电子科技大学长安校区）。 <BR>支付形式：现金和POS机&nbsp; <BR>查看详细地图宁波市： <BR>运&nbsp;&nbsp;&nbsp; 费：一律收取固定运费 6 元，钻石会员购物金额满100元（含）以上免运费，金牌会员购物金额满 200 元（含）以上免运费，银牌（含）以下级别的会员购物满400 元（含）以上免运费。<BR>送货范围：海曙区全境，江东区全境，江北区（不含慈城镇），高新科技开发区（不含梅虚街道），鄞州区（雅戈尔大道以东、鄞州大道以北、甬台温高速路以西环线内）<BR>支付形式：现金和POS机，不支持支票&nbsp; <BR>查看详细地图东莞市： <BR>运&nbsp;&nbsp;&nbsp; 费：一律收取固定运费 6 元，钻石会员购物金额满100元（含）以上免运费，金牌会员购物金额满 200 元（含）以上免运费，银牌（含）以下级别的会员购物满400 元（含）以上免运费。<BR>送货范围：莞城和南城<BR>支付形式：现金和POS机刷卡&nbsp; <BR>查看详细地图沈阳市： <BR>运&nbsp;&nbsp;&nbsp; 费：一律收取固定运费 6 元，钻石会员购物金额满100元（含）以上免运费，金牌会员购物金额满 200 元（含）以上免运费，银牌（含）以下级别的会员购物满400 元（含）以上免运费。<BR>送货范围：沈阳市二环以内<BR>支付形式：现金和POS机刷卡&nbsp; <BR>查看详细地图福州市： <BR>运&nbsp;&nbsp;&nbsp; 费：一律收取固定运费 6 元，钻石会员购物金额满100元（含）以上免运费，金牌会员购物金额满 200 元（含）以上免运费，银牌（含）以下级别的会员购物满400 元（含）以上免运费。<BR>送货范围：鼓楼区（二环路内，和福州大学）、晋安区（二环路内）、仓山区（二环路内）、台江区 <BR>支付形式：现金和POS机刷卡 ')
SET IDENTITY_INSERT [dbo].[help2] OFF
SET IDENTITY_INSERT [dbo].[leibie] ON 

INSERT [dbo].[leibie] ([Classid], [Classname]) VALUES (1021, N'手机')
INSERT [dbo].[leibie] ([Classid], [Classname]) VALUES (1022, N'笔记本')
INSERT [dbo].[leibie] ([Classid], [Classname]) VALUES (1023, N'硬件')
INSERT [dbo].[leibie] ([Classid], [Classname]) VALUES (1025, N'数码影音')
SET IDENTITY_INSERT [dbo].[leibie] OFF
SET IDENTITY_INSERT [dbo].[leibiex] ON 

INSERT [dbo].[leibiex] ([Classxid], [Classid], [Classxname]) VALUES (3, 2, N'数码相机')
INSERT [dbo].[leibiex] ([Classxid], [Classid], [Classxname]) VALUES (4, 4, N'家居用品')
INSERT [dbo].[leibiex] ([Classxid], [Classid], [Classxname]) VALUES (9, 5, N'厨房电器 ')
INSERT [dbo].[leibiex] ([Classxid], [Classid], [Classxname]) VALUES (11, 2, N'数码影像')
INSERT [dbo].[leibiex] ([Classxid], [Classid], [Classxname]) VALUES (12, 3, N'笔记本')
INSERT [dbo].[leibiex] ([Classxid], [Classid], [Classxname]) VALUES (20, 2, N'数码配件')
INSERT [dbo].[leibiex] ([Classxid], [Classid], [Classxname]) VALUES (24, 2, N'影音播放')
INSERT [dbo].[leibiex] ([Classxid], [Classid], [Classxname]) VALUES (43, 3, N'核心配件')
INSERT [dbo].[leibiex] ([Classxid], [Classid], [Classxname]) VALUES (44, 3, N'其他附件')
INSERT [dbo].[leibiex] ([Classxid], [Classid], [Classxname]) VALUES (45, 3, N'办公设备')
INSERT [dbo].[leibiex] ([Classxid], [Classid], [Classxname]) VALUES (49, 4, N'服装鞋帽')
INSERT [dbo].[leibiex] ([Classxid], [Classid], [Classxname]) VALUES (50, 4, N'厨房用具')
INSERT [dbo].[leibiex] ([Classxid], [Classid], [Classxname]) VALUES (51, 4, N'钟表首饰')
INSERT [dbo].[leibiex] ([Classxid], [Classid], [Classxname]) VALUES (52, 4, N'礼品箱包')
INSERT [dbo].[leibiex] ([Classxid], [Classid], [Classxname]) VALUES (53, 5, N'生活电器')
INSERT [dbo].[leibiex] ([Classxid], [Classid], [Classxname]) VALUES (55, 5, N'大 家 电')
INSERT [dbo].[leibiex] ([Classxid], [Classid], [Classxname]) VALUES (56, 5, N'个人护理')
INSERT [dbo].[leibiex] ([Classxid], [Classid], [Classxname]) VALUES (57, 5, N'汽车用品')
INSERT [dbo].[leibiex] ([Classxid], [Classid], [Classxname]) VALUES (112, 4, N'运动健康')
INSERT [dbo].[leibiex] ([Classxid], [Classid], [Classxname]) VALUES (121, 3, N'网络产品')
INSERT [dbo].[leibiex] ([Classxid], [Classid], [Classxname]) VALUES (122, 3, N'电脑软件')
INSERT [dbo].[leibiex] ([Classxid], [Classid], [Classxname]) VALUES (123, 3, N'外设产品')
INSERT [dbo].[leibiex] ([Classxid], [Classid], [Classxname]) VALUES (124, 4, N'个护化妆')
INSERT [dbo].[leibiex] ([Classxid], [Classid], [Classxname]) VALUES (125, 4, N'母婴玩具')
INSERT [dbo].[leibiex] ([Classxid], [Classid], [Classxname]) VALUES (126, 12, N'手机品牌')
INSERT [dbo].[leibiex] ([Classxid], [Classid], [Classxname]) VALUES (127, 12, N'手机配件')
INSERT [dbo].[leibiex] ([Classxid], [Classid], [Classxname]) VALUES (129, 3, N'移动存储')
INSERT [dbo].[leibiex] ([Classxid], [Classid], [Classxname]) VALUES (132, 1021, N'华为')
INSERT [dbo].[leibiex] ([Classxid], [Classid], [Classxname]) VALUES (133, 1021, N'小米')
INSERT [dbo].[leibiex] ([Classxid], [Classid], [Classxname]) VALUES (134, 1021, N'OPPO')
INSERT [dbo].[leibiex] ([Classxid], [Classid], [Classxname]) VALUES (135, 1021, N'vivo')
INSERT [dbo].[leibiex] ([Classxid], [Classid], [Classxname]) VALUES (136, 1021, N'iphone')
INSERT [dbo].[leibiex] ([Classxid], [Classid], [Classxname]) VALUES (137, 1021, N'三星')
INSERT [dbo].[leibiex] ([Classxid], [Classid], [Classxname]) VALUES (139, 1022, N'戴尔')
INSERT [dbo].[leibiex] ([Classxid], [Classid], [Classxname]) VALUES (140, 1022, N'联想')
INSERT [dbo].[leibiex] ([Classxid], [Classid], [Classxname]) VALUES (141, 1022, N'华硕')
INSERT [dbo].[leibiex] ([Classxid], [Classid], [Classxname]) VALUES (142, 1022, N'华为')
INSERT [dbo].[leibiex] ([Classxid], [Classid], [Classxname]) VALUES (143, 1022, N'苹果')
INSERT [dbo].[leibiex] ([Classxid], [Classid], [Classxname]) VALUES (144, 1023, N'CPU')
INSERT [dbo].[leibiex] ([Classxid], [Classid], [Classxname]) VALUES (145, 1023, N'显卡')
INSERT [dbo].[leibiex] ([Classxid], [Classid], [Classxname]) VALUES (146, 1023, N'显示器')
INSERT [dbo].[leibiex] ([Classxid], [Classid], [Classxname]) VALUES (147, 1023, N'键鼠')
INSERT [dbo].[leibiex] ([Classxid], [Classid], [Classxname]) VALUES (148, 1023, N'主板')
INSERT [dbo].[leibiex] ([Classxid], [Classid], [Classxname]) VALUES (149, 1025, N'电视')
INSERT [dbo].[leibiex] ([Classxid], [Classid], [Classxname]) VALUES (150, 1025, N'相机')
INSERT [dbo].[leibiex] ([Classxid], [Classid], [Classxname]) VALUES (151, 1025, N'音响')
INSERT [dbo].[leibiex] ([Classxid], [Classid], [Classxname]) VALUES (152, 1025, N'耳机')
INSERT [dbo].[leibiex] ([Classxid], [Classid], [Classxname]) VALUES (153, 1025, N'智能穿戴')
SET IDENTITY_INSERT [dbo].[leibiex] OFF
SET IDENTITY_INSERT [dbo].[orderdetail] ON 

INSERT [dbo].[orderdetail] ([detailid], [pid], [shuliang], [orderid], [producttotail]) VALUES (62, 48, 1, N'20123901043922', CAST(1299.00 AS Decimal(18, 2)))
INSERT [dbo].[orderdetail] ([detailid], [pid], [shuliang], [orderid], [producttotail]) VALUES (63, 40, 1, N'20125805115844', CAST(1530.00 AS Decimal(18, 2)))
INSERT [dbo].[orderdetail] ([detailid], [pid], [shuliang], [orderid], [producttotail]) VALUES (64, 48, 2, N'20125805115844', CAST(2598.00 AS Decimal(18, 2)))
INSERT [dbo].[orderdetail] ([detailid], [pid], [shuliang], [orderid], [producttotail]) VALUES (65, 40, 1, N'20120505120514', CAST(1530.00 AS Decimal(18, 2)))
INSERT [dbo].[orderdetail] ([detailid], [pid], [shuliang], [orderid], [producttotail]) VALUES (66, 48, 2, N'20120505120514', CAST(2598.00 AS Decimal(18, 2)))
INSERT [dbo].[orderdetail] ([detailid], [pid], [shuliang], [orderid], [producttotail]) VALUES (67, 52, 2, N'20224517034507', CAST(12998.00 AS Decimal(18, 2)))
INSERT [dbo].[orderdetail] ([detailid], [pid], [shuliang], [orderid], [producttotail]) VALUES (68, 53, 1, N'20222118022143', CAST(9599.00 AS Decimal(18, 2)))
INSERT [dbo].[orderdetail] ([detailid], [pid], [shuliang], [orderid], [producttotail]) VALUES (69, 65, 1, N'20220118060149', CAST(8999.00 AS Decimal(18, 2)))
INSERT [dbo].[orderdetail] ([detailid], [pid], [shuliang], [orderid], [producttotail]) VALUES (70, 75, 1, N'20220118060149', CAST(1099.00 AS Decimal(18, 2)))
INSERT [dbo].[orderdetail] ([detailid], [pid], [shuliang], [orderid], [producttotail]) VALUES (71, 58, 1, N'20220519030510', CAST(3099.00 AS Decimal(18, 2)))
INSERT [dbo].[orderdetail] ([detailid], [pid], [shuliang], [orderid], [producttotail]) VALUES (72, 74, 1, N'20220519030510', CAST(1649.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[orderdetail] OFF
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([oid], [orderid], [username], [userid], [shouhuoname], [address], [postcode], [telephone], [songhuofs], [fukuanfs], [dingdanfeel], [dingdanshijian], [dingdantotal], [beizhu], [djifen]) VALUES (60, N'20224517034507', N'1104217060', 16, N'杨浩鑫', N'吉林省长春市宽城区华大', N'131208', N'15326385201', N'邮件特快专递(15元)', N'货到付款', 3, CAST(N'2022-05-17T15:45:07.000' AS DateTime), CAST(13013.00 AS Decimal(18, 2)), N'无', 60)
INSERT [dbo].[orders] ([oid], [orderid], [username], [userid], [shouhuoname], [address], [postcode], [telephone], [songhuofs], [fukuanfs], [dingdanfeel], [dingdanshijian], [dingdantotal], [beizhu], [djifen]) VALUES (61, N'20222118022143', N'2607724910', 1017, N'杨镇赫', N'河南省南阳市卧龙区卧龙路66号', N'473000', N'+8615776556799', N'普通快递送货上门(10元)', N'在线支付', 1, CAST(N'2022-05-18T14:21:43.000' AS DateTime), CAST(9609.00 AS Decimal(18, 2)), N'没钱', 30)
INSERT [dbo].[orders] ([oid], [orderid], [username], [userid], [shouhuoname], [address], [postcode], [telephone], [songhuofs], [fukuanfs], [dingdanfeel], [dingdanshijian], [dingdantotal], [beizhu], [djifen]) VALUES (62, N'20220118060149', N'2607724910', 1017, N'杨镇赫', N'辽宁省阜新市海州区西山街道', N'210900', N'+8615776556799', N'邮件特快专递(15元)', N'货到付款', 0, CAST(N'2022-05-18T18:01:49.327' AS DateTime), CAST(10113.00 AS Decimal(18, 2)), N'快点送，急用！！！', 169)
INSERT [dbo].[orders] ([oid], [orderid], [username], [userid], [shouhuoname], [address], [postcode], [telephone], [songhuofs], [fukuanfs], [dingdanfeel], [dingdanshijian], [dingdantotal], [beizhu], [djifen]) VALUES (63, N'20220519030510', N'1104217060', 16, N'杨镇赫', N'黑龙江省大庆市龙凤区启智公寓', N'163000', N'15776556799', N'邮件特快专递(15元)', N'在线支付', 0, CAST(N'2022-05-19T15:05:10.473' AS DateTime), CAST(4763.00 AS Decimal(18, 2)), N'急需，尽快！', 204)
SET IDENTITY_INSERT [dbo].[orders] OFF
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (1, 3, 12, N'联想 450', NULL, N'联想', N'pic/20100119020119.gif', CAST(80.52 AS Decimal(10, 2)), CAST(53.32 AS Decimal(10, 2)), 1, N'联想 450', N'联想', CAST(N'2009-05-02T21:11:06.000' AS DateTime), 40, NULL, 19, 50, N'无')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (2, 3, 12, N'三星R428', NULL, N'三星R428', N'pic/20101122121108.gif', CAST(44.00 AS Decimal(10, 2)), CAST(55.23 AS Decimal(10, 2)), 1, N'三星R428', N'三星R428', CAST(N'2009-05-02T22:11:06.000' AS DateTime), 15, NULL, 5, 50, N'无')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (3, 3, 12, N'联想Y450', NULL, N'联想Y450', N'pic/20101122121149.gif', CAST(45.00 AS Decimal(10, 2)), CAST(56.00 AS Decimal(10, 2)), 1, N'联想Y450', N'联想Y450', CAST(N'2009-05-02T23:11:06.000' AS DateTime), 46, NULL, 16, 50, N'无')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (4, 3, 12, N'ThinkPad-X100e-3508(4EC)黑色,笔记本电脑', NULL, N'联想', N'pic/20104326084355.gif', CAST(5400.00 AS Decimal(10, 2)), CAST(4500.00 AS Decimal(10, 2)), 1, N'联想460', N'thinkPad-X100e-3508', CAST(N'2009-05-03T21:11:06.000' AS DateTime), 25, NULL, 29, 50, N'键盘保护贴+四合一清洁套装')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (5, 3, 43, N'AMD 240', N'23232', N'AMD 240', N'../pic/20101222121238.gif', CAST(110.00 AS Decimal(10, 2)), CAST(90.12 AS Decimal(10, 2)), 1, N'AMD 240', N'AMD 240', NULL, 73, NULL, NULL, 50, N'无')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (6, 3, 44, N'INTEL  I3530', N'', N'INTEL  I3530', N'../pic/20101222121254.gif', CAST(114.26 AS Decimal(10, 2)), CAST(100.35 AS Decimal(10, 2)), 0, N'INTEL  I3530', N'INTEL  I3530', NULL, 12, NULL, NULL, 50, N'无')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (8, 3, 43, N'华硕mb_asus_p5kl', NULL, N'华硕', N'pic/20101322121307.gif', CAST(114.36 AS Decimal(10, 2)), CAST(112.45 AS Decimal(10, 2)), 1, N'mb_asus_p5kl', N'mb_asus_p5kl', CAST(N'2009-05-08T23:11:06.000' AS DateTime), 22, NULL, 19, 50, N'无')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (10, 3, 43, N'金士顿DDR3 1333 2G ', NULL, N'DDR3 1333 2G ', N'pic/20102521012506.gif', CAST(210.00 AS Decimal(10, 2)), CAST(196.01 AS Decimal(10, 2)), 1, N'DDR3 1333 2G ', N'DDR3 1333 2G ', CAST(N'2009-05-01T23:11:06.000' AS DateTime), 56, NULL, 4, 50, N'无')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (11, 3, 43, N'华硕p7p55', NULL, N'华硕', N'pic/20101322121340.gif', CAST(240.00 AS Decimal(10, 2)), CAST(253.44 AS Decimal(10, 2)), 3, N'mb_asus_p7p55', N'mb_asus_p7p55', CAST(N'2009-05-12T23:11:06.000' AS DateTime), 0, NULL, 17, 50, N'无')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (14, 3, 43, N'影驰 GT240中将版 ', NULL, N'影驰 ', N'pic/20101422121400.gif', CAST(51.02 AS Decimal(10, 2)), CAST(45.03 AS Decimal(10, 2)), 1, N'GT240', N'GT240', CAST(N'2009-05-09T23:11:06.000' AS DateTime), 7, NULL, 2, 50, N'无')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (15, 3, 43, N'影驰 GTX260+ ', NULL, N'影驰', N'pic/20101522121503.gif', CAST(45.12 AS Decimal(10, 2)), CAST(30.14 AS Decimal(10, 2)), 1, N'GTX260+ ', N'GTX260+ ', CAST(N'2009-05-10T23:11:06.000' AS DateTime), 6, NULL, 65, 50, N'无')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (21, 3, 43, N'西数 500G绿盘 ', NULL, N'西数 500G绿盘 ', N'pic/20102220082204.gif', CAST(340.00 AS Decimal(10, 2)), CAST(335.00 AS Decimal(10, 2)), 3, N'500G绿盘 ', N'500G绿盘 ', CAST(N'2009-05-16T23:11:06.000' AS DateTime), 9, NULL, 23, 50, N'无')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (22, 3, 43, N'AOC 2430', NULL, N'AOC 2430', N'pic/20102022122031.gif', CAST(10.00 AS Decimal(10, 2)), CAST(43.00 AS Decimal(10, 2)), 1, N'AOC 2430', N'AOC 2430', CAST(N'2009-05-02T23:12:06.000' AS DateTime), 15, NULL, 4, 50, N'无')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (23, 3, 43, N'希捷 12代500G单碟 ', NULL, N'希捷 12代500G单碟 ', N'pic/20101522121530.gif', CAST(10.00 AS Decimal(10, 2)), CAST(4.00 AS Decimal(10, 2)), 3, N'12代500G单碟 ', N'12代500G单碟 ', CAST(N'2009-05-02T23:13:06.000' AS DateTime), 30, NULL, 7, 50, N'无')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (24, 12, 126, N'诺基亚 5233', NULL, N'诺基亚', N'pic/20102022122002.gif', CAST(10.00 AS Decimal(10, 2)), CAST(4.00 AS Decimal(10, 2)), 3, N'5233', N'5233', CAST(N'2009-05-02T23:14:06.000' AS DateTime), 45, NULL, 12, 50, N'无')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (25, 3, 43, N'LG W1942', NULL, N'LG W1942', N'pic/20101922121944.gif', CAST(10.00 AS Decimal(10, 2)), CAST(4.00 AS Decimal(10, 2)), 3, N'LG W1942', N'LG W1942', CAST(N'2009-05-02T23:18:06.000' AS DateTime), 7, NULL, 2, 50, N'无')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (26, 3, 43, N'金士顿 DDR2 800 2G ', NULL, N'DDR2 800 2G ', N'pic/20101622121601.gif', CAST(380.00 AS Decimal(10, 2)), CAST(340.00 AS Decimal(10, 2)), 3, N'DDR2 800 2G ', N'DDR2 800 2G ', CAST(N'2009-05-02T23:19:06.000' AS DateTime), 1, NULL, 8, 50, N'无')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (27, 3, 43, N'三星 943NW+ ', NULL, N'三星 ', N'pic/20101922121914.gif', CAST(45.00 AS Decimal(10, 2)), CAST(42.00 AS Decimal(10, 2)), 3, N'943NW+ ', N' 943NW+ ', CAST(N'2009-05-02T23:25:06.000' AS DateTime), 36, NULL, 8, 50, N'无')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (32, 3, 12, N'Thinkpad SL410k（2874-7HC）14.0英寸笔记本电脑 ', NULL, N'联想', N'pic/20103719013718.gif', CAST(5000.00 AS Decimal(10, 2)), CAST(4950.00 AS Decimal(10, 2)), 3, N'T4400 2G 250G ', N'Thinkpad SL410k', CAST(N'2010-05-19T13:38:00.060' AS DateTime), 50, 0, 104, 50, N'无')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (33, 2, 3, N'佳能摄像机3000', NULL, N'佳能', N'pic/20103524033519.gif', CAST(650.00 AS Decimal(10, 2)), CAST(620.00 AS Decimal(10, 2)), 1, N'3000', N'佳能摄像机30000', CAST(N'2010-05-24T15:36:16.390' AS DateTime), 20, 0, 12, 50, N'无')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (34, 2, 3, N'佳能摄像机355', NULL, N'佳能', N'pic/20104024034023.gif', CAST(650.00 AS Decimal(10, 2)), CAST(620.00 AS Decimal(10, 2)), 1, N'355', N'佳能摄像机355', CAST(N'2010-05-24T15:40:52.123' AS DateTime), 19, 0, 4, 50, N'无')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (35, 2, 3, N'佳能摄像机345', NULL, N'佳能', N'pic/20104124034128.gif', CAST(780.00 AS Decimal(10, 2)), CAST(750.00 AS Decimal(10, 2)), 1, N'345', N'佳能摄像机345', CAST(N'2010-05-24T15:41:36.750' AS DateTime), 20, 0, 5, 50, N'无')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (36, 2, 3, N'佳能摄像机e500', NULL, N'佳能', N'pic/20104824034807.gif', CAST(2500.00 AS Decimal(10, 2)), CAST(2300.00 AS Decimal(10, 2)), 1, N'e500', N'佳能摄像机e500', CAST(N'2010-05-24T15:48:24.280' AS DateTime), 20, 0, 10, 50, N'无')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (37, 2, 11, N'三星摄像机', NULL, N'三星', N'pic/20105624035608.gif', CAST(2500.00 AS Decimal(10, 2)), CAST(2300.00 AS Decimal(10, 2)), 1, N'88', N'三星摄像机', CAST(N'2010-05-24T15:50:02.983' AS DateTime), 20, 0, 12, 50, N'无')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (38, 3, 12, N'华硕上网本 2299元', NULL, N'华硕', N'pic/20101924041955.gif', CAST(2860.00 AS Decimal(10, 2)), CAST(2299.00 AS Decimal(10, 2)), 1, N'2299', N'华硕上网本2299元', CAST(N'2010-05-24T16:20:28.200' AS DateTime), 50, 0, 11, 50, N'无')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (39, 2, 24, N'富士相机', NULL, N'富士', N'pic/20102424042403.gif', CAST(1600.00 AS Decimal(10, 2)), CAST(1499.00 AS Decimal(10, 2)), 3, N'富士相机F75', N'富士相机', CAST(N'2010-05-24T16:24:40.670' AS DateTime), 20, 0, 21, 50, N'无')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (40, 12, 126, N'诺基亚3806', NULL, N'诺基亚', N'pic/20105725085706.gif', CAST(1560.00 AS Decimal(10, 2)), CAST(1530.00 AS Decimal(10, 2)), 3, N'3806', N'诺基亚3806', CAST(N'2010-05-25T20:58:06.437' AS DateTime), 20, 0, 3, 20, N'手机电池，一个可爱的公仔')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (41, 12, 126, N'索爱的某某型号', NULL, N'索爱', N'pic/20100125090100.gif', CAST(1320.00 AS Decimal(10, 2)), CAST(1320.00 AS Decimal(10, 2)), 1, N'33', N'索爱的某某型号', CAST(N'2010-05-25T21:01:42.263' AS DateTime), 10, 0, 1, 20, N'无')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (42, 12, 126, N'索爱的某某型号', NULL, N'索爱', N'pic/20100125090158.gif', CAST(1320.00 AS Decimal(10, 2)), CAST(1320.00 AS Decimal(10, 2)), 1, N'36', N'索爱的某某型号', CAST(N'2010-05-25T21:02:13.500' AS DateTime), 12, 0, 0, 20, N'无')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (43, 12, 126, N'索爱的某某型号', NULL, N'索爱', N'pic/20100225090230.gif', CAST(1320.00 AS Decimal(10, 2)), CAST(1320.00 AS Decimal(10, 2)), 1, N'36', N'索爱的某某型号', CAST(N'2010-05-25T21:02:35.950' AS DateTime), 12, 0, 1, 20, N'无')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (44, 12, 126, N'索爱的某某型号', NULL, N'索爱', N'pic/20100425090406.gif', CAST(1320.00 AS Decimal(10, 2)), CAST(1320.00 AS Decimal(10, 2)), 1, N'36', N'索爱的某某型号', CAST(N'2010-05-25T21:04:08.903' AS DateTime), 12, 0, 1, 20, N'无')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (45, 12, 126, N'诺基亚的某某型号', NULL, N'诺基亚', N'pic/20100425090417.gif', CAST(1320.00 AS Decimal(10, 2)), CAST(1320.00 AS Decimal(10, 2)), 1, N'36', N'诺基亚的某某型号', CAST(N'2010-05-25T21:04:49.687' AS DateTime), 12, 0, 1, 20, N'无')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (46, 2, 3, N'超级无敌摄像机', NULL, N'3DWORD', N'pic/20100725090727.gif', CAST(6500.00 AS Decimal(10, 2)), CAST(6000.00 AS Decimal(10, 2)), 1, N'3DWORD', N'超级无敌摄像机', CAST(N'2010-05-25T21:08:02.607' AS DateTime), 2, 0, 2, 20, N'无')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (47, 2, 3, N'柯达Z981数码相机(含发票)＋3寸保护贴+4合1清洁套装+4GB ', NULL, N'柯达', N'pic/20101125111133.gif', CAST(2500.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)), 3, N'Z981', N'柯达Z981数码', CAST(N'2010-05-25T23:12:10.140' AS DateTime), 9, 0, 9, 20, N'3寸保护贴+4合1清洁套装+4GB ')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (48, 2, 3, N'纽曼导航王GPS-Q90增强版+雷达L101（测移动电子狗，拒绝罚单)', NULL, N'纽曼导航', N'pic/20102225112202.gif', CAST(1399.00 AS Decimal(10, 2)), CAST(1299.00 AS Decimal(10, 2)), 1, N'GPS-Q90', N'GPS-Q90', CAST(N'2010-05-25T23:22:47.233' AS DateTime), 10, 0, 9, 20, N'20元绿森电子优惠券')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (50, 4, 4, N'2', N'2', N'2', N'pic\914d642c-3f50-4d27-8c61-f1de61de5572.jpg', CAST(2.00 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)), 0, N'2', N'2', NULL, 2, NULL, NULL, 2, N'2')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (51, 12, 126, N'华为p40', N'无', N'华为', N'pic\b4e93a94-52f8-4e11-bcc4-e85cebc338f6.jpg', CAST(3999.00 AS Decimal(10, 2)), CAST(3699.00 AS Decimal(10, 2)), 0, N'华为', N'华为p系列', NULL, 50, NULL, NULL, 30, N'蓝牙耳机')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (52, 1021, 132, N'华为Mate40pro', N'麒麟9000芯片，体验震撼，超感知徕卡电影影响，硬件实时视频HDR.', N'华为Mate', N'pic\40c23286-0e35-4c38-984b-51657917317c.png', CAST(6799.00 AS Decimal(10, 2)), CAST(6499.00 AS Decimal(10, 2)), 0, N'华为Mate40pro', N'华为', NULL, 50, NULL, NULL, 30, N'蓝牙耳机')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (53, 1021, 132, N'华为Mate Xs2', N'独领一面|超清薄|超平整|超可靠', N'华为', N'pic\0c778725-a5aa-4ee5-98af-21cf9efc794e.jpg', CAST(9999.00 AS Decimal(10, 2)), CAST(9599.00 AS Decimal(10, 2)), 3, N'华为Mate Xs2', N'华为', NULL, 100, NULL, NULL, 30, N'华为自拍杆')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (54, 1021, 133, N'小米12pro', N'全新一代 骁龙8 移动平台｜2K AMOLED 屏幕｜5000万超清三主摄 | CyberFocus 万物追焦｜全焦段夜景｜120W 澎湃秒充', N'小米', N'pic\64ba0da0-b3af-4776-9b8e-7852007c4919.jpg', CAST(5399.00 AS Decimal(10, 2)), CAST(5099.00 AS Decimal(10, 2)), 0, N'205g', N'小米', NULL, 80, NULL, NULL, 20, N'小米耳机')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (55, 1021, 132, N'小米civi 1s', N'动人新色 | 奇迹阳光
原生美肌人像2.0 | 4D光追焕颜美妆技术
3200万高清质感自拍 | 升级人眼追焦
6400万AI三摄 | 大光圈主角镜头
6.55" 3D曲面OLED柔性屏 | 120Hz + Dolby Vision
高通骁龙778G Plus | 36个月抗老化认证
4500mAh | 55W有线闪充
立体声双扬声器 | Dolby Atmos
多功能NFC', N'小米civi', N'pic\614ef417-c274-43ab-b3e9-a10c539a728b.jpg', CAST(2899.00 AS Decimal(10, 2)), CAST(2599.00 AS Decimal(10, 2)), 0, N'166g', N'小米', NULL, 70, NULL, NULL, 25, N'小米自拍杆')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (56, 1021, 137, N' Galaxy S22 | S22+', N'生活因Samsung Galaxy而精彩', N' Galaxy S22 | S22+', N'pic\7eb87bb3-ce44-4e6c-aa02-7072aec44a6e.png', CAST(4999.00 AS Decimal(10, 2)), CAST(4599.00 AS Decimal(10, 2)), 3, N'167g', N'Galaxy', NULL, 90, NULL, NULL, 35, N'三星耳机')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (57, 1021, 136, N'AppleiPhone 12 Pro Max', N'超视网膜XDR全面屏       iPhone12 Pro Max 后置三颗摄像头：
超广角、广角、长焦。
运行速度：6+256G的高配置，系统运行稳定性超乎你想象。
配置3687毫安锂电池', N'iphone 12 Pro Max', N'pic\482f65ce-f1b2-4733-869a-5a78ac693e41.jpg', CAST(9299.00 AS Decimal(10, 2)), CAST(9099.00 AS Decimal(10, 2)), 0, N' 420g', N'iphone', NULL, 75, NULL, NULL, 60, N'原机充电器')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (58, 1021, 137, N'Galaxy A53 5G', N'Samsung Galaxy 智能产品互联互通展现科技实力，令您对Samsung Galaxy产品体验更充分。', N'Galaxy A53 5G', N'pic\71037238-e5f3-4fc4-86c4-90b6b9a9bea5.png', CAST(3299.00 AS Decimal(10, 2)), CAST(3099.00 AS Decimal(10, 2)), 1, N'189g ', N'Galaxy', NULL, 70, NULL, NULL, 35, N'三星耳机')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (59, 1021, 136, N'Apple iPhone13', N'超亮眼XDR显示屏，超耐用设计;双摄系统，拍出视频大片超轻松：搭载超高速芯片；超劲续航大提升 ，充满一次电，视频播放最长可达19小时', N'Apple iPhone 13', N'../pic\d540a4c2-7325-4c3f-a732-aa93f01d6eb0.jpg', CAST(6799.00 AS Decimal(10, 2)), CAST(6599.00 AS Decimal(10, 2)), 0, N'320.00g', N'iphone', NULL, 40, NULL, NULL, 60, N'原机充电器')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (60, 1021, 134, N'OPPO Find N', N'OPPO Find N 全新折叠旗舰 8G+256G 星夜 官方标配
【OPPO官方商城 | 现货48小时内发货】
四年六代匠心之作-OPPO Find N 全新折叠旗舰，从尝鲜，到常用，探索新形态、新技术、新体验，尝试解答N的下一种「新可能」。', N'OPPO Find N', N'../pic\352d6cf6-3466-444e-a831-59b9b8be4b0f.png', CAST(7699.00 AS Decimal(10, 2)), CAST(7399.00 AS Decimal(10, 2)), 0, N'275g', N'OPPO', NULL, 60, NULL, NULL, 35, N'无')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (61, 1021, 135, N'vivo X Fold', N'CPU型号：骁龙8 Gen 1
运行内存：12GB
后摄主摄像素：5000万像素
前摄主摄像素：1600万像素
分辨率：全高清FHD+
机身内存：256GB', N'vivo X Fold', N'pic\6eccf263-f047-4480-86b6-a621f94f7d52.jpg', CAST(8999.00 AS Decimal(10, 2)), CAST(8666.00 AS Decimal(10, 2)), 0, N' 1.31kg', N'vivo', NULL, 20, NULL, NULL, 35, N'无')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (62, 1021, 134, N'oppo Find X5 Pro', N'一体化陶瓷机身包裹强劲性能；
自研影像专用 NPU 芯片成就芯算摄影，光影细节收放自如；
悬浮防抖，确保拍摄一击即中；
OPPO | 哈苏 手机影像系统，掌控照片自然色彩。', N'OPPOFind X5 Pro', N'pic\dde77526-cdab-45c8-9b19-c468bcf8e32f.png', CAST(6299.00 AS Decimal(10, 2)), CAST(5999.00 AS Decimal(10, 2)), 0, N'218g', N'OPPO', NULL, 40, NULL, NULL, 30, N'无')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (63, 1022, 139, N'Inspiron 灵越 14 笔记本', N'全新灵越Pro系列，升级12代酷睿处理器，可选3K护眼高清大屏！', N'戴尔', N'pic\15ef2e03-77de-4c97-b528-2744106f5485.png', CAST(5189.98 AS Decimal(10, 2)), CAST(4689.98 AS Decimal(10, 2)), 1, N'第12代智能英特尔 酷睿 i5-1240P 处理器 ', N'华为笔记本', NULL, 40, NULL, NULL, 60, N'电脑包')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (64, 1022, 139, N'MateBook D 14 2022款', N'14英寸 11代酷睿 i5 16G+512G 锐炬显卡 轻薄本/护眼全面屏 银
系统：Windows 11
度：15.1-18.0mm
内存容量：16GB
处理器：intel i5
屏幕刷新率：60Hz
屏幕尺寸：14.0-14.9英寸
特性：指纹识别，大内存
 高色域护眼防眩光屏

 56wh大容量电池', N'华为', N'pic\1dd4881d-a2f3-4358-92e0-da458022f3bc.jpg', CAST(5699.00 AS Decimal(10, 2)), CAST(5099.00 AS Decimal(10, 2)), 1, N'2.16kg', N'华为笔记本', NULL, 40, NULL, NULL, 60, N'电脑包')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (65, 1022, 139, N'DELL ALIENWARE X14', N'处理器
英特尔 酷睿 i5 12500H (12-核/16-线程, 18MB L3 缓存, 最高睿频 4.5GHz Max Turbo Frequency)
操作系统选项
(Dell Technologies 推荐使用商用 Windows 11 专业版)
Windows 11 家庭版, 单语言版 简体中文
显卡
NVIDIA GeForce RTX 3050 4GB GDDR6
显示屏选项
14.0" FHD (1920 x 1080) 144Hz 3ms 含 ComfortView Plus, NVIDIA G-SYNC 和 Advanced Optimus
 内存 
16GB 双通道 LP-DDR5 4800MHz
硬盘选项
512GB PCIe NVMe M.2 固态硬盘', N'戴尔', N'pic\c9d9518d-50ce-449f-a238-1487eb87651a.jpg', CAST(11999.00 AS Decimal(10, 2)), CAST(8999.00 AS Decimal(10, 2)), 3, N'英特尔 酷睿 i5 12500H', N'戴尔笔记本', NULL, 70, NULL, NULL, 60, N'电脑包、散热扇')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (66, 1022, 139, N'HUWI 国行2022款英特尔+酷睿i7', N'顶配版酷睿i7 10代全能本+窄边屏+背光+指纹锁 16G运行+1024G超速硬盘
屏幕尺寸：15.0-15.9英寸
厚度：15.1-18.0mm
 特性：背光键盘，指纹识别，全面屏
轻薄机身，全尺寸大键盘，6秒开机速度，前置高清摄像头', N'华为', N'pic\f1a61fc6-811b-49d6-b760-ec6681f30c14.jpg', CAST(4288.00 AS Decimal(10, 2)), CAST(4088.00 AS Decimal(10, 2)), 1, N'3.0kg', N'华为笔记本', NULL, 40, NULL, NULL, 25, N'鼠标垫')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (67, 1022, 141, N'华硕 无畏Pro15', N'处理器
CPU规格	AMD Ryzen 7 5800H
主频	3.2 GHz，睿频最高支持可达 4.45GHz
缓存	16M 高速缓存
线程	8核16线程
显卡
显卡规格	NVIDIA GeForce RTX 3050
内存
内存容量	16GB（板载）
内存类型	DDR4 3200MHz
最大支持容量	系统内存最高支持16GB', N'华硕', N'pic\200b7875-d6f5-40aa-9375-a83312282daa.jpg', CAST(5999.00 AS Decimal(10, 2)), CAST(5099.00 AS Decimal(10, 2)), 1, N'AMD Ryzen 7 5800H', N'华硕', NULL, 70, NULL, NULL, 35, N'无')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (68, 1022, 140, N'联想笔记本电脑小新Pro16 ', N'16英寸游戏轻薄本(6核标压R5-5600H 16G 512G GTX1650 2.5K 120Hz)高性能商务办公
特性：全面屏，大内存
 75Wh大容量电池
人脸识别系统
硬件低蓝光护眼', N'联想', N'pic\00cdd590-c12b-4632-a685-9979b0b32d6a.jpg', CAST(5499.00 AS Decimal(10, 2)), CAST(5099.00 AS Decimal(10, 2)), 1, N'3.03kg', N'联想', NULL, 40, NULL, NULL, 35, N'无')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (69, 1022, 141, N'华硕 灵耀X纵横', N'处理器
CPU规格	第11代智能英特尔 酷睿 i7 处理器
主频	2.8GHz，睿频最高支持可达 4.8GHz
缓存	12M 高速缓存
线程	四核八线程
显卡
显卡规格	Intel Iris Xe Graphics
内存
内存容量	16GB（板载）
内存类型	LPDDR4x 4266MHz
最大支持容量	板载内存不可升级
', N'华硕', N'pic\2a2a0c83-af6c-46b8-817c-f1f15ba28a1b.jpg', CAST(6999.00 AS Decimal(10, 2)), CAST(5999.00 AS Decimal(10, 2)), 1, N'第11代智能英特尔 酷睿 i7 处理器', N'华硕', NULL, 30, NULL, NULL, 35, N'无')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (70, 1022, 140, N'联想 P17', N'17.3英寸设计师3D渲染图形工作站 I9 -11950H 升级64G 1T+2T固态 A3000 6G 独显 4K屏', N'联想', N'pic\0f04faf8-47d9-474f-a69e-cd8a56e09a39.jpg', CAST(3999.00 AS Decimal(10, 2)), CAST(3999.00 AS Decimal(10, 2)), 1, N' 5.0kg', N'联想', NULL, 40, NULL, NULL, 20, N'无')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (71, 1022, 143, N'MacBook Air', N'Apple M1 芯片
8 核中央处理器，具有 4 个性能核心
和 4 个能效核心
7 核图形处理器
16 核神经网络引擎', N'iphone', N'pic\20dc8ec4-d76d-4798-a2a9-351ff8c405ab.png', CAST(7999.00 AS Decimal(10, 2)), CAST(7699.00 AS Decimal(10, 2)), 1, N'Apple M1 芯片', N'iphone', NULL, 40, NULL, NULL, 60, N'无')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (72, 1023, 145, N'英特尔 i7 10700/10700K/KF', N'英特尔 i7 10700/10700K/KF 11700K/i711700K盒装处理器CPU主板套装 D4 3000 8G单条*2丨240水冷散热器 i7 11700KF 3.6GHz 8核16线程', N'英特尔', N'pic\adec9c7e-2605-4c05-bcf5-260a8539967a.png', CAST(3049.00 AS Decimal(10, 2)), CAST(3019.00 AS Decimal(10, 2)), 0, N'8核16线程', N' i7 10700/10700K/KF', NULL, 12, NULL, NULL, 30, N'电源')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (73, 1023, 145, N'七彩虹iGame GeForce RTX 3080 Ti Vulcan OC', N'显存规格
显存频率	19000MHz
显存类型	GDDR6X
显存容量	12GB
显存位宽	384bit
最大分辨率	7680×4320
显卡接口
接口类型	PCI Express 4.0 16X
I/O接口	1×HDMI接口，3×DisplayPort接口
电源接口	8pin+8pin+8pin', N'七彩虹', N'pic\f6a48de9-7c9f-4eb4-851a-b03d58007f14.png', CAST(13999.00 AS Decimal(10, 2)), CAST(12999.00 AS Decimal(10, 2)), 0, N'芯片厂商	NVIDIA 显卡芯片	GeForce RTX 3080Ti 显示芯片系列	NVIDIA ', N'GeForce RTX 3080 Ti ', NULL, 23, NULL, NULL, 139, N'鼠标')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (74, 1025, 152, N'HUAWEI FreeBuds Lipstick', N'高解析音质 | “空气感”舒适佩戴1 | 半开放主动降噪 2.0
引领潮流的“口红”外观设计，配合智慧聆听体验，
将情调与音调完美融合，带来视觉和听觉双重享受，
为你妆点好音乐。', N'华为', N'pic\a7fd79ce-13d4-4e3b-a194-01844cad4627.png', CAST(1699.00 AS Decimal(10, 2)), CAST(1649.00 AS Decimal(10, 2)), 3, N'耳机 高度：41.4 mm  宽度：16.8 mm  深度：18.5 mm  重量：约 4.1 克 ', N'华为口红耳机', NULL, 124, NULL, NULL, 169, N'耳机保护套')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (75, 1025, 152, N'HUAWEI FreeBuds Studio 无线头戴耳机', N'智慧动态降噪 | 宽频高解析音质 | 全场景智慧交互
每个场景，都有适合它的安静。', N'华为', N'pic\24657f60-56b3-4cf1-933c-0c38f755754c.png', CAST(1399.00 AS Decimal(10, 2)), CAST(1099.00 AS Decimal(10, 2)), 3, N'长度 194 mm  宽度 152 mm  厚度 81.5 mm', N'华为', NULL, 5, NULL, NULL, 109, N'华为自拍杆')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (76, 1025, 149, N'华为智慧屏 V Pro', N'鸿鹄 SuperMiniLED 计算画质1

SuperMiniLED 忠实还原电影原彩，
计算画质重塑经典。

HUAWEI SOUND? 计算音频2

帝瓦雷联合设计，AI 声道扩展，
2.0 声道变 3.1.2 声道3，音随画动。

双 Vivid 音画认证

HDR Vivid 让所见即所得，
Audio Vivid 畅享声临其境。

HarmonyOS 超级娱乐

2400 万 AI 慧眼4

高达 12 方多方畅连，
AI 健身即专业又乐趣无穷。

专业游戏增强模式', N'华为', N'pic\3ed169fd-5906-4d5e-8770-e7d09123bed5.png', CAST(9999.00 AS Decimal(10, 2)), CAST(9899.00 AS Decimal(10, 2)), 0, N'屏幕尺寸65英寸 分辨率超高清4K（3840×2160 像素） 屏幕色彩10.7亿色 屏幕类型LCD', N'华为智慧屏', NULL, 14, NULL, NULL, 999, N'华为智慧屏尊享礼盒（华为路由器WS5200四核版+欧瑞博智能插座S30c）')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (77, 1023, 146, N'HUAWEI MateView', N'【无线投屏版】HUAWEI MateView 28.2英寸 原色显示器 4K+ 超高清分辨率 电影级色域 94%高屏占比 3:2 屏幕比例 支持华为手机一碰投屏 65W Type-C反向充电', N'华为', N'pic\baedc76a-6f60-432f-8eed-8a79aa357c85.png', CAST(2999.00 AS Decimal(10, 2)), CAST(2949.00 AS Decimal(10, 2)), 0, N'屏幕尺寸 28.2 英寸  色准 ΔE<2  *色准为 DCI-P3 色域下的批量平均色准值，sRG', N'无线*原彩显示器', NULL, 29, NULL, NULL, 29, N'智能水杯')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (78, 1023, 146, N' Studio Display', N'27 英寸 5K 视网膜显示屏、自带人物居中功能的 1200 万像素超广角摄像头、录音棚级麦克风，以及支持空间音频功能的六扬声器系统。', N'Apple', N'pic\a295cc69-1aec-4301-9d5f-1ea2a7880810.png', CAST(11499.00 AS Decimal(10, 2)), CAST(10499.00 AS Decimal(10, 2)), 0, N' 5K 视网膜显示屏  27 英寸 (对角线) 5K 视网膜显示屏 5120 x 2880 分辨率，', N'苹果显示器', NULL, 45, NULL, NULL, 114, N'电源线')
INSERT [dbo].[product] ([pid], [classid], [classxid], [productname], [productintroduce], [productchu], [productimage], [masterprice], [hotprice], [newproduct], [guige], [productguanjian], [adddate], [pkc], [sl], [hittimes], [jifen], [zenpin]) VALUES (79, 1025, 153, N'HUAWEI WATCH GT 3 Pro 陶瓷', N'微晶陶瓷｜心电分析1｜强劲续航｜高尔夫地图
第一眼 就耀眼
淬炼细节之美
两款经典 永不过时', N'华为', N'pic\8859b979-c2b1-4cd7-aefc-942c897e5711.png', CAST(2488.00 AS Decimal(10, 2)), CAST(2438.00 AS Decimal(10, 2)), 3, N'尺寸 42.9 mm × 42.9 mm × 10.5 mm  *实际尺寸依配置、制造工艺、测量方法', N'华为智能手表', NULL, 36, NULL, NULL, 24, N'智能水杯')
SET IDENTITY_INSERT [dbo].[product] OFF
SET IDENTITY_INSERT [dbo].[productliuyan] ON 

INSERT [dbo].[productliuyan] ([lid], [pid], [liuname], [liutime], [liuzhu], [liuhui], [huifutime]) VALUES (65, NULL, NULL, CAST(N'2022-05-17T15:47:58.000' AS DateTime), N'好评！', N'是的', NULL)
INSERT [dbo].[productliuyan] ([lid], [pid], [liuname], [liutime], [liuzhu], [liuhui], [huifutime]) VALUES (66, NULL, NULL, CAST(N'2022-05-17T20:05:58.000' AS DateTime), N'非常好！', N'是的', NULL)
INSERT [dbo].[productliuyan] ([lid], [pid], [liuname], [liutime], [liuzhu], [liuhui], [huifutime]) VALUES (71, 61, N'2607724910', CAST(N'2022-05-19T11:11:28.510' AS DateTime), N'买个折叠屏试试。', N'谢谢您的支持，我们会继续努力！', N'2022/5/19 11:25:04')
INSERT [dbo].[productliuyan] ([lid], [pid], [liuname], [liutime], [liuzhu], [liuhui], [huifutime]) VALUES (72, 74, N'3458881753', CAST(N'2022-05-19T11:22:45.937' AS DateTime), N'耳机降噪太牛了！', N'谢谢您的喜爱，我们会继续努力！', N'2022/5/19 11:24:58')
INSERT [dbo].[productliuyan] ([lid], [pid], [liuname], [liutime], [liuzhu], [liuhui], [huifutime]) VALUES (73, 65, N'1648785032', CAST(N'2022-05-19T11:23:20.650' AS DateTime), N'玩游戏必备神器，支持卖家！', N'谢谢您的支持，我们会继续努力！', N'2022/5/19 11:24:46')
INSERT [dbo].[productliuyan] ([lid], [pid], [liuname], [liutime], [liuzhu], [liuhui], [huifutime]) VALUES (75, 53, N'15776556799', CAST(N'2022-05-19T22:07:07.957' AS DateTime), N'这个手机好炫酷啊！', N'感谢支持！', N'2022/5/19 22:09:32')
INSERT [dbo].[productliuyan] ([lid], [pid], [liuname], [liutime], [liuzhu], [liuhui], [huifutime]) VALUES (76, 53, N'2607724910', CAST(N'2022-05-19T22:08:04.297' AS DateTime), N'买一个折叠屏试试。', N'推荐尝新》<(￣︶￣)↗[GO!]', N'2022/5/19 22:10:23')
INSERT [dbo].[productliuyan] ([lid], [pid], [liuname], [liutime], [liuzhu], [liuhui], [huifutime]) VALUES (77, 53, N'3458881753', CAST(N'2022-05-19T22:11:31.803' AS DateTime), N'手机不错，就是有点贵emo', N'当然了，一分价钱一分货??', N'2022/5/19 22:12:26')
INSERT [dbo].[productliuyan] ([lid], [pid], [liuname], [liutime], [liuzhu], [liuhui], [huifutime]) VALUES (78, 53, N'3458881753', CAST(N'2022-05-19T22:12:40.340' AS DateTime), N'手机不错，就是有点贵emo', NULL, NULL)
SET IDENTITY_INSERT [dbo].[productliuyan] OFF
SET IDENTITY_INSERT [dbo].[pxiaoxi] ON 

INSERT [dbo].[pxiaoxi] ([pid], [pcontent], [pfeel], [userid]) VALUES (6, N'您好,caicai,您在本公司订购的商品,订单号为20123901043922的商品,已经成功发货了!IT数码商城多谢你的支持,祝您购物愉快!', N'0', N'caicai')
INSERT [dbo].[pxiaoxi] ([pid], [pcontent], [pfeel], [userid]) VALUES (7, N'您好,1104217060,您在本公司订购的商品,订单号为20224517034507的商品,已经成功发货了!IT数码商城多谢你的支持,祝您购物愉快!', N'0', N'1104217060')
SET IDENTITY_INSERT [dbo].[pxiaoxi] OFF
SET IDENTITY_INSERT [dbo].[shoucang] ON 

INSERT [dbo].[shoucang] ([sid], [pid], [username], [shoutime]) VALUES (16, 6, N'huziqi', CAST(N'2010-05-15T18:42:32.000' AS DateTime))
INSERT [dbo].[shoucang] ([sid], [pid], [username], [shoutime]) VALUES (17, 11, N'huziqi', CAST(N'2010-05-15T18:42:38.000' AS DateTime))
INSERT [dbo].[shoucang] ([sid], [pid], [username], [shoutime]) VALUES (18, 45, N'caicai', CAST(N'2012-05-01T14:54:03.267' AS DateTime))
INSERT [dbo].[shoucang] ([sid], [pid], [username], [shoutime]) VALUES (19, 46, N'caicai', CAST(N'2012-05-05T22:09:30.407' AS DateTime))
INSERT [dbo].[shoucang] ([sid], [pid], [username], [shoutime]) VALUES (20, 21, N'121212', CAST(N'2018-01-20T09:10:05.000' AS DateTime))
INSERT [dbo].[shoucang] ([sid], [pid], [username], [shoutime]) VALUES (23, 60, N'1104217060', CAST(N'2022-05-17T15:07:23.890' AS DateTime))
INSERT [dbo].[shoucang] ([sid], [pid], [username], [shoutime]) VALUES (25, 53, N'2607724910', CAST(N'2022-05-18T14:29:51.823' AS DateTime))
INSERT [dbo].[shoucang] ([sid], [pid], [username], [shoutime]) VALUES (26, 52, N'1104217060', CAST(N'2022-05-19T17:34:44.640' AS DateTime))
INSERT [dbo].[shoucang] ([sid], [pid], [username], [shoutime]) VALUES (27, 52, N'1104217060', CAST(N'2022-05-19T17:45:02.700' AS DateTime))
SET IDENTITY_INSERT [dbo].[shoucang] OFF
ALTER TABLE [dbo].[d_users] ADD  CONSTRAINT [DF_d_users_logintimes]  DEFAULT ((0)) FOR [logintimes]
GO
ALTER TABLE [dbo].[gonggao] ADD  CONSTRAINT [DF_gonggao_gdate]  DEFAULT (getdate()) FOR [gdate]
GO
ALTER TABLE [dbo].[gonggao] ADD  CONSTRAINT [DF_gonggao_gfeel]  DEFAULT ((0)) FOR [gfeel]
GO
ALTER TABLE [dbo].[newcenter] ADD  CONSTRAINT [DF_newcenter_newshijian]  DEFAULT (getdate()) FOR [newshijian]
GO
ALTER TABLE [dbo].[newcenter] ADD  CONSTRAINT [DF_newcenter_hittime]  DEFAULT ((0)) FOR [hittime]
GO
ALTER TABLE [dbo].[orders] ADD  CONSTRAINT [DF_orders_dingdanfeel]  DEFAULT ((0)) FOR [dingdanfeel]
GO
ALTER TABLE [dbo].[orders] ADD  CONSTRAINT [DF_orders_beizhu]  DEFAULT ('暂无') FOR [beizhu]
GO
ALTER TABLE [dbo].[product] ADD  CONSTRAINT [DF_product_productimage]  DEFAULT (N'images/nopic.gif') FOR [productimage]
GO
ALTER TABLE [dbo].[product] ADD  CONSTRAINT [DF_product_guige]  DEFAULT (N'未知') FOR [guige]
GO
ALTER TABLE [dbo].[product] ADD  CONSTRAINT [DF_product_productguanjian]  DEFAULT (N'无') FOR [productguanjian]
GO
ALTER TABLE [dbo].[product] ADD  CONSTRAINT [DF_product_adddate]  DEFAULT (getdate()) FOR [adddate]
GO
ALTER TABLE [dbo].[product] ADD  CONSTRAINT [DF_product_sl]  DEFAULT ((0)) FOR [sl]
GO
ALTER TABLE [dbo].[product] ADD  CONSTRAINT [DF_product_hittimes]  DEFAULT ((0)) FOR [hittimes]
GO
ALTER TABLE [dbo].[product] ADD  CONSTRAINT [DF_product_zengpin]  DEFAULT (N'无') FOR [zenpin]
GO
ALTER TABLE [dbo].[productliuyan] ADD  CONSTRAINT [DF_productliuyan_liuhui]  DEFAULT (N'暂无') FOR [liuhui]
GO
ALTER TABLE [dbo].[pxiaoxi] ADD  CONSTRAINT [DF_pxiaoxi_pfeel]  DEFAULT ((0)) FOR [pfeel]
GO
ALTER TABLE [dbo].[orders]  WITH NOCHECK ADD  CONSTRAINT [FK_orders_d_users] FOREIGN KEY([userid])
REFERENCES [dbo].[d_users] ([uid])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_d_users]
GO
ALTER TABLE [dbo].[shoucang]  WITH NOCHECK ADD  CONSTRAINT [FK_shoucang_product] FOREIGN KEY([pid])
REFERENCES [dbo].[product] ([pid])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[shoucang] CHECK CONSTRAINT [FK_shoucang_product]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单状态 0,取消订单 1,等待发货 2,商家已发货 3,确认收货 4,完成交易' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'orders', @level2type=N'COLUMN',@level2name=N'dingdanfeel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'orders', @level2type=N'COLUMN',@level2name=N'beizhu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'库存' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'product', @level2type=N'COLUMN',@level2name=N'pkc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'点击次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'product', @level2type=N'COLUMN',@level2name=N'hittimes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'积分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'product', @level2type=N'COLUMN',@level2name=N'jifen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠品' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'product', @level2type=N'COLUMN',@level2name=N'zenpin'
GO
USE [master]
GO
ALTER DATABASE [ITweb] SET  READ_WRITE 
GO
