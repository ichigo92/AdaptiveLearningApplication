using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace AdaptiveLearningApplication.Models
{
    public class Result
    {
        [Key]
        public int ResultID { get; set; }

        public int MarksObtained { get; set; }

        public double PercentageObtained { get; set; }

        public int StudentID { get; set; }
        public virtual Student Student { get; set; }

    }
}