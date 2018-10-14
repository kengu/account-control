using System;
using System.Configuration;
using System.Web;
using System.Web.Http.Cors;
using System.Web.Services;
using System.Web.UI;
using AccountControl;

namespace AccountControl
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            cMessage.Text = Authenticate() ? "Integration with Altinn FAILED :-/" : "Integration with Altinn works!";            
        }

        protected bool Authenticate()
        {
            bool bAuthenticate = Request.Cookies[".ASPXAUTH"] == null;
            if (bAuthenticate)
            {
                int vRetries = Session["AuthRetries"] == null ? 0 : int.Parse(Session["AuthRetries"].ToString());
                if ((vRetries < 3))
                {
                    Response.RedirectToRoute("auth_login");
                }
            }
            return !bAuthenticate;
        }

        [WebMethod]
        public static void Reset()
        {
            HttpContext.Current.Session["AuthRetries"] = 0;
        }

    }
}