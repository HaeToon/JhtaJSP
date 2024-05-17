<%@ page import="com.heo96.jsp05.connect.JDBCConnect" %>
<%@ page import="com.heo96.jsp05.connect.JDBCConnectionPool" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="com.heo96.jsp05.utils.ScriptWritter" %><%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-16
  Time: 오후 3:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
   String subject = request.getParameter("writeSubject");
   String content = request.getParameter("writeContent");
   int no = Integer.parseInt(request.getParameter("modifyContentNo"));
   String password = request.getParameter("modifyContentPassword");
    JDBCConnectionPool jdbcConnectionPool = new JDBCConnectionPool();
    String sql = "update board set subject=?,content =? where no=? and password=?";
    jdbcConnectionPool.pstmt=jdbcConnectionPool.conn.prepareStatement(sql);
    jdbcConnectionPool.pstmt.setString(1,subject);
    jdbcConnectionPool.pstmt.setString(2,content);
    jdbcConnectionPool.pstmt.setInt(3,no);
    jdbcConnectionPool.pstmt.setString(4,password);
    int result = jdbcConnectionPool.pstmt.executeUpdate();
    if(result>0){
        ScriptWritter.alertAndNext(response,no+"번 글이 수정되었습니다","list.jsp");
    }else {
        ScriptWritter.alertAndBack(response,"수정에 실패했습니다.");
    }
    jdbcConnectionPool.close();
%>
