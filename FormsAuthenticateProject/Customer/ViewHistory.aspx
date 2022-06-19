<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/Customer.Master" AutoEventWireup="true"
    CodeBehind="ViewHistory.aspx.cs" Inherits="FormsAuthenticateProject.Customer.ViewHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../Styles/Customer.css" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 style="text-align: center">View Order History
    </h2>
    <div class="flex-container">
        <asp:GridView ID="gvOrderHistory" runat="server" CellPadding="5" 
            ForeColor="#333333" AutoGenerateColumns="false"
            RowStyle-HorizontalAlign="Center">
            <AlternatingRowStyle BackColor="#b6bfcb" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="Invoice ID" />
                <asp:BoundField DataField="product_name" HeaderText="Product Name" />
                <asp:BoundField DataField="invoice_date" HeaderText="Invoice Date" />
                <asp:BoundField DataField="invoice_total" HeaderText="Total" DataFormatString="{0:c}" />
                <asp:BoundField DataField="shipping_date" HeaderText="Shipped Date" />
            </Columns>
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#89a8ab" />
        </asp:GridView>
    </div>
</asp:Content>
