<%@ Page Title="" Language="C#" MasterPageFile="~/Administration/Admin.Master" AutoEventWireup="true"
    CodeBehind="Customers.aspx.cs" Inherits="FormsAuthenticateProject.Administration.Customers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../Styles/AdministrationStyle.css" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 style="text-align: center; margin: 10px 0px;">Customer/User Maintenance</h2>
    <asp:Panel runat="server" ID="pnlSearch" class="flex-col-container col-row-gap-25">
        <asp:Label ID="Label1" runat="server" Font-Bold="true" Font-Size="Large" Text="Search Accounts"></asp:Label>
        <asp:TextBox ID="txtInputSearch" runat="server"></asp:TextBox>
        <asp:CustomValidator ID="cvCustomerNotFound" runat="server"
            ErrorMessage=""></asp:CustomValidator>
        <div>
            <asp:Button ID="btnFirstSearch" runat="server" CssClass="styled-btn-search" Text="Search by First Name"
                OnClick="btnFirstSearch_Click" />
            <asp:Button ID="btnLastSearch" runat="server" CssClass="styled-btn-search"
                Text="Search by Last Name" OnClick="btnLastSearch_Click" />
            <asp:Button ID="btnIdSearch" runat="server" CssClass="styled-btn-search"
                Text="Search by Account ID" OnClick="Button1_Click" />
        </div>
        <div>
            <asp:Button ID="btnCreate" runat="server" CssClass="styled-btn"
                Text="Create New Account" OnClick="btnCreate_Click" />
        </div>
        <asp:GridView ID="gvCustomersMaintenance" runat="server"
            AutoGenerateSelectButton="True" CellPadding="4" ForeColor="#333333" AutoGenerateColumns="false"
            RowStyle-HorizontalAlign="Center" OnSelectedIndexChanged="CustomersGridView_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="Account ID" />
                <asp:BoundField DataField="first_name" HeaderText="First Name" />
                <asp:BoundField DataField="last_name" HeaderText="Last Name" />
                <asp:BoundField DataField="role" HeaderText="Role" />
                <asp:BoundField DataField="status" HeaderText="Status" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
    </asp:Panel>

    <asp:Panel ID="pnlAccount" runat="server" CssClass="flex-container" Visible="false">
        <div class="customer-info-box">
            <span>ID:
                <asp:Label ID="lblCustomerID" runat="server" Text=""></asp:Label></span>
            <span>Email:
                <asp:Label ID="lblCustomerEmail" runat="server" Text=""></asp:Label></span>
        </div>
        <asp:Label ID="lblErrorMsg" runat="server" Text="Label" Visible="False"
            Font-Bold="True" ForeColor="#CC0000"></asp:Label>
        <div class="flex-row">
            <asp:Label ID="Label2" runat="server" Text="First Name"></asp:Label>
            <div class="text-input-registration">
                <asp:TextBox ID="txtFirstNameMaintenance" runat="server" MaxLength="75" Width="200px"
                    Height="20px"></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="rfFirstName" runat="server"
                    ErrorMessage="First Name is Required"
                    ControlToValidate="txtFirstNameMaintenance" Text="*"
                    ForeColor="Red" ToolTip="First Name must be entered"
                    ValidationGroup="ProfileMaintenance"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="flex-row">
            <asp:Label ID="Label3" runat="server" Text="Last Name"></asp:Label>
            <div class="text-input-registration">
                <asp:TextBox ID="txtLastNameMaintenance" runat="server" MaxLength="75" Width="200px"
                    Height="20px"></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="rfLastName" runat="server"
                    ErrorMessage="Last Name is Required"
                    ControlToValidate="txtLastNameMaintenance" Text="*"
                    ForeColor="Red" ToolTip="Last Name must be entered"
                    ValidationGroup="ProfileMaintenance"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="flex-row">
            <asp:Label ID="Label4" runat="server" Text="Email Address"></asp:Label>
            <div class="text-input-registration">
                <asp:TextBox ID="txtEmailAddressMaintenance" runat="server" MaxLength="150" Width="200px"
                    Height="20px"></asp:TextBox>
                <asp:CustomValidator ID="cvEmailChange" runat="server"
                    ToolTip="Email Changes require the password and secret answer to also be changed."
                    Text="*"
                    ForeColor="Red"></asp:CustomValidator>
                <asp:RequiredFieldValidator
                    ID="rfEmail" runat="server"
                    ErrorMessage="Email Address is Required"
                    ControlToValidate="txtEmailAddressMaintenance" Text="*"
                    ForeColor="Red" ToolTip="Email must be entered"
                    ValidationGroup="ProfileMaintenance"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revEmail" runat="server"
                    ErrorMessage="Email is not in a Valid format"
                    ControlToValidate="txtEmailAddressMaintenance" Text="*" ForeColor="red"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    ValidationGroup="ProfileMaintenance" ToolTip="Email is not in a Valid format"></asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="flex-row">
            <asp:Label ID="lblPhone" runat="server" Text="Phone Number"></asp:Label>
            <div class="text-input-registration">
                <asp:TextBox ID="txtPhoneNumberMaintenance" runat="server" MaxLength="50" Width="200px"
                    Height="20px"></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="rfPhoneNumber" runat="server"
                    ErrorMessage="Phone Number is Required"
                    ControlToValidate="txtPhoneNumberMaintenance" Text="*"
                    ForeColor="Red" ToolTip="Phone number must be entered"
                    ValidationGroup="ProfileMaintenance"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="flex-row">
            <asp:Label ID="Label5" runat="server" Text="Password"></asp:Label>
            <div class="text-input-registration">
                <asp:TextBox ID="txtPasswordMaintenance" runat="server" MaxLength="12" TextMode="Password"
                    Width="200px"
                    Height="20px"></asp:TextBox>
                <asp:CustomValidator runat="server"
                    ToolTip="Password is Required."
                    Text="*"
                    ForeColor="Red"
                    ID="cvError1"></asp:CustomValidator>
            </div>
        </div>

        <div class="flex-row">
            <asp:Label ID="Label7" runat="server" CssClass="flex-container" Text="Account Recovery Question"></asp:Label>
            <div class="text-input-registration">
                <asp:DropDownList ID="dlSecretQuestionMaintenance" runat="server" Width="275px" Height="25px"
                    BackColor="#8fbc8f">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfSecretQuestionMaintenance"
                    ValidationGroup="ProfileMaintenance" runat="server"
                    ControlToValidate="dlSecretQuestionMaintenance"
                    ErrorMessage="Secret Question is Required"
                    Font-Size="Large" ForeColor="Red"
                    Text="*" ToolTip="Secret Question is Required"></asp:RequiredFieldValidator>
                <asp:CustomValidator runat="server" ToolTip="Security Question must be selected."
                    Text="*"
                    ForeColor="Red"
                    ID="cvError2"></asp:CustomValidator>
            </div>
        </div>
        <div class="flex-row">
            <asp:Label ID="Label8" runat="server" Text="Secret Answer"></asp:Label>
            <div class="text-input-registration">
                <asp:TextBox ID="txtSecretAnswerMaintenance" runat="server" Width="200px" Height="20px">
                </asp:TextBox>
                <asp:CustomValidator runat="server" ToolTip="Security Answer is Required."
                    Font-Size="Large" ForeColor="Red"
                    Text="*"
                    ID="cvError4"></asp:CustomValidator>

            </div>
        </div>
        <div class="flex-row">
            <asp:Label ID="Label6" runat="server" CssClass="flex-container" Text="Role"></asp:Label>
            <div class="text-input-registration">
                <asp:DropDownList ID="dlRoleMaintenance" runat="server" Width="200px" Height="25px"
                    BackColor="#8fbc8f">
                </asp:DropDownList>
                <asp:CustomValidator runat="server" ToolTip="Role must be selected."
                    Font-Size="Large" ForeColor="Red"
                    Text="*"
                    ID="cvError3"></asp:CustomValidator>

            </div>
        </div>
        <div class="flex-row">
            <asp:Label ID="Label9" runat="server" CssClass="flex-container" Text="Status"></asp:Label>
            <div class="text-input-registration">
                <asp:DropDownList ID="dlStatus" runat="server" Width="200px" Height="25px"
                    BackColor="#8fbc8f">
                    <asp:ListItem>Active</asp:ListItem>
                    <asp:ListItem>Inactive</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <asp:ValidationSummary ID="vsProfile" runat="server" ValidationGroup="ProfileMaintenance"
            DisplayMode="BulletList"
            HeaderText="There were errors with your submission:"
            Font-Names="verdana"
            Font-Size="12" />
        <div style="text-align: center;">
            <div class="flex-container">
                <asp:Button ID="btnUpdateProfile" runat="server" CssClass="styled-btn" Text="Update Account"
                    ValidationGroup="ProfileMaintenance" CausesValidation="true"
                    OnClick="btnUpdateProfile_Click" />
                <asp:Button ID="btnCreateUser" runat="server" CssClass="styled-btn" Text="Create Account"
                    ValidationGroup="ProfileMaintenance" CausesValidation="true"
                    OnClick="btnCreateUser_Click" Visible="false" />
                <asp:Button ID="btnCancel" runat="server" CssClass="styled-btn" Text="Cancel"
                    OnClick="btnCancel_Click" />
            </div>
        </div>
    </asp:Panel>
</asp:Content>
