using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FormsAuthenticateProject.Administration
{
    public partial class Roles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataSet gridData = LoadTableData();
                if (gridData != null)
                {
                    gvRoles.DataSource = gridData;
                    gvRoles.DataBind();
                }
                else Response.Redirect("~/Account/Login.aspx");
            }
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            var roleDescriptionTextBox = (TextBox)gvRoles.FooterRow.FindControl("txtDescription");
            var role = roleDescriptionTextBox.Text;
            var statusDropDown = (DropDownList)gvRoles.FooterRow.FindControl("dlStatus");
            var status = statusDropDown.SelectedValue == "1" ? true : false;

            DataSet databaseTable = LoadTableData();
            if (databaseTable != null)
            {
                if (!HelperMethods.isDuplicate(databaseTable, role))
                {
                    DatabaseObject connection = new DatabaseObject("Add_Role");
                    connection.AddToTable(role, status);
                    Response.Redirect("~/Administration/Roles.aspx");
                }
                else
                {
                    cvDescriptionName.IsValid = false;
                }
            }
            else Response.Redirect("~/Account/Login.aspx?LoginText=An Error Occured, Please Log In Again");
        }
        private DataSet LoadTableData()
        {
            DatabaseObject connection = new DatabaseObject("Load_Role_Table");
            return connection.LoadTable();
        }
    }
}