<%@ Page Title="" Language="C#" MasterPageFile="~/Administration/Admin.Master" AutoEventWireup="true"
    CodeBehind="Category.aspx.cs" Inherits="FormsAuthenticateProject.Administration.Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../Styles/AdministrationStyle.css" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 style="text-align: center">Category Administration</h2>
    <div class="flex-center">
        <asp:GridView ID="gvCategoryAdmin" runat="server" AutoGenerateColumns="False" CellPadding="2"
            AutoGenerateEditButton="True"
            ShowFooter="True"
            FooterStyle-CssClass="footer-style" RowStyle-HorizontalAlign="Center"
            RowStyle-BackColor="#6f8d93" 
            HeaderStyle-BackColor="#93756f"
            FooterStyle-BackColor="#4e685f"
            FooterStyle-HorizontalAlign="Center"
            EditRowStyle-BackColor="#936f7b"
            DataSourceID="SqlDataSource1" 
            DataKeyNames="id" EditRowStyle-HorizontalAlign="Center"
            OnRowUpdating="TaskGridView_RowUpdating">
            <AlternatingRowStyle BackColor="#6F9375" HorizontalAlign="Center"></AlternatingRowStyle>
            <Columns>
                <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="id">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Description" SortExpression="description">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtCategoryDescription" runat="server" Text='<%# Bind("description") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="rfEditCategoryDescription" runat="server"
                            ErrorMessage="Description is Required"
                            ControlToValidate="txtCategoryDescription" Text="*"
                            ForeColor="Red" ToolTip="A Description must be entered">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtCategoryDescription" runat="server" Height="20px" Width="175px"
                            MaxLength="50"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="rfCategoryDescription" runat="server"
                            ErrorMessage="Category Description is Required"
                            ControlToValidate="txtCategoryDescription" Text="*"
                            ForeColor="Red" ToolTip="A Category Description must be entered"
                            ValidationGroup="CategoryInsert"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("description") %>'></asp:Label>
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
                <asp:TemplateField ShowHeader="False">
                    <FooterTemplate>
                        <asp:Button ID="Button1" runat="server" Text="Insert Category" OnClick="btnAdd_Click"
                            CausesValidation="true" ValidationGroup="CategoryInsert" CssClass="styled-btn" />
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False"
                            CommandName="Delete" Text="Delete" CssClass="styled-btn-delete"
                            OnClientClick="return confirm('Are you sure you want to delete?');"></asp:LinkButton>
                    </ItemTemplate>
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
            SelectCommand="SELECT [id], [description], [status] FROM [category] ORDER BY [description]"
            DeleteCommand="DELETE FROM [category] WHERE [id] = @id"
            InsertCommand="INSERT INTO [category] ([description], [status]) VALUES (@description, @status)"
            UpdateCommand="UPDATE [category] SET [description] = @description, [status] = @status WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter Name="status" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter Name="status" Type="Boolean" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <div class="flex-col-container">
            <asp:CustomValidator ID="cvCategoryDescription" runat="server"
                ErrorMessage="A Category with the same description already exists."></asp:CustomValidator>
            <asp:ValidationSummary ID="vsCategorySummary" HeaderText="There were errors with your submission:"
                runat="server" ValidationGroup="CategoryInsert" />
        </div>
    </div>
</asp:Content>
