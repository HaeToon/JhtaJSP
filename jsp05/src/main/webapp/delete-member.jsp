<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %><%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-10
  Time: 오후 3:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="delete-member-process.jsp">
        <input type="password" name="userPW">
        <input type="hidden" name="userID" value="<%=session.getAttribute("userID")%>">
        <button>회원탈퇴</button>
    </form>
</body>
</html>
