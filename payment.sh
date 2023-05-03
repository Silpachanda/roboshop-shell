echo -e "\e[36m>>>>Install python<<<<\e]0m"
yum install python36 gcc python3-devel -y
echo -e "\e[36m>>>>add user<<<<\e]0m"
useradd roboshop

rm -rf /app
mkdir /app
echo -e "\e[36m>>>>Download payment folder<<<<\e]0m"
curl -L -o /tmp/payment.zip https://roboshop-artifacts.s3.amazonaws.com/payment.zip

cd /app
echo -e "\e[36m>>>>unzip payment<<<<\e]0m"
unzip /tmp/payment.zip
cd /app
pip3.6 install -r requirements.txt
echo -e "\e[36m>>>>copy the contents to payment service<<<<\e]0m"
cp /home/centos/roboshop-shell/payment.service /etc/systemd/system/payment.service

systemctl daemon-reload
systemctl enable payment
systemctl restart payment