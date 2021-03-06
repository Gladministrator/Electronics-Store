<%@ Page Title="" Language="C#" MasterPageFile="~/Administration/Admin.Master" AutoEventWireup="true"
    CodeBehind="Suppliers.aspx.cs" Inherits="FormsAuthenticateProject.Administration.Suppliers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../Styles/AdministrationStyle.css" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 style="text-align: center">Supplier Administration</h2>
    <div class="flex-center">
        <asp:GridView ID="gvSupplierAdmin" runat="server" AutoGenerateColumns="False"
            CellPadding="3"
            AutoGenerateEditButton="True"
            ShowFooter="True"
            FooterStyle-CssClass="footer-style"
            RowStyle-HorizontalAlign="Center"
            RowStyle-BackColor="#6f8d93"
            HeaderStyle-BackColor="#93756f"
            FooterStyle-BackColor="#4e685f"
            FooterStyle-HorizontalAlign="Center" DataSourceID="SqlDataSource1"
            EditRowStyle-BackColor="#936f7b" EditRowStyle-HorizontalAlign="Center"
            OnRowUpdating="TaskGridView_RowUpdatingSupplier" DataKeyNames="id">
            <AlternatingRowStyle BackColor="#6F9375" HorizontalAlign="Center"></AlternatingRowStyle>
            <Columns>
                <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="id">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name" SortExpression="company_name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("company_name") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="rfTextBox1" runat="server"
                            ErrorMessage="Name is Required"
                            ControlToValidate="TextBox1" Text="*"
                            ForeColor="Red" ToolTip="A Name must be entered">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtSupplierName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="rfEditSupplierName" runat="server"
                            ErrorMessage="Name is Required"
                            ControlToValidate="txtSupplierName" Text="*"
                            ForeColor="Red" ToolTip="A Name must be entered"
                            ValidationGroup="SupplierInsert">
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("company_name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Address" SortExpression="company_address">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("company_address") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="rfTextBox2" runat="server"
                            ErrorMessage="Address is Required"
                            ControlToValidate="TextBox2" Text="*"
                            ForeColor="Red" ToolTip="An Address must be entered">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtSupplierAddress" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="rftxtSupplierAddress" runat="server"
                            ErrorMessage="Address is Required"
                            ControlToValidate="txtSupplierAddress" Text="*"
                            ForeColor="Red" ToolTip="An Address must be entered"
                            ValidationGroup="SupplierInsert">
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("company_address") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Contact" SortExpression="main_contact_name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server"
                            Text='<%# Bind("main_contact_name") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="rfTextBox3" runat="server"
                            ErrorMessage="Contact Name is Required"
                            ControlToValidate="TextBox3" Text="*"
                            ForeColor="Red" ToolTip="A Contact Name must be entered">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtSupplierContact" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="rftxtSupplierContact" runat="server"
                            ErrorMessage="Contact Name is Required"
                            ControlToValidate="txtSupplierContact" Text="*"
                            ForeColor="Red" ToolTip="A Contact Name must be entered"
                            ValidationGroup="SupplierInsert"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("main_contact_name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Contact Phone"
                    SortExpression="main_contact_phone">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server"
                            Text='<%# Bind("main_contact_phone") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="rfTextBox4" runat="server"
                            ErrorMessage="Phone Number is Required"
                            ControlToValidate="TextBox4" Text="*"
                            ForeColor="Red" ToolTip="A Phone Number must be entered">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtSupplierPhone" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="rftxtSupplierPhone" runat="server"
                            ErrorMessage="Phone Number is Required"
                            ControlToValidate="txtSupplierPhone" Text="*"
                            ForeColor="Red" ToolTip="A Phone Number must be entered"
                            ValidationGroup="SupplierInsert"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("main_contact_phone") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Status" SortExpression="status">
                    <EditItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("status") %>' />
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:CheckBox ID="cbSupplierStatus" runat="server" Checked="true" />
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("status") %>'
                            Enabled="false" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkDeleteSupplier" runat="server" CausesValidation="False"
                            CommandName="Delete" Text="Delete" CssClass="styled-btn-delete"
                            OnClientClick="return confirm('Are you sure you want to delete?');">
                        </asp:LinkButton>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:Button ID="Button1" runat="server" Text="Insert Supplier"
                            CssClass="styled-btn"
                            OnClick="btnAddSupplier_Click"
                            ValidationGroup="SupplierInsert" CausesValidation="true" />
                    </FooterTemplate>
                </asp:TemplateField>

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
                runat="server" ValidationGroup="SupplierInsert" />
        </div>
    </div>

</asp:Content>
