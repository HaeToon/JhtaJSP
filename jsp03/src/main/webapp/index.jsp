<%@ page import="com.heo96.jsp03.util.CookieManager" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String sessionUserID=(String)session.getAttribute("sessionUserID");
    String loginID = CookieManager.readCookie(request,"loginID");
%>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<br/>
<a href="hello-servlet">Hello Servlet</a>
<%
    String userID = request.getParameter("userID");
    String userPW = request.getParameter("userPW");
    out.println(loginID);
    out.println(userPW);
    if(loginID!=null){
        out.println(loginID);
    }
%>
<%=sessionUserID%>
</body>
</html>