<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width-device, initial-scale=1" />
    <link rel="shortcut icon" href="../LogoImg/logo.png"/>
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
                    <img src="../LogoImg/logo.png" alt="logo" width="50" height="50" />
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
                    <a id="signup" class="btn btn-sm btn-primary" href="SignUp.aspx">Sign Up</a>
                    <%--<a class="btn btn-sm btn-primary" href="Login.aspx">Sign In</a>--%>
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
                            <h2>Login Panel</h2>
                            <br />
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#home">User Login</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#menu1">Admin Login</a>
                                </li>
                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div id="home" class="container tab-pane active">
                                    <br/>
                                    <h3>User Login</h3>
                                    <p></p>
                                    <!---design login form--->
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-md-6 mx-auto">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <div class="row">
                                                            <div class="col">
                                                                <center>
                                                                    <img width="150" src="../LogoImg/user.png" />
                                                                </center>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col">
                                                                <center>
                                                                    <h3>Member/User Login</h3>
                                                                </center>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col">
                                                                <hr/>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col">
                                                                <label>Member ID</label>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="memlogin" ErrorMessage="*Enter Member ID*" Font-Bold="true" Font-Size="10" ForeColor="Red" ControlToValidate="txtMemberID" Display="Dynamic"></asp:RequiredFieldValidator>
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="txtMemberID" CssClass="form-control" placeholder="Member ID"  runat="server"></asp:TextBox>
                                                                </div>

                                                                <label>Password</label>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="memlogin" ErrorMessage="*Enter Member Password*" Font-Bold="true" Font-Size="10" ForeColor="Red" ControlToValidate="txtPassword" Display="Dynamic"></asp:RequiredFieldValidator>
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="txtPassword" CssClass="form-control" placeholder="Password" TextMode="Password"  runat="server"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <asp:Button ID="btnLogin" CssClass="btn btn-success btn-lg btn-block" runat="server" ValidationGroup="memlogin" Text="Login" OnClick="btnLogin_Click" />
                                                                </div>
                                                                <div class="form-group">
                                                                    <a href="SignUp.aspx"><input type="button" class="btn btn-info btn-lg btn-block" value="Sign Up" /> </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <a href="../default.aspx"><< Back to Home screen</a>
                                            </div>

                                        </div>
                                    </div>

                                    <!----design end--->

                                </div>
                                <div id="menu1" class="container tab-pane fade">
                                    <br/>
                                    <h3>Admin Login</h3>
                                    <p></p>
                                    <!---Admin design login form--->
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-md-6 mx-auto">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <div class="row">
                                                            <div class="col">
                                                                <center>
                                                                    <img width="150" src="../LogoImg/admin.png" />
                                                                </center>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col">
                                                                <center>
                                                                    <h3>Admin Login</h3>
                                                                </center>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col">
                                                                <hr/>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col">
                                                                <label>Admin ID</label>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Enter Admin ID*" Font-Bold="true" Font-Size="10" ForeColor="Red" ControlToValidate="txtAdmminID" Display="Dynamic"></asp:RequiredFieldValidator>
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="txtAdminID" CssClass="form-control" placeholder="Admin ID"  runat="server"></asp:TextBox>
                                                                </div>
                                                                <label>Password</label>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Enter Admin Password*" Font-Bold="true" Font-Size="10" ForeColor="Red" ControlToValidate="txtAdminPass" Display="Dynamic"></asp:RequiredFieldValidator>
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="txtAdminPass" CssClass="form-control" placeholder="Password" TextMode="Password"  runat="server"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <asp:Button ID="btnAdminLogin" CssClass="btn btn-success btn-lg btn-block" runat="server" Text="Admin Login" OnClick="btnAdminLogin_Click" />
                                                                </div>
                                                                <%--<div class="form-group">
                                                                    <a href="../default.aspx"><input type="button" class="btn btn-info btn-lg btn-block" value="Sign Up" /> </a>
                                                                </div>--%>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <a href="#"><< Back to Home screen</a>
                                            </div>

                                        </div>
                                    </div>

                                    <!----Admin design end--->
                                </div>

                            </div>
                        </div>

                        <!---ENd login screen--->
                    </div>
                </div>
            </div>

            <br />
            <div class="jumbotron text-center alert alert-danger" style="margin-bottom: 0; border:2px solid red">
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
                                <li><a href="#" title="Facebook" ><i class="fa-brands fa-facebook" style="font-family: 'Font Awesome 5 Brands' !important;"> Facebook</i></a></li>
                                <li><a href="#" title="Instagram" ><i class="fa-brands fa-instagram" style="font-family: 'Font Awesome 5 Brands' !important;"> Instagram</i></a></li>
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
