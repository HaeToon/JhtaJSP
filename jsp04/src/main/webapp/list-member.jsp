<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-10
  Time: 오전 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Class.forName("oracle.jdbc.OracleDriver"); //oracle 드라이버 로딩하는것.
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "heoth", "1234"); //connection 리턴 DB 연결하는것.

    String sql = "select * from member order by no";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    ResultSet rs = pstmt.executeQuery(); // executeQuery는 ResultSet 을 리턴한다.
    /*if(rs.next()){
        System.out.println(rs.getInt("NO"));
        System.out.println(rs.getString("userID"));
        System.out.println(rs.getString("userPW"));
        System.out.println(rs.getString("userName"));
        System.out.println(rs.getString("userBirth"));
    }*/
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table border="1" width="800px">
    <thead>
        <tr>
            <th>no</th>
            <th>userID</th>
            <th>userPW</th>
            <th>userName</th>
            <th>userBirth</th>
        </tr>
    </thead>
    <tbody>
    <%
        while(rs.next()){
            out.println("<tr>");
            out.println("<td>"+rs.getInt("no")+"</td>");
            out.println("<td>"+rs.getString("userID")+"</td>");
            out.println("<td>"+rs.getString("userPW")+"</td>");
            out.println("<td>"+rs.getString("userName")+"</td>");
            out.println("<td>"+rs.getString("userBirth")+"</td>");
            out.println("</tr>");
        }
    %>
    </tbody>
</table>
</body>
</html>
