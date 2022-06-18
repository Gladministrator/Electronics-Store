<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/Customer.Master" AutoEventWireup="true"
    CodeBehind="OrderProduct.aspx.cs" Inherits="FormsAuthenticateProject.Customer.OrderProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../Styles/Customer.css" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align: center">
        <h2 style="text-align: center; margin: 10px 0px;">Order Product</h2>
        <div class="dropdowns col-row-gap-25">
            <asp:DropDownList ID="DropDownList1" runat="server" BackColor="#8fbc8f" Width="200px"
                OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="true">
            </asp:DropDownList>
            <asp:DropDownList ID="DropDownList2" runat="server" BackColor="#8fbc8f" Width="200px"
                OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="true">
            </asp:DropDownList>
            <asp:DropDownList ID="DropDownList3" runat="server" BackColor="#8fbc8f" Width="200px"
                OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged" AutoPostBack="true">
            </asp:DropDownList>
        </div>
        <asp:Panel ID="pnlOrder" runat="server" Visible="false">
            <div>
                <div>
                    <asp:Label ID="lblProduct" runat="server" Font-Bold="true" ForeColor="#42426f" Font-Size="Large"></asp:Label>
                </div>
                <asp:Label ID="lblPrice" runat="server" Font-Bold="true" ForeColor="#25333f"></asp:Label>
                <asp:Label ID="lblTaxes" runat="server" Font-Bold="true" ForeColor="#25333f"></asp:Label>
                <div>
                <asp:Label ID="Label6" runat="server" Font-Bold="true" ForeColor="#25333f" Text="Total Price"></asp:Label>
                <asp:Label ID="lblTotal" runat="server" Font-Bold="true" ForeColor="#25333f"></asp:Label>
                    </div>
            </div>
            <div class="flex-container">
                <h3 style="margin: 14px 0 0 0;">Payment Information</h3>
                <div class="flex-row">
                    <div class="flex-col-container">
                        <asp:Label ID="Label2" runat="server" Text="Card Holder Name"></asp:Label>
                        <div class="text-input-registration">
                            <asp:TextBox ID="txtCardName" runat="server" MaxLength="150" Width="200px"
                                Height="20px"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="rfCardName" runat="server"
                                ControlToValidate="txtCardName" Text="*"
                                ForeColor="Red" ToolTip="A Name must be entered"
                                ValidationGroup="OrderValidation"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="flex-col-container">
                        <asp:Label ID="Label7" runat="server" CssClass="flex-container" Text="Card Type"></asp:Label>
                        <div class="text-input-registration">
                            <asp:DropDownList ID="dlCardType" runat="server"
                                BackColor="#8fbc8f">
                                <asp:ListItem Value="-1">Select</asp:ListItem>
                                <asp:ListItem>American Express</asp:ListItem>
                                <asp:ListItem>Mastercard</asp:ListItem>
                                <asp:ListItem>Visa</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator InitialValue="-1" ID="rvCardType" Display="Dynamic"
                                ValidationGroup="OrderValidation" runat="server" ControlToValidate="dlCardType"
                                Text="*" ForeColor="Red" ToolTip="Select a Card"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
                <div class="flex-row">
                    <div class="flex-col-container">
                        <asp:Label ID="Label3" runat="server" Text="Card Number"></asp:Label>
                        <div class="text-input-registration">
                            <asp:TextBox ID="txtCardNumber" runat="server" MaxLength="50" Width="200px"
                                Height="20px"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="rfLastName" runat="server"
                                ControlToValidate="txtCardNumber" Text="*"
                                ForeColor="Red" ToolTip="Card must be entered"
                                ValidationGroup="OrderValidation"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="reCardNumber" runat="server"
                                ControlToValidate="txtCardNumber" Text="*" ForeColor="red"
                                ValidationExpression="\d+"
                                ValidationGroup="OrderValidation" ToolTip="Card is not in a Valid format, must be numbers"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div class="flex-col-container">
                        <asp:Label ID="Label4" runat="server" Text="Security Code"></asp:Label>
                        <div class="text-input-registration">
                            <asp:TextBox ID="txtSecurity" runat="server" MaxLength="3"
                                Height="20px"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator5" runat="server"
                                ControlToValidate="txtSecurity" Text="*"
                                ForeColor="Red" ToolTip="Security Code must be entered"
                                ValidationGroup="OrderValidation"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="reSecurityCode" runat="server"
                                ControlToValidate="txtSecurity" Text="*" ForeColor="red"
                                ValidationExpression="\d{3}"
                                ValidationGroup="OrderValidation" ToolTip="Must be a 3 digit code"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                </div>
                <div class="flex-row">
                    <div class="flex-col-container">
                        <asp:Label ID="Label1" runat="server" CssClass="flex-container" Text="Expiry: Month"></asp:Label>
                        <div class="text-input-registration">
                            <asp:DropDownList ID="dlMonth" runat="server"
                                BackColor="#8fbc8f">
                                <asp:ListItem Value="-1">Select</asp:ListItem>
                                <asp:ListItem>01</asp:ListItem>
                                <asp:ListItem>02</asp:ListItem>
                                <asp:ListItem>03</asp:ListItem>
                                <asp:ListItem>04</asp:ListItem>
                                <asp:ListItem>05</asp:ListItem>
                                <asp:ListItem>06</asp:ListItem>
                                <asp:ListItem>07</asp:ListItem>
                                <asp:ListItem>08</asp:ListItem>
                                <asp:ListItem>09</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                                <asp:ListItem>11</asp:ListItem>
                                <asp:ListItem>12</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator InitialValue="-1" ID="RequiredFieldValidator1" Display="Dynamic"
                                ValidationGroup="OrderValidation" runat="server" ControlToValidate="dlMonth"
                                Text="*" ForeColor="Red" ToolTip="Select a Month"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="flex-col-container">
                        <asp:Label ID="Label5" runat="server" CssClass="flex-container" Text="Expiry: Year"></asp:Label>
                        <div class="text-input-registration">
                            <asp:DropDownList ID="dlYear" runat="server"
                                BackColor="#8fbc8f">
                                <asp:ListItem Value="-1">Select</asp:ListItem>
                                <asp:ListItem>2022</asp:ListItem>
                                <asp:ListItem>2023</asp:ListItem>
                                <asp:ListItem>2024</asp:ListItem>
                                <asp:ListItem>2025</asp:ListItem>
                                <asp:ListItem>2026</asp:ListItem>
                                <asp:ListItem>2027</asp:ListItem>
                                <asp:ListItem>2028</asp:ListItem>
                                <asp:ListItem>2029</asp:ListItem>
                                <asp:ListItem>2030</asp:ListItem>
                                <asp:ListItem>2031</asp:ListItem>
                                <asp:ListItem>2032</asp:ListItem>
                                <asp:ListItem>2033</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator InitialValue="-1" ID="RequiredFieldValidator2" Display="Dynamic"
                                ValidationGroup="OrderValidation" runat="server" ControlToValidate="dlYear"
                                Text="*" ForeColor="Red" ToolTip="Select a Year"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>

                <h3 style="text-align: center; margin: 14px 0 0 0;">Shipping Information</h3>
                <div class="flex-row">
                    <div class="flex-col-container">
                        <asp:Label ID="Label13" runat="server" Text="Street Address"></asp:Label>
                        <div class="text-input-registration">
                            <asp:TextBox ID="txtAddress" runat="server" MaxLength="75" Width="200px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfFirstName" runat="server"
                                ControlToValidate="txtAddress" Text="*"
                                ForeColor="Red" ToolTip="Address is Required"
                                Font-Size="Large" ValidationGroup="OrderValidation"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="flex-col-container">
                        <asp:Label ID="Label14" runat="server" Text="Apartment/Unit Number"></asp:Label>
                        <div class="text-input-registration">
                            <asp:TextBox ID="txtApt" runat="server" MaxLength="25" Width="200px"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="flex-row">
                    <div class="flex-col-container">
                        <asp:Label ID="Label8" runat="server" Text="City"></asp:Label>
                        <div class="text-input-registration">
                            <asp:TextBox ID="txtCity" runat="server" Width="193px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                ControlToValidate="txtCity" Text="*"
                                ForeColor="Red" ToolTip="City is Required"
                                Font-Size="Large" ValidationGroup="OrderValidation"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="flex-col-container">
                        <asp:Label ID="Label9" runat="server" Text="Provice/Territory"></asp:Label>
                        <div class="text-input-registration">
                            <asp:DropDownList ID="dlRegion" runat="server"
                                BackColor="#8fbc8f">
                                <asp:ListItem Value="-1">Select</asp:ListItem>
                                <asp:ListItem>Alberta</asp:ListItem>
                                <asp:ListItem>British Columbia</asp:ListItem>
                                <asp:ListItem>Manitoba</asp:ListItem>
                                <asp:ListItem>New Brunswick</asp:ListItem>
                                <asp:ListItem>Newfoundland and Labrador</asp:ListItem>
                                <asp:ListItem>Northwest Territories</asp:ListItem>
                                <asp:ListItem>Nova Scotia</asp:ListItem>
                                <asp:ListItem>Nunavut</asp:ListItem>
                                <asp:ListItem>Ontario</asp:ListItem>
                                <asp:ListItem>Prince Edward Island</asp:ListItem>
                                <asp:ListItem>Quebec</asp:ListItem>
                                <asp:ListItem>Saskatchewan</asp:ListItem>
                                <asp:ListItem>Yukon</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator InitialValue="-1" ID="RequiredFieldValidator3" Display="Dynamic"
                                ValidationGroup="OrderValidation" runat="server" ControlToValidate="dlRegion"
                                Text="*" ForeColor="Red" ToolTip="Select a Province/Territory"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
                <div class="flex-row">
                    <div class="flex-col-container">
                        <asp:Label ID="Label10" runat="server" Text="Postal Code"></asp:Label>
                        <div class="text-input-registration">
                            <asp:TextBox ID="txtPost" runat="server" MaxLength="10"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                                ControlToValidate="txtPost" Text="*"
                                ForeColor="Red" ToolTip="Postal Code is Required"
                                Font-Size="Large" ValidationGroup="OrderValidation"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
                <div>
                    <asp:Button ID="btnSubmit" ValidationGroup="OrderValidation"
                        CausesValidation="true" runat="server" Text="Submit" CssClass="styled-btn"
                        OnClick="btnSubmit_Click" />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="styled-btn"
                        OnClick="btnCancel_Click" />
                </div>
            </div>
        </asp:Panel>
    </div>
</asp:Content>
