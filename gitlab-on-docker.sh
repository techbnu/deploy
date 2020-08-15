#!/bin/bash              

# docker pull gitlab/gitlab-ce:13.2.4-ce.0                  
docker run --detach \
--hostname 119.8.118.4 \
--publish 8443:443 --publish 8880:80 --publish 8222:22 --publish 4567:4567 \
--name gitlab13.2 \
--restart always \
--volume /data/gitlab/config:/etc/gitlab \
--volume /data/gitlab/logs:/var/log/gitlab \
--volume /data/gitlab/data:/var/opt/gitlab \
--volume /data/gitlab/cert:/etc/gitlab/ssl \
--volume /data/gitlab/registry:/var/opt/gitlab/gitlab-rails/shared/registry \
--privileged=true \
gitlab/gitlab-ce:latest
