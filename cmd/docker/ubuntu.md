## 安装

```sh
curl -L https://get.daocloud.io/docker/compose/releases/download/1.17.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

apt-get -y install apt-transport-https ca-certificates curl gnupg2 software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
cat > /etc/docker/daemon.json << EOF
{
    "registry-mirrors":["docker.mirrors.ustc.edu.cn"]
}

EOF

apt-get update
sudo apt-get install docker-ce
```
