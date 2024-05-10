<%@ page import="com.heo96.practice0510.utils.CookieManager" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
  String isLogin = CookieManager.readCookie(request,"login");
%>
<!DOCTYPE html>
<html>
<head>
  <title>JSP - Hello World</title>
</head>
<body>
  <h1> id : <%=session.getAttribute("userID")%></h1>
  <h1> 이름 : <%=session.getAttribute("userName")%></h1>

  <a href="login.jsp">로그인</a>
  <a href="logout.jsp">로그아웃</a>
  <a href="insert-member.jsp">회원가입</a>
  <a href="info.jsp">마이페이지</a>
</body>
</html>