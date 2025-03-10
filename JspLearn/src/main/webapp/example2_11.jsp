<%@ page contentType="text/html" %>
<%@ page pageEncoding = "utf-8" %>
<HTML><body  bgcolor=cyan >
<% double a=6.12,b=7.08,c=9.22;
%>
<p style="font-family:宋体;font-size:36">
<br>加载triangle.jsp计算三边为<%=a%>,<%=b%>,<%=c%>的三角形面积.
   <jsp:include page="triangle.jsp">
     <jsp:param name="sideA" value="<%=a%>"/>
     <jsp:param name="sideB" value="<%=b%>"/>
     <jsp:param name="sideC" value="<%=c%>"/>
   </jsp:include>
</p></body></HTML>
