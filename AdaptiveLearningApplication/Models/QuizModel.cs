using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace AdaptiveLearningApplication.Models
{
    public class QuizModel
    {
        [Key]
        [Required]
        public int QuizID { get; set; }
        
        [Required]
        [Display(Name = "Quiz Name", Prompt="Quiz Name")]
        public string QuizName { get; set; }


        [Required]
        [DataType(DataType.Date)]
        [Display(Name = "Created Date")]
        private DateTime createdDateTime = DateTime.Now;
        public DateTime CreatedDate
        {
            get { return createdDateTime; }
            set { createdDateTime = value; }
        }

        

        [Display(Name = "Number of Question")]
        public int NumberOfQuestions { get; set; }


        [Display(Name = "Marks")]
        public int HighestMarks { get; set; }
        
        [Required]
        [Display(Name = "Duration")]
        public string Duration { get; set; }

        [Required]
        [Display(Name = "Created By")]
        public string CreatedBy { get; set; }


        public List<QuestionPoolModel> Questions { get; set; }
    }

}