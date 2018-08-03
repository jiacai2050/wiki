Mac 上自带的 Safari 比较轻量，虽然比较省电，但扩展性远不如 Chrome、Firefox，所以这两个是必须的。
```
brew cask install firefox
brew cask install google-chrome
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