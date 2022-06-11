using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FormsAuthenticateProject.Account
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtNewPassword.Text = txtNewPassword.Text.Trim();

            if (!IsPostBack)
            {
                DatabaseObject connection = new DatabaseObject("Get_Security_Questions");
                DataSet tableInfoData = connection.GetTableRecords();

                if (tableInfoData != null)
                {
                    HelperMethods.LoadDropDown(dlSecurityQuestion, tableInfoData, "id", "security_question");
                }
            }
        }

        protected void btnSubmitCredential_Click(object sender, EventArgs e)
        {
            DatabaseObject connection = new DatabaseObject("Verify_Recovery_Credentials");
            var result = connection.VerifyRecoveryCredentials(txtEmailAddress.Text.Trim().ToString(),
                Convert.ToInt32(dlSecurityQuestion.SelectedValue), txtSecurityQuestionAnswer.Text.Trim().ToString());

            if (result == 1)
            {
                pnlChangePassword.Visible = true;
                lblCredentialError.Visible = false;
                btnSubmitCredential.Visible = false;
                txtEmailAddress.ReadOnly = true;
            }
            else if (result == 0)
            {
                lblCredentialError.Text = "The credentials you entered did not match our records.";
                lblCredentialError.Visible = true;
            }
            else if (result == -1)
            {
                lblCredentialError.Text = connection.error.Message;
                lblCredentialError.Visible = true;
            }

        }
        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            DatabaseObject connection = new DatabaseObject("Change_Password");
            var result = connection.ChangePassword(txtEmailAddress.Text.Trim().ToString(),
                txtNewPassword.Text.Trim().ToString());

            if (result >= 0) Response.Redirect("Login.aspx?LoginText=Your Password has been changed.");
            else if (result == -1)
            {
                lblErrorChangePassword.Visible = true;
                lblErrorChangePassword.Text = connection.error.Message;
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx", true);
        }
    }
}