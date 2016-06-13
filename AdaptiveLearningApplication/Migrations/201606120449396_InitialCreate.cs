namespace AdaptiveLearningApplication.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialCreate : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.QuizModels",
                c => new
                    {
                        QuizID = c.Int(nullable: false, identity: true),
                        QuizName = c.String(nullable: false),
                        CreatedDate = c.DateTime(nullable: false),
                        NumberOfQuestions = c.Int(nullable: false),
                        HighestMarks = c.Int(nullable: false),
                        Duration = c.String(nullable: false),
                        CreatedBy = c.String(nullable: false),
                    })
                .PrimaryKey(t => t.QuizID);
            
            CreateTable(
                "dbo.QuestionPoolModels",
                c => new
                    {
                        QuestionID = c.Int(nullable: false, identity: true),
                        Question = c.String(),
                        QuestionOptionOne = c.String(),
                        QuestionOptionTwo = c.String(),
                        QuestionOptionThree = c.String(),
                        QuestionOptionFour = c.String(),
                        Answer = c.String(),
                        Subject = c.String(),
                        Marks = c.Int(nullable: false),
                        DifficultyLevel = c.Int(nullable: false),
                        QuizID = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.QuestionID)
                .ForeignKey("dbo.QuizModels", t => t.QuizID, cascadeDelete: true)
                .Index(t => t.QuizID);
            
            CreateTable(
                "dbo.Teachers",
                c => new
                    {
                        TeacherID = c.Int(nullable: false, identity: true),
                        TeacherFirstName = c.String(nullable: false),
                        TeacherLastName = c.String(nullable: false),
                        TeacherAge = c.Int(nullable: false),
                        TeacherGender = c.String(nullable: false),
                        TeacherSubject = c.String(),
                    })
                .PrimaryKey(t => t.TeacherID);
            
        }
        
        public override void Down()
        {
            DropIndex("dbo.QuestionPoolModels", new[] { "QuizID" });
            DropForeignKey("dbo.QuestionPoolModels", "QuizID", "dbo.QuizModels");
            DropTable("dbo.Teachers");
            DropTable("dbo.QuestionPoolModels");
            DropTable("dbo.QuizModels");
        }
    }
}
