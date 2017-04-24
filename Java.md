http://www.infoq.com/cn/java-depth-adventure

### Use StringBuilder whenever possible because it is faster than StringBuffer. But, if thread safety is necessary then use StringBuffer objects.
### 有3个接口对于流类相当重要。其中两个接口是Closeable和Flushable，它们是在java.io包中定义的，并且是由JDK5添加的。第3个接口是AutoColseable，它是由JDK7添加的新接口，被打包到java.lang包中。
### java.lang->object->Throwable->Errors
###							->Exceptions->Runtime Exceptions
###										->Other Exceptions
