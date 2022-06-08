using System;
using System.Data;
using System.Web.UI.WebControls;

namespace FormsAuthenticateProject.Account
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DatabaseObject connection = new DatabaseObject("Get_Security_Questions");
                DataSet tableInfoData = connection.GetTableRecords();

                if (tableInfoData != null)
                {
                    HelperMethods.LoadDropDown(dlSecretQuestion, tableInfoData, "id", "security_question");
                }
            }
        }

        protected void btnCreateProfile_Click(object sender, EventArgs e)
        {
            DatabaseObject connection = new DatabaseObject("Insert_User");
            var result = connection.AddUser(txtEmailAddress.Text.Trim().ToString(), txtFirstName.Text.Trim().ToString(),
                txtLastName.Text.Trim().ToString(), txtPhoneNumber.Text.Trim().ToString(), txtPassword.Text.ToString(),
                Convert.ToInt32(dlSecretQuestion.SelectedValue), txtSecretAnswer.Text.Trim().ToString(), 1, 1);

            if (result > 0) Response.Redirect("Login.aspx?LoginText=Account Successfully Created!");
            else if (result == 0)
            {
                lblMsg.Text = "The Email entered is already in use.";
                lblMsg.Visible = true;
            }
            else
            {
                lblMsg.Text = connection.error.Message;
                lblMsg.Visible = true;
            }

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}