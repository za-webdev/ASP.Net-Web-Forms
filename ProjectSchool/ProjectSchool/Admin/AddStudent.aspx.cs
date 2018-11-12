using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectSchool.Admin
{
    public partial class AddStudent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SubmitBtn_Click(object sender, EventArgs e)
        {
            SqlConnection objSqlConnection = new SqlConnection(
                    WebConfigurationManager.ConnectionStrings["StudentDataBaseConnection"].ConnectionString);
            var command = String.Format("Insert into student (FirstName , LastName, StudentCode) Values('{0}','{1}','{2}')",FName.Text,Lname.Text,SCode.Text);
            SqlCommand objSqlCommand = new SqlCommand(command, objSqlConnection);
            objSqlConnection.Open();

            objSqlCommand.ExecuteNonQuery();
            objSqlConnection.Close();

            Response.Redirect(@"\Admin\AdminPage.aspx");

        }
    }
}