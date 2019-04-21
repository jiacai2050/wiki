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

对于 10.14 版本之后的 macOS，在从源码 install 时会报下面的错误：

```
clang: error: linker command failed with exit code 1 (use -v to see invocation)
building '_tkinter' extension
clang -fno-strict-aliasing -g -O2 -DNDEBUG -g -fwrapv -O3 -Wall -Wstrict-prototypes -I. -IInclude -I./Include -I/usr/local/opt/readline/include -I/usr/local/opt/readline/include -I/usr/local/opt/openssl/include -I/Users/liujiacai/.pyenv/versions/2.7.10/include -DWITH_APPINIT=1 -I/System/Library/Frameworks/Tcl.framework/Headers -I/System/Library/Frameworks/Tcl.framework/Versions/Current/PrivateHeaders -I/System/Library/Frameworks/Tk.framework/Headers -I/System/Library/Frameworks/Tk.framework/Versions/Current/PrivateHeaders -I/usr/X11R6/include -I/private/var/folders/hj/z2gkhrb17wvbytm6p79gmq1c0000gn/T/python-build.20190313145928.17581/Python-2.7.10/Mac/Include -I. -IInclude -I./Include -I/usr/local/opt/readline/include -I/usr/local/opt/openssl/include -I/Users/liujiacai/.pyenv/versions/2.7.10/include -I/usr/local/include -I/private/var/folders/hj/z2gkhrb17wvbytm6p79gmq1c0000gn/T/python-build.20190313145928.17581/Python-2.7.10/Include -I/private/var/folders/hj/z2gkhrb17wvbytm6p79gmq1c0000gn/T/python-build.20190313145928.17581/Python-2.7.10 -c /private/var/folders/hj/z2gkhrb17wvbytm6p79gmq1c0000gn/T/python-build.20190313145928.17581/Python-2.7.10/Modules/_tkinter.c -o build/temp.macosx-10.14-x86_64-2.7/private/var/folders/hj/z2gkhrb17wvbytm6p79gmq1c0000gn/T/python-build.20190313145928.17581/Python-2.7.10/Modules/_tkinter.o -framework Tk
clang: warning: -framework Tk: 'linker' input unused [-Wunused-command-line-argument]
In file included from /private/var/folders/hj/z2gkhrb17wvbytm6p79gmq1c0000gn/T/python-build.20190313145928.17581/Python-2.7.10/Modules/_tkinter.c:71:
/Library/Developer/CommandLineTools/SDKs/MacOSX10.14.sdk/usr/include/tk.h:78:11: fatal error: 'X11/Xlib.h' file not found
#       include <X11/Xlib.h>
                ^~~~~~~~~~~~
1 error generated.   

Python build finished, but the necessary bits to build these modules were not found:
_bsddb             _sqlite3           bsddb185        
dbm                dl                 imageop         
linuxaudiodev      nis                ossaudiodev     
spwd               sunaudiodev        zlib            
To find the necessary bits, look in setup.py in detect_modules() for the module's name.


Failed to build these modules:
_Qt                _tkinter                                                                                                                                                                                                    

running build_scripts
running install_lib
```

这是由于 CTL 把一些头文件移动了位置，需要单独额外按照，方式如下：

```
sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /
```

- https://github.com/pyenv/pyenv/wiki/Common-build-problems
- https://developer.apple.com/documentation/xcode_release_notes/xcode_10_release_notes#3035624

```
# 安装 2.7.8
pyenv install 2.7.8

# 推荐选择国内源加速
v=3.7.1;wget http://mirrors.sohu.com/python/$v/Python-$v.tar.xz -P ~/.pyenv/cache/;
pyenv install $v

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
