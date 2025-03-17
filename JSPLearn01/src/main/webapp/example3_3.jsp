<%@ page import="java.util.LinkedList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="mytags" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <title>My JSP 'index.jsp' starting page</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<%
    LinkedList<Double> list = new LinkedList<Double>();
    for (int i = 0; i < 10; i++) {
        list.add(Math.random());
    }
%>

<mytags:sort list="<%=list%>"/>


</body>
</html>