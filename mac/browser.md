Mac 上自带的 Safari 比较轻量，虽然比较省电，但扩展性远不如 Chrome、Firefox，所以这两个是必须的。
```
brew cask install firefox
brew cask install google-chrome
# 现在的 Edge 完全兼容 Chrome，并且不用翻墙
brew cask install microsoft-edge
```

Chrome 默认会安装一个 Update 程序，在 `~/Library/Google/GoogleSoftwareUpdate`，可以执行[下面命令删除](https://superuser.com/a/1077420)：
```
cd /Users/liujiacai/Library/Google/GoogleSoftwareUpdate/GoogleSoftwareUpdate.bundle/Contents/Resources/GoogleSoftwareUpdateAgent.app/Contents/Resources

./ksinstall --nuke
```

对于程序员，如果上面两个浏览器不够用，可以安装相应的开发版：
```
brew cask install chromium
brew cask install google-chrome-canary    # 金丝雀版
brew cask install firefoxdeveloperedition

```

## 必备插件

- [Violentmonkey](https://violentmonkey.github.io/) 里面的脚本通过 OneNote 同步
  - [Chrome Web Store](https://chrome.google.com/webstore/detail/violentmonkey/jinjaccalgkegednnccohejagnlnfdag?hl=en-US)
  - [Firefox AMO](https://addons.mozilla.org/firefox/addon/violentmonkey/)
- [Dark Reader](https://github.com/darkreader/darkreader)
  - [Chrome Web Store](https://chrome.google.com/webstore/detail/dark-reader/eimadpbcbfnmbkopoojfekhnkhdbieeh)
  - [Firefox AMO](https://addons.mozilla.org/en-US/firefox/addon/darkreader/)
- [SwitchyOmega](https://github.com/FelisCatus/SwitchyOmega)
  - [Chrome Web Store](https://chrome.google.com/webstore/detail/padekgcemlokbadohgkifijomclgjgif)
  - [Firefox AMO](https://addons.mozilla.org/en-US/firefox/addon/switchyomega/)
- [Clearly](https://chrome.google.com/webstore/detail/clearly/odfonlkabodgbolnmmkdijkaeggofoop?hl=en)
- [仿生学阅读 BionicReading](https://chrome.google.com/webstore/detail/bionicreading/kdfkejelgkdjgfoolngegkhkiecmlflj/related?hl=de)
- [JSON Formatter](https://chrome.google.com/webstore/detail/json-formatter/bcjindcccaagfpapjjmafapmmgkkhgoa?hl=en)
- [uBlock Origin](https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm?hl=en)


## userscript

### 百度网盘选中一行的文件

```js
var main = document.getElementById('layoutMain');
var dds = main.children[0].children[1].children[0].children[3].querySelectorAll('dd.g-clearfix');

// HTMLCollection isn't array, so hack it!
[].slice.call(dds[0].children).forEach((e,i) => console.log(e.children[2].click()));
```
