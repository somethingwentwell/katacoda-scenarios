# Correlation ID plugin


## Deploying using Deck

Run command:

deck sync -s kong.yaml --headers kong-admin-token:admin

## Step by step configuration

1. Create a service

curl -i -X POST --header 'kong-admin-token: admin'   --url http://localhost:8001/services/   \
--data 'name=mockbin'   \
--data 'url=http://mockbin.org/request'

2. Create a route

curl -i -X POST --header 'kong-admin-token: admin' --url http://localhost:8001/services/mockbin/routes \
--data 'name=mockbin' \
--data 'paths[]=/mockbin'


3. Apply the correlation id plugin

curl -i -X POST --header 'kong-admin-token: admin' --url http://localhost:8001/services/mockbin/plugins \
    --data "name=correlation-id"  \
    --data "config.header_name=Kong-Request-ID" \
    --data "config.generator=uuid#counter" \
    --data "config.echo_downstream=false"

4. Test with no correlation id header set

curl -i http://localhost:8000/mockbin


Response contains: "kong-request-id": "03514f0e-4e1e-40a1-9a55-19926798a863#3",
