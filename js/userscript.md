# userscript

记录一些实用的用户脚本

## 百度网盘选中一行的文件

```js
var main = document.getElementById('layoutMain');
var dds = main.children[0].children[1].children[0].children[3].querySelectorAll('dd.g-clearfix');

// HTMLCollection isn't array, so hack it!
[].slice.call(dds[0].children).forEach((e,i) => console.log(e.children[2].click()));
```
