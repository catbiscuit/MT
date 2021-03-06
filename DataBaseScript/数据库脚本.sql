USE [master]
GO
/****** Object:  Database [MT]    Script Date: 2018/11/6 22:09:23 ******/
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
/****** Object:  Table [dbo].[T_BaseInfo]    Script Date: 2018/11/6 22:09:23 ******/
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
/****** Object:  Table [dbo].[T_DataItem]    Script Date: 2018/11/6 22:09:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_DataItem](
	[F_ID] [uniqueidentifier] NOT NULL,
	[F_ItemCode] [varchar](200) NULL,
	[F_ItemName] [nvarchar](200) NULL,
	[F_Sort] [int] NULL,
	[F_isValid] [int] NULL,
	[F_Remark] [nvarchar](2000) NULL,
	[F_AddUserID] [uniqueidentifier] NULL,
	[F_AddUserName] [nvarchar](20) NULL,
	[F_AddTime] [datetime] NULL,
	[F_UpdateUserID] [uniqueidentifier] NULL,
	[F_UpdateUserName] [nvarchar](20) NULL,
	[F_UpdateTime] [datetime] NULL,
	[F_isEnable] [int] NULL,
	[F_HelpCode] [varchar](max) NULL,
 CONSTRAINT [PK_T_DataItem] PRIMARY KEY CLUSTERED 
(
	[F_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_DataItemDetail]    Script Date: 2018/11/6 22:09:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_DataItemDetail](
	[F_ID] [uniqueidentifier] NOT NULL,
	[F_ItemCode] [varchar](200) NULL,
	[F_ItemName] [nvarchar](200) NULL,
	[F_DataItemID] [uniqueidentifier] NULL,
	[F_Sort] [int] NULL,
	[F_isValid] [int] NULL,
	[F_Remark] [nvarchar](2000) NULL,
	[F_AddUserID] [uniqueidentifier] NULL,
	[F_AddUserName] [nvarchar](20) NULL,
	[F_AddTime] [datetime] NULL,
	[F_UpdateUserID] [uniqueidentifier] NULL,
	[F_UpdateUserName] [nvarchar](20) NULL,
	[F_UpdateTime] [datetime] NULL,
	[F_isEnable] [int] NULL,
	[F_HelpCode] [varchar](max) NULL,
 CONSTRAINT [PK_T_DataItemDetail] PRIMARY KEY CLUSTERED 
(
	[F_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Department]    Script Date: 2018/11/6 22:09:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Department](
	[F_ID] [uniqueidentifier] NOT NULL,
	[F_Name] [nvarchar](200) NULL,
	[F_ParentID] [uniqueidentifier] NULL,
	[F_isValid] [int] NULL,
	[F_Remark] [nvarchar](200) NULL,
 CONSTRAINT [PK_T_Department] PRIMARY KEY CLUSTERED 
(
	[F_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_Log]    Script Date: 2018/11/6 22:09:23 ******/
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
/****** Object:  Table [dbo].[T_Menu]    Script Date: 2018/11/6 22:09:23 ******/
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
/****** Object:  Table [dbo].[T_Role]    Script Date: 2018/11/6 22:09:23 ******/
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
/****** Object:  Table [dbo].[T_RoleMenu]    Script Date: 2018/11/6 22:09:23 ******/
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
/****** Object:  Table [dbo].[T_User]    Script Date: 2018/11/6 22:09:23 ******/
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
/****** Object:  Table [dbo].[T_UserRole]    Script Date: 2018/11/6 22:09:23 ******/
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
INSERT [dbo].[T_BaseInfo] ([F_ID], [F_CatalogCode], [F_CatalogName], [F_ItemCode], [F_ItemName], [F_ItemSort], [F_CreateUserID], [F_CreateUserName], [F_CreateTime], [F_ModifyUserID], [F_ModifyUserName], [F_ModifyTime], [F_isValid]) VALUES (N'a404cb78-6f91-4695-b6a0-1fbe4554545f', N'F_LogType', N'日志类别', N'4', N'离开', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[T_BaseInfo] ([F_ID], [F_CatalogCode], [F_CatalogName], [F_ItemCode], [F_ItemName], [F_ItemSort], [F_CreateUserID], [F_CreateUserName], [F_CreateTime], [F_ModifyUserID], [F_ModifyUserName], [F_ModifyTime], [F_isValid]) VALUES (N'466a2605-b29e-47d3-8232-29609dc5da9a', N'F_LogType', N'日志类别', N'8', N'提交', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[T_BaseInfo] ([F_ID], [F_CatalogCode], [F_CatalogName], [F_ItemCode], [F_ItemName], [F_ItemSort], [F_CreateUserID], [F_CreateUserName], [F_CreateTime], [F_ModifyUserID], [F_ModifyUserName], [F_ModifyTime], [F_isValid]) VALUES (N'bfb23c21-3929-4b14-af57-2d364e871e9f', N'F_LogType', N'日志类别', N'2', N'退出', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[T_BaseInfo] ([F_ID], [F_CatalogCode], [F_CatalogName], [F_ItemCode], [F_ItemName], [F_ItemSort], [F_CreateUserID], [F_CreateUserName], [F_CreateTime], [F_ModifyUserID], [F_ModifyUserName], [F_ModifyTime], [F_isValid]) VALUES (N'd925d779-9090-4ce7-916a-7abce7385f9f', N'F_LogType', N'日志类别', N'9', N'异常', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[T_BaseInfo] ([F_ID], [F_CatalogCode], [F_CatalogName], [F_ItemCode], [F_ItemName], [F_ItemSort], [F_CreateUserID], [F_CreateUserName], [F_CreateTime], [F_ModifyUserID], [F_ModifyUserName], [F_ModifyTime], [F_isValid]) VALUES (N'c09a3b51-6e2b-4826-8cda-7bbfac3c473e', N'F_LogType', N'日志类别', N'3', N'访问', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[T_BaseInfo] ([F_ID], [F_CatalogCode], [F_CatalogName], [F_ItemCode], [F_ItemName], [F_ItemSort], [F_CreateUserID], [F_CreateUserName], [F_CreateTime], [F_ModifyUserID], [F_ModifyUserName], [F_ModifyTime], [F_isValid]) VALUES (N'2b9224c8-e028-4335-b44c-7ffd4661a621', N'F_LogType', N'日志类别', N'5', N'新增', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[T_BaseInfo] ([F_ID], [F_CatalogCode], [F_CatalogName], [F_ItemCode], [F_ItemName], [F_ItemSort], [F_CreateUserID], [F_CreateUserName], [F_CreateTime], [F_ModifyUserID], [F_ModifyUserName], [F_ModifyTime], [F_isValid]) VALUES (N'085ece9d-9a59-4634-88ca-9bd88b880003', N'F_LogType', N'日志类别', N'10', N'移动登录', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[T_BaseInfo] ([F_ID], [F_CatalogCode], [F_CatalogName], [F_ItemCode], [F_ItemName], [F_ItemSort], [F_CreateUserID], [F_CreateUserName], [F_CreateTime], [F_ModifyUserID], [F_ModifyUserName], [F_ModifyTime], [F_isValid]) VALUES (N'09f4679e-b576-4889-a281-ae1e29f57389', N'F_LogType', N'日志类别', N'7', N'修改', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[T_BaseInfo] ([F_ID], [F_CatalogCode], [F_CatalogName], [F_ItemCode], [F_ItemName], [F_ItemSort], [F_CreateUserID], [F_CreateUserName], [F_CreateTime], [F_ModifyUserID], [F_ModifyUserName], [F_ModifyTime], [F_isValid]) VALUES (N'3c57a9ac-1ddf-4899-9648-b1b5813e29d5', N'F_LogType', N'日志类别', N'0', N'其他', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[T_BaseInfo] ([F_ID], [F_CatalogCode], [F_CatalogName], [F_ItemCode], [F_ItemName], [F_ItemSort], [F_CreateUserID], [F_CreateUserName], [F_CreateTime], [F_ModifyUserID], [F_ModifyUserName], [F_ModifyTime], [F_isValid]) VALUES (N'638b0e5c-69a6-4f72-a7fe-bb59d07adb1f', N'F_LogType', N'日志类别', N'6', N'删除', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[T_DataItem] ([F_ID], [F_ItemCode], [F_ItemName], [F_Sort], [F_isValid], [F_Remark], [F_AddUserID], [F_AddUserName], [F_AddTime], [F_UpdateUserID], [F_UpdateUserName], [F_UpdateTime], [F_isEnable], [F_HelpCode]) VALUES (N'7be48401-ac3a-47b9-bb89-27273024f7c4', N'F_LogType', N'日志类别', 1, 1, N'', N'259e4c58-6719-4896-904c-f090e3f45514', N'马特', CAST(N'2018-11-03 15:42:05.663' AS DateTime), NULL, NULL, NULL, 0, N'RZLB')
INSERT [dbo].[T_Log] ([F_ID], [F_ControllerName], [F_ActionName], [F_Title], [F_Content], [F_LogType], [F_LogTypeName], [F_WriteTime], [F_isValid], [F_UserName], [F_LoginName]) VALUES (N'036ee1b1-ebb2-4e30-9827-05c3cf230c03', N'Login', N'CheckLogin', N'登录日志', N'登录成功', N'1', N'登录', CAST(N'2018-11-06 19:44:06.303' AS DateTime), 1, N'马特', N'admin')
INSERT [dbo].[T_Log] ([F_ID], [F_ControllerName], [F_ActionName], [F_Title], [F_Content], [F_LogType], [F_LogTypeName], [F_WriteTime], [F_isValid], [F_UserName], [F_LoginName]) VALUES (N'3ea2a7a4-df55-454a-bbf4-060b405aff00', N'Login', N'CheckLogin', N'登录日志', N'登录成功', N'1', N'登录', CAST(N'2018-10-23 22:48:14.727' AS DateTime), 1, N'20:36', N'admin')
INSERT [dbo].[T_Log] ([F_ID], [F_ControllerName], [F_ActionName], [F_Title], [F_Content], [F_LogType], [F_LogTypeName], [F_WriteTime], [F_isValid], [F_UserName], [F_LoginName]) VALUES (N'b59e301f-2af3-4290-ace7-140df0280746', N'Login', N'CheckLogin', N'登录日志', N'登录成功', N'1', N'登录', CAST(N'2018-11-01 19:47:10.717' AS DateTime), 1, N'马特', N'admin')
INSERT [dbo].[T_Log] ([F_ID], [F_ControllerName], [F_ActionName], [F_Title], [F_Content], [F_LogType], [F_LogTypeName], [F_WriteTime], [F_isValid], [F_UserName], [F_LoginName]) VALUES (N'729dc42c-c7ca-46ff-bba1-19226b5ad5c7', N'Login', N'CheckLogin', N'登录日志', N'登录成功', N'1', N'登录', CAST(N'2018-10-23 22:52:35.477' AS DateTime), 1, N'20:36', N'admin')
INSERT [dbo].[T_Log] ([F_ID], [F_ControllerName], [F_ActionName], [F_Title], [F_Content], [F_LogType], [F_LogTypeName], [F_WriteTime], [F_isValid], [F_UserName], [F_LoginName]) VALUES (N'a354be16-7c03-4efd-88d2-1f6ecc70c414', N'Login', N'CheckLogin', N'登录日志', N'登录成功', N'1', N'登录', CAST(N'2018-10-24 18:31:47.033' AS DateTime), 1, N'马特', N'admin')
INSERT [dbo].[T_Log] ([F_ID], [F_ControllerName], [F_ActionName], [F_Title], [F_Content], [F_LogType], [F_LogTypeName], [F_WriteTime], [F_isValid], [F_UserName], [F_LoginName]) VALUES (N'a6e2e19e-452b-48fe-ae8e-2432183d99fb', N'Login', N'CheckLogin', N'登录日志', N'登录成功', N'1', N'登录', CAST(N'2018-10-25 19:10:13.907' AS DateTime), 1, N'马特', N'admin')
INSERT [dbo].[T_Log] ([F_ID], [F_ControllerName], [F_ActionName], [F_Title], [F_Content], [F_LogType], [F_LogTypeName], [F_WriteTime], [F_isValid], [F_UserName], [F_LoginName]) VALUES (N'e20db1a8-1b0a-4fd9-b557-2f6c6b809bbe', N'Login', N'CheckLogin', N'登录日志', N'登录成功', N'1', N'登录', CAST(N'2018-10-24 19:28:45.047' AS DateTime), 1, N'马特', N'admin')
INSERT [dbo].[T_Log] ([F_ID], [F_ControllerName], [F_ActionName], [F_Title], [F_Content], [F_LogType], [F_LogTypeName], [F_WriteTime], [F_isValid], [F_UserName], [F_LoginName]) VALUES (N'7bdf56b2-7c42-4e93-bc13-3546005d5a56', N'Login', N'CheckLogin', N'登录日志', N'登录成功', N'1', N'登录', CAST(N'2018-10-24 19:28:45.047' AS DateTime), 1, N'马特', N'admin')
INSERT [dbo].[T_Log] ([F_ID], [F_ControllerName], [F_ActionName], [F_Title], [F_Content], [F_LogType], [F_LogTypeName], [F_WriteTime], [F_isValid], [F_UserName], [F_LoginName]) VALUES (N'ffa083f4-9220-4c59-9782-359660269333', N'Login', N'CheckLogin', N'登录日志', N'登录成功', N'1', N'登录', CAST(N'2018-11-03 10:27:34.847' AS DateTime), 1, N'马特', N'admin')
INSERT [dbo].[T_Log] ([F_ID], [F_ControllerName], [F_ActionName], [F_Title], [F_Content], [F_LogType], [F_LogTypeName], [F_WriteTime], [F_isValid], [F_UserName], [F_LoginName]) VALUES (N'3ce55afc-1730-4ef1-9fba-41559b6cff4b', N'Login', N'CheckLogin', N'登录日志', N'登录成功', N'1', N'登录', CAST(N'2018-10-26 18:50:53.540' AS DateTime), 1, N'马特', N'admin')
INSERT [dbo].[T_Log] ([F_ID], [F_ControllerName], [F_ActionName], [F_Title], [F_Content], [F_LogType], [F_LogTypeName], [F_WriteTime], [F_isValid], [F_UserName], [F_LoginName]) VALUES (N'a2b14401-d2e8-42b2-906a-427fd077c70b', N'Login', N'CheckLogin', N'登录日志', N'登录成功', N'1', N'登录', CAST(N'2018-11-06 19:46:05.727' AS DateTime), 1, N'马特', N'admin')
INSERT [dbo].[T_Log] ([F_ID], [F_ControllerName], [F_ActionName], [F_Title], [F_Content], [F_LogType], [F_LogTypeName], [F_WriteTime], [F_isValid], [F_UserName], [F_LoginName]) VALUES (N'153552a8-da0e-4e2c-8283-4361521ecda8', N'Login', N'CheckLogin', N'登录日志', N'登录成功', N'1', N'登录', CAST(N'2018-10-30 20:19:49.613' AS DateTime), 1, N'马特', N'admin')
INSERT [dbo].[T_Log] ([F_ID], [F_ControllerName], [F_ActionName], [F_Title], [F_Content], [F_LogType], [F_LogTypeName], [F_WriteTime], [F_isValid], [F_UserName], [F_LoginName]) VALUES (N'1da223cf-f127-4a6c-8840-5a974b4806f0', N'Login', N'CheckLogin', N'登录日志', N'登录成功', N'1', N'登录', CAST(N'2018-10-23 23:23:33.207' AS DateTime), 1, N'20:36', N'admin')
INSERT [dbo].[T_Log] ([F_ID], [F_ControllerName], [F_ActionName], [F_Title], [F_Content], [F_LogType], [F_LogTypeName], [F_WriteTime], [F_isValid], [F_UserName], [F_LoginName]) VALUES (N'32911212-0f0f-425e-a368-5dd2061748b1', N'Login', N'CheckLogin', N'登录日志', N'登录成功', N'1', N'登录', CAST(N'2018-10-23 23:23:52.387' AS DateTime), 1, N'20:36', N'admin')
INSERT [dbo].[T_Log] ([F_ID], [F_ControllerName], [F_ActionName], [F_Title], [F_Content], [F_LogType], [F_LogTypeName], [F_WriteTime], [F_isValid], [F_UserName], [F_LoginName]) VALUES (N'ecd2c1bd-7a7e-41e3-b46e-634f8f286605', N'Login', N'CheckLogin', N'登录日志', N'登录成功', N'1', N'登录', CAST(N'2018-11-03 10:48:13.167' AS DateTime), 1, N'马特', N'admin')
INSERT [dbo].[T_Log] ([F_ID], [F_ControllerName], [F_ActionName], [F_Title], [F_Content], [F_LogType], [F_LogTypeName], [F_WriteTime], [F_isValid], [F_UserName], [F_LoginName]) VALUES (N'eec268eb-f00f-4b29-bbe0-6bc09b958791', N'Login', N'CheckLogin', N'登录日志', N'登录成功', N'1', N'登录', CAST(N'2018-10-31 18:54:54.047' AS DateTime), 1, N'马特', N'admin')
INSERT [dbo].[T_Log] ([F_ID], [F_ControllerName], [F_ActionName], [F_Title], [F_Content], [F_LogType], [F_LogTypeName], [F_WriteTime], [F_isValid], [F_UserName], [F_LoginName]) VALUES (N'ebe6ee36-4a7e-427f-a18b-6f20a23463b8', N'Login', N'CheckLogin', N'登录日志', N'登录成功', N'1', N'登录', CAST(N'2018-10-23 23:03:47.120' AS DateTime), 1, N'20:36', N'admin')
INSERT [dbo].[T_Log] ([F_ID], [F_ControllerName], [F_ActionName], [F_Title], [F_Content], [F_LogType], [F_LogTypeName], [F_WriteTime], [F_isValid], [F_UserName], [F_LoginName]) VALUES (N'0db0cb8d-0439-406e-aa11-76ad16f8e85f', N'Login', N'CheckLogin', N'登录日志', N'登录成功', N'1', N'登录', CAST(N'2018-10-23 22:42:44.957' AS DateTime), 1, N'20:36', N'admin')
INSERT [dbo].[T_Log] ([F_ID], [F_ControllerName], [F_ActionName], [F_Title], [F_Content], [F_LogType], [F_LogTypeName], [F_WriteTime], [F_isValid], [F_UserName], [F_LoginName]) VALUES (N'6b7eac96-cf7e-4451-a9e9-7f1b5e758fe6', N'Login', N'CheckLogin', N'登录日志', N'登录成功', N'1', N'登录', CAST(N'2018-10-26 18:31:29.873' AS DateTime), 1, N'马特', N'admin')
INSERT [dbo].[T_Log] ([F_ID], [F_ControllerName], [F_ActionName], [F_Title], [F_Content], [F_LogType], [F_LogTypeName], [F_WriteTime], [F_isValid], [F_UserName], [F_LoginName]) VALUES (N'444010ed-16b0-44a5-a504-8002341167a5', N'Login', N'CheckLogin', N'登录日志', N'登录成功', N'1', N'登录', CAST(N'2018-10-30 20:21:01.107' AS DateTime), 1, N'马特', N'admin')
INSERT [dbo].[T_Log] ([F_ID], [F_ControllerName], [F_ActionName], [F_Title], [F_Content], [F_LogType], [F_LogTypeName], [F_WriteTime], [F_isValid], [F_UserName], [F_LoginName]) VALUES (N'ddaf9ab6-a44b-4591-84f7-82cc0731cbaf', N'Login', N'CheckLogin', N'登录日志', N'登录成功', N'1', N'登录', CAST(N'2018-10-29 18:56:39.147' AS DateTime), 1, N'马特', N'admin')
INSERT [dbo].[T_Log] ([F_ID], [F_ControllerName], [F_ActionName], [F_Title], [F_Content], [F_LogType], [F_LogTypeName], [F_WriteTime], [F_isValid], [F_UserName], [F_LoginName]) VALUES (N'a7ba36aa-a55c-471d-acb7-86291bac5469', N'Login', N'CheckLogin', N'登录日志', N'退出成功', N'2', N'退出', CAST(N'2018-11-06 19:38:20.413' AS DateTime), 1, N'马特', N'admin')
INSERT [dbo].[T_Log] ([F_ID], [F_ControllerName], [F_ActionName], [F_Title], [F_Content], [F_LogType], [F_LogTypeName], [F_WriteTime], [F_isValid], [F_UserName], [F_LoginName]) VALUES (N'a706e45f-2c41-4880-b704-8c6faf6e1c2d', N'Login', N'CheckLogin', N'登录日志', N'退出成功', N'2', N'退出', CAST(N'2018-10-23 23:24:00.040' AS DateTime), 1, N'20:36', N'admin')
INSERT [dbo].[T_Log] ([F_ID], [F_ControllerName], [F_ActionName], [F_Title], [F_Content], [F_LogType], [F_LogTypeName], [F_WriteTime], [F_isValid], [F_UserName], [F_LoginName]) VALUES (N'a587fb0a-3cb7-457e-9be7-8f3eeb53091f', N'Login', N'CheckLogin', N'登录日志', N'登录成功', N'1', N'登录', CAST(N'2018-10-23 22:44:42.073' AS DateTime), 1, N'20:36', N'admin')
INSERT [dbo].[T_Log] ([F_ID], [F_ControllerName], [F_ActionName], [F_Title], [F_Content], [F_LogType], [F_LogTypeName], [F_WriteTime], [F_isValid], [F_UserName], [F_LoginName]) VALUES (N'f5fc2e31-224a-439f-a308-a49be407d842', N'Login', N'CheckLogin', N'登录日志', N'登录成功', N'1', N'登录', CAST(N'2018-10-22 22:08:14.033' AS DateTime), 1, N'20:36', N'admin')
INSERT [dbo].[T_Log] ([F_ID], [F_ControllerName], [F_ActionName], [F_Title], [F_Content], [F_LogType], [F_LogTypeName], [F_WriteTime], [F_isValid], [F_UserName], [F_LoginName]) VALUES (N'cecb3540-bad5-4700-9118-a5304240a60b', N'Login', N'CheckLogin', N'登录日志', N'登录成功', N'1', N'登录', CAST(N'2018-11-04 16:04:58.567' AS DateTime), 1, N'马特', N'admin')
INSERT [dbo].[T_Log] ([F_ID], [F_ControllerName], [F_ActionName], [F_Title], [F_Content], [F_LogType], [F_LogTypeName], [F_WriteTime], [F_isValid], [F_UserName], [F_LoginName]) VALUES (N'44850748-c14f-4ef0-8e53-baa50989474a', N'Login', N'CheckLogin', N'登录日志', N'登录成功', N'1', N'登录', CAST(N'2018-10-24 19:34:16.923' AS DateTime), 1, N'马特', N'admin')
INSERT [dbo].[T_Log] ([F_ID], [F_ControllerName], [F_ActionName], [F_Title], [F_Content], [F_LogType], [F_LogTypeName], [F_WriteTime], [F_isValid], [F_UserName], [F_LoginName]) VALUES (N'6165f437-2e24-49d7-893c-cc6026eb4ea2', N'Login', N'CheckLogin', N'登录日志', N'登录成功', N'1', N'登录', CAST(N'2018-10-28 14:38:00.447' AS DateTime), 1, N'马特', N'admin')
INSERT [dbo].[T_Log] ([F_ID], [F_ControllerName], [F_ActionName], [F_Title], [F_Content], [F_LogType], [F_LogTypeName], [F_WriteTime], [F_isValid], [F_UserName], [F_LoginName]) VALUES (N'477f7429-2f12-4554-acc7-d7fc89ad1e38', N'Login', N'CheckLogin', N'登录日志', N'登录成功', N'1', N'登录', CAST(N'2018-11-06 19:35:55.870' AS DateTime), 1, N'马特', N'admin')
INSERT [dbo].[T_Log] ([F_ID], [F_ControllerName], [F_ActionName], [F_Title], [F_Content], [F_LogType], [F_LogTypeName], [F_WriteTime], [F_isValid], [F_UserName], [F_LoginName]) VALUES (N'f6d7e1e2-661f-48c2-82c4-d9295718697d', N'Login', N'CheckLogin', N'登录日志', N'退出成功', N'2', N'退出', CAST(N'2018-10-24 18:31:56.453' AS DateTime), 1, N'马特', N'admin')
INSERT [dbo].[T_Log] ([F_ID], [F_ControllerName], [F_ActionName], [F_Title], [F_Content], [F_LogType], [F_LogTypeName], [F_WriteTime], [F_isValid], [F_UserName], [F_LoginName]) VALUES (N'7e43fa01-794f-43d9-b2a4-e7260d059e56', N'Login', N'CheckLogin', N'登录日志', N'登录成功', N'1', N'登录', CAST(N'2018-11-06 19:43:16.517' AS DateTime), 1, N'马特', N'admin')
INSERT [dbo].[T_Log] ([F_ID], [F_ControllerName], [F_ActionName], [F_Title], [F_Content], [F_LogType], [F_LogTypeName], [F_WriteTime], [F_isValid], [F_UserName], [F_LoginName]) VALUES (N'c9cd28b8-05bb-4484-a02c-e8a04238adc7', N'Login', N'CheckLogin', N'登录日志', N'登录成功', N'1', N'登录', CAST(N'2018-11-06 19:45:07.347' AS DateTime), 1, N'马特', N'admin')
INSERT [dbo].[T_Log] ([F_ID], [F_ControllerName], [F_ActionName], [F_Title], [F_Content], [F_LogType], [F_LogTypeName], [F_WriteTime], [F_isValid], [F_UserName], [F_LoginName]) VALUES (N'6aa33104-d24b-4a89-b24e-eb8d12eacfa9', N'Login', N'CheckLogin', N'登录日志', N'登录成功', N'1', N'登录', CAST(N'2018-11-05 21:12:34.037' AS DateTime), 1, N'马特', N'admin')
INSERT [dbo].[T_Log] ([F_ID], [F_ControllerName], [F_ActionName], [F_Title], [F_Content], [F_LogType], [F_LogTypeName], [F_WriteTime], [F_isValid], [F_UserName], [F_LoginName]) VALUES (N'af10d15f-d43d-4428-8a39-f8475393ce03', N'Login', N'CheckLogin', N'登录日志', N'登录成功', N'1', N'登录', CAST(N'2018-11-05 18:12:22.777' AS DateTime), 1, N'马特', N'admin')
INSERT [dbo].[T_Menu] ([F_ID], [F_MenuName], [F_Link], [F_ParentID], [F_Level], [F_Sort], [F_isValid], [F_Remark], [F_isPage], [F_Icon]) VALUES (N'36fbf31a-8404-406b-96f9-136370c53b1f', N'工作任务', N'/CooperativeWork/WorkTask/Index', N'70a41e6a-7d07-452e-a887-75626b6c8a40', 2, 2, 1, N'', 1, N'')
INSERT [dbo].[T_Menu] ([F_ID], [F_MenuName], [F_Link], [F_ParentID], [F_Level], [F_Sort], [F_isValid], [F_Remark], [F_isPage], [F_Icon]) VALUES (N'dc4217c6-1510-4398-87ef-17ff55a124db', N'统计报表', N'/FinancialManage/IncomeStatement/Index', N'2d40186a-50db-4a50-88e8-a6267eb81dc7', 2, 4, 1, N'', 1, N'')
INSERT [dbo].[T_Menu] ([F_ID], [F_MenuName], [F_Link], [F_ParentID], [F_Level], [F_Sort], [F_isValid], [F_Remark], [F_isPage], [F_Icon]) VALUES (N'b93aabf1-3737-412a-9d51-198584c6d6ee', N'角色管理', N'/SystemManage/RoleManage/Index', N'ee56bd0d-aed0-4d79-917d-dcde5241df33', 2, 4, 1, N'', 1, N'')
INSERT [dbo].[T_Menu] ([F_ID], [F_MenuName], [F_Link], [F_ParentID], [F_Level], [F_Sort], [F_isValid], [F_Remark], [F_isPage], [F_Icon]) VALUES (N'5d62c2ba-6e14-4381-be9d-2c66423f5fe4', N'根节点', N'', NULL, 0, 0, 1, N'', 0, N'')
INSERT [dbo].[T_Menu] ([F_ID], [F_MenuName], [F_Link], [F_ParentID], [F_Level], [F_Sort], [F_isValid], [F_Remark], [F_isPage], [F_Icon]) VALUES (N'1c3cce91-2c71-41ef-95eb-3b595b7e5911', N'人事管理', N'#', N'5d62c2ba-6e14-4381-be9d-2c66423f5fe4', 1, 4, 1, N'', 0, N'layui-icon-user')
INSERT [dbo].[T_Menu] ([F_ID], [F_MenuName], [F_Link], [F_ParentID], [F_Level], [F_Sort], [F_isValid], [F_Remark], [F_isPage], [F_Icon]) VALUES (N'654ae684-9a6f-434b-b40f-494c402bea68', N'工资条', N'/PersonalIssue/SalarySheet/Index', N'01eef2db-5a30-42bf-ac1d-f6130aee1764', 2, 2, 1, N'', 1, N'')
INSERT [dbo].[T_Menu] ([F_ID], [F_MenuName], [F_Link], [F_ParentID], [F_Level], [F_Sort], [F_isValid], [F_Remark], [F_isPage], [F_Icon]) VALUES (N'79d81171-6508-4f00-bfdd-5127426c5ada', N'通讯录管理', N'/AdministrativeManage/AddressListManage/Index', N'398bf418-e675-4c4f-964c-f357825a28a2', 2, 2, 1, N'', 1, N'')
INSERT [dbo].[T_Menu] ([F_ID], [F_MenuName], [F_Link], [F_ParentID], [F_Level], [F_Sort], [F_isValid], [F_Remark], [F_isPage], [F_Icon]) VALUES (N'b59ac992-7bb2-4b8e-a98a-5cebe72ae19f', N'权限管理', N'/SystemManage/AuthorityManage/Index', N'ee56bd0d-aed0-4d79-917d-dcde5241df33', 2, 2, 1, N'', 1, N'')
INSERT [dbo].[T_Menu] ([F_ID], [F_MenuName], [F_Link], [F_ParentID], [F_Level], [F_Sort], [F_isValid], [F_Remark], [F_isPage], [F_Icon]) VALUES (N'7353c6bb-840a-45d5-93d8-70c9178269d8', N'参数管理', N'/SystemManage/ParameterManage/Index', N'ee56bd0d-aed0-4d79-917d-dcde5241df33', 2, 6, 1, N'', 1, N'')
INSERT [dbo].[T_Menu] ([F_ID], [F_MenuName], [F_Link], [F_ParentID], [F_Level], [F_Sort], [F_isValid], [F_Remark], [F_isPage], [F_Icon]) VALUES (N'70a41e6a-7d07-452e-a887-75626b6c8a40', N'协同工作', N'#', N'5d62c2ba-6e14-4381-be9d-2c66423f5fe4', 1, 2, 1, N'', 0, N'layui-icon-component')
INSERT [dbo].[T_Menu] ([F_ID], [F_MenuName], [F_Link], [F_ParentID], [F_Level], [F_Sort], [F_isValid], [F_Remark], [F_isPage], [F_Icon]) VALUES (N'25b77c8c-33f3-4371-afe4-779ffec3c1dd', N'部门管理', N'/SystemManage/DepartmentManage/Index', N'ee56bd0d-aed0-4d79-917d-dcde5241df33', 2, 1, 1, N'', 1, N'')
INSERT [dbo].[T_Menu] ([F_ID], [F_MenuName], [F_Link], [F_ParentID], [F_Level], [F_Sort], [F_isValid], [F_Remark], [F_isPage], [F_Icon]) VALUES (N'6ef0890a-0519-48d9-b859-80978b574350', N'日志管理', N'/SystemManage/Log/Index', N'ee56bd0d-aed0-4d79-917d-dcde5241df33', 2, 1, 1, N'', 1, N'')
INSERT [dbo].[T_Menu] ([F_ID], [F_MenuName], [F_Link], [F_ParentID], [F_Level], [F_Sort], [F_isValid], [F_Remark], [F_isPage], [F_Icon]) VALUES (N'4da919dc-ea28-438a-b86d-81876ac008ee', N'收入管理', N'/FinancialManage/IncomeManage/Index', N'2d40186a-50db-4a50-88e8-a6267eb81dc7', 2, 3, 1, N'', 1, N'')
INSERT [dbo].[T_Menu] ([F_ID], [F_MenuName], [F_Link], [F_ParentID], [F_Level], [F_Sort], [F_isValid], [F_Remark], [F_isPage], [F_Icon]) VALUES (N'96055579-f9f9-4121-b72d-8259bdd91f76', N'公告管理', N'/AdministrativeManage/NoticeManage/Index', N'398bf418-e675-4c4f-964c-f357825a28a2', 2, 1, 1, N'', 1, N'')
INSERT [dbo].[T_Menu] ([F_ID], [F_MenuName], [F_Link], [F_ParentID], [F_Level], [F_Sort], [F_isValid], [F_Remark], [F_isPage], [F_Icon]) VALUES (N'01f7c187-63fb-4ce1-81c5-86724b0ed5cc', N'模块管理', N'/SystemManage/ModuleManage/Index', N'ee56bd0d-aed0-4d79-917d-dcde5241df33', 2, 3, 1, N'', 1, N'')
INSERT [dbo].[T_Menu] ([F_ID], [F_MenuName], [F_Link], [F_ParentID], [F_Level], [F_Sort], [F_isValid], [F_Remark], [F_isPage], [F_Icon]) VALUES (N'67730bb4-7045-4855-939a-87db12c54c90', N'基础数据管理', N'/SystemManage/BaseDataManage/Index', N'ee56bd0d-aed0-4d79-917d-dcde5241df33', 2, 5, 1, N'', 1, N'')
INSERT [dbo].[T_Menu] ([F_ID], [F_MenuName], [F_Link], [F_ParentID], [F_Level], [F_Sort], [F_isValid], [F_Remark], [F_isPage], [F_Icon]) VALUES (N'75ddd25d-c65e-4db2-85e3-8ef069010592', N'工资条录入', N'/FinancialManage/SalarySheetEntry/Index', N'2d40186a-50db-4a50-88e8-a6267eb81dc7', 2, 1, 1, N'', 1, N'')
INSERT [dbo].[T_Menu] ([F_ID], [F_MenuName], [F_Link], [F_ParentID], [F_Level], [F_Sort], [F_isValid], [F_Remark], [F_isPage], [F_Icon]) VALUES (N'e043d20d-732b-44d5-bf2e-95373329262b', N'人事档案', N'/PersonnelManage/PersonnelArchives/Index', N'1c3cce91-2c71-41ef-95eb-3b595b7e5911', 2, 1, 1, N'', 1, N'')
INSERT [dbo].[T_Menu] ([F_ID], [F_MenuName], [F_Link], [F_ParentID], [F_Level], [F_Sort], [F_isValid], [F_Remark], [F_isPage], [F_Icon]) VALUES (N'2d40186a-50db-4a50-88e8-a6267eb81dc7', N'财务管理', N'#', N'5d62c2ba-6e14-4381-be9d-2c66423f5fe4', 1, 5, 1, N'', 0, N'layui-icon-senior')
INSERT [dbo].[T_Menu] ([F_ID], [F_MenuName], [F_Link], [F_ParentID], [F_Level], [F_Sort], [F_isValid], [F_Remark], [F_isPage], [F_Icon]) VALUES (N'53fa95bf-a187-41f7-9b2b-b970c864b567', N'支出管理', N'/FinancialManage/ExpendManage/Index', N'2d40186a-50db-4a50-88e8-a6267eb81dc7', 2, 2, 1, N'', 1, N'')
INSERT [dbo].[T_Menu] ([F_ID], [F_MenuName], [F_Link], [F_ParentID], [F_Level], [F_Sort], [F_isValid], [F_Remark], [F_isPage], [F_Icon]) VALUES (N'3a3d5741-6300-4cbb-8188-c1ab01c304d7', N'薪酬管理', N'/PersonnelManage/SalaryManage/Index', N'1c3cce91-2c71-41ef-95eb-3b595b7e5911', 2, 2, 1, N'', 1, N'')
INSERT [dbo].[T_Menu] ([F_ID], [F_MenuName], [F_Link], [F_ParentID], [F_Level], [F_Sort], [F_isValid], [F_Remark], [F_isPage], [F_Icon]) VALUES (N'204b2e57-ad28-4ff1-a7f7-c89d28b7a081', N'工作日志', N'/CooperativeWork/WorkRecord/Index', N'70a41e6a-7d07-452e-a887-75626b6c8a40', 2, 1, 1, N'', 1, N'')
INSERT [dbo].[T_Menu] ([F_ID], [F_MenuName], [F_Link], [F_ParentID], [F_Level], [F_Sort], [F_isValid], [F_Remark], [F_isPage], [F_Icon]) VALUES (N'03cc6d23-7f96-49ea-a89b-d7567b389d24', N'公告', N'/PersonalIssue/Notice/Index', N'01eef2db-5a30-42bf-ac1d-f6130aee1764', 2, 1, 1, N'', 1, N'')
INSERT [dbo].[T_Menu] ([F_ID], [F_MenuName], [F_Link], [F_ParentID], [F_Level], [F_Sort], [F_isValid], [F_Remark], [F_isPage], [F_Icon]) VALUES (N'ee56bd0d-aed0-4d79-917d-dcde5241df33', N'系统管理', N'#', N'5d62c2ba-6e14-4381-be9d-2c66423f5fe4', 1, 9, 1, N'', 0, N'layui-icon-set')
INSERT [dbo].[T_Menu] ([F_ID], [F_MenuName], [F_Link], [F_ParentID], [F_Level], [F_Sort], [F_isValid], [F_Remark], [F_isPage], [F_Icon]) VALUES (N'a1a75880-48f4-4b0f-ba38-dd64e8fac98e', N'工作任务查询', N'/AdministrativeManage/WorkTaskQuery/Index', N'398bf418-e675-4c4f-964c-f357825a28a2', 2, 4, 1, N'', 1, N'')
INSERT [dbo].[T_Menu] ([F_ID], [F_MenuName], [F_Link], [F_ParentID], [F_Level], [F_Sort], [F_isValid], [F_Remark], [F_isPage], [F_Icon]) VALUES (N'caa566f2-ab90-490c-beca-f2d04e249311', N'通讯录', N'/PersonalIssue/AddressList/Index', N'01eef2db-5a30-42bf-ac1d-f6130aee1764', 2, 3, 1, N'', 1, N'')
INSERT [dbo].[T_Menu] ([F_ID], [F_MenuName], [F_Link], [F_ParentID], [F_Level], [F_Sort], [F_isValid], [F_Remark], [F_isPage], [F_Icon]) VALUES (N'398bf418-e675-4c4f-964c-f357825a28a2', N'行政管理', N'#', N'5d62c2ba-6e14-4381-be9d-2c66423f5fe4', 1, 3, 1, N'', 0, N'layui-icon-template')
INSERT [dbo].[T_Menu] ([F_ID], [F_MenuName], [F_Link], [F_ParentID], [F_Level], [F_Sort], [F_isValid], [F_Remark], [F_isPage], [F_Icon]) VALUES (N'01eef2db-5a30-42bf-ac1d-f6130aee1764', N'个人事务', N'#', N'5d62c2ba-6e14-4381-be9d-2c66423f5fe4', 1, 1, 1, N'', 0, N'layui-icon-home')
INSERT [dbo].[T_Menu] ([F_ID], [F_MenuName], [F_Link], [F_ParentID], [F_Level], [F_Sort], [F_isValid], [F_Remark], [F_isPage], [F_Icon]) VALUES (N'0c6e055c-2439-48ae-8c84-fd32fa4137ed', N'工作日志查询', N'/AdministrativeManage/WorkRecordQuery/Index', N'398bf418-e675-4c4f-964c-f357825a28a2', 2, 3, 1, N'', 1, N'')
INSERT [dbo].[T_Role] ([F_ID], [F_RoleName], [F_RoleType], [F_RoleTypeName], [F_isValid], [F_Remark]) VALUES (N'03383fa0-765b-4c68-b9e8-747e715d193a', N'管理员', N'', N'', 1, N'')
INSERT [dbo].[T_Role] ([F_ID], [F_RoleName], [F_RoleType], [F_RoleTypeName], [F_isValid], [F_Remark]) VALUES (N'8b4c27c8-e600-4b71-a90d-f27c966543d5', N'系统管理员', N'', N'', 1, N'')
INSERT [dbo].[T_RoleMenu] ([F_ID], [F_RoleID], [F_MenuID]) VALUES (N'39aa7ce6-3f7c-4676-aec5-06a0ab4e0663', N'8b4c27c8-e600-4b71-a90d-f27c966543d5', N'79d81171-6508-4f00-bfdd-5127426c5ada')
INSERT [dbo].[T_RoleMenu] ([F_ID], [F_RoleID], [F_MenuID]) VALUES (N'7c31a491-9b30-426d-b49e-0e0483070920', N'8b4c27c8-e600-4b71-a90d-f27c966543d5', N'a1a75880-48f4-4b0f-ba38-dd64e8fac98e')
INSERT [dbo].[T_RoleMenu] ([F_ID], [F_RoleID], [F_MenuID]) VALUES (N'5d90fcf9-3daa-49d6-bbec-1b3e72b8b022', N'8b4c27c8-e600-4b71-a90d-f27c966543d5', N'caa566f2-ab90-490c-beca-f2d04e249311')
INSERT [dbo].[T_RoleMenu] ([F_ID], [F_RoleID], [F_MenuID]) VALUES (N'b17f5456-e37d-48da-a9a1-3186a1357cfd', N'8b4c27c8-e600-4b71-a90d-f27c966543d5', N'e043d20d-732b-44d5-bf2e-95373329262b')
INSERT [dbo].[T_RoleMenu] ([F_ID], [F_RoleID], [F_MenuID]) VALUES (N'c2b57bd8-4557-4fab-acec-335522e5073b', N'8b4c27c8-e600-4b71-a90d-f27c966543d5', N'2d40186a-50db-4a50-88e8-a6267eb81dc7')
INSERT [dbo].[T_RoleMenu] ([F_ID], [F_RoleID], [F_MenuID]) VALUES (N'a293a25f-aa5a-47b5-a624-3dd781354460', N'8b4c27c8-e600-4b71-a90d-f27c966543d5', N'01f7c187-63fb-4ce1-81c5-86724b0ed5cc')
INSERT [dbo].[T_RoleMenu] ([F_ID], [F_RoleID], [F_MenuID]) VALUES (N'000cfaa8-8c8d-483b-a1de-538ce1073ec8', N'8b4c27c8-e600-4b71-a90d-f27c966543d5', N'1c3cce91-2c71-41ef-95eb-3b595b7e5911')
INSERT [dbo].[T_RoleMenu] ([F_ID], [F_RoleID], [F_MenuID]) VALUES (N'17bfc75d-586c-497b-b4da-57e5e8cf00af', N'8b4c27c8-e600-4b71-a90d-f27c966543d5', N'dc4217c6-1510-4398-87ef-17ff55a124db')
INSERT [dbo].[T_RoleMenu] ([F_ID], [F_RoleID], [F_MenuID]) VALUES (N'34007e67-24e2-43a7-89eb-58646d0904de', N'8b4c27c8-e600-4b71-a90d-f27c966543d5', N'b93aabf1-3737-412a-9d51-198584c6d6ee')
INSERT [dbo].[T_RoleMenu] ([F_ID], [F_RoleID], [F_MenuID]) VALUES (N'a4ff7ac3-a444-463b-b6ef-5c3b0f4a39a3', N'8b4c27c8-e600-4b71-a90d-f27c966543d5', N'7353c6bb-840a-45d5-93d8-70c9178269d8')
INSERT [dbo].[T_RoleMenu] ([F_ID], [F_RoleID], [F_MenuID]) VALUES (N'5eb54416-07ff-42f0-b712-6230012b93b1', N'8b4c27c8-e600-4b71-a90d-f27c966543d5', N'204b2e57-ad28-4ff1-a7f7-c89d28b7a081')
INSERT [dbo].[T_RoleMenu] ([F_ID], [F_RoleID], [F_MenuID]) VALUES (N'099bbec5-2e89-49c7-b842-6ec6c7a9da07', N'8b4c27c8-e600-4b71-a90d-f27c966543d5', N'36fbf31a-8404-406b-96f9-136370c53b1f')
INSERT [dbo].[T_RoleMenu] ([F_ID], [F_RoleID], [F_MenuID]) VALUES (N'f9a8fe68-5f6e-4b69-96b3-71ae9e820c33', N'8b4c27c8-e600-4b71-a90d-f27c966543d5', N'398bf418-e675-4c4f-964c-f357825a28a2')
INSERT [dbo].[T_RoleMenu] ([F_ID], [F_RoleID], [F_MenuID]) VALUES (N'b779920e-f9bb-4ce3-b342-780ac7cec9e6', N'8b4c27c8-e600-4b71-a90d-f27c966543d5', N'b59ac992-7bb2-4b8e-a98a-5cebe72ae19f')
INSERT [dbo].[T_RoleMenu] ([F_ID], [F_RoleID], [F_MenuID]) VALUES (N'ad3dff39-c1dd-42d9-bf0a-8c1757afe165', N'8b4c27c8-e600-4b71-a90d-f27c966543d5', N'6ef0890a-0519-48d9-b859-80978b574350')
INSERT [dbo].[T_RoleMenu] ([F_ID], [F_RoleID], [F_MenuID]) VALUES (N'2754bc10-1922-452e-998b-93d158f099bb', N'8b4c27c8-e600-4b71-a90d-f27c966543d5', N'75ddd25d-c65e-4db2-85e3-8ef069010592')
INSERT [dbo].[T_RoleMenu] ([F_ID], [F_RoleID], [F_MenuID]) VALUES (N'4bd35cf0-e9b7-4c8a-a643-a1ce77bbfd5a', N'8b4c27c8-e600-4b71-a90d-f27c966543d5', N'96055579-f9f9-4121-b72d-8259bdd91f76')
INSERT [dbo].[T_RoleMenu] ([F_ID], [F_RoleID], [F_MenuID]) VALUES (N'3038a6d9-df96-46a0-9d5a-a3ebbd41dfa8', N'8b4c27c8-e600-4b71-a90d-f27c966543d5', N'01eef2db-5a30-42bf-ac1d-f6130aee1764')
INSERT [dbo].[T_RoleMenu] ([F_ID], [F_RoleID], [F_MenuID]) VALUES (N'38c68347-20ae-481f-b57d-a4836984645d', N'8b4c27c8-e600-4b71-a90d-f27c966543d5', N'ee56bd0d-aed0-4d79-917d-dcde5241df33')
INSERT [dbo].[T_RoleMenu] ([F_ID], [F_RoleID], [F_MenuID]) VALUES (N'66e3301b-65e7-4a36-be88-ab1d06c073e0', N'8b4c27c8-e600-4b71-a90d-f27c966543d5', N'654ae684-9a6f-434b-b40f-494c402bea68')
INSERT [dbo].[T_RoleMenu] ([F_ID], [F_RoleID], [F_MenuID]) VALUES (N'089dc5d9-1b95-4011-bc5e-ad29654c849c', N'8b4c27c8-e600-4b71-a90d-f27c966543d5', N'03cc6d23-7f96-49ea-a89b-d7567b389d24')
INSERT [dbo].[T_RoleMenu] ([F_ID], [F_RoleID], [F_MenuID]) VALUES (N'b1b4da43-7c0a-4899-ac33-c183a122c372', N'8b4c27c8-e600-4b71-a90d-f27c966543d5', N'3a3d5741-6300-4cbb-8188-c1ab01c304d7')
INSERT [dbo].[T_RoleMenu] ([F_ID], [F_RoleID], [F_MenuID]) VALUES (N'c64ba4c2-d71f-43f4-9803-cf8761d3c9f2', N'8b4c27c8-e600-4b71-a90d-f27c966543d5', N'70a41e6a-7d07-452e-a887-75626b6c8a40')
INSERT [dbo].[T_RoleMenu] ([F_ID], [F_RoleID], [F_MenuID]) VALUES (N'079c41a4-b51e-4020-accf-d42aa81d2096', N'8b4c27c8-e600-4b71-a90d-f27c966543d5', N'4da919dc-ea28-438a-b86d-81876ac008ee')
INSERT [dbo].[T_RoleMenu] ([F_ID], [F_RoleID], [F_MenuID]) VALUES (N'dc050a14-1cb7-4db8-af14-d63049a43330', N'8b4c27c8-e600-4b71-a90d-f27c966543d5', N'53fa95bf-a187-41f7-9b2b-b970c864b567')
INSERT [dbo].[T_RoleMenu] ([F_ID], [F_RoleID], [F_MenuID]) VALUES (N'68d9f95a-b1cd-452c-92ac-da5a61fe29bb', N'8b4c27c8-e600-4b71-a90d-f27c966543d5', N'25b77c8c-33f3-4371-afe4-779ffec3c1dd')
INSERT [dbo].[T_RoleMenu] ([F_ID], [F_RoleID], [F_MenuID]) VALUES (N'27ee4870-75cd-40cb-b9cf-eb6dd4ed1a06', N'8b4c27c8-e600-4b71-a90d-f27c966543d5', N'67730bb4-7045-4855-939a-87db12c54c90')
INSERT [dbo].[T_RoleMenu] ([F_ID], [F_RoleID], [F_MenuID]) VALUES (N'2e99581e-e2f9-4ae9-9f80-ebd76a82dd5d', N'8b4c27c8-e600-4b71-a90d-f27c966543d5', N'0c6e055c-2439-48ae-8c84-fd32fa4137ed')
INSERT [dbo].[T_User] ([F_ID], [F_UserName], [F_LoginName], [F_Password], [F_isValid], [F_Remark]) VALUES (N'259e4c58-6719-4896-904c-f090e3f45514', N'马特', N'admin', N'67214ad3095e80274f96c8a7ff157032', 1, NULL)
INSERT [dbo].[T_UserRole] ([F_ID], [F_UserID], [F_RoleID], [F_isValid]) VALUES (N'64977bbf-c717-4ef0-ba87-25ac32c7edc8', N'259e4c58-6719-4896-904c-f090e3f45514', N'8b4c27c8-e600-4b71-a90d-f27c966543d5', 1)
/****** Object:  StoredProcedure [dbo].[Proc_GetDataItemList]    Script Date: 2018/11/6 22:09:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author>
-- Create date: <2018-11-03>
-- Description:	<获取字典列表>
-- =============================================
CREATE PROCEDURE [dbo].[Proc_GetDataItemList]
	@sqlWhere varchar(max),--查询条件                             
	@orderSort varchar(1000),--排序规则
	@StartIndex varchar(100),--开始索引
	@EndIndex varchar(100)--结束索引
AS
BEGIN
	DECLARE @sqlQuery varchar(max)--查询语句  

	 SET @sqlQuery=  
		'  
		;with tempWith AS
		(    
			select * 
			from T_DataItem
			where 1=1' + @sqlWhere + '  
		)                                                             
		select *                                  
		into #tempTable                                
		FROM 
		(                                      
		select (select count(0) from tempWith) as TotalNumber,ROW_NUMBER() OVER(ORDER BY '+@ordersort+') SerialNumber,*                                       
		FROM tempWith                                    
		)temp                            
	   where  SerialNumber between '+@StartIndex+' and '+@EndIndex+' order by SerialNumber asc ;   
	   select * from #tempTable  order by SerialNumber                           
		drop table #tempTable      
		';  

	--PRINT @sqlQuery;  
	EXEC (@sqlQuery);  
END

GO
/****** Object:  StoredProcedure [dbo].[Proc_GetLogList]    Script Date: 2018/11/6 22:09:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author>
-- Create date: <2018-10-31>
-- Description:	<获取日志列表>
-- =============================================
CREATE PROCEDURE [dbo].[Proc_GetLogList]
	@sqlWhere varchar(max),--查询条件                             
	@orderSort varchar(1000),--排序规则
	@StartIndex varchar(100),--开始索引
	@EndIndex varchar(100)--结束索引
AS
BEGIN
	DECLARE @sqlQuery varchar(max)--查询语句  

	 SET @sqlQuery=  
		'  
		;with tempWith AS
		(    
			select * 
			from T_Log
			where 1=1' + @sqlWhere + '  
		)                                                             
		select *                                  
		into #tempTable                                
		FROM 
		(                                      
		select (select count(0) from tempWith) as TotalNumber,ROW_NUMBER() OVER(ORDER BY '+@ordersort+') SerialNumber,*                                       
		FROM tempWith                                    
		)temp                            
	   where  SerialNumber between '+@StartIndex+' and '+@EndIndex+' order by SerialNumber asc ;   
	   select * from #tempTable  order by SerialNumber                           
		drop table #tempTable      
		';  

	--PRINT @sqlQuery;  
	EXEC (@sqlQuery);  
END

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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_DataItem', @level2type=N'COLUMN',@level2name=N'F_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_DataItem', @level2type=N'COLUMN',@level2name=N'F_ItemCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_DataItem', @level2type=N'COLUMN',@level2name=N'F_ItemName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_DataItem', @level2type=N'COLUMN',@level2name=N'F_Sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_DataItem', @level2type=N'COLUMN',@level2name=N'F_isValid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_DataItem', @level2type=N'COLUMN',@level2name=N'F_Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'录入人编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_DataItem', @level2type=N'COLUMN',@level2name=N'F_AddUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'录入人姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_DataItem', @level2type=N'COLUMN',@level2name=N'F_AddUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'录入时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_DataItem', @level2type=N'COLUMN',@level2name=N'F_AddTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_DataItem', @level2type=N'COLUMN',@level2name=N'F_UpdateUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_DataItem', @level2type=N'COLUMN',@level2name=N'F_UpdateUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_DataItem', @level2type=N'COLUMN',@level2name=N'F_UpdateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否可用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_DataItem', @level2type=N'COLUMN',@level2name=N'F_isEnable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'助记码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_DataItem', @level2type=N'COLUMN',@level2name=N'F_HelpCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'录入人编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_DataItemDetail', @level2type=N'COLUMN',@level2name=N'F_AddUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'录入人姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_DataItemDetail', @level2type=N'COLUMN',@level2name=N'F_AddUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'录入时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_DataItemDetail', @level2type=N'COLUMN',@level2name=N'F_AddTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_DataItemDetail', @level2type=N'COLUMN',@level2name=N'F_UpdateUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_DataItemDetail', @level2type=N'COLUMN',@level2name=N'F_UpdateUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_DataItemDetail', @level2type=N'COLUMN',@level2name=N'F_UpdateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否可用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_DataItemDetail', @level2type=N'COLUMN',@level2name=N'F_isEnable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_Department', @level2type=N'COLUMN',@level2name=N'F_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部门名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_Department', @level2type=N'COLUMN',@level2name=N'F_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父级部门编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_Department', @level2type=N'COLUMN',@level2name=N'F_ParentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_Department', @level2type=N'COLUMN',@level2name=N'F_isValid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_Department', @level2type=N'COLUMN',@level2name=N'F_Remark'
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
