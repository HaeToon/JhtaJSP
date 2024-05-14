<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.heo96.jsp05.connect.JDBCConnect" %>
<%@ page import="com.heo96.jsp05.connect.JDBCConnectionPool" %><%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-10
  Time: 오후 2:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file ="../include/header.jsp"%>
<%
   String userID = (String)session.getAttribute("userID");
//    JDBCConnect jdbcConnect = new JDBCConnect();
    JDBCConnectionPool jdbcConnectionPool = new JDBCConnectionPool();
    String sql = "select * from member where userID=? ";
    PreparedStatement pstmt =jdbcConnectionPool.conn.prepareStatement(sql);
    pstmt.setString(1,userID);
   ResultSet rs = pstmt.executeQuery();
   String userName ="";
   String birth ="";
   String userEmail ="";
   String adress ="";
   String postCode ="";
   String detail ="";
   int no=0;
    if(rs.next()){
        no=rs.getInt("no");
        userName=rs.getString("username");
        birth=rs.getString("userbirth");
        userEmail=rs.getString("email");
        postCode=rs.getString("postcode");
        adress=rs.getString("adress");
        detail=rs.getString("detailAdress");
    }
%>
<div class="container">
<table class="table table-striped">
    <tbody>
    <tr>
        <th scope="row">no</th>
        <td><%=no%></td>
<%--        <td>${NO}</td>--%>
    </tr>
    <tr>
        <th scope="row">ID</th>
        <td><%=userID%></td>
<%--        <td>${userID}</td>--%>
    </tr>
    <tr>
        <th scope="row">Name</th>
        <td><%=userName%></td>
<%--        <td>${userName}</td>--%>
    </tr>
    <tr>
        <th scope="row">Birth</th>
        <td><%=birth%></td>
<%--        <td>${birth}</td>--%>
    </tr>
    <tr>
        <th scope="row">Email</th>
        <td><%=userEmail%></td>
        <%--        <td>${userEmail}</td>--%>
    </tr>
    <tr>
        <th scope="row">PostCode</th>
        <td><%=postCode%></td>
        <%--        <td>${postCode}</td>--%>
    </tr>
    <tr>
        <th scope="row">Adress</th>
        <td><%=adress%></td>
        <%--        <td>${adress}</td>--%>
    </tr>
    <tr>
        <th scope="row">Detail Adress</th>
        <td><%=detail%></td>
        <%--        <td>${detail-adress}</td>--%>
    </tr>
    </tbody>
</table>
</div>
    <div class="user-info"><a href="delete-member.jsp" class="btn btn-danger">회원탈퇴</a></div>
<%@include file="../include/footer.jsp"%>
