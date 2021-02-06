
### Need to do before

[Install Docker](https://docs.docker.com/engine/install/ubuntu/)
[Post Install for development environement](https://docs.docker.com/engine/install/linux-postinstall/)
[Install docker-compose](https://docs.docker.com/compose/install/)
[Docker Compose Completion](https://docs.docker.com/compose/completion/)


### Create the Docker volume

Create data directory 
```sh
 mkdir -p /opt/portainer/data
```

For portainer volumes : assuming /opt/portainer/data directory exists (see previous command)
```sh
 docker volume create --driver local --opt type=none --opt device=/opt/portainer/data --opt o=bind portainer-data-vol
```

### Clone this repo 

/home/..../frappe_docker_file => Clone of this repo

### Nginx configuration

Configure your local nginx, you can find sample nginx.conf.sample
Note : the redirect port is currently 51898 also set into docker-compose.xml
Do not forget to run certbot or complete nginx conf file

### Run compose
```sh
    cd /home/..../portainer/
    docker-compose up
```
go to https://your server
