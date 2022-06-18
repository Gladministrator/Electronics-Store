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
            var text = txtInputSearch.Text.Trim();

            if (!int.TryParse(text, out int result))
            {
                cvCustomerNotFound.ErrorMessage = "Please enter a numeric value";
                cvCustomerNotFound.IsValid = false;
                return;
            }
            DatabaseObject connection = new DatabaseObject("Load_Customer");
            DataSet data = connection.LoadTableWithParams("@ID", text);
            if (data.Tables.Count == 0 || data.Tables[0].Rows.Count == 0)
            {
                cvCustomerNotFound.ErrorMessage = $"No Customer with the ID {result} was found.";
                cvCustomerNotFound.IsValid = false;
                return;
            }
            LoadUser(data);
        }

        private void LoadUser(DataSet ds)
        {
            btnUpdateProfile.Text = "Update Account";
            DatabaseObject connection = new DatabaseObject("Get_Security_Questions");
            DatabaseObject connection2 = new DatabaseObject("Load_Role_Table");
            DataSet tableInfoData = connection.GetTableRecords();
            DataSet tableInfoData2 = connection2.GetTableRecords();

            var row = ds.Tables[0]?.Rows;

            if (ds != null && row?.Count > 0 && tableInfoData != null && tableInfoData2 != null)
            {
                // Load Dropdowns
                HelperMethods.LoadDropDown(dlSecretQuestionMaintenance, tableInfoData, "id", "security_question");
                HelperMethods.LoadDropDown(dlRoleMaintenance, tableInfoData2, "id", "description");

                // Setup Edit Panel: Password/Security Question are hashed so they are not loaded
                txtFirstNameMaintenance.Text = (string)row[0]["first_name"];
                txtLastNameMaintenance.Text = (string)row[0]["last_name"];
                txtEmailAddressMaintenance.Text = lblCustomerEmail.Text = (string)row[0]["email_address"];
                txtPhoneNumberMaintenance.Text = (string)row[0]["phone_number"];
                dlSecretQuestionMaintenance.SelectedValue = (string)row[0]["security_question_id"].ToString();
                dlRoleMaintenance.SelectedValue = (string)row[0]["role_id"].ToString();
                var status = Convert.ToBoolean(row[0]["status"]) ? "Active" : "Inactive";
                dlStatus.SelectedValue = status;
                lblCustomerID.Text = (string)row[0]["id"].ToString();
                pnlSearch.Visible = false;
                pnlAccount.Visible = true;
            }
            else Response.Redirect("~/Account/Login.aspx?LoginText=An Error Occured, Please Log In Again");
        }
        protected void CustomersGridView_SelectedIndexChanged(Object sender, EventArgs e)
        {
            // Get the currently selected row using the SelectedRow property.
            GridViewRow row = gvCustomersMaintenance.SelectedRow;
            // Load Selected ID into Panel
            var selectedID = row.Cells[1].Text;
            DatabaseObject connection = new DatabaseObject("Load_Customer");
            DataSet data = connection.LoadTableWithParams("@ID", selectedID);
            LoadUser(data);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Customers.aspx");
        }

        protected void btnUpdateProfile_Click(object sender, EventArgs e)
        {
            lblErrorMsg.Text = "";
            var emailAddress = txtEmailAddressMaintenance.Text.Trim();
            var customer = Convert.ToInt32(lblCustomerID.Text);
            var firstName = txtFirstNameMaintenance.Text.Trim();
            var lastName = txtLastNameMaintenance.Text.Trim();
            var phoneNumber = txtPhoneNumberMaintenance.Text.Trim();
            var securityQuestion = Convert.ToInt32(dlSecretQuestionMaintenance.SelectedValue.Trim());
            var role = Convert.ToInt32(dlRoleMaintenance.SelectedValue.Trim());
            var status = dlStatus.SelectedValue == "Active" ? true : false;
            var password = txtPasswordMaintenance.Text.Trim();
            var securityAnswer = txtSecretAnswerMaintenance.Text.Trim();

            if (securityQuestion == -1)
            {
                cvError2.IsValid = false;
                return;
            }
            else if (role == -1)
            {
                cvError3.IsValid = false;
                return;
            }

            // Check if email changed, if it did password/security question must change due to hash calculation which uses email as the salt.
            if (emailAddress != lblCustomerEmail.Text && (password.Length == 0 || securityAnswer.Length == 0))
            {
                cvEmailChange.IsValid = false;
                return;
            }

            DatabaseObject connection = new DatabaseObject("Update_Account");
            var result = connection.UpdateCustomer(customer, emailAddress, lastName, firstName, phoneNumber, password,
               securityQuestion, securityAnswer, role, status);
            if (result == 0)
            {
                lblErrorMsg.Text = "A User with that Email already exists, no updates were made.";
            }
            else if (result > 0)
            {
                DatabaseObject connection2 = new DatabaseObject("Load_Customer");
                DataSet data2 = connection2.LoadTableWithParams("@ID", customer.ToString());
                LoadUser(data2);

                lblErrorMsg.Text = "Updated Customer Successfully.";
            }
            else if (result == -1)
            {
                lblErrorMsg.Text = connection.error.Message;
            }
            lblErrorMsg.Visible = true;
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            pnlSearch.Visible = false;
            pnlAccount.Visible = true;
            btnCreateUser.Visible = true;
            btnUpdateProfile.Visible = false;

            DataSet tableInfoData = HelperMethods.LoadTable("Get_Security_Questions");
            DataSet tableInfoData2 = HelperMethods.LoadTable("Load_Role_Table");

            if (tableInfoData != null && tableInfoData2 != null)
            {
                // Load Dropdowns
                HelperMethods.LoadDropDown(dlSecretQuestionMaintenance, tableInfoData, "id", "security_question");
                HelperMethods.LoadDropDown(dlRoleMaintenance, tableInfoData2, "id", "description");
            }
            else Response.Redirect("~/Account/Login.aspx?LoginText=An Error Occured, Please Log In Again");
        }

        protected void btnCreateUser_Click(object sender, EventArgs e)
        {
            var emailAddress = txtEmailAddressMaintenance.Text.Trim();
            var firstName = txtFirstNameMaintenance.Text.Trim();
            var lastName = txtLastNameMaintenance.Text.Trim();
            var phoneNumber = txtPhoneNumberMaintenance.Text.Trim();
            var securityQuestion = Convert.ToInt32(dlSecretQuestionMaintenance.SelectedValue.Trim());
            var role = Convert.ToInt32(dlRoleMaintenance.SelectedValue.Trim());
            var status = dlStatus.SelectedValue == "Active" ? 1 : 0;
            var password = txtPasswordMaintenance.Text.Trim();
            var securityAnswer = txtSecretAnswerMaintenance.Text.Trim();

            if (password.Length == 0 || securityQuestion == -1 || role == -1 || securityAnswer.Length == 0)
            {
                if (password.Length == 0)
                {
                    cvError1.IsValid = false;
                }

                if (securityQuestion == -1)
                {
                    cvError2.IsValid = false;
                }
                if (role == -1)
                {
                    cvError3.IsValid = false;
                }
                if (securityAnswer.Length == 0)
                {
                    cvError4.IsValid = false;
                }
                return;
            }

            DatabaseObject connection = new DatabaseObject("Insert_User");
            var result = connection.AddUser(emailAddress, lastName, firstName, phoneNumber, password,
               securityQuestion, securityAnswer, role, status);
            if (result == 0)
            {
                lblErrorMsg.Text = "A User with that Email already exists, please use a different email.";
            }
            else if (result > 0)
            {
                DatabaseObject connection2 = new DatabaseObject("Load_Customer");
                DataSet data2 = connection2.LoadTableWithParams("@ID", result.ToString());
                LoadUser(data2);
                lblErrorMsg.Text = "Created Account Successfully.";
                btnCreateUser.Visible = false;
                btnUpdateProfile.Visible = true;
            }
            else if (result == -1)
            {
                lblErrorMsg.Text = connection.error.Message;
            }
            lblErrorMsg.Visible = true;
        }
    }
}