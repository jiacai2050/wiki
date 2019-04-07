MacBook Pro 兼具命令行的高效与图形界面的酷炫，实在是程序员必备利器。本系列起源于我的博客[《MacBook 最佳实践》](http://liujiacai.net/blog/2014/11/23/first-taste-of-macbook/)，但是里面的内容越来越臃肿，不是很方便浏览，所以迁到 GitBook，希望对大家使用 rMBP 有所帮助。

![MacBook Pro 你值得拥有](https://dn-mhke0kuv.qbox.me/cb49a18efb421a9624c5.png)


日常使用的软件首选通过`App Store`进行安装，默认安装在`/Applications`下，个人从互联网上单独下载的软件放在这里面即可出现在`Launchpad`中找到。
对于通过`App Store`安装的软件，在`Launchpad`界面，按住`Option`键可进行删除。但是需要注意一点的时，应用程序一般都会有些历史文件，存放的位置有如下三处

- `~/Library/Application Support/<Application name>`
- `~/Library/Cache/<Application name>`
- `~/Library/Preferences/<Application name>.plist`

使用`find + grep`的方式就能轻松找出来了。网上也有诸如[AppCleaner](http://appcleaner.en.softonic.com/mac)、[AppZapper](http://www.appzapper.com/)的小软件，大家可以根据需要自取之。

> PS: Mac 下有很多非常实用的收费软件，我个人用的并不多，这里就不在列举了。
大家可以参考知乎上的 [macOS (OS X) 平台上有哪些值得推荐的常用软件？](https://www.zhihu.com/question/19550256)


## Homebrew 

> The missing package manager for macOS

对于开发者，推荐使用 [Homebrew](http://brew.sh/) 进行软件包管理。`brew`相当于`Ubuntu`下的`apt-get`，`CentOS`中的`yum`。非常方便实用，一条命令即可安装：

```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
- `brew install <cli-program>`，安装命令行工具
- `brew cask install <gui-program>`，安装图形界面软件，这得益于[Homebrew-Cask](https://github.com/caskroom/homebrew-cask)扩展

可以根据需要，配置国内源：

- 中科大，https://lug.ustc.edu.cn/wiki/mirrors/help/brew.git
- 清华，https://mirrors.tuna.tsinghua.edu.cn/help/homebrew/

### 国内生存指南

现在在不使用代理的前提下，raw.githubusercontent.com 根本无法访问，这也就无法安装 brew 命令！为此我在 gitee 做了个备份，并把 BREW_REPO 改为清华备份源！

- https://gitee.com/liujiacai/codes/bcxwortudq653nz4710ji99

这样可以把 brew 下载下来，但是会卡住在 homebrew-core 下载，所以这是 Ctrl-C 终止安装，然后进入执行

```
cd /usr/local/Homebrew/Library/Taps
mkdir homebrew
cd homebrew/
git clone git://mirrors.ustc.edu.cn/homebrew-core.git
# 或者使用清华源
https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git
```
这样就把 core 这个模块安装好了，brew 到此能正常工作了。
cask tap 没有相应国内代理，需要从第三方网站直接下载！

## Terminal

Terminal 为 macOS 自动的终端仿真器，针对个人习惯，我一般会做如下配置：

![](/images/mac_terminal_config.jpg)

- 上面的红框，使得「HOME」「END」移动到行首或行尾，参考 https://superuser.com/a/33370
- 下面的红框，使得 「Option」作为 meta key，主要是 Emacs 中使用
