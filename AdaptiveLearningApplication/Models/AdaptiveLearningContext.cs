using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace AdaptiveLearningApplication.Models
{
    public class AdaptiveLearningContext : DbContext
    {
        public DbSet<QuizModel> Quiz { get; set; }
        public DbSet<QuestionPoolModel> QuestionPool { get; set; }
        public DbSet<Teacher> Teacher { get; set; }
        public DbSet<Course> Course { get; set; }
        public DbSet<Student> Student { get; set; }
    }
}