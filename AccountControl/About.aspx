<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="AccountControl.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>AccountControl settings</h3>
    <table>
        <thead>
            <tr><td width="100px"><strong>Setting</strong></td><td><strong>Value</strong></td></tr>
        </thead>
        <tbody>
            <tr><td>Env:</td><td><%: AccountControl.AppSettings.GetEnv() %></td></tr>
            <tr><td>UserNID:</td><td><%: AccountControl.AppSettings.GetUserNID() %></td></tr>
            <tr><td>ApiKey:</td><td><%: AccountControl.AppSettings.GetApiKey() %></td></tr>
            <tr><td>AltinnUri:</td><td><%: AccountControl.AppSettings.GetAltinnUri() %></td></tr>
            <tr><td>Origin:</td><td><%: AccountControl.AppSettings.GetOrigin() %></td></tr>
        </tbody>
    </table>
</asp:Content>
