<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.heo96.jsp05.utils.CookieManager" %>
<%@ page import="com.heo96.jsp05.connect.JDBCConnect" %>
<%@ page import="com.heo96.jsp05.utils.ScriptWritter" %>
<%@ page import="com.heo96.jsp05.connect.JDBCConnectionPool" %><%--
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

//    JDBCConnect jdbcConnect = new JDBCConnect();
    JDBCConnectionPool jdbcConnectionPool = new JDBCConnectionPool();
    String sql = "delete from member where userID=? and userPW =? ";

    PreparedStatement pstmt =jdbcConnectionPool.conn.prepareStatement(sql);

    pstmt.setString(1,userID);
    pstmt.setString(2,userPW);

    int result = pstmt.executeUpdate();  //행에 영향을 미친 개수 0이면 안지워진것.
    if(result>0){
        session.invalidate();
        CookieManager.deleteCookie(response,"loggedID");
        ScriptWritter.alertAndNext(response,"회원탈퇴 되었습니다.","../index/index.jsp");
    }
%>
