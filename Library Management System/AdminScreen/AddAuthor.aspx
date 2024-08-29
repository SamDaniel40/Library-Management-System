<%@ Page Title="Author Details" Language="C#" MasterPageFile="~/AdminScreen/Admin.Master" AutoEventWireup="true" CodeFile="AddAuthor.aspx.cs" Inherits="AdminScreen_AddAuthor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../DataTable/js/jquery.dataTables.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead class='alert-info'></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <div class="container border">
        <div class="row">
            <div class="col-lg-10 px-lg-4 mx-auto pt-1">
                <h4 class="text-primary text-uppercase text-center">-: Add Author :-</h4>
                <hr />
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6 px-lg-4">
                <div class="form-group mb-4">
                    <label>Author ID</label>
                    <asp:TextBox ID="txtID" CssClass ="form-control border-0 shadow form-control-lg text-base" placeholder="Author ID" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvAuthorId" runat="server" ControlToValidate="txtID"  Display="Dynamic" ForeColor="#CC0000" SetFocusOnError="True" ErrorMessage="*Please enter Author ID*" ValidationGroup="btn_Add" ></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-lg-6 px-lg-4">
                <div class="form-group mb-4">
                    <label>Author Name</label>
                    <asp:TextBox ID="txtAuthorName" CssClass="form-control border-0 shadow form-control-lg text-base" placeholder="Author Name" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvAuthorName" runat="server" ControlToValidate="txtAuthorName"  Display="Dynamic" ForeColor="#CC0000" SetFocusOnError="True" ErrorMessage="*Please enter Author Name*" ValidationGroup="btn_Add" ></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-lg-6 px-lg-4">
                <div class="form-group mb-4">
                    <asp:Button ID="btnAdd" Text="Submit" CssClass="btn btn-success" Height="40px" Width="120px" runat="server" ValidationGroup="btn_Add" OnClick="btnAdd_Click" />
                    <asp:Button ID="btnUpdate" CssClass="btn btn-info" runat="server" Text="Update" Height="40px" Width="120px" Visible="false" OnClick="btnUpdate_Click" />
                    <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" Height="40px" Width="120px" Visible="false" OnClick="btnCancel_Click" />
                </div>
            </div>
        </div>
    </div>
    <br />

    <div class="container border">
        <div class="row p-3">
            <div class="table-responsive">
                <h4>Author List :-</h4>
                <hr />
                <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                    <HeaderTemplate>
                        <table class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th><span>Author ID</span> </th>
                                    <th><span>Author Name</span> </th>
                                    <th>&nbsp;</th>
                                </tr>
                            </thead>
                            <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                       <tr> 
                           <td><%#Eval("AuthorId") %> </td>
                           <td><%#Eval("AuthorName") %> </td>
                           <td style="width:10%">
                               <asp:LinkButton ID="lnkEdit" class="table-link text-primary" runat="server" CommandArgument='<%#Eval("AuthorId") %>' CommandName="edit" ToolTip="edit record">
                                   <span class="fa-stack">
                                       <i class="fa fa-square  fa-stack-2x"> </i>
                                       <i class="fa fa-pencil fa-stack-1x fa-inverse"></i>

                                   </span>
                               </asp:LinkButton>

                               <asp:LinkButton ID="lnkDelete" class="table-link text-danger" runat="server" CommandArgument='<%#Eval("AuthorId") %>' CommandName="delete" Text="Delete" ToolTip="Delete record" OnClientClick="return confirm('Do you want to delete this row?');">
                                   <span class="fa-stack">
                                       <i class="fa fa-square  fa-stack-2x"> </i>
                                       <i class=" fa fa-trash fa-stack-1x fa-inverse"></i>

                                   </span>
                               </asp:LinkButton>
                           </td>
                       </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </tbody>
                        </table>
                    </FooterTemplate>  
                </asp:Repeater>
            </div>
        </div>
    </div>
    <br />
</asp:Content>

