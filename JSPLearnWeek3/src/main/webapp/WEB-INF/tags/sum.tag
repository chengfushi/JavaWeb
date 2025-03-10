<%@ tag pageEncoding="utf-8" %>

<%--计算100以内的奇数和--%>
<% int sum = 0;
for (int i = 1; i <= 100; i++) {
    if (i % 2 != 0) {
        sum += i;
    }
}
%>
<%=sum%>