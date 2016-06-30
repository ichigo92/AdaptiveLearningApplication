using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AdaptiveLearningApplication.Models;
using System.IO;

namespace AdaptiveLearningApplication.Controllers
{
    public class TeacherController : Controller
    {
        private AdaptiveLearningContext db = new AdaptiveLearningContext();
        private UsersContext uc = new UsersContext();

        //
        // GET: /Teacher/

        public ActionResult Index()
        {
            var teacher = db.Teacher.Include(t => t.Course);
            return View(teacher.ToList());
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

        public ActionResult TeacherDashboard()
        {
            ViewBag.Message = "Your Teacher Dashboard page.";

            return View();
        }

        public ActionResult UploadFile()
        {
            ViewBag.Message = "Your Upload page.";

            return View();
        }

        //public ActionResult UploadFile()
        //{

        //    return View();
        //}

        [HttpPost]
        public ActionResult UploadFile(HttpPostedFileBase file)
        {
            if (file != null && file.ContentLength > 0)
                try
                {
                    string path = Path.Combine(Server.MapPath("~/Materials"),
                                               Path.GetFileName(file.FileName));
                    file.SaveAs(path);
                    ViewBag.Message = "File uploaded successfully";
                }
                catch (Exception ex)
                {
                    ViewBag.Message = "ERROR:" + ex.Message.ToString();
                }
            else
            {
                ViewBag.Message = "You have not specified a file.";
            }
            return View();
        }

        [HttpPost]
        public ActionResult Upload(HttpPostedFileBase file)
        {
            try
            {
                if (file.ContentLength > 0)
                {
                    var fileName = Path.GetFileName(file.FileName);
                    var path = Path.Combine(Server.MapPath("~/Uploads"), fileName);
                    file.SaveAs(path);
                }
                ViewBag.Message = "Upload successful";
                return RedirectToAction("Index");
            }
            catch
            {
                ViewBag.Message = "Upload failed";
                return RedirectToAction("Uploads");
            }
        }

        //public ActionResult Downloads()
        //{
        //    var dir = new System.IO.DirectoryInfo(Server.MapPath("~/App_Data/Uploads"));
        //    System.IO.FileInfo[] fileNames = dir.GetFiles("*.*");
        //    List<string> items = new List<string>();

        //    foreach (var file in fileNames)
        //    {
        //        items.Add(file.Name);
        //    }

        //    return View(items);
        //} 

        //public FileResult Download(string ImageName)
        //{
        //     return File("~/App_Data/Uploads" + ImageName, System.Net.Mime.MediaTypeNames.Application.Octet);
        //}

        ////
        //// GET: /Teacher/Create

        public ActionResult Create()
        {
            ViewBag.CourseID = new SelectList(db.Course, "CourseID", "CourseName");
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

            ViewBag.CourseID = new SelectList(db.Course, "CourseID", "CourseName", teacher.CourseID);
            return View(teacher);
        }

        //
        // GET: /Teacher/Edit/5

        public ActionResult Edit(int id = 0)
        {
            //Teacher teacher = db.Teacher.Find(id);
            string username = Session["UserName"].ToString();

            
            var userprofile = uc.UserProfiles.Where(i=>i.UserName == username).FirstOrDefault();
            Teacher teacher = db.Teacher.Where(t=>t.TeacherID == userprofile.UserId).FirstOrDefault();
            Session["FirstName"] = teacher.TeacherFirstName;

            if (teacher == null)
            {
                return HttpNotFound();
            }
            ViewBag.CourseID = new SelectList(db.Course, "CourseID", "CourseName", teacher.CourseID);
            return View(teacher);
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
            ViewBag.CourseID = new SelectList(db.Course, "CourseID", "CourseName", teacher.CourseID);
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