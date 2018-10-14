using System;
using System.Web.UI;

namespace AccountControl
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            cMessage.Text = Authenticate() ? "Integration with Altinn FAILED :-/" : string.Format("Integration with Altinn works! User <b>{0}</b>)", AppSettings.GetUserNID());
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