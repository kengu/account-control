using System;
using System.Configuration;
using System.Web;
using System.Web.UI;
using AccountControl;

namespace AccountControl
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.Cookies[".ASPXAUTH"] == null)
            { 
                cMessage.Text = Authenticate() ? "Integration with Altinn FAILED :-/" : "Integration with Altinn works!";
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
                var sUserNID = ConfigurationManager.AppSettings["UserNID"];
                var sHost = ConfigurationManager.AppSettings[String.Format("Uri{0}",ConfigurationManager.AppSettings["env"])];
                var sAuthUrl = String.Format("{0}/Pages/ExternalAuthentication/Redirect.aspx?returnUrl={1}&userToken={2}", 
                    sHost, Server.UrlEncode(sOrigin), SHA.ToSHA256(sUserNID));
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