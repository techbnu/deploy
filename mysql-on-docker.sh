#!/bin/bash

# docker pull mysql:5.7.31
# docker container ls --all
# docker container rm mysql5.7
# systemctl restart docker
# telnet 119.8.118.4 3306

docker run -d -p 3306:3306 \
--name mysql_dev_5.7 \
-v /data/mysql_dev_3306/conf:/etc/mysql/conf.d \
-v /data/mysql_dev_3306/logs:/logs \
-v /data/mysql_dev_3306/data:/var/lib/mysql \
-e MYSQL_ROOT_PASSWORD=dev3306_Passwd \
-e TZ=Asia/Shanghai \
--privileged=true \
--restart always \
mysql:5.7.31

# telnet 119.8.118.4 3308 root:test3308_Passwd test:Test08_passwd
docker run -d -p 3308:3306 \
--name mysql_test_5.7 \
-v /data/mysql_test_3308/conf:/etc/mysql/conf.d \
-v /data/mysql_test_3308/logs:/logs \
-v /data/mysql_test_3308/data:/var/lib/mysql \
-e MYSQL_ROOT_PASSWORD=test3308_Passwd \
-e TZ=Asia/Shanghai \
--privileged=true \
--restart always \
mysql:5.7.31
