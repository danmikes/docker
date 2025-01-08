#!/bin/bash

source .env

ssh $PI_USER/$PI_HOST << EOF
  cd docker
  source .venv/bin/activate
  docker-compose run --rm certbot certonly --webroot --webroot-path=/var/www/certbot -d $DOMAIN --email $MAIL --agree-tos --no-eff-email
EOF
