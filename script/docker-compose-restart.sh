#!/bin/bash

source .env

ssh -t $PI_USER@$PI_HOST << EOF
  cd ~/docker || exit
  sudo systemctl daemon-reload
  docker compose down --volumes
  docker compose up -d --no-deps --build || { echo "Failed to start containers!"; exit 1; }
EOF
