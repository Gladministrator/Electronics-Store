using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FormsAuthenticateProject.Customer
{
    public partial class OrderProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var ds = HelperMethods.LoadTable("Load_Suppliers");
                HelperMethods.LoadDropDown(DropDownList1, ds, "id", "company_name");
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlOrder.Visible = false;
            var supplierID = Convert.ToInt32(DropDownList1.SelectedValue);
            DropDownList3.Items.Clear();

            if (supplierID == -1)
            {
                pnlOrder.Visible = false;
                DropDownList2.Items.Clear();
            }
            else if (supplierID > 0)
            {
                var ds = HelperMethods.LoadTable("Load_Category_Table");
                HelperMethods.LoadDropDown(DropDownList2, ds, "id", "description");
            }
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlOrder.Visible = false;
            var categoryID = Convert.ToInt32(DropDownList2.SelectedValue);

            if (categoryID == -1)
            {
                pnlOrder.Visible = false;
                DropDownList3.Items.Clear();
            }
            else if (categoryID > 0)
            {
                var db = new DatabaseObject("Load_Order_Products");
                var ds = db.LoadTableWithParams("@Supplier", DropDownList1.SelectedValue, "@Category",
                    categoryID.ToString());
                HelperMethods.LoadDropDown(DropDownList3, ds, "id", "product_name");
            }

        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            var productID = Convert.ToInt32(DropDownList3.SelectedValue);

            if (productID == -1)
            {
                pnlOrder.Visible = false;
                return;
            }


            DatabaseObject db = new DatabaseObject("Get_Product_Price");
            var result = db.Get_Price(DropDownList3.SelectedValue);

            if (result > 0M)
            {
                var taxes = result * 0.13M;
                lblProduct.Text = $"{DropDownList3.SelectedItem.Text}";
                lblPrice.Text = $"Price: ${result.ToString("0.00")}";
                lblTaxes.Text = $"Taxes: ${taxes.ToString("0.00")}";
                lblTotal.Text = $"{(result + taxes).ToString("0.00")}";
                pnlOrder.Visible = true;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            var cardHolder = txtCardName.Text.Trim();
            var cardType = dlCardType.SelectedValue;
            var cardNumber = txtCardNumber.Text.Trim();
            var code = txtSecurity.Text.Trim();
            var expiryMonth = dlMonth.SelectedValue;
            var expiryYear = dlYear.SelectedValue;

            var address = txtAddress.Text.Trim();
            var apt = txtApt.Text.Trim();
            var city = txtCity.Text.Trim();
            var region = dlRegion.SelectedValue;
            var addressCode = txtPost.Text.Trim();

            var total = lblTotal.Text;

            var account = Session["ID"].ToString();
            var product = DropDownList3.SelectedValue;

            DatabaseObject db = new DatabaseObject("Add_Invoice");
            var result = db.InsertWithParams("@Account", account, "@ProductID", product, "@Total",
                total, "@CardHolder", cardHolder, "@CardType", cardType,
                "@CardNumber", cardNumber, "@CardSecurityCode", code, "@Year", expiryYear,
                "@Month", expiryMonth, "@Address", address, "@Unit", apt, "@City", city, "@Region", region,
                "@Postal", addressCode);

            if (result > 0)
            {
                Response.Redirect("ViewHistory.aspx");
            }
            else
            {
                Response.Redirect($"~/Account/Login.aspx?LoginText={db.error.Message}");
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("OrderProduct.aspx");
        }
    }
}