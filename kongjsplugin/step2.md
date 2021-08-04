## Install Strapi
https://strapi.io/documentation/developer-docs/latest/setup-deployment-guides/installation/docker.html

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

`sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose`{{execute}}

sudo chmod +x /usr/local/bin/docker-compose

`sudo chmod +x /usr/local/bin/docker-compose`{{execute}}

cd strapi

`cd strapi`{{execute}}

`docker-compose.yaml`{{open}}

docker-compose pull

`docker-compose pull`{{execute}}

docker-compose up -d

`docker-compose up -d`{{execute}}

docker logs strapi_strapi_1 --follow

`docker logs strapi_strapi_1 --follow`{{execute}}

wget https://warrenkongdemostor.blob.core.windows.net/strapiappdata/app.zip

`wget https://warrenkongdemostor.blob.core.windows.net/strapiappdata/app.zip`{{execute}}

unzip -o app.zip

`unzip -o app.zip`{{execute}}

https://[[HOST_SUBDOMAIN]]-1337-[[KATACODA_HOST]].environments.katacoda.com

Email: admin@demo.com   
Password: P@ssw0rd1

sudo apt install httpie

`sudo apt install httpie`{{execute}}

export MY_URI=https://[[HOST_SUBDOMAIN]]-1337-[[KATACODA_HOST]].environments.katacoda.com

`export MY_URI=https://[[HOST_SUBDOMAIN]]-1337-[[KATACODA_HOST]].environments.katacoda.com`{{execute}}

###If try in VM with public IP
export MY_URI=$(curl ifconfig.me):1337

`export MY_URI=$(curl ifconfig.me):1337`{{copy}}

###If try in localhost
export MY_URI=localhost:1337

`export MY_URI=localhost:1337`{{copy}}

http post localhost:8001/services \
name=strapi-jscp \
url=$MY_URI/kong-js-plugins

`http post localhost:8001/services name=strapi-jscp url=$MY_URI/kong-js-plugins`{{execute}}

http post localhost:8001/services/strapi-jscp/routes \
paths:='["/custom-plugin"]'

`http post localhost:8001/services/strapi-jscp/routes paths:='["/custom-plugin"]'`{{execute}}

http get localhost:8000/custom-plugin

`http get localhost:8000/custom-plugin`{{execute}}