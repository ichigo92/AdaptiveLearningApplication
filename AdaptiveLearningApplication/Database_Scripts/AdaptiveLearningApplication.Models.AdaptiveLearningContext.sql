USE [master]
GO
/****** Object:  Database [AdaptiveLearningContext]    Script Date: 06/16/2016 10:51:10 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'AdaptiveLearningContext')
BEGIN
CREATE DATABASE [AdaptiveLearningContext] ON  PRIMARY 
( NAME = N'AdaptiveLearningContext', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\AdaptiveLearningContext.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AdaptiveLearningContext_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\AdaptiveLearningContext_log.LDF' , SIZE = 504KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END
GO
ALTER DATABASE [AdaptiveLearningContext] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AdaptiveLearningContext].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AdaptiveLearningContext] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [AdaptiveLearningContext] SET ANSI_NULLS OFF
GO
ALTER DATABASE [AdaptiveLearningContext] SET ANSI_PADDING OFF
GO
ALTER DATABASE [AdaptiveLearningContext] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [AdaptiveLearningContext] SET ARITHABORT OFF
GO
ALTER DATABASE [AdaptiveLearningContext] SET AUTO_CLOSE ON
GO
ALTER DATABASE [AdaptiveLearningContext] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [AdaptiveLearningContext] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [AdaptiveLearningContext] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [AdaptiveLearningContext] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [AdaptiveLearningContext] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [AdaptiveLearningContext] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [AdaptiveLearningContext] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [AdaptiveLearningContext] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [AdaptiveLearningContext] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [AdaptiveLearningContext] SET  ENABLE_BROKER
GO
ALTER DATABASE [AdaptiveLearningContext] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [AdaptiveLearningContext] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [AdaptiveLearningContext] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [AdaptiveLearningContext] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [AdaptiveLearningContext] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [AdaptiveLearningContext] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [AdaptiveLearningContext] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [AdaptiveLearningContext] SET  READ_WRITE
GO
ALTER DATABASE [AdaptiveLearningContext] SET RECOVERY SIMPLE
GO
ALTER DATABASE [AdaptiveLearningContext] SET  MULTI_USER
GO
ALTER DATABASE [AdaptiveLearningContext] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [AdaptiveLearningContext] SET DB_CHAINING OFF
GO
USE [AdaptiveLearningContext]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 06/16/2016 10:51:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Courses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Courses](
	[CourseID] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [nvarchar](max) NOT NULL,
	[CourseContent] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Courses] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 06/16/2016 10:51:10 ******/
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
	[CourseID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Teachers] PRIMARY KEY CLUSTERED 
(
	[TeacherID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Teachers]') AND name = N'IX_CourseID')
CREATE NONCLUSTERED INDEX [IX_CourseID] ON [dbo].[Teachers] 
(
	[CourseID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 06/16/2016 10:51:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Students]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Students](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[StudentFirstName] [nvarchar](max) NOT NULL,
	[StudentLastName] [nvarchar](max) NOT NULL,
	[StudentAge] [int] NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[StudentGender] [nvarchar](max) NOT NULL,
	[CourseID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Students] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Students]') AND name = N'IX_CourseID')
CREATE NONCLUSTERED INDEX [IX_CourseID] ON [dbo].[Students] 
(
	[CourseID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuizModels]    Script Date: 06/16/2016 10:51:10 ******/
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
	[Course_CourseID] [int] NULL,
 CONSTRAINT [PK_dbo.QuizModels] PRIMARY KEY CLUSTERED 
(
	[QuizID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[QuizModels]') AND name = N'IX_Course_CourseID')
CREATE NONCLUSTERED INDEX [IX_Course_CourseID] ON [dbo].[QuizModels] 
(
	[Course_CourseID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[QuizModels] ON
INSERT [dbo].[QuizModels] ([QuizID], [QuizName], [CreatedDate], [NumberOfQuestions], [HighestMarks], [Duration], [CreatedBy], [Course_CourseID]) VALUES (1, N'Maths Quiz', CAST(0x0000A626015B74DD AS DateTime), 5, 20, N'20 min', N'Admin', NULL)
INSERT [dbo].[QuizModels] ([QuizID], [QuizName], [CreatedDate], [NumberOfQuestions], [HighestMarks], [Duration], [CreatedBy], [Course_CourseID]) VALUES (2, N'Psychology Quiz', CAST(0x0000A69700000000 AS DateTime), 5, 14, N'30 min', N'John', NULL)
SET IDENTITY_INSERT [dbo].[QuizModels] OFF
/****** Object:  Table [dbo].[QuestionPoolModels]    Script Date: 06/16/2016 10:51:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QuestionPoolModels]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QuestionPoolModels](
	[QuestionID] [int] IDENTITY(1,1) NOT NULL,
	[Question] [nvarchar](max) NULL,
	[Answer] [nvarchar](max) NULL,
	[Marks] [int] NOT NULL,
	[DifficultyLevel] [int] NOT NULL,
	[QuizID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.QuestionPoolModels] PRIMARY KEY CLUSTERED 
(
	[QuestionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[QuestionPoolModels]') AND name = N'IX_QuizID')
CREATE NONCLUSTERED INDEX [IX_QuizID] ON [dbo].[QuestionPoolModels] 
(
	[QuizID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[QuestionPoolModels] ON
INSERT [dbo].[QuestionPoolModels] ([QuestionID], [Question], [Answer], [Marks], [DifficultyLevel], [QuizID]) VALUES (1, N'What is 2 + 2?', N'4', 1, 1, 1)
INSERT [dbo].[QuestionPoolModels] ([QuestionID], [Question], [Answer], [Marks], [DifficultyLevel], [QuizID]) VALUES (2, N'What is Psychology??', N'none of the above', 1, 1, 2)
SET IDENTITY_INSERT [dbo].[QuestionPoolModels] OFF
/****** Object:  Table [dbo].[QuestionOptions]    Script Date: 06/16/2016 10:51:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QuestionOptions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QuestionOptions](
	[QuestionOptionID] [int] IDENTITY(1,1) NOT NULL,
	[QuestionOptionStatement] [nvarchar](max) NULL,
	[QuestionID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.QuestionOptions] PRIMARY KEY CLUSTERED 
(
	[QuestionOptionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[QuestionOptions]') AND name = N'IX_QuestionID')
CREATE NONCLUSTERED INDEX [IX_QuestionID] ON [dbo].[QuestionOptions] 
(
	[QuestionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[QuestionOptions] ON
INSERT [dbo].[QuestionOptions] ([QuestionOptionID], [QuestionOptionStatement], [QuestionID]) VALUES (1, N'2', 1)
INSERT [dbo].[QuestionOptions] ([QuestionOptionID], [QuestionOptionStatement], [QuestionID]) VALUES (2, N'0', 1)
INSERT [dbo].[QuestionOptions] ([QuestionOptionID], [QuestionOptionStatement], [QuestionID]) VALUES (3, N'4', 1)
INSERT [dbo].[QuestionOptions] ([QuestionOptionID], [QuestionOptionStatement], [QuestionID]) VALUES (4, N'5', 1)
INSERT [dbo].[QuestionOptions] ([QuestionOptionID], [QuestionOptionStatement], [QuestionID]) VALUES (5, N'none of the above', 2)
INSERT [dbo].[QuestionOptions] ([QuestionOptionID], [QuestionOptionStatement], [QuestionID]) VALUES (6, N'i dont know', 2)
SET IDENTITY_INSERT [dbo].[QuestionOptions] OFF
/****** Object:  ForeignKey [FK_dbo.Teachers_dbo.Courses_CourseID]    Script Date: 06/16/2016 10:51:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Teachers_dbo.Courses_CourseID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Teachers]'))
ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Teachers_dbo.Courses_CourseID] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Teachers_dbo.Courses_CourseID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Teachers]'))
ALTER TABLE [dbo].[Teachers] CHECK CONSTRAINT [FK_dbo.Teachers_dbo.Courses_CourseID]
GO
/****** Object:  ForeignKey [FK_dbo.Students_dbo.Courses_CourseID]    Script Date: 06/16/2016 10:51:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Students_dbo.Courses_CourseID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Students]'))
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Students_dbo.Courses_CourseID] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Students_dbo.Courses_CourseID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Students]'))
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_dbo.Students_dbo.Courses_CourseID]
GO
/****** Object:  ForeignKey [FK_dbo.QuizModels_dbo.Courses_Course_CourseID]    Script Date: 06/16/2016 10:51:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.QuizModels_dbo.Courses_Course_CourseID]') AND parent_object_id = OBJECT_ID(N'[dbo].[QuizModels]'))
ALTER TABLE [dbo].[QuizModels]  WITH CHECK ADD  CONSTRAINT [FK_dbo.QuizModels_dbo.Courses_Course_CourseID] FOREIGN KEY([Course_CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.QuizModels_dbo.Courses_Course_CourseID]') AND parent_object_id = OBJECT_ID(N'[dbo].[QuizModels]'))
ALTER TABLE [dbo].[QuizModels] CHECK CONSTRAINT [FK_dbo.QuizModels_dbo.Courses_Course_CourseID]
GO
/****** Object:  ForeignKey [FK_dbo.QuestionPoolModels_dbo.QuizModels_QuizID]    Script Date: 06/16/2016 10:51:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.QuestionPoolModels_dbo.QuizModels_QuizID]') AND parent_object_id = OBJECT_ID(N'[dbo].[QuestionPoolModels]'))
ALTER TABLE [dbo].[QuestionPoolModels]  WITH CHECK ADD  CONSTRAINT [FK_dbo.QuestionPoolModels_dbo.QuizModels_QuizID] FOREIGN KEY([QuizID])
REFERENCES [dbo].[QuizModels] ([QuizID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.QuestionPoolModels_dbo.QuizModels_QuizID]') AND parent_object_id = OBJECT_ID(N'[dbo].[QuestionPoolModels]'))
ALTER TABLE [dbo].[QuestionPoolModels] CHECK CONSTRAINT [FK_dbo.QuestionPoolModels_dbo.QuizModels_QuizID]
GO
/****** Object:  ForeignKey [FK_dbo.QuestionOptions_dbo.QuestionPoolModels_QuestionID]    Script Date: 06/16/2016 10:51:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.QuestionOptions_dbo.QuestionPoolModels_QuestionID]') AND parent_object_id = OBJECT_ID(N'[dbo].[QuestionOptions]'))
ALTER TABLE [dbo].[QuestionOptions]  WITH CHECK ADD  CONSTRAINT [FK_dbo.QuestionOptions_dbo.QuestionPoolModels_QuestionID] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[QuestionPoolModels] ([QuestionID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.QuestionOptions_dbo.QuestionPoolModels_QuestionID]') AND parent_object_id = OBJECT_ID(N'[dbo].[QuestionOptions]'))
ALTER TABLE [dbo].[QuestionOptions] CHECK CONSTRAINT [FK_dbo.QuestionOptions_dbo.QuestionPoolModels_QuestionID]
GO
