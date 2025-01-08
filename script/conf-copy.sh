#!/bin/bash

source .env

FILE_1="docker-compose.yml"
SOURCE_1="./conf/$FILE_1"
TARGET_1="~/docker/$FILE_1"
scp $SOURCE_1 $PI_USER@$PI_HOST:$TARGET_1

FILE_2="nginx.conf"
SOURCE_2="./conf/$FILE_2"
TEMP_2="~/docker/$FILE_2"
TARGET_2="/etc/nginx/$FILE_2"
scp $SOURCE_2 $PI_USER@$PI_HOST:$TEMP_2
ssh $PI_USER@$PI_HOST "sudo mv $TEMP_2 $TARGET_2"
