<%@ page import="org.mindrot.jbcrypt.BCrypt" %><%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-20
  Time: 오후 2:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //같은 비밀번호라도 다르게 만들어주는 레인보우역할
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
