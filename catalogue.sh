echo -e "/e[36m>>>>Configure Nodejs repo<<<</e]0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash

echo -e "/e[36m>>>>install Nodejs repo<<<</e]0m"
yum install nodejs -y

echo -e "/e[36m>>>>Add application user<<<</e]0m"
useradd roboshop

echo -e "/e[36m>>>>create application directory<<<</e]0m"
mkdir /app

echo -e "/e[36m>>>>Download app content<<<</e]0m"
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip

echo -e "/e[36m>>>>Download app content<<<</e]0m"
cd /app
unzip /tmp/catalogue.zip

echo -e "/e[36m>>>>Download app content<<<</e]0m"
npm install

echo -e "/e[36m>>>>Download app content<<<</e]0m"
cp home/centos/roboshop-shell/catalogue.service /etc/systemd/system/catalogue.service

echo -e "/e[36m>>>>Download app content<<<</e]0m"
systemctl daemon-reload
systemctl enable catalogue
systemctl restart catalogue

echo -e "/e[36m>>>>Download app content<<<</e]0m"
cp home/centos/roboshop-shell/mongo.repo /etc/yum.repos.d/mongo.repo

echo -e "/e[36m>>>>Download app content<<<</e]0m"
yum install mongodb-org-shell -y

echo -e "/e[36m>>>>Download app content<<<</e]0m"
mongo --host mongo.shilpadevops.online </app/schema/catalogue.js

#need to remove Gowthami's hostname