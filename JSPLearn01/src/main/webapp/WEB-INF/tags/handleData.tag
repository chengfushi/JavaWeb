<%@ attribute name="mess" required="true" type="java.lang.String" %>
<%@ tag import="java.util.regex.Pattern" %>
<%@ tag import="java.util.regex.Matcher" %>
<%@ variable name-given="price" variable-class="java.lang.Double"
    scope="AT_BEGIN" %>
<%!
public Double getPriceSum(String input){  // 定义方法
    Pattern pattern;          //模式对象
    Matcher matcher;          //匹配对象
    String regex="-?[0-9][0-9]*[.]?[0-9]*" ;//匹配数字,整数或浮点数的正则表达式
    pattern = Pattern.compile(regex);       //初试化模式对象
    matcher = pattern.matcher(input);       //初始化匹配对象,用于检索input
    double sum = 0;
    while(matcher.find()) {
       String str = matcher.group();
       sum += Double.parseDouble(str);
    }
    return new Double(sum);
}
%>
<% //将返回的Double对象放在jspContext中:
   jspContext.setAttribute("price",getPriceSum(mess));
%>