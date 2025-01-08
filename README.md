# Mac

## Create GitHub Key-Pair
```
sh script/key-create.sh
sh script/key-add.sh
sh script/certbot-install.sh
sh script/conf-copy.sh
sh script/docker-install.sh
sh script/service-start.sh
sh script/docker-compose-run.sh
```

# GitHub

## File
```
/app.py
/pack.txt
/Dockerfile
/.github/workflows/docker-build.yml
```

## Repository-Secret
```
PI_HOST = <Raspi hostname>
PI_USER = <Raspi username>
PI_PASS = <Raspi password>
ID_RSA = <GitHub private key>
```

## Deploy-Key
```
ID_RSA_PUB = <GitHub public key>
```

# Router

## Port
```
80 -> 192.168.178.199
443 -> 192.168.178.199
```

## Docker-Build
```
git push triggers /.github/workflows/docker-build.yml
- Dockerfile makes docker-container with flask-app
- Builds and pushes docker-image to GitHub Container-Service
```

## Docker-Compose
```
Restarts:
- gunicorn.service
- nginx.service
- certbot.service
```

## Restart
```
sh script/service-restart.sh
sh script/docker-compose-restart.sh
```
