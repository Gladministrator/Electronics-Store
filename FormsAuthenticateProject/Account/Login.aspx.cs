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
            if (!IsPostBack) lblLoginMsg.Visible = false;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            DatabaseObject connection = new DatabaseObject("Verify_Login");
            var result = connection.VerifyLogin(txtEmail.Text.ToString(), txtPassword.Text.ToString());

            if (result?.Tables[0]?.Rows?.Count > 0)
            {
                //Create Session with data that other pages can access when signed in
                string role;
                Session["ID"] = result.Tables[0].Rows[0]["id"].ToString();
                Session["Email"] = result.Tables[0].Rows[0]["email_address"].ToString();
                Session["Role"] = role = result.Tables[0].Rows[0]["description"].ToString();

                if (role == "Administration") Response.Redirect("~/Administration/default.aspx");
                else if (role == "Customer") Response.Redirect("~/Customer/default.aspx");
                else if (role == "Shipping") Response.Redirect("~/Shipping/default.aspx");
                else Response.Redirect("~/Account/Login.aspx?LoginText=Role Not Supported");

            }
            else if (result == null)
            {
                lblLoginMsg.Visible = true;
                lblLoginMsg.Text = connection.error.Message;
            }
            else
            {
                lblLoginMsg.Visible = true;
                lblLoginMsg.Text = "Invalid Email or Password";
            }
        }
    }
}