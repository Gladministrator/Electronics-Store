using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FormsAuthenticateProject.Customer
{
    public partial class TrackOrders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearchOrderNumber_Click(object sender, EventArgs e)
        {
            var account = Session["ID"].ToString();
            var search = txtSearch.Text.Trim();
            DatabaseObject connection = new DatabaseObject("Load_Invoice_ID");
            DataSet data = connection.LoadTableWithParams("@Query", account, "@InvoiceNumber", search);
            if (data == null)
            {
                Response.Redirect("~/Account/Login.aspx?LoginText=An Error Occured, Please Log In Again");
            }
            if (data.Tables.Count == 0 || data.Tables[0].Rows.Count == 0)
            {
                pnlOrderDetails.Visible = false;
                cvNotFound.ErrorMessage = $"No Invoice with the ID {search} was found.";
                cvNotFound.IsValid = false;
                return;
            }
            else
            {
                pnlOrderDetails.Visible = true;
                gvTrackedOrder.DataSource = data;
                gvTrackedOrder.DataBind();
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("TrackOrders.aspx");
        }
    }
}