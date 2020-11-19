
### Need to do before

[Install Docker](https://docs.docker.com/engine/install/ubuntu/)
[Post Install for development environement](https://docs.docker.com/engine/install/linux-postinstall/)
[Install docker-compose](https://docs.docker.com/compose/install/)
[Docker Compose Completion](https://docs.docker.com/compose/completion/)


### Create the Docker volume

Assuming /opt/data/frappe directory exists 
```sh
 docker volume create --driver local --opt type=none --opt device=/opt/data/frappe --opt o=bind frappe-mariadb-vol
```

### Directory sctruture

/home/..../frappe
/home/..../frappe_docker => clone of https://github.com/frappe/frappe_docker
Follow the instruction to install frappe with docker here : (https://github.com/frappe/frappe_docker/tree/develop/development) 
/home/..../frappe_docker_file => Clone of this repo

### Run compose
```sh
    cd /home/..../frappe_docker_file/frappe
    docker-compose up
```
