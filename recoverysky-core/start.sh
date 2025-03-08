#!/bin/bash

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 306057522130.dkr.ecr.us-east-1.amazonaws.com

sudo chown root:docker /var/run/docker.sock
sudo chmod 0660 /var/run/docker.sock

docker-compose up -d