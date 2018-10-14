using System;
using System.Web.UI;

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
            if (Session["AUTH"] == null)
            {
                Response.RedirectToRoute("auth_login");
            }
            return false;
        }
    }
}