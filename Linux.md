# Wiki
http://www.cnblogs.com/peida/tag/%E6%AF%8F%E6%97%A5%E4%B8%80linux%E5%91%BD%E4%BB%A4/

#!/bin/bash: the header of shell script

# Commands
chmod 

chown

>: output override

>>: output append

|: pipeline

whereis *command*: get the absoluate path of command

ps

top: try press "1"

kill

nice -n #priority command: modify the priority for new proccess

renice pid: modify the priority for exist process

&: run as backgroud, only work for one terminal

Ctrl+Z: stop the command and put it to background.

Ctrl+C: stop the command and exit it.

jobs: get all background commands.

fg %work#: move the work job to frontground.

bg %work#: move the work job to background.

etc/orc.local: this file will list out/maintain all commands you want to start when machine is up. 

nohup command &, run as background, work after terminal exit.

vmstat: system status, memory/cpu/swap etc.

dmesg: system core info, | grep CPU

free: check memory info,  [-b|-m|-g] means unit of size.

cat /proc/cpuinfo: check cpu info

uptime/uname

file /bin/ls: check 32bit or 64bit

lsb_release -a: release version of linux

lsof: list out the files using by process or the processes using  one file, or the files using for one user.

# Schedule jobs

## at (one time schedule job)

chkconfig -- list |grep atd:

service atd status/start:

/etc/at.allow|at.deny: list out the users who able to run at command, only has deny by default. root is ok always.

at [option] time: 
>at command

atq: list all at schedule jobs

atrm: remove one at schedule job

## crontab

chkconfig --list |grep cron

service crond restart

/etc/cron.allow|cron.deny: permission who can/can't run crontab command.

/etc/crontab: list system schedule jobs

* "* * * * * user-name command":
* /etc/cron.monthly|weekly|daily|hourly/: system scheduled jobs
* anacron: /var/spool/anacron/cron.daily|weekly|monthly
crontab [option]: 

* -e: edit
* -l: list out
* -r: clear all jobs
   
"* * * * * command": minofhour hourofday dayofmonth monthofyear dayofweek(0-6, 0 or 7 means Sunday)

"n1,n2,n3": only happen on n1,n2,n3

"n1-n2": happen from n1-n2

"*/n": happen every n

