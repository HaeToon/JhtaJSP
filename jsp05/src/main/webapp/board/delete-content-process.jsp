<%@ page import="com.heo96.jsp05.connect.JDBCConnectionPool" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="com.heo96.jsp05.utils.ScriptWritter" %><%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-17
  Time: 오전 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int no = Integer.parseInt(request.getParameter("no"));
    JDBCConnectionPool jdbcConnectionPool = new JDBCConnectionPool();
    String sql = "delete from board where no = ?";
    jdbcConnectionPool.pstmt = jdbcConnectionPool.conn.prepareStatement(sql);
    jdbcConnectionPool.pstmt.setInt(1,no);
    int result = jdbcConnectionPool.pstmt.executeUpdate();
    if(result>0){
        ScriptWritter.alertAndNext(response,no+"번글이 삭제되었습니다.","list.jsp");
    }else {
        ScriptWritter.alertAndBack(response,"알 수 없는 에러가 발생했습니다 다시 시도 바랍니다.");
    }
    jdbcConnectionPool.close();
%>