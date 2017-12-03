### 视频播放器、截取

```
# 安装命令
brew cask install vlc
```
Mac下的自带的播放器QuickTime，功能实在是太弱了，支持的格式既少又难用，快进什么的貌似都没快捷键，只能手动点击进度条，试用了一段时间的[Mplayer](http://mplayerosx.ch/)，发现效果也不好，会有视频卡顿的现象，最终选择了 [VLC](http://www.videolan.org/vlc/download-macosx.html)，一直用的还不错。
此外， 有网友补充道 [mpv](https://mpv.io/) 才是程序员最佳播放器，大家也可以尝试下。

很多时候，我们只需要截取视频中的某一段视频，或者简单的进行格式转换，这时候就需要 ffmpeg 出马了。
```
# 安装命令
brew  install ffmpeg

# 将 mov 格式的视频转为 mp4，ffmpeg 能根据文件后缀名自动识别
ffmpeg  -i foo.mov foo.mp4
# 从第 6 秒开始，截取10s 视频，并且转为 mp4 格式
ffmpeg -t 10 -ss 00:00:06 -i foo.mov smaller.mp4
```

### 音乐频播放器
```
# 安装命令
brew cask install vox
```
官方的 iTunes 实在是不适应，喜欢简洁清爽的朋友可以试试 [VOX](http://coppertino.com/)
