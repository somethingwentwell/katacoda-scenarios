`sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose`{{execute}}

`sudo chmod +x /usr/local/bin/docker-compose`{{execute}}

`docker-compose.yaml`{{open}}

`docker-compose pull`{{execute}}

`docker-compose up -d`{{execute}}

`docker logs root_strapi_1 --follow`{{execute}}

https://[[HOST_SUBDOMAIN]]-1337-[[KATACODA_HOST]].environments.katacoda.com
[Displaying Tabs](https://katacoda.com/scenario-examples/scenarios/dashboard-tabs)