<%@ Page Title="" Language="C#" MasterPageFile="~/Administration/Admin.Master" AutoEventWireup="true"
    CodeBehind="Roles.aspx.cs" Inherits="FormsAuthenticateProject.Administration.Roles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 style="text-align: center">Role Administration</h2>
    <div>

        <asp:GridView ID="gvRoles" runat="server" AutoGenerateColumns="False"
            ShowFooter="True">
            <Columns>
                <asp:TemplateField HeaderText="ID">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("id") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:Button ID="btnAdd" runat="server" Text="Save" Width="125px"
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
                        <asp:TextBox ID="txtDescription" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rvtxtDescription" runat="server"
                            ControlToValidate="txtDescription" Text="*"
                            ValidationGroup="RoleAdd"
                            ForeColor="Red"
                            ErrorMessage="A Description is Required"></asp:RequiredFieldValidator>
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
                        <asp:DropDownList ID="dlStatus" runat="server" Width="118px">
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
        <asp:CustomValidator ID="cvDescriptionName" runat="server"
            ErrorMessage="A Role with the same description already exists."></asp:CustomValidator>
        <asp:ValidationSummary ID="vsGridViewAdd" HeaderText="There were errors with your submission:" runat="server" ValidationGroup="RoleAdd" />
    </div>
</asp:Content>
