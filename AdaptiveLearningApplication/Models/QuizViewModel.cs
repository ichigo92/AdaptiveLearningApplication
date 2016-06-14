using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AdaptiveLearningApplication.Models
{
    public class QuizViewModel
    {
        public QuizModel Quiz { get; set; }
        public QuestionPoolModel Question { get; set; }
        public QuestionOption QuestionOptions { get; set; }
        public string AnswerSelected { get; set; }
    }
}