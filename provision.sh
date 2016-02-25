#!/bin/bash
echo 'DOCKER_OPTS="-H tcp://0.0.0.0:2375 ${DOCKER_OPTS}"' >> /etc/default/docker
service docker restart

groupadd -g 2000 user
useradd -u 2000 -g 2000 user
