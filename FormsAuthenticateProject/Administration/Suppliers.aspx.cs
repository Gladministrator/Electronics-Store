using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FormsAuthenticateProject.Administration
{
    public partial class Suppliers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void TaskGridView_RowUpdatingSupplier(object sender, GridViewUpdateEventArgs e)
        {
            DataSet databaseTable = HelperMethods.LoadTable("Load_Suppliers");
            Server.HtmlEncode(e.NewValues["company_name"].ToString().Trim());
            e.NewValues["company_name"] = Server.HtmlEncode(e.NewValues["company_name"].ToString().Trim());
            var newValue = e.NewValues["company_name"].ToString();
            var oldValue = e.OldValues["company_name"].ToString();
            if (HelperMethods.isDuplicate(databaseTable, newValue, "company_name") && oldValue != newValue)
            {
                e.Cancel = true;
                cvSupplierDescription.IsValid = false;
            }
        }
    }
}