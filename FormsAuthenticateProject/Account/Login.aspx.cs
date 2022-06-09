using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FormsAuthenticateProject.Account
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            DatabaseObject connection = new DatabaseObject("Verify_Login");
            var result = connection.VerifyLogin(txtEmail.Text.ToString(), txtPassword.Text.ToString());

            if (result != null)
            {
                //Create Session with data that other pages can access when signed in

                string role;
                Session["Email"] = result.Tables[0].Rows[0]["email_address"].ToString();
                Session["Role"] = role = result.Tables[0].Rows[0]["description"].ToString();

                if (role == "Administration") Response.Redirect("~/Administration/default.aspx");
                else if (role == "Customer" || role == "Shipping") Response.Redirect("~/Customer/default.aspx");
            }
            else
            {
                lblLoginMsg.Visible = true;
                lblLoginMsg.Text = connection.error.Message;
            }
        }
    }
}