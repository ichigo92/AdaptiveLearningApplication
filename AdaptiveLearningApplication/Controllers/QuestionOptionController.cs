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
    public class QuestionOptionController : Controller
    {
        private AdaptiveLearningContext db = new AdaptiveLearningContext();

        //
        // GET: /QuestionOption/

        public ActionResult Index()
        {
            var questionoption = db.QuestionOption.Include(q => q.Question);
            return View(questionoption.ToList());
        }

        //
        // GET: /QuestionOption/Details/5

        public ActionResult Details(int id = 0)
        {
            QuestionOption questionoption = db.QuestionOption.Find(id);
            if (questionoption == null)
            {
                return HttpNotFound();
            }
            return View(questionoption);
        }

        //
        // GET: /QuestionOption/Create

        public ActionResult Create()
        {
            ViewBag.QuestionID = new SelectList(db.QuestionPool, "QuestionID", "Question");
            return View();
        }

        //
        // POST: /QuestionOption/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(QuestionOption questionoption)
        {
            if (ModelState.IsValid)
            {
                db.QuestionOption.Add(questionoption);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.QuestionID = new SelectList(db.QuestionPool, "QuestionID", "Question", questionoption.QuestionID);
            return View(questionoption);
        }

        //
        // GET: /QuestionOption/Edit/5

        public ActionResult Edit(int id = 0)
        {
            QuestionOption questionoption = db.QuestionOption.Find(id);
            if (questionoption == null)
            {
                return HttpNotFound();
            }
            ViewBag.QuestionID = new SelectList(db.QuestionPool, "QuestionID", "Question", questionoption.QuestionID);
            return View(questionoption);
        }

        //
        // POST: /QuestionOption/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(QuestionOption questionoption)
        {
            if (ModelState.IsValid)
            {
                db.Entry(questionoption).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.QuestionID = new SelectList(db.QuestionPool, "QuestionID", "Question", questionoption.QuestionID);
            return View(questionoption);
        }

        //
        // GET: /QuestionOption/Delete/5

        public ActionResult Delete(int id = 0)
        {
            QuestionOption questionoption = db.QuestionOption.Find(id);
            if (questionoption == null)
            {
                return HttpNotFound();
            }
            return View(questionoption);
        }

        //
        // POST: /QuestionOption/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            QuestionOption questionoption = db.QuestionOption.Find(id);
            db.QuestionOption.Remove(questionoption);
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