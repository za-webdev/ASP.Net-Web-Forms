using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectSchool
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (DropDownList.SelectedValue == "Admin")
            {
                Response.Redirect(@"\Admin\AdminPage.aspx");
            }
            else if (DropDownList.SelectedValue == "Student")
            {
                Response.Write("Please Enter Your student code");
                StudentCodeBox.Visible = true;
                SubmitBtn.Visible = true;


            }

        }

        protected void SubmitBtn_Click(object sender, EventArgs e)
        {
            Session["StudentCode"] = StudentCodeBox.Text;
            Response.Redirect(@"\Student\StudentPage.aspx");

        }
    }
}

