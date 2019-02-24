# Mongodb

## Docker 安装

- https://hub.docker.com/r/library/mongo/tags/
- https://hub.docker.com/r/percona/percona-server-mongodb

```shell
docker run -d -p 27017:27017 percona/percona-server-mongodb:32 --storageEngine=rocksdb

mongo --eval "printjson(db.serverStatus())"
```

## 命令

```
use jiacai
db.createCollection('_Conversation')
conv = db.getCollection('_Conversation')
conv.insertOne({
    name: "tst conv",
    c: "jiacai",
    m: ["tom", "jerry"],
    createdAt: Date(),
    updatedAt: Date()
})
```

- https://docs.mongodb.com/manual/reference/method/db.createCollection/
