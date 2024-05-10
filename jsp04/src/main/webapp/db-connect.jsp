<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %><%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-10
  Time: 오전 9:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //동적 로딩  클래스를 동적으로 로딩하는것
    Class.forName("oracle.jdbc.OracleDriver");
    //ORACLE 드라이버 로딩해서 연결하는것
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","heoth","1234");
//    conn.setAutoCommit(false); default = true
    System.out.println("db 연결");
    String sql = "insert into member values('heoth02','1234','허태희')";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    //select = executeQuery() 나머지 executeUpdate()
    int result = pstmt.executeUpdate();
    System.out.println(result);
    
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>db연결</h1>
</body>
</html>
