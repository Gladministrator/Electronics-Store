<%@ Page Title="" Language="C#" MasterPageFile="~/Administration/Admin.Master" AutoEventWireup="true"
    CodeBehind="Reporting.aspx.cs" Inherits="FormsAuthenticateProject.Administration.Reporting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../Styles/AdministrationStyle.css" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 style="text-align: center">Daily Report</h2>
    <div class="flex-container">
        <asp:GridView ID="gvReport" runat="server" CellPadding="5"
            ForeColor="#333333" AutoGenerateColumns="false"
            RowStyle-HorizontalAlign="Center">
            <AlternatingRowStyle BackColor="#b6bfcb" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="Invoice ID" />
                <asp:BoundField DataField="last_name" HeaderText="Last Name" />
                <asp:BoundField DataField="first_name" HeaderText="First Name" />
                <asp:BoundField DataField="invoice_total" HeaderText="Total" DataFormatString="{0:c}" />
                <asp:BoundField DataField="shipping_status" HeaderText="Shipped" />
            </Columns>
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#89a8ab" />
        </asp:GridView>
        <div>
            <asp:Label ID="Label1" runat="server" Text="Total Orders:"></asp:Label>
            <asp:TextBox ID="txtOrders" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="Label2" runat="server" Text="Total Sales:"></asp:Label>
            <asp:TextBox ID="txtSales" runat="server"></asp:TextBox>
        </div>
    </div>
</asp:Content>
