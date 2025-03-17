<%@ page contentType="text/html" %>
<%@ page pageEncoding = "utf-8" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="getPrice" %>
<HTML>
<% String str = "麻辣豆腐:20.6元,红烧肉:68.9元,烤鸭:199元";
%>
<getPrice:handleData mess="<%= str %>"/>  <%-- 使用Tag标记 --%>
<p style="font-family:宋体;font-size:36">
    菜单：<br>"<%= str %>"<br>价格总和：
    <%= price %>         <%-- 使用Tag标记返回的Double对象price --%>
</p>

<% str = "毛巾:2.6元,香皂:6.9元,牙刷:12.3元";
%>
<getPrice:handleData mess="<%= str %>"/>
<p style="font-family:黑体;font-size:36;color:blue">
    购物小票：<br>"<%= str %>"<br>价格总和：
    <%= price %>
</p>
</body></HTML>
