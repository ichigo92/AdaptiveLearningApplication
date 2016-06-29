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
        List<QuestionPoolModel> filteredQuestionList = new List<QuestionPoolModel>();
        //
        // GET: /Quiz/

        public ActionResult Index()
        {
            var quiz = db.Quiz.Include(q => q.Courses);
            return View(quiz.ToList());
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
            ViewBag.CourseID = new SelectList(db.Course, "CourseID", "CourseName");
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
                //return RedirectToAction("Create", "QuestionPool", new { id = quizmodel.QuizID });
                return RedirectToAction("Index");
            }
            ViewBag.CourseID = new SelectList(db.Course, "CourseID", "CourseName", quizmodel.CourseID);
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
            ViewBag.CourseID = new SelectList(db.Course, "CourseID", "CourseName", quizmodel.CourseID);
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
            ViewBag.CourseID = new SelectList(db.Course, "CourseID", "CourseName", quizmodel.CourseID);
            return View(quizmodel);
        }

        public ActionResult AttemptQuiz()
        {
            var student = db.Student.Where(s => s.StudentID == 1).Include(c => c.Course).FirstOrDefault();
            var quizes = db.Quiz.Where(c => c.CourseID == student.CourseID).Include(q => q.Courses).Include(q=>q.Questions);
            return View("AttemptQuiz",quizes.ToList());
            //return View(db.Quiz.ToList());
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

        //public ActionResult TakeQuiz(int id)
        //{
        //    //QuizModel quizmodel = db.Quiz.Find(id);
        //    //quizmodel.Questions = db.QuestionPool.Where(m=>m.QuizID == id).ToList();
        //    //foreach(var question in quizmodel.Questions){
        //    //   question.QuestionOptions = db.QuestionOption.Where(k => k.QuestionID == question.QuestionID).ToList();
        //    //}
        //    //if (quizmodel == null)
        //    //{
        //    //    return HttpNotFound();
        //    //}
        //    ////ViewBag.QuestionID = new SelectList(db.QuestionPool, "QuestionID", "Question", quizmodel.Questions);
        //    //return PartialView("TakeQuiz",quizmodel);
        //    var Quiz = db.Quiz.Find(id);
        //    var Question = db.QuestionPool.Where(m => m.QuizID == Quiz.QuizID).ToList();
        //    Quiz.Questions = Question;
        //    //var Options = new List<QuestionOption>();
        //    //foreach (var question in Question.Where(m => m.DifficultyLevel == 1))
        //    //{
        //    //    Options = db.QuestionOption.Where(m => m.QuestionID == question.QuestionID).ToList();
        //    //    question.QuestionOptions = Options;
        //    //}

        //    for (int i = 0; i < Question.Count; i++)
        //    {
        //        var question = Quiz.Questions[i];
        //        question.QuestionOptions = db.QuestionOption.Where(m => m.QuestionID == question.QuestionID).ToList();
        //    }

        //        return View("TakeQuiz", Quiz);
        //}


        public ActionResult ProcessResult(string id, string op, string cid, string qid)
        {
            var QuizID = Convert.ToInt32(id);
            var CourseID = Convert.ToInt32(cid);
            var quiz = db.Quiz.Where(q => q.QuizID == QuizID && q.CourseID == CourseID).Include(c => c.Courses).Include(q => q.Questions).FirstOrDefault();
            var course = db.Course.Where(c => c.CourseID == CourseID).Include(t => t.Teacher).FirstOrDefault();
            var question = db.QuestionPool.Where(c => c.QuizID == QuizID && c.DifficultyLevel == 2).ToList();
            var ObtainedMarks = 0.0;
            foreach (var quest in question)
            {
                ObtainedMarks = ObtainedMarks + quest.ObtainedMarks;
            }


            ViewData["op"] = op;
            ViewData["id"] = id;
            ViewData["cid"] = cid;
            ViewData["qid"] = qid;
            ViewData["marks"] = ObtainedMarks;



            return View("FormResults");
        }

        public ActionResult TakeQuiz(int id = 0, int cid = 0, int index = 0, string op = null, int count = 0)
        {

            if (op == null)
            {
                ViewData["Index"] = index;
                Session["NoOfQuestionsAsked"] = 0;
                Session["DifficultyLvl"] = 2;
                Session["CorrectAnswers"] = 0;
                Session["AnsweredWrong"] = 0;
            }

            var quiz = db.Quiz.Where(q => q.QuizID == id && q.CourseID == cid).Include(c => c.Courses).Include(q=>q.Questions).FirstOrDefault();
            var course = db.Course.Where(c => c.CourseID == cid).Include(t => t.Teacher).Include(s => s.Students).FirstOrDefault();
            //var question = db.Questions.Where(c => c.CourseID == cid && c.DifficultyLevel == 2).ToList();
            var quest = GetQuestion((int)Session["DifficultyLvl"], cid);
            int numberofquestionsasked = (int)Session["NoOfQuestionsAsked"];
            int correctanswers = (int)Session["CorrectAnswers"];
            int answeredwrong = (int)Session["AnsweredWrong"];
            if (op != null)
            {
                numberofquestionsasked++;
                Session["NoOfQuestionsAsked"] = numberofquestionsasked;
                if (op.Equals(quest[index].Answer))
                {
                    correctanswers++;
                    Session["CorrectAnswers"] = correctanswers;
                    quest[index].ObtainedMarks = quest[index].Marks;
                    db.SaveChanges();

                    if ((correctanswers == 3 && ((int)Session["NoOfQuestionsAsked"]) == 5) || (((int)Session["CorrectAnswers"] > (int)Session["AnsweredWrong"]) && (int)Session["NoOfQuestionsAsked"] == 5))
                    {
                        int difficultylvl = (int)Session["DifficultyLvl"];
                        difficultylvl++;
                        Session["DifficultyLvl"] = difficultylvl;
                        quest = GetQuestion((int)Session["DifficultyLvl"], cid);
                        index = 0;
                        ViewData["Index"] = index;
                        numberofquestionsasked = 0;
                        Session["NoOfQuestionsAsked"] = numberofquestionsasked;
                    }
                    if (((int)Session["CorrectAnswers"] < (int)Session["AnsweredWrong"]) && (int)Session["NoOfQuestionsAsked"] == 5)
                    {
                        int difficultylvl = (int)Session["DifficultyLvl"];
                        difficultylvl--;
                        Session["DifficultyLvl"] = difficultylvl;
                        quest = GetQuestion((int)Session["DifficultyLvl"], cid);
                        index = 0;
                        ViewData["Index"] = index;
                        numberofquestionsasked = 0;
                        Session["NoOfQuestionsAsked"] = numberofquestionsasked;
                    }

                    if ((int)Session["NoOfQuestionsAsked"] != 0)
                    {
                        index++;
                        ViewData["Index"] = index;
                        count++;
                        ViewData["Count"] = count;
                    }

                    if (index != quest.Count)
                        ViewData["Question"] = quest[index];
                    else
                        //return View("FormResults/"+id+"&op="+op+"&cid="+cid+"&qid="+index);
                        return RedirectToAction("ProcessResult", "Quiz", new { id = id, cid = cid, op = op, qid = index });
                }
                else
                {
                    answeredwrong++;
                    Session["AnsweredWrong"] = answeredwrong;
                    //db.SaveChanges();
                    index++;
                    ViewData["Index"] = index;
                    count++;
                    ViewData["Count"] = count;
                    if (index != quest.Count)
                        ViewData["Question"] = quest[index];
                    else
                        //return View("FormResults/"+id+"&op="+op+"&cid="+cid+"&qid="+index);
                        return RedirectToAction("ProcessResult", "Student", new { id = id, cid = cid, op = op, qid = index });
                }

                //if (count >= 3)
                //    difficultylvl = 3;
                // noofquestionsasked++;
                //ViewData["NoOfQuestions"] = noofquestionsasked;


            }
            ViewData["Question"] = quest[index];
            ViewData["Quiz"] = quiz;
            ViewData["Course"] = course;
            return View("TakeQuiz");








            //var Quiz = db.Quiz.Find(id);
            //var Question = db.QuestionPool.Where(m => m.QuizID == Quiz.QuizID).ToList();
            //Quiz.Questions = Question;


            //for (int i = 0; i < Question.Count; i++)
            //{

            //        var question = Quiz.Questions[i];
            //        question.QuestionOptions = db.QuestionOption.Where(m => m.QuestionID == question.QuestionID).ToList();
            //}

            //return View("TakeQuiz", Quiz);
        }

        public List<QuestionPoolModel> GetQuestion(int difficultylevel, int courseid)
        {
            return db.QuestionPool.Where(c => c.Quiz.CourseID == courseid && c.DifficultyLevel == difficultylevel).ToList();
        }

        public ActionResult EnteredQuiz(int id)
        {
            var Quiz = db.Quiz.Find(id);
            var Question = db.QuestionPool.Where(m => m.QuizID == Quiz.QuizID).ToList();

            Quiz.Questions = Question;
            for (int i = 0; i < Question.Count; i++)
            {

                var ques = Quiz.Questions[i];
                ques.QuestionOptions = db.QuestionOption.Where(m => m.QuestionID == ques.QuestionID).ToList();
            }

            FilteredQuestions filteredQuestion = new FilteredQuestions();
            filteredQuestion.QuizID = Quiz.QuizID;
            filteredQuestion.QuizName = Quiz.QuizName;
            var question = Quiz.Questions.Where(j => j.DifficultyLevel == 1).ToList();

            filteredQuestion.Question = question[0];
            filteredQuestion.count = 0;

            return View("EnteredQuiz", filteredQuestion);
        }

        [HttpPost]
        public ActionResult EnteredQuiz(FilteredQuestions filteredQuestion)
        {

            int id = filteredQuestion.QuizID;
            filteredQuestion.Question.Marks = 2;

            //FilteredQuestions filteredQuestion = new FilteredQuestions();

            if (filteredQuestion.correct > 3)
            {
                filteredQuestion.difficulty++;
            }

            
            return View("EnteredQuiz", filteredQuestion);
        }

        public JsonResult GetQuestion(int id = 0)
        {

            //var quiz = db.Quiz.Find(id);
            //var question = db.Question.Where(m=> m.QuizID == quiz.QuizID).ToList();
            //db.Quiz.Include(n => n.Questions.Where(l=> l.QuestionID == question.w))
            //var question = db.QuestionP.Include("QuestionOptions");

            //var question = db.Question.Where(m => m.QuizID == id);
            //var ques = db.Entry(question).Reference().Load();

            //var question = db.QuestionPool.Find(id).QuestionOptions = db.QuestionOption.Where(m => m.QuestionID == id).ToList();
            return Json(db.QuestionPool.Find(id), JsonRequestBehavior.AllowGet);
        }

        public ActionResult EnterQuiz()
        {
            return View();
        }

       



        //[HttpPost]
        ////[ValidateAntiForgeryToken]
        //public ActionResult TakeQuiz(QuizViewModel quizviewmodel)
        //{
            
        //    if (ModelState.IsValid)
        //    {

        //        //Compares the answers then finds the Question from the QuestionPool and Adds Marks
        //        if (quizviewmodel.Question.Answer == quizviewmodel.AnswerSelected)
        //        {
                    
        //            db.QuestionPool.Find(quizviewmodel.Question.QuestionID).Marks = 1;
        //        }
        //        else
        //        {
        //            db.QuestionPool.Find(quizviewmodel.Question.QuestionID).Marks = 0;
        //        }
        //        db.SaveChanges();
        //        return RedirectToAction("Create", "QuestionPool", new { id = quizviewmodel.Quiz.QuizID });
        //        //return RedirectToAction("Index");
        //    }

        //    return View(quizviewmodel);
        //}

        public QuestionPoolModel getNextQuestion(int id, int count){
            var Quiz = db.Quiz.Find(id);
            var Question = db.QuestionPool.Where(m => m.QuizID == Quiz.QuizID).ToList();
            Quiz.Questions = Question;
            var Options = new List<QuestionOption>();
            foreach (var question in Question.Where(m => m.DifficultyLevel == 1))
            {
                Options = db.QuestionOption.Where(m => m.QuestionID == question.QuestionID).ToList();
                question.QuestionOptions = Options;
            }

            return Quiz.Questions[1];
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}