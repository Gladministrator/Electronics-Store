<%@ Page Title="" Language="C#" MasterPageFile="~/Administration/Admin.Master" AutoEventWireup="true" CodeBehind="Roles.aspx.cs" Inherits="FormsAuthenticateProject.Administration.Roles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 style="text-align:center">Role Administration</h2>
    <div>

        <asp:GridView ID="gvRoles" runat="server"></asp:GridView>
    </div>
</asp:Content>
