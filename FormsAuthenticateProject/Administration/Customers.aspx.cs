using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FormsAuthenticateProject.Administration
{
    public partial class Customers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnFirstSearch_Click(object sender, EventArgs e)
        {
            LoadGridView("Load_Account_Search_First_Name");
        }

        protected void btnLastSearch_Click(object sender, EventArgs e)
        {
            LoadGridView("Load_Account_Search_Last_Name");
        }
        private void LoadGridView(string storedProcedure)
        {
            string searchText = txtInputSearch.Text.Trim();
            DatabaseObject connection = new DatabaseObject(storedProcedure);
            DataSet data = connection.LoadTableWithParams("@Query", searchText);
            if (data != null)
            {
                gvCustomersMaintenance.DataSource = data;
                gvCustomersMaintenance.DataBind();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var text = txtInputSearch.Text = txtInputSearch.Text.Trim();
            DatabaseObject connection = new DatabaseObject("Load_Customer");
            DataSet data = connection.LoadTableWithParams("@ID", text);
        }
    }
}