http://www.infoq.com/cn/java-depth-adventure

### Use StringBuilder whenever possible because it is faster than StringBuffer. But, if thread safety is necessary then use StringBuffer objects.
### 有3个接口对于流类相当重要。其中两个接口是Closeable和Flushable，它们是在java.io包中定义的，并且是由JDK5添加的。第3个接口是AutoColseable，它是由JDK7添加的新接口，被打包到java.lang包中。
### java.lang->object->Throwable->Errors
###							->Exceptions->Runtime Exceptions
###										->Other Exceptions
### There are several differences between HashMap and Hashtable in Java:

Hashtable is synchronized, whereas HashMap is not. This makes HashMap better for non-threaded applications, as unsynchronized Objects typically perform better than synchronized ones.

Hashtable does not allow null keys or values.  HashMap allows one null key and any number of null values.

One of HashMap's subclasses is LinkedHashMap, so in the event that you'd want predictable iteration order (which is insertion order by default), you could easily swap out the HashMap for a LinkedHashMap. This wouldn't be as easy if you were using Hashtable.

Since synchronization is not an issue for you, I'd recommend HashMap. If synchronization becomes an issue, you may also look at ConcurrentHashMap.

### implements java.io.Serializable
