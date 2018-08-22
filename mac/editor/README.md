折腾过无数编辑器，最终停留在了 Emacs，偶尔也会用 TextMate 编辑汉字，Emacs 下汉字有些卡。

## TextMate
```
brew cask install textmate
```


## Sublime/Atom/VSCode

```
# 安装命令
brew cask install sublime-text
brew cask install atom
brew cask install visual-studio-code
```
再早之前，依次用过 sublime -> atom -> vscode，最后还是回到了 sublime 的怀抱，我个人不是很喜欢用 JS 写的 vscode/atom，相比之下我更相信 [C++ 写的 sublime](https://news.ycombinator.com/item?id=2822114)，比较编辑器这东西对性能要求还是挺高的，尤其是知道了 sublime 是一个 [Google 员工辞职开发的产品](https://www.quora.com/What-is-the-story-behind-Sublime-Text)，这才是情怀好嘛！


由于 sublime 出现的最早，所以 atom 与 vscode 都提供了与之类似的快捷键：

- [VSCode Sublime Text Keymap](https://github.com/Microsoft/vscode-sublime-keybindings)

下面是我非常依赖的快捷键：

- Multiple Selection: `Control+Command+G`（在 Linux/Windows 下，是 Alt+F3）
- 选中多行 `Shift+Command+L`
- 多行合并为一行`Command+J`

## sublime 插件安装

首先是 [Package Manager](https://packagecontrol.io/installation)，推荐直接用 sublime text 3。ctrl+` 打开控制台，输入
```
import urllib.request,os,hashlib; h = '6f4c264a24d933ce70df5dedcf1dcaee' + 'ebe013ee18cced0ef93d5f746d80ef60'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); by = urllib.request.urlopen( 'http://packagecontrol.io/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); print('Error validating download (got %s instead of %s), please try manual install' % (dh, h)) if dh != h else open(os.path.join( ipp, pf), 'wb' ).write(by)
```
之后的插件通过 PM 安装就可以了（`Shift+Command+P`）。我用到的有：

- [Markdown Preview](https://github.com/revolunet/sublimetext-markdown-preview) 有 github favor 的语法支持
- [Pretty JSON](https://github.com/dzhibas/SublimePrettyJson)
- [Enhanced Clojure](https://github.com/Foxboron/SublimeClojure)


我用到的插件比较少，毕竟我用的比较“轻”，只是进行一些临时性的编辑工作，主要的开发还是放在 Emacs 上。
