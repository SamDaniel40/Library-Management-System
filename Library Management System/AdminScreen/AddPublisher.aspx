<%@ Page Title="Add Publisher" Language="C#" MasterPageFile="~/AdminScreen/Admin.Master" AutoEventWireup="true" CodeFile="AddPublisher.aspx.cs" Inherits="AdminScreen_AddPublisher" %>

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
                <h4 class="text-primary text-uppercase text-center">-: Add Publisher :-</h4>
                <hr />
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6 px-lg-4">
                <div class="form-group mb-4">
                    <label>Publisher ID</label>
                    <asp:TextBox ID="txtpublisherID" CssClass ="form-control border-0 shadow form-control-lg text-base" placeholder="Publisher ID" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvpublisherID" runat="server" ControlToValidate="txtpublisherID"  Display="Dynamic" ForeColor="#CC0000" SetFocusOnError="True" ErrorMessage="*Please enter Publisher ID*" ValidationGroup="btn_Add" ></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-lg-6 px-lg-4">
                <div class="form-group mb-4">
                    <label>Publisher Name</label>
                    <asp:TextBox ID="txtpublisherName" CssClass="form-control border-0 shadow form-control-lg text-base" placeholder="Publisher Name" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvpublisherName" runat="server" ControlToValidate="txtpublisherName"  Display="Dynamic" ForeColor="#CC0000" SetFocusOnError="True" ErrorMessage="*Please enter Publisher Name*" ValidationGroup="btn_Add" ></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-lg-6 px-lg-4">
                <div class="form-group mb-4">
                    <asp:Button ID="btnAdd" Text="Add" CssClass="btn btn-success" Height="40px" Width="120px" runat="server" ValidationGroup="btn_Add" OnClick="btnAdd_Click" />
                    <asp:Button ID="btnUpdate" CssClass="btn btn-info" runat="server" Text="Update" Height="40px" Width="120px" OnClick="btnUpdate_Click" />
                    <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" Height="40px" Width="120px" OnClick="btnCancel_Click" />
                </div>
            </div>
        </div>
    </div>
    <br />

    <div class="container border">
        <div class="row p-3">
            <div class="table-responsive">
                <h4>Publisher List :-</h4>
                <hr />
                <asp:Repeater ID="rptPublisher" runat="server" OnItemCommand="rptPublisher_ItemCommand">
                    <HeaderTemplate>
                        <table class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th><span>Publisher ID</span> </th>
                                    <th><span>Publisher Name</span> </th>
                                    <th>&nbsp;</th>
                                </tr>
                            </thead>
                            <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                       <tr> 
                           <td><%#Eval("PublisherId") %> </td>
                           <td><%#Eval("PublisherName") %> </td>
                           <td style="width:10%">
                               <asp:LinkButton ID="lnkEdit" class="table-link text-primary" runat="server" CommandArgument='<%#Eval("PublisherId") %>' CommandName="edit" ToolTip="edit record">
                                   <span class="fa-stack">
                                       <i class="fa fa-square  fa-stack-2x"> </i>
                                       <i class="fa fa-pencil fa-stack-1x fa-inverse"></i>

                                   </span>
                               </asp:LinkButton>

                               <asp:LinkButton ID="lnkDelete" class="table-link text-danger" runat="server" CommandArgument='<%#Eval("PublisherId") %>' CommandName="delete" Text="Delete" ToolTip="Delete record" OnClientClick="return confirm('Do you want to delete this row?');">
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

    <%--<div class="container-fluid">
        <div class="row">      
            <div class="col-3 border">
                <div class="row">
                    <div class="col-12">
                        <h4>Add Publisher</h4>
                        <div class="form-group">
                            <asp:TextBox ID="txtpublisherID" CssClass="form-control" placeholder="Publisher ID" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" runat="server" ErrorMessage="enter valid id" ValidationGroup="btn_Save" ControlToValidate="txtpublisherID" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtpublisherName" CssClass="form-control" runat="server" placeholder="Publisher Name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" runat="server" ErrorMessage="enter valid name" Display="Dynamic" ValidationGroup="btn_Save"  ControlToValidate="txtpublisherName"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                        <asp:Button ID="btnAdd" CssClass="btn btn-success" ValidationGroup="btn_Save" runat="server" Text="Add" OnClick="btnAdd_Click" />
                        <asp:Button ID="btnUpdate" CssClass="btn btn-info" runat="server" Text="Update" Visible="false" OnClick="btnUpdate_Click" />
                        <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" Visible="false" OnClick="btnCancel_Click" />
                        </div>
                    </div>
                </div>

            </div>
            <div class="col-9 border">
                <div class="table table-responsive border">
                    <h4>Publisher List:</h4>
                    <asp:Repeater ID="rptPublisher" runat="server" OnItemCommand="rptPublisher_ItemCommand">
                    <HeaderTemplate>
                        <table class="table table-bordered table-hover">
                            <thead class="alert-info">
                                <tr>
                                    <th><span>Publisher ID</span> </th>
                                    <th><span>Publisher Name</span> </th>
                                    <th>&nbsp;</th>
                                </tr>
                            </thead>
                            <tbody>
                      </HeaderTemplate>
                    <ItemTemplate>
                       <tr> 
                           <td><%#Eval("PublisherId") %> </td>
                           <td><%#Eval("PublisherName") %> </td>
                           <td style="width:18%">
                               <asp:LinkButton ID="lnkEdit" class="table-link text-primary" runat="server" CommandArgument='<%#Eval("PublisherId") %>' CommandName="edit" ToolTip="edit record">
                                   <span class="fa-stack">
                                       <i class="fa fa-square  fa-stack-2x"> </i>
                                       <i class="fa fa-pencil fa-stack-1x fa-inverse"></i>

                                   </span>
                               </asp:LinkButton>

                               <asp:LinkButton ID="lnkDelete" class="table-link text-danger" runat="server" CommandArgument='<%#Eval("PublisherId") %>' CommandName="delete" Text="Delete" ToolTip="Delete record" OnClientClick="return confirm('Do you want to delete this row?');">
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
    </div>--%>
</asp:Content>

