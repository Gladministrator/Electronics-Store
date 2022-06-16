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

            //var categoryDropDown = (DropDownList)gvProductAdmin.FooterRow.FindControl("dlInsertCategory");
            //DataSet data = HelperMethods.LoadTable("Load_Category_Table");
            //HelperMethods.LoadDropDown(categoryDropDown, data, "id", "description");
        }

        protected void TaskGridView_RowUpdatingSupplier(object sender, GridViewUpdateEventArgs e)
        {
            var identity = (Label)gvProductAdmin.Rows[e.RowIndex].FindControl("lblIdentity");
            var categoryDropDown = (DropDownList)gvProductAdmin.Rows[e.RowIndex].FindControl("dlCategoryEdit");
            var supplierDropDown = (DropDownList)gvProductAdmin.Rows[e.RowIndex].FindControl("dlSupplierEdit");
            if (supplierDropDown.SelectedValue == "-1")
            {
                cvUpdateSupplier.IsValid = false;
                e.Cancel = true;
            }
            else if (categoryDropDown.SelectedValue == "-1")
            {
                cvUpdateCategory.IsValid = false;
                e.Cancel = true;
            }
            else
            {
                SqlDataSource1.UpdateCommand = "UPDATE [product] SET [product_name] = @product_name," +
                $"[supplier_id] = {Convert.ToInt32(supplierDropDown.SelectedValue)},[category_id] = {Convert.ToInt32(categoryDropDown.SelectedValue)}, " +
                    "[retail_price] = @retail_price, " +
                    "[status] = TRY_CAST (@status AS bit) WHERE [id] = @id";
            }

        }

        protected void btnAddSupplier_Click(object sender, EventArgs e)
        {
            var supplierTextBox = (TextBox)gvProductAdmin.FooterRow.FindControl("dlCategoryEdit");
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
                }
            }
            else Response.Redirect("~/Account/Login.aspx?LoginText=An Error Occured, Please Log In Again");
        }

        protected void gvProductAdmin_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    // Load DropDowns

                    var hiddenCategoryId = (HiddenField)e.Row.FindControl("HiddenField1");
                    DropDownList categoryDropDown = (DropDownList)e.Row.FindControl("dlCategoryEdit");
                    var data = HelperMethods.LoadTable("Load_Category_Table");
                    HelperMethods.LoadDropDown(categoryDropDown, data, "id", "description");
                    categoryDropDown.SelectedValue = hiddenCategoryId.Value.Trim();

                    var hiddenSupplierId = (HiddenField)e.Row.FindControl("HiddenFieldSupplier");
                    DropDownList supplierDropDown = (DropDownList)e.Row.FindControl("dlSupplierEdit");
                    var data2 = HelperMethods.LoadTable("Load_Suppliers");
                    HelperMethods.LoadDropDown(supplierDropDown, data2, "id", "company_name");
                    supplierDropDown.SelectedValue = hiddenSupplierId.Value.Trim();
                }
            }

        }
    }
}