using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectSchool.Admin
{
    public partial class AddSchedule : System.Web.UI.Page
    {
        public string studentName;

        protected void Page_Load(object sender, EventArgs e)
        {
            studentName = Session["StudentName"]?.ToString();

            if (!IsPostBack)
            {
                StudentNameLabel.Text = studentName;
                StudentGrid.DataSource = GetStudentInfo();
                StudentGrid.DataBind();
            }

        }
        public DataTable GetStudentInfo()
        {
            SqlConnection objSqlConnection = new SqlConnection(
                    WebConfigurationManager.ConnectionStrings["StudentDataBaseConnection"].ConnectionString);
            var command = String.Format("Select CourseId, CourseName, Attendence, Quiz, HomeWork,Research,LabPractice,FinalExam, GrandSum from student s left join StudentCourses sc on s.StudentId = sc.StudentId inner join Subject sb on sb.Id = sc.CourseId where s.StudentId = {0}", Session["StudentId"]);
            SqlCommand objSqlCommand = new SqlCommand(command, objSqlConnection);
            objSqlConnection.Open();

            var dataReader = objSqlCommand.ExecuteReader();

            var dataTable = new DataTable();
            dataTable.Load(dataReader);

            objSqlConnection.Close();

            return dataTable;

        }
        protected void AddBtn_Click(object sender, EventArgs e)
        {
            List<string> listOfSubjects = new List<string>();
            foreach (ListItem listItem in ListBoxSubjects.Items)
            {
                if (listItem.Selected)
                {
                    listOfSubjects.Add(listItem.Value);

                }
            }
            InsertSubjects(listOfSubjects);
            StudentGrid.DataSource = GetStudentInfo();
            StudentGrid.DataBind();
        }
        public void InsertSubjects(List<string> listOfSubjects)
        {
            StringBuilder stringbuild = new StringBuilder(string.Empty);
            foreach (string item in listOfSubjects)
            {

                stringbuild.Append($"Insert into [StudentCourses] (CourseId,StudentId) Values ({item},{Session["StudentId"]});");

            }

            SqlConnection objSqlConnection = new SqlConnection(
               WebConfigurationManager.ConnectionStrings["StudentDataBaseConnection"].ConnectionString);
            objSqlConnection.Open();
            SqlCommand objSqlCommand = new SqlCommand();
            objSqlCommand.CommandText = stringbuild.ToString();
            objSqlCommand.Connection = objSqlConnection;
            var dataReader = objSqlCommand.ExecuteReader();
            objSqlConnection.Close();
        }

        protected void StudentGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            GridViewRow row = (GridViewRow)(((Control)e.CommandSource).NamingContainer);
            int RowIndex = row.RowIndex;
            SqlConnection objSqlConnection = new SqlConnection(
                    WebConfigurationManager.ConnectionStrings["StudentDataBaseConnection"].ConnectionString);
            if (e.CommandName == "score")
            {
                Session["CourseId"] = StudentGrid.DataKeys[RowIndex].Value;
                Response.Redirect(@"\Admin\ScoreSubject.aspx");
                //var total = Convert.ToInt32(Attendence.Text) + Convert.ToInt32(quiz.Text) + Convert.ToInt32(HomeWork.Text) + Convert.ToInt32(Reasearch.Text) + Convert.ToInt32(LabPractice.Text) + Convert.ToInt32(FinalExam.Text);
                //var command = String.Format("Update StudentCourses Set Attendence = {0},Quiz= {1},HomeWork={2},Research={3},LabPractice={4},FinalExam={5} Where CourseId = {6} and StudentId = {7}", Convert.ToInt32(Attendence.Text), Convert.ToInt32(quiz.Text), Convert.ToInt32(HomeWork.Text), Convert.ToInt32(Reasearch.Text), Convert.ToInt32(LabPractice.Text), Convert.ToInt32(FinalExam.Text), StudentGrid.DataKeys[RowIndex].Value,Session["StudentId"]);
                //SqlCommand objSqlCommand = new SqlCommand(command, objSqlConnection);
                
                //objSqlConnection.Open();

                //objSqlCommand.ExecuteNonQuery();

                //objSqlConnection.Close();

                //e.Handled = true;
                //StudentGrid.DataSource = GetStudentInfo();
                //StudentGrid.DataBind();
            }
        }
        //protected void StudentGrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        //{
        //    var key1 = e.Keys[0];
        //    var key2 = e.Keys[1];
        //    var field0 = e.Values[0];
        //    var field4 = e.Values[4];
        //}

        //protected void StudentGrid_RowUpdating(object sender, GridViewUpdateEventArgs e)
        //{
        //    var key1 = e.Keys[0];
        //    var key2 = e.Keys[1];
        //    var field0 = e.NewValues[0];
        //    var field4 = e.NewValues[4];
        //}
    }
}
