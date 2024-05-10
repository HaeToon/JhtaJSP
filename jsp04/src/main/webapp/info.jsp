<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-10
  Time: 오후 2:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
   String userID = (String)session.getAttribute("userID");
    Class.forName("oracle.jdbc.OracleDriver");
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","heoth","1234");
    String sql = "select * from member where userID=? ";
    PreparedStatement pstmt =conn.prepareStatement(sql);
    pstmt.setString(1,userID);
   ResultSet rs = pstmt.executeQuery();
   String userName ="";
   String birth ="";
   int no=0;
    if(rs.next()){
        no=rs.getInt("no");
        userName=rs.getString("username");
        birth=rs.getString("userbirth");
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h2>No : <%=no%></h2>
    <h2>ID : <%=userID%></h2>
    <h2>이름 : <%=userName%></h2>
    <h2>생일 : <%=birth%></h2>
    <div><a href="delete-member.jsp">회원탈퇴</a></div>
</body>
</html>
