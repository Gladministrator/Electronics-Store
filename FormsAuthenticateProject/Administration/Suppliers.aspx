<%@ Page Title="" Language="C#" MasterPageFile="~/Administration/Admin.Master" AutoEventWireup="true"
    CodeBehind="Suppliers.aspx.cs" Inherits="FormsAuthenticateProject.Administration.Suppliers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../Styles/AdministrationStyle.css" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 style="text-align: center">Supplier Administration</h2>
    <div class="flex-center">
        <asp:GridView ID="gvSupplierAdmin" runat="server" AutoGenerateColumns="False" CellPadding="2"
            AutoGenerateEditButton="True"
            ShowFooter="True"
            FooterStyle-CssClass="footer-style" RowStyle-HorizontalAlign="Center"
            RowStyle-BackColor="#6f8d93" HeaderStyle-BackColor="#93756f"
            FooterStyle-BackColor="#4e685f"
            FooterStyle-HorizontalAlign="Center" DataSourceID="SqlDataSource1" 
            EditRowStyle-BackColor="#936f7b" EditRowStyle-HorizontalAlign="Center"
            OnRowUpdating="TaskGridView_RowUpdatingSupplier" DataKeyNames="id">
            <AlternatingRowStyle BackColor="#6F9375" HorizontalAlign="Center"></AlternatingRowStyle>
            <Columns>
                <asp:BoundField DataField="company_name" HeaderText="company_name" 
                    SortExpression="company_name" />
                <asp:BoundField DataField="company_address" HeaderText="company_address" 
                    SortExpression="company_address" />
                <asp:BoundField DataField="main_contact_name" HeaderText="main_contact_name" 
                    SortExpression="main_contact_name" />
                <asp:BoundField DataField="main_contact_phone" HeaderText="main_contact_phone" 
                    SortExpression="main_contact_phone" />
                <asp:CheckBoxField DataField="status" HeaderText="status" 
                    SortExpression="status" />
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id" />
            </Columns>

            <EditRowStyle BackColor="#936F7B"></EditRowStyle>

            <FooterStyle HorizontalAlign="Center" BackColor="#4E685F" CssClass="footer-style">
            </FooterStyle>

            <HeaderStyle BackColor="#93756F"></HeaderStyle>

            <PagerStyle CssClass="flex-row"></PagerStyle>

            <RowStyle BackColor="#6F8D93"></RowStyle>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:DBConnectionString %>"
            ProviderName="<%$ ConnectionStrings:DBConnectionString.ProviderName %>"
            
            SelectCommand="SELECT [company_name], [company_address], [main_contact_name], [main_contact_phone], [status], [id] FROM [supplier] ORDER BY [company_name], [main_contact_name]" 
            DeleteCommand="DELETE FROM [supplier] WHERE [id] = @id" 
            InsertCommand="INSERT INTO [supplier] ([company_name], [company_address], [main_contact_name], [main_contact_phone], [status]) VALUES (@company_name, @company_address, @main_contact_name, @main_contact_phone, @status)" 
            UpdateCommand="UPDATE [supplier] SET [company_name] = @company_name, [company_address] = @company_address, [main_contact_name] = @main_contact_name, [main_contact_phone] = @main_contact_phone, [status] = @status WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="company_name" Type="String" />
                <asp:Parameter Name="company_address" Type="String" />
                <asp:Parameter Name="main_contact_name" Type="String" />
                <asp:Parameter Name="main_contact_phone" Type="String" />
                <asp:Parameter Name="status" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="company_name" Type="String" />
                <asp:Parameter Name="company_address" Type="String" />
                <asp:Parameter Name="main_contact_name" Type="String" />
                <asp:Parameter Name="main_contact_phone" Type="String" />
                <asp:Parameter Name="status" Type="Boolean" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <div class="flex-col-container">
            <asp:CustomValidator ID="cvSupplierDescription" runat="server"
                ErrorMessage="A Supplier with the same name already exists."></asp:CustomValidator>
            <asp:ValidationSummary ID="vsSupplierSummary" HeaderText="There were errors with your submission:"
                runat="server" ValidationGroup="CategoryInsert" />
        </div>
    </div>

</asp:Content>
