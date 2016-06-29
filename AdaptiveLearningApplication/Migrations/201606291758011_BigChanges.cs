namespace AdaptiveLearningApplication.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class BigChanges : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.QuestionPoolModels", "ObtainedMarks", c => c.Double(nullable: false));
            AddColumn("dbo.QuestionPoolModels", "OptionOne", c => c.String());
            AddColumn("dbo.QuestionPoolModels", "OptionTwo", c => c.String());
            AddColumn("dbo.QuestionPoolModels", "OptionThree", c => c.String());
            AddColumn("dbo.QuestionPoolModels", "OptionFour", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.QuestionPoolModels", "OptionFour");
            DropColumn("dbo.QuestionPoolModels", "OptionThree");
            DropColumn("dbo.QuestionPoolModels", "OptionTwo");
            DropColumn("dbo.QuestionPoolModels", "OptionOne");
            DropColumn("dbo.QuestionPoolModels", "ObtainedMarks");
        }
    }
}
