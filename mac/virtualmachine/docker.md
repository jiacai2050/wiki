## Docker

```
# 安装命令
brew cask install docker
```
国内访问 Docker Hub 有时会遇到困难，最好配置[镜像加速器](https://yeasy.gitbooks.io/docker_practice/install/mirror.html)。

- http://registry.docker-cn.com


## [ENTRYPOINT vs. CMD](https://docs.docker.com/engine/reference/builder/#understand-how-cmd-and-entrypoint-interact)

| |No ENTRYPOINT|  ENTRYPOINT exec_entry p1_entry|  ENTRYPOINT [“exec_entry”, “p1_entry”] |
| ---------|---------|---------|--------- |
| No CMD|  error not allowed|  /bin/sh -c exec_entry p1_entry|  exec_entry p1_entry |
| CMD [“exec_cmd”, “p1_cmd”]|  exec_cmd p1_cmd|     /bin/sh -c exec_entry p1_entry|  exec_entry p1_entry exec_cmd p1_cmd |
| CMD [“p1_cmd”, “p2_cmd”]|    p1_cmd p2_cmd|   /bin/sh -c exec_entry p1_entry|  exec_entry p1_entry p1_cmd p2_cmd |
| CMD exec_cmd p1_cmd|     /bin/sh -c exec_cmd p1_cmd|  /bin/sh -c exec_entry p1_entry| exec_entry p1_entry /bin/sh -c exec_cmd p1_cmd |


## 常用命令

```shell

# 以交互式环境，执行一个 bash，并在 exit 后删除该 container
docker run -it --rm \
    debian:14.04 \
    bash

# 通过 volumns 在宿主机与 container 共享目录
docker run -d -v ~/nginxlogs:/var/log/nginx -p 5000:80 -i nginx

# 进入通过 -d 参数启动的后台 container
docker exec -it ${container_id} bash

# 虚悬镜像
docker images -f dangling=true
# 删除虚悬镜像
docker image prune

# 构建镜像，在具有 Dockerfile 的目录下执行
docker build -t nginx:v3 .
```

## JVM in Docker and PTRACE_ATTACH

Docker 1.10 之后加了些安全限制，导致无法 ptrace 无法使用，进而导致 jmap 无法使用。解决访问
```
docker run --cap-add=SYS_PTRACE alpine sh -c 'apk add -U strace && strace echo'

## docker-compose 自1.1.0版本后支持 cap_add
version: '2'

services:
  api:
    ...
    cap_add:
      - SYS_PTRACE
```
- https://jarekprzygodzki.wordpress.com/2016/12/19/jvm-in-docker-and-ptrace_attach/
- https://docs.docker.com/engine/reference/run/#additional-groups

## Remote APIs

```sh
配置启动参数
DOCKER_OPTS="--registry-mirror=https://registry.docker-cn.com -H tcp://0.0.0.0:4243"
curl localhost:4243/images/json 

```
- https://docs.docker.com/engine/api/v1.24/#3-endpoints

## Dockerfile

```shell
FROM java:7u121-jdk-alpine
MAINTAINER Jiacai Liu jiacai2050@gmail.com

ENV KESTREL_VERSION 2.4.1

RUN set -xe \
    \
    && wget -O kestrel.zip "http://twitter-archive.github.io/kestrel/download/kestrel-$KESTREL_VERSION.zip" \
    && mkdir /opt \
    && ls -lh \
    && unzip kestrel.zip -d /opt \
    && rm kestrel.zip \
    && ln -s /opt/kestrel-$KESTREL_VERSION /opt/kestrel


ADD ./config.scala /opt/kestrel/config.scala

WORKDIR /opt/kestrel

EXPOSE 2222 2223 2229 22133

# CMD & ENTRYPOINT doesn't expand ENV, so CMD below doesn't work
# CMD ["/usr/bin/java", "-jar", "/opt/kestrel/kestrel_2.9.2-$KESTREL_VERSION.jar", "-f", "/opt/kestrel/config.scala"]
# See: https://github.com/moby/moby/issues/4783

CMD ["sh", "-c", "/usr/bin/java -jar /opt/kestrel/kestrel_2.9.2-$KESTREL_VERSION.jar -f /opt/kestrel/config.scala"]
```
