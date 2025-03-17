# 第一章JSP概述
## 1.1什么是JSP
JSP(Java Server Pages)是一种动态网页开发技术，它是由Sun Microsystems公司倡导、许多公司参与一起建立的一种使软件开发者可以响应客户
端请求，而动态生成HTML、XML或其他格式文档的技术标准。
## 1.2JSP引擎与Tomcat服务器
JSP引擎是一个Servlet，它是一个Java程序，用于解析JSP文件，编译JSP文件，生成Servlet文件，最后由Tomcat服务器执行Servlet文件。
## 1.3JSP页面与Web服务目录
JSP页面是一个包含有JSP标签的HTML文件，它的扩展名为.jsp。JSP页面通常存放在Web服务的根目录下的某个子目录中。
## 1.4JSP运行原理
当服务器上的一个JSP页面被第一次请求执行时，服务器上的 JSP引擎首先将JSP页面文件转译成一个java文件，并编译这个
java文件生成字节码文件，然后执行字节码文件响应客户的请求。
1. 把JSP页面中的HTML标记符号(页面的静态部分)交给客户的浏览器负责显示。
2. 负责处理JSP标记，并将有关的处理结果发送到客户的浏览器。
3. 执行“<%”和“%>”之间的java程序片(JSP页面中的动态部分，并把执行结果交给客户的浏览器显示。
4. 当多个客户请求一个JSP页面时，Tomcat服务器为每个客户启 动一个线程，该线程负责执行常驻内存的字节码文件来响应相应客户的请求。

---
# 第二章 JSP语法
## 2.1JSP页面基本结构
**JSP页面可由5种元素组合而成:**
1. 普通的HTML标记符;
2. JSP标记，如指令标记、动作标记;
3. 变量和方法的声明:
4. Java程序片:
5. Java表达式

**JSP页面的运行原理**
* 把JSP页面中普通的HTML标记符号，交给客户的浏览器执行显示。
* JSP标记、数据和方法声明、Java程序片由Tomcat服务器负责执行
* 将需要显示的结果发送给客户的浏览器。
* Java表达式由Tomcat服务器负责计算，将结果转化为字符串，交给客户的浏览器负责显示。

## 2.2变量和方法的声明
### 1. 变量声明
- **语法**：使用 `<%! %>` 标签声明成员变量（实例变量）。
- **作用域**：这些变量属于转换后的Servlet类的成员变量，生命周期与Servlet实例一致，多个请求共享（可能导致线程安全问题）。
- **示例**：
  ```jsp
  <%!
      private int count = 0; // 成员变量
      private static final String DEFAULT_NAME = "Guest"; // 静态常量
  %>
  ```

### 2. 方法声明
- **语法**：同样使用 `<%! %>` 标签声明成员方法。
- **作用域**：方法属于Servlet类的成员，可被同一JSP中的其他代码调用。但无法直接使用JSP内置对象（如 `request`、`response`）。
- **示例**：
  ```jsp
  <%!
      public String greet(String name) {
          return "Hello, " + name;
      }

      // 同步方法处理线程安全
      public synchronized void incrementCounter() {
          count++;
      }
  %>
  ```

### 3. 局部变量
- **语法**：在 `<% %>` 标签内声明的变量是局部变量。
- **作用域**：仅在当前请求的 `service` 方法中有效，每个请求独立，线程安全。
- **示例**：
  ```jsp
  <%
      int localVar = 10; // 局部变量
      String message = "This is a local variable.";
  %>
  ```

### 4. 注意事项
- **线程安全**：成员变量在多线程环境下可能引发竞态条件，需通过同步机制（如 `synchronized`）保护。
- **内置对象限制**：在 `<%! %>` 中声明的方法无法直接使用 `request`、`response` 等内置对象，需通过参数传递。
- **代码规范**：应避免在JSP中编写过多业务逻辑，保持关注点分离，推荐使用MVC模式。

### 5. 示例整合
```jsp
<%!
    private int visitCount = 0;

    public synchronized void incrementVisitCount() {
        visitCount++;
    }
%>

<%
    incrementVisitCount(); // 调用方法
%>

<html>
<body>
    <h1>Welcome!</h1>
    <p>Total visits: <%= visitCount %></p>
</body>
</html>
```

### 总结
- **`<%! %>`**：声明成员变量和方法，需谨慎处理线程安全。
- **`<% %>`**：用于局部变量和逻辑代码，线程安全。
- **`<%= %>`**：输出表达式结果，不可包含语句。

## 2.3Java程序片
在<%和%>之间插入Java程序片:程序片中声明的变量称为JSP页面的局部变量，多个用户请求一个JSP页面时，Java程序片将被执行多次，分别在不同的线程中执行。

## 2.4Java表达式
在<%=和%>之间插入Java表达式:Java表达式的值将被转化为字符串，并插入到JSP页面的输出流中。

## 2.5JSP中的注释
1. HTML注释: <!--注释内容-->
2. JSP注释: <%--注释内容--%>
3. Java注释: //注释内容
4. Java多行注释: /*注释内容*/
5. JSP页面的注释: <!--HTML注释内容--><%--JSP注释内容--%>

## 2.6JSP指令标记

### **1. 指令标记基础**
- **语法**：`<%@ 指令名 属性="值" %>`
- **位置**：通常放在JSP文件顶部（但可出现在任意位置，在页面被请求前生效）
- **作用范围**：影响整个JSP页面

---

### **2. 主要指令类型**

#### **(1) `page` 指令**
控制与页面相关的全局属性。

| 常用属性          | 说明                                                                 |
|-------------------|---------------------------------------------------------------------|
| `import`          | 导入Java类（唯一可多次使用的属性）                                   |
| `contentType`     | 设置响应MIME类型和字符编码（默认`text/html;charset=ISO-8859-1`）    |
| `errorPage`       | 指定错误处理页面路径                                                |
| `isErrorPage`     | 声明当前页面是否为错误处理页（`true/false`）                        |
| `session`         | 控制是否启用HTTP会话（默认`true`）                                  |
| `buffer`          | 设置输出缓冲区大小（如`buffer="16kb"`）                             |

**示例**：
```jsp
<%@ page import="java.util.Date, java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page errorPage="/error.jsp" %>
```

---

#### **(2) `include` 指令**
| **特性**            | **`include` 指令标记 (`<%@ include file="..." %>`)** | **`include` 动作标记 (`<jsp:include page="..." />`)** |
|---------------------|-----------------------------------------------------|-----------------------------------------------------|
| **语法**            | `<%@ include file="filePath" %>`                   | `<jsp:include page="filePath" />`                  |
| **执行时机**        | 在 **编译时** 执行                                  | 在 **运行时** 执行                                 |
| **内容处理**        | 包含的文件内容直接插入到当前 JSP 页面，一起编译     | 包含的文件单独编译执行，结果插入到当前页面         |
| **性能**            | 运行时性能较好（编译时处理）                        | 运行时性能开销较大（运行时处理）                   |
| **适用场景**        | 适合包含 **静态内容**，且内容不经常变化             | 适合包含 **动态内容**，且内容可能经常变化          |
| **灵活性**          | 不够灵活，只能包含静态内容                          | 更灵活，可以包含动态内容，并支持传递参数           |
| **示例**            | `<%@ include file="header.jsp" %>`                 | `<jsp:include page="header.jsp" />`                |


---

#### **(3) `taglib` 指令**
引入JSP标签库（如JSTL或自定义标签）。

| 属性      | 说明                     |
|-----------|-------------------------|
| `uri`     | 标签库的唯一标识符       |
| `prefix`  | 标签前缀（命名空间）     |

**示例**：
```jsp
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 使用JSTL核心标签 -->
<c:forEach items="${list}" var="item"> ... </c:forEach>
```

---

### **3. 注意事项**
1. **属性顺序无关**：属性书写顺序不影响功能。
2. **重复指令处理**：
  - `page` 指令的`import`属性可多次使用（其他属性重复时覆盖）。
  - 其他指令的重复属性可能导致编译错误。
3. **路径问题**：
  - `include` 指令的路径是服务器端路径（相对于当前JSP文件）。
4. **编码一致性**：
  - `page` 指令的`contentType`字符集需与页面实际编码一致（如UTF-8）。

---

### **4. 综合示例**
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.Date" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>订单详情</title>
</head>
<body>
    <h1>订单时间：<fmt:formatDate value="<%= new Date() %>" pattern="yyyy-MM-dd"/></h1>
    <%@ include file="footer.jsp" %>
</body>
</html>
```

---

### **5. 最佳实践**
- **减少`<%! %>`声明**：避免在JSP中声明成员变量（线程安全问题）。
- **优先使用JSTL/EL**：替代Java脚本，增强可读性（如用`<c:if>`替代`<% if(...) %>`）。
- **错误处理规范**：
  ```jsp
  <%@ page errorPage="/error.jsp" %>
  <!-- error.jsp中需设置 -->
  <%@ page isErrorPage="true" %>
  ```

---

### **总结**
| 指令名     | 核心用途                              | 关键场景                     |
|------------|-------------------------------------|----------------------------|
| `page`     | 控制页面属性（编码、导入类、会话等） | 全局配置、错误处理           |
| `include`  | 静态嵌入公共代码片段                 | 重用页头、页脚、导航栏       |
| `taglib`   | 扩展JSP功能（如JSTL）               | 循环、格式化、数据库操作     |

合理使用指令标记能提升JSP的可维护性和可读性，但需遵循MVC原则，将业务逻辑移至Servlet或Service层。

---

# 第三章 Tag文件与Tag标记
## 3.1 Tag文件
### 3.1.1 Tag文件的结构
Tag文件通常以`.tag`或`.tagx`为扩展名，包含JSP代码、HTML/XML内容以及标签声明。其结构包括：  
• **Tag声明**：使用`<%@ tag %>`指令定义标签属性。  
• **JSP代码**：包含脚本、表达式等逻辑。  
• **HTML/XML内容**：定义标签的输出内容。

### 3.1.2 Tag文件的保存
Tag文件通常保存在`/WEB-INF/tags`目录下，以便JSP页面通过`tagdir`属性引用。

---

## 3.2 Tag标记
### 3.2.1 Tag标记与Tag文件
Tag标记是JSP页面中调用Tag文件的语法，通过前缀和标签名引用Tag文件。

### 3.2.2 Tag标记的使用
在JSP页面中，使用`<%@ taglib %>`指令引入标签库，并通过`<prefix:tagname>`语法调用Tag文件。

### 3.2.3 Tag标记的运行原理
当JSP页面解析到Tag标记时，会查找对应的Tag文件，执行其中的逻辑，并将结果嵌入页面。

---

## 3.3 Tag文件中的常用指令
### 3.3.1 tag指令
用于定义Tag文件的基本属性，如`language`和`pageEncoding`。  
示例：
```jsp
<%@ tag language="java" pageEncoding="UTF-8" %>
```

### 3.3.2 include指令
用于在Tag文件中包含其他JSP或Tag文件。  
示例：
```jsp
<%@ include file="header.jsp" %>
```

### 3.3.3 attribute指令
用于定义Tag文件的属性，支持`required`、`type`等参数。  
示例：
```jsp
<%@ attribute name="username" required="true" type="java.lang.String" %>
```

### 3.3.4 variable指令
用于在Tag文件中定义变量，供JSP页面使用。  
示例：
```jsp
<%@ variable name-given="result" scope="AT_END" %>
```

### 3.3.5 taglib指令
用于在Tag文件中引入其他标签库。  
示例：
```jsp
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
```

---

## 总结
Tag文件和Tag标记是JSP中实现自定义标签的核心机制。通过Tag文件封装逻辑，通过Tag标记调用功能，可以显著提高代码的重用性和可维护性。常用指令如`tag`、`attribute`、`variable`等，进一步增强了Tag文件的灵活性和功能性。

---