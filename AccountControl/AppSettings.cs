using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace AccountControl
{
    public static class AppSettings
    {
        public static string GetEnv()
        {
            return ConfigurationManager.AppSettings["env"];
        }

        public static string GetOrigin()
        {
            return ConfigurationManager.AppSettings["Origin"];
        }

        public static string GetOriginsAllowed()
        {
            return ConfigurationManager.AppSettings["Origins"];
        }

        public static string GetAltinnUri()
        {
            return ConfigurationManager.AppSettings[GetEnvKey("Uri")];
        }

        public static string GetApiKey()
        {
            return ConfigurationManager.AppSettings[GetEnvKey("ApiKey")];
        }

        public static string GetAltinnApiUri(string sResource)
        {
            return String.Format("{0}/api/{1}", GetAltinnUri(), sResource);
        }

        public static string GetUserNID()
        {
            return ConfigurationManager.AppSettings["UserNID"];
        }

        public static string GetUsername()
        {
            return ConfigurationManager.AppSettings["Username"];
        }

        public static string GetPassword()
        {
            return ConfigurationManager.AppSettings["Password"];
        }

        private static string GetEnvKey(string sKey)
        {
            return String.Format("{0}{1}", sKey, GetEnv());
        }

    }
}