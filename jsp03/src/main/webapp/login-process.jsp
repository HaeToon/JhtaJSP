<%@ page import="com.heo96.jsp03.util.CookieManager" %><%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-09
  Time: 오후 3:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String userID = request.getParameter("userID");
    String userPW = request.getParameter("userPW");
    String saveID = request.getParameter("saveID");
    String loginID = request.getParameter("loginID");
    // 쿠키설정을 해서 saveID에다가 userID값 설정
    if(userID.equals("heo96")&&userPW.equals("1234")){
        session.setAttribute("sessionUserID",userID);
        CookieManager.createCookie(response,"loginID",userID,60*60*24);
        //로그인성공시
        if(saveID!=null && saveID.equals("yes")){
            //saveID체크되었을때
            //cookie 설정
            CookieManager.createCookie(response,"memoID",userID,60*60*24);
            response.sendRedirect("index.jsp");
        }else {
            //saveID체크안되었을때
            CookieManager.deleteCookie(response,"memoID");
            response.sendRedirect("index.jsp");
        }
    } else {
        response.sendRedirect("login.jsp");
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
