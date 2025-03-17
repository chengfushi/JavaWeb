<%@ tag import="java.util.HashSet" %>
<%@ tag import="java.util.regex.Pattern" %>
<%@ tag import="java.util.regex.Matcher" %>
<%@ attribute name="okString" required="true" type="java.lang.String" %>
<%@ variable name-given="words" variable-class="java.util.HashSet " 
    scope="AT_BEGIN" %>
<%
    HashSet<String>   set = new HashSet<String>(); //集合不允许有相同的元素
    Pattern pattern;          //模式对象
    Matcher matcher;          //匹配对象
    String regex="[a-zA-Z]+" ;//匹配英文单词
    pattern = Pattern.compile(regex);       //初试化模式对象
    matcher = pattern.matcher(okString);       //初始化匹配对象,用于检索mess
    while(matcher.find()) {
       String str = matcher.group(); 
       set.add(str);
    } 
   //将返回的arrayList对象放在jspContext中:
   jspContext.setAttribute("words",set);
%>