using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FormsAuthenticateProject.Account
{
    public partial class Account : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.Request.FilePath == "/Account/Login.aspx")
            {
                Label LoginLabel = (Label)ContentPlaceHolder1.FindControl("lblLoginText");
                if (LoginLabel != null) LoginLabel.Text = Request.QueryString["LoginText"]?.ToString();
            }

        }
    }
}