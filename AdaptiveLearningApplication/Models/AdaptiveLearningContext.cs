using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace AdaptiveLearningApplication.Models
{
    public class AdaptiveLearningContext : DbContext
    {
        public AdaptiveLearningContext()
        {
            this.Configuration.ProxyCreationEnabled = false;
            this.Configuration.LazyLoadingEnabled = true;
        }
        public DbSet<QuizModel> Quiz { get; set; }
        public DbSet<QuestionPoolModel> QuestionPool { get; set; }
        public DbSet<QuestionOption> QuestionOption { get; set; }
        public DbSet<Teacher> Teacher { get; set; }
        public DbSet<Course> Course { get; set; }
        public DbSet<Student> Student { get; set; }
    }
}