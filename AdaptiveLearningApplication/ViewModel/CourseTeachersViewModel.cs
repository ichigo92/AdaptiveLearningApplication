using AdaptiveLearningApplication.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AdaptiveLearningApplication.ViewModel
{
    public class CourseTeachersViewModel
    {
        public Teacher Teacher { get; set; }
        public IEnumerable<SelectListItem> AllCourses { get; set; }

        private List<int> _selectedCourses { get; set; }
        public List<int> SelectedCourses
        {
            get {
                if (_selectedCourses == null)
                    _selectedCourses = Teacher.Course.Select(m => m.CourseID).ToList();
                return _selectedCourses; 
            }
            set { _selectedCourses = value; }
        }

    }
}