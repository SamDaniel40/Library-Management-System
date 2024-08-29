<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ErrorPage.aspx.cs" Inherits="ErrorPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Error Page</title>
</head>
<body>
    <form id="form1" runat="server">
        <a href="default.aspx">
            <img src="LogoImg/404Page.gif" alt="404 error" /></a>
        <div style="text-align: center; font-size: large; border: solid 2px Blue">
            <asp:Label ID="errorDesp" runat="server" Text="" ForeColor="Red"></asp:Label>
        </div>
    </form>
</body>
</html>
