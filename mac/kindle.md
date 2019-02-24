## Calibre mobi 转化器

Calibre 电子书管理工具，功能非常全面，支持各种电子书格式的转换。
```
# 安装命令
brew cask install calibre

==> Installing Cask calibre
==> Moving App 'calibre.app' to '/Applications/calibre.app'.
==> Linking Binary 'calibre' to '/usr/local/bin/calibre'.
==> Linking Binary 'calibre-complete' to '/usr/local/bin/calibre-complete'.
==> Linking Binary 'calibre-customize' to '/usr/local/bin/calibre-customize'.
==> Linking Binary 'calibre-debug' to '/usr/local/bin/calibre-debug'.
==> Linking Binary 'calibre-parallel' to '/usr/local/bin/calibre-parallel'.
==> Linking Binary 'calibre-server' to '/usr/local/bin/calibre-server'.
==> Linking Binary 'calibre-smtp' to '/usr/local/bin/calibre-smtp'.
==> Linking Binary 'calibredb' to '/usr/local/bin/calibredb'.
==> Linking Binary 'ebook-convert' to '/usr/local/bin/ebook-convert'.
==> Linking Binary 'ebook-device' to '/usr/local/bin/ebook-device'.
==> Linking Binary 'ebook-edit' to '/usr/local/bin/ebook-edit'.
==> Linking Binary 'ebook-meta' to '/usr/local/bin/ebook-meta'.
==> Linking Binary 'ebook-polish' to '/usr/local/bin/ebook-polish'.
==> Linking Binary 'ebook-viewer' to '/usr/local/bin/ebook-viewer'.
==> Linking Binary 'fetch-ebook-metadata' to '/usr/local/bin/fetch-ebook-metadata'.
==> Linking Binary 'lrf2lrs' to '/usr/local/bin/lrf2lrs'.
==> Linking Binary 'lrfviewer' to '/usr/local/bin/lrfviewer'.
==> Linking Binary 'lrs2lrf' to '/usr/local/bin/lrs2lrf'.
==> Linking Binary 'markdown-calibre' to '/usr/local/bin/markdown-calibre'.
==> Linking Binary 'web2disk' to '/usr/local/bin/web2disk'.
```

## k2pdfopt

- http://www.willus.com/k2pdfopt/download/

这个软件可以对一般普通的电子书针对移动设备优化，极大提高阅读体验，谁用谁知道！

## PDF 切割

通过邮件发送 PDF 书籍到 kindle 时，有最大 50M 的限制，所以对于再大的书籍，就需要用数据线进行传输了，但是现在谁还有数据线呀，所以我选择的做法是对 PDF 进行切割！

```
sudo apt-get install pdftk

# 把第5页输出到一个新 PDF 文件中
pdftk ORIG_FILE.pdf cat 5 output NEW_FILE.pdf

# 范围为 1-5 页
pdftk ORIG_FILE.pdf cat 1-5 output NEW_FILE.pdf

pdftk ORIG_FILE.pdf cat 1 5 7 10-12 output NEW_FILE.pdf
```
- https://www.zhihu.com/question/37247669/answer/493037658
