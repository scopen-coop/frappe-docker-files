
### Need to do before

[Install Docker](https://docs.docker.com/engine/install/ubuntu/)
[Post Install for development environement](https://docs.docker.com/engine/install/linux-postinstall/)
[Install docker-compose](https://docs.docker.com/compose/install/)
[Docker Compose Completion](https://docs.docker.com/compose/completion/)


### Create the Docker volume

Assuming /opt/data/frappe[XX] directory exists (where [XX] a are the version number of frappe/erpnext you want to deploy) 
```sh
 docker volume create --driver local --opt type=none --opt device=/opt/data/frappe[XX] --opt o=bind frappe[XX]-mariadb-vol
```

Assuming /opt/data/redis[XX]_redis_cache/, /opt/data/redit/frappe[XX]_redis_queue/,  /opt/data/redit/frappe[XX]_redis_socketio directories exists (where [XX] a are the version number of frappe/erpnext you want to deploy)
```sh
docker volume create --driver local --opt type=none --opt device=/opt/data/redis/frappe[XX]_redis_cache --opt o=bind frappe[XX]-redis-cache-data
docker volume create --driver local --opt type=none --opt device=/opt/data/redis/frappe[XX]_redis_queue --opt o=bind frappe[XX]-redis-queue-data
docker volume create --driver local --opt type=none --opt device=/opt/data/redis/frappe[XX]_redis_sockerio --opt o=bind frappe[XX]-redis-socketio-data
```

### Network

To name it to use it for others application like metabase

```sh
docker network create frappe-network
```

### Directory sctruture

/home/..../frappe

/home/..../frappe_docker_XX => clone of https://github.com/frappe/frappe_docker

Follow the instruction to install frappe with docker here : (https://github.com/frappe/frappe_docker/tree/develop/development) 

/home/..../frappe_docker_file => Clone of this repo

### Run compose
```sh
    cd /home/..../frappe_docker_file/frappe
    docker-compose up
```
