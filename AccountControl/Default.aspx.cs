using System;
using System.Configuration;
using System.Web;
using System.Web.UI;

namespace AccountControl
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.Cookies[".ASPXAUTH"] == null)
            { 
                if(Authenticate())
                {

                }
            }
        }

        protected bool Authenticate()
        {
            int vRetries = Session["AuthRetries"] == null ? 0 : int.Parse(Session["AuthRetries"].ToString());
            var vFailed = (vRetries > 2);
            Session["AuthFailed"] = vFailed;
            if (!vFailed)
            {
                var sOrigin = String.Format("{0}/auth/callback", ConfigurationManager.AppSettings["origin"]);
                var sHost = ConfigurationManager.AppSettings[String.Format("Url{0}",ConfigurationManager.AppSettings["origin"])];
                var sAuthUrl = String.Format("https://{0}/Pages/ExternalAuthentication/Redirect.aspx?returnUrl={1}", sHost, Server.UrlEncode(sOrigin));
                if (Session["IDPSecurityPortal"] != null)
                {
                    Response.Cookies.Add(new HttpCookie("IDPSecurityPortal", Session["IDPSecurityPortal"].ToString()));
                }
                Session["AuthRetries"] = vRetries + 1;
                Response.Redirect(sAuthUrl);
            }
            return vFailed;
        }        

    }
}