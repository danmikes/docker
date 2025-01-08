#!/bin/bash

source .env

ssh $PI_USER@$PI_HOST << EOF
  sudo systemctl daemon-reload
  sudo sytemctl enable containerd
  sudo systemctl start containerd
  sudo sytemctl enable docker
  sudo systemctl start docker
EOF
