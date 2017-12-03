
[Vagrant](https://github.com/hashicorp/vagrant) 是一款非常简单且实用的虚拟机命令行工具，支持市面上主流虚拟机，当然包括 VirtualBox，安装方式如下：

```
brew cask install vagrant   # 虚拟机管理工具，方便命令行操作
```

为了介绍其使用，需要先了解两个名次：

- [provider](https://www.vagrantup.com/intro/getting-started/providers.html)，vagrant 是一个通用的虚拟机管理工具，不仅仅是 virtualbox，还可以是 vmare aws，这些统称为 provider
- [boxes](https://www.vagrantup.com/intro/getting-started/boxes.html)，为了避免每次都是从头开始创建虚拟机，vagrant 提供 box 作为基本构件，可以根据需要构建自己的box。类似于 docker 里面的 image

## 常用命令

了解了上面两个概念，下面看看基于用法：

```bash
cd your-project
vagrant init hashicorp/precise64 # 安装 64 位的 Ubuntu 12.04 
vagrant up # 启动
vagrant ssh  # 进入 guest

# 退出 guest 后，可选择
vagrant suspend    # 休眠
vagrant halt       # 关机
vagrant destroy --force   # 销毁该 guest
```

## 注意事项

### 磁盘大小

Vagrant 管理的 guest 默认系统磁盘一般是 10G，20G，如果觉得比较小，可以试试下面这个插件：

- https://github.com/sprotheroe/vagrant-disksize

我在 guest 为 debian 8 下测试没成功，大家可以试试运气。其他方法：

- https://gist.github.com/christopher-hopper/9755310
- https://medium.com/@phirschybar/resize-your-vagrant-virtualbox-disk-3c0fbc607817
- https://askubuntu.com/questions/317338/how-can-i-increase-disk-size-on-a-vagrant-vm/318711


### [同步目录](https://www.vagrantup.com/intro/getting-started/synced_folders.html)

Vagrant 在启动时，会默认把当前目录挂载（mount）在 guest 的 `/vagrant` 目录，挂的方式有这么几种：nfs，rsync，smb，virtualbox，vagrant 会自动选择最佳的方式。如果 provider 是 Virtualbox，它会优先选择 virtualbox 共享目录的方式，但这里需要 box 提前安装了 [VirtualBox Guest Additions](https://www.virtualbox.org/manual/ch04.html)，否则它会用 rsync 的方式，如果当前文件较多，这里启动时会比较慢，甚至可能出错。
不过幸好，官方提供的 hashicorp/precise64 默认安装了，所以基本不用担心。如果使用其他的 box，可参考官方手动安装的[文档](https://www.vagrantup.com/docs/virtualbox/boxes.html#to-install-via-the-command-line-)，基本分为2步：


1. 安装内核头文件
```
sudo apt-get install linux-headers-$(uname -r) build-essential dkms
```
这一步如果出现类似`E: Unable to locate package linux-headers-3.16.0-4-amd64`的错误，说明当前源内没有当前系统的头文件，需要自行去 Google 找，Debian 的[在这里](https://packages.debian.org/search?searchon=names&keywords=linux-headers)

2. 安装 Additions
```
wget http://download.virtualbox.org/virtualbox/5.1.26/VBoxGuestAdditions_5.1.26.iso
sudo mkdir /media/VBoxGuestAdditions
sudo mount -o loop,ro VBoxGuestAdditions_5.1.26.iso /media/VBoxGuestAdditions
sudo sh /media/VBoxGuestAdditions/VBoxLinuxAdditions.run
rm VBoxGuestAdditions_5.1.26.iso
sudo umount /media/VBoxGuestAdditions
sudo rmdir /media/VBoxGuestAdditions
```
示例用的是5.1.26版本，最好与本地安装的 Virtualbox 版本一致。


为了方便今后操作，最好把安装好 Additions 的 box [打包一下](https://www.vagrantup.com/docs/boxes/base.html)，方便以后使用，方法也很简单：

```
vagrant package --output mybox.box
# 安装到本地
vagrant box add mybox mybox.box
# 使用
vagrant init mybox
```
最后，可以发布到 [Vagrant Cloud](https://www.vagrantup.com/docs/boxes/base.html#distributing-the-box) 方便不同机器复用。我自己制作了一个基于 debian8 的 box，安装上了 [Clojure 开发环境](https://app.vagrantup.com/jiacai2050/boxes/debian8)，一键即可安装。