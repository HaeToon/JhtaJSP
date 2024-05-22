<%@ page import="org.mindrot.jbcrypt.BCrypt" %><%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-22
  Time: 오전 9:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String salt = BCrypt.gensalt();
    String hashPW = BCrypt.hashpw("1234",salt);

%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>test</h1>
<h1><%=salt%></h1>
<h1><%=hashPW%></h1>
</body>
</html>