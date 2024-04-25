#!/bin/bash
  # Use this for your user data (script from top to bottom)
  # install httpd (Linux 2 version)
yum update -y
yum install -y docker
yum install -y git
yum install -y nano
sudo service docker start
sudo usermod -a -G docker ec2-user
sudo chkconfig docker on

sudo mkdir teamcity
cd ~/teamcity
sudo mkdir data
sudo mkdir logs
sudo mkdir agent

sudo cat <<EOF > docker-compose.yml
version: "3"
services:
  tcs:
    image: jetbrains/teamcity-server
    container_name: teamcity-server
    ports:
      - "8111:8111"
    volumes:
      - data:/data/teamcity_server/datadir
      - logs:/opt/teamcity/logs
  tca:
    image: jetbrains/teamcity-agent
    depends_on:
      - tcs
    container_name: teamcity-agent
    environment:
      SERVER_URL: "http://tcs:8111/"
    volumes:
      - agent:/data/teamcity_agent/conf
volumes:
  data:
  logs:
  agent:
EOF


sudo docker-compose build
sudo docker-compose up -d