<%@ page import="com.heo96.jsp03.util.CookieManager" %><%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-09
  Time: 오전 11:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String today = request.getParameter("today");
    System.out.println("today==="+today);
    if(today !=null && today.equals("one")){
//        Cookie cookie = new Cookie("oneDayCookie","off"); //key value
//        cookie.setMaxAge(60*60*24); //second단위 //time
//        cookie.setPath("/");
//        response.addCookie(cookie);  //response
        CookieManager.createCookie(response,"oneDayCookie","off",60*60*24);
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
