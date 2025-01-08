#!/bin/bash

source .env

ssh-keygen -t rsa -b 4096 -C $ACTOR@$APP -f ~/.ssh/$KEY
ssh-copy-id -i ~/.ssh/$KEY.pub $PI_USER@$PI_HOST
ssh -i ~/.ssh/$KEY $PI_USER@$PI_HOST << EOF
  ssh-keyscan -H pi >> ~/.ssh/known_hosts
EOF
