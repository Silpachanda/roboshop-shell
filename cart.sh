echo -e "\e[36m>>>>Configure Nodejs repo<<<<\e]0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash

echo -e "\e[36m>>>>install Nodejs repo<<<<\e]0m"
yum install nodejs -y

echo -e "\e[36m>>>>add username<<<<\e]0m"
useradd roboshop

echo -e "\e[36m>>>>remove the content<<<<\e]0m"
rm -rf /app

echo -e "\e[36m>>>>make directory<<<<\e]0m"
mkdir /app

echo -e "\e[36m>>>>copy to the folder<<<<\e]0m"
curl -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart.zip
cd /app

echo -e "\e[36m>>>>unzip cart<<<<\e]0m"
unzip /tmp/cart.zip
cd /app
npm install

echo -e "\e[36m>>>>copy to the services<<<<\e]0m"
cp /home/centos/roboshop-shell/cart.service /etc/systemd/system/cart.service

systemctl daemon-reload
systemctl enable cart
systemctl restart cart