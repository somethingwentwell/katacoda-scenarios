## Rate Limiting with Kong

1) Check Docker DNS (For local machine only)

cat /etc/hosts

2) Install HTTPie

apt install httpie
`apt install httpie`{{execute}}

3) Add Service

http post localhost:8001/services \
name=strapi-rl \
url=http://kubernetes.docker.internal:1337/kong-rate-limitings
`http post localhost:8001/services name=strapi-rl url=https://[[HOST_SUBDOMAIN]]-1337-[[KATACODA_HOST]].environments.katacoda.com/kong-rate-limitings`{{execute}}

4) Add Route

http post localhost:8001/services/strapi-rl/routes \
hosts:='["example.com"]'
`http post localhost:8001/services/strapi-rl/routes hosts:='["example.com"]'`{{execute}}

5) Test Route

http get localhost:8000/ \
host:example.com
`http get localhost:8000/ host:example.com`{{execute}}

6) Add Plugin

Rate Limiting Advanced (Enterprise)

http post localhost:8001/services/strapi-rl/plugins \
name=rate-limiting-advanced \
config:='{"sync_rate": 0, "window_size": [60], "limit": [10]}'
`http post localhost:8001/services/strapi-rl/plugins name=rate-limiting-advanced config:='{"sync_rate": 0, "window_size": [60], "limit": [10]}'`{{execute}}

Rate Limiting (OSS)

http post localhost:8001/services/strapi-rl/plugins \
name=rate-limiting-advanced \
config:='{"sync_rate": 0, "window_size": [60], "limit": [10]}'
`http post localhost:8001/services/strapi-rl/plugins name=rate-limiting config:='{"second": 2, "minute": 10, "policy": "local"}'`{{execute}}

7) Test Rate Limiting

`for ((i=1;i<=15;i++)); do http get localhost:8000/ host:example.com; done`{{execute}}