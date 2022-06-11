using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FormsAuthenticateProject.Administration
{
    public partial class Category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            var categoryTextBox = (TextBox)gvCategoryAdmin.FooterRow.FindControl("txtCategoryDescription");
            var category = categoryTextBox.Text.Trim();
            var statusCheckBox = (CheckBox)gvCategoryAdmin.FooterRow.FindControl("cbStatus");
            var status = statusCheckBox.Checked;

            DataSet databaseTable = HelperMethods.LoadTable("Load_Category_Table");
            if (databaseTable != null)
            {

                if (!HelperMethods.isDuplicate(databaseTable, category))
                {
                    DatabaseObject connection = new DatabaseObject("Add_Category");
                    connection.AddToTable(category, status);
                    Response.Redirect("~/Administration/Category.aspx");
                }
                else
                {
                    cvCategoryDescription.IsValid = false;
                }
            }
            else Response.Redirect("~/Account/Login.aspx?LoginText=An Error Occured, Please Log In Again");
        }
        protected void TaskGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            DataSet databaseTable = HelperMethods.LoadTable("Load_Category_Table");
            Server.HtmlEncode(e.NewValues["description"].ToString().Trim());
            e.NewValues["description"] = Server.HtmlEncode(e.NewValues["description"].ToString().Trim());
            var newValue = e.NewValues["description"].ToString();
            var oldValue = e.OldValues["description"].ToString();
            if (HelperMethods.isDuplicate(databaseTable, newValue) && oldValue != newValue)
            {
                e.Cancel = true;
                cvCategoryDescription.IsValid = false;
            }
        }

    }
}