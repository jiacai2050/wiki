## namenode 目录结构
```
 dfs.namenode.name.dir 下的目录结构

./current
./current/edits_0000000000000000001-0000000000000000004
./current/edits_0000000000000000005-0000000000000000349
./current/edits_0000000000000000350-0000000000000000387
./current/edits_0000000000000000388-0000000000000000910
./current/edits_0000000000000000911-0000000000000001579
./current/edits_0000000000000001580-0000000000000001581
./current/edits_0000000000000001582-0000000000000001583
./current/edits_0000000000000001584-0000000000000001585
./current/edits_0000000000000001586-0000000000000001587
./current/edits_0000000000000001588-0000000000000001597
./current/edits_0000000000000001598-0000000000000001746
./current/edits_0000000000000001747-0000000000000001748
./current/edits_inprogress_0000000000000001749
./current/fsimage_0000000000000001746
./current/fsimage_0000000000000001746.md5
./current/fsimage_0000000000000001748
./current/fsimage_0000000000000001748.md5
./current/seen_txid
./current/VERSION
./in_use.lock

$ cat current/VERSION
#Sat Apr 02 17:40:43 CST 2016
namespaceID=13319364
clusterID=CID-d9e2c744-0641-4525-a618-3e75b452b9e5
cTime=0
storageType=NAME_NODE
blockpoolID=BP-744456632-127.0.0.1-1459590043064
layoutVersion=-60

```

## datanode 目录结构

```
data/dfs/data/
├── current
│ ├── BP-1079595417-192.168.2.45-1412613236271
│ │ ├── current
│ │ │ ├── VERSION
│ │ │ ├── finalized
│ │ │ │ └── subdir0│ │ │ │ └── subdir1
│ │ │ │ ├── blk_1073741825
│ │ │ │ └── blk_1073741825_1001.meta
│ │ │ │── lazyPersist
│ │ │ └── rbw
│ │ ├── dncp_block_verification.log.curr
│ │ ├── dncp_block_verification.log.prev
│ │ └── tmp
│ └── VERSION
└── in_use.lock
```

- http://docs.hortonworks.com/HDPDocuments/HDP2/HDP-2.4.0/bk_hdfs_admin_tools/content/hdfs_metadata_datanodes.html