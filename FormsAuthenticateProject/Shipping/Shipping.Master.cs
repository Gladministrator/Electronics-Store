using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FormsAuthenticateProject.Shipping
{
    public partial class Shipping : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var role = Session["Role"]?.ToString();
            if (role != "Shipping")
            {
                var redirectLink = HelperMethods.RoleRedirect(role);
                Response.Redirect(redirectLink);
            }
            else
            {
                lblName.Text = Session["Email"].ToString();
            };
        }
        protected void lnkSignOut_Click(object sender, EventArgs e)
        {
            HelperMethods.SignOut();
        }

        protected void lnkShipping_Click(object sender, EventArgs e)
        {
            Response.Redirect("Shipping.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ShippedOrders.aspx");
        }

        protected void lnkHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("default.aspx");
        }

        protected void lnkChangePassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("ChangePassword.aspx");
        }
    }
}