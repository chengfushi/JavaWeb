<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>JSP生命周期</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
    <%!
        private int initVar = 0;
        private int serviceVar = 0;
        private int destroyVar = 0;
    %>
    <%!
        public void jspInit() {
            initVar++;
            System.out.println("jspInit()方法调用了" + initVar + "次");
        }
        public void jspDestroy() {
            destroyVar++;
            System.out.println("jspDestroy()方法调用了" + destroyVar + "次");
        }
    %>
    <%
        serviceVar++;
        System.out.println("service()方法调用了" + serviceVar + "次");
    %>
    <h1><%=initVar%></h1>
    <h1><%=destroyVar%></h1>
    <h1><%=serviceVar%></h1>
</body>
</html>