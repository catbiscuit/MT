USE [master]
GO
/****** Object:  Database [MT]    Script Date: 2018/10/28 16:58:27 ******/
CREATE DATABASE [MT] ON  PRIMARY 
( NAME = N'MT', FILENAME = N'D:\SQLServerDB\MSSQL12.MSSQLSERVER\MSSQL\DATA\MT.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MT_log', FILENAME = N'D:\SQLServerDB\MSSQL12.MSSQLSERVER\MSSQL\DATA\MT_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MT] SET ARITHABORT OFF 
GO
ALTER DATABASE [MT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MT] SET RECOVERY FULL 
GO
ALTER DATABASE [MT] SET  MULTI_USER 
GO
ALTER DATABASE [MT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MT] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MT', N'ON'
GO
USE [MT]
GO
/****** Object:  Table [dbo].[T_BaseInfo]    Script Date: 2018/10/28 16:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_BaseInfo](
	[F_ID] [uniqueidentifier] NOT NULL,
	[F_CatalogCode] [varchar](200) NULL,
	[F_CatalogName] [nvarchar](4000) NULL,
	[F_ItemCode] [varchar](200) NULL,
	[F_ItemName] [nvarchar](4000) NULL,
	[F_ItemSort] [int] NULL,
	[F_CreateUserID] [uniqueidentifier] NULL,
	[F_CreateUserName] [nvarchar](50) NULL,
	[F_CreateTime] [datetime] NULL,
	[F_ModifyUserID] [uniqueidentifier] NULL,
	[F_ModifyUserName] [nvarchar](50) NULL,
	[F_ModifyTime] [datetime] NULL,
	[F_isValid] [int] NULL,
 CONSTRAINT [PK_T_BaseInfo] PRIMARY KEY CLUSTERED 
(
	[F_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Log]    Script Date: 2018/10/28 16:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Log](
	[F_ID] [uniqueidentifier] NOT NULL,
	[F_ControllerName] [varchar](1000) NULL,
	[F_ActionName] [varchar](1000) NULL,
	[F_Title] [varchar](max) NULL,
	[F_Content] [varchar](max) NULL,
	[F_LogType] [varchar](200) NULL,
	[F_LogTypeName] [nvarchar](4000) NULL,
	[F_WriteTime] [datetime] NULL,
	[F_isValid] [int] NULL,
	[F_UserName] [nvarchar](20) NULL,
	[F_LoginName] [varchar](50) NULL,
 CONSTRAINT [PK_T_Log] PRIMARY KEY CLUSTERED 
(
	[F_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Menu]    Script Date: 2018/10/28 16:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Menu](
	[F_ID] [uniqueidentifier] NOT NULL,
	[F_MenuName] [nvarchar](200) NULL,
	[F_Link] [varchar](2000) NULL,
	[F_ParentID] [uniqueidentifier] NULL,
	[F_Level] [int] NULL,
	[F_Sort] [int] NULL,
	[F_isValid] [int] NULL,
	[F_Remark] [varchar](2000) NULL,
	[F_isPage] [int] NULL,
	[F_Icon] [varchar](200) NULL,
 CONSTRAINT [PK_T_Menu] PRIMARY KEY CLUSTERED 
(
	[F_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Role]    Script Date: 2018/10/28 16:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Role](
	[F_ID] [uniqueidentifier] NOT NULL,
	[F_RoleName] [nvarchar](200) NULL,
	[F_RoleType] [varchar](20) NULL,
	[F_RoleTypeName] [nvarchar](200) NULL,
	[F_isValid] [int] NULL,
	[F_Remark] [nvarchar](1000) NULL,
 CONSTRAINT [PK_T_Role] PRIMARY KEY CLUSTERED 
(
	[F_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_RoleMenu]    Script Date: 2018/10/28 16:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_RoleMenu](
	[F_ID] [uniqueidentifier] NOT NULL,
	[F_RoleID] [uniqueidentifier] NULL,
	[F_MenuID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_T_RoleMenu] PRIMARY KEY CLUSTERED 
(
	[F_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_User]    Script Date: 2018/10/28 16:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_User](
	[F_ID] [uniqueidentifier] NOT NULL,
	[F_UserName] [nvarchar](20) NULL,
	[F_LoginName] [varchar](50) NULL,
	[F_Password] [varchar](500) NULL,
	[F_isValid] [int] NULL,
	[F_Remark] [nvarchar](1000) NULL,
 CONSTRAINT [PK_T_User] PRIMARY KEY CLUSTERED 
(
	[F_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_UserRole]    Script Date: 2018/10/28 16:58:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_UserRole](
	[F_ID] [uniqueidentifier] NOT NULL,
	[F_UserID] [uniqueidentifier] NULL,
	[F_RoleID] [uniqueidentifier] NULL,
	[F_isValid] [int] NULL,
 CONSTRAINT [PK_T_UserRole] PRIMARY KEY CLUSTERED 
(
	[F_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[T_BaseInfo] ([F_ID], [F_CatalogCode], [F_CatalogName], [F_ItemCode], [F_ItemName], [F_ItemSort], [F_CreateUserID], [F_CreateUserName], [F_CreateTime], [F_ModifyUserID], [F_ModifyUserName], [F_ModifyTime], [F_isValid]) VALUES (N'0e4c30b2-71bc-44e9-930d-07c1d3770a85', N'F_LogType', N'日志类别', N'1', N'登录', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[T_BaseInfo] ([F_ID], [F_CatalogCode], [F_CatalogName], [F_ItemCode], [F_ItemName], [F_ItemSort], [F_CreateUserID], [F_CreateUserName], [F_CreateTime], [F_ModifyUserID], [F_ModifyUserName], [F_ModifyTime], [F_isValid]) VALUES (N'a404cb78-6f91-4695-b6a0-1fbe4554545f', N'F_LogType', N'日志类别', N'4', N'离开', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[T_BaseInfo] ([F_ID], [F_CatalogCode], [F_CatalogName], [F_ItemCode], [F_ItemName], [F_ItemSort], [F_CreateUserID], [F_CreateUserName], [F_CreateTime], [F_ModifyUserID], [F_ModifyUserName], [F_ModifyTime], [F_isValid]) VALUES (N'466a2605-b29e-47d3-8232-29609dc5da9a', N'F_LogType', N'日志类别', N'8', N'提交', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[T_BaseInfo] ([F_ID], [F_CatalogCode], [F_CatalogName], [F_ItemCode], [F_ItemName], [F_ItemSort], [F_CreateUserID], [F_CreateUserName], [F_CreateTime], [F_ModifyUserID], [F_ModifyUserName], [F_ModifyTime], [F_isValid]) VALUES (N'bfb23c21-3929-4b14-af57-2d364e871e9f', N'F_LogType', N'日志类别', N'2', N'退出', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[T_BaseInfo] ([F_ID], [F_CatalogCode], [F_CatalogName], [F_ItemCode], [F_ItemName], [F_ItemSort], [F_CreateUserID], [F_CreateUserName], [F_CreateTime], [F_ModifyUserID], [F_ModifyUserName], [F_ModifyTime], [F_isValid]) VALUES (N'd925d779-9090-4ce7-916a-7abce7385f9f', N'F_LogType', N'日志类别', N'9', N'异常', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[T_BaseInfo] ([F_ID], [F_CatalogCode], [F_CatalogName], [F_ItemCode], [F_ItemName], [F_ItemSort], [F_CreateUserID], [F_CreateUserName], [F_CreateTime], [F_ModifyUserID], [F_ModifyUserName], [F_ModifyTime], [F_isValid]) VALUES (N'c09a3b51-6e2b-4826-8cda-7bbfac3c473e', N'F_LogType', N'日志类别', N'3', N'访问', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[T_BaseInfo] ([F_ID], [F_CatalogCode], [F_CatalogName], [F_ItemCode], [F_ItemName], [F_ItemSort], [F_CreateUserID], [F_CreateUserName], [F_CreateTime], [F_ModifyUserID], [F_ModifyUserName], [F_ModifyTime], [F_isValid]) VALUES (N'2b9224c8-e028-4335-b44c-7ffd4661a621', N'F_LogType', N'日志类别', N'5', N'新增', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[T_BaseInfo] ([F_ID], [F_CatalogCode], [F_CatalogName], [F_ItemCode], [F_ItemName], [F_ItemSort], [F_CreateUserID], [F_CreateUserName], [F_CreateTime], [F_ModifyUserID], [F_ModifyUserName], [F_ModifyTime], [F_isValid]) VALUES (N'085ece9d-9a59-4634-88ca-9bd88b880003', N'F_LogType', N'日志类别', N'10', N'移动登录', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[T_BaseInfo] ([F_ID], [F_CatalogCode], [F_CatalogName], [F_ItemCode], [F_ItemName], [F_ItemSort], [F_CreateUserID], [F_CreateUserName], [F_CreateTime], [F_ModifyUserID], [F_ModifyUserName], [F_ModifyTime], [F_isValid]) VALUES (N'09f4679e-b576-4889-a281-ae1e29f57389', N'F_LogType', N'日志类别', N'7', N'修改', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[T_BaseInfo] ([F_ID], [F_CatalogCode], [F_CatalogName], [F_ItemCode], [F_ItemName], [F_ItemSort], [F_CreateUserID], [F_CreateUserName], [F_CreateTime], [F_ModifyUserID], [F_ModifyUserName], [F_ModifyTime], [F_isValid]) VALUES (N'3c57a9ac-1ddf-4899-9648-b1b5813e29d5', N'F_LogType', N'日志类别', N'0', N'其他', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[T_BaseInfo] ([F_ID], [F_CatalogCode], [F_CatalogName], [F_ItemCode], [F_ItemName], [F_ItemSort], [F_CreateUserID], [F_CreateUserName], [F_CreateTime], [F_ModifyUserID], [F_ModifyUserName], [F_ModifyTime], [F_isValid]) VALUES (N'638b0e5c-69a6-4f72-a7fe-bb59d07adb1f', N'F_LogType', N'日志类别', N'6', N'删除', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[T_Log] ([F_ID], [F_ControllerName], [F_ActionName], [F_Title], [F_Content], [F_LogType], [F_LogTypeName], [F_WriteTime], [F_isValid], [F_UserName], [F_LoginName]) VALUES (N'3ea2a7a4-df55-454a-bbf4-060b405aff00', N'Login', N'CheckLogin', N'登录日志', N'登录成功', N'1', N'登录', CAST(N'2018-10-23 22:48:14.727' AS DateTime), 1, N'20:36', N'admin')
GO
INSERT [dbo].[T_Log] ([F_ID], [F_ControllerName], [F_ActionName], [F_Title], [F_Content], [F_LogType], [F_LogTypeName], [F_WriteTime], [F_isValid], [F_UserName], [F_LoginName]) VALUES (N'729dc42c-c7ca-46ff-bba1-19226b5ad5c7', N'Login', N'CheckLogin', N'登录日志', N'登录成功', N'1', N'登录', CAST(N'2018-10-23 22:52:35.477' AS DateTime), 1, N'20:36', N'admin')
GO
INSERT [dbo].[T_Log] ([F_ID], [F_ControllerName], [F_ActionName], [F_Title], [F_Content], [F_LogType], [F_LogTypeName], [F_WriteTime], [F_isValid], [F_UserName], [F_LoginName]) VALUES (N'a354be16-7c03-4efd-88d2-1f6ecc70c414', N'Login', N'CheckLogin', N'登录日志', N'登录成功', N'1', N'登录', CAST(N'2018-10-24 18:31:47.033' AS DateTime), 1, N'马特', N'admin')
GO
INSERT [dbo].[T_Log] ([F_ID], [F_ControllerName], [F_ActionName], [F_Title], [F_Content], [F_LogType], [F_LogTypeName], [F_WriteTime], [F_isValid], [F_UserName], [F_LoginName]) VALUES (N'a6e2e19e-452b-48fe-ae8e-2432183d99fb', N'Login', N'CheckLogin', N'登录日志', N'登录成功', N'1', N'登录', CAST(N'2018-10-25 19:10:13.907' AS DateTime), 1, N'马特', N'admin')
GO
INSERT [dbo].[T_Log] ([F_ID], [F_ControllerName], [F_ActionName], [F_Title], [F_Content], [F_LogType], [F_LogTypeName], [F_WriteTime], [F_isValid], [F_UserName], [F_LoginName]) VALUES (N'e20db1a8-1b0a-4fd9-b557-2f6c6b809bbe', N'Login', N'CheckLogin', N'登录日志', N'登录成功', N'1', N'登录', CAST(N'2018-10-24 19:28:45.047' AS DateTime), 1, N'马特', N'admin')
GO
INSERT [dbo].[T_Log] ([F_ID], [F_ControllerName], [F_ActionName], [F_Title], [F_Content], [F_LogType], [F_LogTypeName], [F_WriteTime], [F_isValid], [F_UserName], [F_LoginName]) VALUES (N'7bdf56b2-7c42-4e93-bc13-3546005d5a56', N'Login', N'CheckLogin', N'登录日志', N'登录成功', N'1', N'登录', CAST(N'2018-10-24 19:28:45.047' AS DateTime), 1, N'马特', N'admin')
GO
INSERT [dbo].[T_Log] ([F_ID], [F_ControllerName], [F_ActionName], [F_Title], [F_Content], [F_LogType], [F_LogTypeName], [F_WriteTime], [F_isValid], [F_UserName], [F_LoginName]) VALUES (N'1485ccef-63e7-4074-96f8-3b2049e925de', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2018-10-16 20:37:31.210' AS DateTime), 3, NULL, NULL)
GO
INSERT [dbo].[T_Log] ([F_ID], [F_ControllerName], [F_ActionName], [F_Title], [F_Content], [F_LogType], [F_LogTypeName], [F_WriteTime], [F_isValid], [F_UserName], [F_LoginName]) VALUES (N'3ce55afc-1730-4ef1-9fba-41559b6cff4b', N'Login', N'CheckLogin', N'登录日志', N'登录成功', N'1', N'登录', CAST(N'2018-10-26 18:50:53.540' AS DateTime), 1, N'马特', N'admin')
GO
INSERT [dbo].[T_Log] ([F_ID], [F_ControllerName], [F_ActionName], [F_Title], [F_Content], [F_LogType], [F_LogTypeName], [F_WriteTime], [F_isValid], [F_UserName], [F_LoginName]) VALUES (N'1da223cf-f127-4a6c-8840-5a974b4806f0', N'Login', N'CheckLogin', N'登录日志', N'登录成功', N'1', N'登录', CAST(N'2018-10-23 23:23:33.207' AS DateTime), 1, N'20:36', N'admin')
GO
INSERT [dbo].[T_Log] ([F_ID], [F_ControllerName], [F_ActionName], [F_Title], [F_Content], [F_LogType], [F_LogTypeName], [F_WriteTime], [F_isValid], [F_UserName], [F_LoginName]) VALUES (N'32911212-0f0f-425e-a368-5dd2061748b1', N'Login', N'CheckLogin', N'登录日志', N'登录成功', N'1', N'登录', CAST(N'2018-10-23 23:23:52.387' AS DateTime), 1, N'20:36', N'admin')
GO
INSERT [dbo].[T_Log] ([F_ID], [F_ControllerName], [F_ActionName], [F_Title], [F_Content], [F_LogType], [F_LogTypeName], [F_WriteTime], [F_isValid], [F_UserName], [F_LoginName]) VALUES (N'ebe6ee36-4a7e-427f-a18b-6f20a23463b8', N'Login', N'CheckLogin', N'登录日志', N'登录成功', N'1', N'登录', CAST(N'2018-10-23 23:03:47.120' AS DateTime), 1, N'20:36', N'admin')
GO
INSERT [dbo].[T_Log] ([F_ID], [F_ControllerName], [F_ActionName], [F_Title], [F_Content], [F_LogType], [F_LogTypeName], [F_WriteTime], [F_isValid], [F_UserName], [F_LoginName]) VALUES (N'0db0cb8d-0439-406e-aa11-76ad16f8e85f', N'Login', N'CheckLogin', N'登录日志', N'登录成功', N'1', N'登录', CAST(N'2018-10-23 22:42:44.957' AS DateTime), 1, N'20:36', N'admin')
GO
INSERT [dbo].[T_Log] ([F_ID], [F_ControllerName], [F_ActionName], [F_Title], [F_Content], [F_LogType], [F_LogTypeName], [F_WriteTime], [F_isValid], [F_UserName], [F_LoginName]) VALUES (N'6b7eac96-cf7e-4451-a9e9-7f1b5e758fe6', N'Login', N'CheckLogin', N'登录日志', N'登录成功', N'1', N'登录', CAST(N'2018-10-26 18:31:29.873' AS DateTime), 1, N'马特', N'admin')
GO
INSERT [dbo].[T_Log] ([F_ID], [F_ControllerName], [F_ActionName], [F_Title], [F_Content], [F_LogType], [F_LogTypeName], [F_WriteTime], [F_isValid], [F_UserName], [F_LoginName]) VALUES (N'a706e45f-2c41-4880-b704-8c6faf6e1c2d', N'Login', N'CheckLogin', N'登录日志', N'退出成功', N'2', N'退出', CAST(N'2018-10-23 23:24:00.040' AS DateTime), 1, N'20:36', N'admin')
GO
INSERT [dbo].[T_Log] ([F_ID], [F_ControllerName], [F_ActionName], [F_Title], [F_Content], [F_LogType], [F_LogTypeName], [F_WriteTime], [F_isValid], [F_UserName], [F_LoginName]) VALUES (N'a587fb0a-3cb7-457e-9be7-8f3eeb53091f', N'Login', N'CheckLogin', N'登录日志', N'登录成功', N'1', N'登录', CAST(N'2018-10-23 22:44:42.073' AS DateTime), 1, N'20:36', N'admin')
GO
INSERT [dbo].[T_Log] ([F_ID], [F_ControllerName], [F_ActionName], [F_Title], [F_Content], [F_LogType], [F_LogTypeName], [F_WriteTime], [F_isValid], [F_UserName], [F_LoginName]) VALUES (N'f5fc2e31-224a-439f-a308-a49be407d842', N'Login', N'CheckLogin', N'登录日志', N'登录成功', N'1', N'登录', CAST(N'2018-10-22 22:08:14.033' AS DateTime), 1, N'20:36', N'admin')
GO
INSERT [dbo].[T_Log] ([F_ID], [F_ControllerName], [F_ActionName], [F_Title], [F_Content], [F_LogType], [F_LogTypeName], [F_WriteTime], [F_isValid], [F_UserName], [F_LoginName]) VALUES (N'44850748-c14f-4ef0-8e53-baa50989474a', N'Login', N'CheckLogin', N'登录日志', N'登录成功', N'1', N'登录', CAST(N'2018-10-24 19:34:16.923' AS DateTime), 1, N'马特', N'admin')
GO
INSERT [dbo].[T_Log] ([F_ID], [F_ControllerName], [F_ActionName], [F_Title], [F_Content], [F_LogType], [F_LogTypeName], [F_WriteTime], [F_isValid], [F_UserName], [F_LoginName]) VALUES (N'6165f437-2e24-49d7-893c-cc6026eb4ea2', N'Login', N'CheckLogin', N'登录日志', N'登录成功', N'1', N'登录', CAST(N'2018-10-28 14:38:00.447' AS DateTime), 1, N'马特', N'admin')
GO
INSERT [dbo].[T_Log] ([F_ID], [F_ControllerName], [F_ActionName], [F_Title], [F_Content], [F_LogType], [F_LogTypeName], [F_WriteTime], [F_isValid], [F_UserName], [F_LoginName]) VALUES (N'f6d7e1e2-661f-48c2-82c4-d9295718697d', N'Login', N'CheckLogin', N'登录日志', N'退出成功', N'2', N'退出', CAST(N'2018-10-24 18:31:56.453' AS DateTime), 1, N'马特', N'admin')
GO
INSERT [dbo].[T_Log] ([F_ID], [F_ControllerName], [F_ActionName], [F_Title], [F_Content], [F_LogType], [F_LogTypeName], [F_WriteTime], [F_isValid], [F_UserName], [F_LoginName]) VALUES (N'95b8826d-c5d7-4700-b5ca-f4d8495b2824', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2018-10-16 20:37:19.747' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[T_Menu] ([F_ID], [F_MenuName], [F_Link], [F_ParentID], [F_Level], [F_Sort], [F_isValid], [F_Remark], [F_isPage], [F_Icon]) VALUES (N'5d62c2ba-6e14-4381-be9d-2c66423f5fe4', N'根节点', N'', NULL, 0, 0, 1, N'', NULL, NULL)
GO
INSERT [dbo].[T_Menu] ([F_ID], [F_MenuName], [F_Link], [F_ParentID], [F_Level], [F_Sort], [F_isValid], [F_Remark], [F_isPage], [F_Icon]) VALUES (N'6ef0890a-0519-48d9-b859-80978b574350', N'日志管理', N'/SystemManage/Log/Index', N'ee56bd0d-aed0-4d79-917d-dcde5241df33', 2, 1, 1, N'', 1, NULL)
GO
INSERT [dbo].[T_Menu] ([F_ID], [F_MenuName], [F_Link], [F_ParentID], [F_Level], [F_Sort], [F_isValid], [F_Remark], [F_isPage], [F_Icon]) VALUES (N'878819d6-9e42-45b9-b987-8cd2cc8984b9', N'二级菜单2', N'/SystemManage/Log/Index?ID=1', N'ee56bd0d-aed0-4d79-917d-dcde5241df33', 2, 2, 0, N'', NULL, N'')
GO
INSERT [dbo].[T_Menu] ([F_ID], [F_MenuName], [F_Link], [F_ParentID], [F_Level], [F_Sort], [F_isValid], [F_Remark], [F_isPage], [F_Icon]) VALUES (N'de3744ca-35be-4ecd-b682-bade10188e7d', N'二级菜单1', N'/SystemManage/Log/Index', N'ee56bd0d-aed0-4d79-917d-dcde5241df33', 2, 2, 0, N'', 1, N'')
GO
INSERT [dbo].[T_Menu] ([F_ID], [F_MenuName], [F_Link], [F_ParentID], [F_Level], [F_Sort], [F_isValid], [F_Remark], [F_isPage], [F_Icon]) VALUES (N'ee56bd0d-aed0-4d79-917d-dcde5241df33', N'系统管理', N'#', N'5d62c2ba-6e14-4381-be9d-2c66423f5fe4', 1, 1, 1, N'', NULL, N'layui-icon-set')
GO
INSERT [dbo].[T_Menu] ([F_ID], [F_MenuName], [F_Link], [F_ParentID], [F_Level], [F_Sort], [F_isValid], [F_Remark], [F_isPage], [F_Icon]) VALUES (N'acc70900-5ac1-480f-9114-e016411fd1c6', N'三级菜单1', N'/SystemManage/Log/Index?ID=1', N'878819d6-9e42-45b9-b987-8cd2cc8984b9', 3, 1, 0, N'', 1, N'')
GO
INSERT [dbo].[T_Role] ([F_ID], [F_RoleName], [F_RoleType], [F_RoleTypeName], [F_isValid], [F_Remark]) VALUES (N'03383fa0-765b-4c68-b9e8-747e715d193a', N'管理员', N'', N'', 1, N'')
GO
INSERT [dbo].[T_Role] ([F_ID], [F_RoleName], [F_RoleType], [F_RoleTypeName], [F_isValid], [F_Remark]) VALUES (N'8b4c27c8-e600-4b71-a90d-f27c966543d5', N'系统管理员', N'', N'', 1, N'')
GO
INSERT [dbo].[T_RoleMenu] ([F_ID], [F_RoleID], [F_MenuID]) VALUES (N'1cf7425f-35c9-49ef-bba0-183412ff8a42', N'8b4c27c8-e600-4b71-a90d-f27c966543d5', N'acc70900-5ac1-480f-9114-e016411fd1c6')
GO
INSERT [dbo].[T_RoleMenu] ([F_ID], [F_RoleID], [F_MenuID]) VALUES (N'db1ffe8d-2034-4d05-96cc-45f1520395da', N'8b4c27c8-e600-4b71-a90d-f27c966543d5', N'878819d6-9e42-45b9-b987-8cd2cc8984b9')
GO
INSERT [dbo].[T_RoleMenu] ([F_ID], [F_RoleID], [F_MenuID]) VALUES (N'a1fc0af2-37b9-4e39-bfd9-6e45d5ee647b', N'8b4c27c8-e600-4b71-a90d-f27c966543d5', N'ee56bd0d-aed0-4d79-917d-dcde5241df33')
GO
INSERT [dbo].[T_RoleMenu] ([F_ID], [F_RoleID], [F_MenuID]) VALUES (N'6ca57b6c-45cc-4645-860a-960441c63c3d', N'8b4c27c8-e600-4b71-a90d-f27c966543d5', N'6ef0890a-0519-48d9-b859-80978b574350')
GO
INSERT [dbo].[T_RoleMenu] ([F_ID], [F_RoleID], [F_MenuID]) VALUES (N'1db6fa48-37d2-45a6-867a-b3c6a8d97eb1', N'8b4c27c8-e600-4b71-a90d-f27c966543d5', N'de3744ca-35be-4ecd-b682-bade10188e7d')
GO
INSERT [dbo].[T_User] ([F_ID], [F_UserName], [F_LoginName], [F_Password], [F_isValid], [F_Remark]) VALUES (N'259e4c58-6719-4896-904c-f090e3f45514', N'马特', N'admin', N'67214ad3095e80274f96c8a7ff157032', 1, NULL)
GO
INSERT [dbo].[T_UserRole] ([F_ID], [F_UserID], [F_RoleID], [F_isValid]) VALUES (N'64977bbf-c717-4ef0-ba87-25ac32c7edc8', N'259e4c58-6719-4896-904c-f090e3f45514', N'8b4c27c8-e600-4b71-a90d-f27c966543d5', 1)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'GUID主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_BaseInfo', @level2type=N'COLUMN',@level2name=N'F_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'目录编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_BaseInfo', @level2type=N'COLUMN',@level2name=N'F_CatalogCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'目录名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_BaseInfo', @level2type=N'COLUMN',@level2name=N'F_CatalogName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_BaseInfo', @level2type=N'COLUMN',@level2name=N'F_ItemCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_BaseInfo', @level2type=N'COLUMN',@level2name=N'F_ItemName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目排序序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_BaseInfo', @level2type=N'COLUMN',@level2name=N'F_ItemSort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建者UserID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_BaseInfo', @level2type=N'COLUMN',@level2name=N'F_CreateUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建者姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_BaseInfo', @level2type=N'COLUMN',@level2name=N'F_CreateUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_BaseInfo', @level2type=N'COLUMN',@level2name=N'F_CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人UserID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_BaseInfo', @level2type=N'COLUMN',@level2name=N'F_ModifyUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_BaseInfo', @level2type=N'COLUMN',@level2name=N'F_ModifyUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_BaseInfo', @level2type=N'COLUMN',@level2name=N'F_ModifyTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否有效(0删除1有效)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_BaseInfo', @level2type=N'COLUMN',@level2name=N'F_isValid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'基础信息表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_BaseInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'GUID主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_Log', @level2type=N'COLUMN',@level2name=N'F_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Controller控制器名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_Log', @level2type=N'COLUMN',@level2name=N'F_ControllerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Action方法名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_Log', @level2type=N'COLUMN',@level2name=N'F_ActionName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日志标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_Log', @level2type=N'COLUMN',@level2name=N'F_Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日志内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_Log', @level2type=N'COLUMN',@level2name=N'F_Content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日志类型编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_Log', @level2type=N'COLUMN',@level2name=N'F_LogType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日志类型名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_Log', @level2type=N'COLUMN',@level2name=N'F_LogTypeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_Log', @level2type=N'COLUMN',@level2name=N'F_WriteTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否有效(0删除1有效)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_Log', @level2type=N'COLUMN',@level2name=N'F_isValid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_Log', @level2type=N'COLUMN',@level2name=N'F_UserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户登录名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_Log', @level2type=N'COLUMN',@level2name=N'F_LoginName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日志表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_Log'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_Menu', @level2type=N'COLUMN',@level2name=N'F_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_Menu', @level2type=N'COLUMN',@level2name=N'F_MenuName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父级菜单编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_Menu', @level2type=N'COLUMN',@level2name=N'F_ParentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单级别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_Menu', @level2type=N'COLUMN',@level2name=N'F_Level'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_Menu', @level2type=N'COLUMN',@level2name=N'F_Sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_Menu', @level2type=N'COLUMN',@level2name=N'F_isValid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_Menu', @level2type=N'COLUMN',@level2name=N'F_Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'GUID主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_Role', @level2type=N'COLUMN',@level2name=N'F_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_Role', @level2type=N'COLUMN',@level2name=N'F_RoleName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色类别编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_Role', @level2type=N'COLUMN',@level2name=N'F_RoleType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色类别名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_Role', @level2type=N'COLUMN',@level2name=N'F_RoleTypeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_Role', @level2type=N'COLUMN',@level2name=N'F_isValid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_Role', @level2type=N'COLUMN',@level2name=N'F_Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_RoleMenu', @level2type=N'COLUMN',@level2name=N'F_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_RoleMenu', @level2type=N'COLUMN',@level2name=N'F_RoleID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_RoleMenu', @level2type=N'COLUMN',@level2name=N'F_MenuID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'GUID主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_User', @level2type=N'COLUMN',@level2name=N'F_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_User', @level2type=N'COLUMN',@level2name=N'F_UserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_User', @level2type=N'COLUMN',@level2name=N'F_LoginName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_User', @level2type=N'COLUMN',@level2name=N'F_Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_User', @level2type=N'COLUMN',@level2name=N'F_isValid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_User', @level2type=N'COLUMN',@level2name=N'F_Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'GUID主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_UserRole', @level2type=N'COLUMN',@level2name=N'F_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户表主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_UserRole', @level2type=N'COLUMN',@level2name=N'F_UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色表主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_UserRole', @level2type=N'COLUMN',@level2name=N'F_RoleID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_UserRole', @level2type=N'COLUMN',@level2name=N'F_isValid'
GO
USE [master]
GO
ALTER DATABASE [MT] SET  READ_WRITE 
GO
