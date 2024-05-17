<%@ page import="com.heo96.jsp05.connect.JDBCConnectionPool" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="com.heo96.jsp05.utils.ScriptWritter" %><%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-17
  Time: 오후 12:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int no = Integer.parseInt(request.getParameter("no"));
    String userPW = request.getParameter("userPW");

    String sql = "delete from board where no=? and password=?";

    JDBCConnectionPool jdbcConnectionPool = new JDBCConnectionPool();
    jdbcConnectionPool.pstmt = jdbcConnectionPool.conn.prepareStatement(sql);
    jdbcConnectionPool.pstmt.setInt(1,no);
    jdbcConnectionPool.pstmt.setString(2,userPW);
    int result=jdbcConnectionPool.pstmt.executeUpdate();
    if(result>0){
        ScriptWritter.alertAndNext(response,no+"번째 글이 삭제되었습니다.","../board/list.jsp");
    }else {
        ScriptWritter.alertAndBack(response,"비밀번호 입력이 잘못되었습니다.");
    }

%>
