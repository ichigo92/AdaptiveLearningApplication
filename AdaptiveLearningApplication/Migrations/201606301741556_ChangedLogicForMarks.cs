namespace AdaptiveLearningApplication.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ChangedLogicForMarks : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.QuestionPoolModels", "Marks", c => c.Double(nullable: false));
        }
        
        public override void Down()
        {
            AlterColumn("dbo.QuestionPoolModels", "Marks", c => c.Int(nullable: false));
        }
    }
}
