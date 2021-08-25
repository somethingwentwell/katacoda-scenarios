`curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -`{{execute}}

`sudo apt-get install apt-transport-https --yes`{{execute}}

`echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list`{{execute}}

`sudo apt-get update`{{execute}}

`sudo apt-get install helm`{{execute}}

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


https://[[HOST_SUBDOMAIN]]-1337-[[KATACODA_HOST]].environments.katacoda.com