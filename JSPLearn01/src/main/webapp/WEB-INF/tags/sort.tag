<%@ tag import="java.util.Collection" %>
<%@ tag import="java.util.Collections" %>
<%@tag language="java" pageEncoding="UTF-8" %>
<%@ attribute name="list" required="true" type="java.util.LinkedList" %>

<%
    Collections.sort(list);
    for (Object o : list) {
        out.print(o + " ");
    }
%>