<%@ Page Title="Member Update" Language="C#" MasterPageFile="~/AdminScreen/Admin.Master" AutoEventWireup="true" CodeFile="UpdateMemberDetails.aspx.cs" Inherits="AdminScreen_UpdateMemberDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../DataTable/js/jquery.dataTables.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead class='bg-primary'></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid">
        <br />
        <div class="row border pt-3">
            <div class="col-4">
                <label>Member ID </label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Enter Member ID*" ControlToValidate="txtMemberID" Font-Bold="true" Font-Size="10" ForeColor="Red" ValidationGroup="btnsearch"></asp:RequiredFieldValidator>
                <div class="form-group">
                    <asp:TextBox ID="txtMemberID" CssClass="form-control" placeholder="Member ID" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="col-8 pt-4">
                <div class="form-group">
                    <asp:Button ID="btnSearchMember" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="btnSearchMember_Click" ValidationGroup="btnsearch" />
                    <asp:Button ID="BtnActiveMember" CssClass="btn btn-success" runat="server" Text="Active" OnClick="BtnActiveMember_Click" ValidationGroup="btnsearch" />
                    <asp:Button ID="btnPendingMember" CssClass="btn btn-info" ForeColor="Black" BackColor="Yellow" runat="server" Text="Pending" OnClick="btnPendingMember_Click" ValidationGroup="btnsearch" />
                    <asp:Button ID="btnDeActiveMember" CssClass="btn btn-danger" runat="server" Text="DeActive" ValidationGroup="btnsearch" OnClick="btnDeActiveMember_Click" />
                </div>
            </div>
            <div class="col-6 pt-3">
                    <label>Full Name </label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*Enter Name*" Font-Bold="true" Font-Size="10" ForeColor="Red" ControlToValidate="txtName" ValidationGroup="updatebtn" Display="Dynamic"></asp:RequiredFieldValidator>
                <div class="form-group">
                    <asp:TextBox ID="txtName" CssClass="form-control" placeholder="Full Name" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="col-3 pt-3">
                    <label>Date of Birth </label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*Enter DOB*" Font-Bold="true" Font-Size="10" ForeColor="Red" ControlToValidate="txtDOB" ValidationGroup="updatebtn" Display="Dynamic"></asp:RequiredFieldValidator>
                <div class="form-group">
                    <asp:TextBox ID="txtDOB" CssClass="form-control" placeholder="DOB" TextMode="Date" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="col-3 pt-3">
                <label>Contact No </label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*Enter Contact No*" Font-Bold="true" Font-Size="10" ForeColor="Red" ControlToValidate="txtContactNo" ValidationGroup="updatebtn" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationExpression="[0-9]{10}" ErrorMessage="*Not a Valid Contact No.*" ControlToValidate="txtContactNo" ValidationGroup="updatebtn" Display="Dynamic"></asp:RegularExpressionValidator>
                <div class="form-group">
                    <asp:TextBox ID="txtContactNo" CssClass="form-control" placeholder="Contact No." runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="col-4 pt-3">
                    <label>Email ID </label>
                <div class="form-group">
                    <asp:TextBox ID="txtEmail" CssClass="form-control" placeholder="Email" TextMode="Email" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="col-3 pt-3">
                <label>State </label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Select State*" Font-Bold="true" Font-Size="10" ForeColor="Red" ControlToValidate="ddlState" ValidationGroup="updatebtn" InitialValue="Select"></asp:RequiredFieldValidator>
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
            </div>
            <div class="col-2 pt-3">
                <label>City </label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*Enter City*" Font-Bold="true" Font-Size="10" ForeColor="Red" ControlToValidate="txtCity" ValidationGroup="updatebtn" Display="Dynamic"></asp:RequiredFieldValidator>
                <div class="form-group">
                    <asp:TextBox ID="txtCity" CssClass="form-control" placeholder="City" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="col-3 pt-3">
                <label>Pincode </label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Enter PinCode*" Font-Bold="true" Font-Size="10" ForeColor="Red" ControlToValidate="txtPIN" ValidationGroup="updatebtn" Display="Dynamic"></asp:RequiredFieldValidator>
                <div class="form-group">
                    <asp:TextBox ID="txtPIN" CssClass="form-control" placeholder="PIN CODE" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="col-12 pt-3">
                <label>Full Address </label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*Enter Your Address*" Font-Bold="true" Font-Size="10" ForeColor="Red" ControlToValidate="txtAddress" ValidationGroup="updatebtn" Display="Dynamic"></asp:RequiredFieldValidator>
                <div class="form-group">
                    <asp:TextBox ID="txtAddress" CssClass="form-control" placeholder="Address" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="col-lg-6 px-lg-4">
                <div class="form-group mb-4">
                    <asp:Button ID="btnUpdate" CssClass="btn btn-info" runat="server" Text="Update" Height="40px" Width="120px" ValidationGroup="updatebtn" Visible="false" OnClick="btnUpdate_Click" />
                    <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" Height="40px" Width="120px" Visible="false" OnClick="btnCancel_Click" />
                </div>
            </div>
        </div>
        <br />
        <div class="row border">
            <div class="table-responsive p-3">
                <h4>Member List :-</h4>
                <hr />
                <asp:Repeater ID="rptMember" runat="server" OnItemCommand="rptMember_ItemCommand" OnItemDataBound="rptMember_ItemDataBound">
                    <HeaderTemplate>
                        <table class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th><span>Member ID</span> </th>
                                    <th><span>Member Name</span> </th>
                                    <th><span>DOB</span> </th>
                                    <th><span>Contact No</span> </th>
                                    <th><span>Email</span> </th>
                                    <th><span>State</span> </th>
                                    <th><span>City</span> </th>
                                    <th><span>PinCode</span> </th>
                                    <th><span>Address</span> </th>
                                    <th><span>Status</span> </th>
                                    <th>&nbsp;</th>
                                </tr>
                            </thead>
                            <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%#Eval("MemberId") %> </td>
                            <td><%#Eval("Name") %> </td>
                            <td><%#Eval("DOB") %> </td>
                            <td><%#Eval("ContactNo") %> </td>
                            <td><%#Eval("Email") %> </td>
                            <td><%#Eval("State") %> </td>
                            <td><%#Eval("City") %> </td>
                            <td><%#Eval("PinCode") %> </td>
                            <td><%#Eval("Address") %> </td>
                            <td><%#Eval("Status") %></td>
                            <td style="width: 10%">
                                <asp:LinkButton ID="lnkEdit" class="table-link text-primary" runat="server" CommandArgument='<%#Eval("MemberId") %>' CommandName="edit" ToolTip="edit record">
                                   <span class="fa-stack">
                                       <i class="fa fa-square  fa-stack-2x"> </i>
                                       <i class="fa fa-pencil fa-stack-1x fa-inverse"></i>
                                   </span>
                                </asp:LinkButton>
                                <asp:LinkButton ID="lnkDelete" class="table-link text-danger" runat="server" CommandArgument='<%#Eval("MemberId") %>' CommandName="delete" Text="Delete" ToolTip="Delete record" OnClientClick="return confirm('Do you want to delete this row?');">
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
        <br />

        <%--<div class="row">
        <h4>Members List</h4>
        <div class="table-responsive">
            <asp:GridView ID="GridView1" class="table table-striped table-bordered" runat="server" AutoGenerateColumns="true" OnDataBound="GridView1_DataBound"> AllowPaging="true" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting" PageSize="5" Font-Size="8" OnRowDataBound="GridView1_RowDataBound"
                <HeaderStyle BackColor="#0066FF" Font-Bold="true" ForeColor="White" />
                <FooterStyle BackColor="#3366CC" />
                <Columns>

                    <asp:TemplateField HeaderText="ID">
                        <ItemTemplate>
                            <asp:Label ID="lblDisplayID" runat="server" Text='<%# Eval("MemberId")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <asp:Label ID="lblDisplayName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditName" CssClass="" Text='<%# Eval("Name") %>' runat="server"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="DOB">
                        <ItemTemplate>
                            <asp:Label ID="lblDisplaydob" runat="server" Text='<%# Eval("DOB") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditdob" CssClass="" Text='<%# Eval("DOB") %>' TextMode="Date" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Contact">
                        <ItemTemplate>
                            <asp:Label ID="lblDisplayContact" runat="server" Text='<%# Eval("ContactNo") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditContact" CssClass="" Text='<%# Eval("ContactNo") %>' runat="server"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Email">
                        <ItemTemplate>
                            <asp:Label ID="lblDisplayEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditEmail" CssClass="" Text='<%# Eval("Email") %>' runat="server"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="State">
                        <ItemTemplate>
                            <asp:Label ID="lblDisplayState" runat="server" Text='<%# Eval("State") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Label ID="lblEditState" runat="server" Text='<%# Eval("State") %>' Visible="false"></asp:Label>
                            <asp:DropDownList ID="ddlEditState" CssClass="" runat="server">
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
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="City">
                        <ItemTemplate>
                            <asp:Label ID="lblDisplaycity" runat="server" Text='<%# Eval("City") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditcity" CssClass="" Text='<%# Eval("City") %>' runat="server"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Pincode">
                        <ItemTemplate>
                            <asp:Label ID="lblDisplaypincode" runat="server" Text='<%# Eval("PinCode") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditpincode" CssClass="" Text='<%# Eval("PinCode") %>' runat="server"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Address">
                        <ItemTemplate>
                            <asp:Label ID="lblDisplayAddress" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditAddress" CssClass="" Text='<%# Eval("Address") %>' runat="server"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <asp:Label ID="lblDisplayStatus" runat="server" Text='<%# Eval("Status") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField

                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkEdit" class="table-link text-primary" runat="server" ToolTip="edit record" CommandName="Edit">
                                   <span class="fa-stack">
                                       <i class="fa fa-square  fa-stack-2x"> </i>
                                       <i class="fa fa-pencil fa-stack-1x fa-inverse"></i>
                                   </span>
                            </asp:LinkButton>
                            <asp:LinkButton ID="lnkDelete" class="table-link text-danger" runat="server" Text="Delete" CommandName="Delete" ToolTip="Delete record" OnClientClick="return confirm('Do you want to delete this row?');">
                                   <span class="fa-stack">
                                       <i class="fa fa-square  fa-stack-2x"> </i>
                                       <i class=" fa fa-trash fa-stack-1x fa-inverse"></i>

                                   </span>
                            </asp:LinkButton>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:LinkButton ID="lnkUpdate" class="table-link text-success" runat="server" Text="Update" CommandName="Update" ToolTip="Update record">
                                   <span class="fa-stack">
                                       <i class="fa fa-square  fa-stack-2x"> </i>
                                       <i class="fa fa-spinner fa-stack-1x fa-inverse"></i>
                                   </span>
                            </asp:LinkButton>
                            <asp:LinkButton ID="lnkCancel" class="table-link text-danger" runat="server" Text="Cancel" CommandName="Cancel" ToolTip="Cancel record">
                                   <span class="fa-stack">
                                       <i class="fa fa-square  fa-stack-2x"> </i>
                                       <i class=" fa fa-times-circle fa-stack-1x fa-inverse"></i>

                                   </span>
                            </asp:LinkButton>
                        </EditItemTemplate>
                    </asp:TemplateField>

                </Columns>
                <PagerSettings Mode="NumericFirstLast" PageButtonCount="4" FirstPageText="First" LastPageText="Last" />
            </asp:GridView>
        </div>
    </div>--%>
    </div>
</asp:Content>

