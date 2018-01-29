# Hbase

standalone 方式启动的 hbase 自带 zk，如果想与其他服务共用 zk，那么需要配置伪分布式。主要有以下配置：

- hbase-site.xml
```
<configuration>
   <property>
    <name>hbase.rootdir</name>
    <value>file:///opt/hbase</value>
  </property>
    <property>
    <name>hbase.cluster.distributed</name>
    <value>true</value>
  </property>
<property>
    <name>hbase.zookeeper.quorum</name>
    <value>localhost</value>
  </property>
</configuration>
```
- hbase-env.sh
```
export HBASE_MANAGES_ZK=false
```

之后再 bin/start-hbase.sh 启动就可以了。


## CDH 国内代理

- http://cloudera.proxy.ustclug.org/cdh5/cdh/5/