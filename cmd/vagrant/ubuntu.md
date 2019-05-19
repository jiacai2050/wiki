## Vagrantfile for Ubuntu 18.04 推荐使用

```ruby
# coding: utf-8
# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  # config.vm.box = "ubuntu/trusty64"
  config.vm.box = "tsing/bionic"
  config.disksize.size = '100GB'

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"
  config.vm.synced_folder ".", "/vagrant"
  config.vm.synced_folder "~/.m2", "/home/vagrant/.m2"
  config.vm.synced_folder "~/.lein", "/home/vagrant/.lein"
  # config.vm.synced_folder "~/.emacs.d/", "/home/vagrant/.emacs.d"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = false
    vb.memory = "8192"
    vb.cpus = 2
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "file", source: "~/.gitconfig", destination: ".gitconfig"
  config.vm.provision "file", source: "~/.tmux.conf", destination: ".tmux.conf"
  config.vm.provision "file", source: "~/.bashrc", destination: ".bash_aliases"
  # config.vm.provision "file", source: "./lein", destination: "lein"

  config.vm.provision "shell", inline: <<-SHELL
    sudo cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
    cat > /etc/apt/sources.list << EOF
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-security main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-security main restricted universe multiverse

# 预发布软件源，不建议启用
# deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-proposed main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-proposed main restricted universe multiverse
EOF

    apt-get update
    apt-get -y install apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://mirrors.ustc.edu.cn/docker-ce/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://mirrors.ustc.edu.cn/docker-ce/linux/ubuntu $(lsb_release -cs) stable"

cat >> ~/.bash_aliases << EOF
alias docker='sudo docker'
alias docker-compose='sudo docker-compose'
alias dc='sudo docker-compose'

EOF
    apt-get update
    apt-get -y install emacs docker-ce
    cat >> /etc/default/docker << EOF
DOCKER_OPTS="--registry-mirror=https://registry.docker-cn.com"

EOF
    service docker restart

    JAVA_SHA256_SUM=6d34ae147fc5564c07b913b467de1411c795e290356538f22502f28b76a323c2

    JAVA_HOME=/opt/jdk/jdk1.8.0_192
    mkdir -p /opt/jdk
    cd /opt
    wget http://lc-lhzo7z96.cn-n1.lcfile.com/1551684078102 -O java.tar.gz
    echo "$JAVA_SHA256_SUM  java.tar.gz" | sha256sum -c -
    tar -zxf java.tar.gz -C /opt/jdk
    cd $JAVA_HOME/bin
    for cmd in *; do
        sudo update-alternatives --install /usr/bin/$cmd $cmd $JAVA_HOME/bin/$cmd 100;
    done
    rm -rf /opt/java.tar.gz
  SHELL

end

```
