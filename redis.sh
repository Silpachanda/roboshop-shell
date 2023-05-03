echo -e "\e[36m>>>>Install redis repo<<<<\e]0m"
yum install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y

sed -i -e 's|127.0.0.1|0.0.0.0|' /etc/redis.conf
sed -i -e 's|127.0.0.1|0.0.0.0|' /etc/redis/redis.conf
echo -e "\e[36m>>>>enable redis repo<<<<\e]0m"
dnf module enable redis:remi-6.2 -y

echo -e "\e[36m>>>>Install redis repo<<<<\e]0m"
yum install redis -y

echo -e "\e[36m>>>>restart redis repo<<<<\e]0m"
systemctl enable redis
systemctl restart redis

# need to change port from 127.0.0.1 to 0.0.0.0