<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.heo96.jsp04.utils.CookieManager" %><%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-10
  Time: 오후 3:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String userID = request.getParameter("userID");
    String userPW = request.getParameter("userPW");

    Class.forName("oracle.jdbc.OracleDriver");
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","heoth","1234");
    String sql = "delete from member where userID=? and userPW =? ";

    PreparedStatement pstmt =conn.prepareStatement(sql);

    pstmt.setString(1,userID);
    pstmt.setString(2,userPW);

    int result = pstmt.executeUpdate();  //행에 영향을 미친 개수 0이면 안지워진것.
    if(result>0){
        session.invalidate();
        CookieManager.deleteCookie(response,"loggedID");
        out.println("<script>alert("+result+");location.href=\"index.jsp\";</script>");
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
