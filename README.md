# JavaWeb


# MyJAVALearn - JSP 技术专项学习库

![JSP](https://img.shields.io/badge/JSP-2.3-orange)
![Servlet](https://img.shields.io/badge/Servlet-4.0-blue)
![Tomcat](https://img.shields.io/badge/Tomcat-9.0-red)

> 本仓库专注于JSP（JavaServer Pages）技术的学习与实践，涵盖从基础语法到企业级开发的完整案例。

## 🎯 学习重点

### JSP 核心技术栈
| 技术点          | 案例模块                          |
|-----------------|---------------------------------|
| **JSP 基础语法** | `指令标签` `<%@ page %>`         |
| **内置对象**     | `request`, `session`, `application` |
| **JavaBean**    | 用户登录数据封装                  |
| **EL 表达式**    | `${user.name}` 简化页面逻辑      |
| **JSTL 标签库**  | `<c:forEach>`, `<sql:query>`     |
| **MVC 模式**     | JSP + Servlet + JDBC 分层架构    |

## 项目结构（JSP 专项版）

```bash
myJAVALearn/
├── WebContent/                 # JSP 核心目录
│   ├── WEB-INF/
│   │   ├── web.xml            # 部署描述符
│   │   └── lib/               # 依赖库（如jstl.jar）
│   ├── index.jsp              # 首页
│   ├── user/                  # 用户模块
│   │   ├── login.jsp          # 登录页面
│   │   └── profile.jsp        # 个人资料页
├── src/                       # Java 源代码
│   └── com/example/servlet/   # Servlet 类
│       ├── LoginServlet.java  # 登录控制器
│       └── DBUtil.java        # 数据库工具类
└── docs/
    └── jsp-cheatsheet.md      # JSP 语法速查表
```

## 🚀 快速运行

### 环境要求
- JDK 8+
- Apache Tomcat 9.x
- MySQL 5.7+ (可选)

### 部署步骤
1. 将项目导入Eclipse/IntelliJ的Dynamic Web Project
2. 添加Tomcat服务器配置
3. 部署到Tomcat的`webapps`目录
4. 访问：`http://localhost:8080/myJAVALearn`

## 📚 学习路径

### 阶段一：基础语法
```jsp
<%-- 示例：JSP声明 + 脚本段 --%>
<%!
    public String greet() {
        return "Hello JSP!";
    }
%>
<%= greet() %>  <!-- 输出：Hello JSP! -->
```
- 模块：`/WebContent/basic-syntax/`

### 阶段二：表单处理
```jsp
<!-- 登录表单提交到Servlet -->
<form action="LoginServlet" method="post">
    <input type="text" name="username">
    <input type="password" name="password">
    <button>登录</button>
</form>
```
- 关联代码：`LoginServlet.java`

### 阶段三：数据库整合
```jsp
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" 
                   url="jdbc:mysql://localhost:3306/jsp_demo"
                   user="root" password="123456"/>
<sql:query dataSource="${db}" var="result">
    SELECT * FROM users;
</sql:query>
```

## 💡 最佳实践
1. **避免在JSP中写Java代码**  
   使用Servlet处理业务逻辑，JSP仅负责显示
   
2. **统一字符编码**  
   在`web.xml`中配置：
   ```xml
   <filter>
       <filter-name>EncodingFilter</filter-name>
       <filter-class>com.example.filter.EncodingFilter</filter-class>
       <init-param>
           <param-name>encoding</param-name>
           <param-value>UTF-8</param-value>
       </init-param>
   </filter>
   ```

3. **安全防护**  
   - 使用`PreparedStatement`防止SQL注入
   - 对用户输入进行XSS过滤

## 🛠️ 常见问题
### Q: JSP页面无法访问？
- 检查文件是否放在`WebContent`目录下
- 确认Tomcat的`context path`配置正确

### Q: 中文乱码？
- JSP头部添加：`<%@ page contentType="text/html;charset=UTF-8" %>`
- 数据库连接字符串添加：`?useUnicode=true&characterEncoding=UTF-8`

