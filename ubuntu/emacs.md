# Emacs


## 国内下载镜像

- http://mirrors.ustc.edu.cn/gnu/emacs/

## ELPA

- https://mirrors.tuna.tsinghua.edu.cn/help/elpa/
- https://elpa.emacs-china.org/

## 安装

apt 软件库里面 emacs 一般都比较旧，所以需要自己编译。

```sh
wget http://mirrors.ustc.edu.cn/gnu/emacs/emacs-25.3.tar.xz
tar xf emacs-25.3.tar.xz

# install build tools
sudo apt install build-essential checkinstall

./configure
make
make install
```