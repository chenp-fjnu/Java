# HotSpot JVM Architecture
## Class Loader
## Runtime Data Areas
### Program Counter Register
### Java Stack
### Native Method Stack
### Heap
### Method Area

# Heap Generation
## Young
### Eden
### Survivor 1
### Survivor 2
## Tenured
## Perm

# Heap Size
-xms64M: minor size 64M (does not inlcude Perm Gen size)

-xmx512M: max size 512M (does not inlcude Perm Gen size)

-XX:InitialHeapSize=64M

-XX:MaxHeapSize=512M

-XX:NewRatio=2: Older/Young

-XX:NewSize=30M: size of YoungGen

-XX:MaxNewSize=64m: Max size of YoungGen

-XX:SurviorRatio=8: survivor size is 10% of YoungGen size

-XX:PretenureSizeThreshod: age of object which should put into Tenured Gen

-XX:OldSize: Set Tenured size directly

-XX:PermSize=20m

-XX:MaxPermSize

-XX:+HeapDumpOnOutOfMemoryErro: dump memory to file when OOM happens

-XX:+HeapDumpPath: set the dump file folder

-Xnoclassgc: deny the gc for class in PermGen

# GC
### FulGC: All Gen include Perm Gen and Direct Memory
### MajorGC: Happen on Tenured, along with one MinorGC
### MinorGC: Happen on YoungGen, 10 times of MajorGC

## Options
-XX:+DisableExplicitGC: disable System.gc()

-verbose:gc

-XX:+PrintGC

-XX:+PrintGCDetails

-XX:+PrintGCTimeStamps

-XX:+PrintGCDateStamps

-XX:+PrintGCApplicationConcurrentTime

-XX:+PrintGCApplicationStoppedTime

-XX:+PrintHeapAtGC

-Xloggc:<filename>

-XX:+UseSreialGC

-XX:+UseConcMarkSweepGC

-XX:+UseParallelGC

-XX:+UseParNewGC

-XX:+UseParallelOldGC

# GC Algorithm
### Mark-Sweep
### Copying
### Mark-Compact (Mark-Sweep-Compact)
### Generational Collection

## Young Gen (Copying)
### Serial 
### ParNew
### Parallel Scavenge
## Tenured Gen (Mark-Sweep-Compact)
### Serial Old 
### Parallel Old
### CMS (Concurrent Mark-Sweep)
*Serial and Parallel always stop the world*

## CMS
Initial Mark: Stop-the-world

Concurrent Mark

Remark: Stop-the-world

Concurrent Sweep

Reset

# -X and -XX options
Options that begin with -X are non-standard (not guaranteed to be supported on all VM implementations), and are subject to change without notice in subsequent releases of the JDK.

以 -X 开头的是非标准选项（不能保证被所有的 JVM 实现都支持），如果在后续版本的 JDK 中有变更恕不另行通知。

Options that are specified with -XX are not stable and are not recommended for casual use. These options are subject to change without notice.

指定 -XX 的选项是不稳定、不建议随便使用的。这些选项在今后变更恕不另行通知。
