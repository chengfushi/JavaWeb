<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>获取用户发送的信息</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<%
    out.print("用户名：" + request.getParameter("username"));
%>
</body>
</html>