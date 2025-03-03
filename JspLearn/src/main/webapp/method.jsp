<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.util.Tools" %>

<html>
<head>
    <title>Text the method</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<p>
    <%int a = 10; int b = 10; %>
    调用方法计算<%=a%>加<%=b%>的和<%=new Tools().add(a,b)%>
</p>
</body>
</html>