using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace AccountControl.Auth
{
    public class Callback : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies[".ASPXAUTH"] != null)
            {
                Session[".ASPXAUTH"] = Request.Cookies[".ASPXAUTH"].Value;
            }
            if (Request.Cookies["IDPSecurityPortal"] != null)
            {
                Session["IDPSecurityPortal"] = Request.Cookies["IDPSecurityPortal"].Value;
            }
            Response.RedirectLocation = "/";
        }
    }
}