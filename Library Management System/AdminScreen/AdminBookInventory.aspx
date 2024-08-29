<%@ Page Title="Book Inventory" Language="C#" MasterPageFile="~/AdminScreen/Admin.Master" AutoEventWireup="true" CodeFile="AdminBookInventory.aspx.cs" Inherits="AdminScreen_AdminBookInventory" %>

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
            <div class="col-md-5 font-weight-normal">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h6>Book Details</h6>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <asp:Image ID="ImgPhoto" ImageUrl="../Imgs/default.png" runat="server" Height="100" Width="100" alt="" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <hr />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col pb-3">
                                <asp:FileUpload ID="FileUpload1" runat="server" class="form-control"/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label>Book ID</label>
                                <asp:RequiredFieldValidator ID="rfvBookID" runat="server" ValidationGroup="addupdate" Font-Bold="true" Font-Size="10" ControlToValidate="txtBookID" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ErrorMessage="*Please Enter Book ID*"></asp:RequiredFieldValidator>
                                <asp:RequiredFieldValidator ID="rfvBookID1" runat="server" ValidationGroup="delete" Font-Bold="true" Font-Size="10" ControlToValidate="txtBookID" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ErrorMessage="*Please Enter Book ID*"></asp:RequiredFieldValidator>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox ID="txtBookID" CssClass="form-control" runat="server" placeholder="ID"></asp:TextBox>
                                        <asp:Button ID="btnGo" runat="server" Text="GO" CssClass="form-control btn btn-primary" OnClick="btnGo_Click" />
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-8">
                                <label>Book Name</label>
                                <asp:RequiredFieldValidator ID="rfvtxtBookName" runat="server" ValidationGroup="addupdate" Font-Bold="true" Font-Size="10" ControlToValidate="txtBookName" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ErrorMessage="*Please Enter Book Name*"></asp:RequiredFieldValidator>
                                <div class="form-group">
                                    <asp:TextBox ID="txtBookName" CssClass="form-control" runat="server" placeholder="Book Name"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label>Language</label>
                                <%--<asp:RequiredFieldValidator ID="rfvLanguage" runat="server" InitialValue="0" ValidationGroup="addupdate" Font-Bold="true" Font-Size="10" ControlToValidate="ddlLanguage" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ErrorMessage="*Please Select Language*"></asp:RequiredFieldValidator>--%>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="ddlLanguage" runat="server">
                                        <%--<asp:ListItem Text="--Select--" Value="0" />--%>
                                        <asp:ListItem Text="English" Value="English" />
                                        <asp:ListItem Text="Hindi" Value="Hindi" />
                                        <asp:ListItem Text="Marathi" Value="Marathi" />
                                        <asp:ListItem Text="French" Value="French" />
                                        <asp:ListItem Text="German" Value="German" />
                                        <asp:ListItem Text="Urdu" Value="Urdu" />
                                    </asp:DropDownList>
                                </div>

                                <label>Publisher Name</label>
                                <asp:RequiredFieldValidator ID="rfvPublisher" runat="server" InitialValue="0" ValidationGroup="addupdate" Font-Bold="true" Font-Size="10" ControlToValidate="ddlPublisherName" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ErrorMessage="*Please Select Publisher Name*"></asp:RequiredFieldValidator>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="ddlPublisherName" runat="server">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Author Name</label>
                                <asp:RequiredFieldValidator ID="rfvAuthor" runat="server" InitialValue="0" ValidationGroup="addupdate" Font-Bold="true" Font-Size="10" ControlToValidate="ddlAuthor" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ErrorMessage="*Please Select Author Name*"></asp:RequiredFieldValidator>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="ddlAuthor" runat="server">
                                    </asp:DropDownList>
                                </div>
                                <label>Publish Date</label>
                                <asp:RequiredFieldValidator ID="rfvPublishDate" runat="server" ValidationGroup="addupdate" Font-Bold="true" Font-Size="10" ControlToValidate="txtPublishDate" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ErrorMessage="*Please Enter Publish Date*"></asp:RequiredFieldValidator>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtPublishDate" runat="server" placeholder="Date" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Genre</label>
                                <asp:RequiredFieldValidator ID="rfvGenre" runat="server" ValidationGroup="addupdate" Font-Bold="true" Font-Size="10" ControlToValidate="ListBoxGenre" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ErrorMessage="*Please Select Genre*"></asp:RequiredFieldValidator>
                                <div class="form-group">
                                    <asp:ListBox CssClass="form-control" ID="ListBoxGenre" runat="server" SelectionMode="Multiple" Rows="5">
                                        <asp:ListItem Text="Action" Value="Action" />
                                        <asp:ListItem Text="Adventure" Value="Adventure" />
                                        <asp:ListItem Text="Comic Book" Value="Comic Book" />
                                        <asp:ListItem Text="Self Help" Value="Self Help" />
                                        <asp:ListItem Text="Motivation" Value="Motivation" />
                                        <asp:ListItem Text="Healthy Living" Value="Healthy Living" />
                                        <asp:ListItem Text="Wellness" Value="Wellness" />
                                        <asp:ListItem Text="Crime" Value="Crime" />
                                        <asp:ListItem Text="Drama" Value="Drama" />
                                        <asp:ListItem Text="Fantasy" Value="Fantasy" />
                                        <asp:ListItem Text="Horror" Value="Horror" />
                                        <asp:ListItem Text="Poetry" Value="Poetry" />
                                        <asp:ListItem Text="Personal Development" Value="Personal Development" />
                                        <asp:ListItem Text="Romance" Value="Romance" />
                                        <asp:ListItem Text="Science Fiction" Value="Science Fiction" />
                                        <asp:ListItem Text="Suspense" Value="Suspense" />
                                        <asp:ListItem Text="Thriller" Value="Thriller" />
                                        <asp:ListItem Text="Art" Value="Art" />
                                        <asp:ListItem Text="Autobiography" Value="Autobiography" />
                                        <asp:ListItem Text="Encyclopedia" Value="Encyclopedia" />
                                        <asp:ListItem Text="Health" Value="Health" />
                                        <asp:ListItem Text="History" Value="History" />
                                        <asp:ListItem Text="Math" Value="Math" />
                                        <asp:ListItem Text="Textbook" Value="Textbook" />
                                        <asp:ListItem Text="Science" Value="Science" />
                                        <asp:ListItem Text="Travel" Value="Travel" />
                                        <asp:ListItem Text="Programming" Value="Programming" />
                                        <asp:ListItem Text="Computer Science" Value="Computer Science" />
                                    </asp:ListBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-3">
                                <label>Edition</label>
                                <asp:RequiredFieldValidator ID="rfvEdition" runat="server" ValidationGroup="addupdate" Font-Bold="true" Font-Size="10" ControlToValidate="txtEdition" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ErrorMessage="*Please Enter Editon*"></asp:RequiredFieldValidator>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtEdition" runat="server" placeholder="Edition"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <label>Book Cost(per unit)</label>
                                <asp:RequiredFieldValidator ID="rfvBookCost" runat="server" ValidationGroup="addupdate" Font-Bold="true" Font-Size="10" ControlToValidate="txtbookCost" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ErrorMessage="*Please Enter Book Cost*"></asp:RequiredFieldValidator>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtbookCost" runat="server" placeholder="Book Cost(per unit)" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Pages</label>
                                <asp:RequiredFieldValidator ID="rfvPages" runat="server" ValidationGroup="addupdate" Font-Bold="true" Font-Size="10" ControlToValidate="txtPages" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ErrorMessage="*Please Enter No of Pages*"></asp:RequiredFieldValidator>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtPages" runat="server" placeholder="Pages" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <asp:ScriptManager runat="server"></asp:ScriptManager>
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <div class="row">
                                    <div class="col-md-4">
                                        <label>Actual Stock</label>
                                        <asp:RequiredFieldValidator ID="rfvAStock" runat="server" ValidationGroup="addupdate" Font-Bold="true" Font-Size="10" ControlToValidate="txtActualStock" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ErrorMessage="*Please Enter Actual Stock*"></asp:RequiredFieldValidator>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="txtActualStock" runat="server" placeholder="Actual Stock" TextMode="Number" OnTextChanged="txtActualStock_TextChanged" AutoPostBack="true"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label>Current Stock</label>
                                        <asp:RequiredFieldValidator ID="rfvCStock" runat="server" ValidationGroup="addupdate" Font-Bold="true" Font-Size="10" ControlToValidate="txtCurrentStock" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ErrorMessage="*Please Enter Current Stock*"></asp:RequiredFieldValidator>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="txtCurrentStock" runat="server" placeholder="Current Stock" TextMode="Number" Enabled="false"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label>Issued Books</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="txtIssuedBooks" runat="server" placeholder="Issued Books" TextMode="Number" Text="0" Enabled="false"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>

                        <div class="row">
                            <div class="col-12">
                                <label>Book Description</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtBookDesc" runat="server" placeholder="Book Description" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row pt-2">
                            <div class="col-4">
                                <asp:Button ID="btnAdd" class="btn btn-md btn-block btn-success" runat="server" ValidationGroup="addupdate" Text="Add" OnClick="btnAdd_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="btnUpdate" class="btn btn-md btn-block btn-warning" runat="server" ValidationGroup="addupdate" Text="Update" OnClick="btnUpdate_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="btnDelete" class="btn btn-md btn-block btn-danger" runat="server" ValidationGroup="delete" Text="Delete" OnClick="btnDelete_Click" />
                            </div>
                        </div>

                    </div>

                </div>
                <a href="AdminHome.aspx"><< Back to Home</a>
                <br />
                <br />
            </div>



            <div class="col-md-7">

                <div class="card">

                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Book Inventory List</h4>
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
                                <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered" AutoGenerateColumns="false" DataKeyNames="BookId" runat="server">

                                    <Columns>
                                        <asp:BoundField DataField="BookId" HeaderText="ID" ReadOnly="true" SortExpression="BookId" />

                                        <asp:TemplateField HeaderText="BookName" SortExpression="BookName">
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
                                                                    Author - 
                                                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("AuthorName") %>'></asp:Label>
                                                                    &nbsp;| Publisher -
                                                                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Text='<%# Eval("PublisherName") %>'></asp:Label>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-12">
                                                                    Genre - 
                                                                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("Genre") %>'></asp:Label>
                                                                    &nbsp;| Language - 
                                                                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%# Eval("Language") %>'></asp:Label>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-12">
                                                                    Publish Date -
                                                                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Text='<%# Eval("PublishDate") %>'></asp:Label>
                                                                    &nbsp;| Pages -
                                                                    <asp:Label ID="Label7" runat="server" Font-Bold="True" Text='<%# Eval("NoOfPages") %>'></asp:Label>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-12">
                                                                    Edition -
                                                                    <asp:Label ID="Label15" runat="server" Font-Bold="True" Text='<%# Eval("Edition") %>'></asp:Label>
                                                                    &nbsp;| Cost -
                                                                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Text='<%# Eval("BookCost") %>'></asp:Label>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-12">
                                                                    Actual Stock -
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

                </div>

            </div>

        </div>
    </div>
</asp:Content>
