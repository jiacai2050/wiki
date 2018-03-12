# Jvisualvm

## [连接 remote](https://docs.oracle.com/javase/8/docs/technotes/guides/visualvm/applications_remote.html)

在连接 remote 机器上的 Java 进程时，需要启动 jstatd 服务。

### Jstatd

jstatd是一个rmi的server应用，用于监控jvm的创建和结束，并且提供接口让监控工具（如visualvm）可以远程连接到本机的jvms。注意是jvms，就是说运行jstatd命令后可以用监控工具监控本用户（运行jstatd命令的用户）所有已经启动的java程序。


如果直接运行 jstatd 命令，会报下面的错误：

```sh
[vagrant@vagrant-ubuntu-trusty-64 11:01:40 ~]
$ jstatd
Could not create remote object
access denied ("java.util.PropertyPermission" "java.rmi.server.ignoreSubClasses" "write")
java.security.AccessControlException: access denied ("java.util.PropertyPermission" "java.rmi.server.ignoreSubClasses" "write")
        at java.security.AccessControlContext.checkPermission(AccessControlContext.java:472)
        at java.security.AccessController.checkPermission(AccessController.java:884)
        at java.lang.SecurityManager.checkPermission(SecurityManager.java:549)
        at java.lang.System.setProperty(System.java:792)
        at sun.tools.jstatd.Jstatd.main(Jstatd.java:139)
```

这是由于没有指定 policy，可以用下面的命令启动：

```sh
jstatd -p 1099 -J-Djava.security.policy=<(echo 'grant codebase "file:${java.home}/../lib/tools.jar" {permission java.security.AllPermission;};') -J-Djava.rmi.server.hostname=192.168.33.10
```

值得注意的是需要指定 `java.rmi.server.hostname`，否则看不到 remote 机器上的进程

![jvisualvm](/images/jvisualvm.png)


同理，启动 jmx 也需要指定，参考：

```sh
JAVA_OPTS="$JAVA_OPTS -Dcom.sun.management.jmxremote.port=6789"
JAVA_OPTS="$JAVA_OPTS -Dcom.sun.management.jmxremote.ssl=false"
JAVA_OPTS="$JAVA_OPTS -Dcom.sun.management.jmxremote.authenticate=false"
export JAVA_OPTS="$JAVA_OPTS -Djava.rmi.server.hostname=192.168.33.10"

lein repl
```



## 参考

- http://clojure-goes-fast.com/blog/profiling-tool-jvisualvm/
- https://docs.oracle.com/javase/1.5.0/docs/tooldocs/share/jstatd.html
- http://trinea.iteye.com/blog/1216917
- [cannot start jstatd due to permission error](https://stackoverflow.com/a/14930180/2163429)