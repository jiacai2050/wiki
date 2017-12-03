
```
brew install shadowsocks-libev
```
Mac 下不推荐安装 GUI 版本，已经很久没人维护了。安装之后编辑`/usr/local/etc/shadowsocks-libev.json`，填入 server 地址即可。
```
# 测试
ss-local -v -c /usr/local/etc/shadowsocks-libev.json
# 开机启动
brew services start shadowsocks-libev
```
为了让终端可以使用代理，需要将 http(s) 转为 socks 流量。ss 官方推荐的是 [proxychains](https://github.com/shadowsocks/shadowsocks/wiki/Using-Shadowsocks-with-Command-Line-Tools)，但是在OS X 10.11 以后引入了 [SIP安全机制](https://developer.apple.com/library/content/releasenotes/MacOSX/WhatsNewInOSX/Articles/MacOSX10_11.html)，导致无法直接使用，关闭 SIP 貌似也不可取，可以选用 [privoxy](https://www.privoxy.org/) 来替代 proxychains。（[参考](https://tech.jandou.com/to-accelerate-the-terminal.html)）
```
brew install privoxy
# privoxy 使用 8118 端口， ss 使用 1080
echo 'listen-address 0.0.0.0:8118\nforward-socks5 / localhost:1080 .' >> /usr/local/etc/privoxy/config
# 测试，查看 8118 有没有在监听， netstat -an | grep 8118
/usr/local/sbin/privoxy /usr/local/etc/privoxy/config
# 开机启动
brew services start privoxy
```
经过上面这几步 `http(s)->socks5` 就完成，下面只需要让终端走这个代理即可：
```
export http_proxy='http://localhost:8118'
export https_proxy='http://localhost:8118'

# 可以将以下函数放入 ~/.bashrc 中，方便开启/关闭代理
function proxy_off(){
    unset http_proxy
    unset https_proxy
    echo -e "已关闭代理"
}
function proxy_on() {
    export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"
    export http_proxy="http://127.0.0.1:8118"
    export https_proxy=$http_proxy
    echo -e "已开启代理"
}
```
