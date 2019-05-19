## GC log

```
-verbose:gc
-Xloggc:/logs/gc-%t.log
-XX:+PrintGCDetails
-XX:+PrintGCDateStamps
-XX:+PrintGCCause
-XX:+UseGCLogFileRotation
-XX:NumberOfGCLogFiles=10
-XX:GCLogFileSize=20M
-XX:+PrintFlagsFinal
-XX:+PrintTenuringDistribution
-XX:+PrintPromotionFailure
```

## JVM内存调整参数

![JVM内存调整参数](/images/java/jvm_gc_algorithms.png)

- https://github.com/jiacai2050/ideas/issues/40
