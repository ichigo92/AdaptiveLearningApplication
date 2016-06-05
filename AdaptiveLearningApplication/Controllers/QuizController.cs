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
        private UsersContext db = new UsersContext();

        //
        // GET: /Quiz/

        public ActionResult Index()
        {
            //return View(db.Quiz.ToList());
            return View();
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
                return RedirectToAction("Index");
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

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}