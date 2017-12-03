## VSCode

```
# 安装命令
brew cask install visual-studio-code
```
新时代的文本编辑器，功能和 Atom/Sublime 差不多，但是不会出现卡顿现象，而且官方提供了 [Sublime Text Keymap](https://github.com/Microsoft/vscode-sublime-keybindings) 插件，如果之前熟悉 Sublime，推荐安装。下面是我非常依赖的快捷键：

- Multiple Selection: `Control+Command+G`（在 Linux/Windows 下，是 Alt+F3）
- 选中多行 `Shift+Command+L`
- 多行合并为一行`Command+J`


## 神之编辑器 [Emacs](https://www.emacswiki.org/emacs?interface=en)

```
# 安装命令
brew install --with-cocoa --srgb emacs
brew install sbcl # 顺便把 common lisp 也装上
```
其实 Mac 是有自带 Emacs 的，位置是`/usr/bin/emacs`，只是版本非常旧，通过`brew`安装的位置在`/usr/local/bin/emacs`，可以通过下面的命令删除 Mac 自带的 Emacs：
```
sudo rm /usr/bin/emacs
sudo rm -rf /usr/share/emacs
```
为了能在 git，终端中默认使用 Emacs，需要做以下配置：
```
# ~/.bashrc
export EDITOR="emacsclient -t -a=\"\""
export ALTERNATE_EDITOR=""

# ~/.gitconfig
[core]
    editor = emacsclient -t -a=\\\"\\\"
```
上面的配置会调用 `emacsclient` 去连接 `emacs daemon`服务，如果服务没启，就先启动服务再去连接。


## dotfiles

- https://github.com/jiacai2050/dotfiles