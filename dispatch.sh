echo -e "\e[36m>>>>Install golang<<<<\e]0m"
yum install golang -y
echo -e "\e[36m>>>>add user<<<<\e]0m"
useradd roboshop
echo -e "\e[36m>>>>remove content<<<<\e]0m"
rm -rf /app
mkdir /app
echo -e "\e[36m>>>>Download dispatch<<<<\e]0m"
curl -L -o /tmp/dispatch.zip https://roboshop-artifacts.s3.amazonaws.com/dispatch.zip
echo -e "\e[36m>>>>unzip dispatch<<<<\e]0m"
cd /app
unzip /tmp/dispatch.zip
cd /app
echo -e "\e[36m>>>>dispatch details<<<<\e]0m"
go mod init dispatch
go get
go build
echo -e "\e[36m>>>>copy contents<<<<\e]0m"
cp /home/centos/roboshop-shell/dispatch.service /etc/systemd/system/dispatch.service
echo -e "\e[36m>>>>restart the service<<<<\e]0m"
systemctl daemon-reload
systemctl enable dispatch
systemctl restart dispatch