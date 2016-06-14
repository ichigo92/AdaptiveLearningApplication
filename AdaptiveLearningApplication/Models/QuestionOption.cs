using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace AdaptiveLearningApplication.Models
{
    public class QuestionOption
    {
        [Key]
        public int QuestionOptionID { get; set; }

        [Display(Name="Option Statement", Prompt="Option Statement")]
        public string QuestionOptionStatement { get; set; }

        public int QuestionID { get; set; }
        public virtual QuestionPoolModel Question { get; set; }

    }
}