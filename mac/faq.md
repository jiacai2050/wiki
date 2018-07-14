## 清 dns 缓存

```
sudo killall -HUP mDNSResponder
```

- https://support.apple.com/en-us/HT202516
## 锁屏

习惯 Windows 的用户，有一个很方便的锁屏快捷键 Win + L，但是 Mac 在升级到某个版本后，突然间取消了锁屏的快捷键，可以参考知乎上这个解决方法：

- [Mac OS X 如何才能用快捷键锁屏?](https://www.zhihu.com/question/20094264/answer/153670327)

如果希望 sleep 再次唤醒时需要输入密码，可以修改一处设置：

![系统设置--安全与隐私--通用](/images/mac_sleep_lock.png)

## 修改 maxfiles

- https://superuser.com/questions/302754/increase-the-maximum-number-of-open-file-descriptors-in-snow-leopard/1171023#1171023

## 不能写 NTFS

用惯了 Windows 的大家都习惯用 NTFS 文件系统格式，但是很遗憾，这个文件系统是微软自己搞得，不是开放的，所以 Mac 是不支持的，如果你以前的 NTFS 格式的硬盘放到 Mac 上，会发现只能进行读操作，不能写入，这属于正常现象，不要惊慌。

解决的方法也很简单，把移动硬盘格式化成FAT32(单个文件大小不能超过4G)或FAText 格式都可以，Mac 自带的磁盘工具就可以进行格式转化，当然你需要先把移动硬盘上的数据拷贝出来。

## Wi-Fi 时常中断

Mac 生于乔帮主之手时，为了凸显尊贵，接口与一般的电脑有很大不同。常见的网线没办法直接连接 Mac 电脑，需要单独购买一个[以太网转接器](http://www.apple.com/cn/shop/product/MC704FE/A/apple-usb-ethernet-adapter)，所以大部分同学都是使用无线连接，但 Mac 这里应该是有个 bug，而且是很久的 bug，我用 Mac 两年了，偶尔会遇到几次，网上解决的方法有如下几种：

1. 修改网络位置，不是其默认的“自动”就好
2. 修改路由器，把无线信道改为6或9
3. 关闭蓝牙，Mac 中，同时打开蓝牙与 Wi-Fi 会冲突。[详情](http://apple.stackexchange.com/a/162406/103966)

如果你的 Mac 也遇到了 Wi-Fi 问题，可以试试上面三个解决方法。

## du 磁盘大小

```
du -sh some-directory 
```

检查的是这个目录的物理大小，一个 1K 的文件，会因 文件碎片/sector/block size 等因素，在磁盘上占用的空间一般都要大于 1K。

- https://superuser.com/questions/382120/mac-os-x-not-reporting-directory-sizes-correctly
