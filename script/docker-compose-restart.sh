#!/bin/bash

source .env

ssh -t $PI_USER@$PI_HOST << EOF
  cd ~/docker || exit
  sudo systemctl daemon-reload
  docker-compose down
  docker-compose rm -f
  docker-compose up -d
EOF
