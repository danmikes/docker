#!/bin/bash

source .env

ssh $PI_USER@$PI_HOST << EOF
  sudo systemctl daemon-reload
  sudo systemctl reload nginx
  sudo systemctl restart containerd
  sudo systemctl restart docker
EOF
