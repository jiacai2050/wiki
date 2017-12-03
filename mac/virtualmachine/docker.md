## Docker

```
# 安装命令
brew cask install docker
```
国内访问 Docker Hub 有时会遇到困难，最好配置[镜像加速器](https://yeasy.gitbooks.io/docker_practice/install/mirror.html)。

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

# 虚悬镜像
docker images -f dangling=true
# 删除虚悬镜像
docker image prune

# 构建镜像
docker build -t nginx:v3 .

```

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