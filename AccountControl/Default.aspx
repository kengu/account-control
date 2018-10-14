<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AccountControl._Default" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/json2html/1.2.0/json2html.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.json2html/1.2.0/jquery.json2html.min.js"></script>
    <script language="javascript">
        function AjaxRequestJson(uri, list, transform, element) {
            let url = `<%:AccountControl.AppSettings.GetAltinnApiUri("")%>${uri}`;
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
                $(element).empty();
                if (!list) {
                    $(element).json2html(data, transform);
                } else if (list == '_links') {
                    $(element).json2html(data._links, transform);
                } else {
                    $(element).json2html(list ? data._embedded[list] : data, transform);
                }
            });
        }

        function AjaxRequestXml(url, element) {
            $.ajax({
                url: url,
                method: "GET",
                crossDomain: true,
                headers: {
                    "X-Requested-With": "XMLHttpRequest",
                    "ApiKey": "<%: AccountControl.AppSettings.GetApiKey() %>",
                    "Access-Control-Allow-Origin": "<%: AccountControl.AppSettings.GetOrigin() %>",
                    "Accept": "application/xml",
                    "Content-Type": "application/xml"
                },
                xhrFields: {
                    withCredentials: true
                }
            })
                .done(function (data) {
                    console.log(data);
                    $(element).empty();
                    $(element).text((new XMLSerializer()).serializeToString(data));
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
        url: `${altinn}/api/my/messages`,
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
            <p><a class="btn btn-default" href="#" onclick="AjaxRequestJson('my/messages', 'messages', {'<>':'li','html':'${MessageId} ${Subject} ${Type}'},'#mymessageslist')">Get meesages</a></p>
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
        url: `${altinn}/api/reportees`,
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
            <p><a class="btn btn-default" href="#" onclick="AjaxRequestJson('reportees', 'reportees', {'<>':'li','html':'${ReporteeId} ${Name} ${Type}'},'#reporteeslist')">Get reportees</a></p>
            <ul id="reporteeslist"></ul>        
        </div>
        <div class="col-md-4">
            <h2>Get reportee messages</h2>
            <p>
                Messages for a authorized reportee are fetched with:
            </p>
            <p>
                <code style="font-size: 7pt; font-family: monospace; display: block; white-space: pre-wrap">
    $.ajax({
        url: `${altinn}/api/${reporteeID}/messages`,
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
                <a class="btn btn-default" href="#" onclick="let id=$('#reporteeid').val();AjaxRequestJson(`${id}/messages`, 'messages', {'<>':'li','html':'${MessageId} ${Subject} ${Type}'},'#reporteemessagelist')">Get messages</a>
                <label>Reportee ID: <input type="text" id="reporteeid" style="width: 120px;"/></label>
            </p>
            <ul id="reporteemessagelist"></ul>        
        </div>
        
    </div>

    <div class="row">  
        <div class="col-md-4">
            <h2>Get forms</h2>
            <p>
                Forms in a spesific message for a authorized reportee is fetched with:
            </p>
            <p>
                <code style="font-size: 7pt; font-family: monospace; display: block; white-space: pre-wrap">
    $.ajax({
        url: `${altinn}/api/${reporteeID/messages`,
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
            console.log(data["_links"]["form"]);
        })
                </code>
            </p>            
            <p>
                <label>Reportee ID: <input type="text" id="reportee2id" style="width: 120px;"/></label>
                <label>Message ID: <input type="text" id="messageid" style="width: 120px;"/></label>
            </p>
            <p><a class="btn btn-default" href="#" onclick="let rid=$('#reportee2id').val();let mid=$('#messageid').val();AjaxRequestJson(`${rid}/messages/${mid}`, '_links', {'<>':'li','text':function() { return $.json2html(this.children,{'<>':'span','html':'${href} ${name}'})}},'#forms')">Get forms</a></p>
            <ul id="forms"></ul>
        </div>        
        <div class="col-md-4">
            <h2>Get form XML payload</h2>
            <p>
                Form XML payload in a spesific message for a authorized reportee:
            </p>
            <p>
                <code style="font-size: 7pt; font-family: monospace; display: block; white-space: pre-wrap">
    $.ajax({
        url: `${altinn}/api/${reporteeID/messages/${messageID}/forms/${formID}/formdata`,
        method: "GET",
        crossDomain: true,
        headers: {
            "X-Requested-With": "XMLHttpRequest",
            "ApiKey": "<%: AccountControl.AppSettings.GetApiKey() %>",
            "Access-Control-Allow-Origin": "<%: AccountControl.AppSettings.GetOrigin() %>",
            "Accept": "pplication/xml",
            "Content-Type": "pplication/xml"
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
                <label>Formdata URL: <input type="text" id="formdataurl" style="width: 200px;"/></label>
            </p>
            <p><a class="btn btn-default" href="#" onclick="AjaxRequestXml($('#formdataurl').val(), '#formdata')">Get formdata</a></p>
            <code id="formdata"></code>
        </div>
    </div>
</asp:Content>
