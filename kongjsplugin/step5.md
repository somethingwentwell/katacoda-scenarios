# JavaScript Plugin Development with Node Modules

cd

`cd`{{execute}}

docker cp plugindev/js-censor.js kong-ee:/usr/local/kong/js-plugins

`docker cp plugindev/js-censor.js kong-ee:/usr/local/kong/js-plugins`{{execute}}

docker exec -it -u root kong-ee /bin/bash

`docker exec -it -u root kong-ee /bin/bash`{{execute}}

cd /usr/local/kong/js-plugins

`cd /usr/local/kong/js-plugins`{{execute}}

npm install --unsafe -g text-censor

`npm install --unsafe -g text-censor`{{execute}}

exit

`exit`{{execute}}

docker cp plugindev/js-censor.js kong-ee:/usr/local/kong/js-plugins

`docker cp plugindev/js-censor.js kong-ee:/usr/local/kong/js-plugins`{{execute}}

docker commit --change "ENV KONG_PLUGINS=bundled,js-censor" kong-ee kong-ee-2

`docker commit --change "ENV KONG_PLUGINS=bundled,js-censor" kong-ee kong-ee-2`{{execute}}

docker stop kong-ee

`docker stop kong-ee`{{execute}}

docker rm kong-ee

`docker rm kong-ee`{{execute}}

docker run -d --name kong-ee --network=kong-ee-net -p 8000:8000 -p 8443:8443 -p 8001:8001 -p 8444:8444 -p 8002:8002 -p 8445:8445 -p 8003:8003 -p 8004:8004 kong-ee-2

`docker run -d --name kong-ee --network=kong-ee-net -p 8000:8000 -p 8443:8443 -p 8001:8001 -p 8444:8444 -p 8002:8002 -p 8445:8445 -p 8003:8003 -p 8004:8004 kong-ee-2`{{execute}}

http post localhost:8001/services/strapi-jscp/plugins \
name=js-censor

`http post localhost:8001/services/strapi-jscp/plugins name=js-censor`{{execute}}

http get localhost:8000/custom-plugin

`http get localhost:8000/custom-plugin`{{execute}}

http get https://[[HOST_SUBDOMAIN]]-1337-[[KATACODA_HOST]].environments.katacoda.com

Censor Keywords
https://github.com/observerss/textfilter/blob/master/keywords