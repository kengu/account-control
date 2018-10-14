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
                Response.RedirectToRoute("auth_login");
            }
            return !bAuthenticate;
        }
    }
}