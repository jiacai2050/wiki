## 设置最大内存以及丢弃策略

```sh
maxmemory <bytes>
maxmemory-policy volatile-lru

# redis-cli 查看当前配置。不设置或者设置为0，64位系统不限制内存，32位系统最多使用3GB内存。
config get maxmemory
config get maxmemory-policy
```

目前 redis 里面有 6 种删除策略：

| 策略 | 含义 |
| --- | --- |
| `volatile-lru` | 根据LRU算法生成的过期时间来删除。|
| allkeys-lru | 根据LRU算法删除任何key。|
| volatile-random | 根据过期设置来随机删除key。|
| allkeys->random | 无差别随机删。|
| volatile-ttl | 根据最近过期时间来删除（辅以TTL）|
| noeviction | 谁也不删，直接在写操作时返回错误。|
