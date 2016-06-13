using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace AdaptiveLearningApplication.Models
{
    public class Student
    {
        [Key]
        public int StudentID { get; set; }

        [Required]
        [Display(Name="First Name", Prompt="First Name")]
        public string StudentFirstName { get; set; }

        [Required]
        [Display(Name = "Last Name", Prompt = "Last Name")]
        public string StudentLastName { get; set; }

        [Required]
        [Display(Name = "Age", Prompt = "Age")]
        public int StudentAge { get; set; }

        [Required]
        [Display(Name="Email Address", Prompt="Email Address")]
        [DataType(DataType.EmailAddress)]
        public string Email { get; set; }

        [Required]
        [Display(Name = "Gender", Prompt = "Gender")]
        public string StudentGender { get; set; }

        public int CourseID { get; set; }
        public virtual Course Course { get; set; }

    }
}