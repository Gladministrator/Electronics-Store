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
            }
            else if (productID > 0)
            {
                pnlOrder.Visible = true;

            }
        }
    }
}