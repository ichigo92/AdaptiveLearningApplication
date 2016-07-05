using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AdaptiveLearningApplication.Models
{
    public class FilteredQuestions
    {
        public int QuizID { get; set; }
        public string QuizName { get; set; }
        public QuestionPoolModel Question { get; set; }
        public int count { get; set; }
        public int difficulty { get; set; }
        public int correct { get; set; }
        public List<int> listOfAnswers {get; set;}

        public FilteredQuestions() 
        {
            listOfAnswers = new List<int>();
            Question = new QuestionPoolModel();
            count = 0;
            difficulty = 0;
        }
    }
}