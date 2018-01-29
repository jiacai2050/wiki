# apt-get

为了提高下载速度，需要配置国内源 /etc/apt/sources.list

- https://lug.ustc.edu.cn/wiki/mirrors/help/ubuntu
- http://mirrors.163.com/.help/ubuntu.html
- https://mirror.tuna.tsinghua.edu.cn/help/ubuntu/
- https://mirrors.aliyun.com/help/ubuntu

```
sudo sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
```

