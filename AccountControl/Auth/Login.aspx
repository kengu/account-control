<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AccountControl.Login" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <div style="text-align: center; padding: 40px; width: 100%;">
        <div style=="width: 300px;">
            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Personnummer</asp:Label>
            <asp:TextBox ID="UserName" runat="server"/>
            <asp:Button ID="LoginButton" runat="server" OnClick="LoginButton_Authenticate" Text="Autentiser" />
        </div>
    </div>
</asp:Content>