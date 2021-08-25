which helm
/some/path/to/helm
rm /some/path/to/helm

curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
sudo apt-get install apt-transport-https --yes
echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm

https://[[HOST_SUBDOMAIN]]-1337-[[KATACODA_HOST]].environments.katacoda.com