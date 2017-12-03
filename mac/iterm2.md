### 终端 [iTerm 2](http://iterm2.com/)
```
# 安装命令
brew cask install iterm2
```
Mac自带的终端不是很强，程序员们需要一个强劲的终端来工作，于是有了 iTerm2。需要设置一项：Left Option act as +Esc（Preferences-->Profiles-->Keys），这样 Option 就可以用作 Meta 键了。

| 快捷键| 功能 |
| ---------|--------- |
|F11 | 查看桌面 |
|F12 | 查看Dashboard|
|Cmd + <- | HOME |
|Cmd + -> | END |
|Shift + Control + 电源键 | 锁屏  （Windows 下为Win+L） |
|Cmd + Option + esc | 强制关闭程序 （Windows 下为Ctrl+Alt+Delete）|
|Cmd + ~ | [在同一应用不同窗口切换](https://apple.stackexchange.com/questions/193937/shortcut-for-toggling-between-different-windows-of-same-app) |
|Cmd + Option + V | [Finder 里面剪切](http://apple.stackexchange.com/questions/12391/why-is-it-not-possible-to-use-the-cut-command-to-manipulate-a-file-in-the-find) |
| Cmd + D| 垂直分屏 |
| Cmd + Shift + D| 水平分屏 |
| Cmd + T| 开多个Tab |
| Cmd + 数字| 在多个Tab之间进行切换 |
| Ctrl + r| 搜索历史命令 |
| !!| 执行上条命令 |
| Option + F/B| 向前、向后按字移动。Bash Shell 光标默认按照 Emacs 风格移动，也可改为 VIM，可参考[Modifying the Bash Shell with the set Command](http://www.hypexr.org/bash_tutorial.php#set)。 |
| Ctrl+x Ctrl+e| 调用[默认编辑器去编辑一个特别长的命令](http://www.commandlinefu.com/commands/view/1446/rapidly-invoke-an-editor-to-write-a-long-complex-or-tricky-command) |


当然，说到了 iTerm2，不得不提到终端复用软件 [tmux](https://tmux.github.io/)，tmux 默认配置文件在 Mac 上很别扭，你可以参考我这里的[配置文件](https://github.com/jiacai2050/conf/blob/master/.tmux.conf)，这样 tmux 就可以像 vim 一样实现各种分屏的效果了。如果你还不知道 tmux 为何物，强烈推荐你看这个13分钟的[视频](http://pan.baidu.com/s/1gdLZzB9)，绝对物超所值，感谢 [happypeter](http://haoduoshipin.com/u/happypeter) 的分享。

我现在用的主题是：[Tomorrow Night](https://github.com/chriskempson/tomorrow-theme/blob/master/iTerm2/Tomorrow%20Night.itermcolors)。

### ~/.bashrc

Linux 一般通过`~/.bashrc`进行环境变量的配置，但是在 Mac 下配置后，发现根本没有效果，这是为什么呢？
其实这是个比较基础的问题，shell有两种：登录式shell与非登录式shell，直观理解，登录(login)式shell就是在你打开shell要求你输入用户名与密码的shell，我们在使用桌面Linux时一般只在登录时接触到这种shell，等我们进入系统后，再打开的Terminal就是非登录式shell了。这两种 shell 读取配置的文件是不同的：

- 登录式Shell启动时会去读取`~/.profile`文件（Redhat、Mac上为 `~/.bash_profile`）
- 非登录式Shell会去读取`~/.bashrc`文件

这也就解释了为什么在 Linux 系统上只需要修改 `~/.bashrc` 后即可生效的原因。但在 Mac 上有些不同，开机后再通过 Terminal.app（或iTerm.app） 打开终端时，这时的 shell 是登录式shell，因为Terminal.app（或iTerm.app）这个应用程序是通过`/usr/bin/login`这个命令打开终端的，所以不会去`source ~/.bashrc`了。
解决方法也很简单，在~/.bash_profile加上下面一句代码就ok了
```
[ -r ~/.bashrc ] && source ~/.bashrc
```

Mac下`ls`命令默认是没有颜色的，不是很直观，可以自己设置一个alias，参考[链接](http://apple.stackexchange.com/questions/33677/how-can-i-configure-mac-terminal-to-have-color-ls-output)
```
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
alias ls='ls -FG'
alias ll='ls -l'
```
为了在命令行提示符中显示时间，可以设置`PS1`变量
```
export PS1="\n\e[1;37m[\e[m\e[1;35m\u\e[m\e[1;36m@\e[m\e[1;37m\h\e[m \e[1;33m\t\e[m \w\e[m\e[1;37m]\e[m\e[1;36m\e[m\n\$ "

# 效果如下
[liujiacai@macbook 22:02:13 ~]
```


### 一些实用命令

```
# 修改hostname
sudo scutil --set HostName <name>
# 查看USB设备
system_profiler SPUSBDataType
```

下面的命令需要通过`brew`进行安装后在使用
```
# 查看网络请求
brew install httpstat
$ httpstat baidu.com
Connected to 180.149.132.47:80 from 172.17.10.80:54727

HTTP/1.1 200 OK
Date: Sat, 14 Jan 2017 13:49:16 GMT
Server: Apache
Last-Modified: Tue, 12 Jan 2010 13:48:00 GMT
ETag: "51-47cf7e6ee8400"
Accept-Ranges: bytes
Content-Length: 81
Cache-Control: max-age=86400
Expires: Sun, 15 Jan 2017 13:49:16 GMT
Connection: Keep-Alive
Content-Type: text/html

Body stored in: /var/folders/2g/fxz_98ks0lgc79sjp5vn5cxc0000gn/T/tmpsawHq4

  DNS Lookup   TCP Connection   Server Processing   Content Transfer
[    69ms    |      37ms      |       33ms        |        0ms       ]
             |                |                   |                  |
    namelookup:69ms           |                   |                  |
                        connect:106ms             |                  |
                                      starttransfer:139ms            |
                                                                 total:139ms

# Swiss Army Knife for macOS !
brew install m-cli
$ m trash status
Size:  51G
Number of files: 252172

```
