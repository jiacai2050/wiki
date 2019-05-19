## dpkg

dpkg is a package manager for Debian-based systems. It can install, remove, and build packages, but unlike other package management systems, it cannot automatically download and install packages or their dependencies. 
```
sudo apt-get install build-essential

# list all packages installed on the system, from a terminal prompt type:
dpkg -l

# see all the files the package installed onto your system, do this:
dpkg-query -L <package_name>

# see the files a .deb file will install
dpkg-deb -c <package_name.deb>

```

## GCC 8

```
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt-get update
sudo apt-get install gcc-8 g++-8
gcc-8 --version

# 默认使用 gcc-8
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 800 --slave /usr/bin/g++ g++ /usr/bin/g++-8
```
- https://askubuntu.com/a/1087116
- http://tuxamito.com/wiki/index.php/Installing_newer_GCC_versions_in_Ubuntu

```
sudo update-alternatives --remove-all gcc


sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 90 --slave /usr/bin/g++ g++ /usr/bin/g++-8
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 80 --slave /usr/bin/g++ g++ /usr/bin/g++-6
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 70 --slave /usr/bin/g++ g++ /usr/bin/g++-7


sudo update-alternatives --config gcc
```

### oom-killer log

- https://stackoverflow.com/questions/9199731/understanding-the-linux-oom-killers-logs

### Server guide

- https://help.ubuntu.com/lts/serverguide/
