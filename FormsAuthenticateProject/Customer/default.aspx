<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/Customer.Master" AutoEventWireup="true"
    CodeBehind="default.aspx.cs" Inherits="FormsAuthenticateProject.Customer._default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../Styles/Customer.css" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align: center">
        <h2 style="text-align: center">Home Page for Customers
        </h2>
        <p style="text-align: center">
            Customers can create orders, track orders, view their order history, and change their password.
        </p>
        <p style="text-align: center">
            Use the navigation links to go the respective page.
        </p>
        <p style="text-align: center">You're currently on the default Home page for customers</p>
    </div>
</asp:Content>
