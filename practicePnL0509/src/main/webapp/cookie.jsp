<%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-09
  Time: 오후 5:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>cookie쿠키</h1>
<%
    Cookie cookie = new Cookie("Cookie","마이감자");
    cookie.setMaxAge(60);
    response.addCookie(cookie);
%>
</body>
</html>
