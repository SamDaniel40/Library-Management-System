<%@ Page Title="Fine Payment" Language="C#" MasterPageFile="~/UserScreen/User.Master" AutoEventWireup="true" CodeFile="uPayment.aspx.cs" Inherits="UserScreen_uPayment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../datatable/js/jquery.dataTables.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2>Fine Payment Details</h2>
                <hr />
                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server"></asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>

