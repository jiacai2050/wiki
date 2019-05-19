# MacOS

## 安装

```
brew cask install java
brew install maven
brew cask install intellij-idea-ce  # IDE，不要告诉我你还在用 eclipse
```

可以通过执行`/usr/libexec/java_home`这个命令来获取JAVA_HOME

```
export JAVA_HOME="$(/usr/libexec/java_home)"
```

## 多版本管理

```
brew install jenv

cat ~/.bash_profile

JENV_ROOT="$HOME/.jenv"
if [ -d "${JENV_ROOT}" ]; then
  export PATH="${JENV_ROOT}/bin:$PATH"
  eval "$(jenv init -)"
fi
# 激活 export 插件来自动导出 JAVA_HOME 环境变量
jenv enable-plugin export

# 安装 jdk 到 jenv 中去
jenv add /Library/Java/JavaVirtualMachines/jdk-10.0.1.jdk/Contents/Home/
jenv add /Library/Java/JavaVirtualMachines/jdk1.8.0_172.jdk/Contents/Home/

jenv versions
```
- https://javastreets.com/blog/2017/9/using_multiple_java_sdk_versions.html
