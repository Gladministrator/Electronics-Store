<%@ Page Title="" Language="C#" MasterPageFile="~/Account/Account.Master" AutoEventWireup="true"
    CodeBehind="Registration.aspx.cs" Inherits="FormsAuthenticateProject.Account.Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../Styles/AccountStyle.css" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 style="text-align: center; margin: 10px 0px;">Registration</h2>
    <div class="flex-container">
        <div class="flex-row">
            <asp:Label ID="Label1" runat="server" Text="First Name"></asp:Label>
            <div class="text-input-registration">
                <asp:TextBox ID="txtFirstName" runat="server" MaxLength="75" Width="200px" Height="20px"></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="rfFirstName" runat="server"
                    ErrorMessage="First Name is Required"
                    ControlToValidate="txtFirstName" Text="*"
                    ForeColor="Red" ToolTip="First Name must be entered"
                    ValidationGroup="Profile"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="flex-row">
            <asp:Label ID="Label2" runat="server" Text="Last Name"></asp:Label>
            <div class="text-input-registration">
                <asp:TextBox ID="txtLastName" runat="server" MaxLength="75" Width="200px" Height="20px"></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="rfLastName" runat="server"
                    ErrorMessage="Last Name is Required"
                    ControlToValidate="txtLastName" Text="*"
                    ForeColor="Red" ToolTip="Last Name must be entered"
                    ValidationGroup="Profile"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="flex-row">
            <asp:Label ID="Label3" runat="server" Text="Email Address"></asp:Label>
            <div class="text-input-registration">
                <asp:TextBox ID="txtEmailAddress" runat="server" MaxLength="150" Width="200px" Height="20px"></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="rfEmail" runat="server"
                    ErrorMessage="Email Address is Required"
                    ControlToValidate="txtEmailAddress" Text="*"
                    ForeColor="Red" ToolTip="Email must be entered"
                    ValidationGroup="Profile"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revEmail" runat="server"
                    ErrorMessage="Email is not in a Valid format"
                    ControlToValidate="txtEmailAddress" Text="*" ForeColor="red"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    ValidationGroup="Profile"></asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="flex-row">
            <asp:Label ID="lblPhone" runat="server" Text="Phone Number"></asp:Label>
            <div class="text-input-registration">
                <asp:TextBox ID="txtPhoneNumber" runat="server" MaxLength="50" Width="200px" Height="20px"></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="rfPhoneNumber" runat="server"
                    ErrorMessage="Phone Number is Required"
                    ControlToValidate="txtPhoneNumber" Text="*"
                    ForeColor="Red" ToolTip="Phone number must be entered"
                    ValidationGroup="Profile"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="flex-row">
            <asp:Label ID="Label4" runat="server" Text="Password"></asp:Label>
            <div class="text-input-registration">
                <asp:TextBox ID="txtPassword" runat="server" MaxLength="12" TextMode="Password" Width="200px"
                    Height="20px"></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="rfPassword" runat="server"
                    ErrorMessage="Password is Required"
                    ControlToValidate="txtPassword" Text="*"
                    ForeColor="Red" ToolTip="Password must be entered"
                    ValidationGroup="Profile"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="flex-row">
            <asp:Label ID="Label5" runat="server" Text="Confirm Password"></asp:Label>
            <div class="text-input-registration">
                <asp:TextBox ID="txtConfirmPassword" MaxLength="12" runat="server" TextMode="Password"
                    Width="200px" Height="20px"></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="rfConfirmPassword" runat="server"
                    ErrorMessage="Cofirm Password is Required"
                    ControlToValidate="txtConfirmPassword" Text="*"
                    ForeColor="Red" ToolTip="Password must be entered"
                    ValidationGroup="Profile"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="cvPassword" runat="server"
                    ErrorMessage="Passwords did not match" Text="*" ValidationGroup="Profile" ToolTip="Password did not match"
                    ForeColor="Red" ControlToCompare="txtPassword"
                    ControlToValidate="txtConfirmPassword"></asp:CompareValidator>
            </div>
        </div>
        <div class="flex-row">
            <asp:Label ID="Label7" runat="server" CssClass="flex-container" Text="Select an Account Recovery Question"></asp:Label>
            <div class="text-input-registration">
                <asp:DropDownList ID="dlSecretQuestion" runat="server" Width="275px" Height="25px"
                    BackColor="#8fbc8f">
                </asp:DropDownList>
                <asp:RequiredFieldValidator InitialValue="-1" ID="rfSecretQuestion"
                    ValidationGroup="Profile" runat="server" ControlToValidate="dlSecretQuestion"
                    ErrorMessage="Secret Question is Required"
                    Font-Size="Large" ForeColor="Red"
                    Text="*" ToolTip="Secret Question is Required"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="flex-row">
            <asp:Label ID="Label8" runat="server" Text="Secret Answer"></asp:Label>
            <div class="text-input-registration">
                <asp:TextBox ID="txtSecretAnswer" runat="server" Width="200px" Height="20px">
                </asp:TextBox><asp:RequiredFieldValidator
                    ID="rfSecretAnswer" runat="server"
                    ValidationGroup="Profile" ControlToValidate="txtSecretAnswer" ErrorMessage="Secret Answer is Required"
                    Font-Size="Large" ForeColor="Red"
                    Text="*" ToolTip="A Secret Answer is Required"></asp:RequiredFieldValidator>
            </div>
        </div>
        <asp:ValidationSummary ID="vsProfile" runat="server" ValidationGroup="Profile"
            DisplayMode="BulletList"
            HeaderText="There were errors with your submission:"
            Font-Names="verdana"
            Font-Size="12" />
        <div style="text-align: center;">
            <asp:Label ID="lblMsg" runat="server" Text="Label" Visible="False"
                Font-Bold="True" ForeColor="#CC0000"></asp:Label>
            <div class="flex-container">
                <asp:Button ID="btnCreateProfile" runat="server" CssClass="styled-btn" Text="Create Profile"
                    ValidationGroup="Profile" CausesValidation="true"
                    OnClick="btnCreateProfile_Click" />
                <asp:Button ID="btnCancel" runat="server" CssClass="styled-btn" Text="Cancel"
                    OnClick="btnCancel_Click" />
            </div>
        </div>
    </div>
</asp:Content>
