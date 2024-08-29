<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SignUp.aspx.cs" Inherits="SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width-device, initial-scale=1" />
    <link rel="shortcut icon" href="../LogoImg/logo.png" />
    <%--1-Bootstrap CSS--%>
    <link href="../Bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <%--2-Datatable CSS--%>
    <link href="../DataTable/css/dataTables.min.css" rel="stylesheet" />

    <%--3-Fontawesome CSS--%>
    <link href="../FontAwesome/css/all.css" rel="stylesheet" />

    <%--4-Jquery jS--%>
    <script src="../Bootstrap/js/jquery-3.3.1.slim.min.js"></script>

    <%--5-Popper JS--%>
    <script src="../Bootstrap/js/popper.min.js"></script>

    <%--6-Bootstrap Js--%>
    <script src="../Bootstrap/js/bootstrap.min.js"></script>

    <%--7-SweetAlert--%>
    <link href="../SweetAlert/css/sweetalert.css" rel="stylesheet" />
    <script src="../SweetAlert/js/sweetalert-dev.js"></script>
    <script src="../SweetAlert/js/sweetalert.min.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <div>

            <nav class="navbar navbar-expand-sm navbar-dark bg-primary">
                <a class="navbar-brand" href="../default.aspx">
                    <img src="../LogoImg/logo.png" alt="logo" width="49" height="49" />
                    LMS Application</a>

                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="collapsibleNavbar">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="../default.aspx"><b>Home</b></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><b>Library Collection</b></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><b>Archives</b></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><b>Publications</b></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><b>Gallery</b></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><b>Contact Us</b></a>
                        </li>
                    </ul>
                </div>
                <!-- Navbar Right icon -->
                <div class="pmd-navbar-right-icon ml-auto">
                    <%--<a id="signup" class="btn btn-sm btn-primary" href="SignUp.aspx">Sign Up</a>--%>
                    <a class="btn btn-sm btn-primary" href="Login.aspx">Sign In</a>
                </div>
            </nav>

            <div class="jumbotron text-center alert alert-primary" style="margin-bottom: 0">
                <h1>Library Management System</h1>
                <p>Building community. Inspiring readers. Expanding book access!</p>
            </div>

            <div class="container-fluid">
                <div class="row">
                    <%--<div class="col-sm-2 border border-info">
                        <h2>Filter</h2>
                        <p>Top Search.</p>
                        <ul class="nav nav-pills flex-column">
                            <li class="nav-item">
                                <a class="nav-link active" href="#">Active</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Link</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Link</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link disabled" href="#">Disabled</a>
                            </li>
                        </ul>
                        <hr class="d-sm-none" />
                    </div>--%>
                    <div class="col-sm-12 border border-info">
                        <%-- Login screen--%>
                        <div class="container mt-3">
                            <h2>Create New account</h2>
                            <br />
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#signup">Sign Up</a>
                                </li>

                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div id="signup" class="container tab-pane active">
                                    <br />
                                    <h3>Sign Up</h3>
                                    <p></p>
                                    <!---design login form--->
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-md-12 mx-auto">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <div class="row">
                                                            <div class="col">
                                                                <center>
                                                                    <img width="150" src="../LogoImg/sign_up.png" />
                                                                </center>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col">
                                                                <center>
                                                                    <h3>Member/User Sign Up</h3>
                                                                </center>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col">
                                                                <hr />
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-4">
                                                                <label>Member ID</label>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Please Enter Member ID*" ControlToValidate="txtMemberID" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="txtMemberID" CssClass="form-control" placeholder="Member ID" runat="server"></asp:TextBox>
                                                                </div>

                                                                <label>Password </label>
                                                                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="*Please Enter Password*" ControlToValidate="txtPassword" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="txtPassword" CssClass="form-control" placeholder="Password" TextMode="Password" runat="server"></asp:TextBox>
                                                                    
                                                                </div>
                                                                <label>Full Name </label>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Please Enter Name*" ControlToValidate="txtFullName" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="txtFullName" CssClass="form-control" placeholder="Full Name" runat="server"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="col-4">
                                                                <label>Date of Birth</label>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Please Ener DOB*" ControlToValidate="txtDOB" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="txtDOB" CssClass="form-control" placeholder="DOB" TextMode="Date" runat="server"></asp:TextBox>
                                                                </div>

                                                                <label>Contact No.</label>
                                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*Please Enter Valid Contact No*" ControlToValidate="txtContactNo" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="txtContactNo" CssClass="form-control" placeholder="Contact No." runat="server"></asp:TextBox>
                                                                </div>
                                                                <label>Email ID </label>
                                                                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="*Please Enter Valid Email*" ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                 <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="*Please Enter Valid Email*" ControlToValidate="txtEmail" Display="Dynamic" ForeColor="#CC0099" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="txtEmail" CssClass="form-control" placeholder="Email" TextMode="Email" runat="server"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="col-4">
                                                                <label>State</label>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*Please Select State*" ControlToValidate="ddlState" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                <div class="form-group">
                                                                    <asp:DropDownList ID="ddlState" CssClass="form-control" runat="server">
                                                                        <asp:ListItem Text="Select" Value="Select"></asp:ListItem>
                                                                        <asp:ListItem Text="Andhra Pradesh" Value="Andhra Pradesh" />
                                                                        <asp:ListItem Text="Arunachal Pradesh" Value="Arunachal Pradesh" />
                                                                        <asp:ListItem Text="Assam" Value="Assam" />
                                                                        <asp:ListItem Text="Bihar" Value="Bihar" />
                                                                        <asp:ListItem Text="Chhattisgarh" Value="Chhattisgarh" />
                                                                        <asp:ListItem Text="Rajasthan" Value="Rajasthan" />
                                                                        <asp:ListItem Text="Goa" Value="Goa" />
                                                                        <asp:ListItem Text="Gujarat" Value="Gujarat" />
                                                                        <asp:ListItem Text="Haryana" Value="Haryana" />
                                                                        <asp:ListItem Text="Himachal Pradesh" Value="Himachal Pradesh" />
                                                                        <asp:ListItem Text="Jammu and Kashmir" Value="Jammu and Kashmir" />
                                                                        <asp:ListItem Text="Jharkhand" Value="Jharkhand" />
                                                                        <asp:ListItem Text="Karnataka" Value="Karnataka" />
                                                                        <asp:ListItem Text="Kerala" Value="Kerala" />
                                                                        <asp:ListItem Text="Madhya Pradesh" Value="Madhya Pradesh" />
                                                                        <asp:ListItem Text="Maharashtra" Value="Maharashtra" />
                                                                        <asp:ListItem Text="Manipur" Value="Manipur" />
                                                                        <asp:ListItem Text="Meghalaya" Value="Meghalaya" />
                                                                        <asp:ListItem Text="Mizoram" Value="Mizoram" />
                                                                        <asp:ListItem Text="Nagaland" Value="Nagaland" />
                                                                        <asp:ListItem Text="Odisha" Value="Odisha" />
                                                                        <asp:ListItem Text="Punjab" Value="Punjab" />
                                                                        <asp:ListItem Text="Rajasthan" Value="Rajasthan" />
                                                                        <asp:ListItem Text="Sikkim" Value="Sikkim" />
                                                                        <asp:ListItem Text="Tamil Nadu" Value="Tamil Nadu" />
                                                                        <asp:ListItem Text="Telangana" Value="Telangana" />
                                                                        <asp:ListItem Text="Tripura" Value="Tripura" />
                                                                        <asp:ListItem Text="Uttar Pradesh" Value="Uttar Pradesh" />
                                                                        <asp:ListItem Text="Uttarakhand" Value="Uttarakhand" />
                                                                        <asp:ListItem Text="West Bengal" Value="West Bengal" />
                                                                    </asp:DropDownList>
                                                                </div>

                                                                <label>City</label>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*Please Enter City**" ControlToValidate="txtCity" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="txtCity" CssClass="form-control" placeholder="City" runat="server"></asp:TextBox>
                                                                </div>
                                                                <label>PinCode</label>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*Please Enter PinCode*" ControlToValidate="txtPinCode" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="txtPinCode" CssClass="form-control" placeholder="PIN CODE" runat="server"></asp:TextBox>
                                                                </div>
                                                            </div>

                                                        </div>
                                                        <div class="row">
                                                            <div class="col-12">
                                                                <label>Full Address</label>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*Please Enter Full Address*" ControlToValidate="txtAddress" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="txtAddress" CssClass="form-control" placeholder="Address" runat="server"></asp:TextBox>
                                                                </div>

                                                            </div>

                                                        </div>
                                                        <div class="row">
                                                            <div class="col-3">
                                                                <div class="form-group">
                                                                    <asp:Button ID="btnSignup" CssClass="btn btn-success btn-lg btn-block" runat="server" Text="Sign Up" OnClick="btnSignup_Click" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <a href="default.aspx"><< Back to Home screen</a>
                                            </div>
                                        </div>
                                    </div>
                                    <!----design end--->
                                </div>
                            </div>
                        </div>
                        <!---ENd login screen--->
                    </div>
                </div>
            </div>

            <br />
            <div class="jumbotron text-center alert alert-danger" style="margin-bottom: 0; border: 2px solid red">
                <p>Footer</p>
                <div class="container">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="footer-pad">
                                <h4>Heading1</h4>
                                <ul class="list-unstyled">
                                    <li><a href="#"></a></li>
                                    <li><a href="#">Payment Center</a></li>
                                    <li><a href="#">News and updates</a></li>
                                </ul>
                            </div>

                        </div>
                        <div class="col-md-4">
                            <div class="footer-pad">
                                <h4>Heading1</h4>
                                <ul class="list-unstyled">
                                    <li><a href="#"></a></li>
                                    <li><a href="#">Website</a></li>
                                    <li><a href="#">Disclaimer</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <h4>Follow Us</h4>
                            <ul class="social-network social-circle">
                                <li><a href="#" title="Facebook"><i class="fa-brands fa-facebook" style="font-family: 'Font Awesome 5 Brands' !important;"> Facebook</i></a></li>
                                <li><a href="#" title="Instagram"><i class="fa-brands fa-instagram" style="font-family: 'Font Awesome 5 Brands' !important;"> Instagram</i></a></li>
                            </ul>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-md-12 fa-copyright border-dark">
                            <p class="text-center">&copy; Copyright 2024 - Archisman's Library. All rights reserved.</p>
                        </div>
                    </div>
                </div>
            </div>


        </div>
    </form>
</body>
</html>
