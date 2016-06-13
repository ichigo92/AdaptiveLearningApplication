using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AdaptiveLearningApplication.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.Message = "Modify this template to jump-start your ASP.NET MVC application.";

            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your app description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult AdminDashboard()
        {
            ViewBag.Message = "Your Admin Dashboard page.";

            return View();
        }

        public ActionResult TeacherDashboard()
        {
            ViewBag.Message = "Your Teacher Dashboard page.";

            return View();
        }

        //public ActionResult StudentsToPVDemo(string quizName)
        //{
        //    IEnumerable<Quiz> allQuizes = _repository.GetCourses();
        //    var selectedQuizId = (from c in allQuizes where c.QuizName == quizName select c.QuizId).FirstOrDefault();

        //    IEnumerable<Questions> allQuestions = _repository.GetStudents();
        //    var questionsInQuiz = allQuestions.Where(s => s.EnrolledCourses.Any(c => c.QuizId == selectedQuizId)).ToList();

        //    return PartialView("StudentPV", questionsInQuiz);
        //}
    }
}
