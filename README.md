AccountControl
==============
Proof-of-concept for webapp integration with Altinn.

Preparations
------------

1. Ensure that you control at least one domain or subdomain which you register with the application
2. Follow the instructions on [how to register your application](https://altinn.github.io/docs/guides/integrasjon/sluttbrukere/api/kom-i-gang/#registrer-din-applikasjon).

Setup
-----
1. The application requires that the file `AccountControl/PrivateSettings.config` is added to the repo with the following content:
	```
	<?xml version="1.0" encoding="utf-8" ?>
	<appSettings>
	  <add key="ApiKeyTest" value="XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX" />
	  <add key="UserNID" value="{Norwegian_National_ID}"/>
	</appSettings>
	```

2. Set `Origin` in `AccountControl/Web.config` to a domain or subdomain supplied with in the registration.
3. Deploy the application to Azure, configure SSL and enforce https only


Debugging
---------
The application will not work if `Origin` is not set correctly, or if you deploy and configure Azure with another domain or subdomain than what is 
given in origin or registrered with your application in Altinn. If you get the follwing error in the webclient console:
```
Failed to load https://tt02.altinn.no/api/my/messages: Response to preflight request doesn't pass access control check: 
No 'Access-Control-Allow-Origin' header is present on the requested resource. Origin 'https://www.xxxxxxxxx.no' is therefore not allowed access. 
The response had HTTP status code 400.
```

Please follow the [debugging tips supplied by Altinn](https://altinn.github.io/docs/guides/integrasjon/sluttbrukere/api/kom-i-gang/#feilsøking).

