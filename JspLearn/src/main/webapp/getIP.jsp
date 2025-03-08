<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>getIP</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<%
    out.println(request.getRemoteAddr());
%>
</body>
</html>