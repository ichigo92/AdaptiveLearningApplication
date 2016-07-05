using AdaptiveLearningApplication.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AdaptiveLearningApplication.Controllers
{
    public class QuizViewModelController : Controller
    {
        private AdaptiveLearningContext db = new AdaptiveLearningContext();

        //
        // GET: /QuizViewModel/

        public ActionResult Index()
        {

            return View();
        }

        public ActionResult TakeQuiz(int id = 0)
        {
            var quizviewmodel = new QuizViewModel();
            quizviewmodel.Quiz = db.Quiz.Find(id);
            quizviewmodel.Quiz.Questions = db.QuestionPool.Where(m => m.DifficultyLevel == 1).ToList(); //.Where(m => m.DifficultyLevel == 1)
            //quizviewmodel.Quiz.Questions;
            //foreach (var question in quizviewmodel.Quiz.Questions)
            //{
            //    question.QuestionOptions = db.QuestionOption.Where(k => k.QuestionID == question.QuestionID).ToList();
            //}
            //quizviewmodel.Question = db.QuestionPool.Find(1);
            //quizviewmodel.QuestionOptions = db.QuestionOptions.QuestionOptions.ToList();
            return View("TakeQuiz",quizviewmodel);
        }

    }
}
