## 神之编辑器 [Emacs](https://www.emacswiki.org/emacs?interface=en)

为了能在 git 中默认使用 Emacs，需要做以下配置：
```
# ~/.bashrc
export EDITOR="emacsclient -t -a=\"\""
export ALTERNATE_EDITOR=""

# ~/.gitconfig
[core]
    editor = emacsclient -t -a=\\\"\\\"
```
上面的配置会调用 `emacsclient` 去连接 `emacs daemon`服务，如果服务没启，就先启动服务再去连接。


Emacs 配置文件推荐用 git 进行版本管理，方便迁移与交流。这是我的 [.emacs.d](https://github.com/jiacai2050/dotfiles/tree/master/.emacs.d)。

## 入门教程

- https://www.gnu.org/software/emacs/tour/
- http://batsov.com/articles/2011/11/19/why-emacs/

## 常用命令

```
emacs --daemon=<session-name>
emacsclient -t -s <session-name>

alias e='emacsclient -t -a ""'
```

## Org-mode 导出PDF文件

Org 导出 pdf 依赖于 LaTeX，Mac 下推荐安装 basictex 这个精简版的，可能需要单独使用 tlmgr 安装额外的 `*.sty` 文件
```
brew cask install basictex
sudo tlmgr update --self
sudo tlmgr install wrapfig
sudo tlmgr install capt-of
# PDF 导出时，需要 cjk 包，然后需要配置org-latex-packages-alist，具体参考 setup-org.el
sudo tlmgr install cjk
```
- https://orgmode.org/worg/org-tutorials/org-latex-export.html 有介绍如何改变导出引擎为 XeTeX
- https://orgmode.org/worg/org-dependencies.html
- https://orgmode.org/manual/LaTeX-header-and-sectioning.html
- https://www.pydanny.com/setting-up-latex-on-mac-os-x.html
- https://github.com/jiacai2050/dotfiles/blob/master/.emacs.d/customizations/setup-org.el

### 扩展阅读
- markdown 支持：https://github.com/yoshuawuyts/vmd
- GUI vs Teriminal
  - https://www.emacswiki.org/emacs/iTerm2
  - [终端使用 Emacs 与 Emacs GUI 的区别？](https://emacs-china.org/t/emacs-emacs-gui/222)
  - https://www.gnu.org/software/emacs/manual/html_node/elisp/Images.html#Images
