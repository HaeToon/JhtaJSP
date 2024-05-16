<%@ page import="com.heo96.jsp05.connect.JDBCConnectionPool" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.heo96.jsp05.utils.ScriptWritter" %><%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-16
  Time: 오전 9:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String userID = request.getParameter("userID");
    System.out.println(userID);
    JDBCConnectionPool jdbcConnectionPool = new JDBCConnectionPool();
    String sql = "delete from member where userID=?";
    PreparedStatement pstmt =jdbcConnectionPool.conn.prepareStatement(sql);
    pstmt.setString(1,userID);
    int result = pstmt.executeUpdate();
    System.out.println(result);
    if(result>0){
        //history.back을 하면 refresh가 발생해야하는데 safari에서는 안됨. (ios) 크롬도막은듯?
//        ScriptWritter.alertAndNext(response,userID+"님이 삭제되었습니다.","list-member.jsp");
        ScriptWritter.alertAndBack(response,userID+"님이 삭제되었습니다.");
    }
    pstmt.close();
    jdbcConnectionPool.close();
%>
