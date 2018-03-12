### 抓包工具 [Wireshark](https://www.wireshark.org/)

```
# 安装命令
brew cask install wireshark
```
也许是最强大的抓包工具，从其名字上就能体现出：wire（线路）+ shark（鲨鱼）。但这个软件初次使用时有些难度，最重要的是区分两个概念：
- `capture filter`，在抓包开始时指定。
![capture filter](https://img.alicdn.com/imgextra/i1/581166664/TB2dcIUcHXlpuFjSszfXXcSGXXa_!!581166664.png)
常见表达式

```
# Capture only traffic to or from IP address 172.18.5.4:
host 172.18.5.4

# Capture traffic to or from a range of IP addresses:
net 192.168.0.0/24

# Capture non-HTTP and non-SMTP traffic on your server (both are equivalent):
host www.example.com and not (port 80 or port 25)
host www.example.com and not port 80 and not port 25

# Capture traffic within a range of ports  with newer versions of libpcap (0.9.1 and later):
tcp portrange 1501-1549

#Capture only IPv4 traffic - the shortest filter, but sometimes very useful to get rid of lower layer protocols like ARP and STP:
ip

# Capture only unicast traffic - useful to get rid of noise on the network if you only want to see traffic to and from your machine, not, for example, broadcast and multicast announcements:
not broadcast and not multicast
```
- `display filter`，在抓取一定包后进行过滤。
![display filter](https://img.alicdn.com/imgextra/i2/581166664/TB2L5U0cHJkpuFjy1zcXXa5FFXa_!!581166664.png)
常见表达式

```
ip.dst_host == 192.168.30.103 and tcp.dstport == 80

ip.addr == 10.43.54.65
# is equivalent to
ip.src == 10.43.54.65 or ip.dst == 10.43.54.65
```


- [Getting a Packet Trace](https://developer.apple.com/library/content/qa/qa1176/_index.html#//apple_ref/doc/uid/DTS10001707-CH1-SECNOTES)
- [Capture a packet trace using Terminal on your Mac](https://support.apple.com/en-us/HT202013)