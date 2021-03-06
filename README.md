# Deploy on Docker
通过Docker部署

## Dockerfile与docker-compose区别
- dockerfile 的作用是从无到有的构建镜像
- docker-compose是编排容器
                      
## 常用命令或者依赖
```shell
sudo systemctl enable docker          
docker pull gitlab/gitlab-ce
docker pull gitlab/gitlab-ce:latest
docker pull gitlab/gitlab-ce:13.2.4-ce.0
```                     
                        
## Docker启动说明:     
```shell
--hostname gitlab.example.com 设置主机名或域名，换成你自己的，可通过该域名访问gitlab
--publish 8443:443 将http：443映射到外部端口8443
--publish 8880:80 将web：80映射到外部端口8880
--publish 8222:22 将ssh：22映射到外部端口8222
--publish 4567:4567 开启container register使用的端口，后边详细说明
--name gitlab: 运行容器名                                                 
--restart always 自动重启，重要
--volume /data/gitlab/config:/etc/gitlab 挂载目录
--volume /data/gitlab/logs:/var/log/gitlab 挂载目录
--volume /data/gitlab/data:/var/opt/gitlab 挂载目录
--volume /data/gitlab/cert:/etc/gitlab/ssl  数字证书挂载目录
--volume /data/gitlab/registry:/var/opt/gitlab/gitlab-rails/shared/registry 镜像仓库挂载目录
--privileged=true  使得容器内的root拥有真正的root权限。否则，container内的root只是外部的一个普通用户权限
启动完成后，看下运行情况  docker ps -a，状态可为health: starting，等一会就可以访问了，unhealth状态为不健康状态，可查看日志。
```

## 进入容器操作
```shell
## 容器debug
docker logs -f  容器id或者容器名 

## gitlab https://docs.gitlab.com/omnibus/settings/configuration.html
docker exec -it gitlab /bin/bash
vim /etc/gitlab/gitlab.rb
## external_url 'http://192.168.1.10:8880'
sudo gitlab-ctl reconfigure # 改变后重新加载
docker exec gitlab gitlab-ctl reconfigure 

# 配置http 82端口
# nginx['redirect_http_to_https_port'] = 82
# nginx['listen_port'] = 82
 
# 配置ssh 2222端口
gitlab_rails['gitlab_shell_ssh_port'] = 2222

## mysql 
docker exec -it mysql_test_5.7 /bin/bash
docker exec -it mysql_dev_5.7 /bin/bash

```
