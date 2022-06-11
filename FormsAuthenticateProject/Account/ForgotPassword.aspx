<%@ Page Title="" Language="C#" MasterPageFile="~/Account/Account.Master" AutoEventWireup="true"
    CodeBehind="ForgotPassword.aspx.cs" Inherits="FormsAuthenticateProject.Account.ForgotPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../Styles/AccountStyle.css" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h3 style="text-align: center; margin: 25px 0; font-size: 22px">Password
            Recovery</h3>
        <div class="flex-container">
            <div class="flex-container">
                <asp:Label ID="lblEmailAddress" runat="server" Text="Enter Your Email Address"
                    Font-Bold="True"></asp:Label>
                <div>
                    <asp:TextBox ID="txtEmailAddress" runat="server" MaxLength="50" Width="200px"
                        Height="25px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rvUserName" runat="server"
                        ErrorMessage="Email Address is Required" Text="*"
                        ControlToValidate="txtEmailAddress" Font-Size="Large" ForeColor="Red"
                        ToolTip="Email is Required" ValidationGroup="Recovery"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="flex-container">
                <asp:Label ID="lblSecurityQuestion" runat="server" Text="Select Your Secret Question"
                    Font-Bold="True"></asp:Label>
                <div>
                    <asp:DropDownList ID="dlSecurityQuestion" runat="server" Width="275px" Height="30px" BackColor="#8fbc8f">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator InitialValue="-1" ID="rfSecretQuestion"
                        ValidationGroup="Recovery" runat="server" ControlToValidate="dlSecurityQuestion"
                        ErrorMessage="Secret Question is Required"
                        Font-Size="Large" ForeColor="Red"
                        Text="*" ToolTip="Secret Question is Required"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="flex-container">
                <asp:Label ID="lblSecurityAnswer" runat="server" Text="Enter Secret Question Answer"
                    Font-Bold="True"></asp:Label>
                <div>
                    <asp:TextBox ID="txtSecurityQuestionAnswer" runat="server" Width="200px"
                        Height="25px"></asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="rfSecurityQuestionAnswer" runat="server"
                        ValidationGroup="Recovery" ControlToValidate="txtSecurityQuestionAnswer" ErrorMessage="Secret Answer is Required"
                        Font-Size="Large" ForeColor="Red"
                        Text="*" ToolTip="A Secret Answer is Required"></asp:RequiredFieldValidator>
                </div>
            </div>
            <asp:Label ID="lblCredentialError" runat="server" Text="" CssClass="error-text" Visible="false"></asp:Label>
            <asp:Button ID="btnSubmitCredential" runat="server" Text="Submit" CssClass="styled-btn"
                ValidationGroup="Recovery"
                CausesValidation="true"
                OnClick="btnSubmitCredential_Click" />
            <asp:Panel ID="pnlChangePassword" runat="server" Visible="false" CssClass="flex-container">
                <div class="text-label">
                    <asp:Label ID="lblNewPassword" runat="server" Text="New Password"></asp:Label>
                    <div class="text-input">
                        <asp:TextBox ID="txtNewPassword" Height="20px" runat="server" MaxLength="12" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="rfNewPassword" runat="server"
                            ErrorMessage="New Password is Required"
                            ControlToValidate="txtNewPassword" Text="*"
                            ForeColor="Red" ToolTip="A new password must be entered"
                            ValidationGroup="ChangePassword"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="text-label">
                    <asp:Label ID="lblConfirmNewPassword" runat="server" Text="Confirm Password"></asp:Label>
                    <div class="text-input">
                        <asp:TextBox ID="txtConfirmNewPassword" Height="20px" MaxLength="12" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="rfConfirmNewPassword" runat="server"
                            ErrorMessage="Cofirm Password is Required"
                            ControlToValidate="txtConfirmNewPassword" Text="*"
                            ForeColor="Red" ToolTip="Confirm New Password must be entered"
                            ValidationGroup="ChangePassword"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="cvConfirmNewPassword" runat="server"
                            ErrorMessage="Passwords did not match" Text="*" ValidationGroup="ChangePassword"
                            ToolTip="Passwords did not match"
                            ForeColor="Red" ControlToCompare="txtNewPassword"
                            ControlToValidate="txtConfirmNewPassword"></asp:CompareValidator>
                    </div>
                </div>
                <asp:Label ID="lblErrorChangePassword" runat="server" Text="" Visible="false"></asp:Label>
                <asp:Button ID="btnChangePassword" runat="server" Text="Change Password" CausesValidation="true"
                    ValidationGroup="ChangePassword" CssClass="styled-btn" OnClick="btnChangePassword_Click" />
            </asp:Panel>
            <asp:Button ID="btnCancel" runat="server" Text="Back" CssClass="styled-btn"
                OnClick="btnCancel_Click" />
        </div>
    </div>
</asp:Content>

