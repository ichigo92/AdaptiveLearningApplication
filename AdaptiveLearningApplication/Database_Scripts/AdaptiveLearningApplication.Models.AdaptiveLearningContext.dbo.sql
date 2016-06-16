USE [AdaptiveLearningApplication.Models.AdaptiveLearningContext]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 06/15/2016 22:38:55 ******/
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
/****** Object:  Table [dbo].[Teachers]    Script Date: 06/15/2016 22:38:55 ******/
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
/****** Object:  Table [dbo].[Students]    Script Date: 06/15/2016 22:38:55 ******/
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
/****** Object:  Table [dbo].[QuizModels]    Script Date: 06/15/2016 22:38:55 ******/
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
SET IDENTITY_INSERT [dbo].[QuizModels] ON
INSERT [dbo].[QuizModels] ([QuizID], [QuizName], [CreatedDate], [NumberOfQuestions], [HighestMarks], [Duration], [CreatedBy], [Course_CourseID]) VALUES (1, N'Maths Quiz', CAST(0x0000A626015B74DD AS DateTime), 5, 20, N'20 min', N'Admin', NULL)
INSERT [dbo].[QuizModels] ([QuizID], [QuizName], [CreatedDate], [NumberOfQuestions], [HighestMarks], [Duration], [CreatedBy], [Course_CourseID]) VALUES (2, N'Psychology Quiz', CAST(0x0000A69700000000 AS DateTime), 5, 14, N'30 min', N'John', NULL)
SET IDENTITY_INSERT [dbo].[QuizModels] OFF
/****** Object:  Table [dbo].[QuestionPoolModels]    Script Date: 06/15/2016 22:38:55 ******/
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
SET IDENTITY_INSERT [dbo].[QuestionPoolModels] ON
INSERT [dbo].[QuestionPoolModels] ([QuestionID], [Question], [Answer], [Marks], [DifficultyLevel], [QuizID]) VALUES (1, N'What is 2 + 2?', N'4', 1, 1, 1)
INSERT [dbo].[QuestionPoolModels] ([QuestionID], [Question], [Answer], [Marks], [DifficultyLevel], [QuizID]) VALUES (2, N'What is Psychology??', N'none of the above', 1, 1, 2)
SET IDENTITY_INSERT [dbo].[QuestionPoolModels] OFF
/****** Object:  Table [dbo].[QuestionOptions]    Script Date: 06/15/2016 22:38:55 ******/
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
SET IDENTITY_INSERT [dbo].[QuestionOptions] ON
INSERT [dbo].[QuestionOptions] ([QuestionOptionID], [QuestionOptionStatement], [QuestionID]) VALUES (1, N'2', 1)
INSERT [dbo].[QuestionOptions] ([QuestionOptionID], [QuestionOptionStatement], [QuestionID]) VALUES (2, N'0', 1)
INSERT [dbo].[QuestionOptions] ([QuestionOptionID], [QuestionOptionStatement], [QuestionID]) VALUES (3, N'4', 1)
INSERT [dbo].[QuestionOptions] ([QuestionOptionID], [QuestionOptionStatement], [QuestionID]) VALUES (4, N'5', 1)
INSERT [dbo].[QuestionOptions] ([QuestionOptionID], [QuestionOptionStatement], [QuestionID]) VALUES (5, N'none of the above', 2)
INSERT [dbo].[QuestionOptions] ([QuestionOptionID], [QuestionOptionStatement], [QuestionID]) VALUES (6, N'i dont know', 2)
SET IDENTITY_INSERT [dbo].[QuestionOptions] OFF
/****** Object:  ForeignKey [FK_dbo.QuestionOptions_dbo.QuestionPoolModels_QuestionID]    Script Date: 06/15/2016 22:38:55 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.QuestionOptions_dbo.QuestionPoolModels_QuestionID]') AND parent_object_id = OBJECT_ID(N'[dbo].[QuestionOptions]'))
ALTER TABLE [dbo].[QuestionOptions]  WITH CHECK ADD  CONSTRAINT [FK_dbo.QuestionOptions_dbo.QuestionPoolModels_QuestionID] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[QuestionPoolModels] ([QuestionID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.QuestionOptions_dbo.QuestionPoolModels_QuestionID]') AND parent_object_id = OBJECT_ID(N'[dbo].[QuestionOptions]'))
ALTER TABLE [dbo].[QuestionOptions] CHECK CONSTRAINT [FK_dbo.QuestionOptions_dbo.QuestionPoolModels_QuestionID]
GO
/****** Object:  ForeignKey [FK_dbo.QuestionPoolModels_dbo.QuizModels_QuizID]    Script Date: 06/15/2016 22:38:55 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.QuestionPoolModels_dbo.QuizModels_QuizID]') AND parent_object_id = OBJECT_ID(N'[dbo].[QuestionPoolModels]'))
ALTER TABLE [dbo].[QuestionPoolModels]  WITH CHECK ADD  CONSTRAINT [FK_dbo.QuestionPoolModels_dbo.QuizModels_QuizID] FOREIGN KEY([QuizID])
REFERENCES [dbo].[QuizModels] ([QuizID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.QuestionPoolModels_dbo.QuizModels_QuizID]') AND parent_object_id = OBJECT_ID(N'[dbo].[QuestionPoolModels]'))
ALTER TABLE [dbo].[QuestionPoolModels] CHECK CONSTRAINT [FK_dbo.QuestionPoolModels_dbo.QuizModels_QuizID]
GO
/****** Object:  ForeignKey [FK_dbo.QuizModels_dbo.Courses_Course_CourseID]    Script Date: 06/15/2016 22:38:55 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.QuizModels_dbo.Courses_Course_CourseID]') AND parent_object_id = OBJECT_ID(N'[dbo].[QuizModels]'))
ALTER TABLE [dbo].[QuizModels]  WITH CHECK ADD  CONSTRAINT [FK_dbo.QuizModels_dbo.Courses_Course_CourseID] FOREIGN KEY([Course_CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.QuizModels_dbo.Courses_Course_CourseID]') AND parent_object_id = OBJECT_ID(N'[dbo].[QuizModels]'))
ALTER TABLE [dbo].[QuizModels] CHECK CONSTRAINT [FK_dbo.QuizModels_dbo.Courses_Course_CourseID]
GO
/****** Object:  ForeignKey [FK_dbo.Students_dbo.Courses_CourseID]    Script Date: 06/15/2016 22:38:55 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Students_dbo.Courses_CourseID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Students]'))
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Students_dbo.Courses_CourseID] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Students_dbo.Courses_CourseID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Students]'))
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_dbo.Students_dbo.Courses_CourseID]
GO
/****** Object:  ForeignKey [FK_dbo.Teachers_dbo.Courses_CourseID]    Script Date: 06/15/2016 22:38:55 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Teachers_dbo.Courses_CourseID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Teachers]'))
ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Teachers_dbo.Courses_CourseID] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Teachers_dbo.Courses_CourseID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Teachers]'))
ALTER TABLE [dbo].[Teachers] CHECK CONSTRAINT [FK_dbo.Teachers_dbo.Courses_CourseID]
GO
