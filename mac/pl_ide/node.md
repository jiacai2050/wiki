# Node

推荐使用 [nvm](https://github.com/creationix/nvm) 进行多版本管理
```
brew install nvm

# 之后在 .bash_profile 中添加
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR" ]] && source "/usr/local/opt/nvm/nvm.sh"
```

## nvm 常用命令

```
# 安装某个版本
nvm install node-${version}

# 查看本地安装的 node 版本
nvm ls

# 远端可安装的  long-term support 版的 node
nvm ls-remote --lts

# 把某个版本设为默认 node
nvm alias default <some-version>

# 迁移
nvm install node-${new-version} --reinstall-packages-from=node-${old-version}

# 卸载某个版本
nvm uninstall node-${version}
```