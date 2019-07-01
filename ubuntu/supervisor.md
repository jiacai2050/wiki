## 安装

```sh
sudo apt-get install supervisor

service supervisor restart

```

## 配置

### supervisord.conf
```
[unix_http_server]
file=/var/run/supervisor/supervisor.sock   ; (the path to the socket file)


[supervisord]
logfile=/var/log/supervisor/supervisord.log  ; (main log file;default $CWD/supervisord.log)
logfile_maxbytes=50MB       ; (max main logfile bytes b4 rotation;default 50MB)
logfile_backups=10          ; (num of main logfile rotation backups;default 10)
loglevel=info               ; (log level;default info; others: debug,warn,trace)
pidfile=/var/run/supervisord.pid ; (supervisord pidfile;default supervisord.pid)
nodaemon=false              ; (start in foreground if true;default false)
minfds=1024                 ; (min. avail startup file descriptors;default 1024)
minprocs=200                ; (min. avail process descriptors;default 200)
user=admin                 ; (default is current user, required if root)

[rpcinterface:supervisor]
supervisor.rpcinterface_factory = supervisor.rpcinterface:make_main_rpcinterface

[supervisorctl]
serverurl=unix:///var/run/supervisor/supervisor.sock ; use a unix:// URL  for a unix socket

[include]
files = supervisord.d/*.ini
```

### app.ini

```
[program:prom]
command=./prometheus-2.9.2.linux-amd64/prometheus --config.file=prometheus.yml
process_name=%(program_name)s ; process_name expr (default %(program_name)s)
numprocs=1                    ; number of processes copies to start (def 1)
directory=/home/admin/prom
umask=022                     ; umask for process (default None)
priority=999                  ; the relative start priority (default 999)
autostart=true                ; start at supervisord start (default: true)
autorestart=true              ; retstart at unexpected quit (default: true)
startsecs=10                  ; number of secs prog must stay running (def. 1)
startretries=3                ; max # of serial start failures (default 3)
exitcodes=0,2                 ; 'expected' exit codes for process (default 0,2)
stopsignal=TERM               ; signal used to kill process (default TERM)
stopwaitsecs=10               ; max num secs to wait b4 SIGKILL (default 10)
user=admin
stdout_logfile=/home/admin/prom/logs/stdout.log
stdout_logfile_maxbytes=50MB   ; max # logfile bytes b4 rotation (default 50MB)
stdout_logfile_backups=5     ; # of stdout logfile backups (default 10)
stderr_logfile=/home/admin/prom/logs/stderr.log
stderr_logfile_maxbytes=50MB   ; max # logfile bytes b4 rotation (default 50MB)
stderr_logfile_backups=5     ; # of stderr logfile backups (default 10)
environment=A=1,B=2           ; process environment additions (def no adds)
serverurl=AUTO                ; override serverurl computation (childutils)

```
