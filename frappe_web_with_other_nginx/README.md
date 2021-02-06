
### Need to do before

[Install Docker](https://docs.docker.com/engine/install/ubuntu/)
[Post Install for development environement](https://docs.docker.com/engine/install/linux-postinstall/)
[Install docker-compose](https://docs.docker.com/compose/install/)
[Docker Compose Completion](https://docs.docker.com/compose/completion/)


### Create the Docker volume

Create data directory 
```sh
 mkdir -p /opt/erpnext/data/mariadb/ /opt/erpnext/sites /opt/erpnext/assets /opt/erpnext/data/redis/frappe_redis_cache/ /opt/erpnext/data/redis/frappe_redis_queue/ /opt/erpnext/data/redis/frappe_redis_socketio/
```

For mysql volumes : assuming /opt/data/frappe directory exists (see previous command)
```sh
 docker volume create --driver local --opt type=none --opt device=/opt/erpnext/data/mariadb/ --opt o=bind erpnext-mariadb-vol
```

For redis volumes assuming /opt/data/redis_redis_cache/, /opt/data/redit/frappe_redis_queue/,  /opt/data/redit/frappe_redis_socketio directories exists 
```sh
docker volume create --driver local --opt type=none --opt device=/opt/erpnext/data/redis/frappe_redis_cache/ --opt o=bind erpnext-redis-cache-vol;
docker volume create --driver local --opt type=none --opt device=/opt/erpnext/data/redis/frappe_redis_queue/ --opt o=bind erpnext-redis-queue-vol;
docker volume create --driver local --opt type=none --opt device=/opt/erpnext/data/redis/frappe_redis_socketio/ --opt o=bind erpnext-redis-socketio-vol;
```

For source volumes directory
```sh
 docker volume create --driver local --opt type=none --opt device=/opt/erpnext/sites --opt o=bind erpnext-sites-vol
```

For asset volumes directory
```sh
 docker volume create --driver local --opt type=none --opt device=/opt/erpnext/assets --opt o=bind erpnext-assets-vol
```

### Clone this repo 

/home/..../frappe_docker_file => Clone of this repo

### Nginx configuration

Configure your local nginx, you can find sample nginx.conf.sample
Note : the redirect port is currently 51899 also set into docker-compose.xml

### Run compose
copy env-sample to .env and edit file with your information
```sh
    cd /home/..../frappe_docker_file/
    docker-compose up
```
