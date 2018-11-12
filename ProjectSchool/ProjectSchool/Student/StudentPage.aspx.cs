using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace ProjectSchool
{
    public partial class StudentPage : System.Web.UI.Page
    {
        public string studentCode;
        protected void Page_Load(object sender, EventArgs e)
        {
            studentCode = Session["StudentCode"]?.ToString();

            if (!IsPostBack)
            {
                StudentCodeLable.Text = studentCode;
                myGrid.DataSource = GetStudentByStudentCode();
                myGrid.DataBind();
            }
          
        }

        // Service Method Sample Implementation
        //public Student GetStudentByStudentCode(string studentCode)
        //{
        //    if(!string.IsNullOrEmpty(studentCode))
        //    {
        //        return repository.GetStudentByStudentCode(studentCode);
        //    }
        //    else
        //    {
        //        //throw new Exception();
        //        return null;
        //    }
        //}

        public DataTable GetStudentByStudentCode()
        {
            //var studentService = new StudentService();
            //var student = studentService.GetStudentByStudentCode(Session["StudentCode"]);

            //return student;

            SqlConnection objSqlConnection = new SqlConnection(
                 WebConfigurationManager.ConnectionStrings["StudentDataBaseConnection"].ConnectionString);

            var command = String.Format("Select FirstName, LastName,Description,GrandSum,GPA from Student where StudentCode = '{0}'", Session["StudentCode"]);
            SqlCommand objSqlCommand = new SqlCommand(command, objSqlConnection);
            objSqlConnection.Open();

            var dataReader = objSqlCommand.ExecuteReader();

            var dataTable = new DataTable();
            dataTable.Load(dataReader);

            objSqlConnection.Close();

            return dataTable;

        }

        protected void SubmitBtn_Click(object sender, EventArgs e)
        {
            SqlConnection objSqlConnection = new SqlConnection(
                 WebConfigurationManager.ConnectionStrings["StudentDataBaseConnection"].ConnectionString);

            var command = String.Format("Update Student Set Description = '{0}' where StudentCode = '{1}'",DescriptionBox.Text, Session["StudentCode"]);
            SqlCommand objSqlCommand = new SqlCommand(command, objSqlConnection);
            objSqlConnection.Open();

            var dataReader = objSqlCommand.ExecuteReader();
            myGrid.DataSource = GetStudentByStudentCode();
            myGrid.DataBind();
            DescriptionBox.Text = null;
            objSqlConnection.Close();

        }

        
    }
}
