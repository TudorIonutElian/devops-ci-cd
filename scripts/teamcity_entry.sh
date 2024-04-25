#!/bin/bash
  # Use this for your user data (script from top to bottom)
  # install httpd (Linux 2 version)
yum update -y
yum install -y docker
yum install -y git
yum install -y docker-compose
sudo service docker start
sudo usermod -a -G docker ec2-user
sudo chkconfig docker on

sudo mkdir teamcity
cd teamcity
sudo mkdir data
sudo mkdir logs
sudo mkdir agent

cd teamcity
sudo docker compose build
sudo docker compose up -d