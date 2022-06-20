<%@ Page Title="" Language="C#" MasterPageFile="~/Administration/Admin.Master" AutoEventWireup="true"
    CodeBehind="default.aspx.cs" Inherits="FormsAuthenticateProject.Administration._default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../Styles/AdministrationStyle.css" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 style="text-align: center">Home Page for Administrators
    </h2>
    <p style="text-align: center">
        Administrators can create/modify user accounts, manage
        products, add suppliers, view reports, and modify orders.
    </p>
    <p style="text-align: center">Use the navigation links to go the respective page.
    </p>
    <p style="text-align: center">You're currently on the default Home page</p>

</asp:Content>
