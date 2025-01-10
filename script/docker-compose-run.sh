#!/bin/bash

source .env

ssh $PI_USER/$PI_HOST << EOF
  cd ~/docker || exit

  if ! docker compose run --rm certbot certonly --webroot --webroot-path=/var/www/certbot/certbot -d $DOMAIN --email $MAIL --agree-tos --no-eff-email; then
    echo "CertBot failed to run"
    exit 1
  fi
EOF
