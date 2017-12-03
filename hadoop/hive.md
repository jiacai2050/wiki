## DDL
```shell
-- hive中的分隔符
CREATE TABLE employees (
name STRING,
salary FLOAT,
subordinates ARRAY<STRING>,
deductions MAP<STRING, FLOAT>,
address STRUCT<street:STRING, city:STRING, state:STRING, zip:INT>
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\001' COLLECTION ITEMS TERMINATED BY '\002' MAP KEYS TERMINATED BY '\003'
LINES TERMINATED BY '\n'
STORED AS TEXTFILE;


-- 上传内部表partition数据
LOAD DATA LOCAL INPATH '${env:HOME}/california-employees' INTO TABLE employees
PARTITION (country = 'US', state = 'CA');
-- 上传外部表partition数据
ALTER TABLE log_messages ADD PARTITION(year = 2012, month = 1, day = 2) LOCATION 'hdfs://master_server/data/log_messages/2012/01/02';
-- 更改现有partition位置
ALTER TABLE log_messages PARTITION(year = 2011, month = 12, day = 2) SET LOCATION 's3n://ourbucket/logs/2011/01/02';

ALTER TABLE temp_wx_bill DROP IF EXISTS PARTITION(par=201409);

-- 把string类型的s转为int类型
... cast(s AS INT) ...;

!connect jdbc:hive2://localhost:10000 scott tiger org.apache.hive.jdbc.HiveDriver

-- 给表加注释
ALTER TABLE xigua.t1 SET TBLPROPERTIES ('comment' = '你好呀');

```
## wordcount
```sql
CREATE TABLE docs (line STRING);
LOAD DATA [local] INPATH 'docs' OVERWRITE INTO TABLE docs;
CREATE TABLE word_counts AS
  SELECT word, count(1) AS count FROM
  (SELECT explode(split(line, '\s')) AS word FROM docs) w 
GROUP BY word
ORDER BY word;
```

## 自定义udf
```
create  function unicode2str as 'com.youzan.hive.udf.Unicode2String';
CREATE FUNCTION unicode2str AS 'com.youzan.hive.udf.Unicode2String' USING JAR 'hdfs:///apps/hive/udf/yz-udf-unicode2str.jar';
select unicode2str(message) from dev.order_item_offline
where order_no='E20160711221336096050352';
```

## hive server2 内存参数配置

`hive-env.sh` 里面添加
```
if [ "$SERVICE" = "hiveserver2" ]; then
    export HADOOP_CLIENT_OPTS="$HADOOP_CLIENT_OPTS -server -XX:NewSize=1g -XX:MaxNewSize=1g -Xms5g -Xmx5g -XX:PermSize=1024m -XX:MaxPermSize=1024m -XX:ParallelGCThreads=2 -XX:+UseConcMarkSweepGC -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.port=12345"
fi
```

## debug

```
hive -hiveconf hive.root.logger=DEBUG,console
```


