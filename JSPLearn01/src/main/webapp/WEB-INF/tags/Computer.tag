<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ attribute name="num1" required="true" type="java.lang.String" %>
<%@ attribute name="num2" required="true" type="java.lang.String" %>
<%@ attribute name="num3" required="true" type="java.lang.String" %>
<%@ variable name-given="result" variable-class="java.lang.Double" scope="AT_BEGIN" %>
<%@ variable name-given="flag" variable-class="java.lang.Boolean" scope="AT_BEGIN" %>


<%!
/**
 *@Description : 计算三角形面积
 * @param n1
 * @param n2
 * @param n3
 *@return double
 *@date 2025/3/23 18:14
 *@auther Cheng fu Shi
 */
    public double calculate(int n1, int n2, int n3) {
        double s = (n1 + n2 + n3) /2.0;
        return Math.sqrt(s * (s - n1) * (s - n2) * (s - n3));
    }
/**
 *@Description  : 判断是否为三角形
 * @param n1
 * @param n2
 * @param n3
 *@return boolean
 *@date 2025/3/23 18:15
 *@auther Cheng fu Shi
 */
    public boolean isTriangle(int n1, int n2, int n3) {
        return n1 + n2 > n3 && n2 + n3 > n1 && n1 + n3 > n2;
    }
%>
<%
    int n1 = Integer.parseInt(num1);
    int n2 = Integer.parseInt(num2);
    int n3 = Integer.parseInt(num3);
    double result = calculate(n1,n2,n3);
    boolean flag = isTriangle(n1,n2,n3);

    jspContext.setAttribute("result", result);
    jspContext.setAttribute("flag", flag);
%>