using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FormsAuthenticateProject.Shipping
{
    public partial class ShippedOrders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DatabaseObject connection = new DatabaseObject("Load_Invoices_By_Shipping_Status");
                DataSet data = connection.LoadTableWithParams("@Status", "1");
                if (data != null)
                {
                    gvPendingOrders.DataSource = data;
                    gvPendingOrders.DataBind();
                }
            }
        }
    }
}