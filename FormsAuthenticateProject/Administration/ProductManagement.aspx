<%@ Page Title="" Language="C#" MasterPageFile="~/Administration/Admin.Master" AutoEventWireup="true"
    CodeBehind="ProductManagement.aspx.cs" Inherits="FormsAuthenticateProject.Administration.ProductManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../Styles/AdministrationStyle.css" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 style="text-align: center; margin: 10px 0;">Product Management
    </h2>
    <div class="flex-col-container dropdown-style">
        <asp:Label runat="server" Font-Bold="true" Font-Size="Large" Text="Select a Supplier"></asp:Label>
        <asp:DropDownList ID="dlSupplierSelect" runat="server" AutoPostBack="true"
            OnSelectedIndexChanged="dlSupplierSelect_SelectedIndexChanged" BackColor="#8fbc8f">
        </asp:DropDownList>
    </div>
    <asp:Panel runat="server" class="flex-center" ID="pnlGrid" Visible="false">
        <asp:GridView ID="gvProductAdmin" runat="server" AutoGenerateColumns="False"
            CellPadding="3"
            AutoGenerateEditButton="True"
            ShowFooter="True"
            FooterStyle-CssClass="footer-style"
            RowStyle-HorizontalAlign="Center"
            RowStyle-BackColor="#6f8d93"
            HeaderStyle-BackColor="#93756f"
            FooterStyle-BackColor="#4e685f"
            FooterStyle-HorizontalAlign="Center"
            EditRowStyle-BackColor="#936f7b" EditRowStyle-HorizontalAlign="Center"
            OnRowUpdating="TaskGridView_RowUpdatingProduct" DataKeyNames="id" DataSourceID="SqlDataSource1"
            OnRowDataBound="gvProductAdmin_RowDataBound" ShowHeaderWhenEmpty="true">
            <AlternatingRowStyle BackColor="#6F9375" HorizontalAlign="Center"></AlternatingRowStyle>
            <Columns>
                <asp:TemplateField HeaderText="Product" SortExpression="product_name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("product_name") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="rfTextBox1" runat="server"
                            ErrorMessage="Name is Required"
                            ControlToValidate="TextBox1" Text="*"
                            ForeColor="Red" ToolTip="A Name must be entered">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtProductName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="rfCategoryName" runat="server"
                            ErrorMessage="Name is Required"
                            ControlToValidate="txtProductName" Text="*"
                            ForeColor="Red" ToolTip="A Name must be entered"
                            ValidationGroup="ProductInsert">
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("product_name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Supplier Company">
                    <EditItemTemplate>
                        <asp:DropDownList ID="dlSupplierEdit" runat="server" BackColor="#8fbc8f" Width="100%"
                            Height="100%">
                        </asp:DropDownList>
                        <asp:HiddenField runat="server" ID="HiddenFieldSupplier" Value='<%# Bind("supplier_id") %>' />
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList ID="dlInsertSupplier" runat="server"
                            DataSourceID="SqlDataSource2" DataTextField="company_name" DataValueField="id"
                            BackColor="#8fbc8f" Width="100%">
                            <asp:ListItem Value="-1">Select</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                            ConnectionString="<%$ ConnectionStrings:DBConnectionString %>"
                            ProviderName="<%$ ConnectionStrings:DBConnectionString.ProviderName %>"
                            SelectCommand="SELECT [id], [company_name] FROM [supplier] UNION ALL SELECT -1 AS id,'Select' AS description ORDER BY [id]">
                        </asp:SqlDataSource>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("company_name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Category" SortExpression="category">
                    <EditItemTemplate>
                        <asp:DropDownList ID="dlCategoryEdit" runat="server" Width="100%" BackColor="#8fbc8f">
                        </asp:DropDownList>
                        <asp:HiddenField ID="HiddenField1" runat="server"
                            Value='<%# Bind("category_id") %>' />
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList ID="dlInsertCategory" runat="server"
                            DataSourceID="SqlDataSource3" DataTextField="description" DataValueField="id"
                            BackColor="#8fbc8f" Width="100%">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                            ConnectionString="<%$ ConnectionStrings:DBConnectionString %>"
                            ProviderName="<%$ ConnectionStrings:DBConnectionString.ProviderName %>"
                            SelectCommand="SELECT [id], [description] FROM [category] UNION SELECT -1 AS id,'Select' AS description ORDER BY [id]">
                        </asp:SqlDataSource>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblCategory" runat="server" Text='<%# Bind("category") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Price"
                    SortExpression="price">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server"
                            Text='<%# Bind("retail_price","{0:0.00}") %>'>
                        </asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="rfTextBox4" runat="server"
                            ErrorMessage="Price is Required"
                            ControlToValidate="TextBox4" Text="*"
                            ForeColor="Red" ToolTip="A Price must be entered">
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                                runat="server"
                                ErrorMessage="Price must be in correct format"
                                ControlToValidate="TextBox4" Text="*"
                                ForeColor="Red" ToolTip="Please enter a price in decimal format eg. 0.00"
                                ValidationExpression="\d+(\.\d+){0,1}">
                            </asp:RegularExpressionValidator>
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtPriceFooter" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="rfTextBox4" runat="server"
                            ErrorMessage="Price is Required"
                            ControlToValidate="txtPriceFooter" Text="*"
                            ForeColor="Red" ToolTip="A Price must be entered" ValidationGroup="ProductInsert">
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rvPriceFooter"
                            runat="server"
                            ErrorMessage="Price must be in correct format"
                            ControlToValidate="txtPriceFooter" Text="*"
                            ForeColor="Red" ToolTip="Please enter a price in decimal format eg. 0.00"
                            ValidationExpression="\d+(\.\d+){0,1}" ValidationGroup="ProductInsert">
                        </asp:RegularExpressionValidator>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("retail_price","{0:c}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Status" SortExpression="status">
                    <EditItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("status") %>' />
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:CheckBox ID="cbStatus" runat="server" Checked="true" />
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("status") %>'
                            Enabled="false" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="id">
                    <EditItemTemplate>
                        <asp:Label ID="lblIdentity" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkDeleteProduct" runat="server" CausesValidation="False"
                            CommandName="Delete" Text="Delete" CssClass="styled-btn-delete"
                            OnClientClick="return confirm('Are you sure you want to delete?');"></asp:LinkButton>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:Button ID="Button1" runat="server" Text="Insert Product"
                            CssClass="styled-btn"
                            OnClick="btnAddProduct_Click"
                            ValidationGroup="ProductInsert" CausesValidation="true" />
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
            DeleteCommand="DELETE FROM [product] WHERE [id] = @id"
            InsertCommand="INSERT INTO [product] ([product_name], [supplier_id], [category_id], [retail_price], [status]) VALUES (@product_name, @supplier_id, @category_id, @retail_price, @status)"
            ProviderName="<%$ ConnectionStrings:DBConnectionString.ProviderName %>"
            SelectCommand="Load_Products_View" SelectCommandType="StoredProcedure"
            UpdateCommand="UPDATE [product] SET [product_name] = @product_name, [supplier_id] = @supplier_id, [category_id] = @category_id, [retail_price] = @retail_price, [status] = @status WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="product_name" Type="String" />
                <asp:Parameter Name="supplier_id" Type="Int32" />
                <asp:Parameter Name="category_id" Type="String" />
                <asp:Parameter Name="retail_price" Type="Decimal" />
                <asp:Parameter Name="status" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="product_name" Type="String" />
                <asp:Parameter Name="supplier_id" Type="Int32" />
                <asp:Parameter Name="category_id" Type="String" />
                <asp:Parameter Name="retail_price" Type="Decimal" />
                <asp:Parameter Name="status" Type="Int32" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
            <SelectParameters>
                <asp:Parameter Name="Supplier" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <div class="flex-col-container">
            <asp:CustomValidator ID="cvUpdateSupplier" runat="server"
                ErrorMessage="Please select a Supplier"></asp:CustomValidator>
            <asp:CustomValidator ID="cvUpdateCategory" runat="server"
                ErrorMessage="Please select a Category"></asp:CustomValidator>
            <asp:CustomValidator ID="cvCustomText" runat="server"
                ErrorMessage=""></asp:CustomValidator>
        </div>
    </asp:Panel>

</asp:Content>
