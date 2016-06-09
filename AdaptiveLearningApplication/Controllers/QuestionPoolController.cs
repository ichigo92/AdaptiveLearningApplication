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
    public class QuestionPoolController : Controller
    {
        private AdaptiveLearningContext db = new AdaptiveLearningContext();

        //
        // GET: /QuestionPool/

        public ActionResult Index()
        {
            return View(db.QuestionPool.ToList());
        }

        //
        // GET: /QuestionPool/Details/5

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
        // GET: /QuestionPool/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /QuestionPool/Create

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

            return View(questionpoolmodel);
        }

        //
        // GET: /QuestionPool/Edit/5

        public ActionResult Edit(int id = 0)
        {
            QuestionPoolModel questionpoolmodel = db.QuestionPool.Find(id);
            if (questionpoolmodel == null)
            {
                return HttpNotFound();
            }
            return View(questionpoolmodel);
        }

        //
        // POST: /QuestionPool/Edit/5

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
            return View(questionpoolmodel);
        }

        //
        // GET: /QuestionPool/Delete/5

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
        // POST: /QuestionPool/Delete/5

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