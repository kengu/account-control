using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Routing;
using Microsoft.AspNet.FriendlyUrls;

namespace AccountControl
{
    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            var settings = new FriendlyUrlSettings();
            settings.AutoRedirectMode = RedirectMode.Permanent;
            routes.EnableFriendlyUrls(settings);
            routes.MapPageRoute("auth_login", "auth/login", "~/Auth/Login.aspx");
            routes.MapPageRoute("auth_callback", "auth/callback", "~/Auth/Callback.aspx");
        }
    }
}
