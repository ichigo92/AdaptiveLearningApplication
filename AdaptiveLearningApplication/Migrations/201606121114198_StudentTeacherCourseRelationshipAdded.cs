namespace AdaptiveLearningApplication.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class StudentTeacherCourseRelationshipAdded : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.Courses", "TeacherID", "dbo.Teachers");
            DropIndex("dbo.Courses", new[] { "TeacherID" });
            CreateTable(
                "dbo.CourseTeachers",
                c => new
                    {
                        Course_CourseID = c.Int(nullable: false),
                        Teacher_TeacherID = c.Int(nullable: false),
                    })
                .PrimaryKey(t => new { t.Course_CourseID, t.Teacher_TeacherID })
                .ForeignKey("dbo.Courses", t => t.Course_CourseID, cascadeDelete: true)
                .ForeignKey("dbo.Teachers", t => t.Teacher_TeacherID, cascadeDelete: true)
                .Index(t => t.Course_CourseID)
                .Index(t => t.Teacher_TeacherID);
            
            DropColumn("dbo.Courses", "TeacherID");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Courses", "TeacherID", c => c.Int(nullable: false));
            DropIndex("dbo.CourseTeachers", new[] { "Teacher_TeacherID" });
            DropIndex("dbo.CourseTeachers", new[] { "Course_CourseID" });
            DropForeignKey("dbo.CourseTeachers", "Teacher_TeacherID", "dbo.Teachers");
            DropForeignKey("dbo.CourseTeachers", "Course_CourseID", "dbo.Courses");
            DropTable("dbo.CourseTeachers");
            CreateIndex("dbo.Courses", "TeacherID");
            AddForeignKey("dbo.Courses", "TeacherID", "dbo.Teachers", "TeacherID", cascadeDelete: true);
        }
    }
}
