<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>输入三角形三遍长</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<%--输入三角形三边长，传递到get.jsp--%>
<form action="get.jsp" method="post">
    请输入三角形的三边长：
    第一个边长
    <input type="text" name = "a">
    第二个边长
    <input type="text" name = "b">
    第三个边长
    <input type="text" name = "c">
    <input type="submit" value="提交">
</form>
</body>
</html>