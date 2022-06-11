<%@ Page Title="" Language="C#" MasterPageFile="~/Administration/Admin.Master" AutoEventWireup="true"
    CodeBehind="Customers.aspx.cs" Inherits="FormsAuthenticateProject.Administration.Customers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../Styles/AdministrationStyle.css" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Customer Maintenance</h2>

    <div>
        <asp:Label ID="Label1" runat="server" Text="Search Customers"></asp:Label>
        <asp:TextBox ID="txtInputSearch" runat="server"></asp:TextBox>
        <asp:Button ID="btnFirstSearch" runat="server" Text="Search by First Name" 
            OnClick="btnFirstSearch_Click"/>
                <asp:Button ID="btnLastSearch" runat="server" 
            Text="Search by Last Name" OnClick="btnLastSearch_Click" />
    </div>
    <asp:GridView ID="gvCustomersMaintenance" runat="server"></asp:GridView>
</asp:Content>
