using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web.Http;
using System.Web.Http.Cors;

namespace AccountControl
{
    public static class WebApiConfig
    {
        public static bool SupportsCredentials { get; private set; }

        public static void Register(HttpConfiguration config)
        {
            // Required by Altinn auth
            var vCors = new EnableCorsAttribute(ConfigurationManager.AppSettings["origins"], "*", "*");
            vCors.SupportsCredentials = true;
            config.EnableCors(vCors);

            // Web API routes
            config.MapHttpAttributeRoutes();

            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );
        }
        
    }
}
