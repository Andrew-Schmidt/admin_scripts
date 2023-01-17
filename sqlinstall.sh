#!/bin/bash
#add the gpg keys
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
#add the repository to the known repos
sudo add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/20.04/mssql-server-2022.list)"
#update apt
sudo apt-get update
#install the package from the repo
sudo apt-get install -y mssql-server
#verify the status of the package
systemctl status mssql-server --no-pager
#run the setup
sudo /opt/mssql/bin/mssql-conf setup

