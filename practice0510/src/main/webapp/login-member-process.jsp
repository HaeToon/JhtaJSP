<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.heo96.practice0510.utils.CookieManager" %><%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-10
  Time: 오후 5:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String userId = request.getParameter("userID");
    String userPw = request.getParameter("userPW");
    String saveId = request.getParameter("saveID");

    Class.forName("oracle.jdbc.OracleDriver");
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","heoth","1234");

    String sql = "select * from member where userID =? and userPW =?";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    pstmt.setString(1,userId);
    pstmt.setString(2,userPw);
    ResultSet rs = pstmt.executeQuery();
    if(rs.next()){
        CookieManager.createCookie(response,"login",userId,60*60);
        if(saveId!=null && saveId.equals("saved")){
            CookieManager.createCookie(response,"savedID",userId,60*60);
        }else {
            CookieManager.deleteCookie(response,"savedID");
        }
        String userID = rs.getString("userID");
        String userName = rs.getString("userName");

        session.setAttribute("userID",userID);
        session.setAttribute("userName",userName);
        response.sendRedirect("index.jsp");
    }else {
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
