# Kafka

- https://kafka.apache.org/quickstart


```
# 描述一个 topic
bin/kafka-topics.sh --zookeeper localhost:2181 --describe  --topic test

# 创建 topic
bin/kafka-topics.sh --zookeeper localhost:2181 --create --replication-factor 1 --partitions 3 --topic test

# 查看所有 topic
bin/kafka-topics.sh --list --zookeeper localhost:2181

# 删除 topic
bin/kafka-topics.sh --zookeeper localhost:2181 --delete --topic test

# 发消息
bin/kafka-console-producer.sh --broker-list localhost:9092 --topic test

# 收消息
bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic test --from-beginning

```

在 0.9.0 之前的版本中，group 的 offset 存在 zk 中，之后的版本放在 broker 中。

```
# 查看所有 groupID
bin/kafka-consumer-groups.sh  -zookeeper localhost:2181 -list        # Old consumers
bin/kafka-consumer-groups.sh  -bootstrap-server localhost:9092 -list # New consumers

# 除了 list 外，还有 --describe --reset-offsets --delete
```
- http://pavelmakhov.com/2017/03/useful-kafka-commands
- https://dzone.com/articles/kafka-architecture-log-compaction

## 配置

server
```
delete.topic.enable=true  # 允许物理删除
log.dirs=/opt/kafka-logs

# The maximum size of the log before deleting it
log.retention.bytes
#  The number of hours to keep a log file before deleting it
log.retention.hours
```

### Topic-Level Configs

- https://kafka.apache.org/documentation/#topicconfigs

```
# 增加一个配置
bin/kafka-configs.sh --zookeeper localhost:2181 --entity-type topics --entity-name test --alter --add-config x=y
# 删除一个配置
bin/kafka-configs.sh --zookeeper localhost:2181 --entity-type topics --entity-name my_topic_name --alter --delete-config x
```
