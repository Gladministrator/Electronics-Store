<%@ Page Title="" Language="C#" MasterPageFile="~/Shipping/Shipping.Master" AutoEventWireup="true"
    CodeBehind="ShippedOrders.aspx.cs" Inherits="FormsAuthenticateProject.Shipping.ShippedOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../Styles/Shipping.css" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h2 style="text-align: center;">Shipped Orders</h2>
    <div class="flex-container">
        <asp:GridView ID="gvPendingOrders" runat="server" CellPadding="5"
            ForeColor="#333333" AutoGenerateColumns="false"
            RowStyle-HorizontalAlign="Center">
            <AlternatingRowStyle BackColor="#b6bfcb" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="Invoice ID" />
                <asp:BoundField DataField="invoice_date" HeaderText="Invoice Date" />
                <asp:BoundField DataField="shipping_status" HeaderText="Shipped" />
                <asp:BoundField DataField="shipping_date" HeaderText="Shipped Date" />
            </Columns>
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#89a8ab" />
        </asp:GridView>
    </div>
</asp:Content>
