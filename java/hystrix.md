# Hystrix

## 创建
```
import com.netflix.hystrix.HystrixCommand;
import com.netflix.hystrix.HystrixCommandGroupKey;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
 public class HelloWorldCommand extends HystrixCommand<String> {
 private static final Logger logger = LoggerFactory.getLogger(HelloWorldCommand.class);
 private final String name;
 public HelloWorldCommand(String name) {
   super(HystrixCommandGroupKey.Factory.asKey("default"));
   this.name = name;
}
   @Override
   protected String run() throws Exception {
     logger.info("HelloWorld Command Invoked");
     return "Hello" + name;
   }
}
```

## 使用
```
HelloWorldCommand helloWorldCommand = new HelloWorldCommand("World");
assertEquals("Hello World", helloWorldCommand.execute());

HelloWorldCommand helloWorldCommand = new HelloWorldCommand("World");
Future<string> future = helloWorldCommand.queue();
assertEquals("Hello World", future.get());
```

## 配置
```
hystrix.command.HelloWorldCommand.metrics.rollingStats.timeInMilliseconds=10000
hystrix.command.HelloWorldCommand.execution.isolation.strategy=THREAD
hystrix.command.HelloWorldCommand.execution.isolation.thread.timeoutInMilliseconds=1000
hystrix.command.HelloWorldCommand.execution.isolation.semaphore.maxConcurrentRequests=10
hystrix.command.HelloWorldCommand.circuitBreaker.errorThresholdPercentage=50
hystrix.command.HelloWorldCommand.circuitBreaker.requestVolumeThreshold=20
hystrix.command.HelloWorldCommand.circuitBreaker.sleepWindowInMilliseconds=5000
hystrix.threadpool.default.coreSize=10
hystrix.threadpool.default.queueSizeRejectionThreshold=5
```


# 参考

- https://dzone.com/articles/gentle-introduction-to-hystrix-hello-world
- https://github.com/Netflix/Hystrix/wiki/Configuration
