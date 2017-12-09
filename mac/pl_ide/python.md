# Python

推荐使用 [pyenv](https://github.com/pyenv/pyenv) 进行多版本管理
```
brew install pyenv pyenv-virtualenv

# 之后在 .bash_profile 中添加
export PYENV_ROOT="${HOME}/.pyenv"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
```

## pyenv 常用命令

```
# 安装 2.7.8
pyenv install 2.7.8

# 远端所有可安装的版本
pyenv install -l

# 查看本地安装的 python 版本
pyenv versions

# 设置当前目录的 python 版本，会在当前目录生成一个 .python-version 文件
pyenv local 2.7.6

# 设置全局默认版本，会写入 ~/.pyenv/version
pyenv global 2.7.6
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