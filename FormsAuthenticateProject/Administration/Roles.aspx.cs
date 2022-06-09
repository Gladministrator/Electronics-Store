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
                DatabaseObject connection = new DatabaseObject("Load_Role_Table");
                DataSet gridData = connection.LoadTable();
                gvRoles.DataSource = gridData;
                gvRoles.DataBind();
            }
        }
    }
}