using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Http.Cors;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AccountControl.Auth
{
    public partial class Callback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var sMessage = "";
            if (Request.Cookies[".ASPXAUTH"] != null)
            {
                Session[".ASPXAUTH"] = Request.Cookies[".ASPXAUTH"].Value;
                sMessage = String.Format(".ASPXAUTH: {0} <br/>", Session[".ASPXAUTH"].ToString());
            }
            if (Request.Cookies["IDPSecurityPortal"] != null)
            {
                Session["IDPSecurityPortal"] = Request.Cookies["IDPSecurityPortal"].Value;
                sMessage += String.Format("IDPSecurityPortal: {0}", Session["IDPSecurityPortal"].ToString());
            }
            cMessage.Text = String.IsNullOrEmpty(sMessage) ? "Failure" : sMessage;
            var vOrigins = ConfigurationManager.AppSettings["origins"];
            Response.AddHeader("Access-Control-Allow-Origin", vOrigins);
            Response.AddHeader("Access-Control-Allow-Credentials", "true");
            Response.Redirect("/");
        }
    }
}