# 验证 keep-alive

```
curl -Iv http://baidu.com 2>&1 | grep -i 'connection #0'

* Connection #0 to host baidu.com left intact
```
`Connection ... left intact` 说明 server 没有关闭连接，等待 client 重用。client 决定是否复用连接。

```
curl -Iv http://baidu.com --next http://baidu.com 2>&1 | grep -i '#0'

* Connected to baidu.com (39.156.69.79) port 80 (#0)
* Connection #0 to host baidu.com left intact
* Re-using existing connection! (#0) with host baidu.com
* Connected to baidu.com (39.156.69.79) port 80 (#0)
* Connection #0 to host baidu.com left intact
```
- https://serverfault.com/a/554668/252786
