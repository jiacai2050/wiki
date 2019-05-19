# MacOS

## 安装

推荐使用 [rbenv](https://github.com/rbenv/rbenv) 进行多版本管理
```
brew install rbenv

# 之后在 .bash_profile 中添加
export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


#  管理 gems 依赖
gem install bundler
```

## rbenv 常用命令

```
# 远端所有可安装的版本
rbenv install -l

# 安装指定版本
rbenv install 2.0.0-p247

# 查看本地安装的 ruby 版本
rbenv versions

# 设置当前目录的 ruby 版本，会在当前目录生成一个 .ruby-version 文件
rbenv local 1.9.3-p327

# 取消当前目录默认 ruby 版本
rbenv local --unset

# 设置全局默认 ruby 版本
rbenv global 1.8.7-p352
```

## pyenv-virtualenv 常用命令

``` 
# 用指定版本 python 生成 venv
pyenv virtualenv 2.7.10 my-virtual-env-2.7.10

# 用默认版本 生成 venv
pyenv virtualenv venv34

# 查看所有的 venv
pyenv virtualenvs

# 进入／退出 venv

pyenv activate <name>
pyenv deactivate

# 删除 venv
pyenv uninstall my-virtual-env
```
