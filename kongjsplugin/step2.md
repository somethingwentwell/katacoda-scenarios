## Install Strapi
https://strapi.io/documentation/developer-docs/latest/setup-deployment-guides/installation/docker.html

Strapi is a headless CMS for building custom API. We will create an API with some with politically-sensitive words in China like 习近平 (Chinese name of President Xi), 1989 (Year of Tiananmen Square protests)

##### 1) Install Docker Compose

``sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose``

`sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose`{{execute}}

``sudo chmod +x /usr/local/bin/docker-compose``

`sudo chmod +x /usr/local/bin/docker-compose`{{execute}}

##### 2) Install Strapi with Docker Compose and Load API Data to Volume

``cd strapi``

`cd strapi`{{execute}}

``cat docker-compose.yaml``

`docker-compose.yaml`{{open}}

``docker-compose pull``

`docker-compose pull`{{execute}}

``docker-compose up -d``

`docker-compose up -d`{{execute}}

``docker logs strapi_strapi_1 --follow``

`docker logs strapi_strapi_1 --follow`{{execute}}

``docker stop strapi_strapi_1``

`docker stop strapi_strapi_1`{{execute}}

``wget https://warrenkongdemostor.blob.core.windows.net/strapiappdata/app.zip``

`wget https://warrenkongdemostor.blob.core.windows.net/strapiappdata/app.zip`{{execute}}

``unzip -o app.zip`

`unzip -o app.zip`{{execute}}

``docker start strapi_strapi_1``

`docker start strapi_strapi_1`{{execute}}

###### (Optional) Access to Strapi and Add Content

https://[[HOST_SUBDOMAIN]]-1337-[[KATACODA_HOST]].environments.katacoda.com

Email: admin@demo.com   
Password: P@ssw0rd1

##### 3) Add Kong Route which binding to Strapi API

``export MY_URI=https://[[HOST_SUBDOMAIN]]-1337-[[KATACODA_HOST]].environments.katacoda.com``

`export MY_URI=https://[[HOST_SUBDOMAIN]]-1337-[[KATACODA_HOST]].environments.katacoda.com`{{execute}}

###### (Optional) If try in VM with public IP

``export MY_URI=http://$(curl ifconfig.me):1337``

`export MY_URI=http://$(curl ifconfig.me):1337`{{copy}}

###### (Optional) If try in localhost

``export MY_URI=http://kubernetes.docker.internal:1337``

`export MY_URI=http://kubernetes.docker.internal:1337`{{copy}}

###### (Optional) Ready to go Strapi
``export MY_URI=https://api.successon.cloud``

`export MY_URI=https://api.successon.cloud`{{copy}}

``sudo apt install httpie``

`sudo apt install httpie`{{execute}}

###### Test if Strapi API is up

``http $MY_URI/kong-js-plugins``

`http $MY_URI/kong-js-plugins`{{execute}}

###### Add Kong Service and Route

``http post localhost:8001/services \
name=strapi-jscp \
url=$MY_URI/kong-js-plugins``

`http post localhost:8001/services name=strapi-jscp url=$MY_URI/kong-js-plugins`{{execute}}

``http post localhost:8001/services/strapi-jscp/routes \
paths:='["/custom-plugin"]'``

`http post localhost:8001/services/strapi-jscp/routes paths:='["/custom-plugin"]'`{{execute}}

###### Test API through Kong Gateway

``http get localhost:8000/custom-plugin``

`http get localhost:8000/custom-plugin`{{execute}}