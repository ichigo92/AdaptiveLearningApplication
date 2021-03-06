USE [master]
GO
/****** Object:  Database [AdaptiveLearningApplication]    Script Date: 06/16/2016 10:50:19 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'AdaptiveLearningApplication')
BEGIN
CREATE DATABASE [AdaptiveLearningApplication] ON  PRIMARY 
( NAME = N'AdaptiveLearningApplication', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\AdaptiveLearningApplication.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AdaptiveLearningApplication_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\AdaptiveLearningApplication_log.LDF' , SIZE = 504KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END
GO
ALTER DATABASE [AdaptiveLearningApplication] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AdaptiveLearningApplication].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AdaptiveLearningApplication] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [AdaptiveLearningApplication] SET ANSI_NULLS OFF
GO
ALTER DATABASE [AdaptiveLearningApplication] SET ANSI_PADDING OFF
GO
ALTER DATABASE [AdaptiveLearningApplication] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [AdaptiveLearningApplication] SET ARITHABORT OFF
GO
ALTER DATABASE [AdaptiveLearningApplication] SET AUTO_CLOSE ON
GO
ALTER DATABASE [AdaptiveLearningApplication] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [AdaptiveLearningApplication] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [AdaptiveLearningApplication] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [AdaptiveLearningApplication] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [AdaptiveLearningApplication] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [AdaptiveLearningApplication] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [AdaptiveLearningApplication] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [AdaptiveLearningApplication] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [AdaptiveLearningApplication] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [AdaptiveLearningApplication] SET  ENABLE_BROKER
GO
ALTER DATABASE [AdaptiveLearningApplication] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [AdaptiveLearningApplication] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [AdaptiveLearningApplication] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [AdaptiveLearningApplication] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [AdaptiveLearningApplication] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [AdaptiveLearningApplication] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [AdaptiveLearningApplication] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [AdaptiveLearningApplication] SET  READ_WRITE
GO
ALTER DATABASE [AdaptiveLearningApplication] SET RECOVERY SIMPLE
GO
ALTER DATABASE [AdaptiveLearningApplication] SET  MULTI_USER
GO
ALTER DATABASE [AdaptiveLearningApplication] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [AdaptiveLearningApplication] SET DB_CHAINING OFF
GO
USE [AdaptiveLearningApplication]
GO
/****** Object:  Table [dbo].[webpages_Roles]    Script Date: 06/16/2016 10:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[webpages_Roles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[webpages_Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[webpages_Roles] ON
INSERT [dbo].[webpages_Roles] ([RoleId], [RoleName]) VALUES (1, N'admin')
INSERT [dbo].[webpages_Roles] ([RoleId], [RoleName]) VALUES (2, N'student')
INSERT [dbo].[webpages_Roles] ([RoleId], [RoleName]) VALUES (3, N'teacher')
SET IDENTITY_INSERT [dbo].[webpages_Roles] OFF
/****** Object:  Table [dbo].[webpages_OAuthMembership]    Script Date: 06/16/2016 10:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[webpages_OAuthMembership]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[webpages_OAuthMembership](
	[Provider] [nvarchar](30) NOT NULL,
	[ProviderUserId] [nvarchar](100) NOT NULL,
	[UserId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Provider] ASC,
	[ProviderUserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[webpages_Membership]    Script Date: 06/16/2016 10:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[webpages_Membership]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[webpages_Membership](
	[UserId] [int] NOT NULL,
	[CreateDate] [datetime] NULL,
	[ConfirmationToken] [nvarchar](128) NULL,
	[IsConfirmed] [bit] NULL,
	[LastPasswordFailureDate] [datetime] NULL,
	[PasswordFailuresSinceLastSuccess] [int] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordChangedDate] [datetime] NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[PasswordVerificationToken] [nvarchar](128) NULL,
	[PasswordVerificationTokenExpirationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (1, CAST(0x0000A62600FBFD01 AS DateTime), NULL, 1, NULL, 0, N'ANUTMPldQgDo5VAerC8LSZJseG8EM4obRPUKVYSpDkdwsHI8TkGc3XSXNUhjYGBXwg==', CAST(0x0000A62600FBFD01 AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (3, CAST(0x0000A62600FFD2BE AS DateTime), NULL, 1, NULL, 0, N'AI7UXBBHzVKxIWna6vPrw8tcqbr4Jmt55qizwITPioRTIhDpI7uedM7KFaQsfrchvg==', CAST(0x0000A62600FFD2BE AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (4, CAST(0x0000A62601044CB2 AS DateTime), NULL, 1, NULL, 0, N'AFchdbnHsH3SDvCzOqdnd0Oq+3psedQvgHubKSOBK3uSLI+GyYVPcvVFBF7Tu+PD4w==', CAST(0x0000A62601044CB2 AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (5, CAST(0x0000A6260104EB02 AS DateTime), NULL, 1, CAST(0x0000A62601055A76 AS DateTime), 0, N'AMY0usOMnrZTZUa3OZsp2KZ2VOmW6D9YlvlsGmnMBategewuXzQXDy7UayksbAgRLg==', CAST(0x0000A6260104EB02 AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (6, CAST(0x0000A6260105A8B4 AS DateTime), NULL, 1, NULL, 0, N'AHFMIIIBokPCcKWbqjHDCyqG/kA4fLesuQh2IaCqO3R41YgQkzw5izMdmGCmTW2S6g==', CAST(0x0000A6260105A8B4 AS DateTime), N'', NULL, NULL)
/****** Object:  Table [dbo].[UserProfile]    Script Date: 06/16/2016 10:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserProfile]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserProfile](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[LoginType] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[UserProfile] ON
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Email], [LoginType]) VALUES (1, N'yosh', NULL, NULL, NULL, NULL)
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Email], [LoginType]) VALUES (2, N'adminsds', NULL, NULL, NULL, NULL)
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Email], [LoginType]) VALUES (3, N'qwerty', NULL, NULL, NULL, NULL)
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Email], [LoginType]) VALUES (4, N'admin', NULL, NULL, NULL, NULL)
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Email], [LoginType]) VALUES (5, N'john', NULL, NULL, NULL, NULL)
INSERT [dbo].[UserProfile] ([UserId], [UserName], [FirstName], [LastName], [Email], [LoginType]) VALUES (6, N'billy', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[UserProfile] OFF
/****** Object:  Table [dbo].[webpages_UsersInRoles]    Script Date: 06/16/2016 10:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[webpages_UsersInRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[webpages_UsersInRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (2, 1)
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (4, 1)
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (5, 3)
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (6, 2)
/****** Object:  Default [DF__webpages___IsCon__08EA5793]    Script Date: 06/16/2016 10:50:19 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__webpages___IsCon__08EA5793]') AND parent_object_id = OBJECT_ID(N'[dbo].[webpages_Membership]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__webpages___IsCon__08EA5793]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[webpages_Membership] ADD  DEFAULT ((0)) FOR [IsConfirmed]
END


End
GO
/****** Object:  Default [DF__webpages___Passw__09DE7BCC]    Script Date: 06/16/2016 10:50:19 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__webpages___Passw__09DE7BCC]') AND parent_object_id = OBJECT_ID(N'[dbo].[webpages_Membership]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__webpages___Passw__09DE7BCC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[webpages_Membership] ADD  DEFAULT ((0)) FOR [PasswordFailuresSinceLastSuccess]
END


End
GO
/****** Object:  ForeignKey [fk_RoleId]    Script Date: 06/16/2016 10:50:19 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[webpages_UsersInRoles]'))
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[webpages_Roles] ([RoleId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[webpages_UsersInRoles]'))
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_RoleId]
GO
/****** Object:  ForeignKey [fk_UserId]    Script Date: 06/16/2016 10:50:19 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[webpages_UsersInRoles]'))
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[webpages_UsersInRoles]'))
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_UserId]
GO
