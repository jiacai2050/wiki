## Java

```
# 安装命令
brew cask install java
brew install maven
brew cask install intellij-idea-ce  # IDE，不要告诉我你还在用 eclipse
```
通过`brew cask`安装后，可以通过执行`/usr/libexec/java_home`这个命令来获取JAVA_HOME
```
export JAVA_HOME="$(/usr/libexec/java_home)"
```

### Clojure

```
brew install leiningen boot-clj
```

## Python

```
brew cask install pycharm-ce
```

