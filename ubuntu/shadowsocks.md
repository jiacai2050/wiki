## 科学上网

```sh
sudo apt-get install shadowsocks-libev privoxy

echo 'forward-socks5 / localhost:1080 .' >> /etc/privoxy/config
sudo systemctl restart privoxy

# 前台启动
ss-local -v -c shadowsocks-libev.json
```

