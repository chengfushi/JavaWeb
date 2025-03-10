<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    public int add(int a,int b){
        return a + b;
    }
%>

<%
    String paramA = request.getParameter("sideA");
    String paramB = request.getParameter("sideB");
    int a = (paramA != null) ? Integer.parseInt(paramA) : 0;
    int b = (paramB != null) ? Integer.parseInt(paramB) : 0;
%>

<p>
    接受的值是<%=a%>,<%=b%>
    <br>
    它们的和是<%=add(a,b)%>
</p>

