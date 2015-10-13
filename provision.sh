#!/bin/bash
curl -sSL https://get.docker.com/ | sh
echo "[Unit]
Description=Docker Application Container Engine
Documentation=https://docs.docker.com
After=network.target docker.socket
Requires=docker.socket

[Service]
Type=notify
ExecStart=/usr/bin/docker daemon -H tcp://0.0.0.0:2375 -H fd://
MountFlags=slave
LimitNOFILE=1048576
LimitNPROC=1048576
LimitCORE=infinity

[Install]
WantedBy=multi-user.target
" > /lib/systemd/system/docker.service
systemctl daemon-reload
systemctl enable docker
service docker start
service docker restart
