# Kestrel

## 安装

- https://github.com/jiacai2050/docker-alpine-kestrel

## 文档

- https://github.com/twitter-archive/kestrel-client
- http://twitter-archive.github.io/kestrel/docs/guide.html

## 客户端

### Ruby

```
sudo apt install -y libsasl2-dev   # ubuntu
sudo gem install kestrel-client

require 'kestrel'
q = Kestrel::Client.new('localhost:22133')
q.set('a_queue', 'foo')
q.get('a_queue') # => 'foo'
q.pook('a_queue') # => 'foo'

```

### Memcached

```
STATS
DUMP_STATS
STATUS
GET <queue-name>[options]

```

### 监控

- http://blog.scoutapp.com/articles/2012/08/15/kestrel-monitoring