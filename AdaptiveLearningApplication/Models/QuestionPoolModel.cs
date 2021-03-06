﻿using System;
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

        [Required]
        public string Question { get; set; }
        
        [Required]
        public string Answer { get; set; }


        public double Marks { get; set; }

        [Required]
        [Range(1,3)]
        public int DifficultyLevel { get; set; }

        public double ObtainedMarks { get; set; }

        [Required]
        [Display(Name = "Option One", Prompt = "Option One")]
        public string OptionOne { get; set; }

        [Required]
        [Display(Name = "Option Two", Prompt = "Option Two")]
        public string OptionTwo { get; set; }

        [Required]
        [Display(Name = "Option Three", Prompt = "Option Three")]
        public string OptionThree { get; set; }

        [Required]
        [Display(Name = "Option Four", Prompt = "Option Four")]
        public string OptionFour { get; set; }

        public List<QuestionOption> QuestionOptions { get; set; }
        
        public int QuizID { get; set; }
        public virtual QuizModel Quiz { get; set; }

    }
}