<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Callback.aspx.cs" Inherits="AccountControl.Auth.Callback" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <asp:PlaceHolder runat="server" ID="cMessagePanel">
        <div style="clear:both; padding: 10px;" align="center" >
            <div class="alert info"><asp:Literal runat="server" id="cMessage"></asp:Literal></div>
        </div>
    </asp:PlaceHolder>
</body>
</html>
