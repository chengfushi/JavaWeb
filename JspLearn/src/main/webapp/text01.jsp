<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>My JSP 'index.jsp' starting page</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<h1>九九乘法表</h1>
<%
    for (int i = 1; i <= 9; i++){
        for (int j = 1; j <= i; j++){
            out.print(j + " * " + i + " = " + i * j + " ");
        }
        out.print("<br>");
    }
%>
</body>
</html>