<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="mytags" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <title>获取用户发送的数据，输出三角形的面积</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<%
    String num1 = request.getParameter("a");
    String num2 = request.getParameter("b");
    String num3 = request.getParameter("c");
%>
<mytags:Computer num1="<%=num1%>" num2="<%=num2%>" num3="<%=num3%>"></mytags:Computer>
<%
    if (result == null){
        out.print("三角形边长传入失败");
    } else if (flag) {
        out.print("三角形边长不合法");
    }
    else{%>
三角形面积：<%=result%>
<%    }%>

</body>
</html>