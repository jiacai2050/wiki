# Mongodb

## 安装

```
https://hub.docker.com/r/library/mongo/tags/
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