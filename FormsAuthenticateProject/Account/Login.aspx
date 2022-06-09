<%@ Page Title="" Language="C#" MasterPageFile="~/Account/Account.Master" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs" Inherits="FormsAuthenticateProject.Account.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h1 style="text-align:center">Welcome to Substitue Electronics</h1>
        <asp:Label ID="lblLoginText" runat="server"></asp:Label>
        <div>
            <asp:Label ID="Label3" runat="server" Text="Email Address"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>

            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
        </div>
        <asp:Label ID="lblLoginMsg" runat="server" Text="Label" Visible="False"
            Font-Bold="True" ForeColor="#CC0000"></asp:Label>

        <asp:Button ID="btnLogin" runat="server" Text="Login" 
            OnClick="btnLogin_Click" />
        <div>
            <asp:LinkButton ID="lnkForgotPassword" runat="server"
                PostBackUrl="~/Account/ForgotPassword.aspx">Forgot Password</asp:LinkButton>
        </div>
        <asp:LinkButton ID="lnkCreateProfile" runat="server"
            PostBackUrl="~/Account/Registration.aspx">Create Account</asp:LinkButton>
    </div>
</asp:Content>
