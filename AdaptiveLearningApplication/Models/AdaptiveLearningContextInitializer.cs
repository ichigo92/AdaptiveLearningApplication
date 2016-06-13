using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace AdaptiveLearningApplication.Models
{
    public class AdaptiveLearningContextInitializer : DropCreateDatabaseAlways<AdaptiveLearningContext>
    {
        protected override void Seed(AdaptiveLearningContext context)
        {
            //QuizModel quiz = new QuizModel() { QuizName = "Database Quiz" , NumberOfQuestions = 10, CreatedDate= System.DateTime.Now , Duration="3 hrs", CreatedBy = "Admin" , HighestMarks = 20 };
            //context.Quiz.Add(quiz);

            context.QuestionPool.Add(new QuestionPoolModel() { Question="What is a Database?", QuestionOptionFour="Nothing", QuestionOptionOne="Nothing", QuestionOptionTwo="None of the Above", QuestionOptionThree="Really Tricky Course", DifficultyLevel=1,Marks=20, Subject="Database", Answer="None of the Above" });
            context.QuestionPool.Add(new QuestionPoolModel() { Question="What is a Software Engineering", QuestionOptionFour="Nothing", QuestionOptionOne="Nothing", QuestionOptionTwo="None of the Above", QuestionOptionThree="Really Tricky Course", DifficultyLevel=1,Marks=20, Subject="Database", Answer="None of the Above" });

            context.QuestionPool.Add(new QuestionPoolModel() { Quiz = context.Quiz.Add(new QuizModel {QuizName = "Metaphysics" , NumberOfQuestions = 5, HighestMarks=20, Duration = "3 hrs" , CreatedDate = System.DateTime.Now, CreatedBy = "Admin"} ), 
                Question="What is Nothingness", QuestionOptionOne = "Oblivion", QuestionOptionTwo = "End", QuestionOptionThree = "Something", QuestionOptionFour = "All of the Above"
            });

            //context.Course.Add(new Course()
            //{
            //    Teacher = context.Teacher.Add(new Teacher { TeacherFirstName = "Harley", TeacherLastName = "Quinn", TeacherAge = 28, TeacherGender = "Male" }),
            //    CourseName = "How to be an Awesome Psyco", CourseContent="Pysch 101"
            //});

            //Course course =  new Course()
            //{ 
            //    Teacher = context.Teacher.Add(new Teacher { TeacherFirstName = "Joker", TeacherLastName = "The Mad King", TeacherGender = "Male" , TeacherAge = 30}),
            //    CourseName = "How to be a Joker" , CourseContent = "Joker 101"
            //};

            //context.Student.Add(new Student()
            //{
            //    Course = context.Course.Add(course), StudentFirstName = "Joker Jr", StudentLastName = "Quinn" , StudentAge = 18, Email = "joker.jr@joker.com" , StudentGender = "Male"
            //});

            context.SaveChanges();
        }
    }
}