### @WebFilter(urlPatterns = "/demo",asyncSupported = true)  
public class DemoFilter implements Filter{...}
### @WebServlet(urlPatterns = "/demo", asyncSupported = true)
public class AsyncDemoServlet extends HttpServlet {...}


# Annotation to remove web.xml 
## @WebServlet

### Before:
```xml
<servlet>
    <display-name>ss</display-name>
    <servlet-name>SimpleServlet</servlet-name>
    <servlet-class>footmark.servlet.SimpleServlet</servlet-class>
    <load-on-startup>-1</load-on-startup>
    <async-supported>true</async-supported>
    <init-param>
        <param-name>username</param-name>
        <param-value>tom</param-value>
    </init-param>
</servlet>
<servlet-mapping>
    <servlet-name>SimpleServlet</servlet-name>
    <url-pattern>/simple</url-pattern>
</servlet-mapping>
```
### After 
<code>
@WebServlet(urlPatterns = {"/simple"}, asyncSupported = true, 
loadOnStartup = -1, name = "SimpleServlet", displayName = "ss", 
initParams = {@WebInitParam(name = "username", value = "tom")} 
) 
public class SimpleServlet extends HttpServlet{ … }
</code>
## @WebInitParam (see above)
## @WebFilter
### Before
```xml
<filter> 
    <filter-name>SimpleFilter</filter-name> 
    <filter-class>xxx</filter-class> 
</filter> 
<filter-mapping> 
    <filter-name>SimpleFilter</filter-name> 
    <servlet-name>SimpleServlet</servlet-name> 
</filter-mapping>
```
### After
@WebFilter(servletNames = {"SimpleServlet"},filterName="SimpleFilter") 

public class LessThanSixFilter implements Filter{...}

## @WebListener
ServletContextListener/ServletContextAttributeListener/ServletRequestListener/ServletRequestAttributeListener/HttpSessionListener/HttpSessionAttributeListener
### Before
```xml
<listener> 
    <listener-class>footmark.servlet.SimpleListener</listener-class> 
</listener>
```
### After
@WebListener("This is only a demo listener") 

public class SimpleListener implements ServletContextListener{...}
## @MultipartConfig
