<%@ Page Title="" Language="C#" MasterPageFile="~/Shipping/Shipping.Master" AutoEventWireup="true"
    CodeBehind="default.aspx.cs" Inherits="FormsAuthenticateProject.Shipping._default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../Styles/Shipping.css" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align: center">
        <h2 style="text-align: center">Home Page for Shipping Users
        </h2>
        <p style="text-align: center">
            Shipping Users can track orders and send out shipments.
        </p>
        <p style="text-align: center">
            Use the navigation links to go the respective page.
        </p>
        <p style="text-align: center">
            You're currently on the default Home page for Shipping Users
        </p>

    </div>
</asp:Content>
