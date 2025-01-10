#!/bin/bash

docker system prune -a --volumes -f
docker compose up --build -d
