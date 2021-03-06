USE [master]
GO
/****** Object:  Database [AdaptiveLearningContext]    Script Date: 07/15/2016 01:39:00 ******/
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
/****** Object:  Table [dbo].[Courses]    Script Date: 07/15/2016 01:39:02 ******/
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
SET IDENTITY_INSERT [dbo].[Courses] ON
INSERT [dbo].[Courses] ([CourseID], [CourseName], [CourseContent]) VALUES (1, N'lambda', N'lambda')
INSERT [dbo].[Courses] ([CourseID], [CourseName], [CourseContent]) VALUES (2, N'Software Engineering', N'Software Engineering 101')
SET IDENTITY_INSERT [dbo].[Courses] OFF
/****** Object:  Table [dbo].[QuizModels]    Script Date: 07/15/2016 01:39:03 ******/
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
	[Duration] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NOT NULL,
	[CourseID] [int] NULL,
 CONSTRAINT [PK_dbo.QuizModels] PRIMARY KEY CLUSTERED 
(
	[QuizID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[QuizModels]') AND name = N'IX_CourseID')
CREATE NONCLUSTERED INDEX [IX_CourseID] ON [dbo].[QuizModels] 
(
	[CourseID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[QuizModels] ON
INSERT [dbo].[QuizModels] ([QuizID], [QuizName], [CreatedDate], [NumberOfQuestions], [HighestMarks], [Duration], [CreatedBy], [CourseID]) VALUES (1, N'Maths Quiz', CAST(0x0000A626015B74DD AS DateTime), 5, 20, N'20 min', N'Admin', 1)
INSERT [dbo].[QuizModels] ([QuizID], [QuizName], [CreatedDate], [NumberOfQuestions], [HighestMarks], [Duration], [CreatedBy], [CourseID]) VALUES (2, N'Psychology Quiz', CAST(0x0000A69700000000 AS DateTime), 5, 14, N'30 min', N'John', 1)
INSERT [dbo].[QuizModels] ([QuizID], [QuizName], [CreatedDate], [NumberOfQuestions], [HighestMarks], [Duration], [CreatedBy], [CourseID]) VALUES (3, N'Quiz One', CAST(0x0000A63000000000 AS DateTime), 2, 5, N'1 hr', N'Admin', 2)
INSERT [dbo].[QuizModels] ([QuizID], [QuizName], [CreatedDate], [NumberOfQuestions], [HighestMarks], [Duration], [CreatedBy], [CourseID]) VALUES (4, N'Quantisimo', CAST(0x0000A58F00000000 AS DateTime), 30, 5, N'1 hr', N'Admin', 2)
INSERT [dbo].[QuizModels] ([QuizID], [QuizName], [CreatedDate], [NumberOfQuestions], [HighestMarks], [Duration], [CreatedBy], [CourseID]) VALUES (5, N'Quiz GOT', CAST(0x0000A63400000000 AS DateTime), 30, 5, N'1 hr', N'Admin', 2)
SET IDENTITY_INSERT [dbo].[QuizModels] OFF
/****** Object:  Table [dbo].[Teachers]    Script Date: 07/15/2016 01:39:03 ******/
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
SET IDENTITY_INSERT [dbo].[Teachers] ON
INSERT [dbo].[Teachers] ([TeacherID], [TeacherFirstName], [TeacherLastName], [TeacherAge], [TeacherGender], [CourseID]) VALUES (1, N'Johnny', N'English', 25, N'Male', 1)
SET IDENTITY_INSERT [dbo].[Teachers] OFF
/****** Object:  Table [dbo].[Students]    Script Date: 07/15/2016 01:39:03 ******/
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
SET IDENTITY_INSERT [dbo].[Students] ON
INSERT [dbo].[Students] ([StudentID], [StudentFirstName], [StudentLastName], [StudentAge], [Email], [StudentGender], [CourseID]) VALUES (1, N'Hi', N'Bye', 25, N'student@bye.com', N'Male', 2)
SET IDENTITY_INSERT [dbo].[Students] OFF
/****** Object:  Table [dbo].[Results]    Script Date: 07/15/2016 01:39:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Results]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Results](
	[ResultID] [int] IDENTITY(1,1) NOT NULL,
	[MarksObtained] [int] NOT NULL,
	[PercentageObtained] [float] NOT NULL,
	[StudentID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Results] PRIMARY KEY CLUSTERED 
(
	[ResultID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Results]') AND name = N'IX_StudentID')
CREATE NONCLUSTERED INDEX [IX_StudentID] ON [dbo].[Results] 
(
	[StudentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Results] ON
INSERT [dbo].[Results] ([ResultID], [MarksObtained], [PercentageObtained], [StudentID]) VALUES (2, 14, 94.915254237288138, 1)
SET IDENTITY_INSERT [dbo].[Results] OFF
/****** Object:  Table [dbo].[QuestionPoolModels]    Script Date: 07/15/2016 01:39:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QuestionPoolModels]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QuestionPoolModels](
	[QuestionID] [int] IDENTITY(1,1) NOT NULL,
	[Question] [nvarchar](max) NOT NULL,
	[Answer] [nvarchar](max) NOT NULL,
	[Marks] [float] NOT NULL,
	[DifficultyLevel] [int] NOT NULL,
	[QuizID] [int] NOT NULL,
	[ObtainedMarks] [float] NOT NULL,
	[OptionOne] [nvarchar](max) NOT NULL,
	[OptionTwo] [nvarchar](max) NOT NULL,
	[OptionThree] [nvarchar](max) NOT NULL,
	[OptionFour] [nvarchar](max) NOT NULL,
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
INSERT [dbo].[QuestionPoolModels] ([QuestionID], [Question], [Answer], [Marks], [DifficultyLevel], [QuizID], [ObtainedMarks], [OptionOne], [OptionTwo], [OptionThree], [OptionFour]) VALUES (1, N'What is 2 + 2?', N'4', 1, 1, 1, 0, N'a', N'q', N'z', N'y')
INSERT [dbo].[QuestionPoolModels] ([QuestionID], [Question], [Answer], [Marks], [DifficultyLevel], [QuizID], [ObtainedMarks], [OptionOne], [OptionTwo], [OptionThree], [OptionFour]) VALUES (2, N'What is Psychology??', N'none of the above', 1, 1, 2, 0, N's', N'w', N'x', N'u')
INSERT [dbo].[QuestionPoolModels] ([QuestionID], [Question], [Answer], [Marks], [DifficultyLevel], [QuizID], [ObtainedMarks], [OptionOne], [OptionTwo], [OptionThree], [OptionFour]) VALUES (3, N'What is Software Engineering??', N'Nothing', 2, 2, 1, 0, N'd', N'e', N'c', N'i')
INSERT [dbo].[QuestionPoolModels] ([QuestionID], [Question], [Answer], [Marks], [DifficultyLevel], [QuizID], [ObtainedMarks], [OptionOne], [OptionTwo], [OptionThree], [OptionFour]) VALUES (4, N'What is SDLC?', N'Lifecycle', 1, 2, 1, 0, N'f', N'r', N'v', N'o')
INSERT [dbo].[QuestionPoolModels] ([QuestionID], [Question], [Answer], [Marks], [DifficultyLevel], [QuizID], [ObtainedMarks], [OptionOne], [OptionTwo], [OptionThree], [OptionFour]) VALUES (5, N'What is your name??', N'Dont Know', 2, 1, 1, 0, N'g', N't', N'b', N'p')
INSERT [dbo].[QuestionPoolModels] ([QuestionID], [Question], [Answer], [Marks], [DifficultyLevel], [QuizID], [ObtainedMarks], [OptionOne], [OptionTwo], [OptionThree], [OptionFour]) VALUES (6, N'Who is Jon Snow?', N'The King in The North', 1, 1, 5, 1, N'The King in The North', N'No One', N'Nothing', N'Dont Know')
INSERT [dbo].[QuestionPoolModels] ([QuestionID], [Question], [Answer], [Marks], [DifficultyLevel], [QuizID], [ObtainedMarks], [OptionOne], [OptionTwo], [OptionThree], [OptionFour]) VALUES (7, N'Who is Eddard Stark?', N'All of the Above', 2, 2, 5, 2, N'Jon Uncle', N'Warden of The North', N'The Paramount of The North', N'All of the Above')
INSERT [dbo].[QuestionPoolModels] ([QuestionID], [Question], [Answer], [Marks], [DifficultyLevel], [QuizID], [ObtainedMarks], [OptionOne], [OptionTwo], [OptionThree], [OptionFour]) VALUES (8, N'Priority 2 is what?', N'priority', 2, 2, 5, 2, N'priority', N'james', N'jimmy', N'jack')
INSERT [dbo].[QuestionPoolModels] ([QuestionID], [Question], [Answer], [Marks], [DifficultyLevel], [QuizID], [ObtainedMarks], [OptionOne], [OptionTwo], [OptionThree], [OptionFour]) VALUES (9, N'Who is Jamie Lannister?', N'King Slayer', 2, 2, 5, 2, N'Dont Know', N'Dont Watch GOT', N'Jamie', N'King Slayer')
INSERT [dbo].[QuestionPoolModels] ([QuestionID], [Question], [Answer], [Marks], [DifficultyLevel], [QuizID], [ObtainedMarks], [OptionOne], [OptionTwo], [OptionThree], [OptionFour]) VALUES (10, N'King of Dorn?', N'Alexander', 3, 3, 5, 3, N'Alexander', N'Viper', N'The Woman', N'Red Witch')
INSERT [dbo].[QuestionPoolModels] ([QuestionID], [Question], [Answer], [Marks], [DifficultyLevel], [QuizID], [ObtainedMarks], [OptionOne], [OptionTwo], [OptionThree], [OptionFour]) VALUES (11, N'In which season was Winterfell taken back??', N'Season 6', 2, 2, 5, 2, N'Season 6', N'Season 4', N'Season 3', N'Season 5')
INSERT [dbo].[QuestionPoolModels] ([QuestionID], [Question], [Answer], [Marks], [DifficultyLevel], [QuizID], [ObtainedMarks], [OptionOne], [OptionTwo], [OptionThree], [OptionFour]) VALUES (12, N'What did Jon say to Sansa at the wall of Winterfell?', N'We need to trust each other', 2, 2, 5, 2, N'Nothing', N'We need to trust each other', N'Said Nothing', N'He was brought back to life')
INSERT [dbo].[QuestionPoolModels] ([QuestionID], [Question], [Answer], [Marks], [DifficultyLevel], [QuizID], [ObtainedMarks], [OptionOne], [OptionTwo], [OptionThree], [OptionFour]) VALUES (13, N'Ola', N'testing', 0.75, 1, 5, 0, N'1', N'2', N'3', N'4')
SET IDENTITY_INSERT [dbo].[QuestionPoolModels] OFF
/****** Object:  Table [dbo].[QuestionOptions]    Script Date: 07/15/2016 01:39:03 ******/
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
INSERT [dbo].[QuestionOptions] ([QuestionOptionID], [QuestionOptionStatement], [QuestionID]) VALUES (7, N'Nothing', 3)
INSERT [dbo].[QuestionOptions] ([QuestionOptionID], [QuestionOptionStatement], [QuestionID]) VALUES (8, N'Engineering Principle', 3)
INSERT [dbo].[QuestionOptions] ([QuestionOptionID], [QuestionOptionStatement], [QuestionID]) VALUES (9, N'Dont Know', 3)
INSERT [dbo].[QuestionOptions] ([QuestionOptionID], [QuestionOptionStatement], [QuestionID]) VALUES (10, N'Lifecycle', 4)
INSERT [dbo].[QuestionOptions] ([QuestionOptionID], [QuestionOptionStatement], [QuestionID]) VALUES (11, N'None of the Above', 4)
INSERT [dbo].[QuestionOptions] ([QuestionOptionID], [QuestionOptionStatement], [QuestionID]) VALUES (12, N'Dont Know', 5)
INSERT [dbo].[QuestionOptions] ([QuestionOptionID], [QuestionOptionStatement], [QuestionID]) VALUES (13, N'John', 5)
SET IDENTITY_INSERT [dbo].[QuestionOptions] OFF
/****** Object:  Default [DF__QuestionP__Obtai__117F9D94]    Script Date: 07/15/2016 01:39:03 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__QuestionP__Obtai__117F9D94]') AND parent_object_id = OBJECT_ID(N'[dbo].[QuestionPoolModels]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__QuestionP__Obtai__117F9D94]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[QuestionPoolModels] ADD  DEFAULT ((0)) FOR [ObtainedMarks]
END


End
GO
/****** Object:  ForeignKey [FK_dbo.QuizModels_dbo.Courses_CourseID]    Script Date: 07/15/2016 01:39:03 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.QuizModels_dbo.Courses_CourseID]') AND parent_object_id = OBJECT_ID(N'[dbo].[QuizModels]'))
ALTER TABLE [dbo].[QuizModels]  WITH CHECK ADD  CONSTRAINT [FK_dbo.QuizModels_dbo.Courses_CourseID] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.QuizModels_dbo.Courses_CourseID]') AND parent_object_id = OBJECT_ID(N'[dbo].[QuizModels]'))
ALTER TABLE [dbo].[QuizModels] CHECK CONSTRAINT [FK_dbo.QuizModels_dbo.Courses_CourseID]
GO
/****** Object:  ForeignKey [FK_dbo.Teachers_dbo.Courses_CourseID]    Script Date: 07/15/2016 01:39:03 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Teachers_dbo.Courses_CourseID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Teachers]'))
ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Teachers_dbo.Courses_CourseID] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Teachers_dbo.Courses_CourseID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Teachers]'))
ALTER TABLE [dbo].[Teachers] CHECK CONSTRAINT [FK_dbo.Teachers_dbo.Courses_CourseID]
GO
/****** Object:  ForeignKey [FK_dbo.Students_dbo.Courses_CourseID]    Script Date: 07/15/2016 01:39:03 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Students_dbo.Courses_CourseID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Students]'))
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Students_dbo.Courses_CourseID] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Students_dbo.Courses_CourseID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Students]'))
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_dbo.Students_dbo.Courses_CourseID]
GO
/****** Object:  ForeignKey [FK_dbo.Results_dbo.Students_StudentID]    Script Date: 07/15/2016 01:39:03 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Results_dbo.Students_StudentID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Results]'))
ALTER TABLE [dbo].[Results]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Results_dbo.Students_StudentID] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([StudentID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Results_dbo.Students_StudentID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Results]'))
ALTER TABLE [dbo].[Results] CHECK CONSTRAINT [FK_dbo.Results_dbo.Students_StudentID]
GO
/****** Object:  ForeignKey [FK_dbo.QuestionPoolModels_dbo.QuizModels_QuizID]    Script Date: 07/15/2016 01:39:03 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.QuestionPoolModels_dbo.QuizModels_QuizID]') AND parent_object_id = OBJECT_ID(N'[dbo].[QuestionPoolModels]'))
ALTER TABLE [dbo].[QuestionPoolModels]  WITH CHECK ADD  CONSTRAINT [FK_dbo.QuestionPoolModels_dbo.QuizModels_QuizID] FOREIGN KEY([QuizID])
REFERENCES [dbo].[QuizModels] ([QuizID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.QuestionPoolModels_dbo.QuizModels_QuizID]') AND parent_object_id = OBJECT_ID(N'[dbo].[QuestionPoolModels]'))
ALTER TABLE [dbo].[QuestionPoolModels] CHECK CONSTRAINT [FK_dbo.QuestionPoolModels_dbo.QuizModels_QuizID]
GO
/****** Object:  ForeignKey [FK_dbo.QuestionOptions_dbo.QuestionPoolModels_QuestionID]    Script Date: 07/15/2016 01:39:03 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.QuestionOptions_dbo.QuestionPoolModels_QuestionID]') AND parent_object_id = OBJECT_ID(N'[dbo].[QuestionOptions]'))
ALTER TABLE [dbo].[QuestionOptions]  WITH CHECK ADD  CONSTRAINT [FK_dbo.QuestionOptions_dbo.QuestionPoolModels_QuestionID] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[QuestionPoolModels] ([QuestionID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.QuestionOptions_dbo.QuestionPoolModels_QuestionID]') AND parent_object_id = OBJECT_ID(N'[dbo].[QuestionOptions]'))
ALTER TABLE [dbo].[QuestionOptions] CHECK CONSTRAINT [FK_dbo.QuestionOptions_dbo.QuestionPoolModels_QuestionID]
GO
