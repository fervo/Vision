#!/bin/bash
echo deb https://apt.dockerproject.org/repo ubuntu-`cat /etc/lsb-release | grep DISTRIB_CODENAME | cut -d'=' -f2` main >> /etc/apt/sources.list.d/docker.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F76221572C52609D
apt-get update
apt-get purge lxc-docker*
apt-get purge docker.io*
apt-get -y install docker-engine
exit
