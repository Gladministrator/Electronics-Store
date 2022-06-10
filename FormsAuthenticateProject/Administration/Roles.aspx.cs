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
            DataSet databaseTable = LoadTableData();

            List<string> rolesList = new List<string>();

            if (databaseTable != null)
            {
                rolesList = databaseTable.Tables[0].AsEnumerable().Select(row => row.Field<string>("description")).ToList();
            }

            var roleDescriptionTextBox = (TextBox)gvRoles.FooterRow.FindControl("txtDescription");
            var role = roleDescriptionTextBox.Text;
            var statusDropDown = (DropDownList)gvRoles.FooterRow.FindControl("dlStatus");
            var status = statusDropDown.SelectedValue == "1" ? true : false;

            if (rolesList.Count > 0 && !rolesList.Contains(role))
            {
                DatabaseObject connection = new DatabaseObject("Add_Role");
                connection.AddRole(role, status);
                Response.Redirect("~/Administration/Roles.aspx");
            }
            else
            {
                cvDescriptionName.IsValid = false;
            }
        }
        private DataSet LoadTableData()
        {
            DatabaseObject connection = new DatabaseObject("Load_Role_Table");
            return connection.LoadTable();
        }
    }
}