#!/bin/bash

source .env

ssh $PI_USER@$PI_HOST << EOF
  sudo apt-get update && sudo apt-get upgrade
  curl -fsSL https://get.docker.com -o get-docker.sh
  sudo sh get-docker.sh
  sudo usermod -aG docker $PI_USER
EOF
