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

            //context.QuestionPool.Add(new QuestionPoolModel() { Question = "What is a Database?", QuestionOptionFour = "Nothing", QuestionOptionOne = "Nothing", QuestionOptionTwo = "None of the Above", QuestionOptionThree = "Really Tricky Course", DifficultyLevel = 1, Marks = 20, Subject = "Database", Answer = "None of the Above" });
            //context.QuestionPool.Add(new QuestionPoolModel() { Question = "What is a Software Engineering", QuestionOptionFour = "Nothing", QuestionOptionOne = "Nothing", QuestionOptionTwo = "None of the Above", QuestionOptionThree = "Really Tricky Course", DifficultyLevel = 1, Marks = 20, Subject = "Database", Answer = "None of the Above" });

            //context.QuestionPool.Add(new QuestionPoolModel()
            //{
            //    Quiz = context.Quiz.Add(new QuizModel { QuizName = "Metaphysics", NumberOfQuestions = 5, HighestMarks = 20, Duration = "3 hrs", CreatedDate = System.DateTime.Now, CreatedBy = "Admin" }),
            //    Question = "What is Nothingness",
            //    QuestionOptionOne = "Oblivion",
            //    QuestionOptionTwo = "End",
            //    QuestionOptionThree = "Something",
            //    QuestionOptionFour = "All of the Above"
            //});

            //context.QuestionPool.Add(new QuestionPoolModel(){ Quiz = context.Quiz.Add(new QuizModel{ QuizName = "Maths Quiz", NumberOfQuestions = 5, HighestMarks=20, Duration="20 min", CreatedDate = System.DateTime.Now, CreatedBy = "Admin"  }),
            //    Question = "What is 2 + 2?", Answer = "4", DifficultyLevel = 1, Marks = 1, 
            //    QuestionOptions = context.QuestionOption.Add
            //});

            QuestionOption optionOne = new QuestionOption(){ QuestionOptionStatement = "2"};
            QuestionOption optionTwo = new QuestionOption(){ QuestionOptionStatement = "0"};
            QuestionOption optionThree = new QuestionOption(){ QuestionOptionStatement = "4" };
            QuestionOption optionFour = new QuestionOption(){ QuestionOptionStatement = "5"};

            List<QuestionOption> listOptions = new List<QuestionOption>(){ optionOne,optionTwo,optionThree,optionFour };
            QuizModel quiz = new QuizModel() { QuizName = "Maths Quiz", NumberOfQuestions = 5, HighestMarks = 20, Duration = "20 min", CreatedDate = System.DateTime.Now, CreatedBy = "Admin" };
            QuestionPoolModel question = new QuestionPoolModel() { Question = "What is 2 + 2?", Answer = "4", DifficultyLevel = 1, Marks = 1, Quiz = quiz, QuestionOptions = listOptions };
            context.QuestionOption.Add(optionOne);
            context.QuestionPool.Add(question);
            context.QuestionOption.Add(optionOne);
            context.QuestionOption.Add(optionTwo);
            context.QuestionOption.Add(optionThree);
            context.QuestionOption.Add(optionFour);

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