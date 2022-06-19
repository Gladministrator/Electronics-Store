using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FormsAuthenticateProject.Customer
{
    public partial class ViewHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var account = Session["ID"].ToString();
                DatabaseObject connection = new DatabaseObject("Load_Invoices");
                DataSet data = connection.LoadTableWithParams("@Query", account);
                if (data != null)
                {
                    gvOrderHistory.DataSource = data;
                    gvOrderHistory.DataBind();
                }
            }
        }
    }
}