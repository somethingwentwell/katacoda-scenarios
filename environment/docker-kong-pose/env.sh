
#!/bin/bash

#Set KONG_IMAGE variable with link of Kong EE Docker image

#export KONG_IMAGE=kong-docker-kong-enterprise-edition-docker.bintray.io/kong-enterprise-edition:1.5.0.4-alpine
export KONG_IMAGE=kong/kong-gateway:2.4.1.1-alpine
#export KONG_IMAGE=kong/kong-gateway-private:2.3.3.2-alpine


# Set Kong EE license file change <file> to your license.json path
export KONG_LICENSE_DATA=`cat ./license.json`

