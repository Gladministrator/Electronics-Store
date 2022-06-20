<%@ Page Title="" Language="C#" MasterPageFile="~/Administration/Admin.Master" AutoEventWireup="true"
    CodeBehind="Orders.aspx.cs" Inherits="FormsAuthenticateProject.Administration.Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../Styles/AdministrationStyle.css" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 style="text-align: center">Track Order</h2>
    <div class="flex-container">
        <div class="flex-container">
            <h3 style="text-align: center">Search for an order with an order number.</h3>
            <div>
                <asp:TextBox runat="server" ID="txtSearchInvoice" />
                <asp:RequiredFieldValidator
                    ID="rfFirstName" runat="server"
                    ControlToValidate="txtSearchInvoice" Text="*"
                    ErrorMessage="Enter an Invoice to search."
                    ForeColor="Red" ToolTip="Enter an Invoice to search."
                    ValidationGroup="Search"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                    runat="server"
                    ErrorMessage="Enter an number to search."
                    ControlToValidate="txtSearchInvoice" Text="*"
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
                ForeColor="#333333" AutoGenerateColumns="False"
                RowStyle-HorizontalAlign="Center" AutoGenerateEditButton="True"
                DataSourceID="SqlDataSource1" DataKeyNames="id" OnRowUpdating="gvTrackedOrder_RowUpdating"
                OnRowDataBound="gvTrackedOrder_RowDataBound">
                <AlternatingRowStyle BackColor="#b6bfcb" />
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False"
                        ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="account_id" HeaderText="Account ID"
                        SortExpression="account_id" ReadOnly="true" />
                    <asp:BoundField DataField="product_id" HeaderText="Product ID"
                        SortExpression="product_id" />
                    <asp:BoundField DataField="invoice_date" HeaderText="Invoice Date"
                        SortExpression="invoice_date" DataFormatString="{0:d}" ReadOnly="true" />
                    <asp:BoundField DataField="invoice_total" HeaderText="Invoice Total" DataFormatString="{0:c}"
                        SortExpression="invoice_total" />
                    <asp:BoundField DataField="card_holder" HeaderText="Card Holder"
                        SortExpression="card_holder" ReadOnly="true" />
                    <asp:BoundField DataField="delivery_address" HeaderText="Shipping Address"
                        SortExpression="delivery_address" />
                    <asp:CheckBoxField DataField="shipping_status" HeaderText="Shipping Status"
                        SortExpression="shipping_status" ReadOnly="true" />
                    <asp:CheckBoxField DataField="order_status" HeaderText="Active"
                        SortExpression="order_status" />
                </Columns>
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#89a8ab" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:DBConnectionString %>"
                DeleteCommand="DELETE FROM [invoice] WHERE [id] = @id"
                InsertCommand="INSERT INTO [invoice] ([account_id], [product_id], [invoice_date], [invoice_total], [card_holder], [delivery_address], [shipping_status], [order_status]) VALUES (@account_id, @product_id, @invoice_date, @invoice_total, @card_holder, @delivery_address, @shipping_status, @order_status)"
                ProviderName="<%$ ConnectionStrings:DBConnectionString.ProviderName %>"
                SelectCommand="SELECT [id], [account_id], [product_id], [invoice_date], [invoice_total], [card_holder], [delivery_address], [shipping_status], [order_status] FROM [invoice] WHERE (([id] = @id) AND ([order_status] = @order_status))"
                UpdateCommand="UPDATE [invoice] SET [product_id] = @product_id, [invoice_total] = @invoice_total, [delivery_address] = @delivery_address, [shipping_status] = 0, [order_status] = @order_status WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="account_id" Type="Int32" />
                    <asp:Parameter Name="product_id" Type="Int32" />
                    <asp:Parameter Name="invoice_date" Type="DateTime" />
                    <asp:Parameter Name="invoice_total" Type="Decimal" />
                    <asp:Parameter Name="card_holder" Type="String" />
                    <asp:Parameter Name="delivery_address" Type="String" />
                    <asp:Parameter Name="shipping_status" Type="Boolean" />
                    <asp:Parameter Name="order_status" Type="Boolean" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtSearchInvoice" DefaultValue="0" Name="id"
                        PropertyName="Text" Type="Int32" />
                    <asp:Parameter DefaultValue="True" Name="order_status" Type="Boolean" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="product_id" Type="Int32" />
                    <asp:Parameter Name="invoice_total" Type="Decimal" />
                    <asp:Parameter Name="delivery_address" Type="String" />
                    <asp:Parameter Name="shipping_status" Type="Boolean" />
                    <asp:Parameter Name="order_status" Type="Boolean" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <div class="flex-col-container">
                <asp:Label ID="lblWarning1" runat="server" Visible="false">Shipped Orders cannot be modified.</asp:Label>
                <asp:Label ID="lblWarning2" runat="server">Orders can be cancelled by unchecking the Active box.</asp:Label>
                <asp:CustomValidator ID="cvEdit" runat="server" ForeColor="DarkRed"
                    ErrorMessage="Inputs Ivalid"></asp:CustomValidator>
            </div>
        </asp:Panel>
    </div>
</asp:Content>
