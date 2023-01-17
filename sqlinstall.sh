#!/bin/bash
#add the gpg keys
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
#add the repository to the known repos
sudo add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/20.04/mssql-server-2022.list)"
#update apt
sudo apt-get update
#install the package from the repo
sudo apt-get install -y mssql-server
#deciding where to go now
cho = read -p "do you want to set up now or later"

if [ $cho -eq "now" ]
	then
		sudo /opt/mssql/bin/mssql-conf setup
	else
		echo "to set up later enter this command:  sudo /opt/mssql/bin/mssql-conf setup"
#verify the status of the package
systemctl status mssql-server --no-pager
