using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FormsAuthenticateProject.Administration
{
    public partial class Orders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSearchOrderNumber_Click(object sender, EventArgs e)
        {
            var search = txtSearchInvoice.Text.Trim();
            DatabaseObject connection = new DatabaseObject("Load_Admin_Invoice_ID");
            DataSet data = connection.LoadTableWithParams("@InvoiceNumber", search);
            if (data == null)
            {
                Response.Redirect("~/Account/Login.aspx?LoginText=An Error Occured, Please Log In Again");
            }
            if (data.Tables.Count == 0 || data.Tables[0].Rows.Count == 0)
            {
                pnlOrderDetails.Visible = false;
                cvNotFound.ErrorMessage = $"No Active Invoice with the ID {search} was found.";
                cvNotFound.IsValid = false;
                return;
            }
            else
            {
                lblWarning1.Visible = false;
                lblWarning2.Visible = true;
                pnlOrderDetails.Visible = true;
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Orders.aspx");
        }

        protected void gvTrackedOrder_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            var productId = e.NewValues["product_id"]?.ToString();
            var invoiceTotal = e.NewValues["invoice_total"]?.ToString();
            var address = e.NewValues["delivery_address"]?.ToString()?.Trim();

            if (!int.TryParse(productId, out int result))
            {
                cvEdit.ErrorMessage = "Product ID was not in a valid format; must be a number";
                cvEdit.IsValid = false;
                e.Cancel = true;
            }
            else if (!decimal.TryParse(invoiceTotal, out decimal result2))
            {
                cvEdit.ErrorMessage = "Invoice Total ID was not in a valid format; must be a number";
                cvEdit.IsValid = false;
                e.Cancel = true;
            }
            else if (address.Length == 0)
            {
                cvEdit.ErrorMessage = "Please Enter an Address";
                cvEdit.IsValid = false;
                e.Cancel = true;
            }
        }

        protected void gvTrackedOrder_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            DataRowView rowView = (DataRowView)e.Row.DataItem;
            if (rowView == null) return;
            if (rowView["shipping_status"].ToString() == "True")
            {
                e.Row.Cells[0].Enabled = false;
                e.Row.Cells[0].Text = "View Only";
                lblWarning1.Visible = true;
                lblWarning2.Visible = false;
            }
            else
            {
                return;
            }



        }
    }
}