using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FormsAuthenticateProject.Customer
{
    public partial class Customer : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var role = Session["Role"]?.ToString();
            if (role != "Customer")
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

        protected void lnkOrderProduct_Click(object sender, EventArgs e)
        {
            Response.Redirect("OrderProduct.aspx");
        }

        protected void lnkViewHistory_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewHistory.aspx");
        }

        protected void lnkTrackOrders_Click(object sender, EventArgs e)
        {
            Response.Redirect("TrackOrders.aspx");
        }

        protected void lnkChangePassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("ChangePassword.aspx");
        }

        protected void lnkHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("default.aspx");
        }
    }
}