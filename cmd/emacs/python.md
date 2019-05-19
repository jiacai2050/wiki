首先选择一个多 Python 环境管理工具，之前都是用的 virtualenv，最近尝试了 pyenv，相比之下功能更全面些，与 Node 的 nvm，Ruby 的 rvm 理念相同。

## 相关环境

- macOS Sierra 10.12.6
- Emacs 25.2.1
- [pyenv](https://github.com/pyenv/pyenv)
- [pyenv-virtualenv](https://github.com/pyenv/pyenv-virtualenv)
- [elpy](https://github.com/jorgenschaefer/elpy)
- [pyenv-mode](https://github.com/proofit404/pyenv-mode)

![Emacs as Python IDE](http://upload-images.jianshu.io/upload_images/45329-6e1952c77aa25743.gif?imageMogr2/auto-orient/strip)


## 步骤

### 安装 `pyenv` `pyenv-virtualenv`

```sh
brew install pyenv pyenv-virtualenv
```
然后在`~/.bashrc`里面添加

```sh
export PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi
```

然后使用 pyenv 来安装指定版本的 Python

```sh
pyenv install <some.version>

# 查看所以可选择安装的版本
pyenv install -l

# 使用 pyenv 管理 virtualenv
pyenv virtualenv <env-name>

# 设置全局默认 Python，可以指定虚拟环境或者某个版本
pyenv global <env-name or some.version>

# 在某一个项目下，固定某个环境或版本，它会在项目根目录下添加 `.python-version` 文件
pyenv local <env-name or some.version>
```

### 安装Emacs mode `elpy` `pyenv-mode`

elpy 安装稍微麻烦下，需要指定 archives
```
(add-to-list 'package-archives
             '("elpy" . "https://jorgenschaefer.github.io/packages/"))
```
然后安装、初始化就可以了
```
M-x package-refresh-contents
M-x package-install RET elpy RET

;; 为了使用一些额外功能，需要安装一些 pip 包
pip install jedi flake8 importmagic autopep8 rope

;; 初始化
(package-initialize)
(elpy-enable)
```
这时 elpy 是不会使用 pyenv 指定的环境的，需要安装 pyenv-mode
```
M-x package-install RET pyenv-mode

# 指定虚拟环境或版本
M-x pyenv-mode-set 
# 运行解释器
M-x run-python
```

## 参考
- https://smythp.com/emacs/python/2016/04/27/pyenv-elpy.html
- https://github.com/jorgenschaefer/elpy/wiki/Features

