# JavaScript Plugin Enviroment Setup in Existing Kong Docker

docker exec -it -u root kong-ee /bin/bash

`docker exec -it -u root kong-ee /bin/bash`{{execute}}

apk add --update nodejs npm python make g++

`apk add --update nodejs npm python make g++`{{execute}}

npm install --unsafe -g kong-pdk@0.3.0

`npm install --unsafe -g kong-pdk@0.3.0`{{execute}}

mkdir /usr/local/kong/js-plugins
`mkdir /usr/local/kong/js-plugins`{{execute}}

exit

`exit`{{execute}}

docker inspect -f "{{ .Config.Env }}" kong-ee

`docker inspect -f "{{ .Config.Env }}" kong-ee`{{execute}}

docker commit --change "ENV KONG_PLUGINSERVER_NAMES=js KONG_PLUGINSERVER_JS_SOCKET=/usr/local/kong/js_pluginserver.sock KONG_PLUGINSERVER_JS_START_CMD='/usr/bin/kong-js-pluginserver -v --plugins-directory /usr/local/kong/js-plugins' KONG_PLUGINSERVER_JS_QUERY_CMD='/usr/bin/kong-js-pluginserver --plugins-directory /usr/local/kong/js-plugins --dump-all-plugins'" kong-ee kong-ee

`docker commit --change "ENV KONG_PLUGINSERVER_NAMES=js KONG_PLUGINSERVER_JS_SOCKET=/usr/local/kong/js_pluginserver.sock KONG_PLUGINSERVER_JS_START_CMD='/usr/bin/kong-js-pluginserver -v --plugins-directory /usr/local/kong/js-plugins' KONG_PLUGINSERVER_JS_QUERY_CMD='/usr/bin/kong-js-pluginserver --plugins-directory /usr/local/kong/js-plugins --dump-all-plugins'" kong-ee kong-ee`{{execute}}

docker stop kong-ee

`docker stop kong-ee`{{execute}}

docker rm kong-ee

`docker rm kong-ee`{{execute}}

docker run -d --name kong-ee --network=kong-ee-net -p 8000:8000 -p 8443:8443 -p 8001:8001 -p 8444:8444 -p 8002:8002 -p 8445:8445 -p 8003:8003 -p 8004:8004 kong-ee

`docker run -d --name kong-ee --network=kong-ee-net -p 8000:8000 -p 8443:8443 -p 8001:8001 -p 8444:8444 -p 8002:8002 -p 8445:8445 -p 8003:8003 -p 8004:8004 kong-ee`{{execute}}