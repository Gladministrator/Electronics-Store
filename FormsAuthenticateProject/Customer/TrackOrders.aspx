<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/Customer.Master" AutoEventWireup="true"
    CodeBehind="TrackOrders.aspx.cs" Inherits="FormsAuthenticateProject.Customer.TrackOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../Styles/Customer.css" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 style="text-align: center">Track Order</h2>
    <div class="flex-container">
        <div class="flex-container">
            <h3 style="text-align: center">Search for an order with an order number.</h3>
            <div>
                <asp:TextBox runat="server" ID="txtSearch" />
                <asp:RequiredFieldValidator
                    ID="rfFirstName" runat="server"
                    ControlToValidate="txtSearch" Text="*"
                    ErrorMessage="Enter an Invoice to search."
                    ForeColor="Red" ToolTip="Enter an Invoice to search."
                    ValidationGroup="Search"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                    runat="server"
                    ErrorMessage="Enter an number to search."
                    ControlToValidate="txtSearch" Text="*"
                    ForeColor="Red" ToolTip="Enter an number to search."
                    ValidationGroup="Search" ValidationExpression="\d+"></asp:RegularExpressionValidator>
            </div>
            <div>
                <asp:Button runat="server" ID="btnSearchOrderNumber" Text="Search Order"
                    OnClick="btnSearchOrderNumber_Click" ValidationGroup="Search" CausesValidation="true"
                    CssClass="styled-btn" />
                <asp:Button runat="server" ID="btnCancel" Text="Cancel"
                    OnClick="btnCancel_Click" CssClass="styled-btn" />
            </div>
            <asp:CustomValidator ID="cvNotFound" runat="server"
                ErrorMessage="No Invoice Found">
            </asp:CustomValidator>
            <asp:ValidationSummary ID="vsSearch" ValidationGroup="Search" runat="server" />
        </div>
        <asp:Panel runat="server" ID="pnlOrderDetails" Visible="false">
            <asp:GridView ID="gvTrackedOrder" runat="server" CellPadding="5"
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
        </asp:Panel>
    </div>
</asp:Content>
