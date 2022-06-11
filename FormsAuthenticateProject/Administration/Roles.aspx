<%@ Page Title="" Language="C#" MasterPageFile="~/Administration/Admin.Master" AutoEventWireup="true"
    CodeBehind="Roles.aspx.cs" Inherits="FormsAuthenticateProject.Administration.Roles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../Styles/AdministrationStyle.css" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 style="text-align: center">Role Administration</h2>
    <div class="flex-center">
        <asp:GridView ID="gvRoles" runat="server" AutoGenerateColumns="False" CellPadding="2"
            FooterStyle-CssClass="footer-style" PagerStyle-CssClass="flex-row"
            AlternatingRowStyle-BackColor="#6f9375" RowStyle-BackColor="#6f8d93" HeaderStyle-BackColor="#93756f"
            FooterStyle-BackColor="#4e685f"
            ShowFooter="True" FooterStyle-VerticalAlign="Middle" FooterStyle-HorizontalAlign="Center">
            <Columns>
                <asp:TemplateField HeaderText="ID">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("id") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:Button ID="btnAdd" runat="server" CssClass="styled-btn" Text="Add" Width="125px"
                            OnClick="btnAdd_Click" CausesValidation="true" ValidationGroup="RoleAdd" />
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                    </ItemTemplate>
                    <ControlStyle />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Description">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("description") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtDescription" runat="server" Height="20px" Width="175px" MaxLength="50"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="rfRoleDescription" runat="server"
                            ErrorMessage="Role is Required"
                            ControlToValidate="txtDescription" Text="*"
                            ForeColor="Red" ToolTip="Role must be entered"
                            ValidationGroup="RoleAdd"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("description") %>'></asp:Label>
                    </ItemTemplate>
                    <ControlStyle />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Status">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtStatus" runat="server" Text='<%# Bind("status") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList ID="dlStatus" runat="server" Width="120px" BackColor="#8fbc8f">
                            <asp:ListItem Selected="True" Value="1">Active</asp:ListItem>
                            <asp:ListItem Value="0">Inactive</asp:ListItem>
                        </asp:DropDownList>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("status") %>'></asp:Label>
                    </ItemTemplate>
                    <ControlStyle />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <div class="flex-col-container">
            <asp:CustomValidator ID="cvDescriptionName" runat="server"
                ErrorMessage="A Role with the same description already exists."></asp:CustomValidator>
            <asp:ValidationSummary ID="vsGridViewAdd" HeaderText="There were errors with your submission:"
                runat="server" ValidationGroup="RoleAdd" />
        </div>
    </div>
</asp:Content>
