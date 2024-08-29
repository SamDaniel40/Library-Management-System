<%@ Page Title="Book Fine Entry" Language="C#" MasterPageFile="~/AdminScreen/Admin.Master" AutoEventWireup="true" CodeFile="BookFineEntry.aspx.cs" Inherits="AdminScreen_BookFineEntry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        body {
            font-family: Arial;
            font-size: 17px;
        }

        * {
            box-sizing: border-box;
        }

        .row {
            display: -ms-flexbox; /* IE10 */
            display: flex;
            -ms-flex-wrap: wrap; /* IE10 */
            flex-wrap: wrap;
            margin: 0 -16px;
        }

        .col-25 {
            -ms-flex: 25%; /* IE10 */
            flex: 25%;
        }

        .col-50 {
            -ms-flex: 50%; /* IE10 */
            flex: 50%;
        }

        .col-75 {
            -ms-flex: 75%; /* IE10 */
            flex: 75%;
        }

        .col-25, .col-50, .col-75 {
            padding: 0 16px;
        }

        .container {
            background-color: #f2f2f2;
            padding: 5px 20px 15px 20px;
            border: 1px solid lightgrey;
            border-radius: 3px;
        }

        input[type=text],select {
            width: 100%;
            margin-bottom: 20px;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        label {
            margin-bottom: 10px;
            display: block;
        }

        .icon-container {
            margin-bottom: 20px;
            padding: 7px 0;
            font-size: 24px;
        }

        a {
            color: #2196F3;
        }

        hr {
            border: 1px solid lightgrey;
        }

        span.price {
            float: right;
            color: grey;
        }

        /* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other (also change the direction - make the "cart" column go on top) */
        @media (max-width: 800px) {
            .row {
                flex-direction: column-reverse;
            }

            .col-25 {
                margin-bottom: 20px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid">
        <div class="row border p-3" id="A1" runat="server">
            Hi &nbsp;<asp:Label ID="lblMembername" runat="server" Text="Label" ForeColor="Red" Font-Size="Large"></asp:Label>,
            <p>&nbsp;Please Pay Fine Amount ...&nbsp;</p>
            <div class="w-50">
                Amount (Rs.):- &nbsp;
                <asp:Label ID="lblfine" runat="server" Text="Label" Font-Bold="true"></asp:Label>
                <asp:Button ID="btnNext" CssClass="btn btn-md btn-primary w-25 float-right" runat="server" Text="Continue" OnClick="btnNext_Click" />
            </div>
        </div>

        <div class="row" id="A2" runat="server" visible="false">
            <div class="col-75">
                <br />
                <div class="container">
                    <div class="row">
                        <div class="col-50">
                            <h3>Billing Address</h3>
                            <label for="fname"><i class="fa fa-user"></i> Full Name</label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" Font-Bold="true" Font-Size="10" ErrorMessage="*Please Enter Name*" ForeColor="Red" ControlToValidate="txtFullName" ValidationGroup="paymentbtn"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtFullName" runat="server" placeholder="e.g. John M. Doe"></asp:TextBox>
                            
                            <label for="email"><i class="fa fa-envelope"></i> Email</label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" Font-Bold="true" Font-Size="10" ErrorMessage="*Please Enter valid Email*8" ForeColor="Red" ControlToValidate="txtEmail" ValidationGroup="paymentbtn"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtEmail" runat="server" placeholder="e.g. john@example.com"></asp:TextBox>
                            
                            <label for="adr"><i class="fa fa-address-card-o"></i> Address</label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic" Font-Bold="true" Font-Size="10" ErrorMessage="*Please Enter Address*" ForeColor="Red" ControlToValidate="txtaddress" ValidationGroup="paymentbtn"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtaddress" runat="server" placeholder="e.g. 542 W. 15th Street"></asp:TextBox>
                            
                            <label for="city"><i class="fa fa-institution"></i> City</label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Display="Dynamic" Font-Bold="true" Font-Size="10" ErrorMessage="*Please Enter City*" ForeColor="Red" ControlToValidate="txtCity" ValidationGroup="paymentbtn"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtCity" runat="server" placeholder="e.g. Durgapur"></asp:TextBox>

                            <div class="row">
                                <div class="col-50">
                                    <label for="state">State</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" Display="Dynamic" Font-Bold="true" Font-Size="10" ErrorMessage="*Please Enter State*" ForeColor="Red" ControlToValidate="txtstate" ValidationGroup="paymentbtn"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtstate" runat="server" placeholder="e.g. West Bengal"></asp:TextBox>
                                </div>
                                <div class="col-50">
                                    <label for="zip">Zip</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" Display="Dynamic" Font-Bold="true" Font-Size="10" ErrorMessage="*Please Enter PinCode*" ForeColor="Red" ControlToValidate="txtzip" ValidationGroup="paymentbtn"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtzip" runat="server" placeholder="10001"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="col-50">
                            <h3>Payment</h3>
                            <label for="fname">Accepted Cards</label>
                            <div class="icon-container">
                                <i class="fa-brands fa-cc-visa" style="color: navy;"></i>
                                <i class="fa-brands fa-cc-amex" style="color: blue;"></i>
                                <i class="fa-brands fa-cc-mastercard" style="color: red;"></i>
                                <i class="fa-brands fa-cc-discover" style="color: orange;"></i>
                            </div>
                            <label for="cname">Amount</label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtAmount" runat="server" Display="Dynamic" Font-Bold="true" Font-Size="10" ErrorMessage="*Enter Amount*" ForeColor="Red" ValidationGroup="paymentbtn"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtAmount" runat="server"></asp:TextBox>

                            <label for="cname">Payment Option</label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" InitialValue="0" Display="Dynamic" Font-Bold="true" Font-Size="10" ErrorMessage="*Please Select Pay Option*" ForeColor="Red" ControlToValidate="ddlPayOption" ValidationGroup="paymentbtn"></asp:RequiredFieldValidator>
                            <asp:DropDownList ID="ddlPayOption" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlPayOption_SelectedIndexChanged">
                                <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                <asp:ListItem Text="Cash" Value="Cash"></asp:ListItem>
                                <asp:ListItem Text="Card" Value="Card"></asp:ListItem>
                            </asp:DropDownList>

                            <label for="cname">Name on Card</label>
                            <asp:RequiredFieldValidator ID="rfvNameonCard" runat="server" Enabled="false" Display="Dynamic" Font-Bold="true" Font-Size="10" ErrorMessage="*Please Enter Name on Card*" ForeColor="Red" ControlToValidate="txtNameOnCard" ValidationGroup="paymentbtn"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtNameOnCard" runat="server"></asp:TextBox>

                            <label for="ccnum">Debit/Credit Card No.</label>
                            <asp:RequiredFieldValidator ID="rfvDebitCreditNo" runat="server" Enabled="false" Display="Dynamic" Font-Bold="true" Font-Size="10" ErrorMessage="*Please Enter Card No*" ForeColor="Red" ControlToValidate="txtcardNumber" ValidationGroup="paymentbtn"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtcardNumber" runat="server" placeholder="e.g. 1111-2222-3333-4444"></asp:TextBox>

                            <label for="expmonth">Exp Month</label>
                            <asp:RequiredFieldValidator ID="rfvExpmonth" runat="server" Enabled="false" Display="Dynamic" Font-Bold="true" Font-Size="10" ErrorMessage="*Please Enter Exp Month*" ForeColor="Red" ControlToValidate="txtExpmonth" ValidationGroup="paymentbtn"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtExpmonth" runat="server" placeholder="e.g. January"></asp:TextBox>

                            <div class="row">
                                <div class="col-50">
                                    <label for="expyear">Exp Year</label>
                                    <asp:RequiredFieldValidator ID="rfvExpyear" runat="server" Enabled="false" Display="Dynamic" Font-Bold="true" Font-Size="10" ErrorMessage="*Please Enter Exp Year*" ForeColor="Red" ControlToValidate="txtexpyear" ValidationGroup="paymentbtn"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtexpyear" runat="server" placeholder="e.g. 2024"></asp:TextBox>
                                </div>
                                <div class="col-50">
                                    <label for="cvv">CVV</label>
                                    <asp:RequiredFieldValidator ID="rfvcvv" runat="server" Enabled="false" Display="Dynamic" Font-Bold="true" Font-Size="10" ErrorMessage="*Please Enter CVV*" ForeColor="Red" ControlToValidate="txtcvv" ValidationGroup="paymentbtn"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtcvv" runat="server" placeholder="e.g. 123"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>

                    <label>
                        <asp:CheckBox ID="chkboxSameasAddress" runat="server" Checked="true" />Shipping address same as billing
                    </label>

                    <asp:Button ID="btnsubmit" runat="server" class="btn btn-success" Text="Continue to checkout" OnClick="btnsubmit_Click" ValidationGroup="paymentbtn" />
                </div>
                <br />
            </div>
        </div>
        <asp:Label ID="lblredirectMsg" runat="server" Text="You will be redirected after 5 Second" Style="border: 2px solid black; font-size: large"></asp:Label>
    </div>
</asp:Content>

