<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="AccountControl.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Contact information</h3>
    <address>
        Crux Dynamics<br />
        Kenneth Gulbrandsøy<br />
    </address>

    <address>
        <strong>Support:</strong>   <a href="mailto:kenneth.gulbrandsoy@gmail.com">kenneth.gulbrandsoy@gmail.com</a>
    </address>
</asp:Content>
