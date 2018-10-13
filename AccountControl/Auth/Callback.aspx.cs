using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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
            Response.Redirect("/");
        }
    }
}