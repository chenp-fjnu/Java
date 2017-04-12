# Java
working on Java

# Spring Freamwork
http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle

http://www.cnblogs.com/davidwang456/p/5645906.html
# SSH
https://www.zhihu.com/question/21142149
# Spring MVC
https://course.tianmaying.com/spring-mvc
# Spring Boot
https://start.spring.io/

http://codecentric.github.io/spring-boot-admin/1.4.6/

SpringBoot配置属性之MVC https://segmentfault.com/a/1190000004315890

https://www.tianmaying.com/tutorial/spring-boot-overview

@SpringBootApplication

@EnableConfigurationProperties

@Configuration

@Component

# Spring Cloud
Spring Cloud基础教程: http://blog.didispace.com/Spring-Cloud%E5%9F%BA%E7%A1%80%E6%95%99%E7%A8%8B/
# Code:

@Component

public class InitialProcessor implements ApplicationListener<ContextRefreshedEvent> {
   
   private static Logger LOG = Logger.getLogger(InstantiationProcessor.class);
    
    @Override
    
    public void onApplicationEvent(ContextRefreshedEvent event) {
      
      ApplicationContext context = new ClassPathXmlApplicationContext("classpath*:conf/application-context.xml");
    
    }

}

