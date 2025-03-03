<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>example2_6</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<%
    int x = 10; int y = 20;
%>
<p>
    计算表达式x + y + x % y,即<%=x%> + <%=y%> + <%=x%> % <%=y%> = <%=x + y + x % y%>
    <br>
    计算表达式x > y,即<%=x%> > <%=y%> : <%= x > y%>
    <br>
</p>
</body>
</html>