<%@ page import="com.heo96.practice0510.utils.CookieManager" %><%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-10
  Time: 오후 5:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    CookieManager.deleteCookie(response,"login");
    session.invalidate();
    out.println("<script>alert(\"로그아웃 되었습니다.\");location.href=\"index.jsp\"</script>");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
