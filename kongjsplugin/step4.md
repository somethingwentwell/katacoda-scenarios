# JavaScript Example Plugin and Installation

https://docs.konghq.com/gateway-oss/2.5.x/external-plugins/#developing-javascript-plugins

cd

`cd`{{execute}}

git clone https://github.com/Kong/kong-js-pdk

`git clone https://github.com/Kong/kong-js-pdk`{{execute}}

cd kong-js-pdk

`cd kong-js-pdk`{{execute}}

npm install

`npm install`{{execute}}

npm install babel-preset-env --save

`npm install babel-preset-env --save`{{execute}}

npm test

`npm test`{{execute}}

docker cp examples/js-hello.js kong-ee:/usr/local/kong/js-plugins

`docker cp examples/js-hello.js kong-ee:/usr/local/kong/js-plugins`{{execute}}

docker commit --change "ENV KONG_PLUGINS=bundled,js-hello" kong-ee kong-ee

`docker commit --change "ENV KONG_PLUGINS=bundled,js-hello" kong-ee kong-ee`{{execute}}

docker stop kong-ee

`docker stop kong-ee`{{execute}}

docker rm kong-ee

`docker rm kong-ee`{{execute}}

docker run -d --name kong-ee --network=kong-ee-net -p 8000:8000 -p 8443:8443 -p 8001:8001 -p 8444:8444 -p 8002:8002 -p 8445:8445 -p 8003:8003 -p 8004:8004 kong-ee

`docker run -d --name kong-ee --network=kong-ee-net -p 8000:8000 -p 8443:8443 -p 8001:8001 -p 8444:8444 -p 8002:8002 -p 8445:8445 -p 8003:8003 -p 8004:8004 kong-ee`{{execute}}

As our file name was js-hello.js, our plugin will be called js-hello

http post localhost:8001/services/strapi-jscp/plugins \
name=js-hello

`http post localhost:8001/services/strapi-jscp/plugins name=js-hello`{{execute}}

http get localhost:8000/custom-plugin

`http get localhost:8000/custom-plugin`{{execute}}