using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace AdaptiveLearningApplication.Models
{
    public class Teacher
    {
        [Key]
        public int TeacherID { get; set; }

        [Required]
        [Display(Name = "First Name", Prompt = "First Name")]
        public string TeacherFirstName { get; set; }
        [Required]
        [Display(Name = "Last Name", Prompt = "Last Name")]
        public string TeacherLastName { get; set; }
        [Display(Name = "Age", Prompt = "Age")]
        public int TeacherAge { get; set; }
        [Required]
        [Display(Name = "Gender", Prompt = "Gender")]
        public string TeacherGender { get; set; }
        [Display(Name = "Subject", Prompt = "Subject")]
        public string TeacherSubject { get; set; }
    }
}