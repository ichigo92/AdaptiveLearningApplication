using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace AdaptiveLearningApplication.Models
{
    public class Course
    {
        [Key]
        public int CourseID { get; set; }
        
        [Required]
        [Display(Name="Course Name", Prompt="Course Name")]
        public string CourseName { get; set; }
        
        [Display(Name="Course Content", Prompt="Course Content")]
        public string CourseContent { get; set; }

        public virtual ICollection<Teacher> Teacher { get; set; }

        public List<Student> Students { get; set; }

        public List<QuizModel> Quiz { get; set; }
    }
}