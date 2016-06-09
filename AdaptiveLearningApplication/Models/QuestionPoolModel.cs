using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace AdaptiveLearningApplication.Models
{
    public class QuestionPoolModel
    {
        [Key]
        public int QuestionID { get; set; }
        public string Question { get; set; }
        public string QuestionOptionOne { get; set; }
        public string QuestionOptionTwo { get; set; }
        public string QuestionOptionThree { get; set; }
        public string QuestionOptionFour { get; set; }
        public string Answer { get; set; }
        public string Subject { get; set; }
        public int Marks { get; set; }
        public int DifficultyLevel { get; set; }
    }

    public class QuestionPoolDBContext : DbContext
    {
        public DbSet<QuestionPoolModel> QuestionPool { get; set; }
    }

}