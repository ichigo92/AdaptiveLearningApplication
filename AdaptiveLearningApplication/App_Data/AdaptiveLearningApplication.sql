USE [master]
GO
/****** Object:  Database [AdaptiveLearningApplication.Models.AdaptiveLearningContext]    Script Date: 06/10/2016 00:31:53 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'AdaptiveLearningApplication.Models.AdaptiveLearningContext')
BEGIN
CREATE DATABASE [AdaptiveLearningApplication.Models.AdaptiveLearningContext] ON  PRIMARY 
( NAME = N'AdaptiveLearningApplication.Models.AdaptiveLearningContext', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\AdaptiveLearningApplication.Models.AdaptiveLearningContext.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AdaptiveLearningApplication.Models.AdaptiveLearningContext_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\AdaptiveLearningApplication.Models.AdaptiveLearningContext_log.LDF' , SIZE = 504KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END
GO
ALTER DATABASE [AdaptiveLearningApplication.Models.AdaptiveLearningContext] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AdaptiveLearningApplication.Models.AdaptiveLearningContext].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AdaptiveLearningApplication.Models.AdaptiveLearningContext] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [AdaptiveLearningApplication.Models.AdaptiveLearningContext] SET ANSI_NULLS OFF
GO
ALTER DATABASE [AdaptiveLearningApplication.Models.AdaptiveLearningContext] SET ANSI_PADDING OFF
GO
ALTER DATABASE [AdaptiveLearningApplication.Models.AdaptiveLearningContext] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [AdaptiveLearningApplication.Models.AdaptiveLearningContext] SET ARITHABORT OFF
GO
ALTER DATABASE [AdaptiveLearningApplication.Models.AdaptiveLearningContext] SET AUTO_CLOSE ON
GO
ALTER DATABASE [AdaptiveLearningApplication.Models.AdaptiveLearningContext] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [AdaptiveLearningApplication.Models.AdaptiveLearningContext] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [AdaptiveLearningApplication.Models.AdaptiveLearningContext] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [AdaptiveLearningApplication.Models.AdaptiveLearningContext] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [AdaptiveLearningApplication.Models.AdaptiveLearningContext] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [AdaptiveLearningApplication.Models.AdaptiveLearningContext] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [AdaptiveLearningApplication.Models.AdaptiveLearningContext] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [AdaptiveLearningApplication.Models.AdaptiveLearningContext] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [AdaptiveLearningApplication.Models.AdaptiveLearningContext] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [AdaptiveLearningApplication.Models.AdaptiveLearningContext] SET  ENABLE_BROKER
GO
ALTER DATABASE [AdaptiveLearningApplication.Models.AdaptiveLearningContext] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [AdaptiveLearningApplication.Models.AdaptiveLearningContext] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [AdaptiveLearningApplication.Models.AdaptiveLearningContext] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [AdaptiveLearningApplication.Models.AdaptiveLearningContext] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [AdaptiveLearningApplication.Models.AdaptiveLearningContext] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [AdaptiveLearningApplication.Models.AdaptiveLearningContext] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [AdaptiveLearningApplication.Models.AdaptiveLearningContext] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [AdaptiveLearningApplication.Models.AdaptiveLearningContext] SET  READ_WRITE
GO
ALTER DATABASE [AdaptiveLearningApplication.Models.AdaptiveLearningContext] SET RECOVERY SIMPLE
GO
ALTER DATABASE [AdaptiveLearningApplication.Models.AdaptiveLearningContext] SET  MULTI_USER
GO
ALTER DATABASE [AdaptiveLearningApplication.Models.AdaptiveLearningContext] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [AdaptiveLearningApplication.Models.AdaptiveLearningContext] SET DB_CHAINING OFF
GO
USE [AdaptiveLearningApplication.Models.AdaptiveLearningContext]
GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 06/10/2016 00:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Teachers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Teachers](
	[TeacherID] [int] IDENTITY(1,1) NOT NULL,
	[TeacherFirstName] [nvarchar](max) NOT NULL,
	[TeacherLastName] [nvarchar](max) NOT NULL,
	[TeacherAge] [int] NOT NULL,
	[TeacherGender] [nvarchar](max) NOT NULL,
	[TeacherSubject] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Teachers] PRIMARY KEY CLUSTERED 
(
	[TeacherID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Teachers] ON
INSERT [dbo].[Teachers] ([TeacherID], [TeacherFirstName], [TeacherLastName], [TeacherAge], [TeacherGender], [TeacherSubject]) VALUES (2, N'Teacher', N'Super', 50, N'Female', N'Software Engineering')
SET IDENTITY_INSERT [dbo].[Teachers] OFF
/****** Object:  Table [dbo].[QuizModels]    Script Date: 06/10/2016 00:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QuizModels]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QuizModels](
	[QuizID] [int] IDENTITY(1,1) NOT NULL,
	[QuizName] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[NumberOfQuestions] [int] NOT NULL,
	[HighestMarks] [int] NOT NULL,
	[Duration] [nvarchar](max) NOT NULL,
	[CreatedBy] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.QuizModels] PRIMARY KEY CLUSTERED 
(
	[QuizID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[QuizModels] ON
INSERT [dbo].[QuizModels] ([QuizID], [QuizName], [CreatedDate], [NumberOfQuestions], [HighestMarks], [Duration], [CreatedBy]) VALUES (1, N'First Quiz', CAST(0x0000A67900000000 AS DateTime), 6, 20, N'01:00', N'Admin')
SET IDENTITY_INSERT [dbo].[QuizModels] OFF
/****** Object:  Table [dbo].[QuestionPoolModels]    Script Date: 06/10/2016 00:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QuestionPoolModels]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QuestionPoolModels](
	[QuestionID] [int] IDENTITY(1,1) NOT NULL,
	[Question] [nvarchar](max) NULL,
	[QuestionOptionOne] [nvarchar](max) NULL,
	[QuestionOptionTwo] [nvarchar](max) NULL,
	[QuestionOptionThree] [nvarchar](max) NULL,
	[QuestionOptionFour] [nvarchar](max) NULL,
	[Answer] [nvarchar](max) NULL,
	[Subject] [nvarchar](max) NULL,
	[Marks] [int] NOT NULL,
	[DifficultyLevel] [int] NOT NULL,
 CONSTRAINT [PK_dbo.QuestionPoolModels] PRIMARY KEY CLUSTERED 
(
	[QuestionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[QuestionPoolModels] ON
INSERT [dbo].[QuestionPoolModels] ([QuestionID], [Question], [QuestionOptionOne], [QuestionOptionTwo], [QuestionOptionThree], [QuestionOptionFour], [Answer], [Subject], [Marks], [DifficultyLevel]) VALUES (3, N'What is Software Lifecycle?', N'i dont know', N'you dont know', N'the process through which a software is developed', N'its called SDLC', N'none of the above', N'Software Engineering-II', 2, 3)
SET IDENTITY_INSERT [dbo].[QuestionPoolModels] OFF
