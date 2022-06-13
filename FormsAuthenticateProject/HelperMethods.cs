using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI.WebControls;

namespace FormsAuthenticateProject
{
    public static class HelperMethods
    {
        public static void LoadDropDown(DropDownList dropDown, DataSet table, string valueField,
            string textField)
        {
            dropDown.DataValueField = table.Tables[0].Columns[valueField].ToString();
            dropDown.DataTextField = table.Tables[0].Columns[textField].ToString();
            dropDown.DataSource = table.Tables[0];
            dropDown.DataBind();
            dropDown.Items.Insert(0, new ListItem("Select", "-1"));
        }
        public static string HashStringToBytes(string plainTextData, string salt)
        {
            //Uses the unique email as the salt value
            string saltedHash = plainTextData + "U_N" + salt.ToLower();
            SHA256 sha256Hash = SHA256.Create();
            byte[] data = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(saltedHash));

            //Convert byte array to a hex string
            var sBuilder = new StringBuilder();

            for (int i = 0; i < data.Length; i++)
            {
                sBuilder.Append(data[i].ToString("x2"));
            }

            return sBuilder.ToString();
        }

        public static string RoleRedirect(string role)
        {
            if (role == "Administration")
            {
                return "~/Account/default.aspx";
            }
            else if (role == "Customer")
            {
                return "~/Customer/default.aspx";
            }
            else if (role == "Shipping")
            {
                return "~/Customer/default.aspx";
            }
            else
            {
                return "~/Account/Login.aspx";
            }
        }
        public static void SignOut()
        {
            HttpContext.Current.Session.Clear();
            HttpContext.Current.Session.Abandon();
            HttpContext.Current.Response.Redirect("~/Account/Login.aspx?LoginText=You have now signed out");
        }
        public static DataSet LoadTable(string storedProcedure)
        {
            DatabaseObject connection = new DatabaseObject(storedProcedure);
            return connection.LoadTable();
        }
        public static bool isDuplicate(DataSet databaseInfo, string item, string column = "description")
        {
            List<string> comparasionList = new List<string>();
            comparasionList = databaseInfo.Tables[0].AsEnumerable().Select(row => row.Field<string>(column).ToLower()).ToList();
            return comparasionList.Contains(item.ToLower());
        }
    }
}