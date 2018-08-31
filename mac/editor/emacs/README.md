## 神之编辑器 [Emacs](https://www.emacswiki.org/emacs?interface=en)

```
# 安装命令
# org-mode 显示 inline image 时需要 imagemagick@6
# https://emacs.stackexchange.com/questions/30559/org-mode-inline-image-display-size/30560
brew install emacs --with-cocoa --with-dbus --with-librsvg --with-imagemagick@6 --with-mailutils
brew install sbcl # 顺便把 common lisp 也装上
```
其实 Mac 是有自带 Emacs 的，位置是`/usr/bin/emacs`，只是版本非常旧，通过`brew`安装的位置在`/usr/local/bin/emacs`，可以通过下面的命令删除 Mac 自带的 Emacs：
```
sudo rm /usr/bin/emacs
sudo rm -rf /usr/share/emacs
```
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

### 入门教程

- https://www.gnu.org/software/emacs/tour/
- http://batsov.com/articles/2011/11/19/why-emacs/

### 常用命令

```
emacs --daemon=<session-name>
emacsclient -t -s <session-name>

alias e='emacsclient -t -a ""'
```

### 键位映射

为了保证在远端服务器与本地开发的一致行，我希望在终端里面运行 emacs，而非 GUI 版本，但是这样也带来一个严重的问题，终端不支持一些特殊的键位组合，对于 Emacs 来说主要是一些 [escape code](https://en.wikipedia.org/wiki/ANSI_escape_code)，需要手动进行映射，解决方法可以参考 Stackoverflow 上的这个问题[How do I bind C-= in emacs](https://stackoverflow.com/a/40222318/2163429)。

![iTerm2 键位映射](/images/iterm2_key_mapping.png)

还有一点需要注意，Mac 自身有一些快捷键可能与 Emacs 冲突，主要是 Mission Control，我直接取消掉了。

![关闭 Mission Control](/images/mac_mission_control.png)

如果上述方案无法解决你的问题，Google `emacs + input-decode-map` 关键字即可。[Emacs China](https://emacs-china.org/) 也是一个好地方， 由于 Emacs 的使用门槛，决定了其社区的高质量，[我的提问](https://emacs-china.org/t/topic/4829/2)很快就得到了准确的解答。

或许[我的配置文件](https://github.com/jiacai2050/dotfiles/blob/9b001845964d16335e40b57f36499237d566f6db/.emacs.d/customizations/editing.el#L105-L122)也能给你一些启发：
```
(defun my/global-map-and-set-key (key command &optional prefix suffix)
   "`my/map-key' KEY then `global-set-key' KEY with COMMAND.
 PREFIX or SUFFIX can wrap the key when passing to `global-set-key'."
   (my/map-key key)
   (global-set-key (kbd (concat prefix key suffix)) command))

 (defun my/map-key (key)
   "Map KEY from escape sequence \"\e[emacs-KEY\."
   (define-key function-key-map (concat "\e[emacs-" key) (kbd key)))

(global-set-key (kbd "C-c l") 'mc/edit-lines)
;; 需要配合 iTerm2 进行 key mapping
;; https://stackoverflow.com/a/40222318/2163429
(my/global-map-and-set-key "C-=" 'er/expand-region)
(my/global-map-and-set-key "C--" 'er/contract-region)
(my/global-map-and-set-key "C->" 'mc/mark-next-like-this)
(my/global-map-and-set-key "C-<" 'mc/mark-previous-like-this)
(my/global-map-and-set-key "C-c C->" 'mc/mark-all-like-this)
```
这里有一些参考文章：
- [Fixing emacs bindings in iTerm2](http://webframp.com/emacs/2013/02/22/fixing-emacs-bindings-on-the-in-iterm2/)
- [Where do I find a list of terminal key codes to remap shortcuts in bash?](https://unix.stackexchange.com/a/76591/101540)

最后， Emacs 配置文件推荐用 git 进行版本管理，方便迁移与交流。这是我的 [.emacs.d](https://github.com/jiacai2050/dotfiles/tree/master/.emacs.d)。

### Org-mode 导出PDF文件

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
