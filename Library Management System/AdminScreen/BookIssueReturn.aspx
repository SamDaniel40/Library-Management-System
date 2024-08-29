<%@ Page Title="Book Issue Return" Language="C#" MasterPageFile="~/AdminScreen/Admin.Master" AutoEventWireup="true" CodeFile="BookIssueReturn.aspx.cs" Inherits="AdminScreen_BookIssueReturn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../DataTable/js/jquery.dataTables.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid">
        <br />
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Book Issuing</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="../Imgs/Book.PNG" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Member ID</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Enter Valid Member ID" ControlToValidate="txtMemID" Display="Dynamic" ForeColor="Red" ValidationGroup="search"></asp:RequiredFieldValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Enter Valid Member ID" ControlToValidate="txtMemID" Display="Dynamic" ForeColor="Red" ValidationGroup="issue"></asp:RequiredFieldValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*Enter Valid Member ID" ControlToValidate="txtMemID" Display="Dynamic" ForeColor="Red" ValidationGroup="return"></asp:RequiredFieldValidator>
                                <div class="form-group">
                                    <asp:TextBox ID="txtMemID" CssClass="form-control" runat="server" placeholder="Member ID"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Book ID</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Enter Valid Book ID" ControlToValidate="txtBookID" Display="Dynamic" ForeColor="Red" ValidationGroup="search"></asp:RequiredFieldValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*Enter Valid Book ID" ControlToValidate="txtBookID" Display="Dynamic" ForeColor="Red" ValidationGroup="issue"></asp:RequiredFieldValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*Enter Valid Book ID" ControlToValidate="txtBookID" Display="Dynamic" ForeColor="Red" ValidationGroup="return"></asp:RequiredFieldValidator>
                                <div class="input-group">
                                    <asp:TextBox ID="txtBookID" class="form-control" runat="server" placeholder="Book ID"></asp:TextBox>
                                    <asp:Button ID="btnSearch" for="txtBookID" class="btn btn-dark" runat="server" Text="Search" OnClick="btnSearch_Click" ValidationGroup="search" />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Member Name</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*Enter Member Name" ControlToValidate="txtMemName" Display="Dynamic" ForeColor="Red" ValidationGroup="issue"></asp:RequiredFieldValidator>
                                <div class="form-group">
                                    <asp:TextBox ID="txtMemName" CssClass="form-control" runat="server" placeholder="Member Name" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Book Name</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*Enter Book Name" ControlToValidate="txtBookName" Display="Dynamic" ForeColor="Red" ValidationGroup="issue"></asp:RequiredFieldValidator>
                                <div class="form-group">
                                    <asp:TextBox ID="txtBookName" CssClass="form-control" runat="server" placeholder="Book Name" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Issue Date</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*Enter Issue Date" ControlToValidate="txtIssueDate" Display="Dynamic" ForeColor="Red" ValidationGroup="issue"></asp:RequiredFieldValidator>
                                <div class="form-group">
                                    <asp:TextBox ID="txtIssueDate" CssClass="form-control" runat="server" TextMode="Date" ></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Due Date</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*Enter Return Date" ControlToValidate="txtDueDate" Display="Dynamic" ForeColor="Red" ValidationGroup="issue"></asp:RequiredFieldValidator>
                                <div class="form-group">
                                    <asp:TextBox ID="txtDueDate" CssClass="form-control" runat="server" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <asp:Button ID="btnIssue" class="btn btn-lg btn-block btn-primary" runat="server" Text="Issue" OnClick="btnIssue_Click"  ValidationGroup="issue" />
                            </div>
                            <div class="col-6">
                                <asp:Button ID="btnReturn" class="btn btn-lg btn-block btn-success" runat="server" Text="Return" OnClick="btnReturn_Click"  ValidationGroup="return" />
                            </div>
                        </div>
                    </div>
                </div>
                <a href="AdminHome.aspx"><< Back to Home </a>
                <br>
                <br>
            </div>

            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Issued Book List</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">

                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered table-sm" ID="GridView1" Font-Size="Small" runat="server" AutoGenerateColumns="False" EmptyDataText="No Record found..." OnRowDataBound="GridView1_RowDataBound">
                                    <Columns>
                                        <asp:BoundField DataField="MemberId" HeaderText="Member ID" SortExpression="MemberId"></asp:BoundField>
                                        <asp:BoundField DataField="MemberName" HeaderText="Member Name" SortExpression="MemberName"></asp:BoundField>
                                        <asp:BoundField DataField="BookId" HeaderText="Book ID" SortExpression="BookId"></asp:BoundField>
                                        <asp:BoundField DataField="BookName" HeaderText="Book Name" SortExpression="BookName"></asp:BoundField>
                                        <asp:BoundField DataField="IssueDate" HeaderText="Issue Date" SortExpression="IssueDate"></asp:BoundField>
                                        <asp:BoundField DataField="DueDate" HeaderText="Due Date" SortExpression="DueDate"></asp:BoundField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

