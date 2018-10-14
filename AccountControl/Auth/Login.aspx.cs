using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AccountControl
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UserName.Text = ConfigurationManager.AppSettings["UserNID"];
        }

        protected void LoginButton_Authenticate(object sender, EventArgs e)
        {
            var sOrigin = String.Format("{0}/auth/callback", ConfigurationManager.AppSettings["origin"]);
            var sUserNID = UserName.Text;
            var sHost = ConfigurationManager.AppSettings[String.Format("Uri{0}", ConfigurationManager.AppSettings["env"])];
            var sAuthUrl = String.Format("{0}/Pages/ExternalAuthentication/Redirect.aspx?returnUrl={1}&userToken={2}",
                sHost, Server.UrlEncode(sOrigin), SHA.ToSHA256(sUserNID));
            if (Session["IDPSecurityPortal"] != null)
            {
                Response.Cookies.Add(new HttpCookie("IDPSecurityPortal", Session["IDPSecurityPortal"].ToString()));
            }
            var vOrigins = ConfigurationManager.AppSettings["origins"];
            Response.AddHeader("Access-Control-Allow-Origin", vOrigins);
            Response.AddHeader("Access-Control-Allow-Credentials", "true");
            Response.Redirect(sAuthUrl);
        }
    }
}