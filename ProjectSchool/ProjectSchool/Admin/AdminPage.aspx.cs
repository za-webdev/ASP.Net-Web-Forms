using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectSchool
{
    public partial class AdminPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                StudentGrid.DataSource = ShowListOfStudents();
                StudentGrid.DataBind();
            }
        }
        protected void SubmitBtn_Click(object sender, EventArgs e)
        {
            Session["StudentId"] = StudentList.SelectedValue;
            Session["StudentName"] = StudentList.SelectedItem;

            Response.Redirect(@"\Admin\AddSchedule.aspx");
        }

        public DataTable ShowListOfStudents()
        {
            SqlConnection objSqlConnection = new SqlConnection(
                 WebConfigurationManager.ConnectionStrings["StudentDataBaseConnection"].ConnectionString);

            var command = String.Format("Select * from Student");
            SqlCommand objSqlCommand = new SqlCommand(command, objSqlConnection);
            objSqlConnection.Open();

            var dataReader = objSqlCommand.ExecuteReader();

            var dataTable = new DataTable();
            dataTable.Load(dataReader);

            objSqlConnection.Close();

            return dataTable;
        }

        protected void StudentGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            GridViewRow row = (GridViewRow)(((Control)e.CommandSource).NamingContainer);
            int RowIndex = row.RowIndex;
            SqlConnection objSqlConnection = new SqlConnection(
                    WebConfigurationManager.ConnectionStrings["StudentDataBaseConnection"].ConnectionString);
            if (e.CommandName == "delete")
            {
                 var command = String.Format("DELETE FROM Student WHERE StudentId = {0}", StudentGrid.DataKeys[RowIndex].Value);
                SqlCommand objSqlCommand = new SqlCommand(command, objSqlConnection);
                objSqlConnection.Open();

                objSqlCommand.ExecuteNonQuery();

                objSqlConnection.Close();

                e.Handled = true;
                StudentGrid.DataSource = ShowListOfStudents();
                StudentGrid.DataBind();
            }

            else if(e.CommandName == "schedule")
            {
                Session["StudentId"] = StudentGrid.DataKeys[RowIndex].Value;
                Session["StudentName"] = StudentGrid.DataKeys[RowIndex].Value;
                Response.Redirect(@"\Admin\AddSchedule.aspx");
            }
        }
        protected void Add_Click(object sender, EventArgs e)
        {
            Response.Redirect(@"\Admin\AddStudent.aspx");
        }


    }
}

//select* from student s
//left join StudentCourses sc on s.StudentId = sc.StudentId
//left join Subject sb on sb.Id = sc.Id