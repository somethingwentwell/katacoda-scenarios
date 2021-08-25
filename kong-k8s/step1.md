Start Minikube

`minikube start`{{execute}}

https://docs.konghq.com/enterprise/2.5.x/deployment/installation/kong-on-kubernetes/

Provision a namespace

`kubectl create namespace kong`{{execute}}

Set up license secret

`kubectl create secret generic kong-enterprise-license -n kong --from-file=./license`{{execute}}

Set up Helm

`helm repo add kong https://charts.konghq.com`{{execute}}

`helm repo update`{{execute}}

Seed the Super Admin password

`kubectl create secret generic kong-enterprise-superuser-password -n kong --from-literal=password=password`{{execute}}

Prepare the sessions plugin for Kong Manager and Dev Portal

`kubectl create secret generic kong-session-config -n kong --from-file=admin_gui_session_conf --from-file=portal_session_conf`{{execute}}

Deploy Kong Gateway on Kubernetes

`helm install my-kong kong/kong -n kong --values ./values.yaml`{{execute}}

Watch pod deployment

`kubectl get po -n kong -w`{{execute}}

Check minikube services

`minikube service list -n kong`{{execute}}

URLs:

Kong Proxy:

https://[[HOST_SUBDOMAIN]]-30000-[[KATACODA_HOST]].environments.katacoda.com

Kong Admin:

https://[[HOST_SUBDOMAIN]]-30001-[[KATACODA_HOST]].environments.katacoda.com

Kong Manager:

https://[[HOST_SUBDOMAIN]]-30002-[[KATACODA_HOST]].environments.katacoda.com

Kong Portal:

https://[[HOST_SUBDOMAIN]]-30003-[[KATACODA_HOST]].environments.katacoda.com

Kong Portal API:

https://[[HOST_SUBDOMAIN]]-30004-[[KATACODA_HOST]].environments.katacoda.com
