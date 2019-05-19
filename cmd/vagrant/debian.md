## Vagrantfile for Debian 8

```ruby
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
  config.vm.box = "my-box"
  # config.disksize.size = '50GB'

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
    vb.memory = "4096"
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
  config.vm.provision "file", source: "./lein", destination: "lein"

  config.vm.provision "shell", inline: <<-SHELL
    mv lein /usr/local/bin/
    sudo cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
    curl -L https://get.daocloud.io/docker/compose/releases/download/1.17.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
    cat > /etc/apt/sources.list << EOF
deb http://mirrors.163.com/debian/ jessie main non-free contrib
deb http://mirrors.163.com/debian/ jessie-updates main non-free contrib
deb http://mirrors.163.com/debian/ jessie-backports main non-free contrib
deb http://mirrors.163.com/debian-security/ jessie/updates main non-free contrib
deb [arch=amd64] https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/debian jessie stable
# deb-src http://mirrors.163.com/debian/ jessie main non-free contrib
# deb-src http://mirrors.163.com/debian/ jessie-updates main non-free contrib
# deb-src http://mirrors.163.com/debian/ jessie-backports main non-free contrib
# deb-src http://mirrors.163.com/debian-security/ jessie/updates main non-free contrib

EOF

    apt-get update
    apt-get -y install apt-transport-https ca-certificates curl gnupg2 software-properties-common
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
    cat > /etc/docker/daemon.json << EOF
{
    "registry-mirrors":["docker.mirrors.ustc.edu.cn"]
}

EOF
cat >> ~/.bash_aliases << EOF
alias docker='sudo docker'
alias docker-compose='sudo docker-compose'
alias dc='sudo docker-compose'

EOF

    cat >> /home/vagrant/.bashrc <<EOF

export JAVA_HOME=/vagrant/jdk1.8.0_152
export PATH=$PATH:/vagrant/jdk1.8.0_152/bin
EOF

    apt-get update
    apt-get -y install emacs docker-ce
  SHELL

end

```
