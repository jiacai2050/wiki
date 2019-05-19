## ControlMaster

对于 OpenSSH 4.0 以及之后的版本，引入一新功能 ControlMaster，可以复用之前已经登录的连接，建议开启：
```
Host *
  ControlMaster auto
  ControlPath ~/.ssh/master-%r@%h:%p
  ControlPersist 60m
```
参考：
- [Accelerating OpenSSH connections with ControlMaster](https://www.linux.com/news/accelerating-openssh-connections-controlmaster)
- [https://en.wikibooks.org/wiki/OpenSSH/Cookbook/Multiplexing](OpenSSH/Cookbook/Multiplexing)

## MacOS

在 macOS/OS X 截止到 Yosemite，ssh-agent 会一直记住 `ssh-add -K` 添加的 key，即使重启 keychain，ssh-agent 也会自动去读取保存在 keychain 中的密码（passphrase）。但在 Sierra 中，重启 keychain 后，ssh-agent 就不会去读取了。Apple 开发者也对这一现象作出[回应](https://openradar.appspot.com/27348363)：

> That’s expected. We re-aligned our behavior with the mainstream OpenSSH in this area. 

解决办法也很简单，将`ssh-add -A` 放到 `~/.bashrc` 里面就可以了。除了这种方式，还可以在`~/.ssh/config`里面加入如下配置：
```
Host * (asterisk for all hosts or add specific host)
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile <key> (e.g. ~/.ssh/userKey)
```
参考：
- [Saving SSH keys in macOS Sierra keychain](https://github.com/jirsbek/SSH-keys-in-macOS-Sierra-keychain)

## Ubuntu

```
sudo apt-get install keychain

# ~/.bashrc
/usr/bin/keychain $HOME/.ssh/id_ecdsa
source $HOME/.keychain/$HOSTNAME-sh
```
- https://www.cyberciti.biz/faq/ubuntu-debian-linux-server-install-keychain-apt-get-command/
