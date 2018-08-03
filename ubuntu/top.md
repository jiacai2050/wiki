# top

```
top
```

Once in top...

- P <- Sort by CPU usage

- M <- Sort by MEM usage

- z <- Add cool visual colors

- x <- Highlight column you are currently sorting by

- H <- 显示线程


```
printf '%x\n' 26
```

可以把十进制的 26 转为十六进制的 1a

# ps

```
ps -p <pid> -o sz,rss,vsz
```

- sz, 进程映像所占用的物理页面数量，也就是以物理页面为单位表示的虚拟内存大小
- rss,  resident set size, the non-swapped physical memory that a task has used (in kiloBytes). (alias rssize, rsz).  
- vsz, 进程的虚拟内存大小
```
# sz and vsz represent the same thing, but sz is in page units, while vsz is in 1024 byte units.
# 可以拿到物理页大小
getconf PAGE_SIZE

vsz * 1024 = sz * page_size
rss <= vsz
```
