## 截屏

```
brew cask install snip
```
Mac上的截图工具已经很好了，`Cmd + Shift + 3/4`就够用了，但是如果想在图片上写些文字，马赛克某部分，就不行了，推荐用 Snip，才 2M 大小，虽说是腾讯开发的，但是不流氓。可以设置快捷键，我设定的是`Cmd + Shift + 6`。
更重要的一点是，[Snip](http://snip.qq.com/) 可以解决Retina下截屏2x问题（就是截出来的图超大），就光这个特点就足以让你使用snip。
<center>
<img width="500px" src="http://img01.taobaocdn.com/imgextra/i1/581166664/TB2UXoxbFXXXXXnXXXXXXXXXXXX_!!581166664.png" alt="我的snip配置"/>
</center>
Mac自带的 Preview 可以对图片进行旋转、调整大小、添加文字，不需要在额外安装软件。
<center>
<img src="http://img01.taobaocdn.com/imgextra/i1/581166664/TB2KtMobFXXXXXkXpXXXXXXXXXX_!!581166664.png" alt="Preview工具栏"/>
</center>

## 马赛克 

[圈点](https://www.yinxiang.com/skitch/)洋名 Skitch，出自 Evernote，可以方便打马赛克，加标注。
```
brew cask install skitch
```


## 图片合并

Mac 版的 PS [ImageMagick](https://www.imagemagick.org)，[常用命令](http://apple.stackexchange.com/a/52882/103966)：

```
brew install ImageMagick

# 下面两条命令都会把 left.png right.png 合并到 merged.png 里面
convert +append left.png right.png merged.png

montage -geometry 100% left.jpg right.jpg merged.jpg
```


## 录屏 gif
```
# 安装命令
brew cask install licecap
```
很多时候我们需要把自己的操作展示给别人看，比较好的做法是通过录屏软件将自己的操作保存成 gif 格式的图片。
[开源免费](https://github.com/lepht/licecap)的[licecap](http://www.cockos.com/licecap/) 很好的解决了这个问题。

![使用 licecap 制作的例子](http://ww3.sinaimg.cn/mw690/5fee18eegw1f17799uiz1g20ci0cijs2.gif)

## 流程图制作工具

对于程序员来说，流程图应该是再亲切不过的了，一张图胜过千言万语。之前我都是用 Keynote 来画，但是实在是不好用，<del>后来在[知乎](https://www.zhihu.com/question/19588698)上发现了在线版的[ProcessOn](https://www.processon.com/)，大大减少了我画流程图的时间，上手也比较快。</del>现在 ProcessOn 有了限制，只能保留 9 张流程图。我又找到了新的工具，[draw.io](https://www.draw.io)，时序图、状态图统统不在话下。

国外很多项目的图是用纯文本画的，比较好用的在线工具是：[asciiflow](http://asciiflow.com/)。

其次，[Graphviz](http://www.webgraphviz.com/) 提供了编程接口，也推荐使用，他也有[网页版](http://www.webgraphviz.com/).
```
brew install Graphviz
```