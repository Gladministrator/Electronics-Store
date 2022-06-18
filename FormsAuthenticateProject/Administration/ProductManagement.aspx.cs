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
            if (!IsPostBack)
            {
                var ds = HelperMethods.LoadTable("Load_Suppliers");
                HelperMethods.LoadDropDown(dlSupplierSelect, ds, "id", "company_name");
            }


        }

        protected void TaskGridView_RowUpdatingProduct(object sender, GridViewUpdateEventArgs e)
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

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            var productText = (TextBox)gvProductAdmin.FooterRow.FindControl("txtProductName");
            var product = productText.Text.Trim();
            var supplierDropDown = (DropDownList)gvProductAdmin.FooterRow.FindControl("dlInsertSupplier");
            var supplier = supplierDropDown.SelectedValue;
            var categoryDropDown = (DropDownList)gvProductAdmin.FooterRow.FindControl("dlInsertCategory");
            var category = categoryDropDown.SelectedValue;
            var priceText = (TextBox)gvProductAdmin.FooterRow.FindControl("txtPriceFooter");
            var price = priceText.Text.Trim();
            var statusCheckBox = (CheckBox)gvProductAdmin.FooterRow.FindControl("cbStatus");
            var status = statusCheckBox.Checked.ToString();

            if (supplier == "-1")
            {
                cvCustomText.ErrorMessage = "Please Select a Supplier";
                cvCustomText.IsValid = false;
                return;
            }
            else if (category == "-1")
            {
                cvCustomText.ErrorMessage = "Please Select a Category";
                cvCustomText.IsValid = false;
                return;
            }

            DataSet dataset = HelperMethods.LoadTable("Load_Products");
            if (dataset != null)
            {
                // Check if there's a duplicate
                DataTable productTable = dataset.Tables[0];
                var dataList = productTable.AsEnumerable()
                    .Where(row => row.Field<string>("product_name") == product
                    && row.Field<int>("supplier_id") == Convert.ToInt32(supplier))
                    .Select(row => row.Field<int>("id"))
                    .ToList();

                if (dataList.Count == 0)
                {
                    DatabaseObject connection = new DatabaseObject("Add_Product");
                    var result = connection.InsertWithParams("@ProductName", product, "@SupplierID", supplier,
                        "@CategoryID", category, "@Price", price, "@Status", status);

                    if (result >= 0)
                    {
                        gvProductAdmin.DataBind();
                    }
                    else Response.Redirect("~/Account/Login.aspx?LoginText=An Error Occured, Please Log In Again");
                }
                else
                {
                    cvCustomText.IsValid = false;
                    cvCustomText.ErrorMessage = "A duplicate record already exists";
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

        protected void dlSupplierSelect_SelectedIndexChanged(object sender, EventArgs e)
        {
            var supplierID = Convert.ToInt32(dlSupplierSelect.SelectedValue);
            if (supplierID == -1)
            {
                pnlGrid.Visible = false;
            }
            else
            {
                pnlGrid.Visible = true;
                SqlDataSource1.SelectParameters[0].DefaultValue = supplierID.ToString();
            }
        }
    }
}