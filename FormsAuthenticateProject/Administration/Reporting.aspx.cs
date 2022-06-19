using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FormsAuthenticateProject.Administration
{
    public partial class Reporting : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var account = Session["ID"].ToString();
                DatabaseObject connection = new DatabaseObject("Load_Daily_Invoices");
                DataSet data = connection.LoadTableWithParams();
                if (data != null)
                {
                    gvReport.DataSource = data;
                    gvReport.DataBind();

                    txtOrders.Text = data.Tables[0].Rows.Count.ToString();
                    var invoiceTotals = data.Tables[0].AsEnumerable().Select(row => row.Field<decimal>("invoice_total")).ToList();
                    txtSales.Text = "$" + invoiceTotals.Sum().ToString("0.00");
                }
            }
        }
    }
}