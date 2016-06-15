using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AdaptiveLearningApplication.Models;

namespace AdaptiveLearningApplication.Controllers
{
    public class QuizController : Controller
    {
        private AdaptiveLearningContext db = new AdaptiveLearningContext();

        //
        // GET: /Quiz/

        public ActionResult Index()
        {
            return View(db.Quiz.ToList());
        }

        //
        // GET: /Quiz/Details/5

        public ActionResult Details(int id = 0)
        {
            QuizModel quizmodel = db.Quiz.Find(id);
            if (quizmodel == null)
            {
                return HttpNotFound();
            }
            return View(quizmodel);
        }

        //
        // GET: /Quiz/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Quiz/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(QuizModel quizmodel)
        {
            if (ModelState.IsValid)
            {
                db.Quiz.Add(quizmodel);
                db.SaveChanges();
                return RedirectToAction("Create", "QuestionPool", new { id = quizmodel.QuizID });
                //return RedirectToAction("Index");
            }

            return View(quizmodel);
        }

        //
        // GET: /Quiz/Edit/5

        public ActionResult Edit(int id = 0)
        {
            QuizModel quizmodel = db.Quiz.Find(id);
            if (quizmodel == null)
            {
                return HttpNotFound();
            }
            return View(quizmodel);
        }

        //
        // POST: /Quiz/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(QuizModel quizmodel)
        {
            if (ModelState.IsValid)
            {
                db.Entry(quizmodel).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(quizmodel);
        }

        public ActionResult AttemptQuiz()
        {
            return View(db.Quiz.ToList());
        }

        //
        // GET: /Quiz/Delete/5

        public ActionResult Delete(int id = 0)
        {
            QuizModel quizmodel = db.Quiz.Find(id);
            if (quizmodel == null)
            {
                return HttpNotFound();
            }
            return View(quizmodel);
        }

        //
        // POST: /Quiz/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            QuizModel quizmodel = db.Quiz.Find(id);
            db.Quiz.Remove(quizmodel);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult TakeQuiz(int id = 0)
        {
            QuizModel quizmodel = db.Quiz.Find(id);
            quizmodel.Questions = db.QuestionPool.Where(m=>m.QuizID == id).ToList();
            foreach(var question in quizmodel.Questions){
               question.QuestionOptions = db.QuestionOption.Where(k => k.QuestionID == question.QuestionID).ToList();
            }
            if (quizmodel == null)
            {
                return HttpNotFound();
            }
            //ViewBag.QuestionID = new SelectList(db.QuestionPool, "QuestionID", "Question", quizmodel.Questions);
            return PartialView("TakeQuiz",quizmodel);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult TakeQuiz(QuizViewModel quizviewmodel)
        {
            if (ModelState.IsValid)
            {
                //Compares the answers then finds the Question from the QuestionPool and Adds Marks
                if (quizviewmodel.Question.Answer == quizviewmodel.AnswerSelected)
                {
                    db.QuestionPool.Find(quizviewmodel.Question.QuestionID).Marks = 1;
                }
                else
                {
                    db.QuestionPool.Find(quizviewmodel.Question.QuestionID).Marks = 0;
                }
                db.SaveChanges();
                return RedirectToAction("Create", "QuestionPool", new { id = quizviewmodel.Quiz.QuizID });
                //return RedirectToAction("Index");
            }

            return View(quizviewmodel);
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}