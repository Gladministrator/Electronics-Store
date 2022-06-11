<%@ Page Title="" Language="C#" MasterPageFile="~/Account/Account.Master" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs" Inherits="FormsAuthenticateProject.Account.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../Styles/AccountStyle.css" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="flex-container">
        <h1 style="text-align: center">Welcome to Substitue Electronics</h1>
        <asp:Label ID="lblLoginText" runat="server"></asp:Label>
        <div class="text-label">
            <asp:Label ID="Label3" runat="server" Text="Email Address"></asp:Label>
            <div>
                <asp:TextBox ID="txtEmail" runat="server" Height="30px" Width="210px"></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="rfLoginEmail" runat="server"
                    ErrorMessage="Email is Required"
                    ControlToValidate="txtEmail" Text="*"
                    ForeColor="Red" ToolTip="An Email must be entered"
                    ValidationGroup="Login"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="text-label">
            <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
            <div>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Height="30px" Width="210px"></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="rfLoginPassword" runat="server"
                    ErrorMessage="Password is Required"
                    ControlToValidate="txtPassword" Text="*"
                    ForeColor="Red" ToolTip="A Password must be entered"
                    ValidationGroup="Login"></asp:RequiredFieldValidator>
            </div>
        </div>
            <asp:Label ID="lblLoginMsg" runat="server" Text="Label" Visible="False"
                Font-Bold="True" ForeColor="#CC0000"></asp:Label>
            <asp:ValidationSummary runat="server" ValidationGroup="Login" Visible="true" />
        <asp:Button ID="btnLogin" runat="server" CssClass="styled-btn" Text="Login"
            OnClick="btnLogin_Click" ValidationGroup="Login" CausesValidation="true" />
        <div>
            <asp:LinkButton ID="lnkForgotPassword" runat="server" CssClass="styled-btn"
                PostBackUrl="~/Account/ForgotPassword.aspx">Forgot Password</asp:LinkButton>
        </div>
        <div>
            <asp:LinkButton ID="lnkCreateProfile" runat="server" CssClass="styled-btn"
                PostBackUrl="~/Account/Registration.aspx">Create Account</asp:LinkButton>
        </div>
    </div>
</asp:Content>
