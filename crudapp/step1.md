`sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose`{{execute}}

`sudo chmod +x /usr/local/bin/docker-compose`{{execute}}

`root/docker-compose.yaml`{{open}}

`docker-compose pull`{{execute}}

`docker-compose up -d`{{execute}}

https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com
[Displaying Tabs](https://katacoda.com/scenario-examples/scenarios/dashboard-tabs)