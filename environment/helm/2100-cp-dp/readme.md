## Deploy A Control Plane and Data Plane with Helm v. Kong 2.1 

### Prior to deploying Kong : 

1.  Set up the certificate secret :

You can use the certificates included in this /certs direcotry or create new ones :

```docker pull kong-docker-kong-enterprise-edition-docker.bintray.io/kong-enterprise-edition:2.1.0.0-beta1-centos```

```docker run -it -u root   -e "KONG_LICENSE_DATA=$KONG_LICENSE_DATA" 9224f26e982c bash```

```[root@4bceee3be4f6 /]# kong hybrid gen_cert```

2. Copy them out of the running container 
docker cp 4bceee3be4f6:/cluster.key .
docker cp 4bceee3be4f6:/cluster.crt .

3. Add the cert and key as a Kubernetes tls sercret

kubectl create secret tls kong-cluster-tls --key="cluster.key" --cert="cluster.crt"

### Modify the yaml files: 
1. Subtitute the proper environment specific variable for anyting that reads 'CHANGEME'

2. Modify the pull secret and license secret 

3. All other changes can be seen documented in the Hybrid specific portion of the Helm chart documentation: 
https://github.com/Kong/charts/blob/main/charts/kong/README.md#hybrid-mode  

### Deploy 

```helm repo add kong https://charts.konghq.com```

```$ helm repo update```

```$ helm install <my-release-cp> kong/kong -f dataplane.yaml```

```$ helm install <my-release-dp> kong/kong -f contorlplane.yaml```
