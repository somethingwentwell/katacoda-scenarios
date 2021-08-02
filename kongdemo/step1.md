## Install Kong Gateway (Enterprise)
https://docs.konghq.com/enterprise/2.1.x/deployment/installation/docker/

1) Pull the following Docker image

docker pull kong/kong-gateway:2.4.1.1-alpine
`docker pull kong/kong-gateway:2.4.1.1-alpine`{{execute}}

2) Tag the image ID for easier use

docker images | grep kong/kong-gateway | awk '{print $3}' | xargs -I % docker tag % kong-ee
`docker images | grep kong/kong-gateway | awk '{print $3}' | xargs -I % docker tag % kong-ee`{{execute}}

3) Create a custom network to allow the containers to discover and communicate with each other

docker network create kong-ee-net
`docker network create kong-ee-net`{{execute}}

4) Start a PostgreSQL container

docker run -d --name kong-ee-database --network=kong-ee-net -p 5432:5432 -e "POSTGRES_USER=kong" -e "POSTGRES_DB=kong" -e "POSTGRES_PASSWORD=kong" postgres:9.6
`docker run -d --name kong-ee-database --network=kong-ee-net -p 5432:5432 -e "POSTGRES_USER=kong" -e "POSTGRES_DB=kong" -e "POSTGRES_PASSWORD=kong" postgres:9.6`{{execute}}

5) Export the License Key to a Variable

export KONG_LICENSE_DATA=<License Key>
`export KONG_LICENSE_DATA=<License Key>`{{copy}}

6) Prepare the Kong Database

docker run --rm --network=kong-ee-net -e "KONG_DATABASE=postgres" -e "KONG_PG_HOST=kong-ee-database" -e "KONG_PG_PASSWORD=kong" -e "KONG_LICENSE_DATA=$KONG_LICENSE_DATA" -e "KONG_PASSWORD=P@ssw0rd" kong-ee kong migrations bootstrap
`docker run --rm --network=kong-ee-net -e "KONG_DATABASE=postgres" -e "KONG_PG_HOST=kong-ee-database" -e "KONG_PG_PASSWORD=kong" -e "KONG_LICENSE_DATA=$KONG_LICENSE_DATA" -e "KONG_PASSWORD=P@ssw0rd" kong-ee kong migrations bootstrap`{{execute}}

7) Start Kong Enterprise with Kong Manager and Kong Developer Portal Enabled. If not using localhost, replace localhost with with the DNS name or IP of the Docker host.

docker run -d --name kong-ee --network=kong-ee-net -e "KONG_DATABASE=postgres" -e "KONG_PG_HOST=kong-ee-database" -e "KONG_PG_PASSWORD=kong" -e "KONG_PROXY_ACCESS_LOG=/dev/stdout" -e "KONG_ADMIN_ACCESS_LOG=/dev/stdout" -e "KONG_PROXY_ERROR_LOG=/dev/stderr" -e "KONG_ADMIN_ERROR_LOG=/dev/stderr" -e "KONG_ADMIN_LISTEN=0.0.0.0:8001" -e "KONG_PORTAL=on" -e "KONG_LICENSE_DATA=$KONG_LICENSE_DATA" -e "KONG_PORTAL_GUI_HOST=localhost:8003" -e "KONG_ADMIN_GUI_URL=http://localhost:8002" -p 8000:8000 -p 8443:8443 -p 8001:8001 -p 8444:8444 -p 8002:8002 -p 8445:8445 -p 8003:8003 -p 8004:8004 kong-ee
`docker run -d --name kong-ee --network=kong-ee-net -e "KONG_DATABASE=postgres" -e "KONG_PG_HOST=kong-ee-database" -e "KONG_PG_PASSWORD=kong" -e "KONG_PROXY_ACCESS_LOG=/dev/stdout" -e "KONG_ADMIN_ACCESS_LOG=/dev/stdout" -e "KONG_PROXY_ERROR_LOG=/dev/stderr" -e "KONG_ADMIN_ERROR_LOG=/dev/stderr" -e "KONG_ADMIN_LISTEN=0.0.0.0:8001" -e "KONG_PORTAL=on" -e "KONG_LICENSE_DATA=$KONG_LICENSE_DATA" -e "KONG_PORTAL_GUI_HOST=localhost:8003" -e "KONG_ADMIN_GUI_URL=http://localhost:8002" -p 8000:8000 -p 8443:8443 -p 8001:8001 -p 8444:8444 -p 8002:8002 -p 8445:8445 -p 8003:8003 -p 8004:8004 kong-ee`{{copy}}

8) Finalize Configuration and Verify Success of Kong Installation. If not using localhost, replace localhost with with the DNS name or IP of the Docker host.

curl -i -X GET --url http://localhost:8001/services
`curl -i -X GET --url http://localhost:8001/services`{{execute}}

9) Enable the Developer Portal. If not using localhost, replace localhost with with the DNS name or IP of the Docker host.

curl -X PATCH http://localhost:8001/workspaces/default --data "config.portal=true"
`curl -X PATCH http://localhost:8001/workspaces/default --data "config.portal=true"`{{execute}}

Public Link of Dev Portal:
https://[[HOST_SUBDOMAIN]]-8001-[[KATACODA_HOST]].environments.katacoda.com