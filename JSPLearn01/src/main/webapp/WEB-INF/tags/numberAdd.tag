<%@tag pageEncoding="UTF-8" language="java" %>
<%@ attribute name="number1" required="true" %>
<%@ attribute name="number2" required="true" %>
<%@ variable name-given="sum" variable-class="java.lang.Integer" scope="AT_BEGIN" %>

<%
    int n1 = Integer.parseInt(number1);
    int n2 = Integer.parseInt(number2);
    int sum = n1 + n2;
    jspContext.setAttribute("sum",sum);

%>