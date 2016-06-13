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
    public class QuestionController : Controller
    {
        private AdaptiveLearningContext db = new AdaptiveLearningContext();

        //
        // GET: /Question/

        public ActionResult Index()
        {
            var questionpool = db.QuestionPool.Include(q => q.Quiz);
            return View(questionpool.ToList());
        }

        //
        // GET: /Question/Details/5

        public ActionResult Details(int id = 0)
        {
            QuestionPoolModel questionpoolmodel = db.QuestionPool.Find(id);
            if (questionpoolmodel == null)
            {
                return HttpNotFound();
            }
            return View(questionpoolmodel);
        }

        //
        // GET: /Question/Create

        public ActionResult Create()
        {
            ViewBag.QuizID = new SelectList(db.Quiz, "QuizID", "QuizName");
            return View();
        }

        //
        // POST: /Question/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(QuestionPoolModel questionpoolmodel)
        {
            if (ModelState.IsValid)
            {
                db.QuestionPool.Add(questionpoolmodel);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.QuizID = new SelectList(db.Quiz, "QuizID", "QuizName", questionpoolmodel.QuizID);
            return View(questionpoolmodel);
        }

        //
        // GET: /Question/Edit/5

        public ActionResult Edit(int id = 0)
        {
            QuestionPoolModel questionpoolmodel = db.QuestionPool.Find(id);
            if (questionpoolmodel == null)
            {
                return HttpNotFound();
            }
            ViewBag.QuizID = new SelectList(db.Quiz, "QuizID", "QuizName", questionpoolmodel.QuizID);
            return View(questionpoolmodel);
        }

        //
        // POST: /Question/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(QuestionPoolModel questionpoolmodel)
        {
            if (ModelState.IsValid)
            {
                db.Entry(questionpoolmodel).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.QuizID = new SelectList(db.Quiz, "QuizID", "QuizName", questionpoolmodel.QuizID);
            return View(questionpoolmodel);
        }

        //
        // GET: /Question/Delete/5

        public ActionResult Delete(int id = 0)
        {
            QuestionPoolModel questionpoolmodel = db.QuestionPool.Find(id);
            if (questionpoolmodel == null)
            {
                return HttpNotFound();
            }
            return View(questionpoolmodel);
        }

        //
        // POST: /Question/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            QuestionPoolModel questionpoolmodel = db.QuestionPool.Find(id);
            db.QuestionPool.Remove(questionpoolmodel);
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