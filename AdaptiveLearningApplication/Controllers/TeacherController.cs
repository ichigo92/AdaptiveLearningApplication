﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AdaptiveLearningApplication.Models;
using AdaptiveLearningApplication.ViewModel;

namespace AdaptiveLearningApplication.Controllers
{
    public class TeacherController : Controller
    {
        private AdaptiveLearningContext db = new AdaptiveLearningContext();

        //
        // GET: /Teacher/

        public ActionResult Index()
        {
            return View(db.Teacher.ToList());
        }

        //
        // GET: /Teacher/Details/5

        public ActionResult Details(int id = 0)
        {
            Teacher teacher = db.Teacher.Find(id);
            if (teacher == null)
            {
                return HttpNotFound();
            }
            return View(teacher);
        }

        //
        // GET: /Teacher/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Teacher/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Teacher teacher)
        {
            if (ModelState.IsValid)
            {
                db.Teacher.Add(teacher);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(teacher);
        }

        //
        // GET: /Teacher/Edit/5

        public ActionResult Edit(int id = 0)
        {
            Teacher teacher = db.Teacher.Find(id);
            if (teacher == null)
            {
                return HttpNotFound();
            }
            var courseTeachersViewModel = new CourseTeachersViewModel
            {
                Teacher = db.Teacher.Include(i => i.Course).First(i => i.TeacherID == id),
            };
            if (courseTeachersViewModel.Teacher == null)
                return HttpNotFound();
            var allCourseList = db.Course.ToList();
            courseTeachersViewModel.AllCourses = allCourseList.Select(o => new SelectListItem
            {
                Text = o.CourseName,
                Value = o.CourseID.ToString()
            });
            
            return View(courseTeachersViewModel);
        }

        //
        // POST: /Teacher/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Teacher teacher)
        {
            if (ModelState.IsValid)
            {
                db.Entry(teacher).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(teacher);
        }

        //
        // GET: /Teacher/Delete/5

        public ActionResult Delete(int id = 0)
        {
            Teacher teacher = db.Teacher.Find(id);
            if (teacher == null)
            {
                return HttpNotFound();
            }
            return View(teacher);
        }

        //
        // POST: /Teacher/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Teacher teacher = db.Teacher.Find(id);
            db.Teacher.Remove(teacher);
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