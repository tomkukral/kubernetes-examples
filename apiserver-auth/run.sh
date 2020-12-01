#!/bin/bash

docker stop nginx
docker rm nginx

docker run \
	--detach \
	--restart always \
	--name nginx \
	--net host \
	--volume /root/nginx/nginx.conf:/etc/nginx/nginx.conf:ro \
	--volume /etc/kubernetes/:/etc/kubernetes/:ro \
	nginx
