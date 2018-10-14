<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AccountControl._Default" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">    

    <script language="javascript">
        function GetMessages() {
            $.ajax({
                url: "<%: AccountControl.AppSettings.GetAltinnApiUri("my/messages") %>",
                method: "GET",
                crossDomain: true,
                headers: {
                    "X-Requested-With": "XMLHttpRequest",
                    "ApiKey": "<%: AccountControl.AppSettings.GetApiKey() %>",
                    "Access-Control-Allow-Origin": "<%: AccountControl.AppSettings.GetOrigin() %>",
                    "Accept": "application/hal+json",
                    "Content-Type": "application/hal+json"
                },
                xhrFields: {
                    withCredentials: true
                }
            })
            .done(function (data) {
                console.log(data);
            });
        }


    </script>


    <div class="jumbotron">
        <h1>Dashboard</h1>
        <asp:PlaceHolder runat="server" ID="cMessagePanel">
            <p class="lead"><asp:Literal runat="server" id="cMessage"></asp:Literal></p>
        </asp:PlaceHolder>
        <p><a href="https://altinn.github.io/docs/guides/integrasjon/sluttbrukere/" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Get my messages</h2>
            <p>
                Messages in <a href="https://altinn.github.io/docs/guides/integrasjon/sluttbrukere/api/meldinger/">MessageBox</a> are fetched with:
            </p>
            <p>
                <code style="font-size: 8pt; font-family: monospace; display: block; white-space: pre-wrap">
    $.ajax({
        url: "<%: AccountControl.AppSettings.GetAltinnApiUri("my/messages") %>",
        method: "GET",
        crossDomain: true,
        headers: {
            "X-Requested-With": "XMLHttpRequest",
            "ApiKey": "<%: AccountControl.AppSettings.GetApiKey() %>",
            "Access-Control-Allow-Origin": "<%: AccountControl.AppSettings.GetOrigin() %>",
            "Accept": "application/hal+json",
            "Content-Type": "application/hal+json"
        },
        xhrFields: {
            withCredentials: true
        }})
        .done(function(data) {
            console.log(data);
        })
                </code>
            </p>            
            <p><a class="btn btn-default" href="#" onclick="GetMessages()">Get meesages</a></p>
        </div>
        <div class="col-md-4">
            <h2>Get more libraries</h2>
            <p>
                NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Web Hosting</h2>
            <p>
                You can easily find a web hosting company that offers the right mix of features and price for your applications.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
