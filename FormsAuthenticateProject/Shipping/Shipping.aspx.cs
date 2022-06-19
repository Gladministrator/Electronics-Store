using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FormsAuthenticateProject.Shipping
{
    public partial class Shipping1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lbltext.Text = Request.QueryString["Text"]?.ToString();

                DatabaseObject connection = new DatabaseObject("Load_Invoices_By_Shipping_Status");
                DataSet data = connection.LoadTableWithParams("@Status", "0");
                if (data != null)
                {
                    gvPendingOrders.DataSource = data;
                    gvPendingOrders.DataBind();
                }
            }
        }

        protected void gvPendingOrders_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvPendingOrders.SelectedRow;
            // Load Selected ID into Panel
            var selectedID = row.Cells[1].Text;


            if (int.TryParse(selectedID, out int result))
            {
                DatabaseObject db = new DatabaseObject("Update_Shipment");
                db.Update_Shipping(result);

                Response.Redirect($"Shipping.aspx?Text=Order {result} has been Shipped!");
            }
        }
    }
}