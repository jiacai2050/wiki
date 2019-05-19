# 安装

```
sudo apt-get install -y sysstat

## 安装后直接运行会报错

## Cannot open /var/log/sysstat/sa04: No such file or directory
## Please check if data collecting is enabled in /etc/default/sysstat

## 修改 ENABLED="true"
sudo vi /etc/default/sysstat


# 重启服务，sar 就可以使用了
sudo service sysstat restart
```



# 参考

- http://linuxtools-rst.readthedocs.io/zh_CN/latest/tool/sar.html