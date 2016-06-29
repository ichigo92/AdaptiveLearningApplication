namespace AdaptiveLearningApplication.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddedCoursesToQuiz : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.QuizModels", "Course_CourseID", "dbo.Courses");
            DropIndex("dbo.QuizModels", new[] { "Course_CourseID" });
            RenameColumn(table: "dbo.QuizModels", name: "Course_CourseID", newName: "CourseID");
            AddForeignKey("dbo.QuizModels", "CourseID", "dbo.Courses", "CourseID", cascadeDelete: true);
            CreateIndex("dbo.QuizModels", "CourseID");
        }
        
        public override void Down()
        {
            DropIndex("dbo.QuizModels", new[] { "CourseID" });
            DropForeignKey("dbo.QuizModels", "CourseID", "dbo.Courses");
            RenameColumn(table: "dbo.QuizModels", name: "CourseID", newName: "Course_CourseID");
            CreateIndex("dbo.QuizModels", "Course_CourseID");
            AddForeignKey("dbo.QuizModels", "Course_CourseID", "dbo.Courses", "CourseID");
        }
    }
}
