#!/bin/bash

source .env

ssh $PI_USER@$PI_HOST << EOF
  eval $(ssh-agent)

  if ! ssh-add -l | grep -q $KEY; then
    ssh-add ~/.ssh/$KEY
  fi

  echo $SSH_AUTH_SOCK

  ssh-add -l
EOF
