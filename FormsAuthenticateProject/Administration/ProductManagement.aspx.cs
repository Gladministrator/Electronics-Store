using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FormsAuthenticateProject.Administration
{
    public partial class ProductManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void TaskGridView_RowUpdatingSupplier(object sender, GridViewUpdateEventArgs e)
        {
            DataSet databaseTable = HelperMethods.LoadTable("Load_Products");
            Server.HtmlEncode(e.NewValues["product_name"].ToString().Trim());
            e.NewValues["product_name"] = Server.HtmlEncode(e.NewValues["product_name"].ToString().Trim());
            var newValue = e.NewValues["product_name"].ToString();
            var oldValue = e.OldValues["product_name"].ToString();
            if (HelperMethods.isDuplicate(databaseTable, newValue, "product_name") && oldValue != newValue)
            {
                e.Cancel = true;
                cvSupplierDescription.IsValid = false;
            }
        }

        protected void btnAddSupplier_Click(object sender, EventArgs e)
        {
            var supplierTextBox = (TextBox)gvProductAdmin.FooterRow.FindControl("txtSupplierName");
            var supplierName = supplierTextBox.Text.Trim();
            var supplierAddressTextBox = (TextBox)gvProductAdmin.FooterRow.FindControl("txtSupplierAddress");
            var supplierAddress = supplierAddressTextBox.Text.Trim();
            var supplierContactTextbox = (TextBox)gvProductAdmin.FooterRow.FindControl("txtSupplierContact");
            var supplierContact = supplierContactTextbox.Text.Trim();
            var supplierPhoneTextBox = (TextBox)gvProductAdmin.FooterRow.FindControl("txtSupplierPhone");
            var supplierPhone = supplierPhoneTextBox.Text.Trim();
            var statusCheckBox = (CheckBox)gvProductAdmin.FooterRow.FindControl("cbSupplierStatus");
            var status = statusCheckBox.Checked.ToString();

            DataSet databaseTable = HelperMethods.LoadTable("Load_Products");
            if (databaseTable != null)
            {

                if (!HelperMethods.isDuplicate(databaseTable, supplierName, "product_name"))
                {
                    DatabaseObject connection = new DatabaseObject("Add_Supplier");
                    connection.InsertWithParams("@CompanyName", supplierName, "@CompanyAddress", supplierAddress,
                        "@MainContactName", supplierContact, "@MainPhone", supplierPhone, "@Status", status);

                    Response.Redirect("~/Administration/Suppliers.aspx");
                }
                else
                {
                    cvSupplierDescription.IsValid = false;
                }
            }
            else Response.Redirect("~/Account/Login.aspx?LoginText=An Error Occured, Please Log In Again");
        }
    }
}