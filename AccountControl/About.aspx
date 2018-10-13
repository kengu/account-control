<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="AccountControl.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Your application description page.</h3>
    <table>
        <thead>
            <tr><td width="100px"><strong>Setting</strong></td><td><strong>Value</strong></td></tr>
        </thead>
        <tbody>
            <tr><td>UriProd:</td><td><%: ConfigurationManager.AppSettings["UriProd"] %></td></tr>
            <tr><td>UriTest:</td><td><%: ConfigurationManager.AppSettings["UriTest"] %></td></tr>
            <tr><td>Origin:</td><td><%: ConfigurationManager.AppSettings["Origin"] %></td></tr>
            <tr><td>Origins:</td><td><%: ConfigurationManager.AppSettings["Origins"] %></td></tr>
        </tbody>
    </table>
</asp:Content>
