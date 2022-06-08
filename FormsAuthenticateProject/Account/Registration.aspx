<%@ Page Title="" Language="C#" MasterPageFile="~/Account/Account.Master" AutoEventWireup="true"
    CodeBehind="Registration.aspx.cs" Inherits="FormsAuthenticateProject.Account.Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <table width="100%">
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Email Address"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtEmailAddress" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="rfEmail" runat="server"
                        ErrorMessage="Email Address is Required"
                        ControlToValidate="txtEmailAddress" Text="*"
                        ForeColor="Red" ToolTip="Email must be entered"
                        ValidationGroup="Profile"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server"
                        ErrorMessage="Email is not in a Valid format"
                        ControlToValidate="txtEmailAddress" Text="*" ForeColor="red"
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        ValidationGroup="Profile"></asp:RegularExpressionValidator>
                </td>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="First Name"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="rfFirstName" runat="server"
                        ErrorMessage="First Name is Required"
                        ControlToValidate="txtFirstName" Text="*"
                        ForeColor="Red" ToolTip="First Name must be entered"
                        ValidationGroup="Profile"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Password"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server" MaxLength="12" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="rfPassword" runat="server"
                        ErrorMessage="Password is Required"
                        ControlToValidate="txtPassword" Text="*"
                        ForeColor="Red" ToolTip="Password must be entered"
                        ValidationGroup="Profile"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Last Name"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtLastName" runat="server" MaxLength="12"></asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="rfLastName" runat="server"
                        ErrorMessage="Last Name is Required"
                        ControlToValidate="txtLastName" Text="*"
                        ForeColor="Red" ToolTip="Last Name must be entered"
                        ValidationGroup="Profile"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="Confirm Password"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtConfirmPassword" MaxLength="12" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="rfConfirmPassword" runat="server"
                        ErrorMessage="Cofirm Password is Required"
                        ControlToValidate="txtConfirmPassword" Text="*"
                        ForeColor="Red" ToolTip="Password must be entered"
                        ValidationGroup="Profile"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cvPassword" runat="server"
                        ErrorMessage="Passwords did not match" Text="*" ValidationGroup="Profile" ToolTip="Password did not match"
                        ForeColor="Red" ControlToCompare="txtPassword"
                        ControlToValidate="txtConfirmPassword"></asp:CompareValidator>
                </td>
                <td>
                    <asp:Label ID="lblPhone" runat="server" Text="Phone Number"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPhoneNumber" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="rfPhoneNumber" runat="server"
                        ErrorMessage="Phone Number is Required"
                        ControlToValidate="txtPhoneNumber" Text="*"
                        ForeColor="Red" ToolTip="Phone number must be entered"
                        ValidationGroup="Profile"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
        <br />
        <strong>Account Recovery Security Question</strong>
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label7" runat="server" Text="Select a Question"></asp:Label>
                </td>
                <td>&nbsp;&nbsp;
                <asp:DropDownList ID="dlSecretQuestion" runat="server" Width="350px" Height="20px">
                </asp:DropDownList>
                    <asp:RequiredFieldValidator InitialValue="-1" ID="rfSecretQuestion"
                        ValidationGroup="Profile" runat="server" ControlToValidate="dlSecretQuestion"
                        ErrorMessage="Secret Question is Required"
                        Font-Size="Large" ForeColor="Red"
                        Text="*" ToolTip="Secret Question is Required"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label8" runat="server" Text="Answer"></asp:Label>
                </td>
                <td>&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtSecretAnswer" runat="server" Width="400px">
                </asp:TextBox><asp:RequiredFieldValidator
                    ID="rfSecretAnswer" runat="server"
                    ValidationGroup="Profile" ControlToValidate="txtSecretAnswer" ErrorMessage="Secret Answer is Required"
                    Font-Size="Large" ForeColor="Red"
                    Text="*" ToolTip="A Secret Answer is Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
        <br />
        <asp:ValidationSummary ID="vsProfile" runat="server" ValidationGroup="Profile"
            DisplayMode="BulletList"
            HeaderText="There were errors with your submission:"
            Font-Names="verdana"
            Font-Size="12" />
        <div style="text-align: center;">
            <asp:Label ID="lblMsg" runat="server" Text="Label" Visible="False"
                Font-Bold="True" ForeColor="#CC0000"></asp:Label>
            <br />
            <asp:Button ID="btnCreateProfile" runat="server" Text="Create Profile"
                ValidationGroup="Profile" CausesValidation="true"
                OnClick="btnCreateProfile_Click" />
            &nbsp;
            <br />
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" 
                OnClick="btnCancel_Click" />
        </div>
    </div>
</asp:Content>
