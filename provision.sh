#!/bin/bash
echo 'DOCKER_OPTS="-H tcp://0.0.0.0:2375 ${DOCKER_OPTS}"' >> /etc/default/docker
