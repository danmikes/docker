#!/bin/bash

source .env

ssh $PI_USER@$PI_HOST << EOF
  sudo apt install certbot python3-certbot-nginx
  sudo certbot --nginx -d $DOMAIN -m $ACTOR@$APP
EOF
