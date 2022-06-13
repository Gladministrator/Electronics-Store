using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FormsAuthenticateProject.Administration
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var role = Session["Role"]?.ToString();
            if (role != "Administration")
            {
                var redirectLink = HelperMethods.RoleRedirect(role);
                Response.Redirect(redirectLink);
            }
        }

        protected void lnkSignOut_Click(object sender, EventArgs e)
        {
            HelperMethods.SignOut();
        }

        protected void lnkManageRoles_Click(object sender, EventArgs e)
        {
            Response.Redirect("Roles.aspx");
        }

        protected void lnkManageCategories_Click(object sender, EventArgs e)
        {
            Response.Redirect("Category.aspx");
        }

        protected void lnkCustomerMaintenance_Click(object sender, EventArgs e)
        {
            Response.Redirect("Customers.aspx");
        }

        protected void lnkManageSuppliers_Click(object sender, EventArgs e)
        {
            Response.Redirect("Suppliers.aspx");
        }

        protected void lnkProducts_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProductManagement.aspx");
        }
    }
}