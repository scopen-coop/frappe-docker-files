
### Need to do before

[Install Docker](https://docs.docker.com/engine/install/ubuntu/)
[Post Install for development environement](https://docs.docker.com/engine/install/linux-postinstall/)
[Install docker-compose](https://docs.docker.com/compose/install/)
[Docker Compose Completion](https://docs.docker.com/compose/completion/)


### Create the Docker volume

Create directory if not exists
```sh
 mkdir -p  /opt/data/frappe15/mysql
```
Assuming now /opt/data/frappe15/mysql directory exists 
```sh
 docker volume create --driver local --opt type=none --opt device=/opt/data/frappe15/mysql --opt o=bind frappe15-mariadb-vol
```

Create directory if not exists
```sh
 mkdir -p  /opt/data/frappe15/redis_cache;
 mkdir -p  /opt/data/frappe15/redis_queue;
 mkdir -p  /opt/data/frappe15/redis_socketio; 
```

Assuming now /opt/data/frappe15/redis_cache/, /opt/data/frappe15/redis_queue/,  /opt/data/frappe15/redis_socketio directories exists
```sh
docker volume create --driver local --opt type=none --opt device=/opt/data/frappe15/redis_cache --opt o=bind frappe15-redis-cache-data;
docker volume create --driver local --opt type=none --opt device=/opt/data/frappe15/redis_queue --opt o=bind frappe15-redis-queue-data;
docker volume create --driver local --opt type=none --opt device=/opt/data/frappe15/redis_socketio --opt o=bind frappe15-redis-socketio-data;
```

### Network

To name it to use it for others application like metabase

```sh
docker network create frappe-network
```

### Directory sctruture

/home/..../frappe

/home/..../frappe_docker_dev => clone of https://github.com/frappe/frappe_docker

/home/..../frappe_docker_file => Clone of this repo

Then follow the step given by official documentation
[ERPNext/Frappe dev env install](https://github.com/frappe/frappe_docker/tree/develop/development)

### Run compose

```sh
    cd /home/..../frappe_docker_file/frappe
    docker-compose up
```

Enter into bash of the container
```sh
docker exec -e "TERM=xterm-256color" -w /workspace/development -it frappe15_frappe_1 bash
```

inside container bash

```sh
bench init --skip-redis-config-generation --frappe-branch version-15 frappe-bench;
cd frappe-bench;

bench set-config -g db_host mariadb;
bench set-config -g redis_cache redis://redis-cache:6379;
bench set-config -g redis_queue redis://redis-queue:6379;
bench set-config -g redis_socketio redis://redis-socketio:6379;
bench set-config -g server_script_enabled 1;

bench new-site [url without https:// probably local site name erpnext.local manage into /etc/hosts for local dev env] --mariadb-root-password 123 --admin-password admin --mariadb-user-host-login-scope='%' --db-name [dbname];

bench get-app --branch develop erpnext https://github.com/frappe/erpnext.git;
bench --site [url without https:// probably local site name erpnext.local manage into /etc/hosts for local dev env] install-app erpnext;
bench --site [url without https:// probably local site name erpnext.local manage into /etc/hosts for local dev env] set-config developer_mode 1;
bench --site [url without https:// probably local site name erpnext.local manage into /etc/hosts for local dev env] clear-cache;

bench --site all enable-scheduler;

```

If you'r going to intall more than one site

```sh
bench config dns_multitenant on
```


Once first bench install is done you can revert docker-compose

```yaml
frappe:
    image: frappe/bench:latest
    # command: bash -c "cd frappe-bench;bench start"
    command: sleep infinity
```
by
```yaml
frappe:
    image: frappe/bench:latest
    command: bash -c "cd frappe-bench;bench start"
    # command: sleep infinity
```

### For GreenMail  (IMAP and SMTP embedded server)
Setup Frappe Email Domain
https://0.0.0.0:8000/app/email-domain/example.com

IMAP
Server : greenmail 
port : 3143
use IMAP : yes

SMTP
Server : greenmail 
port : 3025

In Green mail : Create user
http://0.0.0.0:6081/#post-/api/user
or run on host
```
curl -X POST "http://0.0.0.0:6081/api/user" -H "accept: application/json" -H "content-type: application/json" -d '{"email":"notifications@example.com","login":"notifications@example.com","password":"notifications@example.com"}';
curl -X POST "http://0.0.0.0:6081/api/user" -H "accept: application/json" -H "content-type: application/json" -d '{"email":"replies@example.com","login":"replies@example.com","password":"replies@example.com"}'
```

Setup Frappe Account the password you just set in GreenMail
https://0.0.0.0:8000/app/email-account/view/list

### For Roundcube (to check email)

with the email account you've created in Greenmail

http://0.0.0.0:6082

### License

GNU/General Public License (see [license.txt](../license.txt))

This project is licensed as GNU General Public License (v3).

By contributing to this project, you agree that your contributions will be licensed under its GNU General Public License (v3).
