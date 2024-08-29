<%@ Page Title="View Books" Language="C#" MasterPageFile="~/AdminScreen/Admin.Master" AutoEventWireup="true" CodeFile="ViewBooks.aspx.cs" Inherits="AdminScreen_ViewBooks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../DataTable/js/jquery.dataTables.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<%--    <div class="container-fluid" id="panel1" runat="server" visible="false">

        <div class="px-lg-5">
            <div class="row">
                <br />

                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <div class="col-xl-3 col-lg-4 col-md-6 mb-4 border">
                            <div class="bg-white rounded shadow-sm">

                                <asp:Image ID="Image1" runat="server" class="img-fluid card-img-top" ImageUrl='<%# Eval("BookImg") %>' Height="150" Width="120" />
                                <div class="p-4">
                                    <h5><a href="#" class="text-dark"><%# Eval("BookName") %></a></h5>
                                    <p class="small text-muted mb-0"><%# Eval("BookDescription") %></p>
                                    <p class="small mb-0"><i class="fa fa-picture-o mr-2"></i><span class="font-weight-bold"><%# Eval("Genre") %></span></p>

                                    Author:<p class="small mb-0"><i class="fa fa-picture-o mr-2"></i><span class="font-weight-bold"><b><%# Eval("AuthorName") %></b></span></p>

                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
    <br />
    <br />
    <hr />--%>
    <div class="container mt-3">
        <div class="row">
            <div class="col-md-12">
                <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered" AutoGenerateColumns="false" DataKeyNames="BookId" runat="server">
                    <Columns>
                        <asp:BoundField DataField="BookId" HeaderText="ID" ReadOnly="true" SortExpression="BookId" />
                        <asp:TemplateField HeaderText="Book" SortExpression="BookName">
                            <ItemTemplate>
                                <div class="container-fluid">
                                    <div class="row">
                                        <div class="col-lg-9">
                                            <div class="row">
                                                <div class="col-12">
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("BookName") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-12">
                                                    Author - </span>
                                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("AuthorName") %>'></asp:Label>
                                                    &nbsp;| Genre - 
                                                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("Genre") %>'></asp:Label>
                                                    &nbsp;| Language - 
                                                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%# Eval("Language") %>'></asp:Label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-12">
                                                    Publisher -
                                                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Text='<%# Eval("PublisherName") %>'></asp:Label>
                                                    &nbsp;| Publish Date -
                                                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Text='<%# Eval("PublishDate") %>'></asp:Label>
                                                    &nbsp;| Pages -
                                                    <asp:Label ID="Label7" runat="server" Font-Bold="True" Text='<%# Eval("NoOfPages") %>'></asp:Label>
                                                    &nbsp;| Edition -
                                                    <asp:Label ID="Label8" runat="server" Font-Bold="True" Text='<%# Eval("Edition") %>'></asp:Label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-12">
                                                    Cost -
                                                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Text='<%# Eval("BookCost") %>'></asp:Label>
                                                    &nbsp;| Actual Stock -
                                                    <asp:Label ID="Label10" runat="server" Font-Bold="True" Text='<%# Eval("ActualStock") %>'></asp:Label>
                                                    &nbsp;| Available Stock -
                                                    <asp:Label ID="Label11" runat="server" Font-Bold="True" Text='<%# Eval("CurrentStock") %>'></asp:Label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-12">
                                                    Description -
                                                    <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Smaller" Text='<%# Eval("BookDescription") %>'></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <asp:Image class="img-fluid" ID="Image1" runat="server" ImageUrl='<%# Eval("BookImg") %>' />
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>

                </asp:GridView>
            </div>
        </div>
    </div>
    <br />
</asp:Content>

