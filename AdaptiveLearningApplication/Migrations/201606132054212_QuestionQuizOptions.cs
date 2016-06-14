namespace AdaptiveLearningApplication.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class QuestionQuizOptions : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.QuestionOptions",
                c => new
                    {
                        QuestionOptionID = c.Int(nullable: false, identity: true),
                        QuestionOptionStatement = c.String(),
                        QuestionID = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.QuestionOptionID)
                .ForeignKey("dbo.QuestionPoolModels", t => t.QuestionID, cascadeDelete: true)
                .Index(t => t.QuestionID);
            
            AddColumn("dbo.QuizModels", "Course_CourseID", c => c.Int());
            AddForeignKey("dbo.QuizModels", "Course_CourseID", "dbo.Courses", "CourseID");
            CreateIndex("dbo.QuizModels", "Course_CourseID");
            DropColumn("dbo.QuestionPoolModels", "QuestionOptionOne");
            DropColumn("dbo.QuestionPoolModels", "QuestionOptionTwo");
            DropColumn("dbo.QuestionPoolModels", "QuestionOptionThree");
            DropColumn("dbo.QuestionPoolModels", "QuestionOptionFour");
            DropColumn("dbo.QuestionPoolModels", "Subject");
        }
        
        public override void Down()
        {
            AddColumn("dbo.QuestionPoolModels", "Subject", c => c.String());
            AddColumn("dbo.QuestionPoolModels", "QuestionOptionFour", c => c.String());
            AddColumn("dbo.QuestionPoolModels", "QuestionOptionThree", c => c.String());
            AddColumn("dbo.QuestionPoolModels", "QuestionOptionTwo", c => c.String());
            AddColumn("dbo.QuestionPoolModels", "QuestionOptionOne", c => c.String());
            DropIndex("dbo.QuestionOptions", new[] { "QuestionID" });
            DropIndex("dbo.QuizModels", new[] { "Course_CourseID" });
            DropForeignKey("dbo.QuestionOptions", "QuestionID", "dbo.QuestionPoolModels");
            DropForeignKey("dbo.QuizModels", "Course_CourseID", "dbo.Courses");
            DropColumn("dbo.QuizModels", "Course_CourseID");
            DropTable("dbo.QuestionOptions");
        }
    }
}
