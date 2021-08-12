## JavaScript Plugin Development with Node Modules

This is the plugin which called a 3rd party node module text-censor. The plugin code will perform a text filter and replace politically-sensitive words in China to *. Detail of censor keywords as below:
https://github.com/observerss/textfilter/blob/master/keywords

##### 1) Review Censor Plugin and Test Code

``cat plugindev/js-censor.js``

`plugindev/js-censor.js`{{open}}

``cat plugindev/js-censor.test.js``

`plugindev/js-censor.test.js`{{open}}

##### 2) Copy Censor Plugin Code to Kong Docker

``cd``

`cd`{{execute}}

``docker cp plugindev/js-censor.js kong-ee:/usr/local/kong/js-plugins``

`docker cp plugindev/js-censor.js kong-ee:/usr/local/kong/js-plugins`{{execute}}

``docker exec -it -u root kong-ee /bin/bash``

`docker exec -it -u root kong-ee /bin/bash`{{execute}}

``cd /usr/local/kong/js-plugins``

`cd /usr/local/kong/js-plugins`{{execute}}

``npm install text-censor``

`npm install text-censor`{{execute}}

``exit``

`exit`{{execute}}

##### 3) Enable Censor Plugin to Kong Docker

``docker commit --change "ENV KONG_PLUGINS=bundled,js-hello,js-censor" kong-ee kong-ee-2``

`docker commit --change "ENV KONG_PLUGINS=bundled,js-hello,js-censor" kong-ee kong-ee-2`{{execute}}

``docker stop kong-ee``

`docker stop kong-ee`{{execute}}

``docker rm kong-ee``

`docker rm kong-ee`{{execute}}

``docker run -d --name kong-ee --network=kong-ee-net -p 8000:8000 -p 8443:8443 -p 8001:8001 -p 8444:8444 -p 8002:8002 -p 8445:8445 -p 8003:8003 -p 8004:8004 kong-ee-2``

`docker run -d --name kong-ee --network=kong-ee-net -p 8000:8000 -p 8443:8443 -p 8001:8001 -p 8444:8444 -p 8002:8002 -p 8445:8445 -p 8003:8003 -p 8004:8004 kong-ee-2`{{execute}}

##### 4) Test Censor Plugin in Kong Docker

``http post localhost:8001/services/strapi-jscp/plugins \
name=js-censor``

`http post localhost:8001/services/strapi-jscp/plugins name=js-censor`{{execute}}

``http get localhost:8000/custom-plugin``

`http get localhost:8000/custom-plugin`{{execute}}

``http get $MY_URI/kong-js-plugins``

###### Compare response body with Kong Gateway and direct call from Strapi. The result should be different like 1989 become **** with Kong Gateway.