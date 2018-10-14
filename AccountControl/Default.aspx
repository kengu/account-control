<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AccountControl._Default" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/json2html/1.2.0/json2html.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.json2html/1.2.0/jquery.json2html.min.js"></script>
    <script language="javascript">
        function AjaxRequest(uri, list, transform, element) {
            var url = `<%:AccountControl.AppSettings.GetAltinnApiUri("")%>${uri}`;
            $.ajax({
                url: url,
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
                $(element).json2html(data._embedded[list], transform);
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
                <code style="font-size: 7pt; font-family: monospace; display: block; white-space: pre-wrap">
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
            <p><a class="btn btn-default" href="#" onclick="AjaxRequest('my/messages', 'messages', {'<>':'span','html':'${MessageId} ${Subject} ${Type}'},'mymessageslist')">Get meesages</a></p>
            <ul id="mymessageslist"></ul>
        </div>
        <div class="col-md-4">
            <h2>Get reportees</h2>
            <p>
                Authorized reportees are fetched with:
            </p>
            <p>
                <code style="font-size: 7pt; font-family: monospace; display: block; white-space: pre-wrap">
    $.ajax({
        url: "<%: AccountControl.AppSettings.GetAltinnApiUri("reportees") %>",
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
            <p><a class="btn btn-default" href="#" onclick="AjaxRequest('reportees', 'reportees', {'<>':'span','html':'${ReporteeId} ${Name} ${Type}'},'reporteeslist')">Get reportees</a></p>
            <ul id="reporteeslist"></ul>        
        </div>
        <div class="col-md-4">
            <h2>Get reportee messages</h2>
            <p>
                Messages for authorized reportee are fetched with:
            </p>
            <p>
                <code style="font-size: 7pt; font-family: monospace; display: block; white-space: pre-wrap">
    $.ajax({
        url: "<%: AccountControl.AppSettings.GetAltinnApiUri("{reporteeID}/messages") %>",
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
            <p>
                <a class="btn btn-default" href="#" onclick="let id=$('#reporteeid').val();AjaxRequest(`${id}/messages`, 'reportees', {'<>':'span','html':'${ReporteeId} ${Name} ${Type}'},'reporteemessagelist')">Get reportees</a>
                <label>Reportee ID: <input type="text" id="reporteeid" style="width: 120px;"/></label>
            </p>
            <ul id="reporteemessagelist"></ul>        
        </div>
        
    </div>

</asp:Content>
