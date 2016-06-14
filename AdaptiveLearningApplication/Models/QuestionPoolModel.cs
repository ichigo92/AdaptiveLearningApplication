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
        public string Answer { get; set; }
        public int Marks { get; set; }
        public int DifficultyLevel { get; set; }

        public List<QuestionOption> QuestionOptions { get; set; }
        
        public int QuizID { get; set; }
        public virtual QuizModel Quiz { get; set; }

    }
}