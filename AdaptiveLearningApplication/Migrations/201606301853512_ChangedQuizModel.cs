namespace AdaptiveLearningApplication.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ChangedQuizModel : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.QuizModels", "Duration", c => c.String());
        }
        
        public override void Down()
        {
            AlterColumn("dbo.QuizModels", "Duration", c => c.String(nullable: false));
        }
    }
}
