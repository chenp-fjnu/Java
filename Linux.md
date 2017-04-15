# Wiki
http://www.cnblogs.com/peida/tag/%E6%AF%8F%E6%97%A5%E4%B8%80linux%E5%91%BD%E4%BB%A4/

# Commands
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
