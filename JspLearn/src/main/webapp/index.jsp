<%@ page import="java.util.Date" %>
<%@ page import="javax.xml.crypto.Data" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>My JSP 'index.jsp' starting page</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<%--<%!--%>
<%--    int i = 0;--%>
<%--%>--%>
<%--<%--%>
<%--    i++;--%>
<%--%>--%>
<%--<p>--%>
<%--    您是第<%= i %>个访问这个页面的用户--%>
<%--</p>--%>
<%--<p>--%>
<%--    今天的日期是--%>
<%--    <%= new Date()%>--%>
<%--</p>--%>

<%
    int sideA = 10,sideB = 20;
%>
<jsp:include page="number_add.jsp" flush="true">
    <jsp:param name="sideA" value="<%=sideA%>"/>
    <jsp:param name="sideB" value="<%=sideB%>"/>
</jsp:include>
</body>
</html>